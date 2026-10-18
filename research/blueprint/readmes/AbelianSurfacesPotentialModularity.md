# Abelian surfaces over totally real fields are potentially modular

This roadmap plans the proof of Boxer, Calegari, Gee and Pilloni that every abelian surface and every genus two curve over a totally real field is potentially automorphic, so that its completed Hasse–Weil L-function continues meromorphically to C with the expected functional equation. On the way it plans the GSp_4 modularity lifting theorem for ordinary representations of parallel weight 2 (Theorem 8.4.1). Its consequences are planned here too: challenging abelian surfaces are potentially modular, genus one curves over arbitrary quadratic extensions of totally real fields are potentially modular, ordinary abelian surfaces with residually modular mod p representation are modular, and there are infinitely many modular abelian surfaces over Q with End_C A = Z.

The difficulty the proof overcomes is that weight 2 Hilbert–Siegel modular forms occur only in coherent cohomology, in several degrees, and not in the étale cohomology of any Shimura variety; abelian surfaces are irregular motives of Hodge–Tate weights (0,0,1,1). The argument therefore runs the Calegari–Geraghty form of the Taylor–Wiles method twice, with defect 0 and with defect 1, on higher Hida complexes. Because p splits completely in F, at most two cohomological degrees occur and local–global compatibility is only needed in degree 0, where doubling supplies it. The resulting p-adic forms are glued by analytic continuation and étale descent into one classical form (BCGP §1.2). The higher Hida and Coleman theory, the Hilbert–Siegel varieties, coherent Hecke complexes and GSp_4 local theory all belong to other roadmaps and are imported. This roadmap owns the argument of BCGP §§7.7–10, its final theorems, and the few statements of the 2025 sequel that the extraction's brief assigns here.

All eight layers are **planned** at target level; none is claimed closed or implemented. The plan has 57 nodes: 14 definitions, 4 constructions, 38 theorems and 1 application. It carries 127 API items, 71 unit tests and 31 planets. Every prerequisite outside the roadmap is a baseline declaration read at the pins, a node of another blueprint, or a stage of another roadmap with an explicit request; five gaps are recorded. Four supplier Part IIs exist only as accepted routes of the BCGP extraction and have no stages yet. Their contracts are filed at the parent stages with the prefix "Part II" and are re-pointed when those designs exist. HigherHidaAndColemanTheory's current design does not yet plan the Hilbert–Siegel statements of BCGP §§4–6 that this roadmap uses (gap and restructuring proposal below).

The defect l_0 of BCGP §1.2 is the number of cohomological degrees in which the relevant coherent cohomology is nonzero, minus one; here l_0 = #I ≤ 1 at the patching stage (AP.3), and the local–global compatibility carried by the Hida complexes is made precise by Theorem 7.9.4 (AP.2). BCGP §1.4.2 explains why the method stops at genus two: the automorphic representations contributing to Betti cohomology have regular infinitesimal character, and those contributing to the coherent cohomology of orthogonal Shimura varieties have limit-of-discrete-series components only for g ≤ 2, equivalently no Hodge–Tate weight of an automorphic vector bundle occurs with multiplicity above 2. Both are exposition and carry no targets; §9.4's discussion of F-abelian varieties (Definition 9.4.2) and of K3 surfaces of large Picard rank is likewise exposition beyond Proposition 9.4.1.

## Reading the plan

| Layer | Target | Built from |
| --- | --- | --- |
| AP.0 | Abelian surfaces, automorphy and weight 2 Galois representations | —; AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, AutomorphicBundles, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, EndoscopicTransferAndUnitaryTraceComparison, FaltingsFinitenessAndIsogenyTheorems, HigherHidaAndColemanTheory, IntegralHeckeAndGaloisDeterminants, ModularityAndLanglandsExtensions, NeronModelsAndSemistableAbelianVarieties, PeriodsAndSpecialValues, PotentialModularityAndCompatibleSystems, Tau Ceti Chebotarev |
| AP.1 | The Taylor–Wiles set-up for GSp_4 over a totally real field | AP.0; ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, AutomorphicBundles, DeformationAndDerivedPatchingAlgebra, GlobalGaloisDeformations, HigherHidaAndColemanTheory, HilbertModularVarietiesAndShimuraCurves, IntegralHeckeAndGaloisDeterminants, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, PadicMeasuresIwasawaAlgebras, ShimuraData, SmoothRepresentationsOfLocalGroups, Tau Ceti Chebotarev |
| AP.2 | Galois representations on ordinary Hida–Hecke algebras | AP.0, AP.1; AutomorphicBundles, DeformationAndDerivedPatchingAlgebra, HigherHidaAndColemanTheory, HilbertModularVarietiesAndShimuraCurves, IntegralHeckeAndGaloisDeterminants, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, Tau Ceti Chebotarev |
| AP.3 | Patching in defect zero and one | AP.1, AP.2; DeformationAndDerivedPatchingAlgebra, GlobalGaloisDeformations, LocalGaloisDeformationRings |
| AP.4 | Ihara avoidance and multiplicities | AP.0, AP.1, AP.2, AP.3; AutomorphicBundles, AutomorphicGaloisRepresentationsPartII, AutomorphicSpectralTheory, DeformationAndDerivedPatchingAlgebra, HigherHidaAndColemanTheory, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups, Tau Ceti Chebotarev |
| AP.5 | Gluing, étale descent and the modularity lifting theorems | AP.0, AP.2, AP.4; AdicSpacesPartII, ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, AutomorphicBundles, AutomorphicGaloisRepresentationsPartII, HigherHidaAndColemanTheory, HilbertModularVarietiesAndShimuraCurves, HodgeTateAndCanonicalSubgroups, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, ShimuraCompactifications |
| AP.6 | Potential modularity and potential automorphy of abelian surfaces | AP.0, AP.5; AbelianSchemesAndArithmeticModuli, AnalyticNumberTheory, ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, AutomorphicLFunctionsAndLocalFactors, CohomologyComparisons, ComplexMultiplicationAndExplicitReciprocity, FaltingsFinitenessAndIsogenyTheorems, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, HilbertModularVarietiesAndShimuraCurves, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, PELModuli, PadicHodgeTheory, PeriodsAndSpecialValues, PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems, Tau Ceti AlgebraicCurves, Tau Ceti Chebotarev, Tau Ceti EllipticCurves, Tau Ceti JacobianChallenge, Tau Ceti RepresentationTheory/InductionRestriction |
| AP.7 | Modularity, fixed 3-torsion and the paramodular conjecture | AP.0, AP.5, AP.6; AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, AutomorphicBundles, AutomorphicGaloisRepresentations, CohomologyComparisons, ComplexMultiplicationAndExplicitReciprocity, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, InverseGaloisAndArithmeticFundamentalGroups, ModularityAndLanglandsExtensions, MotivesAndAlgebraicCycles, NeronModelsAndSemistableAbelianVarieties, OrdinaryAutomorphicFormsAndModularityLifting, PELModuli, PadicHodgeTheory, PeriodsAndSpecialValues, PotentialModularityAndCompatibleSystems, Tau Ceti AlgebraicCurves, Tau Ceti EllipticCurves, Tau Ceti JacobianChallenge, Tau Ceti RepresentationTheory/InductionRestriction |

## Conventions

- F is a totally real number field, p ≥ 3 is a prime splitting completely in F, and S_p is the set of places above p. E/Q_p is a sufficiently large coefficient field with ring of integers O, uniformizer λ and residue field k.
- ε is the p-adic cyclotomic character (Hodge–Tate weight −1), ν: GSp_4 → G_m the similitude character, λ\_x the unramified character with λ\_x(Frob_v) = x. Local reciprocity sends uniformizers to geometric Frobenius.
- Galois representations of abelian surfaces are H^1_ét, GSp_4-valued with multiplier ε^{−1} (AP.0); ρ̄\_{A,p} is the dual of A[p].
- rec_{GT,p} is Gan–Takeda's local Langlands correspondence for GSp_4, transported to Q̄\_p and normalized as in BCGP §2.3; WD(·)^{F-ss} is the Frobenius-semisimplified Weil–Deligne representation; local–global compatibility is with π\_v ⊗ |ν|^{−3/2}.
- A form of parallel weight 2 is a cuspidal automorphic representation of GSp_4(A_F) of weight (k_v, l_v) = (2,2) at every real place (in BCGP25's normalization, algebraic of weight (1,1;2) with π\_∞ a non-degenerate limit of discrete series); unless stated, its central character is |·|^2.
- For I ⊆ S_p, Klingen level is used at the places of I and Iwahori level at those of I^c; 𝔠 is a choice of a residual unit root ᾱ\_v or β̄\_v at each v ∈ S_p, and 𝔠'\_v the other one, except in (7.13.3) where 𝔠'\_v denotes the lift of 𝔠\_v determined by a point.
- The spherical Hecke polynomial Q_v(X) = X^4 − T_{v,1}X^3 + (q_vT_{v,2} + (q_v^3 + q_v)T_{v,0})X^2 − q_v^3T_{v,0}T_{v,1}X + q_v^6T_{v,0}^2 is the reciprocal monic GSp_4 spin polynomial of SmoothRepresentationsOfLocalGroups SR.4.5; BCGP's T_{v,1}, T_{v,2} are its T₂, T₁ (Calegari–Geraghty order).
- Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1) is used through Theorem 2.9.3 and Lemma 2.9.1; its conditional status is carried as recorded at ModularityAndLanglandsExtensions ML.0 and ML.4. Every theorem that depends on it says so.

## Source editions and locators

All statements are written in this roadmap's own words; a locator names the theorem, section and printed page. Printed page numbers equal PDF page numbers in both arXiv versions read. No source passage or section-by-section summary is reproduced.

- **BCGP18**: G. Boxer, F. Calegari, T. Gee and V. Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3), arXiv:1812.09269v3 (final version, 292 pp.), read 2026-10-18; Publ. Math. IHÉS 134 (2021), 153–501. Statement numbers agree with the published version. SHA-256 of the PDF read: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
- **BCGP25**: G. Boxer, F. Calegari, T. Gee and V. Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), arXiv:2502.20645v1, read 2026-10-18, for Theorem 1.8.17 (pp. 13–14), §8.1, §9.2.1 and §9.3 (pp. 180–203). SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

Works that BCGP cite for inputs (Mok, Gan–Takeda, Roberts–Schmidt, Arthur–Clozel, Shahidi, Barnet-Lamb–Gee–Geraghty–Taylor, Taylor, Moret-Bailly, Fité–Kedlaya–Rotger–Sutherland, Johansson, Sawin, Dolgachev–Lehavi, Bolognesi, Bruin–Nasserden, Brumer–Kramer) are named where they enter a proof route; their statements are owned by the supplier roadmaps named there.

### Corrections carried from the reviewed extraction

The paper extraction PAPER-BOXER-CALEGARI-GEE-PILLONI-21, reviewed and red-teamed, records the mistakes of the source; the nodes state the corrected forms. This plan found no further mistakes.

| Where | Correction used here | Extraction finding |
| --- | --- | --- |
| Theorem 8.4.1, Theorem 8.5.2 | add (0): ρ is unramified outside a finite set | E161 |
| Proposition 7.10.1 in §7.11 | patching with ideals I_N contained in open decreasing ideals | E163 |
| Proposition 7.11.2 | prove M_∞ O-flat first when #I = 1 | E125 |
| Corollary 7.9.6 | residual ordinarity assumed; the base change also trivializes ρ̄ and makes q_w ≡ 1 at the ramified places | E121 |
| Propositions 6.6.2, Theorems 6.6.4–6.6.5 (imported) | stated after localizing at a non-Eisenstein maximal ideal | E162 |
| Lemma 2.5.1 (imported, used in Corollary 8.2.2) | a pure N maximizes the rank of every N^j; uniqueness for symplectic N in dimension 4 | E16 |
| Corollary 8.2.2 | at v ∣ p, Corollary 7.9.6(4), Proposition 2.4.24 and Lemma 2.5.1 with purity | E130 |
| Definition 9.1.8 | WD(ρ∣G_{F_v}) for the printed WD(ρ\_{π,p}∣G_{F_v}) | E135 |
| Lemma 9.1.10(3) (imported) | SL_2(F_l) | E136 |
| Proposition 9.1.12 | corrected clause (2), no descent of L′; fixed-determinant variant planned here | E137 |
| Lemma 9.2.2 | real-multiplication inert case with image SL_2(F_{l^2}) ⋊ Z/2; 'place v of K' | E138 and the extraction's brief for this roadmap |
| Lemma 7.5.22 (imported) | Aut(PSL_2(k)) = PΓL_2(k) | E109 |
| Lemma 9.2.7 | local data at w ∣ q from two ordinary elliptic curves of traces p, −p; determinant fixed from the start | E139, E140 |
| Theorem 9.2.8 | central character ∣·∣^2 (printed trivial) and ρ\_{π,q} for ρ\_{π,p} | E141, E142 |
| Corollary 9.3.3 | Λ(C, 2 − s) for the printed Λ(C, 3 − s) | E143 |
| Theorem 9.3.4 | the 'more precisely' clause only when End_K(E) = Z | E144 |
| Propositions 10.1.1, 10.1.3, Theorem 10.1.4 | 'ordinary' for the printed 'unramified and ordinary' | E147 |
| Theorem 10.2.1 | ordinary clause from ordinary points of P(ρ̄)(F_v); for F_v = Q_3 via BCGP25 Lemma 9.3.7 | E149 |
| Theorem 10.2.6 | H/F totally real; A[3] ≅ V(ρ̄)^∨ | E150 |
| Lemma 10.3.2 | the Tate conjecture is an added hypothesis | the extraction's brief and item 138 |
| §10.4.2 | ∧^2V ≅ χ\_{K/Q}·(χ∘Ver) | E153 |
| Lemma 10.4.6 | a_5 = 2^4η^2·3; End_C(A) ⊗ Q = D × D; system of G_K | E155, E156, E157 |
| Theorem 2.7.3 | GL_2(A_K) and G_{K_w} | E18 |

## Baseline

The current TauCetiRoadmap main (0d144d0) and Tau Ceti library (a91d3aa) were searched as well: nothing there plans GSp_4 modularity lifting, abelian surfaces or the paramodular conjecture; SmoothRepresentationsOfLocalGroups (SR.1.4 positive Klingen Hecke algebra, SR.4.5 GSp_4 spin polynomial) and IntegralHeckeAndGaloisDeterminants (reductive pseudocharacters, operator localization, spin conventions) are cited where used, never restated.

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were read in their source files at these commits. Neither library has GSp_4 as a group scheme with its similitude character, Galois representations into it, compatible systems, Siegel or Hilbert–Siegel moduli, coherent cohomology of Shimura varieties, or deformation rings; all of these are targets of the supplier roadmaps named in each layer.

- `mathlib:NumberField.IsTotallyReal` (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): A number field all of whose infinite places are real; the standing hypothesis on F throughout.
- `mathlib:NumberField.InfinitePlace` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): Infinite places of a number field; indexes the archimedean conditions (parallel weight, oddness, real points of moduli).
- `mathlib:Field.absoluteGaloisGroup` (Mathlib/FieldTheory/AbsoluteGaloisGroup.lean): The absolute Galois group Gal(K^al/K) with the Krull topology; the group G_F on which every representation here is defined.
- `mathlib:Matrix.J` (Mathlib/LinearAlgebra/SymplecticGroup.lean): The standard alternating form [[0,−1],[1,0]] in block form on l ⊕ l; with l = Fin 2 it is a form of rank 4.
- `mathlib:Matrix.symplecticGroup` (Mathlib/LinearAlgebra/SymplecticGroup.lean): The submonoid of matrices A with A J Aᵀ = J; with l = Fin 2 this is Sp_4(R), the multiplier-one part of GSp_4(R).
- `mathlib:Nat.Prime` (Mathlib/Data/Nat/Prime/Defs.lean): Rational primes; good primes and the auxiliary primes p, q are natural primes.
- `mathlib:Polynomial.Monic` (Mathlib/Algebra/Polynomial/Degree/Defs.lean): Monic polynomials; the spherical Hecke polynomial Q_v(X) and the Frobenius polynomials are monic of degree 4.
- `mathlib:Module.Free` (Mathlib/LinearAlgebra/FreeModule/Basic.lean): Free modules; the defect-zero Taylor–Wiles modules are finite free over Λ\_∅[Δ\_Q].
- `mathlib:Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules; the patched modules are finite over S_∞.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local rings; the coefficient rings of deformation and patching are complete Noetherian local O-algebras.
- `mathlib:ringKrullDim` (Mathlib/RingTheory/KrullDimension/Basic.lean): Krull dimension of a commutative ring; the dimension identity (7.11.1) compares dim (R_∞)′ with dim S_∞ − #I.
- `mathlib:Equiv.Perm` (Mathlib/Logic/Equiv/Defs.lean): Permutation groups; S_6 = Perm (Fin 6) acts on the six Weierstrass points of a genus two curve.
- `mathlib:alternatingGroup` (Mathlib/GroupTheory/SpecificGroups/Alternating.lean): The alternating group; A_5 and A_6 appear in the residual-image cases of §10.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): An abelian variety over a field: a proper geometrically integral group scheme; the carrier of abelian surfaces.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): The dimension of an abelian variety, as the topological Krull dimension of its scheme; an abelian surface has dim = 2.
- `tauceti:TauCeti.schurMultiplier` (TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean): The Schur multiplier H^2(G, k^×) of a group; Lemma 10.2.4 uses that of PSp_4(F_3) (order 2).
- `tauceti:TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff` (TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean): A projective representation whose scalars act faithfully lifts to a linear one rescaled by units exactly when its Schur-multiplier class vanishes.

## Boundaries and supplier contracts

Each line names a supplier stage and the exact statement this roadmap imports from it. A line marked *Part II* is owned by an accepted route of the BCGP extraction whose roadmap has no stages yet, and is filed at the parent stage; *Existing Tau Ceti layer* lines cite Tau Ceti as it stands.

- `AbelianSchemesAndArithmeticModuli:A2` — Polarizations of abelian surfaces and their degrees, so that 'a polarization of degree prime to p' (BCGP Definition 9.2.3, Proposition 10.1.1) is defined. Used by: AP.6/good-primes.
- `AbelianSchemesAndArithmeticModuli:A3` — The Weil pairing induced by a polarization on A[n] and on Tate modules, alternating with values in μ\_n (resp. Z_l(1)), used to make ρ\_{A,l} GSp_4-valued with multiplier ε\_l^{−1} and to define symplectic torsion isomorphisms. Used by: AP.0/abelian-surface-system, AP.6/twisted-siegel-moduli.
- `AbelianSchemesAndArithmeticModuli:A4` — Besides the étale Tate module, p-divisible group, connected–étale sequence and Serre–Tate theory (canonical lifts of ordinary abelian varieties): the Katz–Messing equality of the crystalline and l-adic Frobenius characteristic polynomials of an abelian variety over a finite field (requested here by the extraction's brief, to be planned beside the Tate module), and BCGP25 Lemmas 9.3.4–9.3.5 (polarized lifting of truncated BT data of rank p^4, Jacobian lifting of a smooth genus two special fibre). Used by: AP.0/abelian-surface-system, AP.6/good-prime-density, AP.6/twisted-siegel-moduli, AP.7/local-three-seeds, AP.7/ordinary-surface-modularity.
- `AbelianSchemesAndArithmeticModuli:A5` — Polarized complex uniformization with level structure, used for real points of the twisted Siegel moduli; with A1–A4, the deformation inputs of BCGP25 Lemmas 9.3.4–9.3.5. Used by: AP.6/twisted-siegel-moduli, AP.7/local-three-seeds.
- `AbelianSchemesAndArithmeticModuli:A6` — End and Hom of abelian varieties with Rosati positivity (Albert's classification of endomorphism algebras), and the Weil-restriction formula T_l(Res_{K/F}A) ≅ Ind_{G_K}^{G_F}T_l(A) for finite separable K/F. Used by: AP.0/abelian-surface-system, AP.6/galois-types, AP.6/genus-one-quadratic, AP.7/fake-surface-examples, AP.7/motives-conditional, AP.7/paramodular-conjecture.
- `AdicSpacesPartII:R2` — Huber's results that adic spaces of finite type over a field have finitely many connected components and that finite étale maps are open and closed (Huber Lemma 1.4.5, Proposition 1.7.8), and connectedness of tubes of connected components of the special fibre (BCGP Corollary 8.2.9). Used by: AP.5/connected-components.
- `AdicSpacesPartII:R3` — Poineau's theorem on connected components of shrinking neighbourhoods in Berkovich/adic geometry, used in (8.2.6) of the proof of Lemma 8.2.5. Used by: AP.5/analytic-continuation-descent, AP.5/connected-components.
- `AnalyticNumberTheory:AN.4` — Meromorphic continuation and functional equation of Artin L-functions over a totally real field, via Brauer induction and Hecke L-functions (BCGP Proposition 9.4.1). Used by: AP.6/kummer-surfaces.
- `ArithmeticGaloisDuality:D7` — Local Tate duality H^2(F_v, M) ≅ H^0(F_v, M^∨(1))^∨ for a finite Galois module M of a p-adic or l-adic local field, applied to ad ρ̄ at the auxiliary place v_0. Used by: AP.1/standing-hypotheses.
- `ArithmeticGaloisDuality:R02.2` — Square roots of finite order characters after a quadratic extension, with prescribed local behaviour (the obstruction lies in Br(F)[2]); globalization of quadratic characters with local conditions (BCGP Theorem 8.5.2). Used by: AP.5/twisted-lifting-theorem.
- `ArithmeticGaloisDuality:R02.4` — Tate's theorem H^2(G_F, Q/Z) = 0 for a number field F (lifting projective representations, Proposition 9.2.1), and the Brauer-group obstruction for square roots of characters used in Theorem 8.5.2. Used by: AP.5/twisted-lifting-theorem, AP.6/non-challenging-automorphy.
- `ArithmeticGaloisRepresentations:G7` — GSp_4-specific residual-image API: enormous, weakly enormous, vast and tidy subgroups of GSp_4(k) (BCGP Definitions 7.5.2, 7.5.6, 7.5.11) with Lemmas 7.5.9, 7.5.12–7.5.15, 7.5.17–7.5.19, 7.5.21 and Lemma 7.5.22 corrected (Aut(PSL_2(k)) = PΓL_2(k); restrict to k = F_p or treat the Frobenius-twisted case); induction of two-dimensional representations to GSp_4 (§2.2); Lemma 2.1.3 (semisimple GSp_4-representations are determined by GL_4 × GL_1); Lemma 8.3.1 (uniqueness of the similitude character of an irreducible symplectic representation); Patrikis's lifting of projective representations with Hodge–Tate conditions. Used by: AP.0/abelian-surface-system, AP.0/modular-gsp4-representation, AP.1/standing-hypotheses, AP.5/solvable-descent, AP.6/big-image, AP.6/galois-types, AP.6/good-primes, AP.6/non-challenging-automorphy, AP.6/pq-switch, AP.7/dihedral-crossing, AP.7/residual-modularity-cases.
- `AutomorphicBundles:B4` — Siegel automorphic bundles ω^κ of weight (k,l) and holomorphic Siegel modular forms, including paramodular level (BCGP §3.7 for the Hilbert–Siegel case through the Hilbert–Siegel Part II; §10.3 for paramodular forms). Used by: AP.1/weights, AP.7/paramodular-conjecture.
- `AutomorphicBundles:B5` — Part II (IntegralCoherentHeckeComplexes, not yet designed): Hecke action on integral coherent cohomology of Hilbert–Siegel varieties through cohomological correspondences; BCGP Theorem 3.10.1 (localized coherent cohomology in degrees 0 and 1 at a non-Eisenstein ideal is described by cuspidal automorphic representations, via Harris's comparison) and Corollary 3.10.5 (dim H^1 = l_0·dim H^0 in regular weight); and the descent statement that, for a Hecke-equivariant O[Δ\_Q]-perfect complex computing coherent cohomology of the Taylor–Wiles covers, localization at m_Q followed by Δ\_Q-coinvariants recovers the level-K^p complex in all degrees (applied in BCGP Proposition 7.9.8). Used by: AP.0/weight-two-galois, AP.1/finite-free-balanced, AP.2/hida-hecke-galois, AP.2/taylor-wiles-descent, AP.4/regular-weight-dimensions, AP.5/automorphy-of-rho.
- `AutomorphicGaloisRepresentations:R19.3` — Purity of the Galois representations of Hilbert modular forms (Blasius), used for the automorphic seeds of Theorem 9.2.8 and Proposition 10.1.3. Used by: AP.6/potential-modularity, AP.7/residual-modularity-cases.
- `AutomorphicGaloisRepresentations:R19.4` — Local–global compatibility away from p for Hilbert modular forms, used for the induced seeds in Theorem 9.2.8. Used by: AP.6/potential-modularity.
- `AutomorphicGaloisRepresentations:R19.5` — Local–global compatibility at p (Caraiani) for Hilbert modular forms, giving purity at the places above q in Theorem 9.2.8 and above p in Proposition 10.1.3. Used by: AP.6/potential-modularity, AP.7/residual-modularity-cases.
- `AutomorphicGaloisRepresentationsPartII:AG2.5` — Pure Weil–Deligne representations and the monodromy rank n(r,N), with BCGP Lemma 2.5.1 in its corrected form: a pure N maximizes rank(N^j) for every j and is the unique Weil–Deligne structure doing so; for dim V = 4 and symplectic N, maximal rank of N alone characterizes it. Used by: AP.4/iwahori-multiplicities, AP.4/lifting-hypotheses, AP.5/automorphy-of-rho.
- `AutomorphicLFunctionsAndLocalFactors:AL.2` — Godement–Jacquet L- and ε-factors and the global functional equation for cuspidal representations of GL_n, used for (9.1.5). Used by: AP.0/automorphic-compatible-system, AP.6/potential-automorphy.
- `AutomorphicSpectralTheory:AS.4` — Isobaric sums of cuspidal representations of GL_n (Langlands, Jacquet–Shalika) and strong multiplicity one for isobaric representations; strong multiplicity one for cuspidal GL_4 (Proposition 7.13.11). Used by: AP.0/automorphic-compatible-system, AP.4/regular-weight-dimensions.
- `CohomologyComparisons:CP.2` — The crystalline comparison for an abelian variety with good reduction, identifying D_cris(ρ\_{A,p}|\_{G_{F_v}}) with crystalline H^1 of the reduction with its Frobenius. Used by: AP.6/good-prime-density, AP.7/ordinary-surface-modularity.
- `ComplexMultiplicationAndExplicitReciprocity:CM.4` — Algebraic Hecke characters attached to CM abelian varieties and Grössencharacters with prescribed reduction (BCGP Proposition 10.1.3(3)), used for potentially abelian surfaces and CM elliptic curves. Used by: AP.6/genus-one-quadratic, AP.6/non-challenging-automorphy, AP.7/residual-modularity-cases.
- `DeformationAndDerivedPatchingAlgebra:P7` — Perfect complexes over complete local O-algebras: the RHom^0-duality of BCGP Lemmas 7.8.5–7.8.6, Pilloni's Nakayama lemma for complexes of complete flat modules (Lemma 7.9.7), localization of a perfect complex at a maximal ideal of a commutative subalgebra of its derived endomorphisms, and the semi-local form of Lemma 4.6.22. Used by: AP.1/finite-free-balanced, AP.1/hecke-modules, AP.2/doubling-surjections, AP.2/hida-hecke-galois, AP.2/taylor-wiles-descent, AP.4/eigenspaces.
- `DeformationAndDerivedPatchingAlgebra:P8` — The abstract patching proposition BCGP Proposition 7.10.1, in the form of the extraction's item 150 (ideals I_N = ker(S_∞ → 𝒯[Δ\_N]) contained in open decreasing ideals), for free and balanced modules. Used by: AP.3/patching-datum.
- `DeformationAndDerivedPatchingAlgebra:P9` — Calegari–Geraghty Lemma 6.2 (codimension of support and depth of a module with a square resolution) and BCGP Lemmas 7.12.2–7.12.3 (comparison of top-dimensional cycles of patched modules over R^1 and R^χ modulo λ, with unit cycle coefficients). Used by: AP.3/patched-mcm, AP.4/multiplicity-theorem.
- `DeformationAndDerivedPatchingAlgebra:R03.3` — Depth, maximal Cohen–Macaulay modules and BCGP Lemma 7.13.8 (generic rank of a maximal Cohen–Macaulay module at a smooth point). Used by: AP.3/patched-mcm, AP.4/multiplicity-theorem.
- `DeformationAndDerivedPatchingAlgebra:R03.5` — Balanced modules over complete regular local rings (BCGP §2.10, Lemma 2.10.2: balanced iff H^0 of a perfect amplitude [0,1] complex with Euler characteristic 0) and patching of modules. Used by: AP.1/finite-free-balanced, AP.3/patched-mcm, AP.3/patching-datum.
- `DeformationAndDerivedPatchingAlgebra:R03.6` — Cycles Z(M, R) of finite modules, special-fibre cycles and support on components (BCGP §7.12 recollections, Emerton–Gee Proposition 2.2.13). Used by: AP.4/multiplicity-theorem.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6` — The local Langlands correspondence rec for GL_n over p-adic fields with full Frobenius-semisimple Weil–Deligne parameters (Definition 9.1.1(3)). Used by: AP.0/automorphic-compatible-system.
- `FaltingsFinitenessAndIsogenyTheorems:R28.4` — Part II (OpenImageTheoremsForAbelianVarieties, not yet designed): Serre's open image theorem for abelian surfaces with End_C = Z over a number field (ρ̄\_{A,l}(G_F) = GSp_4(F_l) for l ≫ 0); Ribet's large image theorem for abelian varieties with real multiplication (SL_2(O_M/λ) ⊂ image for almost all λ, no inner twists); and the density argument of BCGP Lemma 9.2.5 (Chebotarev on the Zariski closure after Sawin, with the Weil-bound reduction). The stage itself supplies Faltings' semisimplicity and Tate conjecture for endomorphisms. Used by: AP.0/abelian-surface-system, AP.6/big-image, AP.6/galois-types, AP.6/good-prime-density.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` — Connected–étale sequences of p-divisible groups of ordinary abelian schemes, and Raynaud's uniqueness of finite flat models over Z_3 (e = 1 < p − 1) for BCGP25 Lemma 9.3.6. Used by: AP.6/good-prime-density, AP.7/local-three-seeds, AP.7/ordinary-surface-modularity.
- `GL2AutomorphicRepresentationsAndTransfer:R16.3` — Local Langlands for GL_2 in explicit coordinates, used in Theorem 2.7.3. Used by: AP.6/gl2-quadratic-galois.
- `GL2AutomorphicRepresentationsAndTransfer:R17.4` — Cyclic and solvable base change for GL_2 over totally real fields and to quadratic extensions, used in Theorem 10.1.4 and Proposition 10.1.3. Used by: AP.7/mod-five-quadratic, AP.7/residual-modularity-cases.
- `GL2AutomorphicRepresentationsAndTransfer:R17.5` — Automorphic induction and Langlands–Tunnell with Tate's lifting over totally real fields (Proposition 10.1.3, solvable projective image). Used by: AP.7/residual-modularity-cases.
- `GlobalGaloisDeformations:G7` — Global deformation problems with fixed multiplier/similitude character for GSp_4 (BCGP Definitions 7.1.2–7.1.5, Lemma 7.1.6). Used by: AP.1/deformation-problems.
- `GlobalGaloisDeformations:R04.1` — Deformation functors over complete Noetherian local Λ-algebras with fixed multiplier, framed and unframed. Used by: AP.1/deformation-problems.
- `GlobalGaloisDeformations:R04.2` — Representability of global deformation problems with absolutely irreducible ρ̄. Used by: AP.1/deformation-problems.
- `GlobalGaloisDeformations:R04.3` — BCGP Proposition 7.2.1: presentation of the global ring over the completed tensor product of local rings, with the number of generators. Used by: AP.1/deformation-problems, AP.3/patching-datum.
- `GlobalGaloisDeformations:R04.5` — Taylor–Wiles data for GSp_4 (BCGP §7.6: the augmented problem S_Q, Δ\_Q and its Λ[Δ\_Q]-structure) and Lemma 7.6.1, Definition 7.6.2, Corollary 7.6.3 (data killing the dual Selmer group, under vast and tidy). Used by: AP.1/deformation-problems, AP.3/patching-datum.
- `HigherHidaAndColemanTheory:B7` — Part II contract (BCGP §6.6, not in the current packet): Proposition 6.6.1, Proposition 6.6.2, Theorem 6.6.4 (for #I ≤ 1 the ordinary overconvergent complex is the specialized Hida complex) and Theorem 6.6.5 (ordinary classicity for #I ≤ 1) for Hilbert–Siegel varieties of Res_{F/Q}GSp_4 with p split and Klingen level at I, stated after localizing at a non-Eisenstein maximal ideal of the spherical Hecke algebra (extraction finding E162). Used by: AP.1/finite-free-balanced, AP.2/hida-hecke-galois, AP.4/regular-weight-dimensions, AP.5/gluing-theorem.
- `HigherHidaAndColemanTheory:C4` — Part II contract (BCGP §6.5, not in the current packet): Theorem 6.5.8 (overconvergent cohomology classes of small slope are classical, Hilbert–Siegel case) and Lemma 6.5.18 (restriction is an isomorphism on U_{w,1}-finite slope parts). Used by: AP.5/analytic-continuation-descent, AP.5/automorphy-of-rho.
- `HigherHidaAndColemanTheory:I3` — Part II contract (BCGP §4, not in the current packet): Theorem 4.6.1 (the perfect Hida complex M_I^• over Λ\_I of amplitude [0, #I] for Hilbert–Siegel varieties of Res_{F/Q}GSp_4 with p split and Klingen level at I, with its specializations), the weight space Λ\_I (§4.4), the p-rank strata (§4.1), the semi-local Lemma 4.6.22, and Lemma 4.5.17 (U_{Iw(w),1}(U_{Kli(w),1} − U_{Iw(w),1}) = U_{w,2} on the ordinary locus). Used by: AP.1/finite-free-balanced, AP.1/hecke-modules, AP.1/weights, AP.2/doubling-surjections, AP.4/eigenspaces, AP.5/connected-components.
- `HigherHidaAndColemanTheory:X8` — Part II contract (BCGP §5, not in the current packet): the doubling theorem, Theorems 5.8.4 and 5.8.6 with Remark 5.8.7 (injectivity of U_{v,1} − 𝔠'\_v from Klingen-level to Iwahori-level ordinary weight 2 forms modulo p). Used by: AP.2/doubling-surjections, AP.4/doubling-injection.
- `HilbertModularVarietiesAndShimuraCurves:H4` — Part II (HilbertSiegelModularVarieties, not yet designed): Hilbert–Siegel varieties of G_1 = Res_{F/Q}GSp_4 at parahoric level with toroidal compactifications and the sheaves ω^κ (BCGP §§3.1–3.8); Proposition 7.8.10 (the Taylor–Wiles and Ihara-avoidance covers extend to finite étale torsors over the toroidal compactification); the Ekedahl–Oort stratification with affine strata on the minimal compactification and the Kottwitz–Rapoport strata at Iwahori level (§8.2). Used by: AP.1/finite-free-balanced, AP.1/weights, AP.2/taylor-wiles-descent, AP.5/connected-components.
- `HilbertModularVarietiesAndShimuraCurves:H6` — The Hilbert analogue of twisted torsion moduli with local points, used as the model for the GSp_4 twisted moduli planned here. Used by: AP.6/twisted-siegel-moduli.
- `HodgeTateAndCanonicalSubgroups:T0` — Fargues' degree function on finite flat group schemes over O_{C_p} (BCGP §6.5.1), used to define the neighbourhoods of Lemma 8.2.3. Used by: AP.5/analytic-continuation-descent.
- `IntegralHeckeAndGaloisDeterminants:IHG.0` — Connected reductive pseudocharacters with their invariant-coordinate evaluations, in the GSp_4 instance (upstream layer 0.7); for BCGP25 Theorem 1.8.17, an extension of its scope to affinoid coefficients: GSp_4-pseudocharacters of G_{F^+} over affinoid algebras of the Boxer–Pilloni eigenvariety (V. Lafforgue, Quast). Used by: AP.0/weight-two-galois.
- `IntegralHeckeAndGaloisDeterminants:IHG.1` — Reconstruction of a representation over a complete local ring from Hecke-valued determinants under residual absolute irreducibility, used to glue in Theorem 7.9.4; four-dimensional determinant laws over affinoid algebras for the interpolation in BCGP25 Theorem 1.8.17. Used by: AP.0/weight-two-galois, AP.2/hida-hecke-galois.
- `IntegralHeckeAndGaloisDeterminants:IHG.2` — Operator localization of a Hecke action on a bounded perfect complex at a maximal ideal of its finite image, used to define the localized Hida–Hecke modules. Used by: AP.1/hecke-modules.
- `IntegralHeckeAndGaloisDeterminants:IHG.3` — The GSp_4 spin and dual-spin Hecke polynomial conventions with the similitude (upstream layer 3a.2), identifying BCGP's Q_v(X) and its comparison with det(X − ρ(Frob_v)). Used by: AP.1/hecke-modules.
- `IntegralHeckeAndGaloisDeterminants:IHG.4` — Interpolation of determinants (and, in the GSp_4 case, pseudocharacters) through a dense family of classical Hecke systems, used for Theorem 1.8.17. Used by: AP.0/weight-two-galois.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2` — Hilbert irreducibility over number fields with prescribed local open conditions (Theorems 10.2.1, 10.2.6). Used by: AP.7/fixed-three-torsion, AP.7/infinitely-many-modular.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.4` — Dihedral embedding problems with local conditions above p (Lemma 7.5.25). Used by: AP.7/dihedral-crossing.
- `LocalGaloisDeformationRings:L7` — Local deformation rings of GSp_4 at p: the P-ordinary and (B,𝔠\_v)-ordinary problems D_v^P, D_v^{B,𝔠\_v} with their weight algebras, and Proposition 7.3.4 (irreducible generic fibres of the expected dimension). Used by: AP.1/deformation-problems, AP.3/patching-datum.
- `LocalGaloisDeformationRings:L8` — BCGP Definition 7.3.1 (p-distinguished weight 2 ordinary representations) and the ordinary flag rings of §7.3 (Lemmas 7.3.6–7.3.18, Proposition 7.3.16), including Lemma 7.3.18 (pure points are smooth). Used by: AP.1/deformation-problems, AP.1/standing-hypotheses, AP.4/lifting-hypotheses, AP.4/multiplicity-theorem, AP.5/twisted-ordinary, AP.6/good-primes.
- `LocalGaloisDeformationRings:R08.2` — Places away from p for GSp_4: Lemma 7.1.3 (pure points are smooth), Proposition 7.4.2 (unrestricted rings with H^0(ad^0(1)) = 0 are formally smooth and lifts are unramified), Lemma 7.4.4 (Taylor–Wiles places), and the Ihara-avoidance rings R_v^1, R_v^χ (Propositions 7.4.7, 7.4.8; §§7.4.9–7.4.21) with the monodromy-rank description of the components of Spec R_v^1. Used by: AP.1/deformation-problems, AP.1/standing-hypotheses, AP.2/hida-hecke-galois, AP.3/patching-datum, AP.4/iwahori-multiplicities, AP.4/regular-weight-dimensions.
- `ModularityAndLanglandsExtensions:ML.0` — The registry of conditional statuses: Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1) and its dependence on the twisted weighted fundamental lemma; rec_{GT,p} normalizations; and, as typed conditional hypotheses for Lemma 10.3.2, the Fontaine–Mazur conjecture and the existence of compatible systems for cuspidal GL_4 forms of type φ\_{2;1,0}. Used by: AP.0/modular-gsp4-representation, AP.0/weight-two-galois, AP.4/iwahori-multiplicities, AP.7/motives-conditional.
- `ModularityAndLanglandsExtensions:ML.1` — The odd Artin conjecture over totally real fields (Pilloni–Stroh) and the mod 5 argument (Khare–Wintenberger lifts, Kisin's lifting) for Proposition 10.1.3. Used by: AP.7/residual-modularity-cases.
- `ModularityAndLanglandsExtensions:ML.2` — Potential automorphy of rank 2 compatible systems over totally real fields (Barnet-Lamb–Gee–Geraghty–Taylor Theorems 4.5.1, 5.4.1 and Proposition 5.3.2) and solvable descent (Barnet-Lamb–Geraghty–Harris–Taylor Lemma 1.3). Used by: AP.6/non-challenging-automorphy, AP.6/potential-automorphy.
- `ModularityAndLanglandsExtensions:ML.4` — Part II (GSp4LocalLanglandsAndGaloisRepresentations, not yet designed): GSp_4 local theory and Galois representations — Gan–Takeda rec_{GT,p} and L-packets L(ρ) (Definition 2.3.1); Iwahori, Klingen and pro-v Iwahori levels and the normalized operators U_{Iw(v),i}, U_{Kli(v),i}, U_{Si(v),1} at v | p with their ordinary projectors (§2.4.23), beyond the spherical spin polynomial (SmoothRepresentationsOfLocalGroups SR.4) and the positive Klingen Hecke algebra (SR.1); Propositions 2.4.3–2.4.6, 2.4.13, 2.4.22, 2.4.24, 2.4.26, 2.4.28, 2.4.30 and Lemmas 2.4.33–2.4.37; Roberts–Schmidt tables (Iwahori and parahoric invariants, monodromy rank and parahoric vectors) and paramodular newform theory (Roberts–Schmidt Theorems 7.5.1, 7.5.4; Schmidt); Lemma 2.6.1 and the archimedean packets; Theorems 2.7.1–2.7.2 (Galois representations in regular weight, ordinary case); discrete automorphic representations of general type and Theorem 2.9.3 with Lemma 2.9.1 (Arthur's classification), in their conditional form. Used by: AP.0/modular-gsp4-representation, AP.0/weight-two-galois, AP.1/hecke-modules, AP.1/standing-hypotheses, AP.1/tame-levels, AP.2/hida-hecke-galois, AP.2/ordinary-weight-two-corollary, AP.2/taylor-wiles-descent, AP.4/iwahori-multiplicities, AP.4/multiplicity-theorem, AP.4/regular-weight-dimensions, AP.5/automorphy-of-rho, AP.5/solvable-descent, AP.5/twisted-ordinary, AP.6/genus-one-quadratic, AP.6/gl2-quadratic-galois, AP.6/potential-automorphy, AP.7/motives-conditional, AP.7/paramodular-conjecture, AP.7/paramodular-lemma.
- `ModularityAndLanglandsExtensions:ML.5` — Part II (GSp4LocalLanglandsAndGaloisRepresentations): functorial transfers for GSp_4 — Mok's solvable base change with Iwahori-fixed vectors (Mok Proposition 4.13, Theorem 4.14), Roberts' theta lift from GL_2 over a quadratic extension (Roberts Theorem 8.6), Arthur–Clozel cyclic descent and automorphic induction for GL_4 (Chapter 3, Theorems 4.2 and 5.1), Shahidi's holomorphy and nonvanishing of exterior square L-functions at s = 1, Ramakrishnan's tensor product and Kim–Henniart's exterior square transfer. Used by: AP.2/ordinary-weight-two-corollary, AP.5/main-lifting-theorem, AP.5/solvable-descent, AP.5/twisted-lifting-theorem, AP.6/genus-one-quadratic, AP.6/gl2-quadratic-galois, AP.6/potential-automorphy, AP.6/potential-modularity, AP.7/residual-modularity-cases.
- `MotivesAndAlgebraicCycles:MC.7` — Typed statements of the Tate, Hodge and standard conjectures, and the proved Mumford–Tate conjecture for type II abelian fourfolds (Chi), used as hypotheses in Lemma 10.3.2. Used by: AP.7/motives-conditional.
- `NeronModelsAndSemistableAbelianVarieties:R11.5` — BCGP Proposition 2.8.1: 𝓡\_A is a strictly compatible system, pure of weight 1, with Weil–Deligne representations independent of l at every finite place. Used by: AP.0/abelian-surface-system, AP.0/modular-gsp4-representation, AP.7/ordinary-surface-modularity.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2` — Ordinary parallel weight 2 lifts of modular mod p representations of totally real fields (Barnet-Lamb–Gee–Geraghty 2013, Theorem A). Used by: AP.7/residual-modularity-cases.
- `PELModuli:M5` — Siegel moduli of principally polarized abelian surfaces with full level n structure (𝒜\_2(n)), and PEL moduli for quaternionic abelian fourfolds. Used by: AP.6/twisted-siegel-moduli, AP.7/odd-theta-cover.
- `PELModuli:M6` — Fine moduli schemes 𝒜\_2(n) at rigidifying level n ≥ 3 with universal abelian scheme, used for the twisted moduli and the covers 𝒜\_2(6) → 𝒜\_2(3). Used by: AP.6/twisted-siegel-moduli, AP.7/fake-surface-examples, AP.7/odd-theta-cover.
- `PadicHodgeTheory:R06.2` — D_cris and its Frobenius for crystalline representations of G_{Q_p}. Used by: AP.6/good-prime-density, AP.7/ordinary-surface-modularity.
- `PadicMeasuresIwasawaAlgebras:L1` — Completed group rings O[[O_{F_v}^×(p)]] and O[[(O_{F_v}^×(p))^2]] and their characters (the weight algebras Λ\_v). Used by: AP.1/deformation-problems, AP.1/weights.
- `PeriodsAndSpecialValues:PS.1` — Completed motivic L-functions of compatible systems and of abelian varieties and curves, with Conjecture 1.1.1 (Hasse–Weil), Conjecture 2.8.6 and Corollary 2.8.7 (the conjectural functional equation), as statements. Used by: AP.0/automorphic-abelian-variety, AP.0/automorphic-compatible-system, AP.6/hasse-weil-genus-two, AP.6/kummer-surfaces, AP.6/potential-automorphy, AP.7/paramodular-conjecture.
- `PotentialAutomorphyInfrastructure:PA.5` — BCGP Lemma 9.1.10 with (3) corrected to SL_2(F_l): density of primes with the required residual properties for rank 2 compatible systems. Used by: AP.6/non-challenging-automorphy.
- `PotentialModularityAndCompatibleSystems:R23.1` — Moret-Bailly's theorem with prescribed local open sets, splitting and linear disjointness (BLGGT Proposition 3.1.1), applied to twisted Siegel moduli and to varieties of GL_2(F_q)-torsors with fixed determinant. Used by: AP.5/main-lifting-theorem, AP.6/fixed-determinant-extensions, AP.6/potential-modularity, AP.6/twisted-siegel-moduli, AP.7/fake-surface-examples.
- `PotentialModularityAndCompatibleSystems:R23.2` — BCGP Proposition 9.1.11 input: the auxiliary moduli problem for potential ordinary modularity of a mod q representation over a totally real field. Used by: AP.6/potential-modularity.
- `PotentialModularityAndCompatibleSystems:R23.3` — BCGP Proposition 9.1.11: potential ordinary modularity of r̄\_q over F_1F'' by restriction of scalars, with a q-ordinary weight 0 form of trivial central character unramified above pq. Used by: AP.6/potential-modularity.
- `PotentialModularityAndCompatibleSystems:R23.5` — Auxiliary solvable totally real extensions with prescribed local behaviour, linear disjointness and splitting (item 188 of the extraction), used in Corollary 7.9.6, Theorem 8.4.1 and Theorem 9.2.8. Used by: AP.2/ordinary-weight-two-corollary, AP.5/main-lifting-theorem, AP.6/potential-modularity.
- `PotentialModularityAndCompatibleSystems:R24.5` — The Brauer-induction argument for meromorphic continuation from potential automorphy over solvable subextensions (Taylor, Remarks on a conjecture of Fontaine and Mazur, Corollary 2.2). Used by: AP.6/potential-automorphy.
- `PotentialModularityAndCompatibleSystems:R24.5:operations` — Compatible systems as actual representations with common Frobenius polynomials, strictly compatible systems, and their operations (restriction, induction, exterior square, tensor products) in rank 4. Used by: AP.0/abelian-surface-system, AP.0/automorphic-compatible-system, AP.6/fixed-determinant-extensions.
- `ShimuraCompactifications:C3` — Koecher's principle for normal formal schemes and the codimension of the boundary of the minimal compactification (BCGP §8.2 after Lemma 8.2.3). Used by: AP.5/analytic-continuation-descent.
- `ShimuraData:D5` — BCGP Lemma 7.8.3: a level with pro-v Iwahori component at an absolutely unramified place of residue characteristic > 5 is neat. Used by: AP.1/tame-levels.
- `SmoothRepresentationsOfLocalGroups:SR.1` — BCGP Proposition 2.4.2: the pro-v Iwahori Hecke algebra of a split group and the homomorphism T(F_v) → (H_1[1/p])^×; the positive Klingen Hecke algebra of GSp_4 (klingen-positive-hecke, SR.1.4). Used by: AP.1/hecke-modules, AP.1/tame-levels.
- `SmoothRepresentationsOfLocalGroups:SR.2` — BCGP Propositions 2.4.3–2.4.4: Iwahori and pro-v Iwahori invariants through Jacquet modules. Used by: AP.4/regular-weight-dimensions.
- `SmoothRepresentationsOfLocalGroups:SR.4` — The GSp_4 spherical spin polynomial and its reciprocal monic form `SpinPolynomial.reciprocal` (gsp4-spin-polynomial, SR.4.5), with the generator dictionary T_{v,1} = T₂, T_{v,2} = T₁, and the spin–Galois comparison gsp4-galois-comparison. Used by: AP.1/hecke-modules.
- Tau Ceti AlgebraicCurves (layer 10) — Existing Tau Ceti layer, cited as it stands: hyperelliptic models y^2 = f(x) of genus two curves, with rational Weierstrass points giving quintic models. Used by: AP.6/hasse-weil-genus-two, AP.7/local-three-seeds, AP.7/odd-theta-cover.
- Tau Ceti Chebotarev (layer 10) — Existing Tau Ceti layer, cited as it stands: the Chebotarev density theorem in Dirichlet density, used to choose auxiliary places (v_0, Taylor–Wiles places, good primes and the strengthened q) and to compare Galois representations through Frobenius traces. Used by: AP.0/modular-gsp4-representation, AP.1/standing-hypotheses, AP.2/taylor-wiles-descent, AP.4/lifting-hypotheses, AP.6/big-image, AP.6/fixed-determinant-extensions, AP.6/good-prime-density, AP.6/pq-switch.
- Tau Ceti EllipticCurves (layer 3) — Existing Tau Ceti layer, cited as it stands: elliptic curves over finite fields and the Hasse bound |a| ≤ 2√q, which bounds the traces ±p used in the corrected Lemma 9.2.7 (the existence direction is a recorded gap). Used by: AP.6/pq-switch, AP.7/local-three-seeds.
- Tau Ceti JacobianChallenge (layer d) — Existing Tau Ceti layer, cited as it stands: the Jacobian of a genus two curve as the relative Picard scheme. Used by: AP.6/hasse-weil-genus-two, AP.7/local-three-seeds, AP.7/odd-theta-cover.
- Tau Ceti JacobianChallenge (layer e) — Existing Tau Ceti layer, cited as it stands: the Jacobian is an abelian variety (principally polarized of dimension 2 for a genus two curve). Used by: AP.6/hasse-weil-genus-two, AP.7/odd-theta-cover.
- Tau Ceti JacobianChallenge (layer f) — Existing Tau Ceti layer, cited as it stands: Abel–Jacobi and the universal property, identifying H^1 of C with H^1 of Jac(C). Used by: AP.6/hasse-weil-genus-two.
- Tau Ceti RepresentationTheory/InductionRestriction (layer 6) — Existing Tau Ceti layer, cited as it stands: Brauer's induction theorem, used for meromorphic continuation in Theorem 9.3.1 and for Artin L-functions in Proposition 9.4.1. Used by: AP.6/kummer-surfaces, AP.6/potential-automorphy.
- Tau Ceti RepresentationTheory/InductionRestriction (layer 7) — Existing Tau Ceti layer, cited as it stands: projective representations, factor sets and the Schur multiplier, used in Lemma 10.2.4. Used by: AP.7/odd-theta-cover.

## AP.0. Abelian surfaces, automorphy and weight 2 Galois representations

Fix the conventions and the statements the rest of the roadmap proves. For an abelian surface A over a number field F, the GSp_4-valued compatible system 𝓡\_A = (H^1_ét(A_{F̄}, Q̄\_l))\_l with multiplier ε^{−1} (BCGP Definition 2.8.2, Remark 2.8.3). Automorphy of a strictly compatible system over a number field through an isobaric sum of C-algebraic cuspidal representations matching Weil–Deligne representations at every finite place, with the completed L-function and its functional equation (Definition 9.1.1, (9.1.5)); automorphic and potentially automorphic abelian varieties (Definition 9.1.6, Remark 9.1.7); modular and potentially modular GSp_4-representations and abelian surfaces over a totally real field, with the corrected Weil–Deligne condition (Definition 9.1.8, Remark 9.1.9). The Galois representation of an ordinary cuspidal representation of GSp_4 of parallel weight 2 and central character |·|^2 over a totally real field in which p splits, with multiplier ε^{−1}, semisimplified local–global compatibility away from p and the ordinary shape at p (Boxer–Calegari–Gee–Pilloni 2025, Theorem 1.8.17), proved by interpolation over the higher Coleman eigenvariety.

<a id="ap0-abelian-surface-system"></a>
### AP.0/abelian-surface-system — The GSp_4-valued compatible system of an abelian surface

*Definition.* Planet: *Compatible system of an abelian surface*.

**Statement.** Let A be an abelian surface over a number field F and l a prime. Put ρ\_{A,l} := H^1_ét(A_{F̄}, Q̄\_l), a continuous four-dimensional representation of G_F, and 𝓡\_A := (ρ\_{A,l})\_l. A polarization λ of A induces, through its Weil pairing, a G_F-equivariant perfect alternating pairing on H^1_ét(A_{F̄}, Q̄\_l) with values in Q̄\_l(−1); in a symplectic basis ρ\_{A,l} takes values in GSp_4(Q̄\_l) with multiplier ν∘ρ\_{A,l} = ε\_l^{−1}, and its GSp_4(Q̄\_l)-conjugacy class does not depend on λ. A family of GSp_4-valued representations is called a weakly (resp. strictly) compatible system when the underlying GL_4-valued family is; no compatibility between the symplectic forms is demanded, since every system considered has multiplier the inverse cyclotomic character. The residual representation ρ̄\_{A,p}: G_F → GSp_4(F̄\_p) is the dual of the Galois module A[p](F̄).

**Hypotheses.**
- F is a number field (totally real in every use from AP.1 on); A is an abelian variety of dimension 2 over F.
- Geometric Frobenius normalization: for v ∤ l of good reduction, ρ\_{A,l}(Frob_v) has characteristic polynomial X^4 − a_1X^3 + a_2X^2 − q_v a_1 X + q_v^2 with a_1, a_2 ∈ Z independent of l.

**Construction or proof.**
- Construct ρ\_{A,l} from the étale Tate module (A4) as the Q̄\_l-dual of V_lA ⊗ Q̄\_l, with its G_F action and continuity.
- Use the Weil pairing attached to a polarization (A3); it is alternating, perfect after inverting l, and G_F acts on its target through the cyclotomic character, which on H^1 gives the multiplier ε\_l^{−1}.
- Independence of λ: ρ\_{A,l} is semisimple (Faltings, R28.4), and a semisimple GSp_4-valued representation is determined up to GSp_4-conjugacy by its GL_4-valued representation and its multiplier (BCGP Lemma 2.1.3, owned by ArithmeticGaloisRepresentations G7).
- Strict compatibility and purity of 𝓡\_A are BCGP Proposition 2.8.1, imported from NeronModelsAndSemistableAbelianVarieties R11.5; the compatible-system API is PotentialModularityAndCompatibleSystems R24.5:operations.

**Uses.**
- BCGP18, Definitions 9.1.6 and 9.1.8: the automorphy and modularity of A are properties of 𝓡\_A and of ρ\_{A,p}.
- BCGP18, Lemma 9.2.2 and Definition 9.2.3: residual images ρ̄\_{A,l} and the good-prime conditions.
- BCGP18, Proposition 10.1.1 and Theorem 9.3.1: ρ\_{A,p} is fed to the lifting theorem; 𝓡\_A and ∧^2𝓡\_A to the potential automorphy argument.
- BCGP25 (Modularity theorems for abelian surfaces), §9: the consumer roadmap AbelianSurfacesModularity uses the same conventions.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.galoisRep` | data | ρ\_{A,l}: G_F → GL(H^1_ét(A_{F̄}, Q̄\_l)), continuous, of dimension 4. |
| `TauCeti.AbelianSurfaces.gspRep` | constructor | From a polarization λ, ρ\_{A,l}: G_F → GSp_4(Q̄\_l) preserving the Weil-pairing form up to the multiplier. |
| `TauCeti.AbelianSurfaces.multiplier_gspRep` | simp | ν∘ρ\_{A,l} = ε\_l^{−1}, for every polarization. |
| `TauCeti.AbelianSurfaces.gspRep_conj_indep` | characterisation | The GSp_4(Q̄\_l)-conjugacy class of gspRep λ does not depend on λ. |
| `TauCeti.AbelianSurfaces.charpoly_frob` | relation | For v ∤ l of good reduction, det(X − ρ\_{A,l}(Frob_v)) = X^4 − a_1X^3 + a_2X^2 − q_va_1X + q_v^2 with a_i ∈ Z independent of l. |
| `TauCeti.AbelianSurfaces.system` | structure | 𝓡\_A is a strictly compatible system, pure of weight 1, with Hodge–Tate weights {0,0,1,1} at each place above l. |
| `TauCeti.AbelianSurfaces.system_restrict` | functoriality | 𝓡\_{A_{F'}} = 𝓡\_A∣\_{G_{F'}} for a finite extension F'/F; isogenous surfaces have isomorphic systems. |
| `TauCeti.AbelianSurfaces.residual_dual` | other | ρ̄\_{A,p} is the dual of the G_F-module A[p](F̄); in particular A[p] ≅ ρ̄\_{A,p}^∨ as symplectic modules up to the multiplier twist. |
| `TauCeti.AbelianSurfaces.system_weilRestriction` | compatibility | For K/F finite and an elliptic curve or abelian variety B/K, 𝓡\_{Res_{K/F}B} ≅ Ind_{G_K}^{G_F} 𝓡\_B (A6). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.system_prod` | computation | For elliptic curves E_1, E_2/F and v of good reduction, det(X − ρ\_{E_1×E_2,l}(Frob_v)) = (X^2 − a_v(E_1)X + q_v)(X^2 − a_v(E_2)X + q_v). |
| `TauCeti.AbelianSurfaces.multiplier_elliptic` | non-example | For an elliptic curve E viewed through the same construction in dimension 1, det ρ\_{E,l} = ε\_l^{−1}; a definition using V_lA instead of H^1 gives multiplier ε\_l and fails Hypothesis 7.13.1(2). |
| `TauCeti.AbelianSurfaces.system_weilRestriction_quadratic` | compatibility | For K/F quadratic and E/K, ρ\_{Res_{K/F}E,l} ≅ Ind_{G_K}^{G_F} ρ\_{E,l}, a GSp_4-valued representation with multiplier ε\_l^{−1}. |
| `TauCeti.AbelianSurfaces.residual_dual_test` | characterisation | If A has a polarization of degree prime to p, then ρ̄\_{A,p} ⊗ ε̄ ≅ A[p](F̄) as G_F-modules (Weil pairing); for F = Q and p odd, ε̄ is nontrivial, so ρ̄\_{A,p} and A[p] are different modules in general. |

**Acceptance.**
- For A = E_1 × E_2 the system is 𝓡\_{E_1} ⊕ 𝓡\_{E_2}, with the product polarization giving the orthogonal sum of the two determinant pairings.
- ν∘ρ\_{A,l} = ε\_l^{−1}: the multiplier is the inverse cyclotomic character, as needed by Hypothesis 7.13.1(2) and Theorem 8.4.1(1).

**Prerequisites.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:Matrix.symplecticGroup`, `mathlib:Matrix.J`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A6`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ArithmeticGaloisRepresentations:G7`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

**Source.** BCGP18 Definition 2.8.2 and Remark 2.8.3, §2.8, pp. 36–37: Defines ρ\_{A,l} as H^1 of A over F̄ with GSp_4 values and multiplier ε\_l^{−1}, and says that a family of GSp_4-valued representations is a compatible system when the GL_4-valued family is; Proposition 2.8.1 just before it gives strict compatibility and purity.

<a id="ap0-automorphic-compatible-system"></a>
### AP.0/automorphic-compatible-system — Automorphic compatible systems over a number field

*Definition.* Planet: *Automorphic compatible system*.

**Statement.** Let K be a number field and 𝓡 a strictly compatible system of n-dimensional representations of G_K. 𝓡 is automorphic if there is an automorphic representation Π of GL_n(A_K) such that (1) Π = Π\_1 ⊞ ⋯ ⊞ Π\_r is an isobaric sum of C-algebraic cuspidal automorphic representations Π\_i of GL_{n_i}(A_K); (2) the fixed field M_Π ⊂ C of {σ ∈ Aut(C) : σΠ^∞ ≅ Π^∞} is a number field; (3) for every finite place v of K, WD_v(𝓡) ≅ ⊕\_i rec(Π\_{i,v} ⊗ |det|\_v^{(1−n_i)/2}). No condition is imposed at the infinite places. 𝓡 is potentially automorphic if 𝓡|\_{G_L} is automorphic for some finite extension L/K. When 𝓡 is automorphic with Π, the completed function Λ\_Π(𝓡,s) := L(𝓡,s)∏\_{v|∞}L_v(Π,s) continues meromorphically to C and satisfies Λ\_Π(𝓡,s) = ε(Π)N(Π)^{−s}Λ\_Π(𝓡^∨,1−s).

**Hypotheses.**
- rec is the local Langlands correspondence for GL_m over finite extensions of Q_p, with full Frobenius-semisimple Weil–Deligne parameters; WD_v(𝓡) is the common Frobenius-semisimple Weil–Deligne representation of the strictly compatible system at v.
- The coefficient field of Π is computed from its finite part Π^∞.

**Construction or proof.**
- Isobaric sums and strong multiplicity one for isobaric representations are imported from the automorphic spectral owner (AS.4).
- Condition (2) follows from (3) and strong multiplicity one; it is kept separate because it is the condition expected to follow from (1) alone. In the two cases used it holds: Π regular algebraic (Clozel), and Π the transfer to GL_4 of a cuspidal GSp_4 representation of parallel weight 2 and central character |·|^2 (Blasius–Harris–Ramakrishnan), as recorded in Remark 9.1.2.
- The functional equation (9.1.5) is the Godement–Jacquet functional equation for the Π\_i (AL.2), multiplied over i.

**Uses.**
- BCGP18, Definition 9.1.6: automorphy of an abelian variety is automorphy of 𝓡\_A.
- BCGP18, Theorem 9.3.1: 𝓡\_A and ∧^2𝓡\_A are shown automorphic over solvable subextensions.
- BCGP18, Proposition 9.4.1: Kummer surfaces through 𝓡\_A and Artin representations.
- BCGP18, (9.1.5): meromorphic continuation and functional equation of Λ\_Π(𝓡,s).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic` | data | The proposition that some isobaric Π satisfies (1)–(3) for 𝓡. |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsPotentiallyAutomorphic` | data | ∃ L/K finite with (𝓡∣\_{G_L}).IsAutomorphic. |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.unique` | characterisation | The Π in the definition is unique up to isomorphism (strong multiplicity one for isobaric representations). |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.coefficientField` | other | Condition (2) follows from (3); it holds automatically for regular algebraic Π and for transfers of parallel weight 2 GSp_4 forms. |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.functionalEquation` | relation | Λ\_Π(𝓡,s) continues meromorphically and Λ\_Π(𝓡,s) = ε(Π)N(Π)^{−s}Λ\_Π(𝓡^∨,1−s). |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.add` | functoriality | If 𝓡 and 𝓢 are automorphic with Π and Σ, then 𝓡 ⊕ 𝓢 is automorphic with Π ⊞ Σ. |
| `TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.dual` | functoriality | If 𝓡 is automorphic with Π then 𝓡^∨ is automorphic with the contragredient twisted isobaric sum. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.isAutomorphic_rank_one` | degenerate | For n = 1, a strictly compatible system of characters is automorphic exactly when it is the system of an algebraic Hecke character, and then Π is that character (twist ∣det∣^0). |
| `TauCeti.AbelianSurfaces.isAutomorphic_elliptic` | compatibility | For E/Q, 𝓡\_E is automorphic with Π\_E the cuspidal representation of the newform of E, and WD_v(𝓡\_E) ≅ rec(Π\_{E,v} ⊗ ∣det∣\_v^{−1/2}) at every finite v. |
| `TauCeti.AbelianSurfaces.isAutomorphic_product_not_cuspidal` | non-example | For non-isogenous E_1, E_2/Q, 𝓡\_{E_1×E_2} is automorphic with Π\_{E_1} ⊞ Π\_{E_2}; a definition demanding cuspidal Π would wrongly reject it. |
| `TauCeti.AbelianSurfaces.isAutomorphic_all_places` | non-example | Matching rec at almost all v does not satisfy (3): the definition demands the full Weil–Deligne match, including monodromy, at every finite place (Remark 9.1.4). |

**Acceptance.**
- The system of a non-CM elliptic curve over Q is automorphic with Π cuspidal on GL_2, matched with the twist |det|^{−1/2}.
- The system of E_1 × E_2 is automorphic with Π = Π\_1 ⊞ Π\_2, which is not cuspidal.

**Prerequisites.** `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, `PeriodsAndSpecialValues:PS.1`, `mathlib:NumberField.InfinitePlace`, `mathlib:Field.absoluteGaloisGroup`.

**Source.** BCGP18 Definition 9.1.1, Remarks 9.1.2–9.1.4 and (9.1.5), §9.1, pp. 250–251: Defines automorphy of a compatible system by an isobaric sum of C-algebraic cuspidal representations matching the Weil–Deligne representations at every finite place with the twists |det|^{(1−n_i)/2}, records when the coefficient-field condition is automatic, and states the functional equation of the completed L-function.

<a id="ap0-automorphic-abelian-variety"></a>
### AP.0/automorphic-abelian-variety — Automorphic and potentially automorphic abelian varieties

*Definition.* Planet: *Potentially automorphic abelian variety*.

**Statement.** An abelian variety A over a number field K is automorphic if 𝓡\_A is automorphic, and potentially automorphic if 𝓡\_A|\_{G_L} is automorphic for some finite extension L/K. If A is automorphic through a Π of one of the two forms (a) Π\_i regular algebraic, or (b) K totally real, Π cuspidal and the transfer to GL_4 of a cuspidal GSp_4 representation of parallel weight 2 and central character |·|^2, then the archimedean factors and conductor of Π agree with those of 𝓡\_A, so Λ\_Π(𝓡\_A,s) = Λ(𝓡\_A,s) and Λ(𝓡\_A,s) has meromorphic continuation and the expected functional equation.

**Hypotheses.**
- K is a number field and A/K an abelian variety; 𝓡\_A = (H^1_ét(A_{K̄}, Q̄\_l))\_l.

**Construction or proof.**
- Unfold the definition through automorphic-compatible-system.
- Remark 9.1.7: in cases (a) and (b) the Gamma factors L_v(Π,s), v|∞, are those of the Hodge structure of A and the conductor N(Π) is the Artin conductor of 𝓡\_A, because the conductor respects local Langlands; so the two functional equations (2.8.5) and (9.1.5) coincide.

**Uses.**
- BCGP18, Proposition 9.2.1: abelian surfaces not of type A or B[C_2] are shown potentially automorphic.
- BCGP18, Theorem 9.3.1 and Theorem 1.1.3: every abelian surface over a totally real field is potentially automorphic.
- BCGP18, Proposition 9.4.1: Kummer surfaces.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic` | data | (𝓡\_A).IsAutomorphic. |
| `TauCeti.AbelianSurfaces.AbelianVariety.IsPotentiallyAutomorphic` | data | ∃ L/K finite, (𝓡\_A∣\_{G_L}).IsAutomorphic. |
| `TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.isogeny` | characterisation | Isogenous abelian varieties are automorphic together. |
| `TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.completedL` | relation | In cases (a) and (b), Λ\_Π(𝓡\_A,s) = Λ(𝓡\_A,s), hence Λ(𝓡\_A,s) continues meromorphically with the functional equation of Conjecture 2.8.6 for i = 1. |
| `TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.prod` | functoriality | A × B is automorphic when A and B are. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.isAutomorphic_ellipticQ` | compatibility | An elliptic curve E/Q is automorphic, with Π the cuspidal representation of its newform, so this notion extends the modularity of elliptic curves. |
| `TauCeti.AbelianSurfaces.isAutomorphic_cm` | degenerate | An abelian variety with complex multiplication defined over K is automorphic through an isobaric sum of algebraic Hecke characters (types D and F become this after a finite extension). |
| `TauCeti.AbelianSurfaces.isAutomorphic_restrictionOfScalars` | computation | For K/F quadratic and E/K automorphic through Π\_E, Res_{K/F}E is automorphic through the automorphic induction of Π\_E when that induction is defined. |
| `TauCeti.AbelianSurfaces.isAutomorphic_vs_modular` | non-example | For E_1 × E_2 over a totally real F, A is automorphic through the non-cuspidal Π\_1 ⊞ Π\_2, while modularity in the sense of Definition 9.1.8 asks for a cuspidal GSp_4 form; the two notions differ off general type (Remark 9.1.9). |

**Acceptance.**
- An elliptic curve over Q is automorphic.
- A CM abelian variety is automorphic through an isobaric sum of algebraic Hecke characters.

**Prerequisites.** [`AP.0/automorphic-compatible-system`](#ap0-automorphic-compatible-system), [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `PeriodsAndSpecialValues:PS.1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

**Source.** BCGP18 Definition 9.1.6 and Remark 9.1.7, §9.1, p. 251: Defines (potential) automorphy of an abelian variety through its compatible system and explains why, in the two cases of Remark 9.1.2, the completed L-function of the system equals that of the variety.

<a id="ap0-modular-gsp4-representation"></a>
### AP.0/modular-gsp4-representation — Modular and potentially modular GSp_4-representations and abelian surfaces

*Definition.* Planet: *Modular GSp4-representation*.

**Statement.** Let F be totally real. A continuous ρ: G_F → GSp_4(Q̄\_p) is modular if there is a cuspidal automorphic representation π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 such that WD(ρ|\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π\_v ⊗ |ν|^{−3/2}) for every finite place v of F; in particular ρ ≅ ρ\_{π,p}. ρ is potentially modular if ρ|\_{G_{F'}} is modular for some finite Galois extension F'/F of totally real fields. An abelian surface A/F is modular (resp. potentially modular) if ρ\_{A,p} is, for some prime p; this does not depend on p. Both versions of the paper print WD(ρ\_{π,p}|\_{G_{F_v}}) where WD(ρ|\_{G_{F_v}}) is meant; the definition is used in the corrected form.

**Hypotheses.**
- Parallel weight 2: at every real place π\_v lies in the archimedean L-packet of weight (2,2) (holomorphic and generic limits of discrete series), in the conventions of BCGP §2.6, owned by the GSp_4 Part II of ModularityAndLanglandsExtensions.
- rec_{GT,p} is Gan–Takeda's local Langlands correspondence for GSp_4 transported to Q̄\_p, normalized as in BCGP §2.3.

**Construction or proof.**
- Unfold; ρ ≅ ρ\_{π,p} follows from the match at unramified places, Chebotarev and Brauer–Nesbitt applied to the semisimple GL_4-valued representations, upgraded to GSp_4 by Lemma 2.1.3 (G7).
- Independence of p for abelian surfaces: 𝓡\_A is strictly compatible (R11.5), so the Weil–Deligne representations of ρ\_{A,p'} at every finite v agree with those of ρ\_{A,p}; the Galois representations attached to π at p' are compatible with π at all v.
- Remark 9.1.9: when the transfer of π to GL_4 is cuspidal (π of general type), a modular A is automorphic in the sense of Definition 9.1.6, case (b) of Remark 9.1.2.

**Uses.**
- BCGP18, Corollary 8.2.2, Lemma 8.3.2 and Theorem 8.4.1: the conclusion of the lifting theorems is that ρ is modular in this sense.
- BCGP18, Theorem 9.2.8: challenging abelian surfaces are potentially modular.
- BCGP18, Proposition 10.1.1 and Theorem 10.2.6: modularity of specific abelian surfaces.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.GSpRep.IsModular` | data | ∃ π cuspidal of parallel weight 2 and central character ∣·∣^2 with WD(ρ∣\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π\_v ⊗ ∣ν∣^{−3/2}) for all finite v. |
| `TauCeti.AbelianSurfaces.GSpRep.IsPotentiallyModular` | data | ∃ F'/F finite Galois, F' totally real, (ρ∣\_{G_{F'}}).IsModular. |
| `TauCeti.AbelianSurfaces.AbelianSurface.IsModular` | data | ∃ p, (ρ\_{A,p}).IsModular. |
| `TauCeti.AbelianSurfaces.AbelianSurface.isModular_iff_forall` | characterisation | A is modular iff ρ\_{A,p} is modular for every p. |
| `TauCeti.AbelianSurfaces.GSpRep.IsModular.multiplier` | simp | If ρ is modular then ν∘ρ = ε^{−1}. |
| `TauCeti.AbelianSurfaces.GSpRep.IsModular.isPotentiallyModular` | other | Modular implies potentially modular with F' = F. |
| `TauCeti.AbelianSurfaces.AbelianSurface.IsModular.isAutomorphic` | compatibility | If the form π is of general type, a modular A is automorphic (Definition 9.1.6, case (b) of Remark 9.1.2). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.isModular_multiplier` | characterisation | A modular ρ satisfies ν∘ρ = ε^{−1}; a definition with trivial central character instead of ∣·∣^2 would give the wrong multiplier and fail Theorem 8.4.1(1). |
| `TauCeti.AbelianSurfaces.isModular_printed_vacuous` | non-example | With the printed condition WD(ρ\_{π,p}∣\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π\_v ⊗ ∣ν∣^{−3/2}), any ρ would be 'modular' as soon as some π exists; the corrected definition forces ρ ≅ ρ\_{π,p}, so ρ\_{π,p} ⊗ χ for a nontrivial quadratic character χ is not modular through π. |
| `TauCeti.AbelianSurfaces.isModular_restrict` | degenerate | Taking F' = F shows every modular ρ is potentially modular. |
| `TauCeti.AbelianSurfaces.isModular_indep_prime` | compatibility | For an abelian surface A, ρ\_{A,3} is modular iff ρ\_{A,5} is modular. |

**Acceptance.**
- A modular ρ has multiplier ε^{−1}.
- Modular implies potentially modular with F' = F.

**Prerequisites.** [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), [`AP.0/automorphic-abelian-variety`](#ap0-automorphic-abelian-variety), `ModularityAndLanglandsExtensions:ML.0`, `ModularityAndLanglandsExtensions:ML.4`, `ArithmeticGaloisRepresentations:G7`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, Tau Ceti Chebotarev (layer 10), `mathlib:NumberField.IsTotallyReal`.

**Source.** BCGP18 Definition 9.1.8 and Remark 9.1.9, §9.1, p. 251: Defines modular and potentially modular GSp_4-valued representations and abelian surfaces by a cuspidal parallel weight 2 form with central character |·|^2 and Gan–Takeda local–global compatibility at every finite place; the remark restricts the results to general type.

<a id="ap0-weight-two-galois"></a>
### AP.0/weight-two-galois — Galois representations of ordinary parallel weight 2 forms on GSp_4

*Theorem.* Planet: *Galois representations of weight two*.

**Statement.** Let F^+ be totally real, p a prime splitting completely in F^+, and π a cuspidal automorphic representation of GSp_4(A_{F^+}) of parallel weight 2 (algebraic of weight (1,1;2) at every real place, with π\_∞ a non-degenerate limit of discrete series) and central character |·|^2, ordinary at every place above p. Then there is a continuous semisimple ρ\_{π,p}: G_{F^+} → GSp_4(Q̄\_p) such that (i) ν∘ρ\_{π,p} = ε^{−1}; (ii) for every finite v ∤ p, WD(ρ\_{π,p}|\_{G_{F^+\_v}})^{ss} ≅ rec_{GT,p}(π\_v ⊗ |ν|^{−3/2})^{ss}; (iii) for every v | p there are potentially unramified characters α\_v, β\_v of G_{F^+\_v} with ρ\_{π,p}|\_{G_{F^+\_v}} conjugate to an upper triangular representation with diagonal (α\_v, β\_v, β\_v^{−1}ε^{−1}, α\_v^{−1}ε^{−1}), the diagonal being read off from the ordinary p-stabilization of π\_v. No hypothesis p > 2, no residual image condition and no distinctness of the ordinary Hecke parameters is assumed; de Rhamness at p is not asserted. The statement depends on Arthur's classification for GSp_4 through the regular weight input, whose conditional status is carried as recorded at ModularityAndLanglandsExtensions ML.0 and ML.4.

**Hypotheses.**
- F^+ totally real; p splits completely in F^+.
- π cuspidal, of parallel weight 2 and central character |·|^2, ordinary at every v | p.
- Arthur's multiplicity formula for GSp_4 (BCGP18 §1.4.1), in the conditional form recorded by ModularityAndLanglandsExtensions.

**Construction or proof.**
- π^∞ occurs in the interior coherent cohomology of the Hilbert–Siegel variety (Harris; imported with the coherent Hecke complexes).
- π defines a point x of the equidimensional higher Coleman eigenvariety, which dominates weight space and in which classical points of regular algebraic weight are Zariski dense near x (Boxer–Pilloni, Higher Coleman theory, Theorem 1.4.3; HigherHidaAndColemanTheory E6). Choose an affinoid neighbourhood, inside an ordinary component when π is ordinary.
- At the dense regular points the Galois representations of regular weight (BCGP25 Theorem 1.8.13 = BCGP18 Theorem 2.7.1, owned by the GSp_4 Part II of ModularityAndLanglandsExtensions) give GSp_4-valued pseudocharacters (the connected reductive pseudocharacters of IntegralHeckeAndGaloisDeterminants IHG.0); interpolate them over the affinoid (IHG.4, extended to affinoid coefficients) and specialize at x to obtain, by reconstruction over Q̄\_p (IHG.1; V. Lafforgue, Quast), a semisimple ρ\_{π,p}.
- ∧^2ρ\_{π,p} contains ε^{−1} by interpolation, which gives the symplectic pairing with multiplier ε^{−1}; (ii) is the standard interpolation of semisimplified Weil–Deligne representations away from p; (iii) is interpolation of the ordinary filtration on the ordinary component (compare Boxer–Pilloni Theorem 1.4.8).

**Acceptance.**
- (i) gives multiplier ε^{−1}, which Hypothesis 7.8.1(5) and Hypothesis 7.13.1(6) use to compare ρ̄\_{π,p} with ρ̄.
- For π of general type with ρ\_{π,p} pure, the semisimplified compatibility upgrades to full Frobenius-semisimple compatibility (BCGP25 Remark 1.8.20), which is how Corollary 8.2.2 matches monodromy.

**Prerequisites.** `HigherHidaAndColemanTheory:E6/eigenvariety`, `HigherHidaAndColemanTheory:E6/classical-points`, `HigherHidaAndColemanTheory:E6/interior-equidimension`, `ModularityAndLanglandsExtensions:ML.4`, `IntegralHeckeAndGaloisDeterminants:IHG.0`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `AutomorphicBundles:B5`, `ModularityAndLanglandsExtensions:ML.0`, `mathlib:NumberField.IsTotallyReal`, `mathlib:Field.absoluteGaloisGroup`.

**Source.** BCGP25 Theorem 1.8.17 with (1.8.18)–(1.8.19), Definition 1.8.16 and Remark 1.8.15, §1.8, pp. 13–14: States the existence of a semisimple GSp_4-valued representation for an ordinary weight 2 representation over a totally real field in which p splits, with multiplier ε^{−1}, semisimplified local–global compatibility away from p and the ordinary triangular shape at p, and sketches its proof by interpolation over the Boxer–Pilloni eigenvariety.; BCGP18 Corollary 7.9.6, §7.9, pp. 220–221: The 2018 paper constructs the same representation in parallel weight 2 under extra residual hypotheses, by the Hida-family route of Theorem 7.9.4.

## AP.1. The Taylor–Wiles set-up for GSp_4 over a totally real field

For F totally real, p ≥ 3 split in F and ρ̄: G_F → GSp_4(k) absolutely irreducible: the standing hypotheses (vast and tidy image, p-distinguished weight 2 ordinary at p, Ihara-avoidance places R with q_v ≡ 1 mod p, mod 9 if p = 3) and the auxiliary place v_0 (Hypotheses 7.7.1, 7.8.1); the global deformation problems S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠} for I ⊆ S_p over the weight algebras Λ\_I (§7.7); the tame levels K^p, K_0^p(Q), K_1^p(Q), K_0^p(Q,R) and their neatness (Definition 7.8.2, Lemma 7.8.3); weights of Λ\_I, classical weights, κ\_2 and κ\_reg (Definition 7.8.8); the Hida–Hecke modules M^{χ,I,𝔠} and M^{χ,I,𝔠,Q}, obtained by RHom^0-duality from the higher Hida complexes at these levels and localized at m̃^{I,𝔠} (7.8.4), with their Hecke algebras; Proposition 7.8.11: M^{χ,∅,𝔠,Q} is finite free over Λ\_∅[Δ\_Q] and, for #I = 1, M^{χ,I,𝔠,Q} is balanced over Λ\_I[Δ\_Q].

<a id="ap1-standing-hypotheses"></a>
### AP.1/standing-hypotheses — The standing hypotheses on ρ̄ and the auxiliary place v_0

*Definition.*

**Statement.** Let F be totally real, p ≥ 3 a prime splitting completely in F, S_p the places above p, k a finite field of characteristic p and ρ̄: G_F → GSp_4(k) absolutely irreducible. Hypothesis 7.7.1 asks: (1) ρ̄ is vast and tidy; (2) ρ̄|\_{G_{F_v}} is p-distinguished weight 2 ordinary for v ∈ S_p; (3) there is a finite set R of finite places disjoint from S_p such that for v ∈ R, ρ̄|\_{G_{F_v}} is trivial and q_v ≡ 1 mod p (mod 9 if p = 3), and ρ̄ is unramified outside S_p ∪ R. Hypothesis 7.8.1 adds an ordinary cuspidal automorphic π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ̄\_{π,p} ≅ ρ̄, π\_v^{Iw(v)} ≠ 0 for v ∈ R ∪ S_p and π\_v unramified otherwise. Under either hypothesis fix an auxiliary place v_0 ∉ R ∪ S_p, absolutely unramified, with q_{v_0} ≢ 1 mod p, no two eigenvalues of ρ̄(Frob_{v_0}) of ratio q_{v_0}, and residue characteristic > 5; put S = R ∪ S_p ∪ {v_0} and ψ = ε^{−1}.

**Hypotheses.**
- p ≥ 3; F totally real and p totally split in F.
- Vast, tidy and enormous are the residual-image conditions of BCGP Definitions 7.5.2, 7.5.6 and 7.5.11, owned by ArithmeticGaloisRepresentations G7; p-distinguished weight 2 ordinary is Definition 7.3.1, owned by LocalGaloisDeformationRings.

**Construction or proof.**
- Existence of v_0: tidiness of ρ̄(G_F) and Chebotarev give a positive density of v with the four properties; 'absolutely unramified' is needed for Lemma 7.8.3 and is stated explicitly in §7.13(8).
- Local duality gives H^2(F_{v_0}, ad ρ̄) ≅ H^0(F_{v_0}, ad ρ̄(1))^∨, which vanishes by the eigenvalue-ratio condition; then every lift of ρ̄|\_{G_{F_{v_0}}} is unramified (Proposition 7.4.2, LocalGaloisDeformationRings R08.2).
- Hypothesis 7.8.1 implies Hypothesis 7.7.1 by inclusion of its clauses.

**Uses.**
- BCGP18, §7.7: defines the global deformation problems S_χ^{I,𝔠}.
- BCGP18, Definition 7.8.2 and Lemma 7.8.3: the level at v_0 is Iw_1(v_0), which makes all levels neat.
- BCGP18, Theorem 7.9.4 and Proposition 7.11.2: standing hypotheses of the Taylor–Wiles systems and the patching.
- BCGP18, Remark 7.13.2: Hypothesis 7.13.1 implies Hypothesis 7.8.1.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.TWHypothesis` | data | Hypothesis 7.7.1 for (F, p, ρ̄, R) as a structure of propositions. |
| `TauCeti.AbelianSurfaces.LiftingHypothesis` | data | Hypothesis 7.8.1: TWHypothesis plus the automorphic seed π with its level conditions. |
| `TauCeti.AbelianSurfaces.LiftingHypothesis.toTWHypothesis` | projection | Hypothesis 7.8.1 implies Hypothesis 7.7.1. |
| `TauCeti.AbelianSurfaces.exists_auxPlace` | constructor | Under TWHypothesis there is v_0 with the four properties (absolutely unramified, q_{v_0} ≢ 1 mod p, no eigenvalue ratio q_{v_0}, residue characteristic > 5); the set of such v_0 has positive Dirichlet density. |
| `TauCeti.AbelianSurfaces.auxPlace_H2_eq_zero` | relation | H^2(F_{v_0}, ad ρ̄) = 0. |
| `TauCeti.AbelianSurfaces.auxPlace_lifts_unramified` | other | Every lift of ρ̄∣\_{G_{F_{v_0}}} to a complete Noetherian local O-algebra is unramified. |
| `TauCeti.AbelianSurfaces.badSet` | data | S = R ∪ S_p ∪ {v_0}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.ihara_place_mod9` | computation | For p = 3, F = Q: q_v = 19 and q_v = 37 satisfy q_v ≡ 1 mod 9 and may lie in R; q_v = 7 satisfies q_v ≡ 1 mod 3 but not mod 9 and may not. |
| `TauCeti.AbelianSurfaces.split_required` | non-example | F = Q(√2), p = 3: 3 is inert in F, so no ρ̄ over F satisfies the hypotheses at p = 3; F = Q(√7), p = 3 is admissible since 3 splits. |
| `TauCeti.AbelianSurfaces.emptyR` | degenerate | R = ∅ is allowed; then S = S_p ∪ {v_0} and the Ihara-avoidance places are absent. |
| `TauCeti.AbelianSurfaces.auxPlace_neat` | characterisation | Any level with pro-v_0 Iwahori component Iw_1(v_0) at the chosen v_0 is neat (Lemma 7.8.3), because v_0 is absolutely unramified of residue characteristic > 5. |

**Acceptance.**
- For p = 3 and F = Q, 19 and 37 may lie in R, while 7 may not (7 ≢ 1 mod 9).
- H^2(F_{v_0}, ad ρ̄) = 0.

**Prerequisites.** `ArithmeticGaloisRepresentations:G7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `ArithmeticGaloisDuality:D7`, Tau Ceti Chebotarev (layer 10), [`AP.0/weight-two-galois`](#ap0-weight-two-galois), `ModularityAndLanglandsExtensions:ML.4`, `mathlib:NumberField.IsTotallyReal`, `mathlib:Field.absoluteGaloisGroup`.

**Source.** BCGP18 Hypothesis 7.7.1 and the choice of v_0, §7.7, p. 210; Hypothesis 7.8.1, §7.8, p. 211: States the residual hypotheses (vast and tidy, p-distinguished weight 2 ordinary at p, trivial residual representation and q_v ≡ 1 mod p, or mod 9 for p = 3, at the Ihara-avoidance places), the automorphic seed of Hypothesis 7.8.1(5), and the choice of the auxiliary place v_0 with its consequences.

<a id="ap1-deformation-problems"></a>
### AP.1/deformation-problems — The global deformation problems S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠}

*Definition.* Planet: *Ordinary GSp4 deformation problems*.

**Statement.** Assume Hypothesis 7.7.1 with S = R ∪ S_p ∪ {v_0}. Choose I ⊆ S_p (I^c = S_p ∖ I); for v ∈ R a pair χ\_v = (χ\_{v,1}, χ\_{v,2}) of characters O_{F_v}^× → O^× trivial mod λ; for v ∈ I, Λ\_v = O[[O_{F_v}^×(p)]] with universal character θ\_v, and for v ∈ I^c, Λ\_v = O[[O_{F_v}^×(p)^2]] with θ\_{v,1}, θ\_{v,2}; and 𝔠 = (𝔠\_v)\_{v∈S_p} with 𝔠\_v ∈ {ᾱ\_v, β̄\_v}. Then S_χ^{I,𝔠} is the problem of deformations of ρ̄ with multiplier ε^{−1}, unramified outside S, over the coefficient ring Λ\_I = ⊗̂\_{v∈S_p}Λ\_v, with local conditions D_v^P (v ∈ I, Klingen-parabolic ordinary), D_v^{B,𝔠\_v} (v ∈ I^c, Borel ordinary with the unit eigenvalue lifting 𝔠\_v), D_v^{χ\_v} (v ∈ R, Ihara avoidance) and D_{v_0}^□ (unrestricted). For a Taylor–Wiles datum (Q, (ᾱ\_{v,1},…,ᾱ\_{v,4})\_{v∈Q}), S_{χ,Q}^{I,𝔠} is the same problem with ramification allowed in S_Q = S ∪ Q and the unrestricted condition at v ∈ Q; it is a problem over Λ\_I[Δ\_Q]. Neither problem depends on 𝔠\_v for v ∈ I.

**Hypotheses.**
- The local problems D_v^P, D_v^{B,𝔠\_v} (§7.3) and D_v^χ (§7.4.5) and their rings are owned by LocalGaloisDeformationRings; Taylor–Wiles data and Δ\_Q (§7.6) by GlobalGaloisDeformations.
- The paper prints the Taylor–Wiles datum with n eigenvalues; there are four.

**Construction or proof.**
- Assemble the global problem from the local problems with the formalism of global deformation problems with fixed multiplier (GlobalGaloisDeformations R04.1–R04.3, G7) and Λ\_I-coefficients from the completed group rings (PadicMeasuresIwasawaAlgebras L1).
- Representability of R_{S_χ^{I,𝔠}} and R_{S_{χ,Q}^{I,𝔠}} follows from absolute irreducibility of ρ̄ (R04.2); the Λ\_I[Δ\_Q]-algebra structure comes from the inertia action at v ∈ Q (Lemma 7.4.4 and the O[Δ\_v]-structure, LocalGaloisDeformationRings R08.2).
- Independence of 𝔠\_v for v ∈ I: the Klingen-parabolic condition does not choose an eigenvalue.

**Uses.**
- BCGP18, Theorem 7.9.4: the Hida–Hecke representations are deformations of type S_{χ,Q}^{I,𝔠}.
- BCGP18, §7.11: R_N^{χ,I,𝔠} = R_{S_{χ,Q_N}^{I,𝔠}} are the rings that are patched.
- BCGP18, (7.13.3): points x of Spec R^{1,I,𝔠}[1/p] give the primes 𝔭\_x.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.globalProblem` | data | S_χ^{I,𝔠} as a global deformation problem with fixed multiplier ε^{−1} over Λ\_I. |
| `TauCeti.AbelianSurfaces.globalProblemTW` | constructor | S_{χ,Q}^{I,𝔠} for a Taylor–Wiles datum Q, over Λ\_I[Δ\_Q]. |
| `TauCeti.AbelianSurfaces.univRing` | universal-property | R_{S} represents deformations of type S; for every complete Noetherian local Λ\_I-algebra A, Hom(R_S, A) is the set of strict-equivalence classes of deformations of type S over A. |
| `TauCeti.AbelianSurfaces.globalProblem_indep_I` | characterisation | S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠} depend on 𝔠 only through (𝔠\_v)\_{v ∈ I^c}. |
| `TauCeti.AbelianSurfaces.univRing_modLambda` | relation | R_{S_χ^{I,𝔠}}/λ ≅ R_{S_1^{I,𝔠}}/λ, compatibly with the local rings. |
| `TauCeti.AbelianSurfaces.univRingTW_coinvariants` | relation | R_{S_{χ,Q}^{I,𝔠}} ⊗\_{Λ\_I[Δ\_Q]} Λ\_I ≅ R_{S_χ^{I,𝔠}}. |
| `TauCeti.AbelianSurfaces.globalProblem_restrict_I` | functoriality | For I ⊆ I', the closed immersion Spec Λ\_{I'} → Spec Λ\_I (θ\_{v,1} = θ\_{v,2} for v ∈ I') carries S_χ^{I,𝔠} to a problem whose specialization contains S_χ^{I',𝔠}. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.lambda_rank_Q` | computation | For F = Q (S_p = {p}): I = {p} gives Λ\_I = O[[Z_p^×(p)]] ≅ O[[T]], and I = ∅ gives Λ\_∅ = O[[(Z_p^×(p))^2]] ≅ O[[T_1, T_2]]. |
| `TauCeti.AbelianSurfaces.emptyTW` | degenerate | S_{χ,∅}^{I,𝔠} = S_χ^{I,𝔠} and Δ\_∅ is trivial. |
| `TauCeti.AbelianSurfaces.indep_c_full` | characterisation | For I = S_p the problem does not depend on 𝔠 at all. |
| `TauCeti.AbelianSurfaces.tw_four_eigenvalues` | non-example | A Taylor–Wiles datum records four eigenvalues ᾱ\_{v,1},…,ᾱ\_{v,4} of ρ̄(Frob_v); a datum with a different number of entries (the printed n) does not define the problem. |

**Acceptance.**
- For χ = 1 and χ nontrivial the problems agree modulo λ.
- The empty Taylor–Wiles datum gives back S_χ^{I,𝔠}.

**Prerequisites.** [`AP.1/standing-hypotheses`](#ap1-standing-hypotheses), `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:R04.1`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:L8`, `LocalGaloisDeformationRings:R08.2`, `PadicMeasuresIwasawaAlgebras:L1`.

**Source.** BCGP18 §7.7, the two displayed problems after Hypothesis 7.7.1, p. 210: Defines the global problems S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠} from the P-ordinary, (B,𝔠\_v)-ordinary, Ihara-avoidance and unrestricted local conditions, over the weight algebras Λ\_v, and notes the independence of 𝔠\_v for v ∈ I.

<a id="ap1-tame-levels"></a>
### AP.1/tame-levels — The tame levels K^p, K_0^p(Q), K_1^p(Q) and K_0^p(Q,R)

*Definition.*

**Statement.** Assume Hypothesis 7.8.1 with v_0 chosen. K^p = ∏\_v K_v ⊂ GSp_4(A_F^{∞,p}) has K_v = GSp_4(O_{F_v}) for v ∉ S_p ∪ R ∪ {v_0} and K_v = Iw_1(v) for v ∈ R ∪ {v_0}, where Iw(v) and Iw_1(v) are the preimages in GSp_4(O_{F_v}) of the Borel B(k(v)) and of its unipotent radical U(k(v)), so Iw(v)/Iw_1(v) ≅ T(k(v)). For a Taylor–Wiles datum Q, K_0^p(Q) and K_1^p(Q) agree with K^p away from Q and are Iw(v), resp. Iw_1(v), at v ∈ Q; K_0^p(Q,R) agrees with K^p away from Q ∪ R and is Iw(v) at v ∈ Q ∪ R; and K_1^p(Q,R) := K_1^p(Q). Then K_1^p(Q) ⊂ K_0^p(Q,R) with quotient ∏\_{v∈Q∪R} T(k(v)), and K_pK^p, K_pK_0^p(Q), K_pK_1^p(Q) are neat for every compact open K_p ⊂ GSp_4(F ⊗ Q_p) (Lemma 7.8.3 at v = v_0).

**Hypotheses.**
- T ⊂ B ⊂ GSp_4 are the diagonal torus and upper triangular Borel in the paper's coordinates (BCGP §2.1.1).

**Construction or proof.**
- Define the factors place by place; the index computation is the Bruhat decomposition of GSp_4 over k(v).
- Neatness: Lemma 7.8.3 (owned by ShimuraData D5) applies because v_0 is absolutely unramified with residue characteristic > 5 and the component at v_0 is Iw_1(v_0).

**Uses.**
- BCGP18, (7.8.4) and the modules M^{χ,I,𝔠,Q}: the Taylor–Wiles modules are cohomology at level K_pK_1^p(Q).
- BCGP18, Proposition 7.8.10: K_1^p(Q,R) ⊂ K_0^p(Q,R) is a finite étale cover with group ∏ T(k(v)).
- BCGP18, Definition 7.13.4: the levels K^{p,Iw} and K^{p,Iw_1} of the multiplicity argument.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.tameLevel` | data | K^p. |
| `TauCeti.AbelianSurfaces.tameLevel0` | constructor | K_0^p(Q). |
| `TauCeti.AbelianSurfaces.tameLevel1` | constructor | K_1^p(Q) = K_1^p(Q,R). |
| `TauCeti.AbelianSurfaces.tameLevel0R` | constructor | K_0^p(Q,R). |
| `TauCeti.AbelianSurfaces.tameLevel1_le_tameLevel0R` | relation | K_1^p(Q) ⊂ K_0^p(Q,R) with quotient ∏\_{v ∈ Q ∪ R} T(k(v)). |
| `TauCeti.AbelianSurfaces.iwahori_quotient` | other | Iw(v)/Iw_1(v) ≅ T(k(v)), the k(v)-points of the diagonal torus of GSp_4. |
| `TauCeti.AbelianSurfaces.isNeat` | characterisation | K_pK^p, K_pK_0^p(Q) and K_pK_1^p(Q) are neat for all compact open K_p. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.iwahori_index` | computation | [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1); for q_v = 7 this is 64·50 = 3200. |
| `TauCeti.AbelianSurfaces.pro_iwahori_index` | computation | [Iw(v) : Iw_1(v)] = (q_v − 1)^3; for q_v = 7 this is 216. |
| `TauCeti.AbelianSurfaces.emptyQ` | degenerate | K_0^p(∅) = K_1^p(∅) = K^p and K_0^p(∅,R) has Iwahori level exactly at R. |
| `TauCeti.AbelianSurfaces.neat_needs_v0` | non-example | Without the factor Iw_1(v_0), a level with K_v = GSp_4(O_{F_v}) at every v ∉ S_p ∪ R is not neat: it contains −1, whose eigenvalue −1 is a nontrivial root of unity. |

**Acceptance.**
- [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1) is prime to p when q_v ≡ 1 mod p and p > 2.
- [Iw(v) : Iw_1(v)] = (q_v − 1)^3.

**Prerequisites.** [`AP.1/standing-hypotheses`](#ap1-standing-hypotheses), `ShimuraData:D5`, `ModularityAndLanglandsExtensions:ML.4`, `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source.** BCGP18 Definition 7.8.2 and Lemma 7.8.3, §7.8, pp. 211–212: Defines the tame levels at the Ihara-avoidance, auxiliary and Taylor–Wiles places and proves that a level with pro-v Iwahori component at an absolutely unramified place of residue characteristic greater than 5 is neat.

<a id="ap1-weights"></a>
### AP.1/weights — Weights of Λ\_I, classical weights, κ\_2 and κ\_reg

*Definition.*

**Statement.** Fix I ⊆ S_p and Λ\_I = ⊗̂\_{v∈S_p}Λ\_v. A weight is an O-algebra homomorphism κ: Λ\_I → O; it corresponds to characters θ\_{v,1}, θ\_{v,2}: I_{F_v} → O^× (v ∈ S_p) with trivial reduction and θ\_{v,1} = θ\_{v,2} for v ∈ I; 𝔭\_κ = ker κ. κ is classical if there are integers k_v ≥ l_v ≥ 2 with θ\_{v,1} = ε^{(k_v+l_v)/2−2}, θ\_{v,2} = ε^{(k_v−l_v)/2}, and l_v = 2 for v ∈ I; then k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1), and ω^κ is the automorphic vector bundle of weight (k_v, l_v)\_v. κ\_2 is the classical weight k_v = l_v = 2 for all v. For I = ∅, κ\_reg is a sufficiently regular classical weight, for example θ\_{v,1} = ε^{2N(p−1)}, θ\_{v,2} = ε^{N(p−1)} for N large, chosen so that the classicality and automorphic-description theorems apply in weight κ\_reg.

**Hypotheses.**
- Λ\_v as in the deformation problems; ε is the p-adic cyclotomic character restricted to inertia.

**Construction or proof.**
- Weights are points of Spec Λ\_I, and characters of inertia with trivial reduction correspond to homomorphisms of the completed group rings (PadicMeasuresIwasawaAlgebras L1).
- The congruence k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1) is the condition that both ε-powers have trivial reduction, i.e. are divisible by p−1.
- κ\_reg is fixed so that Theorem 3.10.1 (IntegralCoherentHeckeComplexes) and Theorem 6.6.5 (higher Hida/Coleman comparison) apply (Remark 7.8.9).

**Uses.**
- BCGP18, Theorem 7.9.4 (case I = ∅): density of the classical weights with k_v ≥ l_v ≥ 4 in Spec Λ\_∅.
- BCGP18, (7.13.3) and the spaces S^{I,𝔠}\_κ: specialization at κ\_2 and κ\_reg.
- BCGP18, Proposition 7.13.11: dimension counts in weight κ\_reg.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.Weight` | data | κ: Λ\_I →ₐ[O] O, equivalently (θ\_{v,1}, θ\_{v,2})\_v with θ\_{v,1} = θ\_{v,2} on I. |
| `TauCeti.AbelianSurfaces.Weight.prime` | projection | 𝔭\_κ = ker κ, a prime of Λ\_I with Λ\_I/𝔭\_κ ≅ O. |
| `TauCeti.AbelianSurfaces.Weight.IsClassical` | data | ∃ (k_v ≥ l_v ≥ 2), θ\_{v,1} = ε^{(k_v+l_v)/2−2}, θ\_{v,2} = ε^{(k_v−l_v)/2}, l_v = 2 on I. |
| `TauCeti.AbelianSurfaces.weightTwo` | constructor | κ\_2, with k_v = l_v = 2 for all v. |
| `TauCeti.AbelianSurfaces.weightReg` | constructor | κ\_reg(N), with θ\_{v,1} = ε^{2N(p−1)} and θ\_{v,2} = ε^{N(p−1)}. |
| `TauCeti.AbelianSurfaces.Weight.IsClassical.congruence` | relation | k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1). |
| `TauCeti.AbelianSurfaces.Weight.IsClassical.bundle` | other | A classical κ determines the automorphic bundle ω^κ of weight (k_v, l_v)\_v on the Hilbert–Siegel variety. |
| `TauCeti.AbelianSurfaces.Weight.restrict` | functoriality | Weights of Λ\_{I'} for I ⊆ I' are the weights of Λ\_I with θ\_{v,1} = θ\_{v,2} for v ∈ I'; classical ones have l_v = 2 on I'. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.weightTwo_trivial` | computation | κ\_2 has θ\_{v,1} = θ\_{v,2} = 1, so 𝔭\_{κ\_2} is the augmentation ideal of Λ\_I. |
| `TauCeti.AbelianSurfaces.weightReg_integers` | computation | κ\_reg(N) is classical with (k_v, l_v) = (3N(p−1)+2, N(p−1)+2). |
| `TauCeti.AbelianSurfaces.weight33_not_classical` | non-example | (k_v, l_v) = (3,3) gives θ\_{v,1} = ε, whose reduction is nontrivial for p ≥ 3; so (3,3) is not a weight of Λ\_I. |
| `TauCeti.AbelianSurfaces.weightTwo_in_every_I` | degenerate | κ\_2 is a weight of Λ\_I for every I, since l_v = 2 everywhere. |

**Acceptance.**
- κ\_2 is the augmentation of Λ\_I.
- κ\_reg = (3N(p−1)+2, N(p−1)+2)\_v.

**Prerequisites.** [`AP.1/deformation-problems`](#ap1-deformation-problems), `PadicMeasuresIwasawaAlgebras:L1`, `HigherHidaAndColemanTheory:I3`, `AutomorphicBundles:B4`, `HilbertModularVarietiesAndShimuraCurves:H4`.

**Source.** BCGP18 Definition 7.8.8 and Remark 7.8.9, §7.8, p. 214: Defines weights as homomorphisms Λ\_I → O, the classical ones through integers k_v ≥ l_v ≥ 2 with l_v = 2 on I, the weight κ\_2 and a sufficiently regular κ\_reg chosen so that the classicality results apply.

<a id="ap1-hecke-modules"></a>
### AP.1/hecke-modules — The Hida–Hecke modules M^{χ,I,𝔠} and M^{χ,I,𝔠,Q} and their Hecke algebras

*Construction.* Planet: *Hida–Hecke modules*.

**Statement.** Assume Hypothesis 7.8.1. Let T̃ = ⊗'\_{v∉S_p∪R∪{v_0}} O[GSp_4(F_v)//GSp_4(O_{F_v})] and T̃^Q its analogue away from Q. Let Q_v(X) = X^4 − T_{v,1}X^3 + (q_vT_{v,2} + (q_v^3+q_v)T_{v,0})X^2 − q_v^3T_{v,0}T_{v,1}X + q_v^6T_{v,0}^2 ∈ T̃[X], and m̃^{an} ⊂ T̃ the maximal ideal of ρ̄ (λ ∈ m̃^{an}, det(X − ρ̄(Frob_v)) ≡ Q_v(X)). T̃^I adjoins U_{v,0}, U_{Kli(v),1}, U_{v,2} (v ∈ I) and U_{v,0}, U_{v,1}, U_{v,2} (v ∈ I^c), and m̃^{I,𝔠} = (m̃^{an}, U_{v,0} − 1, U_{v,2} − ᾱ\_vβ̄\_v (v ∈ S_p), U_{Kli(v),1} − ᾱ\_v − β̄\_v (v ∈ I), U_{v,1} − 𝔠\_v (v ∈ I^c)) (7.8.4); m̃^{I,𝔠,Q} likewise. With M^{•,I}\_{K^p} the higher Hida complex of Theorem 4.6.1 at tame level K^p, put M^{χ,I,𝔠} = RHom^0_{Λ\_I}(M^{•,I}\_{K^p}, Λ\_I) localized at m̃^{I,𝔠}, taken in χ-coinvariants for ∏\_{v∈R}T(k(v)) and in coinvariants for T_{v,0} − q_v^{−2} (v ∉ S_p ∪ R ∪ {v_0}); and M^{χ,I,𝔠,Q} the same at level K_1^p(Q), localized also at the maximal ideals m̃\_v (v ∈ Q) of O[T(F_v)/T(O_{F_v})\_1] ⊂ H_1(v) (λ, U_{v,0} − 1 ∈ m̃\_v, U_{v,1} ≡ ᾱ\_{v,1}, U_{v,2} ≡ ᾱ\_{v,1}ᾱ\_{v,2}), a Λ\_I[Δ\_Q]-module. T^{χ,I,𝔠} (resp. T^{χ,I,𝔠,Q}) is the Λ\_I-subalgebra of End_{Λ\_I} generated by the image of T̃^I (resp. T̃^{I,Q}). For v ∈ I, Hensel's lemma and ᾱ\_v ≠ β̄\_v factor X^2 − U_{Kli(v),1}X + U_{v,2} = (X − α̃\_v)(X − β̃\_v) in T.

**Hypotheses.**
- Q_v(X) is the reciprocal monic GSp_4 spin polynomial of SmoothRepresentationsOfLocalGroups SR.4 (gsp4-spin-polynomial, `SpinPolynomial.reciprocal`), whose generators T₁, T₂ are BCGP's T_{v,2}, T_{v,1}; its Hecke–Galois normalization is IntegralHeckeAndGaloisDeterminants IHG.3 (spin and dual-spin conventions). The positive Klingen Hecke algebra is SR.1; the normalized operators U_{v,i}, U_{Kli(v),1} at v | p with their ordinary projectors and the pro-v Iwahori Hecke algebras H_1(v) (BCGP §2.4) are owned by the GSp_4 Part II of ModularityAndLanglandsExtensions and SR.1.
- M^{•,I} and its Hecke action are owned by the higher Hida theory of HigherHidaAndColemanTheory (BCGP Theorem 4.6.1).

**Construction or proof.**
- Localization at m̃^{I,𝔠} is defined on the perfect complex through a lift of the corresponding idempotent of the finite Λ\_I-algebra of derived endomorphisms (Khare–Thorne, Lemma 2.12 and the discussion after it); this is the operator localization of Hecke images of complexes owned by IntegralHeckeAndGaloisDeterminants IHG.2.
- RHom^0 duality (Lemma 7.8.5): for a perfect complex M^• bounded below by 0 and M = RHom^0_Λ(M^•, Λ), M ⊗\_Λ k = H^0(M^• ⊗^L k)^\*, M ⊗\_Λ E = H^0(M^• ⊗^L E)^\* for Λ → E, and M ⊗\_Λ O = H^0(M^• ⊗^L E/O)^∨ (Lemma 7.8.6); owned by DeformationAndDerivedPatchingAlgebra P7.
- None of these objects depends on 𝔠\_v for v ∈ I; for v ∈ I the factorization follows from Hensel's lemma since ᾱ\_v ≠ β̄\_v.

**Uses.**
- BCGP18, Proposition 7.8.11: finite freeness and balancedness over Λ\_I[Δ\_Q].
- BCGP18, Theorem 7.9.4: T^{χ,I,𝔠,Q} receives R_{S_{χ,Q}^{I,𝔠}}.
- BCGP18, §7.11: the modules M^1_N, M^χ\_N patched.
- BCGP18, §7.13: duality between the modules and the spaces S^{I,𝔠}\_κ.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.sphericalHecke` | data | T̃ and T̃^Q. |
| `TauCeti.AbelianSurfaces.heckePoly` | data | Q_v(X) ∈ T̃[X]: the reciprocal monic spin polynomial of SmoothRepresentationsOfLocalGroups SR.4 evaluated at (q_v, T_{v,0}, T_{v,2}, T_{v,1}); monic of degree 4. |
| `TauCeti.AbelianSurfaces.maxIdealAn` | constructor | m̃^{an} ⊂ T̃ with det(X − ρ̄(Frob_v)) ≡ Q_v(X) mod m̃^{an} for v ∉ S_p ∪ R ∪ {v_0}. |
| `TauCeti.AbelianSurfaces.maxIdeal` | constructor | m̃^{I,𝔠} ⊂ T̃^I and m̃^{I,𝔠,Q} ⊂ T̃^{I,Q}, as in (7.8.4). |
| `TauCeti.AbelianSurfaces.hidaModule` | data | M^{χ,I,𝔠}, a finite Λ\_I-module. |
| `TauCeti.AbelianSurfaces.hidaModuleTW` | data | M^{χ,I,𝔠,Q}, a finite Λ\_I[Δ\_Q]-module. |
| `TauCeti.AbelianSurfaces.heckeAlgebra` | data | T^{χ,I,𝔠} ⊂ End_{Λ\_I}(M^{χ,I,𝔠}) and T^{χ,I,𝔠,Q} ⊂ End_{Λ\_I}(M^{χ,I,𝔠,Q}), finite local Λ\_I-algebras. |
| `TauCeti.AbelianSurfaces.hidaModule_tensor_residue` | compatibility | M ⊗\_{Λ\_I} k ≅ H^0(M^• ⊗^L k)^\* and M ⊗\_{Λ\_I} E ≅ H^0(M^• ⊗^L_{Λ\_I,κ} E)^\* for a weight κ (Lemma 7.8.5). |
| `TauCeti.AbelianSurfaces.hensel_factor` | relation | For v ∈ I: X^2 − U_{Kli(v),1}X + U_{v,2} = (X − α̃\_v)(X − β̃\_v) in T^{χ,I,𝔠,Q} with α̃\_v, β̃\_v lifting ᾱ\_v, β̄\_v. |
| `TauCeti.AbelianSurfaces.hidaModule_indep_I` | characterisation | M^{χ,I,𝔠}, M^{χ,I,𝔠,Q} and their Hecke algebras do not depend on 𝔠\_v for v ∈ I. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.heckePoly_constant_term` | computation | At an eigensystem with T_{v,0} = q_v^{−2} (central character ∣·∣^2), the constant term of Q_v(X) is q_v^6·q_v^{−4} = q_v^2, which is the constant term ν(ρ(Frob_v))^2 = q_v^2 of det(X − ρ(Frob_v)) for ρ with multiplier ε^{−1}. |
| `TauCeti.AbelianSurfaces.emptyQ_module` | degenerate | M^{χ,I,𝔠,∅} = M^{χ,I,𝔠}, with Λ\_I[Δ\_∅] = Λ\_I. |
| `TauCeti.AbelianSurfaces.maxIdeal_I` | characterisation | For v ∈ I, U_{Kli(v),1} − ᾱ\_v − β̄\_v ∈ m̃^{I,𝔠} and m̃^{I,𝔠} is unchanged when 𝔠\_v is switched between ᾱ\_v and β̄\_v. |
| `TauCeti.AbelianSurfaces.dual_into_LambdaI` | non-example | M^{χ,I,𝔠,Q} is RHom^0 into Λ\_I, not into Λ\_I[Δ\_Q]; Δ\_Q acts through the diamond operators on M^{•,I}\_{K_1^p(Q)}. Dualizing into Λ\_I[Δ\_Q] gives a module of the wrong rank over Λ\_I. |

**Acceptance.**
- M^{χ,I,𝔠} ⊗\_{Λ\_I} k is dual to H^0 of the mod λ ordinary complex localized at m̃^{I,𝔠}.
- With empty Q the module M^{χ,I,𝔠,∅} is M^{χ,I,𝔠}.

**Prerequisites.** [`AP.1/tame-levels`](#ap1-tame-levels), [`AP.1/weights`](#ap1-weights), [`AP.1/standing-hypotheses`](#ap1-standing-hypotheses), `HigherHidaAndColemanTheory:I3`, `ModularityAndLanglandsExtensions:ML.4`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `DeformationAndDerivedPatchingAlgebra:P7`, `mathlib:Polynomial.Monic`.

**Source.** BCGP18 §7.8 from the definition of T̃ to Lemma 7.8.6, with (7.8.4), pp. 212–214, and the opening paragraph of §7.9, p. 216: Defines the anaemic spherical Hecke algebra, the Hecke polynomial, the maximal ideals m̃^{I,𝔠}, the Λ\_I- and Λ\_I[Δ\_Q]-modules obtained by RHom^0 duality from the higher Hida complexes at the relevant tame levels, and the Hecke algebras acting on them.

<a id="ap1-finite-free-balanced"></a>
### AP.1/finite-free-balanced — Proposition 7.8.11: freeness in defect 0 and balancedness in defect 1

*Theorem.* Planet: *Freeness and balancedness of Hida modules*.

**Statement.** Assume Hypothesis 7.8.1, and let χ, 𝔠 and a Taylor–Wiles datum Q be as above. Then (1) M^{χ,∅,𝔠,Q} is a finite free Λ\_∅[Δ\_Q]-module; (2) if #I = 1, M^{χ,I,𝔠,Q} is a balanced Λ\_I[Δ\_Q]-module: it has a presentation by a square matrix over Λ\_I[Δ\_Q], equivalently it is the H^0 of a perfect complex of amplitude [0,1] with Euler characteristic 0 (BCGP §2.10).

**Hypotheses.**
- p ≥ 3 (used to split off the p-part of the class group acting on components).

**Construction or proof.**
- The complex M^{•,I}\_{K_1^p(Q)} is perfect over Λ\_I of amplitude [0, #I] (Theorem 4.6.1). By Proposition 7.8.10 (owned by the Hilbert–Siegel Part II), the cover X_{K_pK_1^p(Q,R)} → X_{K_pK_0^p(Q,R)} of toroidal compactifications is finite étale with group ∏\_{v∈Q∪R}T(k(v)), so the complex is represented by flat complete Λ\_I[∏T(k(v))]-modules, and the semi-local form of Lemma 4.6.22 makes it perfect over Λ\_I[∏T(k(v))] of amplitude [0, #I]; hence its χ-part is perfect over Λ\_I[Δ\_Q].
- Localization at m̃^{I,𝔠} preserves perfectness and amplitude.
- Central character: with C = F^×∖A_F^×/U = C_p ⊕ C^p, M̃^{χ,I,𝔠,Q} ≅ M^{χ,I,𝔠,Q} ⊗\_O O[C_p] because C^p acts through eigenvalues fixed mod m and C_p permutes components freely; this uses p ≠ 2.
- Part (1) follows since the amplitude is [0,0]. For (2), by Lemma 2.10.2 it suffices that the localized complex of amplitude [0,1] has Euler characteristic 0, which is checked modulo primes of Λ\_I using Theorem 6.6.5 and Corollary 3.10.5 (in regular weight, H^1 and H^0 of the localized coherent cohomology have the same dimension when the defect is one).

**Acceptance.**
- For #I = 0 and Q = ∅ the statement says M^{χ,∅,𝔠} is finite free over Λ\_∅.
- For #I = 1 the Λ\_I[Δ\_Q]-module has a square presentation matrix.

**Prerequisites.** [`AP.1/hecke-modules`](#ap1-hecke-modules), `HilbertModularVarietiesAndShimuraCurves:H4`, `HigherHidaAndColemanTheory:I3`, `HigherHidaAndColemanTheory:B7`, `AutomorphicBundles:B5`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:P7`, `mathlib:Module.Free`.

**Source.** BCGP18 Proposition 7.8.10 and Proposition 7.8.11 with its proof, §7.8, pp. 214–216: Shows the Taylor–Wiles and Ihara-avoidance covers are finite étale torsors over the toroidal compactification, and deduces that the patched-to-be modules are finite free in defect zero and balanced in defect one.

## AP.2. Galois representations on ordinary Hida–Hecke algebras

The doubling surjections M^{χ,I,𝔠} ⊗ Λ\_{I'} → M^{χ,I',𝔠} for I ⊆ I', intertwining U_{v,1} with the chosen unit root (Proposition 7.9.1); the representation ρ^{χ,I,𝔠,Q}: G_F → GSp_4(T^{χ,I,𝔠,Q}) of type S_{χ,Q}^{I,𝔠} with Hecke-polynomial compatibility and the Klingen- and Borel-ordinary shapes above p (Theorem 7.9.4); the refined Galois representations of ordinary parallel weight 2 forms under residual hypotheses, with the base-change step of the proof repaired (Corollary 7.9.6); the descent (M^{χ,I,𝔠,Q})\_{Δ\_Q} ≅ M^{χ,I,𝔠} (Proposition 7.9.8).

<a id="ap2-doubling-surjections"></a>
### AP.2/doubling-surjections — Proposition 7.9.1: the doubling surjections M^{χ,I,𝔠} ⊗ Λ\_{I'} → M^{χ,I',𝔠}

*Theorem.* Planet: *Doubling surjections*.

**Statement.** Assume Hypothesis 7.8.1. For I ⊆ I' ⊆ S_p let Λ\_I → Λ\_{I'} be the surjection cutting out θ\_{v,1} = θ\_{v,2} for v ∈ I'. For each choice 𝔠 there are natural surjections M^{χ,I,𝔠} ⊗\_{Λ\_I} Λ\_{I'} → M^{χ,I',𝔠} and M^{χ,I,𝔠,Q} ⊗\_{Λ\_I} Λ\_{I'} → M^{χ,I',𝔠,Q}. They commute with all Hecke operators away from I' ∖ I, and for v ∈ I' ∖ I they commute with U_{v,0}, U_{v,2} and intertwine U_{v,1} on the source with the lift 𝔠̃\_v of 𝔠\_v on the target. Writing 𝔠'\_v for the other unit eigenvalue, (U_{v,1} − 𝔠̃'\_v)(U_{v,1} − 𝔠̃\_v) = 0 (7.9.2).

**Hypotheses.**
- Hypothesis 7.8.1 (in particular ᾱ\_v ≠ β̄\_v for v ∈ S_p).

**Construction or proof.**
- Reduce to I' = I ∪ {v}. The map is τ∘U_{v,1} − 𝔠̃'\_v∘τ, with τ induced by restriction from the Klingen-level ordinary locus at v to the Iwahori-level one (𝔛^{G_1,I}\_{K,Kli(p^∞)} ⊂ 𝔛^{G_1,I'}\_{K,Kli(p^∞)}).
- Intertwining: Lemma 4.5.17 gives U_{v,1}(U_{Kli(v),1} − U_{v,1}) = U_{v,2} on the ordinary locus at v, i.e. (7.9.2), and Hensel's lemma separates the two roots.
- Surjectivity: by Nakayama and Lemma 7.8.5(1) it reduces to injectivity on the special fibre of the weight 2 map (U_{v,1} − 𝔠'\_v): e(U^{I'})H^0(X^{I',G_1}\_1, ω^2(−D))\_{m̃^{I',𝔠}} → e(U^I)H^0(X^{I,G_1}\_1, ω^2(−D))\_{m̃^{I,𝔠}} (7.9.3), which is the doubling theorem (Theorem 5.8.6 with Remark 5.8.7), owned with the higher Hida theory.

**Acceptance.**
- For I = I' the map is the identity.
- Composing for I ⊆ I' ⊆ I'' gives the map for I ⊆ I''.

**Prerequisites.** [`AP.1/hecke-modules`](#ap1-hecke-modules), `HigherHidaAndColemanTheory:X8`, `HigherHidaAndColemanTheory:I3`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** BCGP18 Proposition 7.9.1 with (7.9.2) and (7.9.3), §7.9, pp. 216–218: Constructs surjections from the Hida modules with Iwahori level at the places of I' ∖ I to those with Klingen level there, intertwining U_{v,1} with the chosen unit root, and reduces surjectivity to the injectivity statement of the doubling theorem.

<a id="ap2-hida-hecke-galois"></a>
### AP.2/hida-hecke-galois — Theorem 7.9.4: Galois representations over the Hida–Hecke algebras

*Theorem.* Planet: *Galois representations over Hida–Hecke algebras*.

**Statement.** Assume Hypothesis 7.8.1, with χ, I ⊆ S_p, 𝔠 and a (possibly empty) Taylor–Wiles datum Q. Extend the universal characters θ\_v (v ∈ I) and θ\_{v,1}, θ\_{v,2} (v ∉ I) of §7.3 to G_{F_v} by Art_{F_v}(p) ↦ 1, and let λ\_x be the unramified character with λ\_x(Frob_v) = x. There is a unique continuous ρ^{χ,I,𝔠,Q}: G_F → GSp_4(T^{χ,I,𝔠,Q}) which is a deformation of ρ̄ of type S_{χ,Q}^{I,𝔠}, such that R_{S_{χ,Q}^{I,𝔠}} → T^{χ,I,𝔠,Q} is a map of Λ\_I[Δ\_Q]-algebras, and: (1) for v ∉ S_p ∪ R ∪ {v_0} ∪ Q, det(X − ρ(Frob_v)) = Q_v(X); (2) for v ∈ I, ρ|\_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ\_{α̃\_v}θ\_v, λ\_{β̃\_v}θ\_v, λ\_{β̃\_v}^{−1}θ\_v^{−1}ε^{−1}, λ\_{α̃\_v}^{−1}θ\_v^{−1}ε^{−1}) and vanishing (1,2) and (3,4) entries; (3) for v ∈ I^c, ρ|\_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ\_{U_{v,1}}θ\_{v,1}, λ\_{U_{v,2}/U_{v,1}}θ\_{v,2}, λ\_{U_{v,2}/U_{v,1}}^{−1}θ\_{v,2}^{−1}ε^{−1}, λ\_{U_{v,1}}^{−1}θ\_{v,1}^{−1}ε^{−1}).

**Hypotheses.**
- Hypothesis 7.8.1.

**Construction or proof.**
- Case I = ∅: M^{χ,∅,𝔠,Q} is finite free over Λ\_∅ (Proposition 7.8.11), so it injects, T̃^{∅,Q}-equivariantly, into the product of its specializations M ⊗\_{Λ\_∅,κ} E over the classical weights with k_v ≥ l_v ≥ 4 and k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1), which are scheme-theoretically dense in Spec Λ\_∅. At such weights Lemma 7.8.5, the classicality Theorem 6.6.5 and Theorem 3.10.1 identify the specializations with ordinary cuspidal forms of regular weight, whose Galois representations (Theorem 2.7.2, with Propositions 2.4.13, 2.4.26, 2.4.28, 2.4.30 and Remark 2.4.31 for the local shapes) satisfy (1)–(3).
- Glue these representations into a GSp_4(T)-valued representation as in Clozel–Harris–Taylor Proposition 3.4.4 (with Gee–Geraghty Lemma 7.1.1), using residual absolute irreducibility to pass from determinants to a representation (IntegralHeckeAndGaloisDeterminants IHG.1); check the type at v ∈ Q with Lemma 7.4.4.
- General I: induct on #I through the doubling surjections, which identify U_{v,1} on the source with 𝔠̃\_v on the target and so turn the Borel-ordinary shape (3) at v into the Klingen shape (2).

**Acceptance.**
- For Q = ∅ the representation is a deformation of type S_χ^{I,𝔠}, giving R_{S_χ^{I,𝔠}} → T^{χ,I,𝔠}.
- At v ∈ I the inertia group acts trivially on a two-dimensional subspace, as in the second matrix of §1.2.

**Prerequisites.** [`AP.1/finite-free-balanced`](#ap1-finite-free-balanced), [`AP.1/deformation-problems`](#ap1-deformation-problems), [`AP.1/hecke-modules`](#ap1-hecke-modules), [`AP.2/doubling-surjections`](#ap2-doubling-surjections), [`AP.1/weights`](#ap1-weights), `ModularityAndLanglandsExtensions:ML.4`, `HigherHidaAndColemanTheory:B7`, `AutomorphicBundles:B5`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `LocalGaloisDeformationRings:R08.2`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** BCGP18 Theorem 7.9.4 and its proof, §7.9, pp. 218–220: Constructs the GSp_4-valued representation over the Hida–Hecke algebra of type S_{χ,Q}^{I,𝔠}, with Hecke polynomial compatibility away from the bad places and the Klingen- and Borel-ordinary shapes at the places above p.

<a id="ap2-ordinary-weight-two-corollary"></a>
### AP.2/ordinary-weight-two-corollary — Corollary 7.9.6: refined Galois representations of ordinary weight 2 forms

*Theorem.*

**Statement.** Let π be a cuspidal automorphic representation of GSp_4(A_F) of parallel weight 2, central character |·|^2, ordinary at every v | p, with p > 2 splitting completely in F. Then ρ\_{π,p} of Theorem 1.8.17 (BCGP25) satisfies: (1) for finite v ∤ p with π\_v unramified, ρ\_{π,p}|\_{G_{F_v}} is unramified with det(X − ρ\_{π,p}(Frob_v)) = Q_v(X). If moreover ρ̄\_{π,p} is vast and tidy, ρ̄\_{π,p}|\_{G_{F_v}} is p-distinguished weight 2 ordinary and the ordinary Hecke parameters satisfy ᾱ\_v ≠ β̄\_v for every v | p, then ρ\_{π,p} is GSp_4-valued with (2) ν∘ρ\_{π,p} = ε^{−1}; (3) WD(ρ\_{π,p}|\_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π\_v ⊗ |ν|^{−3/2})^{ss} for finite v ∤ p; (4) for v | p, ρ\_{π,p}|\_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ\_{α\_v}, λ\_{β\_v}, λ\_{β\_v}^{−1}ε^{−1}, λ\_{α\_v}^{−1}ε^{−1}) and vanishing (1,2) and (3,4) entries. The residual ordinarity hypothesis is added to the printed statement: its proof needs it to apply Theorem 7.9.4.

**Hypotheses.**
- p > 2 splits completely in the totally real field F; π as stated.
- For (2)–(4): ρ̄\_{π,p} vast and tidy, p-distinguished weight 2 ordinary at every v | p, and ᾱ\_v ≠ β̄\_v.

**Construction or proof.**
- If π is not of general type, ρ\_{π,p} is reducible and (1) follows from the GL_1 and GL_2 cases (Lemma 2.9.1); (2)–(4) are vacuous because a reducible ρ̄ is not vast.
- If π is of general type, Mok's Theorem 4.14 gives (1) and (3) with GL_4 values.
- Choose a solvable totally real F'/F, linearly disjoint from the fixed field of ker ρ̄\_{π,p}, in which p splits completely, which trivializes ρ̄ at the places above the ramification of π and makes q_w ≡ 1 mod p (mod 9 if p = 3) there, and over which the base change of π has Iwahori-fixed vectors everywhere (Mok, Proposition 4.13). This repairs the printed proof, which arranges only the last two properties: Hypothesis 7.8.1(4)(a) and (5)(c) need the first two.
- Hypothesis 7.8.1 then holds over F' (its clause (3) is the added residual ordinarity), and Theorem 7.9.4 with I = S_p, χ = 1, Q = ∅ gives the GSp_4-valued representation with the shape (4) over F'; (4) over F follows since p splits in F' and the local representations at v | p are unchanged. Compare with Theorem 1.8.17, which gives the same ρ\_{π,p} without the residual hypotheses.

**Acceptance.**
- The diagonal characters at v | p are unramified (λ\_{α\_v}, λ\_{β\_v}), sharper than the potentially unramified ones of Theorem 1.8.17.
- Used at v | p in Corollary 8.2.2 and in the proof of Lemma 8.3.2.

**Prerequisites.** [`AP.0/weight-two-galois`](#ap0-weight-two-galois), [`AP.2/hida-hecke-galois`](#ap2-hida-hecke-galois), [`AP.1/standing-hypotheses`](#ap1-standing-hypotheses), `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensions:ML.4`, `PotentialModularityAndCompatibleSystems:R23.5`.

**Source.** BCGP18 Corollary 7.9.6 with its proof, §7.9, pp. 220–221: States the Galois representations of ordinary parallel weight 2 cuspidal representations, GSp_4-valued with the Klingen-type ordinary shape at p under residual hypotheses, and proves them by solvable base change to a field where Hypothesis 7.8.1 holds.; BCGP25 Theorem 1.8.17, §1.8, p. 13: The existence half without residual hypotheses, by eigenvariety interpolation.

<a id="ap2-taylor-wiles-descent"></a>
### AP.2/taylor-wiles-descent — Proposition 7.9.8: Δ\_Q-coinvariants of the Taylor–Wiles modules

*Theorem.*

**Statement.** Assume Hypothesis 7.8.1, with χ, I, 𝔠 and a Taylor–Wiles datum Q. The natural map M^{χ,I,𝔠,Q} → M^{χ,I,𝔠} induces an isomorphism (M^{χ,I,𝔠,Q})\_{Δ\_Q} ≅ M^{χ,I,𝔠}.

**Hypotheses.**
- q_v ≡ 1 mod p for v ∈ Q and p > 2, so [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1) is a unit.

**Construction or proof.**
- This is the application, to the Hida complexes M^{•,I}, of the general descent statement for Hecke-equivariant perfect complexes computing coherent cohomology of Taylor–Wiles covers (localization at m_Q followed by Δ\_Q-coinvariants recovers the level-K^p complex in all degrees), owned by the IntegralCoherentHeckeComplexes Part II of AutomorphicBundles. Follow Khare–Thorne Lemma 6.25.
- (7.9.9): (M^{•,I}\_{K_1^p(Q)})^{∏\_{v∈Q}T(k(v))} ≅ M^{•,I}\_{K_0^p(Q)} in the derived category, since the level-K_1^p(Q) complex is perfect over Λ\_I[∏T(k(v))] and the cover is a torsor (Proposition 7.8.10).
- (7.9.10): the composite of localizations and level changes from K_0^p(Q) to K^p is a quasi-isomorphism: by Pilloni's Nakayama lemma for complexes of complete flat modules (Lemma 7.9.7, DeformationAndDerivedPatchingAlgebra P7) it suffices to check on H^\*(− ⊗ k), which follows from the mod p Iwahori–Hecke relations of Lemmas 2.4.36–2.4.37 at v ∈ Q with [K1K'][K'1K] = [K:K'] a unit, and, for the last step, from uniqueness of m̃^{an} above m̃^{an,Q} in the support of H^0, by local–global compatibility (as in Theorem 7.9.4) and Chebotarev.

**Acceptance.**
- For Q = ∅ the statement is the identity.
- It supplies the hypothesis M_N ⊗\_{S_N} O ≅ M_0 of the abstract patching criterion.

**Prerequisites.** [`AP.1/hecke-modules`](#ap1-hecke-modules), [`AP.2/hida-hecke-galois`](#ap2-hida-hecke-galois), `AutomorphicBundles:B5`, `ModularityAndLanglandsExtensions:ML.4`, `HilbertModularVarietiesAndShimuraCurves:H4`, `DeformationAndDerivedPatchingAlgebra:P7`, Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Proposition 7.9.8 with (7.9.9), (7.9.10) and Lemma 7.9.7, §7.9, pp. 221–223: Proves that Δ\_Q-coinvariants of the Taylor–Wiles module recover the module at the original level, after Khare–Thorne, using the torsor structure of the cover, mod p Iwahori–Hecke identities and a Nakayama lemma for complexes.

## AP.3. Patching in defect zero and one

For #I ≤ 1: the patched ring S_∞, the patched deformation rings R_∞^{1,I,𝔠}, R_∞^{χ,I,𝔠} and modules M_∞^{1,I,𝔠}, M_∞^{χ,I,𝔠}, free in defect 0 and balanced in defect 1, obtained from the abstract patching criterion with the ideals of item 150 of the extraction, with the dimension identity dim (R_∞)' = dim S_∞ − #I (§7.11, (7.11.1)); Proposition 7.11.2: the patched modules are maximal Cohen–Macaulay over the flat quotients of the patched rings, O-flatness being proved first in defect 1.

<a id="ap3-patching-datum"></a>
### AP.3/patching-datum — The patched objects S_∞, R_∞^{·,I,𝔠}, M_∞^{·,I,𝔠} and the dimension identity

*Construction.* Planet: *Patched modules in defect zero and one*.

**Statement.** Assume Hypothesis 7.8.1; enlarge E to contain μ\_p (μ\_9 if p = 3) and, for v ∈ R, fix χ\_v = (χ\_{v,1}, χ\_{v,2}) nontrivial, trivial mod λ, with χ\_{v,1} ≠ χ\_{v,2}^{±1}; the superscript 1 means χ = 1. Put q = h^1(F_S/F, ad^0ρ̄(1)), g = 2q − 4[F:Q] + #S − 1, Δ\_∞ = Z_p^{2q}, and S_∞ = 𝒯[[Δ\_∞]], where 𝒯 is the framing ring of S over Λ (a power series ring in 11#S − 1 variables); a is its augmentation ideal. For N ≥ 1 let Q_N be the Taylor–Wiles data of Corollary 7.6.3 with Δ\_N = ∏\_{v∈Q_N}k(v)^×(p)^2 and a surjection Δ\_∞ ↠ Δ\_N with kernel in (p^NZ_p)^{2q}. Let R^{1,I,𝔠,loc} = (⊗̂\_{v∈I}R_v^P) ⊗̂ (⊗̂\_{v∈I^c}R_v^{B,𝔠\_v}) ⊗̂ (⊗̂\_{v∈R}R_v^1) ⊗̂ R_{v_0}^□, R^{χ,I,𝔠,loc} the same with R_v^{χ\_v}, and R_∞^{·,I,𝔠} power series rings in g variables over these. For #I ≤ 1 the abstract patching criterion (DeformationAndDerivedPatchingAlgebra; BCGP Proposition 7.10.1 in the form with ideals I_N = ker(S_∞ → 𝒯[Δ\_N]) contained in open decreasing ideals) applied to R_N = R_{S_{·,Q_N}^{I,𝔠}} ⊗̂ 𝒯 and M_N = M^{·,I,𝔠,Q_N} ⊗̂ 𝒯 produces: Λ\_I-algebra maps S_∞ → R_∞^{·,I,𝔠}; finite S_∞-modules M_∞^{·,I,𝔠}, free if #I = 0 and balanced if #I = 1, with M_∞/a ≅ M^{·,I,𝔠}; actions R_∞ → End_{S_∞}(M_∞) compatible with R^{·,I,𝔠}; and compatible identifications of the 1- and χ-versions modulo λ. Writing R' for the maximal O-flat quotient, (R_∞^{1,I,𝔠})' and (R_∞^{χ,I,𝔠})' are equidimensional with dim (R_∞^{·,I,𝔠})' = dim S_∞ − #I (7.11.1).

**Hypotheses.**
- #I ≤ 1 for the patching; the formal constructions make sense for every I.
- The paper prints R_N^{1,∞,𝔠} and R_N^{χ,∞,𝔠} where R_N^{1,I,𝔠} and R_N^{χ,I,𝔠} are meant.

**Construction or proof.**
- The surjections R_∞ → R_N ⊗̂\_Λ 𝒯 come from Proposition 7.2.1 (global presentation over the local rings) and Corollary 7.6.3 (Taylor–Wiles data killing the dual Selmer group), owned by GlobalGaloisDeformations.
- The hypotheses of the patching criterion are Theorem 7.9.4 (the R-action), Proposition 7.9.8 (coinvariants) and Proposition 7.8.11 (freeness, balancedness).
- Dimension count: S_∞ is formally smooth over Λ\_I of relative dimension 2q + 11#S − 1; by Propositions 7.3.4, 7.4.7, 7.4.8, 7.4.2 and Barnet-Lamb–Geraghty–Harris–Taylor Lemma 3.3, the flat quotients of the local rings are equidimensional, so (R_∞)' has relative dimension g + 10#S + 4[F:Q] − #I over Λ\_I, which is dim S_∞ − #I.

**Uses.**
- BCGP18, Proposition 7.11.2: maximal Cohen–Macaulayness of the patched modules.
- BCGP18, Theorem 7.13.6: multiplicities via cycles of M_∞ over the components of Spec R_∞.
- BCGP18, §1.2: patching with defect 0 and with defect 1.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.patchingRing` | data | S_∞ = 𝒯[[Δ\_∞]], augmented over Λ\_I with augmentation ideal a. |
| `TauCeti.AbelianSurfaces.patchedRing` | data | R_∞^{1,I,𝔠} and R_∞^{χ,I,𝔠}: power series rings in g variables over the local rings R^{·,I,𝔠,loc}. |
| `TauCeti.AbelianSurfaces.patchedModule` | data | M_∞^{1,I,𝔠} and M_∞^{χ,I,𝔠}, finite S_∞-modules with R_∞-actions, for #I ≤ 1. |
| `TauCeti.AbelianSurfaces.patchedModule_mod_aug` | relation | M_∞^{·,I,𝔠}/a ≅ M^{·,I,𝔠}, compatibly with R_∞ → R^{·,I,𝔠}. |
| `TauCeti.AbelianSurfaces.patchedModule_free` | other | For #I = 0, M_∞ is finite free over S_∞; for #I = 1 it is balanced. |
| `TauCeti.AbelianSurfaces.patched_mod_lambda` | compatibility | M_∞^{1,I,𝔠}/λ ≅ M_∞^{χ,I,𝔠}/λ over R_∞^{1,I,𝔠}/λ ≅ R_∞^{χ,I,𝔠}/λ. |
| `TauCeti.AbelianSurfaces.dim_flat_quotient` | relation | dim (R_∞^{·,I,𝔠})' = dim S_∞ − #I, and (R_∞^{·,I,𝔠})' is equidimensional. |
| `TauCeti.AbelianSurfaces.patchingRing_relDim` | simp | S_∞ is formally smooth over Λ\_I of relative dimension 2q + 11#S − 1. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.variables_count` | computation | With [F:Q] = 1, #S = 3 (S_p, one place of R, v_0) and q = 4: g = 2·4 − 4 + 3 − 1 = 6 and S_∞ has relative dimension 2·4 + 11·3 − 1 = 40 over Λ\_I. |
| `TauCeti.AbelianSurfaces.dimension_identity_check` | characterisation | The relative dimension of (R_∞)' over Λ\_I, g + 10#S + 4[F:Q] − #I, equals (2q + 11#S − 1) − #I exactly because g = 2q − 4[F:Q] + #S − 1. |
| `TauCeti.AbelianSurfaces.defect_zero_free` | degenerate | For I = ∅ the patched module is free over S_∞ and dim (R_∞)' = dim S_∞. |
| `TauCeti.AbelianSurfaces.defect_two_excluded` | non-example | For #I = 2 the modules M^{χ,I,𝔠,Q} have amplitude [0,2] and are not covered by the balanced-module criterion; the construction is not applied there, and §8 reaches larger I by descent instead. |

**Acceptance.**
- M_∞^{·,∅,𝔠} is finite free over S_∞.
- M_∞^{1,I,𝔠}/λ ≅ M_∞^{χ,I,𝔠}/λ compatibly with R_∞^{1,I,𝔠}/λ ≅ R_∞^{χ,I,𝔠}/λ.

**Prerequisites.** [`AP.1/finite-free-balanced`](#ap1-finite-free-balanced), [`AP.2/hida-hecke-galois`](#ap2-hida-hecke-galois), [`AP.2/taylor-wiles-descent`](#ap2-taylor-wiles-descent), [`AP.1/deformation-problems`](#ap1-deformation-problems), `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.2`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `mathlib:Module.Finite`, `mathlib:IsLocalRing`, `mathlib:ringKrullDim`.

**Source.** BCGP18 §7.11 with (7.11.1), pp. 224–226: Sets up the patching data (auxiliary characters at R, the ring S_∞, Taylor–Wiles data, local and global deformation rings), applies the abstract patching proposition to obtain the patched rings and modules for #I ≤ 1, and computes the dimension of the flat quotients of the patched deformation rings.

<a id="ap3-patched-mcm"></a>
### AP.3/patched-mcm — Proposition 7.11.2: the patched modules are maximal Cohen–Macaulay

*Theorem.* Planet: *Maximal Cohen–Macaulay patched modules*.

**Statement.** Assume Hypothesis 7.8.1, fix I ⊆ S_p with #I ≤ 1 and a choice 𝔠. Then M_∞^{1,I,𝔠} is a maximal Cohen–Macaulay (R_∞^{1,I,𝔠})'-module, and M_∞^{χ,I,𝔠} is a maximal Cohen–Macaulay (R_∞^{χ,I,𝔠})'-module.

**Hypotheses.**
- #I ≤ 1. For #I = 1 the proof first establishes that M_∞ is O-flat, a step the printed proof leaves implicit.

**Construction or proof.**
- By (7.11.1) the support of M_∞ in Spec S_∞ has codimension at least #I.
- Apply Calegari–Geraghty Lemma 6.2 (DeformationAndDerivedPatchingAlgebra P9) to a resolution S_∞^r → S_∞^r of M_∞ when #I = 1 (it exists because M_∞ is balanced, Lemma 2.10.2), or to M_∞ itself when #I = 0: the codimension is exactly #I and depth_{S_∞}M_∞ = dim S_∞ − #I = dim (R_∞)'.
- Depth over (R_∞)' is at least depth over S_∞, hence M_∞ is maximal Cohen–Macaulay over (R_∞)'.

**Acceptance.**
- In defect 0 the statement reduces to: M_∞ is free over S_∞ and dim S_∞ = dim (R_∞)'.
- In defect 1, the support of M_∞ in Spec S_∞ has codimension exactly 1.

**Prerequisites.** [`AP.3/patching-datum`](#ap3-patching-datum), `DeformationAndDerivedPatchingAlgebra:P9`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Source.** BCGP18 Proposition 7.11.2 with its proof, §7.11, p. 226: Proves that the patched modules are maximal Cohen–Macaulay over the flat quotients of the patched deformation rings by comparing depth with the codimension of support, using the balanced resolution in defect one.

## AP.4. Ihara avoidance and multiplicities

Hypothesis 7.13.1 on a characteristic zero ρ and the levels K^{p,Iw}, K^{p,Iw_1} (Definition 7.13.4); the primes 𝔭\_x and 𝔭̃^{I,𝔠}\_{x'} (7.13.3), smooth points, and the eigenspaces S^{I,𝔠}\_κ of p-adic forms with their duality to the patched modules; the Iwahori multiplicities d_η = 8, 4, 4, 1 of generic L-packets on the components of the Ihara-avoidance rings and d_ρ (Proposition 7.13.5); the doubling injection (Proposition 7.13.9); the regular-weight dimension counts (Proposition 7.13.11); Theorem 7.13.6: the ρ-eigenspace has dimension 8d_ρ for #I ≤ 1.

<a id="ap4-lifting-hypotheses"></a>
### AP.4/lifting-hypotheses — Hypothesis 7.13.1 on ρ and the levels K^{p,Iw}, K^{p,Iw_1}

*Definition.*

**Statement.** A continuous ρ: G_F → GSp_4(O) satisfies Hypothesis 7.13.1 if: (1) F is totally real and p ≥ 3 splits completely in F; (2) ν∘ρ = ε^{−1}; (3) ρ|\_{G_{F_v}} is pure for every finite v; (4) for v ∈ S_p, ρ|\_{G_{F_v}} is p-distinguished weight 2 ordinary with unit eigenvalues α\_v, β\_v ∈ E; (5) there is a finite set R of places prime to p with ρ unramified outside R ∪ S_p and, for v ∈ R, q_v ≡ 1 mod p (mod 9 if p = 3), ρ̄|\_{G_{F_v}} trivial and ρ|\_{G_{F_v}} with only unipotent ramification; (6) there is an ordinary cuspidal π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ̄\_{π,p} ≅ ρ̄, π\_v unramified for v ∉ R ∪ S_p, π\_v^{Iw(v)} ≠ 0 for v ∈ R ∪ S_p, and ρ\_{π,p}|\_{G_{F_v}} pure for all finite v; (7) ρ̄ is vast and tidy. Then Hypothesis 7.8.1 holds for ρ̄ (Remark 7.13.2), and one fixes an absolutely unramified v_0 ∉ S_p ∪ R with q_{v_0} ≢ 1 mod p, residue characteristic > 5, ρ unramified at v_0 and no ratio of eigenvalues of ρ(Frob_{v_0}) congruent to q_{v_0} mod λ. The levels are K^{p,Iw} = ∏K_v and K^{p,Iw_1} = ∏K'\_v with K_v = Iw(v), K'\_v = Iw_1(v) for v ∈ R, K_{v_0} = K'\_{v_0} = Iw_1(v_0), and hyperspecial elsewhere (Definition 7.13.4).

**Hypotheses.**
- Purity of a Weil–Deligne representation (Taylor–Yoshida) and the monodromy rank n(r,N) are owned by AutomorphicGaloisRepresentationsPartII AG2.5.

**Construction or proof.**
- Remark 7.13.2: clauses (1)–(7) contain those of Hypothesis 7.8.1, with π giving its automorphic seed.
- The auxiliary place v_0 exists by tidiness and Chebotarev as in the standing hypotheses.

**Uses.**
- BCGP18, Theorem 7.13.6 and Theorem 8.2.1: standing hypotheses of the multiplicity and gluing theorems.
- BCGP18, Corollary 8.2.2: ρ satisfying the hypothesis is modular.
- BCGP18, proof of Theorem 8.4.1: a solvable base change puts ρ in this situation.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.LiftingData` | data | Hypothesis 7.13.1 for (F, p, ρ, R, π) as a structure. |
| `TauCeti.AbelianSurfaces.LiftingData.toLiftingHypothesis` | projection | Hypothesis 7.13.1 implies Hypothesis 7.8.1 for ρ̄ (Remark 7.13.2). |
| `TauCeti.AbelianSurfaces.LiftingData.auxPlace` | constructor | The auxiliary place v_0 of §7.13(8). |
| `TauCeti.AbelianSurfaces.levelIw` | data | K^{p,Iw}. |
| `TauCeti.AbelianSurfaces.levelIw1` | data | K^{p,Iw_1}. |
| `TauCeti.AbelianSurfaces.levelIw1_le_levelIw` | relation | K^{p,Iw_1} ⊂ K^{p,Iw} with quotient ∏\_{v∈R}T(k(v)). |
| `TauCeti.AbelianSurfaces.LiftingData.unitRoots` | other | The unit eigenvalues α\_v, β\_v ∈ E at v ∈ S_p, with ᾱ\_v ≠ β̄\_v. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.hyp_R_empty` | degenerate | If ρ is unramified outside S_p, R = ∅ and K^{p,Iw} = K^{p,Iw_1} is hyperspecial away from v_0. |
| `TauCeti.AbelianSurfaces.hyp_purity_needed` | non-example | A ρ whose restriction at some v ∈ R has monodromy of non-maximal rank for its Weil representation is not pure and violates (3); the multiplicity d_ρ is then not determined by a unique generic point. |
| `TauCeti.AbelianSurfaces.hyp_implies_78` | characterisation | From (1), (4), (5), (6), (7) one reads off Hypothesis 7.8.1(1)–(5) for ρ̄, with π as automorphic seed. |

**Acceptance.**
- Every ρ arising from an abelian surface with good ordinary reduction above p, with distinct unit roots, vast and tidy ρ̄ and a suitable automorphic seed satisfies the hypothesis after a solvable base change (proof of Theorem 8.4.1).
- K^{p,Iw_1} ⊂ K^{p,Iw} with quotient ∏\_{v∈R}T(k(v)).

**Prerequisites.** [`AP.1/standing-hypotheses`](#ap1-standing-hypotheses), [`AP.1/tame-levels`](#ap1-tame-levels), [`AP.0/weight-two-galois`](#ap0-weight-two-galois), `AutomorphicGaloisRepresentationsPartII:AG2.5`, `LocalGaloisDeformationRings:L8`, Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Hypothesis 7.13.1, Remark 7.13.2, condition (8) and Definition 7.13.4, §7.13, pp. 229–231: Lists the hypotheses on a characteristic zero ρ under which the multiplicity theorem is proved, observes that they imply Hypothesis 7.8.1 for ρ̄, fixes the auxiliary place v_0 and defines the Iwahori and pro-v Iwahori tame levels.

<a id="ap4-eigenspaces"></a>
### AP.4/eigenspaces — The primes 𝔭\_x, 𝔭̃\_{x'}^{I,𝔠} and the eigenspaces S^{I,𝔠}\_{κ}

*Definition.*

**Statement.** Let x be a closed point of Spec R^{1,I,𝔠}[1/p] or Spec R^{χ,I,𝔠}[1/p] (E enlarged), with ρ\_x: G_F → GSp_4(O); 𝔭\_x is the kernel of R^{·,I,𝔠} → E (its quotient has dimension one; the paper calls it 'height one'), also pulled back to R^{·,I,𝔠,loc} and R_∞. x is smooth if R^{·,I,𝔠,loc}\_{𝔭\_x} is regular. For ρ' giving x', 𝔭̃^{an}\_{x'} ⊂ T̃ is generated by the coefficients of Q_v(X) − det(X − ρ'(Frob_v)) (v ∉ R ∪ S_p ∪ {v_0}), and 𝔭̃^{I,𝔠}\_{x'} = (𝔭̃^{an}\_{x'}, U_{v,0} − 1, U_{v,2} − α'\_vβ'\_v (v ∈ S_p), U_{Kli(v),1} − α'\_v − β'\_v (v ∈ I), U_{v,1} − 𝔠'\_v (v ∈ I^c)) ⊂ T̃^I (7.13.3), with α'\_v, β'\_v the unit eigenvalues of ρ' and 𝔠'\_v the lift of 𝔠\_v. For a classical weight κ, S^{I,𝔠}\_{κ,K^{p,Iw}K_p(I)} is the subspace of (e(U^I)H^0(𝔛^{I,G_1}\_{K_p(I)K^{p,Iw}}, ω^κ(−D))\_{m̃^{I,𝔠}}) ⊗\_O E killed by U_{v,0} − 1 (v ∈ S_p), U_{v,0} − q_v^{−2} (v ∈ R) and T_{v,0} − q_v^{−2} (v ∉ S_p ∪ R ∪ {v_0}); S^{I,𝔠}\_{κ,K^{p,Iw_1}K_p(I),χ} is the χ-isotypic part for ∏\_{v∈R}Iw(v)/Iw_1(v). By Lemma 7.8.5(2), (M^{1,I,𝔠}/𝔭\_κ)[1/p] ≅ (S^{I,𝔠}\_{κ,K^{p,Iw}K_p(I)})^∨ and, for ρ' of weight κ, (M_∞^{1,I,𝔠}/𝔭\_{x'})[1/p] ≅ (M^{1,I,𝔠}/𝔭\_{x'})[1/p] ≅ (S^{I,𝔠}\_{κ,K^{p,Iw}K_p(I)}[𝔭̃^{I,𝔠}\_{x'}])^∨, and likewise for χ.

**Hypotheses.**
- The symbol 𝔠'\_v here is the lift of 𝔠\_v determined by ρ'; elsewhere (§7.3, (7.9.2), Proposition 7.13.9) 𝔠'\_v is the other unit root.
- The paper's second display has M^{1,I,𝔠} as middle term where M^{χ,I,𝔠} is meant.

**Construction or proof.**
- The primes are kernels of explicit maps; the eigenspaces are subspaces of finite-dimensional E-vector spaces cut out by Hecke operators.
- The duality statements are Lemma 7.8.5(2) applied to M^{•,I} at the weight κ, together with M_∞/a ≅ M from the patching.

**Uses.**
- BCGP18, Theorem 7.13.6 and Proposition 7.13.11: dimensions of the eigenspaces.
- BCGP18, Theorem 8.2.1: the gluing theorem is stated for these spaces and their overconvergent versions.
- BCGP18, Proposition 7.13.9: doubling injections between eigenspaces.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.pointPrime` | data | 𝔭\_x = ker(R^{·,I,𝔠} → E) for a closed point x of Spec R^{·,I,𝔠}[1/p]. |
| `TauCeti.AbelianSurfaces.Point.IsSmooth` | data | R^{·,I,𝔠,loc}\_{𝔭\_x} is regular. |
| `TauCeti.AbelianSurfaces.heckePrime` | constructor | 𝔭̃^{I,𝔠}\_{x'} ⊂ T̃^I as in (7.13.3). |
| `TauCeti.AbelianSurfaces.eigenspace` | data | S^{I,𝔠}\_{κ,K^{p,Iw}K_p(I)}[𝔭̃], a finite-dimensional E-vector space. |
| `TauCeti.AbelianSurfaces.eigenspaceChi` | data | S^{I,𝔠}\_{κ,K^{p,Iw_1}K_p(I),χ}[𝔭̃], the χ-nebentypus version. |
| `TauCeti.AbelianSurfaces.eigenspace_dual_patched` | compatibility | (M_∞^{·,I,𝔠}/𝔭\_{x'})[1/p] ≅ (M^{·,I,𝔠}/𝔭\_{x'})[1/p] ≅ eigenspace^∨ for ρ' of weight κ. |
| `TauCeti.AbelianSurfaces.heckePrime_le_maxIdeal` | relation | 𝔭̃^{I,𝔠}\_{x'} ⊂ m̃^{I,𝔠} when ρ' lifts ρ̄ with the unit roots lifting (ᾱ\_v, β̄\_v). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.pointPrime_dim_one` | characterisation | R^{·,I,𝔠}/𝔭\_x is isomorphic to an order in E, of Krull dimension one; pulled back to the equidimensional catenary (R_∞)' its height is dim (R_∞)' − 1, which exceeds one, so 'height one' in the source means dimension one. |
| `TauCeti.AbelianSurfaces.eigenspace_weight_two` | computation | For κ = κ\_2 and I = S_p, S^{S_p,𝔠}\_{κ\_2}[𝔭̃\_x] is the space of ordinary parallel weight 2 Klingen-level forms on which the Hecke eigenvalues are those of ρ\_x. |
| `TauCeti.AbelianSurfaces.eigenspace_zero_off_support` | degenerate | If x is not in the support of M^{1,I,𝔠}, then S^{I,𝔠}\_{κ}[𝔭̃^{I,𝔠}\_x] = 0. |
| `TauCeti.AbelianSurfaces.cprime_two_meanings` | non-example | Reading 𝔠'\_v in (7.13.3) as the other unit root, as in (7.9.2), gives the wrong ideal: U_{v,1} − 𝔠'\_v would cut out the eigenspace for the other stabilization. |

**Acceptance.**
- dim_E S^{I,𝔠}\_{κ,K^{p,Iw}K_p(I)}[𝔭̃^{I,𝔠}\_{x'}] equals the generic rank of M_∞ at 𝔭\_{x'}.
- For κ = κ\_2 the spaces are the ordinary p-adic forms of parallel weight 2 that §8 glues.

**Prerequisites.** [`AP.4/lifting-hypotheses`](#ap4-lifting-hypotheses), [`AP.1/hecke-modules`](#ap1-hecke-modules), [`AP.3/patching-datum`](#ap3-patching-datum), [`AP.1/weights`](#ap1-weights), `HigherHidaAndColemanTheory:I3`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** BCGP18 §7.13 between Remark 7.13.2 and Proposition 7.13.5, with (7.13.3) and Definition 7.13.4, pp. 230–231: Defines the primes attached to points of the deformation rings, smooth points, the eigenspaces of p-adic Hilbert–Siegel forms at Iwahori and pro-v Iwahori level, and their duality with the (patched) Hida modules.

<a id="ap4-iwahori-multiplicities"></a>
### AP.4/iwahori-multiplicities — Proposition 7.13.5: Iwahori invariants of generic L-packets on components of Spec R_v^1

*Theorem.* Planet: *Iwahori multiplicities of generic packets*.

**Statement.** Let v ∈ R and η\_v a generic point of Spec R_v^1, the Ihara-avoidance ring of §7.4.5 with χ = 1. The rank n(η\_v) of the monodromy operator is generically constant on the component Spec R_v^{1,η\_v}; the set of y ∈ Spec R_v^{1,η\_v}(Ē) whose L-packet L(ρ\_y) contains a generic representation is nonempty; and d_{η\_v} := Σ\_{π∈L(ρ\_y)} dim π^{Iw(v)} is independent of such y, with d_{η\_v} = 8, 4, 4, 1 for n(η\_v) = 0, 1, 2, 3. For η = (η\_v)\_{v∈R}, d_η := ∏\_v d_{η\_v}; for ρ as in Hypothesis 7.13.1, d_ρ := d_η for the unique generic point carrying the ρ|\_{G_{F_v}} (unique by purity), so d_ρ = 8^{|R_0|}4^{|R_1|+|R_2|} with R_i = {v ∈ R : n(ρ|\_{G_{F_v}}) = i}.

**Hypotheses.**
- v ∈ R, so ρ̄|\_{G_{F_v}} is trivial and q_v ≡ 1 mod p.

**Construction or proof.**
- The components of Spec R_v^1 and their monodromy ranks are Proposition 7.4.7 and §§7.4.9–7.4.21, owned by LocalGaloisDeformationRings R08.2.
- The generic L-packets with unipotent parameters are, by Roberts–Schmidt Tables A.1, A.7, A.15 and §1 of their newform paper (owned by the GSp_4 Part II of ModularityAndLanglandsExtensions): type I (n = 0), IIa (n = 1), IIIa or {VIa, VIb} (n = 2), IVa (n = 3); type Va does not occur since it never corresponds to a residually trivial representation.
- Read off dim π^{Iw(v)} from the tables (8, 4, 4 and 1 respectively, the pair {VIa, VIb} contributing 3 + 1).

**Acceptance.**
- d_ρ = 1 when every v ∈ R has n(ρ|\_{G_{F_v}}) = 3 (Steinberg type).
- d_ρ = 8^{#R} when ρ is unramified at every v ∈ R.

**Prerequisites.** `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.0`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

**Source.** BCGP18 Proposition 7.13.5 and the definitions of d_η and d_ρ after it, §7.13, pp. 231–232: Computes the total dimension of Iwahori invariants over the generic L-packets attached to points of each component of the Ihara-avoidance deformation ring in terms of the monodromy rank, and defines the multiplicities d_η and d_ρ.

<a id="ap4-doubling-injection"></a>
### AP.4/doubling-injection — Proposition 7.13.9: the doubling injection from Klingen to Iwahori level

*Theorem.* Planet: *Doubling injection*.

**Statement.** Let ρ = ρ\_x satisfy Hypothesis 7.13.1. For I ⊆ S_p, w ∈ I^c, K^p as in Definition 7.13.4 and a choice 𝔠, the map (U_{w,1} − 𝔠'\_w): S^{I∪{w},𝔠}\_{κ\_2,K^pK_p(I∪{w})}[𝔭̃\_x^{I∪{w},𝔠}] → S^{I,𝔠}\_{κ\_2,K^pK_p(I)}[𝔭̃\_x^{I,𝔠}] is injective, where 𝔠'\_w is the unit eigenvalue of ρ\_x at w not reducing to 𝔠\_w.

**Hypotheses.**
- Hypothesis 7.13.1; 𝔠'\_w has the meaning of §7.3 and (7.9.2).

**Construction or proof.**
- By (7.9.2) the image of U_{w,1} − 𝔠'\_w is killed by U_{w,1} minus the lift of 𝔠\_w, so the map lands in the target.
- Reduce to O-coefficients and then to the injectivity of (7.9.3) at w, proved in Proposition 7.9.1 from the doubling theorem (Theorem 5.8.6, owned with the higher Hida theory).

**Acceptance.**
- Composed with the inclusion from Klingen to Iwahori level, it realizes two copies of the Klingen eigenspace inside the Iwahori eigenspace (one for each choice at w).
- Used for the upper bound in Theorem 7.13.6 and repeatedly in §8.

**Prerequisites.** [`AP.4/eigenspaces`](#ap4-eigenspaces), [`AP.2/doubling-surjections`](#ap2-doubling-surjections), `HigherHidaAndColemanTheory:X8`.

**Source.** BCGP18 Proposition 7.13.9 with its proof, §7.13, p. 233: Shows that U_{w,1} minus the other unit root maps the Klingen-level eigenspace at w injectively into the Iwahori-level eigenspace, by the injectivity of (7.9.3).

<a id="ap4-regular-weight-dimensions"></a>
### AP.4/regular-weight-dimensions — Proposition 7.13.11: dimensions of eigenspaces in regular weight and in weight κ\_2

*Theorem.*

**Statement.** In the setting of the proof of Theorem 7.13.6, let ρ\_reg be a point of weight κ\_reg in the support of M^{1,∅,𝔠}/𝔭\_{κ\_reg} on the same component of R_∞^{1,∅,𝔠} as ρ, ρ^χ\_reg a point of weight κ\_reg in the support of M^{χ,∅,𝔠}/𝔭\_{κ\_reg}, and π the representation of Hypothesis 7.13.1(6). Then dim_E S^{∅,𝔠}\_{κ\_reg,K^{p,Iw}K_p(∅)}[𝔭̃^{∅,𝔠}\_{x_reg}] = 8d_ρ, dim_E S^{∅,𝔠}\_{κ\_reg,K^{p,Iw_1}K_p(∅),χ}[𝔭̃^{∅,𝔠}\_{x^χ\_reg}] = 8 and dim_E S^{I,𝔠}\_{κ\_2,K^{p,Iw}K_p(I)}[𝔭̃^{I,𝔠}\_π] ≥ 8d_{ρ\_{π,p}} (7.13.10); moreover there are automorphic π\_reg, π^χ\_reg of weight κ\_reg and central character |·|^2 with ρ\_{π\_reg,p} ≅ ρ\_reg and ρ\_{π^χ\_reg,p} ≅ ρ^χ\_reg.

**Hypotheses.**
- Hypothesis 7.13.1; Arthur's classification for GSp_4 in the conditional form carried by ModularityAndLanglandsExtensions ML.4.

**Construction or proof.**
- By Theorems 6.6.5 and 3.10.1 the first space has dimension Σ\_π dim (π^∞)^{K^{p,Iw}K_p(∅)} on the U-eigenspace, over cuspidal π of weight κ\_reg, central character |·|^2, holomorphic at infinity, with ρ\_{π,p} ≅ ρ\_reg.
- Such π are of general type (Lemma 2.9.1); strong multiplicity one for GL_4 (Jacquet–Shalika) and Theorem 2.9.3 rewrite the sum as (Σ\_{π\_{v_0}∈L(ρ\_reg|\_{G_{F_{v_0}}})} dim π\_{v_0}^{Iw_1(v_0)})·∏\_{v∈R}(Σ\_{π\_v∈L(ρ\_reg|\_{G_{F_v}})} dim π\_v^{Iw(v)}).
- Hyperspecial invariants are one-dimensional; at v ∈ S_p the ordinary contribution is one-dimensional (Propositions 2.4.24, 2.4.26); dim π\_{v_0}^{Iw_1(v_0)} = 8 (Propositions 2.4.6, 2.4.3, 2.4.4 and the choice of v_0); at v ∈ R apply Proposition 7.13.5, using purity (Theorem 2.7.2(4)), genericity of the Weil–Deligne representation (Lemma 7.1.3) and Proposition 2.4.22.
- For ρ^χ\_reg each v ∈ R contributes 1 by Proposition 2.4.28; for π, (7.13.10) is its own contribution, which occurs by Theorem 3.10.1.

**Acceptance.**
- The factor 8 = |W| comes from the pro-v_0 Iwahori level at v_0 (Remark 7.13.7).
- The count carries the dependence of the whole argument on Theorem 2.9.3.

**Prerequisites.** [`AP.4/eigenspaces`](#ap4-eigenspaces), [`AP.4/iwahori-multiplicities`](#ap4-iwahori-multiplicities), `HigherHidaAndColemanTheory:B7`, `AutomorphicBundles:B5`, `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicSpectralTheory:AS.4`, `SmoothRepresentationsOfLocalGroups:SR.2`, `LocalGaloisDeformationRings:R08.2`.

**Source.** BCGP18 Proposition 7.13.11 with its proof, §7.13, pp. 234–235: Counts the dimensions of the regular-weight eigenspaces by the automorphic description of ordinary coherent cohomology, Arthur's classification and strong multiplicity one for GL_4, reducing to local counts of Iwahori and pro-v Iwahori invariants.

<a id="ap4-multiplicity-theorem"></a>
### AP.4/multiplicity-theorem — Theorem 7.13.6: the ρ-eigenspace has dimension 8d_ρ when #I ≤ 1

*Theorem.* Planet: *Ihara avoidance multiplicity theorem*.

**Statement.** Assume Hypothesis 7.13.1 for ρ = ρ\_x. For every I ⊆ S_p with #I ≤ 1 and every choice 𝔠, dim_E S^{I,𝔠}\_{κ\_2,K^{p,Iw}K_p(I)}[𝔭̃\_x^{I,𝔠}] = 8d_ρ. The factor 8 = |W| comes from the level Iw_1(v_0) at the auxiliary place, where no Hecke condition is imposed (Remark 7.13.7).

**Hypotheses.**
- Hypothesis 7.13.1.

**Construction or proof.**
- Case I = ∅: M_∞^{1,∅,𝔠} is maximal Cohen–Macaulay (Proposition 7.11.2), so the cycle comparison of Lemmas 7.12.2–7.12.3 (DeformationAndDerivedPatchingAlgebra P9, with cycles at R03.6) applies to M_∞^{1,∅,𝔠} and M_∞^{χ,∅,𝔠}. Since Spec (R_v^χ)' is irreducible for χ\_{v,1}, χ\_{v,2} ≠ 1 and χ\_{v,1} ≠ χ\_{v,2}^{±1} (Proposition 7.4.8), Spec (R_∞^χ)' is irreducible and the nonzero maximal Cohen–Macaulay M_∞^{χ,∅,𝔠} is supported on all of it; comparing the cycles of M_∞^1/λ ≅ M_∞^χ/λ then shows that M_∞^{1,∅,𝔠} is supported on every component of Spec (R_∞^1)'.
- M_∞^{1,∅,𝔠} is finite free over S_∞ and faithful over (R_∞^{1,∅,𝔠})^{red}, so Spec R_∞ → Spec S_∞ is surjective and generalizing; this produces regular-weight points x_reg on the component of x and x^χ\_reg.
- Proposition 7.13.11 gives the dimensions 8d_ρ and 8 at these points; Lemma 7.13.8 (generic rank on smooth points, DeformationAndDerivedPatchingAlgebra R03.3) applies at smooth points (purity, Theorem 2.7.2, Lemmas 7.1.3 and 7.3.18) and transports 8d_ρ to x, giving d'\_η = d_ρ with Lemma 7.12.3.
- Case #I = 1: the same argument at the component of π gives d'\_{η\_π} = d_{ρ\_{π,p}}; with (7.13.10) and Lemmas 7.12.3 and 7.13.8 it gives dim ≥ 8d_ρ, and the doubling injection (Proposition 7.13.9) bounds the dimension by that of the I = ∅ space, 8d_ρ.

**Acceptance.**
- For I = ∅ and every choice 𝔠 the four spaces of §8.1 (two places) all have dimension 8d_ρ.
- In particular the eigenspace is nonzero, so ρ is the Galois representation of a p-adic ordinary weight 2 form at every level I with #I ≤ 1.

**Prerequisites.** [`AP.3/patched-mcm`](#ap3-patched-mcm), [`AP.4/regular-weight-dimensions`](#ap4-regular-weight-dimensions), [`AP.4/doubling-injection`](#ap4-doubling-injection), [`AP.4/iwahori-multiplicities`](#ap4-iwahori-multiplicities), [`AP.4/eigenspaces`](#ap4-eigenspaces), `DeformationAndDerivedPatchingAlgebra:P9`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `LocalGaloisDeformationRings:L8`, `ModularityAndLanglandsExtensions:ML.4`.

**Source.** BCGP18 Theorem 7.13.6 and Remark 7.13.7 with the proof, §7.13, pp. 232–234: Proves that the weight 2 ordinary eigenspace attached to ρ at Iwahori level has dimension 8d_ρ for #I ≤ 1 by patching, the comparison of cycles in characteristic p for the two Ihara-avoidance problems and the regular-weight dimension counts.

## AP.5. Gluing, étale descent and the modularity lifting theorems

Analytic continuation and étale descent of the eigenforms (Lemmas 8.2.3, 8.2.5) and the connected-component and superspecial-locus lemmas (Lemmas 8.2.7–8.2.11, Corollary 8.2.9); Theorem 8.2.1: the eigenspace has dimension 8d_ρ for every I, overconvergently; Corollary 8.2.2: ρ satisfying Hypothesis 7.13.1 is modular with full local–global compatibility; Lemma 8.3.2: solvable descent of modularity, with its general-central-character form; Theorem 8.4.1, the main modularity lifting theorem, with the unprinted hypothesis that ρ is unramified outside a finite set; Definition 8.5.1 and Theorem 8.5.2 with relaxed multiplier, its sketch written out.

<a id="ap5-analytic-continuation-descent"></a>
### AP.5/analytic-continuation-descent — Lemmas 8.2.3 and 8.2.5: analytic continuation and étale descent of the glued forms

*Theorem.*

**Statement.** Setting: the inductive step of Theorem 8.2.1, with #I ≥ 2, I = J ⊔ {v_1, v_2}, the choice 𝔠 fixed on J ∪ I^c, and the 8d_ρ-dimensional overconvergent eigenspaces V_{𝔠\_1,𝔠\_2} (Iwahori level at v_1, v_2), V_{α\_1+β\_1,𝔠\_2} (Klingen at v_1) and V_{𝔠\_1,α\_2+β\_2} (Klingen at v_2) given by the inductive hypothesis. For (ε\_v) let 𝒳((ε\_v)) be the open where deg H_v ≥ 1 − ε\_v (v ∈ I, H_v the order-p subgroup of the Klingen structure) and deg L_v ≥ 2 − ε\_v (v ∈ I^c, L_v the rank-p^2 isotropic subgroup of the Iwahori structure), with Fargues' degree; 𝒳^{mult,†} = lim_{ε→0+}𝒳((ε\_v)), 𝒳^{mult,‡} the same limit over places other than v_1, v_2, and 𝒴 ⊂ 𝒳 the good reduction loci. Lemma 8.2.3: elements of V_{𝔠\_1,𝔠\_2} extend to 𝒳^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε, d^L_1 > 1, d^L_2 > 1}\_{Iw(v_1,v_2)} for some ε > 0, and the Klingen-level spaces extend to the analogous regions with Iwahori level only at the other place. Lemma 8.2.5: on U_ε = 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε, d^L_2 > 1}\_{Iw(v_1,v_2)} the forgetful map q_{v_2} is étale onto 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε}\_{Iw(v_1)} and surjective for small ε; after shrinking ε every element of V_{α\_1,α\_2+β\_2} descends along q_{v_2}. With the isomorphism (U_{v_1,1} − β\_1): V_{α\_1+β\_1,α\_2} ⊕ V_{α\_1+β\_1,β\_2} ≅ V_{α\_1,α\_2} ⊕ V_{α\_1,β\_2} (8.2.4), the preimage of V_{α\_1,α\_2+β\_2} is an 8d_ρ-dimensional space of eigenforms of Klingen level at v_1 and v_2 descending to 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε}.

**Hypotheses.**
- The forms are ordinary, hence of finite slope for U_{w,1}.

**Construction or proof.**
- Analytic continuation in the I^c-directions: restriction is an isomorphism on U_{w,1}-finite slope parts (Lemma 6.5.18, owned with the higher Coleman theory), and Kassaei-style continuation one form at a time.
- (8.2.4) is an isomorphism because each map U_{v_1,1} − β\_1 is injective (doubling injection, Proposition 7.13.9) between spaces of the same dimension 8d_ρ.
- Étale descent along q_{v_2}: compare the two pullbacks on the fibre product; connected components of the shrinking neighbourhoods are controlled by Poineau's theorem (8.2.6) and by Lemmas 8.2.7–8.2.11; Koecher's principle extends across the boundary.

**Acceptance.**
- For #I = 2 and S_p = {v_1, v_2} this is the argument sketched in §8.1.
- The descended space has the same dimension 8d_ρ as each of its inputs.

**Prerequisites.** [`AP.4/eigenspaces`](#ap4-eigenspaces), [`AP.4/doubling-injection`](#ap4-doubling-injection), [`AP.5/connected-components`](#ap5-connected-components), `HigherHidaAndColemanTheory:C4`, `HodgeTateAndCanonicalSubgroups:T0`, `AdicSpacesPartII:R3`, `ShimuraCompactifications:C3`.

**Source.** BCGP18 Lemmas 8.2.3 and 8.2.5 with (8.2.4) and (8.2.6), §8.2, pp. 238–242: Extends the eigenforms supplied by the induction to explicit neighbourhoods defined by degrees of the canonical subgroups, and descends the forms of Klingen level at one place along the étale forgetful map at the other, producing Klingen level at both.

<a id="ap5-connected-components"></a>
### AP.5/connected-components — Lemmas 8.2.7–8.2.11: connected components and the superspecial locus

*Theorem.*

**Statement.** (8.2.7) If S → T is a finite étale map of adic spaces of finite type over a field, the image of a connected component of S is a connected component of T. (8.2.8) Every connected component of the mod p locus Y^{I,=\_{v_2}1}\_{K^{p,Iw}K_p(I),1} (p-rank 1 at v_2) contains a point of Y^{I,=\_{{v_1,v_2}}1}, and every connected component of Y^{I,=\_{v_2}2} contains a point of Y^{I,=\_{v_1}1,=\_{v_2}2}; here I means H_v multiplicative for v ∈ I and the canonical ordinary Iwahori structure on I^c. (8.2.9) Every connected component of 𝒴^{mult,‡, d^H_1 = d^H_2 = 1, =\_{v_2}1}\_{Iw(v_1)} or 𝒴^{mult,‡, d^H_1 = d^H_2 = 1, =\_{v_2}2}\_{Iw(v_1)} contains a point non-ordinary at v_1. (8.2.10) For J ⊆ S_p and hyperspecial level at p, each irreducible component of Y^{=\_{J^c}2,=\_J1}\_1 contains a superspecial point (p-rank 0 at every place) in its closure. (8.2.11) At Iwahori level, for J ⊆ J' ⊆ S_p, every irreducible component of the Kottwitz–Rapoport stratum Y^{=\_{J^c}2,=\_J1,m-can}\_1 contains a point of Y^{=\_{(J')^c}2,=\_{J'}1,m-can}\_1 in its closure.

**Hypotheses.**
- Y_{…,1} denotes the special fibre of the open Hilbert–Siegel variety; the Ekedahl–Oort and Kottwitz–Rapoport stratifications are owned by the Hilbert–Siegel Part II of HilbertModularVarietiesAndShimuraCurves.

**Construction or proof.**
- (8.2.7): such spaces have finitely many connected components, and finite étale maps are open and closed (Huber, Lemma 1.4.5 and Proposition 1.7.8; AdicSpacesPartII R2–R3).
- (8.2.10): the Ekedahl–Oort stratification extends to the minimal compactification with affine open strata, and the superspecial locus does not meet the boundary; an affine stratum of positive dimension has a smaller stratum in its closure.
- (8.2.11): induction along the Kottwitz–Rapoport strata at Iwahori level (Remark 8.2.12 records that a quasi-affineness statement for those strata on the minimal compactification would shorten this; no reference for it is available).
- (8.2.8): the canonical section s of the projection from Iwahori level (L_w = 𝒢\_w[F]) identifies the KR strata with the p-rank strata at level K_p(I), and density of the generic p-rank strata (§4.1) finishes; (8.2.9) follows by taking tubes (connectedness of tubes of connected components of the special fibre).

**Acceptance.**
- Over a single place (F = Q) the statements reduce to closure relations of the p-rank strata of the Siegel threefold.
- They are used only to make the étale descent of Lemma 8.2.5 land on every connected component.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:H4`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `HigherHidaAndColemanTheory:I3`.

**Source.** BCGP18 Lemmas 8.2.7, 8.2.8, 8.2.10 and 8.2.11, Corollary 8.2.9 and Remark 8.2.12, §8.2, pp. 243–246: Proves that connected components of the relevant ordinary and p-rank-one loci, at Klingen and Iwahori level, meet the smaller strata, using the Ekedahl–Oort and Kottwitz–Rapoport stratifications and Huber's results on finite étale maps.

<a id="ap5-gluing-theorem"></a>
### AP.5/gluing-theorem — Theorem 8.2.1: the ρ-eigenspace has dimension 8d_ρ for every I

*Theorem.* Planet: *Gluing by étale descent*.

**Statement.** Assume ρ satisfies Hypothesis 7.13.1. For every I ⊆ S_p and every choice 𝔠, dim_E S^{I,𝔠}\_{κ\_2,K^{p,Iw}K_p(I)}[𝔭̃\_x^{I,𝔠}] = dim_{C_p} S^{I,𝔠,†}\_{κ\_2,K^{p,Iw}K_p(I)}[𝔭̃\_x^{I,𝔠}] = 8d_ρ, where S^{I,𝔠,†} = e(U^I)H^0(𝒳^{G_1,mult,†}\_{K^{p,Iw}K_p(I)}, ω^2(−D)) ∩ (S^{I,𝔠}\_{κ\_2} ⊗\_E C_p), the intersection taken inside e(U^I)H^0(𝒳^{G_1,I}\_{K^{p,Iw}K_p(I)}, ω^2(−D)) via the injective restriction from the dagger space.

**Hypotheses.**
- Hypothesis 7.13.1.

**Construction or proof.**
- Induction on #I. For #I ≤ 1: Theorem 7.13.6 and Theorem 6.6.4 (for #I ≤ 1 the ordinary overconvergent complex is the specialized Hida complex, so ordinary classes are overconvergent).
- Upper bound for every I: restriction from S^{I,𝔠,†} is injective, and repeated doubling injections (Proposition 7.13.9) bound dim S^{I,𝔠}\_{κ\_2}[𝔭̃] by the I = ∅ dimension 8d_ρ.
- Lower bound for #I ≥ 2: write I = J ⊔ {v_1, v_2}; the inductive hypothesis for J, J ∪ {v_1}, J ∪ {v_2} supplies the spaces V_{·,·}; Lemmas 8.2.3 and 8.2.5 produce an 8d_ρ-dimensional space of overconvergent eigenforms of Klingen level at v_1 and v_2.

**Acceptance.**
- For I = S_p the theorem gives a nonzero space of ordinary overconvergent Klingen-level forms at every place above p, which Theorem 6.5.8 makes classical.
- The dimension 8d_ρ does not depend on I.

**Prerequisites.** [`AP.4/multiplicity-theorem`](#ap4-multiplicity-theorem), [`AP.5/analytic-continuation-descent`](#ap5-analytic-continuation-descent), [`AP.5/connected-components`](#ap5-connected-components), [`AP.4/doubling-injection`](#ap4-doubling-injection), [`AP.4/eigenspaces`](#ap4-eigenspaces), `HigherHidaAndColemanTheory:B7`.

**Source.** BCGP18 Theorem 8.2.1 and its proof, §8.2, pp. 237–242: Extends the multiplicity theorem from #I ≤ 1 to all I by induction on #I, the upper bound coming from doubling and the lower bound from analytic continuation and étale descent.

<a id="ap5-automorphy-of-rho"></a>
### AP.5/automorphy-of-rho — Corollary 8.2.2: a representation satisfying Hypothesis 7.13.1 is modular

*Theorem.* Planet: *Automorphy of ρ under Hypothesis 7.13.1*.

**Statement.** Suppose ρ satisfies Hypothesis 7.13.1. Then ρ is modular: there is an ordinary cuspidal automorphic π' of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ\_{π',p} ≅ ρ and WD(ρ|\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'\_v ⊗ |ν|^{−3/2}) for every finite v.

**Hypotheses.**
- Hypothesis 7.13.1.

**Construction or proof.**
- Theorem 8.2.1 with I = S_p gives nonzero overconvergent ordinary forms; the classicality Theorem 6.5.8 makes them classical and Theorem 3.10.1 identifies them with a cuspidal π' with ρ\_{π',p} ≅ ρ.
- Corollary 7.9.6 (and Theorem 1.8.17) gives the semisimplified compatibility at every finite v. At v | p the full compatibility follows from Corollary 7.9.6(4), Proposition 2.4.24 and Lemma 2.5.1 with purity (the printed proof treats only R); at v ∉ R ∪ S_p both sides are unramified; the monodromy at v ∈ R remains.
- Since ρ|\_{G_{F_v}} is pure, by the corrected Lemma 2.5.1 (AutomorphicGaloisRepresentationsPartII AG2.5: for dim 4 and symplectic N, maximal rank of N characterizes the pure structure) it suffices to show n(ρ|\_{G_{F_v}}) ≤ n(π'\_v). Roberts–Schmidt Table A.15 relates n(π\_v) to vanishing of hyperspecial, paramodular, Klingen and Siegel parahoric invariants; if, say, n(ρ|\_{G_{F_v}}) = 1 but π'\_v had hyperspecial vectors, ρ would be a p-adic limit of regular-weight ρ\_{π'',p} with n = 0 (Theorem 7.9.4 and Theorem 2.7.2), contradicting semicontinuity of the rank of N; the cases n = 2, 3 are the same.

**Acceptance.**
- The form π' has Iwahori-fixed vectors at the places of R and is unramified away from R ∪ S_p ∪ {v_0}.
- The full Frobenius-semisimple compatibility holds at every finite place, as Definition 9.1.8 requires.

**Prerequisites.** [`AP.5/gluing-theorem`](#ap5-gluing-theorem), [`AP.2/ordinary-weight-two-corollary`](#ap2-ordinary-weight-two-corollary), [`AP.0/weight-two-galois`](#ap0-weight-two-galois), `HigherHidaAndColemanTheory:C4`, `AutomorphicBundles:B5`, `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, [`AP.2/hida-hecke-galois`](#ap2-hida-hecke-galois).

**Source.** BCGP18 Corollary 8.2.2 and its proof, §8.2, pp. 237–238: Deduces from the gluing theorem at I = S_p, classicality and the automorphic description that ρ is the Galois representation of a cuspidal weight 2 form, and matches monodromy at the Ihara-avoidance places through purity and the parahoric-vector table.

<a id="ap5-solvable-descent"></a>
### AP.5/solvable-descent — Lemma 8.3.2: solvable descent of modularity

*Theorem.* Planet: *Solvable descent for Hilbert–Siegel forms*.

**Statement.** Let p > 2 split completely in the totally real F and F'/F be a solvable extension of totally real fields. Suppose ρ: G_F → GSp_4(Q̄\_p) has (1) ν∘ρ = ε^{−1}; (2) ρ|\_{G_{F_v}} p-distinguished weight 2 ordinary for v | p; (3) ρ̄ vast and tidy; (4) ρ|\_{G_{F'}} irreducible and modular through an ordinary π' of GSp_4(A_{F'}) of parallel weight 2 and central character |·|^2 with full Weil–Deligne compatibility at every finite place of F'. Then ρ is modular through an ordinary π of GSp_4(A_F) of parallel weight 2 and central character |·|^2, with WD(ρ|\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π\_v ⊗ |ν|^{−3/2}) for every finite v. The same holds, with the same proof, when the central characters are |·|^2 times a finite order character, which Theorem 8.5.2 needs.

**Hypotheses.**
- p > 2 totally split in F; F'/F solvable, F' totally real.

**Construction or proof.**
- Reduce to F'/F cyclic of prime degree. ρ|\_{G_{F'}} irreducible forces π' to be of general type, with cuspidal transfer Π' to GL_4(A_{F'}); cyclic descent (Arthur–Clozel, Chapter 3, Theorem 4.2) gives Π on GL_4(A_F) with BC_{F'/F}(Π) = Π'.
- L^S(s, Π', ∧^2 ⊗ |·|^{−2}) = ∏\_ψ L^S(s, Π, ∧^2 ⊗ |·|^{−2}ψ^{−1}) over characters ψ of A_F^×/F^×N(A_{F'}^×); the left side has a simple pole at s = 1, and by Shahidi all but at most one factor on the right are holomorphic and nonvanishing there, so one factor has a pole and Theorem 2.9.3 makes Π the transfer of a cuspidal π of GSp_4(A_F) of central character |·|^2ψ and parallel weight 2.
- ρ\_{π,p}|\_{G_{F'}} ≅ ρ|\_{G_{F'}}, so ρ\_{π,p} and ρ differ by a character of Gal(F'/F); twist π to make them GL_4-isomorphic; Lemma 8.3.1 (uniqueness of the similitude character of an irreducible symplectic representation, ArithmeticGaloisRepresentations G7) gives ν∘ρ\_{π,p} = ε^{−1}, so π has central character |·|^2 and ρ\_{π,p} ≅ ρ.
- Corollary 7.9.6 gives the semisimplified compatibility; the monodromy is checked after base change, where it holds by (4).

**Acceptance.**
- It is the GSp_4 analogue of Lemma 1.3 of Barnet-Lamb–Geraghty–Harris–Taylor.
- For F' = F it is the identity.

**Prerequisites.** [`AP.2/ordinary-weight-two-corollary`](#ap2-ordinary-weight-two-corollary), `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.5`, `ArithmeticGaloisRepresentations:G7`, [`AP.0/modular-gsp4-representation`](#ap0-modular-gsp4-representation).

**Source.** BCGP18 Lemma 8.3.1, Lemma 8.3.2 and its proof, §8.3, pp. 246–247: Proves that modularity descends along solvable extensions of totally real fields for representations with irreducible restriction, by cyclic descent for GL_4, Shahidi's nonvanishing of exterior square L-functions and Arthur's classification.

<a id="ap5-main-lifting-theorem"></a>
### AP.5/main-lifting-theorem — Theorem 8.4.1: the main modularity lifting theorem

*Theorem.* Planet: *Main modularity lifting theorem*.

**Statement.** Suppose p ≥ 3 splits completely in the totally real F and ρ: G_F → GSp_4(Q̄\_p) satisfies: (0) ρ is unramified outside a finite set of places; (1) ν∘ρ = ε^{−1}; (2) ρ̄ is vast and tidy; (3) ρ|\_{G_{F_v}} is p-distinguished weight 2 ordinary for every v | p; (4) there is a cuspidal π of GSp_4(A_F) of parallel weight 2 and central character |·|^2, ordinary at every v | p, with ρ̄\_{π,p} ≅ ρ̄; (5) ρ|\_{G_{F_v}} and ρ\_{π,p}|\_{G_{F_v}} are pure for every finite v. Then ρ is modular: there is an ordinary π' of parallel weight 2 and central character |·|^2 with ρ\_{π',p} ≅ ρ and WD(ρ|\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'\_v ⊗ |ν|^{−3/2}) for every finite v. Hypothesis (0) is not printed but the proof uses it; every application has ρ from an abelian surface or a compatible system, which satisfies it.

**Hypotheses.**
- p ≥ 3 totally split in F; (0)–(5) as stated.

**Construction or proof.**
- Choose a solvable totally real F'/F, linearly disjoint from the fixed field of ker ρ̄, in which p splits completely, such that at every place w above a v ∤ p where π\_v or ρ is ramified, ρ̄|\_{G_{F'\_w}} is trivial, ρ|\_{G_{F'\_w}} has only unipotent ramification and q_w ≡ 1 mod p^2, and over which π has a base change π' with Iwahori-fixed vectors at every finite place (Mok, Proposition 4.13). The auxiliary-extension construction is owned by PotentialModularityAndCompatibleSystems R23.5; (0) makes the set of ramified places finite, so finitely many local conditions are imposed.
- Then ρ|\_{G_{F'}} satisfies Hypothesis 7.13.1 (vast and tidy is preserved by linear disjointness), so it is modular by Corollary 8.2.2.
- ρ|\_{G_{F'}} is irreducible since ρ̄|\_{G_{F'}} is, and Lemma 8.3.2 descends modularity to F.

**Acceptance.**
- Every potential modularity and modularity result of §§9–10 is deduced from it.
- Applied to ρ\_{A,p} of an abelian surface it gives Proposition 10.1.1.

**Prerequisites.** [`AP.5/automorphy-of-rho`](#ap5-automorphy-of-rho), [`AP.5/solvable-descent`](#ap5-solvable-descent), [`AP.4/lifting-hypotheses`](#ap4-lifting-hypotheses), [`AP.0/weight-two-galois`](#ap0-weight-two-galois), `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R23.5`, `ModularityAndLanglandsExtensions:ML.5`, `mathlib:NumberField.IsTotallyReal`.

**Source.** BCGP18 Theorem 8.4.1 and its proof, §8.4, pp. 247–248: States the main modularity lifting theorem for GSp_4-valued representations with inverse cyclotomic multiplier, vast and tidy residual image, p-distinguished weight 2 ordinarity at p and an ordinary residually modular seed, and proves it by solvable base change to Hypothesis 7.13.1 and descent.

<a id="ap5-twisted-ordinary"></a>
### AP.5/twisted-ordinary — Twisted p-distinguished weight 2 ordinary representations and twisted ordinary π\_p

*Definition.*

**Statement.** A representation ρ: G_{Q_p} → GSp_4(Q̄\_p) is twisted p-distinguished weight 2 ordinary if it is an unramified twist ρ\_0 ⊗ μ (μ an unramified character) of a representation ρ\_0 that is p-distinguished weight 2 ordinary (Definition 7.3.1). An admissible representation π\_p of GSp_4(Q_p) is twisted ordinary if it is an unramified twist π\_0 ⊗ (μ∘ν) of an ordinary π\_0.

**Hypotheses.**
- p ≥ 3; Definition 7.3.1 and the ordinary representations of GSp_4(Q_p) are owned by LocalGaloisDeformationRings and the GSp_4 Part II.

**Construction or proof.**
- Unfold; the multiplier of ρ\_0 ⊗ μ is ν(ρ\_0)μ^2, so a twisted ordinary ρ has multiplier ε^{−1} times the square of an unramified character.

**Uses.**
- BCGP18, Theorem 8.5.2: the hypotheses at p of the lifting theorem with general multiplier.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary` | data | ∃ μ unramified, ρ ⊗ μ^{−1} is p-distinguished weight 2 ordinary. |
| `TauCeti.AbelianSurfaces.IsTwistedOrdinary` | data | ∃ μ unramified, π\_p ⊗ (μ^{−1}∘ν) is ordinary. |
| `TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.of_untwisted` | constructor | A p-distinguished weight 2 ordinary ρ is twisted ordinary with μ = 1. |
| `TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.twist` | functoriality | Twisting by an unramified character preserves the notion. |
| `TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.multiplier` | relation | ν∘ρ = ε^{−1}μ^2 for the twisting character μ. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.twisted_trivial` | degenerate | μ = 1 recovers Definition 7.3.1. |
| `TauCeti.AbelianSurfaces.twisted_multiplier` | computation | If ρ = ρ\_0 ⊗ μ with μ(Frob_p) = −1, then ν∘ρ = ε^{−1}, since μ^2 = 1; a quadratic unramified twist keeps the multiplier. |
| `TauCeti.AbelianSurfaces.twisted_ramified_not` | non-example | A twist by a ramified character of finite order (e.g. the quadratic character of Q_p(√p)) is not twisted p-distinguished weight 2 ordinary: its diagonal characters on inertia are not 1, 1, ε^{−1}, ε^{−1}. |

**Acceptance.**
- Every p-distinguished weight 2 ordinary ρ is twisted with μ = 1.
- Twisting does not change ρ̄|\_{I_{Q_p}} up to an unramified character.

**Prerequisites.** `LocalGaloisDeformationRings:L8`, `ModularityAndLanglandsExtensions:ML.4`, `mathlib:Field.absoluteGaloisGroup`.

**Source.** BCGP18 Definition 8.5.1, §8.5, p. 248: Defines the twisted notions as unramified twists of p-distinguished weight 2 ordinary representations and of ordinary representations.

<a id="ap5-twisted-lifting-theorem"></a>
### AP.5/twisted-lifting-theorem — Theorem 8.5.2: modularity lifting with relaxed multiplier

*Theorem.*

**Statement.** Suppose p ≥ 3 splits completely in the totally real F and ρ: G_F → GSp_4(Q̄\_p) satisfies: (0) ρ is unramified outside a finite set; (1) ν∘ρ = χε^{−1}, χ totally even of finite order and unramified above p; (2) ρ̄ vast and tidy; (3) ρ|\_{G_{F_v}} twisted p-distinguished weight 2 ordinary for v | p; (4) there is π of parallel weight 2, twisted ordinary at every v | p, with ρ̄\_{π,p} ≅ ρ̄ (no condition on its central character); (5) ρ|\_{G_{F_v}}, ρ\_{π,p}|\_{G_{F_v}} pure for all finite v. Then there is a twisted ordinary π' of parallel weight 2 with ρ\_{π',p} ≅ ρ and WD(ρ|\_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'\_v ⊗ |ν|^{−3/2}) for every finite v.

**Hypotheses.**
- The paper sketches the proof and does not use the theorem elsewhere; this plan writes the sketch out.

**Construction or proof.**
- Write ν∘ρ\_π = χ'ε^{−1}; χ' = χ is totally even. Choose a quadratic totally real F'/F, linearly disjoint from the fixed field of ker ρ̄, with p split, over which χ = ψ^2 and χ' = ψ'^2 for finite order ψ, ψ': the obstruction lies in Br(F)[2] and vanishes at places above p (unramified characters) and at infinity (totally even); globalize with ArithmeticGaloisDuality R02.2/R02.4.
- Apply Theorem 8.4.1 to ρ|\_{G_{F'}} ⊗ ψ^{−1} and π\_{F'} ⊗ (ψ')^{−1}∘Art_{F'}; it gives modularity of ρ|\_{G_{F'}} ⊗ ψ^{−1}, hence of ρ|\_{G_{F'}} after twisting back (the paper prints ⊗ψ here; ⊗ψ^{−1} is meant).
- Descend with Lemma 8.3.2 in its general-central-character form: the same proof with central character |·|^2 replaced by |·|^2 times a finite order character, Lemma 8.3.1 now fixing ν∘ρ = χε^{−1}.

**Acceptance.**
- For χ = 1 and untwisted ordinarity it reduces to Theorem 8.4.1.
- The conclusion's π' may have central character |·|^2 times a finite order character.

**Prerequisites.** [`AP.5/main-lifting-theorem`](#ap5-main-lifting-theorem), [`AP.5/twisted-ordinary`](#ap5-twisted-ordinary), [`AP.5/solvable-descent`](#ap5-solvable-descent), `ArithmeticGaloisDuality:R02.2`, `ArithmeticGaloisDuality:R02.4`, `ModularityAndLanglandsExtensions:ML.5`.

**Source.** BCGP18 Definition 8.5.1, Theorem 8.5.2 and its sketched proof, §8.5, pp. 248–249: Removes the restriction ν∘ρ = ε^{−1} by a quadratic base change over which the multiplier characters have square roots, and descends by a generalization of Lemma 8.3.2.

## AP.6. Potential modularity and potential automorphy of abelian surfaces

Galois types of abelian surfaces and challenging surfaces (types A and B[C_2]); Proposition 9.2.1 for the others; Lemma 9.2.2 (big residual image, with the real-multiplication inert case treated separately); good primes and their density, with the strengthened choice of q (Definition 9.2.3, Lemmas 9.2.5–9.2.6); twisted Siegel moduli with fixed torsion and their local points; the fixed-determinant GL_2(F_q)-extension theorem; the corrected p–q switching Lemma 9.2.7; Theorem 9.2.8 (challenging surfaces are potentially modular); Theorem 2.7.3 (Galois representations for weight 0 GL_2 forms over a quadratic extension of a totally real field); Theorem 9.3.1 = Theorem 1.1.3 (every abelian surface over a totally real field is potentially automorphic, and Conjecture 2.8.6 holds); Corollary 9.3.3 with the corrected symmetry s ↦ 2 − s and Theorem 1.1.2 (Hasse–Weil for genus two curves and abelian surfaces); Theorem 9.3.4 = Theorem 1.1.4 (genus one curves over quadratic extensions), corrected in the CM case; Proposition 9.4.1 (Kummer surfaces).

<a id="ap6-galois-types"></a>
### AP.6/galois-types — Galois types of abelian surfaces and challenging surfaces

*Definition.* Planet: *Challenging abelian surfaces*.

**Statement.** Let A be an abelian surface over a totally real F and L/F the minimal (Galois) extension over which all endomorphisms of A are defined. The Galois type of A/F is the Gal(L/F)-module End_L(A) ⊗\_Z R (Fité–Kedlaya–Rotger–Sutherland); the types fall into six families A–F. Independently of l, the representations ρ\_{A,l} fall into exactly one of: (1) strongly irreducible (type A); (2) reducible (types B[C_1], C, E[C_n], some D, some F); (3) potentially abelian but not reducible (the remaining D and F); (4) induced from a quadratic K/F but not potentially abelian, with the two 2-dimensional constituents over K either (a) equivalent up to twist (type E[D_n]) or (b) not (type B[C_2]). A/F is challenging if it has type A (equivalently End_C A = Z) or B[C_2]. In type B[C_2] there are a quadratic K/F (Gal(K/F) = {1,σ}) and a strongly irreducible weakly compatible system 𝒮 = (s_l) of rank 2, weight 0 representations of G_K with determinant ε\_l^{−1} such that 𝓡\_A ≅ Ind_{G_K}^{G_F}𝒮, and s_l^σ, s_l never become isomorphic over a finite extension of K.

**Hypotheses.**
- F totally real; A an abelian surface over F; 𝓡\_A as in AP.0.

**Construction or proof.**
- The classification of Galois types is Fité–Kedlaya–Rotger–Sutherland; the translation into the four categories of l-adic behaviour uses Faltings' semisimplicity and Tate conjecture for endomorphisms (FaltingsFinitenessAndIsogenyTheorems R28.4), the endomorphism algebra and Rosati involution (AbelianSchemesAndArithmeticModuli A6) and Johansson §§4.2–4.6.
- For type B[C_2], A has real multiplication by a real quadratic field over K but not over F, which splits 𝓡\_A|\_{G_K} into two rank 2 systems interchanged by σ (Johansson §4.3).

**Uses.**
- BCGP18, Proposition 9.2.1: non-challenging surfaces are treated by rank 2 methods.
- BCGP18, Lemma 9.2.2 and Theorem 9.2.8: challenging surfaces have vast and tidy residual images for many primes and are potentially modular.
- BCGP18, Theorem 9.3.4: Res_{K/F}E has type B[C_2].

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.galoisType` | data | The Gal(L/F)-module End_L(A) ⊗ R, classified into the families A–F. |
| `TauCeti.AbelianSurfaces.IsChallenging` | data | A has type A or B[C_2]. |
| `TauCeti.AbelianSurfaces.isChallenging_typeA_iff` | characterisation | A has type A iff End_C(A) = Z iff ρ\_{A,l} is strongly irreducible for one (equivalently every) l. |
| `TauCeti.AbelianSurfaces.typeB_C2_induced` | relation | In type B[C_2], 𝓡\_A ≅ Ind_{G_K}^{G_F}𝒮 for a quadratic K/F and a strongly irreducible rank 2 weight 0 system 𝒮 with det = ε^{−1}, whose conjugate is never a twist of it over a finite extension. |
| `TauCeti.AbelianSurfaces.category_indep_l` | other | The category (1)–(4) of ρ\_{A,l} does not depend on l. |
| `TauCeti.AbelianSurfaces.galoisType_isogeny` | functoriality | Isogenous surfaces have the same Galois type; base change to F' replaces L by LF'. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.typeA_generic` | computation | The Jacobian of a genus two curve y^2 = f(x) with Gal(f) = S_5 or S_6 over Q has End_C = Z (Zarhin), so it has type A and is challenging. |
| `TauCeti.AbelianSurfaces.product_not_challenging` | non-example | E_1 × E_2 has reducible ρ\_{A,l} (type B[C_1] when non-isogenous without CM) and is not challenging. |
| `TauCeti.AbelianSurfaces.weilRestriction_typeB` | compatibility | For K/F quadratic and E/K non-CM, not isogenous to any twist of E^σ, Res_{K/F}E has type B[C_2] with 𝒮 = 𝓡\_E. |
| `TauCeti.AbelianSurfaces.cm_potentially_abelian` | degenerate | An abelian surface with CM by a quartic CM field has potentially abelian 𝓡\_A (type D or F) and is not challenging. |

**Acceptance.**
- End_C A = Z gives type A.
- Res_{K/F}E for E/K not isogenous to a twist of its conjugate, without CM, has type B[C_2].

**Prerequisites.** [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `AbelianSchemesAndArithmeticModuli:A6`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ArithmeticGaloisRepresentations:G7`.

**Source.** BCGP18 §9.2, the classification before Proposition 9.2.1 and the definition of challenging after its proof, pp. 253–254: Recalls the Galois types of abelian surfaces after Fité–Kedlaya–Rotger–Sutherland, sorts the l-adic representations into four categories, and singles out types A and B[C_2] as challenging, with the induced structure in type B[C_2] after Johansson.

<a id="ap6-non-challenging-automorphy"></a>
### AP.6/non-challenging-automorphy — Proposition 9.2.1: surfaces not of type A or B[C_2] are potentially automorphic

*Theorem.*

**Statement.** Let A be an abelian surface over a totally real F not of type A or B[C_2]. Then A is potentially automorphic.

**Hypotheses.**
- F totally real.

**Construction or proof.**
- Types D and F: A acquires CM over L, so 𝓡\_A is potentially abelian and automorphic through algebraic Hecke characters (ComplexMultiplicationAndExplicitReciprocity CM.4).
- Types B[C_1], C and E other than E[D_n]: 𝓡\_A = 𝓡^1 ⊕ 𝓡^2 with irreducible odd weight 0 rank 2 systems over F, each potentially automorphic by Barnet-Lamb–Gee–Geraghty–Taylor Theorem 5.4.1 (ModularityAndLanglandsExtensions ML.2).
- Type E[D_n]: 𝓡\_A ≅ Ind_{G_{F'}}^{G_F}𝒮 with s_l^σ ≅ s_l ⊗ δ\_l for a finite order δ. For a density one set of l (Lemma 9.1.10(2), PotentialAutomorphyInfrastructure PA.5; BLGGT Prop. 5.3.2) fix l > 7 with Sym^2 s̄\_l|\_{G_{F'(ζ\_l)}} irreducible, l unramified in F', s_l, ε\_l crystalline above l. Proj s_l extends to G_F → PGL_2(Q̄\_l) and lifts (Tate's H^2(G_F, Q/Z) = 0, ArithmeticGaloisDuality R02.4; Patrikis Lemmas 2.3.17, 2.7.4, ArithmeticGaloisRepresentations G7) to r̃: G_F → GL_2(Q̄\_l), Hodge–Tate of weights (0,1), with r̃|\_{G_{F'}} = s_l ⊗ ψ; after a twist r̃ is crystalline above l, odd (Calegari–Gee Prop. 2.5), hence potentially automorphic (BLGGT Thm. 4.5.1), and ρ\_{A,l} ≅ Ind(r̃|\_{G_{F'}} ⊗ ψ^{−1}).

**Acceptance.**
- E_1 × E_2 over F is potentially automorphic.
- Types D, F are automorphic after a finite extension through Hecke characters.

**Prerequisites.** [`AP.6/galois-types`](#ap6-galois-types), [`AP.0/automorphic-abelian-variety`](#ap0-automorphic-abelian-variety), [`AP.0/automorphic-compatible-system`](#ap0-automorphic-compatible-system), `ModularityAndLanglandsExtensions:ML.2`, `PotentialAutomorphyInfrastructure:PA.5`, `ArithmeticGaloisDuality:R02.4`, `ArithmeticGaloisRepresentations:G7`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Source.** BCGP18 Proposition 9.2.1 and its proof, §9.2, pp. 253–254: Proves potential automorphy of the non-challenging abelian surfaces case by case: potentially abelian, sums of two rank 2 systems, and the type E[D_n] inductions through lifting a projective representation.

<a id="ap6-big-image"></a>
### AP.6/big-image — Lemma 9.2.2: big residual image for challenging surfaces

*Theorem.*

**Statement.** If A/F is a challenging abelian surface, then ρ̄\_{A,l} is vast and tidy for a set of primes l of Dirichlet density one. In type A this follows from Serre's theorem that ρ̄\_{A,l}(G_F) = GSp_4(F_l) for all large l, with Lemma 7.5.15. In type B[C_2], ρ\_{A,l} = Ind_{G_K}^{G_F}s_l and Lemma 7.5.22 applies, except for the case to be treated separately: A has real multiplication by a real quadratic M defined over K but not over F and l is inert in M; then s̄\_l^σ is the Frobenius twist of s̄\_l and ρ̄\_{A,l}(G_{F(ζ\_l)}) = SL_2(F_{l^2}) ⋊ Z/2 ⊂ Sp_4(F_l), which is enormous for l ≥ 11 (Lemmas 7.5.14, 7.5.17) and tidy by Lemma 7.5.12.

**Hypotheses.**
- A challenging; F totally real.

**Construction or proof.**
- Type A: Serre's open image theorem for abelian surfaces with End_C = Z over a number field (owned by the OpenImage Part II of FaltingsFinitenessAndIsogenyTheorems); GSp_4(F_l) with surjective multiplier is vast and tidy (Lemma 7.5.15, G7).
- Type B[C_2], general case: SL_2(O_M/λ) ⊂ s̄\_λ(G_K) for almost all λ by Ribet's large image theorem for abelian varieties with real multiplication (no potential inner twists since s_l, s_l^σ never become isomorphic), owned by the same Part II; then Lemma 7.5.22.
- Inert case: identify the image as SL_2(F_{l^2}) ⋊ Z/2 inside Sp_4(F_l) (the printed argument would give the wreath product SL_2(F_{l^2}) ≀ Z/2, too large for Sp_4(F_l)), enormous for l ≥ 11 and tidy because its centre has order at least 3.
- Lemma 7.5.22 as printed uses Aut(PSL_2(k)) = PGL_2(k), which is false (it is PΓL_2(k)); it must be applied with k = F_l, or with the Frobenius-twisted case separated as above (ArithmeticGaloisRepresentations G7).

**Acceptance.**
- Type A: ρ̄\_{A,l}(G_F) = GSp_4(F_l) for l ≫ 0.
- The exceptional inert case is enormous for l ≥ 11.

**Prerequisites.** [`AP.6/galois-types`](#ap6-galois-types), [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ArithmeticGaloisRepresentations:G7`, Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Lemma 9.2.2 and its proof, §9.2, p. 254: States that challenging abelian surfaces have vast and tidy residual representations for a density one set of primes, via Serre's theorem in type A and the induction lemma in type B[C_2].

<a id="ap6-good-primes"></a>
### AP.6/good-primes — Good primes for an abelian surface

*Definition.*

**Statement.** Let A/F be an abelian surface over a totally real field. A rational prime p ≥ 3 is a good prime for A if: A has a polarization of degree prime to p; p splits completely in F; ρ̄\_{A,p} is vast and tidy; and ρ\_{A,p}|\_{G_{F_v}} is p-distinguished weight 2 ordinary for every v | p. These are exactly the primes for which Theorem 8.4.1 can be applied to ρ\_{A,p} (Remark 9.2.4).

**Hypotheses.**
- F totally real; A an abelian surface over F.

**Construction or proof.**
- Unfold; a polarization of degree prime to p makes ρ\_{A,p} take values in GSp_4(Z̄\_p) with ρ̄\_{A,p} symplectic.

**Uses.**
- BCGP18, Lemmas 9.2.5–9.2.7: density of good primes and the choice of p, q.
- BCGP18, Theorem 9.2.8: Theorem 8.4.1 is applied at good primes.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.IsGoodPrime` | data | The conjunction of the four conditions on (A, p). |
| `TauCeti.AbelianSurfaces.IsGoodPrime.split` | projection | A good prime splits completely in F. |
| `TauCeti.AbelianSurfaces.IsGoodPrime.vast_tidy` | projection | ρ̄\_{A,p} is vast and tidy. |
| `TauCeti.AbelianSurfaces.IsGoodPrime.ordinary` | projection | ρ\_{A,p}∣\_{G_{F_v}} is p-distinguished weight 2 ordinary for v ∣ p. |
| `TauCeti.AbelianSurfaces.IsGoodPrime.liftingHypotheses` | other | At a good prime, ρ\_{A,p} satisfies (0), (1), (2), (3) and (5) of Theorem 8.4.1; only the automorphic seed (4) remains. |
| `TauCeti.AbelianSurfaces.isGoodPrime_ordinary_iff` | characterisation | For v ∣ p of good reduction with Frobenius polynomial x^4 − a_1x^3 + a_2x^2 − pa_1x + p^2, the ordinarity condition holds iff p ∤ a_2 and p ∤ a_1^2 − 4a_2. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.good_needs_split` | non-example | For F = Q(√2) and p = 3 (inert), no abelian surface over F has 3 as a good prime. |
| `TauCeti.AbelianSurfaces.good_ordinary_criterion` | computation | For F = Q, p = 5 and a_1 = 1, a_2 = 2 at the prime 5: 5 ∤ 2 and 5 ∤ 1 − 8 = −7, so the local condition at 5 holds; for a_1 = 2, a_2 = 1 it fails since 4 − 4 = 0. |
| `TauCeti.AbelianSurfaces.good_two_excluded` | degenerate | p = 2 is never a good prime. |
| `TauCeti.AbelianSurfaces.good_product_excluded` | non-example | For A = E_1 × E_2, ρ̄\_{A,p} is reducible, so no prime is good. |

**Acceptance.**
- At a good prime p, ρ\_{A,p} satisfies hypotheses (0)–(3) and (5) of Theorem 8.4.1.
- Good primes are at least 3.

**Prerequisites.** [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `AbelianSchemesAndArithmeticModuli:A2`, `ArithmeticGaloisRepresentations:G7`, `LocalGaloisDeformationRings:L8`, `mathlib:Nat.Prime`.

**Source.** BCGP18 Definition 9.2.3 and Remark 9.2.4, §9.2, p. 255: Defines good primes by the polarization, splitting, residual image and local ordinarity conditions under which the lifting theorem applies.

<a id="ap6-good-prime-density"></a>
### AP.6/good-prime-density — Lemmas 9.2.5–9.2.6: good primes have density one, and the auxiliary pair p, q

*Theorem.*

**Statement.** Let A/F be a challenging abelian surface. (9.2.5) The good primes for A have relative density one among the primes splitting completely in F. (9.2.6) There are distinct good primes p, q such that ρ̄\_{A,q}(Frob_v) has distinct eigenvalues for every v | p. For Lemma 9.2.7, p is fixed first and q is then chosen with q > p^2 and Frob_q conjugate to complex conjugation in the Galois closure over Q of F(A[p], ζ\_p, √Δ\_v : v | p), Δ\_v = a_1(v)^2 − 4a_2(v) + 8p; this is a positive-density Chebotarev condition on primes split in F, and it forces q ≡ −1 mod p and every Δ\_v to be a square mod q.

**Hypotheses.**
- A challenging; a_1(v), a_2(v) the Frobenius coefficients at v | p for a good prime p.

**Construction or proof.**
- 9.2.5 (after Sawin and Calegari–Geraghty Lemma A.7): by Lemma 9.2.2 it suffices that ρ\_{A,p}|\_{G_{F_v}} is p-distinguished weight 2 ordinary for density one; at a place of good reduction above p with Frobenius polynomial x^4 − a_1x^3 + a_2x^2 − pa_1x + p^2, A is ordinary iff p ∤ a_2, and then the condition holds iff p ∤ a_1^2 − 4a_2 (Katz–Messing compares crystalline and l-adic Frobenius polynomials; requested at AbelianSchemesAndArithmeticModuli A4).
- By the Weil bounds p | a_1^2 − 4a_2 forces a_1^2 − 4a_2 = pc with c in a finite set; Chebotarev on the Zariski closure of ρ\_{A,l}(G_F) reduces density one to non-constancy of the trace of (V^{⊗2} − 4∧^2V) ⊗ χ^{−1} on each component of the Sato–Tate group (USp_4 in type A, the normalizer of SU_2 × SU_2 in type B[C_2]); this density argument is owned by the OpenImage Part II.
- 9.2.6: at a good prime p the crystalline Frobenius eigenvalues on T_pA at v | p are distinct, so ρ̄\_{A,q}(Frob_v) has distinct eigenvalues for all but finitely many q of good reduction; the strengthened choice of q is one more Chebotarev condition.

**Acceptance.**
- q ≡ −1 mod p and each Δ\_v is a square mod q.
- q > p^2, so p < 2√q.

**Prerequisites.** [`AP.6/good-primes`](#ap6-good-primes), [`AP.6/big-image`](#ap6-big-image), `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PadicHodgeTheory:R06.2`, `CohomologyComparisons:CP.2`, Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Lemmas 9.2.5 and 9.2.6 with their proofs, §9.2, p. 255: Shows that good primes have relative density one for a challenging surface, by an ordinarity-density argument after Sawin, and chooses two good primes p, q with ρ̄\_{A,q}(Frob_v) regular semisimple at the places above p.

<a id="ap6-twisted-siegel-moduli"></a>
### AP.6/twisted-siegel-moduli — Twisted moduli of principally polarized abelian surfaces with fixed torsion

*Construction.*

**Statement.** Let F' be a number field, n ≥ 3 an integer (a prime, a product pq of distinct primes, or 3), and V a finite symplectic G_{F'}-module free of rank 4 over Z/n with multiplier ε̄^{−1}. Y(V)/F' is the moduli space of pairs (B, ı) of a principally polarized abelian surface B and a symplectic isomorphism ı: B[n] ≅ V^∨ (Weil pairing against the dual pairing). It is a smooth geometrically connected quasi-projective variety over F', a twist of the Siegel moduli space 𝒜\_2(n) of full level n, to which it becomes isomorphic over F̄'. Its local open sets Y^{ord}(F'\_v) of points with good ordinary reduction (v finite) are: nonempty at v | ∞ when the multiplier is ε̄^{−1}; nonempty at v | p when an abelian surface over F'\_v with good ordinary reduction realizes V ⊗ Z/p; nonempty at v | q through the canonical lift of an ordinary abelian surface over the residue field realizing V ⊗ Z/q.

**Hypotheses.**
- n ≥ 3, so the moduli problem is rigid and representable; the Weil pairing convention of AbelianSchemesAndArithmeticModuli A3.

**Construction or proof.**
- Construct Y(V) as the twist of the fine moduli scheme 𝒜\_2(n) (PELModuli M5–M6) by the Isom torsor between V^∨ and (Z/n)^4 with its standard form; geometric connectedness holds because the multiplier of V is ε̄^{−1}, matching the Weil pairing's target μ\_n, so the Weil-pairing component is the one selected (compare the Hilbert analogue HilbertModularVarietiesAndShimuraCurves H6).
- Local points: at real places use complex uniformization with the polarization cone; at v | p use a given ordinary surface; at v | q take the Serre–Tate canonical lift (AbelianSchemesAndArithmeticModuli A4) of an ordinary surface over F_q with prescribed q-torsion, here E × E' with traces p and −p (Lemma 9.2.7).

**Uses.**
- BCGP18, proof of Theorem 9.2.8: Moret-Bailly applied to Y(A[p] ⊕ ρ̄\_q^∨) produces B.
- BCGP18, §10.2: B(ρ̄) = Y(V(ρ̄)) for n = 3.
- BCGP25 §9.2.1: the twisted odd-theta moduli P(ρ̄) is a degree 6 cover of Y(V(ρ̄)).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.twistedModuli` | data | Y(V), smooth geometrically connected over F', with universal (B, ı). |
| `TauCeti.AbelianSurfaces.twistedModuli_geom` | equivalence | Y(V) ×\_{F'} F̄' ≅ 𝒜\_2(n)\_{F̄'}. |
| `TauCeti.AbelianSurfaces.twistedModuli_point` | characterisation | Y(V)(L) = {(B, ı) over L with ı: B[n] ≅ V^∨ symplectic}/≅, for L/F' a field. |
| `TauCeti.AbelianSurfaces.ordinaryLocus` | data | Y^{ord}(F'\_v), open in Y(V)(F'\_v). |
| `TauCeti.AbelianSurfaces.ordinaryLocus_nonempty_real` | other | Y(V)(F'\_v) ≠ ∅ at real v when the multiplier is ε̄^{−1}. |
| `TauCeti.AbelianSurfaces.ordinaryLocus_nonempty_canonicalLift` | constructor | An ordinary surface B_0/k_v with B_0[n] ≅ V^∨ over k_v gives, by its canonical lift, a point of Y^{ord}(F'\_v). |
| `TauCeti.AbelianSurfaces.twistedModuli_product` | functoriality | For coprime m, n, Y(V_m ⊕ V_n) = Y(V_m) ×\_{𝒜\_2} Y(V_n). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.twisted_untwisted` | degenerate | For V = (Z/n)^4 with the standard form and n with μ\_n ⊂ F', Y(V) = 𝒜\_2(n)\_{F'}. |
| `TauCeti.AbelianSurfaces.twisted_dim` | computation | Y(V) is smooth of dimension 3, like 𝒜\_2. |
| `TauCeti.AbelianSurfaces.twisted_multiplier_needed` | non-example | For n = 5 over Q, where ε̄ ≠ ε̄^{−1}, a module V of multiplier ε̄ has V^∨ of multiplier ε̄^{−1}, while B[5] has multiplier ε̄ for every principally polarized B; so Y(V) has no points and the multiplier condition cannot be dropped. |
| `TauCeti.AbelianSurfaces.twisted_level3_burkhardt` | compatibility | For n = 3 and V with V^∨ ≅ μ\_3^2 ⊕ (Z/3)^2 carrying its standard form, Y(V) is the moduli space 𝒜\_2(3) of full level 3 structures, over C the complement of the Hessian in the Burkhardt quartic. |

**Acceptance.**
- Over F̄', Y(V) ≅ 𝒜\_2(n).
- For V = A[p] ⊕ ρ̄\_q^∨ the point A gives an F'\_v-point at v | p.

**Prerequisites.** `PELModuli:M5`, `PELModuli:M6`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A5`, `HilbertModularVarietiesAndShimuraCurves:H6`, `PotentialModularityAndCompatibleSystems:R23.1`.

**Source.** BCGP18 Proof of Theorem 9.2.8, §9.2, pp. 257–258; §10.2 before Theorem 10.2.1, p. 268: Uses the moduli space of abelian surfaces with symplectic isomorphisms of their p- and q-torsion (resp. 3-torsion) onto given modules, smooth and geometrically connected and identified geometrically with full level structure moduli, with ordinary local points at the auxiliary primes.

<a id="ap6-fixed-determinant-extensions"></a>
### AP.6/fixed-determinant-extensions — Fixed-determinant GL_2(F_q)-extensions with prescribed local behaviour

*Theorem.*

**Statement.** Let E'/E be finite extensions of number fields, F^{(avoid)}/E finite Galois, S a finite set of places of E, q a prime, ψ̄: G_E → F_q^× a character cut out inside F^{(avoid)} with ψ̄(G_{E'}) = F_q^×, and for v ∈ S local Galois extensions with GL_2(F_q)-valued local data of determinant ψ̄. Then there are a finite extension K/E, linearly disjoint from E'F^{(avoid)}/E and with the prescribed splitting at S, and, over K' = KE', a representation r̄: G_{K'} → GL_2(F_q) with det r̄ = ψ̄, image GL_2(F_q), L' ∩ K'F^{(avoid)} = K'(ψ̄) for the fixed field L' of ker r̄, and the prescribed local data at the places above S (the variant of Proposition 9.1.12 used by Lemma 9.2.7). No descent of L' to an extension of K is asserted.

**Hypotheses.**
- E, E' number fields; S finite; the local data have determinant ψ̄.

**Construction or proof.**
- Apply Moret-Bailly's theorem (PotentialModularityAndCompatibleSystems R23.1) to the Weil restriction Res_{E'/E} of the variety of GL_2(F_q)-torsors whose determinant torsor is the one of ψ̄; it is geometrically irreducible and has the prescribed local points.
- Add to S auxiliary places of E split completely in E'F^{(avoid)}, with unramified local extensions whose Frobenii meet every GL_2-conjugacy class contained in SL_2(F_q); Jordan's lemma then forces image ⊇ SL_2(F_q), and det = ψ̄ with ψ̄(G_{E'}) = F_q^× gives image GL_2(F_q).
- Keeping the asymmetric local choices at the two places above a split auxiliary place requires working over K' without descending L'.

**Acceptance.**
- For ψ̄ = ε̄^{−1}, L' ∩ K'F^{(avoid)} = K'(ζ\_q).
- r̄(G_{K'(ψ̄)}) = SL_2(F_q).

**Prerequisites.** `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Proposition 9.1.12 and its proof, §9.1, pp. 252–253, and the proof of Lemma 9.2.7, pp. 256–257: Constructs extensions with given Galois group and local behaviour over a base change by restriction of scalars and Moret-Bailly; Lemma 9.2.7 needs it with GL_2(F_q) and fixed determinant.

<a id="ap6-pq-switch"></a>
### AP.6/pq-switch — Lemma 9.2.7 (corrected): the p–q switching lemma

*Theorem.* Planet: *The p–q switching lemma*.

**Statement.** Let A/F be an abelian surface over a totally real field and p, q good primes chosen as in Lemma 9.2.6 with the strengthened choice of q. Fix a totally real quadratic F_1/F in which p and q split completely, linearly disjoint from the kernels of G_F acting on A[p], A[q]. Then there are a finite Galois extension of totally real fields F'/F and r̄\_q: G_{F'F_1} → GL_2(F_q) such that: (1) p, q split completely in F'; (2) F'/F is linearly disjoint from F_1/F and from the kernels on A[p], A[q]; (3) det r̄\_q = ε̄^{−1}; (4) r̄\_q(G_{F'F_1}) = GL_2(F_q) and the projective image of r̄\_q differs from its Gal(F'F_1/F')-conjugate; (5) ρ̄\_q := Ind_{G_{F'F_1}}^{G_{F'}}r̄\_q: G_{F'} → GSp_4(F_q), with multiplier ε̄^{−1}, satisfies ρ̄\_q|\_{G_{F'\_{w'}}} ≅ λ\_a ⊕ λ\_b ⊕ ε̄^{−1}λ\_b^{−1} ⊕ ε̄^{−1}λ\_a^{−1} with a = p, b = −p in F_q for w' above w | q, and ρ̄\_q|\_{G_{F'\_{v'}}} ≅ ρ̄\_{A,q}|\_{G_{F_v}} for v' above v | p; (6) ρ̄\_q is vast and tidy. The printed (5) at w | q, (ρ̄\_{A,q}|\_{G_{F_w}})^{ss}, is false in general (it needs the unit roots of A at w to lie in F_q).

**Hypotheses.**
- p, q as in Lemma 9.2.6 with q > p^2, q ≡ −1 mod p and every Δ\_v a square mod q.

**Construction or proof.**
- Put K' = F_1F' and apply the fixed-determinant extension theorem with E = F, E' = F_1, G = GL_2(F_q), ψ̄ = ε̄^{−1}, S the places dividing pq𝔯∞ for an auxiliary place 𝔯 ∤ pq of F split in F_1, with local data of determinant ε̄^{−1} (det c_v = −1 at real places).
- At w | p take φ̄\_{w_1}, φ̄\_{w_2} unramified, F_q-rational, with Frobenius characteristic polynomials (x − α\_w)(x − pα\_w^{−1}) and (x − β\_w)(x − pβ\_w^{−1}); they lie in F_q[x] because each Δ\_w is a square mod q. At w | q take diag(λ\_a, ε̄^{−1}λ\_a^{−1}) and diag(λ\_b, ε̄^{−1}λ\_b^{−1}) with a = p, b = −p, the unit roots of ordinary elliptic curves over F_q of traces p and −p (they exist by Deuring since p < 2√q; recorded as a gap).
- (3) holds by construction and L' ∩ K'F^{(avoid)} = K'(ζ\_q); (4) comes from the places above 𝔯; for (6), G_{K'(ζ\_q)} = ker(det∘r̄\_q) has image exactly SL_2(F_q), the hypothesis of Lemma 7.5.22 with k = F_q (G7). The printed proof's square-root twist of ε̄ det r̄\_q fails for F_q^×-valued roots and is not used.

**Acceptance.**
- ρ̄\_q is induced, so after the switch the q-adic seed comes from GL_2 over F_1F'.
- At v | p the local representation of ρ̄\_q matches that of A[q], so a single surface B can realize A[p] and ρ̄\_q^∨ simultaneously.

**Prerequisites.** [`AP.6/good-prime-density`](#ap6-good-prime-density), [`AP.6/fixed-determinant-extensions`](#ap6-fixed-determinant-extensions), `ArithmeticGaloisRepresentations:G7`, Tau Ceti EllipticCurves (layer 3), Tau Ceti Chebotarev (layer 10).

**Source.** BCGP18 Lemma 9.2.7 and its proof, §9.2, pp. 256–257: Produces, over a totally real extension, a mod q representation induced from a GL_2(F_q)-valued representation of determinant ε̄^{−1} with prescribed local behaviour at the places above p and q and big image, to be used as the second residual representation in the p–q switch.

<a id="ap6-potential-modularity"></a>
### AP.6/potential-modularity — Theorem 9.2.8: challenging abelian surfaces are potentially modular

*Theorem.* Planet: *Potential modularity of abelian surfaces*.

**Statement.** Let A/F be a challenging abelian surface over a totally real field. Then A is potentially modular: there are a finite Galois extension of totally real fields F'/F and a prime p splitting completely in F' such that ρ\_{A,p}|\_{G_{F'}} is modular and irreducible.

**Hypotheses.**
- F totally real; A challenging.

**Construction or proof.**
- Take p, q, F_1, F', r̄\_q, ρ̄\_q from Lemma 9.2.7. Let Y/F' be the twisted moduli space of (B, ı\_p, ı\_q) with ı\_p: B[p] ≅ A[p]|\_{G_{F'}} and ı\_q: B[q] ≅ ρ̄\_q^∨; it is smooth and geometrically connected, and Ω\_v = Y^{ord}(F'\_v) is nonempty for v | pq∞ (A at v | p; the canonical lift of E × E' with traces p, −p at v | q; real points from det r̄\_q^∨ = ε).
- Moret-Bailly (R23.1) gives a totally real F''/F', with p and q split, linearly disjoint from the relevant kernels, and B/F'' with good ordinary reduction above p and q.
- Proposition 9.1.11 (R23.2, R23.3, R23.5) gives, after enlarging F'', a q-ordinary weight 0 form 𝛑 on GL_2(A_{F_1F''}) with trivial central character, unramified above pq, with ρ\_{𝛑,q} ≅ r̄\_q|\_{G_{F_1F''}}; Roberts' theta lift (GSp_4 Part II) gives an ordinary π on GSp_4(A_{F''}) of parallel weight 2 and central character |·|^2 (printed: trivial) whose GL_4 transfer is the automorphic induction of 𝛑 ⊗ |·|, so ρ\_{π,q} ≅ Ind ρ\_{𝛑,q} lifts ρ̄\_q|\_{G_{F''}}; ρ\_{π,q} is pure (Blasius away from q, Caraiani at q).
- Theorem 8.4.1 at q makes ρ\_{B,q} modular, hence ρ\_{B,p}; Theorem 8.4.1 at p then makes ρ\_{A,p}|\_{G_{F''}} modular (purity of ρ\_{B,q}, ρ\_{B,p}, ρ\_{A,p} from Proposition 2.8.1). Irreducibility comes from the vast residual image.

**Acceptance.**
- Every surface with End_C A = Z over a totally real field is potentially modular.
- The extension F'' can be chosen linearly disjoint from any given finite extension (used in Theorem 9.3.4).

**Prerequisites.** [`AP.6/pq-switch`](#ap6-pq-switch), [`AP.6/twisted-siegel-moduli`](#ap6-twisted-siegel-moduli), [`AP.5/main-lifting-theorem`](#ap5-main-lifting-theorem), [`AP.6/good-primes`](#ap6-good-primes), [`AP.0/modular-gsp4-representation`](#ap0-modular-gsp4-representation), [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialModularityAndCompatibleSystems:R23.2`, `PotentialModularityAndCompatibleSystems:R23.3`, `PotentialModularityAndCompatibleSystems:R23.5`, `ModularityAndLanglandsExtensions:ML.5`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.5`.

**Source.** BCGP18 Theorem 9.2.8 and its proof, §9.2, pp. 257–258: Proves potential modularity of challenging abelian surfaces by a p–q switch: an auxiliary surface B shares A's p-torsion and has q-torsion induced from GL_2, which is potentially modular; the lifting theorem is applied twice.

<a id="ap6-gl2-quadratic-galois"></a>
### AP.6/gl2-quadratic-galois — Theorem 2.7.3: Galois representations for weight 0 forms on GL_2 over a quadratic extension of a totally real field

*Theorem.*

**Statement.** Let F be totally real, K/F quadratic with Gal(K/F) = {1, τ}, and 𝛑 a cuspidal automorphic representation of GL_2(A_K) of weight 0 (𝛑\_v corresponds to φ\_{0,1} at every infinite v of K) with trivial central character. Then there is a continuous irreducible ρ\_{𝛑,p}: G_K → GL_2(Q̄\_p) with WD(ρ\_{𝛑,p}|\_{G_{K_w}})^{ss} ≅ rec_p(𝛑\_w ⊗ |·|^{−1/2})^{ss} for finite w ∤ p, equality of Frobenius-semisimple Weil–Deligne representations when 𝛑\_w is not a twist of Steinberg, and ρ\_{𝛑,p}|\_{G_{K_w}} Hodge–Tate with labelled weights (0,1) for w | p. (The paper prints GL_2(K) for GL_2(A_K) and G_{K_v} for G_{K_w}.)

**Hypotheses.**
- F totally real, K/F quadratic (no condition on the signature of K).

**Construction or proof.**
- For K CM this is a case of Mok's main theorem.
- In general, Mok's §5.1 argument produces a cuspidal π of GSp_4(A_F) via Theorem 2.9.3 (the automorphic induction of 𝛑 ⊗ |·|); its infinity components lie in the L-packet of φ\_{(2;1,0)} by Lemma 2.6.1 at real places of F split in K and by Mok Prop. 5.2 where K_v is complex; Mok §§5.2–5.3 then give ρ\_{𝛑,p} as a constituent of ρ\_{π,p}|\_{G_K}.

**Acceptance.**
- For K totally real this recovers the Hilbert modular case.
- Used in Theorem 9.3.4 for the local–global compatibility of the GL_2 form over KF'.

**Prerequisites.** `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensions:ML.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `mathlib:NumberField.IsTotallyReal`.

**Source.** BCGP18 Theorem 2.7.3 with its proof, §2.7, pp. 34–35: Attaches Galois representations to weight 0 cuspidal representations of GL_2 over any quadratic extension of a totally real field through GSp_4 over the totally real field, following Mok.

<a id="ap6-potential-automorphy"></a>
### AP.6/potential-automorphy — Theorem 9.3.1 (Theorem 1.1.3): every abelian surface over a totally real field is potentially automorphic

*Theorem.* Planet: *Potential automorphy of abelian surfaces*.

**Statement.** Let F be totally real and A/F an abelian surface. Then 𝓡\_A is potentially automorphic, and Conjecture 2.8.6 (meromorphic continuation and functional equation of Λ(H^i(A), s)) holds for A for each 0 ≤ i ≤ 4. In particular there is a finite Galois L/F such that 𝓡\_A|\_{G_L} is automorphic, and the L-function of H^1 over L is entire. Only challenging surfaces are shown potentially modular in the sense of Definition 9.1.8.

**Hypotheses.**
- F totally real; Arthur's classification for GSp_4 in its conditional form (ModularityAndLanglandsExtensions ML.0, ML.4).

**Construction or proof.**
- Since H^i = ∧^iH^1, ε(𝓡)ε(𝓡^∨) = N(𝓡) (Tate) and H^i^∨ = H^i(i), it suffices to treat i = 1, 2 and to prove (2.8.5).
- By Brauer induction (Taylor, Remarks on a conjecture of Fontaine and Mazur, Corollary 2.2; InductionRestriction layer 6 and PotentialModularityAndCompatibleSystems R24.5) it suffices to find a Galois totally real F'/F with 𝓡\_A|\_{G_{F''}} and ∧^2𝓡\_A|\_{G_{F''}} automorphic for every F'' ⊂ F' with Gal(F'/F'') solvable.
- Types D, F: potentially abelian (Johansson Prop. 11, Lemma 14). Types B[C_1], C, E ≠ E[D_n]: 𝓡\_A = 𝓡^1 ⊕ 𝓡^2, potentially automorphic by BLGGT Thm 5.4.1, descending along solvable extensions by BLGHT Lemma 1.3, and ∧^2𝓡\_A = det𝓡^1 ⊕ det𝓡^2 ⊕ (𝓡^1 ⊗ 𝓡^2) is automorphic by Ramakrishnan's Theorem M (ML.5).
- Types A, B[C_2], E[D_n]: Theorem 9.2.8, the proof of Proposition 9.2.1, Lemma 2.9.1, Theorem 2.9.3 and Lemma 8.3.2 make ρ\_{A,p}|\_{G_{F''}} irreducible, modular and automorphic; Henniart's refinement of Kim's exterior square transfer with Theorem 2.9.3 makes ∧^2ρ\_{A,p} automorphic.
- Remark 9.3.2: Kim–Henniart can be replaced by the degree 5 standard L-function of the GSp_4 form, but Theorem 2.9.3 remains essential.

**Acceptance.**
- Λ(A,s) = ∏\_iΛ(H^i(A),s)^{(−1)^i} has meromorphic continuation and the expected functional equation.
- For A of type A the automorphic Π over L is cuspidal on GL_4.

**Prerequisites.** [`AP.6/potential-modularity`](#ap6-potential-modularity), [`AP.6/non-challenging-automorphy`](#ap6-non-challenging-automorphy), [`AP.5/solvable-descent`](#ap5-solvable-descent), [`AP.0/automorphic-abelian-variety`](#ap0-automorphic-abelian-variety), [`AP.0/automorphic-compatible-system`](#ap0-automorphic-compatible-system), [`AP.6/galois-types`](#ap6-galois-types), `ModularityAndLanglandsExtensions:ML.2`, `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.5`, `PotentialModularityAndCompatibleSystems:R24.5`, Tau Ceti RepresentationTheory/InductionRestriction (layer 6), `PeriodsAndSpecialValues:PS.1`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

**Source.** BCGP18 Theorem 9.3.1, Remark 9.3.2 and the proof, §9.3, pp. 258–259; Theorem 1.1.3, §1.1, p. 4: Proves potential automorphy of the compatible system of every abelian surface over a totally real field and the meromorphic continuation and functional equation of its L-functions, through Brauer induction and the potential modularity of challenging surfaces.

<a id="ap6-hasse-weil-genus-two"></a>
### AP.6/hasse-weil-genus-two — Corollary 9.3.3 and Theorem 1.1.2: the Hasse–Weil conjecture for genus two curves and abelian surfaces

*Theorem.* Planet: *Hasse–Weil for genus two curves*.

**Statement.** Let C/F be a genus two curve over a totally real field, and Λ(C,s) = ∏\_{i=0}^{2}Λ\_i(C,s)^{(−1)^i} with Λ\_1(C,s) = Λ\_1(Jac(C),s). Then Λ(C,s) has meromorphic continuation to C and Λ(C,s) = εN^{−s}Λ(C, 2 − s) with ε ∈ R and N ∈ Q_{>0}. Consequently Conjecture 1.1.1 (Serre's form of the Hasse–Weil conjecture) holds for every genus two curve and every abelian surface over a totally real field (Theorem 1.1.2). Both versions of the paper print Λ(C, 3 − s); the symmetry of a curve's completed function is s ↦ 1 + dim C − s = 2 − s, while 3 − s belongs to Λ(Jac(C), s).

**Hypotheses.**
- F totally real; C smooth projective geometrically connected of genus 2 over F.

**Construction or proof.**
- Apply Theorem 9.3.1 to A = Jac(C) (JacobianChallenge layers D–F): H^1(C) = H^1(Jac C), so Λ\_1(C,s) continues with its functional equation s ↦ 2 − s.
- Λ\_0(C,s) is the completed Dedekind zeta function of F and Λ\_2(C,s) = Λ\_0(C,s−1); they are exchanged by s ↦ 2 − s.
- For abelian surfaces, Theorem 9.3.1 gives Conjecture 1.1.1 directly.

**Acceptance.**
- For C: y^2 = x^5 + 1 over Q the completed L-function of C is meromorphic with symmetry s ↦ 2 − s.
- No functional equation relates Λ(C,s) and Λ(C,3 − s).

**Prerequisites.** [`AP.6/potential-automorphy`](#ap6-potential-automorphy), `PeriodsAndSpecialValues:PS.1`, Tau Ceti JacobianChallenge (layer d), Tau Ceti JacobianChallenge (layer e), Tau Ceti JacobianChallenge (layer f), Tau Ceti AlgebraicCurves (layer 10).

**Source.** BCGP18 Corollary 9.3.3, §9.3, p. 259; Theorem 1.1.2 and Conjecture 1.1.1, §1.1, pp. 3–4: Deduces the meromorphic continuation and functional equation of the completed Hasse–Weil function of a genus two curve from Theorem 9.3.1 applied to its Jacobian, which with Theorem 9.3.1 gives the Hasse–Weil conjecture for genus two curves and abelian surfaces.

<a id="ap6-genus-one-quadratic"></a>
### AP.6/genus-one-quadratic — Theorem 9.3.4 (Theorem 1.1.4): genus one curves over quadratic extensions of totally real fields are potentially modular

*Theorem.* Planet: *Genus one curves over quadratic extensions*.

**Statement.** Let K/F be a quadratic extension of a totally real F, and E/K a genus one curve or an elliptic curve. Then E is potentially modular. If End_K(E) = Z, there are a Galois extension of totally real fields F'/F and a weight 0 cuspidal 𝛑 on GL_2(A_{KF'}) with trivial central character such that ρ\_{E,l}|\_{G_{KF'}} ≅ ρ\_{𝛑,l} for every l, with WD_v(ρ\_{E,l}|\_{G_{KF'\_v}})^{F-ss} ≅ rec(𝛑\_v ⊗ |det|\_v^{−1/2}) at every finite v; and Conjecture 2.8.6 holds for E. If End_K(E) ≠ Z, E has CM defined over K and ρ\_{E,l}|\_{G_K} is a sum of two characters of algebraic Hecke characters, so no cuspidal 𝛑 exists; E is potentially modular in the sense of the first sentence. The printed 'more precisely' clause is stated for every E and fails in the CM case (K = Q(i), y^2 = x^3 − x).

**Hypotheses.**
- F totally real; K/F quadratic of any signature.

**Construction or proof.**
- Replace E by its Jacobian. CM case: modular through Hecke characters (CM.4). If E is isogenous to a twist of E^σ, argue as in Proposition 9.2.1 (type E[D_n]).
- Otherwise A = Res_{K/F}E has type B[C_2] with 𝓡\_A = Ind_{G_K}^{G_F}𝓡\_E; Theorem 9.2.8 gives F'/F linearly disjoint from K/F and π on GSp_4(A_{F'}) with ρ\_{A,p}|\_{G_{F'}} ≅ ρ\_{π,p}.
- The transfer Π of π to GL_4(A_{F'}) satisfies Π ⊗ (κ∘Art∘det) ≅ Π for the quadratic character κ of K' = KF'/F', so Π is the automorphic induction of 𝛑 ⊗ |det| for a cuspidal 𝛑 on GL_2(A_{K'}) (Arthur–Clozel Chapter 3, Theorems 4.2 and 5.1; ML.5).
- Lemma 2.6.1 and a Frobenius-eigenvalue density argument show 𝛑 has weight 0 and trivial central character; Theorem 2.7.3 gives the local–global compatibility.

**Acceptance.**
- For F = Q(√2) and K = Q(2^{1/4}), of mixed signature, every elliptic curve over K is potentially modular.
- For K/F totally real the statement recovers Taylor's potential modularity; for K totally imaginary, that of the ten-author paper.

**Prerequisites.** [`AP.6/potential-modularity`](#ap6-potential-modularity), [`AP.6/gl2-quadratic-galois`](#ap6-gl2-quadratic-galois), [`AP.6/galois-types`](#ap6-galois-types), [`AP.6/non-challenging-automorphy`](#ap6-non-challenging-automorphy), `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensions:ML.4`, `AbelianSchemesAndArithmeticModuli:A6`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Source.** BCGP18 Theorem 9.3.4 and its proof, §9.3, pp. 259–260; Theorem 1.1.4, §1.1, p. 4: Proves potential modularity of genus one curves over quadratic extensions of totally real fields through the Weil restriction, a type B[C_2] abelian surface, and automorphic induction from GL_2 over the quadratic extension.

<a id="ap6-kummer-surfaces"></a>
### AP.6/kummer-surfaces — Proposition 9.4.1: the Hasse–Weil conjecture for Kummer surfaces

*Theorem.*

**Statement.** Let A be an abelian surface over a totally real F and X = Km(A) its Kummer surface (the minimal resolution of A/⟨−1⟩, a smooth projective K3 surface of geometric Picard number ≥ 17). Then Conjecture 1.1.1 holds for X. The same holds for any K3 surface over F with a Shioda–Inose structure over F. (Definition 9.4.2 and the rest of §9.4 — F-abelian varieties, K3 surfaces of Picard rank ≥ 17, Nori's fake Kummer surfaces — are discussion without further theorems.)

**Hypotheses.**
- F totally real; A an abelian surface over F.

**Construction or proof.**
- H^\*(X, Q_p) vanishes in odd degrees; in even degrees it is generated by the image of H^\*(A, Q_p)^{±1} (all of H^0, H^2, H^4 of A) and the 16 classes of the exceptional divisors over the 2-torsion points, a twist of an Artin representation (the permutation representation on A[2]). The cohomology of the Kummer construction is recorded as a gap (no atlas layer plans Kummer or K3 surfaces).
- Theorem 9.3.1 handles the part from A, and the meromorphic continuation and functional equation of Artin L-functions (Brauer induction; AnalyticNumberTheory AN.4) the exceptional part.

**Acceptance.**
- H^2(Km(A)) has dimension 22 = 6 + 16.
- The exceptional classes contribute an Artin L-function up to a Tate twist.

**Prerequisites.** [`AP.6/potential-automorphy`](#ap6-potential-automorphy), `AnalyticNumberTheory:AN.4`, Tau Ceti RepresentationTheory/InductionRestriction (layer 6), `PeriodsAndSpecialValues:PS.1`.

**Source.** BCGP18 Proposition 9.4.1, Definition 9.4.2 and §9.4, pp. 260–264: Deduces the Hasse–Weil conjecture for Kummer surfaces of abelian surfaces from Theorem 9.3.1 and Artin L-functions, and discusses further K3 surfaces.

## AP.7. Modularity, fixed 3-torsion and the paramodular conjecture

Proposition 10.1.1 = Theorem 1.1.7 (modularity of ordinary abelian surfaces with residually modular, vast and tidy mod p representation) and Proposition 10.1.3 (three residually modular cases), both with 'unramified' deleted; Lemmas 7.5.25–7.5.27 (crossing with dihedral extensions) and Theorem 10.1.4 (elliptic curves over quadratic extensions via mod 5); the Burkhardt quartic, the odd-theta cover P and the rationality of its twists P(ρ̄) (Definition 10.2.2, Proposition 10.2.3, Lemma 10.2.4); the local seed curves at 3 (Lemmas 9.3.6–9.3.7 of the 2025 paper); Theorem 10.2.1 (abelian surfaces with fixed 3-torsion, ordinary clause corrected); Theorem 10.2.6 = Theorem 1.1.5 (infinitely many modular abelian surfaces with End_C = Z); Lemma 10.3.1 (the paramodular conjecture for ordinary surfaces), the original and modified paramodular conjectures (Conjecture 10.4.3), Lemma 10.3.2 (conditional), and the examples of §10.4.

<a id="ap7-ordinary-surface-modularity"></a>
### AP.7/ordinary-surface-modularity — Proposition 10.1.1 (Theorem 1.1.7): modularity of ordinary abelian surfaces

*Theorem.* Planet: *Modularity of ordinary abelian surfaces*.

**Statement.** Let F be totally real with p > 2 splitting completely, and A/F an abelian surface with good ordinary reduction at every v | p whose unit root crystalline eigenvalues at each v | p are distinct mod p. Assume A has a polarization of degree prime to p, that ρ̄\_{A,p}: G_F → GSp_4(F_p) (the dual of A[p]) is vast and tidy, and that ρ̄\_{A,p} is ordinarily modular: some π of parallel weight 2 and central character |·|^2, ordinary at every v | p, has ρ̄\_{π,p} ≅ ρ̄\_{A,p} and ρ\_{π,p}|\_{G_{F_v}} pure for all finite v. Then A is modular: some ordinary π' of parallel weight 2 and central character |·|^2 has ρ\_{π',p} ≅ ρ\_{A,p}. The printed 'unramified and ordinary' is corrected to 'ordinary'. (Remark 10.1.2: without a polarization of degree prime to p, ρ̄\_{A,p} is reducible, but need not land in any conjugate of GSp_4(F_p).)

**Hypotheses.**
- As stated; F totally real, p > 2 totally split.

**Construction or proof.**
- The polarization of degree prime to p puts ρ\_{A,p} in GSp_4(Z_p) with multiplier ε^{−1} (AP.0); Proposition 2.8.1 (R11.5) gives purity at every finite place and finiteness of ramification.
- Good ordinary reduction with distinct unit roots mod p gives p-distinguished weight 2 ordinarity at v | p: the connected–étale sequence of the p-divisible group (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 via AbelianSchemesAndArithmeticModuli A4) gives the filtration, D_cris and the crystalline comparison (PadicHodgeTheory R06.2, CohomologyComparisons CP.2) give the unit roots, and Katz–Messing identifies them with the l-adic Frobenius data (requested at A4).
- Theorem 8.4.1 applies.

**Acceptance.**
- The conclusion is modularity in the sense of Definition 9.1.8.
- It is the input of Theorem 10.2.6 and Lemma 10.3.1.

**Prerequisites.** [`AP.5/main-lifting-theorem`](#ap5-main-lifting-theorem), [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `NeronModelsAndSemistableAbelianVarieties:R11.5`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PadicHodgeTheory:R06.2`, `CohomologyComparisons:CP.2`, [`AP.0/modular-gsp4-representation`](#ap0-modular-gsp4-representation).

**Source.** BCGP18 Proposition 10.1.1 and Remark 10.1.2, §10.1, pp. 264–265; Theorem 1.1.7, §1.1, p. 5: States and proves the modularity of an ordinary abelian surface with distinct unit roots, a polarization of degree prime to p, vast and tidy and ordinarily modular residual representation, as an immediate consequence of Theorem 8.4.1.

<a id="ap7-residual-modularity-cases"></a>
### AP.7/residual-modularity-cases — Proposition 10.1.3: three cases in which ρ̄\_p is ordinarily modular

*Theorem.*

**Statement.** Let F be totally real with p > 2 splitting completely and ρ̄\_p: G_F → GSp_4(F_p) absolutely irreducible with multiplier ε^{−1}, vast and tidy and p-distinguished weight 2 ordinary. Suppose (1) p = 3 and ρ̄\_3 is induced from a 2-dimensional representation with inverse cyclotomic determinant over a totally real quadratic E/F in which 3 is unramified; or (2) p = 5 and ρ̄\_5 is induced in the same way from a GL_2(F_5)-valued representation, 5 unramified in E; or (3) ρ̄\_p is induced from a character of a quartic CM extension H/F in which p splits completely. Then ρ̄\_p is ordinarily modular: some π of parallel weight 2 and central character |·|^2, ordinary above p, has ρ̄\_{π,p} ≅ ρ̄\_p and ρ\_{π,p} pure at all finite places. The printed 'unramified and ordinary' is corrected to 'ordinary': in the très ramifiée cases the constructed π is of Steinberg type above p. Consequently in these cases the residual modularity hypothesis of Theorem 1.1.7 can be dropped.

**Hypotheses.**
- As stated.

**Construction or proof.**
- Cases (1)–(2): ρ̄ = Ind_{G_E}^{G_F}ϱ̄ with ϱ̄|\_{G_{E(ζ\_p)}} absolutely irreducible and ϱ̄ on inertia above p an extension of ε^{−1} by 1. Once ϱ̄ is modular, Barnet-Lamb–Gee–Geraghty (2013, Theorem A; OrdinaryAutomorphicFormsAndModularityLifting R21.2) gives an ordinary Hilbert form of parallel weight 2 and trivial character, π is its automorphic induction from E to F (Roberts' theta lift, GSp_4 Part II), and purity comes from Blasius and Caraiani (AutomorphicGaloisRepresentations R19.3–R19.5).
- ϱ̄ is modular: by Langlands–Tunnell with Tate's lifting when its projective image is solvable (GL2AutomorphicRepresentationsAndTransfer R17.4–R17.5); by the odd Artin conjecture over totally real fields (Pilloni–Stroh) for p = 3 and projective image A_5; for surjective GL_2(F_5)-valued ϱ̄ by Khare–Wintenberger lifts, Kisin's lifting and Pilloni–Stroh (ModularityAndLanglandsExtensions ML.1).
- Case (3): ρ̄ = Ind_{G_H}^{G_F}χ; take an algebraic Grössencharacter ψ of H of conductor prime to p with ψ\_p ≡ χ (CM.4) and induce automorphically to GL_2 over the real quadratic E ⊂ H, then to F.

**Acceptance.**
- With Proposition 10.1.1 it gives modularity of ordinary surfaces whose mod 3 representation is induced from a real quadratic field.
- Case (3) covers mod p representations of CM type.

**Prerequisites.** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `ModularityAndLanglandsExtensions:ML.1`, `ModularityAndLanglandsExtensions:ML.5`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.5`, `ArithmeticGaloisRepresentations:G7`, `ComplexMultiplicationAndExplicitReciprocity:CM.4`.

**Source.** BCGP18 Proposition 10.1.3 and its proof, §10.1, pp. 265–267; §1.1 after Theorem 1.1.7, p. 6: Establishes ordinary residual modularity for mod 3 and mod 5 representations induced from GL_2 over a real quadratic extension and for representations induced from characters of quartic CM fields, through automorphic induction and known rank 2 results.

<a id="ap7-dihedral-crossing"></a>
### AP.7/dihedral-crossing — Lemmas 7.5.25–7.5.27: crossing with dihedral extensions

*Theorem.*

**Statement.** Let F be totally real with p split completely and K/F quadratic with p unramified. (7.5.25) There is a Galois H/F ⊃ K with D = Gal(H/F) dihedral of order 8, Gal(H/K) ≅ (Z/2)^2, H the Galois closure of a quadratic M/K, H/F unramified above p with ⟨Frob_v⟩ not central in D, and H/F linearly disjoint from any given extension disjoint from K/F. (7.5.26) For r̄: G_F → GL_2(F̄\_p) absolutely irreducible with det r̄ = ε̄^{−1} and r̄|\_{G_{F_v}} an extension of ε̄^{−1}χ\_v^{−1} by an unramified χ\_v at each v | p, K linearly disjoint from F(r̄), H as in 7.5.25 disjoint from F(r̄), and ρ̄ := Ind_{G_K}^{G_F}(r̄|\_{G_K} ⊗ δ\_{M/K}): ρ̄ is p-distinguished weight 2 ordinary with multiplier ε̄^{−1}, ρ̄ ≅ V ⊗ U (V from r̄, U the faithful 2-dimensional representation of D) is absolutely irreducible, and ρ̄(G_F) = (Γ × D)/⟨(−1, [a,b])⟩ or Γ × D according as Γ = r̄(G_F) has a central element of order 2. (7.5.27) For p ≥ 5 with Γ = GL_2(F_p), or p = 5 and Γ the preimage of S_4 ⊂ S_5 ≅ PGL_2(F_5), G ∩ Sp_4(F_p) is enormous (weakly enormous if Γ = GL_2(F_5)), and ρ̄ is vast and tidy.

**Hypotheses.**
- p unramified in K; the proof of 7.5.27 prints 'E' where F is meant.

**Construction or proof.**
- 7.5.25: with K = F(√α), take β = x^2 − αy^2 a unit and non-residue at every v | p and H = F(√α, √β, √(x + y√α)); embedding problems with local conditions (InverseGaloisAndArithmeticFundamentalGroups IG.4).
- 7.5.26: compute the induced representation as a tensor product with the dihedral representation; the local shape at v | p follows from the non-centrality of Frob_v.
- 7.5.27: the big-image criteria for subgroups of GSp_4 (Lemmas 7.5.18–7.5.19, ArithmeticGaloisRepresentations G7).

**Acceptance.**
- Used only for Theorem 10.1.4.
- For Γ = GL_2(F_5) the intersection with Sp_4 is weakly enormous but not enormous.

**Prerequisites.** `InverseGaloisAndArithmeticFundamentalGroups:IG.4`, `ArithmeticGaloisRepresentations:G7`.

**Source.** BCGP18 §7.5.24 and Lemmas 7.5.25–7.5.27, pp. 205–208: Constructs dihedral octic extensions with local conditions above p and shows that crossing a mod p GL_2-representation with them gives vast, tidy, p-distinguished weight 2 ordinary GSp_4-representations.

<a id="ap7-mod-five-quadratic"></a>
### AP.7/mod-five-quadratic — Theorem 10.1.4: modularity of elliptic curves over quadratic extensions via mod 5

*Theorem.* Planet: *Elliptic curves over quadratic fields via mod 5*.

**Statement.** Let F be totally real with 5 split completely, K/F quadratic with 5 unramified, and E/K an elliptic curve with good ordinary or semistable ordinary reduction at every w | 5. Suppose (1) the projective image of ϱ̄\_{E,5} is S_5 = PGL_2(F_5) or S_4, and (2) some r̄\_5: G_F → GL_2(F_5) with det r̄\_5 = ε̄^{−1} has r̄\_5|\_{G_K} ≅ ϱ̄\_{E,5}. Then E is modular. In particular there are infinitely many modular elliptic curves over K, up to twist, without CM and not coming from a subfield of K; for example F = Q(√d), d ≡ 1, 4 mod 5, K = Q(d^{1/4}), a field of mixed signature.

**Hypotheses.**
- As stated.

**Construction or proof.**
- Lemma 7.5.26 applied to r̄\_5 gives ρ̄ = Ind_{G_K}^{G_F}(ϱ̄\_{E,5} ⊗ δ\_{M/K}), vast, tidy and 5-distinguished weight 2 ordinary (Lemma 7.5.27).
- As in Proposition 10.1.3, r̄\_5 comes from an ordinary Hilbert form over F; its base change to K (GL2AutomorphicRepresentationsAndTransfer R17.4), twisted by δ\_{M/K} and induced back to F, gives π of parallel weight 2 and central character |·|^2, ordinary above 5, with ρ̄\_{π,5} ≅ ρ̄ and ρ\_{π,5} pure.
- Theorem 8.4.1 makes Ind_{G_K}^{G_F}(ϱ\_{E,5} ⊗ δ\_{M/K}) modular, and the argument of Theorem 9.3.4 makes ϱ\_{E,5} ⊗ δ\_{M/K}, hence E, modular.

**Acceptance.**
- The examples are not CM because their mod 5 representations are not projectively dihedral or cyclic.
- The fields K need not be totally real or CM.

**Prerequisites.** [`AP.7/dihedral-crossing`](#ap7-dihedral-crossing), [`AP.7/residual-modularity-cases`](#ap7-residual-modularity-cases), [`AP.5/main-lifting-theorem`](#ap5-main-lifting-theorem), [`AP.6/genus-one-quadratic`](#ap6-genus-one-quadratic), `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Source.** BCGP18 Theorem 10.1.4 and its proof, §10.1, pp. 267–268: Proves modularity of elliptic curves over quadratic extensions of totally real fields whose mod 5 representation extends to the base, by inducing a dihedral twist to GSp_4 and applying the main lifting theorem.

<a id="ap7-odd-theta-cover"></a>
### AP.7/odd-theta-cover — The Burkhardt quartic, the odd-theta cover P and its twists P(ρ̄)

*Construction.* Planet: *Odd-theta cover of the Burkhardt quartic*.

**Statement.** B := 𝒜\_2(3), the moduli of principally polarized abelian surfaces with full level 3 structure; over C it is the complement of the Hessian in the Burkhardt quartic, it is rational over Q (Bruin–Nasserden), and PSp_4(F_3) acts on it. B(2) := 𝒜\_2(6) → B is Galois with group S_6 ≅ PSp_4(F_2) = Sp_4(F_2), the identification fixed by the action on the six Weierstrass points of C with Jac(C) = A. P is the intermediate degree 6 cover for the point stabilizers S_5 ⊂ S_6, equivalently the moduli 𝒜\_2(3)^− of principally polarized surfaces with a symmetric odd theta structure of level 3; a rational point of P in the image of the Torelli map is a Jacobian with a marked rational Weierstrass point, i.e. of a curve y^2 = f(x) with f quintic. The PSp_4(F_3)-action on P over Q(√−3) descends to Q for the étale group G of symplectic automorphisms of μ\_3^2 × (Z/3)^2 modulo ±1. For ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}, P(ρ̄) → B(ρ̄) is the twist by ρ̄ (B(ρ̄) the twisted moduli of AP.6 with n = 3). Proposition 10.2.3: there is a G-equivariant birational map P → P^3 over Q (the odd theta map of Dolgachev–Lehavi, birational by Bolognesi). Lemma 10.2.4: P(ρ̄) is rational over F.

**Hypotheses.**
- ρ̄ has multiplier ε̄^{−1}; F a number field.

**Construction or proof.**
- S_6 ≅ Sp_4(F_2): for a genus two curve with Weierstrass points r_1, …, r_6, the fifteen differences r_i − r_j are the nonzero points of A[2], and the Weil pairing of r_i − r_j and r_k − r_l is the parity of #({i,j} ∩ {k,l}) (BCGP25 §8.1.1); the identification is fixed with the point stabilizer S_5(b), distinct from the transitive S_5(a).
- Proposition 10.2.3 reduces rationality of P(ρ̄) to that of the twist P^3(ρ̄) of P^3 by the class σ ↦ θ(ρ̄^∨(σ)·diag(ε^{−1}(σ), ε^{−1}(σ), 1, 1)) in H^1(F, PGL_4(Q̄)), θ induced by the action of Sp_4(F_3) on μ\_3^2 × (Z/3)^2.
- Lemma 10.2.4: PSp_4(F_3) is perfect with Schur multiplier of order 2, so its Schur cover is Sp_4(F_3) and θ: PSp_4(F_3) → PGL_4(Q̄) lifts to θ̃: Sp_4(F_3) → GL_4(Q̄) (TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff with the Schur multiplier, InductionRestriction layer 7); the lift is unique because Sp_4(F_3) is perfect and commutators in GL_n depend only on images in PGL_n. So the class comes from H^1(F, GL_4(Q̄)) = 0 (Hilbert 90) and P^3(ρ̄) ≅ P^3.
- Remark 10.2.5: the same argument with PSL_2(F_5) and SL_2(F_5) reproves Shepherd-Barron–Taylor Lemma 1.1.

**Uses.**
- BCGP18, Theorem 10.2.1: rationality of P(ρ̄) gives infinitely many surfaces with fixed 3-torsion.
- BCGP18, Theorem 10.2.6: modular surfaces over totally real fields where 3 splits.
- BCGP25, §9.2.1: AbelianSurfacesModularity imports P(ρ̄) and the marked-Weierstrass locus from here.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.burkhardt` | data | B = 𝒜\_2(3) over Q with its PSp_4(F_3)-action descended to the étale group G. |
| `TauCeti.AbelianSurfaces.levelTwoCover` | data | B(2) = 𝒜\_2(6) → B, Galois with group S_6 ≅ Sp_4(F_2). |
| `TauCeti.AbelianSurfaces.oddThetaCover` | data | P = 𝒜\_2(3)^− → B, the degree 6 cover for the point stabilizer S_5(b). |
| `TauCeti.AbelianSurfaces.oddThetaCover_degree` | simp | deg(P → B) = [S_6 : S_5] = 6. |
| `TauCeti.AbelianSurfaces.sixWeierstrass_equiv` | equivalence | S_6 ≅ Sp_4(F_2) through the action on Weierstrass points, with r_i − r_j ↦ A[2] ∖ {0} and Weil pairing the parity of the intersection of index pairs. |
| `TauCeti.AbelianSurfaces.oddThetaTwist` | constructor | P(ρ̄) → B(ρ̄), the twist of P → B by ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}. |
| `TauCeti.AbelianSurfaces.oddTheta_birational` | characterisation | A G-equivariant birational map P → P^3 over Q (Proposition 10.2.3). |
| `TauCeti.AbelianSurfaces.oddThetaTwist_rational` | relation | P(ρ̄) is rational over F (Lemma 10.2.4). |
| `TauCeti.AbelianSurfaces.oddThetaTwist_jacobians` | other | F-points of P(ρ̄) in the Torelli image are Jacobians of y^2 = f(x) with f quintic, with A[3] ≅ V(ρ̄)^∨. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.sp4F2_card` | computation | ∣Sp_4(F_2)∣ = 2^4·(2^2 − 1)·(2^4 − 1) = 720 = ∣S_6∣. |
| `TauCeti.AbelianSurfaces.psp4F3_card` | computation | ∣Sp_4(F_3)∣ = 3^4·(3^2 − 1)·(3^4 − 1) = 51840 and ∣PSp_4(F_3)∣ = 25920. |
| `TauCeti.AbelianSurfaces.schur_psp4F3` | compatibility | TauCeti.schurMultiplier ℂ (PSp_4(F_3)) has order 2, and the corresponding central extension is Sp_4(F_3) → PSp_4(F_3). |
| `TauCeti.AbelianSurfaces.weierstrass_pairs` | characterisation | The 15 = C(6,2) unordered pairs {i,j} ⊂ {1,…,6} correspond to the 15 nonzero points of A[2]; two of them pair to 1 under the Weil pairing iff the pairs meet in exactly one index. |
| `TauCeti.AbelianSurfaces.transitive_S5_not_P` | non-example | The cover of B for a transitive S_5 ⊂ S_6 (image of the outer automorphism) is also of degree 6 but is not P: its rational points do not correspond to rational Weierstrass points. |

**Acceptance.**
- P(ρ̄) is rational over F for every ρ̄ with multiplier ε̄^{−1}.
- P → B has degree 6.

**Prerequisites.** [`AP.6/twisted-siegel-moduli`](#ap6-twisted-siegel-moduli), `PELModuli:M5`, `PELModuli:M6`, `tauceti:TauCeti.schurMultiplier`, `tauceti:TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`, Tau Ceti RepresentationTheory/InductionRestriction (layer 7), Tau Ceti JacobianChallenge (layer d), Tau Ceti JacobianChallenge (layer e), Tau Ceti AlgebraicCurves (layer 10), `mathlib:Equiv.Perm`, `mathlib:Matrix.symplecticGroup`.

**Source.** BCGP18 §10.2: Definition 10.2.2, Proposition 10.2.3, Lemma 10.2.4 and Remark 10.2.5, pp. 268–271: Defines the degree 6 odd-theta cover P of the level 3 Siegel moduli space, proves it equivariantly rational through the odd theta map, and deduces the rationality of its twists by mod 3 representations with inverse cyclotomic multiplier from the Schur multiplier of PSp_4(F_3).; BCGP25 §8.1 and §9.2.1, pp. 180–183 and 192: Fixes the identification S_6 ≅ Sp_4(F_2) through Weierstrass points and defines the twisted odd-theta moduli and the marked-Weierstrass Jacobian locus.

<a id="ap7-local-three-seeds"></a>
### AP.7/local-three-seeds — Lemmas 9.3.6–9.3.7 of BCGP25: local realization at 3 by genus two curves with a rational Weierstrass point

*Theorem.*

**Statement.** Work over Q_3 with ρ̄: G_{Q_3} → GSp_4(F_3) of multiplier ε̄^{−1}, ordinary (an extension of an unramified rank 2 quotient V̄ by its Cartier dual) with finite flat dual. (9.3.6) If an ordinary principally polarized abelian surface A_0/F_3 has A_0[3]^{ét} ≅ V̄ and mod 2 image in S_5(b), there is a genus two X/Q_3 with a rational Weierstrass point, Jac(X) good ordinary and residual H^1-representation ρ̄; if A_0 is 3-distinguished so is Jac(X). (9.3.7) Every such ρ̄ arises in this way from a good ordinary 3-distinguished Jacobian whose curve has a Q_3-rational Weierstrass point. The seeds: for the nonscalar conjugacy classes of V̄, four explicit quintic curves over F_3 and their unramified quadratic twists; for scalar Frobenius −1 on V̄, the product of elliptic curves over F_3 of traces −1 and 2 (quartic (X^2 + X + 3)(X^2 − 2X + 3), mod 2 permutation of order 6 in S_5(b)), and for +1 its unramified quadratic twist (traces 1 and −2).

**Hypotheses.**
- p = 3; ρ̄ ordinary with finite flat dual (it then comes from a finite flat group scheme over Z_3, unique by Raynaud since e = 1 < p − 1).

**Construction or proof.**
- Polarized lifting (BCGP25 Lemma 9.3.4, rank of the group 3^4, via truncated Barsotti–Tate lifting and Serre–Tate) and Jacobian lifting (Lemma 9.3.5, Torelli tangent isomorphism in genus two) are imported from AbelianSchemesAndArithmeticModuli A1–A5.
- 9.3.6: lift A_0 with its 3-torsion group scheme to a principally polarized A/Z_3 with A[3] ≅ the finite flat model of ρ̄^∨ (unique by Raynaud, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1); A is a Jacobian of a smooth genus two curve; the mod 2 image condition and local constancy of torsion give the rational Weierstrass point.
- 9.3.7: run through the conjugacy classes of V̄; certify each seed by its étale 3-torsion, not only by its Frobenius quartic.

**Acceptance.**
- The scalar seed's unit roots are distinct, so the Jacobian is 3-distinguished.
- The lemma supplies the ordinary local points at v | 3 that Theorems 10.2.1 and 10.2.6 need when F_v = Q_3.

**Prerequisites.** `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A5`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, [`AP.7/odd-theta-cover`](#ap7-odd-theta-cover), Tau Ceti JacobianChallenge (layer d), Tau Ceti AlgebraicCurves (layer 10), Tau Ceti EllipticCurves (layer 3).

**Source.** BCGP25 Lemmas 9.3.4–9.3.7 with the seed curves and Remark 9.4.4, §9.3–§9.4, pp. 200–206: Lifts ordinary polarized surfaces over F_3 with given 3-torsion to Jacobians over Q_3 with a rational Weierstrass point, and lists seed curves realizing every ordinary mod 3 local representation with finite flat dual.

<a id="ap7-fixed-three-torsion"></a>
### AP.7/fixed-three-torsion — Theorem 10.2.1 (corrected): abelian surfaces with fixed 3-torsion

*Theorem.* Planet: *Abelian surfaces with fixed 3-torsion*.

**Statement.** Let F be a number field and ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}, V(ρ̄) its symplectic space. Then B(ρ̄) is unirational over F, and there are infinitely many principally polarized abelian surfaces A/F, up to twist, with End_C(A) = Z and ı\_3: A[3] ≅ V(ρ̄)^∨; they may be taken to be Jacobians of curves y^2 = f(x) with f quintic. If moreover, for every v | 3, P(ρ̄)(F_v) contains a point of an ordinary principally polarized surface (A[3] ≅ V(ρ̄)^∨ with an F_v-rational odd theta characteristic), the A may also be taken with good ordinary reduction at every v | 3. When F_v = Q_3 this local hypothesis follows from the printed one (ρ̄|\_{G_{F_v}} is the 3-torsion of an abelian surface over F_v with good ordinary reduction) by Lemma 9.3.7 of BCGP25; for other F_v the printed form is unproved, since the printed proof takes ordinary points of B(ρ̄)(F_v), whose image need not meet the open and closed image of P(ρ̄)(F_v).

**Hypotheses.**
- F a number field; for the ordinary clause, the stated local hypothesis at every v | 3.

**Construction or proof.**
- P(ρ̄) is rational (Lemma 10.2.4), so B(ρ̄) is unirational.
- Let R(ρ̄) = P(ρ̄) ×\_{𝒜\_2} 𝒜\_2(5) → P(ρ̄), Galois with group PSp_4(F_5); Hilbert irreducibility (InverseGaloisAndArithmeticFundamentalGroups IG.2) gives infinitely many x ∈ P(ρ̄)(F), in any prescribed nonempty v-adic open sets for finitely many v, whose fibre has Galois group containing PSp_4(F_5); then ρ̄\_{A,5}(G_F) ⊇ Sp_4(F_5), which stays absolutely irreducible on every index 2 subgroup, so by the Galois-type classification End_C(A) = Z.
- Ordinary clause: the good ordinary locus is open in P(ρ̄)(F_v) and nonempty by hypothesis (by Lemma 9.3.7 of BCGP25 when F_v = Q_3).

**Acceptance.**
- Over Q every such ρ̄ is realized by infinitely many genus two Jacobians y^2 = quintic.
- Only the local requirement at 3 is needed beyond the multiplier condition.

**Prerequisites.** [`AP.7/odd-theta-cover`](#ap7-odd-theta-cover), [`AP.7/local-three-seeds`](#ap7-local-three-seeds), [`AP.6/twisted-siegel-moduli`](#ap6-twisted-siegel-moduli), [`AP.6/galois-types`](#ap6-galois-types), `InverseGaloisAndArithmeticFundamentalGroups:IG.2`.

**Source.** BCGP18 Theorem 10.2.1 and its proof, §10.2, pp. 269–271: Shows that every mod 3 symplectic representation with inverse cyclotomic multiplier is the 3-torsion of infinitely many principally polarized abelian surfaces with trivial geometric endomorphisms, by rationality of the odd-theta cover and Hilbert irreducibility.

<a id="ap7-infinitely-many-modular"></a>
### AP.7/infinitely-many-modular — Theorem 10.2.6 (Theorem 1.1.5): infinitely many modular abelian surfaces with trivial endomorphisms

*Theorem.* Planet: *Infinitely many modular abelian surfaces*.

**Statement.** Let F be totally real with 3 split completely. There are infinitely many abelian surfaces A/F up to twist with End_C(A) = Z which are modular and do not come from any proper subfield of F: for every p, no twist of ρ\_{A,p} extends to the absolute Galois group of a proper subfield. For F = Q this is Theorem 1.1.5; the L-function of H^1(A) is then entire, which potential automorphy alone does not give.

**Hypotheses.**
- F totally real, 3 totally split in F.

**Construction or proof.**
- Choose a mod 3 representation ρ̄ induced from a totally real quadratic H/F (for example F(√2); the proof's H must be totally real) satisfying case (1) of Proposition 10.1.3, vast and tidy, with multiplier ε̄^{−1}, not extending (up to twist) to a proper subfield.
- Each F_v = Q_3, and ρ̄|\_{G_{F_v}} is ordinary with finite flat dual; Lemma 9.3.7 of BCGP25 gives ordinary points of P(ρ̄)(F_v) (Res_{H_v/F_v}(E) is not used: it has no rational odd theta characteristic).
- Theorem 10.2.1 gives infinitely many A with A[3] ≅ V(ρ̄)^∨ (printed: A[3] ≅ ρ̄), End_C(A) = Z and good ordinary reduction above 3; Proposition 10.1.3 makes ρ̄ ordinarily modular and Proposition 10.1.1 makes every such A modular.

**Acceptance.**
- Over Q there are infinitely many modular A with End_C A = Z up to twist.
- Their L-functions of H^1 are entire.

**Prerequisites.** [`AP.7/fixed-three-torsion`](#ap7-fixed-three-torsion), [`AP.7/residual-modularity-cases`](#ap7-residual-modularity-cases), [`AP.7/ordinary-surface-modularity`](#ap7-ordinary-surface-modularity), [`AP.7/local-three-seeds`](#ap7-local-three-seeds), `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `mathlib:NumberField.IsTotallyReal`.

**Source.** BCGP18 Theorem 10.2.6 and its proof, §10.2, pp. 271–272; Theorem 1.1.5, §1.1, p. 4: Produces infinitely many modular abelian surfaces with trivial geometric endomorphisms over totally real fields in which 3 splits, combining fixed 3-torsion families, residual modularity of induced mod 3 representations and the ordinary lifting theorem.

<a id="ap7-paramodular-lemma"></a>
### AP.7/paramodular-lemma — Lemma 10.3.1: the paramodular conjecture for ordinary surfaces

*Theorem.* Planet: *Paramodular conjecture for ordinary surfaces*.

**Statement.** Every abelian surface A/Q satisfying the hypotheses of Proposition 10.1.1 satisfies the paramodular conjecture: there is a holomorphic cuspidal Siegel newform of weight (2,2) and paramodular level equal to the conductor of A, not a Gritsenko lift, with rational Hecke eigenvalues, unique up to scalars, whose spin L-function is L(A,s).

**Hypotheses.**
- F = Q; the hypotheses of Proposition 10.1.1 at some p.

**Construction or proof.**
- Theorem 8.4.1, as applied in Proposition 10.1.1, gives a general-type L-packet of weight 2 cuspidal representations with ρ\_{π,p} ≅ ρ\_{A,p} and full local–global compatibility.
- Twist by |·|; by Schmidt's theorem the paramodular member of each local packet is the generic one; by Roberts–Schmidt Theorems 7.5.1 and 7.5.4(iii) and Gan–Takeda, the paramodular vectors at minimal level form a one-dimensional space and that level is the conductor of the L-parameter (local newform theory, GSp_4 Part II).
- General type excludes Gritsenko lifts; rationality of the eigenvalues follows from that of the Frobenius traces of A.

**Acceptance.**
- The newform has level exactly the conductor N_A.
- It is unique up to scalars.

**Prerequisites.** [`AP.7/ordinary-surface-modularity`](#ap7-ordinary-surface-modularity), [`AP.7/paramodular-conjecture`](#ap7-paramodular-conjecture), `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensions:ML.4`.

**Source.** BCGP18 §10.3 and Lemma 10.3.1 with its proof, pp. 272–273: Deduces the paramodular conjecture of Brumer–Kramer for abelian surfaces over Q satisfying the hypotheses of Proposition 10.1.1 from the modularity theorem and local paramodular newform theory.

<a id="ap7-paramodular-conjecture"></a>
### AP.7/paramodular-conjecture — The paramodular conjecture and its modification (Brumer–Kramer)

*Definition.*

**Statement.** For N ≥ 1 let 𝒜\_N be the set of isogeny classes of abelian surfaces A/Q with End_Q A = Z and conductor N, 𝓑\_N the set of isogeny classes of fake abelian surfaces (abelian fourfolds B/Q with End_Q B an order in a non-split quaternion algebra D/Q) of conductor N^2, and 𝓟\_N the set of holomorphic weight 2 paramodular newforms f of level N, up to scaling, with rational Hecke eigenvalues and orthogonal to the Gritsenko lifts. The original paramodular conjecture asserts a bijection 𝒜\_N ↔ 𝓟\_N matching L(A,s) = L(f,s,spin). The modified conjecture (Conjecture 10.4.3) asserts a bijection 𝒜\_N ⊔ 𝓑\_N ↔ 𝓟\_N with L(C,s) = L(f,s,spin) for C ∈ 𝒜\_N and L(C,s) = L(f,s,spin)^2 for C ∈ 𝓑\_N. Both are statements (propositions), not theorems of this roadmap.

**Hypotheses.**
- N ≥ 1; paramodular forms of level N for the paramodular group K(N) ⊂ GSp_4(Q); the spin L-function of a Hecke eigenform.

**Construction or proof.**
- Define the three sets from the abelian-variety and Siegel-modular-form carriers and state the two bijection properties.
- Record the relations: Lemma 10.3.1 proves the matching for every A satisfying Proposition 10.1.1; Lemma 10.3.2 and §10.4 show, conditionally, that fake abelian surfaces contribute forms, so the original formulation must be modified.

**Uses.**
- BCGP18, Lemma 10.3.1: proves instances of the conjecture.
- BCGP18, Lemma 10.3.2 and §10.4: explain why fake abelian surfaces force the modification.
- BCGP25 (AbelianSurfacesModularity): the 2025 paper's paramodular results are stated against this conjecture.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.ParamodularConjecture` | data | For every N, a bijection 𝒜\_N ≅ 𝓟\_N with L(A,s) = L(f,s,spin). |
| `TauCeti.AbelianSurfaces.ModifiedParamodularConjecture` | data | For every N, a bijection 𝒜\_N ⊔ 𝓑\_N ≅ 𝓟\_N with L(C,s) = L(f,s,spin)^{m(C)}, m = 1 on 𝒜\_N and 2 on 𝓑\_N. |
| `TauCeti.AbelianSurfaces.paramodular_instance` | other | If A satisfies Proposition 10.1.1 over Q, there is f ∈ 𝓟\_{N_A} with L(A,s) = L(f,s,spin), unique up to scaling (Lemma 10.3.1). |
| `TauCeti.AbelianSurfaces.modified_of_noFake` | relation | If 𝓑\_N = ∅, the modified statement at N is the original one at N. |
| `TauCeti.AbelianSurfaces.matching_unique` | characterisation | The L-function matching determines the bijection: by strong multiplicity one f is determined by its spin L-function and A up to isogeny by L(A,s) (Faltings). |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.AbelianSurfaces.fake_surface_counterexample` | non-example | A fake abelian surface B/Q of conductor N^2 with an associated f ∈ 𝓟\_N (L(B,s) = L(f,s,spin)^2) is not in 𝒜\_N; the original bijection 𝒜\_N ↔ 𝓟\_N then fails at N, while the modified one accounts for it (Lemma 10.3.2 and §10.4, conditionally). |
| `TauCeti.AbelianSurfaces.instance_ordinary` | compatibility | For A/Q satisfying Proposition 10.1.1 with conductor N, the element of 𝓟\_N produced by Lemma 10.3.1 is the image of A under the conjectured bijection. |
| `TauCeti.AbelianSurfaces.no_fake_reduces` | degenerate | If 𝓑\_N = ∅ then ModifiedParamodularConjecture at N is ParamodularConjecture at N. |
| `TauCeti.AbelianSurfaces.gritsenko_excluded` | characterisation | A Gritsenko lift is excluded from 𝓟\_N: its spin L-function is a product of shifted Riemann zeta functions and the L-function of an elliptic newform, so its Galois representations contain characters, whereas End_Q(A) = Z makes ρ\_{A,l} absolutely irreducible (Faltings). |

**Acceptance.**
- Lemma 10.3.1 gives instances for every N realized by an ordinary A as in Proposition 10.1.1.
- The modified conjecture specializes to the original one when 𝓑\_N = ∅.

**Prerequisites.** [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system), `AbelianSchemesAndArithmeticModuli:A6`, `PeriodsAndSpecialValues:PS.1`, `AutomorphicBundles:B4`, `ModularityAndLanglandsExtensions:ML.4`.

**Source.** BCGP18 §10.3 and Conjecture 10.4.3, pp. 272–273 and 277–278: States the paramodular conjecture of Brumer–Kramer, explains that fake abelian surfaces force a modification, and states the modified conjecture with the squared spin L-function for fake surfaces (Brumer–Kramer and its corrigendum, Trans. AMS 372 (2019)).

<a id="ap7-motives-conditional"></a>
### AP.7/motives-conditional — Lemma 10.3.2: motives attached to symplectic GL_4 forms, conditionally

*Theorem.*

**Statement.** Let F be totally real. Assume the Fontaine–Mazur conjecture, the standard conjectures, the Hodge conjecture and the Tate conjecture (the last is used three times in the sketched proof but is missing from the printed hypotheses), and that the Galois representations of every cuspidal Π on GL_4(A_F) of infinity type φ\_{2;1,0} at every v | ∞ form an irreducible weakly compatible system. Let Π be such a representation with rational Hecke eigenvalues, of symplectic type with multiplier |·|^2. Then there is a motive A/F attached to Π which is either (1) an abelian surface or (2) an abelian fourfold with End_F(A) containing an order in a quaternion algebra D/Q (a fake abelian surface). Conversely, assuming only standard automorphy conjectures, an abelian fourfold A/F with End_F(A) ⊗ Q = End_C(A) ⊗ Q an indefinite quaternion algebra gives such a Π.

**Hypotheses.**
- The listed conjectures, including the Tate conjecture, as explicit hypotheses.

**Construction or proof.**
- Albert's classification of the endomorphism algebra leaves type I (abelian surface, End_Q = Z), type II (indefinite D) and type III (definite D, not excluded) (AbelianSchemesAndArithmeticModuli A6).
- The Tate conjecture is used to see that the p-adic realization of the motive is a sum of copies of r_p, to show that the centre of End(M) ⊗ Q is Q, and to identify h^1(A) with the motive; the converse uses the Mumford–Tate conjecture for type II (Chi). The statements of these conjectures and of the proved Mumford–Tate case are requested at MotivesAndAlgebraicCycles MC.7 and ModularityAndLanglandsExtensions ML.0.

**Acceptance.**
- Explains why fake abelian surfaces must enter the paramodular conjecture.
- The conclusion is conditional and is never used to prove an unconditional statement.

**Prerequisites.** [`AP.7/paramodular-conjecture`](#ap7-paramodular-conjecture), `MotivesAndAlgebraicCycles:MC.7`, `ModularityAndLanglandsExtensions:ML.0`, `AbelianSchemesAndArithmeticModuli:A6`, `ModularityAndLanglandsExtensions:ML.4`.

**Source.** BCGP18 Lemma 10.3.2 and its sketched proof, §10.3, pp. 274–276: Shows, under standard conjectures, that a rational symplectic cuspidal GL_4 representation of the relevant infinity type comes from an abelian surface or a quaternionic abelian fourfold, and conversely for indefinite quaternionic fourfolds.

<a id="ap7-fake-surface-examples"></a>
### AP.7/fake-surface-examples — §10.4: fake abelian surfaces and an explicit genus two curve over Q(√−6)

*Application.*

**Statement.** Expected Lemma 10.4.4: there are a totally real F, an indefinite quaternion algebra D and an abelian fourfold A/F with End_F(A) ⊗ Q = End_C(A) ⊗ Q = D (sketch: D = (−1,3)\_Q, ramified exactly at 2 and 3; the level one Shimura stack of (A, λ, ι: O_D → End A) with a level structure A[p]^∨ = ρ̄ ⊕ ρ̄ for a surjective ρ̄: G_Q → GSp_4(F_p), p > 3, gives a fine moduli space with real points; Moret-Bailly gives F and A, and big image excludes further endomorphisms). Lemma 10.4.6 (corrected): for C: y^2 = Σ a_ix^i over K = Q(√−6), η = 1 − √−6, a_0 = 2^{10}η^6(√−6 − 4), a_1 = 2^{10}η^6·3, a_2 = 2^7η^4(9√−6 + 24), a_3 = −2^8η^4, a_4 = 2^4η^2(−9√−6 + 60), a_5 = 2^4η^2·3 (printed 2^4η·3), a_6 = −2√−6, with discriminant 2^{90}·3^6·(1−√−6)^{30}·(2−√−6)^6, B = Jac(C)/K and A = Res_{K/Q}B: End_Q(A) ⊗ Q = D and End_C(A) ⊗ Q = D × D (printed M_2(D)), D ramified exactly at 2 and 3; B is autochthonous (not isogenous to a twist of its conjugate; the proof prints 'If B were autochthonous' for 'were not'); B gives an irreducible rank 2 compatible system of G_K (printed G_Q) with Hodge–Tate weights (0,1) and determinant ε^{−1}, and A a rank 4 symplectic system of G_Q unramified outside {2,3,5,7,p}.

**Hypotheses.**
- Expected Lemma 10.4.4 is proved only in sketch; Lemma 10.4.6 rests on machine computations of zeta functions at the primes above 11 and of a_𝔭 to exclude CM.

**Construction or proof.**
- Expected 10.4.4: PEL moduli for quaternionic fourfolds (PELModuli M6), Moret-Bailly (R23.1), big image of the lift.
- Lemma 10.4.6: compute the discriminant (only the corrected a_5 gives the stated value); compare the zeta functions of the reductions at the two primes above 11 (they are not twists of each other, so B is autochthonous); exclude CM by a_𝔭.
- §10.4.2: for type II fourfolds A = Res_{K/Q}(B ⊗ χ), ∧^2V ≅ χ\_{K/Q}·(χ∘Ver) (printed ∧^2V ≅ χ\_{K/Q}); the conclusion stands.

**Acceptance.**
- The corrected a_5 = 2^4η^2·3 = −240 − 96√−6 gives the stated discriminant.
- A_C ≅ B_C × B^σ\_C with B_C, B^σ\_C non-isogenous, so End_C(A) ⊗ Q = D × D.

**Prerequisites.** [`AP.7/paramodular-conjecture`](#ap7-paramodular-conjecture), [`AP.7/motives-conditional`](#ap7-motives-conditional), `PELModuli:M6`, `PotentialModularityAndCompatibleSystems:R23.1`, `AbelianSchemesAndArithmeticModuli:A6`, [`AP.0/abelian-surface-system`](#ap0-abelian-surface-system).

**Source.** BCGP18 §10.4.2 (p. 277), Expected Lemma 10.4.4 (p. 278), §10.4.5 (p. 279) and Lemma 10.4.6 with its proof (pp. 280–281): Constructs, in sketch, quaternionic abelian fourfolds over totally real fields, discusses type II fourfolds and fake elliptic curves, and gives an explicit autochthonous genus two curve over Q(√−6) whose Weil restriction is a fake abelian surface over Q.

## Gaps

- **Higher Hida and Coleman theory for Hilbert–Siegel varieties (BCGP §§4–6) has no planning owner yet.** The reviewed extraction of BCGP routes 85 items of §§3.9–6 (Hida complexes M_I^• for Res_{F/Q}GSp_4 with Klingen level at I, the doubling theorem of §5, higher Coleman theory and classicality of §6) to HigherHidaAndColemanTheory. That roadmap's design packet plans Boxer–Pilloni's theory for GSp_{2g} over Q and Pilloni's Klingen complex over Q, not these Hilbert–Siegel statements. This packet records them as requests at its stages I3, X8, C4 and B7; they become real once that roadmap is revised to absorb route 2, or a Part II of it plans BCGP §§4–6 (see restructure). Needed by: AP.1/finite-free-balanced, AP.1/hecke-modules, AP.1/weights, AP.2/doubling-surjections, AP.2/hida-hecke-galois, AP.4/doubling-injection, AP.4/eigenspaces, AP.4/regular-weight-dimensions, AP.5/analytic-continuation-descent, AP.5/automorphy-of-rho, AP.5/connected-components, AP.5/gluing-theorem.
- **Four supplier Part IIs are not yet designed.** HilbertSiegelModularVarieties (Part II of HilbertModularVarietiesAndShimuraCurves), GSp4LocalLanglandsAndGaloisRepresentations (Part II of ModularityAndLanglandsExtensions), IntegralCoherentHeckeComplexes (Part II of AutomorphicBundles) and OpenImageTheoremsForAbelianVarieties (Part II of FaltingsFinitenessAndIsogenyTheorems) own the corresponding statements by the accepted routes of the BCGP extraction, but have no stage ids yet. Their requests are filed at the parent stages H4, ML.4/ML.5, B5 and R28.4 with the prefix 'Part II'; re-point them to the Part II stages once those designs exist. Needed by: AP.0/abelian-surface-system, AP.0/modular-gsp4-representation, AP.0/weight-two-galois, AP.1/finite-free-balanced, AP.1/hecke-modules, AP.1/standing-hypotheses, AP.1/tame-levels, AP.1/weights, AP.2/hida-hecke-galois, AP.2/ordinary-weight-two-corollary, AP.2/taylor-wiles-descent, AP.4/iwahori-multiplicities, AP.4/multiplicity-theorem, AP.4/regular-weight-dimensions, AP.5/automorphy-of-rho, AP.5/connected-components, AP.5/main-lifting-theorem, AP.5/solvable-descent, AP.5/twisted-lifting-theorem, AP.5/twisted-ordinary, AP.6/big-image, AP.6/galois-types, AP.6/genus-one-quadratic, AP.6/gl2-quadratic-galois, AP.6/good-prime-density, AP.6/potential-automorphy, AP.6/potential-modularity, AP.7/motives-conditional, AP.7/paramodular-conjecture, AP.7/paramodular-lemma, AP.7/residual-modularity-cases.
- **Deuring's existence theorem for ordinary elliptic curves over F_q with prescribed trace.** The corrected Lemma 9.2.7 and Theorem 9.2.8 need, for a prime q > p^2, ordinary elliptic curves over F_q of traces p and −p (Deuring; Waterhouse Theorem 4.1: every t with |t| < 2√q and q ∤ t is a trace). Tau Ceti's EllipticCurves roadmap supplies only the Hasse bound (layer 3); no atlas layer plans the existence direction. Proposed owner: EllipticCurves, Part II. Needed by: AP.6/pq-switch, AP.6/potential-modularity.
- **Cohomology of Kummer surfaces.** Proposition 9.4.1 needs H^\*(Km(A), Q_p) = H^{even}(A, Q_p) ⊕ (16 exceptional classes, an Artin representation twisted by Q_p(−1)) for the minimal resolution of A/⟨−1⟩. No atlas layer plans Kummer or K3 surfaces; the proposed K3 roadmap (K3SurfacesAndSymplecticBoundedness, design pending) is the natural owner. Needed by: AP.6/kummer-surfaces.
- **Arthur's classification for GSp_4 remains conditional.** Theorem 2.9.3 (descent from GL_4 of symplectic type to GSp_4) rests on Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1), whose status is recorded at ModularityAndLanglandsExtensions ML.0 and ML.4. Every theorem of this roadmap from Proposition 7.13.11 on carries this dependence; it is a recorded hypothesis, not a planned proof. Needed by: AP.0/weight-two-galois, AP.4/regular-weight-dimensions, AP.5/solvable-descent, AP.6/potential-automorphy.

## Restructuring proposals

- **rescope** (HigherHidaAndColemanTheory, AbelianSurfacesPotentialModularity). The BCGP extraction (route 2) assigns BCGP §§3.9–6 — Hida complexes over Λ\_I for Hilbert–Siegel varieties with Klingen level, the doubling theorem, higher Coleman theory with classicality — to HigherHidaAndColemanTheory, but its design packet plans the Siegel case over Q and Pilloni's Klingen complex only. Proposal: Either revise HigherHidaAndColemanTheory to plan route 2 (Theorem 4.6.1, Lemma 4.5.17, §5 doubling with Theorem 5.8.6, §6 with Theorems 6.5.8, 6.6.4, 6.6.5 and Lemma 6.5.18) at its stages I3, X8, C4 and B7, or create 'HigherHidaAndColemanTheory, Part II: Hilbert–Siegel higher Hida and Coleman theory and doubling' with those stages. This roadmap imports them; it plans none.
- **rescope** (tauceti:TauCetiRoadmap/EllipticCurves, AbelianSurfacesPotentialModularity). Deuring's existence of elliptic curves over F_q with every trace |t| < 2√q prime to q is needed by the corrected p–q switch and is planned nowhere. Proposal: Plan it in 'EllipticCurves, Part II' (design DESIGN-EllipticCurvesPartII), next to the Hasse bound of Tau Ceti's EllipticCurves layer 3; this roadmap imports it.
- **rescope** (GSp4NonregularModularityLifting, AbelianSurfacesModularity, AbelianSurfacesPotentialModularity). By the extraction's brief this roadmap owns BCGP25 Theorem 1.8.17 (Galois representations of ordinary parallel weight 2 forms), P(ρ̄) with the marked-Weierstrass locus, the S_6 ≅ Sp_4(F_2) dictionary, the twisted Siegel moduli, BCGP25 Lemmas 9.3.6–9.3.7 with their seed curves, Lemma 10.3.1 and the paramodular conjecture. Proposal: The designs of GSp4NonregularModularityLifting and AbelianSurfacesModularity import these from AP.0, AP.6 and AP.7 and do not plan them again; the 2025 extraction's routes of these items are to be re-pointed here.

## The Lean companion

`research/blueprint/suggested/AbelianSurfacesPotentialModularity.lean` follows the 12 October 2026 shape rule: it states and does not develop. It keeps light real-bodied definitions over carriers that exist at the pins and statable checks: the similitude submonoid {A : A J Aᵀ = c J, c a unit} of the standard alternating form (GSp_4 for l = Fin 2) with the multiplier-c example of Lemma 10.2.4's cocycle, the Iwahori and pro-v Iwahori indices, the Iwahori multiplicities d_η and d_ρ, the classical-weight integers of Λ\_I, the patching dimension count, the ordinarity criterion for a degree-4 Frobenius polynomial at a good prime, the corrected genus two functional-equation centre, and the group orders behind S_6 ≅ Sp_4(F_2) and the odd-theta cover. The Hecke polynomial Q_v(X) is not restated: it is `SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal` of TauCetiRoadmap (equivalently IntegralHeckeAndGaloisDeterminants' `Spherical.gsp4SpinPolynomial`). The file elaborates at the pins with `sorry` as its only warning. Everything whose carriers are not at the pins — GSp_4-valued Galois representations, compatible systems, Hilbert–Siegel varieties, Hida complexes, deformation rings, patched modules, the lifting and potential modularity theorems — is specified in this document and not stated in Lean.

