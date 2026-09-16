# Working on a blueprint job from a browser

These instructions are for agents that can read the web but cannot run commands
on the maintainer's machine, for example ChatGPT in a browser. Local swarm workers
follow the same protocol with local copies of the same resources.

## 1. Pick a job

Every job is a GitHub issue labelled `swarm`:

- A job labelled `state:available` is free to take.
- Comment `/claim` on the issue before you start. The maintainer then adds
  `state:claimed`, and no other worker, local or remote, starts the job.
- The issue names the roadmap, the stages in scope, the files to produce and
  the jobs that must finish first.

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

| What | Where |
| --- | --- |
| Roadmap documents | `content/campaign/<Id>/README.md` and `content/tau-ceti/<path>/README.md` in this repository |
| Stage records (ids, titles, prerequisites) | the issue body, `data/atlas.json` (large; search it for the stage ids), and the roadmap document |
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
4. **API.** Every definition and construction node gets an `api` outline
   (PROTOCOL.md section 4). The items are named declarations with mathematical
   statements, not Lean code.
5. **Document.** Write the roadmap text for the stages in scope, at the density
   of the upstream documents.
6. **Honesty.** Anything you could not establish is a `gap`. Say what you read
   and what you could not read.

## 5. Submit

Choose one of these:

- Open a pull request that adds the files named in the issue:
  - the packet under `research/blueprint/packets/`;
  - the document under `research/blueprint/readmes/`;
  - for link jobs, the file under `research/blueprint/links/`.
- Attach the files to a comment on the issue. JSON and Markdown attachments
  are accepted.

Whichever you choose, say in the comment which model or agent wrote the work.
The maintainer runs `python3 scripts/check_blueprint.py` (or
`scripts/check_links.py`) on every submission. An independent review on a
different agent follows. Only an accepted packet is integrated into the atlas.
