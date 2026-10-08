# Excursion operators and spectral action: classical comparison (ES7)

This roadmap part plans the Bernstein maps from Newton strata, their compatibility with Levi subgroups and parabolic induction, and agreement of the GL_n excursion parameter with the semisimple Weil part of the independent classical correspondence. It combines a characteristic-zero tower realization with a separate equal-characteristic D-elliptic construction. Every statement here is a planning target. All implementation statuses remain unchecked.

The packet contains 50 nodes: 5 definitions, 6 constructions, 30 theorems, 6 lemmas and 3 comparisons. Its definitions and constructions carry 53 API items and 34 unit tests. There are 21 planets and 30 pinned baseline declarations. All five stages are planned and none is closed: 15 recorded gaps and 33 supplier requests identify the proof work still needed. The historical independent review in the packet records the preceding round; this revision requires its own independent review.

## Conventions and dependency order

Let E be a nonarchimedean local field, with residue cardinality q=p^f, and let ℓ≠p. Coefficients for the integral construction are ℤ_ℓ[√q]-algebras Λ, with the chosen square root preserved by coefficient maps. Since q is a unit, √q is a unit. Geometric Frobenius has Weil degree 1, and geometric local reciprocity sends a uniformizer to geometric Frobenius. Characteristic-zero representation comparisons use Q̄_ℓ, with finite coefficient fields and continuity specified in the relevant inputs.

Write Ĝ for the split pinned dual group with its prescribed Weil action. For a Newton class b, its dual Levi is M̂=Ĝ_b. If j:M̂→Ĝ is the pinned inclusion and t=(2ρ_Ĝ−2ρ_M̂)(√q), the twisted inclusion sends φ to the cocycle w↦t^{deg(w)}j(φ(w)). The cocharacter difference is Weil invariant and central in M̂. Normalized induction is i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E. The modulus twist cancels t in this normalization.

The spectral-centre identification requires |π₀Z(G)| invertible in Λ, equivalently invertibility of the order of the torsion subgroup of π₁(Ĝ). This is the centre of G, as in FS IX.5.2 (p. 329) and VIII.3.6 (p. 288). Excursion generators remain available without that condition. Universal coefficient reduction therefore requires a comparison of their actions under arbitrary coefficient maps, including nonflat maps; existence of an action over each ring does not itself prove base change.

For function-field inputs, X is a smooth projective curve over its finite constant field, F its function field, ∞ a rational place and D/F a central division algebra of degree d. The maximal-order sheaf is denoted 𝒟. The equal-characteristic local field is K=F_o. The auxiliary global algebra D̄ in uniformization has exchanged local invariants at o and ∞; D and D̄ are kept distinct. The operator τ is pullback along id_X×Frob_S. Right Hecke actions on moduli induce the specified left actions on cohomology.

The plan proceeds through parabolic compatibility, characteristic-zero comparison, division-algebra automorphic input, equal-characteristic geometry, and the conclusion over all local fields. The single abstract two-leg trace calculation is shared by the two realizations. Generic adelic, smooth representation, Satake and sheaf-theoretic infrastructure stays with its owning roadmap. The local node graph is acyclic. Undrawn same-roadmap stage edges and a cross-packet ES6/ES7 cycle are listed under structural reconciliation.

The following entries give exact statements, hypotheses, direct dependencies, proof routes and acceptance tests. API and test names identify the proposed declarations; statements use corrected source formulas and are written in this roadmap’s own words.

## Stratum maps and parabolic induction

Stage: `ExcursionOperatorsAndSpectralAction:ES7:parabolic`. Coverage: **planned**.

The construction starts from ES1’s spectral-to-geometric centre map and VS4’s enhanced stratum embedding. Its first test is restriction at b=1. The second is a coefficient ring in which the centre-order condition fails: only the excursion-algebra formulation is then used. The GL₂ diagonal calculation fixes the sign of the twist, and the normalized-induction dictionary checks its cancellation against the parabolic modulus.

The proposed factorization is FS Theorem IX.7.2 (pp. 334–336), and induction is IX.7.3 (pp. 336–337). Their proof chain needs more than a formal restriction of a natural transformation. It includes universal coefficient base change, the quasi-split reduction, quantitative preservation of the Harder–Narasimhan reduction, and the constant-term convention comparison. In particular, HS4’s switched kernel and compact-support character must together yield the twist used here; disappearance of a degree shift alone does not prove that identification. The gaps below delimit these obligations.

For p-adic E, Kaletha’s z-embedding data and BG1’s basic-inner-class theorem supply the proposed reduction. Equal characteristic requires separate justification. For SL_p over a field of characteristic p, the torus-centre and surjectivity combination fails by the fppf cohomology calculation in source issue E2. A connected non-smooth centre does not repair the subsequent basic-class step. The quasi-split computation can still be planned independently, and GL_n has smooth split centre.

### Bernstein maps from strata

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps` — construction. Planet: **Bernstein stratum maps**.

For a Z_ℓ[√q]-algebra Λ and reductive G/E, restrict the geometric centre along the fully faithful embedding D(G_b(E),Λ) ≃ D_lis(Bun_G^b,Λ) → D_lis(Bun_G,Λ). Composing with the imported spectral-to-geometric centre map defines Ψ_G^b. At b=1 use j_! and write Ψ_G. The spectral centre formulation requires |π₀Z(G)| invertible in Λ; the excursion algebra formulation has no such condition. The embeddings are those provided by VS4 (e.g. the left adjoint to i_b^*), not an unrestricted shriek functor on lisse categories.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).

- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).

- Spectral-centre form: |π₀Z(G)| invertible in Λ (the hypothesis of FS IX.5.2); the excursion-algebra form has no condition on Λ. This is the centre of G, equivalently the order of the torsion subgroup of π₁(Ĝ), not π₀Z(Ĝ).



**Uses**

- `FS IX.7.2`: The stratum restriction is the left side of the factorization triangle.

- `FS IX.7.3`: Its value at b=1 acts on parabolic induction.



**API**

- `PsiG` (constructor): The composite of the spectral-to-geometric map with restriction to the trivial stratum.

- `PsiGb` (constructor): The same composite using the b-stratum and its group G_b(E).

- `restrictCentre` (constructor): For a fully faithful additive functor F : A → B of preadditive categories, the ring map Z(B) → Z(A), z ↦ (X ↦ F⁻¹(z_{F X})); Ψ_G^b is restrictCentre of the stratum embedding composed with ES1’s map.

- `restrictCentre_app` (simp): F((restrictCentre z)_X) = z_{F X} for every object X.

- `PsiGb.basepoint` (compatibility): Ψ_G^1=Ψ_G.

- `PsiGb.embedding_independent` (characterisation): Eligible fully faithful stratum embeddings with the specified adjunction induce the same central action.

- `PsiGb.excursion` (compatibility): Restriction of the excursion action defines the analogous map even when ℓ divides |π₀Z(G)|.



**Unit tests**

- `PsiGb.basepoint_test` (compatibility): At b=1, evaluate Ψ_G^b on any spectral function and obtain Ψ_G.

- `PsiG.one_test` (computation): The spectral constant 1 acts as the identity on every smooth representation.

- `PsiGb.excursion_test` (non-example): For a group with ℓ dividing |π₀Z(G)|, the excursion construction still gives a central action; the spectral-centre identification is not invoked.



**Construction or proof route**

1. Use VS4 to identify the stratum category and its fully faithful embedding.

2. Restrict natural endomorphisms of the identity; compose with ES1’s map. Full faithfulness and the adjunction identify the action on objects, so no choice of extension changes it.



**Acceptance**

- For b=1 the general restriction equals j_!’s map.

- The maps preserve 1, addition and multiplication.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`

- `VStackSheavesAndLisseCategories:VS4`

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`

- `mathlib:CategoryTheory.Adjunction`

- `mathlib:CommRing`

- `ExcursionOperatorsAndSpectralAction:ES5/stratum-centre-embedding-independence`

- `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`

- `mathlib:CategoryTheory.CatCenter`

- `mathlib:CategoryTheory.Functor.FullyFaithful`



**Sources**

- `FS-geometrization`, Definition IX.7.1, p. 334. Definition IX.7.1 defines the fully faithful stratum restrictions; the excursion replacement is in the proof of IX.7.2.

- `FS-geometrization`, Theorem IX.5.2, p. 329; Theorem VIII.3.6, p. 288. The invariant-coordinate comparison imposes the original-centre condition, expressed equivalently by torsion in the dual fundamental group.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Twisted inclusion of Levi cocycles

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion` — construction. Planet: **Twisted Levi inclusion**.

Write M̂=Ĝ_b⊂Ĝ for the dual Levi and j for its pinned inclusion. Let deg:W_E→ℤ send geometric Frobenius to 1 and let t=(2ρ_Ĝ−2ρ_M̂)(√q). The Satake inclusion sends a continuous cocycle φ to cφ(w)=t^{deg(w)}j(φ(w)), using the fixed usual pinned Weil actions on both sides. The cocharacter difference is Weil invariant and central in M̂; hence t is invariant and centralizes j(M̂). These properties, together with equivariance of j, prove the cocycle identity. The map is conjugation equivariant and induces pullback on invariant functions.

**Hypotheses**

- G quasi-split-pinned dual data: Ĝ with its pinned Weil action, M̂ = Ĝ_b the dual of the Levi attached to b, j : M̂ → Ĝ the pinned inclusion.

- A a ℤ_ℓ[√q]-algebra with ℓ ≠ p; the chosen √q is a unit since q is a unit. Thus evaluating the cocharacter and its negative powers is defined. The degree W_E→ℤ sends geometric Frobenius to 1.



**Uses**

- `FS IX.7.2`: Pullback along this map is the arrow between the spectral centres.

- `FS IX.7.3`: This inclusion determines the induced representation’s parameter.



**API**

- `cocycleMap` (constructor): On A-points, φ ↦ (w ↦ t^{deg(w)}j(φ(w))).

- `cocycleMap.isCocycle` (characterisation): cφ(wv)=cφ(w)·w(cφ(v)), and cφ(1)=1.

- `cocycleMap.degree_zero` (simp): If deg(w)=0, cφ(w)=j(φ(w)).

- `cocycleMap.basicCase` (compatibility): If M̂=Ĝ then cφ=jφ.

- `cocycleMap.conjugation` (functoriality): Conjugating φ by m conjugates cφ by j(m); base change of A commutes with this map.



**Unit tests**

- `cocycleMap.basic_test` (degenerate): For M̂=Ĝ the cocharacter difference is zero, so the map is the identity inclusion.

- `cocycleMap.GL2_test` (computation): For the upper Borel of GL₂, trivial φ evaluates at geometric Frobenius to diag(√q,1/√q).

- `cocycleMap.inertia_test` (computation): On inertia (degree zero) the twisting factor is 1.



**Construction or proof route**

1. Import the dual Levi, invariant cocharacter difference and pinned actions from GS4/RG2.5.

2. Expand cφ(wv), use additivity of degree, invariance of t, centrality in the Levi and the cocycle equation for φ.

3. Check continuity on finite-inertia charts and conjugation equivariance using LP0.



**Acceptance**

- For a basic stratum, t=1.

- The GL₂ upper-Borel example has t=diag(√q,1/√q).



**Direct prerequisites**

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`

- `ReductiveGroupsPartII:RG2.5`

- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`

- `mathlib:MonoidHom`

- `mathlib:RootPairing`

- `mathlib:Subgroup`

- `mathlib:MulAut`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`



**Sources**

- `FS-geometrization`, §IX.7.1 (Compatibility with G_b), p. 334. The displayed twisted formula uses this degree convention.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Reduction to torsion coefficients

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction` — lemma.

To prove the stratum triangle or the induction square for arbitrary Λ, prove the universal statement over Z_ℓ[√q], reduce modulo ℓ^r, and use ℓ-adic separatedness of the integral Bernstein centre. The centre is lim_K Z(e_KH_Λe_K) over a cofinal system of pro-p compact open K; p is invertible in Λ. Extend scalars from the universal action. Separatedness is asserted for Z_ℓ[√q], not for arbitrary Λ. Replace spectral functions by excursion generators when the centre-order condition fails.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).

- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ); when ℓ divides |π₀Z(G)| the spectral centre is replaced by the excursion algebra.

- Separatedness is used only for Λ = ℤ_ℓ[√q].



**Construction or proof route**

1. Use the SR.1 corner-centre identification and integral separatedness.

2. Equality modulo every ℓ^r implies equality in the integral centre. Apply the requested universal excursion-action scalar-extension comparison to pass to Λ. This last implication is ES7/gap/coefficient-base-change, not a consequence of the existence of an excursion action alone.



**Acceptance**

- No use of separatedness of a field or of arbitrary torsion coefficients.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`

- `mathlib:MonoidAlgebra`

- `mathlib:Module.End`

- `VStackSheavesAndLisseCategories:VS3/lisse-comparisons`

- `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects`

- `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`



**Sources**

- `FS-geometrization`, Proof of IX.7.2, p. 335. The proof reduces coefficients to avoid the lisse/étale distinction.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change`.

### Increasing instability at a fixed parabolic

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence` — lemma.

For quasi-split G choose the canonical parabolic P_b and a cocharacter μ central in its Levi with dynamical parabolic P_b. Put b_N=bμ(π)^N. Then G_{b_N}=G_b and the stratum maps for b and b_N agree. For each fixed bounded Hecke type V, sufficiently large N makes every self-modification of E_{b_N} of that type preserve its Harder–Narasimhan reduction to P_b.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G quasi-split over E with a fixed Borel; b ∈ B(G) with canonical parabolic P = P_b.

- μ a cocharacter with dynamical parabolic P; V a fixed bounded Hecke type (N is chosen after V).



**Construction or proof route**

1. Use BG1’s canonical Levi and BG4’s bounded-modification slope estimate.

2. The unique modification of type Nμ between the two strata transports the same representation; HS4 compatibility transports central actions.

3. Choose N after fixing V; the HN slope gaps then exceed its bounded possible changes.



**Acceptance**

- N depends on V; one uniform N for all Hecke types is not asserted.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`

- `BunGAndNewtonStrata:BG1`

- `BunGAndNewtonStrata:BG4`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `tauceti:TauCeti.Cocharacter.parabolic`

- `tauceti:TauCeti.Cocharacter.levi`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`

- `HeckeStacksAndLocalShtukas:HS2/framed-bundle-fibres`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`



**Sources**

- `FS-geometrization`, Proof of Theorem IX.7.2, pp. 335–336. The sequence and preservation argument are both used in the proof.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/HN`.

### Reduction to a quasi-split group

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction` — lemma.

The b-basic triangle follows from the Hecke-equivariant pure-inner-twisting equivalence Bun_G≃Bun_{G_b}. For general G and E p-adic choose a z-embedding G↪G′ (Kaletha, Definition 5.1): C=G′/G an induced torus, H¹(E,C)=1, H¹(E,Z(G))→H¹(E,Z(G′)) bijective, and Z(G′) connected. Prove Bun_G≃Bun_G′×_{Bun_C}{1}, injectivity B(G)→B(G′), surjectivity Z(G′)(E)→C(E), and G′_{b′}(E)=Z(G′)(E)G_b(E). Restrictions from G′_{b′} detect the centre of G_b. Reduce to connected centre using ES6’s functoriality for maps inducing an isomorphism of adjoint groups (FS Theorem IX.6.1, which the z-embedding is, though it is not an isogeny); then choose basic b₀ making G_{b₀} quasi-split using BG1’s basic-inner-class surjectivity, and apply pure inner twisting.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).

- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).

- A z-embedding G ↪ G′ in the sense of Kaletha, Definition 5.1 (torus quotient C with H¹(E, C) = 1, bijective H¹ on centres, connected Z(G′)); Kaletha states it for p-adic E, and the equal-characteristic case is the gap ES7/gap/z-embedding.



**Construction or proof route**

1. Import a z-embedding with all Kaletha 5.1 conditions (E p-adic), not merely a torus quotient and connected centre; in equal characteristic use ES7/gap/z-embedding.

2. Use the central quotient and the Bun fibre identity to obtain injectivity on classes and detection on representation restrictions.

3. Import the BG1 consequence of Kottwitz 10.4 and the BG0 Hecke-equivariant equivalence. Apply the already proved basic case.



**Acceptance**

- At b basic this recovers pure-inner-form invariance.

- The Kottwitz citation supplies surjectivity of B under a central extension; the bridge to H¹(E,G_ad) is proved in BG1.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`

- `BunGAndNewtonStrata:BG0/pure-inner-twisting`

- `BunGAndNewtonStrata:BG1`

- `BunGAndNewtonStrata:BG0`

- `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`

- `HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form`



**Sources**

- `FS-geometrization`, Proof of Theorem IX.7.2, p. 335. This is the complete reduction in the source.

- `Kaletha-2018`, §5.1, Definition 5.1 (p. 78) and Fact 5.5 (p. 80). Definition 5.1 (torus quotient, H¹(F, C) = 1, bijective H¹ on centres; z-embedding: also connected Z(G_z) and induced C) and Fact 5.5 (central surjectivity). Kaletha assumes F p-adic (§2, p. 64).

- `Kottwitz-2014`, Proposition 10.4, p. 50. Proposition 10.4 holds for any local field (§10.1) and gives B(G)_bsc → B(G_ad)_bsc surjective for connected Z(G); identifying B(G_ad)_bsc with H¹(E, G_ad) uses κ (Proposition 13.1), requested from BG1.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/z-embedding`.

### Factorization of the stratum centre map

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` — theorem. Planet: **Parabolic stratum factorization**.

For every b∈B(G), Ψ_G^b = Ψ_{G_b}∘c_b^*, with c_b the twisted Levi cocycle inclusion. Use spectral centres under the centre-order condition and excursion algebras otherwise. In the proof the HN-preserving Hecke diagram maps through P and its Levi M, with G_b=M_{b_M} for basic b_M. In FS’s convention the kernel is described by CT_P(S_V), with dual-Levi restriction, cyclotomic twist and degree shift [deg_P]. The HS4 interface uses the position of the first bundle relative to the second and explicitly switches the kernel; its opposite-parabolic twist must be combined with the compact-support character in B_N=Rπ_!A′_N before identifying the action on the original representation. Excursion creation and annihilation meet only the degree-zero component, so this shift disappears there.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; b ∈ B(G).

- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ).

- Spectral centres when |π₀Z(G)| and |π₀Z(G_b)| are invertible in Λ; excursion algebras otherwise.



**Construction or proof route**

1. Apply coefficient and group reductions. Replace b by b_N and use the HN-preserving P/Levi diagram.

2. Apply base change and GS4 constant-term naturality. Transport HS4/levi-compatibility’s switched-kernel convention, including the opposite twist, and compute the character and shift in Rπ_!Λ on the stratum. Establish that their combined effect is the specified positive twisted inclusion on the original representation. The convention/character comparison is part of ES7/gap/HN.

3. Restrict creation/annihilation to degree zero and compare every excursion generator.



**Acceptance**

- Basic b has untwisted factorization.

- For GL₂’s nonbasic torus stratum the Frobenius factor is diag(√q,1/√q).



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `VStackSheavesAndLisseCategories:VS1`

- `VStackSheavesAndLisseCategories:VS4`

- `mathlib:CategoryTheory.MonoidalCategory`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`

- `HeckeStacksAndLocalShtukas:HS4/levi-compatibility`



**Sources**

- `FS-geometrization`, Theorem IX.7.2 and proof, pp. 335–337. Creation and annihilation force the component on which the constant-term shift vanishes.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/HN`.

### Unnormalized parabolic induction

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` — theorem. Planet: **Parabolic induction compatibility**.

For P⊂G with Levi M and smooth σ of M(E), the spectral/excursion action on unnormalized Ind_P^Gσ is induced by the twisted Levi pullback on the action on σ. If Λ=L is algebraically closed, σ irreducible and π an irreducible subquotient, φ_π is conjugate to c_Mφ_σ. In the geometric proof choose b=μ(π_E^{-1}) for a cocharacter with dynamical parabolic P. For σ=c-Ind_K^{M(E)}Λ, the sheaf A on Bun_G^b satisfies T_{μ^{-1}}(A)|Bun_G^1 = Ind_P^Gσ(−d/2)[−d], d=⟨2ρ,μ⟩.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; P ⊂ G a parabolic with Levi quotient M.

- Λ a ℤ_ℓ[√q]-algebra (p is then invertible in Λ); Ind_P^G is unnormalized smooth induction.

- For the parameter statement: Λ = L an algebraically closed field, σ irreducible and π an irreducible subquotient of Ind_P^G σ.



**Construction or proof route**

1. Use compactly induced pro-p generators and the coefficient reduction.

2. The modification space is G(E)/P(E), of exact type μ; Satake normalization supplies (−d/2)[−d].

3. Hecke/excursion commutation and the stratum factorization give the square. ES5 gives the subquotient statement.



**Acceptance**

- For P=G the twist and d vanish.

- Reversing both the cocharacter and shift without changing the stratum is rejected.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`

- `SmoothRepresentationsOfLocalGroups:SR.2`

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `tauceti:TauCeti.Cocharacter.parabolic`

- `HeckeStacksAndLocalShtukas:HS2/framed-bundle-fibres`



**Sources**

- `FS-geometrization`, Corollary IX.7.3 and proof, pp. 337–338. The source explicitly uses unnormalized induction; its proof has the inverse cocharacter and negative shift.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/HN`.

### Normalized induction and the cyclotomic twist

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary` — theorem. Planet: **Normalized induction dictionary**.

Fix i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E and geometric reciprocity sending a uniformizer to geometric Frobenius. Under the torus parameter dictionary the twist by δ_P^{1/2} has cocycle c^{-1}, where c(w)=(2ρ_Ĝ−2ρ_M̂)(√q)^{deg(w)}. Thus c·φ_{δ_P^{1/2}τ}=jφ_τ and normalized induction uses the ordinary Levi inclusion. The geometric (−d/2)[−d] of IX.7.3 is a Satake sheaf normalization, not a second arbitrary modulus factor.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G connected reductive over E; P = MU a parabolic.

- Coefficients contain √q; δ_P(m) = |det(Ad(m)|Lie U_P)|_E; reciprocity sends a uniformizer to geometric Frobenius.



**Construction or proof route**

1. Compare the roots of U_P with the cocharacter difference on the dual side.

2. Evaluate δ_P^{1/2} on cocharacters at a uniformizer and use geometric reciprocity: its dual character is c^{-1}.

3. Apply the ES6 twisting theorem and the unnormalized result.



**Acceptance**

- For upper triangular GL₂, δ_B(diag(a,d))=|a/d| and the trivial normalized principal series has parameter 1⊕1.

- The unnormalized principal series of the trivial character has Frobenius diag(√q,1/√q).

- The source shift is (−d/2)[−d], not (+d/2)[+d].



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`

- `SmoothRepresentationsOfLocalGroups:SR.2`

- `ReductiveGroupsPartII:RG2.5`

- `mathlib:MeasureTheory.Measure.modularCharacter`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`

- `ExcursionOperatorsAndSpectralAction:ES6:functoriality/twisting-by-abelianized-characters`



**Sources**

- `FS-geometrization`, Corollary IX.7.3, p. 337 (with the twisted formula of §IX.7.1, p. 334). FS state only the unnormalized result with the cyclotomically twisted Levi map. The δ_P^{1/2} ↔ c^{-1} dictionary is this node’s own derivation (checked: δ_P^{1/2}(λ(ϖ)) = (√q)^{-⟨2ρ_N,λ⟩}, dual to (2ρ_Ĝ − 2ρ_M̂)(√q)^{-1} at geometric Frobenius).



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/normalization`.

**Work required before this stage closes**

- normalization: Root/modulus convention comparison

- z-embedding: Equal-characteristic quasi-split reduction; SL_p obstructs the torus-centre surjectivity route, requiring a different argument for non-smooth centres; GL_n does not use this reduction

- HN: Quantitative modification and constant-term closure

- prototypes: Materialize supplier carriers and omitted geometric conditions

- ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change



## Characteristic-zero classical comparison

Stage: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`. Coverage: **planned**.

This layer proves the characteristic-zero half of the comparison. ET.6 provides the independent classical local correspondence and cohomological tower realizations; ET.6a owns their comparison with the Hecke fibres. SW20 Theorem 24.2.5 (pp. 227–228) treats p-divisible groups over ℤ_p, hence E=ℚ_p. General finite E/ℚ_p uses the EL comparison of Corollary 24.3.5 (p. 231), together with a restriction-of-scalars comparison of shtukas and their actions. Neither comparison is inferred from HS2’s examples.

The two-leg calculation is formulated for an abstract two-operation realization over a characteristic-zero coefficient field. Its local field may have either characteristic, allowing the equal-characteristic layer to reuse it. Creation by coevaluation, action on the dual factor, and annihilation by evaluation give a trace. Trace determination is imported for arbitrary groups, rather than from a finite-group character theorem. The supercuspidal comparison then uses the direct-summand realization; the extension to all irreducibles uses normalized induction and independent segment classification. The conclusion identifies only the semisimple Weil representation.

### Two tower Hecke realization

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation` — theorem. Planet: **Two tower realization**.

For E/Q_p, π supercuspidal over Q̄_ℓ, σ=JL(π) on D^× with inv(D)=1/n, and b corresponding to O(−1/n), let B be the b-stratum sheaf of σ. ET.6a supplies the tower cohomology and the tower/Hecke-fibre comparison: SW20 Theorem 24.2.5 for E = ℚ_p, and for E ≠ ℚ_p Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n (Lubin–Tate side) and of D (Drinfeld side), with the identification of Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas. Then T_std(B) on the trivial stratum is π⊗ρ_π, and the second dual-standard operation returns σ⊗ρ_π^∨. Consequently the two-leg composite restricted to b is σ⊗ρ_π⊗ρ_π^∨ with its two independent Weil actions. The usual [n−1] and ((n−1)/2) are absorbed in Satake normalization.

**Hypotheses**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.

- π a supercuspidal irreducible smooth representation of GL_n(E); D the central division algebra of invariant 1/n over E; σ = JL(π); b basic with E_b = O(−1/n).



**Construction or proof route**

1. Import classical LLC/JL and both cohomology computations.

2. Use ET.6a’s comparison downstream of its classical tower and HS2; apply HS3’s Hecke-cohomology interface.

3. Match the Satake shift and Tate twist before composing the two operations.



**Acceptance**

- The two Weil factors act on ρ_π and its dual separately.

- For n=1 all shifts and half twists are zero.



**Direct prerequisites**

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`

- `HeckeStacksAndLocalShtukas:HS3`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `VStackSheavesAndLisseCategories:VS4`

- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`

- `mathlib:Representation`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`



**Sources**

- `FS-geometrization`, Proof of IX.7.4, p. 338. FS identify the second operation with the Drinfeld-tower isotypic part σ ⊗ ρ_π^*; the tower/Hecke-fibre comparison itself is imported from ET.6a.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/mixed-tower`.

### Two-leg excursions compute traces

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace` — theorem. Planet: **Two-leg excursion trace**.

Let k be a field of characteristic zero (k = Q̄_ℓ), ρ an irreducible n-dimensional representation of W_E with n > 0, and B a sheaf on Bun_G^b with T_V(B)|Bun_G^b ≅ σ ⊗ ρ ⊗ ρ^∨ as D^× × W_E × W_E-representation, V = std ⊠ std^∨ (a two-operation realization: two-tower-realisation supplies it for E of characteristic zero, equal-characteristic/hecke-fibre-transport for E of characteristic p). The creation α : σ → σ ⊗ ρ ⊗ ρ^∨ and the annihilation β are scalar multiples a·coev and b·ev. The excursion operator at (γ₁, γ₂) acts on B by ab·tr(ρ(γ₁γ₂^{-1})). At (1, 1) it is the image of the constant excursion function dim std = n, so ab·n = n and ab = 1. This identifies the combined scalar, not each scalar separately.

**Hypotheses**

- k = Q̄_ℓ (any field of characteristic zero); ρ an irreducible n-dimensional representation of W_E with n > 0.

- B a sheaf on Bun_G^b with T_{std⊠std^∨}(B)|Bun_G^b ≅ σ ⊗ ρ ⊗ ρ^∨ as D^× × W_E × W_E-representation (the package supplied by two-tower-realisation in characteristic zero and by equal-characteristic/hecke-fibre-transport in equal characteristic).



**Construction or proof route**

1. Apply irreducibility of ρ (Schur) to the W_E × W_E-equivariant maps α and β: they are multiples of coevaluation and evaluation.

2. Evaluate coevaluation, then (ρ(γ₁), ρ^∨(γ₂)), then evaluation: the dual action contributes ρ(γ₂^{-1}), giving tr(ρ(γ₁γ₂^{-1})).

3. At (1, 1) the excursion operator is the image of the constant function n (HS4 fusion, ES1 excursion algebra); characteristic zero gives ab = 1.



**Acceptance**

- At (γ,γ) the result is n.

- For n=1 and character χ the result is χ(γ₁)/χ(γ₂).

- No mod-ℓ scalar cancellation is asserted when ℓ divides n.



**Direct prerequisites**

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `mathlib:Representation`

- `mathlib:LinearMap.trace`

- `mathlib:Matrix.trace`

- `ExcursionOperatorsAndSpectralAction:ES0/excursion-datum-and-operator`

- `HeckeStacksAndLocalShtukas:HS4/creation-annihilation-and-triangles`

- `mathlib:coevaluation`



**Sources**

- `FS-geometrization`, Proof of IX.7.4, p. 338. The source determines the composite scalar at the identity tuple.



### Semisimple determination for GL_n

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification` — lemma.

Finite-dimensional semisimple characteristic-zero representations of W_E with equal traces at every element are isomorphic. This is R01.1/brauer-nesbitt-traces (stated for any group or monoid with d! invertible), applied to W_E. Continuity is inherited from the two input representations; no finite-group assumption on W_E is made.

**Hypotheses**

- W a group (here W_E, not finite); k a field of characteristic zero; V, V′ finite-dimensional semisimple k-representations of W.



**Construction or proof route**

1. Apply R01.1/brauer-nesbitt-traces (any group, d! invertible): equal traces imply isomorphic semisimplifications, as continuous representations when both are.

2. Feed it the traces tr ρ(γ) obtained from the two-leg identity at (γ, 1).



**Acceptance**

- A representation with nontrivial unipotent monodromy has the same traces as its semisimplification; N is not determined.



**Direct prerequisites**

- `mathlib:LinearMap.trace`

- `mathlib:Representation`

- `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`



**Sources**

- `FS-geometrization`, Proof of IX.7.4, p. 338. FS use this implication; ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces states it for any group, so no LP2 refinement is needed.



### Supercuspidal classical agreement

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement` — theorem.

For E of characteristic zero (a finite extension of ℚ_p) and π an irreducible supercuspidal Q̄_ℓ-representation of GL_n(E), φ_π ≅ ρ_π, where ρ_π is the irreducible parameter of the independent classical correspondence (ET.6); in particular φ_π ≅ ρ_π^ss. First two-leg-excursion-is-a-trace, applied to the package of two-tower-realisation, identifies the parameter of σ = JL(π) on the basic stratum. Then the π-stratum sheaf is a direct summand of T_std(B) after forgetting the Weil action, and Hecke compatibility of excursion operators transports the same parameter to π.

**Hypotheses**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.

- π an irreducible supercuspidal smooth representation of GL_n(E) with classical parameter ρ_π (ET.6).



**Construction or proof route**

1. Use trace determination for the basic-stratum parameter.

2. Forget the Weil multiplicity factor, select a nonzero summand and apply Hecke/excursion commutation.



**Acceptance**

- Selecting π requires forgetting the Weil action; no invariant vector of irreducible ρ_π is presumed.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`

- `HeckeStacksAndLocalShtukas:HS3`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `VStackSheavesAndLisseCategories:VS4`



**Sources**

- `FS-geometrization`, Proof of IX.7.4, p. 338. The direct-summand argument follows the scalar computation.



### Classical agreement for every irreducible

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations` — theorem. Planet: **Classical GLn agreement**.

For E of characteristic zero and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter φ_π equals the semisimplification of the Weil part of its classical Weil–Deligne parameter (ET.6). Write π as a subquotient of the normalized parabolic induction of a supercuspidal representation of a Levi (supercuspidal support); normalised-induction-dictionary computes φ_π from the supercuspidal factors with the ordinary Levi inclusion, and the classical correspondence satisfies the same segment/direct-sum rule. This is agreement of the semisimple Weil parameter; it does not identify the nilpotent monodromy operator.

**Hypotheses**

- E a finite extension of ℚ_p (characteristic zero); ℓ ≠ p; coefficients Q̄_ℓ.

- π any irreducible smooth Q̄_ℓ-representation of GL_n(E); classical parameters normalised as in ET.6 (normalized induction, segment rule).



**Construction or proof route**

1. Import the Q̄_ℓ segment and supercuspidal-support statements for GL_n, with normalized induction conventions.

2. Compute the classical semisimple parameter on each segment and its inducing supercuspidal twists.

3. Apply the parabolic theorem to every irreducible subquotient.



**Acceptance**

- The trivial representation and Steinberg representation have the same semisimple diagonal parameter although their N differ.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`

- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`



**Sources**

- `FS-geometrization`, Theorem IX.7.4 and first line of its proof, p. 338. The theorem quantifies over all irreducibles; the proof reduces by IX.7.3.



**Work required before this stage closes**

- mixed-tower: O_E classical tower diamond comparison



## Division-algebra automorphic inputs

Stage: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`. Coverage: **planned**.

Generic function-field completions, adeles, compatible Haar measures, diagonal embeddings, central characters and degree quotients are imported from FA.2, FA.6 and AA.0/AA.1. AA.1’s present comparison assumes a number field, so its function-field extension remains a request. This layer adds the division-algebra specialization: maximal orders, anisotropic compactness, discrete spectrum, kernel trace, Euler–Poincaré tests, selected globalization and inner-form transfer.

A local selector is a matrix coefficient attached to the projection onto compact-open invariants, normalized by the nonzero scalar of the matrix-coefficient map. It is not the indicator of that compact subgroup. It must vanish on every other irreducible in the same central-character block. Together with the Euler–Poincaré test at infinity and an auxiliary elliptic place, this is the input to the selected simple trace comparison. The local equal-characteristic Jacquet–Langlands character identity belongs here, independently of the global Galois construction.

The globalization fixes the curve, distinguished places and division algebra. Transfer is used only on this proven image and includes multiplicity one. The cohomology of D-elliptic moduli is constructed in the equal-characteristic layer below, so this automorphic layer never depends on that geometric construction.

### Maximal-order data for the division algebra

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders` — definition. Planet: **Maximal orders of the division algebra**.

Let X/F_q be smooth projective geometrically connected, F=F_q(X), d≥1 and D/F central simple of dimension d². The order data impose no split-place condition; D-elliptic consumers additionally choose a rational place ∞ at which D is split. Fix a coherent locally free O_X-algebra 𝒟 of generic fibre D with 𝒟_x a maximal O_x-order in D_x at every closed place x. Maximal means maximal by inclusion among O_x-orders (finite O_x-lattices containing 1 and closed under multiplication); no canonical choice at split places is asserted. Let R={x:D_x is nonsplit}. At x∉R choose (D_x,𝒟_x)≅(M_d(F_x),M_d(O_x)).

**Hypotheses**

- X a smooth projective geometrically connected curve over F_q with function field F; d ≥ 1.

- D a central simple F-algebra of dimension d²; 𝒟 a locally free O_X-algebra with generic fibre D whose completions are maximal orders.



**Uses**

- `Hausberger Definition 1.1`: Provides the right algebra action on each vector bundle.

- `LRS §§13,15`: Its compact unit groups define unramified levels and Haar normalization.



**API**

- `DOrder.local` (projection): The completed local order 𝒟_x⊂D_x and its unit group.

- `DOrder.split_equiv` (compatibility): At x∉R the chosen pair is isomorphic to (M_d(F_x),M_d(O_x)).

- `DOrder.change_lattice` (functoriality): A change of split lattice by g conjugates the endomorphism order by g.

- `DOrder.ramification` (data): The finite set R of nonsplit places; a split pole is chosen outside R in the D-elliptic setup.

- `DOrder.units_isCompactOpen` (structure): Each 𝒟_x^× is a compact open subgroup of D_x^×, equal to GL_d(O_x) under the split identification at x ∉ R.



**Unit tests**

- `DOrder.rank_one_test` (degenerate): For D=F, 𝒟=O_X and every local maximal order is O_x.

- `DOrder.matrix_test` (compatibility): For the standard lattice O_x^d the order is M_d(O_x), whose units are GL_d(O_x).

- `DOrder.integral_nonunit_test` (non-example): diag(π_x,1,…,1) belongs to the split order and is invertible over F_x but is not a unit of that order.



**Construction or proof route**

1. Use the function-field completions from FA.2; fix the order sheaf as part of the data.

2. Obtain compact open 𝒟_x^× from local integral-point topology; identify it with GL_d(O_x) at a split place. General existence of a glued maximal-order sheaf is a recorded refinement.



**Acceptance**

- Changing a split lattice conjugates its maximal order.



**Direct prerequisites**

- `FunctionFieldArithmetic:FA.2`

- `AdelicAlgebraicGroups:AA.1`

- `ReductiveGroupsPartII:RG2.0`

- `mathlib:AlgebraicGeometry.Scheme`

- `mathlib:Module.Free`

- `mathlib:CommRing`

- `SchemeAndStackFoundations:SF.2/sheaf-algebra`

- `SchemeAndStackFoundations:SF.0`

- `SchemeAndStackFoundations:SF.3`

- `mathlib:Algebra.IsCentral`

- `mathlib:Submodule.IsLattice`



**Sources**

- `Hausberger-2005`, §1.1, p. 1291. The standing global order data and the split-place identification are explicitly specified.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Equal-characteristic local transfer identity

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity` — theorem.

For a supercuspidal π of GL_d(K) and JL(π) on the division algebra of invariant 1/d, matching regular elliptic g and h with the same characteristic polynomial satisfy Θ_π(g)=(−1)^{d−1}Θ_{JL(π)}(h). The local JL input is independent of the global Galois construction; use the equal-characteristic local character/transfer theorem as quoted in Hausberger 9.1. Match Haar measures when converting the character identity to test-function/orbital identities. This is the required local identity, not a general nonelliptic transfer formula.

**Hypotheses**

- K a nonarchimedean local field (any characteristic); D_K the division algebra of invariant 1/d; π supercuspidal of GL_d(K) with JL(π) its local Jacquet–Langlands transfer.

- g ∈ GL_d(K), h ∈ D_K^× regular elliptic with the same characteristic polynomial.



**Construction or proof route**

1. Import the local character distribution machinery.

2. Apply the equal-characteristic local transfer theorem (Badulescu), with the elliptic matching and sign.

3. Use compatible Haar normalizations for the global simple-trace tests.



**Acceptance**

- For d=2 the elliptic character sign is −1.

- No number-field global trace theorem is invoked.



**Direct prerequisites**

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `ReductiveGroupsPartII:RG2.0`

- `mathlib:MeasureTheory.Measure.haar`



**Sources**

- `Hausberger-2005`, Theorem 9.1, pp. 1333–1334. The local Jacquet–Langlands theorem and its character relation precede the independent LLC statement.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`.

### Local supercuspidal selectors

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector` — construction.

For a supercuspidal irreducible characteristic-zero GL_d(K) representation π with fixed unitary central character and a compact open K₀ fixing a nonzero vector, form a matrix-coefficient Hecke test f_π (compactly supported modulo the centre for the fixed central character; LRS print 𝒞_c^∞) acting as π(1_{K₀}) on π and as 0 on every other irreducible admissible representation, so trπ(f_π) = dim π^{K₀} ≠ 0 and f_π(1) ≠ 0. Average on both sides over K₀ to make a finite-level selector without changing these nonvanishing properties. The LRS 15.10 construction uses the GL_d × GL_d-equivariant matrix-coefficient map φ : End(V)^∞ → 𝒞_c^∞, φ(A)(g) = tr(π(g^{-1})A), with π∘φ = c ≠ 0, and sets f=c^{-1}φ(π(1_{K₀})); it is not an indicator of K₀.

**Hypotheses**

- K a nonarchimedean local field; π an irreducible supercuspidal representation of GL_d(K) with unitary central character; K₀ a compact open subgroup with π^{K₀} ≠ 0.



**Uses**

- `LRS Lemma 15.10`: Selectors at three prescribed places force the desired local components.

- `Hausberger Theorem 10.4(2)`: The auxiliary split supercuspidal component is retained for transfer.



**API**

- `CuspidalSelector` (constructor): The normalized bi-K₀-invariant central-character test.

- `CuspidalSelector.value_one` (characterisation): f_π(1)=c^{-1}dimπ^{K₀}≠0 in the source normalization.

- `CuspidalSelector.trace` (compatibility): trπ(f_π) is nonzero, and incompatible supercuspidal traces vanish.

- `CuspidalSelector.support` (data): Its support is compact modulo the centre.



**Unit tests**

- `CuspidalSelector.value_test` (computation): For dimπ^{K₀}=1 and normalization c=1, f_π(1)=1.

- `CuspidalSelector.central_test` (compatibility): Its central translation law is the inverse of the fixed central character in the convolution convention.

- `CuspidalSelector.indicator_test` (non-example): The characteristic function of K₀ acts on every representation with K₀-invariants, whereas f_π kills incompatible supercuspidals.



**Construction or proof route**

1. Use compact-mod-centre matrix coefficients and the local Schur-orthogonality normalization.

2. Project to K₀-fixed vectors and scale by the nonzero intertwining scalar.

3. Use the central-character quotient and support to insert the selector in the simple trace formula.



**Acceptance**

- The chosen representation is selected with a nonzero trace.



**Direct prerequisites**

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `mathlib:MeasureTheory.Measure.haar`



**Sources**

- `LRS-1993`, Proof of Lemma 15.10, pp. 314–315. LRS build f from the matrix-coefficient map φ(A)(g) = tr(π(g^{-1})A) [Be-Ze 1, 2.4.2]; f acts by π(1_K) on π and by 0 on every other irreducible admissible representation, and f(1) = c^{-1} dim π^K ≠ 0.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Compact division-algebra automorphic quotient

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness` — theorem. Planet: **Compact division-algebra quotient**.

For any central division algebra D/F (including the inner form D̄ ramified at ∞), the diagonal D^×(F) is discrete in the imported adelic group D^×(A_F). The quotient is compact modulo A_F^×. After quotienting by the central subgroup π_∞^ℤ (degree lattice) and fixing the compatible central-character quotient, D^×(F)\D^×(A_F)/π_∞^ℤ is compact. Finite level further gives a compact quotient with finite stabilizers; do not assert finiteness of the whole adelic quotient as a set.

**Hypotheses**

- X/F_q as above; D a central DIVISION algebra over F (anisotropic PGL₁(D)); ∞ a rational place.

- Adelic topology and degree lattice ϖ_∞^ℤ imported from FA.2/FA.6/AA.1.



**Construction or proof route**

1. Import the diagonal topology, centre and degree quotient from FA.2/FA.6/AA.1.

2. Use anisotropy of PGL₁(D) and function-field reduction to prove compactness modulo centre; the degree-zero idele class group is compact.

3. Keep the central quotient and finite stabilizers in the measure normalization.



**Acceptance**

- For d=1 this is idele-class compactness after the degree lattice.

- The analogous GL_d quotient for d>1 is not compact modulo centre.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `FunctionFieldArithmetic:FA.2`

- `FunctionFieldArithmetic:FA.6`

- `AdelicAlgebraicGroups:AA.1`

- `AdelicAlgebraicGroups:AA.0/restricted-haar-product`

- `ReductiveGroupsPartII:RG2.0`



**Sources**

- `LRS-1993`, §13.3, p. 291. LRS assert compactness of D^×\D_𝔸^×/ϖ_∞^ℤ for their division algebra split at ∞; discreteness and the D̄ case are standard facts this node adds.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`.

### Weakly cuspidal Euler–Poincaré function

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function` — construction. Planet: **Euler–Poincaré function**.

At the split rational place ∞ identify D_∞^× with GL_d(F_∞). For simple roots Δ, I⊂Δ, facet normalizer P_I, compact parahoric P_I⁰ and orientation character χ_I extended by zero, define f_∞=Σ_{I⊂Δ} (−1)^{|Δ\I|}χ_I/((|Δ\I|+1)vol(P_I⁰)). It descends to PGL_d(F_∞) and is compactly supported there. It is a finite alternating sum of oriented facet-normalizer functions, not an arbitrary cusp projector.

**Hypotheses**

- F_∞ a local field of characteristic p (completion at the rational place ∞); G = GL_d(F_∞) with its Bruhat–Tits building; d ≥ 1.

- A Haar measure on G/F_∞^× fixing the volumes vol(P_I⁰).



**Uses**

- `LRS Theorem 13.2`: Its orbital integrals transfer to the division inner form at ∞.

- `LRS Lemma 15.10`: Its character trace forces the Steinberg component in a cuspidal globalization.



**API**

- `EulerPoincareFunction` (constructor): The finite facet sum with the specified coefficients and Haar normalization.

- `EulerPoincareFunction.central` (compatibility): Translation by F_∞^× leaves f_∞ unchanged.

- `EulerPoincareFunction.haar_rescale` (functoriality): Replacing dh by a·dh replaces f_∞ by a^{-1}f_∞.

- `EulerPoincareFunction.support` (characterisation): The support modulo centre is contained in the finite union of facet normalizers.



**Unit tests**

- `EulerPoincareFunction.rank_one_test` (degenerate): For d=1 the building is a point and the resulting function is the normalized constant on GL₁(F_∞)/F_∞^×.

- `EulerPoincareFunction.haar_test` (computation): Doubling the Haar measure halves the EP function and leaves its integrated character trace unchanged.

- `EulerPoincareFunction.orientation_test` (non-example): In the GL₂ tree, a facet-normalizer element interchanging an edge’s two vertices has orientation sign −1, not +1.



**Construction or proof route**

1. Import the building facets and their parahoric/normalizer actions.

2. Take each orientation sign extended by zero and sum with the stated denominator.

3. Check central invariance and compact support modulo centre.



**Acceptance**

- An orientation sign is needed when a normalizer permutes vertices.



**Direct prerequisites**

- `ReductiveGroupsPartII:RG2.2`

- `ReductiveGroupsPartII:RG2.3`

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `mathlib:MeasureTheory.Measure.haar`



**Sources**

- `LRS-1993`, §13.1, p. 290. This character and the displayed facet sum define the EP function; the normalizer is distinguished from the pointwise stabilizer.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Discrete division-algebra spectrum

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum` — theorem.

For a unitary central character trivial on the chosen degree lattice, the compact quotient’s L²-space decomposes discretely as a Hilbert sum of irreducible admissible automorphic Π with finite multiplicities m(Π). Its smooth K-finite vectors give the algebraic automorphic space; Π=⊗′_vΠ_v with spherical vectors at almost all places. At a fixed compact open finite level the relevant automorphic space is finite dimensional. This is not a claim that infinitely many tower levels form a finite-dimensional representation.

**Hypotheses**

- D a central division algebra over F = F_q(X); ∞ rational; a unitary central character trivial on ϖ_∞^ℤ.

- Coefficients ℂ (or Q̄_ℓ via a fixed isomorphism, transported by AS.0's algebraic descent).



**Construction or proof route**

1. Apply AS.0 to the compact quotient and admissible smooth action.

2. Use finite-level compactness to get finite-dimensional invariants and finite multiplicities.

3. Apply the restricted-tensor-product factorization with distinguished unramified vectors. Transfer characteristic-zero coefficient fields only with the supplied algebraic descent.



**Acceptance**

- At fixed K, a finite sum computes traces; summing the entire tower without a convergence statement is invalid.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `AutomorphicSpectralTheory:AS.0`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `FunctionFieldArithmetic:FA.6`

- `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`



**Sources**

- `LRS-1993`, §13.3, p. 291. LRS give the algebraic decomposition with finite multiplicities; the L² Hilbert-sum form and the restricted-tensor-product factorization are this node’s standard additions.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`.

### Euler–Poincaré orbital identities

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals` — theorem.

For nonelliptic regular elements γ of GL_d(F_∞), O_γ(f_∞)=0. For elliptic regular γ matching γ̄ in the division inner form D̄_∞^×, let f̄_∞=1/vol(D̄_∞^×/π_∞^ℤ). With transferred centralizer measures, O_γ(f_∞)=ε_∞(γ̄)O_γ̄(f̄_∞). The equality uses the Kottwitz sign and matched quotient measures.

**Hypotheses**

- F_∞ local, G = GL_d(F_∞); D̄_∞ the central division algebra of invariant 1/d over F_∞ (the inner form at ∞).

- γ regular semisimple; Haar measures on centralizers transferred between G and D̄_∞^×.



**Construction or proof route**

1. Apply the building Euler-characteristic orbital calculation, tracking facet orientations.

2. Use the division inner-form centralizer and the transferred Haar measures.



**Acceptance**

- A split regular nonelliptic element has zero orbital integral.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `ReductiveGroupsPartII:RG2.2`

- `mathlib:MeasureTheory.Measure.haar`



**Sources**

- `LRS-1993`, Theorem 13.2(i), p. 290. The theorem gives vanishing on nonelliptic elements and the elliptic inner-form equality.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`.

### Euler–Poincaré character identities

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces` — theorem.

For a unitary irreducible representation of GL_d(F_∞)/π_∞^ℤ, trπ(f_∞)=0 except for the trivial representation (trace 1) and Steinberg (trace (−1)^{d−1}). Nontrivial central character on F_∞^×/π_∞^ℤ gives trace zero because f_∞ is centrally invariant. The characteristic-p application uses the proof identified in LRS 13.2(ii), whose cited blanket characteristic-zero hypothesis is not used in that proof.

**Hypotheses**

- F_∞ local of characteristic p; π an irreducible unitary representation of GL_d(F_∞) trivial on ϖ_∞^ℤ.



**Construction or proof route**

1. Use the building resolution and the character/Euler characteristic calculation.

2. Reduce from the degree-lattice quotient to the full-centre quotient using central invariance.



**Acceptance**

- For d=2 the Steinberg trace is −1.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `ReductiveGroupsPartII:RG2.2`



**Sources**

- `LRS-1993`, Theorem 13.2(ii), p. 290. Theorem 13.2(ii) gives the two exceptional traces; its proof cites Kottwitz [Kot 2, Theorem 2′], noting in one sentence that the characteristic-zero assumption there is not used.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/EP`.

### Kernel trace formula for the compact quotient

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity` — theorem. Planet: **Kernel trace formula**.

For a compactly supported locally constant test function f on the central quotient, biinvariant under a compact open K and with compatible Haar measures, convolution has finite rank on the K-invariant automorphic subspace. Its kernel is K_f(x,y)=Σ_{γ∈D^×(F)}f(x^{-1}γy), locally finite. Integrating the diagonal gives Σ_Πm(Π)trΠ(f)=Σ_[γ]vol(D_γ^×(F)\D_γ^×(A)/π_∞^ℤ)O_γ(f), with all quotient measures fixed. Absolute integrability follows from compactness and local finiteness after passing to K; no unproved interchange of an infinite unbounded tower sum is used.

**Hypotheses**

- D a central division algebra over F; f locally constant, compactly supported modulo ϖ_∞^ℤ and bi-invariant under a compact open K.

- Haar measures on D^×(A), on centralizers and on ϖ_∞^ℤ fixed compatibly (AA.0).



**Construction or proof route**

1. Construct the locally finite kernel on a finite compact-open cover.

2. Compute its finite-rank diagonal trace and unfold the integral by rational conjugacy classes.

3. Disintegrate using compatible centralizer Haar measures.



**Acceptance**

- Rescaling a Haar measure rescales its convolution function inversely.

- The identity term contributes the quotient volume times f(1).



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `AdelicAlgebraicGroups:AA.0/restricted-haar-product`

- `SmoothRepresentationsOfLocalGroups:SR.1`



**Sources**

- `LRS-1993`, §13.5, p. 291. LRS derive display (13.5) by integrating the kernel over the diagonal; the local finiteness and integrability argument is this node’s own.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/orders`.

### Simple trace comparison in the selected range

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison` — theorem. Planet: **Simple trace comparison**.

Compare the compact D trace formula with GL_d’s simple cuspidal trace formula for factorizable tests with a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, EP at ∞ and matching local functions at the ramified places. The elliptic orbital sides agree with the local transfer signs; the supercuspidal place kills the proper-parabolic terms. This selected identity isolates the prescribed global constituents. It does not construct a general invariant trace formula or arbitrary global Jacquet–Langlands correspondence.

**Hypotheses**

- D, F as above; a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, the EP function at ∞.

- Matching local test functions at the ramified places (local-character-identity); fixed compatible central character.



**Construction or proof route**

1. Build matched factorizable tests with the fixed central character.

2. Use the cusp selector and elliptic support to restrict the GL_d geometric side.

3. Compare elliptic orbital integrals and spectral character traces. The precise Deligne–Kazhdan/Henniart source expansion is recorded as an open gap.



**Acceptance**

- Removing the auxiliary supercuspidal selector does not preserve the stated comparison.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`

- `FunctionFieldArithmetic:FA.6`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`



**Sources**

- `LRS-1993`, Proof of Lemma 15.10, p. 315. Lemma 15.10 uses only the Deligne–Kazhdan simple trace formula for GL_d with these test functions; the comparison with D^× is quoted in 15.11 from Henniart [He 1, A.4], recorded as ES7/gap/simple-transfer.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`.

### Globalization with prescribed cuspidal places

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation` — theorem. Planet: **Cuspidal globalization**.

Let x₀=o and x₁=o′ be distinct finite places, ∞ rational, and π a supercuspidal representation of GL_d(F_o) with finite-order central character. Choose x₂ outside {o,o′,∞}. There is a cuspidal automorphic Π̃ with Π̃_o=π, Π̃_∞=St, and Π̃_{o′},Π̃_{x₂} supercuspidal, for compatible chosen central character. A further auxiliary place x₃ supports an elliptic-regular test. These are the selected globalizations of LRS 15.10; no general globalization of arbitrary essentially square-integrable data is needed for this packet.

**Hypotheses**

- F = F_q(X); distinct places o, o′, x₂ and a rational ∞ outside {o, o′, x₂}.

- π an irreducible supercuspidal representation of GL_d(F_o) whose central character has finite order.



**Construction or proof route**

1. Choose matrix-coefficient/pseudo-coefficient selectors at o,o′,x₂ with nonzero value at 1, and EP at ∞.

2. Use the local elliptic germ argument and weak approximation to choose an elliptic rational conjugacy class.

3. Choose support at x₃ and remaining levels so one geometric term survives; spectral nonvanishing produces Π̃.



**Acceptance**

- The Steinberg component follows after excluding the trivial ∞ component by global cuspidality.

- The central character is compatible globally; it is not assigned independently at every place.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`

- `FunctionFieldArithmetic:FA.6`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`



**Sources**

- `LRS-1993`, Lemma 15.10 and proof, pp. 314–316. Nonvanishing of both sides of the simple trace formula yields the selected globalization.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`.

### Selected global inner-form transfer

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer` — theorem.

For D with invariants +1/d at o, −1/d at o′ and zero elsewhere, the globalization above transfers to a unique automorphic Π of D^×(A) with Π_v=Π̃_v at split places and Π_v=JL(Π̃_v) at o,o′, of multiplicity one. The broader quoted sufficient condition (Hausberger 10.4(2)) is: Π̃ essentially square-integrable at every ramified place and supercuspidal at some auxiliary place v OUTSIDE S, where S is a finite set of places outside which D is split (S ⊇ Ram(D)). Only the selected proven transfer image is consumed by local cohomology.

**Hypotheses**

- D with invariants 1/d at o, −1/d at o′ and 0 elsewhere (split at ∞).

- Π̃ the selected globalization: essentially square-integrable at o, o′, Steinberg at ∞, supercuspidal at a place x₂ outside the ramified set.



**Construction or proof route**

1. Apply the selected simple comparison and the local elliptic character identity.

2. Use the independent strong multiplicity-one/transfer input in Henniart A.4 as quoted by LRS 15.11.

3. Retain the outside-S auxiliary supercuspidal component and all central-character conditions.



**Acceptance**

- Being supercuspidal only at a ramified place does not meet the stated auxiliary hypothesis.

- Multiplicity one is asserted only for this transfer image.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`

- `FunctionFieldArithmetic:FA.6`



**Sources**

- `Hausberger-2005`, Lemmas 10.2–10.3 and Theorem 10.4(2), p. 1340. Theorem 10.4(2) (the page image has v ∉ S, whereas the text extraction loses the negation) puts the auxiliary cuspidal place outside S, a finite set outside which D splits; Lemma 10.3 adds Π_v ≃ JL(Π̃_v) at o, o′.

- `LRS-1993`, Lemma 15.11, p. 316. Lemma 15.11 (quoted from [He 1, A.4]) gives the unique D^×-representation with the same components away from x₀, x₁ and multiplicity one. LRS write Π for the GL_d representation and Π̃ for the D^× one; this packet uses the opposite letters.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`.

**Work required before this stage closes**

- orders: Order existence and division compactness proof

- EP: Building EP orbital/character proof sources

- simple-transfer: Simple trace formula and selected transfer proofs

- classical-local: Badulescu’s equal-characteristic local character identity

- prototypes: Materialize supplier carriers and omitted geometric conditions



## D-elliptic geometry and equal-characteristic comparison

Stage: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`. Coverage: **planned**.

The geometric construction begins with periodic chains of right modules over a maximal-order sheaf. Frobenius pulls back the base S and leaves the curve factor fixed. A level structure trivializes the right module; its group action precomposes the trivialization with left multiplication. For a noncommutative order, right multiplication is not a right-module map, a distinction tested explicitly with 2×2 matrices over 𝔽₃.

Nonempty level rigidifies the moduli problem over the unramified open curve. Hausberger’s extension at the distinguished ramified place parametrizes special D-elliptic sheaves and is not smooth there. The special formal O_D-module tangent condition requires an invertible module over the unramified degree-d subfield, rather than a dimension count alone. On the base deformation space D^× acts only through unramified Frobenius descent; units act nontrivially on the covers.

Global tower cohomology, geometric traces, the contragredient-isotype pairing and the corrected Kaiser chain argument all belong to this geometric layer. The dual isotype must be retained. The relation between L-factors is equality of zero and pole orders at the specified q-powers; a Laurent-monomial difference is sufficient but not necessary. Concentration and multiplicity one are asserted on the selected transfer image, with its independent genericity input.

Hausberger’s analytic quotient gives a smooth-category Ext spectral sequence, followed by degeneration on selected supercuspidal constituents. The proof uses injectivity for the second Ext argument. The printed proof contains two intermediate errors: a zero-kernel assertion in Lemma 10.15 and a generation assertion in §10.4. Source issues E10–E11 replace them by semisimple-isotypic splitting and finite-index averaging. These corrections and the analytic quotient machinery remain explicit proof obligations. Drinfeld–Carayol then supplies the three-action realization. Transport to both Hecke operations requires an equal-characteristic comparison and matching normalizations, independently of the mixed-characteristic p-divisible-group theorem.

The selected local correspondence is independent of globalization within one fixed global setup. Independence of the curve is not asserted. Its bijectivity and local constants come from the classical LRS/Henniart route, before comparison with the excursion parameter.

### D-elliptic sheaves

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf` — definition. Planet: **D-elliptic sheaves**.

With the global order data, D split at a chosen rational ∞, and R the ramification set, a normalized D-elliptic sheaf over S/F_q is a chain of right 𝒟-modules E_i on X×S, locally free of O-rank d², with injections j_i:E_i→E_{i+1} and t_i:τE_i→E_{i+1}, τ=(id_X×Frob_S)^*. The squares commute, E_{i+d}=E_i(∞×S) with the d-fold j map the canonical inclusion, E_i/j_{i−1}E_{i−1}=(Γ_∞)_*A_i and E_i/t_{i−1}(τE_{i−1})=(Γ_z)_*B_i with A_i,B_i locally free of rank d, and z:S→X\({∞}∪R). Require 0≤χ(E_0|X×s)<d. Morphisms are D-linear chain isomorphisms commuting with j,t. This normalization is equivalent to the unnormalized stack modulo index shift.

**Hypotheses**

- X/F_q smooth projective geometrically connected; D central simple over F = F_q(X) of dimension d² (Hausberger §1.1; D = M_d(F) is allowed), split at a rational place ∞; R the ramification set; 𝒟 a maximal order sheaf.

- S an F_q-scheme; τ = (id_X × Frob_S)^*.



**Uses**

- `LRS §§4–6`: The chain defines the moduli functor and its smooth/projective structure.

- `Hausberger §2.2`: Completing at o gives the local divisible/formal module.



**API**

- `DEllipticSheaf` (constructor): The periodic chain with the specified j,t maps and cokernels.

- `DEllipticSheaf.zero` (projection): The zero morphism z:S→X\({∞}∪R).

- `DEllipticSheaf.period` (simp): E_{i+d}=E_i(∞×S), compatibly with j and t.

- `DEllipticSheaf.ext` (extensionality): A chain isomorphism commuting with j,t is exactly an isomorphism of D-elliptic sheaves.

- `DEllipticSheaf.pullback` (functoriality): Pullback along S′→S commutes with τ, j,t, zero and the periodicity data.

- `DEllipticSheaf.matrix_case` (equivalence): Morita equivalence identifies D=M_d(F) with rank-d Drinfeld elliptic sheaves of DM.7.



**Unit tests**

- `DEllipticSheaf.rank_test` (computation): For d=2 each E_i has O-rank 4, while the pole and zero cokernels have rank 2 on S.

- `DEllipticSheaf.frobenius_test` (non-example): Over S=Spec F_{q²}, τ twists the S coefficients by q-Frobenius and leaves the curve X fixed.

- `DEllipticSheaf.matrix_test` (compatibility): For D=M_d(F), the idempotent Morita functor gives DM.7’s rank-d elliptic sheaf, including j,t and its zero.



**Construction or proof route**

1. Use the imported coherent vector-bundle and curve sheaf categories; add the right 𝒟 action and the periodic commuting chain.

2. Impose the pole/zero cokernel conditions and normalized Euler characteristic.

3. For D=M_d(F) use Morita equivalence to the DM.7 elliptic-sheaf construction; do not rebuild its matrix case.



**Acceptance**

- The zero avoids R and ∞.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `AlgebraicModuliForArithmeticGeometry:R09.4`

- `DrinfeldModulesAndTModules:DM.7`

- `mathlib:AlgebraicGeometry.Scheme`

- `mathlib:Module.Free`

- `mathlib:CategoryTheory.Functor`

- `SchemeAndStackFoundations:SF.2/sheaf-algebra`

- `SchemeAndStackFoundations:SF.0`

- `SchemeAndStackFoundations:SF.3`



**Sources**

- `Hausberger-2005`, Definition 1.1, pp. 1292–1293. The Frobenius is on the base S, and the diagram has t from τE_{i−1} to E_i.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Special formal O_D-modules

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module` — definition. Planet: **Special formal modules**.

Let K=F_q((t)), O=O_K, D_K/K division of invariant 1/d, O_D its maximal order and O_d the integers of the unramified degree-d subfield. Over an O-algebra B on which a power of the uniformizer vanishes, a special formal O_D-module is a smooth formal O-module H with compatible O_D-action for which Lie H is an invertible O_d⊗_O B-module. In the height-d² moduli problem it has O-height d² and dimension d. The tangent condition assigns rank one to each unramified embedding; dimension d alone does not imply it.

**Hypotheses**

- K = F_q((t)) (equal characteristic), O its ring of integers; D_K the division algebra of invariant 1/d with maximal order O_D; O_d the unramified degree-d subring.

- B an O-algebra on which a power of the uniformizer vanishes.



**Uses**

- `Hausberger Theorems 3.4,7.2`: Defines the fixed isogeny class and its deformation space.

- `Hausberger §8`: The completed D-elliptic sheaf supplies this local moduli problem.



**API**

- `SpecialFormalODModule` (constructor): Formal O-module, O_D-action and invertible O_d⊗B tangent module.

- `SpecialFormalODModule.lie` (projection): The tangent module with its O_d action.

- `SpecialFormalODModule.baseChange` (functoriality): Base change transports the action and tangent invertibility.

- `SpecialFormalODModule.dimension` (characterisation): On a splitting base each tangent eigenspace has rank 1, so total dimension is d.



**Unit tests**

- `SpecialFormalODModule.rank_one_test` (degenerate): For d=1 specialness is a one-dimensional formal O-module tangent line.

- `SpecialFormalODModule.eigenspaces_test` (computation): For d=2 on a splitting base the two tangent eigenspaces each have rank one.

- `SpecialFormalODModule.dimension_only_test` (non-example): A two-dimensional tangent module with O₂ acting entirely through one embedding is not special.



**Construction or proof route**

1. Import formal O-module and coordinate-module machinery, in equal characteristic.

2. Add the maximal-order action and the tangent-line condition.



**Acceptance**

- Over a splitting base there are d one-dimensional tangent eigenspaces.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `AlgebraicModuliForArithmeticGeometry:R09.6`

- `HeckeStacksAndLocalShtukas:HS2`

- `mathlib:CommRing`

- `mathlib:Module.Invertible`



**Sources**

- `Hausberger-2005`, Definition 3.1, p. 1302. Specialness is the invertibility of the tangent module over O_d⊗B.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Level structures on D-elliptic sheaves

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure` — definition.

For a nonempty finite closed subscheme I⊂X\{∞} disjoint from z(S), the restrictions E_i|I×S identify via j and are denoted E_I. A level-I structure is a right 𝒟_I-linear trivialization ι:𝒟_I⊗O_S≅E_I satisfying t∘τι=ι under the canonical Frobenius identification of the trivial module. Level restriction for I′⊃I is reduction modulo I.

**Hypotheses**

- A D-elliptic sheaf over S with zero z; I ⊂ X ∖ {∞} a nonempty finite closed subscheme with I ∩ z(S) = ∅.



**Uses**

- `Hausberger Theorem 6.1`: Nonempty level removes the automorphism obstruction to scheme representability.

- `Hausberger Theorem 8.3`: Level at o becomes a Drinfeld-cover level.



**API**

- `DEllipticLevel` (constructor): A D_I-linear trivialization satisfying t∘τι=ι.

- `DEllipticLevel.restrict` (functoriality): Reduction along I⊂I′ gives the smaller level, with identity and composition laws.

- `DEllipticLevel.pullback` (functoriality): Base change on S transports the trivialization and the Frobenius square.

- `DEllipticLevel.unitAction` (structure): The finite group 𝒟_I^× = (𝒟 ⊗ O_I)^× acts on the right by ι·g = ι ∘ L_g, where L_g(x)=gx is an automorphism of the right regular module. Its elements are τ-fixed, so t∘τι=ι is preserved; a general unit after extension to O_S need not preserve it. Forgetting the level gives the corresponding torsor. Right multiplication is not right-𝒟_I-linear for a noncentral g.



**Unit tests**

- `DEllipticLevel.frobenius_test` (characterisation): In rank one over a field, replacing a compatible trivialization by a scalar a preserves compatibility exactly when a^q=a.

- `DEllipticLevel.nested_test` (compatibility): For I⊂I′⊂I″, restricting from I″ to I agrees with the two successive restrictions.

- `DEllipticLevel.zero_test` (non-example): If the zero meets I the t map need not be invertible on I, so the level functor’s stated domain excludes that case.

- `DEllipticLevel.right_module_test` (non-example): In M₂(F₃), g=diag(1,2) is a unit. For x=E₁₂, right multiplication gives xg=2E₁₂ while g x=E₁₂, so it is not a right-module map. Left multiplication satisfies L_g(xa)=L_g(x)a and is the operation used on levels.



**Construction or proof route**

1. Use that both pole and zero are disjoint from I to identify all E_i|I.

2. Impose Frobenius compatibility on the right-module trivialization and verify base change/restriction.



**Acceptance**

- A plain bundle trivialization without the t condition is insufficient.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`

- `AlgebraicModuliForArithmeticGeometry:R09.4`

- `mathlib:CategoryTheory.Functor`



**Sources**

- `Hausberger-2005`, §1.3, p. 1293. The Frobenius-compatible trivialization is defined there.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Special-module deformation space

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules` — theorem.

Height-d² special formal O_D-modules over an algebraically closed residue field are O_D-linearly isogenous and End_D⁰(Φ)=M_d(K) for a framing Φ. The functor of pairs (H,ρ), with ρ:Φ→H a height-zero quasi-isogeny modulo the uniformizer, is represented by Ω̂^d⊗̂_OÔ^nr. The GL_d(K) action changes the framing and combines the Drinfeld-space action with Frobenius descent determined by determinant valuation. D_K^× acts on Ω̂^d⊗̂Ô^nr only through g ↦ Frob^{−v(Nrd g)} on Ô^nr (Hausberger Proposition 7.6), so O_D^× acts trivially on the formal scheme; its nontrivial action lives on the Drinfeld covers Σ_n.

**Hypotheses**

- K = F_q((t)); special formal O_D-modules of O-height d²; residue field algebraically closed (k̄ = F̄_q).



**Construction or proof route**

1. Use equal-characteristic coordinate/Dieudonné-module classification to identify the framing isogeny class.

2. Apply the formal-moduli representability theorem of Drinfeld/Genestier.

3. Match the framing and semilinear Weil actions; exact source proof expansion remains a geometry gap.



**Acceptance**

- At d=1 Ω has dimension zero.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`

- `AlgebraicModuliForArithmeticGeometry:R09.6`

- `HeckeStacksAndLocalShtukas:HS2`



**Sources**

- `Hausberger-2005`, Theorems 3.4,7.2,7.4, §§7.2–7.3, pp. 1303,1317–1319. Theorem 7.2 represents the framed deformation functor by Ω̂^d ⊗̂_O Ô^nr; Propositions 7.5–7.6 give the GL_d(K) and D^× actions (D^× only through Frobenius on Ô^nr).



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`.

### D-elliptic level moduli

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke` — construction. Planet: **D-elliptic level moduli**.

For a nonempty level I, normalized D-elliptic sheaves with level are represented by E_{X,D,I} over U=X\({∞}∪I∪R), smooth of pure relative dimension d−1 and quasi-projective. If D is division the morphism is projective. The normalization equals LRS’s quotient by the index-shift ℤ. At the distinguished ramified o, for levels disjoint from o, special D-elliptic sheaves (Hausberger §6.2) are represented by Hausberger 6.4’s projective extension over U∪{o}, not smooth at o; levels including o are used only on the generic fibre. The proof uses the chain bundle moduli and the one-step Hecke diagram with Frobenius intersection.

**Hypotheses**

- D central simple over F, split at ∞ (division for projectivity); I a nonempty level; U = X ∖ ({∞} ∪ I ∪ R).



**Uses**

- `Hausberger Theorem 8.1`: The away-o extension has the formal completion used for uniformization.

- `LRS §14`: Smooth proper generic fibres provide finite-level cohomology and purity.



**API**

- `DEllipticModuli` (constructor): The representing level scheme over U.

- `DEllipticModuli.points` (universal-property): For S/U its S-points are level D-elliptic sheaves, functorially in S.

- `DEllipticModuli.level_map` (functoriality): Nested levels give the forgetful morphism with identity/composition laws.

- `DEllipticModuli.dimension` (characterisation): The zero morphism is smooth of relative dimension d−1.

- `DEllipticModuli.projective` (compatibility): For division D it is projective; the distinguished-place extension requires I∩{o}=∅.



**Unit tests**

- `DEllipticModuli.rank_one_test` (degenerate): At d=1 the zero morphism is smooth of relative dimension 0.

- `DEllipticModuli.shift_test` (compatibility): Choosing χ(E_0) in [0,d) gives the same moduli as dividing the unnormalized chain stack by index shift.

- `DEllipticModuli.level_at_o_test` (non-example): A level including o is not assigned the formal extension asserted for levels away from o.



**Construction or proof route**

1. Use the R09 moduli and quotient machinery for the chain data.

2. Apply the smooth Hecke map and Frobenius-transversality to prove relative dimension d−1.

3. Apply boundedness and the division-algebra properness argument; construct the special extension at o with the stated level exclusion.



**Acceptance**

- For d=1 the smooth relative dimension is zero.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`

- `AlgebraicModuliForArithmeticGeometry:R09.2`

- `AlgebraicModuliForArithmeticGeometry:R09.5`

- `AlgebraicModuliForArithmeticGeometry:R09.6`

- `mathlib:AlgebraicGeometry.Scheme`



**Sources**

- `Hausberger-2005`, Theorem 6.1, proof and Theorem 6.4, pp. 1311–1313. The moduli theorem and the division/projective extension hypotheses are explicit.

- `LRS-1993`, Theorems 4.1, 5.1, 6.1 and Corollary 6.2, pp. 236, 241, 246. Theorem 4.1 (smooth DM stack of relative dimension d − 1), Theorem 5.1 (quasi-projective for I ≠ ∅) and Theorem 6.1 (properness for D division); projectivity with Corollary 6.2.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Frobenius and Hecke correspondences

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences` — construction.

On the moduli tower the right action of D^×(A_F^∞) is represented by finite-level Hecke correspondences between suitable refinements of levels, not by automorphisms at a fixed arbitrary level. For a good place x and fixed level, geometric Frobenius and the spherical Hecke correspondence commute. The induced left action on cohomology uses pullback/pushforward and the inverse of the right-action convention.

**Hypotheses**

- Levels I with the D-elliptic moduli E_I; g ∈ D^×(A^∞); x a place of good reduction for the given level.



**Uses**

- `LRS Theorem 13.6`: Hecke/Frobenius traces enter the geometric trace identity.

- `Hausberger Corollary 10.7`: The spectral sequence must commute with all level and Hecke actions.



**API**

- `DEllipticHecke` (constructor): The finite correspondence at refined levels associated to g∈D^×(A^∞).

- `DEllipticHecke.mul` (compatibility): Composition on the tower is the right group action law; cohomology receives the corresponding left action.

- `DEllipticHecke.frobenius` (compatibility): At good places the Hecke action commutes with geometric Frobenius.

- `DEllipticHecke.level` (functoriality): Transition maps of levels commute with the correspondences.



**Unit tests**

- `DEllipticHecke.identity_test` (degenerate): The element 1 gives the identity correspondence at every level.

- `DEllipticHecke.level_test` (characterisation): An element that does not normalize K_I is a correspondence through a refined level, not an automorphism of E_I.

- `DEllipticHecke.right_left_test` (compatibility): The product law of the induced left cohomology action agrees with the inversion convention for the right action.



**Construction or proof route**

1. Choose common refined level on which a given adelic element defines the correspondence.

2. Use EDC.8 composition and trace maps and verify independence of the refinement.

3. Track the inversion from right geometric action to left cohomology action.



**Acceptance**

- The spherical Hecke normalization at a good place matches LRS 14.9.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `AdelicAlgebraicGroups:AA.1`

- `SmoothRepresentationsOfLocalGroups:SR.1`

- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`

- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`



**Sources**

- `Hausberger-2005`, §6.3, pp. 1315–1316 (right action and Hecke correspondences); §10.1, p. 1338 (induced left action on cohomology). The source converts the right tower action to a commuting left cohomology action.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`, `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### D-elliptic uniformization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` — theorem. Planet: **D-elliptic uniformization**.

Take global D with inv_o(D)=1/d, inv_o′(D)=−1/d and inv_∞(D)=0. Let D̄ have inv_o(D̄)=0, inv_∞(D̄)=1/d and the same other invariants. For level I away from ∞,o set Z_I=D̄^×(F)\D̄^×(A^∞)/K_I^{∞,o}, where D̄_o^×≅GL_d(F_o). The formal completion of the extended E_I along o is ((Ω̂^d⊗̂Ô_o^nr)×Z_I)/GL_d(F_o). At level n at o, the generic analytic fibre is (Σ_n^d×Z_{I^o})/GL_d(F_o), with Weil descent; Theorem 8.3 phrases the covers over F_o by restriction of scalars, and §§9.2, 10 use Res′ (the ℤ-indexed coproduct) for their cohomology. These identifications commute with level restriction, the away-o Hecke action and D_o^×; no formal model with o-level is asserted by 8.1.

**Hypotheses**

- D with inv_o(D) = 1/d, inv_o′(D) = −1/d, split elsewhere; D̄ with inv_o(D̄) = 0, inv_∞(D̄) = 1/d and the other invariants of D.

- Level I away from ∞ and o; for the generic-fibre statement, additional Drinfeld level n at o.



**Construction or proof route**

1. Complete the D-elliptic sheaf at o and separate its special formal module from the global isogeny data.

2. Identify the global isogeny class with the D̄ double-coset space and the local deformation with Ω̂.

3. Quotient by GL_d(F_o), add generic cover levels, and check all descent and Hecke actions.



**Acceptance**

- D and D̄ are split at different places.

- The quotient factor has D̄ in it; replacing it by D changes the theorem.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `HeckeStacksAndLocalShtukas:HS2`

- `AlgebraicModuliForArithmeticGeometry:R09.6`



**Sources**

- `Hausberger-2005`, §8.1 (pp. 1319–1321; D̄ defined p. 1319), Theorem 8.1 (p. 1321), Theorem 8.3 (p. 1323). The formal statement uses D̄ and away-o level; Theorem 8.3 adds Drinfeld covers on generic fibres.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`.

### Global tower cohomology and automorphic isotypes

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology` — theorem.

For division D and each level I let H_I^i=H^i(E_{I,F̄},Q̄_ℓ), 0≤i≤2(d−1). It is finite dimensional with finite coefficient field and continuous Galois action. H^i=colim_IH_I^i carries commuting D^×(A^∞) and Galois actions, with finite-dimensional K_I-invariants. Decompose the semisimplified tower into automorphic Π^∞⊗V_Π^i with Π_∞=1 or St. This node gives the decomposition and alternating trace; concentration in a single degree and multiplicity one are restricted to the selected transfer image in the separate node below.

**Hypotheses**

- D a central division algebra over F = F_q(X), split at the rational place ∞; level I; ℓ ≠ p; coefficients Q̄_ℓ.



**Construction or proof route**

1. Use EDC finite-level cohomology, proper base change and the Hecke tower.

2. Use finite compact-open invariants and the discrete spectrum to define isotypes.

3. Apply the alternating trace identity to restrict possible ∞ components; do not use the unpublished ample-class proof for arbitrary Π.



**Acceptance**

- Full tower cohomology is not asserted finite dimensional.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `EtaleDualityAndPerverseSheaves:EDC.2`

- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `mathlib:Representation`

- `mathlib:DirectSum`



**Sources**

- `Hausberger-2005`, Theorem 10.1 and its setup, pp. 1338–1339. The cohomology setup restates LRS §14; the packet restricts the stronger concentration assertion to its selected globalizations.

- `LRS-1993`, §§14.1–14.2 and Theorem 14.9, pp. 294, 297–298. The limit cohomology, its admissible (D^∞)^×-action and isotypic decomposition (§§14.1–14.2) precede Theorem 14.9.



### Fundamental local representation

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation` — definition. Planet: **Fundamental local representation**.

For ℓ≠p and the equal-characteristic Drinfeld covers, Res′Σ_n^d=⊔_{r∈ℤ}Σ_n^d⊗_{K̂^nr,ϕ_q^r}K̂^nr with its Weil descent; it is not the ordinary restriction of scalars along the infinite unramified extension. Put U_d^i=colim_nH_c^i((Res′Σ_n^d)_K̄,Q̄_ℓ); the fundamental representation is degree i=d−1. It has commuting GL_d(K), D_K^× and W_K actions. The stabilizer of a component is P_d={(g,b,w):det(g)Nrd(b)Cl(w)^{-1}∈O_K^×}, with Cl(geometric Frobenius)=uniformizer, and U_d^i=c-Ind_{P_d}^{GL_d(K)×D_K^××W_K}colim_nH_c^i(Σ_n^d). For finite-order ξ, U_d^i(ξ) is the largest quotient with central action ξ.

**Hypotheses**

- K = F_q((t)); ℓ ≠ p; Σ_n^d the Drinfeld covers of level n of the Drinfeld upper half space Ω^d over K̂^nr.

- ξ : K^× → Q̄_ℓ^× a character of finite order (for the central quotient).



**Uses**

- `Hausberger Theorem 9.5`: Its supercuspidal isotypic quotient realizes JL and the Weil parameter.

- `Hausberger Proposition 10.6`: Its finite-level cohomology is the source of the quotient spectral sequence.



**API**

- `FundamentalLocalRepresentation` (constructor): The level colimit of compact-support cohomology of Res′Σ in degree i.

- `FundamentalLocalRepresentation.threeActions` (structure): Commuting GL_d(K), D_K^× and continuous Weil actions on compact-open invariants.

- `FundamentalLocalRepresentation.compactInduction` (equivalence): The induction from P_d identifies the component-colimit description with U_d^i.

- `FundamentalLocalRepresentation.centralQuotient` (constructor): For finite-order ξ the maximal quotient on which the GL_d centre acts by ξ.

- `FundamentalLocalRepresentation.level` (functoriality): Finite-level pullback maps define the direct system and commute with the three actions.



**Unit tests**

- `FundamentalLocalRepresentation.degree_test` (computation): For d=2 the fundamental representation has degree 1.

- `FundamentalLocalRepresentation.stabilizer_test` (non-example): A g with v(det g)=1 does stabilize a component together with w satisfying v(Cl(w))=1 and b=1; determinant valuation alone is not the stabilizer condition.

- `FundamentalLocalRepresentation.coproduct_test` (characterisation): A class with compact support in Res′ has finite component support; all ℤ-indexed components are present, rather than a product or all unramified Galois automorphisms.



**Construction or proof route**

1. Use the ℤ-indexed components and geometric reciprocity to define the three commuting actions.

2. Take compact-support cohomology and the colimit over cover levels.

3. Compact support gives compact induction from the component stabilizer, with all three valuation terms.



**Acceptance**

- The middle degree is d−1.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`

- `SmoothRepresentationsOfLocalGroups:SR.2`

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`

- `mathlib:Representation`

- `mathlib:DirectSum`

- `mathlib:MonoidHom`

- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`

- `mathlib:Representation.ind`



**Sources**

- `Hausberger-2005`, §§9.2–9.3, Definition 9.3, pp. 1335–1337. The ordinary infinite restriction is rejected, and Res′ is explicitly the ℤ-indexed coproduct with the triple-action stabilizer.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`.

### Geometric and automorphic trace identity

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace` — theorem.

For good place o, r≥1 and a level-compatible away-o Hecke test, the alternating cohomological trace of Frobenius_o^r and the correspondence is the spectral trace Σ_Πm(Π)trΠ(f_∞f_{o,r}f^{∞,o}). The EP traces give coefficients 1 for Π_∞=1 and (−1)^{d−1} for Π_∞=St. For a Steinberg isotype and almost all places o (outside a finite set containing ∞, the bad places and the places where Π_o is ramified; LRS Theorem 14.9(ii)) the alternating trace is (−1)^{d−1}m(Π)q_o^{r(d−1)/2}Σ_{j=1}^dz_j(Π_o)^r. This is an alternating trace statement before proving concentration.

**Hypotheses**

- Level I; o a place of good reduction for I; r ≥ 1; a level-compatible Hecke test function away from o and ∞.



**Construction or proof route**

1. Use the EDC.8 correspondence trace interface with the isolation/large-power bounds from LRS §§11–12.

2. Apply the compact kernel formula and EP orbital transfer.

3. At an unramified place use the spherical Satake polynomial and its q_o^{(d−1)/2} normalization.



**Acceptance**

- For d=2 the alternating Steinberg sign is −1, before the middle-degree sign cancels it.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `FunctionFieldArithmetic:FA.6`

- `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`

- `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`



**Sources**

- `LRS-1993`, Proposition 13.6 and Theorem 14.9(ii), pp. 291, 297. Proposition 13.6 expresses the geometric trace spectrally; Corollary 13.7 and Theorem 14.9(ii) give the coefficients and the Steinberg isotype formula.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Pairing dual automorphic isotypes

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing` — lemma.

At finite proper level with dimension d−1, Poincaré duality pairs H^i[Π] with H^{2(d−1)−i}[Π^∨](d−1); equivalently (H^i[Π])^∨≅H^{2(d−1)−i}[Π^∨](d−1), with the dual automorphic multiplicity factor and inverse central character. The Hecke adjoint is the inverse correspondence. There is no identification with the same Π-isotype unless a compatible self-duality is separately specified.

**Hypotheses**

- Finite proper level I, so E_I is smooth projective of dimension d − 1 over F; Π automorphic with contragredient Π^∨.



**Construction or proof route**

1. Apply the perfect finite-level pairing and the adjoint correspondence identity.

2. Project onto the two automorphic isotypes, using contragredience on the smooth action and inversion of the central character.

3. Track the grading and twists before forming L-factors.



**Acceptance**

- For a non-self-dual rank-one Hecke character the paired component has inverse character.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`

- `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`



**Sources**

- `Kaiser-erratum`, Opening paragraph and Corollary 14.11 correction, p. 1. Kaiser identifies the false self-duality claim (LRS p. 300 and §14.16, p. 306); the isotypic pairing of Π with Π^∨ is the standard consequence of Poincaré duality that this node states, not printed in the erratum.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Local cohomology finiteness and continuity

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness` — theorem.

For 0≤j≤2(d−1), finite cover level n gives smooth GL_d(K)×D_K^× action on H_c^j((Res′Σ_n^d)_K̄,Q̄_ℓ), of finite type as a GL_d(K)-module, with continuous Weil action on compact-open invariants. The claim that the full tower quotient U_d^i(ξ) is GL_d(K)-admissible is an additional Boyer/Faltings input in Hausberger 9.4; it is not needed in the proof of the supercuspidal identity and is not deduced from finite type.

**Hypotheses**

- K = F_q((t)); ℓ ≠ p; finite cover level n; 0 ≤ j ≤ 2(d − 1).



**Construction or proof route**

1. Use Berkovich finiteness and the locally finite covering by translates of compact analytic domains.

2. Check stabilizers and compatible descent to obtain smoothness and continuity.



**Acceptance**

- Finite type is not synonymous with admissibility.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `tauceti:TauCeti.IsSmoothDiscrete`

- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`



**Sources**

- `Hausberger-2005`, Proposition 10.6(i) and Proposition 9.4 caveat, pp. 1341,1337. The finiteness statement is at finite cover level; the source separately flags the full GL_d admissibility import.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`.

### Corrected L-factor duality

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum` — comparison.

Use Kaiser’s correction in Corollary 14.11: replace L_x(V_Π∞^bullet,q_x^{−d}T^{−1}) by L_x((V_Π∞^bullet)^∨,q_x^{−1}T^{−1}) in both statement and proof. Both the dual and the exponent change. The isotypic pairing is the dual-isotype pairing above. Use Lemma 14.14′ and Proposition 14.17′, not their published self-dual hypotheses, in the general proof of 14.12. This packet’s selected generic proof avoids the unpublished invariant-ample-class argument.

**Hypotheses**

- Π automorphic for D^× with Π_∞ ≅ St_d; x a place of good reduction; V_Π∞^• the graded isotypic Galois representation of LRS 14.11.



**Construction or proof route**

1. Read the published Corollary 14.11 against the erratum.

2. Replace the local factor in both occurrences; pair Π with Π∨ and preserve the chosen graded L-function convention.



**Acceptance**

- Changing only V to V∨ while keeping q_x^{-d} is not the correction.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`

- `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`



**Sources**

- `Kaiser-erratum`, Corollary 14.11 correction, p. 1. The correction changes the dual representation and q-exponent, not only an informal self-duality warning.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Corrected graded chain lemma

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma` — lemma.

Let d≥1, m,m′≥0 with m′ dividing m, and let V^bullet be a pure graded Frobenius-semisimple ℓ-adic local Galois representation in the sense of LRS 14.13, degrees 0,…,2d−2. Suppose L_∞(V^bullet,T)/L_∞((V^bullet)^∨,q_∞^{-1}T^{-1}) ~ ((1−q_∞^{-d}T^{-1})/(1−T))^m, where f ~ g means equal orders of zero or pole at T = q_∞^n for every n ∈ ℤ (LRS 14.13; a nonzero Laurent-monomial difference, as in corrected 14.11(iii), is a special case), and each L_∞(V^i,T)^{-1} is an m′-th power in 1+TQ̄_ℓ[T]. Then V has a direct summand ⊕_{a∈A}W_a, each W_a=[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m′}, with positive i_j summing to d and m=|A|m′. A term σ⁰(St_i)(−j) lies in degree i+2j−1. Self-duality and integrality are not hypotheses of the amended lemma.

**Hypotheses**

- d ≥ 1; m, m′ ≥ 0 with m′ | m; V^• a pure graded Frobenius-semisimple ℓ-adic representation of the local Weil group at ∞ in degrees 0, …, 2d − 2 (LRS 14.13).

- The ratio and m′-th power conditions on its local L-factors stated in the node.



**Construction or proof route**

1. Extract an indecomposable σ⁰(St_i) from the root 1 of the local factor. Purity determines its degree.

2. Use the m′-power condition to extract m′ copies and the ratio to force the next Tate-shifted term.

3. Continue until the positive chain lengths sum to d, take a complement and induct.



**Acceptance**

- At d=1 the chain is σ⁰(St₁) in degree 0.

- The conclusion is a direct summand, not that V has no further zero-L-factor summands.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`

- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`

- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`

- `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`



**Sources**

- `Kaiser-erratum`, Lemma 14.14′ and its proof, pp. 1–2. Lemma 14.14′ drops the integrality and self-duality hypotheses of LRS 14.14 and concludes one-sided chains with m = |A|m′.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Selected global middle cohomology

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology` — theorem.

For Π in the proven transfer image of LRS 15.10–15.11, V_Π^i=0 for i≠d−1, dimV_Π^{d−1}=d and m(Π)=1. At a good o, Frobenius trace is q_o^{r(d−1)/2}Σ_jz_j(Π̃_o)^r. The normalized Σ(Π)=V_Π^{d−1}((d−1)/2) is the selected global Galois representation. The local components of Π̃ at split good places are generic (the independent genericity theorem), so the elementary remark following 14.12, cited explicitly in LRS 15.12, proves concentration using the strict unitary-generic Satake bound and purity. No arbitrary division-algebra isotype concentration is asserted.

**Hypotheses**

- Π in the proven transfer image of LRS 15.10–15.11 (the selected globalizations); o a good place.



**Construction or proof route**

1. Use multiplicity one only for the selected transfer.

2. Import genericity and the strict Satake bound for its split unramified components. Combine the alternating trace and purity to separate the degrees as in the remark to 14.12.

3. Normalize the weight and use Chebotarev to identify the selected global Galois representation.



**Acceptance**

- For d=1 the selected representation has degree zero and dimension one.

- Purity alone is not used to deduce arithmetic Frobenius semisimplicity.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`

- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `FunctionFieldArithmetic:FA.6`

- `FunctionFieldArithmetic:FA.4`

- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`



**Sources**

- `LRS-1993`, Theorem 15.12 (pp. 316–317) and the Remark following it (p. 317). The selected generic route avoids the more subtle proof of general Theorem 14.12.

- `Hausberger-2005`, Proposition 10.5, p. 1341. Proposition 10.5 restricts to the representation obtained from π by Lemmas 10.2–10.3 and gives vanishing outside degree d − 1; the Frobenius trace formula and the genericity/Satake-bound route are LRS’s.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Hochschild–Serre for the geometric quotient

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre` — theorem.

For the uniformized finite-level quotient and 0≤j≤2(d−1), there is a convergent spectral sequence E₂^{i,j}=Ext^i_{GL_d(K),sm}(H_c^{2(d−1)−j}((Res′Σ_n^d)_K̄,Q̄_ℓ)(d−1),A_{D̄}^{∞,level})⇒H^{i+j}(E_{I,K̄},Q̄_ℓ). A_{D̄}^{∞,level} is the space of automorphic forms on the D̄ double-coset space Z_{I^o} of uniformization, trivial at ∞. The system is compatible with levels, original D away-o and D_o^× actions and W_K. Import the general continuous Hochschild–Serre/derived invariants construction from R02.2; the properly discontinuous analytic quotient, compact-support duality and finite stabilizers are proved for this application here.

**Hypotheses**

- Uniformized finite-level quotient of E_I at o (level away from ∞, cover level n at o); 0 ≤ j ≤ 2(d − 1); ℓ ≠ p.



**Construction or proof route**

1. Use the formal/analytic uniformization and the D̄ double-coset coefficient space.

2. Apply the general derived construction, after checking discontinuity, stabilizers and the analytic/cohomological comparison.

3. Apply Poincaré duality in dimension d−1; verify transition and three-action equivariance, including transpose-inverse conventions in 10.8.



**Acceptance**

- The duality twist is d−1 and compact cohomological degree is 2(d−1)−j.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `SmoothRepresentationsOfLocalGroups:SR.2`

- `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence`

- `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`

- `ClassicalAdicEtaleCohomology:H3/berkovich-derived-duality-interface`

- `mathlib:CategoryTheory.Abelian.Ext`



**Sources**

- `Hausberger-2005`, Proposition 10.6(ii) (p. 1341), Corollary 10.7 and Remark 10.8 (p. 1342), Proposition A.12 (pp. 1364–1365). The displayed E₂ page uses compact-support duality and smooth Ext; Appendix A provides the analytic quotient application.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`.

### Corrected automorphic graded chain

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition` — theorem.

For an automorphic Π with Π_∞≅St_d, the finite-dimensional graded isotypic representation of LRS 14.17, restricted to the decomposition group at ∞, satisfies (V_Π∞^bullet)^{Frob-ss}≅[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m(Π)}, for positive i_j with Σi_j=d. Terms have degree i_j+2(i_0+⋯+i_{j−1})−1. This is the amended Proposition 14.17′; it is a chain conclusion, not yet the one-part middle-degree concentration theorem.

**Hypotheses**

- Π automorphic for D^× with Π_∞ ≅ St_d; V_Π∞^• as in LRS 14.17.



**Construction or proof route**

1. Supply the graded local weight/monodromy and L-factor inputs listed in LRS 14.13–14.17.

2. Apply the amended chain lemma with m′=m(Π) and the dimension constraints.



**Acceptance**

- A chain with several positive parts cannot simply be identified with St_d in middle degree.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`

- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`

- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`

- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`

- `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`



**Sources**

- `Kaiser-erratum`, Proposition 14.17′, p. 1. Proposition 14.17′ replaces the U′/U″ alternatives of LRS 14.17 by chains of multiplicity m(Π); Kaiser keeps the proof.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/weights`.

### Independence of the selected globalization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence` — theorem.

For a supercuspidal π of GL_d(K) with finite-order central character, restrict Σ(Π) from each selected globalization to W_K. All resulting semisimple local representations are equal up to isomorphism: within one global setup (curve, x₀ = o, x₁ = o′, ∞ and D fixed), independent of the selected globalization Π ∈ Π(π) and of the auxiliary place x₂ (LRS Corollary 15.14). Independence of the curve and of o′ is not asserted. Their determinants match the central character, contragredients and finite-order twists correspond, and Rankin–Selberg pair L- and ε-factors agree with the Galois tensor-product factors, with the same nontrivial additive character and geometric reciprocity.

**Hypotheses**

- K a local field of characteristic p; π a supercuspidal representation of GL_d(K) with finite-order central character; the selected globalizations of LRS 15.10–15.11.



**Construction or proof route**

1. Match determinants and twists by the unramified Frobenius data and Chebotarev.

2. Compare global functional equations for selected pairs; control local zeros/poles using purity.

3. Apply the local-constant uniqueness theorem quoted by LRS (Henniart 4.1/4.4/4.5), retaining it as a specific proof/source gap.



**Acceptance**

- For d=1 the result is local class field theory.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`

- `FunctionFieldArithmetic:FA.6`

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`

- `WeilConjectures:WC.2`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `FunctionFieldArithmetic:FA.4`

- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`



**Sources**

- `LRS-1993`, Proposition 15.13 and Corollary 15.14, pp. 317–318. Proposition 15.13 gives determinant, contragredient, twist and pair-factor compatibilities; Corollary 15.14 gives independence over the globalizations Π ∈ Π(π) of one fixed global setup.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`.

### Cuspidal degeneration of the quotient spectral sequence

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` — theorem.

For a selected global transfer with local π_o supercuspidal, its multiplicity in the E₂^{i,j} page is zero for i>0. Hence the selected cuspidal part degenerates and E₂^{0,j}[Π^{∞,o}]≅(H_o^j)^ss[Π^{∞,o}] with its D_o^× and Weil actions as in Hausberger 10.17. Restrict π_o to GL_d(K)^0={g:v(det g)=0}; its compact matrix coefficients yield an injective object of the smooth characteristic-zero category. Compact induction/Frobenius reciprocity then kills the relevant higher Ext. The finite-type source and finite-level admissibility justify the multiplicity calculation.

**Hypotheses**

- A selected global transfer whose component at o is supercuspidal; coefficients Q̄_ℓ (characteristic zero).



**Construction or proof route**

1. Apply Frobenius reciprocity from the component stabilizer to GL_d(K)^0.

2. Use compact matrix coefficients and the SR.3 characteristic-zero finite-representation injectivity theorem. Prove the isotypic lift by semisimple splitting, rather than Hausberger 10.15’s false zero-kernel claim (E10).

3. Track subquotient multiplicities across the spectral sequence and use the selected cohomology calculation.



**Acceptance**

- This is not full degeneration for arbitrary automorphic constituents.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`

- `SmoothRepresentationsOfLocalGroups:SR.2`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `mathlib:CategoryTheory.Injective`



**Sources**

- `Hausberger-2005`, Lemma 10.14, Lemma 10.15, Remark 10.16, Proposition 10.17, pp. 1353–1356. The proof uses the restriction to the determinant-unit subgroup and the finite-representation projective/injective argument. Use the corrected semisimple-block lifting argument recorded in E10.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`.

### Independent equal-characteristic classical LLC

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence` — theorem.

The selected construction π↦σ_d(π)=Σ(Π)|W_K gives a bijection between supercuspidal GL_d(K) representations with finite-order central character and irreducible continuous d-dimensional Weil representations with finite-order determinant, preserving central characters, twists, duals and pair local constants. Surjectivity uses Henniart’s numerical local Langlands theorem (LRS 15.17–15.20); it is not obtained from the excursion parameter. Extend to arbitrary central characters and irreducibles through the independently supplied twisting/segment classification. The full Weil–Deligne correspondence is used only through its semisimple Weil restriction in ES7.

**Hypotheses**

- K a local field of characteristic p; ℓ ≠ p; supercuspidal representations with finite-order central character and irreducible d-dimensional ℓ-adic Weil representations with finite-order determinant.



**Construction or proof route**

1. Use LRS 15.14 for the injection and local-constant compatibility.

2. Apply the numerical theorem in the exact finite-order/conductor range to obtain surjectivity.

3. Use unramified twists and segment classification with pinned normalization to extend the finite-order supercuspidal correspondence.



**Acceptance**

- This proof route has no prerequisite on the excursion comparison or ES7:GLn-comparison.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`

- `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`

- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`

- `FunctionFieldArithmetic:FA.4`

- `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`



**Sources**

- `Hausberger-2005`, Theorem 9.2, pp. 1334–1335. Hausberger restates the independently constructed LRS correspondence with its four characterizing properties.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`.

### Drinfeld–Carayol supercuspidal realization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol` — theorem. Planet: **Drinfeld–Carayol theorem**.

Let ξ:K^×→Q̄_ℓ^× have finite order, and π be supercuspidal of GL_d(K) with central character ξ. Its isotypic quotient in U_d^i(ξ) vanishes for i≠d−1, and Hom_{GL_d(K)}(π,U_d^{d−1}(ξ))≅JL(π)⊗(σ_d(π)⊗|·|^{(1−d)/2}), compatibly with D_K^××W_K. This is the three-action realization. Extension to arbitrary central character requires the twisting comparison; the theorem stated here is precisely the finite-order range of Hausberger 9.5.

**Hypotheses**

- K = F_q((t)); ℓ ≠ p; ξ : K^× → Q̄_ℓ^× of finite order; π supercuspidal of GL_d(K) with central character ξ.



**Construction or proof route**

1. Choose the selected globalization and transfer for π.

2. Compare its degree-d−1 isotype with the spectral sequence’s Hom term and selected global σ_d.

3. Pass through the cover/level colimits and finite-order central quotient; use the normalization |·|^{(1−d)/2}.

4. For the Hom duality in the fixed-central-character category, use semisimple-block lifting and the finite-index subgroup Z(K)·GL_d(K)^0, of index d, followed by characteristic-zero averaging; the two invalid intermediate assertions in Hausberger’s printed argument are recorded as E10–E11.



**Acceptance**

- For d=1 the twist is zero.

- The non-supercuspidal Carayol–Harris formula is a conjecture and is not a target.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`



**Sources**

- `Hausberger-2005`, §9.3 and Theorem 9.5 (p. 1337); final proof in §10.4 (pp. 1356–1357). The finite-order central character was fixed immediately before the theorem; the isotype is Hom, not an unexplained subspace. The fixed-central-character projectivity route uses the finite-index correction in E11.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`.

### Equal-characteristic Hecke-fibre realization

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport` — comparison.

Identify the equal-characteristic special formal O_D-module/Drinfeld covers and the dual local formal O-module spaces with the minuscule local-shtuka Hecke fibres for GL_d. Transport Drinfeld–Carayol’s three-action cohomology and its dual realization through HS3, with matching D^×, GL_d(K), two Weil actions, [d−1] and ((d−1)/2) Satake normalization. The output is exactly the two-operation package σ⊗ρ_π⊗ρ_π^∨ used by the single GLn-comparison trace theorem. The mixed-characteristic p-divisible-group theorem alone does not provide this identification.

**Hypotheses**

- E = K a local field of characteristic p; G = GL_d; π supercuspidal over Q̄_ℓ, σ = JL(π) on D_K^× with D_K of invariant 1/d.



**Construction or proof route**

1. Match the equal-characteristic formal-module moduli with local-shtuka fibres using an O-module coordinate functor.

2. Use the three-action realization and its duality to identify both Hecke operations.

3. Check normalizations and export the package to the shared trace theorem. The exact comparison source and second-operation proof require the named transport refinement.



**Acceptance**

- All three actions survive the comparison; an isomorphism of underlying spaces alone is insufficient.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`

- `HeckeStacksAndLocalShtukas:HS2`

- `HeckeStacksAndLocalShtukas:HS3`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`



**Sources**

- `FS-geometrization`, §IX.7.3, p. 338 (cf. §IX.3, pp. 324–325). FS use the §IX.3 translation and the Lubin–Tate/Drinfeld description of [SW13], which is mixed characteristic; FS give no equal-characteristic identification, so it is recorded as ES7/gap/equal-transport.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`.

### Classical agreement in equal characteristic

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement` — theorem.

For E a local field of characteristic p and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter φ_π equals the semisimplification of the Weil part of the classical parameter of π (the LRS correspondence of classical-local-correspondence, extended to all irreducibles by twists and the segment classification). For supercuspidal π: hecke-fibre-transport supplies the two-operation package σ ⊗ ρ_π ⊗ ρ_π^∨ for σ = JL(π); two-leg-excursion-is-a-trace and trace-determines-semisimplification identify the parameter of σ on the basic stratum, and the direct-summand argument of supercuspidal-agreement transports it to π. The general case follows as in all-irreducible-representations from normalised-induction-dictionary. This is the equal-characteristic half of FS Theorem IX.7.4; it does not identify N.

**Hypotheses**

- E a local field of characteristic p > 0 (E ≅ F_q((t))); ℓ ≠ p; coefficients Q̄_ℓ.

- π any irreducible smooth Q̄_ℓ-representation of GL_n(E); classical parameters from classical-local-correspondence extended by twists and segments.



**Construction or proof route**

1. Apply hecke-fibre-transport to obtain T_V(B)|Bun^b ≅ σ ⊗ ρ_π ⊗ ρ_π^∨ in equal characteristic.

2. Run the shared two-leg trace theorem and trace determination (both characteristic-free statements of ES7:GLn-comparison).

3. Transport to π by the direct-summand argument and Hecke/excursion commutation; extend to all irreducibles by normalized parabolic induction and the classical segment rule.



**Acceptance**

- For n = 1 this is local class field theory with geometric normalisation.

- The trivial and Steinberg representations of GL₂(E) have the same semisimple parameter (diagonal, Frobenius ↦ diag(q^{1/2}, q^{-1/2})) although their monodromy differs.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`

- `HeckeStacksAndLocalShtukas:HS3`

- `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`

- `VStackSheavesAndLisseCategories:VS4`

- `SmoothRepresentationsOfLocalGroups:SR.3`

- `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`



**Sources**

- `FS-geometrization`, Theorem IX.7.4 and proof, p. 338. FS state IX.7.4 for every E and cite [LRS93], [Hau05] and [Boy99] for the equal-characteristic towers; this node is the equal-characteristic half.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`.

**Work required before this stage closes**

- moduli: D-elliptic moduli proof expansion

- local-geometry: Equal-characteristic formal-module and uniformization proof

- weights: Corrected graded local chain proof closure (Kaiser)

- classical-local: Independent local correspondence and constants

- analytic-HS: Analytic quotient spectral sequence and Ext degeneration

- equal-transport: Equal-characteristic transport and second operation

- prototypes: Materialize supplier carriers and omitted geometric conditions



## Classical agreement over all local fields

Stage: `ExcursionOperatorsAndSpectralAction:ES7`. Coverage: **planned**.

The two characteristic ranges meet only after their realization inputs have been supplied. The characteristic-zero comparison and the equal-characteristic agreement feed the same trace theorem and normalized-induction extension. The resulting parameter is the semisimple Weil part of the independent classical parameter for every irreducible smooth GL_n representation.

The classical Bernstein-centre comparison also belongs to this concluding layer because it covers both characteristic ranges. Equality of evaluations becomes equality of centre maps only through the independent characteristic-zero centre-separation theorem. Integral existence of the excursion-to-centre map is a separate assertion; it does not supply a full integral or modular Weil–Deligne correspondence.

### Classical agreement over every local field

`ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field` — theorem. Planet: **Classical agreement over local fields**.

For every nonarchimedean local field E with residue characteristic p, ℓ≠p, and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter is the semisimplified classical parameter. The proof has two independent realization inputs: ET.6/6a in characteristic zero and the D-elliptic/selected-function-field route in equal characteristic. Both feed the same two-leg trace theorem (ES7:GLn-comparison) and normalized-induction extension (ES7:parabolic); the two halves are all-irreducible-representations and equal-characteristic-agreement. This completed target inventory is a plan with explicit proof and supplier gaps; it is not a claim that either geometric realization is already formalized.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime (any characteristic).

- π any irreducible smooth Q̄_ℓ-representation of GL_n(E).



**Construction or proof route**

1. Split by the characteristic of E.

2. Characteristic zero: all-irreducible-representations. Characteristic p: equal-characteristic-agreement.



**Acceptance**

- No claim of integral/mod-ℓ full LLC agreement or recovery of N.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`

- `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`



**Sources**

- `FS-geometrization`, Theorem IX.7.4, p. 338. The source theorem is the target over all E; its two independent proof inputs are separated in this packet.



**Recorded obligations:** `ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`.

### Classical Bernstein-centre comparison

`ExcursionOperatorsAndSpectralAction:ES7/classical-centre-agreement` — comparison.

For GL_n/Q̄_ℓ the spectral-to-Bernstein map has the same evaluation on every irreducible as the usual classical parameter map. With the characteristic-zero Bernstein-centre separation statement this identifies the maps. The universal Ψ_GL_n over Z_ℓ[√q] also exists as a map to the integral Bernstein centre. This integral existence is not an assertion that integral or mod-ℓ representations have a full classical Weil–Deligne correspondence.

**Hypotheses**

- E a nonarchimedean local field with residue field of cardinality q = p^f; ℓ ≠ p prime; G = GL_n.

- Coefficients Q̄_ℓ for the comparison; ℤ_ℓ[√q] for the integral refinement.



**Construction or proof route**

1. Evaluate on irreducibles using the comparison theorem and use the supplied centre separation theorem.

2. For the integral map use the integral spectral-to-geometric map and the Λ-linear centre construction; do not infer a stronger integral LLC.



**Acceptance**

- The integral output is a ring map to a centre, not a reconstructed nilpotent monodromy operator.



**Direct prerequisites**

- `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `SmoothRepresentationsOfLocalGroups:SR.1`



**Sources**

- `FS-geometrization`, After IX.7.4, p. 338. FS records the characteristic-zero agreement and its integral centre refinement.



**Work required before this stage closes**

- equal-transport: Equal-characteristic transport and second operation



## Pinned baseline

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. The actual declarations and standing parameters were re-read at these commits on 2026-10-08. The reviewed library audit marks the five stages as not built. The proposed targets add the missing geometric and smooth interfaces to the existing algebraic constructions.

- `mathlib:Representation` (abbrev, `Mathlib/RepresentationTheory/Basic.lean`): The abbreviation G→* (V→ₗ[R]V), with algebraic action laws; smoothness, admissibility and Weil continuity are additional supplier data.

- `mathlib:MonoidHom` (structure, `Mathlib/Algebra/Group/Hom/Defs.lean`): Bundled monoid/group homomorphisms. Degree and inclusion are homomorphisms; a nontrivial-action 1-cocycle itself is not a group homomorphism.

- `mathlib:RootPairing` (structure, `Mathlib/LinearAlgebra/RootSystem/Defs.lean`): Root pairing data; it does not construct a pinned dual algebraic group or its Weil action.

- `mathlib:Subgroup` (structure, `Mathlib/Algebra/Group/Subgroup/Defs.lean`): Algebraic subgroups. Compactness, openness and the parabolic algebraic-group interpretation require additional data.

- `mathlib:MonoidAlgebra` (structure, `Mathlib/Algebra/MonoidAlgebra/Defs.lean`): Finite-support algebraic convolution on a monoid; it is not the locally profinite Hecke algebra or its completed inverse-limit centre.

- `mathlib:Module.End` (abbrev, `Mathlib/Algebra/Module/LinearMap/End.lean`): The linear endomorphism type M→ₗ[R]M and its composition ring.

- `mathlib:CommRing` (class, `Mathlib/Algebra/Ring/Defs.lean`): Commutative ring structure used for coefficient and central rings.

- `mathlib:CategoryTheory.Adjunction` (structure, `Mathlib/CategoryTheory/Adjunction/Basic.lean`): Adjunctions of ordinary categories; this alone does not supply stable/lisse infinity-categories.

- `mathlib:CategoryTheory.MonoidalCategory` (class, `Mathlib/CategoryTheory/Monoidal/Category.lean`): Ordinary monoidal-category coherence, used as a boundary for Satake/fusion interfaces.

- `mathlib:CategoryTheory.Functor` (structure, `Mathlib/CategoryTheory/Functor/Basic.lean`): Ordinary functors, used for the algebraic moduli functor; no representability follows automatically.

- `mathlib:DirectSum` (def, `Mathlib/Algebra/DirectSum/Basic.lean`): Algebraic finite-support direct sums, appropriate to the component-indexed cohomology description.

- `mathlib:LinearMap.trace` (def, `Mathlib/LinearAlgebra/Trace.lean`): Algebraic trace of a linear endomorphism (finite free specialization used here); no infinite-dimensional automorphic trace is inferred.

- `mathlib:Module.Free` (class, `Mathlib/LinearAlgebra/FreeModule/Basic.lean`): Free modules over a ring. Scheme-local freeness and coherent sheaves require the geometric supplier.

- `mathlib:AlgebraicGeometry.Scheme` (structure, `Mathlib/AlgebraicGeometry/Scheme.lean`): The native scheme carrier. Formal schemes, diamonds, moduli representability and étale cohomology are not supplied by this definition.

- `mathlib:MeasureTheory.Measure.modularCharacter` (def, `Mathlib/MeasureTheory/Group/ModularCharacter.lean`): Locally compact group modular character valued in ℝ≥0; compare its right-translation convention before identifying the parabolic modulus. It supplies no normalized-induction functor.

- `tauceti:TauCeti.Cocharacter.parabolic` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): The dynamic parabolic attached to a cocharacter in the Hopf-algebra/WithConv formulation, with its stated group-scheme assumptions.

- `tauceti:TauCeti.Cocharacter.levi` (def, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`): The dynamic Levi attached to that cocharacter; it is not already the dual pinned Levi or a constant-term functor.

- `tauceti:TauCeti.IsSmoothDiscrete` (structure, `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`): For a TopRep, discrete topology on the underlying module and open stabilizers. It does not encode continuous ℓ-adic Weil action.

- `mathlib:MulAut` (abbrev, `Mathlib/Algebra/Group/End.lean`): Multiplicative automorphisms M≃*M; bundled group actions used to state the twisted cocycle identity.

- `mathlib:Matrix.trace` (def, `Mathlib/LinearAlgebra/Matrix/Trace.lean`): For a finite index type, the sum of matrix diagonal entries; this is the finite-dimensional basis form of the two-leg evaluation computation.

- `mathlib:CategoryTheory.CatCenter` (abbrev, `Mathlib/CategoryTheory/Center/Basic.lean`): The centre End(𝟭 C) of a category, commutative (IsMulCommutative), a ring for preadditive C; the target of Ψ_G^b before the smooth-centre identification.

- `mathlib:CategoryTheory.Functor.FullyFaithful` (structure, `Mathlib/CategoryTheory/Functor/FullyFaithful.lean`): Fully faithful functor data with preimage; restriction of central endomorphisms along the stratum embedding uses the preimage.

- `mathlib:coevaluation` (def, `Mathlib/LinearAlgebra/Coevaluation.lean`): coevaluation K → V ⊗ Dual V for finite-dimensional V; with LinearMap.trace this gives ev ∘ (ρ(γ₁) ⊗ ρ^∨(γ₂)) ∘ coev = tr ρ(γ₁γ₂^{-1}).

- `mathlib:Representation.ind` (def, `Mathlib/RepresentationTheory/Induced.lean`): Algebraic induction through coinvariants (k[H]⊗A)_G. For the open subgroup P_d, compare it explicitly with smooth compact induction using the finite-support coset model; topology and continuity of the local representation are extra conditions.

- `mathlib:Algebra.IsCentral` (class, `Mathlib/Algebra/Central/Defs.lean`): Central algebras (centre equals the base field); with IsSimpleRing and finite dimension, the central simple algebra D/F of the order data.

- `mathlib:Submodule.IsLattice` (class, `Mathlib/Algebra/Module/Lattice.lean`): R-lattices: finitely generated R-submodules spanning the vector space over Frac R; an O_x-order is a subalgebra whose underlying submodule is a lattice. Mathlib has no named (maximal) order.

- `mathlib:Module.Invertible` (class, `Mathlib/RingTheory/PicardGroup.lean`): Invertible modules (Mᵛ ⊗ M → R bijective): exactly the condition that Lie H is an invertible O_d ⊗_O B-module.

- `mathlib:CategoryTheory.Injective` (class, `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean`): Injective objects of a category; the degeneration argument needs injectivity of finite (compact) representations in the smooth category, not projectivity of modules.

- `mathlib:CategoryTheory.Abelian.Ext` (def, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`): Ext groups in an abelian category with HasExt; the E₂ term Ext^i in the smooth category is an instance once SR.0 supplies the abelian category.

- `mathlib:MeasureTheory.Measure.haar` (abbrev, `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`): A Haar measure on a locally compact group; the local volumes vol(P_I⁰), formal degrees and orbital-integral measures are normalisations of it.

## Supplier requests

Each stage prerequisite without a sufficient existing node is paired with the exact extension needed. A supplier packet remains a plan; citation does not claim implementation. Coefficient, field and normalization mismatches are recorded here instead of being inferred away.

### 1. AdelicAlgebraicGroups:AA.1

Function-field extension of adelic-point/restricted-product and diagonal-embedding comparison for D^×. The existing AA.1/restricted-product-comparison node assumes a NUMBER FIELD and is not an exact function-field supplier; a field-general extension must be proved. RT-AREA-geomlanglands/12.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`



### 2. AlgebraicModuliForArithmeticGeometry:R09.2

Relative Quot/Hom/Isom spaces with fixed Hilbert polynomials for the periodic chain-bundle and Hecke parameter spaces, with the exact projective-base hypotheses.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`



### 3. AlgebraicModuliForArithmeticGeometry:R09.4

Stack/groupoid machinery and explicit algebraic atlases for the chain moduli problem; D-elliptic conditions themselves are constructed only in ES7.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`



### 4. AlgebraicModuliForArithmeticGeometry:R09.5

Quotient by index shift and level rigidification through the supplied presentation, respecting automorphism removal and fine versus coarse representability.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`



### 5. AlgebraicModuliForArithmeticGeometry:R09.6

Formal deformation, completion and algebraization carrier/universal properties. The special O_D-module deformation theorem and D-elliptic uniformization are additional ES7 statements, not inferred from a generic representability slogan.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`



### 6. AutomorphicSpectralTheory:AS.0

Only abstract functional analysis for a unitary action on the compact D central quotient, with discrete Hilbert sum/finite multiplicities and smooth restricted-tensor-product factorization; no number-field automorphic realization is imported.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`



### 7. BunGAndNewtonStrata:BG0

Hecke equivariance of BunGAndNewtonStrata:BG0/pure-inner-twisting (FS Corollary III.4.3, Bun_G ≃ Bun_{G_b} for basic b): the transport of bundles, modifications and bounds is HeckeStacksAndLocalShtukas:HS0/structure-group-and-inner-form; the compatibility of the Hecke functors T_V with the equivalence, which FS assert only in the proof of IX.7.2 (p. 335), is requested here. RT-AREA-geomlanglands/11.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`



### 8. BunGAndNewtonStrata:BG1

Canonical parabolic/Levi and invariants of bμ(π)^N; additionally, for connected Z(G), surjectivity B(G)_bas→H¹(E,G_ad), derived by applying Kottwitz Proposition 10.4 to G→G_ad and proving the identification of basic adjoint classes with inner forms. Proposition 10.4 itself is a central-extension B-map statement. RT-AREA-geomlanglands/11.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`



### 9. BunGAndNewtonStrata:BG4

HN strata and quantitative bounded-modification estimates: for each fixed bounded Hecke type V and b_N increasingly unstable in a fixed canonical parabolic, eventually every self-modification preserves that reduction.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`



### 10. DrinfeldModulesAndTModules:DM.7

The matrix-algebra elliptic-sheaf construction and its chain/moduli conventions, and an explicit Morita interface to the general right-𝒟 formulation. This stage is only the split matrix case; D-division geometry is owned here.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`



### 11. EndoscopicTransferAndUnitaryTraceComparison:ET.6

Independent classical characteristic-zero LLC and local JL for GL_n(E), including Q̄_ℓ coefficient transport, normalized induction and segment compatibility. It is not the supplier of the equal-characteristic D-elliptic route.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`



### 12. EndoscopicTransferAndUnitaryTraceComparison:ET.6a

Two-tower cohomological realization and, downstream of HS2 and the independent classical tower, the tower/Hecke-fibre comparison: SW20 Theorem 24.2.5 for E = ℚ_p; for E ≠ ℚ_p, SW20 Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n and of D, together with the identification of Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas, at all levels and compatibly with the GL_n(E), D^× and Weil actions. Export this to ES7:GLn-comparison. No ET.6a→HS2 edge and no reliance on HS2’s examples to prove the classical identity. RT-AREA-geomlanglands/2.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`



### 13. EtaleDualityAndPerverseSheaves:EDC.2

Finite-level étale cohomology of the proper smooth D-elliptic varieties over F̄: finite-dimensionality and proper smooth base change to good places. Poincaré duality is cited from EDC.2:pairings/adic-and-rational-poincare-duality and rigid-analytic compact support from ClassicalAdicEtaleCohomology:H3.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`



### 14. ExcursionOperatorsAndSpectralAction:ES6:functoriality

The p-adic adjoint-isomorphism comparison and full Kaletha Definition 5.1/Fact 5.5 data are supplied by ES6:functoriality/isogenies and ES6:functoriality/z-embedding. The residual request is an equal-characteristic extension when Z(G) is smooth, and a different quasi-split reduction or centre-detection argument when Z(G) is not smooth. The present p-adic node does not supply either; see ES7/gap/z-embedding. No arbitrary-local-field z-embedding is inferred.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`



### 15. FunctionFieldArithmetic:FA.2

Function-field completions, restricted products, diagonal topology, degree lattice and compact degree-zero idele class group. None is redefined here.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`



### 16. FunctionFieldArithmetic:FA.4

Local/global function-field reciprocity and the geometric-Frobenius inversion convention, with central-character/determinant correspondence and finite-order twists.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`



### 17. FunctionFieldArithmetic:FA.6

Function-field adelic central-character quotient, compatible automorphic levels, cuspidal finite-dimensionality and the generic reduction theory used to specialize compactness to PGL₁(D). No AF.2–3 or AS.6 number-field automorphic theorem is used.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`



### 18. HeckeStacksAndLocalShtukas:HS2

For the equal-characteristic consumers, the O_K-formal-module / local-shtuka carrier and deformation interface for K = F_q((t)). The existing HS2 packet nodes (local-shtuka-moduli, hecke-fibre-description) are mixed characteristic; no packet owns equal-characteristic formal O-modules yet, so this request also stands in ES7/gap/local-geometry. ET.6a, not HS2, owns the characteristic-zero classical tower identity.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`



### 19. HeckeStacksAndLocalShtukas:HS3

The Hecke/compact-cohomology and dual-adjunction interface. Existing packet statements are based at Q_p; give the restriction-of-scalars O_E variant for characteristic zero, and the separately proved equal-characteristic variant for the D-elliptic transport. Do not assume a tower identity from the generic HS3 interface.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`



### 20. ReductiveGroupsPartII:RG2.0

Locally compact topologies on rational points and compact open units of integral matrix/maximal-order models.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`



### 21. ReductiveGroupsPartII:RG2.2

The GL_d building, facets, facet normalizers, vertex permutation orientation and Euler-characteristic calculations used by LRS 13.1–13.2.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`



### 22. ReductiveGroupsPartII:RG2.3

Parahoric pointwise fixers and congruence subgroups for building facets; distinguish them from full facet normalizers in the EP sum.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`



### 23. ReductiveGroupsPartII:RG2.5

Pinned dual groups, L-group Levi maps and Galois-equivariant root data; they are additional to the baseline RootPairing type.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`



### 24. SchemeAndStackFoundations:SF.0

The native quasi-coherent/locally free sheaf operations, base change, rank and Frobenius pullback for vector bundles on X×S. Scheme itself already exists at the pins; no second scheme carrier is planned.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`



### 25. SchemeAndStackFoundations:SF.3

Curve divisors, Euler characteristic/Riemann–Roch and line-bundle twists, needed for D-elliptic periodicity and index-shift normalization.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`



### 26. SmoothRepresentationsOfLocalGroups:SR.0:abelian-category

The abelian smooth-representation category, invariants under compact open subgroups and admissibility, for the automorphic space of the compact division-algebra quotient.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`



### 27. SmoothRepresentationsOfLocalGroups:SR.1

For Z_ℓ[√q]-algebras Λ with invertible pro-orders, the Λ-linear centre π₀End(id_Dsmooth), its cofinal pro-p corner description lim_K Z(e_KH_Λe_K), and ℓ-adic separatedness for Λ=Z_ℓ[√q]. Also characteristic-zero Bernstein-centre separation by irreducible evaluations. SR.0 supplies the category; SR.3’s complex centre is not the integral construction. RT-AREA-geomlanglands/9.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`

- `ExcursionOperatorsAndSpectralAction:ES7/classical-centre-agreement`



### 28. SmoothRepresentationsOfLocalGroups:SR.2

Smooth/compact induction, correct adjunctions and normalized parabolic induction i_Pτ=Ind_P(δ_P^{1/2}τ), with δ_P(m)=|det Ad(m)|Lie U_P|. Supply the coefficient and contragredient regimes needed here; these conventions belong to SR.2, not SR.1.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`



### 29. SmoothRepresentationsOfLocalGroups:SR.3

Extend the stated complex results through finite coefficient fields to Q̄_ℓ: supercuspidal support and GL_n segment classification, compact matrix coefficients, finite-representation projectivity/injectivity on GL_d(K)^0, local character distributions and the strict unitary-generic Satake bound. Each requires a source-qualified coefficient comparison; complex-only results are not silently applied over Q̄_ℓ. For the fixed-central-character Hom pairing, provide semisimple-block lifting and finite-index averaging for Z(K)·GL_d(K)^0 (index d); the printed zero-kernel and generation assertions are invalid (source issues E10–E11).

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/global-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`



### 30. VStackSheavesAndLisseCategories:VS1

Six-operation base change and cohomological smoothness for the stratum/constant-term diagram, with the ULA and support hypotheses allowing the indicated shriek maps.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`



### 31. VStackSheavesAndLisseCategories:VS4

Fully faithful embeddings of D(G_b(E),Λ) into D_lis(Bun_G,Λ): the left adjoint to the stratum pullback i_b^* (FS VII.7.2) and the trivial-stratum j_!, in the coefficient range of FS VII.7. The independence of the restricted centre action from the choice of embedding is ES5/stratum-centre-embedding-independence.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`



### 32. WeilConjectures:WC.2

Grothendieck’s functional equation of L-functions of lisse sheaves on a curve over F_q with its ε-factor, used for the pair L-functions of the selected globalizations. The local ε-factor product formula (Laumon) is an additional input recorded in ES7/gap/classical-local.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`



### 33. ExcursionOperatorsAndSpectralAction:ES1:spectral-center

Scalar-extension compatibility of the universal excursion action for every ℤ_ℓ[√q]-algebra Λ, including nonflat Λ and primes dividing |π₀Z(G)|. For Λ→Λ′ and compatible coefficient data, identify the scalar extension of each operator S_D with S_{D⊗ΛΛ′}; carry this through the stratum restriction. This extends the ES0 excursion construction and the ES1 coefficient-condition-free action; the cited ES1 node states existence but does not state this base-change theorem. FS IX.7.2, p. 335, uses it to pass from integral coefficients to arbitrary Λ.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`



## Gaps and proof boundaries

### Root/modulus convention comparison

`ExcursionOperatorsAndSpectralAction:ES7/gap/normalization`

The GL₂ calculation fixes the signs, but the full nonsplit/relative-root proof matching SR.2 modulus, Satake Weil action and geometric reciprocity needs a source-qualified expansion. Mathlib’s group modular character is not itself this theorem.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`



### Equal-characteristic z-embedding reduction

`ExcursionOperatorsAndSpectralAction:ES7/gap/z-embedding`

Kaletha’s standing field is p-adic (§2, p. 64). For E of characteristic p the construction cannot simply be extended: already for G = SL_p with Z(G) = μ_p, for every embedding G ↪ G′ with torus quotient C and Z(G′) a torus, the cokernel of Z(G′)(E) → C(E) is isomorphic to ker(H¹_fppf(E, Z(G)) → H¹(E, Z(G′))), and H¹_fppf(E, μ_p) = E^×/E^{×p} is infinite while H¹(E, Z(G′)) is finite, so Fact 5.5’s surjectivity fails. For smooth Z(G) extend Definition 5.1/Fact 5.5 to equal characteristic; for non-smooth Z(G) a different reduction to quasi-split G (or a different proof of B(G) ↪ B(G′) and of centre detection) is needed. Then prove the Bun fibre identity, B-injectivity and centre detection as in FS. Kottwitz’s B(G_ad)-to-H¹ bridge is a BG1 request. Recorded as source issue ExcursionOperatorsAndSpectralAction/E2. Cross-part interface: ES6:functoriality/isogenies already covers adjoint-isomorphism maps, and ES6:functoriality/z-embedding supplies the full p-adic conditions and central surjectivity. Those exact nodes are prerequisites of the consuming reduction. The remaining equal-characteristic input has no supplying node in ES5; it is this explicit gap, with the residual ES6:functoriality supplier request, rather than a claimed consequence of the whole stage.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`



### Quantitative modification and constant-term closure

`ExcursionOperatorsAndSpectralAction:ES7/gap/HN`

Expand the BG4 bounded-modification estimate and verify every arrow/support hypothesis of the P/Levi constant-term diagram. For IX.7.3 the Hodge–Newton modification calculation referenced as GI16 Theorem 4.26 remains to be read. Keep b=μ(π^{-1}), T_{μ^{-1}} and (−d/2)[−d]. The present HS4/levi-compatibility statement tracks a bundle switch and inverse root twist, and B_N=Rπ_!A′_N includes the generally nontrivial character Rπ_!Λ of G_b(E). Compute that character, transport modification conventions and prove the combined formula on the original smooth representation; cancelling the degree-zero shift alone is insufficient. The positive FS target remains a target with this gap, rather than an asserted direct consequence of HS4.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`



### O_E classical tower diamond comparison

`ExcursionOperatorsAndSpectralAction:ES7/gap/mixed-tower`

SW20 Theorem 24.2.5 is printed for p-divisible groups over ℤ_p (E = ℚ_p). For E ≠ ℚ_p, ET.6a must use Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n and of D, and identify Res_{E/ℚ_p}GL_n-shtukas with GL_n/E local shtukas, with levels, actions and Satake shifts. The full classical tower realization is imported, not source-expanded in ES7.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`



### Order existence and division compactness proof

`ExcursionOperatorsAndSpectralAction:ES7/gap/orders`

Hausberger fixes the global maximal-order sheaf rather than proving its existence. Read the global-order gluing and function-field anisotropic reduction proofs and specialize them to PGL₁(D). Then expand finite-level kernel local finiteness/integrability and the restricted-tensor-product coefficient descent. AA.1’s current exact node is number-field only.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`



### Building EP orbital/character proof sources

`ExcursionOperatorsAndSpectralAction:ES7/gap/EP`

LRS 13.2 states the formulas and cites Laumon §5 and Kottwitz Theorem 2′; those primary proofs have not been acquired. Verify the characteristic-p applicability and facet-normalizer orientations from those proofs. Expand the Schur-orthogonality/compact-induction selector normalization used in 15.10.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`



### Simple trace formula and selected transfer proofs

`ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`

Read the precise Deligne–Kazhdan simple trace formula and Henniart appendix A.4 cited by LRS 15.10–15.11, and the germ-expansion/weak-approximation proof inputs. Keep a supercuspidal auxiliary place outside ramified S. No general global JL or arbitrary-isotype multiplicity-one claim fills this gap.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`



### D-elliptic moduli proof expansion

`ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`

The target-level definitions, smoothness/dimension, level rigidification and division properness are sourced, but complete Quot/Hecke transversality and boundary properness proofs of LRS §§4–6 require lemma-level expansion. The DM.7 Morita equivalence and the right-action/cohomological-left-action conventions require explicit proofs.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`



### Equal-characteristic formal-module and uniformization proof

`ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`

Acquire Genestier or Boutot–Carayol/Drinfeld’s precise special formal O_D-module representability proof and expand Hausberger’s coordinate/Dieudonné modules, global isogeny classification and analytic comparisons. The statement’s D̄ and away-o level conditions are already fixed; no formal model at o-level is assumed. No packet owns equal-characteristic formal O-modules and their deformation theory (HS2’s local-shtuka nodes are mixed characteristic); the HS2 request asks for them. Hausberger Proposition 7.6: D_K^× acts on Ω̂^d ⊗̂ Ô^nr only through Frobenius on Ô^nr.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`



### Corrected graded local chain proof closure

`ExcursionOperatorsAndSpectralAction:ES7/gap/weights`

Kaiser’s two pages have been read in full. Connect the amended lemma to the imported Weil–Deligne carrier with geometric Frobenius and DWP.5 local weight theorem; verify the reciprocal L-factor grading and multiplicity-power conditions. For selected concentration expand the independent global genericity/strict Satake bound. Do not use the source’s unpublished invariant ample class argument. The cited R01.2 Weil–Deligne carrier is normalised by arithmetic Frobenius, while LRS and this packet use geometric Frobenius: convert explicitly. The chain lemma’s extraction of summands σ⁰(St_i) uses the classification of Frobenius-semisimple indecomposables r₀ ⊗ Sp(n), which R01.2 records as an open gap.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-erratum`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-lemma`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/kaiser-graded-chain-proposition`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/selected-isotypic-cohomology`



### Independent local correspondence and constants

`ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`

Theorem-level LRS 15.10–15.17 and Hausberger 9.1–9.2 are read. Henniart’s local-constant uniqueness and numerical theorem, LRS 15.18–15.20’s numerical proof and Badulescu’s local character proof remain to be acquired/expanded. The construction stays independent of the excursion parameter. LRS Corollary 15.14 proves independence only over the globalizations of one fixed global setup (curve, x₀, x₁, ∞, D); the pair ε-factor comparison also needs Laumon’s product formula, which WC.2 does not state. Badulescu’s equal-characteristic local Jacquet–Langlands character identity is cited by function-field-automorphic/local-character-identity.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/local-character-identity`



### Analytic quotient spectral sequence and Ext degeneration

`ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`

The profinite discrete-module R02.2 node is insufficient for the locally profinite analytic quotient. Supply the general derived machinery and prove the properly discontinuous Berkovich quotient application using Hausberger Appendix A.12. Expand finite-type/admissibility and the characteristic-zero injective finite-representation proof on GL_d(K)^0; generic module projectivity at the pins is insufficient. Use semisimple-isotypic splitting in place of the false zero-kernel step of Hausberger 10.15 (E10), and a finite-index/averaging argument for Z(K)·GL_d(K)^0 ⊂ GL_d(K) (index d), rather than the generation claim in §10.4 (E11).

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`



### Equal-characteristic transport and second operation

`ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`

Hausberger proves the Drinfeld supercuspidal realization, but the exact action-preserving identification with equal-characteristic Hecke fibres and the dual/Lubin–Tate operation need an independently read comparison source. The present HS2/HS3 packet uses mixed characteristic/Q_p. The all-E assertion of FS IX.7.4 is not a proof of these missing interfaces. FS (p. 338) cite [Boy99] (P. Boyer, Mauvaise réduction des variétés de Drinfeld et correspondance de Langlands locale, Invent. Math. 138 (1999)) for the equal-characteristic Lubin–Tate tower and [Hau05] for the Drinfeld tower; Boyer is the source to read for the first operation.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/equal-characteristic-agreement`

- `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`



### Supplier carriers and geometric conditions in prototypes

`ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`

The suggested Lean file states every node over opaque supplier carriers named for their owning layers (reductive groups and Kottwitz sets, smooth derived categories, D_lis(Bun_G), spectral centres, adelic units of D, vector bundles with right 𝒟-action on X × S, formal O-modules, rigid compact-support cohomology). Conditions that need a missing carrier (cokernel supports and Euler characteristics of D-elliptic chains, gluing of the maximal-order sheaf, analytic properness) are omitted and named in the docstrings. Replace each carrier by its owner’s declaration when it exists. All 50 node signatures, all 53 API entries and the named tests are present; these omissions concern full carrier/condition fidelity, not missing node signatures. The ordinary CatCenter model must be related to the enhanced π₀End(id) supplied by SR.1/ES0. The algebraic Representation.ind model also requires its smooth compact-induction comparison for the open subgroup P_d.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`

- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`



### Universal excursion action under coefficient extension

`ExcursionOperatorsAndSpectralAction:ES7/gap/coefficient-base-change`

Prove the requested ES1:spectral-center comparison S_D⊗ΛΛ′ = S_{D⊗ΛΛ′}, with the appropriate derived tensor product on sheaves, for arbitrary coefficient morphisms preserving √q. Check creation, Weil action, annihilation and stratum restriction under coefficient change. Integral Bernstein-centre separatedness alone does not imply the arbitrary-Λ comparison. The suggested coefficientReduction signature states separatedness only; its docstring names the unstated base-change obligation.

**Consumers**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`



## Structural reconciliation

### Classical tower comparison owned downstream in ET.6a

Proposal kind: `owner-refinement`.

RT-AREA-geomlanglands/2: ET.6a owns the classical tower/Hecke-fibre comparison (SW20 24.2.5 for E = ℚ_p; Corollary 24.3.5 for the EL data of Res_{E/ℚ_p}GL_n and D when E ≠ ℚ_p) after HS2 and its own tower construction, and exports the identity to ES7. HS2 examples cite that owner; no ET.6a→HS2 edge. HS3 remains the cohomology interface.

### Division-algebra specialization of function-field inputs

Proposal kind: `scope-narrowing`.

RT-AREA-geomlanglands/12: generic completions, restricted products, Haar, diagonal, central/degree quotient and automorphic definitions remain FA.2/FA.6 and AA.0/AA.1. ES7 owns maximal-order data, anisotropic specialization, EP tests, selected simple comparison/globalizations and D-elliptic cohomology. AA.1 needs a function-field extension because its current node assumes number fields.

### One two-leg trace argument for two realizations

Proposal kind: `shared-node`.

The characteristic-zero realization (ES7:GLn-comparison/two-tower-realisation) and the equal-characteristic transport (ES7:equal-characteristic/hecke-fibre-transport) both feed the single abstract theorem ES7:GLn-comparison/two-leg-excursion-is-a-trace. ES7:GLn-comparison concludes in characteristic zero; ES7:equal-characteristic repeats the argument (equal-characteristic-agreement), as its layer description asks; ES7 combines the two halves. Corrected by REV-ExcursionOperatorsAndSpectralAction--ES7, which removed the former dependence of the characteristic-zero layer on the equal-characteristic layer.

### Integral Bernstein centre in SR.1

Proposal kind: `owner-refinement`.

RT-AREA-geomlanglands/9: SR.1 owns the Λ-linear derived centre, corner limit and Z_ℓ[√q] separatedness. ES0 and ES1 must cite this owner; changes to those other-job packets are left to their owners.

### Z-embedding and basic inner-class supplier refinements

Proposal kind: `owner-refinement`.

RT-AREA-geomlanglands/11: ES6 owns full z-embedding data; BG1 adds the connected-centre B_bas→H¹(G_ad) consequence of Kottwitz; BG0 supplies pure inner twisting and its Hecke equivariance. ES7 proves the Bun fibre, injectivity and reduction application. Kaletha’s equal-characteristic extension is explicit.

### Same-roadmap layer dependencies the atlas does not draw

Proposal kind: `stage-edges`.

Promotion draws stage edges only for prerequisites in other roadmaps. These packet dependencies inside ExcursionOperatorsAndSpectralAction are not implied by data/atlas.json requires and need declared edges: ES1:spectral-center → ES7:parabolic (RT-AREA-geomlanglands/7: stratum-maps composes with the IX.5.2 map); ES0:classical-center → ES7:parabolic (stratum-maps restricts along j_! as ES0:classical-center/map-to-the-classical-bernstein-center does); ES7:GLn-comparison → ES7:equal-characteristic (equal-characteristic-agreement repeats the shared two-leg trace theorem, as the layer description says). All three were checked acyclic against the atlas requires, stageEdges and the edges induced by every packet. Separately, the ES0 and ES5 packets induce a cycle ES6:functoriality → ES7:parabolic → ES6:duality → ES6 → ES6:functoriality (ES5 nodes parented at ES6 are used by ES6:functoriality nodes); it does not come from this packet.

The existing ES6 functoriality/duality plans and ES7 parabolic plan have a cross-packet dependency cycle through their parent-stage assignments. Resolving it requires the maintainer to reconcile the supplier packets and stage edges; changing another packet is outside this revision’s scope. The local ES7 node graph and the layer ownership retained here contain no internal cycle.

## Source issues

E1–E9 retain the preceding independent review’s verdicts. E10–E11 are new findings about intermediate proof assertions and await independent verification. The locators below refer to the exact versions in the source list. No source theorem is declared false merely because a proof step requires correction.

### E1: error

`LRS-1993`, Published Corollary 14.11 (p. 299), its proof (pp. 299–300), and the self-duality step in §14.16 (p. 306)..

**Printed assertion, paraphrased:** The source invokes Poincaré duality to assert selfduality.

**Correction:** Pair the Π-isotype with the appropriate Π∨-isotype. In 14.11 replace the second L-factor by L_x((V_Π∞^bullet)^∨,q_x^{-1}T^{-1}); use amended 14.14′ and 14.17′ in the general proof of 14.12.

**Reason:** A duality pairing on total cohomology exchanges contragredient Hecke characters; a non-self-dual automorphic representation does not give a self-dual isotype. Kaiser explicitly corrects both the dual and exponent.

Affects: the proof. Known correction: Christian Kaiser, Errata for [LRS], both pages, author-hosted correction..

**Correction search**

- Rapoport’s author-hosted erratum and source catalogue

- Published LRS journal scan §§14.11–14.19



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. The independent review checked Corollary 14.11(iii), p. 299, the duality step of its proof, pp. 299–300, and §14.16, p. 306, against their page images. The original second factor is L_x(V•,q_x^{−d}T^{−1}); the proof treats a single isotype as self-dual. Kaiser replaces it by L_x(V•∨,q_x^{−1}T^{−1}) and removes integrality and self-duality assumptions in Lemma 14.14′.

### E2: gap

`FS-geometrization`, Proof of Theorem IX.7.2, p. 335, author-hosted manuscript (SHA-256 9ab9efbd…); reduction to quasi-split G.

**Printed assertion, paraphrased:** The source chooses a z-embedding G ,→ G′ following [Kal18, Section 5], with torus quotient D and connected center Z(G′ ).

**Correction:** The step is justified for E of characteristic 0 (Kaletha’s §5 assumes F p-adic). It cannot be applied uniformly in characteristic p: for G = SL_p, no embedding G ↪ G′ with torus quotient D and Z(G′) a torus has Z(G′)(E) → D(E) surjective. Thus the deduction of B(G) ↪ B(G′) and of centre detection via Kaletha Fact 5.5 requires another argument for this case and for the general non-smooth-centre range.

**Reason:** From 1 → Z(G) → Z(G′) → D → 1 (fppf), coker(Z(G′)(E) → D(E)) ≅ ker(H¹_fppf(E, Z(G)) → H¹(E, Z(G′))). For Z(G) = μ_p in characteristic p, H¹_fppf(E, μ_p) = E^×/E^{×p} is infinite, while H¹(E, T) is finite for a torus T over a local field; so the kernel is infinite. Fact 5.5’s proof uses exactly this injectivity. In characteristic p connectedness of Z(G′) does not force a torus (μ_p is connected; SL_p ↪ SL_p × G_m has connected centre μ_p × G_m and surjective Z(G′)(E) → D(E)), but the next step, a basic b₀ with G_{b₀} quasi-split via Kottwitz 10.4, needs a central torus, and for SL_p × G_m the inner form SL₁(D) is not reached.

Affects: the proof. Known correction: new.

**Correction search**

- FS author manuscript and arXiv:2102.13459v4 (same text, checked by the ES5 review)

- Kaletha, JEMS 20 (2018), §§2, 5.1 (p-adic standing hypothesis)

- Scholze’s and Fargues’ publication pages and the SMF publication page (no correction listed, 2026-10-07)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added and checked by this review: the printed step, Kaletha’s p-adic hypothesis (§2, p. 64) and the fppf computation above. The theorem is not claimed false; only this step is unjustified in equal characteristic with non-smooth centre.

### E3: misprint

`LRS-1993`, §13 (paragraph (13.3)–(13.5)), p. 291, published scan.

**Printed assertion, paraphrased:** The source declares the coset space F^×\𝔸^×/ϖ_∞^ℤ to be finite.

**Correction:** The coset space is compact (an extension of a finite group by the compact, infinite group of degree-zero idele classes), not finite.

**Reason:** The degree-zero part F^×\𝔸^1 surjects onto Pic⁰(X)(F_q) with kernel containing ∏_x O_x^×/F_q^×, which is infinite. Compactness is what the admissibility argument uses (LRS p. 299 correctly uses compactness of F^×\𝔸^×/F_∞^×).

Affects: nothing. Known correction: new.

**Correction search**

- Kaiser’s erratum (both pages)

- Rapoport’s author-hosted preprint list



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; checked on the page image of p. 291.

### E4: misprint

`LRS-1993`, (14.13) and Lemma (14.14), p. 302, published scan.

**Printed assertion, paraphrased:** L∞(V•,T)/L∞(V•,q∞^{−d}T^{−1}) ~ ((1 − q∞^{−d}T)/(1 − T))^m

**Correction:** The numerator factor is 1 − q_∞^{−d}T^{−1}, as in (14.16) on p. 306 and in Kaiser’s Lemma 14.14′.

**Reason:** For the chain σ⁰(St_d) with L-factor 1/(1 − T) the ratio is (1 − q_∞^{−d}T^{−1})/(1 − T); §14.16 specializes the corrected 14.11(iii) to this form.

Affects: nothing. Known correction: Kaiser’s Errata for [LRS], Lemma 14.14′, states the T^{−1} form.

**Correction search**

- Kaiser’s erratum (both pages)

- LRS §14.16, p. 306



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; pages 302 and 306 compared on the page images.

### E5: misprint

`LRS-1993`, (14.16), p. 306, published scan.

**Printed assertion, paraphrased:** The source applies (14.10)(ii) with x = ∞.

**Correction:** The L-factor identity being specialized is Corollary (14.11)(iii).

**Reason:** The displayed ratio L_x(V•,T)/L_x(V•,q_x^{−d}T^{−1}) = A_xT^{B_x}[…]^{m(Π)} is (14.11)(iii) on p. 299; (14.10) concerns the vanishing of V^n.

Affects: nothing. Known correction: new.

**Correction search**

- Kaiser’s erratum (both pages)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; pp. 299 and 306 read on the page images.

### E6: misprint

`Hausberger-2005`, Theorem 9.2(ii), p. 1335.

**Printed assertion, paraphrased:** The source asserts σd (π ⊗ χ) = σd (π) ⊗ σ1 (χ) for every quasi-character χ ∈ A 0d (K).

**Correction:** χ ∈ A⁰_1(K) (a character of K^× of finite order), as σ_1(χ) requires.

**Reason:** σ_1 is defined on A⁰_1(K); a twist by an element of A⁰_d(K) is not a twist by a character.

Affects: nothing. Known correction: new.

**Correction search**

- Annales de l’Institut Fourier article page (no erratum listed)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; checked in the text layer of p. 1335.

### E7: misprint

`Hausberger-2005`, Lemma 10.2 and the preceding sentence, pp. 1339–1340.

**Printed assertion, paraphrased:** The source chooses π ∈ A 0n (K).

**Correction:** π ∈ A⁰_d(K): supercuspidal of GL_d(K) with finite-order central character.

**Reason:** The lemma produces Π on GL_d(A) with Π_o ≃ π; n denotes the level at o elsewhere in §10.

Affects: nothing. Known correction: new.

**Correction search**

- Annales de l’Institut Fourier article page (no erratum listed)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; checked in the text layer of pp. 1339–1340.

### E8: misprint

`Hausberger-2005`, §10.2, after Theorem 10.4, p. 1340.

**Printed assertion, paraphrased:** The source associates to Π a representation VΠd∞ of WFo having dimension d. It defines Σ(Π) by twisting VΠd∞ with |.|^{(d−1)/2}.

**Correction:** The representation is V^{d−1}_{Π^∞} (middle degree d − 1), which has dimension d for the selected Π.

**Reason:** Theorem 10.1 (and LRS 15.12) put the d-dimensional isotypic part in degree d − 1; degree d is not the middle degree of a (d − 1)-dimensional variety.

Affects: nothing. Known correction: new.

**Correction search**

- Annales de l’Institut Fourier article page (no erratum listed)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; checked in the text layer of p. 1340 against Theorem 10.1.

### E9: misprint

`Hausberger-2005`, §7.2, p. 1317.

**Printed assertion, paraphrased:** The source invokes proposition 3.4 to say that all special formal OD -modules over κ of height d2 are isogenous.

**Correction:** Théorème 3.4.

**Reason:** The isogeny statement is Théorème 3.4 (p. 1303); p. 1321 cites it correctly as a theorem.

Affects: nothing. Known correction: new.

**Correction search**

- Annales de l’Institut Fourier article page (no erratum listed)



Prior independent verification: confirmed by `REV-ExcursionOperatorsAndSpectralAction--ES7`. Added by this review; checked in the text layer.

### E10: error

`Hausberger-2005`, Proof of Lemma 10.15, p. 1354, published article.

**Printed assertion, paraphrased:** The lifting argument asserts ker(u) ∩ im(p_{π′}) = {0} for the arbitrary surjection u : E′ → E between smooth representations and the natural isotypic projector p_{π′}.

**Correction:** Replace that assertion by a splitting of the surjection on the semisimple V-isotypic summands. Naturality of the projectors makes the restricted map surjective, and complete reducibility permits a G-equivariant lift. This repairs the proof route without changing the projectivity statement.

**Reason:** Take the trivial group and its one-dimensional representation V over a characteristic-zero field, E′ = V ⊕ V, E = V and u(x,y)=x. Both isotypic projectors are identities, but ker(u) ∩ im(p_{π′}) = {0} ⊕ V ≠ {0}. Thus commutation with the projectors does not imply the claimed zero kernel.

Affects: the proof. Known correction: new.

**Correction search**

- Published AIF article page https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0/ (no correction listed, 2026-10-08)

- Public searches for Hausberger, Lemma 10.15, erratum/correction (2026-10-08; no correction found)



### E11: error

`Hausberger-2005`, §10.4, p. 1357, projectivity argument after the displayed Hom formula, published article.

**Printed assertion, paraphrased:** The argument says GL_d(K) is generated by its centre and GL_d(K)^0 = {g : v(det g)=0}.

**Correction:** Their product H is the subgroup with determinant valuation in dℤ, so it has index d for d>0. Transfer the fixed-central-character projectivity/injectivity statement from H to GL_d(K) using finite-index induction/restriction and averaging in characteristic zero; an actual comparison of the fixed-central-character categories is required.

**Reason:** For d=2, diag(ϖ,1) has determinant valuation 1, whereas zI_2 has valuation 2v(z) and every element of GL_2(K)^0 has valuation zero. The asserted generated subgroup therefore cannot contain diag(ϖ,1). In general, the determinant-valuation map identifies GL_d(K)/H with ℤ/dℤ.

Affects: the proof. Known correction: new.

**Correction search**

- Published AIF article page https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0/ (no correction listed, 2026-10-08)

- Public searches for Hausberger, §10.4, erratum/correction (2026-10-08; no correction found)



## Sources and reading boundaries

The revision re-downloaded the seven public source files and verified their SHA-256 identifiers. The records distinguish passages checked in this revision from prior-worker and independent-review reading. Missing proof sources are recorded in the gaps; reading a quoted theorem does not close its underlying proof.

### FS-geometrization

Laurent Fargues; Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

Author-hosted 356-page PDF; printed page equals PDF page. Version is identified by this hash, without asserting byte identity with an arXiv version.

SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Accessed 2026-10-08.

**Reading record**

- IX.7, pp. 334–338, read in full, including all four proofs/formulas, coefficient and z-embedding reductions and the two-leg trace calculation.

- VI.11 duality, pp. 235–239, and VI.12, p. 239: passages used for the dual-Levi/cyclotomic conventions. The remaining general Satake proof is imported from GS4.

- IX.3/IX.5/IX.6 statements and source locators inspected through the existing HS and ES supplier packets; these sections are not claimed read in full in the original planning run.

- REV-ExcursionOperatorsAndSpectralAction--ES7 read IX.7 (pp. 334–338) in full, Theorem IX.6.1 (p. 330) and Corollary III.4.3 (p. 101).

- Revision 2 (2026-10-08): IX.7, pp. 334–338; IX.5.2, p. 329, and VIII.3.6, p. 288 (original centre versus dual fundamental group); IX.6.1, p. 330, and III.4.3, p. 101. Page image of IX.5.2 checked.



### Hausberger-2005

Thomas Hausberger. [Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf).

Ann. Inst. Fourier 55(4) (2005), 1285–1371; journal PDF with cover. French text layer.

SHA-256: `d51dc22168dcd4831726197b1cef252ea784cc9abbce4cf521465423638daf48`. Accessed 2026-10-08.

**Reading record**

- §§1.1–1.3, pp. 1291–1293: order data, Definition 1.1, normalization/index shift and level structures.

- §3.1, Definition 3.1 and Theorem 3.4, pp. 1302–1304: definition and isogeny classification; the source itself refers out for complete coordinate-module proofs.

- Theorems 6.1/6.4, pp. 1311–1313, §7.2–7.3, pp. 1317–1319, and Theorems 8.1/8.3 with the D̄ double coset setup, pp. 1321–1323: statements and adjacent proof discussion read. The full uniformization proof is not claimed expanded.

- §§9.1–9.3, pp. 1333–1338: local transfer, independent LLC, Res′, triple stabilizer, Definition 9.3, the admissibility caveat and Theorem 9.5.

- §10.1–10.2, pp. 1338–1342, and §§10.3.2–10.3.3, pp. 1352–1356: selected transfers, spectral sequence, Ext finiteness, cuspidal degeneration and final proof.

- Appendix A.9–A.12, pp. 1363–1365: analytic quotient spectral-sequence application. Earlier Berkovich foundational references are not claimed read.

- Revision 2 (2026-10-08): definition/order/level conventions §§1.1–1.3, pp. 1291–1293; special modules and deformation §§3,6–8; classical local inputs and Res′ §§9–10; analytic Appendix A.12. These checks cover the review corrections, without claiming new closure of imported proofs.



### LRS-1993

Gérard Laumon; Michael Rapoport; Ulrich Stuhler. [D-elliptic sheaves and the Langlands correspondence](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf).

Invent. Math. 113 (1993), 217–338; published journal scan, 124 PDF pages; printed page = PDF page + 215. OCR used for navigation; crucial displayed formulas checked against page images.

SHA-256: `05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e`. Accessed 2026-10-08.

**Reading record**

- Introduction pp. 217–218 and statements/proof passages in §§4–6, pp. 236–246: smooth stack, fixed-degree level scheme, division properness. Full Lemma-level moduli closure remains listed.

- §13, pp. 289–293, read throughout: facet sum, EP identities, compact spectrum and trace formula. §13.8’s expressly unproved general assertions are excluded.

- §14, pp. 293–309: cohomology/isotypes, trace 14.9, Corollary 14.11, Theorem 14.12 and its genericity remark, graded local representations 14.13–14.17 and the unpublished ample-class discussion 14.19. Read with Kaiser, not as a self-dual isotype theorem.

- §15.10–15.17, pp. 314–319: selected globalizations/transfer, selected global representation, independence, pair constants and numerical-surjectivity statement. Numerical proof §§15.18–15.20 and quoted Henniart inputs remain a source/proof refinement.

- Revision 2 (2026-10-08): page images for §13 EP/quotient formulas, pp. 290–291; Corollary 14.11, p. 299; chain identity, pp. 302,306; selected globalization, transfer, cohomology, independence and local constants, pp. 314–319. Earlier moduli readings remain prior-worker provenance.



### Kaiser-erratum

Christian Kaiser (as identified by the author-hosted source catalogue). [Errata for [LRS]](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf).

Two-page author-hosted erratum; undated. Both pages inspected visually.

SHA-256: `6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54`. Accessed 2026-10-08.

**Reading record**

- Both pages in full: Corollary 14.11 replacement (dual AND q^{-1}); Lemma 14.14′, Proposition 14.17′, and induction proof. Neither self-duality nor integrality retained as amended-lemma assumptions.

- Revision 2 (2026-10-08): both pages read visually in full, including the induction proof and amended multiplicity/duality hypotheses.



### Kaletha-2018

Tasho Kaletha. [Rigid inner forms vs isocrystals](https://ems.press/content/serial-article-files/32267).

J. Eur. Math. Soc. 20 (2018), 61–101; publisher PDF.

SHA-256: `cfd4f90fd84806dcb328840e620d7934772d86439514e73c1bb060c222b6a030`. Accessed 2026-10-08.

**Reading record**

- §§5.1.1–5.1.2, pp. 78–80: Definition 5.1, Proposition 5.2, Corollary 5.3, Facts 5.4–5.5 and their proofs. The paper’s standing p-adic hypothesis is retained; the equal-characteristic use needs an explicit extension.

- Revision 2 (2026-10-08): standing hypothesis §2, p. 64, and §§5.1.1–5.1.2, pp. 78–80, definitions and proofs.



### Kottwitz-2014

Robert E. Kottwitz. [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728).

arXiv:1401.5728 author text; source identified by URL/hash, not an inferred version number.

SHA-256: `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4`. Accessed 2026-10-08.

**Reading record**

- §10.1 and §10.10, Proposition 10.4 and Lemma 10.5, p. 50 (valid for any local or global field); Proposition 13.1, pp. 65–66 (κ on basic classes).

- Revision 2 (2026-10-08): Proposition 10.4 and Lemma 10.5, pp. 50–51; Proposition 13.1 and proof, pp. 65–66.



### SW20

Peter Scholze; Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf).

Author copy dated 27 March 2020.

SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. Accessed 2026-10-08.

**Reading record**

- Lecture 24: Theorem 24.2.5, p. 227 (p-divisible groups over ℤ_p, E = ℚ_p) and Corollary 24.3.5, p. 231 (EL/PEL data), read by REV-ExcursionOperatorsAndSpectralAction--ES7; the O_E case is the EL instance Res_{E/ℚ_p}GL_n of 24.3.5, requested from ET.6a.

- Revision 2 (2026-10-08): Theorem 24.2.5 and proof, pp. 227–228, and EL/PEL comparison Corollary 24.3.5, pp. 230–231; the restriction-of-scalars/action comparison is still an ET.6a request.



Sources needed to close the imported proof routes include the independent classical tower and local correspondence proofs, the equal-characteristic Drinfeld/Genestier formal comparison, Boyer’s admissibility and genericity inputs, Badulescu’s local character theorem, the selected simple trace and Henniart numerical arguments, and the precise local-constant comparison. This revision does not claim these additional proofs were read or supplied. Their owners and consumers are recorded in the request and gap lists.

## Suggested signatures and validation

The [suggested file](../suggested/ExcursionOperatorsAndSpectralAction--ES7.lean) proposes native signatures for all 50 nodes, their 53 API items and 34 planned tests. It uses individual Mathlib imports at the pinned commit, with admitted supplier carriers for the geometric and smooth objects. Elementary compatibility calculations elaborate against existing algebraic definitions. The enhanced-centre comparison, continuous smooth induction and geometric conditions named in docstrings remain obligations of their suppliers. Compilation verifies the signatures and does not establish the planned theorems.

The packet validator reports 0 errors and 0 warnings. The suggested file elaborates through lean-check at Mathlib 082e2d3 with admitted-proof warnings only. Tau Ceti declarations were read at f790474; the suggested file has no Tau Ceti imports. All five stages remain planned with the closure work recorded above.
