# BP-DrinfeldModulesAndTModules--DM.8 handoff

Author of this continuation: Codex — codex-hNQyYt, 2026-10-10. Issue #1009.
The earlier fixed-vector checkpoint was by Codex — codex-hjdg0j. Its nine node
ids, mathematical statements, proof routes and native Lean signatures are
preserved. This submission is a **complete target-level planning pass**, with
DM.8 coverage **planned**, not closed. No implementation is claimed.

## Delivered

The packet has 48 nodes: 3 definitions, 8 constructions, 7 lemmas, 27 theorems
and 3 comparisons. Its eleven definitions/constructions have 43 API items and
33 named discriminating tests. There are six planets, 54 pinned baseline
declarations, eight supplier requests and three explicit gaps. All
`implementationStatus` values remain `unchecked`.

The 39 added nodes cover the analytic coefficient twist and exact constant
field; entire and restricted series; rigid triviality and the Betti comparison;
the actual rigid-trivial categories R and T; admissible difference fields,
fundamental matrices and solution rings; invariant-ideal descent, simplicity
and the solution torsor; relative algebraic closure, geometric integrality and
group smoothness; difference invariants and Tannakian identification; the
arithmetic estimates and full ABP lifting criterion; specialization rank and
bounded monomial spans; period transcendence degree; Carlitz logarithm
matrices, motive membership and Galois group; the linear-kernel argument,
logarithm relations and division-point reduction; Carlitz algebraic
independence; and constant common-denominator descent. The reader follows this
target chain rather than the order of a source.

All eleven definitions, all 43 API items and all 33 named definition tests have
native suggested Lean forms. Companion signatures cover matrix multiplication
under twisting, uniqueness among invertible fundamental matrices, and
finite-field scalar linearity of the logarithm deformation. The twelve
inherited fixed-vector acceptance examples remain. An additional rank-one
Carlitz acceptance signature includes exponential-zero periods. The file
contains 83 named declarations and 46 examples.

## Sources and existing work

Papanikolas, arXiv math/0506078v2, was read in full, pp.1–39, including the
target proof chains in §§2–6. Rendered pp.27–28 were also checked for the
algebraic-closure notation. Its SHA-256 is
`6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.
The six notation findings and correction-search evidence from the earlier
checkpoint are retained as that worker's evidence, pending independent
review. They are paraphrased rather than quoted. The published Papanikolas text
has not been collated; those findings remain scoped to the preprint.

The ABP source, arXiv math/0207168v1, was read through the full criterion proof
in §§2–3, pp.6–16, and Proposition 4.3.2, p.21. Routed shared inputs were
checked in Ngo Dac, HAL hal-03298790, printed pp.17–18 and 20–21;
Chang–Chen–Mishiba, arXiv 2205.09929v2, §4.1 p.13 and the proof of Lemma 5.1.1
pp.22–24; Im–Kim–Le–Ngo Dac–Pham, arXiv 2205.07165v2, §2.1/Theorem 2.2 p.26
and selected uses pp.27 and 33; and Chang–Papanikolas–Yu, arXiv 1411.0124v2,
Proposition 2.2.1 and its proof p.6. Exact versions, URLs, hashes and read ranges
are in the packet and reader. No restricted book was used. The routed
specialized multizeta constructions are not planned in DM.8.

AUDIT-20's reviewed DM.8 coverage, the campaign targets, supplier statements
and relevant roadmap links were checked. The 54 cited declaration statements
were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. This includes the native
geometrically-reduced Hopf-algebra smoothness theorem: geometric reducedness
alone is not a smoothness criterion for arbitrary schemes.

Current TauCetiRoadmap 070dc2becd74419e76303ede84b465ed4a69461f and Tau Ceti
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were inspected read-only. The current
GrothendieckEulerForms and JacobianChallenge readers were read in full as
models. Relevant current AdicSpaces and ReductiveGroupsPartII signatures were
checked. General Lang belongs to ReductiveGroupsPartII RG2.3.7; curve
Riemann–Roch belongs to JacobianChallenge; general preparation belongs to
AdicSpaces. Current Tate norm/completeness work postdates the pin and is
existing work. No new owner or tier move is proposed.

## Remaining boundaries

The next action is independent review of this completed planning pass. A
follow-up toward closure must preserve the target graph and resolve the three
recorded gaps:

1. **Particular logarithm-kernel separability.** Establish the Lie-algebra or
   separability verification for the scalar-action projection in Papanikolas
   Proposition 6.2.3, pp.35–36, before concluding that its kernel is a smooth
   vector subspace. Surjectivity between smooth groups alone is insufficient
   in characteristic p. The logarithm relation and independence nodes depend
   on this precise verification.
2. **Actual motive and neutral-category interfaces.** Consume DM.4's dual-σ
   pre-t-motive category, rationalization and scalar-extension interfaces, and
   MC.6's reconstruction over arbitrary fields. Reconcile the campaign τ
   convention with inverse coefficient Frobenius. Keep R distinct from the
   tensor-generated category T. MC.3's characteristic-zero interface does not
   apply to the imperfect field F_q(t).
3. **Analytic and dimension supplier matching.** Instantiate the existing
   restricted-series norm at the chosen DM.2 analytic fields; match
   AdicSpaces' preparation and bounded-disk zero estimates, FA.0's general
   separability/p-basis and curve-transport interfaces, and SF.1's affine
   descent and dimension/filtered-growth contracts. SF.3 and the current
   JacobianChallenge Riemann–Roch owner supply the divisor-space input.

The eight requests name concrete consumers and exact contracts in the packet
and reader. They are DM.2, DM.4, MC.6, FA.0, SF.3, SF.1, current AdicSpaces
layer 0, and current JacobianChallenge layer B. Generic theories are imported;
only their DM.8 specialization is planned here.

The suggested file explicitly omits supplier-dependent full signatures for
`tate_analytic_interface`, `twisting_limit`, `analytic_separability`, the
analytic fraction-field part of `analytic_fixed_fields`,
`fundamental_betti_basis`, `integral_trivialization`, `betti_exact_tensor`,
`neutral_category`, `relative_algebraic_closure`, `difference_invariants`,
`tannakian_identification`, `abp_estimates`, `logarithm_motive_membership`,
`carlitz_group`, `logarithm_group_linear`, `logarithm_linear_relations` and
`logarithm_division`. Its period theorem states the native function-field and
specialized-field transcendence equality, including t in the function-field
generators; the motivic-group dimension form awaits the category interface.
The denominator signature gives clearing by a nonzero constant-field
polynomial; the monic least-denominator strengthening needs the canonical
polynomial-denominator API. Every omitted mathematical target is fully stated
in the reader and packet. No opaque substitute types or unspecified
proposition fields were inserted.

## Verification

- Lean checking succeeded at the pinned shared build: zero errors and 118
  warnings, all placeholder-proof warnings. No build or language server was
  started. Suggested file SHA-256:
  `86db41fbd3762c4ea70000d0c48662ddc27e853c320c0e3d93cbed69effea48e`.
- The blueprint checker reports zero errors and zero warnings.
- Every reader target, definition API and named definition test was matched
  against the packet and suggested file. The nine inherited statement/proof
  contracts were checked against the checkpoint.
- Only this job's packet, reader, suggested file and handoff are submitted.
- Fresh main was checked before submission: the four job paths and the
  relevant supplier node statements are unchanged from the audited inputs.

The period and logarithm targets are planned with their complete hypotheses;
the stage is not closed, and no theorem in this submission is formalized.
