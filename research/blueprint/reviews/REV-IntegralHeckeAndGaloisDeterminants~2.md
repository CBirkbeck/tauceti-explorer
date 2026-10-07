# Independent review of revision 2: Integral Hecke actions, determinants and interpolation

Job `REV-IntegralHeckeAndGaloisDeterminants~2`, issue #6910. Reviewer: Codex, session `codex-ycCYoD`, 7 October 2026. This session did neither planning job under review. The previous independent report and revision handoff were read before checking the revised contracts.

**Verdict: accepted. This is a completed independent review, not a checkpoint.** Every node has a fresh individual verdict: 244 verified and nine corrected. All 67 baseline citations are confirmed. The nine previously unverifiable contracts now express their intended mathematics, and the additional clear corrections below were applied in place. There is no unresolved contradiction in the planning contracts.

Acceptance concerns a complete lemma-level planning pass. All seven stages are `planned`, zero are `closed`, all implementations remain `unchecked`, and the 38 explicit mathematical proof leaves and 19 supplier requests remain open. A recorded source theorem with a defective proof is a planned target with a named replacement proof obligation; it is not a theorem established by the defective proof. The suggested file is a prototype, with its documented supplier omissions and placeholder proofs.

| Measure | Reviewed result |
| --- | --- |
| Nodes | 253: 28 definitions, 40 constructions, 115 lemmas, 16 comparisons, 54 theorems |
| Fresh per-node verdicts | 244 verified, 9 corrected, 0 added, 0 unverifiable |
| Definition/construction API entries | 228; 230 including the partition lemma API |
| Unit tests | 207 across all 68 definitions/constructions, each with at least three |
| Planets | 33, at most six per stage |
| Baseline declarations | 67 confirmed, none removed or replaced |
| Sources / version records | 25 / 33 |
| Source issues | 23 confirmed: 16 inherited, 6 newly found issues, 1 author-version typo already corrected later |
| Supplier requests / rescope proposals | 19 / 4 |
| Open mathematical proof leaves | 38 |

The [packet's fresh ledger](../packets/IntegralHeckeAndGaloisDeterminants.json) covers every node ID exactly once. Its verdicts replace the historical pre-revision assessment. The definitive [reader](../readmes/IntegralHeckeAndGaloisDeterminants.md) agrees with the corrected packet, including every declaration statement, hypothesis, prerequisite, proof step, API item, test and source locator. All 207 test names occur in the [suggested file](../suggested/IntegralHeckeAndGaloisDeterminants.lean).

## The previous review's nine contracts

| Previously unverifiable node | Independent revision check |
| --- | --- |
| `IHG.0/reductive-pseudocharacter` | The representation constructor consumes compatible invariant evaluation, with reindexing and multiplication pullback equations. Arbitrary unrelated coordinate homomorphisms no longer supply it. |
| `IHG.0/continuous-reductive-pseudocharacter` | The continuity datum is attached to that same compatible tuple family; the equations survive coefficient changes and examples. |
| `IHG.0/reductive-pseudocharacter-kernel` | Normality and tuple insertion use the actual coordinate pullbacks and all invariant tuple tests, rather than a trace-only kernel. |
| `IHG.1/reducibility-ideal` | Factorization is equality of full laws with prescribed ordered residual reductions and uniqueness. ANT20 Proposition 2.5 supplies the all-characteristic contract; the BC09 trace corollary retains factorial invertibility. |
| `IHG.1/gma-extension-injection` | Endpoints are the quotient constituent modules of the chosen GMA. The restriction-of-scalars image is exactly extensions factoring through that quotient. Arbitrary zero modules cannot replace the endpoints. |
| `IHG.1/ribet-lattice` | Complete DVR, fraction field, norm unit ball, compact continuity, integral characteristic coefficients, generic irreducibility and distinct residual characters are explicit. The Iwahori fixture tests the desired oriented nonsplit upper extension. |
| `IHG.1/universal-cayley-hamilton-algebra` | The specialization is tied to the universal determinant. The matrix-algebra test requires henselian local coefficients and split absolutely irreducible residual data. |
| `IHG.1/symplectic-coefficient-descent` | The common-residue complete-local inputs, trace, continuity, residual irreducibility and residue characteristic greater than two agree with GG12. The alternating form is nondegenerate; the old zero-form counterexample is excluded. |
| `IHG.1/compatible-local-reconstruction` | The coefficient map is the quotient Ã→A, and the local lift reduces to the globally reconstructed quotient with the same corners and selected generic constituent. The preceding projector, compression and inner-conjugacy interfaces supply the assembly inputs. |

The four revision-added interface/conjugacy nodes and the transitive users of these contracts were checked too. Their supplier omissions are distinguished from expressible hypotheses. The remaining primitive-projective calculation, lattice rescaling, matrix-unit lifting and characteristic-two form-descent leaves are mathematical follow-up work, not signature defects.

## Corrections made by this review

1. **Faithful-quotient splitness** (`IHG.1/residual-determinant-properties`, `henselian-irreducible`, `henselian-multiplicity-free`). Chenevier Definition 2.19 conflates splitness of the faithful quotient with existence of any realizing representation. Over ℝ, the complex norm is realized by real regular multiplication but has faithful quotient ℂ, which is not a product of real full matrix algebras. Its two geometric constituents are distinct. `IsSplit` now requires a surjection onto a finite product of positive-size full matrix algebras whose kernel is the determinant kernel. Added the direct kernel-ideal prerequisite and the fifth regression `residual_real_norm_not_split`. Henselian source matches now use the condition actually needed in Theorem 2.22. Statement, API, test, reader and Lean agree.
2. **Completed Cayley–Hamilton proof** (`IHG.1/completed-cayley-hamilton-finite`). WE18's unrestricted bounded-nilpotence assertion is false in small characteristic, and its compact-image argument does not identify that image with the generated ideal. Refined the existing Nakayama proof leaf to require a finite-H¹-specific residual-finiteness argument in small characteristic, closedness of the generated ideal and the algebraic/completed comparison. The source theorem remains a planned target, and its dependent generic-algebra node inherits these open obligations. Updated the proof sketch, source match and suggested omission note.
3. **Isotypic module recognition** (`IHG.1/brauer-nesbitt-module-recognition`). CG18 Theorem 4.8 is a different multiplicity theorem. Replaced it with Chenevier Theorem 2.22(i) and supplied the matrix-unit argument: for N=E₁₁M the map e_i⊗n↦E_i1n has inverse m↦Σ_i e_i⊗E_1im. This is matrix-algebra linear and G-equivariant, and makes no freeness assertion about N. The revised prototype already has the needed quotient action and annihilation hypotheses.
4. **Roby locators** (`IHG.0/divided-power-grading`, `divided-power-tensor-map`). Grading is in III §§1–2, pp.248–250, not the universal-law pages. Added IV Proposition IV.9, pp.284–286, for separately homogeneous representability, from which the tensor map and mixed coefficients follow. No isomorphism of the tensor map is asserted.
5. **Polarization** (`IHG.6/ribet-polarized-local-congruence`). Replaced the unnecessary commuting-triangular-elements instruction by triangularity in a common basis. Polarization uses the two elements and their product and works without division by two.
6. **Trace identity match** (`IHG.0/trace-pseudocharacter`). The cycle formula already has both oriented three-cycles. Its source match now explains the nearby duplicated term rather than endorsing it.
7. **Version and ownership records.** Corrected WE18's bibliography to *Mathematische Annalen* 371 (2018), 1615–1681 in both source records and reader. Corrected Quast's author-version page locators. The Azumaya proposal now extends the existing `SemisimpleAlgebrasPartII`, reusing SA2/SA3 conditional Morita/characteristic-coefficient descent and its requested scheme-Brauer carrier; it no longer proposes a second Part II. Matrix-splitting existence and reduced-norm descent remain unprovided inputs.
8. **Coverage and reader.** Recomputed stage remaining lists from their actual node prerequisite cones. The old IHG.0 list included unrelated later-stage work, while several later lists omitted inherited leaves. The reader now displays exactly the corrected lists, and its introductory historical-review paragraph and test count are current.

These mathematical/source changes affect exactly nine existing nodes. No node was added or removed, no baseline citation changed, no planet changed, and no proof leaf was silently closed.

## Sources and source mistakes

Every node's source locator, excerpt, hypotheses and proof use was compared with the public text. Normalized text matching was a screening aid only: symbols, formulas and the image-only Buchsbaum pages were read directly. Buchsbaum's definitions, Lemma 1.1, Proposition 2.1/Corollary 2.2, Lemmas 2.3–2.8, Theorem 2.9 and its proof, Lemmas 2.10–2.11, and §3 regularity/exactness were checked in the scan. The untranscribed contraction normal forms remain an explicit leaf. Roby's quotient grading, base change, homogeneous representability and separately homogeneous correspondence were checked in their own sections, distinguishing internal multiplication from graded multiplication.

Public sources read at the node locators:

| Source | Public text |
| --- | --- |
| CHENEVIER-DET | [The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/abs/0809.0415) |
| ACC23 | [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) |
| BP26 | [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) |
| BN93 | [Homotopy limits in triangulated categories](https://www.numdam.org/item/CM_1993__86_2_209_0.pdf) |
| BCGP25 | [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1) |
| CG18 | [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224) |
| CGH20 | [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694) |
| SCH15 | [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf) |
| DKSW23 | [The residually indistinguishable case of Ribet’s method for GL₂](https://math.iisc.ac.in/~maheshkakde/rl.pdf) |
| ROBY63 | [Lois polynômes et lois formelles en théorie des modules](https://www.numdam.org/item/ASENS_1963_3_80_3_213_0.pdf) |
| EM23 | [Comparison of different definitions of pseudocharacters](https://arxiv.org/pdf/2310.03869) |
| Q23 | [Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) |
| PQ26 | [On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf) |
| BC09 | [Families of Galois representations and Selmer groups](https://arxiv.org/pdf/math/0602340) |
| CN23 | [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3) |
| WE18 | [Algebraic families of Galois representations and potentially semi-stable pseudodeformation rings](https://sites.pitt.edu/~caw203/pdfs/algfam.pdf) |
| CHT08 | [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/PMIHES_2008__108__1_0.pdf) |
| GG12 | [Companion forms for unitary and symplectic groups](https://arxiv.org/pdf/1001.2044) |
| BHKT19 | [G-local systems on smooth projective curves are potentially automorphic](https://arxiv.org/pdf/1609.03491) |
| BIP23 | [On local Galois deformation rings](https://arxiv.org/pdf/2110.01638) |
| BUCH64 | [A generalized Koszul complex. I](https://people.brandeis.edu/~buchsbau/miscpapers/009.pdf) |
| PILLONI20 | [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) |
| GT05 | [Systèmes de Taylor–Wiles pour GSp₄](https://numdam.org/item/AST_2005__302__177_0.pdf) |
| CG20 | [Modularity lifting for non-regular symplectic representations](https://arxiv.org/pdf/1907.08691) |
| ANT20 | [Automorphy lifting for residually reducible l-adic Galois representations, II](https://arxiv.org/pdf/1912.11269v2) |

The packet and reader retain version dates and hashes. Chenevier's inherited archive hash is not presented as a PDF hash; the separate v2 PDF record identifies the text actually inspected. No access to the published LMS chapter is claimed. Quast's author v1, [arXiv v2](https://arxiv.org/pdf/2310.14886v2) and [publisher HTML](https://link.springer.com/article/10.1007/s42543-025-00113-2) were collated at the disputed proofs. The publisher PDF challenge is recorded. [DKSW v2](https://arxiv.org/pdf/2310.16396v2) was independently collated at the local relations and final row count.

WE18's affected passages were compared with the [version of record](https://link.springer.com/content/pdf/10.1007/s00208-017-1557-8.pdf); both contain the nilpotence assertion and bounded-sum image equality. CG18 Lemmas 7.3–7.4 were collated with the [author-hosted typeset journal PDF](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), and the complete [2022 correction](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf) was read: it fixes bracket typesetting, not the telescope issue. These three version records were added. Correction searches and the exact editions to which each finding applies are recorded individually.

All 16 inherited findings were independently confirmed. E1 uses the characteristic-p scalar-matrix trace counterexample; E2 is the incorrectly named module quotient. DKSW E3–E11 concern the coboundary sign, equation (47), noninertia polarization, the adjoint-image quotient, exhaustive good filtrations, degree-two cohomology vanishing, the missing unipotent parameter, functor composition direction and the Y₁ index. Quast E12/E13 persist in the latest arXiv and publisher texts: the standard GL_n module is not self-dual, and compactness is assumed while proving continuity of the reconstructed map. BP26 E14 distinguishes bounded from degreewise-finite unbounded cohomology. Pilloni E15 is the Frobenius typo. E16 is a multiplier uniqueness defect even for an absolutely irreducible residual GL₄ representation in odd characteristic: the Q₈×D₈ tensor example over F₅ gives two alternating forms with distinct multipliers and the same GL₄ characteristic polynomials. The packet does not assert a sign ambiguity in a characteristic-two residue field.

The seven additional records are:

| Finding | Independent check and scope |
| --- | --- |
| E17, Chenevier Definition 2.19 | The real regular complex norm realizes the law but does not split its faithful quotient. Correct the equivalence and the predicate, retaining the stronger quotient condition used by Theorem 2.22. Finding scoped to the public v2 text. |
| E18, Chenevier p.11 | The printed degree-two trace display duplicates tr(g₁g₂g₃); the second cycle is tr(g₁g₃g₂). With diag(1,2) and the upper/lower unit unipotents over ℚ, the two traces are 4 and 5, and the printed expression is −1. The packet's general cycle identity was already correct. |
| E19, WE18 Proposition 2.15/Corollary 2.16 | For k=F_p, R=k[x_i:i≥1]/(x_i^p) and I=(x_i), every element of I has p-th power zero but products of arbitrarily many different variables are nonzero. The augmentation law D=ε^p is universally Cayley–Hamilton and ker D=I. Finite-variable examples also disprove a bound depending only on d. The allowed Nagata–Higman range is retained. This is not a counterexample to the additional finite-H¹ theorem. |
| E20, WE18 Proposition 3.6 proof | A compact image of a fixed bounded-sum formula need not be the ideal allowing arbitrary sums over unrelated tuples. Closedness and algebraic/completed comparison therefore remain separate leaves. No counterexample to this particular ideal's closedness is claimed. |
| E21, CG18 Lemma 7.3 | With trivial ∆, a complete DVR O, C=O and T its uniformizer, the telescope is Frac(O), not finite or perfect over O. The packet already imposes artinian coefficients for telescope-perfectness and nilpotence on the complementary summand for the comparison. The journal correction does not repair the printed complete-ring statement. |
| E22, DKSW §5.9 p.46 | The final counting sentence labels rows away from v₀ as type III, although §2.2 makes them IV/V. The error persists in arXiv v2. The packet's stabilized presentation does not use the erroneous label. |
| E23, Quast author v1 p.23 | The displayed generator map repeats X(j_s) in every factor. ArXiv v2 p.24 and publisher HTML already have X(j₁)⋯X(j_s). Recorded as an already corrected author-version typo, with no new proof gap. |

Each finding has `review.by: REV-IntegralHeckeAndGaloisDeterminants~2` and an individual confirmed reason. A proof gap is not upgraded to a counterexample to its theorem.

## Pinned baseline and audit

All 67 declaration names and statements were read in their cited modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the shared Mathlib checkout matches that commit. The exact `provides` scopes below were checked against their consumers, including noncommutative module categories, tensor/scalar conventions, complete-local hypotheses, finite-projective inputs and quotient direction. None was removed or replaced.

The packet also records Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline entry is Mathlib, and the suggested file imports only Mathlib. The shared project's Tau Ceti checkout differs from that recorded pin; it is not claimed to be a compilation of pinned Tau Ceti imports. Upstream roadmap statements were read from the supplied atlas documents, not inferred from the shared project's HEAD.

The reviewed AUDIT-33 result, its accepted independent report and `data/library-coverage.json` were read. The raw polynomial-law, divided-power, Azumaya, derived-category, Ext, tensor, idempotent-corner and regular-sequence infrastructure is reused. In particular, finite Ext does not give finite projective dimension; ordinary finite-basis determinants do not give projective exterior determinant descent; a single-endomorphism Cayley–Hamilton theorem does not supply the determinant-law quotient. Tau Ceti's classical Hecke ring does not supply the local spherical/Satake normalization or completed finite-cohomology action here.

| Confirmed declaration | Module at the pin | Scope supplied |
| --- | --- | --- |
| `mathlib:AlgHom` | `Mathlib/Algebra/Algebra/Hom.lean` | Algebra homomorphisms. |
| `mathlib:Algebra.TensorProduct.instRing` | `Mathlib/RingTheory/TensorProduct/Basic.lean` | The ring structure on a tensor product of algebras. |
| `mathlib:Algebra.TensorProduct.rid` | `Mathlib/RingTheory/TensorProduct/Maps.lean` | B ⊗[R] R ≃ B. |
| `mathlib:Equiv.Perm.SameCycle` | `Mathlib/GroupTheory/Perm/Cycle/Basic.lean` | Two points lie in the same cycle of a permutation. |
| `mathlib:Equiv.Perm.sign` | `Mathlib/GroupTheory/Perm/Sign.lean` | The sign of a permutation. |
| `mathlib:Function.minimalPeriod` | `Mathlib/Dynamics/PeriodicPts/Defs.lean` | The least period of a point under iteration. |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Linear maps. |
| `mathlib:Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | The characteristic polynomial of a square matrix. |
| `mathlib:Matrix.det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | The determinant of a square matrix. |
| `mathlib:Matrix.det_conj` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | For a square matrix P with IsUnit P, det(P M P⁻¹)=det M; applying it to a unit matrix meets the invertibility hypothesis. |
| `mathlib:Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | det (M N) = det M · det N. |
| `mathlib:Matrix.det_smul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | det (c • M) = c ^ n · det M. |
| `mathlib:Matrix.trace` | `Mathlib/LinearAlgebra/Matrix/Trace.lean` | The trace of a square matrix. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The monoid algebra A[G]. |
| `mathlib:MonoidAlgebra.mapDomainAlgHom` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean` | The algebra map A[H] → A[G] induced by a monoid hom H → G. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Multivariate polynomials. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | Multivariate power series. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean` | Polynomials in one variable. |
| `mathlib:Polynomial.Monic` | `Mathlib/Algebra/Polynomial/Degree/Defs.lean` | Monic polynomials. |
| `mathlib:PolynomialLaw` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | Polynomial laws between modules (Roby), natural in commutative coefficient algebras in the universe of the base. |
| `mathlib:PolynomialLaw.comp` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | Composition of polynomial laws. |
| `mathlib:PolynomialLaw.ground` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | The underlying map M → N of a polynomial law. |
| `mathlib:PolynomialLaw.id` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean` | The identity polynomial law. |
| `mathlib:RingHom.map_det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Ring homomorphisms commute with determinants. |
| `mathlib:TensorProduct` | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` | Tensor products of modules. |
| `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` | `Mathlib/LinearAlgebra/TensorProduct/Tower.lean` | With R→A→B and the module/scalar towers in TensorProduct.Tower, the B-linear equivalence M⊗[A](A⊗[R]N)≃ₗ[B]M⊗[R]N; the polynomial-law specialization uses B=A. |
| `mathlib:Continuous` | `Mathlib/Topology/Defs/Basic.lean` | Continuous maps. |
| `mathlib:Continuous.ext_on` | `Mathlib/Topology/Separation/Hausdorff.lean` | Continuous maps into a Hausdorff space agreeing on a dense set are equal. |
| `mathlib:IsOpen` | `Mathlib/Topology/Defs/Basic.lean` | Open sets. |
| `mathlib:LinearEquiv.rTensor` | `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | For f:N≃ₗ[R]P, the induced equivalence N⊗[R]M≃ₗ[R]P⊗[R]M, with R a commutative semiring and the stated module structures. |
| `mathlib:LinearMap.lTensor` | `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | id ⊗ f. |
| `mathlib:MonoidAlgebra.of` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The monoid hom G → A[G]. |
| `mathlib:MvPolynomial.basisMonomials` | `Mathlib/RingTheory/MvPolynomial/Basic.lean` | The monomial basis of MvPolynomial σ R. |
| `mathlib:Subgroup.Normal` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Normal subgroups. |
| `mathlib:Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean` | Submodules. |
| `mathlib:Submodule.mkQ` | `Mathlib/LinearAlgebra/Quotient/Defs.lean` | The quotient map M → M/K. |
| `mathlib:Subring.closure` | `Mathlib/Algebra/Ring/Subring/Basic.lean` | The subring generated by a set. |
| `mathlib:TensorProduct.finsuppScalarLeft` | `Mathlib/LinearAlgebra/DirectSum/Finsupp.lean` | (ι →₀ R) ⊗[R] N ≃ ι →₀ N. |
| `mathlib:TwoSidedIdeal` | `Mathlib/RingTheory/TwoSidedIdeal/Basic.lean` | Two-sided ideals of a (possibly noncommutative) ring. |
| `mathlib:TwoSidedIdeal.span` | `Mathlib/RingTheory/TwoSidedIdeal/Operations.lean` | The two-sided ideal generated by a set. |
| `mathlib:ModuleCat.finite_ext` | `Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean` | For a commutative noetherian R and finite R-modules N,M, Ext^i_R(N,M) is finite for every natural i; the Small hypothesis handles universes. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The derived category of an abelian category, formed by localization at quasi-isomorphisms; it has its triangulated structure. |
| `mathlib:DerivedCategory.Q` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The localization functor from integer-indexed cochain complexes to the derived category, sending quasi-isomorphisms to isomorphisms. |
| `mathlib:DerivedCategory.Qh` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The localization functor from the homotopy category, factoring the chain localization through homotopy classes. |
| `mathlib:DividedPowerAlgebra` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` | The existing quotient algebra by Roby’s divided-power relations for any commutative semiring and module; the homogeneous grading and Roby polynomial-law universal property are not yet provided. |
| `mathlib:DividedPowerAlgebra.dp` | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean` | The existing universal divided-power symbols dp R n m, satisfying scalar, binomial product and addition relations. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Functorial linear map ∧ⁿM→∧ⁿN induced by f:M→ₗ[R]N, with compatibility against the canonical alternating map; actual namespace exteriorPower, not ExteriorPower. |
| `mathlib:IsAzumaya` | `Mathlib/Algebra/Azumaya/Defs.lean` | The pinned class already bundles finite projectivity, faithfulness and bijectivity of AlgHom.mulLeftRight; the reduced norm and étale matrix-splitting theorem are missing. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean` | For a list rs and module M, each rs[i] acts injectively on M modulo the preceding elements; IsRegular additionally requires the final quotient to be nontrivial. Definition read at pin, lines 135–148. |
| `mathlib:IsIdempotentElem.Corner` | `Mathlib/RingTheory/Idempotents.lean` | For an idempotent e in a nonunital ring R, the existing carrier of eRe with its inherited ring structure and identity e; it does not yet supply the central A-algebra structure or corner determinant. |
| `mathlib:Subsemigroup.mem_corner_iff` | `Mathlib/RingTheory/Idempotents.lean` | For an idempotent e in a semigroup, r lies in its corner exactly when e*r=r and r*e=r. |
| `mathlib:Matrix.toLinAlgEquiv'` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | The algebra equivalence from square matrices to linear endomorphisms of the coordinate vector module; pinned lines 511–512. |
| `mathlib:Module.compHom` | `Mathlib/Algebra/Module/RingHom.lean` | Restriction of a module action along a ring homomorphism, retaining the underlying additive module; pinned lines 49–65. |
| `mathlib:ModuleCat.restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` | For any map of possibly noncommutative rings, the restriction-of-scalars functor between the actual module categories; pinned lines 80–94. |
| `mathlib:CategoryTheory.Functor.mapExtLinearMap` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean` | An exact linear functor induces a linear map between Ext groups, with potentially different Ext universes; pinned lines 181–201. |
| `mathlib:ModuleCat.preservesLimit_restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` | Restriction between module categories over any rings preserves each limit under the displayed smallness assumption; pinned lines 932–938. Bundling finite-limit preservation requires supplying the per-diagram instances. |
| `mathlib:ModuleCat.preservesColimit_restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean` | Restriction between module categories over any rings preserves each colimit whose underlying additive-group diagram has a colimit; pinned lines 940–950. Bundling finite-colimit preservation requires those per-diagram instances. |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | The actual projectivity class, expressing a splitting of the canonical free-module surjection; pinned lines 67–74. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | A principal ideal local domain whose maximal ideal is nonzero; pinned lines 54–60. |
| `mathlib:IsFractionRing` | `Mathlib/RingTheory/Localization/FractionRing.lean` | The localization at the non-zero-divisors, over a commutative semiring; pinned lines 50–55. |
| `mathlib:NormedField` | `Mathlib/Analysis/Normed/Field/Basic.lean` | A field with multiplicative norm and induced metric; pinned lines 154–158. |
| `mathlib:IsUltrametricDist` | `Mathlib/Topology/MetricSpace/Ultra/Basic.lean` | The explicit maximum triangle inequality for the distance; pinned lines 43–47. |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | Separatedness and precompleteness for the module filtration by powers of the coefficient ideal; pinned lines 49–56. |
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` | Equality of the given ring topology with the ideal-adic topology; pinned lines 156–159. |
| `mathlib:HenselianLocalRing` | `Mathlib/RingTheory/Henselian.lean` | The local-ring class with lifting of simple roots of monic polynomials; pinned lines 104–114. |
| `mathlib:Module.free_of_flat_of_isLocalRing` | `Mathlib/RingTheory/LocalRing/Module.lean` | A finite flat module over a commutative local ring is free; pinned lines 304–305. |
| `mathlib:Module.Flat.of_projective` | `Mathlib/RingTheory/Flat/Basic.lean` | Projective modules over a commutative semiring are flat; pinned lines 227–229. |

## Closure, suppliers, density and red-team obligations

All 253 node statements, hypotheses, direct prerequisites, proof steps, acceptance criteria, API entries and tests were read. All seven target sets are represented at lemma level. Prerequisite cones end in the confirmed baseline, precise supplier requests or named proof leaves; the corrected coverage lists preserve those obligations. Routine algebraic steps were checked separately from non-routine invariant-theory, descent, topological and homological leaves. The 33 planets select named definitions, central constructions and theorems rather than source locators, with at most six per stage. The 207 regression signatures include small-characteristic, nilpotent, zero-degree, orientation and quotient tests that rule out the plausible wrong definitions identified in the first review.

All 19 supplier requests were checked against actual available supplier statements. The complete Chebotarev and SemisimpleAlgebras upstream documents were read, along with the relevant ClassFieldTheory layer 7 and ReductiveGroups layer 9, and the supplier packets/stage statements. Chebotarev's class density yields conjugacy-saturated density in finite quotients, with arithmetic/geometric inversion explicit. SemisimpleAlgebras supplies Artin–Wedderburn, density and central-simple field theory at its artinian/finite-dimensional/separability hypotheses; IHG must first establish those hypotheses for its determinant quotients. Inseparable norm factors and bounded-center conclusions are not silently replaced by perfect-field claims.

The existing SemisimpleAlgebrasPartII SA2/SA3 interfaces descend Morita data and characteristic coefficients once a splitting generator is supplied. They do not prove Azumaya matrix-splitting existence or the reduced-norm law. The revised proposal requests those inputs from the existing owner and shares its scheme-Brauer carrier. No supplier or atlas file was edited.

DerivedDeRhamCohomology DD.1 already owns the Koszul complex and its regular-sequence comparison; IHG requests the precise augmentation and bounded finite-free K-flat interface. LP3's field good-filtration t-structure does not supply every requested integral rational-comodule, disconnected coordinate or mixed-characteristic free-orbit interface. ArithmeticGaloisDuality R02.1 distinguishes compact/topological coefficient cochains from finite discrete ones. Completed group algebras and completed tensor comparison stay with L1; analytic localization stays with VS2; bounded-building fixed points and the finite-extension hyperspecial passage stay with RG2.2/RG2.3. The 19 requests are not claimed fulfilled merely because a smaller supplier construction exists.

Accepted RS-24 and all three specified red-team result/verifier pairs were checked:

- **RT-AREA-automorphic-1/18:** finite-level images/ghosts/localization are IHG.2; completed inverse limits are CC.8, specialized by R31.3. Ordinary localization needs no semilocality. The verifier does not establish a duplicate TC.2 construction from its two imports or close CC.4's general chain-model gap using a conditional patching theorem.
- **RT-AREA-langlands-1/25:** R19.6 supplies geometry, congruence/integrality/continuity and deformation data and imports IHG.4 interpolation and the split absolutely irreducible henselian reconstruction. IHG.1 already reaches R19 indirectly through R01.5/R19.1–5; the corrected proposal preserves this qualification. A raw group algebra is not identified with a matrix algebra.
- **RT-AREA-langlands-1/26:** AG2.4 supplies its HLTT family and imports interpolation plus an independent factor prefix. Scholze's actual Laurent-parameter determinant and factorizations for all g and integer k are required; pointwise factor polynomials do not supply them. The prefix does not acquire a TC.2 prerequisite, and TC.3's arithmetic realization stays separate.

The four rescope proposals remain proposals for the authorized owners. They enact no atlas restructuring in this review.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json`: **0 errors, 0 warnings**.
- The same source-issue/version data was checked as a scratch `errata-v1` projection with `scripts/check_errata.py`: **passed**. No extra errata deliverable was created.
- Mechanical packet/reader comparison: **zero mismatches** across all declaration statements, hypotheses, prerequisites, proof steps, acceptance items, API/test names and statements, and source locators. All 207 named tests occur in the suggested file; all 68 objects have at least three tests.
- `lean-check research/blueprint/suggested/IntegralHeckeAndGaloisDeterminants.lean`: **exit 0**, at the pinned Mathlib, **509 declaration-uses-sorry warnings and no other warnings or errors**. Memory was checked before elaboration. This checks names/types and the regression signatures, not the truth of placeholder theorems.
- `git diff --check`: **clean**. Changed paths are the four issue deliverables and this review's own handoff only.

The orchestrator may accept the revision and route its precise remaining leaves and supplier requests through the usual follow-up process. The WE18 residual-finiteness/closedness replacement and general-ring Azumaya norm inputs deserve explicit follow-up; acceptance does not close either. No user decision or additional revision of the nine contract roots is needed. No promotion, merge, label change or second claim is performed by this worker.
