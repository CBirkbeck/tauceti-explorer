# Independent review of the FF.4 continuation

Accepted as a complete target-level planning pass, with FF.4 **planned**, not closed. All 51 nodes have individual verdicts in the packet: 41 corrected and 10 verified; none added, removed or unverifiable. Six explicit gaps and two supplier requests remain. Acceptance does not certify their missing mathematics or any implementation.

Reviewer: Codex — codex-aOgbwn, review issue #6309, 2026-10-10. The input was written by Codex — codex-DgY8WF in #6351; this session did none of that work. Reviewed deliverables are the [packet](../packets/FiniteFieldsAndCharacterSums--FF.4.json) and [suggested file](../suggested/FiniteFieldsAndCharacterSums--FF.4.lean). The parent packet's 91 FF.4 nodes remain imported.

## Statements, sources and corrections

Every node's statement, hypotheses, proof sketch and source locator was read. All ten recorded public source files matched their SHA-256 hashes. The source and version records now distinguish the original reading from this independent reading. No finding has been promoted from an author draft or preprint to a publisher version of record.

The principal corrections are:

- The bent-correlation consequence now explicitly bounds the magnitude of **C+ψ(B(0))**. The earlier last sentence could be read as a bound on C alone, contrary to its own proof and Lean formula. The negative Walsh peak for the binary function x₀x₁ confirms why the phase must remain.
- The Ore comparison now directly cites the native finite-field Frobenius algebra endomorphism and specifies its iterated action in the API. The coefficient quotient directly cites `RingQuot`. Evaluation injectivity explicitly cites the polynomial root bound and vector-space cardinality. Interleaving, trace fibres and GMW block counts directly cite cardinality; Kasami directly cites norm powers and trace surjectivity; d-form correlation directly cites cyclic units.
- The GMW block theorem's packet hypotheses now spell out primitivity of α, already present in its Lean signature. Its range remains j≤[K:L], not j≤[K:F_p].
- The exact accepted supplier `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6` replaces the broad DWP.7 dependency and request. Clause (i), or its fixed-embedding clause (iv), supplies weights ≤1 on H¹_c of a weight-zero sheaf. Sheaf construction, its trace formula, and genus-zero tame Euler characteristics remain separate open inputs. No pure weight-one conclusion is used.
- Wu–Liu locators now give Theorem 5.1 on p. 18 and its §5.1 proof on pp. 19–21; Proposition 5.5(1) is on p. 25. The matrix quotient is Corollary 6.4 on p. 28. Theorems 2.1–2.2 and 3.1 have precise page locators.
- Goresky–Klapper's interleaving is Proposition 13.3.1, pp. 314–315; the Fourier/correlation locators distinguish Proposition 13.4.1, Corollary 13.4.2 and the later bent paragraph. Quadratic-form source numbers and pages are explicit. The source-finding locators for the degree/primitivity assertion, Kasami opening and geometric-feed opening are pp. 330, 332 and 334 respectively. The d-form result is **Theorem** 14.7.1.
- Klapper's original Definition 1.1 is on p. 3 and Theorem 2.1 with proof is on pp. 4–5. Bazlov citations now distinguish printed pp. 98–105 from PDF pp. 1–8. The 2026 coding exercise locators identify the precise items on p. 110.
- Kuang's actual title and author are *Eigenfunctions on the Finite Poincaré Plane*, **Jinghua Kuang**. The preprint remains evidence for an open spectral transfer, not a certificate of its normalization or exhaustiveness.

All 13 original `sourceIssues` were independently confirmed, with a reason and this review's ID on each. Added confirmed draft misprint **E814**: the final separated trace in GK09 equation (14.1), p. 330, needs exponent di. GK11 equation (11.1), p. 232, already has the intended exponent. The packet already used the correct formula. The bounded author-domain correction search found no draft correction list; this is not a claim about the Cambridge book.

Independent finite computations reproduced the decisive checks: the four Walsh values 2,2,2,−2; the nonprimitive order-five element of F₁₆ with degree four; radical size nine and character-sum magnitude 27 in F₈₁/F₃; both omitted-coprimality failures over F₄; eight affine Hermitian points over F₄ and the formal nonzero evaluation-kernel polynomial XY²+XY+X at l=3. Formal monomial counting also gives three, rather than a negative rectangular expression, at p=5,l=1.

## Baseline, closure and ownership

All **54** baseline declarations were independently read with their enclosing hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 51 original citations exist and provide the stated interfaces; none was removed or replaced. Added three missing citations: `Polynomial.card_roots'`, `TauCeti.Place.ratFuncDegreeOneEquiv` and `TauCeti.Place.adicOfIrreducible_X_sub_C_injective`. The latter two were already used by the inherited native bindings.

Reworded baseline descriptions in our own words and repaired truncated descriptions. In particular, the finite trace formula is an equality after mapping the F-valued trace into E. Units-norm surjectivity supplies the kernel size only after the finite-group fibre count. Fixed-field finrank measures [E:Eᴴ]; the requested base degree follows by cyclic Frobenius and the tower law. These routine consequences are not misattributed to a declaration's direct statement.

Prerequisite chains were checked against the referenced parent nodes and actual supplier statements. No new target-level splits are needed. Cyclic ideal/generator/check/dual statements include repeated-root lengths. The dual generator has the required h(0)⁻¹ normalization. BCH retains its exact-order root and nonzero-code guards. Hermitian message dimension uses the universal sum and the l≥p−1 guard for its closed expression; evaluation injectivity and positive distance require l(p+1)<p³.

Checked the reviewed library audit, the current Tau Ceti tree (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and current TauCetiRoadmap main (`48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`), including the nine roadmaps newer than the atlas snapshot. No overlapping finite-field target was found there. Generic code duality is already AlgebraicCodingTheory Layer 2; the suggested helper is explicitly its native dot-product binding, not a new owner. AlgebraicCurves' general plane-curve machinery remains imported, with the missing named Hermitian model routed to Part II.

The red-team responses are sound: /1 removes unjustified Weil dependencies from algebra/algorithms; /10 keeps unintegrated EXT-08 promotion and its owner questions explicit; /13 assigns linearized/Ore comparison once to FF.4 and makes DM.0 an importer; /14 retains existing RS/AG ownership and supplies general cyclic/Hermitian compatibility; /17 uses primary sources and guarded corrected statements. The maintainer's graph changes and parent assembly are outside this review's paths.

## API, suggested file and validation

The packet has 83 API items, 62 discriminating unit tests and six planets. Each of its 18 definitions/constructions has at least three tests. Planets identify central mathematical objects or named results. All 51 node names have suggested signatures.

The suggested file now elaborates. Repairs cover the pre-import comment, explicit field/scalar arguments, Frobenius action scope, a single degree-equality witness for reduced ring/algebra structures, invalid identifiers, quotient expressions and `Fin` inference, cyclic lattice/membership calls, and the finite Hermitian-point instance. Added missing signatures for the Frobenius action, trace rank-one contraction, and the unique output-basis trace expansion with its rank. Removed the stale statement that compilation had not been run. Every mathematical proof obligation remains a planning placeholder.

Validation on the final files:

- `python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.4.json`: **0 errors, 0 warnings**.
- Embedded `sourceIssues` and `sourceVersions` validators: **0 errors**, all 14 findings confirmed by this independent review.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums--FF.4.lean`: **exit 0**, 213 warnings, all `declaration uses sorry`; no other warnings or errors. The shared build is pinned to both required commits; directly imported Tau Ceti source modules also matched the Tau Ceti pin.
- The independent finite calculations described above passed.

## Questions and follow-up for the maintainer

The [handoff](../handoff/REV-FiniteFieldsAndCharacterSums--FF.4.md) gives the exact open contracts and reader synchronization. The reader document is outside this issue's permitted deliverables, so its stale locators, metadata, dependency and compilation statements are recorded for regeneration. It should follow this accepted packet. No second job was claimed.
