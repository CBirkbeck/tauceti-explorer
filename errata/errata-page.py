#!/usr/bin/env python3
"""Build the errata explorer page of the tauceti-explorer site (errata/index.html).

Inputs (all read-only):
  * the board's register in TauCetiProject/TauCetiRoadmapJobs at origin/main of a local checkout:
    errata/source-issues.json, errata/REGISTER.md and the legacy explorer register
    errata/explorer/source-issues.json.gz (read with `git show`, never the contents API, which
    truncates files over 1 MB), plus the per-package manifests packages/*/sources.toml for source
    titles, authors and identifiers;
  * the explorer checkout's own extraction records (research/blueprint/queue.json and the
    papers/, packets/ and errata/ files the legacy entries name) for the legacy entries' sources,
    jobs and dates.

Every entry is normalized (source, locator, kind, description, roadmap, provenance), reports of the
same mistake are merged, and the page is written into WORKDIR/out/errata/ and, unless --no-install,
copied into the explorer checkout's errata/ directory together with its README.

Usage:  python3 -I errata-page.py WORKDIR [--board DIR] [--explorer DIR] [--no-fetch] [--no-install]

Idempotent: the same inputs give the same files except for the generation time.
"""
from __future__ import annotations

import argparse
import collections
import datetime as dt
import gzip
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time
import tomllib
import unicodedata
from pathlib import Path

HOME = Path.home()
DEFAULT_BOARD = HOME / ".local" / "state" / "tauceti" / "projects" / "TauCetiRoadmap" / "workers" / "fable-rev214" / "board"
DEFAULT_EXPLORER = HOME / "tauceti-worker-cc-690a50" / "tauceti-explorer"
DEFAULT_ROADMAPS = HOME / ".local" / "state" / "tauceti" / "projects" / "TauCetiRoadmap" / "open-roadmaps"
BOARD_REPO = "TauCetiProject/TauCetiRoadmapJobs"
SPLIT_BYTES = 25 * 1000 * 1000
KINDS = ["Error", "Gap", "Misprint"]
AFFECTS = ["", "nothing", "the proof", "a stated result"]
MACHINE = re.compile(r"(?:file://)?/(?:home|tmp)/[^\s)\]'\"`,;<>]*")
MACHINE_CHECK = re.compile(r"/(?:home|tmp)/")


# ----------------------------------------------------------------------------------------- git

def ensure_token() -> None:
    if os.environ.get("GH_TOKEN"):
        return
    r = subprocess.run(["gh", "auth", "token", "--user", "CBirkbeck"], capture_output=True, text=True)
    if r.returncode == 0 and r.stdout.strip():
        os.environ["GH_TOKEN"] = r.stdout.strip()


def git(repo: Path, *args: str, check: bool = True, network: bool = False) -> bytes:
    tries = 5 if network else 1
    for attempt in range(tries):
        r = subprocess.run(["git", "-C", str(repo), *args], capture_output=True)
        if r.returncode == 0:
            return r.stdout
        err = r.stderr.decode("utf-8", "replace")
        if network and "rate limit" in err.lower() and attempt < tries - 1:
            print("rate limited; waiting two minutes", file=sys.stderr)
            time.sleep(120)
            continue
        if check:
            raise SystemExit(f"git {' '.join(args)}: {err.strip()}")
        return b""
    return b""


def git_show_many(repo: Path, ref: str, paths: list[str]) -> dict[str, bytes]:
    """The blobs at `ref` of many paths through one `git cat-file --batch`."""
    got = git_cat_many(repo, [f"{ref}:{p}" for p in paths])
    return {p: got[f"{ref}:{p}"] for p in paths if f"{ref}:{p}" in got}


def git_cat_many(repo: Path, specs: list[str]) -> dict[str, bytes]:
    """The blobs of many `<ref>:<path>` specs through one `git cat-file --batch` (absent ones left out)."""
    if not specs:
        return {}
    r = subprocess.run(["git", "-C", str(repo), "cat-file", "--batch"], input="".join(f"{p}\n" for p in specs).encode(),
                       capture_output=True, check=True)
    out, pos, blobs = r.stdout, 0, {}
    for p in specs:
        nl = out.index(b"\n", pos)
        header = out[pos:nl].split()
        pos = nl + 1
        if len(header) == 3 and header[1] == b"blob":
            size = int(header[2])
            blobs[p] = out[pos:pos + size]
            pos += size + 1
    return blobs


# ---------------------------------------------------------------------------------------- text

def clean(s) -> str:
    s = re.sub(r"<!--.*?-->", "", str(s or ""), flags=re.S)
    s = MACHINE.sub("[local file]", s)
    return re.sub(r"\s+", " ", s).strip()


def fold(s: str) -> str:
    s = unicodedata.normalize("NFKD", s or "")
    s = "".join(c for c in s if not unicodedata.combining(c)).lower().replace("ß", "ss")
    return re.sub(r"[^a-z0-9]+", " ", s).strip()


def natural_key(s: str):
    return [(0, int(t), "") if t.isdigit() else (1, 0, t) for t in re.split(r"(\d+)", fold(s)) if t]


def locator_order(loc: str):
    """Order within a source: by the number of the cited statement or section, then by the text."""
    key, _ = locator_info(loc)
    m = re.search(r"(\d+(?:\.\d+)*)", key) or re.search(r"(\d+(?:\.\d+)*)", loc or "")
    num = tuple(int(x) for x in m.group(1).split(".")[:6]) if m else (10 ** 9,)
    return (num, natural_key(loc))


KIND_WORDS = [
    ("Error", ("error", "mistake", "false", "wrong", "incorrect", "counterexample")),
    ("Gap", ("gap", "omission", "incomplete", "missing", "unjustified", "lacuna")),
    ("Misprint", ("misprint", "typo", "typographical", "slip", "notation", "erratum")),
]


def norm_kind(k: str) -> str:
    k = (k or "").strip().lower()
    for kind, words in KIND_WORDS:
        if k == kind.lower() or any(k.startswith(w) for w in words):
            return kind
    return ""


# ---------------------------------------------------------------------------------- identifiers

AX_NEW = re.compile(r"(?i)(?:arxiv[\s:./]*(?:org/)?(?:abs/|pdf/)?\s*)(\d{4}\.\d{4,5})(?:v\d+)?")
AX_OLD = re.compile(r"(?i)\b((?:math|math-ph|hep-th|hep-ph|alg-geom|q-alg|dg-ga|funct-an|nlin|cs|quant-ph|gr-qc|"
                    r"cond-mat|physics|solv-int|chao-dyn)(?:\.[A-Z]{2})?/\d{7})(?:v\d+)?")
AX_BARE = re.compile(r"(?<![\d./])(\d{2})(0[1-9]|1[0-2])\.(\d{4,5})(?:v\d+)?(?!\d)")
DOI_RE = re.compile(r"(?i)\b(10\.\d{4,9}/[^\s,;\"'<>\]\)]+)")


def find_arxiv(s: str) -> str:
    s = s or ""
    m = AX_NEW.search(s) or AX_OLD.search(s)
    if m:
        return m.group(1).lower() if "/" in m.group(1) else m.group(1)
    if "arxiv" in s.lower():
        m = AX_BARE.search(s)
        if m:
            return f"{m.group(1)}{m.group(2)}.{m.group(3)}"
    return ""


def find_doi(s: str) -> str:
    m = DOI_RE.search(s or "")
    if not m:
        return ""
    d = m.group(1).rstrip(".")
    changed = True
    while changed:
        changed = False
        for suf in (".pdf", "/full", "/fulltext", "/abstract", "/meta", "/epdf", "/pdf", "/html"):
            if d.lower().endswith(suf):
                d, changed = d[: -len(suf)], True
    return d.lower()


def first_surname(authors: str) -> str:
    a = re.sub(r"\(.*?\)|\[.*?\]", "", authors or "").strip()
    first = re.split(r",|;| and | & | et al|[–—]", a)[0].strip()
    if " " not in first and "-" in first:
        first = first.split("-")[0]
    toks = [t for t in fold(first).split() if len(t) > 1]
    return toks[-1] if toks else ""


CONNECT = {"and", "van", "de", "der", "von", "la", "le", "du", "di", "da", "del", "den", "et", "al", "dos", "y"}
NOT_NAMES = set("""theory number numbers algebraic algebra algebras geometry geometric forms form modular introduction
lectures lecture notes note groups group analysis functions function fields field varieties variety spaces space
course book books seminar volume chapter part edition elements foundations methods topics complex real arithmetic
rings ring modules module categories category cohomology homotopy topology equations operators representations
representation curves curve surfaces surface motives sheaves schemes stacks mathematics mathematical advanced
elementary basic principles handbook survey problems applications approach computational project draft preprint
manuscript version pdf author authors published journal annals inventiones""".split())


def looks_like_person(p: str) -> bool:
    toks = p.replace("–", " ").split()
    if not toks or len(toks) > 6 or re.search(r"\d", p):
        return False
    for t in toks:
        tl = t.strip(".,").lower()
        if tl in CONNECT:
            continue
        if tl in NOT_NAMES:
            return False
        if not (t[0].isupper() or re.fullmatch(r"[A-Z]\.(-?[A-Z]\.)*", t)):
            return False
    return True


def parse_citation(s: str) -> tuple[str, str]:
    """(authors, title) of a free-text citation, '' when it cannot be told."""
    s = re.sub(r"\s+", " ", s or "").strip()
    m = re.search(r"[\"“”«]([^\"“”»]{8,}?)[\"”»]|\*([^*]{8,}?)\*", s)
    if m:
        return s[: m.start()].strip(" ,:;"), (m.group(1) or m.group(2)).strip(" ,.")
    parts = [p.strip() for p in re.split(r",\s+", s) if p.strip()]
    if len(parts) >= 2 and looks_like_person(re.sub(r"\(.*?\)", "", parts[0]).strip() or "x"):
        i = 1
        while i < len(parts) - 1 and looks_like_person(parts[i]):
            i += 1
        title = re.sub(r"\(.*?\)$", "", parts[i]).strip(" .")
        if len(title.split()) >= 2 and not re.match(r"(?i)(arxiv|doi|v\d|published|preprint|lecture|notes?\b)", title):
            return ", ".join(parts[:i]), title
    return "", ""


GLOBAL_KEYS = [
    (re.compile(r"(?i)^(?:the\s+)?stacks(?:[\s_-]*project)?\b[\s,:;-]*(.*)$"), "stacks", "The Stacks Project"),
    (re.compile(r"(?i)^sga[\s_-]*(4[\s_.-]*(?:half|½|1/2|\.5)|[1-7])\b[\s,:;-]*(.*)$"), "sga", "SGA"),
    (re.compile(r"(?i)^ega[\s_-]*(iv|iii|ii|i|[1-4])\b[\s,:;-]*(.*)$"), "ega", "EGA"),
]


def global_key(s: str):
    """(fingerprint, label, locator prefix) of a standard reference cited by its usual name."""
    for rx, kind, label in GLOBAL_KEYS:
        m = rx.match(s.strip())
        if not m:
            continue
        if kind == "stacks":
            rest = m.group(1).strip()
            if rest and not re.match(r"(?i)(tag|section|lemma|proposition|theorem|definition|remark|example|"
                                     r"\d|chapter|\[)", rest):
                return None
            return "glob:stacks", label, rest
        part = m.group(1).lower().replace(" ", "")
        part = "4½" if part.startswith("4") and len(part) > 1 else part.upper() if kind == "ega" else part
        rest = m.group(2).strip()
        if rest and len(rest.split()) > 6:
            return None
        return f"glob:{kind}{fold(part)}", f"{label} {part}", rest
    return None


def family(roadmap: str) -> str:
    return re.sub(r"(Part(?:II|III|IV|V|VI|VII|VIII|IX|X|\d+))+$", "", roadmap or "")


# ------------------------------------------------------------------------------------ locators

LABEL_RX = re.compile(
    r"(?i)\b(theorems?|thm|th|th[ée]or[èe]me|satz|propositions?|prop|lemmas?|lemmata|lem|lemme|corollar(?:y|ies)|cor|"
    r"corollaire|claims?|definitions?|d[ée]finition|defn|def|constructions?|conjectures?|hypothes[ie]s|assumptions?|"
    r"conditions?|equations?|eqn?|formulas?|formulae|displays?|steps?|propert(?:y|ies)|axioms?|algorithms?|"
    r"remarks?|rem|remarque|examples?|exemple|ex|exercises?|warnings?|notations?|conventions?|footnotes?|fn|"
    r"figures?|fig|tables?|introduction|abstract|tags?|sections?|sect|sec|chapters?|ch|appendix|app|"
    r"paragraph|page|pp?)\b\.?\s*((?:[A-Z]{1,2}\.)?\d+(?:[.\-–]\d+)*[a-z]?|[IVX]+(?:\.\d+)*|[0-9A-Z]{4}\b)?")
CANON = {
    "thm": "theorem", "th": "theorem", "théorème": "theorem", "theoreme": "theorem", "satz": "theorem",
    "prop": "proposition", "lem": "lemma", "lemme": "lemma", "lemmata": "lemma", "cor": "corollary",
    "corollaire": "corollary", "corollaries": "corollary", "defn": "definition", "def": "definition",
    "définition": "definition", "eq": "equation", "eqn": "equation", "formulae": "formula", "rem": "remark",
    "remarque": "remark", "ex": "example", "exemple": "example", "fn": "footnote", "fig": "figure",
    "sect": "section", "sec": "section", "ch": "chapter", "app": "appendix", "p": "page", "pp": "page",
    "properties": "property", "hypotheses": "hypothesis", "hypothesis": "hypothesis",
}
STATEMENT = {"theorem", "proposition", "lemma", "corollary", "claim"}
MINOR = {"remark", "example", "exercise", "warning", "notation", "convention", "footnote", "figure", "table",
         "introduction", "abstract"}


def canon_label(w: str) -> str:
    w = w.lower().rstrip(".")
    w = CANON.get(w, w)
    if w.endswith("s") and w[:-1] in STATEMENT | MINOR | {"definition", "construction", "conjecture", "equation",
                                                           "formula", "display", "step", "assumption", "condition",
                                                           "axiom", "algorithm", "tag", "section", "chapter"}:
        w = w[:-1]
    if w in ("lemmas",):
        w = "lemma"
    return w


def locator_info(loc: str) -> tuple[str, int]:
    """(dedup key, class) of a locator: class 2 for a theorem/proposition/lemma/corollary/claim,
    0 for a remark/example/exercise/footnote and the like, 1 otherwise."""
    loc = loc or ""
    first_class = None
    key = ""
    for m in LABEL_RX.finditer(loc):
        w = canon_label(m.group(1))
        num = m.group(2)
        if first_class is None and w not in ("page", "section", "chapter", "paragraph", "appendix", "tag"):
            first_class = 2 if w in STATEMENT else 0 if w in MINOR else 1
        if not key and num and w != "page":
            key = f"{w} {num.replace('–', '-').lower()}"
    if not key:
        m = re.search(r"§+\s*(\d+(?:\.\d+)*)", loc)
        if m:
            key = f"section {m.group(1)}"
        else:
            m = re.search(r"\((\d+(?:\.\d+)+[a-z]?)\)", loc)
            key = f"equation {m.group(1)}" if m else " ".join(fold(loc).split()[:6])
    return key, 1 if first_class is None else first_class


# ------------------------------------------------------------------------------------ loading

def load_inputs(board: Path, work: Path, fetch: bool) -> dict:
    if fetch:
        ensure_token()
        git(board, "fetch", "-q", "origin", "main", network=True)
    ref = "origin/main"
    rev = git(board, "rev-parse", ref).decode().strip()
    when = git(board, "log", "-1", "--format=%cI", ref).decode().strip()
    src = work / "src"
    src.mkdir(parents=True, exist_ok=True)
    raw = {}
    for name, path in (("board", "errata/source-issues.json"), ("register", "errata/REGISTER.md"),
                       ("legacy", "errata/explorer/source-issues.json.gz")):
        data = git(board, "show", f"{ref}:{path}")
        (src / Path(path).name).write_bytes(data)
        raw[name] = data
    legacy_bytes = gzip.decompress(raw["legacy"])
    (src / "legacy-source-issues.json").write_bytes(legacy_bytes)
    manifests: dict[str, dict[str, dict]] = {}
    names = git(board, "ls-tree", "-r", "--name-only", ref, "packages/").decode().split("\n")
    plans = sorted(n for n in names if re.fullmatch(r"packages/[^/]+/design/plan\.json", n))
    tomls = sorted(n for n in names if re.fullmatch(r"packages/[^/]+/sources\.toml", n))
    blobs = git_show_many(board, ref, plans + tomls)
    for path in plans:       # the package design's source list (id, title, authors, edition, url)
        try:
            d = json.loads(blobs.get(path, b"") or b"{}")
        except ValueError:
            continue
        roadmap = d.get("roadmapId") or path.split("/")[1]
        for rec in d.get("sources", []) or []:
            if isinstance(rec, dict) and rec.get("id"):
                manifests.setdefault(roadmap, {})[str(rec["id"]).strip()] = {"kind": "record", **rec}
    for path in tomls:       # the sources manifest, more precise where both exist
        try:
            d = tomllib.loads((blobs.get(path) or b"").decode("utf-8"))
        except (tomllib.TOMLDecodeError, UnicodeDecodeError) as exc:
            print(f"skipping {path}: {exc}", file=sys.stderr)
            continue
        roadmap = d.get("roadmap") or path.split("/")[1]
        for rec in d.get("source", []):
            if rec.get("id"):
                manifests.setdefault(roadmap, {})[str(rec["id"]).strip()] = {"kind": "manifest", **rec}
    return {"rev": rev, "when": when, "board": json.loads(raw["board"]), "register": raw["register"].decode("utf-8"),
            "legacy": json.loads(legacy_bytes), "manifests": manifests}


def check_register(board: dict, register: str) -> str:
    bullets = sum(1 for line in register.splitlines() if line.startswith("- **"))
    n = len(board["issues"])
    m = re.search(r"^(\d+) mistakes recorded on the board", register, re.M)
    stated = int(m.group(1)) if m else None
    note = f"REGISTER.md lists {bullets} bullets (states {stated}); source-issues.json has {n} entries"
    if bullets != n or (stated is not None and stated != n):
        print("warning: " + note, file=sys.stderr)
    return note


def meta_from_manifest(s: dict) -> dict:
    if s.get("kind") == "record":
        return meta_from_record(s)
    arxiv = find_arxiv("arXiv:" + str(s.get("arxiv", ""))) if s.get("arxiv") else ""
    for u in (s.get("url"), s.get("published_url"), s.get("fetched_from")):
        if not arxiv and u and "arxiv.org" in str(u):
            arxiv = find_arxiv(str(u))
    doi = find_doi(str(s.get("doi", ""))) if s.get("doi") else ""
    for u in (s.get("published_url"), s.get("url")):
        if not doi and u:
            doi = find_doi(str(u))
    venue = clean(s.get("venue") or s.get("version_note") or "")
    if s.get("year") and str(s.get("year")) not in venue:
        venue = (venue + f" ({s['year']})").strip()
    return {"title": clean(s.get("title")), "authors": clean(s.get("authors")), "arxiv": arxiv, "doi": doi,
            "venue": venue, "url": clean(s.get("url") or s.get("published_url") or "")}


def meta_from_record(s: dict) -> dict:
    text = " ".join(str(s.get(k, "")) for k in ("edition", "venue", "url", "citation"))
    arxiv = find_arxiv("arXiv:" + str(s["arxiv"])) if s.get("arxiv") else find_arxiv(text)
    if not arxiv and "arxiv.org" in str(s.get("url", "")):
        arxiv = find_arxiv(str(s.get("url")))
    doi = find_doi(str(s.get("doi", ""))) if s.get("doi") else find_doi(text)
    return {"title": clean(s.get("title")), "authors": clean(s.get("authors")), "arxiv": arxiv, "doi": doi,
            "venue": clean(s.get("venue") or s.get("edition") or ""), "url": clean(s.get("url") or "")}


class Explorer:
    """The explorer checkout's records for the legacy entries."""

    PRODUCERS = ("paper", "errata", "blueprint", "assembly", "package", "sources", "design", "audit", "compare",
                 "collation", "classify", "restructure")

    def __init__(self, root: Path):
        self.root = root
        self.cache: dict[str, dict | None] = {}
        q = self.load("research/blueprint/queue.json") or {}
        self.jobs = {j["id"]: j for j in q.get("jobs", [])}
        self.outputs = collections.defaultdict(list)
        for j in q.get("jobs", []):
            for o in j.get("outputs", []):
                self.outputs[o].append(j)
        self.added = {}
        log = git(root, "log", "--diff-filter=A", "--name-only", "--format=@%cI", "--", "research/blueprint/papers",
                  "research/blueprint/packets", "research/blueprint/errata", check=False).decode("utf-8", "replace")
        date = ""
        for line in log.splitlines():
            if line.startswith("@"):
                date = line[1:11]
            elif line.strip():
                self.added[line.strip()] = date   # log runs newest first: the last write is the first add

    def load(self, rel: str):
        if rel not in self.cache:
            try:
                self.cache[rel] = json.loads((self.root / rel).read_text(encoding="utf-8"))
            except (OSError, ValueError):
                self.cache[rel] = None
        return self.cache[rel]

    def producer(self, rel: str) -> tuple[str, str]:
        jobs = [j for j in self.outputs.get(rel, []) if j.get("kind") in self.PRODUCERS]
        jobs.sort(key=lambda j: (j.get("finishedAt") or "9999", self.PRODUCERS.index(j["kind"])))
        if jobs:
            return jobs[0]["id"], (jobs[0].get("finishedAt") or "")[:10] or self.added.get(rel, "")
        return "", self.added.get(rel, "")

    def record(self, e: dict) -> tuple[dict | None, str, list[str]]:
        """(source metadata, source id, roadmaps) of a legacy entry from the file that holds it."""
        rel = e.get("file", "")
        d = self.load(rel) or {}
        meta, sid, roads = None, "", []
        issue = next((i for i in d.get("sourceIssues", []) or [] if i.get("id") == e.get("id")), None)
        if isinstance(d.get("source"), dict):
            meta = meta_from_record(d["source"])
        if issue and issue.get("source"):
            sid = str(issue["source"])
            rec = next((s for s in d.get("sources", []) or [] if isinstance(s, dict) and s.get("id") == sid), None)
            if rec:
                meta = meta_from_record(rec)
        if meta is None and str(e.get("owner", "")).startswith("PAPER-"):
            p = self.load(f"research/blueprint/papers/{e['owner']}.result.json") or {}
            if isinstance(p.get("source"), dict):
                meta = meta_from_record(p["source"])
        if d.get("roadmapId"):
            roads = [d["roadmapId"]]
        elif not str(e.get("owner", "")).startswith("PAPER-") and e.get("owner"):
            roads = [e["owner"]]
        else:
            j = self.jobs.get(e.get("owner", ""), {})
            roads = list(j.get("roadmapIds") or [])
        return meta, sid, roads


# --------------------------------------------------------------------------------- normalizing

UNPARSED_NO_AT = re.compile(r"^\W*(Misprint|Error|Gap|Typo)\**\s+in\s+([^:]{2,160}?):\s+(.*)$", re.S | re.I)
UNPARSED = re.compile(r"^\W*(Misprint|Error|Gap|Typo)\**\s+in\s+(.+?)\s+at\s+(.+?):\s+(.*)$", re.S | re.I)


def split_bullet(rest: str) -> tuple[str, str, str]:
    rest = re.sub(r"\s*\(found in:[^)]*\)\s*$", "", rest).strip()
    aff = ""
    m = re.search(r";\s*affects\s+(nothing|the proof|a stated result)\.?\s*$", rest, re.I)
    if m:
        aff, rest = m.group(1).lower(), rest[: m.start()]
    m = re.search(r";\s*(it should (?:be|read|say)\b.*)$", rest, re.I | re.S)
    should = ""
    if m:
        should, rest = m.group(1), rest[: m.start()]
    return rest.strip(), should.strip(), aff


def report_key(job: str, roadmap: str, pr, issue, by: str, comment: str) -> str:
    """Reports count as independent when they come from different agents or different lanes: later rounds
    of one job by the same agent (REV-X, REV-X~2, ...) may carry an earlier round's findings forward."""
    if job:
        return f"board:{re.sub(r'~[0-9a-z]+$', '', job)}:{by}"
    return comment or f"board:{pr}:{issue}:{roadmap}:{by}"


def normalize_board(reg: dict, manifests: dict) -> tuple[list[dict], collections.Counter]:
    issues = reg["issues"]
    dropped = collections.Counter()
    pr_roads = collections.defaultdict(set)
    for e in issues:
        if e.get("board_pr") and e.get("roadmap"):
            pr_roads[e["board_pr"]].add(e["roadmap"])
    out = []
    for e in issues:
        kind, source, loc = norm_kind(e.get("kind", "")), clean(e.get("source")), clean(e.get("locator"))
        says, should, aff = clean(e.get("says")), clean(e.get("should")), clean(e.get("affects")).lower()
        if (e.get("kind") or "").lower() == "unparsed" or not kind:
            m = UNPARSED.match(says)
            if m:
                kind, source, loc = norm_kind(m.group(1)), m.group(2).strip(), m.group(3).strip()
                says, should, aff = split_bullet(m.group(4))
            elif (m := UNPARSED_NO_AT.match(says)):
                kind, source = norm_kind(m.group(1)), m.group(2).strip()
                says, should, aff = split_bullet(m.group(3))
                m2 = re.match(r"^(\S{1,30})\s+((?:in|after|before|at)\s.*)$", source)
                if m2:
                    source, loc = m2.group(1), re.sub(r"^(?:in|at)\s+", "", m2.group(2))
            else:
                m = re.match(r"^\W*(Misprint|Error|Gap|Typo)\b\**\s*(.*)$", says, re.S | re.I)
                if not m:
                    dropped["board: bullet that records no mistake"] += 1
                    continue
                kind = norm_kind(m.group(1))
                says, should, aff = split_bullet(m.group(2))
        if not (says or should):
            dropped["board: empty description"] += 1
            continue
        roadmap = e.get("roadmap") or ""
        inferred = False
        if not roadmap and e.get("board_pr") and len(pr_roads.get(e["board_pr"], ())) == 1:
            roadmap, inferred = next(iter(pr_roads[e["board_pr"]])), True
        job, pr, issue = e.get("job") or "", e.get("board_pr") or "", e.get("issue") or ""
        if issue:
            label = f"errata job {job} (issue #{issue})" if job else f"issue #{issue}"
        elif pr:
            label = f"PR #{pr}" + (f", {job}" if job else "")
        else:
            label = job or "register entry"
        if e.get("found_in") and not job:
            label += " (backfill from earlier reviews)"
        if e.get("head"):
            label += f" at {str(e['head'])[:7]}"
        comment = clean(e.get("comment"))
        by = clean(e.get("reporter"))
        out.append({
            "origin": "board", "kind": kind, "raw": source, "roadmap": roadmap, "roadmaps": [roadmap] if roadmap else [],
            "locator": loc, "says": says, "should": should, "why": "", "affects": aff if aff in AFFECTS else "",
            "note": clean(e.get("note")), "status": "", "meta": None, "sid": "", "lid": "",
            "report": {"key": report_key(job, roadmap, pr, issue, by, comment), "label": label,
                       "url": comment, "date": str(e.get("reported") or "")[:10], "by": by, "status": ""},
            "inferred_roadmap": inferred,
        })
    return out, dropped


def normalize_legacy(reg: dict, ex: Explorer) -> tuple[list[dict], collections.Counter]:
    out, dropped = [], collections.Counter()
    for e in reg["issues"]:
        status = (e.get("status") or "").lower()
        if status == "rejected":
            dropped["legacy: rejected by review"] += 1
            continue
        kind = norm_kind(e.get("kind", ""))
        if not kind:
            dropped["legacy: unknown kind"] += 1
            continue
        meta, sid, roads = ex.record(e)
        rel = e.get("file", "")
        job, date = ex.producer(rel)
        job = job or e.get("owner", "")
        st = "confirmed" if status == "confirmed" else "unreviewed"
        by = f"confirmed by {e['reviewedBy']}" if st == "confirmed" and e.get("reviewedBy") else "awaiting review"
        out.append({
            "origin": "legacy", "kind": kind, "raw": clean(e.get("citation")), "roadmap": roads[0] if roads else "",
            "roadmaps": roads, "locator": clean(e.get("locator")), "says": clean(e.get("printed")),
            "should": clean(e.get("correction")), "why": clean(e.get("reason")),
            "affects": (e.get("affects") or "").lower() if (e.get("affects") or "").lower() in AFFECTS else "",
            "note": "", "status": st, "meta": meta, "sid": sid, "lid": e.get("id", ""),
            "report": {"key": f"legacy:{e.get('owner') or rel}", "label": f"{job} ({e.get('id', '')})" if job != e.get("id") else job, "url": "../" + rel,
                       "date": date, "by": by, "status": st, "file": rel},
            "inferred_roadmap": False,
        })
    return out, dropped


# ------------------------------------------------------------------------------------- sources

class UF:
    def __init__(self):
        self.p = {}

    def find(self, x):
        self.p.setdefault(x, x)
        while self.p[x] != x:
            self.p[x] = self.p[self.p[x]]
            x = self.p[x]
        return x

    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.p[max(ra, rb)] = min(ra, rb)


KEYLIKE = re.compile(r"^[A-Za-z][A-Za-z\-]*\d{2,4}[a-z]?$")


def resolve_key(e: dict, manifests: dict, global_ids: dict) -> dict | None:
    key = e["raw"].strip()
    if not key:
        return None
    for road in [e["roadmap"]] + [r for r in manifests if family(r) == family(e["roadmap"]) and r != e["roadmap"]]:
        m = manifests.get(road, {})
        hit = m.get(key) or next((v for k, v in m.items() if k.lower() == key.lower()), None)
        if hit is None:
            hit = next((v for k, v in m.items() if re.match(re.escape(k) + r"(?:[\s,(]|$)", key)), None)
        if hit is not None:
            return meta_from_manifest(hit)
    if KEYLIKE.match(key) or (len(key) >= 6 and " " not in key):
        cands = global_ids.get(key.lower(), [])
        fps = {(c["arxiv"] or c["doi"] or fold(c["title"])) for c in cands}
        if cands and len(fps) == 1:
            return cands[0]
    return None


SURNAME_KEY = re.compile(r"^((?:[A-Z][a-z]{2,}|[a-z]{3,})(?:[-–](?:[A-Z][a-z]{2,}|[a-z]{3,}))*)(\d{2}|\d{4})?[a-z]?$")


class RoadmapReadmes:
    """Reference lists of TauCetiRoadmap READMEs (main and open pull requests) from a local mirror, used only
    to name a source that a roadmap cites by an author-name key such as `Blackadar` or `Jones2015`."""

    def __init__(self, state: Path | None):
        self.bullets: dict[str, list[str]] = {}
        self.ok = bool(state and (state / "index.json").is_file() and (state / "mirror.git").is_dir())
        if self.ok:
            self.mirror = state / "mirror.git"
            self.index = json.loads((state / "index.json").read_text(encoding="utf-8"))

    def load(self, roadmaps: set[str]) -> None:
        if not self.ok:
            return
        specs: dict[str, list[str]] = {}
        for r in sorted(roadmaps):
            f = (self.index.get("main_folders") or {}).get(r)
            cand = [f"refs/heads/main:{f}/README.md"] if f else []
            cand += [f"refs/open/{p['pr']}:{p['folders'][r]}/README.md" for p in self.index.get("prs", [])
                     if r in p.get("roadmaps", []) and (p.get("folders") or {}).get(r)]
            specs[r] = cand
        got = git_cat_many(self.mirror, [c for cs in specs.values() for c in cs])
        for r, cs in specs.items():
            text = next((got[c].decode("utf-8", "replace") for c in cs if got.get(c)), "")
            self.bullets[r] = self.reference_bullets(text)

    @staticmethod
    def reference_bullets(text: str) -> list[str]:
        out, on, cur = [], False, None
        for line in text.splitlines():
            h = re.match(r"^(#{1,4})\s+(.*)", line)
            if h:
                on = bool(re.match(r"(?i)(references|sources|bibliography|literature)\b", h.group(2).strip()))
                cur = None
                continue
            if not on:
                continue
            if re.match(r"^\s*(?:[-*]|\d+\.)\s+", line):
                cur = [re.sub(r"^\s*(?:[-*]|\d+\.)\s+", "", line)]
                out.append(cur)
            elif line.strip() and cur is not None:
                cur.append(line.strip())
            else:
                cur = None
        return [" ".join(b) for b in out]

    def resolve(self, roadmap: str, key: str) -> dict | None:
        m = SURNAME_KEY.match(key or "")
        if not m or roadmap not in self.bullets:
            return None
        names = [fold(n) for n in re.split(r"[-–]", m.group(1))]
        year = m.group(2) or ""
        hits = []
        for b in self.bullets[roadmap]:
            t = re.search(r"\[?\*([^*]{4,}?)\*", b)
            who = fold(b[: t.start()] if t else b[:120])
            if all(re.search(rf"\b{re.escape(n)}\b", who) for n in names):
                if year and not re.search(rf"(?<!\d)(?:19|20)?{year}(?!\d)", b):
                    continue
                hits.append((b, t))
        if len(hits) != 1 or not hits[0][1]:
            return None
        b, t = hits[0]
        authors = re.sub(r"\]\([^)]*\)|[\[\]`'\"*_]", "", b[: t.start()])
        authors = re.sub(r"[(),;:\s]+$", "", authors).strip(" -,")
        link = re.search(r"\]\((https?://[^)\s]+)\)", b)
        return {"title": clean(t.group(1)), "authors": clean(authors), "arxiv": find_arxiv(b), "doi": find_doi(b),
                "venue": "", "url": link.group(1) if link else ""}


def fingerprints(e: dict) -> tuple[list[str], dict]:
    raw, meta = e["raw"], e["meta"]
    info = {"label": raw, "key": "", "global": ""}
    fps = []
    g = global_key(raw) if raw else None
    if g:
        fps.append(g[0])
        info.update(label=g[1], global_label=g[1])
        if g[2]:
            e["locator"] = f"{g[2]}, {e['locator']}".strip(", ") if e["locator"] else g[2]
        return fps, info
    keylike = bool(raw) and " " not in raw and len(raw) <= 40 and not find_arxiv(raw)
    if meta:
        if meta.get("arxiv"):
            fps.append("ax:" + meta["arxiv"])
        if meta.get("doi"):
            fps.append("doi:" + meta["doi"])
        t = fold(meta.get("title", ""))
        if len(t.split()) >= 2 and len(t) >= 10:
            fps.append(f"ti:{first_surname(meta.get('authors', ''))}|{t}")
    if keylike:
        fps.append(f"key:{family(e['roadmap'])}:{raw.lower()}")
        info["key"] = raw
    elif raw:
        ax, doi = find_arxiv(raw), find_doi(raw)
        if ax:
            fps.append("ax:" + ax)
        if doi:
            fps.append("doi:" + doi)
        authors, title = parse_citation(raw)
        t = fold(title)
        if len(t.split()) >= 2 and len(t) >= 10:
            fps.append(f"ti:{first_surname(authors)}|{t}")
        r = re.sub(r"(?i)arxiv[:\s]*[\w./-]+|doi[:\s]*\S+|\bv\d+\b", " ", raw)
        fps.append("raw:" + fold(r))
    if not fps:
        fps.append(f"none:{family(e['roadmap'])}")
        info["label"] = "(source not named)"
    return fps, info


def build_sources(entries: list[dict], manifests: dict, readmes: RoadmapReadmes) -> tuple[list[dict], list[int]]:
    global_ids = collections.defaultdict(list)
    for road, m in manifests.items():
        for k, s in m.items():
            global_ids[k.lower()].append(meta_from_manifest(s))
    for e in entries:
        if e["origin"] == "board" and e["meta"] is None:
            e["meta"] = resolve_key(e, manifests, global_ids)
    pending = [e for e in entries if e["origin"] == "board" and e["meta"] is None and e["roadmap"]
               and SURNAME_KEY.match(e["raw"].strip())]
    readmes.load({e["roadmap"] for e in pending})
    for e in pending:
        e["meta"] = readmes.resolve(e["roadmap"], e["raw"].strip())
    uf = UF()
    per = []
    for e in entries:
        fps, info = fingerprints(e)
        for f in fps[1:]:
            uf.union(fps[0], f)
        per.append((fps, info))
    comps: dict[str, int] = {}
    groups: list[list[int]] = []
    assign = []
    for i, (fps, _) in enumerate(per):
        root = uf.find(fps[0])
        if root not in comps:
            comps[root] = len(groups)
            groups.append([])
        groups[comps[root]].append(i)
        assign.append(comps[root])
    sources = []
    for gi, members in enumerate(groups):
        metas = [entries[i]["meta"] for i in members if entries[i]["meta"]]
        raws = collections.Counter(entries[i]["raw"] for i in members if entries[i]["raw"])
        keys = collections.Counter(per[i][1]["key"] for i in members if per[i][1]["key"])
        roads = collections.Counter(r for i in members for r in entries[i]["roadmaps"])
        glabel = next((per[i][1].get("global_label") for i in members if per[i][1].get("global_label")), "")
        best = {}
        if metas:
            tally = collections.Counter(fold(m["title"]) for m in metas if m.get("title"))
            top = tally.most_common(1)[0][0] if tally else ""
            ordered = sorted(metas, key=lambda m: (fold(m.get("title", "")) != top, -sum(bool(v) for v in m.values())))
            best = dict(ordered[0])
            for m in ordered[1:]:
                for k, v in m.items():
                    if v and not best.get(k):
                        best[k] = v
        title, authors = best.get("title", ""), best.get("authors", "")
        arxiv = best.get("arxiv", "")
        doi = best.get("doi", "")
        if not title and raws:
            for r, _ in raws.most_common():
                a, t = parse_citation(r)
                if t:
                    title, authors = t, a
                    break
        for r in raws:
            arxiv = arxiv or find_arxiv(r)
            doi = doi or find_doi(r)
        dash = collections.Counter()
        for r, n in raws.items():
            a, t = parse_citation(r)
            a = re.sub(r"\s*\(.*?\)", "", a).strip(" ,")
            if a and "–" in a and len(a) <= 70 and not re.search(r"\d", a) and "," not in a:
                dash[a] += n
        if glabel:
            label = glabel
        elif title:
            who = dash.most_common(1)[0][0] if dash else short_authors(authors)
            label = f"{who}, {title}" if who else title
        elif raws:
            label = raws.most_common(1)[0][0]
        else:
            label = "(source not named)"
        key = keys.most_common(1)[0][0] if keys else ""
        if key and not title and not glabel:
            top_roads = [r for r, _ in roads.most_common(2)]
            label = f"{key} (cited by {' and '.join(top_roads)})" if top_roads else f"{key} (roadmap not recorded)"
        aliases = [r for r, _ in raws.most_common(12) if r != label][:12]
        slug_base = ("arxiv-" + arxiv) if arxiv else ("doi-" + doi) if doi else fold(label)[:48]
        slug = re.sub(r"[^a-z0-9.]+", "-", slug_base.lower()).strip("-")
        h = hashlib.sha1("|".join(sorted(set(f for i in members for f in per[i][0]))).encode()).hexdigest()[:5]
        sources.append({"label": label, "title": title, "authors": authors, "arxiv": arxiv, "doi": doi,
                        "venue": best.get("venue", ""), "url": best.get("url", ""), "aliases": aliases,
                        "slug": f"{slug}-{h}" if slug else h, "roadmaps": roads})
    return sources, assign


def short_authors(a: str) -> str:
    a = re.sub(r"\s+", " ", a or "").strip()
    names = [n.strip() for n in re.split(r",\s*|\s+and\s+|\s*&\s*|;\s*", a) if n.strip()]
    if len(names) <= 1 and "–" in a:
        return a
    sur = [re.sub(r"[^\w\-]", "", n.split()[-1]) for n in names if n.split()]
    sur = [x for x in sur if x]
    if not sur:
        return a
    if len(sur) > 4:
        return f"{sur[0]} et al."
    return "–".join(sur)


# --------------------------------------------------------------------------------------- dedup

STOP = set("the a an of in to and is are be it its as at by for on with that this which from or not "
           "source says should it should printed claims states defines asserts uses gives where when".split())


def tokens(s: str) -> set[str]:
    return {t for t in fold(s).split() if t not in STOP and len(t) > 1}


def similar(a: dict, b: dict) -> bool:
    ta, tb = a["_tok"], b["_tok"]
    if not ta or not tb:
        return False
    inter = len(ta & tb)
    jac = inter / len(ta | tb)
    cont = inter / min(len(ta), len(tb))
    return jac >= 0.5 or (cont >= 0.85 and min(len(ta), len(tb)) >= 8)


FILE_PRIORITY = {"errata": 0, "packets": 1, "papers": 2}


def merge(entries: list[dict], assign: list[int]) -> list[dict]:
    # 1. the same legacy id in several files is one mistake (later revisions of one record)
    groups: list[list[int]] = []
    by_id: dict[str, int] = {}
    for i, e in enumerate(entries):
        e["_src"] = assign[i]
        if e["lid"]:
            if e["lid"] in by_id:
                groups[by_id[e["lid"]]].append(i)
                continue
            by_id[e["lid"]] = len(groups)
        groups.append([i])
    # 2. same source, same locator, near-identical description
    for g in groups:
        e = entries[g[0]]
        e["_tok"] = tokens(e["says"] + " " + e["should"])
    buckets = collections.defaultdict(list)
    for gi, g in enumerate(groups):
        e = entries[g[0]]
        buckets[(e["_src"], locator_info(e["locator"])[0])].append(gi)
    uf = UF()
    for members in buckets.values():
        if len(members) < 2:
            continue
        for x in range(len(members)):
            for y in range(x + 1, len(members)):
                if similar(entries[groups[members[x]][0]], entries[groups[members[y]][0]]):
                    uf.union(members[x], members[y])
    clusters = collections.defaultdict(list)
    for gi in range(len(groups)):
        clusters[uf.find(gi)].extend(groups[gi])
    mistakes = []
    for members in clusters.values():
        es = [entries[i] for i in members]

        def pref(e):
            f = e["report"].get("file", "")
            part = f.split("/")[2] if f.count("/") >= 2 else ""
            return (e["status"] == "unreviewed", e["origin"] != "legacy",
                    FILE_PRIORITY.get(part, 3) if e["origin"] == "legacy" else 0,
                    "--" in f, -len(e["says"]) - len(e["should"]))
        primary = sorted(es, key=pref)[0]
        kinds = collections.Counter(e["kind"] for e in es)
        top = max(kinds.values())
        kind = min((k for k, v in kinds.items() if v == top), key=KINDS.index)
        reports, seen = [], set()
        for e in sorted(es, key=lambda e: (e["report"]["date"] or "9999", e["report"]["label"])):
            r = e["report"]
            if (r["key"], r["label"]) in seen:
                continue
            seen.add((r["key"], r["label"]))
            reports.append(r)
        independent = len({r["key"] for r in reports})
        roads = []
        for e in es:
            for r in e["roadmaps"]:
                if r and r not in roads:
                    roads.append(r)
        affects = max((e["affects"] for e in es), key=AFFECTS.index)
        status = "confirmed" if any(e["status"] == "confirmed" for e in es) else \
            "unreviewed" if all(e["status"] == "unreviewed" for e in es) else ""
        notes = []
        for e in es:
            if e["note"] and e["note"] not in notes:
                notes.append(e["note"])
        mistakes.append({
            "src": primary["_src"], "locator": primary["locator"], "kind": kind, "says": primary["says"],
            "should": primary["should"], "why": primary["why"], "affects": affects, "note": " · ".join(notes),
            "roadmaps": roads, "reports": reports, "independent": independent, "status": status,
            "origins": sorted({e["origin"] for e in es}), "entries": len(es),
            "kinds_seen": sorted(kinds, key=KINDS.index),
        })
    return mistakes


# ------------------------------------------------------------------------------------- ranking

def rank_key(m: dict, sources: list[dict]):
    _, lc = locator_info(m["locator"])
    return (KINDS.index(m["kind"]), -m["independent"], -lc, -AFFECTS.index(m["affects"]),
            m["status"] == "unreviewed", -len(m["roadmaps"]), fold(sources[m["src"]]["label"]), natural_key(m["locator"]))


# ------------------------------------------------------------------------------------- output

def build_data(mistakes, sources, inputs, counts, generated):
    src_count = collections.Counter(m["src"] for m in mistakes)
    order = sorted(range(len(sources)), key=lambda s: (-src_count[s], fold(sources[s]["label"])))
    order = [s for s in order if src_count[s]]
    new_index = {s: i for i, s in enumerate(order)}
    mistakes.sort(key=lambda m: (new_index[m["src"]], locator_order(m["locator"]), KINDS.index(m["kind"])))
    roads = sorted({r for m in mistakes for r in m["roadmaps"]}, key=str.lower)
    road_index = {r: i for i, r in enumerate(roads)}
    S = []
    for s in order:
        x = sources[s]
        S.append([x["label"], x["title"], x["authors"], x["arxiv"], x["doi"], x["venue"], x["url"], x["aliases"],
                  x["slug"]])
    E = []
    for m in mistakes:
        reps = [[1 if r["key"].startswith("legacy:") else 0, r["label"], r["url"], r["date"], r["by"]]
                for r in m["reports"]]
        flags = (1 if m["status"] == "unreviewed" else 0) | (2 if "board" in m["origins"] else 0) | \
                (4 if "legacy" in m["origins"] else 0)
        E.append([new_index[m["src"]], m["locator"], KINDS.index(m["kind"]), m["says"], m["should"], m["why"],
                  AFFECTS.index(m["affects"]), m["note"], [road_index[r] for r in m["roadmaps"]], m["independent"],
                  reps, flags, locator_info(m["locator"])[1]])
    S_list = [sources[s] for s in order]
    for m in mistakes:
        m["src"] = new_index[m["src"]]
    ranked = sorted(range(len(mistakes)), key=lambda i: rank_key(mistakes[i], S_list))
    by_kind = collections.Counter(m["kind"] for m in mistakes)
    meta = {
        "generated": generated, "boardRev": inputs["rev"][:7], "boardDate": inputs["when"],
        "boardScanned": inputs["board"].get("scanned_to", ""), "legacyExported": inputs["legacy"].get("exported", ""),
        "legacySource": "explorer register to 2026-10-21",
        "mistakes": len(mistakes), "reports": sum(m["entries"] for m in mistakes), "sources": len(S),
        "byKind": [by_kind[k] for k in KINDS], "counts": counts,
        "boardRepo": BOARD_REPO,
    }
    return {"meta": meta, "S": S, "R": roads, "E": E, "rank": ranked}, mistakes, S_list, ranked


def render(data: dict, inline: bool) -> str:
    payload = json.dumps(data, ensure_ascii=False, separators=(",", ":")).replace("<", "\\u003c")
    meta = data["meta"]
    head = (f"{meta['mistakes']:,} mistakes (merged from {meta['reports']:,} register entries) in {meta['sources']:,} sources: "
            f"{meta['byKind'][0]:,} errors, {meta['byKind'][1]:,} gaps, {meta['byKind'][2]:,} misprints")
    page = TEMPLATE.replace("__HEADLINE__", head).replace("__GENERATED__", meta["generated"])
    page = page.replace("__BOARDREV__", meta["boardRev"])
    if inline:
        page = page.replace("__LOADER__", "boot(JSON.parse(document.getElementById('errata-data').textContent));")
        page = page.replace("__DATA_SCRIPT__", f'<script id="errata-data" type="application/json">{payload}</script>')
    else:
        page = page.replace("__LOADER__", "fetch('data.json').then(function (r) { return r.json(); }).then(boot)"
                                          ".catch(function (err) { document.getElementById('list').textContent = "
                                          "'Could not load data.json: ' + err; });")
        page = page.replace("__DATA_SCRIPT__", "")
    return page, payload


README = """# Errata explorer

`index.html` in this directory is a single-page browser of the mistakes that Tau Ceti's workers
recorded in published sources (papers, books, lecture notes) while turning them into roadmaps:
**errors** (a false statement or proof step), **gaps** (a step the source does not justify) and
**misprints** (slips whose intended meaning is clear). It is served at
<https://cbirkbeck.github.io/tauceti-explorer/errata/>.

The data comes from two registers kept in the repository TauCetiProject/TauCetiRoadmapJobs:

- the board register, `errata/source-issues.json` (readable form `errata/REGISTER.md`), fed by the
  `## Source issues` sections of board reviews, red-team passes and errata jobs;
- the explorer's legacy register, `errata/explorer/source-issues.json.gz` (to 2026-10-21); entries
  that a review rejected are left out, entries still awaiting review are marked.

Each entry is normalized to its source, locator, kind, description (our own words as recorded;
the sources themselves are not quoted), roadmap and provenance. Reports of the same mistake (same
source, same locator, near-identical description, or the same legacy record in several files) are
merged and counted. Source titles, authors and identifiers come from the board's package source
lists (`packages/*/sources.toml` and `packages/*/design/plan.json`), this repository's
`research/blueprint/` extraction records and, for a source cited by an author-name key, the citing
roadmap's README reference list in TauCetiProject/TauCetiRoadmap; a source cited only by a
roadmap-local key that none of these explains is listed under that key and roadmap.

"Most serious" ranks errors first, then gaps, by the number of independent reports, then by whether
the locator is a theorem, proposition, lemma, corollary or claim (rather than a remark or example),
then by what the mistake affects.

The page is generated, never edited by hand. `errata/errata-page.py` is the generator (each run
refreshes this copy). Regenerate with

    python3 -I errata/errata-page.py <scratch-dir> --board <TauCetiRoadmapJobs checkout> --explorer <this checkout>

It fetches TauCetiRoadmapJobs `origin/main` in that checkout and reads the registers with
`git show` (the GitHub contents API truncates files over 1 MB), uses its scratch directory for
copies of the inputs and a `summary.json`, and rewrites `errata/index.html` (moving the data to
`errata/data.json` if the page would exceed 25 MB), this README and the generator copy; then
commit and push. `--roadmaps` optionally points at a TauCetiRoadmap mirror whose README reference
lists name sources cited by an author key; `--no-fetch` and `--no-install` skip the fetch and the
copy into the checkout.
"""


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("workdir", type=Path)
    ap.add_argument("--board", type=Path, default=DEFAULT_BOARD)
    ap.add_argument("--explorer", type=Path, default=DEFAULT_EXPLORER)
    ap.add_argument("--roadmaps", type=Path, default=DEFAULT_ROADMAPS,
                    help="open-roadmaps state (index.json + mirror.git) of TauCetiRoadmap, for README reference lists")
    ap.add_argument("--no-fetch", action="store_true")
    ap.add_argument("--no-install", action="store_true")
    args = ap.parse_args()
    work = args.workdir.resolve()
    work.mkdir(parents=True, exist_ok=True)
    inputs = load_inputs(args.board, work, not args.no_fetch)
    reg_note = check_register(inputs["board"], inputs["register"])
    ex = Explorer(args.explorer)
    board, d1 = normalize_board(inputs["board"], inputs["manifests"])
    legacy, d2 = normalize_legacy(inputs["legacy"], ex)
    entries = board + legacy
    sources, assign = build_sources(entries, inputs["manifests"], RoadmapReadmes(args.roadmaps))
    mistakes = merge(entries, assign)
    counts = {"boardEntries": len(inputs["board"]["issues"]), "legacyEntries": len(inputs["legacy"]["issues"]),
              "boardKept": len(board), "legacyKept": len(legacy), "dropped": dict(d1 + d2),
              "register": reg_note}
    generated = dt.datetime.now(dt.UTC).strftime("%Y-%m-%d %H:%M UTC")
    data, mistakes, S_list, ranked = build_data(mistakes, sources, inputs, counts, generated)
    page, payload = render(data, inline=True)
    out = work / "out" / "errata"
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)
    files = {}
    if len(page.encode("utf-8")) > SPLIT_BYTES:
        page, payload = render(data, inline=False)
        files["data.json"] = payload
    files["index.html"] = page
    files["README.md"] = README
    files["errata-page.py"] = Path(__file__).read_text(encoding="utf-8")
    for name, text in files.items():
        (out / name).write_text(text, encoding="utf-8")
    bad = [(n, i + 1) for n, t in files.items() for i, line in enumerate(t.splitlines()) if MACHINE_CHECK.search(line)]
    if bad:
        raise SystemExit(f"machine paths in output: {bad[:5]}")
    summary = {
        "generated": generated, "board_rev": inputs["rev"][:7], "entries_before": len(entries),
        "board_entries": len(board), "legacy_entries": len(legacy), "dropped": dict(d1 + d2),
        "mistakes": len(mistakes), "sources": len(S_list), "by_kind": dict(zip(KINDS, data["meta"]["byKind"])),
        "merged_multi_report": sum(1 for m in mistakes if m["independent"] > 1),
        "files": {n: len(t.encode("utf-8")) for n, t in files.items()},
        "top5": [{"source": S_list[mistakes[i]["src"]]["label"], "locator": mistakes[i]["locator"],
                  "kind": mistakes[i]["kind"], "reports": mistakes[i]["independent"], "says": mistakes[i]["says"][:300]}
                 for i in ranked[:5]],
    }
    (work / "summary.json").write_text(json.dumps(summary, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    if not args.no_install:
        dest = args.explorer / "errata"
        dest.mkdir(exist_ok=True)
        if not (out / "data.json").exists() and (dest / "data.json").exists():
            (dest / "data.json").unlink()
        for name in files:
            shutil.copyfile(out / name, dest / name)
    print(json.dumps(summary, indent=1, ensure_ascii=False))
    return 0


TEMPLATE = r"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Errata in published sources · Tau Ceti explorer</title>
<style>
:root{--bg:#fafaf7;--fg:#1d1d1f;--muted:#646464;--line:#e2e2dc;--card:#fff;--err:#c62828;--gap:#b45f00;--mis:#6f6f6f;--link:#1a5fb4;--sel:#e8f0fb;--hl:#fff6cc}
@media (prefers-color-scheme:dark){:root{--bg:#151515;--fg:#e9e9e6;--muted:#a3a3a3;--line:#333;--card:#1e1e1e;--err:#ef5350;--gap:#f29d35;--mis:#9a9a9a;--link:#86b4ff;--sel:#22324a;--hl:#3b3720}}
*{box-sizing:border-box}
body{margin:0;font:15px/1.45 system-ui,-apple-system,"Segoe UI",Roboto,Helvetica,Arial,sans-serif;background:var(--bg);color:var(--fg)}
a{color:var(--link);text-decoration:none}a:hover{text-decoration:underline}
header{padding:16px 24px 10px;border-bottom:1px solid var(--line)}
.warn{margin:10px 0 12px;padding:12px 16px;border:3px solid #b00020;background:#fff1f0;color:#7a0010;font-weight:700;font-size:1.05em;line-height:1.4}
.warn small{display:block;font-weight:400;color:#5a0010;margin-top:4px}
header h1{margin:0 0 4px;font-size:22px;font-weight:650}
header .totals{font-size:15px}
header .sub{color:var(--muted);font-size:13px;margin-top:3px}
code{font-size:12.5px;background:rgba(127,127,127,.12);padding:0 3px;border-radius:3px}
.badge{display:inline-block;min-width:62px;text-align:center;padding:1px 7px;border-radius:9px;font-size:12px;font-weight:650;color:#fff;vertical-align:1px}
.k0{background:var(--err)}.k1{background:var(--gap)}.k2{background:var(--mis)}
#controls{position:sticky;top:0;z-index:5;background:var(--bg);padding:9px 24px 7px;border-bottom:1px solid var(--line);display:flex;flex-wrap:wrap;gap:8px 12px;align-items:center}
#q{flex:1 1 300px;min-width:220px;padding:7px 10px;font-size:15px;border:1px solid var(--line);border-radius:6px;background:var(--card);color:var(--fg)}
#controls label{font-size:13.5px;white-space:nowrap;cursor:pointer}
#controls select{font-size:13.5px;padding:5px;border:1px solid var(--line);border-radius:6px;background:var(--card);color:var(--fg);max-width:260px}
.kchip{border:1px solid var(--line);border-radius:14px;padding:3px 9px;background:var(--card)}
.kchip input{vertical-align:-1px;margin:0 4px 0 0}
#status{width:100%;color:var(--muted);font-size:13px}
#serious{padding:10px 24px 4px;border-bottom:1px solid var(--line)}
#serious h2,#main h2{font-size:17px;margin:4px 0 6px}
#serious .note{color:var(--muted);font-size:13px;margin:0 0 6px}
ol.top{margin:0;padding-left:30px;max-height:430px;overflow:auto}
ol.top li{margin:3px 0;font-size:14px}
ol.top .d{color:var(--fg)}
.nrep{font-size:12px;color:var(--muted);border:1px solid var(--line);border-radius:9px;padding:0 6px;white-space:nowrap}
.unrev{font-size:12px;color:var(--gap);border:1px dashed var(--gap);border-radius:9px;padding:0 6px;white-space:nowrap}
#wrap{display:grid;grid-template-columns:minmax(250px,330px) 1fr}
#index{border-right:1px solid var(--line);position:sticky;top:var(--ctl,96px);align-self:start;max-height:calc(100vh - var(--ctl,96px));overflow:auto;padding:8px 0}
#index h2{font-size:15px;margin:2px 14px 6px}
#index ul{list-style:none;margin:0;padding:0}
#index li{padding:4px 14px;cursor:pointer;font-size:13.5px;display:grid;grid-template-columns:1fr auto;gap:2px 8px;border-left:3px solid transparent}
#index li:hover{background:rgba(127,127,127,.08)}
#index li.sel{background:var(--sel);border-left-color:var(--link)}
#index .sl{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical}
#index .sc{font-variant-numeric:tabular-nums;font-weight:600}
#index .kc{grid-column:1/3;font-size:11.5px;color:var(--muted)}
#index .kc b{display:inline-block;width:8px;height:8px;border-radius:2px;margin:0 3px 0 6px;vertical-align:0}
#index .kc b:first-child{margin-left:0}
#main{padding:8px 24px 40px;min-width:0}
.srchead{background:var(--card);border:1px solid var(--line);border-radius:8px;padding:10px 14px;margin:4px 0 10px}
.srchead .t{font-size:16px;font-weight:650}
.srchead .m{color:var(--muted);font-size:13px;margin-top:2px}
article.m{background:var(--card);border:1px solid var(--line);border-radius:8px;padding:9px 13px;margin:0 0 9px}
article.m.hl{background:var(--hl)}
article.m .mh{display:flex;flex-wrap:wrap;gap:4px 8px;align-items:baseline}
article.m .loc{font-weight:650}
article.m .msrc{font-size:13.5px;margin-top:2px}
article.m p{margin:5px 0}
article.m p b{font-weight:600}
article.m .why{color:var(--muted)}
article.m .meta{font-size:12.5px;color:var(--muted);margin-top:5px}
article.m .meta a.road{display:inline-block;border:1px solid var(--line);border-radius:9px;padding:0 6px;margin:1px 2px}
article.m ul.reps{margin:3px 0 0;padding-left:18px;font-size:12.5px;color:var(--muted)}
button.more{display:block;margin:12px auto;padding:7px 18px;font-size:14px;border-radius:6px;border:1px solid var(--line);background:var(--card);color:var(--fg);cursor:pointer}
footer{padding:14px 24px 30px;border-top:1px solid var(--line);color:var(--muted);font-size:13px}
footer p{margin:5px 0;max-width:1000px}
@media (max-width:820px){#wrap{grid-template-columns:1fr}#index{position:static;max-height:42vh;border-right:0;border-bottom:1px solid var(--line)}#controls{position:static}}
</style>
</head>
<body>
<header>
<h1>Errata in published sources</h1>
<div class="warn" role="alert">WARNING: everything on this page is PROVISIONAL. These mistakes were recorded by AI reviewers while checking roadmaps against the sources; NONE of them has been verified in Lean yet, and some may be wrong. Treat every entry as a claim to be checked, not as an established erratum.<small>Once the corresponding results are formalised in Lean the page will be updated to mark which entries are confirmed.</small></div>
<div class="totals" id="totals">__HEADLINE__</div>
<div class="sub">Generated __GENERATED__. Mistakes that Tau Ceti workers recorded in papers, books and notes while building roadmaps.</div>
<div class="sub">Data: the board register (<code>errata/source-issues.json</code>, <code>errata/REGISTER.md</code>) and the explorer's legacy register (<code>errata/explorer/source-issues.json.gz</code>, to 2026-10-21), both in TauCetiProject/TauCetiRoadmapJobs at <code>__BOARDREV__</code>; duplicates merged. <a href="../">Tau Ceti explorer</a> · <a href="README.md">about this page</a></div>
</header>
<div id="controls">
<input id="q" type="search" placeholder="Search source, locator or description…" autocomplete="off" aria-label="Search">
<label class="kchip"><input type="checkbox" id="k0" checked><span class="badge k0">Error</span> <span id="n0"></span></label>
<label class="kchip"><input type="checkbox" id="k1" checked><span class="badge k1">Gap</span> <span id="n1"></span></label>
<label class="kchip"><input type="checkbox" id="k2" checked><span class="badge k2">Misprint</span> <span id="n2"></span></label>
<select id="road" aria-label="Roadmap"><option value="-1">All roadmaps</option></select>
<select id="origin" aria-label="Register"><option value="all">Both registers</option><option value="board">Board register</option><option value="legacy">Legacy explorer register</option></select>
<select id="view" aria-label="Order"><option value="paper">By paper, then locator</option><option value="serious">Most serious first</option></select>
<label><input type="checkbox" id="rev"> hide entries awaiting review</label>
<div id="status">Loading…</div>
</div>
<section id="serious">
<h2>Most serious</h2>
<p class="note">Errors (false statements or false proof steps) first, then gaps, ranked by the number of independent reports, then by whether the locator is a theorem, proposition, lemma, corollary or claim rather than a remark or example, then by what the mistake affects. The top 50; <a href="#v=serious&amp;k=EG" id="fulllist">the full ranked list</a>.</p>
<ol class="top" id="top"></ol>
</section>
<div id="wrap">
<nav id="index" aria-label="Sources"><h2>Sources <span id="nsrc"></span></h2><ul id="srcs"></ul></nav>
<div id="main"><div id="head"></div><div id="list"></div></div>
</div>
<footer id="about">
<p><b>Kinds.</b> An <b>error</b> is a false statement or a false step in a proof; a <b>gap</b> is a step the source does not justify; a <b>misprint</b> is a slip whose intended meaning is clear. Legacy synonyms (typo, omission and the like) are mapped onto these three.</p>
<p><b>Merging.</b> Entries that record the same mistake (same source, same locator, near-identical description, or the same legacy record kept in several files) are shown once; "<i>n</i> reports" counts the independent reports (distinct review comments, errata jobs or explorer jobs). Sources are identified across citations by arXiv identifier, DOI or title; a source cited only by a roadmap-local key is listed under that key and roadmap.</p>
<p><b>Text.</b> Descriptions are the registers' own words as recorded by the reviewers; the sources themselves are not quoted here. "As printed" says what the source states, "Should be" the correction, "Why" the reason (legacy entries). Legacy entries that a review rejected are left out; those still awaiting review are marked.</p>
<p id="counts"></p>
</footer>
__DATA_SCRIPT__
<script>
(function () {
'use strict';
var KN = ['Error', 'Gap', 'Misprint'], KL = 'EGM', AFF = ['', 'nothing', 'the proof', 'a stated result'], PAGE = 100;
var D, S, E, R, hay, shay, rankPos, roadCount, slugIndex, st, timer = null;
function $(id) { return document.getElementById(id); }
function esc(s) {
  return String(s == null ? '' : s).replace(/[&<>"']/g, function (c) {
    return {'&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;'}[c];
  });
}
function fold(s) { return String(s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase(); }
function fmt(n) { return Number(n).toLocaleString('en-US'); }
function plural(n, w) { return fmt(n) + ' ' + w + (n === 1 ? '' : 's'); }
function trunc(s, n) { s = String(s || ''); return s.length > n ? s.slice(0, n - 1).replace(/\s+\S*$/, '') + '…' : s; }

function boot(data) {
  D = data; S = D.S; E = D.E; R = D.R;
  shay = S.map(function (s) { return fold([s[0], s[1], s[2], s[3], s[4], s[5], (s[7] || []).join(' ')].join(' ')); });
  hay = E.map(function (e) { return fold(e[1] + ' ' + e[3] + ' ' + e[4] + ' ' + e[5] + ' ' + e[7]); });
  rankPos = new Int32Array(E.length);
  D.rank.forEach(function (i, p) { rankPos[i] = p; });
  roadCount = R.map(function () { return 0; });
  E.forEach(function (e) { e[8].forEach(function (r) { roadCount[r]++; }); });
  slugIndex = {};
  S.forEach(function (s, i) { slugIndex[s[8]] = i; });
  var sel = $('road'), opts = [];
  R.forEach(function (r, i) { opts.push('<option value="' + i + '">' + esc(r) + ' (' + fmt(roadCount[i]) + ')</option>'); });
  sel.insertAdjacentHTML('beforeend', opts.join(''));
  st = {q: '', terms: [], kinds: [true, true, true], road: -1, origin: 'all', src: -1, view: 'paper', rev: false,
        limit: PAGE, focus: -1};
  readHash();
  renderTop();
  bind();
  syncControls();
  update();
  var c = D.meta.counts || {}, dr = c.dropped || {}, parts = [];
  Object.keys(dr).forEach(function (k) { parts.push(fmt(dr[k]) + ' ' + k.replace(/^[a-z]+: /, '') + ' (' + k.split(':')[0] + ')'); });
  $('counts').innerHTML = '<b>Counts.</b> ' + fmt(c.boardEntries) + ' board entries and ' + fmt(c.legacyEntries) +
    ' legacy entries read; ' + fmt(c.boardKept) + ' and ' + fmt(c.legacyKept) + ' kept' +
    (parts.length ? ' (left out: ' + esc(parts.join('; ')) + ')' : '') + '; merged into ' + fmt(D.meta.mistakes) +
    ' mistakes in ' + fmt(D.meta.sources) + ' sources. Board register scanned to ' + esc(D.meta.boardScanned) +
    '; board commit ' + esc(D.meta.boardRev) + ' of ' + esc(D.meta.boardDate) + '.';
}

function readHash() {
  var h = location.hash.replace(/^#/, '');
  if (!h) return;
  var p = new URLSearchParams(h);
  if (p.has('q')) { st.q = p.get('q'); }
  if (p.has('k')) { var k = p.get('k').toUpperCase(); st.kinds = [k.indexOf('E') >= 0, k.indexOf('G') >= 0, k.indexOf('M') >= 0]; }
  if (p.has('r')) { var ri = R.indexOf(p.get('r')); st.road = ri; }
  if (p.has('o')) { var o = p.get('o'); if (o === 'board' || o === 'legacy') st.origin = o; }
  if (p.has('s')) { var si = slugIndex[p.get('s')]; st.src = si === undefined ? -1 : si; }
  if (p.get('v') === 'serious') st.view = 'serious';
  if (p.get('rev') === '1') st.rev = true;
  st.terms = terms(st.q);
}
function writeHash() {
  var p = new URLSearchParams();
  if (st.q) p.set('q', st.q);
  if (!(st.kinds[0] && st.kinds[1] && st.kinds[2])) p.set('k', KL.split('').filter(function (c, i) { return st.kinds[i]; }).join(''));
  if (st.road >= 0) p.set('r', R[st.road]);
  if (st.origin !== 'all') p.set('o', st.origin);
  if (st.src >= 0) p.set('s', S[st.src][8]);
  if (st.view === 'serious') p.set('v', 'serious');
  if (st.rev) p.set('rev', '1');
  var s = p.toString();
  history.replaceState(null, '', s ? '#' + s : location.pathname + location.search);
}
function terms(q) { return fold(q).split(/\s+/).filter(Boolean); }
function syncControls() {
  $('q').value = st.q;
  for (var k = 0; k < 3; k++) $('k' + k).checked = st.kinds[k];
  $('road').value = String(st.road);
  $('origin').value = st.origin;
  $('view').value = st.view;
  $('rev').checked = st.rev;
}

function bind() {
  $('q').addEventListener('input', function () {
    clearTimeout(timer);
    timer = setTimeout(function () { st.q = $('q').value; st.terms = terms(st.q); st.limit = PAGE; update(); }, 140);
  });
  [0, 1, 2].forEach(function (k) {
    $('k' + k).addEventListener('change', function () { st.kinds[k] = this.checked; st.limit = PAGE; update(); });
  });
  $('road').addEventListener('change', function () { st.road = parseInt(this.value, 10); st.limit = PAGE; update(); });
  $('origin').addEventListener('change', function () { st.origin = this.value; st.limit = PAGE; update(); });
  $('view').addEventListener('change', function () { st.view = this.value; st.limit = PAGE; update(); });
  $('rev').addEventListener('change', function () { st.rev = this.checked; st.limit = PAGE; update(); });
  $('fulllist').addEventListener('click', function (ev) {
    ev.preventDefault();
    st.view = 'serious'; st.kinds = [true, true, false]; st.src = -1; st.q = ''; st.terms = []; st.limit = PAGE; st.focus = -1;
    syncControls(); update(); $('wrap').scrollIntoView();
  });
  document.body.addEventListener('click', function (ev) {
    var a = ev.target.closest('[data-s],[data-r],[data-i],[data-more]');
    if (!a) return;
    ev.preventDefault();
    if (a.hasAttribute('data-more')) { st.limit += 4 * PAGE; update(true); return; }
    if (a.hasAttribute('data-r')) { st.road = parseInt(a.getAttribute('data-r'), 10); st.limit = PAGE; syncControls(); update(); return; }
    if (a.hasAttribute('data-i')) {
      var i = parseInt(a.getAttribute('data-i'), 10);
      st.src = E[i][0]; st.q = ''; st.terms = []; st.road = -1; st.origin = 'all'; st.rev = false;
      st.kinds[E[i][2]] = true; st.view = 'paper'; st.focus = i; st.limit = PAGE;
      syncControls(); update(); return;
    }
    var s = parseInt(a.getAttribute('data-s'), 10);
    st.src = (s === st.src && a.closest('#srcs')) ? -1 : s; st.limit = PAGE; st.focus = -1;
    update();
    if (st.src >= 0 && !a.closest('#srcs')) $('wrap').scrollIntoView();
  });
  window.addEventListener('resize', setCtl);
  setCtl();
}
function setCtl() { document.documentElement.style.setProperty('--ctl', $('controls').offsetHeight + 'px'); }

function matchBase(i) {
  var e = E[i];
  if (st.road >= 0 && e[8].indexOf(st.road) < 0) return false;
  if (st.origin === 'board' && !(e[11] & 2)) return false;
  if (st.origin === 'legacy' && !(e[11] & 4)) return false;
  if (st.rev && (e[11] & 1)) return false;
  for (var t = 0; t < st.terms.length; t++) {
    var w = st.terms[t];
    if (hay[i].indexOf(w) < 0 && shay[e[0]].indexOf(w) < 0) return false;
  }
  return true;
}

function update(keepScroll) {
  var kc = [0, 0, 0], sc = {}, nsrc = 0, base = [];
  for (var i = 0; i < E.length; i++) {
    if (!matchBase(i)) continue;
    var k = E[i][2];
    kc[k]++;
    if (!st.kinds[k]) continue;
    base.push(i);
    var s = E[i][0], c = sc[s];
    if (!c) { c = sc[s] = [0, 0, 0]; nsrc++; }
    c[k]++;
  }
  for (k = 0; k < 3; k++) $('n' + k).textContent = fmt(kc[k]);
  var list = st.src >= 0 ? base.filter(function (i) { return E[i][0] === st.src; }) : base;
  if (st.view === 'serious') list.sort(function (a, b) { return rankPos[a] - rankPos[b]; });
  if (st.focus >= 0) {
    var at = list.indexOf(st.focus);
    if (at >= st.limit) st.limit = at + PAGE;
  }
  var lk = [0, 0, 0];
  list.forEach(function (i) { lk[E[i][2]]++; });
  $('status').textContent = 'Showing ' + plural(list.length, 'mistake') + ' (' + fmt(lk[0]) + ' errors, ' + fmt(lk[1]) +
    ' gaps, ' + fmt(lk[2]) + ' misprints) ' + (st.src >= 0 ? 'in one source' : 'in ' + plural(nsrc, 'source')) +
    (st.view === 'serious' ? ', most serious first' : '') + '.';
  renderIndex(sc, nsrc);
  renderHead(list);
  renderList(list);
  writeHash();
  if (st.focus >= 0) {
    var el = document.querySelector('article[data-e="' + st.focus + '"]');
    if (el) { el.classList.add('hl'); el.scrollIntoView({block: 'center'}); }
    st.focus = -1;
  } else if (!keepScroll && st.src >= 0) {
    var cur = document.querySelector('#srcs li.sel');
    if (cur && cur.scrollIntoViewIfNeeded) cur.scrollIntoViewIfNeeded();
  }
}

function renderIndex(sc, nsrc) {
  var rows = Object.keys(sc).map(function (s) { var c = sc[s]; return [+s, c[0] + c[1] + c[2], c]; });
  rows.sort(function (a, b) { return b[1] - a[1] || a[0] - b[0]; });
  var h = ['<li data-s="-1" class="' + (st.src < 0 ? 'sel' : '') + '"><span class="sl"><b>All sources</b></span><span class="sc"></span></li>'];
  if (st.src >= 0 && !sc[st.src]) rows.unshift([st.src, 0, [0, 0, 0]]);
  rows.forEach(function (r) {
    var s = S[r[0]], c = r[2], kc = [];
    for (var k = 0; k < 3; k++) if (c[k]) kc.push('<b class="k' + k + '"></b>' + fmt(c[k]) + ' ' + KN[k].toLowerCase() + (c[k] === 1 ? '' : 's'));
    h.push('<li data-s="' + r[0] + '"' + (r[0] === st.src ? ' class="sel"' : '') + ' title="' + esc(s[0]) + '"><span class="sl">' +
      esc(s[0]) + '</span><span class="sc">' + fmt(r[1]) + '</span><span class="kc">' + kc.join('') + '</span></li>');
  });
  $('srcs').innerHTML = h.join('');
  $('nsrc').textContent = '(' + fmt(nsrc) + ')';
}

function renderHead(list) {
  if (st.src < 0) {
    $('head').innerHTML = '<h2>' + (st.view === 'serious' ? 'All mistakes, most serious first' : 'All mistakes, by paper and locator') + '</h2>';
    return;
  }
  var s = S[st.src], m = [], roads = {};
  if (s[2]) m.push(esc(s[2]));
  if (s[1] && s[1] !== s[0]) m.push('<i>' + esc(s[1]) + '</i>');
  if (s[5]) m.push(esc(s[5]));
  if (s[3]) m.push('<a href="https://arxiv.org/abs/' + encodeURI(s[3]) + '">arXiv:' + esc(s[3]) + '</a>');
  if (s[4]) m.push('<a href="https://doi.org/' + encodeURI(s[4]) + '">doi:' + esc(s[4]) + '</a>');
  list.forEach(function (i) { E[i][8].forEach(function (r) { roads[r] = 1; }); });
  var rn = Object.keys(roads).map(function (r) { return '<a href="#" class="road" data-r="' + r + '">' + esc(R[r]) + '</a>'; });
  $('head').innerHTML = '<div class="srchead"><div class="t">' + esc(s[0]) + '</div>' +
    (m.length ? '<div class="m">' + m.join(' · ') + '</div>' : '') +
    (s[7] && s[7].length ? '<div class="m">Cited as: ' + s[7].slice(0, 6).map(esc).join('; ') + '</div>' : '') +
    (rn.length ? '<div class="m">Roadmaps: ' + rn.join(' ') + '</div>' : '') +
    '<div class="m"><a href="#" data-s="-1">← all sources</a></div></div>';
}

function card(i, showSrc) {
  var e = E[i], s = S[e[0]];
  var h = '<article class="m" data-e="' + i + '"><div class="mh"><span class="badge k' + e[2] + '">' + KN[e[2]] + '</span>' +
    '<span class="loc">' + esc(e[1] || '(no locator given)') + '</span>';
  if (e[9] > 1) h += '<span class="nrep" title="independent reports of this mistake">' + e[9] + ' reports</span>';
  if (e[11] & 1) h += '<span class="unrev" title="legacy entry still awaiting review">awaiting review</span>';
  h += '</div>';
  if (showSrc) h += '<div class="msrc"><a href="#" data-s="' + e[0] + '">' + esc(s[0]) + '</a></div>';
  if (e[3]) h += '<p><b>As printed:</b> ' + esc(e[3]) + '</p>';
  if (e[4]) h += '<p><b>Should be:</b> ' + esc(e[4]) + '</p>';
  if (e[5]) h += '<p class="why"><b>Why:</b> ' + esc(e[5]) + '</p>';
  var meta = [];
  if (e[6]) meta.push('Affects ' + esc(AFF[e[6]]));
  if (e[7]) meta.push('Note: ' + esc(e[7]));
  if (e[8].length) meta.push('Roadmap' + (e[8].length > 1 ? 's' : '') + ': ' + e[8].map(function (r) {
    return '<a href="#" class="road" data-r="' + r + '">' + esc(R[r]) + '</a>'; }).join(''));
  if (meta.length) h += '<div class="meta">' + meta.join(' · ') + '</div>';
  h += '<ul class="reps">' + e[10].map(function (r) {
    var lab = esc(r[1]), url = r[2];
    var link = url ? '<a href="' + esc(url) + '">' + lab + '</a>' : lab;
    return '<li>' + (r[0] ? 'Explorer: ' : 'Board: ') + link + (r[4] ? ', ' + esc(r[4]) : '') + (r[3] ? ', ' + esc(r[3]) : '') + '</li>';
  }).join('') + '</ul></article>';
  return h;
}

function renderList(list) {
  var n = Math.min(list.length, st.limit), h = [];
  var showSrc = st.src < 0;
  for (var j = 0; j < n; j++) h.push(card(list[j], showSrc));
  if (!list.length) h.push('<p>No mistake matches these filters.</p>');
  if (list.length > n) h.push('<button class="more" data-more="1">Show more (' + fmt(list.length - n) + ' left)</button>');
  $('list').innerHTML = h.join('');
}

function renderTop() {
  var h = [];
  D.rank.slice(0, 50).forEach(function (i) {
    var e = E[i], s = S[e[0]];
    h.push('<li><span class="badge k' + e[2] + '">' + KN[e[2]] + '</span> <a href="#" data-s="' + e[0] + '">' + esc(trunc(s[0], 90)) +
      '</a>, <b>' + esc(trunc(e[1], 90)) + '</b>: <span class="d">' + esc(trunc(e[3] || e[4], 230)) + '</span> ' +
      (e[9] > 1 ? '<span class="nrep">' + e[9] + ' reports</span> ' : '') + '<a href="#" data-i="' + i + '">details</a></li>');
  });
  $('top').innerHTML = h.join('');
}

window.ErrataPage = {boot: boot};
__LOADER__
})();
</script>
</body>
</html>
"""

if __name__ == "__main__":
    sys.exit(main())
