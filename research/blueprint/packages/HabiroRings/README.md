# Roadmap: relative Habiro rings, completed coefficients and number-field lines

**Summary.** Habiro's completion of a polynomial ring collects Taylor expansions at every root of unity. For a perfectly covered Λ-ring A and an étale A-algebra R, HabiroCohomologyFoundations §0.3 constructs the static Habiro-complete coefficient object E(R/A), whose (qᵐ−1)-completions deform the relative q-Witt rings. This roadmap gives that object its ordinary arithmetic presentation H_{R/A}: the ordinary inverse-limit ring with its projections and quotients, the full Frobenius-twisted Taylor equalizer, completed coefficient base change, the classical ring and the number-field ring of Garoufalidis–Scholze–Wheeler–Zagier. It also owns the general marked étale-deformation interface, finite descent for tensor-compatible localizations with coherent overlaps, the Laurent and scalar-restriction conventions for Habiro completion, the ordinary/derived comparison on polynomial coefficient modules, the spherical and light solid completed scalar categories, the combinatorics of the prime-chain index, completed scalar extension along morphisms of pairs, and the transport of the number-field lines with their pairings.

Taylor factors retain the full root-adjoining coefficient algebra: order four over ℤ[i][1/2] has two factors; Φ₅ over 𝔽₁₁ has four. The ordinary ring and completed base change are independent of solid spectral hypotheses.

## Scope and ownership

This roadmap owns: ordinary marked étale lifts over arbitrary quotient ideals, locally nilpotent rigidity, the finitely generated-ideal completed map interface and regular-principal derived universality (Layer 0); the Laurent-convention and scalar-restriction comparisons for Habiro completion, the two-term resolution of the rational localization with its homotopy-module criterion, the ordinary/derived comparison `ordinaryDerivedComparison` for polynomial coefficient modules, and completed coefficient base change (Layer 2, §§2.1–2.5); the spherical, spectral and light solid completion theory (§§2.6–2.12); the combinatorics of cyclotomic intersections and of the finite prime-chain index, the general descent principle for monoidal localizations and the prime-edge description of descent mapping spaces (Layer 3); the category of pairs (Layer 1) and the functoriality of the coefficient lifts along morphisms of pairs (Layer 4); the ordinary relative Habiro ring with its Taylor equalizer, untwisting criterion, completed base change, classical and number-field comparisons (Layer 5); completed scalar extension, the q−1 completion map and the transported number-field lines (Layer 6); and the distinguishing examples of Layer 7.

It leaves to named roadmaps, which are consumed and never restated:

- **HabiroCohomologyFoundations Layer 0.** §0.1 owns Habiro-complete modules over A[q] for every commutative ring A, the reflection L_H with its two limit formulas, the completed symmetric monoidal tensor, and cyclotomic detection of zero objects, equivalences and individual homotopy degrees. §0.2 owns finite cyclotomic complete descent: the closed-cover diagram, its reduction to singleton and p-primary chain data, reconstruction, mapping spaces, divisor restriction, the arithmetic fracture pieces and naturality, for modules and E∞-algebras. §0.3 owns the marked étale coefficient lifts E_m(R/A), their uniqueness, Frobenius overlap equivalences, transitions lifting q-Witt Frobenius, and the static limit E(R/A) with its h-completion R⟦h⟧. HabiroRings consumes these interfaces in Layers 2–5; it builds no second Habiro-completion functor, cyclotomic descent equivalence or specialized coefficient lift.
- **HabiroCohomologyFoundations §§4.21 and 4.28.** The étale Habiro–Hodge identification H(R,F)≃E(R/A) and its exported form `HabiroHodgeDescent.etale`. Since H_{R/A} is defined from E(R/A), this identifies the étale Habiro–Hodge object with the ring of Layer 5 directly; no comparison theorem is planned here.
- **QWittVectors:QW.0–QW.4.** The big Witt, Λ-ring and degree-zero q-Witt library, including perfect and perfectly covered Λ-rings and the colimit perfection (QW.1) and the completed étale Frobenius (QW.4 in HabiroCohomologyFoundations' supplier contract; QW.4 imports the complete étale δ-extension of PerfectoidQuotients §0.0 through PrismaticCohomology §0.59 and the torsion-free δ/Frobenius correspondence of PR.0, and HabiroCohomologyFoundations §0.3 uses the invertibility of its linearization). The specifications under Exact supplier contracts record the interfaces used here; their ownership stays with QWittVectors, the common supplier of HabiroCohomologyFoundations and of this roadmap.
- **HabiroCyclotomicCompletions:HC.1–HC.5.** The polynomial Habiro topology, q-factorials, Taylor substitution, classical injectivity, root adjunction and the ordinary completion of polynomial coefficient modules (HC Layer 5). In particular HC Layer 1 supplies `qBinomial_factorial` and `qFactorial_pochhammer`. The classical results are applied to twisted coefficient algebras without reconstructing the classical completion or the root-adjoining library.
- **EnhancedDerivedSheaves:E0, E1, E2:towers, E3, E5:abstract and E5:spectra-comparison**, **StableHomotopyKTheory:H.5:spectra, H.5:S-delooping and H.6**, and **DerivedDeRhamCohomology:DD.1**: enhanced derived categories, coherent diagrams and towers, symmetric monoidal localizations, algebra objects, the spectral module comparison and principal derived completion. Mathlib's ordinary `DerivedCategory` and `LightCondMod` are useful underlying categories; their existing definitions do not supply these enhanced or solid spectral structures.
- **SolidAnalyticRings:SA.1** for the five solid spectral statements, under the explicit product, tower, tensor and resolution hypotheses stated in Exact supplier contracts. This exceeds the abelian solid-module scope of **VStackSheavesAndLisseCategories:VS2**. A compact-generator statement or an abelian completed-tensor theorem alone does not establish this input. The ordinary relative ring and its comparisons are independent of these solid hypotheses.
- **HabiroNumberFields:HB.6** for the number-field ring and **HB.7** for the actual K₃-indexed invertible modules, tensor pairings and supported field pullbacks. Their effective global descent, integral linear-jet condition and arithmetic naturality remain hypotheses of the line comparisons here. Local rank one does not imply the requisite global invertible module. Nahm-sum constructions remain in **HB.10**.

No trace construction is an input. RefinedTraceMethods and HabiroCohomologyFoundationsPartII are consumers only.

The general deformation inputs are owned targets of [Layer 0](#layer-0-general-marked-étale-deformations), and the general finite monoidal-localization descent theorem is owned by [§3.5](#hr-3-the-general-descent-principle). They assemble ordinary library machinery and the enhanced/DD suppliers for arbitrary bases, independently of the specialized HabiroCohomologyFoundations §0.3 construction. Part I proves its cyclotomic specialization directly and does not depend on these HabiroRings generalizations. The family order is HabiroCyclotomicCompletions → QWittVectors → HabiroCohomologyFoundations I → HabiroRings → RefinedTraceMethods → HabiroCohomologyFoundations II. In particular, generalizing an earlier supplier's special case here does not add an input back to it.

## Conventions

Rings are commutative and unital. Positive indices m, d and n are positive natural numbers; p and ℓ denote rational primes. A torsion-free ring means that multiplication by every positive integer is injective. On such a ring, arithmetic Λ-data are commuting ring endomorphisms ψᵐ with ψ¹ = id, ψᵐⁿ = ψᵐψⁿ, and ψᵖ(a) − aᵖ ∈ pA. On rings with torsion the definition uses a coalgebra for the big Witt comonad; Adams operations alone are insufficient data. A Λ-map preserves all operations. Perfect means all ψᵐ are bijective; perfectly covered refers to the faithful flatness criterion of QW.1, recorded below. Every perfect Λ-ring is perfectly covered.

Write R^(m) = R ⊗_{A,ψᵐ} A, with the A-algebra structure through the right factor. A map of pairs (A,R) → (A′,R′) consists of a Λ-map A → A′ and a compatible ring map R → R′. It does not equip R with global Adams operations. The standing hypothesis for finite and infinite relative Habiro rings is **A perfectly covered and R étale over A**. The completed Frobenius φ_{p/A} is a map on R̂_p, and its linearization is an isomorphism between the corresponding completed twists.

Let Φ_m(q) be the m-th cyclotomic polynomial, f_m=qᵐ−1, and P_n(q) = ∏_{i=1}^n(1−qⁱ), with P₀ = 1. Set

\[
  R_r=\mathbb Z[q^{\pm1},(q^m-1)^{-1}\mid m\geq1].
\]

Derived quotients are cofibers, not underived quotients with Tor discarded. For example M/f denotes cofib(f:M→M); for a static module its positive homotopy detects f-torsion. Derived I-completion is indicated by a hat with subscript I. Habiro completion L_H is the reflection of HabiroCohomologyFoundations §0.1, the completion for all cyclotomic divisors, equivalently for the tower P_n. That reflection is defined on A[q]-modules; §2.1 identifies it with the Laurent convention over A[q^{±1}] used throughout this roadmap. “Static” means homotopy only in degree zero; “bounded below” refers to homotopy degrees. For ordinary power series write X=q−1, or X_m=q−ζ_m at another root.

For étale R over perfectly covered A, write H_{R/A,m} for the f_m-complete coefficient lift E_m(R/A) of HabiroCohomologyFoundations §0.3 and H_{R/A} for the ordinary ring π₀E(R/A) of §5.1. This is notation for the supplier's objects in the Laurent convention, not a second construction.

Big Witt coordinates are indexed by a divisor-stable set S of positive integers. W_m means W_{Div(m)}, whose ghost component is gh_n(a)=Σ_{d∣n}d a_d^{n/d}. F_{m/d}:W_m→W_d denotes Witt Frobenius; Res_d^m is restriction and V_{m/d}:W_d→W_m is additive Verschiebung. These maps have different meanings. The p-typical truncation on {1,p,…,pⁿ} has n+1 coordinates, whereas Mathlib's `TruncatedWittVector p k R` has k coordinates. Exterior λ-operations are distinguished from the Witt coordinates c_n; in particular λ²=−c₂.

Spherical coefficients use ℛ=𝕊[ℤ]=𝕊[q^{±1}], not Hℤ[q^{±1}]. Write S_H=L_Hℛ. The tensor product in the complete category is L_H(M⊗N). For HR-relative modules, the Eilenberg–Mac Lane comparison is symmetric monoidal; restriction from HR to the spherical base is only lax monoidal. Solid tensor products and ordinary spectral tensor products retain their separate notation.

Declaration names specify the intended API. [Suggested.lean](Suggested.lean) states the targets whose carriers exist at Mathlib **082e2d3** and Tau Ceti **f790474**; `sorry` supplies no implementation. Roadmap dependencies name their owners, library prerequisites use qualified declaration names, and local links identify the specifications below.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use the existing `CommRing`, `RingHom`, `Algebra`, `Algebra.Etale`, `Module.Flat` and `Module.FaithfullyFlat` carriers. Prime completion uses `AdicCompletion`, its `of` map and `isAdicComplete`; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` and `Algebra.FormallyUnramified.ext_of_iInf` provide existence and uniqueness at finite nilpotent levels and their complete limit. These are the ordinary inputs of the QW.4 completed-Frobenius interface specified below.

For invertible modules use `Module.Invertible`, `Module.Invertible.bijective_of_surjective`, `Module.Invertible.free_iff_linearEquiv`, and `CommRing.Pic.mapRingHom`. The existing tensor base-change, quotient and Picard functor laws are consumed; the additional line theorem is triviality over R[[X]] from an actual trivial integral first fiber. `PowerSeries.constantCoeff`, `PowerSeries.X_dvd_iff` and `PowerSeries.isUnit_iff_constantCoeff` fix its scalar convention. `NumberField.discr` and `NumberField.not_dvd_discr_iff_isUnramifiedIn` supply the discriminant criterion, whose localized étale assembly is a Layer 5 target. Use Tau Ceti's `TauCeti.Cyclotomic.conjugateResiduesRingHom` and `TauCeti.Cyclotomic.conjugateResidues_lift` for the all-conjugates comparison in Layer 7. They do not replace the full relative Taylor algebra. `LaurentPolynomial`, `LaurentPolynomial.T` and `IsLocalization` supply the ordinary Laurent and localization carriers of Layer 2.

### Enhanced, completion and solid inputs

The named E0/E1/E2:towers/E3/E5, H.5/H.6, DD.1 and HC suppliers in Scope and ownership provide actual enhanced module and algebra categories, coherent limits, symmetric monoidal localization, principal derived completion and the polynomial/cyclotomic cofinality arguments. A triangulated category by itself does not supply the required mapping spaces. Layer 0 uses DD §§1.1–1.4 (`DerivedDeRham.derivedCompleteness`, `.derivedCompletion`, `.completeNakayama`, `.koszulCompletionTower`, `.ordinaryQuotientCompletion`), E2:towers §1 (`derivedTowerLimit`, with its product–difference formula), E5:abstract §2 (`commutativeAlgebras`, `moduleObjects`) and E5:spectra-comparison (`moduleSpectra_equiv_derived`). For a regular principal element, the ordinary/derived comparison uses zero torsion on the chosen étale algebra; it does not require DD's separate Noetherian Artin–Rees proof input. The algebraic Habiro completion, its tensor and its finite descent are the HabiroCohomologyFoundations Layer 0 interfaces specified below; they use no solidification.

The classical HC input is independent of derived completion: for any commutative ring B and B-module M, HC Layers 1, 2 and 5 provide the ordinary full completion of M[q], its polynomial/Laurent comparison, finite quotient projections and functoriality in M. HC Layer 1's two integral factorial identities give
\(P_{a+b}=P_aP_b{a+b\brack a}_q\) for all natural a,b, including zero. Only these polynomial identities are used in the solid tensor weights; QSeries is a consumer of this toolkit. The derived comparison of §2.4 uses this ordinary input and the reflection of HabiroCohomologyFoundations §0.1.

For the solid comparison, **SolidAnalyticRings:SA.1** must additionally provide the following full light solid spectral contract. Work with hypersheaves of spectra on light profinite sets. The discrete functor is fully faithful symmetric monoidal and left adjoint to evaluation at the point. For Null=cofib(𝕊[{∞}]→𝕊[ℕ∪{∞}]) and its shift σ, solidity means that 1−σ* is invertible on the internal Hom from Null. Discrete spectra are solid; solid objects are closed under limits and colimits and admit accessible symmetric monoidal solidification. Null^■≃∏_ℕ𝕊 is a compact generator, with the functorial product tensor comparison (∏_ℕ𝕊)⊗^■(∏_ℕ𝕊)≃∏_{ℕ²}𝕊.

Also require tensor compatibility with split finite free towers and derived relative base change, commutation of countable limits with ω₁-filtered colimits, the spectral null-family calculation in every homotopy degree, and a compatible t-structure with uniformly bounded-below simplicial resolutions and their realization comparison. A countable product of condensed complete units is not identified with the condensed completion of an ordinary spectral product without its own comparison. These hypotheses do not assert that tensor commutes with arbitrary inverse limits.

The null-sequence and solidification input is described by [MW], §4.1, 4.1, pp.41–42 (author version dated 5 February 2026), and [Q], Appendix B.6, p.79. Neither this description nor Bosco's abelian p-adic Proposition A.3, pp.92–93, establishes the whole spectral tower/resolution contract. Layer 2's solid idempotence, completed sum formula, countable tensor comparison and bounded-below monoidality retain that explicit supplier hypothesis. This conditionality does not affect the nonsolid relative ring.

### Arithmetic Λ and big Witt input from QWittVectors:QW.0

The following interfaces specify precisely the imported objects. Their source and test details constrain the supplier rather than create a second implementation of its theory.

<a id="hr-1-lambda-rings-with-commuting-adams-operations"></a>

#### Torsion-free Λ-rings

For torsion-free A, use the Adams data of the conventions as the Λ-structure. A morphism is a ring map commuting with every ψᵐ. Multiplicativity in the index gives commutation, and the prime congruence gives the unique p-derivation δ_p(a)=(ψᵖ(a)−aᵖ)/p. Its p-derivation identities follow from the ring-map identities for ψᵖ through PR.0. Perfection is bijectivity at primes, equivalently at every positive index.

The toric structure on ℤ[x_i] sends x_i to x_iᵐ and fixes integer coefficients. On ℤ and ℚ the identity operations satisfy the congruence; on ℚ it is vacuous because p is a unit. Identity operations on ℤ[x] fail already at p=2. These examples distinguish arithmetic Λ-data from either identity modulo p or a collection of unrelated Frobenius lifts. The Witt section constructed below supplies the equivalent coalgebra convention, with gh_m∘s=ψᵐ.

*Needs:* `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`; `IsAddTorsionFree`; `MvPolynomial.expand`; `Polynomial.expand`; `Polynomial.expand_mul`.

See [W], §2.4, 2.31, p.26; Proposition 2.36, p.28; §2.5, Lemma 2.46, pp.31–32; [Q], §1.4, Notation 1.22(e), p.12.

The API comprises:

- `LambdaRing`: A torsion-free commutative ring with ring endomorphisms ψ^m (m ≥ 1) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and ψ^p(x) − x^p ∈ p·A for every prime p.
- `LambdaRing.adams`: The Adams operation ψ^m as a ring endomorphism.
- `LambdaRing.adams_one`: ψ^1 = id.
- `LambdaRing.adams_mul`: ψ^(mn) = ψ^m ∘ ψ^n.
- `LambdaRing.adams_comm`: ψ^m ∘ ψ^n = ψ^n ∘ ψ^m, derived from adams_mul.
- `LambdaRing.adams_prime_sub_pow_mem`: For prime p, ψᵖ(a)−aᵖ lies in pA for every a∈A.
- `LambdaRing.Hom`: Ring maps f with f ∘ ψ^m = ψ^m ∘ f for all m, with Hom.id and Hom.comp; the category LambdaRingCat.
- `LambdaRing.delta`: δ_p(x) = (ψ^p(x) − x^p)/p, well defined by torsion freeness.
- `LambdaRing.toDeltaRing`: δ_p is a p-derivation, so A is a δ-ring at p with Frobenius ψ^p in the sense of PrismaticCohomology PR.0, and Λ-maps are δ-maps.
- `LambdaRing.IsPerfect`: Every ψ^p is bijective (equivalently every ψ^m).
- `LambdaRing.trivialInt`: ℤ (and ℚ) with ψ^m = id; ℚ is perfect.
- `LambdaRing.toric`: MvPolynomial I ℤ with ψ^m = MvPolynomial.expand m, so ψ^m(x_i) = x_i^m.
- `LambdaRing.toBigWitt`: The unique Witt section s:A→W(A) with gh_m∘s=ψᵐ, through the torsion-free coalgebra–Adams equivalence.

**Checks.**

- `LambdaRing.toric_adams_computation`: In ℤ[x] with the toric structure, ψ^2(x^2 + 3x) = x^4 + 3x^2 and ψ^2(ψ^3(x)) = ψ^3(ψ^2(x)) = ψ^6(x) = x^6.
- `LambdaRing.toric_congruence`: In toric ℤ[x], ψ^p(x) − x^p = 0 ∈ pℤ[x], whereas ψ^p(x) − x = x^p − x ∉ pℤ[x] (its coefficient of x is −1): a definition with the congruence 'ψ^p ≡ id mod p' would exclude the toric example.
- `LambdaRing.not_trivial_on_polynomials`: The identity operations on ℤ[x] are not a Λ-structure: ψ^2(x) − x^2 = x − x^2 ∉ 2ℤ[x]. A definition omitting the congruence would accept it.
- `LambdaRing.int_delta`: ℤ with ψ^m = id is a Λ-ring (n^p ≡ n mod p) and δ_2(3) = (3 − 9)/2 = −3.
- `LambdaRing.rat_isPerfect`: ℚ with ψ^m = id is a perfect Λ-ring; the congruence is vacuous because pℚ = ℚ.
- `LambdaRing.toric_toDeltaRing`: For toric ℤ[x], δ_p(x) = (x^p − x^p)/p = 0, so the PR.0 δ-structure is the one with Frobenius x ↦ x^p.

<a id="hr-1-dwork-ghost-image"></a>

#### Dwork’s integrality criterion

Let A be torsion-free and choose a Frobenius lift φ_p:A→A for each prime; the lifts need not commute. A sequence (y_n) is the ghost sequence of a unique big Witt vector precisely when
\[
 y_n-\phi_p(y_{n/p})\in p^{v_p(n)}A\qquad(p\mid n).
\]
Necessity follows by expanding the ghost polynomials and applying the prime congruence. For sufficiency, solve n a_n=y_n−Σ_{d∣n,d<n}d a_d^{n/d}; the displayed congruences prove the required divisibility prime by prime, and torsion-freeness gives uniqueness. The same induction applies to finite divisor-stable truncation sets.

With φ₂=id on ℤ, the two-component sequence (1,3) is integral and (1,2) is not. The exponent v_p(n) is essential at higher prime powers; mere divisibility by p does not characterize the ghost image.

*Needs:* [Big Witt operations][r2]; `IsAddTorsionFree`.

See [H], Lemma 1.1, pp.6–7.

<a id="hr-1-universal-frobenius-polynomials"></a>

#### Integral Frobenius coordinate polynomials

For positive m,n, construct an integral polynomial f_{m,n} in Witt coordinates a_j with j≤mn such that (F_m a)_n=f_{m,n}(a). It is weighted homogeneous of degree mn when a_j has weight j. On the universal torsion-free polynomial ring, Dwork's criterion makes the shifted ghosts gh_n(F_m a)=gh_{mn}(a) integral; uniqueness gives naturality and the composition identities. Evaluating the integral polynomials then defines the maps on every ring.

For m=p prime, the leading term is p a_{pn}, with the remaining terms in lower coordinates, and f_{p,n}≡a_nᵖ modulo p. This finite dependence is what permits arbitrary sets of generators in the free Λ-ring and triangular prime-local presentations.

*Needs:* [Big Witt operations][r2]; [Dwork criterion][r3]; `MvPolynomial`.

See [H], Lemma 1.4, pp.8–9; Lemma 1.8, p.11.

<a id="hr-1-witt-ring-frobenius-congruence"></a>

#### Frobenius congruence inside the Witt ring

For every ring A, including rings with p-torsion, F_p(x)−xᵖ belongs to pW(A). This divisibility is in the Witt ring, not merely coordinatewise congruence in A. Prove the identity and its quotient on a universal torsion-free polynomial ring using the ghost calculations and Dwork integrality, then specialize the resulting integral polynomial identity to A. Injectivity of ghosts cannot be invoked after specializing to a ring with torsion.

The result is used to give W(A) its canonical arithmetic Λ-structure. A coordinatewise reduction F_p(x)_n≡x_nᵖ mod p is a useful check but does not by itself prove this stronger statement.

*Needs:* [Big Witt operations][r2]; [Dwork criterion][r3]; [Frobenius polynomials][r4]; `MvPolynomial`; `IsAddTorsionFree`.

See [H], Lemma 1.18, p.16.

<a id="hr-1-big-witt-comonad"></a>

#### Witt comultiplication

Define Δ_A:W(A)→W(W(A)) by requiring that its n-th outer ghost component be F_n:W(A)→W(A), and let ε_A=gh₁. On the universal ring the ghost specification determines an integral ring map; specializing supplies Δ for every A. Naturality holds for arbitrary ring maps. In particular Δ([a])=[[a]] for the Teichmüller element.

The word “outer” matters: the ghosts of W(W(A)) first take values in W(A). This definition constructs the coaction used for arithmetic Λ-rings; an arbitrary map into a product of ghost rings is not the same object.

*Needs:* [Big Witt operations][r2]; [Dwork criterion][r3]; [Frobenius polynomials][r4]; [Witt congruence][r5].

See [H], Proposition 1.19, pp.17–18.

<a id="hr-1-big-witt-comonad-laws"></a>

#### Counit and coassociativity

Prove ε_{W(A)}Δ_A=id, W(ε_A)Δ_A=id and Δ_{W(A)}Δ_A=W(Δ_A)Δ_A. On universal torsion-free coefficient rings these follow from F₁=id and F_mF_n=F_{mn}. Universal polynomial identities extend the equations to arbitrary A. Together with naturality they make (W,ε,Δ) a comonad on commutative rings.

The first and second counit identities have distinct types and both are required. They imply W(gh_m)Δ=F_m and provide the uniqueness calculation in the cofree adjunction.

*Needs:* [Comultiplication][r6]; [Big Witt operations][r2].

See [H], Proposition 1.19, pp.17–18.

<a id="hr-1-lambda-coalgebra"></a>

#### Arithmetic Λ-rings with torsion

An arithmetic Λ-ring on any commutative A is a ring map s:A→W(A) satisfying ε_As=id_A and Δ_As=W(s)s. A Λ-map f:(A,s)→(B,t) satisfies W(f)s=tf. Use these literal ring-map equations, with identity and composition, to form the category of coalgebras. This definition retains the data lost by ghosts when A has torsion.

W(A) with coaction Δ_A is the canonical cofree example. The two coaction equations are equations of actual maps; no proposition standing for an unavailable comparison is part of the data.

*Needs:* [Comultiplication][r6]; [Comonad laws][r7]; [Big Witt operations][r2].

See [H], Definition 1.21 and Definition 1.23, pp.18–19.

<a id="hr-1-coalgebra-adams-laws"></a>

#### Adams operations of a coalgebra

Set ψᵐ=gh_m∘s for a Witt coalgebra. The counit and coassociativity equations imply ψ¹=id and ψᵐψⁿ=ψᵐⁿ, hence commutation. The Witt-ring Frobenius congruence yields ψᵖ(a)−aᵖ∈pA. Coalgebra morphisms commute with these operations. All of these conclusions hold with torsion coefficients.

The converse requires torsion-freeness: ghosts need not recover the coaction over a ring with torsion. The Adams form used for relative inputs is therefore justified by the comparison below rather than used as a definition on all rings.

*Needs:* [Λ-coalgebras][r8]; [Comonad laws][r7]; [Frobenius polynomials][r4]; [Witt congruence][r5].

See [H], Lemma 1.24, p.19.

<a id="hr-1-adams-to-witt-section"></a>

#### The Witt section of torsion-free Adams data

For torsion-free A with the Adams identities and prime congruence, construct s:A→W(A) by prescribing gh_n(s(a))=ψⁿ(a). The recursion is
\[
 n c_n(a)=\psi^n(a)-\sum_{d\mid n,\ d<n}d\,c_d(a)^{n/d}.
\]
Dwork's criterion proves the numerator is divisible by n. Thus c₁(a)=a and c_p(a)=δ_p(a). Ghost injectivity proves that s is a ring map. The construction works simultaneously over all finite divisor-stable truncations and passes to the full Witt ring.

*Needs:* [Adams data][r9]; [Dwork criterion][r3]; [Big Witt operations][r2]; `IsAddTorsionFree`; `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

See [B], §1.6–1.9 and §1.17, pp.8–10,12–13; [W], §2.4, 2.31, p.26.

<a id="hr-1-adams-witt-section-laws"></a>

#### Ghost identities and naturality of the section

The constructed section has gh_n∘s=ψⁿ for every positive n. If f is a map preserving Adams operations between torsion-free rings, W(f)s_A=s_Bf, by comparing each ghost component. The same argument proves uniqueness of a section with these ghosts. These identities supply the truncated maps s_m used in relative q-Witt theory.

Ghost injectivity is used only on torsion-free targets. The naturality statement must name that hypothesis instead of asserting that an arbitrary collection of ghosts determines maps on every ring.

*Needs:* [Witt section](#hr-1-adams-to-witt-section); [Dwork criterion][r3]; [Big Witt operations][r2].

See [W], §2.4, 2.31, p.26.

<a id="hr-1-wilkerson-comparison"></a>

#### The torsion-free coalgebra–Adams equivalence

On torsion-free commutative rings, passing from a Witt coalgebra to its Adams operations and constructing the Witt section are mutually inverse, including on morphisms. To prove the missing coaction law of the section, compare outer and inner ghosts using ψᵐψⁿ=ψᵐⁿ; successive ghost injectivity gives Δs=W(s)s. The counit follows at n=1.

Consequently the relative Adams convention is the arithmetic Λ-ring convention, and the perfection and flatness conditions can be transferred between them. This equivalence does not assert that Adams data determine a Λ-structure on an arbitrary torsion ring.

*Needs:* [Coalgebra Adams maps][r11]; [Section laws](#hr-1-adams-witt-section-laws); [Adams data][r9]; [Big Witt operations][r2]; `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

See [B], §1.17, pp.12–13; [H], Lemma 1.24, p.19 and Proposition 1.19, p.17.

<a id="hr-1-big-witt-cofree-adjunction"></a>

#### The cofree Λ-ring adjunction

The forgetful functor from Witt coalgebras to rings has right adjoint A↦(W(A),Δ_A). For a coalgebra (B,s_B), a ring map f:B→A lifts to W(f)s_B:B→W(A). The inverse takes a coalgebra map to its composition with ε_A. The counit identities and coassociativity prove these constructions are inverse and natural.

This adjunction is valid without torsion-freeness. Its unit is the coaction and its counit is gh₁; the triangle identities are concrete comonad equations. It supplies the correct universal interpretation of the free construction rather than an adjunction for mere Adams families.

*Needs:* [Comonad laws][r7]; [Λ-coalgebras][r8].

See [H], §2, p.24 (cofree adjunction); Proposition 1.19.

<a id="hr-1-witt-product-addition"></a>

#### Generating series for Witt addition

For a Witt vector a, use γ(a)=∏_{d≥1}(1−a_dtᵈ)⁻¹ in 1+tA[[t]]. Witt addition corresponds to multiplication of these series. At precision t^{N+1} it is enough to use d≤N, so the identity is finite and specializes to every coefficient ring. A proof uses the logarithmic derivative to compare ghosts over a universal ring and integral specialization to avoid denominators in A.

Equivalently P_N(a+b)≡P_N(a)P_N(b) modulo t^{N+1} for P_N(a)=∏_{d≤N}(1−a_dtᵈ). This coordinate generating series is distinct from the q-factorial P_n(q) of Habiro completion; the variables and meanings must remain explicit.

*Needs:* [Big Witt operations][r2]; `MvPolynomial`; `IsAddTorsionFree`; `PowerSeries`; `PowerSeries.coeff`.

See [H], Proposition 1.14 and its proof, pp.14–15 (published p.150).

<a id="hr-1-exterior-operations"></a>

#### Exterior λ-operations

For a Witt coalgebra s(a)=(c_n(a)), define the exterior generating series λ_t(a)=γ(s(a))(-t)⁻¹=∏_{n≥1}(1−c_n(a)(−t)ⁿ). Extracting coefficients gives λ⁰=1, λ¹=a, λ²=−c₂ and λ³=c₃−a c₂. Witt addition gives λ_t(a+b)=λ_t(a)λ_t(b); all coefficient identities use finite products at a fixed precision.

The sign convention is exterior rather than symmetric. For ℤ with identity Adams operations, λ³(−1)=−1; identifying λ³ with c₃ would fail this test. The coordinate extraction and functoriality under coalgebra maps form the reusable interface.

*Needs:* [Λ-coalgebras][r8]; [Big Witt operations][r2]; `PowerSeries`; `PowerSeries.coeff`; [Witt addition series](#hr-1-witt-product-addition); [Coalgebra–Adams equivalence][r14].

See [H], Remark 1.22, p.18, and Proposition 1.14, p.14.

<a id="hr-1-free-lambda-ring"></a>

#### Free Λ-rings in Witt coordinates

For any set I, let L(I)=ℤ[c_{i,n}∣i∈I,n≥1] and x_i=c_{i,1}. Each sequence u_i=(c_{i,n}) is a universal Witt vector. Define the coaction on c_{i,n} by the n-th coordinate of Δ(u_i), and hence the Adams maps through the universal Frobenius polynomials. Polynomial finite support makes this construction valid for infinite I.

It is the free arithmetic Λ-ring, not the toric polynomial ring on the x_i alone. For instance ψ²(x_i)=x_i²+2c_{i,2}. The extra coordinates are required to allow a chosen element of an arbitrary Λ-ring to have its actual exterior operations.

*Needs:* [Comonad laws][r7]; [Λ-coalgebras][r8]; [Cofree adjunction](#hr-1-big-witt-cofree-adjunction); [Frobenius polynomials][r4]; `MvPolynomial`; `MvPolynomial.eval₂Hom`; [Exterior operations](#hr-1-exterior-operations).

See [B], §1.18, p.13; [W], §2.4, 2.33, p.27.

<a id="hr-1-free-lambda-universal-property"></a>

#### The free Λ-ring adjunction

For a coalgebra (B,s_B) and a function g:I→B, the unique Λ-map L(I)→B sends c_{i,n} to the n-th coordinate of s_B(g(i)). The coaction law proves it is a Λ-map; preserving coactions forces these values and gives uniqueness. Thus L is left adjoint to the underlying-set functor, for all arithmetic Λ-rings, including those with torsion.

Evaluation at x_i describes the inverse map of the adjunction. Its identity and composition laws follow from uniqueness. The empty set gives ℤ and a singleton recovers the full sequence of operations of one chosen element, rather than a generator with forced toric operations.

*Needs:* [Free Λ-ring][r17]; [Coalgebra–Adams equivalence][r14]; `MvPolynomial.eval₂Hom`; `MvPolynomial.eval₂Hom_X'`.

See [B], §1.18, p.13.

<a id="hr-1-free-adams-local-presentations"></a>

#### Prime-local presentations of free Adams maps

Fix a prime p and regard L(I) as a module over itself through ψᵖ. Over ℤ_(p) it is free on the finitely supported monomials ∏c_{i,n}^{r_{i,n}} with 0≤r_{i,n}<p. After inverting p, it is a polynomial algebra over the source, with extra coordinates c_{i,j} for p∤j. Both assertions describe the twisted scalar action through ψᵖ, not the identity scalar action.

Prove these presentations using the triangular integral Frobenius polynomials and finite-variable elimination, then take the filtered union over finite sets of coordinates. The first presentation has a basis containing 1; the second has the evident nonzero polynomial fibers. Together they establish faithful flatness prime locally for arbitrary I.

*Needs:* [Free Λ-ring][r17]; [Frobenius polynomials][r4]; `MvPolynomial`; `Module.Free.of_basis`; `Matrix.isUnit_iff_isUnit_det`.

See [Q], §1.22(e), p.12; [H], Lemmas 1.4 and 1.8, pp.8–11.

<a id="hr-1-free-lambda-perfect-cover"></a>

#### Perfectly covered free Λ-rings

Every ψᵖ on L(I) is faithfully flat: at p use the explicit free basis, and away from p use the polynomial presentation. Flatness and nonempty fibers are local on the base, so the two local descriptions combine. Compositions give faithful flatness of every ψᵐ. The criterion for being perfectly covered then gives a faithfully flat map L(I)→L(I)^perf.

The proof applies to the genuine free arithmetic Λ-ring in all its Witt coordinates. Flatness of the toric map x↦xᵖ is a simpler example but cannot stand in for this argument.

*Needs:* [Prime-local Adams maps](#hr-1-free-adams-local-presentations); [Coalgebra Adams maps][r11]; [perfect covers][r19]; [colimit perfection][r20]; `Module.FaithfullyFlat`; `Module.flat_of_localized_maximal`; `RingHom.FaithfullyFlat`; `RingHom.FaithfullyFlat.stableUnderComposition`; `RingHom.FaithfullyFlat.iff_flat_and_comap_surjective`; `Module.flat_iff_of_isLocalization`.

See [Q], §1.22(e), p.12; [W], Remark 2.47 and footnote (2.3), p.32.

The API comprises:

- `BigWitt.comul`: The ring homomorphism Δ_A for arbitrary A.
- `BigWitt.comul_ghost`: Outer gh_n ∘ Δ_A = F_n.
- `BigWitt.comul_natural`: W(W(f)) ∘ Δ_A = Δ_B ∘ W(f).
- `BigWitt.comul_counit_left`: gh_1 ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_counit_right`: W(gh_1) ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_assoc`: Δ_(W(A)) ∘ Δ_A = W(Δ_A) ∘ Δ_A.
- `BigWitt.comul_unique`: For torsion-free A, any ring map g:W(A)→W(W(A)) with gh_n∘g=F_n for every n equals Δ_A. No pointwise uniqueness by ghosts is asserted for arbitrary A.
- `BigWitt.comul_teichmuller`: Δ_A([a])=[[a]] for any commutative A.
- `LambdaCoalgebra.adams`: ψ^n=gh_n∘s as a ring endomorphism.
- `LambdaCoalgebra.ext`: Two coalgebras on A with equal structure maps are equal.
- `LambdaCoalgebra.Hom.id`: Identity is a coalgebra morphism.
- `LambdaCoalgebra.Hom.comp`: Composition of coalgebra morphisms is a coalgebra morphism.
- `LambdaCoalgebra.Hom.adams`: A coalgebra morphism commutes with every Adams operation.
- `LambdaCoalgebra.coaction`: The ring map s:A→W(A), with the literal counit and coassociativity equalities as structure fields.
- `LambdaCoalgebra.coord`: coord s n a is the nth Witt coordinate of s(a); it is not generally a ring homomorphism.
- `LambdaCoalgebra.ext_coords`: Equality of coord s n a and coord t n a for every a and every positive n gives s=t, without a torsion-free hypothesis.
- `LambdaCoalgebra.Hom.ext`: Two coalgebra morphisms with equal underlying ring homomorphisms are equal.
- `LambdaCoalgebra.Hom.comp_toRingHom`: The underlying ring map of g.comp f is g.toRingHom.comp f.toRingHom; identity has underlying RingHom.id.
- `Adams.toWitt`: The integral ring homomorphism s_ψ.
- `Adams.toWitt_ghost`: gh_n∘s_ψ=ψ^n.
- `Adams.toWitt_coord_one`: c_1(a)=a.
- `Adams.toWitt_unique`: Any ring map with all these ghosts equals s_ψ.
- `Adams.toWitt_natural`: For an Adams morphism f into torsion-free B, W(f)s_A=s_Bf.
- `Adams.toWitt_coord_recursion`: n c_n(a)=ψ^n(a)−Σ_(d\|n,d<n)d c_d(a)^(n/d), so coordinates are integral and unique on torsion-free A.
- `LambdaCoalgebra.exterior`: The operation λⁿ at every natural index.
- `LambdaCoalgebra.exterior_zero`: λ⁰(a)=1.
- `LambdaCoalgebra.exterior_one`: λ¹(a)=a.
- `LambdaCoalgebra.exterior_add`: λⁿ(a+b)=Σ_(i=0)^n λⁱ(a)λ^(n−i)(b).
- `LambdaCoalgebra.exterior_natural`: A coalgebra morphism preserves all λⁿ.
- `LambdaCoalgebra.exterior_two`: λ²(a)=−s(a)_2 for every commutative A, fixing the exterior/Witt sign convention.
- `LambdaCoalgebra.exterior_three`: λ³(a)=s(a)_3−s(a)_1s(a)_2.
- `LambdaCoalgebra.exterior_zero_element`: λⁿ(0)=0 whenever n>0.
- `FreeLambdaRing.coord`: c_(i,n) is the polynomial variable X(i,n).
- `FreeLambdaRing.gen`: x_i=c_(i,1).
- `FreeLambdaRing.coaction`: The map s_L on polynomial generators above satisfies both coalgebra axioms.
- `FreeLambdaRing.adams_coord`: ψ^m(c_(i,n))=f_(m,n) in the ith block.
- `FreeLambdaRing.reindex`: A map I→J induces the coalgebra map c_(i,n)↦c_(r(i),n), respecting identity and composition.
- `FreeLambdaRing.coaction_gen`: s_L(x_i)=u_i, so s_L(x_i)_n=c_(i,n); these coordinates detect a free Λ-morphism from its values on x_i.
- `FreeLambdaRing.lift`: For an arbitrary-ring coalgebra (A,s) and g:I→A, the coalgebra morphism sending c_(i,n) to s(g(i))_n.
- `FreeLambdaRing.lift_gen`: lift s g sends x_i to g(i).
- `FreeLambdaRing.lift_unique`: A coalgebra morphism with the prescribed values g(i) on every x_i equals lift s g, even when A has torsion.
- `FreeLambdaRing.universalProperty`: The natural equivalence (I→A) ≃ Hom_Λ(L(I),A), given by lift and restriction to x_i; proved in free-lambda-universal-property.

**Checks.**

- `BigWitt.comul_teichmuller_test`: Δ_A([a])=[[a]] for every a.
- `BigWitt.comul_zero_test`: Δ_A(0)=0, even for A=ℤ/4ℤ. For 2∈W(ℤ), the outer coordinate Δ(2)_2=−1, excluding coordinatewise repetition.
- `BigWitt.comul_ghost_six_test`: gh_2(gh_3(Δ_ℤ(a)))=gh_6(a).
- `LambdaCoalgebra.adams_one_test`: For every coalgebra, ψ¹=id_A.
- `LambdaCoalgebra.adams_two_coord_test`: ψ²(a)=s(a)_1²+2s(a)_2.
- `LambdaCoalgebra.hom_adams_test`: Every coalgebra morphism commutes with ψ⁶.
- `Adams.toWitt_integer_two_test`: For identity Adams on ℤ, s(2)_2=−1 and s(2)_3=−2.
- `Adams.toWitt_zero_test`: s_ψ(0)=0.
- `Adams.toWitt_prime_delta_test`: p s_ψ(a)_p=ψ^p(a)−aᵖ; c_p is the PR.0 p-derivation on torsion-free rings.
- `LambdaCoalgebra.exterior_integer_two_test`: In the integer binomial Λ-ring, λ²(2)=1 and λ³(2)=0.
- `LambdaCoalgebra.exterior_zero_element_test`: λⁿ(0)=0 for n>0.
- `LambdaCoalgebra.exterior_witt_sign_test`: λ²(a)=−s(a)_2; for a=2 in ℤ these values are 1 and −1 and are unequal.
- `FreeLambdaRing.adams_two_generator_test`: ψ²(x_i)=x_i²+2c_(i,2).
- `FreeLambdaRing.empty_adams_test`: L(∅)≃ℤ with identity Adams operations.
- `FreeLambdaRing.exterior_newton_three_test`: For the coalgebra’s actual exterior operations e_n=λⁿ(x_i), ψ³(x_i)=x_i³−3x_i e_2+3e_3. The exterior API identifies e_2=−c_(i,2), e_3=c_(i,3)−x_i c_(i,2).
- `FreeLambdaRing.not_toric_test`: In L({*}), ψ²(x)≠x² because 2c_2≠0.

### Perfect covers and completed Frobenius from QWittVectors:QW.1 and QW.4

QW.1 owns perfect and perfectly covered Λ-rings with the colimit perfection. The completed étale Frobenius is the interface that HabiroCohomologyFoundations' supplier contract assigns to QW.4: QW.4 imports the existence and uniqueness of the lift from PrismaticCohomology PR.0, namely the complete étale δ-extension of PerfectoidQuotients §0.0 through PrismaticCohomology §0.59. HabiroCohomologyFoundations §0.3 uses the invertibility of its linearization for its overlap equivalences (`EtaleHabiroCoefficients.ghost`). The specifications below fix the interfaces used in Layers 1 and 3–7 and their discriminating tests; they constrain these suppliers and are not a second construction.

<a id="hr-1-the-colimit-perfection"></a>

#### Perfection by Adams transition maps

QW.1 forms A^perf as the filtered colimit of copies of A indexed by positive integers ordered by divisibility, using ψ^{n/m} for m∣n. All ψᵐ become invertible. For a perfect Λ-ring B, a Λ-map f:A→B extends uniquely by [a at m]↦(ψ_Bᵐ)⁻¹f(a). This formula both verifies compatibility with transitions and proves the universal property; naturality, the unit law and the composition law follow from uniqueness.

For a toric polynomial ring the result is ℤ[x_i^r∣r∈ℚ_{≥0}], with finitely supported monomials. The rational exponents describe the colimit, not a completion. A perfect input maps isomorphically to its perfection. This construction gives the third criterion for a perfect cover.

*Needs:* [Adams data][r9].

See [W], §2.5, Remark 2.47, p.32.

The required interface includes:

- `LambdaRing.colimPerfection`: The colimit perfection A_∞ with its Λ-structure.
- `LambdaRing.colimPerfection.of`: The Λ-map A → A_∞ from the stage m = 1.
- `LambdaRing.colimPerfection.isPerfect`: A_∞ is perfect.
- `LambdaRing.colimPerfection.lift`: For f : A → B a Λ-map to a perfect Λ-ring, the unique Λ-map A_∞ → B with lift ∘ of = f.
- `LambdaRing.colimPerfection.map`: A Λ-map A → A' induces A_∞ → A'_∞, with map_id and map_comp.

**Checks.**

- `LambdaRing.colimPerfection_toric`: For toric ℤ[x], A_∞ ≅ ℤ[x^a \| a ∈ ℚ_{≥0}] (the monoid algebra of ℚ_{≥0}) with ψ^m(x^a) = x^(ma); the class of x at stage m is x^(1/m).
- `LambdaRing.colimPerfection_of_isPerfect`: For ℤ, ℚ or any perfect Λ-ring, of : A → A_∞ is an isomorphism.
- `LambdaRing.colimPerfection_lift_apply`: For the toric map ℤ[x] → B = ℤ[x^a \| a ∈ ℚ_{≥0}], the lift sends the class of x^k at stage m to x^(k/m).
- `LambdaRing.toric_colimPerfection_free`: For toric ℤ[x], A → A_∞ = ℤ[x^a \| a ∈ ℚ_{≥0}] is free with basis {x^a : a ∈ ℚ, 0 ≤ a < 1}, in agreement with (ii) ⇔ (iii).

<a id="hr-1-perfectly-covered"></a>

#### Perfectly covered bases

For a Λ-ring A, QW.1 proves that the following conditions are equivalent: A admits a faithfully flat Λ-map to a perfect Λ-ring; every ψᵐ is faithfully flat; the canonical A→A^perf is faithfully flat. The proof uses descent of faithful flatness from a perfect cover and, in the other direction, the filtered colimit presentation of the perfection. Such A is torsion-free, and its Adams twists of an étale algebra have the flatness needed for ordinary and derived reductions to agree. This is the standing hypothesis on the base in HabiroCohomologyFoundations §0.3 and in Layers 4–5 here.

Perfect Λ-rings, ℤ, toric polynomial rings and free arithmetic Λ-rings satisfy the condition. Injectivity alone is insufficient: on ℤ[x,y]/(xy), toric Adams maps are injective but ψ² is not flat. A test of perfect coveredness must therefore retain flatness and faithful flatness, rather than merely monicity of the transition maps.

*Needs:* [Adams data][r9]; [colimit perfection][r20]; `Module.FaithfullyFlat`; `Module.Flat`; `Module.Free.of_basis`; `MvPolynomial.expand`; `DerivedDeRhamCohomology:DD.1`.

See [Q], §1.4, Notation 1.22(e), p.12; §2.2, 2.7, pp.15–16; [W], §2.5, Remark 2.47 and footnote (2.3), p.32.

The required interface includes:

- `LambdaRing.IsPerfectlyCovered`: There is a faithfully flat Λ-map from A into a perfect Λ-ring.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_adams`: (i) ⇔ (ii): every ψ^m is faithfully flat.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_colimPerfection`: (i) ⇔ (iii): A → A_∞ is faithfully flat.
- `LambdaRing.IsPerfect.isPerfectlyCovered`: A perfect Λ-ring is perfectly covered.
- `LambdaRing.isPerfectlyCovered_int`: ℤ is perfectly covered.
- `LambdaRing.isPerfectlyCovered_toric`: Toric ℤ[x_i \| i ∈ I] is perfectly covered.
- `LambdaRing.not_isPerfectlyCovered_toric_xy`: ℤ[x,y]/(xy) with the toric structure is not perfectly covered.
- `LambdaRing.IsPerfectlyCovered.adicCompletion_static`: For R flat over A, the derived p-completion of R ⊗_{A,ψ^m} A is the classical AdicCompletion (DD.1).
- `LambdaRing.IsPerfectlyCovered.adams_flat`: Every Adams twist is flat and faithful; use this for étale ordinary/derived coefficient comparisons. This is a consequence of isPerfectlyCovered_iff_faithfullyFlat_adams, with faithful flatness retained.

**Checks.**

- `LambdaRing.isPerfectlyCovered_int`: ℤ is perfectly covered by the identity ℤ → ℤ, a perfect Λ-ring.
- `LambdaRing.toric_free_over_adams`: ℤ[x] is free over ψ^2(ℤ[x]) = ℤ[x^2] with basis {1, x}; for example x^3 + 5x^2 + 1 = x·x^2 + (5x^2 + 1)·1 with x^2, 5x^2 + 1 ∈ ℤ[x^2].
- `LambdaRing.not_isPerfectlyCovered_toric_xy`: A = ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring (a Λ-quotient of toric ℤ[x,y]) whose ψ^p is not flat: y lies in the x-annihilator of A through ψ^p but not in y^pA. A definition that took perfect covering to be automatic, or only required injectivity of the ψ^m, would accept it (every ψ^m is injective here).
- For a perfect Λ-ring the identity is a faithfully flat perfect cover; this includes the zero ring, without a nontriviality hypothesis.

<a id="hr-1-relative-frobenius-of-an-etale-algebra"></a>

#### Relative Frobenius in characteristic p

If B has characteristic p and S is étale over B, the relative Frobenius S⊗_{B,F_B}B→S, s⊗b↦sᵖb, is an isomorphism. This is an étale statement: S need not be perfect and the absolute Frobenius of B need not be invertible. It follows from the unique étale lifting property, or from the standard étale presentation and Frobenius base-change argument. Its naturality under maps of étale algebras is part of the interface QW.4 supplies.

This is the reduction modulo p of the linearized map specified next. The source and target must use the Frobenius twist; replacing it with the untwisted absolute map changes the assertion.

*Needs:* `Algebra.Etale`; `Algebra.Etale.baseChange`; `Algebra.Etale.of_restrictScalars`; `frobenius`; `Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul`; `AlgebraicGeometry.universallyInjective_eq_diagonal`; `AlgebraicGeometry.Flat.isIso_of_surjective_of_mono`.

See [Q], §2.2, 2.7, p.15.

**Checks.**

- For S=B the map B⊗_{B,F_B}B→B is b⊗c↦b^pc and is an isomorphism even when F_B is not surjective, for example B=𝔽_p[t].

<a id="hr-1-the-etale-frobenius-lift"></a>

#### Completed étale Frobenius

For perfectly covered A and R étale over A, the supplied completed Frobenius is the unique lift of ψᵖ on A to a continuous map φ_{p/A}:R̂_p→R̂_p reducing to r↦rᵖ. Its linearization
\[
 (R\otimes_{A,\psi^p}A)^\wedge_p\longrightarrow\widehat R_p
\]
is an isomorphism. The existence and uniqueness of the lift are the complete étale δ-extension of PerfectoidQuotients §0.0 (`delta_etale_extension`, imported through PrismaticCohomology §0.59), read through the torsion-free δ/Frobenius correspondence of PR.0; on ordinary p-completions they also follow by lifting at each p-power quotient by nilpotent étale rigidity. The first reduction is relative Frobenius, and completeness with the mod-p isomorphism gives invertibility of the linearization. These are the overlap equivalences consumed by HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.ghost`). This does not say that the semilinear map φ itself is an automorphism.

A commutative square with a Λ-map on bases and a compatible ring map on étale algebras intertwines these lifts; no category constructed in HabiroRings is needed for this QW.4 naturality statement. Successive Adams twists give the iteration coherences needed for prime-power chains. A global endomorphism of R is extra data. For R=ℤ[∛2][1/6], the completed lift at 5 moves the cubic generator, while every global endomorphism fixes it; Layer 7 makes this obstruction explicit.

*Needs:* [perfect covers][r19]; [relative Frobenius][r28]; PerfectoidQuotients §0.0 (`delta_etale_extension`); PrismaticCohomology §0.59; `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`; `DerivedDeRhamCohomology:DD.1`; `Algebra.Etale`; `AdicCompletion`; `AdicCompletion.isAdicComplete`; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; `Algebra.FormallyUnramified.ext_of_iInf`; `IsAdicComplete.liftRingHom`.

See [Q], §2.2, 2.7, p.15; Remark 2.8, p.16.

The required interface includes:

- `frobLift`: The Frobenius lift φ_p : R̂_p → R̂_p.
- `frobLift_comp_algebraMap`: φ_p ∘ ι = ι ∘ ψ^p on A.
- `frobLift_sub_pow_mem`: φ_p(x) − x^p ∈ p·R̂_p.
- `frobLift_unique`: A ring endomorphism of R̂_p restricting to ψ^p on A and congruent to x ↦ x^p modulo p equals φ_p.
- `frobLift_toDeltaRing`: R̂_p is a δ-ring (PrismaticCohomology PR.0) with Frobenius φ_p, and Â_p → R̂_p is a δ-map.
- `linearisedFrob`: φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p.
- `linearisedFrob_bijective`: φ_{p/A} is an isomorphism.
- `frobLift_naturality`: For a morphism of pairs (f, g), ĝ_p ∘ φ_p = φ'_p ∘ ĝ_p.
- `linearisedFrob_baseChange`: For A → A' a Λ-map and R' = R ⊗_A A', φ_{p/A'} is the completed base change of φ_{p/A}.
- `frobLift_iterate`: φ_p^k is the unique lift of ψ^(p^k), and its linearisation is an isomorphism.
- `frobLift_self`: For R = A, φ_p is the p-completion of ψ^p on Â_p.
- `frobLift_existsUnique`: On Mathlib's ordinary p-completion, an étale A-algebra has a unique endomorphism extending any given ψ:A→A with ψ(a)≡a^p mod p and reducing to Frobenius modulo p. This ordinary-completion form needs no perfect-cover assumption on A, and no p-torsion-freeness; the relative constructions keep their standing perfectly covered base.

**Checks.**

- `frobLift_gaussian_inert`: A = ℤ, R = ℤ[i][1/2] (étale over ℤ), p = 3: R̂_3 = ℤ_3[i] and φ_3(i) = −i, because φ_3(i)^2 = −1 and φ_3(i) ≡ i^3 = −i mod 3 while i ≢ −i mod 3.
- `frobLift_gaussian_split`: Same R, p = 5: x^2 + 1 ≡ (x + 2)(x − 2) mod 5, R̂_5 ≅ ℤ_5 × ℤ_5 and φ_5 = id (it fixes the idempotents, since φ_5(e) ≡ e^5 = e mod 5, and ℤ_5 has no other endomorphism).
- `frobLift_self`: R = A: φ_p = ψ^p on Â_p and the linearised Frobenius is the identity; for toric A = ℤ[x], φ_p(x) = x^p on ℤ[x]^∧_p.
- `no_global_frobenius`: A = ℤ, R = ℤ[2^(1/3), 1/6] (étale: 3x^2 is a unit where x^3 = 2). Every ring endomorphism of R is the identity (ℚ(2^(1/3)) has no nontrivial automorphism), and the identity is not a Frobenius lift at 5: x^3 − 2 ≡ (x + 2)(x^2 − 2x − 1) mod 5 with irreducible quadratic factor, so R/5R ≅ 𝔽_5 × 𝔽_25, where x ↦ x^5 is not the identity. Yet φ_5 exists on R̂_5 ≅ ℤ_5 × W(𝔽_25).

### Finite q-Witt input from QWittVectors:QW.1–QW.4

The following finite q-Witt interfaces are used by HabiroCohomologyFoundations §0.3 and by Layers 4–7. They supply quotients and compatible Frobenius/ghost diagrams; the completed deformation of these quotients is the HabiroCohomologyFoundations §0.3 interface specified next.

<a id="hr-4-truncated-big-witt-vectors"></a>

#### Truncated big Witt vectors

For a divisor-stable truncation set S, W_S(R) has underlying coordinates R^S and universal integral ring laws for which the ghosts gh_n=Σ_{d∣n}d a_d^{n/d} are ring maps. Construct the laws on universal torsion-free rings and specialize to arbitrary R. The API includes natural maps, restrictions, multiplicative Teichmüller lifts, Frobenius and additive Verschiebung with their exact truncation indices.

Ghosts are jointly injective on torsion-free R. The identity F_nV_n=n is a scalar identity on the appropriate source; V_nF_n is not generally multiplication by n. The p-typical subtruncation translates {1,p,…,p^a} to Mathlib length a+1. These are imported big Witt objects, rather than redefinitions of Mathlib's p-typical vectors.

*Needs:* [Adams data][r9]; `WittVector`; `TruncatedWittVector`; `WittVector.ghostComponent`; `WittVector.frobenius`; `WittVector.verschiebung`; `WittVector.teichmuller`; `Nat.divisors`.

See [W], §2.2, 2.6, p.10; Remark 2.7, p.11; §2.4, 2.31, p.26.

<a id="hr-4-q-witt-vectors"></a>

#### Absolute q-Witt vectors

For m≥1, q-W_m(R) is W_m(R)[q] modulo the q-FV ideal. Its generators are (qᵈ−1)im(V_{m/d}) for d∣m and the images of
\[
 [d/e]_{q^e}\,V_{m/d}-V_{m/e}F_{d/e}\qquad(e\mid d\mid m).
\]
It is initial among the compatible q-Frobenius–Verschiebung systems. In particular FV=m/d while VF=[m/d]_{q^d}; these two relations must remain distinct. For prime-torsion-free coefficients the relative cyclotomic ghost components provide joint injectivity in the indicated q-Witt setting.

At q=1 this quotient is not automatically the original big Witt ring. The relation qᵐ−1=0 belongs to the construction, and the absence of ordinary restriction maps is a feature of its cyclotomic quotients, not a missing choice of coordinate projection.

*Needs:* [Big Witt operations][r2]; `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`; `Polynomial.cyclotomic`; `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

See [W], §2.2, Definition 2.8, Lemma 2.9 and Remark 2.11, p.11; 2.13, p.13; §2.2, Lemma 2.23, p.20.

<a id="hr-4-the-lambda-ring-comparison-maps"></a>

#### The maps s_m and c_m

For a Λ-ring A, restrict its Witt section to obtain s_m:A→W_m(A). Its ghost at m/d is ψ^{m/d}. Define auxiliary additive maps ε_d recursively by
gh_m=Σ_{d∣m}d ψ^{m/d}ε_d Res_d^m. Then the comparison map c_m:q-W_m(A)→A[q]/(qᵐ−1) is given by
\[
 c_m=\sum_{d\mid m}[d]_{q^{m/d}}\,\psi^{m/d}\,\epsilon_d\,\mathrm{Res}_d^m.
\]
Its Φ_d-component is ψᵈgh_{m/d}; it sends Frobenius to the quotient projection, Verschiebung to the corresponding q-integer, and c_ms_m to ψᵐ.

When all Adams operations are injective, its image is the specified sum of twisted coordinate images; when A is perfect it is an isomorphism. These formulas establish the coefficient action used in the relative quotient, not an a priori untwisted A-algebra structure on q-W_m(R).

*Needs:* [Absolute q-Witt][r21]; [Big Witt operations][r2]; [Adams data][r9]; `Polynomial.cyclotomic`.

See [W], §2.4, 2.31, p.26; Lemma 2.34, p.27; Corollary 2.35, p.28; Corollary 2.37, p.29.

<a id="hr-4-relative-q-witt-rings"></a>

#### Relative q-Witt vectors

For A→R with A a Λ-ring, first tensor q-W_m(R) over q-W_m(A) with A[q]/(qᵐ−1) through c_m. Then quotient by the ideal generated by
V_{m/d}(xy)⊗1−V_{m/d}(x)⊗c_d(y), for d∣m, x∈q-W_d(R), y∈q-W_d(A). The resulting q-W_m(R/A) is initial for relative q-FV systems over A. Its cyclotomic ghost at d takes values in (R⊗_{A,ψᵈ}A)[q]/Φ_d(q).

The construction is natural in commutative squares of a Λ-map on bases and a compatible ring map on algebras, without requiring either algebra to be étale or either base to be perfectly covered. It commutes with coefficient base change in the specified relative form. For R=A, the relative ring is A[q]/(qᵐ−1); for A=ℤ it is the absolute q-Witt ring. A perfect Λ-base gives the naive comparison isomorphism. A toric Λ-base need not be perfect, so its absolute q-Witt ring is not automatically its relative self-ring.

*Needs:* [Absolute q-Witt][r21]; [s_m and c_m](#hr-4-the-lambda-ring-comparison-maps); [Adams data][r9]; [perfect covers][r19].

See [W], §2.5, Definition 2.40 and Lemma 2.41, p.30; 2.44, p.31; Lemma 2.46, pp.31–32; Remark 2.47, p.32.

<a id="hr-4-q-witt-vectors-of-etale-maps"></a>

#### Étale q-Witt maps and Frobenius pushouts

For an étale map A→R, the induced maps of truncated big Witt and q-Witt rings are étale, and the Frobenius squares are pushouts. For m and d∣m, the Frobenius edge has target W_d or q-W_d, and index m/d; this fixes the source's conflicting target index in the display of Proposition 2.48.

The proof applies étale base change for the big Witt Frobenius, then checks the defining q-FV relations and the quotient presentation. The relative quotient consequently gives an étale algebra over A[q]/(qᵐ−1). The pushout squares are also derived pushouts because the relevant maps are flat.

*Needs:* [Relative q-Witt][r24]; [Absolute q-Witt][r21]; [Big Witt operations][r2]; `Algebra.Etale`.

See [W], §2.6, Proposition 2.48 and Lemma 2.50, p.33; [Q], §2.2, paragraph before Theorem 2.9, p.16.

<a id="hr-4-ghost-maps-and-etale-base-change"></a>

#### Relative ghost squares

For an étale A-algebra R, each relative cyclotomic ghost square is a pushout over the corresponding comparison map c_m and twisted ghost of A. Thus reducing q-W_m(R/A) along Φ_d gives (R⊗_{A,ψᵈ}A)[q]/Φ_d. The statement is both ordinary and derived: étale flatness removes higher Tor in these squares.

These identifications are compatible with q-Frobenius, maps of pairs and the linearized completed Frobenius on prime edges. They supply the reduced gluing datum in the proof of the finite-stage comparison; just knowing the individual ghost quotient rings without their commuting squares would be insufficient.

*Needs:* [Étale q-Witt pushouts][r25]; [Relative q-Witt][r24].

See [W], §2.6, Corollary 2.51, p.34; [Q], §2.2, proof of Theorem 2.9, p.17.

<a id="hr-4-there-is-no-restriction-map"></a>

#### The obstruction to Witt restriction

Ordinary Witt restriction cannot generally extend to the cyclotomic q-Witt quotients while commuting with the full projection to the divisor cyclotomic quotient. For m=p^α, the proposed restriction would have to annihilate a class whose image in the target is the nonzero scalar p, contradicting the required quotient compatibility. The obstruction is formulated for that entire commuting diagram, not as the claim that no ring homomorphism between the two rings exists.

In characteristic p special maps can exist: for example a map ℤ/4→𝔽₂ is not prohibited by a contradiction requiring p to survive in the target. The relative Habiro transitions are therefore identified with Frobenius, whose quotient compatibility is the correct one.

*Needs:* [Absolute q-Witt][r21]; [Big Witt operations][r2]; `Polynomial.cyclotomic_prime_pow_eq_geom_sum`; `Polynomial.cyclotomic.dvd_X_pow_sub_one`.

See [W], §1.3, p.3; §2.2, 2.14, p.13.

<a id="hr-4-an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift"></a>

#### Naive quotients force global Frobenius

Let R be étale over ℤ, and let R→R̂_p be injective for a prime p dividing m. A ℤ[q]-algebra isomorphism q-W_m(R)≅R[q]/(qᵐ−1) forces a global Frobenius lift R→R compatible with the completed lift at p. The forced maps at admissible primes commute. Use the ghost/Frobenius pushout identities to recover the endomorphism on coefficients and the injection into R̂_p to descend its equality.

This is an obstruction theorem with a specified polynomial-algebra structure. An unmarked abstract ring isomorphism would not supply the same conclusion. Layer 7 applies it at p=5 to R=ℤ[∛2][1/6], where the global endomorphisms and the completed Frobenius cannot agree.

*Needs:* [Étale q-Witt pushouts][r25]; [Ghost squares][r26]; [Absolute q-Witt][r21]; [completed Frobenius][r27]; [Adams data][r9].

See [W], §2.6, Corollary 2.52, p.35.

The API comprises:

- `BigWittVector`: BigWittVector S R, the S-truncated big Witt ring, a commutative ring whose underlying set is R^S.
- `BigWittVector.ghost`: gh_n: W_S(R) → R for n ∈ S, gh_n(x) = Σ_{d\|n} d·x_d^{n/d}, a ring map.
- `BigWittVector.ghost_injective`: If R is ℤ-torsion-free, x ↦ (gh_n(x))_{n∈S} is injective.
- `BigWittVector.frobenius`: F_{m/d}: W_m(R) → W_d(R) for d \| m, a ring map with gh_e ∘ F_{m/d} = gh_{(m/d)e}.
- `BigWittVector.verschiebung`: V_{m/d}: W_d(R) → W_m(R) for d \| m, additive, with gh_e ∘ V_n = n·gh_{e/n} if n \| e and 0 otherwise.
- `BigWittVector.restrict`: Res_{m/d}: W_m(R) → W_d(R), restriction of coordinates to T_d, a ring map commuting with gh_e for e \| d.
- `BigWittVector.teichmuller`: τ_m: R → W_m(R), multiplicative, with gh_e(τ_m(r)) = r^e.
- `BigWittVector.frobenius_comp`: F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e} for e \| d \| m.
- `BigWittVector.frobenius_verschiebung`: F_n ∘ V_n = n, and F_n ∘ V_k = V_k ∘ F_n when (k, n) = 1.
- `BigWittVector.frobenius_teichmuller`: F_{m/d}(τ_m(r)) = τ_d(r)^{m/d}.
- `BigWittVector.eq_sum_verschiebung_teichmuller`: x = Σ_{d\|m} V_{m/d}(τ_d(x_{m/d})) for x = (x_d)_{d\|m}.
- `BigWittVector.restrict_verschiebung`: Res_{m/d} ∘ V_n = V_n ∘ Res if n \| d, and Res_{m/d} ∘ V_n = 0 if n ∤ d.
- `BigWittVector.map`: A ring map R → R′ induces W_S(R) → W_S(R′) coordinatewise, commuting with gh, F, V, Res and τ; map_id and map_comp.
- `BigWittVector.equivTruncatedWittVector`: For p prime and m = p^n, W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R via x ↦ (x_{p^i})_{i≤n}, identifying gh_{p^k} with WittVector.ghostComponent k (k ≤ n) and F_p, V_p, τ with the p-typical operators.
- `BigWittVector.lambdaSection`: For a Λ-ring A (QW.0–QW.1), s: A → W_S(A) with gh_n(s(x)) = ψ^n(x); for torsion-free A it exists by Dwork's criterion with the Frobenius lifts ψ^p.
- `QWittVector`: q-W_m(R) := W_m(R)[q]/I_m, an algebra over ℤ[q]/(q^m − 1).
- `QFVSystem`: q-FV-systems of rings over R (q-Witt Definition 2.8) and their morphisms.
- `QWittVector.ofWitt`: The surjection W_m(R)[q]/(q^m − 1) → q-W_m(R).
- `QWittVector.frobenius`: F_{m/d}: q-W_m(R) → q-W_d(R), a ℤ[q]-algebra map, for d \| m.
- `QWittVector.verschiebung`: V_{m/d}: q-W_d(R) → q-W_m(R), ℤ[q]-linear, for d \| m.
- `QWittVector.frobenius_verschiebung`: F_{m/d} ∘ V_{m/d} = m/d.
- `QWittVector.verschiebung_frobenius`: V_{m/d} ∘ F_{m/d} = [m/d]_{q^d}.
- `QWittVector.frobenius_comp`: F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e}.
- `QWittVector.lift`: For every q-FV-system (W_m) over R, the unique morphism of systems q-W_•(R) → W_•; lift ∘ ofWitt is the structure map, and uniqueness.
- `QWittVector.truncatedLift`: Initiality among S-truncated q-FV-systems for every truncation set S (Remark 2.12).
- `QWittVector.ghost`: gh_{m/d}: q-W_m(R) → R[q]/Φ_d(q), gh_{m/d} = gh_1 ∘ F_{m/d}, and gh_{m/d} ∘ ofWitt is the classical gh_{m/d} followed by R → R[ζ_d].
- `QWittVector.ghost_one_eq_quotient`: gh_1 identifies R[q]/Φ_m(q) with q-W_m(R)/(im V_p : p prime, p \| m).
- `QWittVector.ghost_jointly_injective`: If R is p-torsion-free for all primes p \| m, (gh_{m/d})_{d\|m} is injective (Lemma 2.23).
- `QWittVector.teichmuller`: τ_m: R → q-W_m(R), multiplicative, the image of the Witt Teichmüller lift.
- `QWittVector.map`: Ring maps R → R′ induce q-W_m(R) → q-W_m(R′) compatible with F, V, gh and τ; map_id and map_comp.
- `Polynomial.span_geomSum_eq_span_cyclotomic`: q-Witt Lemma 2.2: in ℤ[q], the ideal generated by the [p]_{q^{m/p}} for the primes p \| m is (Φ_m(q)).
- `QWittVector.trivialMap`: s_m: A[q]/(q^m − 1) → q-W_m(A).
- `QWittVector.ghost_trivialMap`: gh_{m/d} ∘ s_m = ψ^{m/d} ∘ (A[q]/(q^m − 1) → A[q]/Φ_d(q)).
- `BigWittVector.epsilon`: ε_m: W_m(A) → A with gh_m(x) = Σ_{d\|m} d·ψ^{m/d}(ε_d(Res_{m/d}(x))).
- `QWittVector.cyclicMap`: c_m: q-W_m(A) → A[q]/(q^m − 1), a ring map.
- `QWittVector.cyclicMap_ofWitt`: c_m on the image of x ∈ W_m(A) is Σ_{d\|m} [d]_{q^{m/d}} ψ^{m/d}(ε_d(Res_{m/d}(x))).
- `QWittVector.cyclicMap_mod_cyclotomic`: c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q) for d \| m.
- `QWittVector.cyclicMap_frobenius`: (A[q]/(q^m − 1) → A[q]/(q^d − 1)) ∘ c_m = c_d ∘ F_{m/d}.
- `QWittVector.cyclicMap_verschiebung`: c_m ∘ V_{m/d} = [m/d]_{q^d} · c_d.
- `QWittVector.cyclicMap_trivialMap`: c_m ∘ s_m = ψ^m, extended ℤ[q]-linearly.
- `QWittVector.cyclicMap_injective`: If every ψ^m is injective, c_m is injective with image Σ_{d\|m} [d]_{q^{m/d}} ψ^{m/d}(A)[q]/(q^m − 1).
- `QWittVector.cyclicMapEquivOfPerfect`: For a perfect Λ-ring A, s_m and c_m are isomorphisms.
- `QWittVector.cyclicMap_natural`: c_m and s_m are natural in maps of Λ-rings.
- `RelQWittVector`: q-W_m(R/A), an A[q]/(q^m − 1)-algebra.
- `RelQFVSystem`: Relative q-FV-systems (q-Witt Definition 2.40) and their morphisms.
- `RelQWittVector.mk`: The surjection q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m − 1) → q-W_m(R/A).
- `RelQWittVector.frobenius`: F_{m/d}: q-W_m(R/A) → q-W_d(R/A), an A[q]-algebra map, for d \| m.
- `RelQWittVector.verschiebung`: V_{m/d}: q-W_d(R/A) → q-W_m(R/A), A[q]-linear, for d \| m.
- `RelQWittVector.frobenius_verschiebung`: F_{m/d}V_{m/d} = m/d, V_{m/d}F_{m/d} = [m/d]_{q^d}, and the composition laws along chains of divisors.
- `RelQWittVector.lift`: The unique morphism from q-W_•(R/A) to any relative q-FV-system over R, with its compatibility with mk.
- `RelQWittVector.ghost`: gh_{m/d}: q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q), with gh_{m/d} = gh_{d/d} ∘ F_{m/d}.
- `RelQWittVector.ghost_top_eq_quotient`: gh_{m/m} is the quotient of q-W_m(R/A) by the images of the V_{m/d}, d ≠ m.
- `RelQWittVector.map`: A morphism of pairs (A, R) → (A′, R′) (a Λ-map A → A′ and a compatible R → R′) induces q-W_m(R/A) → q-W_m(R′/A′) compatible with F, V and gh; map_id and map_comp.
- `RelQWittVector.baseChangeEquiv`: q-W_m(R/A) ⊗_A A′ ≅ q-W_m(R ⊗_A A′/A′) for a map of Λ-rings A → A′ (Lemma 2.46).
- `RelQWittVector.selfEquiv`: q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection and V_{m/d} multiplication by [m/d]_{q^d}.
- `RelQWittVector.equivAbsolute`: For A = ℤ, q-W_m(R/ℤ) ≅ q-W_m(R) (q-Witt Remark 2.47 with the perfect Λ-ring ℤ).
- `RelQWittVector.ghost_jointly_injective`: For A perfectly covered and R p-torsion-free for all primes p \| m, the relative ghost maps gh_{m/d} (d \| m) are jointly injective.
- `RelQWittVector.cyclicMap`: For a Λ-A-algebra R, c_{m/A}: q-W_m(R/A) → R[q]/(q^m − 1) and s_{m/A}: R ⊗_{A,ψ^m} A[q]/(q^m − 1) → q-W_m(R/A), with c_{m/A} ∘ s_{m/A} the linearised Adams operation (2.45).
- `RelQWittVector.cyclicMapEquiv`: For A perfectly covered and R relatively perfect over A (R carries a Λ-structure for which A → R is a Λ-map and the linearised Adams maps R ⊗_{A,ψ^m} A → R are bijective), s_{m/A} and c_{m/A} are isomorphisms (Remark 2.47).

**Checks.**

- `BigWittVector.ghost_two_int`: For R = ℤ and m = 2, (gh_1, gh_2): W_2(ℤ) → ℤ × ℤ, (x_1, x_2) ↦ (x_1, x_1^2 + 2x_2), is injective with image {(a, b) : a ≡ b mod 2}.
- `BigWittVector.verschiebung_frobenius_ne`: In W_2(ℤ), V_2(F_2(1)) = V_2(1) has ghost vector (0, 2), while 2 has ghost vector (2, 2); so V_2 ∘ F_2 ≠ 2, although F_2 ∘ V_2 = 2.
- `BigWittVector.teichmuller_two`: τ_2(2) = (2, 0) in W_2(ℤ) has ghost vector (2, 4), and every x = (x_1, x_2) in W_2(R) equals τ_2(x_1) + V_2(τ_1(x_2)).
- `BigWittVector.equivTruncatedWittVector_ghost`: For p prime and n ≥ 0, under W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R the ghost map gh_{p^k} (k ≤ n) is Mathlib's WittVector.ghostComponent k, the Witt polynomial Σ_{i≤k} p^i X_i^{p^{k−i}}.
- `BigWittVector.restrict_two`: Res_2: W_2(R) → W_1(R) = R is (x_1, x_2) ↦ x_1 = gh_1(x), and Res_2(V_2(1)) = 0.
- `BigWittVector.one`: W_1(R) = R with gh_1 the identity, and F_1, V_1 and Res_1 are identities.
- `QWittVector.two_int`: q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1), with 1 ↦ 1 and the class of V_2(1) ↦ 1 + q: the generator (1 + q)·1 − V_2F_2(1) of I_2 forces V_2(1) = 1 + q, and then (q − 1)V_2(1) = q^2 − 1 = 0.
- `QWittVector.frobenius_verschiebung_two`: In q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1), F_2 is q ↦ 1 onto ℤ = q-W_1(ℤ), F_2(V_2(1)) = 2 and V_2(F_2(1)) = 1 + q = [2]_q.
- `QWittVector.teichmuller_two`: τ_2(2) = 3 + q in q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1); its ghost values are 2 at q = −1 and 4 at q = 1.
- `QWittVector.not_naive_quotient`: q-W_2(ℤ) has ℤ-rank 2 while W_2(ℤ)[q]/(q^2 − 1) has rank 4: the generators of the second kind cannot be omitted.
- `QWittVector.not_q_deformation`: q-W_2(ℤ)/(q − 1) ≅ ℤ, whereas W_2(ℤ) has ℤ-rank 2.
- `QWittVector.ghost_not_injective_F2`: q-W_2(F_2) ≅ W_2(F_2) ≅ ℤ/4 with q acting as 1 (the generator (1 + q)x − V_2F_2(x) = (q − 1)x forces q = 1); both ghost maps are the reduction ℤ/4 → F_2 and kill 2, so without p-torsion-freeness the ghost maps are not jointly injective.
- `QWittVector.ofWitt_small`: W_2(ℤ) → q-W_2(ℤ) is a ring isomorphism (1 ↦ 1, V_2(1) ↦ 1 + q), while W_4(ℤ) → q-W_4(ℤ) ≅ ℤ[q]/(q^4 − 1) is injective (q-Witt Proposition 2.28) but not surjective (ℤ-ranks 3 and 4).
- `QWittVector.one`: q-W_1(R) ≅ R, with q acting as 1.
- `QWittVector.cyclicMap_two_int`: For A = ℤ (all ψ^n the identity), c_2(x) = gh_1(x) + (1 + q)·(gh_2(x) − gh_1(x))/2 on W_2(ℤ); for example c_2(V_2(1)) = 1 + q and c_2(τ_2(2)) = 3 + q.
- `QWittVector.cyclicMap_eval_two_int`: For A = ℤ, c_2(x) at q = −1 is gh_1(x) and at q = 1 is gh_2(x), as c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q) requires.
- `QWittVector.cyclicMap_trivialMap_toric`: For A = ℤ\[T\] with ψ^p(T) = T^p, s_2(T) = τ_2(T) and c_2(s_2(T)) = T^2 = ψ^2(T).
- `QWittVector.cyclicMap_range_toric`: For A = ℤ\[T\] with ψ^p(T) = T^p, the image of c_2 is ℤ[T^2, q]/(q^2 − 1) + (1 + q)·ℤ[T, q]/(q^2 − 1), which does not contain T (its image under q ↦ −1 is ℤ[T^2]); so c_2 does not identify q-W_2(ℤ\[T\]) with ℤ\[T\][q]/(q^2 − 1).
- `QWittVector.cyclicMap_one`: For m = 1, s_1 and c_1 are the identity of A.
- `QWittVector.cyclicMapEquivOfPerfect_int`: q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) for all m; for m = 2 this agrees with the isomorphism of the q-Witt vector test, c_2(V_2(1)) = 1 + q.
- `RelQWittVector.one`: q-W_1(R/A) ≅ R.
- `RelQWittVector.selfEquiv_ops`: q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection onto A[q]/(q^d − 1) and V_{m/d} multiplication by [m/d]_{q^d}; hence F_{m/d}V_{m/d} = [m/d]_{q^d} mod (q^d − 1) = m/d.
- `RelQWittVector.equivAbsolute_two`: For A = ℤ, q-W_2(ℤ/ℤ) ≅ ℤ[q]/(q^2 − 1) ≅ q-W_2(ℤ), and in general q-W_m(R/ℤ) ≅ q-W_m(R).
- `RelQWittVector.relative_ne_absolute_toric`: For A = R = ℤ\[T\] with ψ^p(T) = T^p, q-W_2(ℤ\[T\]/ℤ\[T\]) ≅ ℤ\[T\][q]/(q^2 − 1), whereas c_2 identifies the absolute q-W_2(ℤ\[T\]) with a subring not containing T: the relative and absolute rings differ.
- `RelQWittVector.ghost_toric`: For A = R = ℤ\[T\], the relative ghost maps of q-W_2(A/A) = A[q]/(q^2 − 1) are the projections to A[q]/(q + 1) and A[q]/(q − 1) (after a ⊗ b ↦ ψ^d(a)b identifies A ⊗_{A,ψ^d} A with A), and they are jointly injective because A is 2-torsion-free.

### Habiro completion, finite descent and étale coefficient lifts from HabiroCohomologyFoundations

HabiroCohomologyFoundations precedes this roadmap. Its Layer 0 constructs, on the actual enhanced D(A[q]) for every commutative ring A, the specialized Habiro completion, finite cyclotomic descent and the étale coefficient lifts, from DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0/E5, QWittVectors QW.1–QW.4 and PrismaticCohomology PR.0; it assumes no ordinary Habiro-ring presentation or Taylor expansion theorem. The interfaces below are consumed in the Laurent convention of §2.1. Their checks are the tests that fix the conventions under which this roadmap uses them.

<a id="hr-2-completeness-via-the-factorial-tower"></a>

#### Habiro completion and its factorial tower

From **HabiroCohomologyFoundations §0.1** use `HabiroComplete.reflect` and `HabiroComplete.tower`. For B=A[q], with S generated by all f_m and C=fib(B→S⁻¹B), the complete subcategory consists of the M with RHom_B(S⁻¹B,M)=0. Its reflection is L_H(M)=RHom_B(C,M), with unit induced by C→B, initial among maps to complete objects, idempotent and the identity on complete objects. It is computed by the natural equivalences
\[
 L_HM\simeq\lim_{m\mid n}M^\wedge_{f_m}\simeq\lim_N M/P_N,
\]
compatible with the projections and with restriction to factorials. In the divisibility limit the arrows go from a larger divisible index to a smaller one, and all completions and quotients are derived. This is a derived completion functor, not the operation of inverting every f_m: it kills S⁻¹B-modules and fixes complete objects. Layers 2, 5 and 6 use this reflection through §2.1; no second completion functor is constructed here.

(See [Q], Appendix B, B.1 and Lemma B.2, pp.77–78.)

**Checks.**

- For A=ℤ the reflection of the Laurent unit is lim_N ℤ[q]/P_N, the classical integral Habiro ring of HC.1. Already at the second stage q is a unit, since q(1+q−q²)−1=−P₂.
- The first limit is indexed by divisibility, with transition maps M^∧_{f_n}→M^∧_{f_m} for m∣n induced by f_m∣f_n. Ordering the indices by size gives no such system: f_2 does not divide f_3, so there is no completion map from the m=3 term to the m=2 term. Factorials are cofinal for divisibility, which gives the second formula.
- For M=ℤ with q acting as 1, every f_m acts by zero, so M is complete and the tower returns M. Its derived quotient by q−1 is ℤ⊕Σℤ. A tower of ordinary quotients would lose the suspended copy.

<a id="hr-2-the-derived-nakayama-lemma"></a>
<a id="hr-2-the-detection-results"></a>

#### Cyclotomic detection

From **HabiroCohomologyFoundations §0.1** use `HabiroComplete.detect`. On complete objects the derived reductions M/Φ_d(q), d≥1, jointly detect zero objects and equivalences. If a fixed homotopy degree of every M/Φ_d vanishes, the same degree of M vanishes. In particular a complete M whose derived cyclotomic reductions are all static is static, and a static complete module whose ordinary quotients M/Φ_dM all vanish is zero. Layer 5 uses the degreewise form for the staticity of the ordinary ring, and §§2.3 and 2.7 use it for homotopy bounds.

(See [Q], Appendix B, Lemma B.3 and Corollary B.4, p.78; Remark B.5, p.79; §2.2, proof of Theorem 2.9, p.17.)

**Checks.**

- Completeness is needed: R_r has every cyclotomic reduction zero and is nonzero. Its reflection is zero, so it neither contradicts nor extends detection to all modules.
- Staticity is detected in one direction only. The static module ℤ with q acting as 1 has a derived quotient by q−1 containing Σℤ. Layer 5 verifies static derived reductions and never uses the converse.

#### Completed tensor

From **HabiroCohomologyFoundations §0.1** use `HabiroComplete.tensor`: M⊗̂_HN=L_H(M⊗^L_BN) on complete objects, with unit L_H(B), its associativity, unit and symmetry coherences, and L_H(L_HM⊗^L_B L_HN)≃L_H(M⊗^L_BN); its f_m-completion is the f_m-completed derived tensor of the f_m-completions. It is the symmetric monoidal structure on the full subcategory of complete modules, not on the module category of the ordinary ring π₀L_H(B). The completed tensor of Layers 2 and 6, and of the downstream scalar consumers, is this one; §2.5 proves its Laurent and coefficient base-change compatibilities.

(See [Q], Appendix B, B.1, p.77; §2.1, Setup 2.1(c), p.13.)

<a id="hr-3-coherent-completion-diagram"></a>
<a id="hr-3-finite-localisation-contract"></a>
<a id="hr-3-reconstruction-functor"></a>
<a id="hr-3-the-morphism-level-statement"></a>
<a id="hr-3-the-complete-descent-corollary"></a>
<a id="hr-3-the-fracture-square-pieces"></a>

#### Finite cyclotomic complete descent

From **HabiroCohomologyFoundations §0.2** use finite cyclotomic complete descent for every commutative A and m≥1. On the poset of nonempty subsets U of the divisors of m it takes the category complete along (Φ_d(q):d∈U), in presentable stable symmetric monoidal categories with completed scalar-extension restrictions. Its limit recovers the f_m-complete category, and the same holds for E∞-algebras. By right Kan extension the diagram reduces to Φ_d-complete singleton terms E_d and p-primary chains {d,pd,…,p^a d}, with p prime, p∤d and marked equivalences (E_{pd})^∧_p≃(E_d)^∧_p over the common (p,Φ_d)-complete base. The consumed API is:

- `CyclotomicCompleteDescent.reconstruct`: reconstruction as an enhanced finite homotopy limit, inverse to restriction, with Φ_d-completion naturally E_d. Because it inverts an equivalence, the space of reconstructions of fixed marked local data is contractible; HabiroRings uses this consequence.
- `CyclotomicCompleteDescent.maps`: mapping spaces are the limit of the intersection mapping-space diagram, with every comparison homotopy retained.
- `CyclotomicCompleteDescent.arithmetic`: for m=p^αn with p∤n, E^∧_p≃∏_{d∣n}(E_{p^i d})^∧_p for any 0≤i≤α; after inverting m and then f_m-completing, the reconstruction is the product of the correspondingly completed singleton terms.
- `CyclotomicCompleteDescent.divisor`: for n∣m, restriction of the cover computes f_n-completion, with identity, composition and higher compatibility laws.
- `CyclotomicCompleteDescent.naturality`: completed coefficient extension and semilinear maps preserving q and the completion ideals commute with reconstruction and its projections.

§§3.1–3.4 compute the index that this reduction uses, and §3.6 unravels `CyclotomicCompleteDescent.maps` on it. Layers 4 and 5 use reconstruction, the fracture pieces and naturality.

(See [Q], §2.1, Setup 2.1 and Lemma 2.2, pp.13–14; Remark 2.3 and Corollary 2.4, pp.14–15; Remark 2.5, p.15; [W], §2.1, Lemma 2.1, p.8.)

**Checks.**

- At m=4 the overlap {1,4} is nonempty, (2,q−1)-complete, and is not a vertex of the reduced index. Its comparison is the composite of the edge equivalences at (p,d)=(2,1) and (2,2), not a third independent datum.
- At m=6 the overlap of {1} and {2} is (2,q−1)-completion, whereas Φ₆(1)=1 makes {1,6} the unit ideal and its category zero. Overlaps are completions along I_S+I_T and are not declared empty or nonempty by the divisibility of their members.
- For E_d=A[q]^∧_{Φ_d} with the canonical common-completion identifications, reconstruction is A[q]^∧_{f_m} as a complete E∞-A[q]-algebra. The zero marked section reconstructs the zero algebra.
- At m=2 put t=q²−1 and E=ℤ[q]^∧_t. The series Σ_{r≥0}t^r/2^r lies in (E[1/2])^∧_t but not in E[1/2], whose elements have bounded denominators. The rational fracture piece keeps its completion.

<a id="hr-4-cyclotomic-ghost-lift-coherence"></a>
<a id="hr-4-the-etale-lift"></a>
<a id="hr-4-the-transitions-are-frobenius"></a>
<a id="hr-4-the-limit-of-the-finite-stages-is-static"></a>

#### Étale coefficient lifts

From **HabiroCohomologyFoundations §0.3**, for a perfectly covered Λ-ring A and an étale A-algebra R, use the following interface.

- `EtaleHabiroCoefficients.partial`: E_m(R/A), the f_m-complete formally étale lift of qW_m(R/A) over A[q]/f_m with its specified reduction marking, functorial in étale A-algebras.
- `EtaleHabiroCoefficients.unique`: the spaces of marked formally étale complete lifts, and of compatible maps lifting a fixed map, are contractible. With it HabiroRings uses the equivalence, proved in the same subsection §0.3, between f_m-complete E∞-A[q]-algebras with étale reduction and étale A[q]/f_m-algebras, given by reduction.
- `EtaleHabiroCoefficients.ghost`: the Φ_d-completion of E_m is (R⊗_{A,ψ^d}A)[q]^∧_{Φ_d}, and the prime-edge overlaps are the linearized completed Frobenius equivalences of QW.4, compatible with the marked relative ghost maps.
- `EtaleHabiroCoefficients.transition`: for n∣m, E_m→E_n reduces to F_{m/n}:qW_m(R/A)→qW_n(R/A) and exhibits E_n as (E_m)^∧_{f_n}, with identity and coherent composition laws.
- `EtaleHabiroCoefficients.limit`: the static Habiro-complete E(R/A)=lim_k E_{k!}(R/A), its partial completions and its canonical h-completion E(R/A)→E_1(R/A)=R⟦h⟧.

Each E_m and E(R/A) is static. Since the derived quotient E_m/f_m is the static qW_m(R/A), it follows here that f_m is a non-zero-divisor on E_m and that ordinary and derived quotients agree; §5.1 uses this consequence. The étale hypothesis on R is part of the statement; the displayed statement of [Q], Theorem 2.9 abbreviates it. The overlaps use completed Frobenius, not a global Adams operation on R. Layer 4 writes H_{R/A,m}=E_m(R/A) and extends this functoriality to morphisms of pairs; §5.1 takes the ordinary ring of E(R/A).

(See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; Theorem 2.9 and proof, pp.16–17; Remark 2.10, p.17; [W], §2.6, Proposition 2.48 and Corollary 2.51, pp.33–34.)

**Checks.**

- At m=1 there are no prime edges and H_{R/A,1}=R⟦q−1⟧. For R=ℤ[1/2] over ℤ this lift contains Σ_n(q−1)ⁿ/2ⁿ, so it is not ℤ⟦q−1⟧[1/2]; a lift with bounded denominators is not complete.
- The marking is data. For R=A×A the lift splits as two copies of E_m(A/A), and the swap of the factors reduces to the transposition of qW_m(A/A)², which moves (1,0) whenever A≠0. An unmarked existence statement would not determine the contractible solution space.
- The static quotient cannot replace the lift. For A≠0 the static algebra A[q]/f_m has derived reduction by f_m with π₁=A[q]/f_m≠0, whereas the reduction of the lift E_m(A/A)=A[q]^∧_{f_m} is static because f_m is regular on A[q]. For R=0 every lift and the limit are zero.
- For d∣m the transition reduces to Frobenius F_{m/d}. Ordinary Witt restriction does not extend to the cyclotomic q-Witt quotients compatibly with the projections (the obstruction to Witt restriction above), so the inverse system lifts Frobenius, not restriction.

<a id="hr-6-the-degree-zero-identification"></a>

#### Étale Habiro–Hodge identification

From **HabiroCohomologyFoundations §4.21** (`HabiroHodge.etale`, `HabiroHodge.etaleModel`) and its export **§4.28** (`HabiroHodgeDescent.etale`) use the following. For perfectly covered A and étale R, the Habiro–Hodge object H(R,F) of any chosen q-Hodge filtration is static and naturally E∞-equivalent to E(R/A). The equivalence respects the partial completions, the relative ghosts, the transitions and the h-completion map to R⟦h⟧. The empty-frame completed filtration on R⟦h⟧ is h-adic, and the filtration on the animated complex is its derived pullback. With §5.1 this identifies the étale Habiro–Hodge object with the ring H_{R/A}. No target here depends on this identification. It records the passage between the cohomological and arithmetic descriptions that HabiroNahmSeries and HabiroCohomologyFoundationsPartII use.

[Q], Corollary 3.13, p.27, uses Corollary 3.31 and the derived-form identification of Theorem 3.11(b), p.25; its printed reference to part (a) does not state that identification. (See also [Q], §1.1, paragraph 1.4, p.4.)

**Checks.**

- For the self-pair (ℤ,ℤ) the degree-zero object is the classical Habiro ring, and its h-completion is ℤ⟦q−1⟧ with the (q−1)-adic filtration.
- For R=0 both sides are zero. For R=ℤ[1/2] both sides retain the nonzero root-order components that a single q−1 Taylor map kills (§6.3).
- The input is the derived smooth-form theorem in relative dimension zero. A Hodge–Nygaard associated-graded comparison alone does not identify the finite stages with qW_m(R/A).

## How to read the build

Layer 0 constructs the general marked ordinary deformation interface and proves regular-principal derived universality. It uses ordinary étale and completion APIs, DD.1 and E1/E5. The independently proved cyclotomic specialization is imported from Part I. Layer 1 fixes the category of pairs on which every construction is functorial; perfect covers and the completed Frobenius are the QW.1 and QW.4 interfaces. Layer 2 identifies the Habiro completion and completed tensor of HabiroCohomologyFoundations §0.1 with the Laurent and scalar-restriction conventions, proves the ordinary/derived comparison and coefficient base change, and builds the spherical and conditional solid completed categories. Layer 3 computes the prime-chain index used by the finite descent of HabiroCohomologyFoundations §0.2 and unravels its mapping spaces; §3.5 separately proves general finite monoidal-localization descent under coherent overlap and conservativity hypotheses. Layer 4 extends the coefficient lifts of HabiroCohomologyFoundations §0.3 to morphisms of pairs. Layer 5 presents their limit as an ordinary ring, proves the Taylor equalizer and completed base change, and compares with the classical and number-field rings. Layer 6 transports scalar modules and arithmetic lines, before the examples of Layer 7. RefinedTraceMethods, HabiroNahmSeries and HabiroCohomologyFoundationsPartII consume these results.

## Layer 0: General marked étale deformations

This layer owns the arbitrary-ring deformation interface. Its objects use ordinary étale algebras and Mathlib's existing adic completion; its last theorem assembles them with DD.1's derived completion. The cyclotomic coefficient objects remain the separate HabiroCohomologyFoundations §0.3 interface. That supplier proves its specialization directly from ordinary étale lifting, DD.1 and the enhanced suppliers; it does not import this layer. Thus the generalization here introduces no dependency from Part I back to HabiroRings.

For this layer B is any commutative ring, I⊂B an ideal, and D an étale B/I-algebra. Write E/IE for (B/I)⊗_B E, with its specified quotient/tensor identification. No Noetherian, nonzero-ring or finite-module assumption is implicit. “Étale” retains Mathlib's finite-presentation and formal-étaleness conditions. The hypotheses I finitely generated and f regular enter only where stated.

<a id="hr-4-marked-etale-deformation"></a>

### 0.1 Marked étale deformations and their maps

Define `EtaleDeformation B I D` to consist of an ordinary étale B-algebra E and an actual B/I-algebra equivalence ε:E/IE≃D. A morphism between such data with reductions D and D′ has an underlying B-algebra map g:E→E′; its reduced map is

\[
  \operatorname{reduceMap}_{\varepsilon,\varepsilon'}(g)
    =\varepsilon'\circ(\mathrm{id}_{B/I}\otimes g)\circ\varepsilon^{-1}:D\longrightarrow D'.
\]

The fibre over a fixed D uses morphisms whose reduced map is id_D. Retain the marking as data, rather than replacing it by a proposition that some equivalence exists. An object lift need not be unique before completion. The unit, split and localization examples below provide objects without any nilpotence assumption.

The API comprises:

- `EtaleDeformation.ofAlgebra`: package an existing étale B-algebra E and the supplied ε, without choosing another presentation.
- `EtaleDeformation.carrier_etale`: expose the existing `Algebra.Etale B E` instance.
- `EtaleDeformation.reduction_etale`: expose étaleness of E/IE and transport it through ε to D, using `Algebra.Etale.baseChange` and `.of_equiv`.
- `EtaleDeformation.transportMarking`: for e:D≃D′ replace ε by e∘ε. The carrier and its B-action are those of E.
- `EtaleDeformation.reduceMap`: the conjugated reduction displayed above, on the existing tensor-product carriers. Its definition does not require étaleness.
- `EtaleDeformation.reduceMap_id`: with the same source and target marking, reduction of id_E is id_D.
- `EtaleDeformation.reduceMap_comp`: for g:E→E′ and h:E′→E″, reduction of h∘g is reduceMap(h)∘reduceMap(g), with the intermediate marking cancelled.
- `EtaleDeformation.unit`: E=B, D=B/I, with the tensor-unit marking.
- `EtaleDeformation.split`: E=B×B, D=(B/I)×(B/I), with componentwise reduction. The presentation B[x]/(x²−x) maps x to (0,1), and the inverse sends (a,b) to a+(b−a)x. Its Jacobian 2x−1 satisfies (2x−1)²=1 in this quotient, also in characteristic two.
- `EtaleDeformation.localisation`: for a∈B take E=B[1/a] and D=(B/I)[1/ā], marked by localization base change. An invertible or zero ā is allowed.

**Checks.**

- `EtaleDeformation.test_unit`: the unit lift has the unique B-algebra map into any other lift, and its marking identifies reduction with the B/I-structure map. For I=0 it is the ordinary unit algebra B.
- `EtaleDeformation.test_split_swap`: if B/I≠0, the split transposition sends (1,0) to (0,1). Even g=id_E reduces to this transposition if the target marking is swap∘ε and the source marking is ε. With the same marking on both sides it reduces to id. These two computations are proved on actual reduction carriers in Suggested.lean.
- `EtaleDeformation.test_localisation`: for B=ℤ, I=0 and a=2, E=ℤ[1/2] is étale and is not a finite ℤ-module. For a=0 the localization and its reduction are zero; for a a unit they recover the unit deformation. Replacing étale by finite étale would lose the first case.

*Needs:* `Algebra.Etale`, `.baseChange`, `.of_equiv`; `Algebra.TensorProduct.map`, `.map_id`, `.map_comp`; the existing quotient/tensor and localization base-change equivalences; the ordinary product algebra. The marked package and conjugated map, rather than the underlying ring and tensor structures, are the new interface. The object formulation is the datum used by Stacks §10.143, Lemma 10.143.10, tag [04D1], chapter PDF p.385; [Q], Theorem 2.9, pp.16–17, uses its completed principal specialization.

<a id="hr-4-etale-quotient-lift"></a>

### 0.2 Existence over an arbitrary quotient ideal

`EtaleDeformation.exists_lift` states that for every B,I,D as above there exists an étale B-algebra E with a specified equivalence E/IE≃D. There is no finite-generation or nilpotence condition on I. This is an existence theorem about ordinary algebras, not uniqueness of their carriers.

Use a finite square Jacobian presentation of D, lift its equations to B, and invert the lifted determinant Δ. Equivalently adjoin y with yΔ−1=0; the enlarged Jacobian determinant is Δ², a unit in the resulting algebra. Reduction recovers the original presentation with its marking. All choices are permitted at this stage. The existing standard-smooth presentation API supplies the Jacobian criterion; the missing assembly is lifting the algebra object together with the marked reduction.

**Checks.**

- I=0 permits E=D with its specified B-action. For I=B, D must be zero, while E may be B or zero; uniqueness of uncompleted object lifts would already fail here.
- Over B=ℤ and I=(2), the algebra 𝔽₂[x]/(x²+x+1) lifts to ℤ[x]/(x²+x+1)[1/3]. The discriminant −3 is invertible, and reduction of 1/3 is 1.
- Over B=ℤ[t], I=(t), both B and B[1/(1−t)] lift D=ℤ. They are not isomorphic as B-algebras, since 1−t is a unit only in the latter. Their completed marked comparison belongs to §0.5.

*Needs:* §0.1; `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`; `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`; localization base change. Source: Stacks §10.143, Lemma 10.143.10, tag [04D1], chapter PDF p.385, including the determinant-inversion argument. The existing carrier `CommAlgCat B` expresses this target in Suggested.lean without defining a new category there.

<a id="hr-4-nilpotent-deformation-rigidity"></a>

### 0.3 Locally nilpotent reduction and marked rigidity

`EtaleDeformation.reductionEquivalence` states that when I is locally nilpotent, reduction is an equivalence between the categories of ordinary étale B-algebras and ordinary étale B/I-algebras. In particular, for marked lifts (E,ε) and (E′,ε′), `reduceMap` is a bijection

\[
 \operatorname{Hom}_B(E,E')\simeq\operatorname{Hom}_{B/I}(D,D').
\]

`EtaleDeformation.nilpotent_reductionEquivalence` is the nilpotent specialization used at each B/Iⁿ-level. For fixed D, `EtaleDeformation.equivOfMarking` is the unique marked equivalence between two lifts, and `EtaleDeformation.equivOfMarking_trans` gives transitivity; its identity and inverse laws follow from uniqueness.

Object existence is §0.2. For maps, formal smoothness supplies lifting across a locally nilpotent ideal using finite presentation. For uniqueness, use the idempotent generating the kernel of E⊗_B E→E: two maps with the same reduction send it into IE′, where a nilpotent idempotent is zero. This argument retains the locally nilpotent case without assuming a uniform exponent. At nilpotent levels use the existing formally smooth lifting and formally unramified uniqueness declarations directly.

**Checks.**

- For B=ℤ/4, I=(2), D=𝔽₂, the unit deformation has a single marked self-map. The split reduced swap lifts to the split swap; it lies over a different reduced map from the identity.
- In B=𝔽₂[x₁,x₂,…]/(x₁²,x₂²,…), the ideal generated by all x_i is locally nilpotent but has no uniform nilpotence exponent: products of arbitrarily many distinct x_i survive. The theorem still applies. Finite-presentation descent and the idempotent argument cannot be replaced by a fixed Iᴺ=0 assumption.
- The B=ℤ[t], I=(t) example of §0.2 excludes rigidity for arbitrary ideals. For B=0 the two categories have only their zero algebra and the equivalence still holds.

*Needs:* §§0.1–0.2; `Algebra.FormallySmooth.exists_lift`; `Algebra.FormallyUnramified.lift_unique`; existing unramified diagonal and idempotent machinery. Source: Stacks §15.11, Lemma 15.11.2, tag [0ALI], chapter PDF pp.28–29. Its locally nilpotent full-faithfulness argument is the input beyond a finite nilpotence exponent.

<a id="hr-4-completed-etale-deformation"></a>

### 0.4 The ordinary completion of a marked lift

Now assume I is finitely generated, and fix a lift L=(E,ε) from §0.1. Define `CompletedEtaleLift I L` as the existing ordinary carrier

\[
  W_L=\operatorname{AdicCompletion}_{IE}(E)=\varprojlim_{n\geq1}E/I^nE.
\]

It is an ordinary commutative B-algebra, complete and separated for IW_L, with its canonical map E→W_L. For every n≥1 there is a B/Iⁿ-algebra equivalence W_L/IⁿW_L≃E/IⁿE compatible with the completion unit, the quotient transition maps and the marking at n=1. In particular each quotient is étale over B/Iⁿ. Finite presentation as an algebra imposes no module-finiteness assumption on E or D; no flatness or ordinary étaleness of W_L over the completed base is asserted.

The API comprises:

- `CompletedEtaleLift.instCommRing`: reuse the existing completion ring instance, without defining a second ring structure.
- `CompletedEtaleLift.instAlgebra`: reuse its B-algebra structure through E and the completion unit.
- `CompletedEtaleLift.of`: the existing completion unit E→W_L as a B-algebra map.
- `CompletedEtaleLift.complete`: ordinary `IsAdicComplete` for IW_L, with I finitely generated.
- `CompletedEtaleLift.reductionEquiv`: the actual equivalence (B/I)⊗_B W_L≃D obtained from the first evaluation and ε; retain the compatible quotient equivalences for every n≥1 as `CompletedEtaleLift.quotientEquiv`.
- `CompletedEtaleLift.reduction_of`: reducing the completion unit and applying `reductionEquiv` gives ε.
- `CompletedEtaleLift.homEquiv`: the natural marked hom-set bijection of §0.5 for every ordinary I-complete B-algebra C.
- `CompletedEtaleLift.map`: for g:D→D′, use `homEquiv` with target W_M to obtain the unique W_L→W_M lifting g through the markings.
- `CompletedEtaleLift.map_reduction`: the reduction of this map, conjugated by the two markings, is g.
- `CompletedEtaleLift.map_id`: lifting id_D between the same completed marked object gives id_W.
- `CompletedEtaleLift.map_comp`: lifting h∘g gives map(h)∘map(g).
- `CompletedEtaleLift.equivOfMarking`: for two chosen lifts of the same D, the map lifting id_D is an equivalence of completed B-algebras.
- `CompletedEtaleLift.equivOfMarking_reduction`: this equivalence intertwines the two actual reduction markings.
- `CompletedEtaleLift.equivOfMarking_trans`: for three chosen lifts the comparisons compose to the comparison of the first with the third. Identity and inverse are its specializations.

For the quotient equivalences, apply `AdicCompletion.pow_smul_top_eq_ker_eval` to the original ideal IE and its n-th evaluation, then use surjectivity of that evaluation. The extended ideal (IE)ⁿW_L is IⁿW_L. At n=1, `AdicCompletion.ker_evalOneₐ_eq_map` supplies the ring form of the kernel statement. Finite generation of IE follows from that of I; `AdicCompletion.isAdicComplete` supplies ordinary completeness. Quotient/tensor base change and ε finish the marking. The maps and comparisons are proved in §0.5; they do not make the uncompleted choice E canonical.

**Checks.**

- `CompletedEtaleLift.test_zero_ideal`: for I=0, the completion unit is an equivalence and the marking identifies W_L with D as a B-algebra.
- `CompletedEtaleLift.test_nilpotent`: for nilpotent I the quotient tower is eventually E, so the canonical E→W_L is an equivalence. This particular conclusion holds even when I is not finitely generated, by the eventually constant tower argument.
- `CompletedEtaleLift.test_split_swap`: the split lift completes to B̂_I×B̂_I. If B/I≠0 its reduced transposition moves (1,0), so the lifted transposition is not id. Changing a marking changes the corresponding map, as in the proved §0.1 examples.
- `CompletedEtaleLift.test_localisation_series`: for B=ℤ[t], I=(t), E=ℤ[t,1/2], the marked completion is ℤ[1/2][[t]], with t acting as the power-series variable. The element Σ_{n≥0}tⁿ/2ⁿ has unbounded coefficient denominators. It cannot lie in ℤ[[t]][1/2], since one fixed 2ᴺ would have to clear every coefficient. Localizing after completing is a different construction.
- For I=B, every quotient and W_L are zero; for D=0, IE=E and W_L=0 even if E≠0. A map from this zero algebra to a unital algebra exists only when that target is zero.

*Needs:* §§0.1–0.2; `AdicCompletion`, `.isAdicComplete`, `.eval_surjective`, `.pow_smul_top_eq_ker_eval`, `.ker_evalOneₐ_eq_map`; existing quotient/tensor equivalences and `Algebra.Etale.baseChange`. The power-series test uses the existing `MvPowerSeries.toAdicCompletionAlgEquiv`. Source application: [Q], Theorem 2.9, pp.16–17, first proof paragraph. The ordinary quotient and completeness assertions are imports from the pinned completion API, not new completion theory.

<a id="hr-4-completed-deformation-map-equivalence"></a>

### 0.5 Maps into any ordinary complete target

For I finitely generated and L=(E,ε), `CompletedEtaleLift.homEquiv` states that for every ordinary commutative B-algebra C complete and separated for IC, marked reduction gives a natural bijection

\[
  \operatorname{Hom}_B(W_L,C)\simeq
  \operatorname{Hom}_{B/I}\bigl(D,(B/I)\otimes_B C\bigr).
\]

The forward map is (id⊗h)∘ε_W⁻¹, where ε_W is the marking of W_L. Naturality is covariant in C and contravariant in the reduced source D, with the maps of §0.4. These are all ordinary B-algebra maps: every such map sends Iⁿ into Iⁿ, so no additional continuity datum or bounded-denominator condition is imposed. C need not be étale or flat, and its reduction need not be étale. A reduced isomorphism implies that the lifted map is an isomorphism when both objects are completed étale lifts; it does not give that conclusion for an arbitrary C.

For the inverse, translate the reduced map into E→C/IC via ε. The existing `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` lifts it to E→C. Completeness includes separatedness, and `Algebra.FormallyUnramified.ext_of_iInf` makes this lift unique. Reduce the lifted map modulo each Iⁿ and use §0.4 to extend it over W_L/IⁿW_L. Compatibility gives a map W_L→lim C/IⁿC≃C, using `AdicCompletion.liftAlgHom` and `.ofAlgEquiv`. Conversely, any map W_L→C has these quotient maps, so the same uniqueness and separatedness prove injectivity. Identity, composition and the comparison laws in §0.4 follow by reducing them; lift an inverse to prove `equivOfMarking`.

`CompletedEtaleLift.mapUnique` in Suggested.lean is the equivalent statement with the reduced map given as E→C/IC before transport through ε. It asserts existence and uniqueness of the map out of the existing completion, rather than replanning the implemented lifting theorem out of E.

`CompletedEtaleLift.mappingSpaceEquiv` is the enhanced refinement for these same ordinary W_L and C: Map_{CAlg(D(B))}(W_L,C) is the discrete space on Hom_{B/I}(D,C/IC). The comparison of static algebra mapping spaces with ordinary algebra maps is [HA], §7.1.3, Definition 7.1.3.17 and Proposition 7.1.3.18, p.1219; compose it with `homEquiv`. This uses the E1/E5 enhanced carriers, without identifying all animated commutative rings with E∞-algebras in positive characteristic.

**Checks.**

- For E=B, the hom-set contains only the completed structure map B̂_I→C, matching the unique B/I-algebra structure map into C/IC.
- The split identity and swap are distinguished by reduction at (1,0) when B/I≠0. For the two uncompleted lifts B and B[1/(1−t)] of §0.2, the completed comparison is an isomorphism: 1−t has the inverse Σtⁿ in ℤ[[t]].
- For B=ℤ, I=(2), W_L=ℤ₂ and C=𝔽₂, there is exactly one B-algebra map W_L→C. Its reduced map is an isomorphism, but the map itself is not. This rules out extending `equivOfMarking` to every ordinarily complete target with the same ordinary reduction.
- Dropping completeness fails already for E=B, C=ℤ and I=(2): a ℤ-algebra map ℤ₂→ℤ would send the inverse of 3 to an integer inverse of 3, which does not exist.

*Needs:* §§0.3–0.4; the four existing lifting, rigidity and completion declarations named in the proof, with their completeness/separatedness hypotheses; E1/E5 for `mappingSpaceEquiv`. Stacks §15.11, Lemma 15.11.2, tag [0ALI], chapter PDF pp.28–29, supplies the nilpotent-level rigidity used in the quotient formulation; the complete hom-set statement is the assembly above. [Q], Theorem 2.9, pp.16–17, is its principal coefficient application.

<a id="hr-4-complete-principal-deformation-universality"></a>

### 0.6 Regular principal derived universality

Let f∈B act injectively on B, let D be étale over B/(f), and choose an ordinary étale lift L=(E,ε). For W_L=CompletedEtaleLift((f),L), `CompletedEtaleLift.principal_universality` states that W_L, regarded as an E∞-B-algebra, is static and derived f-complete, f acts injectively on W_L, and its actual derived reduction W_L⊗^L_B B/(f) is D with the prescribed marking. For any derived f-complete E∞-B-algebra C with an actual equivalence ε_C:C⊗^L_B B/(f)≃D, the space

\[
 \{\,e:W_L\simeq C\mid
   \varepsilon_C\circ(e\otimes^L_B B/(f))=\varepsilon_W\,\}
\]

is contractible. The displayed equality means the homotopy fibre over the specified marking, including the comparison homotopy. No connectivity assumption is placed on C. The theorem implies that C is static and f-regular too. The B̂_(f)-algebra form follows from the unique complete-base action. It asserts no ordinary étaleness or flatness of W_L over B̂_(f), and requires neither Noetherianity nor finite-module hypotheses.

To prove it, E is flat over B because it is étale; hence f is regular on E. DD.1's regular-principal ordinary/derived comparison identifies its derived completion with the ordinary tower E/fⁿE. This static surjective tower has static homotopy limit W_L. Its compatible quotients identify W_L/fⁿW_L with E/fⁿE. If fx=0 in W_L, regularity in E implies that the component of x at level n+1 is divisible by fⁿ, so every level-n component vanishes. Thus f is regular on W_L and its ordinary marked quotient is also its derived quotient.

For arbitrary C as in the theorem, the successive-power cofiber triangles express C/fⁿ as extensions of copies of the static C/f≃D. Induction makes every C/fⁿ static, with surjective transition maps. DD.1's principal derived tower and the Milnor sequence then make C static, even without a prior bound on its homotopy. Here the Milnor sequence follows from E2:towers' product–difference formula and exact products of ordinary B-modules; surjectivity kills lim¹. The quotient long exact sequence makes f regular on π₀C. Its quotient tower is therefore ordinary, and π₀C is ordinarily f-complete. Apply §0.5 to the specified marking to get W_L→π₀C. Its reduced map is an equivalence; derived Nakayama on the complete underlying modules makes the map an equivalence. `CompletedEtaleLift.mappingSpaceEquiv` makes the mapping spaces discrete. Its reduced hom-set bijection leaves exactly one point in the marked comparison fibre, with no additional homotopies. This proves the claimed contractibility and the coherence under changes of the selected lift E.

**Checks.**

- For B=ℤ, f=2 and D=𝔽₂, W_L=ℤ₂. The static algebra 𝔽₂ is ordinarily 2-complete with the same ordinary quotient, but its derived reduction is the two-term complex [𝔽₂→⁰𝔽₂], with π₁=𝔽₂. It fails the derived marking hypothesis. Suggested.lean proves the noninjectivity of this multiplication-by-2 differential.
- For B=ℤ[t], f=t and D=ℤ[1/2], W_L=ℤ[1/2][[t]], including the unbounded-denominator series of §0.4. A split D has distinct identity and swap reduced maps; contractibility is asserted separately over each fixed marking.
- A unit f is regular and has B/(f)=0. Every derived f-complete C is zero, and the marked comparison fibre is contractible. For B=0, f=0 is regular in the injectivity convention and gives the same zero case.
- For f=0 on B=ℤ, regularity fails: the derived cofiber of zero on a nonzero static algebra is that algebra plus its suspension. Ordinary quotienting by zero would erase this obstruction. For D=0 and regular f the unique complete lift is zero, by derived Nakayama.

*Needs:* §§0.2, 0.4–0.5; `Algebra.Smooth.flat`; DerivedDeRhamCohomology:DD.1 (the exact §§1.1–1.4 APIs in the supplier contract); EnhancedDerivedSheaves:E1, E2:towers (`derivedTowerLimit`), E5:abstract and E5:spectra-comparison (algebra limits, mapping spaces and the derived-module comparison). DD §1.11's `DerivedDeRham.completelySmoothAlgebraization` is the imported general algebraization theorem, not a second target here: the extra content is the specified ordinary model, marked hom-set API and contractible comparison above. Sources: Stacks §15.93, Lemma 15.93.18, tag [0920], chapter PDF p.267, for the principal Koszul completion tower; [HA], Proposition 7.1.3.18, p.1219, for static algebra maps; [Q], Theorem 2.9, pp.16–17, for the coefficient application. The argument here states the general regular-principal consequence explicitly; [Q]'s displayed specialization alone is not a source for arbitrary B,I.

### Examples

The unit, split and localization deformations test the marking and the difference between étale and finite étale. The locally nilpotent infinite-variable example tests the absence of a uniform exponent. The two lifts over ℤ[t] test nonuniqueness before completion and canonical marked comparison afterwards. The unbounded-denominator series tests the order of localization and completion. Finally ℤ₂ and static 𝔽₂ distinguish derived reduction from ordinary reduction at the smallest residue characteristic.

### Dependencies

Existing ordinary étale, tensor-product, localization and adic-completion APIs; DD.1 for principal derived completion and Nakayama; E1/E5 for the enhanced algebra interpretation and E2:towers for the coherent surjective limit. No Habiro coefficient construction, QW output, trace construction or Part II result is needed by this general layer. The specialized Part I §0.3 contract remains an earlier, independently proved supplier to Layers 4–5.


## Layer 1: Relative inputs

The relative constructions take a perfectly covered Λ-ring with an étale algebra. Perfect covers and the completed Frobenius are the QW.1 and QW.4 interfaces specified under Exact supplier contracts; this layer fixes the category on which every later construction is functorial.

<a id="hr-1-morphisms-of-pairs"></a>

### 1.1 The category of relative inputs

Objects are perfectly covered Λ-rings A with an étale A-algebra R. An arrow consists of a Λ-map f:A→A′ and a ring map g:R→R′ satisfying g∘ι_A=ι_{A′}∘f. Identity and composition are those of ring maps, with the compatibility checked on the base. Twisted base change, prime completion and the completed Frobenius map of QW.4 are functorial for these arrows.

This category is the domain of the stage functoriality of Layer 4 and of every construction after it. The arrow R→R′ may be more general than the base-change map R→R⊗_A A′; the stronger base-change formula of §5.6 assumes that precise tensor-product target. No global Λ-structure on R or R′ is part of an object.

*Needs:* [Adams data][r9]; [perfect covers][r19]; `Algebra.Etale`; `Algebra.Etale.baseChange`. The completed-Frobenius compatibility is a consequence of QW.4 naturality, not input to the category definition.

See [Q], §2, opening paragraph, p.13; Appendix A, Theorem A.1, p.69.

The API comprises:

- `EtalePair`: A perfectly covered Λ-ring A with an étale A-algebra R.
- `EtalePair.Hom`: A Λ-map f on bases and a ring map g on algebras with g ∘ algebraMap = algebraMap ∘ f.
- `EtalePair.instCategory`: The category structure, with Hom.id and Hom.comp componentwise.
- `EtalePair.Hom.base`: The Λ-map on bases.
- `EtalePair.Hom.alg`: The ring map on algebras.
- `EtalePair.forget`: The forgetful functor to Λ-rings.
- `EtalePair.baseChange`: Base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map to a perfectly covered A'.

**Checks.**

- `EtalePair.not_hom_of_non_lambda`: On toric ℤ[x], the ring automorphism f(x) = x + 1 is not a Λ-map: f(ψ^2(x)) = (x + 1)^2 = x^2 + 2x + 1 but ψ^2(f(x)) = x^2 + 1. So (f, f) is not a morphism of pairs (ℤ[x], ℤ[x]) → (ℤ[x], ℤ[x]), although it is a ring map over f.
- `EtalePair.hom_self`: Morphisms (A, A) → (A', A') are exactly the Λ-maps A → A' (g = f is forced).
- `EtalePair.conj_frobenius`: Complex conjugation g on R = ℤ[i][1/2] gives a morphism (ℤ, R) → (ℤ, R); its 3-adic completion commutes with φ_3 (both are conjugation on ℤ_3[i]) without this being imposed.
- `EtalePair.baseChange_toric`: (ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x][i][1/2]) along the Λ-map ℤ → toric ℤ[x] is a morphism of pairs, and it is the base change of the first pair.

### Examples

The toric self-pair, the Gaussian coefficients and the localized cubic of the QW.1/QW.4 specifications distinguish perfect covering from global coefficient Frobenius; surjectivity of the toric Adams maps is unnecessary. Complex conjugation on ℤ[i][1/2] is a morphism of pairs whose completed Frobenius compatibility is automatic.

### Dependencies

QWittVectors:QW.0, QW.1 and QW.4 (Λ-rings, perfect covers and the completed Frobenius), PrismaticCohomology:PR.0 and the existing étale APIs.

## Layer 2: Laurent conventions, ordinary comparison and spherical completion

The algebraic Habiro completion, its tensor and cyclotomic detection are the HabiroCohomologyFoundations §0.1 interfaces specified under Exact supplier contracts. This layer identifies them with the Laurent and scalar-restriction conventions used here, adds the localization resolution and the homotopy-module criterion, compares ordinary with derived completion on polynomial coefficient modules, and builds the spherical completion. Spherical coefficients retain all homotopy of the sphere. The solid statements additionally use the full light solid spectral contract stated above; boundedness and tower compatibility remain part of their hypotheses.

<a id="hr-2-habiro-complete-modules"></a>

### 2.1 Habiro completion in the Laurent convention

For a commutative ring A write B_A=A[q] and B_A^±=A[q^{±1}]. HabiroCohomologyFoundations §0.1 constructs the Habiro-complete subcategory of D(B_A) and its reflection L_H. Prove that the Laurent and polynomial conventions agree. Every complete B_A-module M has q acting invertibly: M≃lim_N M/P_N by `HabiroComplete.tower`, and for N≥1 the element q is a unit of A[q]/(P_N) because P_N has constant coefficient 1. Since B_A→B_A^± is a localization, restriction identifies D(B_A^±) with the full subcategory of D(B_A) on which q acts invertibly. Hence restriction identifies the Habiro-complete B_A^±-modules, those with RHom_{B_A^±}(R_r⊗^L_ℤA,M)=0, with the complete B_A-modules of §0.1, and it commutes with L_H. On such modules M⊗^L_{B_A}N≃M⊗^L_{B_A^±}N, because B_A^±⊗^L_{B_A}B_A^±≃B_A^±. In particular A[q]^∧_H≃A[q^{±1}]^∧_H: the cofiber A[q^{±1}]/A[q] is q-power torsion, every f_m acts on it invertibly, and L_H kills it.

Restriction of scalars along ℤ[q]→A[q] also commutes with L_H and detects completeness. Indeed S⁻¹A[q]=S⁻¹ℤ[q]⊗_{ℤ[q]}A[q], so the fiber of A[q]→S⁻¹A[q] is the base change of the integral fiber C_ℤ, and RHom_{A[q]}(C_ℤ⊗^L_{ℤ[q]}A[q],M)≃RHom_{ℤ[q]}(C_ℤ,M).

The localization R_r is an ordinary ring with an explicit presentation. It is the localization of ℤ[q^{±1}] at the submonoid generated by the qᵐ−1, equivalently at all Φ_d(q): each qᵐ−1 is the product of its cyclotomic factors, and each Φ_d divides q^d−1. A derived f_m-complete object is Habiro-complete, since RHom(R_r,M) is then f_m-complete with f_m acting invertibly, hence zero. Complete objects are closed under limits, fibers and shifts, being a right orthogonal class. The fiber of the unit M→L_HM is RHom(R_r⊗A,M), an R_r⊗A-module, so L_HM≃0 exactly when M is an R_r⊗A-module. These are statements about the supplier's reflection; no second completion functor is defined.

*Needs:* HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tower`); `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E1`; `IsLocalization`; `LaurentPolynomial`; `Polynomial.cyclotomic`; `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

See [Q], Appendix B, B.1, p.77; §3, Theorem 3.11(a), p.25.

The API comprises:

- `habiroLocalisation`: Rr, with IsLocalization for the submonoid of LaurentPolynomial ℤ generated by the q^m − 1.
- `habiroLocalisation_eq_cyclotomic`: Rr is also the localisation at all Φ_d(q), d ≥ 1.
- `IsHabiroComplete`: For a derived A[q^{±1}]-module M, RHom_{A[q^{±1}]}(Rr ⊗^L A, M) ≃ 0. By `habiroCompletion_polynomial_eq_laurent` this is completeness of the restriction to A[q] in the sense of HabiroCohomologyFoundations §0.1.
- `habiroCompletion_polynomial_eq_laurent`: q acts invertibly on every Habiro-complete A[q]-module; restriction along A[q] → A[q^{±1}] identifies the two complete subcategories and their completed tensor products, and commutes with L_H. In particular A[q]^∧_H ≃ A[q^{±1}]^∧_H and q is a unit in A[q]^∧_H.
- `isHabiroComplete_iff_restrictScalars`: Completeness over A[q^{±1}], or over A[q], is completeness of the underlying ℤ[q^{±1}]-module, and restriction along ℤ[q] → A[q] commutes with L_H.
- `IsHabiroComplete.of_adicComplete`: A derived (q^m − 1)-complete object is Habiro-complete.
- `IsHabiroComplete.limit`: Habiro-complete objects are closed under limits, fibres and shifts.
- `habiroCompletion_eq_zero_iff`: L_H M ≃ 0 iff M is an Rr ⊗ A-module; the fibre of the unit M → L_H M is RHom(Rr ⊗ A, M).
- `habiroComplete_spectral_comparison`: On Hℤ[q^{±1}]-modules, restriction to spherical coefficients commutes with completion. The derived tensor comparison is Hℤ[q^{±1}]-relative, followed by completion; restriction to ℛ itself is lax monoidal.

**Checks.**

- `habiroCompletion_localisation_eq_zero`: Rr^∧_H ≃ 0, since q^m − 1 is a unit on Rr and so Rr/(q^m − 1) ≃ 0 for every m; and Rr is not Habiro-complete (RHom(Rr, Rr) contains the identity). A definition that confused completion with inverting the q^m − 1 would return Rr.
- `isHabiroComplete_powerSeries`: ℤ[[q − 1]] = ℤ[q]^∧_{(q−1)} is Habiro-complete: it is derived (q − 1)-complete and q − 1 acts invertibly on Rr.
- `habiroCompletion_ne_powerSeries`: ℤ[q^{±1}]^∧_H is not ℤ[[q − 1]]: modulo Φ_2(q) = q + 1, ℤ[[q − 1]]/(q + 1) ≅ ℤ[[t]]/(t + 2) ≅ ℤ_2 (t = q − 1), whereas ℤ[q^{±1}]^∧_H/(q + 1) ≅ ℤ (by the factorial-tower description: on π_0 the tower is constantly ℤ[q]/(q + 1) = ℤ, and on π_1 its transition maps are multiplication by 1 − (−1)^{n+1} ∈ {0, 2}, so its limit and lim^1 vanish).
- `habiroCompletion_q_inverse`: q·(1 + q − q^2) − 1 = −(q;q)_2 = −(1 − q)(1 − q^2), so q is invertible in ℤ[q]/((q;q)_2), a stage of the completion, with inverse 1 + q − q^2. This is the polynomial-side reason for the Laurent comparison.
- `not_isHabiroComplete_laurent`: ℤ[q^{±1}] is not Habiro-complete: the element Σ_{n ≥ 0} (q;q)_n of lim_N ℤ[q]/(q;q)_N is not the image of a Laurent polynomial f, since otherwise q^s f − q^s Σ_{k<N}(q;q)_k, of degree below N(N+1)/2 = deg (q;q)_N for N large, would be divisible by (q;q)_N and hence zero for all large N, forcing (q;q)_N = 0.
- `habiroCompletion_ne_smashing`: Rr ⊗ ℤ[[q − 1]] ≠ 0 (it contains ℤ((q − 1)), where q − 1 is inverted) although ℤ[[q − 1]] is complete, while (Rr ⊗ ℤ[[q − 1]])^∧_H ≃ 0: the smashing localisation Rr ⊗ − and Habiro completion are complementary.
- `habiroCompletion_laurent_cofiber`: For A = ℤ, q kills the class of q^{−1} in ℤ[q^{±1}]/ℤ[q] and acts locally nilpotently on the whole cofiber, so every q^m − 1 acts on it as −1 plus a locally nilpotent operator, hence invertibly; for example (q − 1)·(−q^{−1}) ≡ q^{−1}. Thus L_H(ℤ[q]) → L_H(ℤ[q^{±1}]) is an equivalence, although ℤ[q] → ℤ[q^{±1}] is not.
- `isHabiroComplete_restrict_F2`: For A = 𝔽_2 and M = 𝔽_2 with q acting as 1, M is complete over 𝔽_2[q] and its underlying ℤ[q]-module is complete. Both derived quotients by q − 1 are 𝔽_2 ⊕ Σ𝔽_2: restriction changes neither completeness nor derived reductions by elements of ℤ[q].

<a id="hr-2-the-two-term-resolution"></a>

### 2.2 A free resolution of the rational localization

There is a length-one free resolution of R_r over B=ℤ[q^{±1}] with differential on the direct-sum generators
\[
d((a_i))_i=a_i-(1-q^i)a_{i-1},\qquad a_{-1}=0,
\]
and augmentation (a_i)↦Σ_i a_i/P_i. On basis elements this is d(e_i)=e_i−(1−q^{i+1})e_{i+1}, so the augmentation of d(e_i) vanishes. Injectivity follows by looking at the smallest nonzero coefficient of a finite-support element. The cokernel is colim_i B with transition 1−q^{i+1}, mapped to B[P_i⁻¹ | i≥0] by a↦a/P_i. Every finite product of the factors 1−qʲ, with repetitions, divides some P_N: assign each occurrence a distinct sufficiently large multiple of its index, and use 1−qʲ∣1−q^{kj}. Thus the fractions a/P_i exhaust the localization; identifying the units alone would not establish this cofinality.

Applying Hom turns the resolution into a map of products. It computes RHom(R_r,−), showing that its Ext groups on static modules occur only in degrees 0 and 1. The augmentation uses inverse q-factorials; using P_i itself would not satisfy the relation.

*Needs:* [§2.1][r29]; `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E1`.

See [Q], Appendix B, proof of Lemma B.2, pp.77–78; telescope differential as specified above.

**Checks.**

- For i=0, d(e₀)=e₀−(1−q)e₁ has augmentation 1−(1−q)/P₁=0. A plus sign would give 2.
- For i=1, the two augmentation terms are 1/P₁ and (1−q²)/P₂=1/P₁. Replacing 1−q² by P₁ breaks this equality.
- A nonzero finite-support input has its first nonzero coefficient unchanged by d, proving injectivity without a boundedness hypothesis on a later derived module.

<a id="hr-2-completeness-on-homotopy-groups"></a>

### 2.3 Completeness of homotopy modules

M is Habiro-complete if and only if every π_n(M) is complete as an ordinary B-module, in the sense Hom_B(R_r,π_n M)=Ext¹_B(R_r,π_n M)=0. The two-term resolution gives
\[
0\to\operatorname{Ext}^1_B(R_r,\pi_{n+1}M)
\to\pi_n\operatorname{RHom}_B(R_r,M)
\to\operatorname{Hom}_B(R_r,\pi_nM)\to0.
\]
Use the homological dimension bound and convergent Postnikov truncations to obtain the equivalence even for unbounded M. A proof must retain both Hom and Ext¹; vanishing of just Hom is insufficient. The enhanced t-structure and its convergence are imported, rather than inferred from an ordinary triangulated-category API.

*Needs:* [§2.1][r29]; [§2.2][r30]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.detect`); `EnhancedDerivedSheaves:E1`.

See [Q], Appendix B, Lemma B.2(d) and proof, pp.77–78.

<a id="hr-2-ordinary-derived-comparison"></a>

### 2.4 Ordinary and derived completion of polynomial coefficient modules

For any commutative ring B and B-module M, put N=M[q,q⁻¹]=B[q,q⁻¹]⊗_B M, regarded as a complex concentrated in degree zero. Prove `ordinaryDerivedComparison`: the canonical comparison identifies L_HN with the static object associated to HC's ordinary full cyclotomic module completion M[q]^{ℕ_{>0}}. The equivalence is B[q,q⁻¹]-linear, natural for every B-linear map of coefficient modules, and commutes with all finite quotient projections. Neither flatness of M nor integer torsion-freeness of B or M is required.

For each positive m, multiplication by qᵐ−1 on N is injective. A nonzero finite Laurent sum has a largest occupied exponent j; the coefficient of q^{j+m} in its product by qᵐ−1 is the unchanged coefficient at j. This proves `OrdinaryDerivedComparison.laurent_regular` without dividing by an integer. Each P_n is a product of such regular factors. Consequently the derived cofiber N/P_n is the ordinary quotient in degree zero. For n≥1, monic division and the unit constant coefficient identify this quotient with the direct sum of n(n+1)/2 copies of M, represented by exponents 0 through n(n+1)/2−1. The sign (−1)^n in the leading coefficient of P_n changes no ideal or quotient.

The maps N/P_{n+1}→N/P_n are the natural surjective quotient maps. Their countable tower has vanishing first derived inverse limit; hence its derived limit is static and its zeroth homotopy is the ordinary inverse limit. Apply the reflection and tower formula of HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tower`), in the Laurent convention of §2.1, and HC's cofinal factorial presentation to obtain the comparison. Construct it from the finite quotient maps, so naturality and projection compatibility follow from those maps rather than from a choice of quotient bases. This argument concerns polynomial coefficient modules; it does not identify derived completion with ordinary completion on arbitrary B[q,q⁻¹]-modules.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tower`); `HabiroCyclotomicCompletions:HC.1` (cofinal factorial and divisibility presentations); HC Layer 2 §2.3 (polynomial/Laurent comparison); HC Layer 5 §5.1 (ordinary completion of polynomial coefficient modules); `EnhancedDerivedSheaves:E1` (the countable derived-limit exact sequence). The ordinary exactness and arbitrary-module boundary remain with HC; no cohomological or trace comparison is an input.

The source is [Q], Appendix B, Lemma B.2(c), p.77, for the derived factorial tower, together with Kazuo Habiro [Hab], §7.1, Proposition 7.1 and the following Laurent comparison, pp.1141–1142, and §7.3, p.1144, for ordinary coefficient modules. The regularity and surjective-tower argument above derive the comparison from these inputs; it is not a claim that those passages separately state the whole comparison theorem.

The API comprises:

- `OrdinaryDerivedComparison.laurent_regular`: Multiplication by qᵐ−1 is injective on B[q,q⁻¹]⊗_B M for m>0, for every B-module M.
- `ordinaryDerivedComparison`: The natural B[q,q⁻¹]-linear equivalence from L_H(M[q,q⁻¹]) to the static ordinary completion M[q]^{ℕ_{>0}}.
- `ordinaryDerivedComparison.pi_zero`: The induced zeroth-homotopy isomorphism is the ordinary inverse-limit comparison, and all other homotopy modules vanish.
- `ordinaryDerivedComparison.finiteProjection`: For every n≥1, the composite of the comparison with the ordinary projection to M[q]/P_n equals the derived tower projection followed by its canonical static quotient identification.
- `ordinaryDerivedComparison.naturality`: For every B-linear f:M→M′, completing f[q,q⁻¹] and then comparing equals comparing first and then applying HC's ordinary completed coefficient map. Identity and composite maps obey the same equality.

**Checks.**

- `ordinaryDerivedComparison.zero`: M=0 gives zero at every stage and in both limits. At the auxiliary empty factorial index P₀=1 the quotient is also zero; this does not replace the cofinal positive-index tower by a constant zero tower.
- `ordinaryDerivedComparison.integral_unit`: For B=M=ℤ the comparison is the classical integral Habiro ring, with the actual finite projections. It agrees with the nonspherical unit, not with the entire spherical completion retaining stable homotopy.
- `ordinaryDerivedComparison.coefficient_torsion`: Take B=ℤ and M=ℤ/2ℤ, or equivalently B=M=𝔽₂. Although q²−1=(q−1)² in characteristic two, it is injective on the Laurent coefficient module. The P₁ and P₂ quotients have respectively one and three copies of 𝔽₂, and the completion is static. The coefficient of q in (q−1)·1 is one; this nonzero witness is proved in Suggested.lean.
- `ordinaryDerivedComparison.positive_order`: m=0 is excluded: q⁰−1=0 and its multiplication map is not injective on 𝔽₂[q,q⁻¹]. The proved Lean negative control detects a dropped positivity hypothesis.
- `ordinaryDerivedComparison.q_one_torsion`: An arbitrary module cannot be substituted for M[q,q⁻¹]. On the nonzero module 𝔽₂ with q acting as 1, the derived cofiber of q−1 is 𝔽₂⊕Σ𝔽₂, whereas its ordinary quotient is just 𝔽₂. Specializing q before taking a derived quotient loses the regularity used above.
- `ordinaryDerivedComparison.coefficient_map`: The coefficient reduction ℤ→ℤ/2ℤ commutes with the comparison and each projection. No claim that an arbitrary tensor product commutes with the inverse limit is needed for this naturality square.

<a id="hr-2-the-monoidal-structure"></a>

### 2.5 The completed tensor: Laurent form and coefficient base change

The completed tensor is `HabiroComplete.tensor` of HabiroCohomologyFoundations §0.1, M⊗̂_HN=L_H(M⊗^L N) with unit L_H(B); by §2.1 it may be computed over A[q] or over A[q^{±1}]. Prove its compatibility with change of coefficients. For a ring map A→A′, the functor M↦L_H(M⊗^L_{A[q]}A′[q]) from complete A[q]-modules to complete A′[q]-modules is left adjoint to restriction, sends L_H(A[q]) to L_H(A′[q]), and is symmetric monoidal for the completed tensors. The fiber of M→L_HM is an S⁻¹A[q]-module, so its base change is an S⁻¹A′[q]-module and L_H kills it. This gives L_H(L_HM⊗^L_{A[q]}A′[q])≃L_H(M⊗^L_{A[q]}A′[q]), and with the tensor formula of §0.1 the monoidal comparison and its coherences. Composites A→A′→A″ compose up to the canonical equivalence.

Base change of complete objects is completed. The ordinary derived tensor of two complete objects need not be complete, flatness of A′ over A removes Tor but not the completion, and derived Tor remains visible at finite cyclotomic stages. A useful calculation is that suitable quotients at q²−1 and q³−1 have tensor product ℤ⊕Σℤ at their common root, rather than just ℤ. This prevents an underived quotient convention from concealing the monoidal issue.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tensor`); `EnhancedDerivedSheaves:E5:abstract`; `EnhancedDerivedSheaves:E1`; `StableHomotopyKTheory:H.6`.

See [Q], Appendix B, B.1, p.77; §2.1, Setup 2.1(c), p.13; [HA], §2.2.1, Proposition 2.2.1.9, p.197.

The API comprises:

- `habiroTensor_baseChange`: For a ring map A → A′, M ↦ L_H(M ⊗^L_{A[q]} A′[q]) is left adjoint to restriction of complete modules, symmetric monoidal for ⊗̂_H with unit L_H(A[q]) ↦ L_H(A′[q]), and compatible with composites of coefficient maps.

**Checks.**

- `habiroTensor_unit_int`: For A = ℤ the unit is lim_N ℤ[q]/((q;q)_N), in which q is a unit (q·(1 + q − q^2) ≡ 1 mod (q;q)_2 at the second stage); it is not ℤ[q^{±1}] (not_isHabiroComplete_laurent).
- `habiroTensor_torsion`: ℤ[q]/(q^2 − 1) ⊗̂^L_H ℤ[q]/(q^3 − 1) ≃ ℤ ⊕ Σℤ: π_0 = ℤ[q]/(q^2 − 1, q^3 − 1) = ℤ[q]/(q − 1) and π_1 = ker(q − 1 on ℤ[q]/(q^2 − 1)) = ℤ·(1 + q); both are killed by q^2 − 1, so no completion correction occurs, but the derived Tor_1 must be kept. An underived definition would lose π_1.
- `ordinary_tensor_not_complete`: H ⊗^L_{ℤ[q^{±1}]} H is not Habiro-complete for the Habiro ring H: its completion is H (both sides are ℤ[q]/((q;q)_n) modulo (q;q)_n), but the multiplication H ⊗ H → H on π_0 is not injective, since x ⊗ 1 − 1 ⊗ x ≠ 0 for any x ∈ H outside ℚ(q) (H is an uncountable domain, HabiroCyclotomicCompletions HC.4).
- `habiroTensor_baseChange_id`: For the identity of A the base change is naturally the identity of the complete category; for A′ = 0 it is the zero functor.
- `habiroTensor_baseChange_flat`: For the flat map ℤ → ℤ[t], the base change of the Habiro ring is L_H(ℤ[t][q]), which contains Σ_{n ≥ 0} P_n(q) t^n. The ordinary tensor H ⊗_ℤ ℤ[t] = H[t] has bounded t-degree and does not, so completion is not removed by flatness.

<a id="hr-2-spherical-rational-localization"></a>

### 2.6 Spherical cyclotomic localization

Let ℛ=𝕊[ℤ]. Form ℛ_r by the telescope that inverts each 1−qⁱ, equivalently the E∞ localization at all cyclotomic factors. It is an idempotent ℛ-algebra and has π₀=R_r. Its fiber over ℛ is Σ⁻¹colim_n ℛ/P_n, with the quotient maps induced by factorial divisibility. This is a statement in ℛ-modules, retaining all spherical homotopy.

In particular ℛ_r is not replaced by the Eilenberg–Mac Lane spectrum of R_r. The two-term algebraic resolution is an explanation of its π₀-level calculation, not a definition that discards the higher homotopy of the sphere.

*Needs:* `StableHomotopyKTheory:H.5:spectra`; `StableHomotopyKTheory:H.5:S-delooping`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `EnhancedDerivedSheaves:E5:abstract/module-objects`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E5:abstract`.

See [Q], Appendix B.1 and proof of B.2, printed/PDF p.77.

The API comprises:

- `SphericalCyclotomicLocalization`: The commutative R-algebra T with its unit R→T.
- `SphericalCyclotomicLocalization.map`: For a commutative R-algebra B in which every q^m−1, m≥1, is invertible, the space of R-algebra maps T→B is contractible; otherwise it is empty.
- `SphericalCyclotomicLocalization.invert`: Multiplication by q^m−1 on T is an equivalence for every m≥1.
- `SphericalCyclotomicLocalization.idempotent`: The multiplication T⊗_R T→T is an equivalence of commutative R-algebras.
- `SphericalCyclotomicLocalization.fibre`: fib(R→T) ≃ Σ^{-1}colim_{n≥1}R/P_n with transition multiplication by 1−q^{n+1}.
- `SphericalCyclotomicLocalization.pi`: π_kT ≅ π_kR[{(q^m−1)^{-1}}_{m≥1}], naturally as Z[q±1]-modules.

**Checks.**

- `SphericalCyclotomicLocalization.pi_zero`: π_0T ≅ Rr as Z[q±1]-algebras.
- `SphericalCyclotomicLocalization.first_transition`: The first transition R/P_1→R/P_2 is induced by 1−q², so P_2=P_1(1−q²).
- `SphericalCyclotomicLocalization.cyclotomic_tensor_zero`: T⊗_R(R/(q^m−1)) ≃ 0 for every positive m.
- Its zeroth homotopy is R_r, while its higher groups retain localized stable homotopy of the sphere; replacing it with H(R_r) erases this distinction.

<a id="hr-2-spectral-habiro-completion"></a>

### 2.7 Spectral completion and its unit

For an ℛ-module M, define L_HM=RHom_ℛ(fib(ℛ→ℛ_r),M). The fiber triangle gives the localization–completion adjunction, the equivalent formula lim_n M/P_n, and idempotence. Set S_H=L_Hℛ. Complete modules carry the localized symmetric monoidal product, and their unit is S_H.

The comparison with derived modules over an Eilenberg–Mac Lane ring is symmetric monoidal when tensors are relative to that ring. Restricting such modules along ℛ→Hℤ[q^{±1}] gives a lax monoidal functor, not a strong monoidal identification of all spherical modules with complexes. The statement uses actual spectra, module categories, internal Hom and coherent monoidal localization from the named suppliers.

*Needs:* [§2.6](#hr-2-spherical-rational-localization); `StableHomotopyKTheory:H.6`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`; `DerivedDeRhamCohomology:DD.1`; [§2.2][r30]; [§2.3][r33]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tower`, `HabiroComplete.detect`); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `EnhancedDerivedSheaves:E5:abstract`.

See [Q], B.1–B.5, printed/PDF pp.77–79; [HA], Proposition 2.2.1.9, printed p.197; [HA], Theorem 7.1.2.13, printed p.1212.

The API comprises:

- `SpectralHabiroCompletion`: M↦L_HM with a natural unit η_M:M→L_HM and SH=L_HR.
- `SpectralHabiroCompletion.factorial`: L_HM ≃ lim_{n≥1}M/P_n, with transition induced by P_n \| P_{n+1}.
- `SpectralHabiroCompletion.adjunction`: For complete N, Map_R(L_HM,N)→Map_R(M,N) is an equivalence.
- `SpectralHabiroCompletion.idempotent`: η_{L_HM} and L_H(η_M) are equivalences, agreeing under the reflection coherence.
- `SpectralHabiroCompletion.tensor`: The tensor on C_H is L_H(M⊗_RN); its unit is SH, with associativity, unit and symmetry inherited via monoidal localization.
- `SpectralHabiroCompletion.homotopy_exact`: 0→Ext¹_{Z[q±1]}(Rr,π_{k+1}M)→π_kRHom_R(T,M)→Hom_{Z[q±1]}(Rr,π_kM)→0, naturally in M and k∈Z.
- `SpectralHabiroCompletion.complete_iff_pi`: M is complete iff each π_kM is complete in the algebraic Hom/Ext¹ criterion.
- `SpectralHabiroCompletion.nakayama`: If M is complete and M/Φ_m=0 for every positive m, then M=0.
- `SpectralHabiroCompletion.detect_degree`: For complete M and k∈Z, π_k(M/Φ_m)=0 for all positive m implies π_kM=0.
- `SpectralHabiroCompletion.restrict_HZ`: Under Mod_{HZ[q±1]}≃D(Z[q±1]), restriction along R→HZ[q±1] commutes with L_H, the algebraic side being the reflection of HabiroCohomologyFoundations §0.1 in the Laurent convention of §2.1. The tensor comparison uses the HZ[q±1]-relative tensor followed by completion; restriction to R-modules is only lax monoidal.
- `SpectralHabiroCompletion.map`: For an R-linear map u:M→N, L_H(u):L_HM→L_HN is the induced map between the reflections.
- `SpectralHabiroCompletion.map_id`: L_H(id_M)=id_{L_HM}, with the canonical functor coherence.
- `SpectralHabiroCompletion.map_comp`: L_H(v∘u)=L_H(v)∘L_H(u), coherently for composable R-linear maps.
- `SpectralHabiroCompletion.unit_naturality`: L_H(u)∘η_M=η_N∘u for every R-linear u:M→N.

**Checks.**

- `SpectralHabiroCompletion.zero`: L_H0≃0.
- `SpectralHabiroCompletion.local_zero`: L_HT≃0 although π_0T=Rr≠0; localization and completion are different functors.
- `SpectralHabiroCompletion.cyclotomic_fixed`: η_{R/(q−1)} is an equivalence; its homotopy groups are complete because 1−q acts by zero.
- `SpectralHabiroCompletion.integral_unit`: L_H(HZ[q±1]) ≃ H(H), where H is HC.1’s classical integral Habiro ring. Surjective transition maps and finite-free polynomial quotients eliminate higher derived limits in this case.

<a id="hr-2-habiro-complete-solid-spectra"></a>

### 2.8 Complete solid modules and the discrete embedding

In light solid condensed spectra, define completeness by the same localization orthogonality and form completion with the quotient tower. The functor from complete ordinary spectra is M↦L_H(discrete M); evaluation at the point is its right adjoint and recovers M. Hence this completed discrete functor is fully faithful. Ordinary discreteness alone need not preserve an inverse-limit completion.

This construction assumes a stable presentable category of light solid hypersheaves, spectral module objects, solid tensor, internal Hom, evaluation at the point, and the relevant limit and localization compatibilities. Mathlib's light condensed modules do not supply those assumptions. Coproducts here are condensed coproducts followed by completion, not arbitrary algebraic direct sums declared complete.

*Needs:* [§2.1][r29]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`); SolidAnalyticRings:SA.1 (the full spectral contract above); `VStackSheavesAndLisseCategories:VS2` (abelian comparison only); `StableHomotopyKTheory:H.6`.

See [Q], Appendix B, B.6–B.7, p.79.

Meyer–Wagner [MW], §4.1, 4.1, pp.41–42, gives the null-sequence definition and symmetric monoidal solidification in light condensed spectra. It supplies this ambient comparison, rather than the additional Habiro tower and bounded-below resolution contract used here.

The API comprises:

- `IsHabiroCompleteSolid`: Habiro-completeness in Mod_{S[q^{±1}]}(Sp■).
- `habiroCompletionSolid`: Condensed Habiro completion lim_n (−)/(q;q)_n in Mod_{S[q^{±1}]}(Sp■).
- `toSolid`: The functor M ↦ (M̲)^∧_H.
- `toSolid_fullyFaithful`: toSolid is fully faithful.
- `toSolid_eval_point`: toSolid(M)(∗) ≃ M for Habiro-complete M.

**Checks.**

- `toSolid_unit`: toSolid(S_H) = S_H ≃ lim_n S[q^{±1}]/(q;q)_n, each stage a finite direct sum of copies of S (rank n(n+1)/2, the degree of (q;q)_n).
- `toSolid_torsion`: For M killed by a power of some q^m − 1 (for example ℤ[q]/(q − 1) = ℤ), toSolid(M) is the discrete condensed spectrum M̲: no completion occurs.
- `toSolid_sum_ne_discrete`: The discrete condensed spectrum of ⊕_{n ∈ ℕ} S_H is not Habiro-complete in Sp■; toSolid applied to (⊕_n S_H)^∧_H is its condensed completion colim_{f → ∞} ∏_n (q;q)_{f(n)} S_H, not the discrete sum.

<a id="hr-2-solid-habiro-unit-idempotence"></a>

### 2.9 Solid idempotence of the unit

Under the solid product/tower and balanced-tensor comparison inputs, the multiplication S_H⊗^■_ℛ S_H→S_H is an equivalence. Reduce to finite quotients: S_H/P_n is a finite direct sum of d_n=n(n+1)/2 spheres. Indeed (−1)^nP_n is monic of degree d_n and its constant coefficient is a unit, so polynomial and Laurent quotients have the same finite basis. The argument concerns the whole spectral module, not only its π₀.

The polynomial representatives split the quotient tower as 𝕊-modules; these splittings are not asserted to be ℛ-linear. Apply the supplied solid product formula to the double tower in independent q₁,q₂, and then use derived relative base change identifying q₁=q₂ to obtain the ℛ-balanced tensor statement. The light solid compact generator is Null_R=R⊗^■∏_ℕ𝕊. Its existence motivates the comparison but does not by itself prove that tensor commutes with the required towers; that compatibility is a separate hypothesis.

*Needs:* [§2.7][r36]; [§2.8][r37]; `EnhancedDerivedSheaves:E5:abstract/module-objects`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E5:abstract`; `HabiroCyclotomicCompletions:HC.1`.

See [Q], Proof of B.8, printed/PDF pp.79–80, first two paragraphs; [T], §5.3, printed p.86 (PDF p.90), paragraph defining Null_R.

The API comprises:

- `SolidHabiroCompletion.unit_idempotent`: Under the light solid product/tower and balanced-tensor supplier contract, S_H⊗^■_ℛ S_H≃S_H as commutative algebra objects, with the multiplication as comparison.

**Checks.**

- At n=1, ℛ/P₁ is one sphere; at n=2 it has three sphere summands. A rank n formula would fail at the second stage.
- The unit law is the ℛ-balanced multiplication S_H⊗^■_ℛS_H→S_H. An absolute tensor has two independent variables and is not this comparison.
- After reduction by P_n the multiplication comparison is the finite free quotient with q₁=q₂. Polynomial representatives split over the sphere, without an ℛ-linear splitting claim.

<a id="hr-2-completed-countable-free-solid-modules"></a>

### 2.10 Completed sums of countable products

For countable sets I_n, allowing empty and finite sets, set F_I=⊕_n∏_{i∈I_n}S_H and C_I=L_HF_I. Put J_r=fib(S_H→S_H/P_r), with its specified map to S_H, and J₀=S_H. For proper functions f:ℕ→ℕ, meaning f(n)→∞, there is a natural equivalence
\[
 C_I\simeq\mathop{\rm colim}_{f}\prod_n\prod_{i\in I_n}J_{f(n)}.
\]
The order on profiles is reverse pointwise order; an arrow f→g has f(n)≥g(n), and its maps are the corresponding ideal inclusions. The J_r are fiber objects and multiplication maps, not subsets of a spectrum.

The equivalence describes factorial decay in the block index and is natural for the specified finite-support block maps. The family constantly equal to 1 is not decaying; a family weighted by P_n is. The countable product and completion contracts are hypotheses of this spectral assertion. Bosco's abelian null-family formula supplies its model, not a proof for arbitrary light solid spectra.

*Needs:* [§2.9][r38]; [§2.8][r37]; `HabiroCyclotomicCompletions:HC.1/topology-completeness-and-universal-property`; `EnhancedDerivedSheaves:E5:abstract`; [§2.7][r36].

See [Q], Proof of B.8, printed/PDF p.80, completed sum formula; [Bosco], Lemma A.4 and its proof, printed/PDF p.93.

The API comprises:

- `CountableSolidHabiroFree`: For a countable block family I, construct C_I=L_H(⊕_n∏_{i∈I_n}SH).
- `CountableSolidHabiroFree.ideal`: J_r is fib(SH→SH/P_r), with transition J_s→J_r for r≤s induced by P_r \| P_s.
- `CountableSolidHabiroFree.null_family`: C_I ≃ colim_{f→∞}∏_{n,i∈I_n}J_{f(n)}, natural in finite-support block maps.
- `CountableSolidHabiroFree.inclusion`: The nth block map ∏_{i∈I_n}SH→C_I is the completed coproduct injection.
- `CountableSolidHabiroFree.ext`: For complete Q, restriction to the block inclusions gives Map(C_I,Q)≃∏_n Map(∏_{i∈I_n}SH,Q).
- `CountableSolidHabiroFree.complete`: RHom_R(T,C_I)=0, and C_I→lim_r C_I/P_r is an equivalence.
- `CountableSolidHabiroFree.transition`: If f≥g pointwise, the profile transition is ∏J_{f(n)}→∏J_{g(n)}; min(f,g) gives a common target.
- `CountableSolidHabiroFree.map`: For an SH-linear finite-support block map u:F_I→F_J, define C(u)=L_H(u):C_I→C_J. A finite-support block map means each input block map factors through a finite subcoproduct of output blocks.
- `CountableSolidHabiroFree.map_id`: C(id_{F_I})=id_{C_I}.
- `CountableSolidHabiroFree.map_comp`: C(v∘u)=C(v)∘C(u) for composable finite-support block maps, with the reflection coherence.
- `CountableSolidHabiroFree.inclusion_naturality`: For such u, C(u)∘η_{F_I}∘ι_n=η_{F_J}∘u∘ι_n, where ι_n includes the nth input block.

**Checks.**

- `CountableSolidHabiroFree.empty`: If every I_n is empty then C_I=0.
- `CountableSolidHabiroFree.one_block`: If I_0 is a singleton and every other I_n is empty then C_I≃SH.
- `CountableSolidHabiroFree.constant_not_null`: For singleton blocks, the constant family (1,1,…) in ∏_NSH is not in the image of C_I→∏_NSH: modulo P_1=1−q (the same ideal as q−1) it is nonzero in infinitely many coordinates.
- `CountableSolidHabiroFree.decaying_family`: For singleton blocks the maps P_n:SH→SH in the nth coordinate assemble to a map SH→C_I, since n↦n is a proper weight.

<a id="hr-2-countable-solid-habiro-tensor"></a>

### 2.11 Tensor products of completed countable sums

Under the same solid contracts, the solid tensor of C_I and C_J agrees with the Habiro completion of the double-index family tensor. Factorial weights in the two indices can be compared with a proper radial weight: P_aP_b divides P_{a+b}, and proper f(n)+g(m) is dominated by a suitable proper h(n,m). Conversely, a proper h admits separable proper lower profiles after taking successive finite minima. Both directions are needed to identify the profile colimits.

The passage through countable products and these colimits uses the supplier's exactness and the commutation of ω₁-filtered colimits with countable limits. An abelian p-adic completed tensor comparison has analogous weights, but cannot replace the spectral proof. Use HC Layer 1's `qBinomial_factorial` with n=a+b and k=a, and `qFactorial_pochhammer`, to obtain the integral identity
\[
 P_{a+b}=P_aP_b{a+b\brack a}_q.
\]
Multiply the Gaussian-factorial relation by (1−q)^{a+b} and apply the Pochhammer identity on each side; this derivation requires no cancellation. Thus `CountableSolidHabiroTensor.factorial_mul_dvd` is an application of that earlier toolkit. Prove the identity in ℤ[q], then transport it to B[q] for any commutative B. This preserves characteristic-p and root-of-unity specializations without dividing by P_aP_b. In particular evaluating the uncancelled factorial products at q=1 gives zero for positive indices; it does not define a quotient there.

*Needs:* [§2.10](#hr-2-completed-countable-free-solid-modules); `HabiroCyclotomicCompletions:HC.1` §1.1, `qBinomial_factorial` and `qFactorial_pochhammer`; `EnhancedDerivedSheaves:E5:abstract`; [§2.9][r38]; [§2.7][r36]; [§2.8][r37].

See [Q], Proof of B.8, printed/PDF p.80, final three paragraphs; [Bosco], Proposition A.3, printed/PDF pp.92–93.

The API comprises:

- `CountableSolidHabiroTensor.comparison`: C_I⊗■_SHC_J ≃ L_H(F_I⊗■_SHF_J), naturally in countable block families.
- `CountableSolidHabiroTensor.factorial_mul_dvd`: For a,b∈ℕ, including zero, P_aP_b divides P_{a+b} in B[q] for any commutative ring B, by coefficient change from the integral HC Layer 1 identity. Its quotient is the Gaussian polynomial supplied there.
- `CountableSolidHabiroTensor.separable_weights`: If for each k there exists B such that m+n≥B implies h(m,n)≥k, there are f,g:N→N tending to infinity with f(m)+g(n)≤h(m,n) for every m,n.
- `CountableSolidHabiroTensor.radial_max`: If f,g tend to infinity, max(f(m),g(n)) tends to infinity as m+n→∞.

**Checks.**

- For a=b=1, P₂=P₁²(1+q); this fixes the factorial divisibility direction P_aP_b∣P_{a+b}. The polynomial equality is proved in Suggested.lean. The reverse divisibility fails over ℤ: at q=−1, P₂=0 but P₁²=4.
- With a=0 or b=0 the Gaussian quotient is one and the divisibility is equality. At q=1 the polynomial 1+q is 2 over ℤ and zero over 𝔽₂, although the unevaluated factorization remains valid in both coefficient rings. These checks exclude cancellation after specializing a vanishing denominator.
- For singleton blocks weighted by P_n and P_m, the double family has proper radial decay. A constant weight fails the modulo-P₁ finite-support test.

<a id="hr-2-the-solid-comparison-is-bounded-below"></a>

### 2.12 Bounded-below solid tensor closure

Assume the preceding unit, profile tensor and resolution contracts. If M and N are bounded-below Habiro-complete solid S_H-modules, their solid tensor is again Habiro-complete and agrees with the completed tensor comparison. Resolve them by the countable-product free modules with a uniform lower homotopy bound; realization and the tensor comparisons then preserve completeness.

The ordinary completed-discrete embedding is consequently symmetric monoidal on bounded-below complete objects. The proof uses the uniform bound and the supplied exactness of these realizations. It does not assert the same closure for every unbounded pair. The boundedness convention is homotopy bounded below, equivalently cohomology bounded above in the abelian comparison.

*Needs:* [§2.8][r37]; [§2.5][r40]; SolidAnalyticRings:SA.1 (including the uniformly bounded resolution and realization contract); `VStackSheavesAndLisseCategories:VS2` (abelian comparison only); `StableHomotopyKTheory:H.6`.

See [Q], Appendix B, Lemma B.8 and proof, pp.79–80.

The API comprises:

- `CountableSolidHabiroTensor.bounded_below`: With the stated light solid spectral resolution contract, e(M)⊗^■_{S_H}e(N)≃e(L_H(M⊗_ℛN)) for bounded-below complete M,N.
- `SolidHabiroCompletion.boundedBelow_monoidal`: Under the full solid supplier contract, the completed-discrete embedding preserves unit and tensor on bounded-below complete objects. Both factors are bounded below; no assertion for arbitrary unbounded pairs is part of this export.
- `SolidHabiroCompletion.boundedBelow_tensor`: For bounded-below Habiro-complete solid S_H-modules M,N, M⊗^■_{S_H}N is Habiro-complete. This requires the uniformly bounded-below resolution and realization comparison, in addition to unit idempotence.

**Checks.**

- For complete bounded-below M, e(S_H)⊗^■_{S_H}e(M)≃e(M); with M=0 the tensor is zero. These use the same multiplication comparison as unit idempotence.
- A connective resolution remains uniformly bounded below under the specified realization. A family of arbitrarily negative shifts does not satisfy that uniform-bound hypothesis and cannot be used in this deduction.

### Examples

The checks above compute the Laurent cofiber, the telescope sign, torsion coefficient quotients, q²−1/q³−1 Tor, flat coefficient base change, factorial weights and completed null families.

### Dependencies

HabiroCohomologyFoundations §0.1 (reflection, tower formulas, completed tensor and detection); HabiroCyclotomicCompletions:HC.1 (including the elementary factorial identities), HC Layer 2 §2.3 and Layer 5 §5.1 (ordinary polynomial coefficient modules); DD.1, E0/E1/E3/E5 and H.5/H.6. The solid results additionally require the complete SA.1 spectral contract; VS2 supplies only its abelian comparison. The ordinary/derived comparison uses the nonsolid reflection and no q-de Rham or trace construction.

## Layer 3: The prime-chain index and descent mapping spaces

At a fixed positive m the intersections of cyclotomic supports are organized by prime-power chains. This layer computes that index, which the finite complete descent of HabiroCohomologyFoundations §0.2 uses, states the general descent principle for tensor-compatible localizations, and unravels the descent mapping spaces on the index.

<a id="hr-3-the-divisor-poset-and-its-intersections"></a>

### 3.1 Cyclotomic intersections

Let T=Div(m), Q be the poset of nonempty subsets of T, and I_S=(Φ_d(q)∣d∈S). If S is not contained in a single prime-power chain, I_S is the unit ideal. If |S|≥2 lies in a p-power chain with p-free part d, its radical is (p,Φ_d(q)); different p-free parts become disjoint after p-completion. These statements follow from the cyclotomic resultant/intersection calculation of W, Lemma 2.1.

Singletons retain their Φ_d-adic supports. The distinction between ideals and their radicals is needed: completion categories depend only on the radical, whereas quotient rings need not. For m=4, {1,4} has a nontrivial intersection although it is not a vertex of the reduced index; it is recovered through the maximal chain {1,2,4}.

*Needs:* `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`; `HabiroCyclotomicCompletions:HC.4/cyclotomic-congruence-and-prime-ideal`; `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; `Polynomial.cyclotomic`; `Nat.divisors`.

See [W], §2.1, Lemma 2.1, p.8; [Q], §2.1, proof of Corollary 2.4 and Remark 2.5, pp.14–15.

<a id="hr-3-finite-descent-index"></a>

### 3.2 The finite prime-chain index

Define P⊆Q to consist of the singleton divisors and, for each p∣m and p-free d∣m, the maximal chain C_{p,d}={d,dp,…,dp^{v_p(m)}}. Use distinct subsets as vertices and subset inclusion as arrows. The index is finite. Its data are separate from the ideal attached to each subset.

For m=1 it has one singleton and no prime-chain vertex. For m=6 it has eight vertices, with the incidence graph of the four singleton divisors and four two-element prime chains. For m=12 it has eleven vertices. These examples fix the maximal-chain convention and prevent adding every proper prime-power subchain as a new vertex.

*Needs:* `Nat.divisors`; `Nat.primeFactors`; `Nat.factorization`; `CategoryTheory.Nerve.quasicategory`; [§3.1][r41]; `Nat.exists_eq_pow_mul_and_not_dvd`; `Nat.factorization_mul`; `Nat.Prime.factorization_pow`; `Nat.factorization_eq_zero_of_not_dvd`; `Nat.factorization_le_iff_dvd`.

See [Q], Proof of Corollary 2.4, p. 15, definition of P.

The API comprises:

- `CyclotomicIndex.primeChain`: For m,d,p define the finset {d p^i : i ≤ v_p(m)}; for p prime dividing m and p-free d dividing m it is a vertex.
- `CyclotomicIndex.vertices`: The finset of vertices is the union of singleton divisors and maximal chains at prime factors of m.
- `CyclotomicIndex.mem_vertices`: S is a vertex iff S is a singleton divisor or S=C(m,d,p) for p dividing m and p-free d dividing m.
- `CyclotomicIndex.vertex_subset`: Every vertex is a subset of Nat.divisors(m).
- `CyclotomicIndex.vertex_nonempty`: Every vertex is nonempty.
- `CyclotomicIndex.le_iff_subset`: For S,U∈P(m), S≤U if and only if their underlying finite subsets satisfy S⊆U. Use the inherited subtype order on finite sets.
- `CyclotomicIndex.nerve_quasicategory`: The nerve of P(m), using Mathlib’s preorder category, is a quasicategory.

**Checks.**

- `CyclotomicIndex.test_one`: vertices(1) = {{1}}.
- `CyclotomicIndex.test_four`: vertices(4) = {{1},{2},{4},{1,2,4}}.
- `CyclotomicIndex.test_six`: vertices(6) = {{1},{2},{3},{6},{1,2},{3,6},{1,3},{2,6}}.
- `CyclotomicIndex.test_not_pair_four`: {1,4} is not a vertex of P(4), although it is a surviving intersection in Q(4).
- `CyclotomicIndex.test_incomparable_singletons`: For the vertices S={1} and U={2} of P(2), neither S≤U nor U≤S holds, although 1 divides 2. This distinguishes the required subset order from divisibility of singleton members.

<a id="hr-3-finite-index-height-one"></a>

### 3.3 Height one of the reduced index

Every nonidentity arrow of P goes from a singleton to a maximal prime-power chain. Distinct maximal chains are incomparable, and no nonidentity arrow can follow another. Thus its nerve has no nondegenerate simplices above dimension one. Prove this from uniqueness of the p-free part and maximality of the displayed chains.

There may still be cycles in the undirected incidence graph, as for m=6. Height one removes additional compositional cocycles; it does not make all edge comparisons identical or make the mapping space discrete.

*Needs:* [§3.2][r42]; [§3.1][r41].

See [Q], Proof of Corollary 2.4, p. 15, definition of P and maximal prime-power subsets.

<a id="hr-3-prime-edge-factorisation"></a>

### 3.4 Consecutive prime edges determine chain data

Whenever d, pd divide m there is exactly one maximal p-power chain containing that consecutive pair. Write d=pⁱe with p∤e to find it. Consecutive comparisons along that chain determine all longer comparisons by composition. Each elementary prime edge therefore belongs to precisely one chain, and the composite from pʲe to pⁱe uses its unique successive path.

This calculation allows descent objects to be specified by E_d and h_{p,d} without introducing independent maps for nonconsecutive ratios. The higher associativity of composition comes from the enhanced categorical supplier; an arbitrary choice of strict inverse maps is unnecessary.

*Needs:* [§3.2][r42]; `Nat.exists_eq_pow_mul_and_not_dvd`; `Nat.factorization_mul`; `Nat.Prime.factorization_pow`; `Nat.factorization_eq_zero_of_not_dvd`; `Nat.factorization_le_iff_dvd`.

See [Q], Corollary 2.4 and its proof, pp. 14–15, comparisons h_(p,d) and the prime-power index.

<a id="hr-3-the-general-descent-principle"></a>

### 3.5 Finite descent for tensor-compatible localizations

Let P be a poset with finite meets, let Z∈P, and let {Z_i→Z}_{i∈J} be a finite family. Let D be a presentable stable symmetric monoidal ∞-category whose tensor preserves colimits separately. Define `FiniteMonoidalDescent.Datum` by the following data and hypotheses, for Z and its intersections:

- Each D_T⊆D is a full presentable stable reflective subcategory, with an accessible exact left adjoint L_T to its inclusion. For T′→T require D_T′⊆D_T; restriction is L_T′ on D_T. Retain the units and the coherent identity/composition equivalences of these restrictions.
- Each localization is tensor-compatible: L_T(x⊗y)≃L_T(L_Tx⊗y), compatibly with its unit. Thus D_T has unit L_T(1) and tensor L_T(x⊗y), and restrictions are symmetric monoidal left adjoints.
- Put Z_S=∧_{i∈S}Z_i for nonempty S⊆J and Z_∅=Z. For every S and i require the **specified overlap equivalence**
  L_{Z_i}L_{Z_S}≃L_{Z_{S∪{i}}}, on D_Z, compatible with the localization units, inclusions of subsets, repeated indices, and the associativity and symmetry of iterated overlaps. Equivalently give a coherent finite cube of commuting idempotent localizations with these values. Pairwise unlabelled equivalences are insufficient data.
- The restrictions L_{Z_i}:D_Z→D_{Z_i} are jointly conservative. For an empty covering family this condition forces D_Z=0.

`FiniteMonoidalDescent.reconstruct` states that the restriction functor is a symmetric monoidal equivalence

\[
  D_Z\ \simeq\ \varprojlim_{\varnothing\ne S\subseteq J}D_{Z_S},
\]

where transition functors are the indicated localizations and the limit is the coherent limit of categories. It applies to every finite family satisfying the datum, not just to cyclotomic factors, arithmetic completions or bounded objects. Its inverse sends compatible local objects x_S to the finite limit in D_Z of their underlying objects, with transition maps supplied by localization units and the specified descent equivalences.

To prove full faithfulness, form the augmented finite localization cube of x∈D_Z. Its total fibre is killed by each L_{Z_i}: exactness commutes with the finite limit, and the overlap equivalences make the i-direction invertible. Joint conservativity kills the total fibre, so x is the limit of its restrictions. For essential surjectivity apply the same calculation to compatible local objects: localizing their finite limit at i gives x_{\{i\}}, and then every x_S by the overlap equivalences. The subcategory D_Z is closed under limits, so this inverse stays in D_Z. The reconstructed unit and tensor are identified after all restrictions, which are conservative and symmetric monoidal. This gives the monoidal equivalence as well as the equivalence of underlying categories.

The API comprises:

- `FiniteMonoidalDescent.Datum.localize`: L_T, its unit, and the exact accessible reflective-subcategory structure.
- `FiniteMonoidalDescent.Datum.overlap`: the coherent overlap equivalences for all S and i, including the empty-S unit condition.
- `FiniteMonoidalDescent.restrict`: the restriction functor with its symmetric monoidal structure and coherent subset transitions.
- `FiniteMonoidalDescent.reconstruct`: the equivalence above, its finite-limit inverse, and unit/counit comparisons with the given local markings.
- `FiniteMonoidalDescent.maps`: for x,y∈D_Z, Map(x,y)≃lim_{S≠∅}Map(L_{Z_S}x,L_{Z_S}y), naturally in both objects and compatibly with composition. The right side is a homotopy limit of spaces.
- `FiniteMonoidalDescent.commAlgebra`: CAlg(D_Z)≃lim_{S≠∅}CAlg(D_{Z_S}), with the same restriction maps; limits of commutative algebra objects are computed by the enhanced algebra supplier. This is not a statement about ordinary tensor products of underlying rings.
- `FiniteMonoidalDescent.refinement`: for a refinement satisfying the same hypotheses, with the coherent overlap datum also on the union of the two covers, reconstruction commutes with restriction to the refining cover; identity and composition of refinements agree coherently. Check this after every refining localization, using the specified overlap coherences.
- `FiniteMonoidalDescent.sheaf`: on a poset site whose covering families admit finite covering refinements, with the datum for every finite cover and compatibly with base change, T↦D_T and T↦CAlg(D_T) are sheaves. Finite descent and the covering-refinement criterion give this conclusion; no infinite localization cube is used.

**Checks.**

- A singleton identity cover has L_Z²≃L_Z; reconstruction, its map equivalence and its algebra equivalence are identities. Repeating the same cover produces the coherent diagonal equivalence, not two unrelated copies.
- For disjoint summands D=D₁×D₂, the localizations (x₁,x₂)↦(x₁,0) and (x₁,x₂)↦(0,x₂) have zero overlap. The two-piece gluing limit is D₁×₀D₂≃D. Their units send (x₁,x₂) to the corresponding projection; reversing either arrow would not be a localization unit.
- On a site with two disjoint opens covering Z, assign the same nonzero D to Z and each open, zero to the intersection, and take both restrictions from Z to be the identity. They are jointly conservative, but L_1L_2=id_D is not the intersection localization 0. The putative reconstruction is the diagonal D→D×D, which misses (x,0) for x≠0. This is excluded precisely by `Datum.overlap`; nesting and conservativity alone do not prove descent.
- For an empty cover, conservativity to the terminal category forces D_Z=0, so both category and commutative-algebra descent limits are terminal. There is no assertion that an empty cover reconstructs an arbitrary nonzero category.

*Needs:* `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`. The datum and theorem are owned here; no stand-in enhanced carrier is added to Suggested.lean.

Sources: [Q], §2.1, Setup 2.1 and Lemma 2.2, pp.13–14, for the finite localization-cube proof; [HA], §2.2.1, Proposition 2.2.1.9, p.197, for the monoidal localization input, and §3.2.2, Corollaries 3.2.2.4–3.2.2.5, pp.358–359, for algebra limits. The coherent overlap hypothesis is stated explicitly because the proof needs it; it does not follow from nesting and conservativity alone in Setup 2.1. HabiroCohomologyFoundations §0.2 verifies its cyclotomic overlaps and proves that specialization directly. It has no dependency on the general theorem here, which supplies neither a second cyclotomic reconstruction nor a second closed-cover index.


<a id="hr-3-prime-edge-mapping-spaces"></a>

### 3.6 Mapping spaces of prime-edge data

Unravel the mapping-space equivalence `CyclotomicCompleteDescent.maps` of HabiroCohomologyFoundations §0.2 on the reduced index of §3.2. For local objects E,F with their edge equivalences, let V=∏_{d∣m}Map(E_d,F_d) and W=∏_{p,d:pd∣m}Map(E_{pd}̂_p,F_d̂_p). There are two maps V⇒W: first apply the source edge comparison and then the map at d; alternatively apply the map at pd and then the target edge comparison. Prove that the mapping space of the reconstructed algebras is the homotopy equalizer of these maps, naturally in E and F and compatibly with composition. The right Kan extension from the reduced index recovers the redundant subsets (§3.1), consecutive edges determine the longer chain comparisons (§3.4), and height one (§3.3) leaves no higher simplices, so the limit of the intersection mapping-space diagram reduces to this equalizer.

An element is a family of local maps together with a specified path on each prime edge. It is not the strict equalizer of a set of maps. At m=6 all four edge paths are retained, while height one supplies no additional compositional cocycle around the undirected cycle. This formulation exposes the full-faithfulness part of descent.

*Needs:* [§3.1][r41]; [§3.2][r42]; [§3.3](#hr-3-finite-index-height-one); [§3.4](#hr-3-prime-edge-factorisation); HabiroCohomologyFoundations §0.2 (`CyclotomicCompleteDescent.reconstruct`, `CyclotomicCompleteDescent.maps`); `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:abstract`.

See [Q], Proof of Corollary 2.4, p. 15, final limit and unravelling; Lemma 2.2, p. 14.

The API comprises:

- `CyclotomicIndex.mapEqualizer`: For marked prime-edge data E, F at level m, the mapping space between their reconstructions is naturally the homotopy equalizer of the two maps V ⇉ W, compatibly with composition of maps and with the reconstruction of HabiroCohomologyFoundations §0.2.

**Checks.**

- At m=1 the product W is empty, hence a point, and the mapping space is Map(E_1,F_1).
- At a prime m=p there is one edge, and the mapping space is the homotopy pullback of Map(E_1,F_1)×Map(E_p,F_p)→Map(E_p̂_p,F_1̂_p) along its two maps; a single local map at d=1 does not determine a map of descent data.
- At m=6 the four edges (p,d)=(2,1),(2,3),(3,1),(3,2) form a cycle in the incidence graph. The equalizer retains one path on each edge and imposes no cocycle around the cycle: by height one (§3.3) no two nonidentity arrows of the reduced index compose, so the limit has no nondegenerate 2-simplices.

### Examples

The m=1,4,6,12 indices above test maximal chains. The m=6 graph has four edge paths and no additional composite cocycle. Independently, §3.5 tests general finite descent on an identity cover, two disjoint summands, an empty cover and a conservative assignment that fails the overlap hypothesis.

### Dependencies

The general theorem §3.5 uses E0/E3/E5 coherent monoidal localization and finite limits. The cyclotomic index and mapping formula additionally use Layer 2, HC.4 cyclotomic resultants and intersections, and HabiroCohomologyFoundations §0.2 (finite cyclotomic complete descent); that supplier proves its instance independently of §3.5.

## Layer 4: The finite relative stages along morphisms of pairs

HabiroCohomologyFoundations §0.3 constructs the marked coefficient lifts E_m(R/A) for a fixed perfectly covered base, functorially in étale A-algebras. This layer extends that functoriality to the category of pairs of §1.1, including changes of base, which Layer 5 uses for the functoriality of the ring, completed base change and the number-field comparisons.

<a id="hr-4-the-finite-relative-habiro-rings"></a>

### 4.1 The finite stages as functors on pairs

For a pair (A,R) and m≥1 write H_{R/A,m} for E_m(R/A), with its marking by qW_m(R/A). Let (f,g):(A,R)→(A′,R′) be a morphism of pairs. The relative q-Witt map qW_m(g):qW_m(R/A)→qW_m(R′/A′) of QW.3 is semilinear over f[q]. Its A′[q]/f_m-linearization starts at qW_m(R/A)⊗_{A[q]/f_m}A′[q]/f_m, which is étale over A′[q]/f_m and is the derived reduction of the f_m-completed base change (H_{R/A,m}⊗^L_{A[q]}A′[q])^∧_{f_m}; the derived tensor is static because qW_m(R/A) is flat over A[q]/f_m (QW.4). By the equivalence in `EtaleHabiroCoefficients.unique` there is a unique map of f_m-complete E∞-A′[q]-algebras from this base change to H_{R′/A′,m} lifting the linearized q-Witt map. Define the stage map as its composite with the base-change unit. Uniqueness gives identities, composites, compatibility with the Φ_d-overlap equivalences of `EtaleHabiroCoefficients.ghost` and with the transitions of `EtaleHabiroCoefficients.transition`.

For R=A, qW_m(A/A)=A[q]/f_m (QW.3), and A[q]^∧_{f_m}, with its identity marking, is a marked complete étale lift; uniqueness identifies it with H_{A/A,m}. Isomorphic pairs give equivalent stages. The stage map of a pair morphism is not obtained by restricting q-Witt coordinates, and need not be the identity on cyclotomic reductions when g is a nontrivial automorphism.

*Needs:* [§1.1][r23]; [Relative q-Witt][r24]; [Étale q-Witt pushouts][r25]; HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.partial`, `EtaleHabiroCoefficients.unique`, `EtaleHabiroCoefficients.ghost`, `EtaleHabiroCoefficients.transition`); HabiroCohomologyFoundations §0.2 (`CyclotomicCompleteDescent.naturality`); `DerivedDeRhamCohomology:DD.1`.

See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; Theorem 2.9, pp.16–17; [W], §2.5, Lemma 2.46, pp.31–32.

The API comprises:

- `RelHabiroStage`: H_{R/A,m}, the coefficient lift E_m(R/A) of HabiroCohomologyFoundations §0.3 with its marking, written in the Laurent convention; this names the supplier's object and constructs nothing.
- `RelHabiroStage.map`: For a morphism of pairs (f, g), the unique f[q]-semilinear map H_{R/A,m} → H_{R′/A′,m} of f_m-complete E∞-algebras whose reduction is qW_m(g), compatible with the overlap equivalences and transitions; map_id and map_comp.
- `RelHabiroStage.equivOfIso`: Isomorphic pairs (A, R) ≅ (A′, R′) give equivalent stages H_{R/A,m} ≃ H_{R′/A′,m}, compatibly with the markings.
- `RelHabiroStage.selfEquiv`: H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}, under which the marking is the quotient map to A[q]/(q^m − 1).

**Checks.**

- `RelHabiroStage.one`: m = 1: there are no prime edges and H_{R/A,1} ≃ R[q]^∧_{(q−1)}.
- `RelHabiroStage.int`: A = R = ℤ: every ϕ_{p/ℤ} is the identity of ℤ_p, so all overlap equivalences are identities and H_{ℤ/ℤ,m} ≃ ℤ[q]^∧_{(q^m−1)} ([Q], Remark 2.8).
- `RelHabiroStage.selfEquiv`: For R = A (perfectly covered), a ⊗ b ↦ ψ^d(a)b identifies the Φ_d-overlap terms with A[q]^∧_{Φ_d(q)} and the overlap equivalences with identities, so H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}.
- `RelHabiroStage.localised`: A = ℤ, R = ℤ[1/2], m = 2: (E_2)^∧_2 = 0, so there is no gluing, E_1 = ℤ[1/2][[q − 1]], E_2 = ℤ[1/2][[q + 1]] and H_{ℤ[1/2]/ℤ,2} ≃ ℤ[1/2][[q − 1]] × ℤ[1/2][[q + 1]] ≅ ℤ[1/2][q]^∧_{(q^2−1)}.
- `RelHabiroStage.map_conj`: For R = ℤ[i][1/2] over ℤ and complex conjugation g, the stage map at m = 4 acts on the Φ₄-reduction R[q]/(q² + 1) ≅ R × R by swapping the idempotents e = (1 − iq)/2 and 1 − e. A stage map that used only the base map and ignored g would be the identity there.
- For the zero étale algebra R=0 every stage is zero. Every stage has a unique unital algebra map to zero. A unital algebra map from zero exists only when its target is zero: for A=R=ℤ and m=1 the target ℤ[[q−1]] is nonzero, so there is no such map from the zero stage. This distinguishes the terminal zero algebra from an initial algebra.

### Examples

For R=ℤ[i][1/2], conjugation swaps the two factors of the order-four reduction, while the first stage is R⟦q−1⟧ for every pair. The localized pair over ℤ[1/2] has no gluing at m=2.

### Dependencies

Layer 1 (pairs); HabiroCohomologyFoundations §0.3 (coefficient lifts, uniqueness, overlaps, transitions) and §0.2 (naturality of reconstruction); QWittVectors QW.3/QW.4 (relative q-Witt functoriality in pairs and étaleness); DD.1.

## Layer 5: The relative ring, Taylor series and completed base change

The static coefficient object E(R/A) of HabiroCohomologyFoundations §0.3 has an ordinary ring presentation. The Taylor description must preserve full coefficient algebras and distinguish coefficient extension from Frobenius re-expansion.

<a id="hr-5-the-relative-habiro-ring"></a>

### 5.1 The relative Habiro ring

Set H_{R/A}=π₀E(R/A), the ordinary ring of the static coefficient object of HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.limit`). Since E(R/A) and every H_{R/A,m}=E_m(R/A) are static, the factorial limit defining E(R/A) is the ordinary inverse-limit ring of the rings π₀H_{R/A,k!}. The factorials are cofinal in the divisibility order, so the same ring is lim_m H_{R/A,m} along the Frobenius transitions of `EtaleHabiroCoefficients.transition`. Its projections, compatible-family lifting map and uniqueness give the ordinary limit universal property for any ring B.

The supplier's derived statements become ordinary ring statements here. Its derived (qᵐ−1)-completion is H_{R/A,m}. The derived quotient by qᵐ−1 is the static qW_m(R/A), so qᵐ−1 is a non-zero-divisor on H_{R/A}, the derived completion is the ordinary (qᵐ−1)-adic completion, and the ordinary quotient H_{R/A}/(qᵐ−1) is qW_m(R/A), with the transitions reducing to the Frobenii F_{m/d}. Its Φ_d-completion is the twisted coefficient completion (R⊗_{A,ψ^d}A)[q]^∧_{Φ_d} of `EtaleHabiroCoefficients.ghost`, and the m=1 completion is R[[q−1]]. Morphisms of pairs induce compatible stage maps by §4.1 and a functorial map on H. The ring is not a localization inverting q−1; already for ℤ its q−1 element is noninvertible.

*Needs:* HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.partial`, `EtaleHabiroCoefficients.ghost`, `EtaleHabiroCoefficients.transition`, `EtaleHabiroCoefficients.limit`); HabiroCohomologyFoundations §0.1 (`HabiroComplete.tower`, `HabiroComplete.detect`); [§4.1][r58]; [§2.1][r29]; [§1.1][r23]; `DerivedDeRhamCohomology:DD.1`.

See [Q], §2.2, 2.7 and footnote (2.1), p.16; Theorem 2.9 and proof, pp.16–17; proof of Lemma 2.12, p.18.

The API comprises:

- `HabiroRings.relativeHabiro`: H_{R/A} = π₀E(R/A) for R étale over a perfectly covered Λ-ring A, equivalently the ordinary ring lim_m H_{R/A,m}.
- `HabiroRings.relativeHabiro.proj`: The maps π_m: H_{R/A} → H_{R/A,m}, compatible with the transition maps.
- `HabiroRings.relativeHabiro.ext`: Two elements with the same projections π_m for all m are equal.
- `HabiroRings.relativeHabiro.lift`: A compatible family of A[q]-algebra maps B → H_{R/A,m}, factors uniquely through H_{R/A}; π_m ∘ lift is the m-th map.
- `HabiroRings.relativeHabiro.factorialEquiv`: The ordinary limit over the chain {n!}, which computes π₀E(R/A), is canonically isomorphic to the limit over divisibility.
- `HabiroRings.relativeHabiro.completionEquiv`: The ordinary (q^m−1)-adic completion of H_{R/A} is H_{R/A,m} for every m, and agrees with the derived completion.
- `HabiroRings.relativeHabiro.cyclotomicCompletionEquiv`: (H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}; for d = 1 this is R[[q−1]].
- `HabiroRings.relativeHabiro.quotientEquiv`: q^m − 1 is a non-zero-divisor and the ordinary quotient H_{R/A}/(q^m−1) is qW_m(R/A) ([Q], Theorem 2.9), under which the transition maps become the Frobenii F_{m/d} ([Q], Remark 2.10).
- `HabiroRings.relativeHabiro.map`: The ring map H_{R/A} → H_{R'/A'} of a morphism of pairs, induced by the stage maps of §4.1, with map_id and map_comp.

**Checks.**

- `HabiroRings.relativeHabiro_zero`: For R = 0, H_{0/A} = 0.
- `HabiroRings.relativeHabiro_self`: For R = A, H_{A/A} ≅ A[q]^N = lim_m A[q]^∧_{(q^m−1)}; for A = Z this is Habiro's ring H (HabiroRings:HR.5/untwisted-relative-habiro-rings). A definition that completed q-adically or (q−1)-adically, or twisted E_d without the linearisation, fails.
- `HabiroRings.relativeHabiro_quotient_Phi4_gaussian`: For A = Z and R = Z[i][1/2] (= O_F[1/disc F], F = Q(i)), H_{R/Z}/Φ_4(q) ≅ R[q]/(q²+1) ≅ R × R, because q² + 1 = (q − i)(q + i) and (q − i) − (q + i) = −2i is a unit; and H_{R/Z}/(q − 1) ≅ R. A definition adjoining ζ_4 through one embedding would give R instead of R × R.
- `HabiroRings.relativeHabiro_qMinusOne`: (H_{R/A})^∧_{(q−1)} ≅ R[[q−1]], compatibly with the projection to H_{R/A,1}.
- `HabiroRings.relativeHabiro_quotient_qWitt`: H_{R/A}/(q^m − 1) ≅ qW_m(R/A); for A = R = Z this is Z[q]/(q^m − 1), by qW_m(Z) ≅ Z[q]/(q^m − 1) (q-Witt v5 Corollary 2.37).
- `HabiroRings.relativeHabiro_not_localisation`: For A = R = Z, q − 1 is not a unit of H_{Z/Z}, since its image in (H_{Z/Z})^∧_{(q−1)} = Z[[q−1]] is not invertible; the construction completes and does not invert the q^m − 1.
- `HabiroRings.relativeHabiro_not_naive`: For R = Z[∛2][1/6], H_{R/Z,5} is not isomorphic to R[q]^∧_{(q^5−1)} as a Z[q]-algebra (HabiroRings:HR.7/the-stage-is-not-the-naive-completion).

<a id="hr-5-roots-choices-and-substitutions"></a>

### 5.2 Compatible roots and the two Taylor maps

Choose primitive roots ζ_m∈ℂ with ζ_{mn}=ζ_mζ_n for coprime m,n and ζ_{p^a}=ζ_{p^{a+1}}ᵖ. One such system is ζ_m=∏_{p∣m}exp(2πi/p^{v_p(m)}). Put C_m=R^(m)⊗_ℤℤ[ζ_m], retaining this tensor algebra in full, and T_m=C_m[[q−ζ_m]]. Put T_{p,m}=(R̂_p⊗_{A,ψᵐ}A)̂_p[ζ_{pm}][[q−ζ_m]].

The map can_{p,m}:T_m→T_{p,m} extends coefficients and keeps the variable q−ζ_m. The map φ_{p,m}:T_{pm}→T_{p,m} first applies completed linearized Frobenius to the coefficients and then substitutes q−ζ_{pm}=(q−ζ_m)+(ζ_m−ζ_{pm}). The difference is p-adically topologically nilpotent, making this re-expansion converge. Taylor expansion τ_m sends q to ζ_m+X_m and its constant coefficient is evaluation at ζ_m.

Changing a compatible root system gives canonical isomorphisms between these presentations. In the abstract algebra R^(m)[z]/Φ_m(z), with a separate formal power-series variable, the relabeling can be represented by the identity. On a fixed realized coefficient algebra, the actual Galois action is generally nontrivial: it sends the chosen root to its new conjugate. Independence of presentations must not be confused with triviality of that action. The usual roots exp(2πi/m) fail the compatibility at orders 3 and 6, where the required difference is a unit.

*Needs:* [completed Frobenius][r27]; `HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots`; `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`; `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; `IsPrimitiveRoot`; `Polynomial.cyclotomic`; `PowerSeries`; `PadicInt`.

See [Q], §2.2, 2.11, p.17.

The API comprises:

- `HabiroRings.CompatibleRoots`: A family (ζ_m)_{m ≥ 1} of primitive m-th roots of unity in ℂ with ζ_{mn} = ζ_mζ_n for coprime m, n and ζ_{p^α} = ζ_{p^{α+1}}^p.
- `HabiroRings.CompatibleRoots.standard`: ζ_m := ∏_p e^{2πi/p^{v_p(m)}}.
- `HabiroRings.coeffAlgebra`: (R ⊗_{A,ψ^m} A)[ζ_m] := (R ⊗_{A,ψ^m} A) ⊗_Z Z[ζ_m] ≅ (R ⊗_{A,ψ^m} A)[x]/Φ_m(x).
- `HabiroRings.taylorFactor`: T_m := coeffAlgebra_m[[q − ζ_m]] and T_{p,m} := (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q − ζ_m]].
- `HabiroRings.canonicalMap`: can_{p,m}: T_m → T_{p,m}, extension of coefficients with the variable kept.
- `HabiroRings.frobeniusMap`: φ_{p,m}: T_{pm} → T_{p,m}, φ_{p/A} ⊗ id on coefficients followed by rex_{ζ_m − ζ_{pm}}.
- `HabiroRings.taylorComponent`: τ_m: (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} → T_m, q ↦ ζ_m + (q − ζ_m); its constant coefficient is evaluation at ζ_m.
- `HabiroRings.CompatibleRoots.sub_topologicallyNilpotent`: ζ_m − ζ_{pm} is topologically nilpotent in the p-complete coefficient ring of T_{p,m}.
- `HabiroRings.frobeniusMap_int`: For A = R = Z, φ_{p,m} is HC.3's rex_{ζ_m − ζ_{pm}} after extension of coefficients.
- `HabiroRings.CompatibleRoots.galoisEquiv`: A change of compatible roots induces isomorphisms of the full coefficient and Taylor presentations intertwining can, φ and τ. Abstractly these are relabelings of the formal cyclotomic generator; the Galois action on a fixed realized coefficient algebra is not asserted to be trivial.

**Checks.**

- `HabiroRings.CompatibleRoots.standard_two_adic`: For the standard system ζ_6 = ζ_2ζ_3 = −ζ_3, so ζ_3 − ζ_6 = 2ζ_3 has positive 2-adic valuation, whereas e^{2πi/3} − e^{2πi/6} = −1 is a unit; with the traditional roots there is no 2-adic re-expansion from order 6 to order 3.
- `HabiroRings.taylorComponent_value_ne_expansion`: In H_{Z/Z}, f = 1 − q³ and 0 have the same value 0 at ζ_3, but τ_3(f) = −3ζ_3²X − 3ζ_3X² − X³ ≠ 0 with X = q − ζ_3; the value at one root does not determine the Taylor expansion there.
- `HabiroRings.coeffAlgebra_gaussian`: For A = Z, R = Z[i][1/2] and m = 4, coeffAlgebra_4 = R ⊗_Z Z[i] ≅ R × R; e = (1⊗1 − i⊗i)/2 is an idempotent sent to 1 by the embedding ζ_4 ↦ i and to 0 by ζ_4 ↦ −i, so choosing one embedding loses a factor.
- `HabiroRings.frobeniusMap_int_example`: For A = R = Z, p = 2, m = 1: φ_{2,1} sends q + 1 = q − ζ_2 ∈ Z[[q − ζ_2]] to (q − 1) + 2 ∈ Z_2[[q − 1]], and can_{2,1} is the inclusion Z[[q − 1]] ⊂ Z_2[[q − 1]].
- `HabiroRings.CompatibleRoots.galoisEquiv_neg_one`: For a = −1, σ_{−1} ∘ can = can ∘ σ_{−1}, σ_{−1} ∘ φ = φ ∘ σ_{−1}, and σ_{−1} ∘ τ_m for (ζ) is τ_m for (ζ^{−1}).
- `HabiroRings.rex_needs_completion`: The re-expansion of Σ_k (q − 1)^k at ζ_3 would have constant coefficient Σ_k (ζ_3 − 1)^k, which has no meaning in the discrete ring Z[ζ_3] and converges in Z_3[ζ_3] because (1 − ζ_3)² = −3ζ_3.
- At m=1 the compatible root is 1, C₁=R and T₁=R[[X]]. The coefficient-extension map keeps X fixed, while the prime-edge map re-expands it by the root difference.
- For R=0 every full coefficient algebra and Taylor factor is zero. For m=1 and arbitrary R, the coefficient algebra is R; neither test selects an embedding into a field.
- For toric A=R=ℤ[t], a⊗b↦ψ^m(a)b identifies R^(m) with A even though ψ^m is not surjective for m>1. Twisting does not mean inverting the endomorphism on A itself.

<a id="hr-5-the-ell-adic-taylor-comparison"></a>

### 5.3 Prime-adic and rational Taylor comparison

For ℓ∤m, the full algebra ℤ_ℓ[ζ_m]=ℤ_ℓ[z]/Φ_m(z) is finite étale and decomposes into all its unramified factors. Taylor expansion identifies the (ℓ,Φ_m)-complete polynomial algebra with power series over this entire coefficient algebra. The separability of Φ_m modulo ℓ and Hensel lifting prove the comparison factor by factor. Over ℚ, Φ_m is irreducible and the rational Φ_m-completion has the analogous full cyclotomic Taylor description.

Do not assert irreducibility of Φ_m over 𝔽_ℓ. Its factors have degree ord_m(ℓ), and there can be several of them. At m=5, ℓ=11 there are four linear factors, so the integral Taylor comparison has four ℤ₁₁ power-series factors. The comparison needs every idempotent factor and remains valid with this correction.

*Needs:* `Polynomial.separable_cyclotomic`; `Polynomial.cyclotomic.dvd_X_pow_sub_one`; `Polynomial.cyclotomic.irreducible_rat`; `Ideal.quotientInfRingEquivPiQuotient`; `PadicInt`; `IsAdicComplete`; `PowerSeries`.

See [Q], §2.2, proof of Lemma 2.12, prime-adic and rational steps, p.18.

<a id="hr-5-the-equaliser-presentation"></a>

### 5.4 The Taylor equalizer

For a fixed compatible root system there is a canonical ring isomorphism
\[
 H_{R/A}\cong\operatorname{Eq}\left(
 \prod_{m\geq1}T_m\ \substack{\longrightarrow\\[-6pt]\longrightarrow}\
 \prod_{p,m}T_{p,m}\right),
\]
where the two components at (p,m) are can_{p,m}(f_m) and φ_{p,m}(f_{pm}). Thus a family belongs to the relative ring exactly when these completed Taylor expansions agree on every prime edge.

Prove it by the reconstruction and arithmetic fracture pieces of HabiroCohomologyFoundations §0.2 (`CyclotomicCompleteDescent.reconstruct`, `CyclotomicCompleteDescent.arithmetic`), applied to the overlap description of §0.3 (`EtaleHabiroCoefficients.ghost`), and by the full prime-adic and rational Taylor comparisons; then pass to the cofinal inverse limit. The enhanced comparison precedes its ordinary equalizer consequence. A single chosen embedding of C_m into an extension field would lose factors, and equality only of root values would discard higher Taylor coefficients.

*Needs:* [§5.1][r62]; [§5.2][r63]; [§5.3][r64]; HabiroCohomologyFoundations §0.2 (`CyclotomicCompleteDescent.reconstruct`, `CyclotomicCompleteDescent.arithmetic`); HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.ghost`); HabiroCohomologyFoundations §0.1 (`HabiroComplete.detect`); [completed Frobenius][r27]; `RingHom.eqLocus`; `CommRingCat.equalizerForkIsLimit`.

See [Q], §2.2, Lemma 2.12 and proof, p.18.

**Checks.**

- For A=R=ℤ the prime-edge maps are coefficient extension and p-adic re-expansion. The equalizer agrees with the classical all-root completion, including every Taylor coefficient.
- For R=0 both products and their equalizer are zero. For R=ℤ[i][1/2], the order-four factor has two components; projecting to one component is not the equalizer of the full diagram.

<a id="hr-5-untwisted-relative-habiro-rings"></a>

### 5.5 When the twists can be removed

If R has global compatible Frobenius/Λ-operations extending those on A and their linearizations are invertible in the required twists, these maps identify the twisted pieces with the untwisted cyclotomic completions. The gluing and its transitions then give the naive Habiro completion of R[q]. In particular R=A, toric self-bases and R=ℤ[1/N] with identity Adams operations have the untwisted description.

For a general étale algebra R the completed Frobenius does not extend globally, so these identifications are unavailable. This theorem gives a sufficient compatibility condition and its examples; it does not replace the twisted construction for every étale R.

*Needs:* [§5.1][r62]; HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.unique`, `EtaleHabiroCoefficients.ghost`); [completed Frobenius][r27]; `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `Algebra.Etale.of_isLocalizationAway`.

See [Q], §2.2, Remark 2.8, p.16; §1.4, Notation 1.22(e), p.12.

<a id="hr-5-completed-base-change"></a>

### 5.6 Completed base change of the ring

Let A→A′ be a map of perfectly covered Λ-rings and set R′=R⊗_AA′ with R étale over A. Then
\[
 (H_{R/A,m}\otimes^L_{A[q]}A'[q])^\wedge_{q^m-1}
 \simeq H_{R'/A',m},\qquad
 L_H(H_{R/A}\otimes^L_{A[q]}A'[q])\simeq H_{R'/A'}.
\]
Use relative q-Witt base change, the stage maps of §4.1, the uniqueness of marked complete étale lifts (HabiroCohomologyFoundations §0.3, `EtaleHabiroCoefficients.unique`) and the reflection of HabiroCohomologyFoundations §0.1 with the base change of §2.5. The statement is derived from those interfaces; it is not a quoted base-change theorem of Q.

If A′ is flat over A, the tensor is ordinary, but completion is still required. For A=R=ℤ and A′=ℤ[x] with toric operations, H⊗_ℤℤ[x]=H[x] is strictly smaller than the Habiro completion of ℤ[x][q]. Flatness permits removal of Tor, not removal of the completion.

*Needs:* [§5.1][r62]; [§5.5][r65]; [§4.1][r58]; HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.unique`); HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`); [§2.5][r40]; [Relative q-Witt][r24]; [§1.1][r23]; [§2.1][r29].

See [W], §2.5, Lemma 2.46, pp.31–32; [Q], §2.2, Theorem 2.9, pp.16–17; deduction by completed deformation.

The API comprises:

- `HabiroRings.relativeHabiro.stage_baseChangeEquiv`: For a Λ-map A→A′ of perfectly covered bases and R′=R⊗_A A′, the (q^m−1)-completion of H_{R/A,m}⊗^L_{A[q]}A′[q] is H_{R′/A′,m}, naturally in the base-change square.
- `HabiroRings.relativeHabiro.baseChangeEquiv`: For the same base-change square, L_H(H_{R/A}⊗^L_{A[q]}A′[q])≃H_{R′/A′}. The comparison is an equivalence of complete E∞ A′[q]-algebras, with identity, composition, stage and Taylor compatibilities.
- `HabiroRings.relativeHabiro.baseChangeEquiv_flat`: Flat A′ over A removes higher Tor in the displayed tensor, while completion remains in both the finite and infinite formulas.

**Checks.**

- For the identity Λ-map A→A, the comparison is the completion counit on H_{R/A}; its stage comparisons are the identities under the canonical markings.
- For R=0 or A′=0 the base-changed étale algebra and both completed expressions are zero. A nonzero or faithfully flat base map is not an extra hypothesis.
- For A=R=ℤ and toric A′=ℤ[t], the series Σ_{n≥0}P_n(q)t^n belongs to H_{A′/A′}. It is not in H[t], which has bounded t-degree. This is a flat base change for which completion cannot be dropped.

<a id="hr-5-number-field-comparison-the-classical-ring"></a>

### 5.7 The classical Habiro ring

For A=R=ℤ with identity Adams operations, the relative ring is canonically Habiro's integral completion lim_n ℤ[q]/P_n. The comparisons identify its projections, q-factorial topology, root evaluations and Taylor maps with the established HC.1/HC.3 library. Its q−1 Taylor map is the classical injective map of HC.4.

The proof removes the identity twists and applies the existing completion universal property, rather than replanning the classical construction. This specialization provides the basic compatibility test for the relative formulas, including the p-adic re-expansion maps.

*Needs:* [§5.4][r66]; [§5.5][r65]; `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `HabiroCyclotomicCompletions:HC.3/the-taylor-map`.

See [Q], §2.2, Remark 2.14, p.19; §1.1, Question 1.1, p.3.

The API comprises:

- `HabiroRings.relativeHabiro.classicalEquiv`: The relative self-ring for ℤ agrees with the established HC integral Habiro ring, preserving its projections and Taylor maps.

<a id="hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale"></a>

### 5.8 Unramified number-field coefficients

For a number field F and a nonzero integer Δ divisible by disc(F), R=𝒪_F[1/Δ] is étale over ℤ. Use the finite free integral basis and the discriminant criterion to show that primes not dividing Δ are unramified, while at primes dividing Δ the localized algebra has no fiber. The localization and étale local criteria give the result.

Neither all primes nor a global Frobenius lift are claimed. The p-completion is zero for p∣Δ, and the nonzero completions at the other primes carry their canonical unramified Frobenius. Divisibility by 6 is unnecessary for this ring assertion; it enters with the line bundles.

*Needs:* `NumberField.RingOfIntegers`; `NumberField.discr`; `NumberField.not_dvd_discr_iff_isUnramifiedIn`; `Algebra.formallyUnramified_iff_forall`; `IsDedekindDomain.flat_iff_torsion_eq_bot`; `Algebra.Etale.of_formallyUnramified_of_flat`.

See [Q], §2.2, Corollary 2.13, p.19, and the étale setup in 2.7, p.15.

The API comprises:

- `etale_localization_away_discr`: For F a number field and nonzero Δ with disc(F)∣Δ, any localization of 𝒪_F away from Δ is étale over ℤ.
- `etale_localization_away_of_prime_dvd`: The radical variant only asks that each rational prime dividing disc(F) divides nonzero Δ; discriminant multiplicities do not matter.

**Checks.**

- For F=ℚ and Δ=1, the ring is ℤ and the map is the identity, hence étale. Divisibility by 6 is not a condition for this target.
- For F=ℚ(i), Δ=2 inverts the same discriminant primes as disc(F)=−4; the radical variant gives ℤ[i][1/2] although −4 does not divide 2.
- For F=ℚ(i), Δ=1 leaves the ramified prime 2 and is excluded. For every p∣Δ the localized p-completion is zero, not an additional unramified field factor.

<a id="hr-5-number-field-comparison-the-number-field-ring"></a>

### 5.9 The GSWZ ring comparison

For R=𝒪_F[1/Δ] as above and base ℤ, the relative Taylor equalizer identifies H_{R/ℤ} with the number-field ring H_R of GSWZ. The isomorphism κ respects each full cyclotomic coefficient algebra, root value, Taylor expansion and completed prime-edge Frobenius. At p∣Δ its p-completed terms vanish.

The comparison imports the actual HB.6 ring with its root and gluing maps. It is a ℤ[q]-algebra comparison, not an assumed R-algebra structure obtained by inserting all constants. Constants must themselves satisfy the Frobenius gluing condition, which usually fails. This distinction is essential for transporting modules and their scalar-extension maps in HR.6.

*Needs:* [§5.4][r66]; [§5.2][r63]; [§5.8][r67]; [§5.7](#hr-5-number-field-comparison-the-classical-ring); [completed Frobenius][r27]; `HabiroNumberFields:HB.6/the-gluing-condition`; `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`; `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`; `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`; `HabiroNumberFields:HB.6`.

See [Q], §2.2, Corollary 2.13, p.19; §1.1, paragraph 1.4, p.4.

Compare [G], §1.4, Definition 1.1 and (11)–(13), pp.6–7: its coefficient ring is 𝒪_F[1/Δ] and its prime edges use completed Frobenius. This is the ring supplied to the trace construction before any cohomology or trace comparison.

The API comprises:

- `HabiroRings.relativeHabiro.numberFieldEquiv`: For positive Δ with disc(F)∣Δ and R=𝒪_F[1/Δ], κ:H_{R/ℤ}≃H_R is a ℤ[q]-algebra equivalence preserving the full Taylor factors and completed Frobenius gluing. No extra divisibility by 6 is needed for this ring equivalence.

**Checks.**

- For F=ℚ and Δ=1, κ is the classical integral comparison. For Δ=2 the prime-2 gluing terms vanish and the valuation-of-order components remain; κ does not turn their product into a domain.
- For F=ℚ(i), the order-four coefficient ring over ℤ[i][1/2] has two factors. κ preserves both; it is a ℤ[q]-algebra comparison without a stipulated insertion of all R-constants.

### Examples

The examples above compute both Gaussian factors, the flat toric series Σ_n P_n(q)t^n and vanishing prime terms at p∣Δ.

### Dependencies

Layers 1–4; HabiroCohomologyFoundations §§0.1–0.3; the full coefficient/Taylor and classical completion interfaces of HC.1/HC.3/HC.4/HC.5; the actual number-field ring and Frobenius gluing of HB.6.

## Layer 6: Scalar extension and transported number-field lines

The scalar ring and its monoidal category already exist before this layer. Completed pullback applies to any morphism of pairs. Number-field line applications retain Δ divisible by 6 and the discriminant, together with the effective global, tensor and integral linear-jet certificates of the arithmetic lines.

<a id="hr-6-completed-scalar-extension"></a>

### 6.1 Scalar extension of complete modules

For a morphism of pairs inducing f:H→H′, define f^*M=L_H(M⊗_H^L H′). It is left adjoint to restriction on complete modules. The adjunction and monoidal localization give coherent identity, composition, tensor and unit maps. On perfect modules the ordinary derived tensor is already complete; in particular an invertible H-module pulls back by the usual tensor product and gives the ordinary Picard map.

An arbitrary infinite direct sum can fail to be complete, so the formula cannot omit completion on all modules. HR.5's coefficient base-change theorem applies only to the specified base-change pair; the present module functor applies to any actual morphism of pairs.

*Needs:* [§5.1][r62]; [§2.1][r29]; HabiroCohomologyFoundations §0.1 (`HabiroComplete.reflect`, `HabiroComplete.tensor`); [§2.5][r40]; [§1.1][r23]; [§4.1][r58].

See [Q], Appendix B, B.1, p.77; application of monoidal completion.

The API comprises:

- `HabiroRings.completedScalarExtension`: f^*M = (M ⊗^L_{H_{R/A}} H_{R'/A'})^∧_H.
- `HabiroRings.completedScalarExtension.adjunction`: f^* is left adjoint to restriction of scalars D̂_H(H_{R'/A'}) → D̂_H(H_{R/A}).
- `HabiroRings.completedScalarExtension.monoidal`: f^*(M ⊗̂^L N) ≃ f^*M ⊗̂^L f^*N and f^*H_{R/A} ≃ H_{R'/A'}.
- `HabiroRings.completedScalarExtension.map_id`: id^* ≃ id.
- `HabiroRings.completedScalarExtension.map_comp`: (g ∘ f)^* ≃ g^* ∘ f^*.
- `HabiroRings.completedScalarExtension.perfect`: On perfect complexes f^* ≃ − ⊗^L_{H_{R/A}} H_{R'/A'}, uncompleted.
- `HabiroRings.completedScalarExtension.quotient`: f^*(H_{R/A}/(q^m − 1)) ≃ H_{R'/A'}/(q^m − 1).
- `HabiroRings.picMap`: Pic(H_{R/A}) → Pic(H_{R'/A'}), [L] ↦ [L ⊗_{H_{R/A}} H_{R'/A'}].
- `HabiroRings.picMap_eq`: picMap agrees with f^* on invertible objects under the fully faithful inclusion of Pic(H_{R/A}) into the invertible objects of D̂_H(H_{R/A}).

**Checks.**

- `HabiroRings.completedScalarExtension_id`: For f = id, f^* ≃ id and picMap = id.
- `HabiroRings.completedScalarExtension_quotient_example`: For f: (Z, Z) → (Z, Z[1/2]), f^*(H_{Z/Z}/(q² − 1)) ≃ H_{Z[1/2]/Z}/(q² − 1) ≅ Z[1/2][q]/(q² − 1) ≅ Z[1/2] × Z[1/2], since (q − 1) − (q + 1) = −2 is a unit.
- `HabiroRings.directSum_not_habiroComplete`: ⊕_{n≥0} H_{Z/Z} is not Habiro-complete: Σ_n (q;q)_n e_n converges in its Habiro completion but has infinitely many non-zero coordinates; so f^* and colimits must be completed.
- `HabiroRings.completedScalarExtension_free`: For M = H_{R/A}^n, f^*M ≃ H_{R'/A'}^n, without completion.
- `HabiroRings.completedScalarExtension_adjunction_unit`: For Habiro-complete N over H_{R'/A'}, maps f^*H_{R/A} → N correspond to maps H_{R/A} → N of H_{R/A}-modules, i.e. to the underlying object of N.

<a id="hr-6-the-transported-regulator"></a>

### 6.2 Transporting the K₃ line bundles

Let F be a number field, choose positive Δ divisible by 6·|disc(F)|, put R=𝒪_F[1/Δ], and let κ:H_{R/ℤ}≃H_R be the Taylor-compatible comparison. Under HB.7's effective global descent and tensor-bijectivity hypotheses, define M_ξ=κ^*H_{R,ξ} for ξ∈K₃(F). The imported inverse pairing and multiplication equivalences give M₀≃H and M_ξ⊗_H M_η≃M_{ξ+η}; hence ρ_F:K₃(F)→Pic(H), ξ↦[M_ξ], is a group homomorphism.

These are actual invertible modules and actual pairing maps. Local p-adic freeness, a symbol for an unspecified line, or a homomorphism between unnamed groups would not supply this construction. No global freeness or existence of a nonzero Picard class follows from it.

*Needs:* [§5.9][r69]; [§6.1][r70]; `HabiroNumberFields:HB.7/the-global-module`; `HabiroNumberFields:HB.7/operations-on-the-modules`; `HabiroNumberFields:HB.7`.

See [Q], §1.1, paragraph 1.4, p.4; [G], §1.5, Theorem 2, p.10; §3.3, proof, p.43.

The API comprises:

- `HabiroRings.transportedRegulator`: For positive Δ divisible by 6·|disc(F)| and the actual HB.7 global line/tensor certificates, ξ↦[κ^*H_{R,ξ}] is a group homomorphism K₃(F)→Pic(H_{R/ℤ}).

**Checks.**

- For ξ=0 the transported line is H with the transported unit pairing. For ξ and −ξ their actual tensor pairing gives H, rather than only an equality of local ranks.
- Taking Δ=6·|disc(F)| meets both source restrictions. Taking Δ=|disc(F)| when it is prime to 6 is permitted for the ring comparison but does not meet this line construction's source hypothesis.
- Neither a free p-adic section at each prime nor a chosen class in an unnamed Picard group specifies M_ξ. The required global module and its multiplication maps must exist before κ-pullback.

<a id="hr-6-the-q-minus-one-completion-is-not-injective"></a>

### 6.3 The q−1 completion map

The first finite-stage projection gives c:H_{R/A}→R[[X]], X=q−1, compatibly with completion and maps of pairs. In the classical integral case HC.4 supplies injectivity. For R=ℤ[1/p], the ring splits into nonzero factors S_a indexed by p-adic valuation of root orders. The map c is injective on the a=0 factor and kills every factor a≥1.

Thus c has nonzero kernel after inverting a prime: the idempotent supported on an a≥1 factor is killed. This is a ring-level obstruction to extending classical Taylor injectivity to all relative coefficients. It says nothing about whether a particular transported K₃ class is nonzero.

*Needs:* [§5.1][r62]; [§5.5][r65]; `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`; `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`; `HabiroCyclotomicCompletions:HC.5`.

See [Q], §1.1, paragraph 1.4, p.4; §2.2, proof of Lemma 2.12, p.18; localization example above.

The API comprises:

- `HabiroRings.qMinusOneCompletion`: The projection c:H_{R/A}→R[[X]], X=q−1, is natural in pairs and identifies derived (q−1)-completion; it is not generally injective.

**Checks.**

- For R=ℤ the classical Taylor map is injective. For R=ℤ[1/2] the idempotent supported on root orders of 2-adic valuation one is nonzero and maps to zero under c.
- The zero coefficient ring gives the unique zero map. For any pair, the composite H→R[[X]]→R agrees with order-one constant evaluation, fixing the variable X=q−1.
- Over ℤ the polynomial q maps to 1+X and q² maps to 1+2X+X². Substituting 1−X would reverse the linear coefficient and fail this normalization check.

<a id="hr-6-order-one-fibre"></a>

### 6.4 Trivializing the order-one fiber

Under the HB.7 descent and tensor hypotheses, let v=constantCoeff∘c:H→R. The evaluation of a transported section at the order-one root defines an R-linear map e_ξ:R⊗_{H,v}M_ξ→R, r⊗f↦r f₁(0). The order-one Kummer torsor is canonically trivial, so this value needs no root choice. The actual inverse-tensor certificate supplied by HB.7 gives a preimage of 1.

The source is invertible over R, so the surjective map e_ξ is bijective; its resulting linear equivalence is uniquely determined by the evaluation map. This trivializes the fiber at q=1. It does not trivialize M_ξ over H. There is no assumed R→H coefficient map: the scalar structure in this tensor product is v:H→R.

*Needs:* [§6.2][r71]; [§6.3][r72]; [§5.9][r69]; `HabiroNumberFields:HB.7/followup-effective-global-descent`; `HabiroNumberFields:HB.7/followup-tensor-bijectivity`; `HabiroNumberFields:HB.7`; `Module.Invertible`; `Module.Invertible.bijective_of_surjective`; `PowerSeries.constantCoeff`; `TensorProduct.lid`.

See [G], Definition 1.4, printed p.10; Proposition 1.5(f), printed p.11; [G], Theorem 2, (25), printed p.10; its proof in §3.3, printed p.43.

The API comprises:

- `OrderOneFibre.map_eq_eval`: For every x in R⊗_H M, t(x)=e(x).
- `OrderOneFibre.inverse_one`: e(t^{-1}(1))=1.
- `OrderOneFibre.coordinates`: For every x in the fibre, e(x)·t^{-1}(1)=x.
- `OrderOneFibre.unique`: Any R-linear equivalence with underlying evaluation e equals t.
- `OrderOneFibre.rescale`: If evaluation is multiplied by a unit u of R, its normalized fibre equivalence is u times t.
- `OrderOneFibre.naturality`: For a ring homomorphism f:R→S and an f-semilinear map u between the actual fibres, if e′(u(x))=f(e(x)) for every x, then t′(u(x))=f(t(x)). This preserves the normalization under HB.7 supported field pullback; it does not assert existence of u or arithmetic naturality.
- `OrderOneFibre.trivialization`: For the actual invertible fiber R⊗_H M and an R-linear evaluator e with a preimage of 1, the equivalence t:R⊗_H M≃R has underlying map e. The two proved Lean checks use the tensor-unit evaluator and its negative; zeroEvaluation rejects the zero map.

**Checks.**

- `OrderOneFibreTests.identity`: For H=R, M=R and e the Mathlib tensor-unit map, t(1⊗r)=r for every r. In the actual regulator application this is ξ=0.
- `OrderOneFibreTests.negativeUnit`: For H=R=Z and e the negative tensor-unit map, t(1⊗3)=−3. A construction ignoring the evaluation normalization fails.
- `OrderOneFibreTests.inverseGenerator`: For any fibre/e/preimage of 1 and any r, t(r·t^{-1}(1))=r. This is a statement about the base-changed fibre only.
- `OrderOneFibreTests.zeroEvaluation`: For H=R=M=Z, the zero evaluator on Z⊗_Z Z has no preimage of 1 and cannot be used to construct t.

<a id="hr-6-completed-regulator-triviality"></a>

### 6.5 From the first fiber to the completed line

For any commutative R, an invertible module P over B=R[[X]] with a specified equivalence P/XP≃R is free of rank one. Lift a generator and use X∈Jac(B) and Nakayama to obtain a surjection B→P; invertibility makes it an isomorphism. Finite projectivity ensures that completed base change of the transported line has the requisite reduction and remains invertible.

Apply this to P=B⊗_H M_ξ, using the order-one equivalence and the tensor base-change identifications. The full basis is not canonical: another lift changes it by a unit in 1+XB. R need not be a local ring. The supplier's integral constant evaluation suffices; one must not assume every higher Taylor coefficient of a line section is integral.

*Needs:* [§6.4][r73]; [§6.1][r70]; `HabiroNumberFields:HB.7/followup-picard-character`; `Module.Invertible`; `Module.Invertible.bijective_of_surjective`; `Module.Invertible.free_iff_linearEquiv`; `CommRing.Pic.mk`; `CommRing.Pic.mk_eq_one_iff`; `CommRing.Pic.mapRingHom`; `PowerSeries.constantCoeff_surj`; `PowerSeries.X_dvd_iff`; `PowerSeries.isUnit_iff_constantCoeff`; `Ideal.mem_jacobson_iff`; `Submodule.mkQ_surjective`; `LinearMap.toSpanSingleton`; `LinearMap.surjective_of_surjective_comp_mkQ`; `TensorProduct.AlgebraTensorModule.cancelBaseChange`; `TensorProduct.quotTensorEquivQuotSMul`; `RingHom.quotientKerEquivOfSurjective`.

See [Q], §1.1, paragraph 1.4, printed p.4; [G], Proposition 1.5(f), printed p.11; §3.3, printed p.45.

The API comprises:

- `completedRegulatorTriviality`: For every commutative R and invertible P over R[[X]], Nonempty(P/XP≃R) implies Nonempty(P≃R[[X]]); the equivalences are R[[X]]-linear, with R acted on by constant coefficient. No locality or Noetherianity is assumed.

**Checks.**

- For P=R[[X]] and the identity fiber marking, any lift of 1 reducing to 1 is a unit. Lifts 1 and 1+X give different bases with the same fiber marking when R=ℤ.
- Take R=ℤ×ℤ, which is not local. The same theorem applies to every invertible P with trivial fiber; no local-ring hypothesis on R is used by Nakayama for (X).
- For R=0 the unique module and both equivalences are trivial. Without an integral fiber equivalence, local p-adic rank one does not provide the displayed hypothesis.

<a id="hr-6-the-regulator-dies-after-q-minus-one-completion"></a>

### 6.6 Vanishing of the completed Picard class

Under the same number-field global descent and integral linear-jet hypotheses, Pic(c)(ρ_F(ξ))=0 in Pic(R[[X]]) for every ξ∈K₃(F). The completed line is B⊗_H M_ξ, and the preceding fiber and Nakayama argument supplies an actual free rank-one B-module. Its inverse pairing and all tensor identifications are transported from HB.7.

The result is conditional on that supplier's global line construction. It does not follow from local rank one alone or from the printed p-adic section definition without its corrected integral condition. Nor does it assert that ρ_F is nonzero before completion. The geometric completion theorem for invertible modules supplies the final deduction once the actual integral fiber is known.

*Needs:* [§6.2][r71]; [§6.3][r72]; `HabiroNumberFields:HB.7/the-global-module`; `HabiroNumberFields:HB.7/invertible-local-sections`.

See [Q], §1.1, paragraph 1.4, p.4; [G], §1.5, Proposition 1.5(f), p.11; §3.3, p.45; with the stated integral descent hypothesis.

The API comprises:

- `HabiroRings.transportedRegulator_completed`: Under the stated global descent, tensor-bijectivity and integral linear-jet hypotheses, Pic(c)(ρ_F(ξ)) is the trivial class for every ξ. It does not assert that ρ_F is nonzero.

<a id="hr-6-regulator-scalar-square"></a>

### 6.7 Supported field scalar comparison

For a number-field embedding F→E, choose one positive Δ divisible by both 6·|disc(F)| and 6·|disc(E)|, and put R=𝒪_F[1/Δ], S=𝒪_E[1/Δ]. Assuming HB.7's effective descent and arithmetic naturality, its actual module equivalence transports to H_{S/ℤ}⊗_{H_{R/ℤ}}M_ξ≃M_{res ξ}. Hence Pic(H_Rel→H′_Rel)(ρ_F(ξ))=ρ_E(res ξ).

The κ comparisons commute with Taylor expansion, the coefficient map R→S, and order-one evaluation. They therefore give commuting first-fiber and completed Picard squares. Identity and successive embeddings obey the tensor unit and associator coherences. The input is the HB.7 equivalence over the Habiro rings, not a tensor over R, since H need not be an R-algebra. This is the supported field pullback; no trace or arbitrary coefficient-change formula is asserted.

*Needs:* [§6.2][r71]; [§6.1][r70]; [§5.1][r62]; [§5.9][r69]; `HabiroNumberFields:HB.7/followup-field-pullback`; `HabiroNumberFields:HB.7/followup-scalar-equivalence`; `HabiroNumberFields:HB.7/followup-picard-character`; [§6.4][r73]; [§6.5](#hr-6-completed-regulator-triviality); `TensorProduct.AlgebraTensorModule.cancelBaseChange`; `TensorProduct.AlgebraTensorModule.distribBaseChange`; `CommRing.Pic.mk_eq_mk_iff`; `CommRing.Pic.mapRingHom_comp_mapRingHom`; `CommRing.Pic.mapRingHom_id`.

See [G], Definition 1.1, (13), printed pp.6–7; Definition 1.4, printed pp.9–10; [Q], Corollary 2.13, printed p.19, and proof.

The API comprises:

- `HabiroRings.transportedRegulator_scalar`: For a field embedding with a common positive Δ divisible by 6 and both discriminants, and the actual HB.7 arithmetic naturality certificate, pullback carries M_ξ to M_{res ξ} and commutes with first-fiber and completed Picard comparisons.

**Checks.**

- The identity field embedding gives the tensor-unit isomorphism. Two successive embeddings give the same module map under the tensor associator, using the imported arithmetic naturality certificate.
- A common Δ divisible by 6 and both discriminants makes both coefficient algebras admissible. A tensor over 𝒪_F[1/Δ] would require a coefficient action that is not generally available on H.

### Examples

The evaluator checks above distinguish its normalization from its negative and from zero. The (ℤ×ℤ)[[X]] example requires no local coefficient ring.

### Dependencies

Layers 1–5, the completed tensor of HabiroCohomologyFoundations §0.1, and Mathlib invertible-module/Picard/tensor APIs. The transported K₃ line statements additionally require the actual HB.7 global module, inverse-tensor, integral linear-jet and supported arithmetic naturality certificates. No Habiro–Hodge or trace object is an input.

## Layer 7: Examples distinguishing the arithmetic construction

These computations test the coefficient algebra, the gluing law and the finite-stage polynomial structure. They also identify the limits of otherwise familiar classical statements.

<a id="hr-7-phi-five-over-f-eleven"></a>

### 7.1 All four factors of Φ₅ modulo 11

Compute Φ₅(q)=q⁴+q³+q²+q+1=(q−3)(q−4)(q−5)(q−9) in 𝔽₁₁[q]. The four roots are distinct, so the Chinese remainder map gives 𝔽₁₁[q]/Φ₅≃𝔽₁₁⁴. Hensel lifting produces the corresponding four ℤ₁₁ factors and hence four Taylor-series factors; at precision 11⁴ the roots lifting 3,4,5,9 are 2786,7825,1963,2066.

This repairs the finite-field irreducibility assertion in the proof of Q, Lemma 2.12 without changing its full-algebra comparison. Mathlib's polynomial evaluation and CRT supply the abstract factorization, while Tau Ceti's conjugate residue map and its lift give an independent all-conjugates interface. Keeping a single root would lose three factors.

*Needs:* [§5.3][r64]; `Polynomial.cyclotomic`; `Ideal.quotientInfRingEquivPiQuotient`; `PadicInt`; `TauCeti.Cyclotomic.conjugateResiduesRingHom`; `TauCeti.Cyclotomic.conjugateResidues_lift`.

See [Q], §2.2, proof of Lemma 2.12, p.18; explicit splitting calculation above.

<a id="hr-7-inverting-a-prime"></a>

### 7.2 The components after inverting p

For R=ℤ[1/p] with identity Adams operations, prime-edge conditions at p vanish and the Taylor equalizer splits as ∏_{a≥0}S_a, with root orders having v_p(m)=a in S_a. Each factor is nonzero. The first Taylor map c at q=1 uses only S₀, is injective on that factor by the existing classical root-connectivity argument, and kills the other factors.

This ring has nontrivial idempotents and is not a domain. It also shows why a Taylor map at one root need not detect the entire relative ring. The admissible coefficient ring is ℤ[1/p], which is étale over ℤ; ℤ_(p) is a different localization and is not the finite-presentation étale input in this example.

*Needs:* [§5.5][r65]; `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`; `Algebra.Etale`; `HabiroCyclotomicCompletions:HC.5`.

See [Q], §2.2, 2.7 and Remark 2.8, pp.15–16; specialization of the Taylor equalizer.

<a id="hr-7-constant-families-do-not-glue"></a>

### 7.3 Constants over the localized cubic ring

Take F=ℚ(∛2), whose integers are ℤ[∛2] and whose discriminant is −108; put R=ℤ[∛2][1/6]. It is étale over ℤ. In the Taylor presentation a constant family r belongs to H_{R/ℤ} exactly when every completed Frobenius φ_p, p∤6, fixes its image. There is generally no map inserting all of R as constants.

At p=5, x³−2=(x−3)(x²+3x+4) modulo 5, and the quadratic factor is irreducible. Thus R̂₅ is ℤ₅ times an unramified quadratic extension, where Frobenius moves the quadratic component of ∛2. The element ∛2 therefore fails the gluing test. Every global endomorphism of R fixes the cubic generator, so it cannot recover this completed map.

*Needs:* [§5.4][r66]; [§5.8][r67]; [completed Frobenius][r27]; `PadicInt`.

See [Q], §2.2, Remark 2.8 and 2.11, pp.16–17; explicit cubic calculation above.

<a id="hr-7-the-stage-is-not-the-naive-completion"></a>

### 7.4 The finite-stage obstruction

For the same R and any m divisible by 5, H_{R/ℤ,m} is not isomorphic to R[q]̂_{qᵐ−1} as a ℤ[q]-algebra. Such an isomorphism would reduce to a naive q-Witt quotient comparison and, by W, Corollary 2.52 and the injection R→R̂₅, force a global Frobenius lift at 5. The preceding endomorphism calculation rules this out.

The nonisomorphism is tied to the marked polynomial variable q. It does not claim that no abstract unmarked ring isomorphism can exist. This example verifies both the necessity of the Adams twists in finite gluing and the distinction between Frobenius transitions and ordinary Witt restriction.

*Needs:* [Naive-quotient obstruction](#hr-4-an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift); [§5.1][r62]; [§7.3](#hr-7-constant-families-do-not-glue); [§5.8][r67]; HabiroCohomologyFoundations §0.3 (`EtaleHabiroCoefficients.partial`); [Relative q-Witt][r24]; `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`.

See [Q], §2.2, Remark 2.8, p.16; [W], §2.6, Corollary 2.52 and preceding discussion, pp.34–35.

### Examples

The four examples above test all-conjugate coefficients, prime inversion, twisted constants and the marked variable.

### Dependencies

Layers 1–6; the stated classical root-connectivity theorem; polynomial factorization, Hensel lifting and the Tau Ceti all-conjugates residue maps.

## Downstream consumers

**RefinedTraceMethods** imports the scalar interfaces independently of its trace constructions. Its perfectly covered base is QW.1's `LambdaRing.IsPerfectlyCovered`, with `isPerfectlyCovered_iff_faithfullyFlat_adams` and `isPerfectlyCovered_iff_faithfullyFlat_colimPerfection`, specified under [perfect covers][r19]. Its completed algebraic tensor is `HabiroComplete.tensor` of HabiroCohomologyFoundations §0.1, with the Laurent and coefficient base-change compatibilities `habiroCompletion_polynomial_eq_laurent` and `habiroTensor_baseChange` of [§2.1][r29] and [§2.5][r40], and spherical unit `SpectralHabiroCompletion.tensor` in [§2.7][r36]. Its solid comparison is `SolidHabiroCompletion.unit_idempotent` and `SolidHabiroCompletion.boundedBelow_monoidal`, with both bounded-below factors and the full spectral supplier contract retained. Its coefficient change is `HabiroRings.relativeHabiro.baseChangeEquiv` in [§5.6](#hr-5-completed-base-change); arbitrary morphisms of pairs instead use `HabiroRings.completedScalarExtension` in [§6.1][r70].

For a number field, `HabiroRings.relativeHabiro.numberFieldEquiv` exports the discriminant-localized scalar ring and its full Taylor/Frobenius comparisons. The ring target only needs discriminant inversion. Applications involving the GSWZ lines, and any spectral trace theorem whose own source assumes 6∣Δ, retain that additional hypothesis. `HabiroRings.transportedRegulator`, `HabiroRings.transportedRegulator_completed` and `HabiroRings.transportedRegulator_scalar` carry the stated HB.7 certificates; the ring equivalence does not supply those certificates automatically.

**HabiroCohomologyFoundationsPartII** and **HabiroNahmSeries** use the ring H_{R/A} with its projections, quotients and Taylor presentation, the number-field comparison and the transported lines. The identification of the étale Habiro–Hodge object with H_{R/A} is the HabiroCohomologyFoundations §4.21 interface recorded under [Exact supplier contracts](#hr-6-the-degree-zero-identification); this roadmap adds no second comparison.

## References

The main locators refer to the fixed versions linked here. Q, W, H, B, G and Bosco use PDF page numbers, which agree with their printed page numbers at the cited passages. The thesis T has four preliminary PDF pages: printed p.86 is PDF p.90.

- **Hab — Kazuo Habiro, _Cyclotomic completions of polynomial rings_, Publications of the Research Institute for Mathematical Sciences 40 (2004), 1127–1146.** [Full text][Hab]. §7.1, Proposition 7.1 and the following Laurent comparison, pp.1141–1142, and §7.3, p.1144, supply the ordinary polynomial and module completions used by Layer 2.
- **Stacks — The Stacks Project.** §10.143, Lemma 10.143.10, tag [04D1], _Commutative Algebra_, chapter PDF p.385, supplies arbitrary-ideal object lifting. §15.11, Lemma 15.11.2, tag [0ALI], _More on Algebra_, chapter PDF pp.28–29, supplies locally nilpotent invariance. §15.93, Lemma 15.93.18, tag [0920], _More on Algebra_, chapter PDF p.267, supplies the Koszul derived-completion tower. Page locators refer to the chapter PDFs, version ed88ff78, compiled 14 July 2026; stable tags identify the statements across later pagination.
- **Q — Ferdinand Wagner, _q-Hodge complexes over the Habiro ring_, arXiv:2510.04782v2.** [Full text][Q]. Its §§2.1–2.2, pp.13–19, locate the finite descent and coefficient lifts consumed from HabiroCohomologyFoundations and the Taylor and number-field presentations proved here; the degree-zero comparison is Corollary 3.13, p.27; completion is Appendix B, pp.77–80. The two-term resolution, finite-field splitting and étale hypotheses are stated in the corrected mathematical forms specified above.
- **W — Ferdinand Wagner, _q-Witt vectors and q-Hodge complexes_, arXiv:2410.23078v5.** [Full text][W]. Degree-zero q-Witt operations and the Λ/relative comparisons occur in §§2.1–2.6, pp.8–35. The Frobenius target in Proposition 2.48 is W_d, as dictated by its index and pushout proof.
- **H — Lars Hesselholt, _The big de Rham–Witt complex_, arXiv:1006.3125v3.** [Full text][H]. Dwork's criterion, integral Frobenius polynomials, generating series and the Witt comonad are in §1, pp.6–19; the cofree adjunction is in §2, p.24. Only the foundational Witt and Λ interfaces needed here are used.
- **B — James Borger, _The basic geometry of Witt vectors, I: The affine case_, arXiv:0801.1691v6.** [Full text][B]. The torsion-free Adams comparison and free arithmetic Λ-ring are in §1, especially 1.17–1.18, pp.12–13.
- **G — Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, _The Habiro ring of a number field_, arXiv:2412.04241v2.** [Full text][G]. The ring is Definition 1.1, pp.6–7; the global line is Definition 1.4, p.10; tensor multiplication is Theorem 2, p.10, with proof in §3.3, p.43. Proposition 1.5(f), p.11, and §3.3, p.45, motivate the first-fiber comparison. The actual integral global lines and supported arithmetic maps are imported from HB.7 with its stated hypotheses.
- **Bosco — Guido Bosco, _Rational p-adic Hodge theory for rigid-analytic varieties_, arXiv:2306.06100v1.** [Full text][Bosco]. Proposition A.3 and Lemma A.4, pp.92–93, supply the written abelian p-adic model for the null-family and boundedness arguments. They do not prove the general light solid spectral contract.
- **T — Ferdinand Wagner, _q-Hodge filtrations, Habiro cohomology, and ku_, thesis, 15 August 2025.** [Full text][T]. §§5.1–5.3, printed pp.85–86 (PDF pp.89–90), describe light solid spectra and their countable-product compact generator.
- **HA — Jacob Lurie, _Higher Algebra_, 18 September 2017.** [Full text][HA]. Proposition 2.2.1.9, p.197, supplies symmetric monoidal localization; Corollaries 3.2.2.4–3.2.2.5, pp.358–359, compute limits of algebra objects; Theorem 7.1.2.13, p.1212, supplies the symmetric monoidal Eilenberg–Mac Lane derived-module comparison; Definition 7.1.3.17 and Proposition 7.1.3.18, p.1219, identify static algebra mapping spaces with ordinary algebra maps.
- **MW — Samuel Meyer and Ferdinand Wagner, _q-Hodge complexes and refined TC−_, author version dated 5 February 2026.** [Full text][MW]. §4.1, 4.1, pp.41–42, describes light solid condensed spectra, the null-sequence criterion and symmetric monoidal solidification. This ambient scalar input is distinct from the refined trace constructions and does not prove all the additional Habiro tower/resolution hypotheses.

[MW]: https://ferdinand-wagner.github.io/papers/q-Hodge.pdf
[Q]: https://arxiv.org/pdf/2510.04782v2
[W]: https://arxiv.org/pdf/2410.23078v5
[r2]: #hr-4-truncated-big-witt-vectors
[H]: https://arxiv.org/pdf/1006.3125v3
[r3]: #hr-1-dwork-ghost-image
[r4]: #hr-1-universal-frobenius-polynomials
[r5]: #hr-1-witt-ring-frobenius-congruence
[r6]: #hr-1-big-witt-comonad
[r7]: #hr-1-big-witt-comonad-laws
[r8]: #hr-1-lambda-coalgebra
[r9]: #hr-1-lambda-rings-with-commuting-adams-operations
[B]: https://arxiv.org/pdf/0801.1691v6
[r11]: #hr-1-coalgebra-adams-laws
[r14]: #hr-1-wilkerson-comparison
[r17]: #hr-1-free-lambda-ring
[r19]: #hr-1-perfectly-covered
[r20]: #hr-1-the-colimit-perfection
[r21]: #hr-4-q-witt-vectors
[r23]: #hr-1-morphisms-of-pairs
[r24]: #hr-4-relative-q-witt-rings
[r25]: #hr-4-q-witt-vectors-of-etale-maps
[r26]: #hr-4-ghost-maps-and-etale-base-change
[r27]: #hr-1-the-etale-frobenius-lift
[r28]: #hr-1-relative-frobenius-of-an-etale-algebra
[r29]: #hr-2-habiro-complete-modules
[r30]: #hr-2-the-two-term-resolution
[Hab]: https://ems.press/content/serial-article-files/40881
[r33]: #hr-2-completeness-on-homotopy-groups
[HA]: https://www.math.ias.edu/~lurie/papers/HA.pdf
[r36]: #hr-2-spectral-habiro-completion
[r37]: #hr-2-habiro-complete-solid-spectra
[T]: https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf
[r38]: #hr-2-solid-habiro-unit-idempotence
[Bosco]: https://arxiv.org/pdf/2306.06100v1
[r40]: #hr-2-the-monoidal-structure
[r41]: #hr-3-the-divisor-poset-and-its-intersections
[r42]: #hr-3-finite-descent-index
[r58]: #hr-4-the-finite-relative-habiro-rings
[r62]: #hr-5-the-relative-habiro-ring
[r63]: #hr-5-roots-choices-and-substitutions
[r64]: #hr-5-the-ell-adic-taylor-comparison
[r65]: #hr-5-untwisted-relative-habiro-rings
[r66]: #hr-5-the-equaliser-presentation
[r67]: #hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale
[G]: https://arxiv.org/pdf/2412.04241v2
[r69]: #hr-5-number-field-comparison-the-number-field-ring
[r70]: #hr-6-completed-scalar-extension
[r71]: #hr-6-the-transported-regulator
[r72]: #hr-6-the-q-minus-one-completion-is-not-injective
[r73]: #hr-6-order-one-fibre

[04D1]: https://stacks.math.columbia.edu/tag/04D1
[0ALI]: https://stacks.math.columbia.edu/tag/0ALI
[0920]: https://stacks.math.columbia.edu/tag/0920
