# PAPER-FU-24 handoff — partial checkpoint

Refs #1083. Agent: ChatGPT Pro. Session: `gpt-20260921-c74f2a`.

## Saved work

The two issue deliverables contain the section-complete draft inventory and its
routing analysis. There are 115 items: six pinned-library inputs, eleven planned
imports and 98 missing items, all routed exactly once. Three Part II proposals
separate integral enveloping algebra, noncommutative analytic distributions and
weight-aspect multiplicity. Two source routes reuse CC.2–6 and NE.0. The selected
proof-critical item graph has 157 edges and is acyclic.

The source is Fu arXiv:2201.11190v2 (15 February 2024), read in full through the
HTML text. Equation locators refer to that version: (33)–(34) free-module
sequences, (35)–(36) dimension shifting, (37) coefficient comparison, (38) global
spectral sequence. Publisher metadata, selected auxiliary passages and available
page images were checked. The report records exact access limitations.

## Resume here

1. Archive the original Fu source bytes and SHA-256. Download attempts in this
   session failed; `source.sha256` is intentionally null. Collate the Annals
   article with v2, including diagrams/pages whose screenshot requests failed.
2. Read full `data/library-coverage.json` and search all relevant packets and
   reserved IDs. The oversized file exceeded the browser reader limit. Accepted
   LA audit material, CC decomposition, named roadmap texts and narrow pinned
   Lean sources were used instead. Check every provisional missing/planned
   classification and the three new IDs against the current atlas.
3. Audit source issues S1–S5 in the report: cuspidal versus compact support;
   weighted-c0 versus bounded completion; all-integral central characters;
   unramified microlocal denominators; separated quotient topology and topological
   PBW. Preserve the extra boundary and scalar-extension proof obligations rather
   than deleting source assertions. S6 records weight indices and asymptotic
   conventions. In particular retain the arbitrary-radius theorem for review
   even where the present proof route uses rational radii.
4. Acquire exact primary statements for Frommer/Kohlhaase, AB07 Corollary 5.4,
   ST02a/ST02b and Venjakob. AB07 is *Primeness, semiprimeness and localisation in
   Iwasawa algebras*, not the survey. FGT supplies a suitable-level lower bound;
   the upper bound alone is not sharpness at every adelic level.
5. Run the full `python3 scripts/check_paper.py
   research/blueprint/papers/PAPER-FU-24.result.json` and reconcile any current
   stage renamings. Only after the remaining source and coverage tasks are done
   should the job be marked complete and sent for independent review.

## Validation and boundaries

Local JSON/ID/route checks and the selected item DAG passed. The copied repository
checker function passed with the explicitly inspected roadmap/stage map; the
complete atlas loader was not available locally. No Lean file was requested or
compiled. No full-atlas dependency or independent mathematical certificate is
claimed. The six library items cite declarations read at Mathlib `082e2d3` and
Tau Ceti `f790474`. The audit snapshot is explorer `5b3798c`.

This is a checkpoint submission, not an accepted restructuring or design. The
intake workflow should release the issue after merging it. The worker has not
edited the atlas, other issues' files, roadmap documents, labels or issue state.
