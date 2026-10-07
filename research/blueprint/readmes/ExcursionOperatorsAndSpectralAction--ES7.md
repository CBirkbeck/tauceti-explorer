# Excursion operators and the spectral action: ES7

This part plans the restriction of the spectral centre to Bernstein strata, compatibility with parabolic induction, and agreement of the GL_n excursion parameter with the classical semisimple parameter. The pass is complete at the level of the targets: each of the five stages has status **planned**. None has status closed. The mathematical statements below are a library plan, and every declaration remains unchecked. The precise proof refinements, missing source expansions and supplier obligations appear at the end of this document. Completion of the planning pass does not discharge those obligations.

The packet retains all 24 node ids of the inherited attempt and adds its missing targets. Its principal corrections are source-based. In the induction proof the stratum is b=μ(π_E^{-1}), the operation is T_{μ^{-1}}, and the resulting complex is Ind_P^Gσ(−d/2)[−d]. The auxiliary supercuspidal place in Hausberger’s transfer theorem lies outside the ramified set. The local fundamental representation uses the ℤ-indexed Res′ construction and the triple-action stabilizer, not an ordinary restriction of scalars from an infinite extension. The uniformization double-coset space belongs to the different global inner form D̄. Global middle-degree concentration is used for selected proven transfer-image globalizations. Kaiser’s correction changes both the dual representation and the q-exponent in the L-factor.

## Conventions and scope

Let E be a nonarchimedean local field, q its residue cardinality, and ℓ a prime different from its residue characteristic p. A square root √q is fixed in the coefficient ring. Integral centre statements use Z_ℓ[√q]-algebras Λ. The spectral-centre identification requires the order of π₀Z(G) to be invertible in Λ. Excursion-algebra actions give the corresponding diagrams without that identification. Their existence does not prove a spectral-centre theorem in a coefficient regime where its hypothesis fails.

The degree map used here sends **geometric** Frobenius to 1. At an unramified element of degree r, the norm character is q^{-r}. The usual pinned Weil action on the dual group is distinguished from the Satake action with its cyclotomic twist. For a dual Levi M̂⊂Ĝ, let t=(2ρ_Ĝ−2ρ_M̂)(√q). The twisted cocycle map is φ(w)↦t^{deg(w)}j(φ(w)). Invariance under the pinned Weil action and centrality in the Levi are both needed to prove its cocycle law; centrality alone is insufficient.

Unnormalized induction means Ind_P^G. Normalized induction means i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E. Geometric reciprocity sends a uniformizer to geometric Frobenius. Thus the parameter of the modulus half-character supplies the inverse of t^{deg}; it cancels the twist in the unnormalized formula. For the upper Borel of GL₂, δ_B(diag(a,d))=|a/d|. Unnormalized induction of the trivial torus character has Frobenius diag(√q,1/√q); normalized induction has 1⊕1. The sheaf shift (−d/2)[−d] is a Satake normalization and must be tracked separately from this character dictionary.

The classical comparison uses Q̄_ℓ. It identifies the semisimplified Weil parameter and does not recover a nilpotent monodromy operator N. For example, the trivial and Steinberg representations of GL_n have the same semisimple diagonal parameter, although their Weil–Deligne monodromy differs. Arithmetic Frobenius semisimplicity is never inferred from purity. The finite-group character theorem in pinned Tau Ceti is cited as a boundary: its finite-group assumption prevents applying it directly to W_E.

For the function-field route, let X/F_q be smooth, projective and geometrically connected, F=F_q(X), and D/F central simple of dimension d². A chosen rational pole ∞ is split for the D-elliptic construction. The local realization uses a division algebra with invariants +1/d at o, −1/d at o′ and zero elsewhere. Its uniformizing inner form D̄ changes the invariants at o and ∞. The compact-quotient argument applies to either global division algebra; it does not require that its pole be split. All levels used for a formal extension at o are disjoint from o. Levels at o occur on the generic fibre through Drinfeld coverings.

The source theorem for the local fundamental representation fixes a finite-order central character ξ. The quotient U_d^i(ξ) is the largest quotient on which the centre acts through ξ. Its isotype is Hom_GL_d(K)(π,U), retaining the other two actions. Extending to arbitrary central characters requires the supplied twisting theorem. The local source’s non-supercuspidal Carayol–Harris conjecture is recorded as a conjecture rather than a target.

## Ownership and the dependency graph

The spectral-to-geometric centre map is the exact node ES1:spectral-center/spectral-to-geometric-center-map. Its excursion counterpart is imported separately. VS4 supplies fully faithful stratum embeddings. SR.1 is asked for the Λ-linear derived Bernstein centre, its inverse limit of pro-p Hecke corners and integral separatedness. SR.0 supplies the category; SR.2 supplies induction and the modulus conventions. The complex centre of SR.3 does not serve as the integral centre without a coefficient comparison.

Pure inner twisting is imported from BG0’s existing node. Its Hecke equivariance is an explicit stronger request. BG1 supplies canonical Newton data and is asked to prove the connected-centre basic-inner-class surjectivity derived from Kottwitz. His Proposition 10.4 is the surjectivity of a B-map for a central extension, rather than a theorem stated directly as B(G)_bas→H¹(E,G_ad). The z-embedding owner remains ES6:functoriality; its existing definition must include all Kaletha cohomological conditions. This part owns the application proving the Bun fibre, injectivity on B and detection of the centre by representation restrictions.

In characteristic zero, ET.6 supplies the independent classical correspondence and ET.6a supplies the two-tower cohomology. ET.6a also owns the tower diamond/minuscule Hecke-fibre comparison downstream of its classical construction and HS2. Its required O_E-module variant is stated explicitly. ES7 imports the resulting identity; HS2’s example promise is not used to prove it. An ET.6a→HS2 dependency would create a cycle, so none is proposed. HS3 supplies the Hecke/cohomology interface, while HS4’s exact monoidal finite-set node supplies fusion and creation/annihilation compatibility.

In equal characteristic, this part supplies D-elliptic geometry, special formal modules, uniformization and the supercuspidal realization. The existing HS packet’s local-shtuka and Hecke-fibre statements are mixed-characteristic/Q_p statements. They cannot stand in for the equal-characteristic comparison. The transport node records the additional action-preserving Hecke-fibre and dual-operation proof. Both characteristic inputs feed one two-leg trace theorem. Its prerequisites list both inputs for the all-field plan; a proof for a fixed field uses the appropriate alternative input, not both at once.

Generic function-field completions, adeles, Haar products, the diagonal embedding, central and degree quotients and automorphic definitions stay with FA.2/FA.6 and AA.0/AA.1. The exact AA.0 restricted-Haar-product node is used. The current AA.1 restricted-product comparison assumes a number field, so its function-field extension is a request with a gap, not a completed supplier citation. This part adds only the division-algebra specialization, EP functions, simple selected trace comparison and globalizations. It imports AS.0’s abstract analysis and does not import AF.2–3 or AS.6 number-field automorphic theorems.

The exact DWP.7 smooth-proper purity node is imported. DWP.5 owns local monodromy weights on a function-field curve; DWP.8’s geometric semisimplicity and DWP.9’s hard Lefschetz are not substitutes. ArithmeticGaloisRepresentations supplies the Weil–Deligne carrier and the distinction between Frobenius semisimplification and semisimplification. FA.5 supplies function-field Chebotarev, feeding the general-profinite recognition variant of the arithmetic packet. EDC.2/8 and WC.2 supply duality, correspondences and the determinant/functional-equation interface. The geometric quotient application of Hochschild–Serre is proved here from the general construction requested from R02.2; the existing profinite/discrete-module theorem is insufficient by itself.

## Target inventory

The declaration lists below are the target inventory. Each object is given its data, uses, API and three discriminating tests. Each theorem has a statement with its hypotheses, a proof route and acceptance properties. Prerequisites identify exact supplier nodes wherever their statements suffice, and stage requests where a stronger interface is needed. A named gap terminates a chain whose precise proof is not yet established. This is the protocol’s meaning of a planned stage.

## ExcursionOperatorsAndSpectralAction:ES7:parabolic

The stratum maps are restrictions of an imported action, so their construction precedes every comparison. After proving the pointwise twisted inclusion, the coefficient and group reductions allow an étale constant-term computation. The increasingly unstable sequence depends on the bounded Hecke type chosen in advance. Creation and annihilation force the degree-zero component, which is why its shift disappears in the excursion computation. The unnormalized induction result and its normalization dictionary are distinct declarations.

### Bernstein maps from strata

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps` (construction).

For a Z_ℓ[√q]-algebra Λ and reductive G/E, restrict the geometric centre along the fully faithful embedding D(G_b(E),Λ) ≃ D_lis(Bun_G^b,Λ) → D_lis(Bun_G,Λ). Composing with the imported spectral-to-geometric centre map defines Ψ_G^b. At b=1 use j_! and write Ψ_G. The spectral centre formulation requires |π₀Z(G)| invertible in Λ; the excursion algebra formulation has no such condition. The embeddings are those provided by VS4 (e.g. the left adjoint to i_b^*), not an unrestricted shriek functor on lisse categories.

The proof route is:

1. Use VS4 to identify the stratum category and its fully faithful embedding.
2. Restrict natural endomorphisms of the identity; compose with ES1’s map. Full faithfulness and the adjunction identify the action on objects, so no choice of extension changes it.

Uses:

- **FS IX.7.2**: The stratum restriction is the left side of the factorization triangle.
- **FS IX.7.3**: Its value at b=1 acts on parabolic induction.

API:

- `PsiG` (constructor): The composite of the spectral-to-geometric map with restriction to the trivial stratum.
- `PsiGb` (constructor): The same composite using the b-stratum and its group G_b(E).
- `PsiGb.basepoint` (compatibility): Ψ_G^1=Ψ_G.
- `PsiGb.embedding_independent` (characterisation): Eligible fully faithful stratum embeddings with the specified adjunction induce the same central action.
- `PsiGb.excursion` (compatibility): Restriction of the excursion action defines the analogous map even when ℓ divides |π₀Z(G)|.

Unit tests:

- `PsiGb.basepoint_test` (compatibility): At b=1, evaluate Ψ_G^b on any spectral function and obtain Ψ_G.
- `PsiG.one_test` (computation): The spectral constant 1 acts as the identity on every smooth representation.
- `PsiGb.excursion_test` (non-example): For a group with ℓ dividing |π₀Z(G)|, the excursion construction still gives a central action; the spectral-centre identification is not invoked.

Acceptance:

- For b=1 the general restriction equals j_!’s map.
- The maps preserve 1, addition and multiplication.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`, `VStackSheavesAndLisseCategories:VS4`, `SmoothRepresentationsOfLocalGroups:SR.1`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `mathlib:CategoryTheory.Adjunction`, `mathlib:CommRing`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition IX.7.1, p. 334. Literal excerpt: “induced by the fully faithful functor” Definition IX.7.1 defines the fully faithful stratum restrictions; the excursion replacement is in the proof of IX.7.2.

### Twisted inclusion of Levi cocycles

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion` (construction).

Write M̂=Ĝ_b⊂Ĝ for the dual Levi and j for its pinned inclusion. Let deg:W_E→ℤ send geometric Frobenius to 1 and let t=(2ρ_Ĝ−2ρ_M̂)(√q). The Satake inclusion sends a continuous cocycle φ to cφ(w)=t^{deg(w)}j(φ(w)), using the fixed usual pinned Weil actions on both sides. The cocharacter difference is Weil invariant and central in M̂; hence t is invariant and centralizes j(M̂). These properties, together with equivariance of j, prove the cocycle identity. The map is conjugation equivariant and induces pullback on invariant functions.

The proof route is:

1. Import the dual Levi, invariant cocharacter difference and pinned actions from GS4/RG2.5.
2. Expand cφ(wv), use additivity of degree, invariance of t, centrality in the Levi and the cocycle equation for φ.
3. Check continuity on finite-inertia charts and conjugation equivariance using LP0.

Uses:

- **FS IX.7.2**: Pullback along this map is the arrow between the spectral centres.
- **FS IX.7.3**: This inclusion determines the induced representation’s parameter.

API:

- `cocycleMap` (constructor): On A-points, φ ↦ (w ↦ t^{deg(w)}j(φ(w))).
- `cocycleMap.isCocycle` (characterisation): cφ(wv)=cφ(w)·w(cφ(v)), and cφ(1)=1.
- `cocycleMap.degree_zero` (simp): If deg(w)=0, cφ(w)=j(φ(w)).
- `cocycleMap.basicCase` (compatibility): If M̂=Ĝ then cφ=jφ.
- `cocycleMap.conjugation` (functoriality): Conjugating φ by m conjugates cφ by j(m); base change of A commutes with this map.

Unit tests:

- `cocycleMap.basic_test` (degenerate): For M̂=Ĝ the cocharacter difference is zero, so the map is the identity inclusion.
- `cocycleMap.GL2_test` (computation): For the upper Borel of GL₂, trivial φ evaluates at geometric Frobenius to diag(√q,1/√q).
- `cocycleMap.inertia_test` (computation): On inertia (degree zero) the twisting factor is 1.

Acceptance:

- For a basic stratum, t=1.
- The GL₂ upper-Borel example has t=diag(√q,1/√q).

Direct prerequisites: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `mathlib:MonoidHom`, `mathlib:RootPairing`, `mathlib:Subgroup`, `mathlib:MulAut`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), IX.7.1, pp. 334–335. Literal excerpt: “normalized as usual by sending a geometric Frobenius to 1.” The displayed twisted formula uses this degree convention.

### Reduction to torsion coefficients

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction` (lemma).

To prove the stratum triangle or the induction square for arbitrary Λ, prove the universal statement over Z_ℓ[√q], reduce modulo ℓ^r, and use ℓ-adic separatedness of the integral Bernstein centre. The centre is lim_K Z(e_KH_Λe_K) over a cofinal system of pro-p compact open K; p is invertible in Λ. Extend scalars from the universal action. Separatedness is asserted for Z_ℓ[√q], not for arbitrary Λ. Replace spectral functions by excursion generators when the centre-order condition fails.

The proof route is:

1. Use the SR.1 corner-centre identification and integral separatedness.
2. Equality modulo every ℓ^r implies equality in the integral centre. Naturality of the universal excursion action gives base change.

Acceptance:

- No use of separatedness of a field or of arbitrary torsion coefficients.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `SmoothRepresentationsOfLocalGroups:SR.1`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`, `VStackSheavesAndLisseCategories:VS3`, `mathlib:MonoidAlgebra`, `mathlib:Module.End`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.2, p. 335. Literal excerpt: “This means we can avoid the subtleties” The proof reduces coefficients to avoid the lisse/étale distinction.

### Reduction to a quasi-split group

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction` (lemma).

The b-basic triangle follows from the Hecke-equivariant pure-inner-twisting equivalence Bun_G≃Bun_{G_b}. For general G choose a full z-embedding G↪G′ with quotient torus C, H¹(E,C)=1, H¹(E,Z(G))→H¹(E,Z(G′)) bijective, and connected Z(G′). Prove Bun_G≃Bun_G′×_{Bun_C}{1}, injectivity B(G)→B(G′), surjectivity Z(G′)(E)→C(E), and G′_{b′}(E)=Z(G′)(E)G_b(E). Restrictions from G′_{b′} detect the centre of G_b. Reduce to connected centre using ES6 isogeny functoriality; then choose basic b₀ making G_{b₀} quasi-split using BG1’s basic-inner-class surjectivity, and apply pure inner twisting.

The proof route is:

1. Import a z-embedding with all Kaletha 5.1 conditions, not merely a torus quotient and connected centre.
2. Use the central quotient and the Bun fibre identity to obtain injectivity on classes and detection on representation restrictions.
3. Import the BG1 consequence of Kottwitz 10.4 and the BG0 Hecke-equivariant equivalence. Apply the already proved basic case.

Acceptance:

- At b basic this recovers pure-inner-form invariance.
- The Kottwitz citation supplies surjectivity of B under a central extension; the bridge to H¹(E,G_ad) is proved in BG1.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/isogenies`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/z-embedding`, `BunGAndNewtonStrata:BG0/pure-inner-twisting`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2`, `BunGAndNewtonStrata:BG0`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.2, pp. 335–336. Literal excerpt: “G is quasisplit” This is the complete reduction in the source.
- [Kaletha-2018](https://ems.press/content/serial-article-files/32267), Definition 5.1, Fact 5.5, pp. 78–80. Literal excerpt: “Fact 5.5.” The z-embedding hypotheses include the cohomological conditions; surjectivity of the central quotient is essential.
- [Kottwitz-2014](https://arxiv.org/pdf/1401.5728), Proposition 10.4, p. 50. Literal excerpt: “Proposition 10.4.” Apply the central-extension surjectivity to G→G_ad; the H¹ identification for basic adjoint classes is an additional BG1 input.

### Increasing instability at a fixed parabolic

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence` (lemma).

For quasi-split G choose the canonical parabolic P_b and a cocharacter μ central in its Levi with dynamical parabolic P_b. Put b_N=bμ(π)^N. Then G_{b_N}=G_b and the stratum maps for b and b_N agree. For each fixed bounded Hecke type V, sufficiently large N makes every self-modification of E_{b_N} of that type preserve its Harder–Narasimhan reduction to P_b.

The proof route is:

1. Use BG1’s canonical Levi and BG4’s bounded-modification slope estimate.
2. The unique modification of type Nμ between the two strata transports the same representation; HS4 compatibility transports central actions.
3. Choose N after fixing V; the HN slope gaps then exceed its bounded possible changes.

Acceptance:

- N depends on V; one uniform N for all Hecke types is not asserted.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG4`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.levi`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.2, p. 336. Literal excerpt: “same parabolic P but increasingly instable.” The sequence and preservation argument are both used in the proof.

### Factorization of the stratum centre map

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` (theorem).

For every b∈B(G), Ψ_G^b = Ψ_{G_b}∘c_b^*, with c_b the twisted Levi cocycle inclusion. Use spectral centres under the centre-order condition and excursion algebras otherwise. In the proof the HN-preserving Hecke diagram maps through P and its Levi M, with G_b=M_{b_M} for basic b_M. The pushforward of the Satake sheaf is CT_P(S_V), agreeing with dual-Levi restriction with the cyclotomic twist and degree shift [deg_P]. Excursion creation and annihilation meet only the degree-zero component, so this shift disappears there.

The proof route is:

1. Apply coefficient and group reductions. Replace b by b_N and use the HN-preserving P/Levi diagram.
2. Apply base change and the GS4 constant-term comparison, with the twisted inclusion rather than the ordinary pinned inclusion.
3. Restrict creation/annihilation to degree zero and compare every excursion generator.

Acceptance:

- Basic b has untwisted factorization.
- For GL₂’s nonbasic torus stratum the Frobenius factor is diag(√q,1/√q).

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:CategoryTheory.MonoidalCategory`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem IX.7.2 and proof, pp. 335–337. Literal excerpt: “require only the connected component where degP = 0” Creation and annihilation force the component on which the constant-term shift vanishes.

### Unnormalized parabolic induction

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` (theorem).

For P⊂G with Levi M and smooth σ of M(E), the spectral/excursion action on unnormalized Ind_P^Gσ is induced by the twisted Levi pullback on the action on σ. If Λ=L is algebraically closed, σ irreducible and π an irreducible subquotient, φ_π is conjugate to c_Mφ_σ. In the geometric proof choose b=μ(π_E^{-1}) for a cocharacter with dynamical parabolic P. For σ=c-Ind_K^{M(E)}Λ, the sheaf A on Bun_G^b satisfies T_{μ^{-1}}(A)|Bun_G^1 = Ind_P^Gσ(−d/2)[−d], d=⟨2ρ,μ⟩.

The proof route is:

1. Use compactly induced pro-p generators and the coefficient reduction.
2. The modification space is G(E)/P(E), of exact type μ; Satake normalization supplies (−d/2)[−d].
3. Hecke/excursion commutation and the stratum factorization give the square. ES5 gives the subquotient statement.

Acceptance:

- For P=G the twist and d vanish.
- Reversing both the cocharacter and shift without changing the stratum is rejected.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.1`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `tauceti:TauCeti.Cocharacter.parabolic`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Corollary IX.7.3 and proof, pp. 337–338. Literal excerpt: “with (unnormalized) parabolic induction” The source explicitly uses unnormalized induction; its proof has the inverse cocharacter and negative shift.

### Normalized induction and the cyclotomic twist

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary` (theorem).

Fix i_P^Gτ=Ind_P^G(δ_P^{1/2}τ), with δ_P(m)=|det(Ad(m)|Lie U_P)|_E and geometric reciprocity sending a uniformizer to geometric Frobenius. Under the torus parameter dictionary the twist by δ_P^{1/2} has cocycle c^{-1}, where c(w)=(2ρ_Ĝ−2ρ_M̂)(√q)^{deg(w)}. Thus c·φ_{δ_P^{1/2}τ}=jφ_τ and normalized induction uses the ordinary Levi inclusion. The geometric (−d/2)[−d] of IX.7.3 is a Satake sheaf normalization, not a second arbitrary modulus factor.

The proof route is:

1. Compare the roots of U_P with the cocharacter difference on the dual side.
2. Evaluate δ_P^{1/2} on cocharacters at a uniformizer and use geometric reciprocity: its dual character is c^{-1}.
3. Apply the ES6 twisting theorem and the unnormalized result.

Acceptance:

- For upper triangular GL₂, δ_B(diag(a,d))=|a/d| and the trivial normalized principal series has parameter 1⊕1.
- The unnormalized principal series of the trivial character has Frobenius diag(√q,1/√q).
- The source shift is (−d/2)[−d], not (+d/2)[+d].

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`, `SmoothRepresentationsOfLocalGroups:SR.2`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:MeasureTheory.Measure.modularCharacter`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Corollary IX.7.3, p. 337. Literal excerpt: “involving the cyclotomic twist.” The cancellation is derived from this formula and the separately supplied modulus/reciprocity conventions; FS does not state a normalized-induction theorem here.

## ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic

The compact quotient and finite-level kernel justify the spectral trace before local test functions are introduced. The EP function uses facet normalizers and orientation characters. Matrix-coefficient selectors at prescribed places and an elliptic-support auxiliary test give the nonzero simple trace needed for globalization. The transfer retains its outside-ramification supercuspidal place. Global cohomology is first described by an alternating trace. Middle-degree concentration and multiplicity one are then asserted for the selected transfer image; the broader unpublished ample-class argument is excluded.

### Maximal-order data for the division algebra

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders` (definition).

Let X/F_q be smooth projective geometrically connected, F=F_q(X), d≥1 and D/F central simple of dimension d². The order data impose no split-place condition; D-elliptic consumers additionally choose a rational place ∞ at which D is split. Fix a coherent locally free O_X-algebra 𝒟 of generic fibre D with 𝒟_x a maximal O_x-order in D_x at every closed place x. Maximal means maximal by inclusion among O_x-orders (finite O_x-lattices containing 1 and closed under multiplication); no canonical choice at split places is asserted. Let R={x:D_x is nonsplit}. At x∉R choose (D_x,𝒟_x)≅(M_d(F_x),M_d(O_x)).

The proof route is:

1. Use the function-field completions from FA.2; fix the order sheaf as part of the data.
2. Obtain compact open 𝒟_x^× from local integral-point topology; identify it with GL_d(O_x) at a split place. General existence of a glued maximal-order sheaf is a recorded refinement.

Uses:

- **Hausberger Definition 1.1**: Provides the right algebra action on each vector bundle.
- **LRS §§13,15**: Its compact unit groups define unramified levels and Haar normalization.

API:

- `DOrder.local` (projection): The completed local order 𝒟_x⊂D_x and its unit group.
- `DOrder.split_equiv` (compatibility): At x∉R the chosen pair is isomorphic to (M_d(F_x),M_d(O_x)).
- `DOrder.change_lattice` (functoriality): A change of split lattice by g conjugates the endomorphism order by g.
- `DOrder.ramification` (data): The finite set R of nonsplit places; a split pole is chosen outside R in the D-elliptic setup.

Unit tests:

- `DOrder.rank_one_test` (degenerate): For D=F, 𝒟=O_X and every local maximal order is O_x.
- `DOrder.matrix_test` (compatibility): For the standard lattice O_x^d the order is M_d(O_x), whose units are GL_d(O_x).
- `DOrder.integral_nonunit_test` (non-example): diag(π_x,1,…,1) belongs to the split order and is invertible over F_x but is not a unit of that order.

Acceptance:

- Changing a split lattice conjugates its maximal order.

Direct prerequisites: `FunctionFieldArithmetic:FA.2`, `AdelicAlgebraicGroups:AA.1`, `ReductiveGroupsPartII:RG2.0`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Free`, `mathlib:CommRing`, `SchemeAndStackFoundations:SF.2/sheaf-algebra`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), §1.1, p. 1291. Literal excerpt: “soit un ordre maximal” The standing global order data and the split-place identification are explicitly specified.

### Compact division-algebra automorphic quotient

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness` (theorem).

For any central division algebra D/F (including the inner form D̄ ramified at ∞), the diagonal D^×(F) is discrete in the imported adelic group D^×(A_F). The quotient is compact modulo A_F^×. After quotienting by the central subgroup π_∞^ℤ (degree lattice) and fixing the compatible central-character quotient, D^×(F)\D^×(A_F)/π_∞^ℤ is compact. Finite level further gives a compact quotient with finite stabilizers; do not assert finiteness of the whole adelic quotient as a set.

The proof route is:

1. Import the diagonal topology, centre and degree quotient from FA.2/FA.6/AA.1.
2. Use anisotropy of PGL₁(D) and function-field reduction to prove compactness modulo centre; the degree-zero idele class group is compact.
3. Keep the central quotient and finite stabilizers in the measure normalization.

Acceptance:

- For d=1 this is idele-class compactness after the degree lattice.
- The analogous GL_d quotient for d>1 is not compact modulo centre.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.6`, `AdelicAlgebraicGroups:AA.1`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `ReductiveGroupsPartII:RG2.0`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), §13.3, p. 291. Literal excerpt: “the coset space” The compactness used before the discrete spectral formula is D-specific.

### Discrete division-algebra spectrum

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum` (theorem).

For a unitary central character trivial on the chosen degree lattice, the compact quotient’s L²-space decomposes discretely as a Hilbert sum of irreducible admissible automorphic Π with finite multiplicities m(Π). Its smooth K-finite vectors give the algebraic automorphic space; Π=⊗′_vΠ_v with spherical vectors at almost all places. At a fixed compact open finite level the relevant automorphic space is finite dimensional. This is not a claim that infinitely many tower levels form a finite-dimensional representation.

The proof route is:

1. Apply AS.0 to the compact quotient and admissible smooth action.
2. Use finite-level compactness to get finite-dimensional invariants and finite multiplicities.
3. Apply the restricted-tensor-product factorization with distinguished unramified vectors. Transfer characteristic-zero coefficient fields only with the supplied algebraic descent.

Acceptance:

- At fixed K, a finite sum computes traces; summing the entire tower without a convergence statement is invalid.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `AutomorphicSpectralTheory:AS.0`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.3`, `FunctionFieldArithmetic:FA.6`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), §13.3, p. 291. Literal excerpt: “with finite multiplicities” The compact D quotient admits the discrete decomposition used in §13.5.

### Kernel trace formula for the compact quotient

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity` (theorem).

For a compactly supported locally constant test function f on the central quotient, biinvariant under a compact open K and with compatible Haar measures, convolution has finite rank on the K-invariant automorphic subspace. Its kernel is K_f(x,y)=Σ_{γ∈D^×(F)}f(x^{-1}γy), locally finite. Integrating the diagonal gives Σ_Πm(Π)trΠ(f)=Σ_[γ]vol(D_γ^×(F)\D_γ^×(A)/π_∞^ℤ)O_γ(f), with all quotient measures fixed. Absolute integrability follows from compactness and local finiteness after passing to K; no unproved interchange of an infinite unbounded tower sum is used.

The proof route is:

1. Construct the locally finite kernel on a finite compact-open cover.
2. Compute its finite-rank diagonal trace and unfold the integral by rational conjugacy classes.
3. Disintegrate using compatible centralizer Haar measures.

Acceptance:

- Rescaling a Haar measure rescales its convolution function inversely.
- The identity term contributes the quotient volume times f(1).

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), §13.5, p. 291. Literal excerpt: “Selberg trace formula” The compact trace formula equates the spectral sum and orbital-integral sum.

### Weakly cuspidal Euler–Poincaré function

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function` (construction).

At the split rational place ∞ identify D_∞^× with GL_d(F_∞). For simple roots Δ, I⊂Δ, facet normalizer P_I, compact parahoric P_I⁰ and orientation character χ_I extended by zero, define f_∞=Σ_{I⊂Δ} (−1)^{|Δ\I|}χ_I/((|Δ\I|+1)vol(P_I⁰)). It descends to PGL_d(F_∞) and is compactly supported there. It is a finite alternating sum of oriented facet-normalizer functions, not an arbitrary cusp projector.

The proof route is:

1. Import the building facets and their parahoric/normalizer actions.
2. Take each orientation sign extended by zero and sum with the stated denominator.
3. Check central invariance and compact support modulo centre.

Uses:

- **LRS Theorem 13.2**: Its orbital integrals transfer to the division inner form at ∞.
- **LRS Lemma 15.10**: Its character trace forces the Steinberg component in a cuspidal globalization.

API:

- `EulerPoincareFunction` (constructor): The finite facet sum with the specified coefficients and Haar normalization.
- `EulerPoincareFunction.central` (compatibility): Translation by F_∞^× leaves f_∞ unchanged.
- `EulerPoincareFunction.haar_rescale` (functoriality): Replacing dh by a·dh replaces f_∞ by a^{-1}f_∞.
- `EulerPoincareFunction.support` (characterisation): The support modulo centre is contained in the finite union of facet normalizers.

Unit tests:

- `EulerPoincareFunction.rank_one_test` (degenerate): For d=1 the building is a point and the resulting function is the normalized constant on GL₁(F_∞)/F_∞^×.
- `EulerPoincareFunction.haar_test` (computation): Doubling the Haar measure halves the EP function and leaves its integrated character trace unchanged.
- `EulerPoincareFunction.orientation_test` (non-example): In the GL₂ tree, a facet-normalizer element interchanging an edge’s two vertices has orientation sign −1, not +1.

Acceptance:

- An orientation sign is needed when a normalizer permutes vertices.

Direct prerequisites: `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), §13.1, p. 290. Literal excerpt: “the sign character of the permutation representation” This character and the displayed facet sum define the EP function; the normalizer is distinguished from the pointwise stabilizer.

### Euler–Poincaré orbital identities

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals` (theorem).

For nonelliptic regular elements γ of GL_d(F_∞), O_γ(f_∞)=0. For elliptic regular γ matching γ̄ in the division inner form D̄_∞^×, let f̄_∞=1/vol(D̄_∞^×/π_∞^ℤ). With transferred centralizer measures, O_γ(f_∞)=ε_∞(γ̄)O_γ̄(f̄_∞). The equality uses the Kottwitz sign and matched quotient measures.

The proof route is:

1. Apply the building Euler-characteristic orbital calculation, tracking facet orientations.
2. Use the division inner-form centralizer and the transferred Haar measures.

Acceptance:

- A split regular nonelliptic element has zero orbital integral.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `ReductiveGroupsPartII:RG2.2`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Theorem 13.2(i), p. 290. Literal excerpt: “The orbital integrals” The theorem gives vanishing on nonelliptic elements and the elliptic inner-form equality.

### Euler–Poincaré character identities

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces` (theorem).

For a unitary irreducible representation of GL_d(F_∞)/π_∞^ℤ, trπ(f_∞)=0 except for the trivial representation (trace 1) and Steinberg (trace (−1)^{d−1}). Nontrivial central character on F_∞^×/π_∞^ℤ gives trace zero because f_∞ is centrally invariant. The characteristic-p application uses the proof identified in LRS 13.2(ii), whose cited blanket characteristic-zero hypothesis is not used in that proof.

The proof route is:

1. Use the building resolution and the character/Euler characteristic calculation.
2. Reduce from the degree-lattice quotient to the full-centre quotient using central invariance.

Acceptance:

- For d=2 the Steinberg trace is −1.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ReductiveGroupsPartII:RG2.2`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Theorem 13.2(ii), p. 290. Literal excerpt: “the trace of” The theorem specifies the two exceptional character traces; its proof explicitly checks the characteristic-p use of Kottwitz 2′.

### Simple trace comparison in the selected range

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison` (theorem).

Compare the compact D trace formula with GL_d’s simple cuspidal trace formula for factorizable tests with a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, EP at ∞ and matching local functions at the ramified places. The elliptic orbital sides agree with the local transfer signs; the supercuspidal place kills the proper-parabolic terms. This selected identity isolates the prescribed global constituents. It does not construct a general invariant trace formula or arbitrary global Jacquet–Langlands correspondence.

The proof route is:

1. Build matched factorizable tests with the fixed central character.
2. Use the cusp selector and elliptic support to restrict the GL_d geometric side.
3. Compare elliptic orbital integrals and spectral character traces. The precise Deligne–Kazhdan/Henniart source expansion is recorded as an open gap.

Acceptance:

- Removing the auxiliary supercuspidal selector does not preserve the stated comparison.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`, `FunctionFieldArithmetic:FA.6`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Proof of Lemma 15.10, p. 315. Literal excerpt: “we have the simple trace formula” The globalization uses an elliptic support condition and the simple GL_d trace formula; transfer in 15.11 cites Henniart A.4.

### Globalization with prescribed cuspidal places

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation` (theorem).

Let x₀=o and x₁=o′ be distinct finite places, ∞ rational, and π a supercuspidal representation of GL_d(F_o) with finite-order central character. Choose x₂ outside {o,o′,∞}. There is a cuspidal automorphic Π̃ with Π̃_o=π, Π̃_∞=St, and Π̃_{o′},Π̃_{x₂} supercuspidal, for compatible chosen central character. A further auxiliary place x₃ supports an elliptic-regular test. These are the selected globalizations of LRS 15.10; no general globalization of arbitrary essentially square-integrable data is needed for this packet.

The proof route is:

1. Choose matrix-coefficient/pseudo-coefficient selectors at o,o′,x₂ with nonzero value at 1, and EP at ∞.
2. Use the local elliptic germ argument and weak approximation to choose an elliptic rational conjugacy class.
3. Choose support at x₃ and remaining levels so one geometric term survives; spectral nonvanishing produces Π̃.

Acceptance:

- The Steinberg component follows after excluding the trivial ∞ component by global cuspidality.
- The central character is compatible globally; it is not assigned independently at every place.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`, `FunctionFieldArithmetic:FA.6`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Lemma 15.10 and proof, pp. 314–316. Literal excerpt: “It suffices to prove that both sides” Nonvanishing of both sides of the simple trace formula yields the selected globalization.

### Selected global inner-form transfer

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer` (theorem).

For D with invariants +1/d at o, −1/d at o′ and zero elsewhere, the globalization above transfers to a unique automorphic Π of D^×(A) with Π_v=Π̃_v at split places and Π_v=JL(Π̃_v) at o,o′, of multiplicity one. The broader quoted sufficient condition (Hausberger 10.4(2)) is: Π̃ essentially square-integrable at every ramified place and supercuspidal at some auxiliary place v OUTSIDE the ramified set S. Only the selected proven transfer image is consumed by local cohomology.

The proof route is:

1. Apply the selected simple comparison and the local elliptic character identity.
2. Use the independent strong multiplicity-one/transfer input in Henniart A.4 as quoted by LRS 15.11.
3. Retain the outside-S auxiliary supercuspidal component and all central-character conditions.

Acceptance:

- Being supercuspidal only at a ramified place does not meet the stated auxiliary hypothesis.
- Multiplicity one is asserted only for this transfer image.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`, `FunctionFieldArithmetic:FA.6`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 10.4(2), p. 1340. Literal excerpt: “en une place v” The next condition explicitly puts this supercuspidal place outside S; 10.3/ LRS 15.11 are the selected specialization.
- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Lemma 15.11, p. 316. Literal excerpt: “Then there is one” The selected globalization has a unique division-algebra transfer.

### Global tower cohomology and automorphic isotypes

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology` (theorem).

For division D and each level I let H_I^i=H^i(E_{I,F̄},Q̄_ℓ), 0≤i≤2(d−1). It is finite dimensional with finite coefficient field and continuous Galois action. H^i=colim_IH_I^i carries commuting D^×(A^∞) and Galois actions, with finite-dimensional K_I-invariants. Decompose the semisimplified tower into automorphic Π^∞⊗V_Π^i with Π_∞=1 or St. This node gives the decomposition and alternating trace; concentration in a single degree and multiplicity one are restricted to the selected transfer image in the separate node below.

The proof route is:

1. Use EDC finite-level cohomology, proper base change and the Hecke tower.
2. Use finite compact-open invariants and the discrete spectrum to define isotypes.
3. Apply the alternating trace identity to restrict possible ∞ components; do not use the unpublished ample-class proof for arbitrary Π.

Acceptance:

- Full tower cohomology is not asserted finite dimensional.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation`, `mathlib:DirectSum`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 10.1 and its setup, pp. 1338–1339. Literal excerpt: “action à droite” The cohomology setup restates LRS §14; the packet restricts the stronger concentration assertion to its selected globalizations.
- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), §§14.1–14.2 and Theorem 14.9, pp. 293–294,299. Literal excerpt: “We decompose” The finite-level cohomology and its isotypic decomposition precede the trace theorem.

### Geometric and automorphic trace identity

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace` (theorem).

For good place o, r≥1 and a level-compatible away-o Hecke test, the alternating cohomological trace of Frobenius_o^r and the correspondence is the spectral trace Σ_Πm(Π)trΠ(f_∞f_{o,r}f^{∞,o}). The EP traces give coefficients 1 for Π_∞=1 and (−1)^{d−1} for Π_∞=St. For a Steinberg isotype the good-place alternating trace is (−1)^{d−1}m(Π)q_o^{r(d−1)/2}Σ_{j=1}^dz_j(Π_o)^r. This is an alternating trace statement before proving concentration.

The proof route is:

1. Use the EDC.8 correspondence trace interface with the isolation/large-power bounds from LRS §§11–12.
2. Apply the compact kernel formula and EP orbital transfer.
3. At an unramified place use the spherical Satake polynomial and its q_o^{(d−1)/2} normalization.

Acceptance:

- For d=2 the alternating Steinberg sign is −1, before the middle-degree sign cancels it.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `EtaleDualityAndPerverseSheaves:EDC.8`, `FunctionFieldArithmetic:FA.6`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Theorem 13.6 and Theorem 14.9, pp. 291,299. Literal excerpt: “Putting together (13.4) and (13.5), we get:” The geometric fixed-point trace is compared with §13’s spectral expression and then specialized to isotypes.

### Pairing dual automorphic isotypes

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing` (lemma).

At finite proper level with dimension d−1, Poincaré duality pairs H^i[Π] with H^{2(d−1)−i}[Π^∨](d−1); equivalently (H^i[Π])^∨≅H^{2(d−1)−i}[Π^∨](d−1), with the dual automorphic multiplicity factor and inverse central character. The Hecke adjoint is the inverse correspondence. There is no identification with the same Π-isotype unless a compatible self-duality is separately specified.

The proof route is:

1. Apply the perfect finite-level pairing and the adjoint correspondence identity.
2. Project onto the two automorphic isotypes, using contragredience on the smooth action and inversion of the central character.
3. Track the grading and twists before forming L-factors.

Acceptance:

- For a non-self-dual rank-one Hecke character the paired component has inverse character.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `WeilConjectures:WC.2`.

Source anchors:

- [Kaiser-erratum](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf), Opening paragraph and Corollary 14.11 correction, p. 1. Literal excerpt: “not selfdual up to some character twist, this is wrong.” The erratum identifies the erroneous self-duality assertion; Π∞° denotes the away-∞ automorphic representation.

### Corrected L-factor duality

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum` (comparison).

Use Kaiser’s correction in Corollary 14.11: replace L_x(V_Π∞^bullet,q_x^{−d}T^{−1}) by L_x((V_Π∞^bullet)^∨,q_x^{−1}T^{−1}) in both statement and proof. Both the dual and the exponent change. The isotypic pairing is the dual-isotype pairing above. Use Lemma 14.14′ and Proposition 14.17′, not their published self-dual hypotheses, in the general proof of 14.12. This packet’s selected generic proof avoids the unpublished invariant-ample-class argument.

The proof route is:

1. Read the published Corollary 14.11 against the erratum.
2. Replace the local factor in both occurrences; pair Π with Π∨ and preserve the chosen graded L-function convention.

Acceptance:

- Changing only V to V∨ while keeping q_x^{-d} is not the correction.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`, `WeilConjectures:WC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`.

Source anchors:

- [Kaiser-erratum](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf), Corollary 14.11 correction, p. 1. Literal excerpt: “in the statement as well as in the proof.” The correction changes the dual representation and q-exponent, not only an informal self-duality warning.

### Corrected graded chain lemma

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma` (lemma).

Let d≥1, m,m′≥0 with m′ dividing m, and let V^bullet be a pure graded Frobenius-semisimple ℓ-adic local Galois representation in the sense of LRS 14.13, degrees 0,…,2d−2. Suppose L_∞(V^bullet,T)/L_∞((V^bullet)^∨,q_∞^{-1}T^{-1}) differs by a nonzero Laurent monomial from ((1−q_∞^{-d}T^{-1})/(1−T))^m, and each L_∞(V^i,T)^{-1} is an m′-th power in 1+TQ̄_ℓ[T]. Then V has a direct summand ⊕_{a∈A}W_a, each W_a=[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m′}, with positive i_j summing to d and m=|A|m′. A term σ⁰(St_i)(−j) lies in degree i+2j−1. Self-duality and integrality are not hypotheses of the amended lemma.

The proof route is:

1. Extract an indecomposable σ⁰(St_i) from the root 1 of the local factor. Purity determines its degree.
2. Use the m′-power condition to extract m′ copies and the ratio to force the next Tate-shifted term.
3. Continue until the positive chain lengths sum to d, take a complement and induct.

Acceptance:

- At d=1 the chain is σ⁰(St₁) in degree 0.
- The conclusion is a direct summand, not that V has no further zero-L-factor summands.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `DeligneWeightsAndPurity:DWP.5`.

Source anchors:

- [Kaiser-erratum](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf), Lemma 14.14′ and its proof, pp. 1–2. Literal excerpt: “We make induction on m.” The amended proof extracts a chain of special representations and inducts on m, without self-duality.

### Corrected automorphic graded chain

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-proposition` (theorem).

For an automorphic Π with Π_∞≅St_d, the finite-dimensional graded isotypic representation of LRS 14.17 satisfies (V_Π∞^bullet)^{Frob-ss}≅[⊕_{j=0}^sσ⁰(St_{i_j})(−i_0−⋯−i_{j−1})]^{m(Π)}, for positive i_j with Σi_j=d. Terms have degree i_j+2(i_0+⋯+i_{j−1})−1. This is the amended Proposition 14.17′; it is a chain conclusion, not yet the one-part middle-degree concentration theorem.

The proof route is:

1. Supply the graded local weight/monodromy and L-factor inputs listed in LRS 14.13–14.17.
2. Apply the amended chain lemma with m′=m(Π) and the dimension constraints.

Acceptance:

- A chain with several positive parts cannot simply be identified with St_d in middle degree.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `DeligneWeightsAndPurity:DWP.5`.

Source anchors:

- [Kaiser-erratum](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf), Proposition 14.17′, p. 1. Literal excerpt: “Assumption as in (14.17) Proposition, but the claim is:” The corrected proposition has a sum of graded special-representation chains.

### Selected global middle cohomology

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology` (theorem).

For Π in the proven transfer image of LRS 15.10–15.11, V_Π^i=0 for i≠d−1, dimV_Π^{d−1}=d and m(Π)=1. At a good o, Frobenius trace is q_o^{r(d−1)/2}Σ_jz_j(Π̃_o)^r. The normalized Σ(Π)=V_Π^{d−1}((d−1)/2) is the selected global Galois representation. The local components of Π̃ at split good places are generic (the independent genericity theorem), so the elementary remark following 14.12, cited explicitly in LRS 15.12, proves concentration using the strict unitary-generic Satake bound and purity. No arbitrary division-algebra isotype concentration is asserted.

The proof route is:

1. Use multiplicity one only for the selected transfer.
2. Import genericity and the strict Satake bound for its split unramified components. Combine the alternating trace and purity to separate the degrees as in the remark to 14.12.
3. Normalize the weight and use Chebotarev to identify the selected global Galois representation.

Acceptance:

- For d=1 the selected representation has degree zero and dimension one.
- Purity alone is not used to deduce arithmetic Frobenius semisimplicity.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`, `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `SmoothRepresentationsOfLocalGroups:SR.3`, `FunctionFieldArithmetic:FA.6`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.4`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Theorem 15.12 and remark, p. 317. Literal excerpt: “which allows us to avoid in our proof” The selected generic route avoids the more subtle proof of general Theorem 14.12.
- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Proposition 10.5, p. 1341. Literal excerpt: “obtenue à partir de π” The proposition explicitly restricts to representations obtained from π via the selected globalization and transfer.

### Local supercuspidal selectors

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector` (construction).

For a supercuspidal irreducible characteristic-zero GL_d(K) representation π with fixed unitary central character and a compact open K₀ fixing a nonzero vector, form a compact-mod-centre matrix-coefficient Hecke test f_π normalized by Schur orthogonality so trπ(f_π)≠0, f_π(1)≠0 and its trace on incompatible supercuspidal representations is zero. Average on both sides over K₀ to make a finite-level selector without changing these nonvanishing properties. The LRS 15.10 construction uses the equivariant map into compact induction, with a nonzero scalar c, and sets f=c^{-1}φ(π(1_{K₀})); it is not an indicator of K₀.

The proof route is:

1. Use compact-mod-centre matrix coefficients and the local Schur-orthogonality normalization.
2. Project to K₀-fixed vectors and scale by the nonzero intertwining scalar.
3. Use the central-character quotient and support to insert the selector in the simple trace formula.

Uses:

- **LRS Lemma 15.10**: Selectors at three prescribed places force the desired local components.
- **Hausberger Theorem 10.4(2)**: The auxiliary split supercuspidal component is retained for transfer.

API:

- `CuspidalSelector` (constructor): The normalized bi-K₀-invariant central-character test.
- `CuspidalSelector.value_one` (characterisation): f_π(1)=c^{-1}dimπ^{K₀}≠0 in the source normalization.
- `CuspidalSelector.trace` (compatibility): trπ(f_π) is nonzero, and incompatible supercuspidal traces vanish.
- `CuspidalSelector.support` (data): Its support is compact modulo the centre.

Unit tests:

- `CuspidalSelector.value_test` (computation): For dimπ^{K₀}=1 and normalization c=1, f_π(1)=1.
- `CuspidalSelector.central_test` (compatibility): Its central translation law is the inverse of the fixed central character in the convolution convention.
- `CuspidalSelector.indicator_test` (non-example): The characteristic function of K₀ acts on every representation with K₀-invariants, whereas f_π kills incompatible supercuspidals.

Acceptance:

- The chosen representation is selected with a nonzero trace.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Proof of Lemma 15.10, pp. 314–315. Literal excerpt: “has the asserted properties.” The normalized compact-induction/matrix-coefficient construction supplies local tests with nonzero value at 1.

## ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic

The D-elliptic chain uses Frobenius on the base S and maps τE_i into E_{i+1}. Its pole and zero quotients have rank d, while each bundle has rank d². Level compatibility is a Frobenius square, not only a bundle trivialization. Special formal O_D-modules give the local deformation space. Uniformization uses D̄’s double-coset data. The ℤ-component construction records all three actions before the analytic quotient spectral sequence and its selected cuspidal degeneration are applied. The independent classical correspondence and local character identity are established without the excursion parameter.

### D-elliptic sheaves

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf` (definition).

With the global order data, D split at a chosen rational ∞, and R the ramification set, a normalized D-elliptic sheaf over S/F_q is a chain of right 𝒟-modules E_i on X×S, locally free of O-rank d², with injections j_i:E_i→E_{i+1} and t_i:τE_i→E_{i+1}, τ=(id_X×Frob_S)^*. The squares commute, E_{i+d}=E_i(∞×S) with the d-fold j map the canonical inclusion, E_i/j_{i−1}E_{i−1}=(Γ_∞)_*A_i and E_i/t_{i−1}(τE_{i−1})=(Γ_z)_*B_i with A_i,B_i locally free of rank d, and z:S→X\({∞}∪R). Require 0≤χ(E_0|X×s)<d. Morphisms are D-linear chain isomorphisms commuting with j,t. This normalization is equivalent to the unnormalized stack modulo index shift.

The proof route is:

1. Use the imported coherent vector-bundle and curve sheaf categories; add the right 𝒟 action and the periodic commuting chain.
2. Impose the pole/zero cokernel conditions and normalized Euler characteristic.
3. For D=M_d(F) use Morita equivalence to the DM.7 elliptic-sheaf construction; do not rebuild its matrix case.

Uses:

- **LRS §§4–6**: The chain defines the moduli functor and its smooth/projective structure.
- **Hausberger §2.2**: Completing at o gives the local divisible/formal module.

API:

- `DEllipticSheaf` (constructor): The periodic chain with the specified j,t maps and cokernels.
- `DEllipticSheaf.zero` (projection): The zero morphism z:S→X\({∞}∪R).
- `DEllipticSheaf.period` (simp): E_{i+d}=E_i(∞×S), compatibly with j and t.
- `DEllipticSheaf.ext` (extensionality): A chain isomorphism commuting with j,t is exactly an isomorphism of D-elliptic sheaves.
- `DEllipticSheaf.pullback` (functoriality): Pullback along S′→S commutes with τ, j,t, zero and the periodicity data.
- `DEllipticSheaf.matrix_case` (equivalence): Morita equivalence identifies D=M_d(F) with rank-d Drinfeld elliptic sheaves of DM.7.

Unit tests:

- `DEllipticSheaf.rank_test` (computation): For d=2 each E_i has O-rank 4, while the pole and zero cokernels have rank 2 on S.
- `DEllipticSheaf.frobenius_test` (non-example): Over S=Spec F_{q²}, τ twists the S coefficients by q-Frobenius and leaves the curve X fixed.
- `DEllipticSheaf.matrix_test` (compatibility): For D=M_d(F), the idempotent Morita functor gives DM.7’s rank-d elliptic sheaf, including j,t and its zero.

Acceptance:

- The zero avoids R and ∞.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `DrinfeldModulesAndTModules:DM.7`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Functor`, `SchemeAndStackFoundations:SF.2/sheaf-algebra`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.3`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Definition 1.1, pp. 1292–1293. Literal excerpt: “pull-back par le Frobenius de S” The Frobenius is on the base S, and the diagram has t from τE_{i−1} to E_i.

### Level structures on D-elliptic sheaves

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure` (definition).

For a nonempty finite closed subscheme I⊂X\{∞} disjoint from z(S), the restrictions E_i|I×S identify via j and are denoted E_I. A level-I structure is a right 𝒟_I-linear trivialization ι:𝒟_I⊗O_S≅E_I satisfying t∘τι=ι under the canonical Frobenius identification of the trivial module. Level restriction for I′⊃I is reduction modulo I.

The proof route is:

1. Use that both pole and zero are disjoint from I to identify all E_i|I.
2. Impose Frobenius compatibility on the right-module trivialization and verify base change/restriction.

Uses:

- **Hausberger Theorem 6.1**: Nonempty level removes the automorphism obstruction to scheme representability.
- **Hausberger Theorem 8.3**: Level at o becomes a Drinfeld-cover level.

API:

- `DEllipticLevel` (constructor): A D_I-linear trivialization satisfying t∘τι=ι.
- `DEllipticLevel.restrict` (functoriality): Reduction along I⊂I′ gives the smaller level, with identity and composition laws.
- `DEllipticLevel.pullback` (functoriality): Base change on S transports the trivialization and the Frobenius square.

Unit tests:

- `DEllipticLevel.frobenius_test` (characterisation): In rank one over a field, replacing a compatible trivialization by a scalar a preserves compatibility exactly when a^q=a.
- `DEllipticLevel.nested_test` (compatibility): For I⊂I′⊂I″, restricting from I″ to I agrees with the two successive restrictions.
- `DEllipticLevel.zero_test` (non-example): If the zero meets I the t map need not be invertible on I, so the level functor’s stated domain excludes that case.

Acceptance:

- A plain bundle trivialization without the t condition is insufficient.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `mathlib:CategoryTheory.Functor`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), §1.3, p. 1293. Literal excerpt: “une structure de niveau I” The Frobenius-compatible trivialization is defined there.

### D-elliptic level moduli

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke` (construction).

For sufficiently small nonempty level I, normalized D-elliptic sheaves with level are represented by E_{X,D,I} over U=X\({∞}∪I∪R), smooth of pure relative dimension d−1 and quasi-projective. If D is division the morphism is projective. The normalization equals LRS’s quotient by the index-shift ℤ. At the distinguished ramified o, levels disjoint from o admit Hausberger 6.4’s projective extension over U∪{o}; levels including o are used only on the generic fibre. The proof uses the chain bundle moduli and the one-step Hecke diagram with Frobenius intersection.

The proof route is:

1. Use the R09 moduli and quotient machinery for the chain data.
2. Apply the smooth Hecke map and Frobenius-transversality to prove relative dimension d−1.
3. Apply boundedness and the division-algebra properness argument; construct the special extension at o with the stated level exclusion.

Uses:

- **Hausberger Theorem 8.1**: The away-o extension has the formal completion used for uniformization.
- **LRS §14**: Smooth proper generic fibres provide finite-level cohomology and purity.

API:

- `DEllipticModuli` (constructor): The representing level scheme over U.
- `DEllipticModuli.points` (universal-property): For S/U its S-points are level D-elliptic sheaves, functorially in S.
- `DEllipticModuli.level_map` (functoriality): Nested levels give the forgetful morphism with identity/composition laws.
- `DEllipticModuli.dimension` (characterisation): The zero morphism is smooth of relative dimension d−1.
- `DEllipticModuli.projective` (compatibility): For division D it is projective; the distinguished-place extension requires I∩{o}=∅.

Unit tests:

- `DEllipticModuli.rank_one_test` (degenerate): At d=1 the zero morphism is smooth of relative dimension 0.
- `DEllipticModuli.shift_test` (compatibility): Choosing χ(E_0) in [0,d) gives the same moduli as dividing the unnormalized chain stack by index shift.
- `DEllipticModuli.level_at_o_test` (non-example): A level including o is not assigned the formal extension asserted for levels away from o.

Acceptance:

- For d=1 the smooth relative dimension is zero.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `mathlib:AlgebraicGeometry.Scheme`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 6.1, proof and Theorem 6.4, pp. 1311–1313. Literal excerpt: “de dimension relative d−1” The moduli theorem and the division/projective extension hypotheses are explicit.
- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Theorems 4.1, 5.1, 6.1, pp. 236,244,246. Literal excerpt: “which is smooth of relative dimension” The stack, level scheme and division properness are separate results.

### Frobenius and Hecke correspondences

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences` (construction).

On the moduli tower the right action of D^×(A_F^∞) is represented by finite-level Hecke correspondences between suitable refinements of levels, not by automorphisms at a fixed arbitrary level. For a good place x and fixed level, geometric Frobenius and the spherical Hecke correspondence commute. The induced left action on cohomology uses pullback/pushforward and the inverse of the right-action convention.

The proof route is:

1. Choose common refined level on which a given adelic element defines the correspondence.
2. Use EDC.8 composition and trace maps and verify independence of the refinement.
3. Track the inversion from right geometric action to left cohomology action.

Uses:

- **LRS Theorem 13.6**: Hecke/Frobenius traces enter the geometric trace identity.
- **Hausberger Corollary 10.7**: The spectral sequence must commute with all level and Hecke actions.

API:

- `DEllipticHecke` (constructor): The finite correspondence at refined levels associated to g∈D^×(A^∞).
- `DEllipticHecke.mul` (compatibility): Composition on the tower is the right group action law; cohomology receives the corresponding left action.
- `DEllipticHecke.frobenius` (compatibility): At good places the Hecke action commutes with geometric Frobenius.
- `DEllipticHecke.level` (functoriality): Transition maps of levels commute with the correspondences.

Unit tests:

- `DEllipticHecke.identity_test` (degenerate): The element 1 gives the identity correspondence at every level.
- `DEllipticHecke.level_test` (characterisation): An element that does not normalize K_I is a correspondence through a refined level, not an automorphism of E_I.
- `DEllipticHecke.right_left_test` (compatibility): The product law of the induced left cohomology action agrees with the inversion convention for the right action.

Acceptance:

- The spherical Hecke normalization at a good place matches LRS 14.9.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `AdelicAlgebraicGroups:AA.1`, `EtaleDualityAndPerverseSheaves:EDC.8`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), §10.1, pp. 1338–1339. Literal excerpt: “une action à droite” The source converts the right tower action to a commuting left cohomology action.

### Special formal O_D-modules

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module` (definition).

Let K=F_q((t)), O=O_K, D_K/K division of invariant 1/d, O_D its maximal order and O_d the integers of the unramified degree-d subfield. Over an O-algebra B on which a power of the uniformizer vanishes, a special formal O_D-module is a smooth formal O-module H with compatible O_D-action for which Lie H is an invertible O_d⊗_O B-module. In the height-d² moduli problem it has O-height d² and dimension d. The tangent condition assigns rank one to each unramified embedding; dimension d alone does not imply it.

The proof route is:

1. Import formal O-module and coordinate-module machinery, in equal characteristic.
2. Add the maximal-order action and the tangent-line condition.

Uses:

- **Hausberger Theorems 3.4,7.2**: Defines the fixed isogeny class and its deformation space.
- **Hausberger §8**: The completed D-elliptic sheaf supplies this local moduli problem.

API:

- `SpecialFormalODModule` (constructor): Formal O-module, O_D-action and invertible O_d⊗B tangent module.
- `SpecialFormalODModule.lie` (projection): The tangent module with its O_d action.
- `SpecialFormalODModule.baseChange` (functoriality): Base change transports the action and tangent invertibility.
- `SpecialFormalODModule.dimension` (characterisation): On a splitting base each tangent eigenspace has rank 1, so total dimension is d.

Unit tests:

- `SpecialFormalODModule.rank_one_test` (degenerate): For d=1 specialness is a one-dimensional formal O-module tangent line.
- `SpecialFormalODModule.eigenspaces_test` (computation): For d=2 on a splitting base the two tangent eigenspaces each have rank one.
- `SpecialFormalODModule.dimension_only_test` (non-example): A two-dimensional tangent module with O₂ acting entirely through one embedding is not special.

Acceptance:

- Over a splitting base there are d one-dimensional tangent eigenspaces.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `HeckeStacksAndLocalShtukas:HS2`, `mathlib:Module.Free`, `mathlib:CommRing`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Definition 3.1, p. 1302. Literal excerpt: “module inversible.” Specialness is the invertibility of the tangent module over O_d⊗B.

### Special-module deformation space

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules` (theorem).

Height-d² special formal O_D-modules over an algebraically closed residue field are O_D-linearly isogenous and End_D⁰(Φ)=M_d(K) for a framing Φ. The functor of pairs (H,ρ), with ρ:Φ→H a height-zero quasi-isogeny modulo the uniformizer, is represented by Ω̂^d⊗̂_OÔ^nr. The GL_d(K) action changes the framing and combines the Drinfeld-space action with Frobenius descent determined by determinant valuation. O_D^× and D_K^× actions require the compatible level/decent data from §7.3; they are not O^nr-linear actions on a single height component.

The proof route is:

1. Use equal-characteristic coordinate/Dieudonné-module classification to identify the framing isogeny class.
2. Apply the formal-moduli representability theorem of Drinfeld/Genestier.
3. Match the framing and semilinear Weil actions; exact source proof expansion remains a geometry gap.

Acceptance:

- At d=1 Ω has dimension zero.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `HeckeStacksAndLocalShtukas:HS2`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorems 3.4,7.2,7.4, §§7.2–7.3, pp. 1303,1317–1319. Literal excerpt: “THÉORÈME 7.2.” This theorem represents the deformation functor; §7.3 specifies the semilinear actions.

### D-elliptic uniformization

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` (theorem).

Take global D with inv_o(D)=1/d, inv_o′(D)=−1/d and inv_∞(D)=0. Let D̄ have inv_o(D̄)=0, inv_∞(D̄)=1/d and the same other invariants. For level I away from ∞,o set Z_I=D̄^×(F)\D̄^×(A^∞)/K_I^{∞,o}, where D̄_o^×≅GL_d(F_o). The formal completion of the extended E_I along o is ((Ω̂^d⊗̂Ô_o^nr)×Z_I)/GL_d(F_o). At level n at o, the generic analytic fibre is (Σ_n^d×Z_{I^o})/GL_d(F_o), with Weil descent (Res′ when viewed over the local field). These identifications commute with level restriction, the away-o Hecke action and D_o^×; no formal model with o-level is asserted by 8.1.

The proof route is:

1. Complete the D-elliptic sheaf at o and separate its special formal module from the global isogeny data.
2. Identify the global isogeny class with the D̄ double-coset space and the local deformation with Ω̂.
3. Quotient by GL_d(F_o), add generic cover levels, and check all descent and Hecke actions.

Acceptance:

- D and D̄ are split at different places.
- The quotient factor has D̄ in it; replacing it by D changes the theorem.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `HeckeStacksAndLocalShtukas:HS2`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorems 8.1,8.3 and §8.1, pp. 1321–1323. Literal excerpt: “THÉORÈME 8.1.” The formal statement uses D̄ and away-o level; Theorem 8.3 adds Drinfeld covers on generic fibres.

### Fundamental local representation

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation` (definition).

For ℓ≠p and the equal-characteristic Drinfeld covers, Res′Σ_n^d=⊔_{r∈ℤ}Σ_n^d⊗_{K̂^nr,ϕ_q^r}K̂^nr with its Weil descent; it is not the ordinary restriction of scalars along the infinite unramified extension. Put U_d^i=colim_nH_c^i((Res′Σ_n^d)_K̄,Q̄_ℓ); the fundamental representation is degree i=d−1. It has commuting GL_d(K), D_K^× and W_K actions. The stabilizer of a component is P_d={(g,b,w):det(g)Nrd(b)Cl(w)^{-1}∈O_K^×}, with Cl(geometric Frobenius)=uniformizer, and U_d^i=c-Ind_{P_d}^{GL_d(K)×D_K^××W_K}colim_nH_c^i(Σ_n^d). For finite-order ξ, U_d^i(ξ) is the largest quotient with central action ξ.

The proof route is:

1. Use the ℤ-indexed components and geometric reciprocity to define the three commuting actions.
2. Take compact-support cohomology and the colimit over cover levels.
3. Compact support gives compact induction from the component stabilizer, with all three valuation terms.

Uses:

- **Hausberger Theorem 9.5**: Its supercuspidal isotypic quotient realizes JL and the Weil parameter.
- **Hausberger Proposition 10.6**: Its finite-level cohomology is the source of the quotient spectral sequence.

API:

- `U` (constructor): The level colimit of compact-support cohomology of Res′Σ in degree i.
- `U.threeActions` (structure): Commuting GL_d(K), D_K^× and continuous Weil actions on compact-open invariants.
- `U.compactInduction` (equivalence): The induction from P_d identifies the component-colimit description with U_d^i.
- `U.centralQuotient` (constructor): For finite-order ξ the maximal quotient on which the GL_d centre acts by ξ.
- `U.level` (functoriality): Finite-level pullback maps define the direct system and commute with the three actions.

Unit tests:

- `U.degree_test` (computation): For d=2 the fundamental representation has degree 1.
- `U.stabilizer_test` (non-example): A g with v(det g)=1 does stabilize a component together with w satisfying v(Cl(w))=1 and b=1; determinant valuation alone is not the stabilizer condition.
- `U.coproduct_test` (characterisation): A class with compact support in Res′ has finite component support; all ℤ-indexed components are present, rather than a product or all unramified Galois automorphisms.

Acceptance:

- The middle degree is d−1.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `mathlib:Representation`, `mathlib:DirectSum`, `mathlib:MonoidHom`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), §§9.2–9.3, Definition 9.3, pp. 1335–1337. Literal excerpt: “Cet espace est trop gros” The ordinary infinite restriction is rejected, and Res′ is explicitly the ℤ-indexed coproduct with the triple-action stabilizer.

### Local cohomology finiteness and continuity

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness` (theorem).

For 0≤j≤2(d−1), finite cover level n gives smooth GL_d(K)×D_K^× action on H_c^j((Res′Σ_n^d)_K̄,Q̄_ℓ), of finite type as a GL_d(K)-module, with continuous Weil action on compact-open invariants. The claim that the full tower quotient U_d^i(ξ) is GL_d(K)-admissible is an additional Boyer/Faltings input in Hausberger 9.4; it is not needed in the proof of the supercuspidal identity and is not deduced from finite type.

The proof route is:

1. Use Berkovich finiteness and the locally finite covering by translates of compact analytic domains.
2. Check stabilizers and compatible descent to obtain smoothness and continuity.

Acceptance:

- Finite type is not synonymous with admissibility.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `SmoothRepresentationsOfLocalGroups:SR.3`, `tauceti:TauCeti.IsSmoothDiscrete`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Proposition 10.6(i) and Proposition 9.4 caveat, pp. 1341,1337. Literal excerpt: “Elle est de type ﬁni” The finiteness statement is at finite cover level; the source separately flags the full GL_d admissibility import.

### Independence of the selected globalization

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence` (theorem).

For a supercuspidal π of GL_d(K) with finite-order central character, restrict Σ(Π) from each selected globalization to W_K. All resulting semisimple local representations are equal up to isomorphism, independent of the global curve, auxiliary places and selected transfer. Their determinants match the central character, contragredients and finite-order twists correspond, and Rankin–Selberg pair L- and ε-factors agree with the Galois tensor-product factors, with the same nontrivial additive character and geometric reciprocity.

The proof route is:

1. Match determinants and twists by the unramified Frobenius data and Chebotarev.
2. Compare global functional equations for selected pairs; control local zeros/poles using purity.
3. Apply the local-constant uniqueness theorem quoted by LRS (Henniart 4.1/4.4/4.5), retaining it as a specific proof/source gap.

Acceptance:

- For d=1 the result is local class field theory.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `FunctionFieldArithmetic:FA.6`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `WeilConjectures:WC.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.4`.

Source anchors:

- [LRS-1993](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Propositions 15.13–15.14, pp. 317–319. Literal excerpt: “The determinant character” The independence proof uses determinant/twisting, global functional equations and pair local factors.

### Independent equal-characteristic classical LLC

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence` (theorem).

The selected construction π↦σ_d(π)=Σ(Π)|W_K gives a bijection between supercuspidal GL_d(K) representations with finite-order central character and irreducible continuous d-dimensional Weil representations with finite-order determinant, preserving central characters, twists, duals and pair local constants. Surjectivity uses Henniart’s numerical local Langlands theorem (LRS 15.17–15.20); it is not obtained from the excursion parameter. Extend to arbitrary central characters and irreducibles through the independently supplied twisting/segment classification. The full Weil–Deligne correspondence is used only through its semisimple Weil restriction in ES7.

The proof route is:

1. Use LRS 15.14 for the injection and local-constant compatibility.
2. Apply the numerical theorem in the exact finite-order/conductor range to obtain surjectivity.
3. Use unramified twists and segment classification with pinned normalization to extend the finite-order supercuspidal correspondence.

Acceptance:

- This proof route has no prerequisite on the excursion comparison or ES7:GLn-comparison.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`, `SmoothRepresentationsOfLocalGroups:SR.3`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.4`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 9.2, pp. 1334–1335. Literal excerpt: “Il existe une famille de bijections” Hausberger restates the independently constructed LRS correspondence with its four characterizing properties.

### Equal-characteristic local transfer identity

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity` (theorem).

For a supercuspidal π of GL_d(K) and JL(π) on the division algebra of invariant 1/d, matching regular elliptic g and h with the same characteristic polynomial satisfy Θ_π(g)=(−1)^{d−1}Θ_{JL(π)}(h). The local JL input is independent of the global Galois construction; use the equal-characteristic local character/transfer theorem as quoted in Hausberger 9.1. Match Haar measures when converting the character identity to test-function/orbital identities. This is the required local identity, not a general nonelliptic transfer formula.

The proof route is:

1. Import the local character distribution machinery.
2. Apply the equal-characteristic local transfer theorem (Badulescu), with the elliptic matching and sign.
3. Use compatible Haar normalizations for the global simple-trace tests.

Acceptance:

- For d=2 the elliptic character sign is −1.
- No number-field global trace theorem is invoked.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.3`, `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.5`, `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 9.1, pp. 1333–1334. Literal excerpt: “Jacquet-Langlands” The local Jacquet–Langlands theorem and its character relation precede the independent LLC statement.

### Hochschild–Serre for the geometric quotient

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre` (theorem).

For the uniformized finite-level quotient and 0≤j≤2(d−1), there is a convergent spectral sequence E₂^{i,j}=Ext^i_{GL_d(K),sm}(H_c^{2(d−1)−j}((Res′Σ_n^d)_K̄,Q̄_ℓ)(d−1),A_{D̄}^{∞,level})⇒H^{i+j}(E_{I,K̄},Q̄_ℓ). A_{D̄}^{∞,level} is the automorphic representation associated with the D̄ double-coset space in uniformization, with trivial ∞ component. The system is compatible with levels, original D away-o and D_o^× actions and W_K. Import the general continuous Hochschild–Serre/derived invariants construction from R02.2; the properly discontinuous analytic quotient, compact-support duality and finite stabilizers are proved for this application here.

The proof route is:

1. Use the formal/analytic uniformization and the D̄ double-coset coefficient space.
2. Apply the general derived construction, after checking discontinuity, stabilizers and the analytic/cohomological comparison.
3. Apply Poincaré duality in dimension d−1; verify transition and three-action equivariance, including transpose-inverse conventions in 10.8.

Acceptance:

- The duality twist is d−1 and compact cohomological degree is 2(d−1)−j.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:CategoryTheory.Preadditive`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Proposition 10.6(ii), Corollary 10.7, Appendix A.12, pp. 1341–1342,1365. Literal excerpt: “suite spectrale” The displayed E₂ page uses compact-support duality and smooth Ext; Appendix A provides the analytic quotient application.

### Cuspidal degeneration of the quotient spectral sequence

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` (theorem).

For a selected global transfer with local π_o supercuspidal, its multiplicity in the E₂^{i,j} page is zero for i>0. Hence the selected cuspidal part degenerates and E₂^{0,j}[Π^{∞,o}]≅(H_o^j)^ss[Π^{∞,o}] with its D_o^× and Weil actions as in Hausberger 10.17. Restrict π_o to GL_d(K)^0={g:v(det g)=0}; its compact matrix coefficients yield an injective object of the smooth characteristic-zero category. Compact induction/Frobenius reciprocity then kills the relevant higher Ext. The finite-type source and finite-level admissibility justify the multiplicity calculation.

The proof route is:

1. Apply Frobenius reciprocity from the component stabilizer to GL_d(K)^0.
2. Use compact matrix coefficients and the SR.3 characteristic-zero finite-representation injectivity theorem.
3. Track subquotient multiplicities across the spectral sequence and use the selected cohomology calculation.

Acceptance:

- This is not full degeneration for arbitrary automorphic constituents.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Module.Projective`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Lemma 10.14, Lemma 10.15, Remark 10.16, Proposition 10.17, pp. 1353–1356. Literal excerpt: “la partie cuspidale de la suite spectrale” The proof uses the restriction to the determinant-unit subgroup and the finite-representation projective/injective argument.

### Drinfeld–Carayol supercuspidal realization

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol` (theorem).

Let ξ:K^×→Q̄_ℓ^× have finite order, and π be supercuspidal of GL_d(K) with central character ξ. Its isotypic quotient in U_d^i(ξ) vanishes for i≠d−1, and Hom_{GL_d(K)}(π,U_d^{d−1}(ξ))≅JL(π)⊗(σ_d(π)⊗|·|^{(1−d)/2}), compatibly with D_K^××W_K. This is the three-action realization. Extension to arbitrary central character requires the twisting comparison; the theorem stated here is precisely the finite-order range of Hausberger 9.5.

The proof route is:

1. Choose the selected globalization and transfer for π.
2. Compare its degree-d−1 isotype with the spectral sequence’s Hom term and selected global σ_d.
3. Pass through the cover/level colimits and finite-order central quotient; use the normalization |·|^{(1−d)/2}.

Acceptance:

- For d=1 the twist is zero.
- The non-supercuspidal Carayol–Harris formula is a conjecture and is not a target.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality/central-characters-and-twisting`.

Source anchors:

- [Hausberger-2005](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Theorem 9.5 and final proof, pp. 1337,1356. Literal excerpt: “THÉORÈME 9.5.” The finite-order central character was fixed immediately before the theorem; the isotype is Hom, not an unexplained subspace.

### Equal-characteristic Hecke-fibre realization

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport` (comparison).

Identify the equal-characteristic special formal O_D-module/Drinfeld covers and the dual local formal O-module spaces with the minuscule local-shtuka Hecke fibres for GL_d. Transport Drinfeld–Carayol’s three-action cohomology and its dual realization through HS3, with matching D^×, GL_d(K), two Weil actions, [d−1] and ((d−1)/2) Satake normalization. The output is exactly the two-operation package σ⊗ρ_π⊗ρ_π^∨ used by the single GLn-comparison trace theorem. The mixed-characteristic p-divisible-group theorem alone does not provide this identification.

The proof route is:

1. Match the equal-characteristic formal-module moduli with local-shtuka fibres using an O-module coordinate functor.
2. Use the three-action realization and its duality to identify both Hecke operations.
3. Check normalizations and export the package to the shared trace theorem. The exact comparison source and second-operation proof require the named transport refinement.

Acceptance:

- All three actions survive the comparison; an isomorphism of underlying spaces alone is insufficient.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.4, p. 338. Literal excerpt: “translation between Hecke operators and local Shimura varieties” This proof needs both Hecke operations. Hausberger supplies the Drinfeld realization; the precise equal-characteristic fibre/dual-tower transport is recorded as a gap, not inferred from FS’s all-E statement.

## ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison

The comparison begins with the two-operation realization, keeping its shifts and both Weil actions. The combined creation/annihilation scalar is fixed at the identity tuple, where the trace is n. Characteristic zero permits cancelling that scalar. Semisimple trace separation and the direct-summand Hecke argument give supercuspidal agreement; segment classification and normalized induction give the all-irreducible statement. The same trace calculation accepts the equal-characteristic package, so it is not reconstructed in that layer.

### Two tower Hecke realization

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation` (theorem).

For E/Q_p, π supercuspidal over Q̄_ℓ, σ=JL(π) on D^× with inv(D)=1/n, and b corresponding to O(−1/n), let B be the b-stratum sheaf of σ. ET.6a supplies the tower cohomology and the tower-diamond/Hecke-fibre comparison (SW20 24.2.5 in its O_E-module form). Then T_std(B) on the trivial stratum is π⊗ρ_π, and the second dual-standard operation returns σ⊗ρ_π^∨. Consequently the two-leg composite restricted to b is σ⊗ρ_π⊗ρ_π^∨ with its two independent Weil actions. The usual [n−1] and ((n−1)/2) are absorbed in Satake normalization.

The proof route is:

1. Import classical LLC/JL and both cohomology computations.
2. Use ET.6a’s comparison downstream of its classical tower and HS2; apply HS3’s Hecke-cohomology interface.
3. Match the Satake shift and Tate twist before composing the two operations.

Acceptance:

- The two Weil factors act on ρ_π and its dual separately.
- For n=1 all shifts and half twists are zero.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS4`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `mathlib:Representation`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.4, p. 338. Literal excerpt: “In total, we see” The following displayed sentence identifies the composite with σ⊗ρπ⊗ρπ*; the tower comparison is an independent import.

### Two-leg excursions compute traces

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace` (theorem).

Over Q̄_ℓ, given either characteristic’s two-operation realization σ⊗ρ⊗ρ^∨ with ρ irreducible of dimension n>0, creation α:σ→σ⊗ρ⊗ρ^∨ and annihilation β in the opposite direction are scalar multiples of coevaluation and evaluation. At (γ₁,γ₂) the excursion scalar is tr(ρ(γ₁γ₂^{-1})). At (1,1) the excursion is dimρ=n, so the product of the two scalars is 1. This identifies the combined scalar, not each scalar separately.

The proof route is:

1. Apply irreducibility/Schur to the two structural maps.
2. Evaluate coevaluation followed by the two Weil actions and evaluation: the dual action introduces γ₂^{-1}.
3. Compare the identity excursion with n; characteristic zero permits cancellation.

Acceptance:

- At (γ,γ) the result is n.
- For n=1 and character χ the result is χ(γ₁)/χ(γ₂).
- No mod-ℓ scalar cancellation is asserted when ℓ divides n.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/excursion-algebra-without-the-coefficient-condition`, `mathlib:Representation`, `mathlib:LinearMap.trace`, `mathlib:Matrix.trace`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.4, p. 338. Literal excerpt: “The scalar of the total composite can” The source determines the composite scalar at the identity tuple.

### Semisimple determination for GL_n

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification` (lemma).

Finite-dimensional semisimple characteristic-zero representations of W_E with equal traces at every element are isomorphic. Apply the finite-dimensional algebra generated by the joint representation inside End(V⊕V′), and its semisimple quotient, to reduce to linear independence of irreducible characters. Continuity is inherited from the two input representations; no finite-group assumption on W_E is made.

The proof route is:

1. Import LP2’s characteristic-zero GL_n trace-separation refinement.
2. Identify the traces from the two-leg identity and apply the refinement to the semisimplifications.

Acceptance:

- A representation with nontrivial unipotent monodromy has the same traces as its semisimplification; N is not determined.

Direct prerequisites: `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`, `LanglandsParameterStacks:LP2:semisimple-characters`, `mathlib:LinearMap.trace`, `mathlib:Representation`, `tauceti:Representation.nonempty_equiv_of_character_eq`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.4, p. 338. Literal excerpt: “and thus the semisimplified representation” FS uses this implication. The pinned finite-group theorem is only a boundary comparison; a general-group proof is requested from LP2.

### Supercuspidal classical agreement

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement` (theorem).

Under the independent realization for either E/Q_p or E of equal characteristic, φ_π≅ρ_π^ss for supercuspidal π. First the two-leg computation identifies the parameter of σ=JL(π) on the basic stratum. Then the π-stratum sheaf is a direct summand of T_std(B) after forgetting the Weil action. Hecke compatibility of excursion operators transports the same parameter to π.

The proof route is:

1. Use trace determination for the basic-stratum parameter.
2. Forget the Weil multiplicity factor, select a nonzero summand and apply Hecke/excursion commutation.

Acceptance:

- Selecting π requires forgetting the Weil action; no invariant vector of irreducible ρ_π is presumed.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS4/monoidal-and-finite-set-functoriality`, `VStackSheavesAndLisseCategories:VS4`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of IX.7.4, p. 338. Literal excerpt: “after forgetting the WE -action” The direct-summand argument follows the scalar computation.

### Classical agreement for every irreducible

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations` (theorem).

For every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter equals the semisimplification of its independent classical Weil–Deligne parameter. Use supercuspidal support and the segment classification, normalized-induction compatibility and classical LLC’s segment/direct-sum rule. This is agreement of the semisimple Weil parameter; it does not identify the nilpotent monodromy operator.

The proof route is:

1. Import the Q̄_ℓ segment and supercuspidal-support statements for GL_n, with normalized induction conventions.
2. Compute the classical semisimple parameter on each segment and its inducing supercuspidal twists.
3. Apply the parabolic theorem to every irreducible subquotient.

Acceptance:

- The trivial representation and Steinberg representation have the same semisimple diagonal parameter although their N differ.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem IX.7.4, p. 338. Literal excerpt: “Let π be any irreducible smooth” The theorem quantifies over all irreducibles; the proof reduces by IX.7.3.

### Classical Bernstein-centre comparison

Declaration: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/classical-centre-agreement` (comparison).

For GL_n/Q̄_ℓ the spectral-to-Bernstein map has the same evaluation on every irreducible as the usual classical parameter map. With the characteristic-zero Bernstein-centre separation statement this identifies the maps. The universal Ψ_GL_n over Z_ℓ[√q] also exists as a map to the integral Bernstein centre. This integral existence is not an assertion that integral or mod-ℓ representations have a full classical Weil–Deligne correspondence.

The proof route is:

1. Evaluate on irreducibles using the comparison theorem and use the supplied centre separation theorem.
2. For the integral map use the integral spectral-to-geometric map and the Λ-linear centre construction; do not infer a stronger integral LLC.

Acceptance:

- The integral output is a ring map to a centre, not a reconstructed nilpotent monodromy operator.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), After IX.7.4, p. 338. Literal excerpt: “to the integral Bernstein center” FS records the characteristic-zero agreement and its integral centre refinement.

## ExcursionOperatorsAndSpectralAction:ES7

The root stage assembles the two independent realization routes with the shared trace and induction arguments. It expresses the all-local-field theorem while retaining every unresolved realization or supplier input. Its status follows the full target inventory, not merely the existence of FS’s all-E theorem statement.

### Classical agreement over every local field

Declaration: `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field` (theorem).

For every nonarchimedean local field E with residue characteristic p, ℓ≠p, and every irreducible smooth Q̄_ℓ-representation π of GL_n(E), the excursion parameter is the semisimplified classical parameter. The proof has two independent realization inputs: ET.6/6a in characteristic zero and the D-elliptic/selected-function-field route in equal characteristic. Both feed the same two-leg trace argument and normalized-induction extension. This completed target inventory is a plan with explicit proof and supplier gaps; it is not a claim that either geometric realization is already formalized.

The proof route is:

1. Split by characteristic of E.
2. Supply the corresponding two-operation realization, run the shared trace argument, then extend by normalized parabolic induction.

Acceptance:

- No claim of integral/mod-ℓ full LLC agreement or recovery of N.

Direct prerequisites: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`.

Source anchors:

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem IX.7.4, p. 338. Literal excerpt: “agrees with the usual (semisimplified) L-parameter.” The source theorem is the target over all E; its two independent proof inputs are separated in this packet.

## Kaiser correction and source error record

The published LRS scan is used together with the two-page author-hosted erratum. The self-duality assertion in §14.16 is not used. Poincaré duality acts on total cohomology and exchanges contragredient Hecke isotypes; a non-self-dual automorphic character provides an immediate distinguishing case. Corollary 14.11 changes the second local factor to the graded dual evaluated at q_x^{-1}T^{-1}. Keeping q_x^{-d} while adding a dual does not make the stated correction.

The corrected Lemma 14.14′ produces a direct summand made of positive-length special-representation chains. The amended Proposition 14.17′ gives a chain description of the automorphic graded representation. Neither conclusion alone is middle-degree concentration. The local realization uses the selected generic globalizations of §15.12 and its explicit appeal to the elementary remark after §14.12. This avoids treating the unpublished invariant ample class discussion of §14.19 as a supplied proof. The full general graded proof still has its source and local-weight refinements listed as gaps.

The packet’s source issue E1 is a known published error corrected by Kaiser. The inverse-cocharacter, negative-shift, outside-S, Res′ and D̄ corrections concern the inherited blueprint, not new mistakes attributed to the papers. The source-version ledger identifies the journal scan and erratum by URL, hash and access date.

## Pinned baseline boundaries

Mathlib is read at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. The reviewed AUDIT-20 records were consulted before adding targets. No audit target already supplied in the stated generality is reconstructed. The declarations below were inspected at those pins, including their standing parameters. The index served discovery, rather than evidence of the statement.

- `mathlib:Representation`, `Mathlib/RepresentationTheory/Basic.lean`: The abbreviation G→* (V→ₗ[R]V), with algebraic action laws; smoothness, admissibility and Weil continuity are additional supplier data.
- `mathlib:MonoidHom`, `Mathlib/Algebra/Group/Hom/Defs.lean`: Bundled monoid/group homomorphisms. Degree and inclusion are homomorphisms; a nontrivial-action 1-cocycle itself is not a group homomorphism.
- `mathlib:RootPairing`, `Mathlib/LinearAlgebra/RootSystem/Defs.lean`: Root pairing data; it does not construct a pinned dual algebraic group or its Weil action.
- `mathlib:Subgroup`, `Mathlib/Algebra/Group/Subgroup/Defs.lean`: Algebraic subgroups. Compactness, openness and the parabolic algebraic-group interpretation require additional data.
- `mathlib:MonoidAlgebra`, `Mathlib/Algebra/MonoidAlgebra/Defs.lean`: Finite-support algebraic convolution on a monoid; it is not the locally profinite Hecke algebra or its completed inverse-limit centre.
- `mathlib:Module.End`, `Mathlib/Algebra/Module/LinearMap/End.lean`: The linear endomorphism type M→ₗ[R]M and its composition ring.
- `mathlib:CommRing`, `Mathlib/Algebra/Ring/Defs.lean`: Commutative ring structure used for coefficient and central rings.
- `mathlib:CategoryTheory.Adjunction`, `Mathlib/CategoryTheory/Adjunction/Basic.lean`: Adjunctions of ordinary categories; this alone does not supply stable/lisse infinity-categories.
- `mathlib:CategoryTheory.MonoidalCategory`, `Mathlib/CategoryTheory/Monoidal/Category.lean`: Ordinary monoidal-category coherence, used as a boundary for Satake/fusion interfaces.
- `mathlib:CategoryTheory.Functor`, `Mathlib/CategoryTheory/Functor/Basic.lean`: Ordinary functors, used for the algebraic moduli functor; no representability follows automatically.
- `mathlib:CategoryTheory.Preadditive`, `Mathlib/CategoryTheory/Preadditive/Basic.lean`: Preadditive categories; smooth Ext and derived spectral sequences require further constructions.
- `mathlib:DirectSum`, `Mathlib/Algebra/DirectSum/Basic.lean`: Algebraic finite-support direct sums, appropriate to the component-indexed cohomology description.
- `mathlib:LinearMap.trace`, `Mathlib/LinearAlgebra/Trace.lean`: Algebraic trace of a linear endomorphism (finite free specialization used here); no infinite-dimensional automorphic trace is inferred.
- `mathlib:Module.Free`, `Mathlib/LinearAlgebra/FreeModule/Basic.lean`: Free modules over a ring. Scheme-local freeness and coherent sheaves require the geometric supplier.
- `mathlib:Module.Projective`, `Mathlib/Algebra/Module/Projective.lean`: Projective modules over a ring; it does not prove projectivity/injectivity in the smooth-representation category.
- `mathlib:AlgebraicGeometry.Scheme`, `Mathlib/AlgebraicGeometry/Scheme.lean`: The native scheme carrier. Formal schemes, diamonds, moduli representability and étale cohomology are not supplied by this definition.
- `mathlib:MeasureTheory.Measure.modularCharacter`, `Mathlib/MeasureTheory/Group/ModularCharacter.lean`: Locally compact group modular character valued in ℝ≥0; compare its right-translation convention before identifying the parabolic modulus. It supplies no normalized-induction functor.
- `tauceti:TauCeti.Cocharacter.parabolic`, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`: The dynamic parabolic attached to a cocharacter in the Hopf-algebra/WithConv formulation, with its stated group-scheme assumptions.
- `tauceti:TauCeti.Cocharacter.levi`, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`: The dynamic Levi attached to that cocharacter; it is not already the dual pinned Levi or a constant-term functor.
- `tauceti:TauCeti.IsSmoothDiscrete`, `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`: For a TopRep, discrete topology on the underlying module and open stabilizers. It does not encode continuous ℓ-adic Weil action.
- `tauceti:Representation.nonempty_equiv_of_character_eq`, `TauCeti/RepresentationTheory/CharacterTable/Determined.lean`: Equal-character isomorphism for FINITE G over a characteristic-zero field with finite-dimensional representations. This is not the Weil-group theorem.
- `mathlib:MulAut`, `Mathlib/Algebra/Group/End.lean`: Multiplicative automorphisms M≃*M; bundled group actions used to state the twisted cocycle identity.
- `mathlib:Matrix.trace`, `Mathlib/LinearAlgebra/Matrix/Trace.lean`: For a finite index type, the sum of matrix diagonal entries; this is the finite-dimensional basis form of the two-leg evaluation computation.

## Suggested signatures and their limits

The suggested file elaborates with only the expected placeholder-proof warnings. It imports individual Mathlib modules and defines the algebraic composites Ψ_G and Ψ_G^b after the supplier maps are supplied. The twisted inclusion is a genuine function involving integer degree, a group inclusion and a twist element. Its cocycle signature quantifies fixed group actions and requires equivariance, invariance and centrality. Its basic, inertia and GL₂ tests distinguish forgetting or inverting the twist. The matrix trace signatures model the finite-dimensional coevaluation/evaluation computation and the identity scalar. These signatures do not assert geometric formalization.

The file’s named omission ledger records every mathematical declaration/API/test that needs a native carrier absent at the pins. In particular the complete geometric stratum construction and embedding independence, D-elliptic chains and levels, special formal modules, Hecke moduli and correspondences, the fundamental representation, EP functions and selector distributions cannot be simulated by anonymous propositions. Their exact specifications are given above. The prototype gap applies until the native supplier types exist. Compilation checks the expressible algebraic signatures, rather than closing these mathematical gaps. The shared build used pinned Mathlib; the file imports no Tau Ceti module, so its Tau Ceti baseline citations are verified by source inspection rather than this elaboration.

## Supplier requests

Every request below names precisely the consuming nodes. Exact supplier-node imports have no duplicated request. Requests are specifications in this packet; no messages or edits to another worker’s files were made.

### AdelicAlgebraicGroups:AA.1

Function-field extension of adelic-point/restricted-product and diagonal-embedding comparison for D^×. The existing AA.1/restricted-product-comparison node assumes a NUMBER FIELD and is not an exact function-field supplier; a field-general extension must be proved. RT-AREA-geomlanglands/12.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`.

### AlgebraicModuliForArithmeticGeometry:R09.2

Relative Quot/Hom/Isom spaces with fixed Hilbert polynomials for the periodic chain-bundle and Hecke parameter spaces, with the exact projective-base hypotheses.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`.

### AlgebraicModuliForArithmeticGeometry:R09.4

Stack/groupoid machinery and explicit algebraic atlases for the chain moduli problem; D-elliptic conditions themselves are constructed only in ES7.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`.

### AlgebraicModuliForArithmeticGeometry:R09.5

Quotient by index shift and level rigidification through the supplied presentation, respecting automorphism removal and fine versus coarse representability.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`.

### AlgebraicModuliForArithmeticGeometry:R09.6

Formal deformation, completion and algebraization carrier/universal properties. The special O_D-module deformation theorem and D-elliptic uniformization are additional ES7 statements, not inferred from a generic representability slogan.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`.

### ArithmeticGaloisDuality:R02.2

General continuous/derived Hochschild–Serre double-complex machinery. Existing R02.2/hochschild-serre-spectral-sequence is for profinite groups and discrete modules; it is not the analytic locally profinite quotient theorem. Supply the general derived extension, with the analytic quotient application and compact duality proved here.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`.

### AutomorphicSpectralTheory:AS.0

Only abstract functional analysis for a unitary action on the compact D central quotient, with discrete Hilbert sum/finite multiplicities and smooth restricted-tensor-product factorization; no number-field automorphic realization is imported.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`.

### BunGAndNewtonStrata:BG0

Hecke equivariance of the existing pure-inner-twisting node BunGAndNewtonStrata:BG0/pure-inner-twisting (FS III.4.3). The plain equivalence is cited by node; this stronger equivariance is needed for the basic reduction. RT-AREA-geomlanglands/11.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.

### BunGAndNewtonStrata:BG1

Canonical parabolic/Levi and invariants of bμ(π)^N; additionally, for connected Z(G), surjectivity B(G)_bas→H¹(E,G_ad), derived by applying Kottwitz Proposition 10.4 to G→G_ad and proving the identification of basic adjoint classes with inner forms. Proposition 10.4 itself is a central-extension B-map statement. RT-AREA-geomlanglands/11.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`.

### BunGAndNewtonStrata:BG2

Bun_G as a stack with change-of-group and torus quotient maps, sufficient to form the fibre over the trivial C-bundle in the z-embedding reduction. The actual fibre identification is proved in the ES7 reduction node.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.

### BunGAndNewtonStrata:BG4

HN strata and quantitative bounded-modification estimates: for each fixed bounded Hecke type V and b_N increasingly unstable in a fixed canonical parabolic, eventually every self-modification preserves that reduction.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`.

### DeligneWeightsAndPurity:DWP.5

Weil II 1.8.4 local weights for pure sheaves on an open function-field curve, monodromy-graded weights, duals and twists. DWP.8 is geometric semisimplicity, and DWP.9 hard Lefschetz; neither is substituted for this local theorem.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-proposition`.

### DrinfeldModulesAndTModules:DM.7

The matrix-algebra elliptic-sheaf construction and its chain/moduli conventions, and an explicit Morita interface to the general right-𝒟 formulation. This stage is only the split matrix case; D-division geometry is owned here.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.6

Independent classical characteristic-zero LLC and local JL for GL_n(E), including Q̄_ℓ coefficient transport, normalized induction and segment compatibility. It is not the supplier of the equal-characteristic D-elliptic route.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.6a

Two-tower cohomological realization and, downstream of HS2 and the independent classical tower, SW20 Theorem 24.2.5 in the O_E-module form: tower diamond ≅ minuscule Hecke fibre, with levels and actions. Export this to ES7:GLn-comparison. No ET.6a→HS2 edge and no reliance on HS2’s examples to prove the classical identity. The O_E extension is a precise additional proof obligation. RT-AREA-geomlanglands/2.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`.

### EtaleDualityAndPerverseSheaves:EDC.2

Finite-level étale cohomology and dimension-(d−1) Poincaré duality, plus the properly supported analytic comparison needed for Res′Σ and the geometric quotient spectral sequence.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`.

### EtaleDualityAndPerverseSheaves:EDC.8

Hecke correspondence composition, adjoints, trace classes, and the dual-isotypic Frobenius/L-factor interface. Geometric fixed-point isolation and the LRS specialization remain ES7 proof obligations.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`.

### ExcursionOperatorsAndSpectralAction:ES6:functoriality

Strengthen the existing z-embedding node to all conditions of Kaletha Definition 5.1: quotient C torus, H¹(E,C)=1 and the H¹ map on centres bijective, plus connected target centre and Fact 5.5’s central rational-point surjectivity. Establish the equal-characteristic extension since the consulted Kaletha paper has p-adic standing hypotheses.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.

### FunctionFieldArithmetic:FA.2

Function-field completions, restricted products, diagonal topology, degree lattice and compact degree-zero idele class group. None is redefined here.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`.

### FunctionFieldArithmetic:FA.4

Local/global function-field reciprocity and the geometric-Frobenius inversion convention, with central-character/determinant correspondence and finite-order twists.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`.

### FunctionFieldArithmetic:FA.5

Function-field Chebotarev density (with constant-field issues accounted for), feeding the general-profinite recognition variant of the imported ArithmeticGaloisRepresentations R01.5 node.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`.

### FunctionFieldArithmetic:FA.6

Function-field adelic central-character quotient, compatible automorphic levels, cuspidal finite-dimensionality and the generic reduction theory used to specialize compactness to PGL₁(D). No AF.2–3 or AS.6 number-field automorphic theorem is used.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`.

### GeometricSatakeAndFusion:GS4:integral-dual-group

The dual Levi and pinned Weil actions, Weil-invariant difference 2ρ_Ĝ−2ρ_M̂ central in the dual Levi, and the constant-term/restriction comparison with its degree shift and cyclotomic twist. Include the root/modulus normalization that identifies δ_P^{1/2} with the inverse twisting cocycle.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`.

### HeckeStacksAndLocalShtukas:HS2

The general bounded modification/Hecke-fibre construction. For the equal-characteristic consumers, provide the O_K-formal-module/local-shtuka carrier and deformation interface; existing packet HS2/local-shtuka-moduli is mixed characteristic and HS2/hecke-fibre-description only Q_p. ET.6a, not HS2, owns the characteristic-zero classical tower identity downstream of both constructions.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`.

### HeckeStacksAndLocalShtukas:HS3

The Hecke/compact-cohomology and dual-adjunction interface. Existing packet statements are based at Q_p; give the restriction-of-scalars O_E variant for characteristic zero, and the separately proved equal-characteristic variant for the D-elliptic transport. Do not assume a tower identity from the generic HS3 interface.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`.

### LanglandsParameterStacks:LP2:semisimple-characters

The characteristic-zero GL_n refinement: equality of traces of every group element determines a finite-dimensional semisimple representation of W_E. Use the finite-dimensional image algebra proof (or the exact GL_n character separation), not the pinned finite-group theorem for an infinite Weil group.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`.

### ReductiveGroupsPartII:RG2.0

Locally compact topologies on rational points and compact open units of integral matrix/maximal-order models.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`.

### ReductiveGroupsPartII:RG2.2

The GL_d building, facets, facet normalizers, vertex permutation orientation and Euler-characteristic calculations used by LRS 13.1–13.2.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`.

### ReductiveGroupsPartII:RG2.3

Parahoric pointwise fixers and congruence subgroups for building facets; distinguish them from full facet normalizers in the EP sum.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`.

### ReductiveGroupsPartII:RG2.5

Pinned dual groups, L-group Levi maps and Galois-equivariant root data; they are additional to the baseline RootPairing type.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`.

### SchemeAndStackFoundations:SF.0

The native quasi-coherent/locally free sheaf operations, base change, rank and Frobenius pullback for vector bundles on X×S. Scheme itself already exists at the pins; no second scheme carrier is planned.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`.

### SchemeAndStackFoundations:SF.3

Curve divisors, Euler characteristic/Riemann–Roch and line-bundle twists, needed for D-elliptic periodicity and index-shift normalization.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`.

### SmoothRepresentationsOfLocalGroups:SR.0

The abelian/derived smooth-action category and its locally profinite functoriality, separating the smooth local-group factors from ℓ-adic Weil continuity.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`.

### SmoothRepresentationsOfLocalGroups:SR.1

For Z_ℓ[√q]-algebras Λ with invertible pro-orders, the Λ-linear centre π₀End(id_Dsmooth), its cofinal pro-p corner description lim_K Z(e_KH_Λe_K), and ℓ-adic separatedness for Λ=Z_ℓ[√q]. Also characteristic-zero Bernstein-centre separation by irreducible evaluations. SR.0 supplies the category; SR.3’s complex centre is not the integral construction. RT-AREA-geomlanglands/9.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/classical-centre-agreement`.

### SmoothRepresentationsOfLocalGroups:SR.2

Smooth/compact induction, correct adjunctions and normalized parabolic induction i_Pτ=Ind_P(δ_P^{1/2}τ), with δ_P(m)=|det Ad(m)|Lie U_P|. Supply the coefficient and contragredient regimes needed here; these conventions belong to SR.2, not SR.1.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`.

### SmoothRepresentationsOfLocalGroups:SR.3

Extend the stated complex results through finite coefficient fields to Q̄_ℓ: supercuspidal support and GL_n segment classification, compact matrix coefficients, finite-representation projectivity/injectivity on GL_d(K)^0, local character distributions and the strict unitary-generic Satake bound. Each requires a source-qualified coefficient comparison; complex-only results are not silently applied over Q̄_ℓ.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

### VStackSheavesAndLisseCategories:VS1

Six-operation base change and cohomological smoothness for the stratum/constant-term diagram, with the ULA and support hypotheses allowing the indicated shriek maps.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`.

### VStackSheavesAndLisseCategories:VS3

Compact objects and Ind-lisse categories, with the coefficient reduction to torsion identifying the relevant étale computations; no unrestricted lisse shriek functor is assumed.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`.

### VStackSheavesAndLisseCategories:VS4

Fully faithful embeddings of D(G_b(E),Λ) into D_lis(Bun_G,Λ), left adjoints to stratum pullback and the trivial-stratum j_!; their restriction on centres is embedding independent in the specified sense.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`.

### WeilConjectures:WC.2

The actual graded duality determinant/functional-equation identity, specialized to the dual automorphic isotype and its inverse character. This is not a local-weight theorem or a proof of Galois Frobenius semisimplicity.

Consumes: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`.

## Proof and signature gaps

### Root/modulus convention comparison

`ExcursionOperatorsAndSpectralAction:ES7/gap/normalization`. The GL₂ calculation fixes the signs, but the full nonsplit/relative-root proof matching SR.2 modulus, Satake Weil action and geometric reciprocity needs a source-qualified expansion. Mathlib’s group modular character is not itself this theorem.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`.

### Equal-characteristic z-embedding reduction

`ExcursionOperatorsAndSpectralAction:ES7/gap/z-embedding`. Kaletha’s consulted publisher text has a p-adic standing field. Extend Definition 5.1/Fact 5.5’s cohomological construction and central surjectivity to equal characteristic, or obtain a primary source that does so; then prove the Bun fibre identity, B-injectivity and centre detection exactly as in FS. Kottwitz’s B(G_ad)-to-H¹ bridge is a BG1 request.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`.

### Quantitative modification and constant-term closure

`ExcursionOperatorsAndSpectralAction:ES7/gap/HN`. Expand the BG4 bounded-modification estimate and verify every arrow/support hypothesis of the P/Levi constant-term diagram. For IX.7.3 the Hodge–Newton modification calculation referenced as GI16 Theorem 4.26 remains to be read. Keep b=μ(π^{-1}), T_{μ^{-1}} and (−d/2)[−d].

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`.

### O_E classical tower diamond comparison

`ExcursionOperatorsAndSpectralAction:ES7/gap/mixed-tower`. SW20 24.2.5’s printed theorem is the p-divisible/Q_p construction. ET.6a must prove its O_E-module variant with levels, actions and Satake shifts for E≠Q_p. The full classical tower realization is imported, not source-expanded in ES7.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`.

### Infinite-group semisimple trace separation

`ExcursionOperatorsAndSpectralAction:ES7/gap/trace`. The finite-dimensional image-algebra argument needs the exact LP2 trace-separation refinement. The existing character-bijection is not by itself a stated one-leg trace theorem, and the pinned Tau Ceti theorem requires a finite group.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/trace-determines-semisimplification`.

### Order existence and division compactness proof

`ExcursionOperatorsAndSpectralAction:ES7/gap/orders`. Hausberger fixes the global maximal-order sheaf rather than proving its existence. Read the global-order gluing and function-field anisotropic reduction proofs and specialize them to PGL₁(D). Then expand finite-level kernel local finiteness/integrability and the restricted-tensor-product coefficient descent. AA.1’s current exact node is number-field only.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/division-quotient-compactness`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/discrete-spectrum`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kernel-trace-identity`.

### Building EP orbital/character proof sources

`ExcursionOperatorsAndSpectralAction:ES7/gap/EP`. LRS 13.2 states the formulas and cites Laumon §5 and Kottwitz Theorem 2′; those primary proofs have not been acquired. Verify the characteristic-p applicability and facet-normalizer orientations from those proofs. Expand the Schur-orthogonality/compact-induction selector normalization used in 15.10.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-orbital-integrals`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-character-traces`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

### Simple trace formula and selected transfer proofs

`ExcursionOperatorsAndSpectralAction:ES7/gap/simple-transfer`. Read the precise Deligne–Kazhdan simple trace formula and Henniart appendix A.4 cited by LRS 15.10–15.11, and the germ-expansion/weak-approximation proof inputs. Keep a supercuspidal auxiliary place outside ramified S. No general global JL or arbitrary-isotype multiplicity-one claim fills this gap.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/simple-trace-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`.

### D-elliptic moduli proof expansion

`ExcursionOperatorsAndSpectralAction:ES7/gap/moduli`. The target-level definitions, smoothness/dimension, level rigidification and division properness are sourced, but complete Quot/Hecke transversality and boundary properness proofs of LRS §§4–6 require lemma-level expansion. The DM.7 Morita equivalence and the right-action/cohomological-left-action conventions require explicit proofs.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`.

### Equal-characteristic formal-module and uniformization proof

`ExcursionOperatorsAndSpectralAction:ES7/gap/local-geometry`. Acquire Genestier or Boutot–Carayol/Drinfeld’s precise special formal O_D-module representability proof and expand Hausberger’s coordinate/Dieudonné modules, global isogeny classification and analytic comparisons. The statement’s D̄ and away-o level conditions are already fixed; no formal model at o-level is assumed.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-cohomology-finiteness`.

### Corrected graded local chain proof closure

`ExcursionOperatorsAndSpectralAction:ES7/gap/weights`. Kaiser’s two pages have been read in full. Connect the amended lemma to the imported Weil–Deligne carrier with geometric Frobenius and DWP.5 local weight theorem; verify the reciprocal L-factor grading and multiplicity-power conditions. For selected concentration expand the independent global genericity/strict Satake bound. Do not use the source’s unpublished invariant ample class argument.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/dual-isotypic-pairing`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-lemma`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-graded-chain-proposition`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/geometric-automorphic-trace`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/selected-isotypic-cohomology`.

### Independent local correspondence and constants

`ExcursionOperatorsAndSpectralAction:ES7/gap/classical-local`. Theorem-level LRS 15.10–15.17 and Hausberger 9.1–9.2 are read. Henniart’s local-constant uniqueness and numerical theorem, LRS 15.18–15.20’s numerical proof and Badulescu’s local character proof remain to be acquired/expanded. The construction stays independent of the excursion parameter.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-correspondence-independence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/classical-local-correspondence`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/local-character-identity`.

### Analytic quotient spectral sequence and Ext degeneration

`ExcursionOperatorsAndSpectralAction:ES7/gap/analytic-HS`. The profinite discrete-module R02.2 node is insufficient for the locally profinite analytic quotient. Supply the general derived machinery and prove the properly discontinuous Berkovich quotient application using Hausberger Appendix A.12. Expand finite-type/admissibility and the characteristic-zero injective finite-representation proof on GL_d(K)^0; generic module projectivity at the pins is insufficient.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-hochschild-serre`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol`.

### Equal-characteristic transport and second operation

`ExcursionOperatorsAndSpectralAction:ES7/gap/equal-transport`. Hausberger proves the Drinfeld supercuspidal realization, but the exact action-preserving identification with equal-characteristic Hecke fibres and the dual/Lubin–Tate operation need an independently read comparison source. The present HS2/HS3 packet uses mixed characteristic/Q_p. The all-E assertion of FS IX.7.4 is not a proof of these missing interfaces.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hecke-fibre-transport`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations`, `ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field`.

### Native signatures missing for geometric and smooth objects

`ExcursionOperatorsAndSpectralAction:ES7/gap/prototypes`. The suggested Lean file prototypes only expressible algebra: ring-map composition and the twisted cocycle formula with fixed group actions, plus normalization and trace tests. Native ℓ-linear smooth derived centres, periodic right-algebra vector-bundle chains, formal O_D-modules, Hecke moduli, analytic compact-support cohomology and building EP functions are absent at the pins. Every omitted declaration/API/test is named explicitly in its omission ledger, without Prop-valued stand-ins. Expand signatures when these imported carriers exist; compilation of algebra does not imply geometric formalization.

Needed by: `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/maximal-orders`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/euler-poincare-function`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/level-structure`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-module`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/cuspidal-local-selector`.

## Coverage and planets

### ExcursionOperatorsAndSpectralAction:ES7

Status: **planned**. Every target has a node and a prerequisite chain terminating in a pinned declaration, a supplier node/stage request, or a named gap. Remaining closure work:

- equal-transport: Equal-characteristic transport and second operation

Planets: Classical agreement over local fields.

### ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison

Status: **planned**. Every target has a node and a prerequisite chain terminating in a pinned declaration, a supplier node/stage request, or a named gap. Remaining closure work:

- mixed-tower: O_E classical tower diamond comparison
- trace: Infinite-group semisimple trace separation
- equal-transport: Equal-characteristic transport and second operation

Planets: Two tower realization, Two-leg excursion trace, Classical GLn agreement.

### ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic

Status: **planned**. Every target has a node and a prerequisite chain terminating in a pinned declaration, a supplier node/stage request, or a named gap. Remaining closure work:

- moduli: D-elliptic moduli proof expansion
- local-geometry: Equal-characteristic formal-module and uniformization proof
- classical-local: Independent local correspondence and constants
- analytic-HS: Analytic quotient spectral sequence and Ext degeneration
- equal-transport: Equal-characteristic transport and second operation
- prototypes: Native signatures missing for geometric and smooth objects

Planets: D-elliptic sheaves, D-elliptic level moduli, Special formal modules, D-elliptic uniformization, Fundamental local representation, Drinfeld–Carayol theorem.

### ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic

Status: **planned**. Every target has a node and a prerequisite chain terminating in a pinned declaration, a supplier node/stage request, or a named gap. Remaining closure work:

- orders: Order existence and division compactness proof
- EP: Building EP orbital/character proof sources
- simple-transfer: Simple trace formula and selected transfer proofs
- weights: Corrected graded local chain proof closure
- prototypes: Native signatures missing for geometric and smooth objects

Planets: Maximal orders of the division algebra, Compact division-algebra quotient, Kernel trace formula, Euler–Poincaré function, Simple trace comparison, Cuspidal globalization.

### ExcursionOperatorsAndSpectralAction:ES7:parabolic

Status: **planned**. Every target has a node and a prerequisite chain terminating in a pinned declaration, a supplier node/stage request, or a named gap. Remaining closure work:

- normalization: Root/modulus convention comparison
- z-embedding: Equal-characteristic z-embedding reduction
- HN: Quantitative modification and constant-term closure
- prototypes: Native signatures missing for geometric and smooth objects

Planets: Bernstein stratum maps, Twisted Levi inclusion, Parabolic stratum factorization, Parabolic induction compatibility, Normalized induction dictionary.

## Sources actually consulted

### FS-geometrization

[Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Laurent Fargues; Peter Scholze. Author-hosted 356-page PDF; printed page equals PDF page. Version is identified by this hash, without asserting byte identity with an arXiv version. Accessed 2026-10-07. SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

- IX.7, pp. 334–338, read in full, including all four proofs/formulas, coefficient and z-embedding reductions and the two-leg trace calculation.
- VI.11 duality, pp. 235–239, and VI.12, p. 239: passages used for the dual-Levi/cyclotomic conventions. The remaining general Satake proof is imported from GS4.
- IX.3/IX.5/IX.6 statements and source locators inspected through the existing HS and ES supplier packets; these sections are not claimed read in full in this run.

### Hausberger-2005

[Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf), Thomas Hausberger. Ann. Inst. Fourier 55(4) (2005), 1285–1371; journal PDF with cover. French text layer. Accessed 2026-10-07. SHA-256: `d51dc22168dcd4831726197b1cef252ea784cc9abbce4cf521465423638daf48`.

- §§1.1–1.3, pp. 1291–1293: order data, Definition 1.1, normalization/index shift and level structures.
- §3.1, Definition 3.1 and Theorem 3.4, pp. 1302–1304: definition and isogeny classification; the source itself refers out for complete coordinate-module proofs.
- Theorems 6.1/6.4, pp. 1311–1313, §7.2–7.3, pp. 1317–1319, and Theorems 8.1/8.3 with the D̄ double coset setup, pp. 1321–1323: statements and adjacent proof discussion read. The full uniformization proof is not claimed expanded.
- §§9.1–9.3, pp. 1333–1338: local transfer, independent LLC, Res′, triple stabilizer, Definition 9.3, the admissibility caveat and Theorem 9.5.
- §10.1–10.2, pp. 1338–1342, and §§10.3.2–10.3.3, pp. 1352–1356: selected transfers, spectral sequence, Ext finiteness, cuspidal degeneration and final proof.
- Appendix A.9–A.12, pp. 1363–1365: analytic quotient spectral-sequence application. Earlier Berkovich foundational references are not claimed read.

### LRS-1993

[D-elliptic sheaves and the Langlands correspondence](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf), Gérard Laumon; Michael Rapoport; Ulrich Stuhler. Invent. Math. 113 (1993), 217–338; published journal scan, 124 PDF pages; printed page = PDF page + 215. OCR used for navigation; crucial displayed formulas checked against page images. Accessed 2026-10-07. SHA-256: `05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e`.

- Introduction pp. 217–218 and statements/proof passages in §§4–6, pp. 236–246: smooth stack, fixed-degree level scheme, division properness. Full Lemma-level moduli closure remains listed.
- §13, pp. 289–293, read throughout: facet sum, EP identities, compact spectrum and trace formula. §13.8’s expressly unproved general assertions are excluded.
- §14, pp. 293–309: cohomology/isotypes, trace 14.9, Corollary 14.11, Theorem 14.12 and its genericity remark, graded local representations 14.13–14.17 and the unpublished ample-class discussion 14.19. Read with Kaiser, not as a self-dual isotype theorem.
- §15.10–15.17, pp. 314–319: selected globalizations/transfer, selected global representation, independence, pair constants and numerical-surjectivity statement. Numerical proof §§15.18–15.20 and quoted Henniart inputs remain a source/proof refinement.

### Kaiser-erratum

[Errata for [LRS]](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf), Christian Kaiser (as identified by the author-hosted source catalogue). Two-page author-hosted erratum; undated. Both pages inspected visually. Accessed 2026-10-07. SHA-256: `6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54`.

- Both pages in full: Corollary 14.11 replacement (dual AND q^{-1}); Lemma 14.14′, Proposition 14.17′, and induction proof. Neither self-duality nor integrality retained as amended-lemma assumptions.

### Kaletha-2018

[Rigid inner forms vs isocrystals](https://ems.press/content/serial-article-files/32267), Tasho Kaletha. J. Eur. Math. Soc. 20 (2018), 61–101; publisher PDF. Accessed 2026-10-07. SHA-256: `cfd4f90fd84806dcb328840e620d7934772d86439514e73c1bb060c222b6a030`.

- §§5.1.1–5.1.2, pp. 78–80: Definition 5.1, Proposition 5.2, Corollary 5.3, Facts 5.4–5.5 and their proofs. The paper’s standing p-adic hypothesis is retained; the equal-characteristic use needs an explicit extension.

### Kottwitz-2014

[B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), Robert E. Kottwitz. arXiv:1401.5728 author text; source identified by URL/hash, not an inferred version number. Accessed 2026-10-07. SHA-256: `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4`.

- §10.10, Proposition 10.4 and Lemma 10.5, p. 50: central-extension surjectivity and basic fibre quotient. The bridge to H¹(E,G_ad) is a BG1 request, not a literal attribution to Proposition 10.4.

### SW20

[Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Peter Scholze; Jared Weinstein. Author copy dated 27 March 2020. Accessed 2026-10-07. SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.

- Lecture 24, Theorem 24.2.5, p. 227 and adjacent beginning of proof: p-divisible-group tower diamond/local-shtuka comparison. The O_E-module extension and full proof are specifically requested from ET.6a; Corollary 24.3.5 is not needed for EL/PEL generality here.

The ledger distinguishes texts acquired and passages read from quoted inputs whose proof texts remain unacquired. The missing Genestier/Drinfeld, Laumon/Kottwitz EP, Deligne–Kazhdan, Henniart and Badulescu proof sources are named in the appropriate gaps. Reading Hausberger’s quotation is not recorded as reading those references. The equal-characteristic Hecke-fibre/dual-operation comparison also requires an exact acquired primary source before closure.
