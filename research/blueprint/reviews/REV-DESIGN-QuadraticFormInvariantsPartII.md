# Independent review: Quadratic forms and cohomological invariants, Part II

**Verdict: accepted as a complete target-level planning pass.** Reviewer: Codex, session `codex-2Eek2q`, 2026-10-18. Job `REV-DESIGN-QuadraticFormInvariantsPartII`, issue #3598. This session did not write the original design.

The [packet](../packets/QuadraticFormInvariantsPartII.json), [roadmap](../roadmaps/QuadraticFormInvariantsPartII.json), [reader](../readmes/QuadraticFormInvariantsPartII.md) and [suggested file](../suggested/QuadraticFormInvariantsPartII.lean) agree after the corrections below. Every node has a separate verdict and reason in the packet's review object. Acceptance does not discharge its two explicit proof-input gaps or its supplier contracts. All implementation statuses remain unchecked.

## Inventory and coverage

| Item | Reviewed result |
| --- | ---: |
| Nodes | 47: 5 definitions, 10 constructions, 31 theorems, 1 application |
| Node verdicts | 32 verified, 15 corrected, 0 added, 0 unverifiable |
| Definition/construction API items | 65, previously 64 |
| Discriminating unit tests | 45; three for each of the 15 definitions/constructions |
| Planets | 31; at most five in any layer |
| Pinned baseline declarations | 14 confirmed; none removed |
| Supplier contracts | 18, previously 16 |
| Source findings | 4 independently confirmed |
| Stages | 8 planned, 0 closed |
| Open proof-input gaps | 2 |
| Routed items | All 30 assigned |

Every stated stage target has a node. Dependency chains are acyclic and end at the pinned libraries, a supplier node/contract or an explicit gap. The remaining-work lists include transitive obligations, including the two new parent-roadmap contracts. Target-level proof sketches retain their internal arguments rather than expanding them into unrelated lemma nodes.

## Corrections made

1. **Q2.0/binary; Q2.0/scalar-extension.** Located the binary nonsingularity criterion at EKM Proposition 7.19, pp.43–44, and scalar extension on p.42. The mixed term and even-dimensional comparison with Mathlib's `Nondegenerate` remain explicit. The suggested file now describes the binary block without presupposing its determinant condition and tests the second coordinate as well as the first.
2. **Q2.1/binary-tensor-roundness.** Explained the isotropic-round case in EKM Proposition 9.8, p.54: a nonsingular isotropic form is universal; roundness then supplies every similarity factor, so its binary tensor is hyperbolic. The original form itself need not be hyperbolic. The statement and acceptance condition now cover this case consistently.
3. **Q2.2/purely-transcendental-anisotropy.** Corrected Lemma 7.15 to EKM p.43 and specified the highest nonzero coefficient after clearing denominators.
4. **Q2.2/cassels-pfister; Q2.2/representation-theorem.** The constrained polynomial-representation statement starts with a given rational vector whose value and fixed polar pairing are polynomial. The remainder's orthogonality makes denominator-reducing reflection preserve both. The representation proof uses binary normal forms and reflection in the difference of equal-value vectors; it does not assume regularity of a polar complement. Locators now include EKM 7.29–7.31, pp.45–46, reflection identity (8.1), p.47, and 17.10–17.12, pp.73–74.
5. **Q2.2/quadratic-transfer.** Imported current `QuadraticMap.scharlauTransfer` and its polar identity through parent Layer 9, rather than planning a second quadratic constructor. Current Tau Ceti's `Transfer/Basic.lean:48–54,188–190` works in every characteristic; its Witt transfer and projection formula in `Transfer/Witt.lean:147,186–190` require invertibility of two. New work is the missing bilinear counterpart, characteristic-two Witt-module interface and norm-Pfister calculation. The API gains the bilinear constructor and records reuse of the quadratic one. A nonzero linear functional remains essential for inseparable extensions.
6. **Q2.2/odd-degree-anisotropy.** Supplied the minimal odd-degree counterexample argument: primitive coordinates give a nonzero polynomial value divisible by the minimal polynomial, and an odd-degree factor of the quotient yields a smaller counterexample. This covers inseparable simple extensions and towers. Removed the unnecessary Cassels–Pfister dependency.
7. **Q2.2/odd-divisor-specialization; Q2.2/quadratic-similarity.** Retained the unit in the local factor `uπ`, which may be absorbed into the uniformizer. Specified the multivariable leading-coefficient induction and made existence of the scalar multiplier explicit, as required by EKM Theorem 20.16, pp.86–87.
8. **Q2.3/unramified-witt-sheaves; Q2.3/odd-graded-comparison.** Expanded the Morel proof-input gap to include Arason's filtration-preserving transfer/functional-independence theorem and the quadratic-extension Milnor K generation used in Morel Theorem 2.11, pp.76–78. Purity, Rost/Gersten/homotopy infrastructure and prime-field computations remain listed precisely. Corrected the final comparison locator to Corollary 3.17, p.93. OVV Theorem 4.1 retains its characteristic-zero boundary.
9. **Q2.3/pfister-invariant.** Added parent Layer 7B as the direct supplier of the degree-two Kummer-cup/quaternion comparison. Layer 7A supplies coefficient/Kummer adapters. Neither comparison is re-planned here.
10. **Q2.5/kronecker-dimension; Q2.6/real-place-descent.** Corrected the dimension convention to Dittmann–Pop p.1. Made the transition maps between finite bad-real-place sets and the compatible-class continuity argument explicit. Corrected the finite-place comparison contract to include dyadic places; the local cohomological bound does not pass through a false global bound on a formally real field.

The roadmap descriptions, direct stage inputs, packet source matches, remaining-work lists and reader were synchronized. Source metadata now gives the correct Inventiones volume 222 for Benoist–Wittenberg. The routed level/cohomology equivalence has its actual source, Benoist, *On Hilbert's 17th problem in low degree*, Proposition 3.3, pp.939–940, including its smooth-integral real-closed-base and positive-weight hypotheses. No extra roadmap was created.

## Baseline and ownership audit

The source statements, including surrounding hypotheses, were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following fourteen entries are retained:

| Pinned declaration | Confirmed scope |
| --- | --- |
| `QuadraticMap.proj` | Coordinate monomial; supplies the binary polynomial |
| `QuadraticMap.polarBilin` | Polarization without dividing by two |
| `QuadraticMap.Anisotropic` | Zero value forces the vector to be zero |
| `QuadraticMap.Nondegenerate` | Quadratic radical condition and polar-kernel rank bound; even-dimensional agreement requires the parity argument |
| `QuadraticForm.dualProd` | Evaluation on dual × original module, including xy |
| `QuadraticMap.prod` | Orthogonal sum on the product module |
| `LinearMap.BilinForm` | Scalar-valued bilinear carrier |
| `MvPolynomial.IsHomogeneous` | Total homogeneous degree |
| `MvPolynomial.eval` | Polynomial evaluation |
| `Algebra.trdeg` | Cardinal transcendence degree, specialized to finite field transcendence degree |
| `char_dvd_card_solutions_of_sum_lt` | Finite-field zero-count divisibility at the strict degree bound |
| `QuadraticMap.Represents` | Ordinary representation, allowing zero |
| `QuadraticMap.IsRepresentedBy` | Injective quadratic isometry |
| `nonempty_sections_of_finite_inverse_system` | Finite nonempty inverse systems on a directed preorder; no surjective-transition hypothesis |

No baseline citation needed replacement. The last theorem's location is clarified as `CofilteredSystem.lean:111–113`. The [reviewed library audit](../../../data/library-coverage.json) and current upstream were checked separately from the pins. The current audit used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing odd-characteristic Witt/Pfister/transfer work, RealAlgebraicGeometry's ordering/real-closure substrate and AdicSpaces' patch topology are imported. The relevant parent and adjacent supplier statements and suggested interfaces were read; no upstream files were changed.

## Sources, gaps and maintainer decisions

The packet records public URLs, exact versions, printed-page locators and hashes for the seven source PDFs. Statements and corrections are in our own words. All four Dittmann–Pop findings were checked in arXiv v2: the bilinear outer-factor ambiguity (p.6), the formally real cohomological-dimension intermediary (p.7), subset-expansion signs (p.7), and the valuation-neighborhood typo (p.11). Their review objects say confirmed. No journal/preprint collation is claimed.

Two proof audits remain open. G1 is Kato's primary characteristic-two quadratic-Witt kernel proof: EKM Fact 16.2 verifies the target but does not supply that proof. G2 lists the external leaves in Morel's all-odd-characteristic proof. These are recorded gaps, including for their transitive consumers, rather than claims of closed proofs. Every definition/construction still has its usable API and three tests; missing carriers remain reader targets under the current compact suggested-file rule.

The maintainer must decide the proposed `QuadraticFormsRealFunctionFields` split. Its 15-item real-field assignment keeps conjectures as conjectures, imports shared C_i/Tsen–Lang from Q2.5 and current ordering infrastructure, and supplies rather than imports `RealSurfacePeriodIndex`. The remaining fifteen Dittmann–Pop items are assigned here. Future refinement should obtain the two primary proof audits and discharge the eighteen exact supplier contracts before calling any affected layer closed. No ownership move from an existing roadmap is proposed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/QuadraticFormInvariantsPartII.json`: zero errors and warnings after the final edits.
- `lean-check research/blueprint/suggested/QuadraticFormInvariantsPartII.lean`: exit zero at the pins; only sixteen `sorry` warnings. Both new definitions have real bodies; the file has 77 lines and no new heavy carrier.
- JSON parsing, complete per-node review coverage, source-finding verdicts, source metadata and reader synchronization, transitive remaining-work obligations, deliverable-path scope and `git diff --check` were checked.

This finishes the independent review job. It does not claim mathematical implementation or proof closure.
