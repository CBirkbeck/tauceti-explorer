# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-H6SgR3`, 2026-10-10.
Claim confirmed by the bot in issue comment 6098097545. **This is an incomplete
package checkpoint, not a submission for package acceptance.**

## Saved work

- `research/blueprint/packages/InductionRestrictionPartII/README.md`: a standalone
  six-layer draft, approximately 101 KB. It preserves all 109 accepted targets:
  78 individually described targets and 31 marked-group certification targets
  in a table. All 124 API names and 96 test names from the accepted packet occur
  in the README. Same-layer targets are ordered by prerequisites. Each target
  has a source locator and prerequisite list; the table shares its source and
  certification requirements. Introductory material fixes the integral/cohomological
  distinction, orientation, degree lattice, cover dependence, finite residue
  level, set action versus kernel automorphism, parity compatibility, and
  arithmetic consumer boundaries. The homological input contracts state the
  needed mathematics but cannot replace an assigned supplying layer.
- `research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`: the
  active native signatures from the input, consolidated into one import block,
  header, namespace, and noncomputable section. The input's long commented
  omission ledger is omitted from this package file; its authoritative copy
  remains in `research/blueprint/suggested/InductionRestrictionPartII.lean`.
  Seven additional admitted examples test split-extension commutators, the
  nonzero C₂² torus class, integral torus orientation, singleton and empty
  relation sets, C₃ inversion, and the odd-order square-class filtration.
  No source passage, private source file, executable finite certificate, or
  alleged proof was added.
- `metadata.toml` is deliberately absent. Its eventual content is
  `topic = "math.GR"`. The intake's `deliverables_complete` predicate treats a
  package as complete merely when its three files exist. Adding metadata now
  would incorrectly finish a job whose required signatures and dependency
  closure remain incomplete. Keep it absent until the continuation meets
  section 20.

The packet, legacy reader, original suggested file, queue, and other roadmaps
are unchanged. The accepted packet is authoritative where the older reader
disagrees with the independent review's corrections.

## Why this cannot be a complete package

The accepted packet's `gaps` explicitly contains two unassigned general inputs:

1. **Natural integral homological bridge — supplier unassigned.** Required are
   integral degree-two UCT for arbitrary abelian trivial-action kernels
   (including infinite kernels), naturality of its class map, evaluation of the
   oriented commuting cycle as a lift commutator, the central-extension
   homological five-term sequence, finiteness and group-order annihilation of
   positive integral homology through transfer, coprime degree-two LHS with the
   incoming d₃ differential, and the Ext¹-vanishing adapter for free abelian
   groups. This affects RS.1 reduced covers and homology images, RS.2 pullback
   splitting and comparison, RS.3 finite levels, RS.5 compatible covers, and
   RS.6 reductions. The packet expressly excludes assigning this general
   package to the parent Layer 7 and calls its continuation an ownership
   question. No current library or upstream roadmap supplying this full
   contract was found.
2. **Conjugacy of complements over a cyclic coprime quotient.** For finite H,C
   with coprime orders and cyclic C, complements to H in H⋊C must be H-conjugate.
   Mathlib's cited Schur–Zassenhaus theorem supplies existence, not this
   conjugacy statement. It is needed for RS.5 inertia-class bijections. The
   packet explicitly requests assignment of its general finite-group owner.

The issue permits no packet edits and requires that the README claim nothing
the accepted plan does not support. A complete package therefore needs a
maintainer ownership decision and a correspondingly corrected accepted plan;
silently enlarging the parent's scope or inventing a supplying roadmap would
violate its boundary. The front-matter contracts in the draft are requirements,
not claims that those suppliers exist or that their ownership has been resolved.

The parent Layer 7 still owns the ordinary-cover interface (central stem
surjection with oriented integral kernel identification). Such a carrier was
not found in the current library. This is an assigned planned dependency;
absence of its implementation alone is not a reason to reject a roadmap.
Likewise the finite table certificates are roadmap targets, not proofs that
this packaging job must implement. Their proposed native signatures still
require the cover and marked-group carriers. Do not demand actual certificate
proofs before packaging; do not substitute bare abstract group names for the
marked data in their statements.

## Validation and its limits

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

exited **0**, with **128 warnings, all `declaration uses sorry`**, and no errors
or other warnings. Available memory was 99 GB before the final run. It used the
provided shared build and its pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The wrapper identifies that build as
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; each of the cited Tau Ceti
baseline source modules was independently compared with `git show` at that pin
and matched. No build, update, cache fetch, language server, or compilation in
the read-only current roadmap environment was run.

This success validates **only the saved subset**, not the whole roadmap. A
static name inventory finds 87 named native declarations and 49 anonymous
examples, including 53 of the packet's 124 API names. Tests have comment labels,
not named Lean declarations. A name match does not establish full agreement
with the mathematical statement: for example the fiber product, square
obstruction, and rank count have generic algebraic signatures whose adapters
to actual cover coordinates remain to be supplied.

`python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
passed with **0 errors, 0 warnings**: 109 nodes, six planned stages, five gaps,
and one request. This is validation of the unchanged input, not evidence that
its acknowledged gaps are closed. Static README checks found all 109 targets,
124 API names and 96 test names, and no unmapped prerequisite prefix.

All 30 cited pinned baseline declarations were inspected. The reviewed
`data/library-coverage.json` has no direct InductionRestrictionPartII layer
entry; its related projective-representation audits agree with consuming
parent Layer 7 and the existing cohomological APIs. Current Tau Ceti was also
searched at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap main,
at `a7712b2de0fbbe57dc06903169fe84cc69cf71ab`, including the roadmaps
newer than the atlas snapshot, was checked read-only.
The full upstream InductionRestriction and SchurWeyl READMEs were read. No
integral arbitrary-kernel homological bridge or cyclic-complement conjugacy
supplier was located. Searches finding profinite cohomological five-term
results or injective-coefficient topological UCT do not supply these contracts.

## Sources and reproducibility

The prose follows the accepted packet's mathematical statements and locators,
not verbatim source excerpts. Spot checks on public PDFs covered EVW §§7.2–7.5,
the integral/cohomological comparison and marked universal object; Wood Table 2
and the order-96 sum-kernel embedding; and LWZB Lemma 12.10 and the subsequent
compatible-cover argument. This checkpoint does not claim a fresh independent
source review of all 109 targets. Public PDF downloads were confined to scratch:

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood, Duke (2019) | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| EVW, withdrawn v1 (2012) | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022) | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |
| LWZB published (2024) | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |

Wood's 2021 author copy at the cited Harvard `Publications/lifting.pdf` URL
returned HTTP 403, with and without its query string. Its locators were retained
from the accepted independent review, not independently rechecked in this run.
No restricted book copy was used. Scratch PDFs and logs are deleted after
submission; the checked commands, results, source identities and remaining
work are recorded here so the continuation does not depend on private paths.

## Where to resume

1. Resolve the two ownership assignments and amend/review the authoritative
   plan through an appropriately scoped job. Do not edit it within this issue.
   Replace the draft's homological input contracts with references to the
   resulting supplying layers and check their scope and upstream tier order.
2. Use the original suggested file's omission ledger as the remaining-name
   checklist. The saved native target names cover RS.1 lift commutators,
   commuting cycles, homological commutators, relations and quotient; RS.2
   marked extensions, presentations, centrality, degree, generic fiber product,
   correction and kernel; RS.3 finite powers and degree slices/fixed lattices;
   and RS.4 generic square obstruction, solvability, torsion filtration,
   threshold, joint parity map and rank count. RS.5 and RS.6 have no native
   target signatures in the saved file. Cover-specific RS.1–RS.4 interfaces,
   universal comparison, action/twist carriers, parity adapters, finite marked
   certificate data, and the remaining API/tests still need typing.
3. Preserve generation where abelianization and universal surjectivity require
   it; arbitrary abelian kernels in UCT; the distinction between M(G,c) and the
   infinite universal kernel; the inverse discrepancy in marking correction;
   class permutation rather than degree scaling; nonempty-fiber hypotheses;
   the incoming LHS differential; and the order-96 sum rather than difference
   condition. No new scope or ownership moves were made in this checkpoint.
4. Recheck unavailable source locators, finish every native signature and
   discriminating example, run the required Lean check, and add metadata only
   once the package is complete. Submit a continuation referencing #7592.

Submission validation: `python3 research/blueprint/intake.py check-files` passed
for the three changed files (0 problems); `git diff --cached --check` passed.
Only this issue’s deliverables and handoff are staged, with metadata absent.
