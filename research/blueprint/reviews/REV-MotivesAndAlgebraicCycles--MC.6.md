# Independent review — MC.6

Accepted as a complete target-level planning pass, with coverage **planned**, three recorded gaps and nine supplier contracts. No mathematical closure or implementation is claimed. Reviewer: Codex, session `codex-duY0Es`, 19 October 2026; author session: `codex-SAaPvC` (original PR #11057). This is job `REV-MotivesAndAlgebraicCycles--MC.6`, issue #10803.

The effective inventory is **40 targets**: 28 retained by stable reference and 12 additional, including one key theorem added here. The review records 16 verified, 23 corrected and one added target. It checks 18 definition/construction targets, 116 API items, 82 planned unit tests, and six replacement planets. The small part packet alone contains 12 nodes, 18 API items and 16 tests; the larger counts include the retained targets after refinements. Nineteen retained targets have explicit assembly refinements. Every definition/construction has at least three substantive tests.

The issue’s old embedded brief mentions MC.7, but the actual part, source inputs and deliverable paths are MC.6; MC.7 has its own job. This review does not enlarge that scope.

## Mathematical corrections

1. **Integral periods.** HMS-paper Theorem 2.6, p.10, is valid over a field, but its extension in Remark 2.7 to finite-projective Dedekind coefficients is false as stated. With two vertices, both fibres equal to Z and the common arrow multiplication by 2, the period-symbol module is Z²/〈2(e_q−e_p)〉 ≃ Z⊕Z/2. Compatible maps are diagonal Z, so comparison kills the nonzero order-two difference. The free even symmetric tensor completion gives Z[x,y]/(2(y−x)) → Z[t], x,y↦t, preserving the obstruction in the unital multiplicative setting. At finite level the map is bidualization; over a Dedekind domain its target is the torsion-free quotient. Filtered passage gives P/P_tors. The corrected target, tests and reader state this, and E49 records the source issue with its independent verdict. The rational period theorem is unchanged. The arithmetic detector in the suggested file proves the relation vanishes modulo two and the difference survives.
2. **Relative hypotheses and coefficients.** All four operational relative targets now assume existence, preservation and reflection of the relevant split coequalizers, including preservation by the piece inclusions. The printed reflection-only FS VI.10.2 remains an explicit proof obligation; this review does not assert it false. Coalgebra assembly owns the monoidal Ind/internal-comodule adapter, compact finite-equation factorization and coefficient presentation. That presentation includes balancing for the coefficient-category action, not just ordinary dinaturality: for C=A and F=id it must give H=1. The antipode uses dual-object coefficients and respects both relations; a finite piece is enlarged for a dual rather than assumed dual-closed.
3. **Torsors.** Recovering acting groups from the heap of R-points needs that point set to be nonempty. Scheme torsor actions still exist when R-points are absent. A comparison section can give a group law, so the test now says there is no *canonical* group law without a section. In DM Theorem 3.2, pp.30–31, the faithful-flatness argument uses the cofinal family X⊕1: an arbitrary P_X need not surject onto the unit. The two scheme actions have the required source/target order, and the torsor morphism has its explicit inverse.
4. **Functoriality.** Added `MC.6/tannaka-functoriality`, marked with this review’s `addedBy`, for DM Proposition 2.21(a)–(b), p.25. Its exact fibre-compatible tensor-functor, ambient-subobject and subquotient-generation hypotheses supply the previously implicit categorical quotient and closed-immersion criteria. Proalgebraic approximation, connectedness, Artin and Tate group maps import it. Tests include a quotient, μ₂→G_m restriction losing fullness, and the nonreduced μ_p boundary. No rational-point criterion replaces a group-scheme statement.
5. **Artin fullness.** The diagram universal property alone does not prove fullness in the ambient Nori category. Require the MC.5 ℓ-adic realization with Betti scalar comparison and canonical finite-étale permutation action (HMS-book Example 9.1.13, p.213). It makes every ambient rational Betti matrix Galois equivariant after Q_ℓ extension, hence rationally; the computed Artin equivalence lifts it and Betti faithfulness proves equality. Ambient subquotient closure separately uses the corrected restriction/corestriction and finite-descent argument of §9.5, pp.231–239. Requests specify the geometric base k⊂C, rather than silently use a Q-only completion.
6. **Tate symmetry and source sign.** Self-symmetry +1 follows from the faithful symmetric Betti fibre and ordinary interchange of a one-dimensional space. Weight 2 alone would not justify it. E48 is independently confirmed against HMS-book Definition 10.2.4, p.246, and Lemma 10.3.2, p.250; L^r=1(−r) has weight 2r. Uninspected v6 locators were removed. The graded equivalence uses ordinary symmetry and all integer exponents; it concerns pure Tate motives, without closing under all mixed extensions.
7. **Source and implementation claims.** Read the annotated book’s universal-property and tensor proofs at their actual pp.142–144, 167–170 and 182–185. Import the already planned `MC.5/completion-universal-factorisation`, `completion-tensor-assembly` and `completion-rigidity-proof`; only new geometric-base/realization requirements remain requests. Do not import `completion-two-fibres`, which consumes the present fibre-functor extension. Removed claims that the compact part’s suggested file implements the legacy signed-product/localization interfaces or their odd-degree regression. Corrected `PeriodsAndSpecialFunctions` to the actual owner `PeriodsAndSpecialValues`.

## Sources and source issues

The packet and reader give the URLs, versions, theorem/section/page locators and read ranges. The inspected primary sources are [HMS-paper v5](https://arxiv.org/pdf/1105.0865v5), [corrected Deligne–Milne](https://www.jmilne.org/math/xnotes/tc.pdf), [FS v4](https://arxiv.org/pdf/2102.13459v4), the [annotated HMS-book](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch-errata.pdf) and its [author errata page](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-errata/buch.html), [Zhu §2.5, pp.454–455](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), [GLX §5.1, pp.31–32](https://arxiv.org/pdf/2208.07195v3), and [Stacks §15.22, Lemmas 15.22.2 and 15.22.11](https://stacks.math.columbia.edu/tag/0549). The finite Dedekind module statement uses [Tag 0AUW](https://stacks.math.columbia.edu/tag/0AUW). Sources are restated in our own words.

Both packet source issues have `confirmed` verdicts naming this review. E49 is scoped to arXiv v5: the abstract’s version history and the author’s errata were checked, and no further correction was located; no journal-version claim is made. The preprint and annotated book hashes are recorded in `sourceVersions`. Referenced older issues were checked where used: multiplicative/unit and good-pair restrictions, quotients rather than subspaces, Betti versus de Rham action sides, nonempty heaps, and bialgebra before antipode. These are not duplicated as new issues. SGA 3 VII.1.4’s primary quotient proof remains unread and is explicitly a gap.

## Library and ownership audit

All **34 distinct baseline declarations** across this part and the effective retained inventory were checked in source with their enclosing hypotheses: 14 in the part and 33 used in the effective inventory, with overlap. No baseline declaration was removed or renamed; the monoidal finite-comodule entry is an audited import even though the effective direct prerequisites do not need it separately.

Pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared build’s five Tau Ceti source modules used below were byte-compared with the official raw files at that commit; all match. Mathlib statements were read from its pinned git checkout. The checks cover the following declarations and their stated roles, not merely a name index.

| Declaration | Pinned source module |
| --- | --- |
| `AlgebraicGeometry.AffineScheme` | [Mathlib/AlgebraicGeometry/AffineScheme.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineScheme.lean) |
| `Bialgebra` | [Mathlib/RingTheory/Bialgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Bialgebra/Basic.lean) |
| `CategoryTheory.Abelian` | [Mathlib/CategoryTheory/Abelian/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Basic.lean) |
| `CategoryTheory.BimonObj` | [Mathlib/CategoryTheory/Monoidal/Bimon_.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Bimon_.lean) |
| `CategoryTheory.Equivalence` | [Mathlib/CategoryTheory/Equivalence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean) |
| `CategoryTheory.Functor.Faithful` | [Mathlib/CategoryTheory/Functor/FullyFaithful.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/FullyFaithful.lean) |
| `CategoryTheory.Functor.Monoidal` | [Mathlib/CategoryTheory/Monoidal/Functor.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean) |
| `CategoryTheory.Ind` | [Mathlib/CategoryTheory/Limits/Indization/Category.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Indization/Category.lean) |
| `CategoryTheory.Linear` | [Mathlib/CategoryTheory/Linear/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/Basic.lean) |
| `CategoryTheory.Monad.monadicOfHasPreservesReflectsGSplitCoequalizers` | [Mathlib/CategoryTheory/Monad/Monadicity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monad/Monadicity.lean) |
| `CategoryTheory.RigidCategory` | [Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean) |
| `CategoryTheory.yoneda` | [Mathlib/CategoryTheory/Yoneda.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Yoneda.lean) |
| `Coalgebra` | [Mathlib/RingTheory/Coalgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Coalgebra/Basic.lean) |
| `CommAlgCat` | [Mathlib/Algebra/Category/CommAlgCat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/CommAlgCat/Basic.lean) |
| `Group` | [Mathlib/Algebra/Group/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Defs.lean) |
| `HopfAlgebra` | [Mathlib/RingTheory/HopfAlgebra/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/HopfAlgebra/Basic.lean) |
| `IsLocalization.Away.algebraMap_isUnit` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) |
| `IsLocalization.Away.invSelf` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) |
| `IsLocalization.Away.lift` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) |
| `IsLocalization.Away.mul_invSelf` | [Mathlib/RingTheory/Localization/Away/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean) |
| `IsLocalization.algEquivOfAlgEquiv` | [Mathlib/RingTheory/Localization/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Basic.lean) |
| `LaurentPolynomial.T_add` | [Mathlib/Algebra/Polynomial/Laurent.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean) |
| `ModuleCat` | [Mathlib/Algebra/Category/ModuleCat/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Basic.lean) |
| `MonoidAlgebra.exists_leftInverse_of_injective` | [Mathlib/RepresentationTheory/Maschke.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Maschke.lean) |
| `Polynomial.aeval` | [Mathlib/Algebra/Polynomial/AlgebraMap.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/AlgebraMap.lean) |
| `Polynomial.not_isUnit_X` | [Mathlib/Algebra/Polynomial/Degree/Operations.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Degree/Operations.lean) |
| `Torsor` | [Mathlib/Algebra/Torsor/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Torsor/Defs.lean) |
| `TauCeti.FGComoduleCat` | [TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean) |
| `TauCeti.FGComoduleCat.instMonoidalCategory` | [TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean) |
| `TauCeti.FGComoduleCat.instRigidCategory` | [TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.lean) |
| `TauCeti.FGPointRepresentationCat` | [TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean) |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | [TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) |
| `TauCeti.Tannaka.tensorAutFunctor` | [TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean) |
| `TauCeti.fgPointRepresentationCategoryEquivalence` | [TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean) |

The ordinary Beck theorem has a left adjoint and separate preservation/reflection assumptions; it does not provide the relative tensor adapter. Ind supplies the category and filtered-colimit framework, not the reconstructed internal coalgebra. Native finite-comodule rigidity requires an existing Hopf algebra; it cannot establish the converse. The known-Hopf tensor-automorphism comparison is applied only after neutral reconstruction. Rational Maschke requires finite group order invertible. Localization declarations are used with the specific comparison inclusion and Tate coefficient, not an unrelated ring given the same name.

Current read-only upstream was also checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Read ReductiveGroups README/Suggested and SemisimpleAlgebras as density/ownership examples, searched current roadmaps and library, and inspected ModularCurves §0D/§0E. The latter already plan the finite-étale/Galois-set equivalence and effective affine descent; they are now imported with exact contracts. SF.3 is the curves/Picard layer, so only the auxiliary arbitrary-heap quotient remains requested from SF.1. Retain the existing upstream ReductiveGroups layer-1 finite-type linear embedding request and the main packet’s SF.2 relative-cohomology request. C5’s existing smooth-proper scope does not supply arbitrary singular pairs, connecting maps and all product compatibilities. No existing upstream target is planned again. The reviewed library audit contains no MC.6 record from which closure could be inferred.

Confirmed finding `RT-AREA-geomlanglands/17` is addressed by separate neutral and relative data, an independent neutral finite-representer proof and an early abstract chain with no MC.5/period prerequisite. The relative integral route retains its precise reflection-only gap. Reductivity remains with ReductiveGroups; Zhu and GLX are checked consumers, not substitutes for the abstract proof. The proposed early-stage installation is still a maintainer action. Until then, consumers must import individual abstract nodes rather than the late stage.

## Target verdicts

The packet’s `review.checked` contains a reason for every row, including retained targets after assembly refinements.

| Target suffix | Verdict |
| --- | --- |
| `torsor` | verified |
| `tensor-automorphism-group` | verified |
| `comparison-algebra` | verified |
| `period-space-of-a-diagram` | verified |
| `periods-equal-comparison-algebra` | corrected |
| `formal-periods` | corrected |
| `formal-periods-equal-comparison-algebra` | corrected |
| `fibre-functor-extension` | corrected |
| `iso-torsor` | corrected |
| `period-torsor` | verified |
| `torsor-groups` | verified |
| `affine-torsor` | verified |
| `affine-torsor-groups` | corrected |
| `rigid-bialgebra-is-hopf` | verified |
| `very-good-pairs-generate-periods` | verified |
| `tensor-iso-scheme` | corrected |
| `tensor-iso-torsor` | corrected |
| `pro-algebraic-approximation` | corrected |
| `period-point` | corrected |
| `relative-finite-piece-reconstruction` | corrected |
| `relative-coalgebra-assembly` | corrected |
| `relative-bialgebra-reconstruction` | corrected |
| `relative-rigid-antipode` | corrected |
| `neutral-finite-subcategory-representability` | verified |
| `neutral-reconstruction-coalgebra` | verified |
| `neutral-tannaka-reconstruction` | verified |
| `tannaka-finiteness-recognition` | corrected |
| `tannaka-connectedness-recognition` | corrected |
| `neutral-fibre-datum` | verified |
| `relative-reconstruction-datum` | verified |
| `relative-beck-sufficient` | verified |
| `fibre-inner-form` | corrected |
| `artin-diagram-category` | corrected |
| `artin-galois-equivalence` | verified |
| `artin-nori-embedding` | corrected |
| `artin-galois-group` | corrected |
| `pure-tate-subcategory` | corrected |
| `pure-tate-graded-equivalence` | corrected |
| `pure-tate-galois-group` | corrected |
| `tannaka-functoriality` | added |

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCycles--MC.6.json`: zero errors and warnings, with the available pinned declaration index.
- Temporary effective assembly: applied all replacement fields, API/test replacements and added prerequisites to the 28 retained targets; combined baseline imports; installed the six planet selections as replacements; checked all 40 nodes with the packet checker against a world excluding those same IDs. Zero errors or warnings. The internal prerequisite graph is acyclic; every definition/construction has at least three tests. This simulation does not modify the main packet or atlas data.
- Source-issue schema plus `versions_checked`: zero errors. Both E48 and E49 have independent verdicts.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.6.lean`: successful at the pins, only the expected theorem-admission warning. The 91-line file contains two real-bodied light helpers, six proved examples and one admitted antipode theorem; no admitted data. Memory was checked before compilation.
- `python3 research/blueprint/intake.py check-files` on the five deliverables and `git diff --check`: passed.

Assembly must apply the packet’s refinements before reading retained nodes and replace legacy planets with the six selected entries. Follow-up work is exactly the three recorded gaps and the additional supplier contracts. Existing upstream import contracts are reuse, not new mathematical gaps. No question requires the author to revise this completed pass. The maintainer still decides installation of the existing early abstract/period stage split. The durable handoff is `research/blueprint/handoff/REV-MotivesAndAlgebraicCycles--MC.6.md`.
