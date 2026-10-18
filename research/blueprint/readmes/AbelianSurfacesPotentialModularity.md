# Abelian surfaces over totally real fields are potentially modular

Independent review **REV-DESIGN-BCGP18**, Codex session codex-iVaX9l, 2026-10-18. The review accepts an audited target-level plan with explicit gaps. All eight layers remain **planned**, all implementation flags are **unchecked**, and zero layers are closed. Acceptance supplies no formalized proof.

The roadmap aims at ordinary parallel-weight-two GSp₄ modularity lifting and its applications to potential automorphy of abelian surfaces and genus-two curves, potential modularity over quadratic extensions, fixed-torsion constructions and paramodular forms. It owns the final BCGP argument and selected sequel inputs. Reusable Hilbert–Siegel geometry, higher Hida/Coleman theory, local deformation and representation theory, coherent Hecke complexes, and patching algebra are imported from their owners.

The main unresolved proof step is **G-flatness**: a balanced defect-one patched module is not thereby O-flat, so its action through the maximal O-flat deformation-ring quotient must be proved or assumed before the dimension argument. Every route through that patched-MCM target is conditional on this step. The other nine gaps below and the suppliers’ own hypotheses likewise propagate through prerequisites. In particular the local seed theorem retains a polarized lifting gap, and the explicit quaternionic example retains its CM-exclusion certificate.

Inventory: **57 targets** (14 definitions, 4 constructions, 38 theorems, 1 application), **127 API items**, **71 definition/construction tests**, **31 planets**, **17 pinned baseline declarations**, **98 supplier requests**, **10 gaps** and **26 confirmed source findings**. No target nodes were added by the review. Tests below are specification checks that a wrong definition would fail; their presence is not a claim that those tests have Lean implementations.

## Layer overview

| Layer | Targets | Status |
| --- | --- | --- |
| AP.0 | Abelian surfaces, automorphy and weight 2 Galois representations | planned |
| AP.1 | The Taylor–Wiles set-up for GSp_4 over a totally real field | planned |
| AP.2 | Galois representations on ordinary Hida–Hecke algebras | planned |
| AP.3 | Patching in defect zero and one | planned |
| AP.4 | Ihara avoidance and multiplicities | planned |
| AP.5 | Gluing, étale descent and the modularity lifting theorems | planned |
| AP.6 | Potential modularity and potential automorphy of abelian surfaces | planned |
| AP.7 | Modularity, fixed 3-torsion and the paramodular conjecture | planned |

The main chain runs from AP.0 conventions through AP.1–AP.2 Hida–Hecke setup, AP.3 patching, AP.4 multiplicities and AP.5 gluing/lifting to AP.6–AP.7 applications. Exact direct prerequisites accompany every target below. A stage’s scope is its listed targets, rather than every theorem of the sources it cites.

## Conventions

- F is a totally real number field, p ≥ 3 is a prime splitting completely in F, and S_p is the set of places above p. E/Q_p is a sufficiently large coefficient field with ring of integers O, uniformizer λ and residue field k.
- ε is the p-adic cyclotomic character (Hodge–Tate weight −1), ν: GSp_4 → G_m the similitude character, λ\_x the unramified character with λ\_x(Frob_v) = x. Local reciprocity sends uniformizers to geometric Frobenius.
- Galois representations of abelian surfaces are H^1_ét, GSp_4-valued with multiplier ε^{−1} (AP.0); ρ̄\_{A,p} is the dual of A[p].
- rec_{GT,p} is Gan–Takeda's local Langlands correspondence for GSp_4, transported to Q̄\_p and normalized as in BCGP §2.3; WD(·)^{F-ss} is the Frobenius-semisimplified Weil–Deligne representation; local–global compatibility is with π\_v ⊗ |ν|^{−3/2}.
- A form of parallel weight 2 is a cuspidal automorphic representation of GSp_4(A_F) of weight (k_v, l_v) = (2,2) at every real place (in BCGP25's normalization, algebraic of weight (1,1;2) with π\_∞ a non-degenerate limit of discrete series); unless stated, its central character is |·|^2.
- For I ⊆ S_p, Klingen level is used at the places of I and Iwahori level at those of I^c; 𝔠 is a choice of a residual unit root ᾱ\_v or β̄\_v at each v ∈ S_p, and 𝔠'\_v the other one, except in (7.13.3) where 𝔠'\_v denotes the lift of 𝔠\_v determined by a point.
- The spherical Hecke polynomial Q_v(X) = X^4 − T_{v,1}X^3 + (q_vT_{v,2} + (q_v^3 + q_v)T_{v,0})X^2 − q_v^3T_{v,0}T_{v,1}X + q_v^6T_{v,0}^2 is the reciprocal monic GSp_4 spin polynomial of SmoothRepresentationsOfLocalGroups SR.4.5; BCGP's T_{v,1}, T_{v,2} are its T₂, T₁ (Calegari–Geraghty order).
- Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1) is used through Theorem 2.9.3 and Lemma 2.9.1; its conditional status is carried as recorded at ModularityAndLanglandsExtensions ML.0 and ML.4. Dependence propagates along the prerequisite graph; the gap register and review notes qualify every affected proof route.

## Sources and versions

Statements, proof plans and corrections are in this roadmap’s own words. Locators give theorem, section and printed pages; arXiv printed pages equal PDF pages. The published edition was collated at selected correction locators, not reread in full. Inputs attributed through supplier roadmaps are contracts of those suppliers; the review distinguishes their existing targets from missing extensions.

- **BCGP18**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3). arXiv:1812.09269v3, the final version (292 pages), read 2026-10-18; published in Publications mathématiques de l'IHÉS 134 (2021), 153–501, doi 10.1007/s10240-021-00128-2. Page numbers are those printed in arXiv v3, which equal its PDF page numbers; Selected published statements and arguments were independently collated; the locators below use arXiv v3 pagination unless marked published.
  PDF SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.
- **BCGP25**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (28 February 2025, 230 pages), read 2026-10-18. Page numbers are those printed in v1, which equal its PDF page numbers.
  PDF SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.
- **Stacks080T**: The Stacks Project Authors, [Stacks Project, Commutative Algebra, Going up and going down](https://stacks.math.columbia.edu/tag/080T). Lemma 10.41.12, Tag 080T, §10.41 (unpaginated HTML), read 2026-10-18.

- [Published](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), read 2026-10-18; SHA-256 `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`. Selected collation: Remark 7.3.17 pp. 379–380; Lemma 7.5.22 pp. 400–401; Proposition 7.11.2 pp. 426–427; §§9–10 selected correction locators pp. 458–466, 477–481, 488–491. This is not a claim to have reread the full published paper.
- [Author copy](https://math.uchicago.edu/~fcale/papers/Modular.pdf), read 2026-10-18; SHA-256 `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`. Identical to arXiv v1; selected erratum locators checked.

## Existing library and upstream boundaries

All 17 declarations below were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. They provide only the stated baseline; they do not implement Hida families, local Langlands or modularity lifting. No baseline citation was removed. The dimension codomain, matrix-form convention, residual dual, and faithful scalar-action hypothesis are retained explicitly.

| Declaration | Module | Provides |
| --- | --- | --- |
| mathlib:NumberField.IsTotallyReal | Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean | A number field all of whose infinite places are real; the standing hypothesis on F throughout. |
| mathlib:NumberField.InfinitePlace | Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean | Infinite places of a number field; indexes the archimedean conditions (parallel weight, oddness, real points of moduli). |
| mathlib:Field.absoluteGaloisGroup | Mathlib/FieldTheory/AbsoluteGaloisGroup.lean | The absolute Galois group Gal(K^al/K) with the Krull topology; the group G_F on which every representation here is defined. |
| mathlib:Matrix.J | Mathlib/LinearAlgebra/SymplecticGroup.lean | The standard alternating form [[0,−1],[1,0]] in block form on l ⊕ l; with l = Fin 2 it is a form of rank 4. |
| mathlib:Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean | The submonoid of matrices A with A J Aᵀ = J; with l = Fin 2 this is Sp_4(R), the multiplier-one part of GSp_4(R). |
| mathlib:Nat.Prime | Mathlib/Data/Nat/Prime/Defs.lean | Rational primes; good primes and the auxiliary primes p, q are natural primes. |
| mathlib:Polynomial.Monic | Mathlib/Algebra/Polynomial/Degree/Defs.lean | Monic polynomials; the spherical Hecke polynomial Q_v(X) and the Frobenius polynomials are monic of degree 4. |
| mathlib:Module.Free | Mathlib/LinearAlgebra/FreeModule/Basic.lean | Free modules; the defect-zero Taylor–Wiles modules are finite free over Λ_∅[Δ_Q]. |
| mathlib:Module.Finite | Mathlib/RingTheory/Finiteness/Defs.lean | Finitely generated modules; the patched modules are finite over S_∞. |
| mathlib:IsLocalRing | Mathlib/RingTheory/LocalRing/Defs.lean | Local rings; the coefficient rings of deformation and patching are complete Noetherian local O-algebras. |
| mathlib:ringKrullDim | Mathlib/RingTheory/KrullDimension/Basic.lean | Krull dimension of a commutative ring; the dimension identity (7.11.1) compares dim (R_∞)′ with dim S_∞ − #I. Its codomain is WithBot ℕ∞; dimension arithmetic must be interpreted with the stated finiteness hypotheses. |
| mathlib:Equiv.Perm | Mathlib/Logic/Equiv/Defs.lean | Permutation groups; S_6 = Perm (Fin 6) acts on the six Weierstrass points of a genus two curve. |
| mathlib:alternatingGroup | Mathlib/GroupTheory/SpecificGroups/Alternating.lean | The alternating group; A_5 and A_6 appear in the residual-image cases of §10. |
| tauceti:TauCeti.AlgebraicGeometry.AbelianVariety | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean | An abelian variety over a field: a proper geometrically integral group scheme; the carrier of abelian surfaces. |
| tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean | The dimension of an abelian variety, as the topological Krull dimension of its scheme; an abelian surface has dim = 2. The codomain is WithBot ℕ∞, not Nat. |
| tauceti:TauCeti.schurMultiplier | TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean | The Schur multiplier H^2(G, k^×) of a group; Lemma 10.2.4 uses that of PSp_4(F_3) (order 2). |
| tauceti:TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff | TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean | A projective representation whose scalars act faithfully lifts to a linear one rescaled by units exactly when its Schur-multiplier class vanishes. |

The reviewed library-coverage audit and the current Tau Ceti tree were checked in addition to these pinned statements. Current TauCetiRoadmap was read at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including the complete [ClassicalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/RepresentationTheory/ClassicalGroups) and [InductionRestriction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/RepresentationTheory/InductionRestriction) readers and Suggested files. Relevant current IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups, ClassFieldTheory and EllipticCurves layers were also inspected.

Current IHG already owns connected reductive pseudocharacters, reconstruction, symplectic descent with prescribed multiplier under its p>2/residual-irreducibility hypotheses, operator localization, spin/dual-spin conventions and integral finite-quotient interpolation. Its integral interpolation is not the dense-affinoid theorem needed here. Current SmoothRepresentations already owns positive Klingen Hecke and reciprocal spin-polynomial conventions. The atlas IHG/SR references below are snapshot aliases for this existing upstream work; they confer no new ownership. Only the stated extensions are requested.

## Targets and specification checks

For every target the statement, hypotheses, acceptance checks and proof route are subject to the recorded dependency gaps. API entries are proposed public interfaces, not new implementations. A construction’s universal data or point characterization, its maps and compatibility checks belong in the owning supplier when that supplier already plans them.

### AP.0 — Abelian surfaces, automorphy and weight 2 Galois representations

#### The GSp_4-valued compatible system of an abelian surface

**Node:** `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Compatible system of an abelian surface

Let A be an abelian surface over a number field F and l a prime. Put ρ_{A,l} := H^1_ét(A_{F̄}, Q̄_l), a continuous four-dimensional representation of G_F, and 𝓡_A := (ρ_{A,l})_l. A polarization λ of A induces, through its Weil pairing, a G_F-equivariant perfect alternating pairing on H^1_ét(A_{F̄}, Q̄_l) with values in Q̄_l(−1); in a symplectic basis ρ_{A,l} takes values in GSp_4(Q̄_l) with multiplier ν∘ρ_{A,l} = ε_l^{−1}, and its GSp_4(Q̄_l)-conjugacy class does not depend on λ. A family of GSp_4-valued representations is called a weakly (resp. strictly) compatible system when the underlying GL_4-valued family is; no compatibility between the symplectic forms is demanded, since every system considered has multiplier the inverse cyclotomic character. The residual representation ρ̄_{A,p}: G_F → GSp_4(F̄_p) is the dual of the Galois module A[p](F̄).

**Hypotheses and conventions**

- F is a number field (totally real in every use from AP.1 on); A is an abelian variety of dimension 2 over F.
- Geometric Frobenius normalization: for v ∤ l of good reduction, ρ_{A,l}(Frob_v) has characteristic polynomial X^4 − a_1X^3 + a_2X^2 − q_v a_1 X + q_v^2 with a_1, a_2 ∈ Z independent of l.

**Source match**

- **BCGP18**, Definition 2.8.2 and Remark 2.8.3, §2.8, pp. 36–37. Defines ρ_{A,l} as H^1 of A over F̄ with GSp_4 values and multiplier ε_l^{−1}, and says that a family of GSp_4-valued representations is a compatible system when the GL_4-valued family is; Proposition 2.8.1 just before it gives strict compatibility and purity.

**Direct prerequisites**

- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim`
- `mathlib:Field.absoluteGaloisGroup`
- `mathlib:Matrix.symplecticGroup`
- `mathlib:Matrix.J`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A4`
- `AbelianSchemesAndArithmeticModuli:A6`
- `NeronModelsAndSemistableAbelianVarieties:R11.5`
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`
- `ArithmeticGaloisRepresentations:G7`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`

**Proof plan**

1. Construct ρ_{A,l} from the étale Tate module (A4) as the Q̄_l-dual of V_lA ⊗ Q̄_l, with its G_F action and continuity.
2. Use the Weil pairing attached to a polarization (A3); it is alternating, perfect after inverting l, and G_F acts on its target through the cyclotomic character, which on H^1 gives the multiplier ε_l^{−1}.
3. Independence of λ: ρ_{A,l} is semisimple (Faltings, R28.4), and a semisimple GSp_4-valued representation is determined up to GSp_4-conjugacy by its GL_4-valued representation and its multiplier (BCGP Lemma 2.1.3, owned by ArithmeticGaloisRepresentations G7).
4. Strict compatibility and purity of 𝓡_A are BCGP Proposition 2.8.1, imported from NeronModelsAndSemistableAbelianVarieties R11.5; the compatible-system API is PotentialModularityAndCompatibleSystems R24.5:operations.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.galoisRep | data | ρ_{A,l}: G_F → GL(H^1_ét(A_{F̄}, Q̄_l)), continuous, of dimension 4. |
| TauCeti.AbelianSurfaces.gspRep | constructor | From a polarization λ, ρ_{A,l}: G_F → GSp_4(Q̄_l) preserving the Weil-pairing form up to the multiplier. |
| TauCeti.AbelianSurfaces.multiplier_gspRep | simp | ν∘ρ_{A,l} = ε_l^{−1}, for every polarization. |
| TauCeti.AbelianSurfaces.gspRep_conj_indep | characterisation | The GSp_4(Q̄_l)-conjugacy class of gspRep λ does not depend on λ. |
| TauCeti.AbelianSurfaces.charpoly_frob | relation | For v ∤ l of good reduction, det(X − ρ_{A,l}(Frob_v)) = X^4 − a_1X^3 + a_2X^2 − q_va_1X + q_v^2 with a_i ∈ Z independent of l. |
| TauCeti.AbelianSurfaces.system | structure | 𝓡_A is a strictly compatible system, pure of weight 1, with Hodge–Tate weights {0,0,1,1} at each place above l. |
| TauCeti.AbelianSurfaces.system_restrict | functoriality | 𝓡_{A_{F'}} = 𝓡_A\|_{G_{F'}} for a finite extension F'/F; isogenous surfaces have isomorphic systems. |
| TauCeti.AbelianSurfaces.residual_dual | other | ρ̄_{A,p} is the dual of the G_F-module A[p](F̄); in particular A[p] ≅ ρ̄_{A,p}^∨ as symplectic modules up to the multiplier twist. |
| TauCeti.AbelianSurfaces.system_weilRestriction | compatibility | For K/F finite and an elliptic curve or abelian variety B/K, 𝓡_{Res_{K/F}B} ≅ Ind_{G_K}^{G_F} 𝓡_B (A6). |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.system_prod | computation | For elliptic curves E_1, E_2/F and v of good reduction, det(X − ρ_{E_1×E_2,l}(Frob_v)) = (X^2 − a_v(E_1)X + q_v)(X^2 − a_v(E_2)X + q_v). |
| TauCeti.AbelianSurfaces.multiplier_elliptic | non-example | For an elliptic curve E viewed through the same construction in dimension 1, det ρ_{E,l} = ε_l^{−1}; a definition using V_lA instead of H^1 gives multiplier ε_l and fails Hypothesis 7.13.1(2). |
| TauCeti.AbelianSurfaces.system_weilRestriction_quadratic | compatibility | For K/F quadratic and E/K, ρ_{Res_{K/F}E,l} ≅ Ind_{G_K}^{G_F} ρ_{E,l}, a GSp_4-valued representation with multiplier ε_l^{−1}. |
| TauCeti.AbelianSurfaces.residual_dual_test | characterisation | If A has a polarization of degree prime to p, then ρ̄_{A,p} ⊗ ε̄ ≅ A[p](F̄) as G_F-modules (Weil pairing); for F = Q and p odd, ε̄ is nontrivial, so ρ̄_{A,p} and A[p] are different modules in general. |

**Target acceptance checks**

- For A = E_1 × E_2 the system is 𝓡_{E_1} ⊕ 𝓡_{E_2}, with the product polarization giving the orthogonal sum of the two determinant pairings.
- ν∘ρ_{A,l} = ε_l^{−1}: the multiplier is the inverse cyclotomic character, as needed by Hypothesis 7.13.1(2) and Theorem 8.4.1(1).

**Downstream uses**

- BCGP18, Definitions 9.1.6 and 9.1.8: the automorphy and modularity of A are properties of 𝓡_A and of ρ_{A,p}
- BCGP18, Lemma 9.2.2 and Definition 9.2.3: residual images ρ̄_{A,l} and the good-prime conditions
- BCGP18, Proposition 10.1.1 and Theorem 9.3.1: ρ_{A,p} is fed to the lifting theorem; 𝓡_A and ∧^2𝓡_A to the potential automorphy argument
- BCGP25 (Modularity theorems for abelian surfaces), §9: the consumer roadmap AbelianSurfacesModularity uses the same conventions

**Review:** Verified H¹/dual-Tate convention, inverse cyclotomic multiplier, geometric Frobenius and independence of polarization; existing A3/A4/R11.5 supply the constructions. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Automorphic compatible systems over a number field

**Node:** `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Automorphic compatible system

Let K be a number field and 𝓡 a strictly compatible system of n-dimensional representations of G_K. 𝓡 is automorphic if there is an automorphic representation Π of GL_n(A_K) such that (1) Π = Π_1 ⊞ ⋯ ⊞ Π_r is an isobaric sum of C-algebraic cuspidal automorphic representations Π_i of GL_{n_i}(A_K); (2) the fixed field M_Π ⊂ C of {σ ∈ Aut(C) : σΠ^∞ ≅ Π^∞} is a number field; (3) for every finite place v of K, WD_v(𝓡) ≅ ⊕_i rec(Π_{i,v} ⊗ |det|_v^{(1−n_i)/2}). No condition is imposed at the infinite places. 𝓡 is potentially automorphic if 𝓡|_{G_L} is automorphic for some finite extension L/K. When 𝓡 is automorphic with Π, the completed function Λ_Π(𝓡,s) := L(𝓡,s)∏_{v|∞}L_v(Π,s) continues meromorphically to C and satisfies Λ_Π(𝓡,s) = ε(Π)N(Π)^{−s}Λ_Π(𝓡^∨,1−s).

**Hypotheses and conventions**

- rec is the local Langlands correspondence for GL_m over finite extensions of Q_p, with full Frobenius-semisimple Weil–Deligne parameters; WD_v(𝓡) is the common Frobenius-semisimple Weil–Deligne representation of the strictly compatible system at v.
- The coefficient field of Π is computed from its finite part Π^∞.

**Source match**

- **BCGP18**, Definition 9.1.1, Remarks 9.1.2–9.1.4 and (9.1.5), §9.1, pp. 249–251. Defines automorphy of a compatible system by an isobaric sum of C-algebraic cuspidal representations matching the Weil–Deligne representations at every finite place with the twists |det|^{(1−n_i)/2}, records when the coefficient-field condition is automatic, and states the functional equation of the completed L-function.

**Direct prerequisites**

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`
- `AutomorphicSpectralTheory:AS.2/isobaric-sum`
- `AutomorphicLFunctionsAndLocalFactors:AL.2`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`
- `PeriodsAndSpecialValues:PS.1`
- `mathlib:NumberField.InfinitePlace`
- `mathlib:Field.absoluteGaloisGroup`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`

**Proof plan**

1. Import isobaric sums from AutomorphicSpectralTheory AS.2/isobaric-sum and strong multiplicity one for them from AutomorphicLFunctionsAndLocalFactors AL.3/isobaric-strong-multiplicity-one.
2. Condition (2) follows from (3) and strong multiplicity one; it is kept separate because it is the condition expected to follow from (1) alone. In the two cases used it holds: Π regular algebraic (Clozel), and Π the transfer to GL_4 of a cuspidal GSp_4 representation of parallel weight 2 and central character |·|^2 (Blasius–Harris–Ramakrishnan), as recorded in Remark 9.1.2.
3. The functional equation (9.1.5) is the Godement–Jacquet functional equation for the Π_i (AL.2), multiplied over i.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic | data | The proposition that some isobaric Π satisfies (1)–(3) for 𝓡. |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsPotentiallyAutomorphic | data | ∃ L/K finite with (𝓡\|_{G_L}).IsAutomorphic. |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.unique | characterisation | The Π in the definition is unique up to isomorphism (strong multiplicity one for isobaric representations). |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.coefficientField | other | Condition (2) follows from (3); it holds automatically for regular algebraic Π and for transfers of parallel weight 2 GSp_4 forms. |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.functionalEquation | relation | Λ_Π(𝓡,s) continues meromorphically and Λ_Π(𝓡,s) = ε(Π)N(Π)^{−s}Λ_Π(𝓡^∨,1−s). |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.add | functoriality | If 𝓡 and 𝓢 are automorphic with Π and Σ, then 𝓡 ⊕ 𝓢 is automorphic with Π ⊞ Σ. |
| TauCeti.AbelianSurfaces.CompatibleSystem.IsAutomorphic.dual | functoriality | If 𝓡 is automorphic with Π then 𝓡^∨ is automorphic with the contragredient twisted isobaric sum. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.isAutomorphic_rank_one | degenerate | For n = 1, a strictly compatible system of characters is automorphic exactly when it is the system of an algebraic Hecke character, and then Π is that character (twist \|det\|^0). |
| TauCeti.AbelianSurfaces.isAutomorphic_elliptic | compatibility | For E/Q, 𝓡_E is automorphic with Π_E the cuspidal representation of the newform of E, and WD_v(𝓡_E) ≅ rec(Π_{E,v} ⊗ \|det\|_v^{−1/2}) at every finite v. |
| TauCeti.AbelianSurfaces.isAutomorphic_product_not_cuspidal | non-example | For non-isogenous E_1, E_2/Q, 𝓡_{E_1×E_2} is automorphic with Π_{E_1} ⊞ Π_{E_2}; a definition demanding cuspidal Π would wrongly reject it. |
| TauCeti.AbelianSurfaces.isAutomorphic_all_places | non-example | Matching rec at almost all v does not satisfy (3): the definition demands the full Weil–Deligne match, including monodromy, at every finite place (Remark 9.1.4). |

**Target acceptance checks**

- The system of a non-CM elliptic curve over Q is automorphic with Π cuspidal on GL_2, matched with the twist |det|^{−1/2}.
- The system of E_1 × E_2 is automorphic with Π = Π_1 ⊞ Π_2, which is not cuspidal.

**Downstream uses**

- BCGP18, Definition 9.1.6: automorphy of an abelian variety is automorphy of 𝓡_A
- BCGP18, Theorem 9.3.1: 𝓡_A and ∧^2𝓡_A are shown automorphic over solvable subextensions
- BCGP18, Proposition 9.4.1: Kummer surfaces through 𝓡_A and Artin representations
- BCGP18, (9.1.5): meromorphic continuation and functional equation of Λ_Π(𝓡,s)

**Review:** Definition 9.1.1 starts on p. 249. Repointed isobaric sums and their strong multiplicity-one theorem to the existing exact AS.2 and AL.3 nodes. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Automorphic and potentially automorphic abelian varieties

**Node:** `AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Potentially automorphic abelian variety

An abelian variety A over a number field K is automorphic if 𝓡_A is automorphic, and potentially automorphic if 𝓡_A|_{G_L} is automorphic for some finite extension L/K. If A is automorphic through a Π of one of the two forms (a) Π_i regular algebraic, or (b) K totally real, Π cuspidal and the transfer to GL_4 of a cuspidal GSp_4 representation of parallel weight 2 and central character |·|^2, then the archimedean factors and conductor of Π agree with those of 𝓡_A, so Λ_Π(𝓡_A,s) = Λ(𝓡_A,s) and Λ(𝓡_A,s) has meromorphic continuation and the expected functional equation.

**Hypotheses and conventions**

- K is a number field and A/K an abelian variety; 𝓡_A = (H^1_ét(A_{K̄}, Q̄_l))_l.

**Source match**

- **BCGP18**, Definition 9.1.6 and Remark 9.1.7, §9.1, p. 251. Defines (potential) automorphy of an abelian variety through its compatible system and explains why, in the two cases of Remark 9.1.2, the completed L-function of the system equals that of the variety.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`
- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `PeriodsAndSpecialValues:PS.1`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`

**Proof plan**

1. Unfold the definition through automorphic-compatible-system.
2. Remark 9.1.7: in cases (a) and (b) the Gamma factors L_v(Π,s), v|∞, are those of the Hodge structure of A and the conductor N(Π) is the Artin conductor of 𝓡_A, because the conductor respects local Langlands; so the two functional equations (2.8.5) and (9.1.5) coincide.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic | data | (𝓡_A).IsAutomorphic. |
| TauCeti.AbelianSurfaces.AbelianVariety.IsPotentiallyAutomorphic | data | ∃ L/K finite, (𝓡_A\|_{G_L}).IsAutomorphic. |
| TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.isogeny | characterisation | Isogenous abelian varieties are automorphic together. |
| TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.completedL | relation | In cases (a) and (b), Λ_Π(𝓡_A,s) = Λ(𝓡_A,s), hence Λ(𝓡_A,s) continues meromorphically with the functional equation of Conjecture 2.8.6 for i = 1. |
| TauCeti.AbelianSurfaces.AbelianVariety.IsAutomorphic.prod | functoriality | A × B is automorphic when A and B are. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.isAutomorphic_ellipticQ | compatibility | An elliptic curve E/Q is automorphic, with Π the cuspidal representation of its newform, so this notion extends the modularity of elliptic curves. |
| TauCeti.AbelianSurfaces.isAutomorphic_cm | degenerate | An abelian variety all of whose complex multiplication endomorphisms are defined over K is automorphic through an isobaric sum of algebraic Hecke characters (types D and F become this after a finite extension). |
| TauCeti.AbelianSurfaces.isAutomorphic_restrictionOfScalars | computation | For K/F quadratic and E/K automorphic through Π_E, Res_{K/F}E is automorphic through the automorphic induction of Π_E when that induction is defined. |
| TauCeti.AbelianSurfaces.isAutomorphic_vs_modular | non-example | For E_1 × E_2 over a totally real F, A is automorphic through the non-cuspidal Π_1 ⊞ Π_2, while modularity in the sense of Definition 9.1.8 asks for a cuspidal GSp_4 form; the two notions differ off general type (Remark 9.1.9). |

**Target acceptance checks**

- An elliptic curve over Q is automorphic.
- A CM abelian variety whose CM endomorphisms are all defined over K is automorphic through an isobaric sum of algebraic Hecke characters.

**Downstream uses**

- BCGP18, Proposition 9.2.1: abelian surfaces not of type A or B[C_2] are shown potentially automorphic
- BCGP18, Theorem 9.3.1 and Theorem 1.1.3: every abelian surface over a totally real field is potentially automorphic
- BCGP18, Proposition 9.4.1: Kummer surfaces

**Review:** The Hecke-character decomposition requires the CM endomorphisms over the base. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Modular and potentially modular GSp_4-representations and abelian surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Modular GSp4-representation

Let F be totally real. A continuous ρ: G_F → GSp_4(Q̄_p) is modular if there is a cuspidal automorphic representation π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 such that WD(ρ|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2}) for every finite place v of F; in particular ρ^{ss} ≅ ρ_{π,p}; when ρ is semisimple, ρ ≅ ρ_{π,p}. ρ is potentially modular if ρ|_{G_{F'}} is modular for some finite Galois extension F'/F of totally real fields. An abelian surface A/F is modular (resp. potentially modular) if ρ_{A,p} is, for some prime p; this does not depend on p. Both versions of the paper print WD(ρ_{π,p}|_{G_{F_v}}) where WD(ρ|_{G_{F_v}}) is meant; the definition is used in the corrected form.

**Hypotheses and conventions**

- Parallel weight 2: at every real place π_v lies in the archimedean L-packet of weight (2,2) (holomorphic and generic limits of discrete series), in the conventions of BCGP §2.6, owned by the GSp_4 Part II of ModularityAndLanglandsExtensions.
- rec_{GT,p} is Gan–Takeda's local Langlands correspondence for GSp_4 transported to Q̄_p, normalized as in BCGP §2.3.

**Source match**

- **BCGP18**, Definition 9.1.8 and Remark 9.1.9, §9.1, p. 251. Defines modular and potentially modular GSp_4-valued representations and abelian surfaces by a cuspidal parallel weight 2 form with central character |·|^2 and Gan–Takeda local–global compatibility at every finite place; the remark restricts the results to general type.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety`
- `ModularityAndLanglandsExtensions:ML.0`
- `ModularityAndLanglandsExtensions:ML.4`
- `ArithmeticGaloisRepresentations:G7`
- `NeronModelsAndSemistableAbelianVarieties:R11.5`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `mathlib:NumberField.IsTotallyReal`
- `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`

**Proof plan**

1. Unfold; ρ^{ss} ≅ ρ_{π,p} follows from the match at unramified places, Chebotarev and Brauer–Nesbitt applied to the semisimple GL_4-valued representations, upgraded to GSp_4 by Lemma 2.1.3 (G7).
2. Independence of p for abelian surfaces: 𝓡_A is strictly compatible (R11.5), so the Weil–Deligne representations of ρ_{A,p'} at every finite v agree with those of ρ_{A,p}; the Galois representations attached to π at p' are compatible with π at all v.
3. Remark 9.1.9: when the transfer of π to GL_4 is cuspidal (π of general type), a modular A is automorphic in the sense of Definition 9.1.6, case (b) of Remark 9.1.2.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.GSpRep.IsModular | data | ∃ π cuspidal of parallel weight 2 and central character \|·\|^2 with WD(ρ\|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π_v ⊗ \|ν\|^{−3/2}) for all finite v. |
| TauCeti.AbelianSurfaces.GSpRep.IsPotentiallyModular | data | ∃ F'/F finite Galois, F' totally real, (ρ\|_{G_{F'}}).IsModular. |
| TauCeti.AbelianSurfaces.AbelianSurface.IsModular | data | ∃ p, (ρ_{A,p}).IsModular. |
| TauCeti.AbelianSurfaces.AbelianSurface.isModular_iff_forall | characterisation | A is modular iff ρ_{A,p} is modular for every p. |
| TauCeti.AbelianSurfaces.GSpRep.IsModular.multiplier | simp | If ρ is modular then ν∘ρ = ε^{−1}. |
| TauCeti.AbelianSurfaces.GSpRep.IsModular.isPotentiallyModular | other | Modular implies potentially modular with F' = F. |
| TauCeti.AbelianSurfaces.AbelianSurface.IsModular.isAutomorphic | compatibility | If the form π is of general type, a modular A is automorphic (Definition 9.1.6, case (b) of Remark 9.1.2). |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.isModular_multiplier | characterisation | A modular ρ satisfies ν∘ρ = ε^{−1}; a definition with trivial central character instead of \|·\|^2 would give the wrong multiplier and fail Theorem 8.4.1(1). |
| TauCeti.AbelianSurfaces.isModular_printed_vacuous | non-example | With the printed condition WD(ρ_{π,p}\|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π_v ⊗ \|ν\|^{−3/2}), any ρ would be 'modular' as soon as some π exists; for semisimple ρ the corrected definition forces ρ ≅ ρ_{π,p}, so ρ_{π,p} ⊗ χ is not modular through π if an unramified Frobenius g has χ(g) = −1 and tr ρ_{π,p}(g) ≠ 0. Nontrivial self-twists must not be excluded. |
| TauCeti.AbelianSurfaces.isModular_restrict | degenerate | Taking F' = F shows every modular ρ is potentially modular. |
| TauCeti.AbelianSurfaces.isModular_indep_prime | compatibility | For an abelian surface A, ρ_{A,3} is modular iff ρ_{A,5} is modular. |

**Target acceptance checks**

- A modular ρ has multiplier ε^{−1}.
- Modular implies potentially modular with F' = F.

**Downstream uses**

- BCGP18, Corollary 8.2.2, Lemma 8.3.2 and Theorem 8.4.1: the conclusion of the lifting theorems is that ρ is modular in this sense
- BCGP18, Theorem 9.2.8: challenging abelian surfaces are potentially modular
- BCGP18, Proposition 10.1.1 and Theorem 10.2.6: modularity of specific abelian surfaces

**Review:** Replaced the false universal quadratic-twist test by a trace test that excludes self-twists. Chebotarev and Brauer–Nesbitt identify the semisimplification; the applications have irreducible ρ. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Galois representations of ordinary parallel weight 2 forms on GSp_4

**Node:** `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Galois representations of weight two

Let F^+ be totally real, p a prime splitting completely in F^+, and π a cuspidal automorphic representation of GSp_4(A_{F^+}) of parallel weight 2 (algebraic of weight (1,1;2) at every real place, with π_∞ a non-degenerate limit of discrete series) and central character |·|^2, ordinary at every place above p. Then there is a continuous semisimple ρ_{π,p}: G_{F^+} → GSp_4(Q̄_p) such that (i) ν∘ρ_{π,p} = ε^{−1}; (ii) for every finite v ∤ p, WD(ρ_{π,p}|_{G_{F^+_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss}; (iii) for every v | p there are potentially unramified characters α_v, β_v of G_{F^+_v} with ρ_{π,p}|_{G_{F^+_v}} conjugate to an upper triangular representation with diagonal (α_v, β_v, β_v^{−1}ε^{−1}, α_v^{−1}ε^{−1}), the diagonal being read off from the ordinary p-stabilization of π_v. No hypothesis p > 2, no residual image condition and no distinctness of the ordinary Hecke parameters is assumed; de Rhamness at p is not asserted. The statement depends on Arthur's classification for GSp_4 through the regular weight input, whose conditional status is carried as recorded at ModularityAndLanglandsExtensions ML.0 and ML.4.

**Hypotheses and conventions**

- F^+ totally real; p splits completely in F^+.
- π cuspidal, of parallel weight 2 and central character |·|^2, ordinary at every v | p.
- Arthur's multiplicity formula for GSp_4 (BCGP18 §1.4.1), in the conditional form recorded by ModularityAndLanglandsExtensions.

**Source match**

- **BCGP25**, Theorem 1.8.17 with (1.8.18)–(1.8.19), Definition 1.8.16 and Remark 1.8.15, §1.8, pp. 13–14. States the existence of a semisimple GSp_4-valued representation for an ordinary weight 2 representation over a totally real field in which p splits, with multiplier ε^{−1}, semisimplified local–global compatibility away from p and the ordinary triangular shape at p, and sketches its proof by interpolation over the Boxer–Pilloni eigenvariety.
- **BCGP18**, Corollary 7.9.6, §7.9, pp. 220–221. The 2018 paper constructs the same representation in parallel weight 2 under extra residual hypotheses, by the Hida-family route of Theorem 7.9.4.

**Direct prerequisites**

- `HigherHidaAndColemanTheory:E6/eigenvariety`
- `HigherHidaAndColemanTheory:E6/classical-points`
- `HigherHidaAndColemanTheory:E6/interior-equidimension`
- `ModularityAndLanglandsExtensions:ML.4`
- `IntegralHeckeAndGaloisDeterminants:IHG.0`
- `IntegralHeckeAndGaloisDeterminants:IHG.1`
- `IntegralHeckeAndGaloisDeterminants:IHG.4`
- `AutomorphicBundles:B5`
- `ModularityAndLanglandsExtensions:ML.0`
- `mathlib:NumberField.IsTotallyReal`
- `mathlib:Field.absoluteGaloisGroup`

**Proof plan**

1. π^∞ occurs in the interior coherent cohomology of the Hilbert–Siegel variety (Harris; imported with the coherent Hecke complexes).
2. π defines a point x of the equidimensional higher Coleman eigenvariety, which dominates weight space and in which classical points of regular algebraic weight are Zariski dense near x (Boxer–Pilloni, Higher Coleman theory, Theorem 1.4.3; HigherHidaAndColemanTheory E6). Choose an affinoid neighbourhood, inside an ordinary component when π is ordinary.
3. At the dense regular points the Galois representations of regular weight (BCGP25 Theorem 1.8.13 = BCGP18 Theorem 2.7.1, owned by the GSp_4 Part II of ModularityAndLanglandsExtensions) give GSp_4-valued pseudocharacters (the connected reductive pseudocharacters of IntegralHeckeAndGaloisDeterminants IHG.0); interpolate them over the affinoid (IHG.4, extended to affinoid coefficients) and specialize at x to obtain, by reconstruction over Q̄_p (IHG.1; V. Lafforgue, Quast), a semisimple ρ_{π,p}.
4. Reconstruction of the GSp_4-valued pseudocharacter supplies a nondegenerate alternating form with multiplier ε^{−1}. The occurrence of ε^{−1} in ∧²ρ is a consistency check and alone does not imply nondegeneracy. Interpolate the semisimplified Weil–Deligne parameters away from p and the ordinary filtration at p, as in Boxer–Pilloni Theorem 1.4.8.

**Target acceptance checks**

- (i) gives multiplier ε^{−1}, which Hypothesis 7.8.1(5) and Hypothesis 7.13.1(6) use to compare ρ̄_{π,p} with ρ̄.
- For π of general type with ρ_{π,p} pure, the semisimplified compatibility upgrades to full Frobenius-semisimple compatibility (BCGP25 Remark 1.8.20), which is how Corollary 8.2.2 matches monodromy.

**Review:** Used reductive-pseudocharacter reconstruction for the perfect symplectic form; recorded the missing affinoid interpolation extension separately. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.1 — The Taylor–Wiles set-up for GSp_4 over a totally real field

#### The standing hypotheses on ρ̄ and the auxiliary place v_0

**Node:** `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses` · **Kind:** definition · **Implementation:** unchecked

Let F be totally real, p ≥ 3 a prime splitting completely in F, S_p the places above p, k a finite field of characteristic p and ρ̄: G_F → GSp_4(k) absolutely irreducible. Hypothesis 7.7.1 asks: (1) ρ̄ is vast and tidy; (2) ρ̄|_{G_{F_v}} is p-distinguished weight 2 ordinary for v ∈ S_p; (3) there is a finite set R of finite places disjoint from S_p such that for v ∈ R, ρ̄|_{G_{F_v}} is trivial and q_v ≡ 1 mod p (mod 9 if p = 3), and ρ̄ is unramified outside S_p ∪ R. Hypothesis 7.8.1 adds an ordinary cuspidal automorphic π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ̄_{π,p} ≅ ρ̄, π_v^{Iw(v)} ≠ 0 for v ∈ R ∪ S_p and π_v unramified otherwise. Under either hypothesis fix an auxiliary place v_0 ∉ R ∪ S_p, absolutely unramified, with q_{v_0} ≢ 1 mod p, no two eigenvalues of ρ̄(Frob_{v_0}) of ratio q_{v_0}, and residue characteristic > 5; put S = R ∪ S_p ∪ {v_0} and ψ = ε^{−1}.

**Hypotheses and conventions**

- p ≥ 3; F totally real and p totally split in F.
- Vast, tidy and enormous are the residual-image conditions of BCGP Definitions 7.5.2, 7.5.6 and 7.5.11, owned by ArithmeticGaloisRepresentations G7; p-distinguished weight 2 ordinary is Definition 7.3.1, owned by LocalGaloisDeformationRings.

**Source match**

- **BCGP18**, Hypothesis 7.7.1 and the choice of v_0, §7.7, p. 210; Hypothesis 7.8.1, §7.8, p. 211. States the residual hypotheses (vast and tidy, p-distinguished weight 2 ordinary at p, trivial residual representation and q_v ≡ 1 mod p, or mod 9 for p = 3, at the Ihara-avoidance places), the automorphic seed of Hypothesis 7.8.1(5), and the choice of the auxiliary place v_0 with its consequences.

**Direct prerequisites**

- `ArithmeticGaloisRepresentations:G7`
- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `LocalGaloisDeformationRings:R08.2`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`
- `ModularityAndLanglandsExtensions:ML.4`
- `mathlib:NumberField.IsTotallyReal`
- `mathlib:Field.absoluteGaloisGroup`

**Proof plan**

1. Existence of v_0: tidiness of ρ̄(G_F) and Chebotarev give a positive density of v with the four properties; 'absolutely unramified' is needed for Lemma 7.8.3 and is stated explicitly in §7.13(8).
2. Local duality gives H^2(F_{v_0}, ad ρ̄) ≅ H^0(F_{v_0}, ad ρ̄(1))^∨, which vanishes by the eigenvalue-ratio condition; then every lift of ρ̄|_{G_{F_{v_0}}} is unramified (Proposition 7.4.2, LocalGaloisDeformationRings R08.2).
3. Hypothesis 7.8.1 implies Hypothesis 7.7.1 by inclusion of its clauses.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.TWHypothesis | data | Hypothesis 7.7.1 for (F, p, ρ̄, R) as a structure of propositions. |
| TauCeti.AbelianSurfaces.LiftingHypothesis | data | Hypothesis 7.8.1: TWHypothesis plus the automorphic seed π with its level conditions. |
| TauCeti.AbelianSurfaces.LiftingHypothesis.toTWHypothesis | projection | Hypothesis 7.8.1 implies Hypothesis 7.7.1. |
| TauCeti.AbelianSurfaces.exists_auxPlace | constructor | Under TWHypothesis there is v_0 with the four properties (absolutely unramified, q_{v_0} ≢ 1 mod p, no eigenvalue ratio q_{v_0}, residue characteristic > 5); the set of such v_0 has positive Dirichlet density. |
| TauCeti.AbelianSurfaces.auxPlace_H2_eq_zero | relation | H^2(F_{v_0}, ad ρ̄) = 0. |
| TauCeti.AbelianSurfaces.auxPlace_lifts_unramified | other | Every lift of ρ̄\|_{G_{F_{v_0}}} to a complete Noetherian local O-algebra is unramified. |
| TauCeti.AbelianSurfaces.badSet | data | S = R ∪ S_p ∪ {v_0}. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.ihara_place_mod9 | computation | For p = 3, F = Q: q_v = 19 and q_v = 37 satisfy q_v ≡ 1 mod 9 and may lie in R; q_v = 7 satisfies q_v ≡ 1 mod 3 but not mod 9 and may not. |
| TauCeti.AbelianSurfaces.split_required | non-example | F = Q(√2), p = 3: 3 is inert in F, so no ρ̄ over F satisfies the hypotheses at p = 3; F = Q(√7), p = 3 is admissible since 3 splits. |
| TauCeti.AbelianSurfaces.emptyR | degenerate | R = ∅ is allowed; then S = S_p ∪ {v_0} and the Ihara-avoidance places are absent. |
| TauCeti.AbelianSurfaces.auxPlace_neat | characterisation | Any level with pro-v_0 Iwahori component Iw_1(v_0) at the chosen v_0 is neat (Lemma 7.8.3), because v_0 is absolutely unramified of residue characteristic > 5. |

**Target acceptance checks**

- For p = 3 and F = Q, 19 and 37 may lie in R, while 7 may not (7 ≢ 1 mod 9).
- H^2(F_{v_0}, ad ρ̄) = 0.

**Downstream uses**

- BCGP18, §7.7: defines the global deformation problems S_χ^{I,𝔠}
- BCGP18, Definition 7.8.2 and Lemma 7.8.3: the level at v_0 is Iw_1(v_0), which makes all levels neat
- BCGP18, Theorem 7.9.4 and Proposition 7.11.2: standing hypotheses of the Taylor–Wiles systems and the patching
- BCGP18, Remark 7.13.2: Hypothesis 7.13.1 implies Hypothesis 7.8.1

**Review:** Replaced the generic duality citation by the current ClassFieldTheory layer-5 local Tate theorem. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The global deformation problems S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠}

**Node:** `AbelianSurfacesPotentialModularity:AP.1/deformation-problems` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Ordinary GSp4 deformation problems

Assume Hypothesis 7.7.1 with S = R ∪ S_p ∪ {v_0}. Choose I ⊆ S_p (I^c = S_p ∖ I); for v ∈ R a pair χ_v = (χ_{v,1}, χ_{v,2}) of characters O_{F_v}^× → O^× trivial mod λ; for v ∈ I, Λ_v = O[[O_{F_v}^×(p)]] with universal character θ_v, and for v ∈ I^c, Λ_v = O[[O_{F_v}^×(p)^2]] with θ_{v,1}, θ_{v,2}; and 𝔠 = (𝔠_v)_{v∈S_p} with 𝔠_v ∈ {ᾱ_v, β̄_v}. Then S_χ^{I,𝔠} is the problem of deformations of ρ̄ with multiplier ε^{−1}, unramified outside S, over the coefficient ring Λ_I = ⊗̂_{v∈S_p}Λ_v, with local conditions D_v^P (v ∈ I, Klingen-parabolic ordinary), D_v^{B,𝔠_v} (v ∈ I^c, Borel ordinary with the unit eigenvalue lifting 𝔠_v), D_v^{χ_v} (v ∈ R, Ihara avoidance) and D_{v_0}^□ (unrestricted). For a Taylor–Wiles datum (Q, (ᾱ_{v,1},…,ᾱ_{v,4})_{v∈Q}), S_{χ,Q}^{I,𝔠} is the same problem with ramification allowed in S_Q = S ∪ Q and the unrestricted condition at v ∈ Q; it is a problem over Λ_I[Δ_Q]. Neither problem depends on 𝔠_v for v ∈ I.

**Hypotheses and conventions**

- The local problems D_v^P, D_v^{B,𝔠_v} (§7.3) and D_v^χ (§7.4.5) and their rings are owned by LocalGaloisDeformationRings; Taylor–Wiles data and Δ_Q (§7.6) by GlobalGaloisDeformations.
- The paper prints the Taylor–Wiles datum with n eigenvalues; there are four.

**Source match**

- **BCGP18**, §7.7, the two displayed problems after Hypothesis 7.7.1, p. 210. Defines the global problems S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠} from the P-ordinary, (B,𝔠_v)-ordinary, Ihara-avoidance and unrestricted local conditions, over the weight algebras Λ_v, and notes the independence of 𝔠_v for v ∈ I.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`
- `GlobalGaloisDeformations:G7`
- `GlobalGaloisDeformations:R04.1`
- `GlobalGaloisDeformations:R04.2`
- `GlobalGaloisDeformations:R04.3`
- `GlobalGaloisDeformations:R04.5`
- `LocalGaloisDeformationRings:L7`
- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `LocalGaloisDeformationRings:R08.2`
- `PadicMeasuresIwasawaAlgebras:L1`

**Proof plan**

1. Assemble the global problem from the local problems with the formalism of global deformation problems with fixed multiplier (GlobalGaloisDeformations R04.1–R04.3, G7) and Λ_I-coefficients from the completed group rings (PadicMeasuresIwasawaAlgebras L1).
2. Representability of R_{S_χ^{I,𝔠}} and R_{S_{χ,Q}^{I,𝔠}} follows from absolute irreducibility of ρ̄ (R04.2); the Λ_I[Δ_Q]-algebra structure comes from the inertia action at v ∈ Q (Lemma 7.4.4 and the O[Δ_v]-structure, LocalGaloisDeformationRings R08.2).
3. Independence of 𝔠_v for v ∈ I: the Klingen-parabolic condition does not choose an eigenvalue.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.globalProblem | data | S_χ^{I,𝔠} as a global deformation problem with fixed multiplier ε^{−1} over Λ_I. |
| TauCeti.AbelianSurfaces.globalProblemTW | constructor | S_{χ,Q}^{I,𝔠} for a Taylor–Wiles datum Q, over Λ_I[Δ_Q]. |
| TauCeti.AbelianSurfaces.univRing | universal-property | R_{S} represents deformations of type S; for every complete Noetherian local Λ_I-algebra A, Hom(R_S, A) is the set of strict-equivalence classes of deformations of type S over A. |
| TauCeti.AbelianSurfaces.globalProblem_indep_I | characterisation | S_χ^{I,𝔠} and S_{χ,Q}^{I,𝔠} depend on 𝔠 only through (𝔠_v)_{v ∈ I^c}. |
| TauCeti.AbelianSurfaces.univRing_modLambda | relation | R_{S_χ^{I,𝔠}}/λ ≅ R_{S_1^{I,𝔠}}/λ, compatibly with the local rings. |
| TauCeti.AbelianSurfaces.univRingTW_coinvariants | relation | R_{S_{χ,Q}^{I,𝔠}} ⊗_{Λ_I[Δ_Q]} Λ_I ≅ R_{S_χ^{I,𝔠}}. |
| TauCeti.AbelianSurfaces.globalProblem_restrict_I | functoriality | For I ⊆ I', the closed immersion Spec Λ_{I'} → Spec Λ_I (θ_{v,1} = θ_{v,2} for v ∈ I') carries S_χ^{I,𝔠} to a problem whose specialization contains S_χ^{I',𝔠}. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.lambda_rank_Q | computation | For F = Q (S_p = {p}): I = {p} gives Λ_I = O[[Z_p^×(p)]] ≅ O[[T]], and I = ∅ gives Λ_∅ = O[[(Z_p^×(p))^2]] ≅ O[[T_1, T_2]]. |
| TauCeti.AbelianSurfaces.emptyTW | degenerate | S_{χ,∅}^{I,𝔠} = S_χ^{I,𝔠} and Δ_∅ is trivial. |
| TauCeti.AbelianSurfaces.indep_c_full | characterisation | For I = S_p the problem does not depend on 𝔠 at all. |
| TauCeti.AbelianSurfaces.tw_four_eigenvalues | non-example | A Taylor–Wiles datum records four eigenvalues ᾱ_{v,1},…,ᾱ_{v,4} of ρ̄(Frob_v); a datum with a different number of entries (the printed n) does not define the problem. |

**Target acceptance checks**

- For χ = 1 and χ nontrivial the problems agree modulo λ.
- The empty Taylor–Wiles datum gives back S_χ^{I,𝔠}.

**Downstream uses**

- BCGP18, Theorem 7.9.4: the Hida–Hecke representations are deformations of type S_{χ,Q}^{I,𝔠}
- BCGP18, §7.11: R_N^{χ,I,𝔠} = R_{S_{χ,Q_N}^{I,𝔠}} are the rings that are patched
- BCGP18, (7.13.3): points x of Spec R^{1,I,𝔠}[1/p] give the primes 𝔭_x

**Review:** Imported the exact L7/gsp4-ordinary-generic-fibres contract instead of the stale L8 stage. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The tame levels K^p, K_0^p(Q), K_1^p(Q) and K_0^p(Q,R)

**Node:** `AbelianSurfacesPotentialModularity:AP.1/tame-levels` · **Kind:** definition · **Implementation:** unchecked

Assume Hypothesis 7.8.1 with v_0 chosen. K^p = ∏_v K_v ⊂ GSp_4(A_F^{∞,p}) has K_v = GSp_4(O_{F_v}) for v ∉ S_p ∪ R ∪ {v_0} and K_v = Iw_1(v) for v ∈ R ∪ {v_0}, where Iw(v) and Iw_1(v) are the preimages in GSp_4(O_{F_v}) of the Borel B(k(v)) and of its unipotent radical U(k(v)), so Iw(v)/Iw_1(v) ≅ T(k(v)). For a Taylor–Wiles datum Q, K_0^p(Q) and K_1^p(Q) agree with K^p away from Q and are Iw(v), resp. Iw_1(v), at v ∈ Q; K_0^p(Q,R) agrees with K^p away from Q ∪ R and is Iw(v) at v ∈ Q ∪ R; and K_1^p(Q,R) := K_1^p(Q). Then K_1^p(Q) ⊂ K_0^p(Q,R) with quotient ∏_{v∈Q∪R} T(k(v)), and K_pK^p, K_pK_0^p(Q), K_pK_1^p(Q) are neat for every compact open K_p ⊂ GSp_4(F ⊗ Q_p) (Lemma 7.8.3 at v = v_0).

**Hypotheses and conventions**

- T ⊂ B ⊂ GSp_4 are the diagonal torus and upper triangular Borel in the paper's coordinates (BCGP §2.1.1).

**Source match**

- **BCGP18**, Definition 7.8.2 and Lemma 7.8.3, §7.8, pp. 211–212. Defines the tame levels at the Ihara-avoidance, auxiliary and Taylor–Wiles places and proves that a level with pro-v Iwahori component at an absolutely unramified place of residue characteristic greater than 5 is neat.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`
- `ShimuraData:D5`
- `ModularityAndLanglandsExtensions:ML.4`
- `SmoothRepresentationsOfLocalGroups:SR.1`

**Proof plan**

1. Define the factors place by place; the index computation is the Bruhat decomposition of GSp_4 over k(v).
2. Neatness: Lemma 7.8.3 (owned by ShimuraData D5) applies because v_0 is absolutely unramified with residue characteristic > 5 and the component at v_0 is Iw_1(v_0).

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.tameLevel | data | K^p. |
| TauCeti.AbelianSurfaces.tameLevel0 | constructor | K_0^p(Q). |
| TauCeti.AbelianSurfaces.tameLevel1 | constructor | K_1^p(Q) = K_1^p(Q,R). |
| TauCeti.AbelianSurfaces.tameLevel0R | constructor | K_0^p(Q,R). |
| TauCeti.AbelianSurfaces.tameLevel1_le_tameLevel0R | relation | K_1^p(Q) ⊂ K_0^p(Q,R) with quotient ∏_{v ∈ Q ∪ R} T(k(v)). |
| TauCeti.AbelianSurfaces.iwahori_quotient | other | Iw(v)/Iw_1(v) ≅ T(k(v)), the k(v)-points of the diagonal torus of GSp_4. |
| TauCeti.AbelianSurfaces.isNeat | characterisation | K_pK^p, K_pK_0^p(Q) and K_pK_1^p(Q) are neat for all compact open K_p. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.iwahori_index | computation | [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1); for q_v = 7 this is 64·50 = 3200. |
| TauCeti.AbelianSurfaces.pro_iwahori_index | computation | [Iw(v) : Iw_1(v)] = (q_v − 1)^3; for q_v = 7 this is 216. |
| TauCeti.AbelianSurfaces.emptyQ | degenerate | K_0^p(∅) = K_1^p(∅) = K^p and K_0^p(∅,R) has Iwahori level exactly at R. |
| TauCeti.AbelianSurfaces.neat_needs_v0 | non-example | If R = Q = ∅ and every component, including those above p, is maximal compact, removing the auxiliary pro-v₀ Iwahori condition admits the scalar −1; this level is not neat. Other pro-v Iwahori conditions may already exclude −1. |

**Target acceptance checks**

- [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1) is prime to p when q_v ≡ 1 mod p and p > 2.
- [Iw(v) : Iw_1(v)] = (q_v − 1)^3.

**Downstream uses**

- BCGP18, (7.8.4) and the modules M^{χ,I,𝔠,Q}: the Taylor–Wiles modules are cohomology at level K_pK_1^p(Q)
- BCGP18, Proposition 7.8.10: K_1^p(Q,R) ⊂ K_0^p(Q,R) is a finite étale cover with group ∏ T(k(v))
- BCGP18, Definition 7.13.4: the levels K^{p,Iw} and K^{p,Iw_1} of the multiplicity argument

**Review:** Restricted the neatness counterexample to maximal compact level with R = Q = ∅. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Weights of Λ_I, classical weights, κ_2 and κ_reg

**Node:** `AbelianSurfacesPotentialModularity:AP.1/weights` · **Kind:** definition · **Implementation:** unchecked

Fix I ⊆ S_p and Λ_I = ⊗̂_{v∈S_p}Λ_v. A weight is an O-algebra homomorphism κ: Λ_I → O; it corresponds to characters θ_{v,1}, θ_{v,2}: I_{F_v} → O^× (v ∈ S_p) with trivial reduction and θ_{v,1} = θ_{v,2} for v ∈ I; 𝔭_κ = ker κ. κ is classical if there are integers k_v ≥ l_v ≥ 2 with θ_{v,1} = ε^{(k_v+l_v)/2−2}, θ_{v,2} = ε^{(k_v−l_v)/2}, and l_v = 2 for v ∈ I; then k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1), and ω^κ is the automorphic vector bundle of weight (k_v, l_v)_v. κ_2 is the classical weight k_v = l_v = 2 for all v. For I = ∅, κ_reg is a sufficiently regular classical weight, for example θ_{v,1} = ε^{2N(p−1)}, θ_{v,2} = ε^{N(p−1)} for N large, chosen so that the classicality and automorphic-description theorems apply in weight κ_reg.

**Hypotheses and conventions**

- Λ_v as in the deformation problems; ε is the p-adic cyclotomic character restricted to inertia.

**Source match**

- **BCGP18**, Definition 7.8.8 and Remark 7.8.9, §7.8, p. 214. Defines weights as homomorphisms Λ_I → O, the classical ones through integers k_v ≥ l_v ≥ 2 with l_v = 2 on I, the weight κ_2 and a sufficiently regular κ_reg chosen so that the classicality results apply.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`
- `PadicMeasuresIwasawaAlgebras:L1`
- `HigherHidaAndColemanTheory:I3`
- `AutomorphicBundles:B4`
- `HilbertModularVarietiesAndShimuraCurves:H4`

**Proof plan**

1. Weights are points of Spec Λ_I, and characters of inertia with trivial reduction correspond to homomorphisms of the completed group rings (PadicMeasuresIwasawaAlgebras L1).
2. The congruence k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1) is the condition that both ε-powers have trivial reduction, i.e. are divisible by p−1.
3. κ_reg is fixed so that Theorem 3.10.1 (IntegralCoherentHeckeComplexes) and Theorem 6.6.5 (higher Hida/Coleman comparison) apply (Remark 7.8.9).

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.Weight | data | κ: Λ_I →ₐ[O] O, equivalently (θ_{v,1}, θ_{v,2})_v with θ_{v,1} = θ_{v,2} on I. |
| TauCeti.AbelianSurfaces.Weight.prime | projection | 𝔭_κ = ker κ, a prime of Λ_I with Λ_I/𝔭_κ ≅ O. |
| TauCeti.AbelianSurfaces.Weight.IsClassical | data | ∃ (k_v ≥ l_v ≥ 2), θ_{v,1} = ε^{(k_v+l_v)/2−2}, θ_{v,2} = ε^{(k_v−l_v)/2}, l_v = 2 on I. |
| TauCeti.AbelianSurfaces.weightTwo | constructor | κ_2, with k_v = l_v = 2 for all v. |
| TauCeti.AbelianSurfaces.weightReg | constructor | κ_reg(N), with θ_{v,1} = ε^{2N(p−1)} and θ_{v,2} = ε^{N(p−1)}. |
| TauCeti.AbelianSurfaces.Weight.IsClassical.congruence | relation | k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1). |
| TauCeti.AbelianSurfaces.Weight.IsClassical.bundle | other | A classical κ determines the automorphic bundle ω^κ of weight (k_v, l_v)_v on the Hilbert–Siegel variety. |
| TauCeti.AbelianSurfaces.Weight.restrict | functoriality | Weights of Λ_{I'} for I ⊆ I' are the weights of Λ_I with θ_{v,1} = θ_{v,2} for v ∈ I'; classical ones have l_v = 2 on I'. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.weightTwo_trivial | computation | κ_2 has θ_{v,1} = θ_{v,2} = 1, so 𝔭_{κ_2} is the augmentation ideal of Λ_I. |
| TauCeti.AbelianSurfaces.weightReg_integers | computation | κ_reg(N) is classical with (k_v, l_v) = (3N(p−1)+2, N(p−1)+2). |
| TauCeti.AbelianSurfaces.weight33_not_classical | non-example | (k_v, l_v) = (3,3) gives θ_{v,1} = ε, whose reduction is nontrivial for p ≥ 3; so (3,3) is not a weight of Λ_I. |
| TauCeti.AbelianSurfaces.weightTwo_in_every_I | degenerate | κ_2 is a weight of Λ_I for every I, since l_v = 2 everywhere. |

**Target acceptance checks**

- κ_2 is the augmentation of Λ_I.
- κ_reg = (3N(p−1)+2, N(p−1)+2)_v.

**Downstream uses**

- BCGP18, Theorem 7.9.4 (case I = ∅): density of the classical weights with k_v ≥ l_v ≥ 4 in Spec Λ_∅
- BCGP18, (7.13.3) and the spaces S^{I,𝔠}_κ: specialization at κ_2 and κ_reg
- BCGP18, Proposition 7.13.11: dimension counts in weight κ_reg

**Review:** Verified both cyclotomic exponents, the parity/congruence criterion and κ₂ versus regular weight; four tests detect convention errors. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The Hida–Hecke modules M^{χ,I,𝔠} and M^{χ,I,𝔠,Q} and their Hecke algebras

**Node:** `AbelianSurfacesPotentialModularity:AP.1/hecke-modules` · **Kind:** construction · **Implementation:** unchecked

**Planet:** Hida–Hecke modules

Assume Hypothesis 7.8.1. Let T̃ = ⊗'_{v∉S_p∪R∪{v_0}} O[GSp_4(F_v)//GSp_4(O_{F_v})] and T̃^Q its analogue away from Q. Let Q_v(X) = X^4 − T_{v,1}X^3 + (q_vT_{v,2} + (q_v^3+q_v)T_{v,0})X^2 − q_v^3T_{v,0}T_{v,1}X + q_v^6T_{v,0}^2 ∈ T̃[X], and m̃^{an} ⊂ T̃ the maximal ideal of ρ̄ (λ ∈ m̃^{an}, det(X − ρ̄(Frob_v)) ≡ Q_v(X)). T̃^I adjoins U_{v,0}, U_{Kli(v),1}, U_{v,2} (v ∈ I) and U_{v,0}, U_{v,1}, U_{v,2} (v ∈ I^c), and m̃^{I,𝔠} = (m̃^{an}, U_{v,0} − 1, U_{v,2} − ᾱ_vβ̄_v (v ∈ S_p), U_{Kli(v),1} − ᾱ_v − β̄_v (v ∈ I), U_{v,1} − 𝔠_v (v ∈ I^c)) (7.8.4); m̃^{I,𝔠,Q} likewise. With M^{•,I}_{K^p} the higher Hida complex of Theorem 4.6.1 at tame level K^p, put M^{χ,I,𝔠} = RHom^0_{Λ_I}(M^{•,I}_{K^p}, Λ_I) localized at m̃^{I,𝔠}, taken in χ-coinvariants for ∏_{v∈R}T(k(v)) and in coinvariants for T_{v,0} − q_v^{−2} (v ∉ S_p ∪ R ∪ {v_0}); and M^{χ,I,𝔠,Q} the same at level K_1^p(Q), localized also at the maximal ideals m̃_v (v ∈ Q) of O[T(F_v)/T(O_{F_v})_1] ⊂ H_1(v) (λ, U_{v,0} − 1 ∈ m̃_v, U_{v,1} ≡ ᾱ_{v,1}, U_{v,2} ≡ ᾱ_{v,1}ᾱ_{v,2}), a Λ_I[Δ_Q]-module. T^{χ,I,𝔠} (resp. T^{χ,I,𝔠,Q}) is the Λ_I-subalgebra of End_{Λ_I} generated by the image of T̃^I (resp. T̃^{I,Q}). For v ∈ I, Hensel's lemma and ᾱ_v ≠ β̄_v factor X^2 − U_{Kli(v),1}X + U_{v,2} = (X − α̃_v)(X − β̃_v) in T.

**Hypotheses and conventions**

- Q_v(X) is the reciprocal monic GSp_4 spin polynomial of SmoothRepresentationsOfLocalGroups SR.4 (gsp4-spin-polynomial, `SpinPolynomial.reciprocal`), whose generators T₁, T₂ are BCGP's T_{v,2}, T_{v,1}; its Hecke–Galois normalization is IntegralHeckeAndGaloisDeterminants IHG.3 (spin and dual-spin conventions). The positive Klingen Hecke algebra is SR.1; the normalized operators U_{v,i}, U_{Kli(v),1} at v | p with their ordinary projectors and the pro-v Iwahori Hecke algebras H_1(v) (BCGP §2.4) are owned by the GSp_4 Part II of ModularityAndLanglandsExtensions and SR.1.
- M^{•,I} and its Hecke action are owned by the higher Hida theory of HigherHidaAndColemanTheory (BCGP Theorem 4.6.1).

**Source match**

- **BCGP18**, §7.8 from the definition of T̃ to Lemma 7.8.6, with (7.8.4), pp. 212–214, and the opening paragraph of §7.9, p. 216. Defines the anaemic spherical Hecke algebra, the Hecke polynomial, the maximal ideals m̃^{I,𝔠}, the Λ_I- and Λ_I[Δ_Q]-modules obtained by RHom^0 duality from the higher Hida complexes at the relevant tame levels, and the Hecke algebras acting on them.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/tame-levels`
- `AbelianSurfacesPotentialModularity:AP.1/weights`
- `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`
- `HigherHidaAndColemanTheory:I3`
- `ModularityAndLanglandsExtensions:ML.4`
- `SmoothRepresentationsOfLocalGroups:SR.1`
- `SmoothRepresentationsOfLocalGroups:SR.4`
- `IntegralHeckeAndGaloisDeterminants:IHG.2`
- `IntegralHeckeAndGaloisDeterminants:IHG.3`
- `DeformationAndDerivedPatchingAlgebra:P7`
- `mathlib:Polynomial.Monic`

**Proof plan**

1. Localization at m̃^{I,𝔠} is defined on the perfect complex through a lift of the corresponding idempotent of the finite Λ_I-algebra of derived endomorphisms (Khare–Thorne, Lemma 2.12 and the discussion after it); this is the operator localization of Hecke images of complexes owned by IntegralHeckeAndGaloisDeterminants IHG.2.
2. RHom^0 duality (Lemma 7.8.5): for a perfect complex M^• bounded below by 0 and M = RHom^0_Λ(M^•, Λ), M ⊗_Λ k = H^0(M^• ⊗^L k)^*, M ⊗_Λ E = H^0(M^• ⊗^L E)^* for Λ → E, and M ⊗_Λ O = H^0(M^• ⊗^L E/O)^∨ (Lemma 7.8.6); owned by DeformationAndDerivedPatchingAlgebra P7.
3. None of these objects depends on 𝔠_v for v ∈ I; for v ∈ I the factorization follows from Hensel's lemma since ᾱ_v ≠ β̄_v.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.sphericalHecke | data | T̃ and T̃^Q. |
| TauCeti.AbelianSurfaces.heckePoly | data | Q_v(X) ∈ T̃[X]: the reciprocal monic spin polynomial of SmoothRepresentationsOfLocalGroups SR.4 evaluated at (q_v, T_{v,0}, T_{v,2}, T_{v,1}); monic of degree 4. |
| TauCeti.AbelianSurfaces.maxIdealAn | constructor | m̃^{an} ⊂ T̃ with det(X − ρ̄(Frob_v)) ≡ Q_v(X) mod m̃^{an} for v ∉ S_p ∪ R ∪ {v_0}. |
| TauCeti.AbelianSurfaces.maxIdeal | constructor | m̃^{I,𝔠} ⊂ T̃^I and m̃^{I,𝔠,Q} ⊂ T̃^{I,Q}, as in (7.8.4). |
| TauCeti.AbelianSurfaces.hidaModule | data | M^{χ,I,𝔠}, a finite Λ_I-module. |
| TauCeti.AbelianSurfaces.hidaModuleTW | data | M^{χ,I,𝔠,Q}, a finite Λ_I[Δ_Q]-module. |
| TauCeti.AbelianSurfaces.heckeAlgebra | data | T^{χ,I,𝔠} ⊂ End_{Λ_I}(M^{χ,I,𝔠}) and T^{χ,I,𝔠,Q} ⊂ End_{Λ_I}(M^{χ,I,𝔠,Q}), finite local Λ_I-algebras. |
| TauCeti.AbelianSurfaces.hidaModule_tensor_residue | compatibility | M ⊗_{Λ_I} k ≅ H^0(M^• ⊗^L k)^* and M ⊗_{Λ_I} E ≅ H^0(M^• ⊗^L_{Λ_I,κ} E)^* for a weight κ (Lemma 7.8.5). |
| TauCeti.AbelianSurfaces.hensel_factor | relation | For v ∈ I: X^2 − U_{Kli(v),1}X + U_{v,2} = (X − α̃_v)(X − β̃_v) in T^{χ,I,𝔠,Q} with α̃_v, β̃_v lifting ᾱ_v, β̄_v. |
| TauCeti.AbelianSurfaces.hidaModule_indep_I | characterisation | M^{χ,I,𝔠}, M^{χ,I,𝔠,Q} and their Hecke algebras do not depend on 𝔠_v for v ∈ I. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.heckePoly_constant_term | computation | At an eigensystem with T_{v,0} = q_v^{−2} (central character \|·\|^2), the constant term of Q_v(X) is q_v^6·q_v^{−4} = q_v^2, which is the constant term ν(ρ(Frob_v))^2 = q_v^2 of det(X − ρ(Frob_v)) for ρ with multiplier ε^{−1}. |
| TauCeti.AbelianSurfaces.emptyQ_module | degenerate | M^{χ,I,𝔠,∅} = M^{χ,I,𝔠}, with Λ_I[Δ_∅] = Λ_I. |
| TauCeti.AbelianSurfaces.maxIdeal_I | characterisation | For v ∈ I, U_{Kli(v),1} − ᾱ_v − β̄_v ∈ m̃^{I,𝔠} and m̃^{I,𝔠} is unchanged when 𝔠_v is switched between ᾱ_v and β̄_v. |
| TauCeti.AbelianSurfaces.dual_into_LambdaI | non-example | Keeping Λ_I as the base ring, replacing the target of RHom_{Λ_I} by Λ_I[Δ_Q] multiplies a nonzero dual rank by #Δ_Q when #Δ_Q > 1. By contrast RHom_{Λ_I[Δ_Q]}(C,Λ_I[Δ_Q]) is a valid equivalent dual: the coefficient-of-identity Frobenius pairing compares it with RHom_{Λ_I}(C,Λ_I). |

**Target acceptance checks**

- M^{χ,I,𝔠} ⊗_{Λ_I} k is dual to H^0 of the mod λ ordinary complex localized at m̃^{I,𝔠}.
- With empty Q the module M^{χ,I,𝔠,∅} is M^{χ,I,𝔠}.

**Downstream uses**

- BCGP18, Proposition 7.8.11: finite freeness and balancedness over Λ_I[Δ_Q]
- BCGP18, Theorem 7.9.4: T^{χ,I,𝔠,Q} receives R_{S_{χ,Q}^{I,𝔠}}
- BCGP18, §7.11: the modules M^1_N, M^χ_N patched
- BCGP18, §7.13: duality between the modules and the spaces S^{I,𝔠}_κ

**Review:** Distinguished changing only the dual target from duality over the group ring. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.8.11: freeness in defect 0 and balancedness in defect 1

**Node:** `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Freeness and balancedness of Hida modules

Assume Hypothesis 7.8.1, and let χ, 𝔠 and a Taylor–Wiles datum Q be as above. Then (1) M^{χ,∅,𝔠,Q} is a finite free Λ_∅[Δ_Q]-module; (2) if #I = 1, M^{χ,I,𝔠,Q} is a balanced Λ_I[Δ_Q]-module: it has a presentation by a square matrix over Λ_I[Δ_Q], equivalently it admits a square presentation; here it is H^0 RHom_S(C,S), where S = Λ_I[Δ_Q] and C is the localized perfect complex of amplitude [0,1] and Euler characteristic 0 (BCGP §2.10).

**Hypotheses and conventions**

- p ≥ 3 (used to split off the p-part of the class group acting on components).

**Source match**

- **BCGP18**, Proposition 7.8.10 and Proposition 7.8.11 with its proof, §7.8, pp. 214–216. Shows the Taylor–Wiles and Ihara-avoidance covers are finite étale torsors over the toroidal compactification, and deduces that the patched-to-be modules are finite free in defect zero and balanced in defect one.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `HigherHidaAndColemanTheory:I3`
- `HigherHidaAndColemanTheory:B7`
- `AutomorphicBundles:B5`
- `DeformationAndDerivedPatchingAlgebra:R03.5`
- `DeformationAndDerivedPatchingAlgebra:P7`
- `mathlib:Module.Free`

**Proof plan**

1. The complex M^{•,I}_{K_1^p(Q)} is perfect over Λ_I of amplitude [0, #I] (Theorem 4.6.1). By Proposition 7.8.10 (owned by the Hilbert–Siegel Part II), the cover X_{K_pK_1^p(Q,R)} → X_{K_pK_0^p(Q,R)} of toroidal compactifications is finite étale with group ∏_{v∈Q∪R}T(k(v)), so the complex is represented by flat complete Λ_I[∏T(k(v))]-modules, and the semi-local form of Lemma 4.6.22 makes it perfect over Λ_I[∏T(k(v))] of amplitude [0, #I]; hence its χ-part is perfect over Λ_I[Δ_Q].
2. Localization at m̃^{I,𝔠} preserves perfectness and amplitude.
3. Central character: with C = F^×∖A_F^×/U = C_p ⊕ C^p, M̃^{χ,I,𝔠,Q} ≅ M^{χ,I,𝔠,Q} ⊗_O O[C_p] because C^p acts through eigenvalues fixed mod m and C_p permutes components freely; this uses p ≠ 2.
4. Part (1) follows since the amplitude is [0,0]. For (2), by Lemma 2.10.2 it suffices that the localized complex of amplitude [0,1] has Euler characteristic 0, which is checked modulo primes of Λ_I using Theorem 6.6.5 and Corollary 3.10.5 (in regular weight, H^1 and H^0 of the localized coherent cohomology have the same dimension when the defect is one). The module in the proposition is the degree-zero cohomology of the dual complex, so its presentation is a cokernel of a square matrix. H⁰(C) itself would be a kernel and is not the asserted balanced module.

**Target acceptance checks**

- For #I = 0 and Q = ∅ the statement says M^{χ,∅,𝔠} is finite free over Λ_∅.
- For #I = 1 the Λ_I[Δ_Q]-module has a square presentation matrix.

**Review:** Corrected the cohomological degree: use the dual complex, not H⁰ of the original [0,1] complex. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.2 — Galois representations on ordinary Hida–Hecke algebras

#### Proposition 7.9.1: the doubling surjections M^{χ,I,𝔠} ⊗ Λ_{I'} → M^{χ,I',𝔠}

**Node:** `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Doubling surjections

Assume Hypothesis 7.8.1. For I ⊆ I' ⊆ S_p let Λ_I → Λ_{I'} be the surjection cutting out θ_{v,1} = θ_{v,2} for v ∈ I'. For each choice 𝔠 there are natural surjections M^{χ,I,𝔠} ⊗_{Λ_I} Λ_{I'} → M^{χ,I',𝔠} and M^{χ,I,𝔠,Q} ⊗_{Λ_I} Λ_{I'} → M^{χ,I',𝔠,Q}. They commute with all Hecke operators away from I' ∖ I, and for v ∈ I' ∖ I they commute with U_{v,0}, U_{v,2} and intertwine U_{v,1} on the source with the lift 𝔠̃_v of 𝔠_v on the target. Writing 𝔠'_v for the other unit eigenvalue, (U_{v,1} − 𝔠̃'_v)(U_{v,1} − 𝔠̃_v) = 0 (7.9.2).

**Hypotheses and conventions**

- Hypothesis 7.8.1 (in particular ᾱ_v ≠ β̄_v for v ∈ S_p).

**Source match**

- **BCGP18**, Proposition 7.9.1 with (7.9.2) and (7.9.3), §7.9, pp. 216–218. Constructs surjections from the Hida modules with Iwahori level at the places of I' ∖ I to those with Klingen level there, intertwining U_{v,1} with the chosen unit root, and reduces surjectivity to the injectivity statement of the doubling theorem.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`
- `HigherHidaAndColemanTheory:X8`
- `HigherHidaAndColemanTheory:I3`
- `DeformationAndDerivedPatchingAlgebra:P7`

**Proof plan**

1. Reduce to I' = I ∪ {v}. The map is τ∘U_{v,1} − 𝔠̃'_v∘τ, with τ induced by restriction from the Klingen-level ordinary locus at v to the Iwahori-level one (𝔛^{G_1,I}_{K,Kli(p^∞)} ⊂ 𝔛^{G_1,I'}_{K,Kli(p^∞)}).
2. Intertwining: Lemma 4.5.17 gives U_{v,1}(U_{Kli(v),1} − U_{v,1}) = U_{v,2} on the ordinary locus at v, i.e. (7.9.2), and Hensel's lemma separates the two roots.
3. Surjectivity: by Nakayama and Lemma 7.8.5(1) it reduces to injectivity on the special fibre of the weight 2 map (U_{v,1} − 𝔠'_v): e(U^{I'})H^0(X^{I',G_1}_1, ω^2(−D))_{m̃^{I',𝔠}} → e(U^I)H^0(X^{I,G_1}_1, ω^2(−D))_{m̃^{I,𝔠}} (7.9.3), which is the doubling theorem (Theorem 5.8.6 with Remark 5.8.7), owned with the higher Hida theory.

**Target acceptance checks**

- For I = I' the map is the identity.
- Composing for I ⊆ I' ⊆ I'' gives the map for I ⊆ I''.

**Review:** Verified direction of specialization and U-operator compatibility in Proposition 7.9.1; the Hilbert–Siegel doubling contract remains requested. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 7.9.4: Galois representations over the Hida–Hecke algebras

**Node:** `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Galois representations over Hida–Hecke algebras

Assume Hypothesis 7.8.1, with χ, I ⊆ S_p, 𝔠 and a (possibly empty) Taylor–Wiles datum Q. Extend the universal characters θ_v (v ∈ I) and θ_{v,1}, θ_{v,2} (v ∉ I) of §7.3 to G_{F_v} by Art_{F_v}(p) ↦ 1, and let λ_x be the unramified character with λ_x(Frob_v) = x. There is, up to strict conjugacy, a unique continuous ρ^{χ,I,𝔠,Q}: G_F → GSp_4(T^{χ,I,𝔠,Q}) which is a deformation of ρ̄ of type S_{χ,Q}^{I,𝔠}, such that R_{S_{χ,Q}^{I,𝔠}} → T^{χ,I,𝔠,Q} is a map of Λ_I[Δ_Q]-algebras, and: (1) for v ∉ S_p ∪ R ∪ {v_0} ∪ Q, det(X − ρ(Frob_v)) = Q_v(X); (2) for v ∈ I, ρ|_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ_{α̃_v}θ_v, λ_{β̃_v}θ_v, λ_{β̃_v}^{−1}θ_v^{−1}ε^{−1}, λ_{α̃_v}^{−1}θ_v^{−1}ε^{−1}) and vanishing (1,2) and (3,4) entries; (3) for v ∈ I^c, ρ|_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ_{U_{v,1}}θ_{v,1}, λ_{U_{v,2}/U_{v,1}}θ_{v,2}, λ_{U_{v,2}/U_{v,1}}^{−1}θ_{v,2}^{−1}ε^{−1}, λ_{U_{v,1}}^{−1}θ_{v,1}^{−1}ε^{−1}).

**Hypotheses and conventions**

- Hypothesis 7.8.1.

**Source match**

- **BCGP18**, Theorem 7.9.4 and its proof, §7.9, pp. 218–220. Constructs the GSp_4-valued representation over the Hida–Hecke algebra of type S_{χ,Q}^{I,𝔠}, with Hecke polynomial compatibility away from the bad places and the Klingen- and Borel-ordinary shapes at the places above p.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`
- `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`
- `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`
- `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`
- `AbelianSurfacesPotentialModularity:AP.1/weights`
- `ModularityAndLanglandsExtensions:ML.4`
- `HigherHidaAndColemanTheory:B7`
- `AutomorphicBundles:B5`
- `IntegralHeckeAndGaloisDeterminants:IHG.1`
- `LocalGaloisDeformationRings:R08.2`
- `DeformationAndDerivedPatchingAlgebra:P7`

**Proof plan**

1. Case I = ∅: M^{χ,∅,𝔠,Q} is finite free over Λ_∅ (Proposition 7.8.11), so it injects, T̃^{∅,Q}-equivariantly, into the product of its specializations M ⊗_{Λ_∅,κ} E over the classical weights with k_v ≥ l_v ≥ 4 and k_v ≡ l_v ≡ 2 or p+1 mod 2(p−1), which are scheme-theoretically dense in Spec Λ_∅. At such weights Lemma 7.8.5, the classicality Theorem 6.6.5 and Theorem 3.10.1 identify the specializations with ordinary cuspidal forms of regular weight, whose Galois representations (Theorem 2.7.2, with Propositions 2.4.13, 2.4.26, 2.4.28, 2.4.30 and Remark 2.4.31 for the local shapes) satisfy (1)–(3).
2. Glue these representations into a GSp_4(T)-valued representation as in Clozel–Harris–Taylor Proposition 3.4.4 (with Gee–Geraghty Lemma 7.1.1), using residual absolute irreducibility to pass from determinants to a representation (IntegralHeckeAndGaloisDeterminants IHG.1); check the type at v ∈ Q with Lemma 7.4.4.
3. General I: induct on #I through the doubling surjections, which identify U_{v,1} on the source with 𝔠̃_v on the target and so turn the Borel-ordinary shape (3) at v into the Klingen shape (2). Use both choices 𝔠_v = ᾱ_v and β̄_v: the common representation satisfies both refined Borel conditions, yielding the two-dimensional scalar-inertia plane.

**Target acceptance checks**

- For Q = ∅ the representation is a deformation of type S_χ^{I,𝔠}, giving R_{S_χ^{I,𝔠}} → T^{χ,I,𝔠}.
- At v ∈ I inertia acts on a two-dimensional subspace by θ_v; it acts trivially there after the weight-two specialization θ_v = 1.

**Review:** Uniqueness is for the deformation class. Both refinements give the Klingen shape, whose inertial character is universal θ_v. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Corollary 7.9.6: refined Galois representations of ordinary weight 2 forms

**Node:** `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary` · **Kind:** theorem · **Implementation:** unchecked

Let π be a cuspidal automorphic representation of GSp_4(A_F) of parallel weight 2, central character |·|^2, ordinary at every v | p, with p > 2 splitting completely in F. Then ρ_{π,p} of Theorem 1.8.17 (BCGP25) satisfies: (1) for finite v ∤ p with π_v unramified, ρ_{π,p}|_{G_{F_v}} is unramified with det(X − ρ_{π,p}(Frob_v)) = Q_v(X). If moreover ρ̄_{π,p} is vast and tidy, ρ̄_{π,p}|_{G_{F_v}} is p-distinguished weight 2 ordinary and the ordinary Hecke parameters satisfy ᾱ_v ≠ β̄_v for every v | p, then ρ_{π,p} is GSp_4-valued with (2) ν∘ρ_{π,p} = ε^{−1}; (3) WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for finite v ∤ p; (4) for v | p, ρ_{π,p}|_{G_{F_v}} is conjugate to an upper triangular representation with diagonal (λ_{α_v}, λ_{β_v}, λ_{β_v}^{−1}ε^{−1}, λ_{α_v}^{−1}ε^{−1}) and vanishing (1,2) and (3,4) entries. The residual ordinarity hypothesis is added to the printed statement: its proof needs it to apply Theorem 7.9.4.

**Hypotheses and conventions**

- p > 2 splits completely in the totally real field F; π as stated.
- For (2)–(4): ρ̄_{π,p} vast and tidy, p-distinguished weight 2 ordinary at every v | p, and ᾱ_v ≠ β̄_v.

**Source match**

- **BCGP18**, Corollary 7.9.6 with its proof, §7.9, pp. 220–221. States the Galois representations of ordinary parallel weight 2 cuspidal representations, GSp_4-valued with the Klingen-type ordinary shape at p under residual hypotheses, and proves them by solvable base change to a field where Hypothesis 7.8.1 holds.
- **BCGP25**, Theorem 1.8.17, §1.8, p. 13. The existence half without residual hypotheses, by eigenvariety interpolation.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`
- `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`
- `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`
- `ModularityAndLanglandsExtensions:ML.5`
- `ModularityAndLanglandsExtensions:ML.4`
- `PotentialModularityAndCompatibleSystems:R23.5`

**Proof plan**

1. If π is not of general type, ρ_{π,p} is reducible and (1) follows from the GL_1 and GL_2 cases (Lemma 2.9.1); (2)–(4) are vacuous because a reducible ρ̄ is not vast.
2. If π is of general type, Mok's Theorem 4.14 gives (1) and (3) with GL_4 values.
3. Choose a solvable totally real F'/F, linearly disjoint from the fixed field of ker ρ̄_{π,p}, in which p splits completely, which trivializes ρ̄ at the places above the ramification of π and makes q_w ≡ 1 mod p (mod 9 if p = 3) there, and over which the base change of π has Iwahori-fixed vectors everywhere (Mok, Proposition 4.13). This repairs the printed proof, which arranges only the last two properties: Hypothesis 7.8.1(4)(a) and (5)(c) need the first two.
4. Hypothesis 7.8.1 then holds over F' (its clause (3) is the added residual ordinarity), and Theorem 7.9.4 with I = S_p, χ = 1, Q = ∅ gives the GSp_4-valued representation with the shape (4) over F'; (4) over F follows since p splits in F' and the local representations at v | p are unchanged. Compare with Theorem 1.8.17, which gives the same ρ_{π,p} without the residual hypotheses.

**Target acceptance checks**

- The diagonal characters at v | p are unramified (λ_{α_v}, λ_{β_v}), sharper than the potentially unramified ones of Theorem 1.8.17.
- Used at v | p in Corollary 8.2.2 and in the proof of Lemma 8.3.2.

**Review:** Verified the added residual ordinary hypotheses and repaired solvable base change in Corollary 7.9.6; no general de Rham claim is inserted. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.9.8: Δ_Q-coinvariants of the Taylor–Wiles modules

**Node:** `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent` · **Kind:** theorem · **Implementation:** unchecked

Assume Hypothesis 7.8.1, with χ, I, 𝔠 and a Taylor–Wiles datum Q. The natural map M^{χ,I,𝔠,Q} → M^{χ,I,𝔠} induces an isomorphism (M^{χ,I,𝔠,Q})_{Δ_Q} ≅ M^{χ,I,𝔠}.

**Hypotheses and conventions**

- q_v ≡ 1 mod p for v ∈ Q and p > 2, so [GSp_4(O_{F_v}) : Iw(v)] = (q_v+1)^2(q_v^2+1) is a unit.

**Source match**

- **BCGP18**, Proposition 7.9.8 with (7.9.9), (7.9.10) and Lemma 7.9.7, §7.9, pp. 221–223. Proves that Δ_Q-coinvariants of the Taylor–Wiles module recover the module at the original level, after Khare–Thorne, using the torsor structure of the cover, mod p Iwahori–Hecke identities and a Nakayama lemma for complexes.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`
- `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`
- `AutomorphicBundles:B5`
- `ModularityAndLanglandsExtensions:ML.4`
- `HilbertModularVarietiesAndShimuraCurves:H4`
- `DeformationAndDerivedPatchingAlgebra:P7`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Proof plan**

1. Apply derived torsor descent and the mod-p Iwahori–Hecke comparison at the partial Hecke localization. These are complex-level comparisons. The final anaemic localization is compared only after taking H⁰ RHom, which is the module in the statement.
2. (7.9.9): (M^{•,I}_{K_1^p(Q)})^{∏_{v∈Q}T(k(v))} ≅ M^{•,I}_{K_0^p(Q)} in the derived category, since the level-K_1^p(Q) complex is perfect over Λ_I[∏T(k(v))] and the cover is a torsor (Proposition 7.8.10).
3. For the partial localization, apply Pilloni’s Nakayama lemma for complexes (Lemma 7.9.7) and the mod-p Iwahori–Hecke identities of Lemmas 2.4.36–2.4.37; the level index is a unit. For the last anaemic localization, apply uniqueness of the maximal ideal in the support of H⁰ RHom, from local–global compatibility and Chebotarev. Uniqueness on H⁰ does not establish an all-degree quasi-isomorphism at this last step.

**Target acceptance checks**

- For Q = ∅ the statement is the identity.
- It supplies the hypothesis M_N ⊗_{S_N} O ≅ M_0 of the abstract patching criterion.

**Review:** Separated complex-level torsor/partial-Hecke descent from the final H⁰-dual anaemic localization. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.3 — Patching in defect zero and one

#### The patched objects S_∞, R_∞^{·,I,𝔠}, M_∞^{·,I,𝔠} and the dimension identity

**Node:** `AbelianSurfacesPotentialModularity:AP.3/patching-datum` · **Kind:** construction · **Implementation:** unchecked

**Planet:** Patched modules in defect zero and one

Assume Hypothesis 7.8.1; enlarge E to contain μ_p (μ_9 if p = 3) and, for v ∈ R, fix χ_v = (χ_{v,1}, χ_{v,2}) nontrivial, trivial mod λ, with χ_{v,1} ≠ χ_{v,2}^{±1}; the superscript 1 means χ = 1. Put q = h^1(F_S/F, ad^0ρ̄(1)), g = 2q − 4[F:Q] + #S − 1, Δ_∞ = Z_p^{2q}, and S_∞ = 𝒯[[Δ_∞]], where 𝒯 is the framing ring of S over Λ (a power series ring in 11#S − 1 variables); a is its augmentation ideal. For N ≥ 1 let Q_N be the Taylor–Wiles data of Corollary 7.6.3 with Δ_N = ∏_{v∈Q_N}k(v)^×(p)^2 and a surjection Δ_∞ ↠ Δ_N with kernel in (p^NZ_p)^{2q}. Let R^{1,I,𝔠,loc} = (⊗̂_{v∈I}R_v^P) ⊗̂ (⊗̂_{v∈I^c}R_v^{B,𝔠_v}) ⊗̂ (⊗̂_{v∈R}R_v^1) ⊗̂ R_{v_0}^□, R^{χ,I,𝔠,loc} the same with R_v^{χ_v}, and R_∞^{·,I,𝔠} power series rings in g variables over these. For #I ≤ 1 the abstract patching criterion (DeformationAndDerivedPatchingAlgebra; BCGP Proposition 7.10.1 in the form with ideals I_N = ker(S_∞ → 𝒯[Δ_N]) contained in open decreasing ideals) applied to R_N = R_{S_{·,Q_N}^{I,𝔠}} ⊗̂ 𝒯 and M_N = M^{·,I,𝔠,Q_N} ⊗̂ 𝒯 produces: Λ_I-algebra maps S_∞ → R_∞^{·,I,𝔠}; finite S_∞-modules M_∞^{·,I,𝔠}, free if #I = 0 and balanced if #I = 1, with M_∞/a ≅ M^{·,I,𝔠}; actions R_∞ → End_{S_∞}(M_∞) compatible with R^{·,I,𝔠}; and compatible identifications of the 1- and χ-versions modulo λ. Writing R' for the maximal O-flat quotient, (R_∞^{1,I,𝔠})' and (R_∞^{χ,I,𝔠})' are equidimensional with dim (R_∞^{·,I,𝔠})' = dim S_∞ − #I (7.11.1).

**Hypotheses and conventions**

- #I ≤ 1 for the patching; the formal constructions make sense for every I.
- The paper prints R_N^{1,∞,𝔠} and R_N^{χ,∞,𝔠} where R_N^{1,I,𝔠} and R_N^{χ,I,𝔠} are meant.

**Source match**

- **BCGP18**, §7.11 with (7.11.1), pp. 224–226. Sets up the patching data (auxiliary characters at R, the ring S_∞, Taylor–Wiles data, local and global deformation rings), applies the abstract patching proposition to obtain the patched rings and modules for #I ≤ 1, and computes the dimension of the flat quotients of the patched deformation rings.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`
- `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`
- `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`
- `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`
- `GlobalGaloisDeformations:R04.3`
- `GlobalGaloisDeformations:R04.5`
- `LocalGaloisDeformationRings:L7`
- `LocalGaloisDeformationRings:R08.2`
- `DeformationAndDerivedPatchingAlgebra:P8`
- `DeformationAndDerivedPatchingAlgebra:R03.5`
- `mathlib:Module.Finite`
- `mathlib:IsLocalRing`
- `mathlib:ringKrullDim`

**Proof plan**

1. The surjections R_∞ → R_N ⊗̂_Λ 𝒯 come from Proposition 7.2.1 (global presentation over the local rings) and Corollary 7.6.3 (Taylor–Wiles data killing the dual Selmer group), owned by GlobalGaloisDeformations.
2. The hypotheses of the patching criterion are Theorem 7.9.4 (the R-action), Proposition 7.9.8 (coinvariants) and Proposition 7.8.11 (freeness, balancedness).
3. Dimension count: S_∞ is formally smooth over Λ_I of relative dimension 2q + 11#S − 1; by Propositions 7.3.4, 7.4.7, 7.4.8, 7.4.2 and Barnet-Lamb–Geraghty–Harris–Taylor Lemma 3.3, the flat quotients of the local rings are equidimensional, so (R_∞)' has relative dimension g + 10#S + 4[F:Q] − #I over Λ_I, which is dim S_∞ − #I.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.patchingRing | data | S_∞ = 𝒯[[Δ_∞]], augmented over Λ_I with augmentation ideal a. |
| TauCeti.AbelianSurfaces.patchedRing | data | R_∞^{1,I,𝔠} and R_∞^{χ,I,𝔠}: power series rings in g variables over the local rings R^{·,I,𝔠,loc}. |
| TauCeti.AbelianSurfaces.patchedModule | data | M_∞^{1,I,𝔠} and M_∞^{χ,I,𝔠}, finite S_∞-modules with R_∞-actions, for #I ≤ 1. |
| TauCeti.AbelianSurfaces.patchedModule_mod_aug | relation | M_∞^{·,I,𝔠}/a ≅ M^{·,I,𝔠}, compatibly with R_∞ → R^{·,I,𝔠}. |
| TauCeti.AbelianSurfaces.patchedModule_free | other | For #I = 0, M_∞ is finite free over S_∞; for #I = 1 it is balanced. |
| TauCeti.AbelianSurfaces.patched_mod_lambda | compatibility | M_∞^{1,I,𝔠}/λ ≅ M_∞^{χ,I,𝔠}/λ over R_∞^{1,I,𝔠}/λ ≅ R_∞^{χ,I,𝔠}/λ. |
| TauCeti.AbelianSurfaces.dim_flat_quotient | relation | dim (R_∞^{·,I,𝔠})' = dim S_∞ − #I, and (R_∞^{·,I,𝔠})' is equidimensional. |
| TauCeti.AbelianSurfaces.patchingRing_relDim | simp | S_∞ is formally smooth over Λ_I of relative dimension 2q + 11#S − 1. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.variables_count | computation | With [F:Q] = 1, #S = 3 (S_p, one place of R, v_0) and q = 4: g = 2·4 − 4 + 3 − 1 = 6 and S_∞ has relative dimension 2·4 + 11·3 − 1 = 40 over Λ_I. |
| TauCeti.AbelianSurfaces.dimension_identity_check | characterisation | The relative dimension of (R_∞)' over Λ_I, g + 10#S + 4[F:Q] − #I, equals (2q + 11#S − 1) − #I exactly because g = 2q − 4[F:Q] + #S − 1. |
| TauCeti.AbelianSurfaces.defect_zero_free | degenerate | For I = ∅ the patched module is free over S_∞ and dim (R_∞)' = dim S_∞. |
| TauCeti.AbelianSurfaces.defect_two_excluded | non-example | For #I = 2 the modules M^{χ,I,𝔠,Q} have amplitude [0,2] and are not covered by the balanced-module criterion; the construction is not applied there, and §8 reaches larger I by descent instead. |

**Target acceptance checks**

- M_∞^{·,∅,𝔠} is finite free over S_∞.
- M_∞^{1,I,𝔠}/λ ≅ M_∞^{χ,I,𝔠}/λ compatibly with R_∞^{1,I,𝔠}/λ ≅ R_∞^{χ,I,𝔠}/λ.

**Downstream uses**

- BCGP18, Proposition 7.11.2: maximal Cohen–Macaulayness of the patched modules
- BCGP18, Theorem 7.13.6: multiplicities via cycles of M_∞ over the components of Spec R_∞
- BCGP18, §1.2: patching with defect 0 and with defect 1

**Review:** Verified dimensions, mod-λ compatibility and defect bound; the already corrected open-containing-ideals patching form is retained (E24). All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.11.2: the patched modules are maximal Cohen–Macaulay

**Node:** `AbelianSurfacesPotentialModularity:AP.3/patched-mcm` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Maximal Cohen–Macaulay patched modules

Under Hypothesis 7.8.1, #I ≤ 1 and a choice 𝔠, the patched modules M_∞^{1,I,𝔠} and M_∞^{χ,I,𝔠} are maximal Cohen–Macaulay over the corresponding maximal O-flat patched deformation-ring quotients, provided their actions factor through those quotients. In defect zero this follows from freeness over S_∞. In defect one the factorization is an explicit additional hypothesis pending G-flatness; the printed unconditional inference has not been repaired.

**Hypotheses and conventions**

- #I ≤ 1. The defect-zero argument is unaffected; the defect-one conclusion is conditional on the extra factorization hypothesis.
- For defect one, assume the action on M_∞ factors through the maximal O-flat quotient (R_∞)′; O-flatness of M_∞ is a sufficient condition. Establishing this factorization is unresolved here (gap G-flatness, source issue E1). Balancedness alone does not supply it.

**Source match**

- **BCGP18**, Proposition 7.11.2 with its proof, §7.11, p. 226. The source asserts maximal Cohen–Macaulayness over the flat quotients by a depth/codimension argument. Its defect-one flat-quotient action is unproved; this node states the corrected conditional target and records G-flatness.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.3/patching-datum`
- `DeformationAndDerivedPatchingAlgebra:P9`
- `DeformationAndDerivedPatchingAlgebra:R03.3`
- `DeformationAndDerivedPatchingAlgebra:R03.5`

**Proof plan**

1. First establish the assumed action through (R_∞)′. The dimension estimate is for this quotient, not automatically the original Borel ring. Remark 7.3.17 leaves O-flatness of certain Borel rings open; a square presentation of M_∞ does not prove O-flatness. The following depth argument is conditional on resolving this step.
2. By (7.11.1) the support of M_∞ in Spec S_∞ has codimension at least #I.
3. Apply Calegari–Geraghty Lemma 6.2 (DeformationAndDerivedPatchingAlgebra P9) to a resolution S_∞^r → S_∞^r of M_∞ when #I = 1 (it exists because M_∞ is balanced, Lemma 2.10.2), or to M_∞ itself when #I = 0: the codimension is exactly #I and depth_{S_∞}M_∞ = dim S_∞ − #I = dim (R_∞)'.
4. Depth over (R_∞)' is at least depth over S_∞, hence M_∞ is maximal Cohen–Macaulay over (R_∞)'.

**Target acceptance checks**

- In defect 0 the statement reduces to: M_∞ is free over S_∞ and dim S_∞ = dim (R_∞)'.
- In defect 1, the support of M_∞ in Spec S_∞ has codimension exactly 1.

**Review:** Exposed extraction E125 as an unresolved defect-one flat-quotient action gap rather than asserting an unproved repair. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.4 — Ihara avoidance and multiplicities

#### Hypothesis 7.13.1 on ρ and the levels K^{p,Iw}, K^{p,Iw_1}

**Node:** `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses` · **Kind:** definition · **Implementation:** unchecked

A continuous ρ: G_F → GSp_4(O) satisfies Hypothesis 7.13.1 if: (1) F is totally real and p ≥ 3 splits completely in F; (2) ν∘ρ = ε^{−1}; (3) ρ|_{G_{F_v}} is pure for every finite v; (4) for v ∈ S_p, ρ|_{G_{F_v}} is p-distinguished weight 2 ordinary with unit eigenvalues α_v, β_v ∈ E; (5) there is a finite set R of places prime to p with ρ unramified outside R ∪ S_p and, for v ∈ R, q_v ≡ 1 mod p (mod 9 if p = 3), ρ̄|_{G_{F_v}} trivial and ρ|_{G_{F_v}} with only unipotent ramification; (6) there is an ordinary cuspidal π of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ̄_{π,p} ≅ ρ̄, π_v unramified for v ∉ R ∪ S_p, π_v^{Iw(v)} ≠ 0 for v ∈ R ∪ S_p, and ρ_{π,p}|_{G_{F_v}} pure for all finite v; (7) ρ̄ is vast and tidy. Then Hypothesis 7.8.1 holds for ρ̄ (Remark 7.13.2), and one fixes an absolutely unramified v_0 ∉ S_p ∪ R with q_{v_0} ≢ 1 mod p, residue characteristic > 5, ρ unramified at v_0 and no ratio of eigenvalues of ρ(Frob_{v_0}) congruent to q_{v_0} mod λ. The levels are K^{p,Iw} = ∏K_v and K^{p,Iw_1} = ∏K'_v with K_v = Iw(v), K'_v = Iw_1(v) for v ∈ R, K_{v_0} = K'_{v_0} = Iw_1(v_0), and hyperspecial elsewhere (Definition 7.13.4).

**Hypotheses and conventions**

- Purity of a Weil–Deligne representation (Taylor–Yoshida) and the monodromy rank n(r,N) are owned by AutomorphicGaloisRepresentationsPartII AG2.5.

**Source match**

- **BCGP18**, Hypothesis 7.13.1, Remark 7.13.2, condition (8) and Definition 7.13.4, §7.13, pp. 229–231. Lists the hypotheses on a characteristic zero ρ under which the multiplicity theorem is proved, observes that they imply Hypothesis 7.8.1 for ρ̄, fixes the auxiliary place v_0 and defines the Iwahori and pro-v Iwahori tame levels.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`
- `AbelianSurfacesPotentialModularity:AP.1/tame-levels`
- `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Proof plan**

1. Remark 7.13.2: clauses (1)–(7) contain those of Hypothesis 7.8.1, with π giving its automorphic seed.
2. The auxiliary place v_0 exists by tidiness and Chebotarev as in the standing hypotheses.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.LiftingData | data | Hypothesis 7.13.1 for (F, p, ρ, R, π) as a structure. |
| TauCeti.AbelianSurfaces.LiftingData.toLiftingHypothesis | projection | Hypothesis 7.13.1 implies Hypothesis 7.8.1 for ρ̄ (Remark 7.13.2). |
| TauCeti.AbelianSurfaces.LiftingData.auxPlace | constructor | The auxiliary place v_0 of §7.13(8). |
| TauCeti.AbelianSurfaces.levelIw | data | K^{p,Iw}. |
| TauCeti.AbelianSurfaces.levelIw1 | data | K^{p,Iw_1}. |
| TauCeti.AbelianSurfaces.levelIw1_le_levelIw | relation | K^{p,Iw_1} ⊂ K^{p,Iw} with quotient ∏_{v∈R}T(k(v)). |
| TauCeti.AbelianSurfaces.LiftingData.unitRoots | other | The unit eigenvalues α_v, β_v ∈ E at v ∈ S_p, with ᾱ_v ≠ β̄_v. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.hyp_R_empty | degenerate | If ρ is unramified outside S_p, R = ∅ and K^{p,Iw} = K^{p,Iw_1} is hyperspecial away from v_0. |
| TauCeti.AbelianSurfaces.hyp_purity_needed | non-example | A ρ whose restriction at some v ∈ R has monodromy of non-maximal rank for its Weil representation is not pure and violates (3); the multiplicity d_ρ is then not determined by a unique generic point. |
| TauCeti.AbelianSurfaces.hyp_implies_78 | characterisation | From (1), (4), (5), (6), (7) one reads off Hypothesis 7.8.1(1)–(5) for ρ̄, with π as automorphic seed. |

**Target acceptance checks**

- Every ρ arising from an abelian surface with good ordinary reduction above p, with distinct unit roots, vast and tidy ρ̄ and a suitable automorphic seed satisfies the hypothesis after a solvable base change (proof of Theorem 8.4.1).
- K^{p,Iw_1} ⊂ K^{p,Iw} with quotient ∏_{v∈R}T(k(v)).

**Downstream uses**

- BCGP18, Theorem 7.13.6 and Theorem 8.2.1: standing hypotheses of the multiplicity and gluing theorems
- BCGP18, Corollary 8.2.2: ρ satisfying the hypothesis is modular
- BCGP18, proof of Theorem 8.4.1: a solvable base change puts ρ in this situation

**Review:** Repointed ordinary generic-fibre smoothness to the exact L7 supplier. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The primes 𝔭_x, 𝔭̃_{x'}^{I,𝔠} and the eigenspaces S^{I,𝔠}_{κ}

**Node:** `AbelianSurfacesPotentialModularity:AP.4/eigenspaces` · **Kind:** definition · **Implementation:** unchecked

Let x be a closed point of Spec R^{1,I,𝔠}[1/p] or Spec R^{χ,I,𝔠}[1/p] (E enlarged), with ρ_x: G_F → GSp_4(O); 𝔭_x is the kernel of R^{·,I,𝔠} → E (its quotient has dimension one; the paper calls it 'height one'), also pulled back to R^{·,I,𝔠,loc} and R_∞. x is smooth if R^{·,I,𝔠,loc}_{𝔭_x} is regular. For ρ' giving x', 𝔭̃^{an}_{x'} ⊂ T̃ is generated by the coefficients of Q_v(X) − det(X − ρ'(Frob_v)) (v ∉ R ∪ S_p ∪ {v_0}), and 𝔭̃^{I,𝔠}_{x'} = (𝔭̃^{an}_{x'}, U_{v,0} − 1, U_{v,2} − α'_vβ'_v (v ∈ S_p), U_{Kli(v),1} − α'_v − β'_v (v ∈ I), U_{v,1} − 𝔠'_v (v ∈ I^c)) ⊂ T̃^I (7.13.3), with α'_v, β'_v the unit eigenvalues of ρ' and 𝔠'_v the lift of 𝔠_v. For a classical weight κ, S^{I,𝔠}_{κ,K^{p,Iw}K_p(I)} is the subspace of (e(U^I)H^0(𝔛^{I,G_1}_{K_p(I)K^{p,Iw}}, ω^κ(−D))_{m̃^{I,𝔠}}) ⊗_O E killed by U_{v,0} − 1 (v ∈ S_p), U_{v,0} − q_v^{−2} (v ∈ R) and T_{v,0} − q_v^{−2} (v ∉ S_p ∪ R ∪ {v_0}); S^{I,𝔠}_{κ,K^{p,Iw_1}K_p(I),χ} is the χ-isotypic part for ∏_{v∈R}Iw(v)/Iw_1(v). By Lemma 7.8.5(2), (M^{1,I,𝔠}/𝔭_κ)[1/p] ≅ (S^{I,𝔠}_{κ,K^{p,Iw}K_p(I)})^∨ and, for ρ' of weight κ, (M_∞^{1,I,𝔠}/𝔭_{x'})[1/p] ≅ (M^{1,I,𝔠}/𝔭_{x'})[1/p] ≅ (S^{I,𝔠}_{κ,K^{p,Iw}K_p(I)}[𝔭̃^{I,𝔠}_{x'}])^∨, and likewise for χ.

**Hypotheses and conventions**

- The symbol 𝔠'_v here is the lift of 𝔠_v determined by ρ'; elsewhere (§7.3, (7.9.2), Proposition 7.13.9) 𝔠'_v is the other unit root.
- The paper's second display has M^{1,I,𝔠} as middle term where M^{χ,I,𝔠} is meant.

**Source match**

- **BCGP18**, §7.13 between Remark 7.13.2 and Proposition 7.13.5, with (7.13.3) and Definition 7.13.4, pp. 230–231. Defines the primes attached to points of the deformation rings, smooth points, the eigenspaces of p-adic Hilbert–Siegel forms at Iwahori and pro-v Iwahori level, and their duality with the (patched) Hida modules.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses`
- `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`
- `AbelianSurfacesPotentialModularity:AP.3/patching-datum`
- `AbelianSurfacesPotentialModularity:AP.1/weights`
- `HigherHidaAndColemanTheory:I3`
- `DeformationAndDerivedPatchingAlgebra:P7`

**Proof plan**

1. The primes are kernels of explicit maps; the eigenspaces are subspaces of finite-dimensional E-vector spaces cut out by Hecke operators.
2. The duality statements are Lemma 7.8.5(2) applied to M^{•,I} at the weight κ, together with M_∞/a ≅ M from the patching.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.pointPrime | data | 𝔭_x = ker(R^{·,I,𝔠} → E) for a closed point x of Spec R^{·,I,𝔠}[1/p]. |
| TauCeti.AbelianSurfaces.Point.IsSmooth | data | R^{·,I,𝔠,loc}_{𝔭_x} is regular. |
| TauCeti.AbelianSurfaces.heckePrime | constructor | 𝔭̃^{I,𝔠}_{x'} ⊂ T̃^I as in (7.13.3). |
| TauCeti.AbelianSurfaces.eigenspace | data | S^{I,𝔠}_{κ,K^{p,Iw}K_p(I)}[𝔭̃], a finite-dimensional E-vector space. |
| TauCeti.AbelianSurfaces.eigenspaceChi | data | S^{I,𝔠}_{κ,K^{p,Iw_1}K_p(I),χ}[𝔭̃], the χ-nebentypus version. |
| TauCeti.AbelianSurfaces.eigenspace_dual_patched | compatibility | (M_∞^{·,I,𝔠}/𝔭_{x'})[1/p] ≅ (M^{·,I,𝔠}/𝔭_{x'})[1/p] ≅ eigenspace^∨ for ρ' of weight κ. |
| TauCeti.AbelianSurfaces.heckePrime_le_maxIdeal | relation | 𝔭̃^{I,𝔠}_{x'} ⊂ m̃^{I,𝔠} when ρ' lifts ρ̄ with the unit roots lifting (ᾱ_v, β̄_v). |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.pointPrime_dim_one | characterisation | R^{·,I,𝔠}/𝔭_x is isomorphic to an order in E, of Krull dimension one; pulled back to the equidimensional catenary (R_∞)' its height is dim (R_∞)' − 1, which exceeds one, so 'height one' in the source means dimension one. |
| TauCeti.AbelianSurfaces.eigenspace_weight_two | computation | For κ = κ_2 and I = S_p, S^{S_p,𝔠}_{κ_2}[𝔭̃_x] is the space of ordinary parallel weight 2 Klingen-level forms on which the Hecke eigenvalues are those of ρ_x. |
| TauCeti.AbelianSurfaces.eigenspace_zero_off_support | degenerate | If x is not in the support of M^{1,I,𝔠}, then S^{I,𝔠}_{κ}[𝔭̃^{I,𝔠}_x] = 0. |
| TauCeti.AbelianSurfaces.cprime_two_meanings | non-example | Reading 𝔠'_v in (7.13.3) as the other unit root, as in (7.9.2), gives the wrong ideal: U_{v,1} − 𝔠'_v would cut out the eigenspace for the other stabilization. |

**Target acceptance checks**

- For #I ≤ 1 at a smooth point x′ in the support, maximal Cohen–Macaulayness makes M_∞ locally free, so the eigenspace dimension equals its generic rank on that component. This is not asserted at a singular point.
- For κ = κ_2 the spaces are the ordinary p-adic forms of parallel weight 2 that §8 glues.

**Downstream uses**

- BCGP18, Theorem 7.13.6 and Proposition 7.13.11: dimensions of the eigenspaces
- BCGP18, Theorem 8.2.1: the gluing theorem is stated for these spaces and their overconvergent versions
- BCGP18, Proposition 7.13.9: doubling injections between eigenspaces

**Review:** Restricted fibre-dimension/generic-rank equality to smooth supported points. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.13.5: Iwahori invariants of generic L-packets on components of Spec R_v^1

**Node:** `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Iwahori multiplicities of generic packets

Let v ∈ R and η_v a generic point of Spec R_v^1, the Ihara-avoidance ring of §7.4.5 with χ = 1. The rank n(η_v) of the monodromy operator is generically constant on the component Spec R_v^{1,η_v}; the set of y ∈ Spec R_v^{1,η_v}(Ē) whose L-packet L(ρ_y) contains a generic representation is nonempty; and d_{η_v} := Σ_{π∈L(ρ_y)} dim π^{Iw(v)} is independent of such y, with d_{η_v} = 8, 4, 4, 1 for n(η_v) = 0, 1, 2, 3. For η = (η_v)_{v∈R}, d_η := ∏_v d_{η_v}; for ρ as in Hypothesis 7.13.1, d_ρ := d_η for the unique generic point carrying the ρ|_{G_{F_v}} (unique by purity), so d_ρ = 8^{|R_0|}4^{|R_1|+|R_2|} with R_i = {v ∈ R : n(ρ|_{G_{F_v}}) = i}.

**Hypotheses and conventions**

- v ∈ R, so ρ̄|_{G_{F_v}} is trivial and q_v ≡ 1 mod p.

**Source match**

- **BCGP18**, Proposition 7.13.5 and the definitions of d_η and d_ρ after it, §7.13, pp. 231–232. Computes the total dimension of Iwahori invariants over the generic L-packets attached to points of each component of the Ihara-avoidance deformation ring in terms of the monodromy rank, and defines the multiplicities d_η and d_ρ.

**Direct prerequisites**

- `LocalGaloisDeformationRings:R08.2`
- `ModularityAndLanglandsExtensions:ML.4`
- `ModularityAndLanglandsExtensions:ML.0`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`

**Proof plan**

1. The components of Spec R_v^1 and their monodromy ranks are Proposition 7.4.7 and §§7.4.9–7.4.21, owned by LocalGaloisDeformationRings R08.2.
2. The generic L-packets with unipotent parameters are, by Roberts–Schmidt Tables A.1, A.7, A.15 and §1 of their newform paper (owned by the GSp_4 Part II of ModularityAndLanglandsExtensions): type I (n = 0), IIa (n = 1), IIIa or {VIa, VIb} (n = 2), IVa (n = 3); type Va does not occur since it never corresponds to a residually trivial representation.
3. Read off dim π^{Iw(v)} from the tables (8, 4, 4 and 1 respectively, the pair {VIa, VIb} contributing 3 + 1).

**Target acceptance checks**

- d_ρ = 1 when every v ∈ R has n(ρ|_{G_{F_v}}) = 3 (Steinberg type).
- d_ρ = 8^{#R} when ρ is unramified at every v ∈ R.

**Review:** Imported the existing ML.4 Gan–Takeda contract for local packet multiplicities. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.13.9: the doubling injection from Klingen to Iwahori level

**Node:** `AbelianSurfacesPotentialModularity:AP.4/doubling-injection` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Doubling injection

Let ρ = ρ_x satisfy Hypothesis 7.13.1. For I ⊆ S_p, w ∈ I^c, K^p as in Definition 7.13.4 and a choice 𝔠, the map (U_{w,1} − 𝔠'_w): S^{I∪{w},𝔠}_{κ_2,K^pK_p(I∪{w})}[𝔭̃_x^{I∪{w},𝔠}] → S^{I,𝔠}_{κ_2,K^pK_p(I)}[𝔭̃_x^{I,𝔠}] is injective, where 𝔠'_w is the unit eigenvalue of ρ_x at w not reducing to 𝔠_w.

**Hypotheses and conventions**

- Hypothesis 7.13.1; 𝔠'_w has the meaning of §7.3 and (7.9.2).

**Source match**

- **BCGP18**, Proposition 7.13.9 with its proof, §7.13, p. 233. Shows that U_{w,1} minus the other unit root maps the Klingen-level eigenspace at w injectively into the Iwahori-level eigenspace, by the injectivity of (7.9.3).

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`
- `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`
- `HigherHidaAndColemanTheory:X8`

**Proof plan**

1. By (7.9.2) the image of U_{w,1} − 𝔠'_w is killed by U_{w,1} minus the lift of 𝔠_w, so the map lands in the target.
2. Reduce to O-coefficients and then to the injectivity of (7.9.3) at w, proved in Proposition 7.9.1 from the doubling theorem (Theorem 5.8.6, owned with the higher Hida theory).

**Target acceptance checks**

- Composed with the inclusion from Klingen to Iwahori level, it realizes two copies of the Klingen eigenspace inside the Iwahori eigenspace (one for each choice at w).
- Used for the upper bound in Theorem 7.13.6 and repeatedly in §8.

**Review:** Verified Proposition 7.13.9 injection and its unit-root choice; it is used as an upper bound in the multiplicity theorem. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 7.13.11: dimensions of eigenspaces in regular weight and in weight κ_2

**Node:** `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions` · **Kind:** theorem · **Implementation:** unchecked

In the setting of the proof of Theorem 7.13.6, let ρ_reg be a point of weight κ_reg in the support of M^{1,∅,𝔠}/𝔭_{κ_reg} on the same component of R_∞^{1,∅,𝔠} as ρ, ρ^χ_reg a point of weight κ_reg in the support of M^{χ,∅,𝔠}/𝔭_{κ_reg}, and π the representation of Hypothesis 7.13.1(6). Then dim_E S^{∅,𝔠}_{κ_reg,K^{p,Iw}K_p(∅)}[𝔭̃^{∅,𝔠}_{x_reg}] = 8d_ρ, dim_E S^{∅,𝔠}_{κ_reg,K^{p,Iw_1}K_p(∅),χ}[𝔭̃^{∅,𝔠}_{x^χ_reg}] = 8 and dim_E S^{I,𝔠}_{κ_2,K^{p,Iw}K_p(I)}[𝔭̃^{I,𝔠}_π] ≥ 8d_{ρ_{π,p}} (7.13.10); moreover there are automorphic π_reg, π^χ_reg of weight κ_reg and central character |·|^2 with ρ_{π_reg,p} ≅ ρ_reg and ρ_{π^χ_reg,p} ≅ ρ^χ_reg.

**Hypotheses and conventions**

- Hypothesis 7.13.1; Arthur's classification for GSp_4 in the conditional form carried by ModularityAndLanglandsExtensions ML.4.

**Source match**

- **BCGP18**, Proposition 7.13.11 with its proof, §7.13, pp. 234–235. Counts the dimensions of the regular-weight eigenspaces by the automorphic description of ordinary coherent cohomology, Arthur's classification and strong multiplicity one for GL_4, reducing to local counts of Iwahori and pro-v Iwahori invariants.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`
- `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`
- `HigherHidaAndColemanTheory:B7`
- `AutomorphicBundles:B5`
- `ModularityAndLanglandsExtensions:ML.4`
- `AutomorphicSpectralTheory:AS.2/isobaric-sum`
- `SmoothRepresentationsOfLocalGroups:SR.2`
- `LocalGaloisDeformationRings:R08.2`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`

**Proof plan**

1. By Theorems 6.6.5 and 3.10.1 the first space has dimension Σ_π dim (π^∞)^{K^{p,Iw}K_p(∅)} on the U-eigenspace, over cuspidal π of weight κ_reg, central character |·|^2, holomorphic at infinity, with ρ_{π,p} ≅ ρ_reg.
2. Such π are of general type (Lemma 2.9.1); strong multiplicity one for GL_4 (Jacquet–Shalika) and Theorem 2.9.3 rewrite the sum as (Σ_{π_{v_0}∈L(ρ_reg|_{G_{F_{v_0}}})} dim π_{v_0}^{Iw_1(v_0)})·∏_{v∈R}(Σ_{π_v∈L(ρ_reg|_{G_{F_v}})} dim π_v^{Iw(v)}).
3. Hyperspecial invariants are one-dimensional; at v ∈ S_p the ordinary contribution is one-dimensional (Propositions 2.4.24, 2.4.26); dim π_{v_0}^{Iw_1(v_0)} = 8 (Propositions 2.4.6, 2.4.3, 2.4.4 and the choice of v_0); at v ∈ R apply Proposition 7.13.5, using purity (Theorem 2.7.2(4)), genericity of the Weil–Deligne representation (Lemma 7.1.3) and Proposition 2.4.22.
4. For ρ^χ_reg each v ∈ R contributes 1 by Proposition 2.4.28; for π, (7.13.10) is its own contribution, which occurs by Theorem 3.10.1.

**Target acceptance checks**

- The factor 8 = |W| comes from the pro-v_0 Iwahori level at v_0 (Remark 7.13.7).
- The count carries the dependence of the whole argument on Theorem 2.9.3.

**Review:** Removed duplicate supplier prerequisites; source statement unchanged. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 7.13.6: the ρ-eigenspace has dimension 8d_ρ when #I ≤ 1

**Node:** `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Ihara avoidance multiplicity theorem

Assume Hypothesis 7.13.1 for ρ = ρ_x. For every I ⊆ S_p with #I ≤ 1 and every choice 𝔠, dim_E S^{I,𝔠}_{κ_2,K^{p,Iw}K_p(I)}[𝔭̃_x^{I,𝔠}] = 8d_ρ. The factor 8 = |W| comes from the level Iw_1(v_0) at the auxiliary place, where no Hecke condition is imposed (Remark 7.13.7).

**Hypotheses and conventions**

- Hypothesis 7.13.1.

**Source match**

- **BCGP18**, Theorem 7.13.6 and Remark 7.13.7 with the proof, §7.13, pp. 232–234. Proves that the weight 2 ordinary eigenspace attached to ρ at Iwahori level has dimension 8d_ρ for #I ≤ 1 by patching, the comparison of cycles in characteristic p for the two Ihara-avoidance problems and the regular-weight dimension counts.
- **Stacks080T**, Lemma 10.41.12, Tag 080T, §10.41; unpaginated HTML. For a finite module flat over the base, generalizations lift in its support; use M_∞ over A=R/Ann(M_∞) and base S_∞.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.3/patched-mcm`
- `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`
- `AbelianSurfacesPotentialModularity:AP.4/doubling-injection`
- `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`
- `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`
- `DeformationAndDerivedPatchingAlgebra:P9`
- `DeformationAndDerivedPatchingAlgebra:R03.6`
- `DeformationAndDerivedPatchingAlgebra:R03.3`
- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `ModularityAndLanglandsExtensions:ML.4`

**Proof plan**

1. Case I = ∅: M_∞^{1,∅,𝔠} is maximal Cohen–Macaulay (Proposition 7.11.2), so the cycle comparison of Lemmas 7.12.2–7.12.3 (DeformationAndDerivedPatchingAlgebra P9, with cycles at R03.6) applies to M_∞^{1,∅,𝔠} and M_∞^{χ,∅,𝔠}. Since Spec (R_v^χ)' is irreducible for χ_{v,1}, χ_{v,2} ≠ 1 and χ_{v,1} ≠ χ_{v,2}^{±1} (Proposition 7.4.8), Spec (R_∞^χ)' is irreducible and the nonzero maximal Cohen–Macaulay M_∞^{χ,∅,𝔠} is supported on all of it; comparing the cycles of M_∞^1/λ ≅ M_∞^χ/λ then shows that M_∞^{1,∅,𝔠} is supported on every component of Spec (R_∞^1)'.
2. Put R = (R_∞^{1,∅,𝔠})′ and A = R/Ann_R(M_∞). Full support gives Spec A = Spec R as topological spaces; it does not imply nilpotents of R act trivially. A acts faithfully and is finite over S_∞, since it embeds in End_{S_∞}(M_∞), with M_∞ finite free and nonzero over S_∞. Apply Stacks Project Lemma 10.41.12 (Tag 080T) to S_∞→A and the finite A-module M_∞, which is flat over S_∞ and has full support over A. This makes Spec A → Spec S_∞ generalizing, and its image is all of Spec S_∞. Lift regular-weight generizations on the appropriate components. Do not infer that A is flat merely because it is torsion-free.
3. Proposition 7.13.11 gives the dimensions 8d_ρ and 8 at these points; Lemma 7.13.8 (generic rank on smooth points, DeformationAndDerivedPatchingAlgebra R03.3) applies at smooth points (purity, Theorem 2.7.2, Lemmas 7.1.3 and 7.3.18) and transports 8d_ρ to x, giving d'_η = d_ρ with Lemma 7.12.3.
4. Case #I = 1: the same argument at the component of π gives d'_{η_π} = d_{ρ_{π,p}}; with (7.13.10) and Lemmas 7.12.3 and 7.13.8 it gives dim ≥ 8d_ρ, and the doubling injection (Proposition 7.13.9) bounds the dimension by that of the I = ∅ space, 8d_ρ.

**Target acceptance checks**

- For I = ∅ and every choice 𝔠 the four spaces of §8.1 (two places) all have dimension 8d_ρ.
- In particular the eigenspace is nonzero, so ρ is the Galois representation of a p-adic ordinary weight 2 form at every level I with #I ≤ 1.

**Review:** Replaced the unjustified faithful R_red-action by R/Ann(M), using the flat module criterion for generalizing maps. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.5 — Gluing, étale descent and the modularity lifting theorems

#### Lemmas 8.2.3 and 8.2.5: analytic continuation and étale descent of the glued forms

**Node:** `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent` · **Kind:** theorem · **Implementation:** unchecked

Setting: the inductive step of Theorem 8.2.1, with #I ≥ 2, I = J ⊔ {v_1, v_2}, the choice 𝔠 fixed on J ∪ I^c, and the 8d_ρ-dimensional overconvergent eigenspaces V_{𝔠_1,𝔠_2} (Iwahori level at v_1, v_2), V_{α_1+β_1,𝔠_2} (Klingen at v_1) and V_{𝔠_1,α_2+β_2} (Klingen at v_2) given by the inductive hypothesis. For (ε_v) let 𝒳((ε_v)) be the open where deg H_v ≥ 1 − ε_v (v ∈ I, H_v the order-p subgroup of the Klingen structure) and deg L_v ≥ 2 − ε_v (v ∈ I^c, L_v the rank-p^2 isotropic subgroup of the Iwahori structure), with Fargues' degree; 𝒳^{mult,†} = lim_{ε→0+}𝒳((ε_v)), 𝒳^{mult,‡} the same limit over places other than v_1, v_2, and 𝒴 ⊂ 𝒳 the good reduction loci. Lemma 8.2.3: elements of V_{𝔠_1,𝔠_2} extend to 𝒳^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε, d^L_1 > 1, d^L_2 > 1}_{Iw(v_1,v_2)} for some ε > 0, and the Klingen-level spaces extend to the analogous regions with Iwahori level only at the other place. Lemma 8.2.5: on U_ε = 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε, d^L_2 > 1}_{Iw(v_1,v_2)} the forgetful map q_{v_2} is étale onto 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε}_{Iw(v_1)} and surjective for small ε; after shrinking ε every element of V_{α_1,α_2+β_2} descends along q_{v_2}. With the isomorphism (U_{v_1,1} − β_1): V_{α_1+β_1,α_2} ⊕ V_{α_1+β_1,β_2} ≅ V_{α_1,α_2} ⊕ V_{α_1,β_2} (8.2.4), the preimage of V_{α_1,α_2+β_2} is an 8d_ρ-dimensional space of eigenforms of Klingen level at v_1 and v_2 descending to 𝒴^{mult,‡, d^H_1 ≥ 1−ε, d^H_2 ≥ 1−ε}.

**Hypotheses and conventions**

- The forms are ordinary, hence of finite slope for U_{w,1}.

**Source match**

- **BCGP18**, Lemmas 8.2.3 and 8.2.5 with (8.2.4) and (8.2.6), §8.2, pp. 238–243. Extends the eigenforms supplied by the induction to explicit neighbourhoods defined by degrees of the canonical subgroups, and descends the forms of Klingen level at one place along the étale forgetful map at the other, producing Klingen level at both.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`
- `AbelianSurfacesPotentialModularity:AP.4/doubling-injection`
- `AbelianSurfacesPotentialModularity:AP.5/connected-components`
- `HigherHidaAndColemanTheory:C4`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`
- `AdicSpacesPartII:R3`
- `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`
- `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`

**Proof plan**

1. Analytic continuation in the I^c-directions: restriction is an isomorphism on U_{w,1}-finite slope parts (Lemma 6.5.18, owned with the higher Coleman theory), and Kassaei-style continuation one form at a time.
2. (8.2.4) is an isomorphism because each map U_{v_1,1} − β_1 is injective (doubling injection, Proposition 7.13.9) between spaces of the same dimension 8d_ρ.
3. Étale descent along q_{v_2}: compare the two pullbacks on the fibre product; connected components of the shrinking neighbourhoods are controlled by Poineau's theorem (8.2.6) and by Lemmas 8.2.7–8.2.11; Koecher's principle extends across the boundary. For the final descent, normalize the finite étale trace to obtain G from the descended (U_{v₁,1}−β₁)F; q_{v₂} commutes with the operator at v₁. The difference F−q_{v₂}*G is killed by this injective operator, hence vanishes (pp. 242–243).

**Target acceptance checks**

- For #I = 2 and S_p = {v_1, v_2} this is the argument sketched in §8.1.
- The descended space has the same dimension 8d_ρ as each of its inputs.

**Review:** Included the final normalized-trace and injectivity step, and its source pages. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemmas 8.2.7–8.2.11: connected components and the superspecial locus

**Node:** `AbelianSurfacesPotentialModularity:AP.5/connected-components` · **Kind:** theorem · **Implementation:** unchecked

(8.2.7) If S → T is a finite étale map of adic spaces of finite type over a field, the image of a connected component of S is a connected component of T. (8.2.8) Every connected component of the mod p locus Y^{I,=_{v_2}1}_{K^{p,Iw}K_p(I),1} (p-rank 1 at v_2) contains a point of Y^{I,=_{{v_1,v_2}}1}, and every connected component of Y^{I,=_{v_2}2} contains a point of Y^{I,=_{v_1}1,=_{v_2}2}; here I means H_v multiplicative for v ∈ I and the canonical ordinary Iwahori structure on I^c. (8.2.9) Every connected component of 𝒴^{mult,‡, d^H_1 = d^H_2 = 1, =_{v_2}1}_{Iw(v_1)} or 𝒴^{mult,‡, d^H_1 = d^H_2 = 1, =_{v_2}2}_{Iw(v_1)} contains a point non-ordinary at v_1. (8.2.10) For J ⊆ S_p and hyperspecial level at p, each irreducible component of Y^{=_{J^c}2,=_J1}_1 contains a superspecial point (in particular p-rank 0 at every place) in its closure. (8.2.11) At Iwahori level, for J ⊆ J' ⊆ S_p, every irreducible component of the Kottwitz–Rapoport stratum Y^{=_{J^c}2,=_J1,m-can}_1 contains a point of Y^{=_{(J')^c}2,=_{J'}1,m-can}_1 in its closure.

**Hypotheses and conventions**

- Y_{…,1} denotes the special fibre of the open Hilbert–Siegel variety; the Ekedahl–Oort and Kottwitz–Rapoport stratifications are owned by the Hilbert–Siegel Part II of HilbertModularVarietiesAndShimuraCurves.

**Source match**

- **BCGP18**, Lemmas 8.2.7, 8.2.8, 8.2.10 and 8.2.11, Corollary 8.2.9 and Remark 8.2.12, §8.2, pp. 243–246. Proves that connected components of the relevant ordinary and p-rank-one loci, at Klingen and Iwahori level, meet the smaller strata, using the Ekedahl–Oort and Kottwitz–Rapoport stratifications and Huber's results on finite étale maps.

**Direct prerequisites**

- `HilbertModularVarietiesAndShimuraCurves:H4`
- `AdicSpacesPartII:R2`
- `AdicSpacesPartII:R3`
- `HigherHidaAndColemanTheory:I3`

**Proof plan**

1. (8.2.7): such spaces have finitely many connected components, and finite étale maps are open and closed (Huber, Lemma 1.4.5 and Proposition 1.7.8; AdicSpacesPartII R2–R3).
2. (8.2.10): the Ekedahl–Oort stratification extends to the minimal compactification with affine open strata, and the superspecial locus does not meet the boundary; an affine stratum of positive dimension has a smaller stratum in its closure.
3. (8.2.11): induction along the Kottwitz–Rapoport strata at Iwahori level (Remark 8.2.12 records that a quasi-affineness statement for those strata on the minimal compactification would shorten this; no reference for it is available).
4. (8.2.8): the canonical section s of the projection from Iwahori level (L_w = 𝒢_w[F]) identifies the KR strata with the p-rank strata at level K_p(I), and density of the generic p-rank strata (§4.1) finishes; (8.2.9) follows by taking tubes (connectedness of tubes of connected components of the special fibre).

**Target acceptance checks**

- Over a single place (F = Q) the statements reduce to closure relations of the p-rank strata of the Siegel threefold.
- They are used only to make the étale descent of Lemma 8.2.5 land on every connected component.

**Review:** Superspecial implies p-rank zero; the converse is not used. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 8.2.1: the ρ-eigenspace has dimension 8d_ρ for every I

**Node:** `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Gluing by étale descent

Assume ρ satisfies Hypothesis 7.13.1. For every I ⊆ S_p and every choice 𝔠, dim_E S^{I,𝔠}_{κ_2,K^{p,Iw}K_p(I)}[𝔭̃_x^{I,𝔠}] = dim_{C_p} S^{I,𝔠,†}_{κ_2,K^{p,Iw}K_p(I)}[𝔭̃_x^{I,𝔠}] = 8d_ρ, where S^{I,𝔠,†} = e(U^I)H^0(𝒳^{G_1,mult,†}_{K^{p,Iw}K_p(I)}, ω^2(−D)) ∩ (S^{I,𝔠}_{κ_2} ⊗_E C_p), the intersection taken inside e(U^I)H^0(𝒳^{G_1,I}_{K^{p,Iw}K_p(I)}, ω^2(−D)) via the injective restriction from the dagger space.

**Hypotheses and conventions**

- Hypothesis 7.13.1.

**Source match**

- **BCGP18**, Theorem 8.2.1 and its proof, §8.2, pp. 237–243. Extends the multiplicity theorem from #I ≤ 1 to all I by induction on #I, the upper bound coming from doubling and the lower bound from analytic continuation and étale descent.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`
- `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`
- `AbelianSurfacesPotentialModularity:AP.5/connected-components`
- `AbelianSurfacesPotentialModularity:AP.4/doubling-injection`
- `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`
- `HigherHidaAndColemanTheory:B7`

**Proof plan**

1. Induction on #I. For #I ≤ 1: Theorem 7.13.6 and Theorem 6.6.4 (for #I ≤ 1 the ordinary overconvergent complex is the specialized Hida complex, so ordinary classes are overconvergent).
2. Upper bound for every I: restriction from S^{I,𝔠,†} is injective, and repeated doubling injections (Proposition 7.13.9) bound dim S^{I,𝔠}_{κ_2}[𝔭̃] by the I = ∅ dimension 8d_ρ.
3. Lower bound for #I ≥ 2: write I = J ⊔ {v_1, v_2}; the inductive hypothesis for J, J ∪ {v_1}, J ∪ {v_2} supplies the spaces V_{·,·}; Lemmas 8.2.3 and 8.2.5 produce an 8d_ρ-dimensional space of overconvergent eigenforms of Klingen level at v_1 and v_2.

**Target acceptance checks**

- For I = S_p the theorem gives a nonzero space of ordinary overconvergent Klingen-level forms at every place above p, which Theorem 6.5.8 makes classical.
- The dimension 8d_ρ does not depend on I.

**Review:** Extended the gluing proof locator through its end on p. 243. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Corollary 8.2.2: a representation satisfying Hypothesis 7.13.1 is modular

**Node:** `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Automorphy of ρ under Hypothesis 7.13.1

Suppose ρ satisfies Hypothesis 7.13.1. Then ρ is modular: there is an ordinary cuspidal automorphic π' of GSp_4(A_F) of parallel weight 2 and central character |·|^2 with ρ_{π',p} ≅ ρ and WD(ρ|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'_v ⊗ |ν|^{−3/2}) for every finite v.

**Hypotheses and conventions**

- Hypothesis 7.13.1.

**Source match**

- **BCGP18**, Corollary 8.2.2 and its proof, §8.2, pp. 237–238. Deduces from the gluing theorem at I = S_p, classicality and the automorphic description that ρ is the Galois representation of a cuspidal weight 2 form, and matches monodromy at the Ihara-avoidance places through purity and the parahoric-vector table.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem`
- `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`
- `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`
- `HigherHidaAndColemanTheory:C4`
- `AutomorphicBundles:B5`
- `ModularityAndLanglandsExtensions:ML.4`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`
- `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`

**Proof plan**

1. Theorem 8.2.1 with I = S_p gives nonzero overconvergent ordinary forms; the classicality Theorem 6.5.8 makes them classical and Theorem 3.10.1 identifies them with a cuspidal π' with ρ_{π',p} ≅ ρ.
2. Corollary 7.9.6 (and Theorem 1.8.17) gives the semisimplified compatibility at every finite v. At v | p the full compatibility follows from Corollary 7.9.6(4), Proposition 2.4.24 and Lemma 2.5.1 with purity (the printed proof treats only R); at v ∉ R ∪ S_p both sides are unramified; the monodromy at v ∈ R remains.
3. Since ρ|_{G_{F_v}} is pure, by the corrected Lemma 2.5.1 (AutomorphicGaloisRepresentationsPartII AG2.5: for dim 4 and symplectic N, maximal rank of N characterizes the pure structure) it suffices to show n(ρ|_{G_{F_v}}) ≤ n(π'_v). Roberts–Schmidt Table A.15 relates n(π_v) to vanishing of hyperspecial, paramodular, Klingen and Siegel parahoric invariants; if, say, n(ρ|_{G_{F_v}}) = 1 but π'_v had hyperspecial vectors, ρ would be a p-adic limit of regular-weight ρ_{π'',p} with n = 0 (Theorem 7.9.4 and Theorem 2.7.2), contradicting semicontinuity of the rank of N; the cases n = 2, 3 are the same.

**Target acceptance checks**

- The form π' has Iwahori-fixed vectors at the places of R and is unramified away from R ∪ S_p ∪ {v_0}.
- The full Frobenius-semisimple compatibility holds at every finite place, as Definition 9.1.8 requires.

**Review:** Repointed formal Koecher to C5 and retained its formal-model comparison gap. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemma 8.3.2: solvable descent of modularity

**Node:** `AbelianSurfacesPotentialModularity:AP.5/solvable-descent` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Solvable descent for Hilbert–Siegel forms

Let p > 2 split completely in the totally real F and F'/F be a solvable extension of totally real fields. Suppose ρ: G_F → GSp_4(Q̄_p) has (1) ν∘ρ = ε^{−1}; (2) ρ|_{G_{F_v}} p-distinguished weight 2 ordinary for v | p; (3) ρ̄ vast and tidy; (4) ρ|_{G_{F'}} irreducible and modular through an ordinary π' of GSp_4(A_{F'}) of parallel weight 2 and central character |·|^2 with full Weil–Deligne compatibility at every finite place of F'. Then ρ is modular through an ordinary π of GSp_4(A_F) of parallel weight 2 and central character |·|^2, with WD(ρ|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2}) for every finite v. For the variant used in Theorem 8.5.2, replace the multiplier by χε^{−1}, the central character by |·|²χ∘Art_F (in the paper’s reciprocity convention), and ordinarity by twisted ordinarity, with χ finite order and unramified above p.

**Hypotheses and conventions**

- p > 2 totally split in F; F'/F solvable, F' totally real.

**Source match**

- **BCGP18**, Lemma 8.3.1, Lemma 8.3.2 and its proof, §8.3, pp. 246–247. Proves that modularity descends along solvable extensions of totally real fields for representations with irreducible restriction, by cyclic descent for GL_4, Shahidi's nonvanishing of exterior square L-functions and Arthur's classification.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`
- `ModularityAndLanglandsExtensions:ML.4`
- `ModularityAndLanglandsExtensions:ML.5`
- `ArithmeticGaloisRepresentations:G7`
- `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`
- `ModularityAndLanglandsExtensions:ML.4/gl4-symplectic-descent`
- `ModularityAndLanglandsExtensions:ML.4/shahidi-exterior-square`

**Proof plan**

1. Reduce to F'/F cyclic of prime degree. ρ|_{G_{F'}} irreducible forces π' to be of general type, with cuspidal transfer Π' to GL_4(A_{F'}); cyclic descent (Arthur–Clozel, Chapter 3, Theorem 4.2) gives Π on GL_4(A_F) with BC_{F'/F}(Π) = Π'.
2. L^S(s, Π', ∧^2 ⊗ |·|^{−2}) = ∏_ψ L^S(s, Π, ∧^2 ⊗ |·|^{−2}ψ^{−1}) over characters ψ of A_F^×/F^×N(A_{F'}^×); the left side has a simple pole at s = 1, and by Shahidi all but at most one factor on the right are holomorphic and nonvanishing there, so one factor has a pole and Theorem 2.9.3 makes Π the transfer of a cuspidal π of GSp_4(A_F) of central character |·|^2ψ and parallel weight 2.
3. ρ_{π,p}|_{G_{F'}} ≅ ρ|_{G_{F'}}, so ρ_{π,p} and ρ differ by a character of Gal(F'/F); twist π to make them GL_4-isomorphic; Lemma 8.3.1 (uniqueness of the prescribed similitude character for a representation remaining irreducible over G_{F′}, as in Lemma 8.3.1; irreducibility over G_F alone permits self-twists, ArithmeticGaloisRepresentations G7) gives ν∘ρ_{π,p} = ε^{−1}, so π has central character |·|^2 and ρ_{π,p} ≅ ρ.
4. Corollary 7.9.6 gives the semisimplified compatibility; the monodromy is checked after base change, where it holds by (4).

**Target acceptance checks**

- It is the GSp_4 analogue of Lemma 1.3 of Barnet-Lamb–Geraghty–Harris–Taylor.
- For F' = F it is the identity.

**Review:** Specified the finite-character variant and the restricted-irreducibility hypothesis needed for multiplier uniqueness. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 8.4.1: the main modularity lifting theorem

**Node:** `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Main modularity lifting theorem

Suppose p ≥ 3 splits completely in the totally real F and ρ: G_F → GSp_4(Q̄_p) satisfies: (0) ρ is unramified outside a finite set of places; (1) ν∘ρ = ε^{−1}; (2) ρ̄ is vast and tidy; (3) ρ|_{G_{F_v}} is p-distinguished weight 2 ordinary for every v | p; (4) there is a cuspidal π of GSp_4(A_F) of parallel weight 2 and central character |·|^2, ordinary at every v | p, with ρ̄_{π,p} ≅ ρ̄; (5) ρ|_{G_{F_v}} and ρ_{π,p}|_{G_{F_v}} are pure for every finite v. Then ρ is modular: there is an ordinary π' of parallel weight 2 and central character |·|^2 with ρ_{π',p} ≅ ρ and WD(ρ|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'_v ⊗ |ν|^{−3/2}) for every finite v. Hypothesis (0) is not printed but the proof uses it; every application has ρ from an abelian surface or a compatible system, which satisfies it.

**Hypotheses and conventions**

- p ≥ 3 totally split in F; (0)–(5) as stated.

**Source match**

- **BCGP18**, Theorem 8.4.1 and its proof, §8.4, pp. 247–248. States the main modularity lifting theorem for GSp_4-valued representations with inverse cyclotomic multiplier, vast and tidy residual image, p-distinguished weight 2 ordinarity at p and an ordinary residually modular seed, and proves it by solvable base change to Hypothesis 7.13.1 and descent.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`
- `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`
- `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses`
- `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`
- `PotentialModularityAndCompatibleSystems:R23.1`
- `PotentialModularityAndCompatibleSystems:R23.5`
- `ModularityAndLanglandsExtensions:ML.5`
- `mathlib:NumberField.IsTotallyReal`

**Proof plan**

1. Choose a solvable totally real F'/F, linearly disjoint from the fixed field of ker ρ̄, in which p splits completely, such that at every place w above a v ∤ p where π_v or ρ is ramified, ρ̄|_{G_{F'_w}} is trivial, ρ|_{G_{F'_w}} has only unipotent ramification and q_w ≡ 1 mod p^2, and over which π has a base change π' with Iwahori-fixed vectors at every finite place (Mok, Proposition 4.13). The auxiliary-extension construction is owned by PotentialModularityAndCompatibleSystems R23.5; (0) makes the set of ramified places finite, so finitely many local conditions are imposed.
2. Then ρ|_{G_{F'}} satisfies Hypothesis 7.13.1 (vast and tidy is preserved by linear disjointness), so it is modular by Corollary 8.2.2.
3. ρ|_{G_{F'}} is irreducible since ρ̄|_{G_{F'}} is, and Lemma 8.3.2 descends modularity to F.

**Target acceptance checks**

- This is the lifting input for the challenging-surface p–q switch and the ordinary modularity applications of §§9–10. The non-challenging cases of Proposition 9.2.1 have their own arguments.
- Applied to ρ_{A,p} of an abelian surface it gives Proposition 10.1.1.

**Review:** Narrowed the claimed uses; not every result of §§9–10 uses this lifting theorem. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Twisted p-distinguished weight 2 ordinary representations and twisted ordinary π_p

**Node:** `AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary` · **Kind:** definition · **Implementation:** unchecked

A representation ρ: G_{Q_p} → GSp_4(Q̄_p) is twisted p-distinguished weight 2 ordinary if it is an unramified twist ρ_0 ⊗ μ (μ an unramified character) of a representation ρ_0 that is p-distinguished weight 2 ordinary (Definition 7.3.1). An admissible representation π_p of GSp_4(Q_p) is twisted ordinary if it is an unramified twist π_0 ⊗ (μ∘ν) of an ordinary π_0.

**Hypotheses and conventions**

- p ≥ 3; Definition 7.3.1 and the ordinary representations of GSp_4(Q_p) are owned by LocalGaloisDeformationRings and the GSp_4 Part II.

**Source match**

- **BCGP18**, Definition 8.5.1, §8.5, p. 248. Defines the twisted notions as unramified twists of p-distinguished weight 2 ordinary representations and of ordinary representations.

**Direct prerequisites**

- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `ModularityAndLanglandsExtensions:ML.4`
- `mathlib:Field.absoluteGaloisGroup`

**Proof plan**

1. Unfold; the multiplier of ρ_0 ⊗ μ is ν(ρ_0)μ^2, so a twisted ordinary ρ has multiplier ε^{−1} times the square of an unramified character.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary | data | ∃ μ unramified, ρ ⊗ μ^{−1} is p-distinguished weight 2 ordinary. |
| TauCeti.AbelianSurfaces.IsTwistedOrdinary | data | ∃ μ unramified, π_p ⊗ (μ^{−1}∘ν) is ordinary. |
| TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.of_untwisted | constructor | A p-distinguished weight 2 ordinary ρ is twisted ordinary with μ = 1. |
| TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.twist | functoriality | Twisting by an unramified character preserves the notion. |
| TauCeti.AbelianSurfaces.IsTwistedPDistWeightTwoOrdinary.multiplier | relation | ν∘ρ = ε^{−1}μ^2 for the twisting character μ. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.twisted_trivial | degenerate | μ = 1 recovers Definition 7.3.1. |
| TauCeti.AbelianSurfaces.twisted_multiplier | computation | If ρ = ρ_0 ⊗ μ with μ(Frob_p) = −1, then ν∘ρ = ε^{−1}, since μ^2 = 1; a quadratic unramified twist keeps the multiplier. |
| TauCeti.AbelianSurfaces.twisted_ramified_not | non-example | A twist by a ramified character of finite order (e.g. the quadratic character of Q_p(√p)) is not twisted p-distinguished weight 2 ordinary: its diagonal characters on inertia are not 1, 1, ε^{−1}, ε^{−1}. |

**Target acceptance checks**

- Every p-distinguished weight 2 ordinary ρ is twisted with μ = 1.
- Twisting does not change ρ̄|_{I_{Q_p}} up to an unramified character.

**Downstream uses**

- BCGP18, Theorem 8.5.2: the hypotheses at p of the lifting theorem with general multiplier

**Review:** Repointed the local ordinary generic-fibre prerequisite to its existing exact L7 owner. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 8.5.2: modularity lifting with relaxed multiplier

**Node:** `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem` · **Kind:** theorem · **Implementation:** unchecked

Suppose p ≥ 3 splits completely in the totally real F and ρ: G_F → GSp_4(Q̄_p) satisfies: (0) ρ is unramified outside a finite set; (1) ν∘ρ = χε^{−1}, χ totally even of finite order and unramified above p; (2) ρ̄ vast and tidy; (3) ρ|_{G_{F_v}} twisted p-distinguished weight 2 ordinary for v | p; (4) there is π of parallel weight 2, twisted ordinary at every v | p, with ρ̄_{π,p} ≅ ρ̄ (no condition on its central character); (5) ρ|_{G_{F_v}}, ρ_{π,p}|_{G_{F_v}} pure for all finite v. Then there is a twisted ordinary π' of parallel weight 2 with ρ_{π',p} ≅ ρ and WD(ρ|_{G_{F_v}})^{F-ss} ≅ rec_{GT,p}(π'_v ⊗ |ν|^{−3/2}) for every finite v.

**Hypotheses and conventions**

- The paper sketches the proof and does not use the theorem elsewhere; this plan writes the sketch out.

**Source match**

- **BCGP18**, Definition 8.5.1, Theorem 8.5.2 and its sketched proof, §8.5, pp. 248–249. Removes the restriction ν∘ρ = ε^{−1} by a quadratic base change over which the multiplier characters have square roots, and descends by a generalization of Lemma 8.3.2.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`
- `AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary`
- `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`
- `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`
- `ArithmeticGaloisDuality:R02.4/tate-h2-qmodz`
- `ModularityAndLanglandsExtensions:ML.5`
- `ArithmeticGaloisDuality:R02.4/grunwald-wang`

**Proof plan**

1. Write ν∘ρ_π = χ′ε^{−1}. Residual congruence gives χ̄′ = χ̄, not χ′ = χ. Both characters are totally even and unramified above p. The ratio χ′/χ has p-power order; since p is odd it has a unique square root δ of p-power order, with δ̄ = 1. Choose a totally real quadratic F′/F, split above p and disjoint from the residual kernel, killing the Brauer obstruction to a square root ψ of χ. A quadratic character adjustment makes ψ unramified above p (R02.4/character-roots-after-base-change and /grunwald-wang). Set ψ′ = ψδ. Then ψ² = χ, (ψ′)² = χ′ and ψ̄′ = ψ̄, so the twisted residual representations still agree.
2. Apply Theorem 8.4.1 to ρ|_{G_{F'}} ⊗ ψ^{−1} and π_{F'} ⊗ (ψ')^{−1}∘Art_{F'}; it gives modularity of ρ|_{G_{F'}} ⊗ ψ^{−1}, hence of ρ|_{G_{F'}} after twisting back (the paper prints ⊗ψ here; ⊗ψ^{−1} is meant).
3. Descend with Lemma 8.3.2 in its general-central-character form: the same proof with central character |·|^2 replaced by |·|^2 times a finite order character, Lemma 8.3.1 now fixing ν∘ρ = χε^{−1}.

**Target acceptance checks**

- For χ = 1 and untwisted ordinarity it reduces to Theorem 8.4.1.
- The conclusion's π' may have central character |·|^2 times a finite order character.

**Review:** Retained only residual equality of χ and χ′ and chose congruent square roots before applying lifting. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.6 — Potential modularity and potential automorphy of abelian surfaces

#### Galois types of abelian surfaces and challenging surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.6/galois-types` · **Kind:** definition · **Implementation:** unchecked

**Planet:** Challenging abelian surfaces

Let A be an abelian surface over a totally real F and L/F the minimal (Galois) extension over which all endomorphisms of A are defined. The Galois type of A/F is the Gal(L/F)-module End_L(A) ⊗_Z R (Fité–Kedlaya–Rotger–Sutherland); the types fall into six families A–F. Independently of l, the representations ρ_{A,l} fall into exactly one of: (1) strongly irreducible (type A); (2) reducible (types B[C_1], C, E[C_n], some D, some F); (3) potentially abelian but not reducible (the remaining D and F); (4) induced from a quadratic K/F but not potentially abelian, with the two 2-dimensional constituents over K either (a) equivalent up to twist (type E[D_n]) or (b) not (type B[C_2]). A/F is challenging if it has type A (equivalently End_C A = Z) or B[C_2]. In type B[C_2] there are a quadratic K/F (Gal(K/F) = {1,σ}) and a strongly irreducible weakly compatible system 𝒮 = (s_l) of rank 2, weight 0 representations of G_K with determinant ε_l^{−1} such that 𝓡_A ≅ Ind_{G_K}^{G_F}𝒮, and s_l^σ, s_l never become isomorphic over a finite extension of K.

**Hypotheses and conventions**

- F totally real; A an abelian surface over F; 𝓡_A as in AP.0.

**Source match**

- **BCGP18**, §9.2, the classification before Proposition 9.2.1 and the definition of challenging after its proof, pp. 253–254. Recalls the Galois types of abelian surfaces after Fité–Kedlaya–Rotger–Sutherland, sorts the l-adic representations into four categories, and singles out types A and B[C_2] as challenging, with the induced structure in type B[C_2] after Johansson.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `AbelianSchemesAndArithmeticModuli:A6`
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`
- `ArithmeticGaloisRepresentations:G7`

**Proof plan**

1. The classification of Galois types is Fité–Kedlaya–Rotger–Sutherland; the translation into the four categories of l-adic behaviour uses Faltings' semisimplicity and Tate conjecture for endomorphisms (FaltingsFinitenessAndIsogenyTheorems R28.4), the endomorphism algebra and Rosati involution (AbelianSchemesAndArithmeticModuli A6) and Johansson §§4.2–4.6.
2. For type B[C₂], the geometric endomorphism algebra is either a real quadratic field or Q×Q. Over the endomorphism field K its two idempotents after coefficient extension split the compatible system into rank-two pieces interchanged by σ. The Q×Q case includes Weil restrictions of non-CM elliptic curves not geometrically isogenous to their conjugates.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.galoisType | data | The Gal(L/F)-module End_L(A) ⊗ R, classified into the families A–F. |
| TauCeti.AbelianSurfaces.IsChallenging | data | A has type A or B[C_2]. |
| TauCeti.AbelianSurfaces.isChallenging_typeA_iff | characterisation | A has type A iff End_C(A) = Z iff ρ_{A,l} is strongly irreducible for one (equivalently every) l. |
| TauCeti.AbelianSurfaces.typeB_C2_induced | relation | In type B[C_2], 𝓡_A ≅ Ind_{G_K}^{G_F}𝒮 for a quadratic K/F and a strongly irreducible rank 2 weight 0 system 𝒮 with det = ε^{−1}, whose conjugate is never a twist of it over a finite extension. |
| TauCeti.AbelianSurfaces.category_indep_l | other | The category (1)–(4) of ρ_{A,l} does not depend on l. |
| TauCeti.AbelianSurfaces.galoisType_isogeny | functoriality | Isogenous surfaces have the same Galois type; base change to F' replaces L by LF'. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.typeA_generic | computation | The Jacobian of a genus two curve y^2 = f(x) with Gal(f) = S_5 or S_6 over Q has End_C = Z (Zarhin), so it has type A and is challenging. |
| TauCeti.AbelianSurfaces.product_not_challenging | non-example | E_1 × E_2 has reducible ρ_{A,l} (type B[C_1] when non-isogenous without CM) and is not challenging. |
| TauCeti.AbelianSurfaces.weilRestriction_typeB | compatibility | For K/F quadratic and E/K non-CM, not isogenous to any twist of E^σ, Res_{K/F}E has type B[C_2] with 𝒮 = 𝓡_E. |
| TauCeti.AbelianSurfaces.cm_potentially_abelian | degenerate | An abelian surface with CM by a quartic CM field has potentially abelian 𝓡_A (type D or F) and is not challenging. |

**Target acceptance checks**

- End_C A = Z gives type A.
- Res_{K/F}E for E/K not isogenous to a twist of its conjugate, without CM, has type B[C_2].

**Downstream uses**

- BCGP18, Proposition 9.2.1: non-challenging surfaces are treated by rank 2 methods
- BCGP18, Lemma 9.2.2 and Theorem 9.2.8: challenging surfaces have vast and tidy residual images for many primes and are potentially modular
- BCGP18, Theorem 9.3.4: Res_{K/F}E has type B[C_2]

**Review:** Included geometrically split Q×Q endomorphisms in type B[C₂]. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 9.2.1: surfaces not of type A or B[C_2] are potentially automorphic

**Node:** `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy` · **Kind:** theorem · **Implementation:** unchecked

Let A be an abelian surface over a totally real F not of type A or B[C_2]. Then A is potentially automorphic.

**Hypotheses and conventions**

- F totally real.

**Source match**

- **BCGP18**, Proposition 9.2.1 and its proof, §9.2, pp. 253–254. Proves potential automorphy of the non-challenging abelian surfaces case by case: potentially abelian, sums of two rank 2 systems, and the type E[D_n] inductions through lifting a projective representation.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/galois-types`
- `AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety`
- `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`
- `ModularityAndLanglandsExtensions:ML.2`
- `PotentialAutomorphyInfrastructure:PA.5/corrected-rank-two-large-image`
- `ArithmeticGaloisDuality:R02.4/tate-h2-qmodz`
- `ArithmeticGaloisRepresentations:G7`
- `ComplexMultiplicationAndExplicitReciprocity:CM.4`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`

**Proof plan**

1. Types D and F: A acquires CM over L, so 𝓡_A is potentially abelian and automorphic through algebraic Hecke characters (ComplexMultiplicationAndExplicitReciprocity CM.4).
2. Types B[C_1], C and E other than E[D_n]: 𝓡_A = 𝓡^1 ⊕ 𝓡^2 with irreducible odd weight 0 rank 2 systems over F, each potentially automorphic by Barnet-Lamb–Gee–Geraghty–Taylor Theorem 5.4.1 (ModularityAndLanglandsExtensions ML.2).
3. Type E[D_n]: 𝓡_A ≅ Ind_{G_{F'}}^{G_F}𝒮 with s_l^σ ≅ s_l ⊗ δ_l for a finite order δ. For a density one set of l (Lemma 9.1.10(2), PotentialAutomorphyInfrastructure PA.5; BLGGT Prop. 5.3.2) fix l > 7 with Sym^2 s̄_l|_{G_{F'(ζ_l)}} irreducible, l unramified in F', s_l, ε_l crystalline above l. Proj s_l extends to G_F → PGL_2(Q̄_l) and lifts (Tate's H^2(G_F, Q/Z) = 0, ArithmeticGaloisDuality R02.4; Patrikis Lemmas 2.3.17, 2.7.4, ArithmeticGaloisRepresentations G7) to r̃: G_F → GL_2(Q̄_l), Hodge–Tate of weights (0,1), with r̃|_{G_{F'}} = s_l ⊗ ψ; after a twist r̃ is crystalline above l, odd (Calegari–Gee Prop. 2.5), hence potentially automorphic (BLGGT Thm. 4.5.1), and ρ_{A,l} ≅ Ind(r̃|_{G_{F'}} ⊗ ψ^{−1}).

**Target acceptance checks**

- E_1 × E_2 over F is potentially automorphic.
- Types D, F are automorphic after a finite extension through Hecke characters.

**Review:** Imported exact existing isobaric sums and strong multiplicity one rather than replanning them. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemma 9.2.2: big residual image for challenging surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.6/big-image` · **Kind:** theorem · **Implementation:** unchecked

If A/F is a challenging abelian surface, then ρ̄_{A,l} is vast and tidy for a density-one set of primes l. Type A uses the full GSp₄(F_l) image for sufficiently large l. In type B[C₂], apply the large-image input and the corrected Lemma 7.5.22, including its field-automorphism graph case. When real multiplication M is quadratic and l is inert, the relevant index-two subgroup is the graph {(A, ±τ(A))}, τ the nontrivial automorphism of F_{l²}; its extension by the block interchange must be treated inside the induced representation. It is not identified automatically with SL₂(F_{l²})⋊C₂.

**Hypotheses and conventions**

- A challenging; F totally real.

**Source match**

- **BCGP18**, Lemma 9.2.2 and its proof, §9.2, p. 254. States that challenging abelian surfaces have vast and tidy residual representations for a density one set of primes, via Serre's theorem in type A and the induction lemma in type B[C_2].

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/galois-types`
- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`
- `ArithmeticGaloisRepresentations:G7`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `ArithmeticGaloisRepresentations:G7/gsp4-sl2-wreath-vastness-and-tidiness`

**Proof plan**

1. Type A: Serre's open image theorem for abelian surfaces with End_C = Z over a number field (owned by the OpenImage Part II of FaltingsFinitenessAndIsogenyTheorems); GSp_4(F_l) with surjective multiplier is vast and tidy (Lemma 7.5.15, G7).
2. Type B[C_2], general case: SL_2(O_M/λ) ⊂ s̄_λ(G_K) for almost all λ by Ribet's large image theorem for abelian varieties with real multiplication (no potential inner twists since s_l, s_l^σ never become isomorphic), owned by the same Part II; then Lemma 7.5.22.
3. In the inert case use the graph subgroup and its index-two extension as in ArithmeticGaloisRepresentations G7/gsp4-sl2-wreath-vastness-and-tidiness. The graph representation has inequivalent Frobenius-twisted natural factors; the adjoint decomposition and the H¹ vanishing for l ≥ 11 give enormity, with the distinct-eigenvalue test of Lemma 7.5.17. For tidiness choose an element whose first block is diag(a,−a^{-1}), a a generator of F_{l²}×; its second block is the Frobenius conjugate. Its multiplier is −1 and no pair of the four eigenvalues has ratio −1. A claim about a centre of order ≥3 would be false here.
4. The supplier’s corrected Lemma 7.5.22 uses Aut(PSL₂(k)) = PΓL₂(k), separates the graph case, and also corrects the p = 3 cyclotomic-tower argument. Its exact statement, rather than the printed shortcut, is imported.

**Target acceptance checks**

- Type A: ρ̄_{A,l}(G_F) = GSp_4(F_l) for l ≫ 0.
- The exceptional inert case is enormous for l ≥ 11.

**Review:** Repaired the semilinear graph case and tidiness witness; imported the existing corrected G7 theorem. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Good primes for an abelian surface

**Node:** `AbelianSurfacesPotentialModularity:AP.6/good-primes` · **Kind:** definition · **Implementation:** unchecked

Let A/F be an abelian surface over a totally real field. A rational prime p ≥ 3 is a good prime for A if: A has a polarization of degree prime to p; p splits completely in F; ρ̄_{A,p} is vast and tidy; and ρ_{A,p}|_{G_{F_v}} is p-distinguished weight 2 ordinary for every v | p. These provide the conditions on ρ_{A,p} for the lifting argument; an automorphic seed and its purity are still required (Remark 9.2.4).

**Hypotheses and conventions**

- F totally real; A an abelian surface over F.

**Source match**

- **BCGP18**, Definition 9.2.3 and Remark 9.2.4, §9.2, p. 255. Defines good primes by the polarization, splitting, residual image and local ordinarity conditions under which the lifting theorem applies.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `AbelianSchemesAndArithmeticModuli:A2`
- `ArithmeticGaloisRepresentations:G7`
- `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`
- `mathlib:Nat.Prime`

**Proof plan**

1. Unfold; a polarization of degree prime to p makes ρ_{A,p} take values in GSp_4(Z̄_p) with ρ̄_{A,p} symplectic.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.IsGoodPrime | data | The conjunction of the four conditions on (A, p). |
| TauCeti.AbelianSurfaces.IsGoodPrime.split | projection | A good prime splits completely in F. |
| TauCeti.AbelianSurfaces.IsGoodPrime.vast_tidy | projection | ρ̄_{A,p} is vast and tidy. |
| TauCeti.AbelianSurfaces.IsGoodPrime.ordinary | projection | ρ_{A,p}\|_{G_{F_v}} is p-distinguished weight 2 ordinary for v \| p. |
| TauCeti.AbelianSurfaces.IsGoodPrime.liftingHypotheses | other | Goodness gives (0)–(3) and purity of ρ_{A,p}. A seed π satisfying (4) and purity of ρ_{π,p} in (5) remain to be supplied. |
| TauCeti.AbelianSurfaces.isGoodPrime_ordinary_iff | characterisation | For v \| p of good reduction with Frobenius polynomial x^4 − a_1x^3 + a_2x^2 − pa_1x + p^2, the ordinarity condition holds iff p ∤ a_2 and p ∤ a_1^2 − 4a_2. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.good_needs_split | non-example | For F = Q(√2) and p = 3 (inert), no abelian surface over F has 3 as a good prime. |
| TauCeti.AbelianSurfaces.good_ordinary_criterion | computation | For F = Q, p = 5 and a_1 = 1, a_2 = 2 at the prime 5: 5 ∤ 2 and 5 ∤ 1 − 8 = −7, so the local condition at 5 holds; for a_1 = 2, a_2 = 1 it fails since 4 − 4 = 0. |
| TauCeti.AbelianSurfaces.good_two_excluded | degenerate | p = 2 is never a good prime. |
| TauCeti.AbelianSurfaces.good_product_excluded | non-example | For A = E_1 × E_2, ρ̄_{A,p} is reducible, so no prime is good. |

**Target acceptance checks**

- At a good prime p, ρ_{A,p} satisfies (0)–(3), and its own purity in (5). Neither an automorphic seed nor that seed’s purity follows from goodness.
- Good primes are at least 3.

**Downstream uses**

- BCGP18, Lemmas 9.2.5–9.2.7: density of good primes and the choice of p, q
- BCGP18, Theorem 9.2.8: Theorem 8.4.1 is applied at good primes

**Review:** Kept seed existence and seed purity as separate requirements. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemmas 9.2.5–9.2.6: good primes have density one, and the auxiliary pair p, q

**Node:** `AbelianSurfacesPotentialModularity:AP.6/good-prime-density` · **Kind:** theorem · **Implementation:** unchecked

Let A/F be a challenging abelian surface. (9.2.5) The good primes for A have relative density one among the primes splitting completely in F. (9.2.6) There are distinct good primes p, q such that ρ̄_{A,q}(Frob_v) has distinct eigenvalues for every v | p. For Lemma 9.2.7, p is fixed first and q is then chosen with q > p^2 and Frob_q conjugate to complex conjugation in the Galois closure over Q of F(A[p], ζ_p, √Δ_v : v | p), Δ_v = a_1(v)^2 − 4a_2(v) + 8p; this is a positive-density Chebotarev condition on primes split in F, and it forces q ≡ −1 mod p and every Δ_v to be a square mod q.

**Hypotheses and conventions**

- A challenging; a_1(v), a_2(v) the Frobenius coefficients at v | p for a good prime p.

**Source match**

- **BCGP18**, Lemmas 9.2.5 and 9.2.6 with their proofs, §9.2, p. 255. Shows that good primes have relative density one for a challenging surface, by an ordinarity-density argument after Sawin, and chooses two good primes p, q with ρ̄_{A,q}(Frob_v) regular semisimple at the places above p.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/good-primes`
- `AbelianSurfacesPotentialModularity:AP.6/big-image`
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`
- `AbelianSchemesAndArithmeticModuli:A4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `PadicHodgeTheory:R06.2`
- `CohomologyComparisons:CP.2`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Proof plan**

1. 9.2.5 (after Sawin and Calegari–Geraghty Lemma A.7): by Lemma 9.2.2 it suffices that ρ_{A,p}|_{G_{F_v}} is p-distinguished weight 2 ordinary for density one; at a place of good reduction above p with Frobenius polynomial x^4 − a_1x^3 + a_2x^2 − pa_1x + p^2, A is ordinary iff p ∤ a_2, and then the condition holds iff p ∤ a_1^2 − 4a_2 (Katz–Messing compares crystalline and l-adic Frobenius polynomials; requested at AbelianSchemesAndArithmeticModuli A4).
2. By the Weil bounds p | a_1^2 − 4a_2 forces a_1^2 − 4a_2 = pc with c in a finite set; Chebotarev on the Zariski closure of ρ_{A,l}(G_F) reduces density one to non-constancy of the trace of (V^{⊗2} − 4∧^2V) ⊗ χ^{−1} on each component of the Sato–Tate group (USp_4 in type A, the normalizer of SU_2 × SU_2 in type B[C_2]); this density argument is owned by the OpenImage Part II.
3. 9.2.6: at a good prime p the crystalline Frobenius eigenvalues on T_pA at v | p are distinct, so ρ̄_{A,q}(Frob_v) has distinct eigenvalues for all but finitely many q of good reduction; the strengthened choice of q is one more Chebotarev condition.

**Target acceptance checks**

- q ≡ −1 mod p and each Δ_v is a square mod q.
- q > p^2, so p < 2√q.

**Review:** Verified positive density after q>p², q≡−1 and both quadratic discriminant-square conditions; open-image and Chebotarev remain supplier inputs. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Twisted moduli of principally polarized abelian surfaces with fixed torsion

**Node:** `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli` · **Kind:** construction · **Implementation:** unchecked

Let F' be a number field, n ≥ 3 an odd integer (in the applications a prime or a product pq of distinct primes), and V a finite symplectic G_{F'}-module free of rank 4 over Z/n with multiplier ε̄^{−1}. Y(V)/F' is the moduli space of pairs (B, ı) of a principally polarized abelian surface B and a symplectic isomorphism ı: B[n] ≅ V^∨ (Weil pairing against the dual pairing). It is a smooth geometrically connected quasi-projective variety over F', a twist of the Siegel moduli space 𝒜_2(n) of full level n, to which it becomes isomorphic over F̄'. Its good-ordinary local locus Y^{ord}(F'_v) is open at finite places. A local point requires a good ordinary surface realizing the full paired module V^∨. For odd n the cyclotomic multiplier makes every real involution antisymplectic with two-dimensional ±1 eigenspaces, and complex uniformization gives a real point. If the residue characteristic divides n, canonical lifting must match the given finite-flat torsion model, not merely special-fibre torsion.

**Hypotheses and conventions**

- n ≥ 3 odd, so the moduli problem is rigid and representable; the Weil pairing convention of AbelianSchemesAndArithmeticModuli A3.

**Source match**

- **BCGP18**, Proof of Theorem 9.2.8, §9.2, pp. 257–258; §10.2 before Theorem 10.2.1, p. 268. Uses the moduli space of abelian surfaces with symplectic isomorphisms of their p- and q-torsion (resp. 3-torsion) onto given modules, smooth and geometrically connected and identified geometrically with full level structure moduli, with ordinary local points at the auxiliary primes.

**Direct prerequisites**

- `PELModuli:M5`
- `PELModuli:M6`
- `AbelianSchemesAndArithmeticModuli:A3`
- `AbelianSchemesAndArithmeticModuli:A4`
- `AbelianSchemesAndArithmeticModuli:A5`
- `HilbertModularVarietiesAndShimuraCurves:H6`
- `PotentialModularityAndCompatibleSystems:R23.1`

**Proof plan**

1. Construct Y(V) as the twist of the fine moduli scheme 𝒜_2(n) (PELModuli M5–M6) by the Isom torsor between V^∨ and (Z/n)^4 with its standard form; geometric connectedness holds because the multiplier of V is ε̄^{−1}, matching the Weil pairing's target μ_n, so the Weil-pairing component is the one selected (compare the Hilbert analogue HilbertModularVarietiesAndShimuraCurves H6). Here 𝒜₂(n) denotes the selected symplectic Weil-pairing component over the geometric field, not the disjoint union of all similitude components.
2. Use full paired torsion identifications at every finite local point. For the p–q switch V = ρ̄_{A,p} ⊕ ρ̄_q; its dual is A[p] ⊕ ρ̄_q^∨. The unramified prime-to-residue-characteristic torsion is matched by Frobenius. For the p-primary part match the canonical finite-flat model before applying Serre–Tate; real points follow from polarized uniformization and the antisymplectic involution.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.twistedModuli | data | Y(V), smooth geometrically connected over F', with universal (B, ı). |
| TauCeti.AbelianSurfaces.twistedModuli_geom | equivalence | Y(V) ×_{F'} F̄' ≅ 𝒜_2(n)_{F̄'}. |
| TauCeti.AbelianSurfaces.twistedModuli_point | characterisation | Y(V)(L) = {(B, ı) over L with ı: B[n] ≅ V^∨ symplectic}/≅, for L/F' a field. |
| TauCeti.AbelianSurfaces.ordinaryLocus | data | Y^{ord}(F'_v), open in Y(V)(F'_v). |
| TauCeti.AbelianSurfaces.ordinaryLocus_nonempty_real | other | Y(V)(F'_v) ≠ ∅ at real v when the multiplier is ε̄^{−1}. |
| TauCeti.AbelianSurfaces.ordinaryLocus_nonempty_canonicalLift | constructor | A specified identification of V^∨ with the full torsion of the canonical lift of B₀, including its finite-flat part at the residue characteristic, gives a point of Y^{ord}(F′_v). The special fibre B₀[n] alone is insufficient when the residue characteristic divides n. |
| TauCeti.AbelianSurfaces.twistedModuli_product | functoriality | For coprime m, n, Y(V_m ⊕ V_n) = Y(V_m) ×_{𝒜_2} Y(V_n). |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.twisted_untwisted | degenerate | For V = (Z/n)^4 with the standard form and n with μ_n ⊂ F', Y(V) = 𝒜_2(n)_{F'}. |
| TauCeti.AbelianSurfaces.twisted_dim | computation | Y(V) is smooth of dimension 3, like 𝒜_2. |
| TauCeti.AbelianSurfaces.twisted_multiplier_needed | non-example | For n = 5 over Q a paired module V of multiplier ε̄ has dual multiplier ε̄^{-1}, whereas B[5] has multiplier ε̄. Thus no Q-rational paired identification can exist. Geometric points do exist after trivializing cyclotomic action; this does not make the geometric moduli empty. |
| TauCeti.AbelianSurfaces.twisted_level3_burkhardt | compatibility | For n = 3 and V with V^∨ ≅ μ_3^2 ⊕ (Z/3)^2 carrying its standard form, Y(V) is the moduli space 𝒜_2(3) of full level 3 structures, over C the complement of the Hessian in the Burkhardt quartic. |

**Target acceptance checks**

- Over F̄', Y(V) ≅ 𝒜_2(n).
- For V = ρ̄_{A,p} ⊕ ρ̄_q, a local surface gives a point only after both its p- and q-torsion have the required paired identifications.

**Downstream uses**

- BCGP18, proof of Theorem 9.2.8: Moret–Bailly applied to Y(ρ̄_{A,p} ⊕ ρ̄_q) produces B with B[p] ≅ A[p] and B[q] ≅ ρ̄_q^∨.
- BCGP18, §10.2: B(ρ̄) = Y(V(ρ̄)) for n = 3
- BCGP25 §9.2.1: the twisted odd-theta moduli P(ρ̄) is a degree 6 cover of Y(V(ρ̄))

**Review:** Corrected dual-torsion and local realization conditions, real involution data, and geometric points in the negative test. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Fixed-determinant GL_2(F_q)-extensions with prescribed local behaviour

**Node:** `AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions` · **Kind:** theorem · **Implementation:** unchecked

Let E'/E be finite extensions of number fields, F^{(avoid)}/E finite Galois, S a finite set of places of E, q a prime, ψ̄: G_E → F_q^× a character cut out inside F^{(avoid)} with ψ̄(G_{E'}) = F_q^×, and for v ∈ S local Galois extensions with GL_2(F_q)-valued local data of determinant ψ̄. Then there are a finite extension K/E, linearly disjoint from E'F^{(avoid)}/E and with the prescribed splitting at S, and, over K' = KE', a representation r̄: G_{K'} → GL_2(F_q) with det r̄ = ψ̄, image GL_2(F_q), L' ∩ K'F^{(avoid)} = K'(ψ̄) for the fixed field L' of ker r̄, and the prescribed local data at the places above S (the variant of Proposition 9.1.12 used by Lemma 9.2.7). No descent of L' to an extension of K is asserted.

**Hypotheses and conventions**

- E, E' number fields; S finite; the local data have determinant ψ̄.

**Source match**

- **BCGP18**, Proposition 9.1.12 and its proof, §9.1, pp. 252–253, and the proof of Lemma 9.2.7, pp. 256–257. Constructs extensions with given Galois group and local behaviour over a base change by restriction of scalars and Moret-Bailly; Lemma 9.2.7 needs it with GL_2(F_q) and fixed determinant.

**Direct prerequisites**

- `PotentialModularityAndCompatibleSystems:R23.1`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Proof plan**

1. Construct a generically free open U in a linear representation of G = GL₂(F_q), avoiding all stabilizer subspaces. Twist the G/SL₂ torsor U/SL₂ → U/G by the determinant character ψ̄. Its parameter variety X over E′ is geometrically irreducible; local points with the prescribed G-torsors follow because each twist of U is an open in a vector space over the infinite local field.
2. Apply Moret–Bailly to Res_{E′/E}X with avoidance the normal closure of E′F^{(avoid)} and the required local open sets. The resulting point over K gives a representation over K′ = KE′ with determinant ψ̄ and the prescribed local conditions. No descent of that representation to K is asserted.
3. To force full image, add degree-one places of E′ over E, with ψ̄(Frob) prescribed by Chebotarev, and matrices meeting every GL₂(F_q)-conjugacy class with that determinant. Require K/E to split at their underlying E-places. The specialized image meets every conjugacy class of GL₂, so the transitive coset action and the derangement lemma force the image to be GL₂.
4. Independently add places split in the normal closure of E′F^{(avoid)}, with local Frobenii meeting every GL₂-conjugacy class contained in SL₂. Their images lie in H = r̄(G_{K′F^{(avoid)}}). This H is normal in GL₂; normality makes it a union of conjugacy classes, hence H = SL₂. Together with the determinant torsor inside F^{(avoid)}, this gives L′ ∩ K′F^{(avoid)} = K′(ψ̄). Full image before avoidance alone would not prove this equality.

**Target acceptance checks**

- For ψ̄ = ε̄^{−1}, L' ∩ K'F^{(avoid)} = K'(ζ_q).
- r̄(G_{K'(ψ̄)}) = SL_2(F_q).

**Review:** Supplied the fixed-determinant torsor construction and separate auxiliary places forcing full image after avoidance, needed for exact intersection. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemma 9.2.7 (corrected): the p–q switching lemma

**Node:** `AbelianSurfacesPotentialModularity:AP.6/pq-switch` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** The p–q switching lemma

Let A/F be an abelian surface over a totally real field and p, q good primes chosen as in Lemma 9.2.6 with the strengthened choice of q. Fix a totally real quadratic F_1/F in which p and q split completely, linearly disjoint from the kernels of G_F acting on A[p], A[q]. Then there are a finite Galois extension of totally real fields F'/F and r̄_q: G_{F'F_1} → GL_2(F_q) such that: (1) p, q split completely in F'; (2) F'/F is linearly disjoint from F_1/F and from the kernels on A[p], A[q]; (3) det r̄_q = ε̄^{−1}; (4) r̄_q(G_{F'F_1}) = GL_2(F_q) and the projective image of r̄_q differs from its Gal(F'F_1/F')-conjugate; (5) ρ̄_q := Ind_{G_{F'F_1}}^{G_{F'}}r̄_q: G_{F'} → GSp_4(F_q), with multiplier ε̄^{−1}, satisfies ρ̄_q|_{G_{F'_{w'}}} ≅ λ_a ⊕ λ_b ⊕ ε̄^{−1}λ_b^{−1} ⊕ ε̄^{−1}λ_a^{−1} with a = p, b = −p in F_q for w' above w | q, and ρ̄_q|_{G_{F'_{v'}}} ≅ ρ̄_{A,q}|_{G_{F_v}} for v' above v | p; (6) ρ̄_q is vast and tidy. The printed (5) at w | q, (ρ̄_{A,q}|_{G_{F_w}})^{ss}, is false in general (it needs the unit roots of A at w to lie in F_q).

**Hypotheses and conventions**

- p, q as in Lemma 9.2.6 with q > p^2, q ≡ −1 mod p and every Δ_v a square mod q.

**Source match**

- **BCGP18**, Lemma 9.2.7 and its proof, §9.2, pp. 256–257. Produces, over a totally real extension, a mod q representation induced from a GL_2(F_q)-valued representation of determinant ε̄^{−1} with prescribed local behaviour at the places above p and q and big image, to be used as the second residual representation in the p–q switch.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`
- `AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions`
- `ArithmeticGaloisRepresentations:G7`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `ArithmeticGaloisRepresentations:G7/gsp4-sl2-wreath-vastness-and-tidiness`

**Proof plan**

1. Put K' = F_1F' and apply the fixed-determinant extension theorem with E = F, E' = F_1, G = GL_2(F_q), ψ̄ = ε̄^{−1}, S the places dividing pq𝔯∞ for an auxiliary place 𝔯 ∤ pq of F split in F_1, with local data of determinant ε̄^{−1} (det c_v = −1 at real places).
2. At w | p take φ̄_{w_1}, φ̄_{w_2} unramified, F_q-rational, with Frobenius characteristic polynomials (x − α_w)(x − pα_w^{−1}) and (x − β_w)(x − pβ_w^{−1}); they lie in F_q[x] because each Δ_w is a square mod q. At w | q take diag(λ_a, ε̄^{−1}λ_a^{−1}) and diag(λ_b, ε̄^{−1}λ_b^{−1}) with a = p, b = −p, the unit roots of ordinary elliptic curves over F_q of traces p and −p (they exist by Deuring since p < 2√q; recorded as a gap).
3. (3) holds by construction and L' ∩ K'F^{(avoid)} = K'(ζ_q); (4) comes from the places above 𝔯; for (6), G_{K'(ζ_q)} = ker(det∘r̄_q) has image exactly SL_2(F_q), the hypothesis of Lemma 7.5.22 with k = F_q (G7). The printed proof's square-root twist of ε̄ det r̄_q fails for F_q^×-valued roots and is not used.

**Target acceptance checks**

- ρ̄_q is induced, so after the switch the q-adic seed comes from GL_2 over F_1F'.
- At v | p the local representation of ρ̄_q matches that of ρ̄_{A,q} (the dual of A[q]), so a single surface B can realize A[p] and ρ̄_q^∨ simultaneously.

**Review:** Corrected the q-torsion dual in the acceptance condition. Repointed prime-field residual largeness to the corrected PA.5 node; corrected the dual q-torsion acceptance test. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 9.2.8: challenging abelian surfaces are potentially modular

**Node:** `AbelianSurfacesPotentialModularity:AP.6/potential-modularity` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Potential modularity of abelian surfaces

Let A/F be a challenging abelian surface over a totally real field. Then A is potentially modular: there are a finite Galois extension of totally real fields F'/F and a prime p splitting completely in F' such that ρ_{A,p}|_{G_{F'}} is modular and irreducible.

**Hypotheses and conventions**

- F totally real; A challenging.

**Source match**

- **BCGP18**, Theorem 9.2.8 and its proof, §9.2, pp. 257–258. Proves potential modularity of challenging abelian surfaces by a p–q switch: an auxiliary surface B shares A's p-torsion and has q-torsion induced from GL_2, which is potentially modular; the lifting theorem is applied twice.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/pq-switch`
- `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`
- `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`
- `AbelianSurfacesPotentialModularity:AP.6/good-primes`
- `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`
- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `PotentialModularityAndCompatibleSystems:R23.1`
- `PotentialModularityAndCompatibleSystems:R23.2`
- `PotentialModularityAndCompatibleSystems:R23.3`
- `PotentialModularityAndCompatibleSystems:R23.5`
- `ModularityAndLanglandsExtensions:ML.5`
- `AutomorphicGaloisRepresentations:R19.3`
- `AutomorphicGaloisRepresentations:R19.4`
- `AutomorphicGaloisRepresentations:R19.5`

**Proof plan**

1. Take p, q, F_1, F', r̄_q, ρ̄_q from Lemma 9.2.7. Let Y/F' be the twisted moduli space of (B, ı_p, ı_q) with ı_p: B[p] ≅ A[p]|_{G_{F'}} and ı_q: B[q] ≅ ρ̄_q^∨; it is smooth and geometrically connected, and Ω_v = Y^{ord}(F'_v) is nonempty for v | pq∞ (A at v | p; the canonical lift of E × E' with traces p, −p at v | q; real points from det r̄_q^∨ = ε).
2. Moret-Bailly (R23.1) gives a totally real F''/F', with p and q split, linearly disjoint from the relevant kernels, and B/F'' with good ordinary reduction above p and q.
3. Proposition 9.1.11 (R23.2, R23.3, R23.5) gives, after enlarging F'', a q-ordinary weight 0 form 𝛑 on GL_2(A_{F_1F''}) with trivial central character, unramified above pq, with ρ̄_{𝛑,q} ≅ r̄_q|_{G_{F_1F''}}; Roberts' theta lift (GSp_4 Part II) gives an ordinary π on GSp_4(A_{F''}) of parallel weight 2 and central character |·|^2 (printed: trivial) whose GL_4 transfer is the automorphic induction of 𝛑 ⊗ |·|, so ρ_{π,q} ≅ Ind ρ_{𝛑,q} lifts ρ̄_q|_{G_{F''}}; ρ_{π,q} is pure (Blasius away from q, Caraiani at q).
4. Theorem 8.4.1 at q makes ρ_{B,q} modular, hence ρ_{B,p}; Theorem 8.4.1 at p then makes ρ_{A,p}|_{G_{F''}} modular (purity of ρ_{B,q}, ρ_{B,p}, ρ_{A,p} from Proposition 2.8.1). Irreducibility comes from the vast residual image.

**Target acceptance checks**

- Every surface with End_C A = Z over a totally real field is potentially modular.
- The extension F'' can be chosen linearly disjoint from any given finite extension (used in Theorem 9.3.4).

**Review:** Restored the missing reduction bar in the rank-two automorphic seed comparison. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 2.7.3: Galois representations for weight 0 forms on GL_2 over a quadratic extension of a totally real field

**Node:** `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois` · **Kind:** theorem · **Implementation:** unchecked

Let F be totally real, K/F quadratic with Gal(K/F) = {1, τ}, and 𝛑 a cuspidal automorphic representation of GL_2(A_K) of weight 0 (𝛑_v corresponds to φ_{0,1} at every infinite v of K) with trivial central character. Then there is a continuous irreducible ρ_{𝛑,p}: G_K → GL_2(Q̄_p) with WD(ρ_{𝛑,p}|_{G_{K_w}})^{ss} ≅ rec_p(𝛑_w ⊗ |·|^{−1/2})^{ss} for finite w ∤ p, equality of Frobenius-semisimple Weil–Deligne representations when 𝛑_w is not a twist of Steinberg, and ρ_{𝛑,p}|_{G_{K_w}} Hodge–Tate with labelled weights (0,1) for w | p. (The paper prints GL_2(K) for GL_2(A_K) and G_{K_v} for G_{K_w}.)

**Hypotheses and conventions**

- F totally real, K/F quadratic (no condition on the signature of K).

**Source match**

- **BCGP18**, Theorem 2.7.3 with its proof, §2.7, pp. 34–35. Attaches Galois representations to weight 0 cuspidal representations of GL_2 over any quadratic extension of a totally real field through GSp_4 over the totally real field, following Mok.

**Direct prerequisites**

- `ModularityAndLanglandsExtensions:ML.4`
- `ModularityAndLanglandsExtensions:ML.5`
- `GL2AutomorphicRepresentationsAndTransfer:R16.3`
- `mathlib:NumberField.IsTotallyReal`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`
- `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`

**Proof plan**

1. For K CM this is a case of Mok's main theorem.
2. In general, Mok's §5.1 argument produces a cuspidal π of GSp_4(A_F) via Theorem 2.9.3 (the automorphic induction of 𝛑 ⊗ |·|); its infinity components lie in the L-packet of φ_{(2;1,0)} by Lemma 2.6.1 at real places of F split in K and by Mok Prop. 5.2 where K_v is complex; Mok §§5.2–5.3 then give ρ_{𝛑,p} as a constituent of ρ_{π,p}|_{G_K}.

**Target acceptance checks**

- For K totally real this recovers the Hilbert modular case.
- Used in Theorem 9.3.4 for the local–global compatibility of the GL_2 form over KF'.

**Review:** Removed duplicate supplier prerequisites; source statement unchanged. Verified the weight-zero GL₂ input and removed duplicate ML.4 prerequisites. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 9.3.1 (Theorem 1.1.3): every abelian surface over a totally real field is potentially automorphic

**Node:** `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Potential automorphy of abelian surfaces

Let F be totally real and A/F an abelian surface. Then 𝓡_A is potentially automorphic, and Conjecture 2.8.6 (meromorphic continuation and functional equation of Λ(H^i(A), s)) holds for A for each 0 ≤ i ≤ 4. In particular there is a finite Galois L/F such that 𝓡_A|_{G_L} is automorphic, and the L-function of H^1 over L is entire. Only challenging surfaces are shown potentially modular in the sense of Definition 9.1.8.

**Hypotheses and conventions**

- F totally real; Arthur's classification for GSp_4 in its conditional form (ModularityAndLanglandsExtensions ML.0, ML.4).

**Source match**

- **BCGP18**, Theorem 9.3.1, Remark 9.3.2 and the proof, §9.3, pp. 258–259; Theorem 1.1.3, §1.1, p. 4. Proves potential automorphy of the compatible system of every abelian surface over a totally real field and the meromorphic continuation and functional equation of its L-functions, through Brauer induction and the potential modularity of challenging surfaces.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`
- `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`
- `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`
- `AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety`
- `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`
- `AbelianSurfacesPotentialModularity:AP.6/galois-types`
- `ModularityAndLanglandsExtensions:ML.2`
- `ModularityAndLanglandsExtensions:ML.4`
- `ModularityAndLanglandsExtensions:ML.5`
- `PotentialModularityAndCompatibleSystems:R24.5`
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`
- `PeriodsAndSpecialValues:PS.1`
- `AutomorphicLFunctionsAndLocalFactors:AL.2`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`
- `ModularityAndLanglandsExtensions:ML.4/gl4-symplectic-descent`

**Proof plan**

1. Since H^i = ∧^iH^1, ε(𝓡)ε(𝓡^∨) = N(𝓡) (Tate) and H^i^∨ = H^i(i), it suffices to treat i = 1, 2 and to prove (2.8.5).
2. By Brauer induction (Taylor, Remarks on a conjecture of Fontaine and Mazur, Corollary 2.2; InductionRestriction layer 6 and PotentialModularityAndCompatibleSystems R24.5) it suffices to find a Galois totally real F'/F with 𝓡_A|_{G_{F''}} and ∧^2𝓡_A|_{G_{F''}} automorphic for every F'' ⊂ F' with Gal(F'/F'') solvable.
3. Types D, F: potentially abelian (Johansson Prop. 11, Lemma 14). Types B[C_1], C, E ≠ E[D_n]: 𝓡_A = 𝓡^1 ⊕ 𝓡^2, potentially automorphic by BLGGT Thm 5.4.1, descending along solvable extensions by BLGHT Lemma 1.3, and ∧^2𝓡_A = det𝓡^1 ⊕ det𝓡^2 ⊕ (𝓡^1 ⊗ 𝓡^2) is automorphic by Ramakrishnan's Theorem M (ML.5).
4. Types A, B[C_2], E[D_n]: Theorem 9.2.8, the proof of Proposition 9.2.1, Lemma 2.9.1, Theorem 2.9.3 and Lemma 8.3.2 make ρ_{A,p}|_{G_{F''}} irreducible, modular and automorphic; Henniart's refinement of Kim's exterior square transfer with Theorem 2.9.3 makes ∧^2ρ_{A,p} automorphic.
5. Remark 9.3.2: Kim–Henniart can be replaced by the degree 5 standard L-function of the GSp_4 form, but Theorem 2.9.3 remains essential.

**Target acceptance checks**

- Λ(A,s) = ∏_iΛ(H^i(A),s)^{(−1)^i} has meromorphic continuation and the expected functional equation.
- For A of type A the automorphic Π over L is cuspidal on GL_4.

**Review:** Imported the existing ML.4 exterior-square symplectic descent target; full-packet classification remains conditional. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Corollary 9.3.3 and Theorem 1.1.2: the Hasse–Weil conjecture for genus two curves and abelian surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Hasse–Weil for genus two curves

Let C/F be a genus two curve over a totally real field, and Λ(C,s) = ∏_{i=0}^{2}Λ_i(C,s)^{(−1)^i} with Λ_1(C,s) = Λ_1(Jac(C),s). Then Λ(C,s) has meromorphic continuation to C and Λ(C,s) = εN^{−s}Λ(C, 2 − s) with ε ∈ R and N ∈ Q_{>0}. Consequently Conjecture 1.1.1 (Serre's form of the Hasse–Weil conjecture) holds for every genus two curve and every abelian surface over a totally real field (Theorem 1.1.2). Both versions of the paper print Λ(C, 3 − s); the symmetry of a curve's completed function is s ↦ 1 + dim C − s = 2 − s, while 3 − s belongs to Λ(Jac(C), s).

**Hypotheses and conventions**

- F totally real; C smooth projective geometrically connected of genus 2 over F.

**Source match**

- **BCGP18**, Corollary 9.3.3, §9.3, p. 259; Theorem 1.1.2 and Conjecture 1.1.1, §1.1, pp. 3–4. Deduces the meromorphic continuation and functional equation of the completed Hasse–Weil function of a genus two curve from Theorem 9.3.1 applied to its Jacobian, which with Theorem 9.3.1 gives the Hasse–Weil conjecture for genus two curves and abelian surfaces.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`
- `PeriodsAndSpecialValues:PS.1`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`

**Proof plan**

1. Apply Theorem 9.3.1 to A = Jac(C) (JacobianChallenge layers D–F): H^1(C) = H^1(Jac C), so Λ_1(C,s) continues with its functional equation s ↦ 2 − s.
2. Λ_0(C,s) is the completed Dedekind zeta function of F and Λ_2(C,s) = Λ_0(C,s−1); they are exchanged by s ↦ 2 − s.
3. For abelian surfaces, Theorem 9.3.1 gives Conjecture 1.1.1 directly.

**Target acceptance checks**

- For C: y^2 = x^5 + 1 over Q the completed L-function of C is meromorphic with symmetry s ↦ 2 − s.
- The predicted functional equation for the completed zeta function of C has reflection s ↦ 2−s; the dimension-two reflection s ↦ 3−s is the one for the full zeta function of its Jacobian.

**Review:** Made the functional-equation check positive rather than claiming absence of any other relation. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 9.3.4 (Theorem 1.1.4): genus one curves over quadratic extensions of totally real fields are potentially modular

**Node:** `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Genus one curves over quadratic extensions

Let K/F be a quadratic extension of a totally real F, and E/K a genus one curve, with endomorphisms and Galois representations understood through its Jacobian (in particular E may be an elliptic curve). Then E is potentially modular. If End_K(E) = Z, there are a Galois extension of totally real fields F'/F and a weight 0 cuspidal 𝛑 on GL_2(A_{KF'}) with trivial central character such that ρ_{E,l}|_{G_{KF'}} ≅ ρ_{𝛑,l} for every l, with WD_v(ρ_{E,l}|_{G_{KF'_v}})^{F-ss} ≅ rec(𝛑_v ⊗ |det|_v^{−1/2}) at every finite v. If End_K(E) ≠ Z, E has CM defined over K and ρ_{E,l}|_{G_K} is a sum of two characters of algebraic Hecke characters, so no cuspidal 𝛑 exists; E is potentially modular in the sense of the first sentence. Conjecture 2.8.6 holds for E in all cases, including CM. The printed 'more precisely' clause is stated for every E and fails in the CM case (K = Q(i), y^2 = x^3 − x).

**Hypotheses and conventions**

- F totally real; K/F quadratic of any signature.

**Source match**

- **BCGP18**, Theorem 9.3.4 and its proof, §9.3, pp. 259–261; Theorem 1.1.4, §1.1, p. 4. Proves potential modularity of genus one curves over quadratic extensions of totally real fields through the Weil restriction, a type B[C_2] abelian surface, and automorphic induction from GL_2 over the quadratic extension.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`
- `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`
- `AbelianSurfacesPotentialModularity:AP.6/galois-types`
- `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`
- `ModularityAndLanglandsExtensions:ML.5`
- `ModularityAndLanglandsExtensions:ML.4`
- `AbelianSchemesAndArithmeticModuli:A6`
- `ComplexMultiplicationAndExplicitReciprocity:CM.4`
- `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`

**Proof plan**

1. Replace a genus-one curve by its Jacobian. If all CM endomorphisms are defined over K, use the sum of Hecke characters; otherwise use CM automorphic induction. If E is isogenous to a twist of E^σ, use the type E[D_n] argument of Proposition 9.2.1. The analytic conclusions apply in every case.
2. Otherwise A = Res_{K/F}E has type B[C_2] with 𝓡_A = Ind_{G_K}^{G_F}𝓡_E; Theorem 9.2.8 gives F'/F linearly disjoint from K/F and π on GSp_4(A_{F'}) with ρ_{A,p}|_{G_{F'}} ≅ ρ_{π,p}.
3. The transfer Π of π to GL_4(A_{F'}) satisfies Π ⊗ (κ∘Art∘det) ≅ Π for the quadratic character κ of K' = KF'/F', so Π is the automorphic induction of 𝛑 ⊗ |det| for a cuspidal 𝛑 on GL_2(A_{K'}) (Arthur–Clozel Chapter 3, Theorems 4.2 and 5.1; ML.5).
4. Lemma 2.6.1 and a Frobenius-eigenvalue density argument show 𝛑 has weight 0 and trivial central character; Theorem 2.7.3 gives the local–global compatibility.

**Target acceptance checks**

- For F = Q(√2) and K = Q(2^{1/4}), of mixed signature, every elliptic curve over K is potentially modular.
- For K/F totally real the statement recovers Taylor's potential modularity; for K totally imaginary, that of the ten-author paper.

**Review:** Included the analytic conclusion in the CM case and distinguished CM endomorphisms over K; extended proof locator. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 9.4.1: the Hasse–Weil conjecture for Kummer surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces` · **Kind:** theorem · **Implementation:** unchecked

Let A be an abelian surface over a totally real F and X = Km(A) its Kummer surface (the minimal resolution of A/⟨−1⟩, a smooth projective K3 surface of geometric Picard number ≥ 17). Then Conjecture 1.1.1 holds for X. The same holds for any K3 surface over F with a Shioda–Inose structure over F. (Definition 9.4.2 and the rest of §9.4 — F-abelian varieties, K3 surfaces of Picard rank ≥ 17, Nori's fake Kummer surfaces — are discussion without further theorems.)

**Hypotheses and conventions**

- F totally real; A an abelian surface over F.

**Source match**

- **BCGP18**, Proposition 9.4.1, Definition 9.4.2 and §9.4, pp. 260–264. Deduces the Hasse–Weil conjecture for Kummer surfaces of abelian surfaces from Theorem 9.3.1 and Artin L-functions, and discusses further K3 surfaces.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`
- `AnalyticNumberTheory:AN.4`
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`
- `PeriodsAndSpecialValues:PS.1`

**Proof plan**

1. H^*(X, Q_p) vanishes in odd degrees; in even degrees it is generated by the image of H^*(A, Q_p)^{±1} (all of H^0, H^2, H^4 of A) and the 16 classes of the exceptional divisors over the 2-torsion points, a twist of an Artin representation (the permutation representation on A[2]). The cohomology of the Kummer construction is recorded as a gap (no atlas layer plans Kummer or K3 surfaces).
2. Theorem 9.3.1 handles the part from A, and the meromorphic continuation and functional equation of Artin L-functions (Brauer induction; AnalyticNumberTheory AN.4) the exceptional part.

**Target acceptance checks**

- H^2(Km(A)) has dimension 22 = 6 + 16.
- The exceptional classes contribute an Artin L-function up to a Tate twist.

**Review:** Verified Proposition 9.4.1 target and the missing Kummer cohomology decomposition; no closed proof is claimed. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

### AP.7 — Modularity, fixed 3-torsion and the paramodular conjecture

#### Proposition 10.1.1 (Theorem 1.1.7): modularity of ordinary abelian surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Modularity of ordinary abelian surfaces

Let F be totally real with p > 2 splitting completely, and A/F an abelian surface with good ordinary reduction at every v | p whose unit root crystalline eigenvalues at each v | p are distinct mod p. Assume A has a polarization of degree prime to p, that ρ̄_{A,p}: G_F → GSp_4(F_p) (the dual of A[p]) is vast and tidy, and that ρ̄_{A,p} is ordinarily modular: some π of parallel weight 2 and central character |·|^2, ordinary at every v | p, has ρ̄_{π,p} ≅ ρ̄_{A,p} and ρ_{π,p}|_{G_{F_v}} pure for all finite v. Then A is modular: some ordinary π' of parallel weight 2 and central character |·|^2 has ρ_{π',p} ≅ ρ_{A,p}. The printed 'unramified and ordinary' is corrected to 'ordinary'. (Remark 10.1.2: without a polarization of degree prime to p, ρ̄_{A,p} is reducible, but need not land in any conjugate of GSp_4(F_p).)

**Hypotheses and conventions**

- As stated; F totally real, p > 2 totally split.

**Source match**

- **BCGP18**, Proposition 10.1.1 and Remark 10.1.2, §10.1, pp. 264–265; Theorem 1.1.7, §1.1, p. 5. States and proves the modularity of an ordinary abelian surface with distinct unit roots, a polarization of degree prime to p, vast and tidy and ordinarily modular residual representation, as an immediate consequence of Theorem 8.4.1.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`
- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `NeronModelsAndSemistableAbelianVarieties:R11.5`
- `AbelianSchemesAndArithmeticModuli:A4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `PadicHodgeTheory:R06.2`
- `CohomologyComparisons:CP.2`
- `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`

**Proof plan**

1. The polarization of degree prime to p puts ρ_{A,p} in GSp_4(Z_p) with multiplier ε^{−1} (AP.0); Proposition 2.8.1 (R11.5) gives purity at every finite place and finiteness of ramification.
2. Good ordinary reduction with distinct unit roots mod p gives p-distinguished weight 2 ordinarity at v | p: the connected–étale sequence of the p-divisible group (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 via AbelianSchemesAndArithmeticModuli A4) gives the filtration, D_cris and the crystalline comparison (PadicHodgeTheory R06.2, CohomologyComparisons CP.2) give the unit roots, and Katz–Messing identifies them with the l-adic Frobenius data (requested at A4).
3. Theorem 8.4.1 applies.

**Target acceptance checks**

- The conclusion is modularity in the sense of Definition 9.1.8.
- It is the input of Theorem 10.2.6 and Lemma 10.3.1.

**Review:** Verified ordinary-surface modularity with finite-flat dual, residual image and purity inputs; the printed unramifiedness is correctly omitted. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Proposition 10.1.3: three cases in which ρ̄_p is ordinarily modular

**Node:** `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases` · **Kind:** theorem · **Implementation:** unchecked

Let F be totally real with p > 2 splitting completely and ρ̄_p: G_F → GSp_4(F_p) absolutely irreducible with multiplier ε^{−1}, vast and tidy and p-distinguished weight 2 ordinary. Suppose (1) p = 3 and ρ̄_3 is induced from a 2-dimensional representation with inverse cyclotomic determinant over a totally real quadratic E/F in which 3 is unramified; or (2) p = 5 and ρ̄_5 is induced in the same way from a GL_2(F_5)-valued representation, 5 unramified in E; or (3) ρ̄_p is induced from a character of a quartic CM extension H/F in which p splits completely. Then ρ̄_p is ordinarily modular: some π of parallel weight 2 and central character |·|^2, ordinary above p, has ρ̄_{π,p} ≅ ρ̄_p and ρ_{π,p} pure at all finite places. The printed 'unramified and ordinary' is corrected to 'ordinary': in the très ramifiée cases the constructed π is of Steinberg type above p. Consequently in these cases the residual modularity hypothesis of Theorem 1.1.7 can be dropped.

**Hypotheses and conventions**

- As stated.

**Source match**

- **BCGP18**, Proposition 10.1.3 and its proof, §10.1, pp. 265–267; §1.1 after Theorem 1.1.7, p. 6. Establishes ordinary residual modularity for mod 3 and mod 5 representations induced from GL_2 over a real quadratic extension and for representations induced from characters of quartic CM fields, through automorphic induction and known rank 2 results.

**Direct prerequisites**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`
- `GL2AutomorphicRepresentationsAndTransfer:R17.4`
- `GL2AutomorphicRepresentationsAndTransfer:R17.5`
- `ModularityAndLanglandsExtensions:ML.1`
- `ModularityAndLanglandsExtensions:ML.5`
- `AutomorphicGaloisRepresentations:R19.3`
- `AutomorphicGaloisRepresentations:R19.5`
- `ArithmeticGaloisRepresentations:G7`
- `ComplexMultiplicationAndExplicitReciprocity:CM.4`

**Proof plan**

1. Cases (1)–(2): ρ̄ = Ind_{G_E}^{G_F}ϱ̄ with ϱ̄|_{G_{E(ζ_p)}} absolutely irreducible and ϱ̄ on inertia above p an extension of ε^{−1} by 1. Once ϱ̄ is modular, Barnet-Lamb–Gee–Geraghty (2013, Theorem A; OrdinaryAutomorphicFormsAndModularityLifting R21.2) gives an ordinary Hilbert form of parallel weight 2 and trivial character, π is its automorphic induction from E to F (Roberts' theta lift, GSp_4 Part II), and purity comes from Blasius and Caraiani (AutomorphicGaloisRepresentations R19.3–R19.5).
2. ϱ̄ is modular: by Langlands–Tunnell with Tate's lifting when its projective image is solvable (GL2AutomorphicRepresentationsAndTransfer R17.4–R17.5); by the odd Artin conjecture over totally real fields (Pilloni–Stroh) for p = 3 and projective image A_5; for surjective GL_2(F_5)-valued ϱ̄ by Khare–Wintenberger lifts, Kisin's lifting and Pilloni–Stroh (ModularityAndLanglandsExtensions ML.1).
3. Case (3): ρ̄ = Ind_{G_H}^{G_F}χ; take an algebraic Grössencharacter ψ of H of conductor prime to p with ψ_p ≡ χ (CM.4) and induce automorphically to GL_2 over the real quadratic E ⊂ H, then to F.

**Target acceptance checks**

- With Proposition 10.1.1 it gives modularity of ordinary surfaces whose mod 3 representation is induced from a real quadratic field.
- Case (3) covers mod p representations of CM type.

**Review:** Imported the existing R21.6 ordinary weight-two lift and ML.4 descent nodes; their hypotheses do not replace the separate dihedral argument. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemmas 7.5.25–7.5.27: crossing with dihedral extensions

**Node:** `AbelianSurfacesPotentialModularity:AP.7/dihedral-crossing` · **Kind:** theorem · **Implementation:** unchecked

Let F be totally real with p split completely and K/F quadratic with p unramified. (7.5.25) There is a Galois H/F ⊃ K with D = Gal(H/F) dihedral of order 8, Gal(H/K) ≅ (Z/2)^2, H the Galois closure of a quadratic M/K, H/F unramified above p with ⟨Frob_v⟩ not central in D, and H/F linearly disjoint from any given extension disjoint from K/F. (7.5.26) For r̄: G_F → GL_2(F̄_p) absolutely irreducible with det r̄ = ε̄^{−1} and r̄|_{G_{F_v}} an extension of ε̄^{−1}χ_v^{−1} by an unramified χ_v at each v | p, K linearly disjoint from F(r̄), H as in 7.5.25 disjoint from F(r̄), and ρ̄ := Ind_{G_K}^{G_F}(r̄|_{G_K} ⊗ δ_{M/K}): ρ̄ is p-distinguished weight 2 ordinary with multiplier ε̄^{−1}, ρ̄ ≅ V ⊗ U (V from r̄, U the faithful 2-dimensional representation of D) is absolutely irreducible, and ρ̄(G_F) = (Γ × D)/⟨(−1, [a,b])⟩ or Γ × D according as Γ = r̄(G_F) has a central element of order 2. (7.5.27) For p ≥ 5 with Γ = GL_2(F_p), or p = 5 and Γ the preimage of S_4 ⊂ S_5 ≅ PGL_2(F_5), G ∩ Sp_4(F_p) is enormous (weakly enormous if Γ = GL_2(F_5)), and ρ̄ is vast and tidy.

**Hypotheses and conventions**

- p unramified in K; the proof of 7.5.27 prints 'E' where F is meant.
- The general dihedral construction does not require H to be totally real. A totally real H is chosen in the later p = 3 ordinary modularity construction where K is totally real.

**Source match**

- **BCGP18**, §7.5.24 and Lemmas 7.5.25–7.5.27, pp. 205–208. Constructs dihedral octic extensions with local conditions above p and shows that crossing a mod p GL_2-representation with them gives vast, tidy, p-distinguished weight 2 ordinary GSp_4-representations.

**Direct prerequisites**

- `InverseGaloisAndArithmeticFundamentalGroups:IG.4`
- `ArithmeticGaloisRepresentations:G7`

**Proof plan**

1. 7.5.25: with K = F(√α), take β = x^2 − αy^2 a unit and non-residue at every v | p and H = F(√α, √β, √(x + y√α)); embedding problems with local conditions (InverseGaloisAndArithmeticFundamentalGroups IG.4).
2. 7.5.26: compute the induced representation as a tensor product with the dihedral representation; the local shape at v | p follows from the non-centrality of Frob_v.
3. 7.5.27: the big-image criteria for subgroups of GSp_4 (Lemmas 7.5.18–7.5.19, ArithmeticGaloisRepresentations G7).

**Target acceptance checks**

- Used only for Theorem 10.1.4.
- For Γ = GL_2(F_5) the intersection with Sp_4 is weakly enormous but not enormous.

**Review:** Separated the general dihedral construction from the later totally real specialization. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 10.1.4: modularity of elliptic curves over quadratic extensions via mod 5

**Node:** `AbelianSurfacesPotentialModularity:AP.7/mod-five-quadratic` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Elliptic curves over quadratic fields via mod 5

Let F be totally real with 5 split completely, K/F quadratic with 5 unramified, and E/K an elliptic curve with good ordinary or semistable ordinary reduction at every w | 5. Suppose (1) the projective image of ϱ̄_{E,5} is S_5 = PGL_2(F_5) or S_4, and (2) some r̄_5: G_F → GL_2(F_5) with det r̄_5 = ε̄^{−1} has r̄_5|_{G_K} ≅ ϱ̄_{E,5}. Then E is modular. In particular there are infinitely many modular elliptic curves over K, up to twist, without CM and not coming from a subfield of K; for example F = Q(√d), d > 1 positive and squarefree, d ≡ 1, 4 mod 5, K = Q(d^{1/4}), a field of mixed signature.

**Hypotheses and conventions**

- As stated.

**Source match**

- **BCGP18**, Theorem 10.1.4 and its proof, §10.1, pp. 267–268. Proves modularity of elliptic curves over quadratic extensions of totally real fields whose mod 5 representation extends to the base, by inducing a dihedral twist to GSp_4 and applying the main lifting theorem.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/dihedral-crossing`
- `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`
- `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`
- `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`
- `GL2AutomorphicRepresentationsAndTransfer:R17.4`

**Proof plan**

1. Lemma 7.5.26 applied to r̄_5 gives ρ̄ = Ind_{G_K}^{G_F}(ϱ̄_{E,5} ⊗ δ_{M/K}), vast, tidy and 5-distinguished weight 2 ordinary (Lemma 7.5.27).
2. As in Proposition 10.1.3, r̄_5 comes from an ordinary Hilbert form over F; its base change to K (GL2AutomorphicRepresentationsAndTransfer R17.4), twisted by δ_{M/K} and induced back to F, gives π of parallel weight 2 and central character |·|^2, ordinary above 5, with ρ̄_{π,5} ≅ ρ̄ and ρ_{π,5} pure.
3. Theorem 8.4.1 makes Ind_{G_K}^{G_F}(ϱ_{E,5} ⊗ δ_{M/K}) modular, and the argument of Theorem 9.3.4 makes ϱ_{E,5} ⊗ δ_{M/K}, hence E, modular.

**Target acceptance checks**

- The examples are not CM because their mod 5 representations are not projectively dihedral or cyclic.
- The fields K need not be totally real or CM.

**Review:** Excluded degenerate d for which the advertised real quadratic field is not quadratic. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The Burkhardt quartic, the odd-theta cover P and its twists P(ρ̄)

**Node:** `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover` · **Kind:** construction · **Implementation:** unchecked

**Planet:** Odd-theta cover of the Burkhardt quartic

B := 𝒜_2(3), the moduli of principally polarized abelian surfaces with full level 3 structure; over C it is the complement of the Hessian in the Burkhardt quartic, it is rational over Q (Bruin–Nasserden), and PSp_4(F_3) acts on it. B(2) := 𝒜_2(6) → B is Galois with group S_6 ≅ PSp_4(F_2) = Sp_4(F_2), the identification fixed by the action on the six Weierstrass points of C with Jac(C) = A. P is the intermediate degree 6 cover for the point stabilizers S_5 ⊂ S_6, equivalently the moduli 𝒜_2(3)^− of principally polarized surfaces with a symmetric odd theta structure of level 3; a rational point of P in the image of the Torelli map is a Jacobian with a marked rational Weierstrass point, i.e. of a curve y^2 = f(x) with f quintic. The PSp_4(F_3)-action on P over Q(√−3) descends to Q for the étale group G of symplectic automorphisms of μ_3^2 × (Z/3)^2 modulo ±1. For ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}, P(ρ̄) → B(ρ̄) is the twist by ρ̄ (B(ρ̄) the twisted moduli of AP.6 with n = 3). Proposition 10.2.3: there is a G-equivariant birational map P → P^3 over Q (the odd theta map of Dolgachev–Lehavi, birational by Bolognesi). Lemma 10.2.4: P(ρ̄) is rational over F.

**Hypotheses and conventions**

- ρ̄ has multiplier ε̄^{−1}; F a number field.

**Source match**

- **BCGP18**, §10.2: Definition 10.2.2, Proposition 10.2.3, Lemma 10.2.4 and Remark 10.2.5, pp. 268–271. Defines the degree 6 odd-theta cover P of the level 3 Siegel moduli space, proves it equivariantly rational through the odd theta map, and deduces the rationality of its twists by mod 3 representations with inverse cyclotomic multiplier from the Schur multiplier of PSp_4(F_3).
- **BCGP25**, §8.1 and §9.2.1, pp. 180–183 and 192. Fixes the identification S_6 ≅ Sp_4(F_2) through Weierstrass points and defines the twisted odd-theta moduli and the marked-Weierstrass Jacobian locus.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`
- `PELModuli:M5`
- `PELModuli:M6`
- `tauceti:TauCeti.schurMultiplier`
- `tauceti:TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`
- `mathlib:Equiv.Perm`
- `mathlib:Matrix.symplecticGroup`

**Proof plan**

1. S_6 ≅ Sp_4(F_2): for a genus two curve with Weierstrass points r_1, …, r_6, the fifteen differences r_i − r_j are the nonzero points of A[2], and the Weil pairing of r_i − r_j and r_k − r_l is (−1)^{#({i,j} ∩ {k,l})}; equivalently its additive F₂ exponent is that intersection parity (BCGP25 §8.1.1); the identification is fixed with the point stabilizer S_5(b), distinct from the transitive S_5(a).
2. Proposition 10.2.3 reduces rationality of P(ρ̄) to that of the twist P^3(ρ̄) of P^3 by the class σ ↦ θ(ρ̄^∨(σ)·diag(ε^{−1}(σ), ε^{−1}(σ), 1, 1)) in H^1(F, PGL_4(Q̄)), θ induced by the action of Sp_4(F_3) on μ_3^2 × (Z/3)^2.
3. Lemma 10.2.4: PSp_4(F_3) is perfect with Schur multiplier of order 2, so its Schur cover is Sp_4(F_3) and θ: PSp_4(F_3) → PGL_4(Q̄) lifts to θ̃: Sp_4(F_3) → GL_4(Q̄) (TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff with the Schur multiplier, InductionRestriction layer 7); the lift is unique because Sp_4(F_3) is perfect and commutators in GL_n depend only on images in PGL_n. So the class comes from H^1(F, GL_4(Q̄)) = 0 (Hilbert 90) and P^3(ρ̄) ≅ P^3. The lift must be Galois equivariant for the twisted action: uniqueness of the lift from the perfect Schur cover forces that equivariance. Only then is the lifted expression a GL₄-valued Galois cocycle to which Hilbert 90 applies.
4. Remark 10.2.5: the same argument with PSL_2(F_5) and SL_2(F_5) reproves Shepherd-Barron–Taylor Lemma 1.1.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.burkhardt | data | B = 𝒜_2(3) over Q with its PSp_4(F_3)-action descended to the étale group G. |
| TauCeti.AbelianSurfaces.levelTwoCover | data | B(2) = 𝒜_2(6) → B, Galois with group S_6 ≅ Sp_4(F_2). |
| TauCeti.AbelianSurfaces.oddThetaCover | data | P = 𝒜_2(3)^− → B, the degree 6 cover for the point stabilizer S_5(b). |
| TauCeti.AbelianSurfaces.oddThetaCover_degree | simp | deg(P → B) = [S_6 : S_5] = 6. |
| TauCeti.AbelianSurfaces.sixWeierstrass_equiv | equivalence | S_6 ≅ Sp_4(F_2) through the action on Weierstrass points, with r_i − r_j ↦ A[2] ∖ {0} and Weil pairing the parity of the intersection of index pairs. |
| TauCeti.AbelianSurfaces.oddThetaTwist | constructor | P(ρ̄) → B(ρ̄), the twist of P → B by ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}. |
| TauCeti.AbelianSurfaces.oddTheta_birational | characterisation | A G-equivariant birational map P → P^3 over Q (Proposition 10.2.3). |
| TauCeti.AbelianSurfaces.oddThetaTwist_rational | relation | P(ρ̄) is rational over F (Lemma 10.2.4). |
| TauCeti.AbelianSurfaces.oddThetaTwist_jacobians | other | F-points of P(ρ̄) in the Torelli image are Jacobians of y^2 = f(x) with f quintic, with A[3] ≅ V(ρ̄)^∨. |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.sp4F2_card | computation | \|Sp_4(F_2)\| = 2^4·(2^2 − 1)·(2^4 − 1) = 720 = \|S_6\|. |
| TauCeti.AbelianSurfaces.psp4F3_card | computation | \|Sp_4(F_3)\| = 3^4·(3^2 − 1)·(3^4 − 1) = 51840 and \|PSp_4(F_3)\| = 25920. |
| TauCeti.AbelianSurfaces.schur_psp4F3 | compatibility | TauCeti.schurMultiplier ℂ (PSp_4(F_3)) has order 2, and the corresponding central extension is Sp_4(F_3) → PSp_4(F_3). |
| TauCeti.AbelianSurfaces.weierstrass_pairs | characterisation | The 15 unordered pairs correspond to nonzero A[2]. For two distinct pairs, multiplicative Weil pairing is −1 exactly when they meet in one index, and +1 when disjoint; its additive F₂ exponent is respectively 1 and 0. |
| TauCeti.AbelianSurfaces.transitive_S5_not_P | non-example | The cover of B for a transitive S_5 ⊂ S_6 (image of the outer automorphism) is also of degree 6 but is not P: its rational points do not correspond to rational Weierstrass points. |

**Target acceptance checks**

- P(ρ̄) is rational over F for every ρ̄ with multiplier ε̄^{−1}.
- P → B has degree 6.

**Downstream uses**

- BCGP18, Theorem 10.2.1: rationality of P(ρ̄) gives infinitely many surfaces with fixed 3-torsion
- BCGP18, Theorem 10.2.6: modular surfaces over totally real fields where 3 splits
- BCGP25, §9.2.1: AbelianSurfacesModularity imports P(ρ̄) and the marked-Weierstrass locus from here

**Review:** Corrected multiplicative Weil-pairing signs and included equivariance before Hilbert 90. The unique Schur-cover lift is Galois-equivariant; the multiplicative Weil pairing is −1 for one-point intersection. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Corollary 9.3.6 and Lemma 9.3.7 of BCGP25: local realization at 3 by genus two curves with a rational Weierstrass point

**Node:** `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds` · **Kind:** theorem · **Implementation:** unchecked

Work over Q_3 with ρ̄: G_{Q_3} → GSp_4(F_3) of multiplier ε̄^{−1}, with finite flat ordinary dual ρ̄^∨: its finite-flat model is an extension of an unramified rank-two quotient V̄ by V̄^∨(1). (Corollary 9.3.6) If an ordinary principally polarized abelian surface A_0/F_3 has A_0[3]^{ét} ≅ V̄ and mod 2 image in S_5(b), there is a genus two X/Q_3 with a rational Weierstrass point, Jac(X) good ordinary and residual H^1-representation ρ̄; if A_0 is 3-distinguished in characteristic zero so is Jac(X). (9.3.7) Every such ρ̄ arises in this way from a good ordinary 3-distinguished in characteristic zero Jacobian whose curve has a Q_3-rational Weierstrass point. The seeds: for the nonscalar conjugacy classes of V̄, four explicit quintic curves over F_3 and their unramified quadratic twists; for scalar Frobenius −1 on V̄, the product of elliptic curves over F_3 of traces −1 and 2 (quartic (X^2 + X + 3)(X^2 − 2X + 3), mod 2 permutation of order 6 in S_5(b)), and for +1 its unramified quadratic twist (traces 1 and −2).

**Hypotheses and conventions**

- p = 3; ρ̄ ordinary with finite flat dual (it then comes from a finite flat group scheme over Z_3, unique by Raynaud since e = 1 < p − 1).

**Source match**

- **BCGP25**, Lemma 9.3.4, Remark 9.3.5, Corollary 9.3.6 and Lemma 9.3.7, with Table 9.3.3 and Remark 9.4.4, §§9.3–9.4, pp. 200–206. Lifts ordinary polarized surfaces over F_3 with given 3-torsion to Jacobians over Q_3 with a rational Weierstrass point, and lists seed curves realizing every ordinary mod 3 local representation with finite flat dual.

**Direct prerequisites**

- `AbelianSchemesAndArithmeticModuli:A4`
- `AbelianSchemesAndArithmeticModuli:A5`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`
- `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`
- `AbelianSchemesAndArithmeticModuli:A4/odd-prime-finite-level-lifting`
- `AbelianSchemesAndArithmeticModuli:A4/genus-two-jacobian-lifting`

**Proof plan**

1. Polarized lifting (BCGP25 Lemma 9.3.4, rank of the group 3^4, via truncated Barsotti–Tate lifting and Serre–Tate) and Jacobian lifting (Remark 9.3.5, Torelli tangent isomorphism in genus two) are imported from AbelianSchemesAndArithmeticModuli A4/odd-prime-finite-level-lifting and A4/genus-two-jacobian-lifting, retaining the supplier’s polarized lifting gap.
2. 9.3.6: lift A_0 with its 3-torsion group scheme to a principally polarized A/Z_3 with A[3] ≅ the finite flat model of ρ̄^∨ (unique by Raynaud, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1); A is a Jacobian of a smooth genus two curve; the mod 2 image condition and local constancy of torsion give the rational Weierstrass point.
3. 9.3.7: run through the conjugacy classes of V̄; certify each seed by its étale 3-torsion, not only by its Frobenius quartic.
4. Independent checks of the four quintic seeds give (#X(F₃),#X(F₉)) = (7,15), (7,11), (3,13), (5,11), respectively; Newton identities give exactly the four quartics of Lemma 9.3.7 p. 203. A repeated residual quadratic still requires the étale-torsion Jordan-class check in Lemma 9.3.1; quartic point counts alone do not establish that class.

**Target acceptance checks**

- The scalar seed has two distinct characteristic-zero 3-adic unit roots, hence is 3-distinguished in the source’s sense. Its residual unit roots coincide; no residual p-distinguished hypothesis is claimed.
- The lemma supplies the ordinary local points at v | 3 that Theorems 10.2.1 and 10.2.6 need when F_v = Q_3.

**Review:** Moved the ordinary extension to ρ̄-dual, corrected Corollary/Remark labels, and distinguished characteristic-zero from residual unit-root distinctness. Imported exact A4 polarized and Jacobian lifting nodes, retaining G-polarized-lift; checked all four Frobenius quartics independently. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 10.2.1 (corrected): abelian surfaces with fixed 3-torsion

**Node:** `AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Abelian surfaces with fixed 3-torsion

Let F be a number field and ρ̄: G_F → GSp_4(F_3) with multiplier ε̄^{−1}, V(ρ̄) its symplectic space. Then B(ρ̄) is unirational over F, and there are infinitely many principally polarized abelian surfaces A/F, up to twist, with End_C(A) = Z and ı_3: A[3] ≅ V(ρ̄)^∨; they may be taken to be Jacobians of curves y^2 = f(x) with f quintic. If moreover, for every v | 3, P(ρ̄)(F_v) contains a point of an ordinary principally polarized surface (A[3] ≅ V(ρ̄)^∨ with an F_v-rational odd theta characteristic), the A may also be taken with good ordinary reduction at every v | 3. When F_v = Q_3 this local hypothesis follows from the printed one (ρ̄|_{G_{F_v}} is the 3-torsion of an abelian surface over F_v with good ordinary reduction) by Lemma 9.3.7 of BCGP25; for other F_v the printed form is unproved, since the printed proof takes ordinary points of B(ρ̄)(F_v), whose image need not meet the open and closed image of P(ρ̄)(F_v).

**Hypotheses and conventions**

- F a number field; for the ordinary clause, the stated local hypothesis at every v | 3.

**Source match**

- **BCGP18**, Theorem 10.2.1 and its proof, §10.2, pp. 269–271. Shows that every mod 3 symplectic representation with inverse cyclotomic multiplier is the 3-torsion of infinitely many principally polarized abelian surfaces with trivial geometric endomorphisms, by rationality of the odd-theta cover and Hilbert irreducibility.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`
- `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`
- `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`
- `AbelianSurfacesPotentialModularity:AP.6/galois-types`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2`

**Proof plan**

1. P(ρ̄) is rational (Lemma 10.2.4), so B(ρ̄) is unirational.
2. The level-five cover has geometric projective monodromy PSp₄(F₅). Over arbitrary F its arithmetic monodromy also retains the cyclotomic action on pairing components; a constant Galois PSp₄-cover is not asserted. Apply Hilbert irreducibility with local open conditions to this geometrically connected covering problem to force specialized projective image containing PSp₄(F₅). Its commutator lift contains Sp₄(F₅). This remains irreducible on index-two subgroups, so the Galois-type classification gives End_C(A) = Z. Infinitely many such points up to twist follow by repeating Hilbert irreducibility with avoidance.
3. Ordinary clause: the good ordinary locus is open in P(ρ̄)(F_v) and nonempty by hypothesis (by Lemma 9.3.7 of BCGP25 when F_v = Q_3).

**Target acceptance checks**

- Over Q every such ρ̄ is realized by infinitely many genus two Jacobians y^2 = quintic.
- Only the local requirement at 3 is needed beyond the multiplier condition.

**Review:** Used geometric level-five monodromy with the arithmetic cyclotomic action rather than claiming a constant PSp₄-cover over every base field. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Theorem 10.2.6 (Theorem 1.1.5): infinitely many modular abelian surfaces with trivial endomorphisms

**Node:** `AbelianSurfacesPotentialModularity:AP.7/infinitely-many-modular` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Infinitely many modular abelian surfaces

Let F be totally real with 3 split completely. There are infinitely many abelian surfaces A/F up to twist with End_C(A) = Z which are modular and do not come from any proper subfield of F: for every p, no twist of ρ_{A,p} extends to the absolute Galois group of a proper subfield. For F = Q this is Theorem 1.1.5; the L-function of H^1(A) is then entire, which potential automorphy alone does not give.

**Hypotheses and conventions**

- F totally real, 3 totally split in F.

**Source match**

- **BCGP18**, Theorem 10.2.6 and its proof, §10.2, pp. 271–272; Theorem 1.1.5, §1.1, p. 4. Produces infinitely many modular abelian surfaces with trivial geometric endomorphisms over totally real fields in which 3 splits, combining fixed 3-torsion families, residual modularity of induced mod 3 representations and the ordinary lifting theorem.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion`
- `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`
- `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`
- `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`
- `InverseGaloisAndArithmeticFundamentalGroups:IG.2`
- `mathlib:NumberField.IsTotallyReal`

**Proof plan**

1. Choose a mod 3 representation ρ̄ induced from a totally real quadratic H/F (for example F(√2); the proof's H must be totally real) satisfying case (1) of Proposition 10.1.3, vast and tidy, with multiplier ε̄^{−1}, not extending (up to twist) to a proper subfield.
2. Each F_v = Q_3, and ρ̄|_{G_{F_v}} is ordinary with finite flat dual; Lemma 9.3.7 of BCGP25 gives ordinary points of P(ρ̄)(F_v) (Res_{H_v/F_v}(E) is not used: it has no rational odd theta characteristic).
3. Theorem 10.2.1 gives infinitely many A with A[3] ≅ V(ρ̄)^∨ (printed: A[3] ≅ ρ̄), End_C(A) = Z and good ordinary reduction above 3; Proposition 10.1.3 makes ρ̄ ordinarily modular and Proposition 10.1.1 makes every such A modular.

**Target acceptance checks**

- Over Q there are infinitely many modular A with End_C A = Z up to twist.
- Their L-functions of H^1 are entire.

**Review:** Verified the totally real quadratic H, local Q₃ seed application and dual 3-torsion convention already repaired by the designer. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemma 10.3.1: the paramodular conjecture for ordinary surfaces

**Node:** `AbelianSurfacesPotentialModularity:AP.7/paramodular-lemma` · **Kind:** theorem · **Implementation:** unchecked

**Planet:** Paramodular conjecture for ordinary surfaces

Every abelian surface A/Q satisfying the hypotheses of Proposition 10.1.1 satisfies the paramodular conjecture: there is a holomorphic cuspidal Siegel newform of weight (2,2) and paramodular level equal to the conductor of A, not a Gritsenko lift, with rational Hecke eigenvalues, unique up to scalars, whose spin L-function is L(A,s).

**Hypotheses and conventions**

- F = Q; the hypotheses of Proposition 10.1.1 at some p.

**Source match**

- **BCGP18**, §10.3 and Lemma 10.3.1 with its proof, pp. 272–273. Deduces the paramodular conjecture of Brumer–Kramer for abelian surfaces over Q satisfying the hypotheses of Proposition 10.1.1 from the modularity theorem and local paramodular newform theory.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`
- `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`
- `ModularityAndLanglandsExtensions:ML.4`

**Proof plan**

1. Theorem 8.4.1, as applied in Proposition 10.1.1, gives a general-type L-packet of weight 2 cuspidal representations with ρ_{π,p} ≅ ρ_{A,p} and full local–global compatibility.
2. Twist by |·|; by Schmidt's theorem the paramodular member of each local packet is the generic one; by Roberts–Schmidt Theorems 7.5.1 and 7.5.4(iii) and Gan–Takeda, the paramodular vectors at minimal level form a one-dimensional space and that level is the conductor of the L-parameter (local newform theory, GSp_4 Part II).
3. General type excludes Gritsenko lifts; rationality of the eigenvalues follows from that of the Frobenius traces of A.

**Target acceptance checks**

- The newform has level exactly the conductor N_A.
- It is unique up to scalars.

**Review:** Removed duplicate supplier prerequisites; source statement unchanged. Imported existing Gan–Takeda and removed duplicate ML.4 references; paramodular newform extensions remain requested. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### The paramodular conjecture and its modification (Brumer–Kramer)

**Node:** `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture` · **Kind:** definition · **Implementation:** unchecked

For N ≥ 1 let 𝒜_N be the set of isogeny classes of abelian surfaces A/Q with End_Q A = Z and conductor N, 𝓑_N the set of isogeny classes of fake abelian surfaces (abelian fourfolds B/Q with End_Q B an order in a non-split quaternion algebra D/Q) of conductor N^2, and 𝓟_N the set of holomorphic weight 2 paramodular newforms f of level N, up to scaling, with rational Hecke eigenvalues and orthogonal to the Gritsenko lifts. The original paramodular conjecture asserts a bijection 𝒜_N ↔ 𝓟_N matching L(A,s) = L(f,s,spin). The modified conjecture (Conjecture 10.4.3) asserts a bijection 𝒜_N ⊔ 𝓑_N ↔ 𝓟_N with L(C,s) = L(f,s,spin) for C ∈ 𝒜_N and L(C,s) = L(f,s,spin)^2 for C ∈ 𝓑_N. Both are statements (propositions), not theorems of this roadmap.

**Hypotheses and conventions**

- N ≥ 1; paramodular forms of level N for the paramodular group K(N) ⊂ GSp_4(Q); the spin L-function of a Hecke eigenform.

**Source match**

- **BCGP18**, §10.3 and Conjecture 10.4.3, pp. 272–273 and 277–278. States the paramodular conjecture of Brumer–Kramer, explains that fake abelian surfaces force a modification, and states the modified conjecture with the squared spin L-function for fake surfaces (Brumer–Kramer and its corrigendum, Trans. AMS 372 (2019)).

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`
- `AbelianSchemesAndArithmeticModuli:A6`
- `PeriodsAndSpecialValues:PS.1`
- `AutomorphicBundles:B4`
- `ModularityAndLanglandsExtensions:ML.4`

**Proof plan**

1. Define the three sets from the abelian-variety and Siegel-modular-form carriers and state the two bijection properties.
2. Record the relations: Lemma 10.3.1 proves the matching for every A satisfying Proposition 10.1.1; Lemma 10.3.2 and §10.4 show, conditionally, that fake abelian surfaces contribute forms, so the original formulation must be modified.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.ParamodularConjecture | data | For every N, a bijection 𝒜_N ≅ 𝓟_N with L(A,s) = L(f,s,spin). |
| TauCeti.AbelianSurfaces.ModifiedParamodularConjecture | data | For every N, a bijection 𝒜_N ⊔ 𝓑_N ≅ 𝓟_N with L(C,s) = L(f,s,spin)^{m(C)}, m = 1 on 𝒜_N and 2 on 𝓑_N. |
| TauCeti.AbelianSurfaces.paramodular_instance | other | If A satisfies Proposition 10.1.1 over Q, there is f ∈ 𝓟_{N_A} with L(A,s) = L(f,s,spin), unique up to scaling (Lemma 10.3.1). |
| TauCeti.AbelianSurfaces.modified_of_noFake | relation | If 𝓑_N = ∅, the modified statement at N is the original one at N. |
| TauCeti.AbelianSurfaces.matching_unique | characterisation | The L-function matching determines the bijection: by strong multiplicity one f is determined by its spin L-function and A up to isogeny by L(A,s) (Faltings). |

**Definition/construction tests**

| Test | Kind | Check |
| --- | --- | --- |
| TauCeti.AbelianSurfaces.fake_surface_counterexample | non-example | A fake abelian surface B/Q of conductor N^2 with an associated f ∈ 𝓟_N (L(B,s) = L(f,s,spin)^2) is not in 𝒜_N; the original bijection 𝒜_N ↔ 𝓟_N then fails at N, while the modified one accounts for it (Lemma 10.3.2 and §10.4, conditionally). |
| TauCeti.AbelianSurfaces.instance_ordinary | compatibility | For A/Q satisfying Proposition 10.1.1 with conductor N, the element of 𝓟_N produced by Lemma 10.3.1 is the image of A under the conjectured bijection. |
| TauCeti.AbelianSurfaces.no_fake_reduces | degenerate | If 𝓑_N = ∅ then ModifiedParamodularConjecture at N is ParamodularConjecture at N. |
| TauCeti.AbelianSurfaces.gritsenko_excluded | characterisation | A Gritsenko lift is excluded from 𝓟_N: its spin L-function is a product of shifted Riemann zeta functions and the L-function of an elliptic newform, so its Galois representations contain characters, whereas End_Q(A) = Z makes ρ_{A,l} absolutely irreducible (Faltings). |

**Target acceptance checks**

- Lemma 10.3.1 gives instances for every N realized by an ordinary A as in Proposition 10.1.1.
- The modified conjecture specializes to the original one when 𝓑_N = ∅.

**Downstream uses**

- BCGP18, Lemma 10.3.1: proves instances of the conjecture
- BCGP18, Lemma 10.3.2 and §10.4: explain why fake abelian surfaces force the modification
- BCGP25 (AbelianSurfacesModularity): the 2025 paper's paramodular results are stated against this conjecture

**Review:** Verified original versus modified paramodular propositions, conductor N² for fake surfaces, and the squared spin L-factor; four tests distinguish them. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### Lemma 10.3.2: motives attached to symplectic GL_4 forms, conditionally

**Node:** `AbelianSurfacesPotentialModularity:AP.7/motives-conditional` · **Kind:** theorem · **Implementation:** unchecked

Let F be totally real. Assume the Fontaine–Mazur conjecture, the standard conjectures, the Hodge conjecture and the Tate conjecture (the last is used three times in the sketched proof but is missing from the printed hypotheses), and that the Galois representations of every cuspidal Π on GL_4(A_F) of infinity type φ_{2;1,0} at every v | ∞ form an irreducible weakly compatible system. Let Π be such a representation with rational Hecke eigenvalues, of symplectic type with multiplier |·|^2. Then there is a motive A/F attached to Π which is either (1) an abelian surface or (2) an abelian fourfold with End_F(A) containing an order in a quaternion algebra D/Q (a fake abelian surface). Conversely, assuming only standard automorphy conjectures, an abelian fourfold A/F with End_F(A) ⊗ Q = End_C(A) ⊗ Q an indefinite quaternion algebra gives such a Π.

**Hypotheses and conventions**

- The listed conjectures, including the Tate conjecture, as explicit hypotheses.

**Source match**

- **BCGP18**, Lemma 10.3.2 and its sketched proof, §10.3, pp. 274–276. Shows, under standard conjectures, that a rational symplectic cuspidal GL_4 representation of the relevant infinity type comes from an abelian surface or a quaternionic abelian fourfold, and conversely for indefinite quaternionic fourfolds.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`
- `MotivesAndAlgebraicCycles:MC.7`
- `ModularityAndLanglandsExtensions:ML.0`
- `AbelianSchemesAndArithmeticModuli:A6`
- `ModularityAndLanglandsExtensions:ML.4`

**Proof plan**

1. Under the stated conjectures obtain a pure weight-one motive with the required Hodge realization. The polarizable weight-one rational Hodge structure is H¹ of a complex abelian variety. Its conjugates lie in the countable isogeny class determined by the realization; the descent argument gives a model over a number field. Restrict scalars to F and use the Tate conjecture to algebraize the realization projector, obtaining the required abelian factor. These motivic and descent steps are conditional, not an unconditional Fontaine–Mazur theorem.
2. Albert's classification of the endomorphism algebra leaves type I (abelian surface, End_Q = Z), type II (indefinite D) and type III (definite D, not excluded) (AbelianSchemesAndArithmeticModuli A6).
3. The Tate conjecture is used to see that the p-adic realization of the motive is a sum of copies of r_p, to show that the centre of End(M) ⊗ Q is Q, and to identify h^1(A) with the motive; the converse uses the Mumford–Tate conjecture for type II (Chi). The statements of these conjectures and of the proved Mumford–Tate case are requested at MotivesAndAlgebraicCycles MC.7 and ModularityAndLanglandsExtensions ML.0.

**Target acceptance checks**

- Explains why fake abelian surfaces must enter the paramodular conjecture.
- The conclusion is conditional and is never used to prove an unconditional statement.

**Review:** Expanded the missing motive-to-abelian-variety route and retained every conjecture, including Tate, as a hypothesis. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

#### §10.4: fake abelian surfaces and an explicit genus two curve over Q(√−6)

**Node:** `AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples` · **Kind:** application · **Implementation:** unchecked

Expected Lemma 10.4.4: there are a totally real F, an indefinite quaternion algebra D and an abelian fourfold A/F with End_F(A) ⊗ Q = End_C(A) ⊗ Q = D (sketch: D = (−1,3)_Q, ramified exactly at 2 and 3; the level one Shimura stack of (A, λ, ι: O_D → End A) with a level structure A[p]^∨ = ρ̄ ⊕ ρ̄ for a surjective ρ̄: G_Q → GSp_4(F_p), p > 3, gives a fine moduli space with real points; Moret-Bailly gives F and A, and big image excludes further endomorphisms). Lemma 10.4.6 (corrected): for C: y^2 = Σ a_ix^i over K = Q(√−6), η = 1 − √−6, a_0 = 2^{10}η^6(√−6 − 4), a_1 = 2^{10}η^6·3, a_2 = 2^7η^4(9√−6 + 24), a_3 = −2^8η^4, a_4 = 2^4η^2(−9√−6 + 60), a_5 = 2^4η^2·3 (printed 2^4η·3), a_6 = −2√−6, with discriminant 2^{90}·3^6·(1−√−6)^{30}·(2−√−6)^6, B = Jac(C)/K and A = Res_{K/Q}B: End_Q(A) ⊗ Q = D and End_C(A) ⊗ Q = D × D (printed M_2(D)), D ramified exactly at 2 and 3; B is autochthonous (not isogenous to a twist of its conjugate; the proof prints 'If B were autochthonous' for 'were not'); B gives an irreducible rank 2 compatible system of G_K (printed G_Q) with Hodge–Tate weights (0,1) and determinant ε^{−1}, and A a rank 4 symplectic system of G_Q unramified outside {2,3,5,7,p}.

**Hypotheses and conventions**

- Expected Lemma 10.4.4 is proved only in sketch; Lemma 10.4.6 rests on machine computations of zeta functions at the primes above 11 and of a_𝔭 to exclude CM.
- The explicit example’s endomorphism and compatible-system claims are conditional on the finite CM-exclusion and quaternionic-action certificate in G-CM-certificate; the point counts and discriminant below have been independently checked.

**Source match**

- **BCGP18**, §10.4.2 (p. 277), Expected Lemma 10.4.4 (p. 278), §10.4.5 (p. 279) and Lemma 10.4.6 with its proof (pp. 280–281). Constructs, in sketch, quaternionic abelian fourfolds over totally real fields, discusses type II fourfolds and fake elliptic curves, and gives an explicit autochthonous genus two curve over Q(√−6) whose Weil restriction is a fake abelian surface over Q.

**Direct prerequisites**

- `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`
- `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`
- `PELModuli:M6`
- `PotentialModularityAndCompatibleSystems:R23.1`
- `AbelianSchemesAndArithmeticModuli:A6`
- `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`

**Proof plan**

1. Expected 10.4.4: PEL moduli for quaternionic fourfolds (PELModuli M6), Moret-Bailly (R23.1), big image of the lift. The residual image must be large enough to exclude extra endomorphisms; the lifting argument needs an open symplectic image, not surjectivity onto every integral similitude, whose multiplier is constrained by the cyclotomic field.
2. Exact arithmetic in Q(√−6), using the sextic resultant with its derivative, verifies the displayed discriminant for a₅ = −240−96√−6; the printed a₅ fails this check. Direct counts over F₁₁ and F₁₂₁ at √−6 = 4 give (N₁,N₂) = (8,158), hence numerator (1−2T+11T²)²; at √−6 = −4 they give (10,164), hence (1−T+11T²)². The remaining CM-exclusion and quaternionic-action certificate is G-CM-certificate, not a claimed rerun of Magma.
3. §10.4.2: for type II fourfolds A = Res_{K/Q}(B ⊗ χ), ∧^2V ≅ χ_{K/Q}·(χ∘Ver) (printed ∧^2V ≅ χ_{K/Q}); the conclusion stands.

**Target acceptance checks**

- The corrected a_5 = 2^4η^2·3 = −240 − 96√−6 gives the stated discriminant.
- A_C ≅ B_C × B^σ_C with B_C, B^σ_C non-isogenous, so End_C(A) ⊗ Q = D × D.

**Review:** Separated the expected moduli sketch from the computational example and weakened the unnecessary full-similitude-image claim. All conclusions whose proof chains pass through patched-MCM in defect one are conditional on G-flatness; all stages remain planned. Other recorded supplier gaps propagate along the prerequisite graph.

## Supplier contracts

Every entry identifies the imported theorem or the precise missing extension. A request to an existing stage does not mean its current statement proves the requested extension. The gap register records those limitations. No supplier file is changed by this review.

### `AbelianSchemesAndArithmeticModuli:A2`

Polarizations of abelian surfaces and their degrees, so that 'a polarization of degree prime to p' (BCGP Definition 9.2.3, Proposition 10.1.1) is defined.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/good-primes`.

### `AbelianSchemesAndArithmeticModuli:A3`

The Weil pairing induced by a polarization on A[n] and on Tate modules, alternating with values in μ_n (resp. Z_l(1)), used to make ρ_{A,l} GSp_4-valued with multiplier ε_l^{−1} and to define symplectic torsion isomorphisms.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`.

### `AbelianSchemesAndArithmeticModuli:A4`

Import existing Tate modules, Serre–Tate and /realization-conventions, /polarized-effectivity, /odd-prime-finite-level-lifting and /genus-two-jacobian-lifting. BCGP25 9.3.5 is a Remark. The supplier retains its polarized truncated-BT lifting gap; arbitrary self-dual finite-flat groups are not asserted to lift. Katz–Messing comparison is still requested as an explicit extension.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`.

### `AbelianSchemesAndArithmeticModuli:A5`

Polarized complex uniformization with level structure, used for real points of the twisted Siegel moduli; with A1–A4, the deformation inputs of BCGP25 Lemmas 9.3.4–9.3.5.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`.

### `AbelianSchemesAndArithmeticModuli:A6`

End and Hom of abelian varieties with Rosati positivity (Albert's classification of endomorphism algebras), and the Weil-restriction formula T_l(Res_{K/F}A) ≅ Ind_{G_K}^{G_F}T_l(A) for finite separable K/F.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.6/galois-types`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples`, `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`.

### `AdicSpacesPartII:R2`

Huber's results that adic spaces of finite type over a field have finitely many connected components and that finite étale maps are open and closed (Huber Lemma 1.4.5, Proposition 1.7.8), and connectedness of tubes of connected components of the special fibre (BCGP Corollary 8.2.9).

Needed by: `AbelianSurfacesPotentialModularity:AP.5/connected-components`.

### `AdicSpacesPartII:R3`

Poineau's theorem on connected components of shrinking neighbourhoods in Berkovich/adic geometry, used in (8.2.6) of the proof of Lemma 8.2.5. Extension: normalized trace on finite étale covers of analytic vector-bundle sections, compatible with a correspondence at a different p-adic place; used in the last step of Lemma 8.2.5, pp. 242–243.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`.

### `AnalyticNumberTheory:AN.4`

Meromorphic continuation and functional equation of Artin L-functions over a totally real field, via Brauer induction and Hecke L-functions (BCGP Proposition 9.4.1).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

Existing upstream ClassFieldTheory Layer 5: local Tate duality for finite smooth discrete local Galois modules, applied to the finite adjoint module at v₀. Import this owner; do not replan it in global arithmetic duality.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`.

### `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change`

The totally real quadratic specialization for totally even finite-order characters, with prescribed splitting at the odd p and residual avoidance; quadratic Grunwald–Wang adjustments give roots unramified above p. Imported existing R02.4 targets, not a Brauer-ring computation in R02.2.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`.

### `ArithmeticGaloisDuality:R02.4/tate-h2-qmodz`

Tate’s H²(G_F,Q/Z)=0 with trivial coefficients, used for projective lifts. This is not the generally nonzero Brauer group H²(G_F,Fbar×).

Needed by: `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`.

### `ArithmeticGaloisRepresentations:G7`

Import existing G7 symplectic induction, semisimple GSp₄ determination with specified multiplier, residual enormous/vast/tidy API and the corrected /gsp4-sl2-wreath-vastness-and-tidiness, including PΓL₂ graph and p=3 cyclotomic cases. Lemma 8.3.1’s multiplier uniqueness uses irreducibility on G_{F′}, not just on G_F. Projective lifting and Hodge–Tate refinements remain with G7.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.6/big-image`, `AbelianSurfacesPotentialModularity:AP.6/galois-types`, `AbelianSurfacesPotentialModularity:AP.6/good-primes`, `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/pq-switch`, `AbelianSurfacesPotentialModularity:AP.7/dihedral-crossing`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `AutomorphicBundles:B4`

Siegel automorphic bundles ω^κ of weight (k,l) and holomorphic Siegel modular forms, including paramodular level (BCGP §3.7 for the Hilbert–Siegel case through the Hilbert–Siegel Part II; §10.3 for paramodular forms).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/weights`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`.

### `AutomorphicBundles:B5`

Hilbert–Siegel coherent Hecke complexes and the regular-weight dimension formula (BCGP Theorem 3.10.1, Corollary 3.10.5). For Proposition 7.9.8, derived torsor descent and partial-Hecke level comparison precede the final anaemic localization, which is compared on H⁰ RHom only. Do not request the false all-degree consequence from H⁰ uniqueness.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`.

### `AutomorphicGaloisRepresentations:R19.3`

Purity of the Galois representations of Hilbert modular forms (Blasius), used for the automorphic seeds of Theorem 9.2.8 and Proposition 10.1.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `AutomorphicGaloisRepresentations:R19.4`

Local–global compatibility away from p for Hilbert modular forms, used for the induced seeds in Theorem 9.2.8.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`.

### `AutomorphicGaloisRepresentations:R19.5`

Local–global compatibility at p (Caraiani) for Hilbert modular forms, giving purity at the places above q in Theorem 9.2.8 and above p in Proposition 10.1.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `AutomorphicGaloisRepresentationsPartII:AG2.5`

Pure Weil–Deligne representations and the monodromy rank n(r,N), with BCGP Lemma 2.5.1 in its corrected form: a pure N maximizes rank(N^j) for every j and is the unique Weil–Deligne structure doing so; for dim V = 4 and symplectic N, maximal rank of N alone characterizes it.

Needed by: `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`.

### `AutomorphicLFunctionsAndLocalFactors:AL.2`

Godement–Jacquet L- and ε-factors and the global functional equation for cuspidal representations of GL_n, used for (9.1.5).

Needed by: `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`.

### `AutomorphicSpectralTheory:AS.2/isobaric-sum`

Existing AS.2 definition of isobaric sums of cuspidal GL_n representations. Strong multiplicity one is imported separately from AL.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`.

### `CohomologyComparisons:CP.2`

The crystalline comparison for an abelian variety with good reduction, identifying D_cris(ρ_{A,p}|_{G_{F_v}}) with crystalline H^1 of the reduction with its Frobenius.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.4`

Algebraic Hecke characters attached to CM abelian varieties and Grössencharacters with prescribed reduction (BCGP Proposition 10.1.3(3)), used for potentially abelian surfaces and CM elliptic curves.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `DeformationAndDerivedPatchingAlgebra:P7`

Perfect complexes over complete local O-algebras: the RHom^0-duality of BCGP Lemmas 7.8.5–7.8.6, Pilloni's Nakayama lemma for complexes of complete flat modules (Lemma 7.9.7), localization of a perfect complex at a maximal ideal of a commutative subalgebra of its derived endomorphisms, and the semi-local form of Lemma 4.6.22.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`.

### `DeformationAndDerivedPatchingAlgebra:P8`

The abstract patching proposition BCGP Proposition 7.10.1, in the form of the extraction's item 150 (ideals I_N = ker(S_∞ → 𝒯[Δ_N]) contained in open decreasing ideals), for free and balanced modules.

Needed by: `AbelianSurfacesPotentialModularity:AP.3/patching-datum`.

### `DeformationAndDerivedPatchingAlgebra:P9`

Calegari–Geraghty Lemma 6.2 (codimension of support and depth of a module with a square resolution) and BCGP Lemmas 7.12.2–7.12.3 (comparison of top-dimensional cycles of patched modules over R^1 and R^χ modulo λ, with unit cycle coefficients).

Needed by: `AbelianSurfacesPotentialModularity:AP.3/patched-mcm`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`.

### `DeformationAndDerivedPatchingAlgebra:R03.3`

Depth, maximal Cohen–Macaulay modules and BCGP Lemma 7.13.8 (generic rank of a maximal Cohen–Macaulay module at a smooth point). For the regular-weight generization step also supply the finite-module support criterion of Stacks Project Lemma 10.41.12, Tag 080T, §10.41: a finite A-module flat over the base lets generalizations lift in its support; flatness of A itself is not required.

Needed by: `AbelianSurfacesPotentialModularity:AP.3/patched-mcm`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`.

### `DeformationAndDerivedPatchingAlgebra:R03.5`

Balanced modules admit a square presentation. In this application M = H⁰ RHom_S(C,S), with C perfect of amplitude [0,1] and Euler characteristic zero. H⁰(C) itself is not generally balanced in the asserted way. Use the existing balanced/open-quotient patching targets with this dual convention.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.3/patched-mcm`, `AbelianSurfacesPotentialModularity:AP.3/patching-datum`.

### `DeformationAndDerivedPatchingAlgebra:R03.6`

Cycles Z(M, R) of finite modules, special-fibre cycles and support on components (BCGP §7.12 recollections, Emerton–Gee Proposition 2.2.13).

Needed by: `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

The local Langlands correspondence rec for GL_n over p-adic fields with full Frobenius-semisimple Weil–Deligne parameters (Definition 9.1.1(3)).

Needed by: `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`.

### `FaltingsFinitenessAndIsogenyTheorems:R28.4`

Part II (OpenImageTheoremsForAbelianVarieties, not yet designed): Serre's open image theorem for abelian surfaces with End_C = Z over a number field (ρ̄_{A,l}(G_F) = GSp_4(F_l) for l ≫ 0); Ribet's large image theorem for abelian varieties with real multiplication (SL_2(O_M/λ) ⊂ image for almost all λ, no inner twists); and the density argument of BCGP Lemma 9.2.5 (Chebotarev on the Zariski closure after Sawin, with the Weil-bound reduction). The stage itself supplies Faltings' semisimplicity and Tate conjecture for endomorphisms.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.6/big-image`, `AbelianSurfacesPotentialModularity:AP.6/galois-types`, `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

Connected–étale sequences of p-divisible groups of ordinary abelian schemes, and Raynaud's uniqueness of finite flat models over Z_3 (e = 1 < p − 1) for BCGP25 Lemma 9.3.6.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.3`

Local Langlands for GL_2 in explicit coordinates, used in Theorem 2.7.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.4`

Cyclic and solvable base change for GL_2 over totally real fields and to quadratic extensions, used in Theorem 10.1.4 and Proposition 10.1.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/mod-five-quadratic`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.5`

Automorphic induction and Langlands–Tunnell with Tate's lifting over totally real fields (Proposition 10.1.3, solvable projective image).

Needed by: `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `GlobalGaloisDeformations:G7`

Global deformation problems with fixed multiplier/similitude character for GSp_4 (BCGP Definitions 7.1.2–7.1.5, Lemma 7.1.6).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`.

### `GlobalGaloisDeformations:R04.1`

Deformation functors over complete Noetherian local Λ-algebras with fixed multiplier, framed and unframed.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`.

### `GlobalGaloisDeformations:R04.2`

Representability of global deformation problems with absolutely irreducible ρ̄.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`.

### `GlobalGaloisDeformations:R04.3`

BCGP Proposition 7.2.1: presentation of the global ring over the completed tensor product of local rings, with the number of generators.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.3/patching-datum`.

### `GlobalGaloisDeformations:R04.5`

Taylor–Wiles data for GSp_4 (BCGP §7.6: the augmented problem S_Q, Δ_Q and its Λ[Δ_Q]-structure) and Lemma 7.6.1, Definition 7.6.2, Corollary 7.6.3 (data killing the dual Selmer group, under vast and tidy).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.3/patching-datum`.

### `HigherHidaAndColemanTheory:B7`

Part II contract (BCGP §6.6, not in the current packet): Proposition 6.6.1, Proposition 6.6.2, Theorem 6.6.4 (for #I ≤ 1 the ordinary overconvergent complex is the specialized Hida complex) and Theorem 6.6.5 (ordinary classicity for #I ≤ 1) for Hilbert–Siegel varieties of Res_{F/Q}GSp_4 with p split and Klingen level at I, stated after localizing at a non-Eisenstein maximal ideal of the spherical Hecke algebra (extraction finding E162).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem`.

### `HigherHidaAndColemanTheory:C4`

Part II contract (BCGP §6.5, not in the current packet): Theorem 6.5.8 (overconvergent cohomology classes of small slope are classical, Hilbert–Siegel case) and Lemma 6.5.18 (restriction is an isomorphism on U_{w,1}-finite slope parts).

Needed by: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`.

### `HigherHidaAndColemanTheory:I3`

Part II contract (BCGP §4, not in the current packet): Theorem 4.6.1 (the perfect Hida complex M_I^• over Λ_I of amplitude [0, #I] for Hilbert–Siegel varieties of Res_{F/Q}GSp_4 with p split and Klingen level at I, with its specializations), the weight space Λ_I (§4.4), the p-rank strata (§4.1), the semi-local Lemma 4.6.22, and Lemma 4.5.17 (U_{Iw(w),1}(U_{Kli(w),1} − U_{Iw(w),1}) = U_{w,2} on the ordinary locus).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.1/weights`, `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`, `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`.

### `HigherHidaAndColemanTheory:X8`

Part II contract (BCGP §5, not in the current packet): the doubling theorem, Theorems 5.8.4 and 5.8.6 with Remark 5.8.7 (injectivity of U_{v,1} − 𝔠'_v from Klingen-level to Iwahori-level ordinary weight 2 forms modulo p).

Needed by: `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`, `AbelianSurfacesPotentialModularity:AP.4/doubling-injection`.

### `HilbertModularVarietiesAndShimuraCurves:H4`

Part II (HilbertSiegelModularVarieties, not yet designed): Hilbert–Siegel varieties of G_1 = Res_{F/Q}GSp_4 at parahoric level with toroidal compactifications and the sheaves ω^κ (BCGP §§3.1–3.8); Proposition 7.8.10 (the Taylor–Wiles and Ihara-avoidance covers extend to finite étale torsors over the toroidal compactification); the Ekedahl–Oort stratification with affine strata on the minimal compactification and the Kottwitz–Rapoport strata at Iwahori level (§8.2).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.1/weights`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`.

### `HilbertModularVarietiesAndShimuraCurves:H6`

The Hilbert analogue of twisted torsion moduli with local points, used as the model for the GSp_4 twisted moduli planned here.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`.

### `HodgeTateAndCanonicalSubgroups:T0/fargues-degree`

Existing T0 degree defined using the valuation of the Fitting ideal of invariant differentials, normalized v(p)=1, not ordinary module length over the nondiscrete valuation ring.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`.

### `IntegralHeckeAndGaloisDeterminants:IHG.0`

Connected reductive pseudocharacters, including continuity, already belong to upstream. Only the dense affinoid interpolation application is an extension. Connected reductive pseudocharacters with their invariant-coordinate evaluations, in the GSp_4 instance (upstream layer 0.7); for BCGP25 Theorem 1.8.17, an extension of its scope to affinoid coefficients: GSp_4-pseudocharacters of G_{F^+} over affinoid algebras of the Boxer–Pilloni eigenvariety (V. Lafforgue, Quast).

Needed by: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md), 0.7; existing roadmap; atlas id is a snapshot alias.

### `IntegralHeckeAndGaloisDeterminants:IHG.1`

Residual-irreducible symplectic descent with prescribed multiplier and reductive reconstruction already belong to upstream. Match coefficient and p>2 hypotheses where used. Reconstruction of a representation over a complete local ring from Hecke-valued determinants under residual absolute irreducibility, used to glue in Theorem 7.9.4; four-dimensional determinant laws over affinoid algebras for the interpolation in BCGP25 Theorem 1.8.17.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md), 1.5; existing roadmap; atlas id is a snapshot alias.

### `IntegralHeckeAndGaloisDeterminants:IHG.2`

Localization on actual perfect complexes already belongs to upstream. Operator localization of a Hecke action on a bounded perfect complex at a maximal ideal of its finite image, used to define the localized Hida–Hecke modules.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md), 2.3; existing roadmap; atlas id is a snapshot alias.

### `IntegralHeckeAndGaloisDeterminants:IHG.3`

Full spin/dual-spin convention and multiplier bookkeeping already belong to upstream. The GSp_4 spin and dual-spin Hecke polynomial conventions with the similitude (upstream layer 3a.2), identifying BCGP's Q_v(X) and its comparison with det(X − ρ(Frob_v)).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md), 3a.2; existing roadmap; atlas id is a snapshot alias.

### `IntegralHeckeAndGaloisDeterminants:IHG.4`

Integral finite-quotient interpolation with uniform congruences already belongs to upstream; it is not the dense-affinoid eigenvariety theorem needed here. Interpolation of determinants (and, in the GSp_4 case, pseudocharacters) through a dense family of classical Hecke systems, used for Theorem 1.8.17.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md), 4.1–4.2; existing roadmap; atlas id is a snapshot alias.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.2`

Hilbert irreducibility over number fields with prescribed local open conditions (Theorems 10.2.1, 10.2.6).

Needed by: `AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion`, `AbelianSurfacesPotentialModularity:AP.7/infinitely-many-modular`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.4`

Dihedral embedding problems with local conditions above p (Lemma 7.5.25).

Needed by: `AbelianSurfacesPotentialModularity:AP.7/dihedral-crossing`.

### `LocalGaloisDeformationRings:L7`

Local deformation rings of GSp_4 at p: the P-ordinary and (B,𝔠_v)-ordinary problems D_v^P, D_v^{B,𝔠_v} with their weight algebras, and Proposition 7.3.4 (irreducible generic fibres of the expected dimension).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.3/patching-datum`.

### `LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres`

BCGP Definition 7.3.1 (p-distinguished weight 2 ordinary representations) and the ordinary flag rings of §7.3 (Lemmas 7.3.6–7.3.18, Proposition 7.3.16), including Lemma 7.3.18 (pure points are smooth).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`, `AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary`, `AbelianSurfacesPotentialModularity:AP.6/good-primes`.

### `LocalGaloisDeformationRings:R08.2`

Places away from p for GSp_4: Lemma 7.1.3 (pure points are smooth), Proposition 7.4.2 (unrestricted rings with H^0(ad^0(1)) = 0 are formally smooth and lifts are unramified), Lemma 7.4.4 (Taylor–Wiles places), and the Ihara-avoidance rings R_v^1, R_v^χ (Propositions 7.4.7, 7.4.8; §§7.4.9–7.4.21) with the monodromy-rank description of the components of Spec R_v^1.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.3/patching-datum`, `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`.

### `ModularityAndLanglandsExtensions:ML.0`

The registry of conditional statuses: Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1) and its dependence on the twisted weighted fundamental lemma; rec_{GT,p} normalizations; and, as typed conditional hypotheses for Lemma 10.3.2, the Fontaine–Mazur conjecture and the existence of compatible systems for cuspidal GL_4 forms of type φ_{2;1,0}.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`.

### `ModularityAndLanglandsExtensions:ML.1`

The odd Artin conjecture over totally real fields (Pilloni–Stroh) and the mod 5 argument (Khare–Wintenberger lifts, Kisin's lifting) for Proposition 10.1.3.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `ModularityAndLanglandsExtensions:ML.2`

Potential automorphy of rank 2 compatible systems over totally real fields (Barnet-Lamb–Gee–Geraghty–Taylor Theorems 4.5.1, 5.4.1 and Proposition 5.3.2) and solvable descent (Barnet-Lamb–Geraghty–Harris–Taylor Lemma 1.3).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`.

### `ModularityAndLanglandsExtensions:ML.4`

Import the existing Gan–Takeda LLC, general-type spectrum, non-general-type reducibility, symplectic descent and Shahidi targets. Still request the precise BCGP Iwahori/parahoric invariant tables, normalized p-Hecke operators, regular-weight Galois representations with ordinary refinements, archimedean packets and paramodular newform uniqueness where not supplied. These missing extensions, rather than all of GSp₄ theory, are the Part II boundary.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.1/tame-levels`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`, `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-lemma`.

### `ModularityAndLanglandsExtensions:ML.5`

Import the existing GL_n cyclic descent/induction and available transfers. The remaining BCGP-specific extension consists of Mok’s solvable GSp₄ base change with Iwahori vectors and Roberts’ quadratic GL₂ theta lift with the stated local normalizations. Shahidi exterior-square input already has an ML.4 node.

Needed by: `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`, `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `MotivesAndAlgebraicCycles:MC.7`

Typed statements of the Tate, Hodge and standard conjectures, and the proved Mumford–Tate conjecture for type II abelian fourfolds (Chi), used as hypotheses in Lemma 10.3.2.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`.

### `NeronModelsAndSemistableAbelianVarieties:R11.5`

BCGP Proposition 2.8.1: 𝓡_A is a strictly compatible system, pure of weight 1, with Weil–Deligne representations independent of l at every finite place.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`.

### `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`

Import R21.6’s BCGP small-prime ordinary weight-two lift, with unramified-at-p base field, inverse-cyclotomic determinant, ordinary extension orientation, and the extra p=5 realizability conditions. The dihedral branch retains the supplier’s explicit gap.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`.

### `PELModuli:M5`

Siegel moduli of principally polarized abelian surfaces with full level n structure (𝒜_2(n)), and PEL moduli for quaternionic abelian fourfolds.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`, `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `PELModuli:M6`

Fine moduli schemes 𝒜_2(n) at rigidifying level n ≥ 3 with universal abelian scheme, used for the twisted moduli and the covers 𝒜_2(6) → 𝒜_2(3).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`, `AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples`, `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `PadicHodgeTheory:R06.2`

D_cris and its Frobenius for crystalline representations of G_{Q_p}.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`.

### `PadicMeasuresIwasawaAlgebras:L1`

Completed group rings O[[O_{F_v}^×(p)]] and O[[(O_{F_v}^×(p))^2]] and their characters (the weight algebras Λ_v).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/deformation-problems`, `AbelianSurfacesPotentialModularity:AP.1/weights`.

### `PeriodsAndSpecialValues:PS.1`

Completed motivic L-functions of compatible systems and of abelian varieties and curves, with Conjecture 1.1.1 (Hasse–Weil), Conjecture 2.8.6 and Corollary 2.8.7 (the conjectural functional equation), as statements.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety`, `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`, `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`, `AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`.

### `PotentialAutomorphyInfrastructure:PA.5/corrected-rank-two-large-image`

Import the corrected rank-two theorem: density-one residual images contain SL₂(F_l) over the normal closure. Do not strengthen it to SL₂ of the full residue coefficient field; real-multiplication image is a separate input.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`.

### `PotentialModularityAndCompatibleSystems:R23.1`

Moret-Bailly's theorem with prescribed local open sets, splitting and linear disjointness (BLGGT Proposition 3.1.1), applied to twisted Siegel moduli and to varieties of GL_2(F_q)-torsors with fixed determinant.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli`, `AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples`.

### `PotentialModularityAndCompatibleSystems:R23.2`

BCGP Proposition 9.1.11 input: the auxiliary moduli problem for potential ordinary modularity of a mod q representation over a totally real field.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`.

### `PotentialModularityAndCompatibleSystems:R23.3`

BCGP Proposition 9.1.11: potential ordinary modularity of r̄_q over F_1F'' by restriction of scalars, with a q-ordinary weight 0 form of trivial central character unramified above pq.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`.

### `PotentialModularityAndCompatibleSystems:R23.5`

Auxiliary solvable totally real extensions with prescribed local behaviour, linear disjointness and splitting (item 188 of the extraction), used in Corollary 7.9.6, Theorem 8.4.1 and Theorem 9.2.8.

Needed by: `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`, `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`.

### `PotentialModularityAndCompatibleSystems:R24.5`

The Brauer-induction argument for meromorphic continuation from potential automorphy over solvable subextensions (Taylor, Remarks on a conjecture of Fontaine and Mazur, Corollary 2.2).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`.

### `PotentialModularityAndCompatibleSystems:R24.5:operations`

Compatible systems as actual representations with common Frobenius polynomials, strictly compatible systems, and their operations (restriction, induction, exterior square, tensor products) in rank 4.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`, `AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions`.

### `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`

Existing formal Hilbert–Siegel Koecher target C5, with its normal formal model and Stein/formal comparison hypotheses. Its recorded formal-comparison gap propagates to AP.5; C3’s algebraic Koecher principle alone is insufficient.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`.

### `ShimuraData:D5`

BCGP Lemma 7.8.3: a level with pro-v Iwahori component at an absolutely unramified place of residue characteristic > 5 is neat.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/tame-levels`.

### `SmoothRepresentationsOfLocalGroups:SR.1`

The positive Klingen Hecke algebra is existing upstream; the BCGP pro-Iwahori extension is imported from the atlas supplier node. BCGP Proposition 2.4.2: the pro-v Iwahori Hecke algebra of a split group and the homomorphism T(F_v) → (H_1[1/p])^×; the positive Klingen Hecke algebra of GSp_4 (klingen-positive-hecke, SR.1.4).

Needed by: `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.1/tame-levels`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md), SR.1.4; existing roadmap; atlas id is a snapshot alias.

### `SmoothRepresentationsOfLocalGroups:SR.2`

Use the existing upstream local-representation framework and the atlas Borel/Casselman targets; no replan. BCGP Propositions 2.4.3–2.4.4: Iwahori and pro-v Iwahori invariants through Jacquet modules.

Needed by: `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md), SR.2; existing roadmap; atlas id is a snapshot alias.

### `SmoothRepresentationsOfLocalGroups:SR.4`

SpinPolynomial.reciprocal and the spin–Galois dictionary already belong to upstream; no replan. The GSp_4 spherical spin polynomial and its reciprocal monic form `SpinPolynomial.reciprocal` (gsp4-spin-polynomial, SR.4.5), with the generator dictionary T_{v,1} = T₂, T_{v,2} = T₁, and the spin–Galois comparison gsp4-galois-comparison.

Needed by: `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`.

Existing [upstream source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md), SR.4.5; existing roadmap; atlas id is a snapshot alias.

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`

Existing Tau Ceti layer, cited as it stands: hyperelliptic models y^2 = f(x) of genus two curves, with rational Weierstrass points giving quintic models.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`, `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Existing Tau Ceti layer, cited as it stands: the Chebotarev density theorem in Dirichlet density, used to choose auxiliary places (v_0, Taylor–Wiles places, good primes and the strengthened q) and to compare Galois representations through Frobenius traces.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses`, `AbelianSurfacesPotentialModularity:AP.6/big-image`, `AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions`, `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.6/pq-switch`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Existing Tau Ceti layer, cited as it stands: elliptic curves over finite fields and the Hasse bound |a| ≤ 2√q, which bounds the traces ±p used in the corrected Lemma 9.2.7 (the existence direction is a recorded gap).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/pq-switch`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

Existing Tau Ceti layer, cited as it stands: the Jacobian of a genus two curve as the relative Picard scheme.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`, `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`, `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`

Existing Tau Ceti layer, cited as it stands: the Jacobian is an abelian variety (principally polarized of dimension 2 for a genus two curve).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`, `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Existing Tau Ceti layer, cited as it stands: Abel–Jacobi and the universal property, identifying H^1 of C with H^1 of Jac(C).

Needed by: `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`

Existing Tau Ceti layer, cited as it stands: Brauer's induction theorem, used for meromorphic continuation in Theorem 9.3.1 and for Artin L-functions in Proposition 9.4.1.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`

Existing Tau Ceti layer, cited as it stands: projective representations, factor sets and the Schur multiplier, used in Lemma 10.2.4.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one`

Existing strong multiplicity one for isobaric GL_n representations, including cuspidal GL₄.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`.

### `HodgeTateAndCanonicalSubgroups:T0/fargues-degree-properties`

Existing additivity, Cartier duality and étale/multiplicative endpoint criteria for Fargues degree.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`.

### `ArithmeticGaloisDuality:R02.4/grunwald-wang`

Existing quadratic character adjustment with prescribed local roots, used after killing the square-root Brauer obstruction.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`.

### `ArithmeticGaloisRepresentations:G7/gsp4-sl2-wreath-vastness-and-tidiness`

Existing corrected induced-image theorem, including the semilinear graph case and explicit tidiness witness.

Needed by: `AbelianSurfacesPotentialModularity:AP.6/big-image`, `AbelianSurfacesPotentialModularity:AP.6/pq-switch`.

### `AbelianSchemesAndArithmeticModuli:A4/odd-prime-finite-level-lifting`

Existing polarized finite-level lifting target, conditional on the supplier’s truncated-BT criterion and lifting gap.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`.

### `AbelianSchemesAndArithmeticModuli:A4/genus-two-jacobian-lifting`

Existing marked genus-two Torelli deformation equivalence; combined with the finite-level supplier.

Needed by: `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`.

### `ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4`

Existing Gan–Takeda correspondence with similitude and twisting normalization.

Needed by: `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`, `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`.

### `ModularityAndLanglandsExtensions:ML.4/gl4-symplectic-descent`

Existing generic descent and conditional full-packet descent, retaining its dependency gate.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`.

### `ModularityAndLanglandsExtensions:ML.4/shahidi-exterior-square`

Existing at-s=1 pole/nonvanishing theorem and cyclic-base-change factorization.

Needed by: `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`.

## Gaps and stage completion

### Gap 1 — Higher Hida and Coleman theory for Hilbert–Siegel varieties (BCGP §§4–6) has no planning owner yet

The reviewed extraction of BCGP routes 85 items of §§3.9–6 (Hida complexes M_I^• for Res_{F/Q}GSp_4 with Klingen level at I, the doubling theorem of §5, higher Coleman theory and classicality of §6) to HigherHidaAndColemanTheory. That roadmap's design packet plans Boxer–Pilloni's theory for GSp_{2g} over Q and Pilloni's Klingen complex over Q, not these Hilbert–Siegel statements. This packet records them as requests at its stages I3, X8, C4 and B7; they become real once that roadmap is revised to absorb route 2, or a Part II of it plans BCGP §§4–6 (see restructure).

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.1/weights`, `AbelianSurfacesPotentialModularity:AP.2/doubling-surjections`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.4/doubling-injection`, `AbelianSurfacesPotentialModularity:AP.4/eigenspaces`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`, `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem`. Dependence continues along the prerequisite graph.

### Gap 2 — BCGP-specific supplier extensions remain after importing existing targets

The parent packets now contain significant inputs: ML.4 Gan–Takeda, spectrum/descent and exterior-square nodes, G7 corrected residual-image nodes, A4 finite-level lifting targets and C5 formal Koecher. Import those exact targets. Still unresolved are the Hilbert–Siegel geometry/coherent-Hecke comparison extensions, the regular-weight Galois and BCGP-specific parahoric/newform/base-change contracts not provided by the inspected ML nodes, and open-image inputs beyond Faltings. Repoint only these missing contracts when Part II stages are registered. No existing upstream layer is planned again.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system`, `AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation`, `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced`, `AbelianSurfacesPotentialModularity:AP.1/hecke-modules`, `AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses`, `AbelianSurfacesPotentialModularity:AP.1/tame-levels`, `AbelianSurfacesPotentialModularity:AP.1/weights`, `AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois`, `AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary`, `AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent`, `AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`, `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary`, `AbelianSurfacesPotentialModularity:AP.6/big-image`, `AbelianSurfacesPotentialModularity:AP.6/galois-types`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois`, `AbelianSurfacesPotentialModularity:AP.6/good-prime-density`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.7/motives-conditional`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture`, `AbelianSurfacesPotentialModularity:AP.7/paramodular-lemma`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`. Dependence continues along the prerequisite graph.

### Gap 3 — Deuring's existence theorem for ordinary elliptic curves over F_q with prescribed trace

The corrected Lemma 9.2.7 and Theorem 9.2.8 need, for a prime q > p^2, ordinary elliptic curves over F_q of traces p and −p (Deuring; Waterhouse Theorem 4.1: every t with |t| < 2√q and q ∤ t is a trace). Tau Ceti's EllipticCurves roadmap supplies only the Hasse bound (layer 3); no atlas layer plans the existence direction. Proposed owner: EllipticCurves, Part II.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.6/pq-switch`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`. Dependence continues along the prerequisite graph.

### Gap 4 — Cohomology of Kummer surfaces

Proposition 9.4.1 needs H^*(Km(A), Q_p) = H^{even}(A, Q_p) ⊕ (16 exceptional classes, an Artin representation twisted by Q_p(−1)) for the minimal resolution of A/⟨−1⟩. No atlas layer plans Kummer or K3 surfaces; the proposed K3 roadmap (K3SurfacesAndSymplecticBoundedness, design pending) is the natural owner.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces`. Dependence continues along the prerequisite graph.

### Gap 5 — Arthur's classification for GSp_4 remains conditional

Theorem 2.9.3 (descent from GL_4 of symplectic type to GSp_4) rests on Arthur's multiplicity formula for GSp_4 (BCGP §1.4.1), whose status is recorded at ModularityAndLanglandsExtensions ML.0 and ML.4. Every theorem of this roadmap from Proposition 7.13.11 on carries this dependence; it is a recorded hypothesis, not a planned proof.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`, `AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions`, `AbelianSurfacesPotentialModularity:AP.5/solvable-descent`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`. Dependence continues along the prerequisite graph.

### G-flatness — Defect-one action through the maximal O-flat quotient

Balancedness does not imply O-flatness of M_∞. Prove O-flatness or directly that the kernel R_∞→(R_∞)′ annihilates M_∞ before using the flat-quotient dimension in Proposition 7.11.2. Remark 7.3.17 leaves the relevant Borel-ring flatness open. The corrected patched-MCM node is conditional; every proof route through it inherits this gap. This review supplies no proof of that factorization.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.3/patched-mcm`, `AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem`, `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem`, `AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho`, `AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem`, `AbelianSurfacesPotentialModularity:AP.6/potential-modularity`, `AbelianSurfacesPotentialModularity:AP.6/potential-automorphy`, `AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two`, `AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic`, `AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity`, `AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases`, `AbelianSurfacesPotentialModularity:AP.7/mod-five-quadratic`, `AbelianSurfacesPotentialModularity:AP.7/infinitely-many-modular`. Dependence continues along the prerequisite graph.

### G-affinoid — Dense affinoid interpolation for the ordinary weight-two Galois representation

Current upstream IntegralHeckeAndGaloisDeterminants owns continuous reductive pseudocharacters, reconstruction and integral finite-quotient interpolation. Its §§4.1–4.2 hypotheses do not directly give analytic interpolation from a dense eigenvariety family. Supply the exact affinoid continuity/interpolation theorem and ordinary-filtration specialization used in BCGP25 Theorem 1.8.17, or give a proof reducing to that existing interface. Do not replan the pseudocharacter theory itself.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.0/weight-two-galois`. Dependence continues along the prerequisite graph.

### G-analytic-formal — Shrinking-neighbourhood components and formal Koecher comparison

The requested Huber/Poineau shrinking-neighbourhood and tube-component statements are not established merely by the R2 formal-model and R3 coherent-sheaf summaries. Supply those exact analytic contracts. C5/formal-hilbert-siegel-koecher already plans the formal extension, with a normal-formal-model/Stein comparison gap that propagates here. The final finite-étale trace comparison is also requested explicitly.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent`, `AbelianSurfacesPotentialModularity:AP.5/connected-components`, `AbelianSurfacesPotentialModularity:AP.5/gluing-theorem`. Dependence continues along the prerequisite graph.

### G-polarized-lift — Polarized truncated-BT lift criterion in the local seed supplier

A4/odd-prime-finite-level-lifting explicitly retains G-odd-level: the polarized truncated-BT criterion and its extension to a full tower (Wedhorn (2.17)). Import its conditional contract; do not infer arbitrary self-dual finite-flat groups lift. The local Q₃ seed theorem depends on closing that supplier gap.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.7/local-three-seeds`, `AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion`, `AbelianSurfacesPotentialModularity:AP.7/infinitely-many-modular`. Dependence continues along the prerequisite graph.

### G-CM-certificate — Finite certificate excluding CM in the explicit quaternionic example

The corrected discriminant and both F₁₁ zeta numerators have been independently recomputed. These do not by themselves exclude potential CM. Supply a finite list of quadratic extensions of K unramified outside bad reduction and Frobenius witnesses ruling each out, together with the quaternionic-action specialization from Baba–Granath. The paper’s norm<1000 computation is not reproduced by this review. The endomorphism and compatible-system conclusions of the explicit example are conditional on that certificate.

Directly affected targets: `AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples`. Dependence continues along the prerequisite graph.

### AbelianSurfacesPotentialModularity:AP.0 — planned

- Discharge the regular-weight GSp₄ Galois-representation extension at ML.4 and the dense-affinoid interpolation extension of current upstream IHG for Theorem 1.8.17. Gan–Takeda is already an exact existing supplier target and is imported.
- Discharge NeronModelsAndSemistableAbelianVarieties R11.5 (Proposition 2.8.1) and PotentialModularityAndCompatibleSystems R24.5:operations for the compatible-system API.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.

### AbelianSurfacesPotentialModularity:AP.1 — planned

- Discharge the HigherHidaAndColemanTheory I3 and B7 contracts (Theorem 4.6.1, Lemma 4.6.22, Theorem 6.6.5 for Hilbert–Siegel varieties), which its current packet does not plan.
- Discharge the Hilbert–Siegel contract at HilbertModularVarietiesAndShimuraCurves H4 (Proposition 7.8.10) and the coherent-Hecke contract at AutomorphicBundles B5 (Corollary 3.10.5).
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.

### AbelianSurfacesPotentialModularity:AP.2 — planned

- Discharge the doubling contract at HigherHidaAndColemanTheory X8 (Theorem 5.8.6) and the descent contract at AutomorphicBundles B5 (Proposition 7.9.8 with final H⁰-dual localization).
- Discharge the GSp_4 Part II contracts at ML.4 and ML.5 (Theorem 2.7.2, Propositions 2.4.13–2.4.30, Lemmas 2.4.33–2.4.37, Mok's base change).
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.

### AbelianSurfacesPotentialModularity:AP.3 — planned

- Discharge DeformationAndDerivedPatchingAlgebra P8, P9, R03.5 (Proposition 7.10.1 in the form of item 150, Calegari–Geraghty Lemma 6.2) and the dimension inputs at LocalGaloisDeformationRings L7, R08.2.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.
- Any route using the defect-one patched-MCM theorem retains G-flatness until its quotient action is proved.

### AbelianSurfacesPotentialModularity:AP.4 — planned

- Discharge the Roberts–Schmidt and Arthur-classification inputs at ML.4, the Ihara-avoidance ring structure at LocalGaloisDeformationRings R08.2, and the cycle lemmas at DeformationAndDerivedPatchingAlgebra P9, R03.6.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.
- Any route using the defect-one patched-MCM theorem retains G-flatness until its quotient action is proved.

### AbelianSurfacesPotentialModularity:AP.5 — planned

- Discharge the higher Coleman contracts at HigherHidaAndColemanTheory C4 and B7 (Theorems 6.5.8, 6.6.4, Lemma 6.5.18), the Ekedahl–Oort and Kottwitz–Rapoport strata at HilbertModularVarietiesAndShimuraCurves H4, and the transfers at ML.5.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.
- Any route using the defect-one patched-MCM theorem retains G-flatness until its quotient action is proved.

### AbelianSurfacesPotentialModularity:AP.6 — planned

- Discharge the OpenImage Part II contract at FaltingsFinitenessAndIsogenyTheorems R28.4 and the Katz–Messing request at AbelianSchemesAndArithmeticModuli A4.
- Close the Deuring gap (elliptic curves over F_q with prescribed trace) and the Kummer-surface cohomology gap recorded under gaps.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.
- Any route using the defect-one patched-MCM theorem retains G-flatness until its quotient action is proved.

### AbelianSurfacesPotentialModularity:AP.7 — planned

- Discharge the remaining paramodular newform extension at ML.4 and the conjectural inputs at MC.7/ML.0. Import the existing A4 polarized finite-level and Jacobian lifting targets for BCGP25 Lemma 9.3.4/Remark 9.3.5, retaining their supplier gap.
- Implement the audited targets and close each applicable recorded gap; no implementation or stage closure is asserted by this review.
- Any route using the defect-one patched-MCM theorem retains G-flatness until its quotient action is proved.

## Reproducible arithmetic checks

The review used exact arithmetic rather than a floating-point or symbolic approximation. For the sextic, represent Q(√−6) by rational pairs with (a,b)(c,d)=(ac−6bd,ad+bc). Compute the determinant of the Sylvester matrix of f and f′ by exact elimination, and multiply by (−1)¹⁵/a₆. Substitution of the corrected a₅ gives the displayed discriminant; substitution of the printed coefficient does not. This calculation checks the coefficient and discriminant only.

For a squarefree hyperelliptic equation over F_r with r odd, count affine points by summing 1+χ(f(x)). Add one point at infinity in odd degree and 1+χ(a₆) in degree six. Repeat over F_{r²}, constructing the quadratic field by an irreducible quadratic; then a₁=r+1−N₁ and a₂=(a₁²−(r²+1−N₂))/2. This yields the following checks.

| Input | N₁ | N₂ | Frobenius polynomial (descending coefficients) |
| --- | --- | --- | --- |
| Sextic at 11, √−6=4 | 8 | 158 | (1, −4, 26, −44, 121) = (X²−2X+11)² |
| Sextic at 11, √−6=−4 | 10 | 164 | (1, −2, 23, −22, 121) = (X²−X+11)² |
| F₃ quintic coefficients (1,2,0,0,0,1), ascending | 7 | 15 | (1, 3, 7, 9, 9) |
| F₃ quintic coefficients (1,1,0,1,0,1), ascending | 7 | 11 | (1, 3, 5, 9, 9) |
| F₃ quintic coefficients (0,1,1,0,0,1), ascending | 3 | 13 | (1, −1, 2, −3, 9) |
| F₃ quintic coefficients (1,0,1,0,1,1), ascending | 5 | 11 | (1, 1, 1, 3, 9) |

Point counts do not determine a repeated-root residual étale-torsion Jordan class; Lemma 9.3.1 is still needed for the seed classification. Nor do these two reductions prove the non-CM/quaternionic endomorphism claims: G-CM-certificate remains open.

## Source findings

All descriptions below are paraphrases. The structured packet records edition checks and a confirmed independent-review verdict for each finding. Twenty-four findings carry existing atlas provenance (including the reviewed extraction brief); two concern the BCGP25 rank/seed slips. The review does not claim to have discovered the older findings.

### AbelianSurfacesPotentialModularity/E1 — gap

**BCGP18**, arXiv:1812.09269v3: Proposition 7.11.2 p. 226 and Remark 7.3.17; published pp. 426–427 and 380. Affects: the proof.

**Issue:** The patched balanced module in defect one is used as a module over the maximal O-flat quotient without proving that the action factors through it. (Paraphrase, not a source quotation.)

**Correction:** Prove O-flatness of M_∞ or directly the required factorization; G-flatness records this unresolved requirement.

**Reason:** A square presentation does not imply O-flatness; the ring dimension used is the flat quotient’s dimension, and the local Borel-ring flatness is expressly left open.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E125; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E2 — error

**BCGP18**, arXiv:1812.09269v3: Lemma 7.5.22 pp. 204–205, used in Lemma 9.2.2 pp. 254–255; published pp. 400–401. Affects: the proof.

**Issue:** The image comparison omits field automorphisms of PSL₂(k), leading to a wreath-product assertion in every case. (Paraphrase, not a source quotation.)

**Correction:** Use PΓL₂(k) and the index-two extension of the semilinear graph in the nontrivial involution case; prove tidiness with an explicit multiplier −1 element.

**Reason:** For inert real multiplication the residual coefficient field is F_{l²} and conjugation induces its nontrivial field automorphism. The wreath product is too large. The existing corrected G7 supplier proves the graph case.

**Provenance:** Existing reviewed atlas findings PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E109 and E138; the purported semidirect-product repair is replaced here by the exact corrected G7 semilinear-graph theorem.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E3 — misprint

**BCGP18**, arXiv:1812.09269v3: Definition 9.1.8 p. 251. Affects: nothing.

**Issue:** The local compatibility condition uses the representation already attached to π instead of the input ρ. (Paraphrase, not a source quotation.)

**Correction:** Use WD(ρ|G_{F_v}) in the defining equality.

**Reason:** With the printed parameter the condition is independent of ρ; a Frobenius trace test distinguishes the corrected predicate.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E135; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E4 — error

**BCGP18**, arXiv:1812.09269v3: Corollary 7.9.6 pp. 220–221. Affects: a stated result.

**Issue:** The extra assertions are made without requiring the residual ordinary shape used in the proof. (Paraphrase, not a source quotation.)

**Correction:** Add p-distinguished weight-two residual ordinarity before applying Theorem 7.9.4, or use the newer BCGP25 theorem for its broader semisimplified conclusions.

**Reason:** Hypothesis 7.8.1 includes that local residual condition.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E121; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E5 — error

**BCGP18**, arXiv:1812.09269v3: Proposition 9.1.12 pp. 252–253; published pp. 458–459. Affects: a stated result.

**Issue:** The construction asserts descent of the G-extension to K and an incompatible disjointness involving L′ and E′. (Paraphrase, not a source quotation.)

**Correction:** Construct only L′/KE′, with K avoiding E′Favoid. In the fixed-determinant variant force L′∩KE′Favoid=KE′(ψ̄) using the extra auxiliary places of the corrected node.

**Reason:** Asymmetric local data at conjugate places need not descend. Since L′ contains E′, the printed absolute disjointness is impossible for nontrivial E′/E.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E137; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E6 — error

**BCGP18**, arXiv:1812.09269v3: Lemma 9.2.7 pp. 256–257. Affects: a stated result.

**Issue:** The q-local auxiliary representation is required to match arbitrary residual torsion of A while its chosen unit roots are F_q-rational. (Paraphrase, not a source quotation.)

**Correction:** Choose auxiliary unit roots a=p and b=−p, strengthen q>p² and the discriminant-square conditions, and match ρ̄_{A,q} only at the places above p.

**Reason:** The unit roots of A at q need not belong to F_q. Deuring’s existence theorem supplies the new ordinary elliptic seeds once its recorded supplier gap is closed.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E139; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E7 — gap

**BCGP18**, arXiv:1812.09269v3: Lemma 9.2.7 proof pp. 256–257. Affects: the proof.

**Issue:** A square-root character twist is used to correct a determinant in F_q×. (Paraphrase, not a source quotation.)

**Correction:** Construct the fixed determinant at the torsor level and force its exact intersection by the two auxiliary sets in AP.6/fixed-determinant-extensions.

**Reason:** An arbitrary F_q×-valued character need not have an F_q×-valued square root; enlarging coefficients would lose the required prime-field image.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E140; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E8 — misprint

**BCGP18**, arXiv:1812.09269v3: Theorem 9.2.8 proof pp. 257–258. Affects: nothing.

**Issue:** The induced GSp₄ seed is described with trivial central character. (Paraphrase, not a source quotation.)

**Correction:** Its central character is |·|² in the normalization used by the lifting theorem.

**Reason:** The GL₄ transfer is induced from the normalized GL₂ form twisted by |·|; its symplectic multiplier and H¹ realization require this normalization.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E141; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E9 — misprint

**BCGP18**, arXiv:1812.09269v3: Corollary 9.3.3 p. 259; published p. 466. Affects: nothing.

**Issue:** The completed zeta function of the curve is reflected using the dimension-two reflection sum. (Paraphrase, not a source quotation.)

**Correction:** For the curve use s↦2−s, retaining s↦3−s for the full zeta function of the abelian surface.

**Reason:** The factors in degrees zero and two are exchanged by 2−s, and the weight-one factor has the same reflection.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E143; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E10 — error

**BCGP18**, arXiv:1812.09269v3: Theorem 9.3.4 pp. 259–261. Affects: a stated result.

**Issue:** The more-precise cuspidal GL₂ conclusion is asserted also when CM endomorphisms are all defined over K. (Paraphrase, not a source quotation.)

**Correction:** In the split CM case use the sum of two Hecke characters; retain the analytic conclusion in every case.

**Reason:** For an elliptic curve with all CM endomorphisms over K its H¹ is reducible, so cannot be the representation of a cuspidal GL₂ form over that field.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E144; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E11 — error

**BCGP18**, arXiv:1812.09269v3: Proposition 10.1.3 pp. 265–267. Affects: a stated result.

**Issue:** The ordinary residual modularity construction also claims unramifiedness at p. (Paraphrase, not a source quotation.)

**Correction:** Retain ordinarity and allow the semistable ordinary Steinberg case.

**Reason:** A très ramifiée ordinary local extension requires a semistable ordinary lift and need not admit the claimed unramified automorphic component.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E147; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E12 — gap

**BCGP18**, arXiv:1812.09269v3: Theorem 10.2.1 pp. 269–271; published pp. 477–480. Affects: the proof.

**Issue:** The ordinary points supplied on B(ρ̄) are treated as ordinary points on its degree-six odd-theta cover P(ρ̄). (Paraphrase, not a source quotation.)

**Correction:** Assume ordinary P-points, or prove them; BCGP25 Corollary 9.3.6 and Lemma 9.3.7 supply the local Q₃ repair subject to their polarized-lifting input.

**Reason:** A local point of the base need not lift through a finite cover, and the local image can be open and closed. The stronger corrected hypothesis is recorded explicitly.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E149; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E13 — misprint

**BCGP18**, arXiv:1812.09269v3: Theorem 10.2.6 proof pp. 271–272; published pp. 480–481. Affects: nothing.

**Issue:** The auxiliary quadratic field is not stated to be totally real, and the torsion identification is written without the cohomological dual. (Paraphrase, not a source quotation.)

**Correction:** Choose H=F(√2), which is totally real and genuinely quadratic when 3 splits completely in F, and use A[3]≅V(ρ̄)^∨.

**Reason:** The residual modularity input requires a totally real inducing field; torsion has cyclotomic multiplier while the cohomological system has inverse-cyclotomic multiplier.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E150; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E14 — gap

**BCGP18**, arXiv:1812.09269v3: Lemma 10.3.2 sketch pp. 274–276. Affects: a stated result.

**Issue:** The listed conjectural hypotheses omit the Tate conjecture despite its use in the motivic identification. (Paraphrase, not a source quotation.)

**Correction:** Include Tate explicitly, along with Fontaine–Mazur, Hodge, standard conjectures and the stated compatible-system assumption.

**Reason:** The realization projector and the endomorphism-algebra/motive identifications require the missing hypothesis.

**Provenance:** Existing reviewed extraction brief and item 138 of PAPER-BOXER-CALEGARI-GEE-PILLONI-21; the source’s proof invokes Tate explicitly. This review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E15 — misprint

**BCGP18**, arXiv:1812.09269v3: Lemma 10.4.6 table p. 280; published p. 490. Affects: nothing.

**Issue:** The x⁵ coefficient uses a single power of η. (Paraphrase, not a source quotation.)

**Correction:** Use a₅=48η²=−240−96√−6.

**Reason:** Exact resultant arithmetic gives the displayed discriminant only with the squared η; direct reductions give the displayed F₁₁ curves only with this coefficient.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E155; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E16 — error

**BCGP18**, arXiv:1812.09269v3: Lemma 10.4.6 p. 280; published p. 490. Affects: a stated result.

**Issue:** The geometric endomorphism algebra of the restriction of scalars is given as a two-by-two matrix algebra over D. (Paraphrase, not a source quotation.)

**Correction:** Conditional on the non-CM/quaternionic-action certificate, use D×D.

**Reason:** The two geometric factors are non-isogenous in the claimed autochthonous case, so their endomorphism algebra is the product, with no off-diagonal Hom.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E156; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E17 — misprint

**BCGP18**, arXiv:1812.09269v3: Lemma 10.4.6 pp. 280–281; published pp. 490–491. Affects: nothing.

**Issue:** The rank-two system is based on G_Q, and the argument excluding descent uses the autochthonous case where its negation is needed. (Paraphrase, not a source quotation.)

**Correction:** Base the rank-two system on G_K and negate autochthony in the contradiction step.

**Reason:** The surface B is over K; its rank-four system is induced to Q. The contradiction starts by supposing B is isogenous to a twist of its conjugate.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E157/E158; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E18 — misprint

**BCGP18**, arXiv:1812.09269v3: §10.4.2 p. 277. Affects: nothing.

**Issue:** The determinant of the induced dihedral representation omits the transferred inducing character. (Paraphrase, not a source quotation.)

**Correction:** Retain the factor χ∘Ver as well as the quadratic extension character.

**Reason:** The determinant formula for induced rank-one representations includes the transfer; the invariant symmetric pairing still gives the stated symplectic conclusion.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E153; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E19 — misprint

**BCGP18**, arXiv:1812.09269v3: §7.11 pp. 224–226 and §7.13 pp. 230–231. Affects: nothing.

**Issue:** Some finite-level patching-ring superscripts use infinity in the I slot, and the χ-specialization duality display has a trivial-character middle term. (Paraphrase, not a source quotation.)

**Correction:** Use I in the finite-level superscript and the χ-module throughout the χ-duality display.

**Reason:** These follow directly from the indexed definitions and the nebentype of the duality map.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E124/E129; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E20 — gap

**BCGP18**, arXiv:1812.09269v3: Corollary 8.2.2 pp. 237–238. Affects: the proof.

**Issue:** The monodromy comparison proof discusses the avoidance places but does not supply the places above p. (Paraphrase, not a source quotation.)

**Correction:** At p combine the ordinary shape, the parahoric local parameter and purity to recover the Frobenius-semisimple parameter.

**Reason:** The conclusion quantifies over every finite place, so an away-from-p monodromy argument alone is insufficient.

**Provenance:** Existing reviewed atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E130; this review does not claim discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E21 — misprint

**BCGP25**, arXiv:2502.20645v1: Lemma 9.3.4 p. 200 Affects: nothing.

**Issue:** The finite group is assigned constant scheme rank four. (Own-words description.)

**Correction:** Its order, and hence its finite-flat scheme rank, is p⁴; it is level-one p-torsion, not a rank-four finite scheme.

**Reason:** A₀ is an abelian surface and A₀[p] has order p⁴.

**Provenance:** new; no correction found in the listed searches

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E22 — misprint

**BCGP25**, arXiv:2502.20645v1: Lemma 9.3.7 p. 203, scalar-Frobenius seed Affects: nothing.

**Issue:** After choosing the scalar +1 case the proof uses elliptic traces −1 and 2. (Own-words description.)

**Correction:** Those traces realize scalar −1 on the étale mod-3 quotient. Use that as the base case; its unramified quadratic twist has traces 1 and −2 and realizes scalar +1.

**Reason:** The two ordinary unit roots reduce to their traces modulo 3, so both −1 and 2 reduce to −1. The twist exchanges the two scalar cases without changing existence.

**Provenance:** new; no correction found in the listed searches

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E23 — gap

**BCGP18**, arXiv:1812.09269v3: Theorems 8.4.1–8.5.2, pp. 247–249; Hypothesis 7.13.1(5), p. 229. Affects: a stated result.

**Issue:** Finiteness of the ramification set of ρ is omitted from the lifting hypotheses. (Paraphrase, not a source quotation.)

**Correction:** Retain the explicit finite-ramification hypothesis already present in the nodes.

**Reason:** Local purity does not bound the global ramification set; the base-change proof requires finitely many prescribed ramified places.

**Provenance:** Existing atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E161; not a new discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E24 — error

**BCGP18**, arXiv:1812.09269v3: Proposition 7.10.1, pp. 223–224, applied in §7.11, p. 225. Affects: the proof.

**Issue:** The patching criterion asks for open nested kernels, whereas the Taylor–Wiles group-ring kernels used later are neither necessarily open nor nested. (Paraphrase, not a source quotation.)

**Correction:** Use kernels contained in a decreasing cofinal sequence of open ideals, reducing each datum modulo the containing ideal.

**Reason:** The power-series group-ring quotients are not Artinian. Open containing ideals permit the finite diagonal patching argument without the false kernel hypotheses.

**Provenance:** Existing atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E163; not a new discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E25 — error

**BCGP18**, arXiv:1812.09269v3: Lemma 9.1.10(3), pp. 251–252. Affects: a stated result.

**Issue:** The residual image is asserted to contain SL₂ over the entire coefficient residue field. (Paraphrase, not a source quotation.)

**Correction:** Use a conjugate of SL₂(F_l), as in the corrected PA.5 supplier.

**Reason:** Scalar character twists can enlarge the coefficient field without enlarging the derived image to SL₂ over that field.

**Provenance:** Existing atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E136; not a new discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

### AbelianSurfacesPotentialModularity/E26 — misprint

**BCGP18**, arXiv:1812.09269v3: Proof of Theorem 9.2.8, p. 258. Affects: nothing.

**Issue:** The purity conclusion names the p-adic member when the lifting argument is at q. (Paraphrase, not a source quotation.)

**Correction:** Use ρ_{π,q} at this step.

**Reason:** The q-adic representation is compared with the induced q-adic rank-two seed.

**Provenance:** Existing atlas finding PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E142; not a new discovery.

**Review:** confirmed by REV-DESIGN-BCGP18.

## Ownership and follow-up routing

The BCGP extraction (route 2) assigns BCGP §§3.9–6 — Hida complexes over Λ_I for Hilbert–Siegel varieties with Klingen level, the doubling theorem, higher Coleman theory with classicality — to HigherHidaAndColemanTheory, but its design packet plans the Siegel case over Q and Pilloni's Klingen complex only.

Proposed routing: Either revise HigherHidaAndColemanTheory to plan route 2 (Theorem 4.6.1, Lemma 4.5.17, §5 doubling with Theorem 5.8.6, §6 with Theorems 6.5.8, 6.6.4, 6.6.5 and Lemma 6.5.18) at its stages I3, X8, C4 and B7, or create 'HigherHidaAndColemanTheory, Part II: Hilbert–Siegel higher Hida and Coleman theory and doubling' with those stages. This roadmap imports them; it plans none.

Deuring's existence of elliptic curves over F_q with every trace |t| < 2√q prime to q is needed by the corrected p–q switch and is planned nowhere.

Proposed routing: Plan it in 'EllipticCurves, Part II' (design DESIGN-EllipticCurvesPartII), next to the Hasse bound of Tau Ceti's EllipticCurves layer 3; this roadmap imports it.

By the extraction's brief this roadmap owns BCGP25 Theorem 1.8.17 (Galois representations of ordinary parallel weight 2 forms), P(ρ̄) with the marked-Weierstrass locus, the S_6 ≅ Sp_4(F_2) dictionary, the twisted Siegel moduli, BCGP25 Lemmas 9.3.6–9.3.7 with their seed curves, Lemma 10.3.1 and the paramodular conjecture.

Proposed routing: The designs of GSp4NonregularModularityLifting and AbelianSurfacesModularity import these from AP.0, AP.6 and AP.7 and do not plan them again; the 2025 extraction's routes of these items are to be re-pointed here.

These are requests for the orchestrator, not changes to existing upstream roadmaps. The scope remains the 57 targets above; no second job was claimed.

## Suggested Lean file and validation

The [suggested Lean file](../suggested/AbelianSurfacesPotentialModularity.lean) follows the light-statement shape: real-bodied definitions over existing carriers, arithmetic checks and selected signatures with sorry proofs. Heavy carriers and constructions remain targets in this document. The reviewed file elaborated using lean-check at the pinned shared build, with only sorry warnings. The blueprint checker reports no errors or warnings. These checks validate the plan’s structure and the suggested signatures, not its unimplemented theorems.


### Light declarations in the suggested file

The 127 API entries above describe the target interfaces. The compact suggested file also uses the following local arithmetic and matrix helpers to express its statable examples. They are real-bodied specializations over existing carriers, not additional heavy targets or completed proofs. All names below are in `TauCeti.AbelianSurfaces`.

| Declaration | Exact meaning and hypotheses |
| --- | --- |
| `generalSymplecticGroup l R` | For finite decidable l and a commutative ring R, the matrix submonoid on l⊕l consisting of A with AJAᵀ=cJ for some unit c. The carrier is real-bodied; the closure proofs use sorry. |
| `symplecticGroup_le_generalSymplecticGroup` | For the same l and R, the baseline symplectic submonoid is contained in this similitude submonoid. |
| `multiplier_unique` | If R is nontrivial and l nonempty, two unit multipliers c,d of the same A are equal. The nonempty hypothesis excludes the zero-dimensional form. |
| `iwahoriIndex q` | The natural number (q+1)²(q²+1). |
| `proIwahoriIndex q` | The natural number (q−1)³, using natural subtraction. |
| `iwahoriIndex_coprime` | For a natural prime p>2 and q mod p=1, p is coprime to iwahoriIndex q. |
| `weightExponents k l` | For integer k,l, the pair ((k+l)/2−2,(k−l)/2), with integer division. |
| `IsClassicalWeight p k l` | For natural p and integer k,l: 2≤l≤k, k−l even, and both weightExponents divisible by the integer p−1. In its arithmetic use p is an odd prime. |
| `IsClassicalWeight.congruence` | From this predicate, k is congruent to 2 or p+1 modulo 2(p−1). The predicate includes parity; integer division alone would not suffice. |
| `iwahoriMultiplicity` | The function on Fin 4 with values 8,4,4,1 at ranks 0,1,2,3. |
| `multiplicityOfRanks n` | For a finite type ι and n:ι→Fin 4, the product over ι of iwahoriMultiplicity(n v). |
| `multiplicityOfRanks_eq` | With decidable equality on ι, that product is 8 to the number of rank-zero places times 4 to the total number of rank-one and rank-two places. |
| `eigenspaceDimension n` | The natural number 8·multiplicityOfRanks n. Its relation to an actual eigenspace is conditional on the target proof, not built into this numerical definition. |
| `patchingVariables q d s` | The integer 2q−4d+s−1, for natural inputs. |
| `patchingRelDim q s` | The integer 2q+11s−1. |
| `patching_dimension_identity` | For natural q,d,s,i, patchingVariables(q,d,s)+10s+4d−i = patchingRelDim(q,s)−i, as an integer identity. It asserts no existence of rings of a negative dimension. |
| `frobeniusPoly q a₁ a₂` | The integer polynomial X⁴−a₁X³+a₂X²−qa₁X+q², for natural q and integer a₁,a₂. |
| `frobeniusPoly_prod` | (X²−aX+q)(X²−bX+q)=frobeniusPoly(q,a+b,ab+2q). |
| `IsDistinguishedOrdinary p a₁ a₂` | The integer p divides neither a₂ nor a₁²−4a₂. Interpreting this as ordinarity requires the stated good-reduction/Frobenius hypotheses of AP.6. |
| `switchDiscriminant p a₁ a₂` | The integer a₁²−4a₂+8p. |
| `switchDiscriminant_eq_discrim` | This is Mathlib’s quadratic discriminant of (1,−a₁,a₂−2p). |
| `hasseWeilReflectionSum d` | The natural number d+1; reflection is s↦(d+1)−s and the centre is (d+1)/2. |
| `card_perm_six` | Fintype.card(Perm(Fin 6))=720. |
| `card_symplecticGroup_two` | Nat.card of the baseline symplectic group with l=Fin 2 and R=ZMod 2 equals Nat.card(Perm(Fin 6)). |
| `card_symplecticGroup_three` | Nat.card of the same matrix group over ZMod 3 is 51840. The interpretation of the projective quotient and its multiplier belongs to the group-theoretic target, not this cardinality statement. |

The file’s examples check diag(c,c,1,1) as a similitude of multiplier c over Q, J as symplectic, the indices 3200 and 216 at q=7, weightExponents(2,2)=(0,0), the regular-weight exponent formula, failure of classical weight (3,3) at p=3, multiplicity 1 at rank 3, predicted dimension 8 for two rank-three places, patchingVariables(4,1,3)=6 and patchingRelDim(4,3)=40, distinguished ordinary coefficients (a₁,a₂)=(1,2) at 5 versus failure for (2,1), reflection sums 2 and 3 in dimensions 1 and 2, and the permutation-group index 6. These are the light checks that elaborate at the pins; the 71 target definition tests above remain specifications for the future heavy carriers.
