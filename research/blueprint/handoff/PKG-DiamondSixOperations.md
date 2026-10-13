# PKG-DiamondSixOperations — handoff

Job `PKG-DiamondSixOperations` (issue #9165), done by Claude (session claude-myKl7u) on 2026-10-13. Complete: the package is ready for its independent review (`REV-PKG-DiamondSixOperations`).

## Deliverables

- `research/blueprint/packages/DiamondSixOperations/README.md`: about 195 KB. Seven layers S0–S6 (stage ids kept, so consumer citations `DiamondSixOperations:Sk` still resolve), 30 subsections and 97 bold-led targets (the 90 plan targets, with the Haar target replaced by its bridging statement, plus 7 new ones). Every target has its hypotheses, an ECD locator and its prerequisites; theorems also have a proof route. The 19 definitions and constructions of the plan have API lists and **Checks**, and the four new statable targets have **Checks** (23 Checks blocks, 3–6 bullets each). Every layer ends with Examples and Dependencies. No process language.
- `research/blueprint/packages/DiamondSixOperations/Suggested.lean`: 342 lines in namespace `TauCetiRoadmap.DiamondSixOperations`. It holds 14 declarations, all real-bodied definitions or theorems proved by `sorry`, and 12 examples, with no sorry'd data. Imports: `Mathlib` and `TauCeti.Topology.Algebra.Group.Profinite.Order`. A closing comment lists every other README target by layer.
- `research/blueprint/packages/DiamondSixOperations/metadata.toml`: `topic = "math.AG"`.

## Checks run

- `lean-check research/blueprint/packages/DiamondSixOperations/Suggested.lean` exited 0 with 20 warnings, all `declaration uses 'sorry'`, and no errors. The shared lean-check build is Tau Ceti f790474 with Mathlib 082e2d3. The imported `Profinite/Order.lean`, `Supernatural.lean` and `OpenNormalSubgroup.lean` are byte-identical to the pinned baseline.
- The three formal theorems (`formalVerdierDuality`, `formalUpperShriekInternalHom`, `exceptionalBaseChange_of_baseChange`) and the trace-after-unit example were also proved outright, as one-line `conjugateIsoEquiv` terms and `ext; simp`, in a scratch copy. So those statements are known to be correct; the deliverable keeps them as `sorry` targets.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Scripted coverage against `research/blueprint/packets/DiamondSixOperations.json`:
  - every API name and declaration of the 90 nodes appears in the README, except the `normalizedHaar` family (removed on purpose, see below);
  - every ECD theorem number and page of the node sources appears;
  - every Checks block has at least 3 bullets;
  - all internal `Section Sk.m` references resolve;
  - code fences and backticks balance;
  - no node ids, erratum ids or process words remain.

## Changes relative to the accepted plan (packet unchanged)

1. **Duplicate removed.** `S5/normalized-haar-measure` (`normalizedHaar` and 7 API items) duplicates `TauCetiRoadmap.SmoothRepresentationsOfLocalGroups` on TauCetiRoadmap main: Layer SR.1.1 `HaarMeasureWithValues` with `HaarMeasureWithValues.existsUnique_vol_eq_one`, and Layer SR.0.3 `HasUnitProOrder`. The README now cites those. Only the bridging statement `isUnit_card_quotient_of_profiniteOrder` is kept (Section S5.3): Tau Ceti's `profiniteOrder` with exponent 0 at ℓ and ℓ^m = 0 in Λ give `HasUnitProOrder`. It needs `CompactSpace K`, since without compactness an open subgroup can have infinite index and `Nat.card` is 0.
2. **Three supplier statements planned here**, because no lower roadmap states them. A Sonnet cross-check of all packets and packages, verified by me, found none (`EnhancedDerivedSheaves` has no package; E2 has only hypercover definitions and descent):
   - S2.1 `exists_hypercover_strictlyTotallyDisconnected` / `hypercover_commonRefinement` (packet request to E2; ECD Lemma 7.18, Remark 17.4, proof of 19.1, pp. 36, 97, 108, 136–137);
   - S1.1 `fibreDimension_le_dimTrg` / `dimTrg_canonicalCompactification` (packet request and gap to C8; ECD Lemma 21.6, Definition 21.7, Remark 21.8, p. 123, and the proof of 22.5, p. 130). The proof route closes the plan's recorded gap: lift chains of specializations along a universally open quasi-pro-étale presentation (D5), then apply C8's analytic bound;
   - S5.3 `quotientByProfiniteAction`, the image-relation quotient by a non-free profinite action (packet request and gap to D4; proofs of ECD 24.2 and 24.3, pp. 153 and 155).
   The owners `EnhancedDerivedSheaves`, `DiamondEtaleCohomology` and `DiamondsAndVStacks` may later take these over. DiamondsAndVStacks is already TauCetiRoadmap PR #820.
3. **Request now met.** The packet's request to E3 for Neeman's criterion is satisfied by `EnhancedDerivedSheaves:E3/right-adjoint-coproducts` (Lurie HA 1.4.4.1(3)), which the README cites in S4.1 and S4.3.
4. **Inherited gaps.** The H3 higher-rank curve duality and the H5 local compactification of smooth curves over a non-discretely valued C are both stated as targets in the `ClassicalAdicEtaleCohomology` package (Sections 9.6 and 8.2). The README cites them there; their proof obligations stay with that roadmap.
5. **New targets made explicit and stated in Lean**, each derived from proof steps already in the plan:
   - the formal duality lemma (S3.2), the Yoneda argument of ECD 23.3 for any closed monoidal categories with a projection formula; it yields `verdierDuality` and `upperShriek_internalHom`;
   - `exceptionalBaseChange_of_baseChange` (S3.3);
   - the formal `twistedPullbackTransformation` and the finite-set trace model (S3.4);
   - `LocallyConstant.free_of_profinite` (S4.1, Nöbeling over any Λ);
   - `shift_unitComplex_injective` (S4.2, degree of invertible objects);
   - `exists_closed_valuationSubring_le`, `valuationSubring_eq_of_le` and `isZero_of_isZero_stalk_closedPoints` (S6.3; these split `S6/closed-points-detect-vanishing` into its valuation, topological and geometric parts).
6. **ECD corrections stated as plain mathematics.** The plan's ECD corrections are written as one-clause remarks at the statements they concern ("ECD prints …; the statement needs …"). These cover PAPER-SCHOLZE-17 E53, E64–E69, E72, E98–E101 and the packet's own E1 and E4 (E2 and E3 were rejected by review and are not stated as errors). No erratum ids appear in the README.

## Adversarial pass (PACKAGE_REVIEW.md, maintainer 2026-10-09)

| Statement | Instance tried | Result |
| --- | --- | --- |
| Unit index for pro-order prime to ℓ | noncompact K = ℤ discrete, U trivial | false without compactness, so `CompactSpace K` was added; ℓ^0 = 1 (zero ring) is consistent |
| Shift degree of invertible objects | Λ = ℤ/1 | Λ[0] ≅ Λ[1], so uniqueness needs `Nontrivial Λ`; zero-ring example added |
| ZR closed points | k = ℝ, K = ℝ(t) | the closed point at t² + 1 has residue field ℂ; `IsAlgClosed k` kept and the negative control is in the README |
| Jacobson detection | Sierpiński space | j_!M from the open point is nonzero with zero stalk at the closed point; `¬ JacobsonSpace Prop` example |
| Normalised trace | F_5, two points | α_q = 2^{−1} ≠ 1; example pins α_q ≠ the identification Rq^! = q^* |
| Formal duality | ring map R → S, f_! = restriction, f^! = Hom_R(S, −) | recovers Hom_R(B, A′) ≅ Hom_S(B, Hom_R(S, A′)); README check added |
| Practical criterion, global dim.trg | ⊔ₙ Bⁿ over ⊔ₙ Spa(C, O_C) | ECD's global bound is too strong (packet E4); the local form is stated |
| Biduality and conservativity base | Spa(C, C⁺), C⁺ ≠ O_C | both fail; the counterexamples are targets |
| Distributions vs functions | S = ℤ_r, Λ = F_ℓ | the dual has uncountable dimension; example added |

## For the reviewer

- I checked these ECD locators against the v4 PDF (sha256 78ca42bb…, PDF page = printed page): 7.18, 17.3/17.4, 18.6–18.8, 19.1, 21.1–21.8, 22.2–22.5, 22.18, 23.6, 23.7, 23.11, 24.2–24.4 and footnote 5. All other locators are the plan's, which passed two reviews.
- The Hub96 locators (1.6.10, 5.5.8, 6.2.2, 7.2.2, 7.5.3, 7.5.4) are the plan's and were not re-read here.
- `twistedPullbackTransformation` names both the geometric τ_f (README S3.4) and its formal counterpart in `Suggested.lean` (namespace `Twist`).
- The supplier labels Cj, Dj, Ej, Aj and Pj are stage ids. `ClassicalAdicEtaleCohomology` is cited by the section numbers of its package README, because its layers are not numbered by stage.
