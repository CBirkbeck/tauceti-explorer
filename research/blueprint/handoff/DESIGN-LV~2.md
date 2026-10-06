# DESIGN-LV~2 — revision of the Lawrence–Venkatesh roadmap

Issue: #6377. Agent: Codex. Session: codex-5NH7Bo. Date: 2026-10-06.

This is a finished target-level planning pass under PROTOCOL §0, submitted for a new independent review. The packet is `complete`; LV.0 through LV.11 are all `planned`. None is `closed`. Every implementation status remains `unchecked`. The historical independent `review` and `reviewAudit` objects are unchanged, and all 132 original node IDs remain.

## What changed

The revised packet has 146 nodes: 22 definitions, 11 constructions, 82 lemmas, 30 theorems and one comparison. It has 255 API items, 99 mathematical tests, 39 planets, 95 pinned declaration citations, 76 supplier requests and 75 exact gaps. The gap count includes 31 definition/API signature groups and twelve named-theorem signature groups; these identify unavailable interfaces rather than asserting mathematical counterexamples.

- Split the étale tensor algebra isomorphism from module/idempotent splitting. Added the two-factor Lie Goursat dichotomy and classification of ideals in finite products of simple Lie algebras, with their explicit proofs.
- Separated the bare surface carrier, oriented simple-curve quotient and surface homology/classification consequences. Added the freely readable Gallier–Xu classification proof source and checked its bytes. Its triangulation appendix treats closed surfaces and invokes Jordan–Schönflies; collars, smoothing and the boundary extension remain exact owner contracts.
- Pinned point-pushing to `FundamentalGroup.mul_def` and retained the reviewed transvection parameter −q, using the base twist exponent q−1. The annulus/isotopy interface must certify the positive-twist boundary labelling.
- Split the five symplectic basis, dimension, transitivity and chart targets. The period variety retains componentwise E-rank, the crystalline similitude hypothesis and the reviewed integral-cohomology/polarization restrictions.
- Separated the primitive kernel from the transfer/complement theorem and liftability from its monodromy theorem. Added the primitive integral covector lift for rank at least two, signed primitive rational spanning, and simultaneous primitive intersection avoidance. Retained the corrected Schreier argument at the abelianization level. The distinguishing-curve disjoint-arc realization remains an explicit gap.
- Reworked the semisimple trace argument through the finite-dimensional faithful image algebra, without pretending that an infinite group algebra is finite-dimensional.
- Restored all direct upstream-stage prerequisite edges: the current checker recognizes them. Removed the obsolete checker-encoding gap.
- Narrowed current-stage supplier imports, named the beyond-stage extensions and attached exact gaps. Retargeted Serre duality to JacobianChallenge B, requested the AlgebraicCurves Layer-12 function-field/coherent-genus comparison, proper-smooth finite-coefficient base change, and LPV.5’s generic square-zero generation theorem. Imported ArithmeticDynamics’ existing ℚ_p Strassmann node and proposed its finite-extension extension.
- Replaced generic “no owner” claims with pending Part II proposals for GeometricTopology, AlgebraicTopology, ReductiveGroups and the relevant scheme, moduli, representation and cohomology owners. Existing upstream roadmaps and other packets were not changed. Current LV IDs remain until the orchestrator accepts transfers.
- Regenerated the reader and roadmap descriptions from the revised mathematical inventory. The roadmap’s embedded reader equals the standalone reader, and its area is `arithmeticgeometry`.

## Suggested Lean and checks

`lean-check research/blueprint/suggested/MordellLawrenceVenkatesh.lean` succeeds with only expected incomplete-proof warnings. The shared Mathlib build is at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared Tau Ceti checkout is newer than `f790474821cf4256814db967cb154e7af3d0c369`; the file imports no Tau Ceti modules, so this does not claim elaboration of Tau-dependent interfaces at the pin.

The file uses actual affine equivalences, Weierstrass curves, semilinear maps, bilinear forms, transvections, CM predicates, finite filtrations, permutations, group homomorphisms and linear kernels. It contains 27 labelled examples and additional meaningful checks, plus four new theorem forms: the semisimple trace criterion, primitive integral lift, signed primitive spanning and intersection avoidance. Every API/test is annotated `stated`, `partial` or `omitted` in the packet. The comment ledger names every omitted interface. Comments are not counted as declarations. Missing conditions are not encoded as arbitrary proposition fields or assumed theorem results.

The packet checker reports zero errors and zero warnings. Validation also checks JSON, acyclicity, three tests per definition/construction, planet limits, preservation of review objects and original IDs, all ten source hashes, agreement between packet and reader, and the suggested-signature inventory. Submission file checks cover only the five authorized deliverables and contain no private paths. Independent arithmetic enumeration confirms the Aff(3) count 810/135 and the 24 generating pairs modulo six.

## What remains and where to resume

The packet’s `requests` entries LV-import-01 through LV-import-76 give the exact supplier statements, consumers, audited stage scope and required extensions. Its `gaps` and each stage’s transitive `coverage.remaining` list are the authoritative follow-up worklist; the reader repeats them. Do not treat stage prose or a requested declaration name as a proof certificate.

The next independent reviewer should check the fourteen new/split targets, the corrected sign/composition conventions, narrowed supplier contracts and Part II boundaries, and the exact stated/partial/omitted signature annotations. Follow-up owners must supply the algebraic closure/orbit/Lie and symplectic structure contracts; continuous Mackey/image-algebra and local-character interfaces; spreading/completion/dimension/normalization interfaces; componentwise Grassmannian schemes; surface triangulation/collars/asphericity/isotopy and branched transfer; relative norm-kernel identity components; prime-to-residue-characteristic H¹ freeness, Weil pairing and base change; and the precise residue-disk analytic and cohomology comparisons. The disjoint-arc realization and finite-extension Strassmann comparison require the identified geometric/analytic proof interfaces. Then add genuine signatures for the omitted scheme, cohomology and topological constructions and their tests. No stage can be marked closed before these requests and gaps are resolved.

## Sources

Re-read the LV Mordell route in arXiv v3 §§1–8; rechecked the recorded auxiliary passages in Brinon–Conrad, Farb–Margalit, Milne, SGA 1, Deligne’s Bourbaki 616 report, Faltings, Conrad’s Strassmann note and Berthelot–Ogus. Added Gallier–Xu Chapter 6 and Appendix E. All URLs, locators, access dates and SHA-256 hashes are in the packet. Corrected the Strassmann catalogue pagination to PDF pp. 6–8. The earlier source-issue records and their independent-review attribution remain intact; a fresh journal-edition errata search is not claimed. No unavailable private book was used.

All durable mathematical notes are in these deliverables. Scratch files are disposable and are removed after submission. No second job is claimed in this run.
