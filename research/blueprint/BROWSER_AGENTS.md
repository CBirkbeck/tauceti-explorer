# Working on a blueprint job from a browser

These instructions are for agents that can read the web but cannot run commands
on the maintainer's machine, for example ChatGPT in a browser. Local swarm workers
follow the same protocol with local copies of the same resources.

## 1. Pick a job

Every job is a GitHub issue labelled `swarm`. The issue names the roadmap, the
stages in scope, the files to produce and the jobs that must finish first. It
also carries the full instructions the local workers receive, with local paths
replaced by public resources.

The `state:` label says where the job stands:

| Label | Meaning |
| --- | --- |
| `state:available` | Free to take, once the jobs it depends on are done. |
| `state:claimed` | Claimed through a `/claim` comment; nobody else starts it. |
| `state:running` | A local swarm worker is on it. |
| `state:submitted` | Work is in and awaiting review or integration. |
| `state:done` | Reviewed and integrated. |

- To take a job, comment `/claim` on the issue, optionally followed by the
  agent's name, for example `/claim ChatGPT Pro`. A workflow then moves the
  issue to `state:claimed`, and local workers skip it.
- `/unclaim` releases a job you cannot finish.
- Jobs labelled `local-only` need files that only the maintainer's workers
  have.

## 2. Read the rules

- [PROTOCOL.md](PROTOCOL.md) is binding. It covers the baseline, granularity,
  the closure rule, API outlines, sources, the packet format, restructuring and
  links.
- [UPSTREAM_GUIDE.md](UPSTREAM_GUIDE.md) is Tau Ceti's checklist for writing a
  roadmap.
- `../expansion/PROTOCOL.md` sets out the source-faithfulness discipline.
- Read at least two upstream roadmap documents in or near the job's area,
  under `content/tau-ceti/`. For example: ModularForms, EllipticCurves,
  AdicSpaces and ModularCurves.

## 3. Resources

If a tool cannot open a file because it is too large, use the extracts in
`research/blueprint/atlas/`. They contain the same records as `data/atlas.json`
and are generated from it; every file is below 1 MB.


| What | Where |
| --- | --- |
| Roadmap documents | `content/campaign/<Id>/README.md` and `content/tau-ceti/<path>/README.md` in this repository |
| Stage records, descriptions and dependency edges | `research/blueprint/atlas/` (see its README): `roadmaps/<id>.json` for one roadmap, `index.json` for all roadmaps and stages, `areas/<area>-<n>.json` for catalogue-wide text search, `stage-edges.json` for every recorded link. `data/atlas.json` itself is about 14 MB and too large for GitHub's file readers. |
| Reviewed decompositions already integrated | `data/decompositions/<Id>.json` |
| Other blueprints and links | `research/blueprint/packets/`, `research/blueprint/links/`, `research/blueprint/reserved-ids.json` |
| Mathlib at the pinned commit | https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174 |
| Tau Ceti at the pinned commit | https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369 |
| Search | [Loogle](https://loogle.lean-lang.org), [LeanSearch](https://leansearch.net), the [Mathlib docs](https://leanprover-community.github.io/mathlib4_docs/), the [Tau Ceti docs](https://taucetiproject.github.io/TauCeti/docs/) |
| Subject classification | [zbMATH Open](https://zbmath.org) |

The docs and the search engines follow the current library, which may differ
from the pinned commits. Before citing a declaration, open its file at the
pinned commit on GitHub and read the statement there. The maintainer's private
reference library is not available to you, so cite public versions of every
source (arXiv, author pages, publishers) with a precise locator.

## 4. Method

1. **Targets.** List everything the stages in scope state. Each item becomes a
   node, and the node's `realises` field names its stage.
2. **Backward chaining.** For each node, write:
   - the exact statement, with all hypotheses;
   - the proof or construction, as steps;
   - every fact a step uses, in `prerequisites`.

   Each prerequisite must be one of four things:
   - a declaration at the pinned commit, read in the source and listed in
     `baseline.declarations`;
   - a node of another blueprint whose statement suffices;
   - another roadmap's stage, together with a `requests` entry;
   - a new node in your packet.

   Recurse until every chain ends in a declaration, another roadmap's node, a
   request or a recorded gap.
3. **Granularity.** One node is one library declaration. Split multi-part
   results. A non-routine step becomes its own lemma node.
4. **API and unit tests.** Every definition and construction node gets an
   `api` outline (PROTOCOL.md section 4) and at least three unit tests
   (section 12). The items are named declarations with mathematical
   statements. The suggested Lean file (section 13) turns them into
   signatures and `example`s proved by `sorry`; say in the handoff whether you
   could compile it. Mark the layer's key definitions and named theorems as
   planets (section 14).
5. **Document.** Write the roadmap text for the stages in scope, at the density
   of the upstream documents.
6. **Honesty.** Anything you could not establish is a `gap`. Say what you read
   and what you could not read.

## 5. Submit

Choose one of these:

- Open a pull request that adds the files named in the issue:
  - the packet under `research/blueprint/packets/`;
  - the document under `research/blueprint/readmes/`;
  - the suggested Lean file under `research/blueprint/suggested/`;
  - for link jobs, the file under `research/blueprint/links/`.
- Attach the files to a comment on the issue. JSON and Markdown attachments
  are accepted; attach the Lean file with a `.txt` extension added.

Whichever you choose, say in the comment which model or agent wrote the work.
A pull request is checked automatically against the pinned commits in
`research/blueprint/baseline.json`; the check's summary lists every error.
The maintainer runs `python3 scripts/check_blueprint.py` (or
`scripts/check_links.py`) on every submission. An independent review on a
different agent follows. Only an accepted packet is integrated into the atlas.

## 6. Other kinds of job

- **Review** (`kind:review`). Check another agent's work, named in the issue.
  You must not review your own work. Check:
  - every source locator and excerpt against the text;
  - every baseline declaration, in its Lean file at the pinned commit;
  - that every proof step follows from the node's prerequisites;
  - granularity;
  - that every definition's API outline is complete.

  Correct what is clearly wrong, and mark nodes you add with `addedBy`. Put a
  `review` object in the packet with the status `accepted` or `needs_changes`,
  and write your report to `research/blueprint/reviews/<JOB>.md`.
- **Links** (`kind:link`). Map one upstream roadmap against every other
  roadmap (PROTOCOL.md section 10):
  - record each prerequisite link with two verbatim quotes, one showing the
    output and one showing the use;
  - record each overlap with a recommendation to merge, rescope or keep;
  - list every roadmap you read.

  Write the result to `research/blueprint/links/<file>.json`.
- **New roadmap** (`kind:design`). Write the roadmap definition (PROTOCOL.md
  section 7), then its complete blueprint and document. The issue gives the
  topic and the sources.
- **Assembly** (`kind:assembly`). Join the reviewed parts of one roadmap into a
  single document. It needs an introduction covering purpose, scope,
  boundaries, conventions and sources. Reconcile references between parts.
- **Plan** (`kind:plan`). Structural planning from primary sources. The Habiro
  plan relies on course notes that only the maintainer's workers have, so it is
  marked `local-only`.
- **Classification** (`kind:classify`, local-only). These jobs need the zbMATH
  Open API, which browser sessions cannot reach, so the local workers do them.
  For each roadmap listed, the job must:
  - find its principal references and their MSC 2020 codes on zbMATH Open;
  - assign a cluster;
  - estimate its distance from Mathlib on a scale of 0 to 10, with evidence.

  The output format is in the issue.
- **Planet names** (`kind:naming`). For each extracted planet in
  `research/expansion/naming/<JOB>.json`, decide `keep`, `name` or `drop`,
  following the rules in the issue.

