# BP-DeformationAndDerivedPatchingAlgebra--R03.6 continuation

Codex — codex-hjdg0j, 26 September 2026. **Status: partial.** This checkpoint corrects four existing nodes and
their document/signatures. It preserves every node ID, both definitions and their APIs, eighteen other node
objects, all 71 inherited baseline citations, and both inherited source findings. It is not an independent
review of the whole earlier packet.

## Changes

- The assembled support theorem is a conditional implication for a finite module with explicit depth,
  quotient, augmentation and ring-action data. It does not need a construction of a patched module as a
  prerequisite. Calegari–Geraghty Theorem 6.3 and its proof supply those data for the top cohomology of the
  patched complex in **P8**. The earlier R03.5 import incorrectly identified that source construction.
  R03.5 still owns module patching; P9 still owns complex-support/comparison results. No supplier's
  construction has been copied into R03.6, and no reverse prerequisite on P8/P9 has been introduced.
- The associated-prime depth bound now names the exact integrated R03.3 node
  `depth-auslander-buchsbaum-and-dimension-bounds`, whose statement and hypotheses explicitly provide it.
  This does not claim all the mathematics in that aggregate has a declaration-sized blueprint.
- Two alleged upstream needs already exist in pinned Mathlib: `associatedPrimes.nonempty`, and
  `ringKrullDim_lt_top` with the Noetherian-local instance in `Ideal/KrullsHeightTheorem.lean`.
  Their statements/proofs and the instance were read at the pin. Source blobs were verified against the
  pinned Git tree. Separate Lean proofs check both uses without adding axioms or new library declarations.
- `free_of_patching` now assumes the quotient ring R is nonzero before concluding that H is nonzero.
  A field modulo the unit ideal gives a zero quotient even when the original free module is nonzero.
  The assembled theorem's existing H ≠ 0 hypothesis supplies R ≠ 0.
- The assembled prose statement now explicitly requires R → T surjective, as its Lean signature already
  did. The diagonal k → k × k is faithful on H = k × k but is not surjective. Two additional acceptance
  examples record these defects; their assertions were also proved in scratch Lean without `sorry`.
  These are packet defects, not new claims of errors in the papers.

## Exact remaining imports

Two explicit gaps replace the former broad remaining lists. Both belong to the same roadmap's R03.3;
there are no cross-roadmap requests.

1. A nonzero finite module of maximal depth over a regular local ring is free: Stacks 00O7 with e = d,
   used by `patching-free-conclusion`. The current integrated depth node supplies ingredients but does
   not explicitly export this conclusion. Its future blueprint must supply the exact regular-module
   statement before the remaining stage prerequisite is replaced.
2. For a Noetherian local ring, catenarity is equivalent to p ↦ dim A/p being a dimension function:
   Stacks 0ECF, used by `nearly-faithful-lift-from-special-fibre`. The suggested file assumes the
   dimension-function condition directly. It does not formalise this equivalence.

The next continuation should resolve these two precise imports at their owner, replace the two raw
R03.3 stage edges by the supplying node IDs, and check the resulting graph. It should not recreate
depth theory, catenarity or a patched complex in this packet. Conditional algebra is distinguished
from verifying that a particular arithmetic patching system supplies its hypotheses.

## Evidence and scope of reading

Fresh source reading for this continuation:

- [Calegari–Geraghty, published article](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), PDF 90–94:
  Theorem 6.3 and its complete proof, Theorem 6.4 and its complete proof, Remark 6.5.
  SHA-256 `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`.
- [Authors' correction](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf), both pages,
  including the completed group ring and framing power-series corrections.
  SHA-256 `c60cfe362940e641ee2cd60c61c1429961f18d3d16b4a6857df4ea7993111ee7`.
- [Taylor, journal version](https://www.numdam.org/article/PMIHES_2008__108__183_0.pdf), PDF 5–6,
  printed 187–188: Definition 2.1 and Lemmas 2.2–2.3 with proofs.
  SHA-256 `f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc`.
- Stacks [0BK4](https://stacks.math.columbia.edu/tag/0BK4),
  [00O7](https://stacks.math.columbia.edu/tag/00O7) and
  [0ECF](https://stacks.math.columbia.edu/tag/0ECF), statements and proofs. The packet records current
  URLs, access date and hashes; its broader inherited reading logs are preserved as inherited evidence.

The two published-source findings are unchanged. `sourceVersions` now identifies the three journal
texts above. No fresh all-paper errata search or full rereading of Kisin, Khare–Wintenberger or ACC+ is
claimed. The audited R03.6 row of AUDIT-17 and accepted RS-08 ownership decisions were checked; the
R03.3 depth node and P8 patching node were read for the contracts used here. The already-read upstream
GrothendieckEulerForms and JacobianChallenge documents were byte-identical to those used in this session.

## Validation

- Indexed blueprint check: **0 errors, 0 warnings** against the pinned declaration index.
- Suggested file: **compiled**, Lean 4.34.0-rc2 against Mathlib 082e2d3; 2,322 reached Mathlib source files
  were checked identical to the pinned sources before using the build cache. No Tau Ceti module is
  imported by this file. **83 warnings, all `declaration uses sorry`; zero errors.** No formalisation claim.
- All **73** baseline names resolved in Lean. Two baseline-instance uses and the two counterexample
  assertions were separately proved without `sorry` in scratch space.
- The internal prerequisite graph is acyclic. The new external node is the existing R03.3 depth node;
  no P8/P9 construction edge is introduced. This is not a claim to have repaired the global atlas graph.
- Counts: **22 nodes** (2 definitions, 13 lemmas, 7 theorems), **19 API items**, **11 definition unit
  tests plus 2 added theorem acceptance tests**, **6 planets**, **73 baseline declarations**, **2 gaps**,
  **0 requests**. All implementation statuses remain `unchecked`.
