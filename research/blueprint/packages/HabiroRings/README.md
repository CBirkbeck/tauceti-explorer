# Habiro rings: relative arithmetic constructions and cohomological coefficients

Habiro's completion of the polynomial ring packages expansions at all roots of unity into one arithmetic ring. A relative version must account for Frobenius on its coefficients: an étale algebra over a Λ-ring has canonical Frobenius lifts after prime completion, but usually has no Frobenius endomorphism before completion. The construction here glues Frobenius-twisted cyclotomic completions, identifies their finite quotients with relative q-Witt vectors, and expresses the resulting ring through compatible Taylor series. It then supplies coefficients for the étale Habiro–Hodge comparison and transports the number-field K₃ line bundles to these coefficients.

The central output is an ordinary ring H_{R/A} for a perfectly covered Λ-ring A and an étale A-algebra R. Its finite stages are complete deformations of q-W_m(R/A); their transitions deform Witt Frobenius. Its cyclotomic Taylor factors retain the entire algebra obtained by adjoining a formal primitive root, including every idempotent factor. This matters even in a small example: adjoining a fourth root of unity to ℤ[i][1/2] gives two factors, while Φ₅ over 𝔽₁₁ gives four.

The mathematical layers are:

1. **HR.1 — Λ-rings and Frobenius.** Adams operations, perfectly covered bases, completed étale Frobenius, and the big Witt interfaces that justify the arithmetic Λ-ring convention.
2. **HR.2 — Habiro completion.** Completion and its monoidal structure in derived modules and spectra, followed by the conditional comparison with solid condensed spectra.
3. **HR.3 — Cyclotomic descent.** Finite prime-edge descent with coherent algebra objects and mapping spaces.
4. **HR.4 — Finite relative rings.** Relative q-Witt vectors, marked étale deformation, the finite-stage comparison, and Frobenius transitions.
5. **HR.5 — Relative rings and Taylor series.** The inverse limit, its equalizer description, completed base change, and the classical and number-field comparisons.
6. **HR.6 — Cohomological coefficients and lines.** The degree-zero Habiro–Hodge comparison, scalar extension, transported K₃ classes, and their completed triviality under the number-field descent hypotheses.
7. **HR.7 — Arithmetic examples.** Splitting, localization, failure of constant families to glue, and the failure of naive finite-stage completions.

## Boundaries and imported mathematics

The generic big Witt, Λ-ring and degree-zero q-Witt library belongs to **QWittVectors:QW.0–QW.4**. The specifications below record the interfaces used by the relative construction; their ownership stays there. In particular, the big Witt operations needed in HR.1 are imported from QW.0 before the q-Witt application in HR.4. The order of the layers does not create a dependency of foundational Witt theory on relative Habiro rings. The p-derivation/Frobenius correspondence comes from **PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence**.

The polynomial Habiro topology, q-factorials, Taylor substitution and classical injectivity come from **HabiroCyclotomicCompletions:HC.1, HC.3 and HC.4**; adjoining roots and identifying their cyclotomic coefficients uses **HC.5**. The present roadmap applies those results to twisted coefficient algebras. It does not reconstruct the classical completion or the root-adjoining library.

The enhanced derived categories, coherent diagrams, symmetric monoidal localizations and algebra objects are supplied by **EnhancedDerivedSheaves:E0, E1, E3 and E5:abstract**, and the spectral module comparison by **StableHomotopyKTheory:H.5:spectra, H.5:S-delooping and H.6**. **DerivedDeRhamCohomology:DD.1** supplies derived principal completion and its comparison with ordinary completion under bounded torsion. Mathlib's ordinary `DerivedCategory` and `LightCondMod` are useful underlying categories; their existing definitions do not supply these enhanced or solid spectral structures.

The five solid spectral statements below require the explicit product, tower, tensor and resolution hypotheses stated in HR.2. Their general input is the light solid spectral theory associated with **SolidAnalyticRings:SA.1**, beyond the abelian solid-module scope of **VStackSheavesAndLisseCategories:VS2**. A compact-generator statement or an abelian completed-tensor theorem alone does not establish this input. The construction and comparison of the ordinary relative ring use the nonsolid part of HR.2 and remain independent of these solid hypotheses.

**HabiroCohomologyFoundations:HQ.3–HQ.5** supplies q-de Rham–Witt forms and the Habiro–Hodge complex. The specific smooth-form input is **HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras**; a comparison of Hodge and Nygaard filtrations does not replace it. **HabiroNumberFields:HB.6** supplies the number-field ring and **HB.7** the actual K₃-indexed invertible modules, tensor pairings and supported field pullbacks. Their effective global descent, integral linear-jet condition and arithmetic naturality remain hypotheses of the line comparisons here. Local rank one does not imply the requisite global invertible module. Nahm-sum constructions remain in **HB.10**.

## Notation and library conventions

Rings are commutative and unital. Positive indices m, d and n are positive natural numbers; p and ℓ denote rational primes. A torsion-free ring means that multiplication by every positive integer is injective. On such a ring, arithmetic Λ-data are commuting ring endomorphisms ψᵐ with ψ¹ = id, ψᵐⁿ = ψᵐψⁿ, and ψᵖ(a) − aᵖ ∈ pA. On rings with torsion the definition uses a coalgebra for the big Witt comonad; Adams operations alone are insufficient data. A Λ-map preserves all operations. Perfect means all ψᵐ are bijective; perfectly covered refers to the faithful flatness criterion in HR.1. Every perfect Λ-ring is perfectly covered.

Write R^(m) = R ⊗_{A,ψᵐ} A, with the A-algebra structure through the right factor. A map of pairs (A,R) → (A′,R′) consists of a Λ-map A → A′ and a compatible ring map R → R′. It does not equip R with global Adams operations. The standing hypothesis for finite and infinite relative Habiro rings is **A perfectly covered and R étale over A**. The completed Frobenius φ_{p/A} is a map on R̂_p, and its linearization is an isomorphism between the corresponding completed twists.

Let Φ_m(q) be the m-th cyclotomic polynomial and P_n(q) = ∏_{i=1}^n(1−qⁱ), with P₀ = 1. Set

\[
  R_r=\mathbb Z[q^{\pm1},(q^m-1)^{-1}\mid m\geq1].
\]

Derived quotients are cofibers, not underived quotients with Tor discarded. For example M/f denotes cofib(f:M→M); for a static module its positive homotopy detects f-torsion. Derived I-completion is indicated by a hat with subscript I. Habiro completion L_H is the completion for all cyclotomic divisors, equivalently for the tower P_n. “Static” means homotopy only in degree zero; “bounded below” refers to homotopy degrees. For ordinary power series write X=q−1, or X_m=q−ζ_m at another root.

Big Witt coordinates are indexed by a divisor-stable set S of positive integers. W_m means W_{Div(m)}, whose ghost component is gh_n(a)=Σ_{d∣n}d a_d^{n/d}. F_{m/d}:W_m→W_d denotes Witt Frobenius; Res_d^m is restriction and V_{m/d}:W_d→W_m is additive Verschiebung. These maps have different meanings. The p-typical truncation on {1,p,…,pⁿ} has n+1 coordinates, whereas Mathlib's `TruncatedWittVector p k R` has k coordinates. Exterior λ-operations are distinguished from the Witt coordinates c_n; in particular λ²=−c₂.

Spherical coefficients use ℛ=𝕊[ℤ]=𝕊[q^{±1}], not Hℤ[q^{±1}]. Write S_H=L_Hℛ. The tensor product in the complete category is L_H(M⊗N). For HR-relative modules, the Eilenberg–Mac Lane comparison is symmetric monoidal; restriction from HR to the spherical base is only lax monoidal. Solid tensor products and ordinary spectral tensor products retain their separate notation.

All suggested declaration names in the API tables are mathematical specifications. [Suggested.lean](Suggested.lean) gives their proposed Lean forms where the prerequisite carriers can be expressed at the pinned libraries; `sorry` proves no implementation. The baseline is Mathlib **082e2d3** and Tau Ceti **f790474**. Dependencies written with a roadmap id name the owner of the prerequisite; dependencies beginning `mathlib:` or `tauceti:` name an existing declaration. Local dependencies are linked to the relevant mathematical specification below.

## HR.1 — Λ-rings, perfect covers and completed Frobenius

The relative construction needs a flat supply of Adams twists and a Frobenius map only after prime completion. The first interfaces isolate precisely those two requirements.

<a id="hr-1-lambda-rings-with-commuting-adams-operations"></a>

**Torsion-free Λ-rings.** For torsion-free A, use the Adams data of the conventions as the Λ-structure. A morphism is a ring map commuting with every ψᵐ. Multiplicativity in the index gives commutation, and the prime congruence gives the unique p-derivation δ_p(a)=(ψᵖ(a)−aᵖ)/p. Its p-derivation identities follow from the ring-map identities for ψᵖ through PR.0. Perfection is bijectivity at primes, equivalently at every positive index.

The toric structure on ℤ[x_i] sends x_i to x_iᵐ and fixes integer coefficients. On ℤ and ℚ the identity operations satisfy the congruence; on ℚ it is vacuous because p is a unit. Identity operations on ℤ[x] fail already at p=2. These examples distinguish arithmetic Λ-data from either identity modulo p or a collection of unrelated Frobenius lifts. The Witt section constructed below supplies the equivalent coalgebra convention, with gh_m∘s=ψᵐ.

Prerequisites: `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`; `mathlib:IsAddTorsionFree`; `mathlib:MvPolynomial.expand`; `mathlib:Polynomial.expand`; `mathlib:Polynomial.expand_mul`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.4, 2.31, p.26; Proposition 2.36, p.28; §2.5, Lemma 2.46, pp.31–32; [Q](https://arxiv.org/pdf/2510.04782v2), §1.4, Notation 1.22(e), p.12.

<a id="hr-1-the-colimit-perfection"></a>

**Perfection by Adams transition maps.** Form A^perf as the filtered colimit of copies of A indexed by positive integers ordered by divisibility, using ψ^{n/m} for m∣n. All ψᵐ become invertible. For a perfect Λ-ring B, a Λ-map f:A→B extends uniquely by [a at m]↦(ψ_Bᵐ)⁻¹f(a). This formula both verifies compatibility with transitions and proves the universal property; naturality, the unit law and the composition law follow from uniqueness.

For a toric polynomial ring the result is ℤ[x_i^r∣r∈ℚ_{≥0}], with finitely supported monomials. The rational exponents describe the colimit, not a completion. A perfect input maps isomorphically to its perfection. This construction defines the third criterion for a perfect cover.

Prerequisites: [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.5, Remark 2.47, p.32.

<a id="hr-1-perfectly-covered"></a>

**Perfectly covered bases.** For a Λ-ring A, the following conditions are equivalent: A admits a faithfully flat Λ-map to a perfect Λ-ring; every ψᵐ is faithfully flat; the canonical A→A^perf is faithfully flat. The proof uses descent of faithful flatness from a perfect cover and, in the other direction, the filtered colimit presentation of the perfection. Such A is torsion-free, and its Adams twists of an étale algebra have the flatness needed for ordinary and derived reductions to agree.

Perfect Λ-rings, ℤ, toric polynomial rings and free arithmetic Λ-rings satisfy the condition. Injectivity alone is insufficient: on ℤ[x,y]/(xy), toric Adams maps are injective but ψ² is not flat. A test of perfect coveredness must therefore retain flatness and faithful flatness, rather than merely monicity of the transition maps.

Prerequisites: [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); [Perfection by Adams transition maps](#hr-1-the-colimit-perfection); `mathlib:Module.FaithfullyFlat`; `mathlib:Module.Flat`; `mathlib:Module.Free.of_basis`; `mathlib:MvPolynomial.expand`; `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.4, Notation 1.22(e), p.12; §2.2, 2.7, pp.15–16; [W](https://arxiv.org/pdf/2410.23078v5), §2.5, Remark 2.47 and footnote (2.3), p.32.

<a id="hr-1-relative-frobenius-of-an-etale-algebra"></a>

**Relative Frobenius in characteristic p.** If B has characteristic p and S is étale over B, the relative Frobenius S⊗_{B,F_B}B→S, s⊗b↦sᵖb, is an isomorphism. This is an étale statement: S need not be perfect and the absolute Frobenius of B need not be invertible. Establish it by the unique étale lifting property, or by the standard étale presentation and Frobenius base-change argument. Its naturality under maps of étale algebras is part of the interface.

This is the reduction modulo p of the linearized map used next. The source and target must use the Frobenius twist; replacing it with the untwisted absolute map changes the assertion.

Prerequisites: `mathlib:Algebra.Etale`; `mathlib:Algebra.Etale.baseChange`; `mathlib:Algebra.Etale.of_restrictScalars`; `mathlib:frobenius`; `mathlib:Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul`; `mathlib:AlgebraicGeometry.universallyInjective_eq_diagonal`; `mathlib:AlgebraicGeometry.Flat.isIso_of_surjective_of_mono`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7, p.15.

<a id="hr-1-the-etale-frobenius-lift"></a>

**Completed étale Frobenius.** For perfectly covered A and R étale over A, ψᵖ on A lifts uniquely to a continuous map φ_{p/A}:R̂_p→R̂_p reducing to r↦rᵖ. Its linearization
\[
 (R\otimes_{A,\psi^p}A)^\wedge_p\longrightarrow\widehat R_p
\]
is an isomorphism. Construct the lift at each p-power quotient by nilpotent étale rigidity, identify its first reduction with relative Frobenius, and pass to the compatible inverse limit. Completeness and the mod-p isomorphism give invertibility of the linearization. This does not say that the semilinear map φ itself is an automorphism.

Maps of pairs intertwine these lifts, and successive Adams twists give the iteration coherences needed for prime-power chains. A global endomorphism of R is extra data. For R=ℤ[∛2][1/6], the completed lift at 5 moves the cubic generator, while every global endomorphism fixes it; HR.7 makes this obstruction explicit.

Prerequisites: [Perfectly covered bases](#hr-1-perfectly-covered); [The category of relative inputs](#hr-1-morphisms-of-pairs); [Relative Frobenius in characteristic p](#hr-1-relative-frobenius-of-an-etale-algebra); `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`; `DerivedDeRhamCohomology:DD.1`; `mathlib:Algebra.Etale`; `mathlib:AdicCompletion`; `mathlib:AdicCompletion.isAdicComplete`; `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; `mathlib:Algebra.FormallyUnramified.ext_of_iInf`; `mathlib:IsAdicComplete.liftRingHom`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7, p.15; Remark 2.8, p.16.

<a id="hr-1-morphisms-of-pairs"></a>

**The category of relative inputs.** Objects are perfectly covered Λ-rings A with an étale A-algebra R. An arrow consists of a Λ-map f:A→A′ and a ring map g:R→R′ satisfying g∘ι_A=ι_{A′}∘f. Identity and composition are those of ring maps, with the compatibility checked on the base. Twisted base change, prime completion and the completed Frobenius map are functorial for these arrows.

This category is the domain of all relative Habiro constructions. The arrow R→R′ may be more general than the base-change map R→R⊗_A A′; the stronger base-change formula in HR.5 assumes that precise tensor-product target. No global Λ-structure on R or R′ is part of an object.

Prerequisites: [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); [Perfectly covered bases](#hr-1-perfectly-covered); `mathlib:Algebra.Etale`; `mathlib:Algebra.Etale.baseChange`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2, opening paragraph, p.13; Appendix A, Theorem A.1, p.69.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `LambdaRing` | A torsion-free commutative ring with ring endomorphisms ψ^m (m ≥ 1) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and ψ^p(x) − x^p ∈ p·A for every prime p. |
| `LambdaRing.adams` | The Adams operation ψ^m as a ring endomorphism. |
| `LambdaRing.adams_one` | ψ^1 = id. |
| `LambdaRing.adams_mul` | ψ^(mn) = ψ^m ∘ ψ^n. |
| `LambdaRing.adams_comm` | ψ^m ∘ ψ^n = ψ^n ∘ ψ^m, derived from adams_mul. |
| `LambdaRing.adams_prime_sub_pow_mem` | For prime p, ψᵖ(a)−aᵖ lies in pA for every a∈A. |
| `LambdaRing.Hom` | Ring maps f with f ∘ ψ^m = ψ^m ∘ f for all m, with Hom.id and Hom.comp; the category LambdaRingCat. |
| `LambdaRing.delta` | δ_p(x) = (ψ^p(x) − x^p)/p, well defined by torsion freeness. |
| `LambdaRing.toDeltaRing` | δ_p is a p-derivation, so A is a δ-ring at p with Frobenius ψ^p in the sense of PrismaticCohomology PR.0, and Λ-maps are δ-maps. |
| `LambdaRing.IsPerfect` | Every ψ^p is bijective (equivalently every ψ^m). |
| `LambdaRing.trivialInt` | ℤ (and ℚ) with ψ^m = id; ℚ is perfect. |
| `LambdaRing.toric` | MvPolynomial I ℤ with ψ^m = MvPolynomial.expand m, so ψ^m(x_i) = x_i^m. |
| `LambdaRing.toBigWitt` | The unique Witt section s:A→W(A) with gh_m∘s=ψᵐ, through the torsion-free coalgebra–Adams equivalence. |
| `LambdaRing.colimPerfection` | The colimit perfection A_∞ with its Λ-structure. |
| `LambdaRing.colimPerfection.of` | The Λ-map A → A_∞ from the stage m = 1. |
| `LambdaRing.colimPerfection.isPerfect` | A_∞ is perfect. |
| `LambdaRing.colimPerfection.lift` | For f : A → B a Λ-map to a perfect Λ-ring, the unique Λ-map A_∞ → B with lift ∘ of = f. |
| `LambdaRing.colimPerfection.map` | A Λ-map A → A' induces A_∞ → A'_∞, with map_id and map_comp. |
| `LambdaRing.IsPerfectlyCovered` | There is a faithfully flat Λ-map from A into a perfect Λ-ring. |
| `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_adams` | (i) ⇔ (ii): every ψ^m is faithfully flat. |
| `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_colimPerfection` | (i) ⇔ (iii): A → A_∞ is faithfully flat. |
| `LambdaRing.IsPerfect.isPerfectlyCovered` | A perfect Λ-ring is perfectly covered. |
| `LambdaRing.isPerfectlyCovered_int` | ℤ is perfectly covered. |
| `LambdaRing.isPerfectlyCovered_toric` | Toric ℤ[x_i \| i ∈ I] is perfectly covered. |
| `LambdaRing.not_isPerfectlyCovered_toric_xy` | ℤ[x,y]/(xy) with the toric structure is not perfectly covered. |
| `LambdaRing.IsPerfectlyCovered.adicCompletion_static` | For R flat over A, the derived p-completion of R ⊗_{A,ψ^m} A is the classical AdicCompletion (DD.1). |
| `frobLift` | The Frobenius lift φ_p : R̂_p → R̂_p. |
| `frobLift_comp_algebraMap` | φ_p ∘ ι = ι ∘ ψ^p on A. |
| `frobLift_sub_pow_mem` | φ_p(x) − x^p ∈ p·R̂_p. |
| `frobLift_unique` | A ring endomorphism of R̂_p restricting to ψ^p on A and congruent to x ↦ x^p modulo p equals φ_p. |
| `frobLift_toDeltaRing` | R̂_p is a δ-ring (PrismaticCohomology PR.0) with Frobenius φ_p, and Â_p → R̂_p is a δ-map. |
| `linearisedFrob` | φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p. |
| `linearisedFrob_bijective` | φ_{p/A} is an isomorphism. |
| `frobLift_naturality` | For a morphism of pairs (f, g), ĝ_p ∘ φ_p = φ'_p ∘ ĝ_p. |
| `linearisedFrob_baseChange` | For A → A' a Λ-map and R' = R ⊗_A A', φ_{p/A'} is the completed base change of φ_{p/A}. |
| `frobLift_iterate` | φ_p^k is the unique lift of ψ^(p^k), and its linearisation is an isomorphism. |
| `frobLift_self` | For R = A, φ_p is the p-completion of ψ^p on Â_p. |
| `EtalePair` | A perfectly covered Λ-ring A with an étale A-algebra R. |
| `EtalePair.Hom` | A Λ-map f on bases and a ring map g on algebras with g ∘ algebraMap = algebraMap ∘ f. |
| `EtalePair.instCategory` | The category structure, with Hom.id and Hom.comp componentwise. |
| `EtalePair.Hom.base` | The Λ-map on bases. |
| `EtalePair.Hom.alg` | The ring map on algebras. |
| `EtalePair.forget` | The forgetful functor to Λ-rings. |
| `EtalePair.baseChange` | Base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map to a perfectly covered A'. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `LambdaRing.toric_adams_computation`: In ℤ[x] with the toric structure, ψ^2(x^2 + 3x) = x^4 + 3x^2 and ψ^2(ψ^3(x)) = ψ^3(ψ^2(x)) = ψ^6(x) = x^6.
- `LambdaRing.toric_congruence`: In toric ℤ[x], ψ^p(x) − x^p = 0 ∈ pℤ[x], whereas ψ^p(x) − x = x^p − x ∉ pℤ[x] (its coefficient of x is −1): a definition with the congruence 'ψ^p ≡ id mod p' would exclude the toric example.
- `LambdaRing.not_trivial_on_polynomials`: The identity operations on ℤ[x] are not a Λ-structure: ψ^2(x) − x^2 = x − x^2 ∉ 2ℤ[x]. A definition omitting the congruence would accept it.
- `LambdaRing.int_delta`: ℤ with ψ^m = id is a Λ-ring (n^p ≡ n mod p) and δ_2(3) = (3 − 9)/2 = −3.
- `LambdaRing.rat_isPerfect`: ℚ with ψ^m = id is a perfect Λ-ring; the congruence is vacuous because pℚ = ℚ.
- `LambdaRing.toric_toDeltaRing`: For toric ℤ[x], δ_p(x) = (x^p − x^p)/p = 0, so the PR.0 δ-structure is the one with Frobenius x ↦ x^p.
- `LambdaRing.colimPerfection_toric`: For toric ℤ[x], A_∞ ≅ ℤ[x^a \| a ∈ ℚ_{≥0}] (the monoid algebra of ℚ_{≥0}) with ψ^m(x^a) = x^(ma); the class of x at stage m is x^(1/m).
- `LambdaRing.colimPerfection_of_isPerfect`: For ℤ, ℚ or any perfect Λ-ring, of : A → A_∞ is an isomorphism.
- `LambdaRing.colimPerfection_lift_apply`: For the toric map ℤ[x] → B = ℤ[x^a \| a ∈ ℚ_{≥0}], the lift sends the class of x^k at stage m to x^(k/m).
- `LambdaRing.isPerfectlyCovered_int`: ℤ is perfectly covered by the identity ℤ → ℤ, a perfect Λ-ring.
- `LambdaRing.toric_free_over_adams`: ℤ[x] is free over ψ^2(ℤ[x]) = ℤ[x^2] with basis {1, x}; for example x^3 + 5x^2 + 1 = x·x^2 + (5x^2 + 1)·1 with x^2, 5x^2 + 1 ∈ ℤ[x^2].
- `LambdaRing.toric_colimPerfection_free`: For toric ℤ[x], A → A_∞ = ℤ[x^a \| a ∈ ℚ_{≥0}] is free with basis {x^a : a ∈ ℚ, 0 ≤ a < 1}, in agreement with (ii) ⇔ (iii).
- `LambdaRing.not_isPerfectlyCovered_toric_xy`: A = ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring (a Λ-quotient of toric ℤ[x,y]) whose ψ^p is not flat: y lies in the x-annihilator of A through ψ^p but not in y^pA. A definition that took perfect covering to be automatic, or only required injectivity of the ψ^m, would accept it (every ψ^m is injective here).
- `frobLift_gaussian_inert`: A = ℤ, R = ℤ[i][1/2] (étale over ℤ), p = 3: R̂_3 = ℤ_3[i] and φ_3(i) = −i, because φ_3(i)^2 = −1 and φ_3(i) ≡ i^3 = −i mod 3 while i ≢ −i mod 3.
- `frobLift_gaussian_split`: Same R, p = 5: x^2 + 1 ≡ (x + 2)(x − 2) mod 5, R̂_5 ≅ ℤ_5 × ℤ_5 and φ_5 = id (it fixes the idempotents, since φ_5(e) ≡ e^5 = e mod 5, and ℤ_5 has no other endomorphism).
- `frobLift_self`: R = A: φ_p = ψ^p on Â_p and the linearised Frobenius is the identity; for toric A = ℤ[x], φ_p(x) = x^p on ℤ[x]^∧_p.
- `no_global_frobenius`: A = ℤ, R = ℤ[2^(1/3), 1/6] (étale: 3x^2 is a unit where x^3 = 2). Every ring endomorphism of R is the identity (ℚ(2^(1/3)) has no nontrivial automorphism), and the identity is not a Frobenius lift at 5: x^3 − 2 ≡ (x + 2)(x^2 − 2x − 1) mod 5 with irreducible quadratic factor, so R/5R ≅ 𝔽_5 × 𝔽_25, where x ↦ x^5 is not the identity. Yet φ_5 exists on R̂_5 ≅ ℤ_5 × W(𝔽_25).
- `EtalePair.not_hom_of_non_lambda`: On toric ℤ[x], the ring automorphism f(x) = x + 1 is not a Λ-map: f(ψ^2(x)) = (x + 1)^2 = x^2 + 2x + 1 but ψ^2(f(x)) = x^2 + 1. So (f, f) is not a morphism of pairs (ℤ[x], ℤ[x]) → (ℤ[x], ℤ[x]), although it is a ring map over f.
- `EtalePair.hom_self`: Morphisms (A, A) → (A', A') are exactly the Λ-maps A → A' (g = f is forced).
- `EtalePair.conj_frobenius`: Complex conjugation g on R = ℤ[i][1/2] gives a morphism (ℤ, R) → (ℤ, R); its 3-adic completion commutes with φ_3 (both are conjugation on ℤ_3[i]) without this being imposed.
- `EtalePair.baseChange_toric`: (ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x][i][1/2]) along the Λ-map ℤ → toric ℤ[x] is a morphism of pairs, and it is the base change of the first pair.

## Big Witt coalgebras and free Λ-rings

These are the QW.0–QW.1 interfaces behind the preceding Adams convention. Their proofs work with universal integral polynomials before specialization to torsion coefficients.

<a id="hr-1-dwork-ghost-image"></a>

**Dwork’s integrality criterion.** Let A be torsion-free and choose a Frobenius lift φ_p:A→A for each prime; the lifts need not commute. A sequence (y_n) is the ghost sequence of a unique big Witt vector precisely when
\[
 y_n-\phi_p(y_{n/p})\in p^{v_p(n)}A\qquad(p\mid n).
\]
Necessity follows by expanding the ghost polynomials and applying the prime congruence. For sufficiency, solve n a_n=y_n−Σ_{d∣n,d<n}d a_d^{n/d}; the displayed congruences prove the required divisibility prime by prime, and torsion-freeness gives uniqueness. The same induction applies to finite divisor-stable truncation sets.

With φ₂=id on ℤ, the two-component sequence (1,3) is integral and (1,2) is not. The exponent v_p(n) is essential at higher prime powers; mere divisibility by p does not characterize the ghost image.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:IsAddTorsionFree`.

Source: [H](https://arxiv.org/pdf/1006.3125v3), Lemma 1.1, pp.6–7.

<a id="hr-1-universal-frobenius-polynomials"></a>

**Integral Frobenius coordinate polynomials.** For positive m,n, construct an integral polynomial f_{m,n} in Witt coordinates a_j with j≤mn such that (F_m a)_n=f_{m,n}(a). It is weighted homogeneous of degree mn when a_j has weight j. On the universal torsion-free polynomial ring, Dwork's criterion makes the shifted ghosts gh_n(F_m a)=gh_{mn}(a) integral; uniqueness gives naturality and the composition identities. Evaluating the integral polynomials then defines the maps on every ring.

For m=p prime, the leading term is p a_{pn}, with the remaining terms in lower coordinates, and f_{p,n}≡a_nᵖ modulo p. This finite dependence is what permits arbitrary sets of generators in the free Λ-ring and triangular prime-local presentations.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); [Dwork’s integrality criterion](#hr-1-dwork-ghost-image); `mathlib:MvPolynomial`.

Source: [H](https://arxiv.org/pdf/1006.3125v3), Lemma 1.4, pp.8–9; Lemma 1.8, p.11.

<a id="hr-1-witt-ring-frobenius-congruence"></a>

**Frobenius congruence inside the Witt ring.** For every ring A, including rings with p-torsion, F_p(x)−xᵖ belongs to pW(A). This divisibility is in the Witt ring, not merely coordinatewise congruence in A. Prove the identity and its quotient on a universal torsion-free polynomial ring using the ghost calculations and Dwork integrality, then specialize the resulting integral polynomial identity to A. Injectivity of ghosts cannot be invoked after specializing to a ring with torsion.

The result is used to give W(A) its canonical arithmetic Λ-structure. A coordinatewise reduction F_p(x)_n≡x_nᵖ mod p is a useful check but does not by itself prove this stronger statement.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); [Dwork’s integrality criterion](#hr-1-dwork-ghost-image); [Integral Frobenius coordinate polynomials](#hr-1-universal-frobenius-polynomials); `mathlib:MvPolynomial`; `mathlib:IsAddTorsionFree`.

Source: [H](https://arxiv.org/pdf/1006.3125v3), Lemma 1.18, p.16.

<a id="hr-1-big-witt-comonad"></a>

**Witt comultiplication.** Define Δ_A:W(A)→W(W(A)) by requiring that its n-th outer ghost component be F_n:W(A)→W(A), and let ε_A=gh₁. On the universal ring the ghost specification determines an integral ring map; specializing supplies Δ for every A. Naturality holds for arbitrary ring maps. In particular Δ([a])=[[a]] for the Teichmüller element.

The word “outer” matters: the ghosts of W(W(A)) first take values in W(A). This definition constructs the coaction used for arithmetic Λ-rings; an arbitrary map into a product of ghost rings is not the same object.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); [Dwork’s integrality criterion](#hr-1-dwork-ghost-image); [Integral Frobenius coordinate polynomials](#hr-1-universal-frobenius-polynomials); [Frobenius congruence inside the Witt ring](#hr-1-witt-ring-frobenius-congruence).

Source: [H](https://arxiv.org/pdf/1006.3125v3), Proposition 1.19, pp.17–18.

<a id="hr-1-big-witt-comonad-laws"></a>

**Counit and coassociativity.** Prove ε_{W(A)}Δ_A=id, W(ε_A)Δ_A=id and Δ_{W(A)}Δ_A=W(Δ_A)Δ_A. On universal torsion-free coefficient rings these follow from F₁=id and F_mF_n=F_{mn}. Universal polynomial identities extend the equations to arbitrary A. Together with naturality they make (W,ε,Δ) a comonad on commutative rings.

The first and second counit identities have distinct types and both are required. They imply W(gh_m)Δ=F_m and provide the uniqueness calculation in the cofree adjunction.

Prerequisites: [Witt comultiplication](#hr-1-big-witt-comonad); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors).

Source: [H](https://arxiv.org/pdf/1006.3125v3), Proposition 1.19, pp.17–18.

<a id="hr-1-lambda-coalgebra"></a>

**Arithmetic Λ-rings with torsion.** An arithmetic Λ-ring on any commutative A is a ring map s:A→W(A) satisfying ε_As=id_A and Δ_As=W(s)s. A Λ-map f:(A,s)→(B,t) satisfies W(f)s=tf. Use these literal ring-map equations, with identity and composition, to form the category of coalgebras. This definition retains the data lost by ghosts when A has torsion.

W(A) with coaction Δ_A is the canonical cofree example. The two coaction equations are equations of actual maps; no proposition standing for an unavailable comparison is part of the data.

Prerequisites: [Witt comultiplication](#hr-1-big-witt-comonad); [Counit and coassociativity](#hr-1-big-witt-comonad-laws); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors).

Source: [H](https://arxiv.org/pdf/1006.3125v3), Definition 1.21 and Definition 1.23, pp.18–19.

<a id="hr-1-coalgebra-adams-laws"></a>

**Adams operations of a coalgebra.** Set ψᵐ=gh_m∘s for a Witt coalgebra. The counit and coassociativity equations imply ψ¹=id and ψᵐψⁿ=ψᵐⁿ, hence commutation. The Witt-ring Frobenius congruence yields ψᵖ(a)−aᵖ∈pA. Coalgebra morphisms commute with these operations. All of these conclusions hold with torsion coefficients.

The converse requires torsion-freeness: ghosts need not recover the coaction over a ring with torsion. The Adams form used for relative inputs is therefore justified by the comparison below rather than used as a definition on all rings.

Prerequisites: [Arithmetic Λ-rings with torsion](#hr-1-lambda-coalgebra); [Counit and coassociativity](#hr-1-big-witt-comonad-laws); [Integral Frobenius coordinate polynomials](#hr-1-universal-frobenius-polynomials); [Frobenius congruence inside the Witt ring](#hr-1-witt-ring-frobenius-congruence).

Source: [H](https://arxiv.org/pdf/1006.3125v3), Lemma 1.24, p.19.

<a id="hr-1-adams-to-witt-section"></a>

**The Witt section of torsion-free Adams data.** For torsion-free A with the Adams identities and prime congruence, construct s:A→W(A) by prescribing gh_n(s(a))=ψⁿ(a). The recursion is
\[
 n c_n(a)=\psi^n(a)-\sum_{d\mid n,\ d<n}d\,c_d(a)^{n/d}.
\]
Dwork's criterion proves the numerator is divisible by n. Thus c₁(a)=a and c_p(a)=δ_p(a). Ghost injectivity proves that s is a ring map. The construction works simultaneously over all finite divisor-stable truncations and passes to the full Witt ring.

Prerequisites: [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); [Dwork’s integrality criterion](#hr-1-dwork-ghost-image); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:IsAddTorsionFree`; `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

Source: [B](https://arxiv.org/pdf/0801.1691v6), §1.6–1.9 and §1.17, pp.8–10,12–13; [W](https://arxiv.org/pdf/2410.23078v5), §2.4, 2.31, p.26.

<a id="hr-1-adams-witt-section-laws"></a>

**Ghost identities and naturality of the section.** The constructed section has gh_n∘s=ψⁿ for every positive n. If f is a map preserving Adams operations between torsion-free rings, W(f)s_A=s_Bf, by comparing each ghost component. The same argument proves uniqueness of a section with these ghosts. These identities supply the truncated maps s_m used in relative q-Witt theory.

Ghost injectivity is used only on torsion-free targets. The naturality statement must name that hypothesis instead of asserting that an arbitrary collection of ghosts determines maps on every ring.

Prerequisites: [The Witt section of torsion-free Adams data](#hr-1-adams-to-witt-section); [Dwork’s integrality criterion](#hr-1-dwork-ghost-image); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.4, 2.31, p.26.

<a id="hr-1-wilkerson-comparison"></a>

**The torsion-free coalgebra–Adams equivalence.** On torsion-free commutative rings, passing from a Witt coalgebra to its Adams operations and constructing the Witt section are mutually inverse, including on morphisms. To prove the missing coaction law of the section, compare outer and inner ghosts using ψᵐψⁿ=ψᵐⁿ; successive ghost injectivity gives Δs=W(s)s. The counit follows at n=1.

Consequently the relative Adams convention is the arithmetic Λ-ring convention, and the perfection and flatness conditions can be transferred between them. This equivalence does not assert that Adams data determine a Λ-structure on an arbitrary torsion ring.

Prerequisites: [Adams operations of a coalgebra](#hr-1-coalgebra-adams-laws); [Ghost identities and naturality of the section](#hr-1-adams-witt-section-laws); [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

Source: [B](https://arxiv.org/pdf/0801.1691v6), §1.17, pp.12–13; [H](https://arxiv.org/pdf/1006.3125v3), Lemma 1.24, p.19 and Proposition 1.19, p.17.

<a id="hr-1-big-witt-cofree-adjunction"></a>

**The cofree Λ-ring adjunction.** The forgetful functor from Witt coalgebras to rings has right adjoint A↦(W(A),Δ_A). For a coalgebra (B,s_B), a ring map f:B→A lifts to W(f)s_B:B→W(A). The inverse takes a coalgebra map to its composition with ε_A. The counit identities and coassociativity prove these constructions are inverse and natural.

This adjunction is valid without torsion-freeness. Its unit is the coaction and its counit is gh₁; the triangle identities are concrete comonad equations. It supplies the correct universal interpretation of the free construction rather than an adjunction for mere Adams families.

Prerequisites: [Counit and coassociativity](#hr-1-big-witt-comonad-laws); [Arithmetic Λ-rings with torsion](#hr-1-lambda-coalgebra).

Source: [H](https://arxiv.org/pdf/1006.3125v3), §2, p.24 (cofree adjunction); Proposition 1.19.

<a id="hr-1-witt-product-addition"></a>

**Generating series for Witt addition.** For a Witt vector a, use γ(a)=∏_{d≥1}(1−a_dtᵈ)⁻¹ in 1+tA[[t]]. Witt addition corresponds to multiplication of these series. At precision t^{N+1} it is enough to use d≤N, so the identity is finite and specializes to every coefficient ring. A proof uses the logarithmic derivative to compare ghosts over a universal ring and integral specialization to avoid denominators in A.

Equivalently P_N(a+b)≡P_N(a)P_N(b) modulo t^{N+1} for P_N(a)=∏_{d≤N}(1−a_dtᵈ). This coordinate generating series is distinct from the q-factorial P_n(q) of Habiro completion; the variables and meanings must remain explicit.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:MvPolynomial`; `mathlib:IsAddTorsionFree`; `mathlib:PowerSeries`; `mathlib:PowerSeries.coeff`.

Source: [H](https://arxiv.org/pdf/1006.3125v3), Proposition 1.14 and its proof, pp.14–15 (published p.150).

<a id="hr-1-exterior-operations"></a>

**Exterior λ-operations.** For a Witt coalgebra s(a)=(c_n(a)), define the exterior generating series λ_t(a)=γ(s(a))(-t)⁻¹=∏_{n≥1}(1−c_n(a)(−t)ⁿ). Extracting coefficients gives λ⁰=1, λ¹=a, λ²=−c₂ and λ³=c₃−a c₂. Witt addition gives λ_t(a+b)=λ_t(a)λ_t(b); all coefficient identities use finite products at a fixed precision.

The sign convention is exterior rather than symmetric. For ℤ with identity Adams operations, λ³(−1)=−1; identifying λ³ with c₃ would fail this test. The coordinate extraction and functoriality under coalgebra maps form the reusable interface.

Prerequisites: [Arithmetic Λ-rings with torsion](#hr-1-lambda-coalgebra); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:PowerSeries`; `mathlib:PowerSeries.coeff`; [Generating series for Witt addition](#hr-1-witt-product-addition); [The torsion-free coalgebra–Adams equivalence](#hr-1-wilkerson-comparison).

Source: [H](https://arxiv.org/pdf/1006.3125v3), Remark 1.22, p.18, and Proposition 1.14, p.14.

<a id="hr-1-free-lambda-ring"></a>

**Free Λ-rings in Witt coordinates.** For any set I, let L(I)=ℤ[c_{i,n}∣i∈I,n≥1] and x_i=c_{i,1}. Each sequence u_i=(c_{i,n}) is a universal Witt vector. Define the coaction on c_{i,n} by the n-th coordinate of Δ(u_i), and hence the Adams maps through the universal Frobenius polynomials. Polynomial finite support makes this construction valid for infinite I.

It is the free arithmetic Λ-ring, not the toric polynomial ring on the x_i alone. For instance ψ²(x_i)=x_i²+2c_{i,2}. The extra coordinates are required to allow a chosen element of an arbitrary Λ-ring to have its actual exterior operations.

Prerequisites: [Counit and coassociativity](#hr-1-big-witt-comonad-laws); [Arithmetic Λ-rings with torsion](#hr-1-lambda-coalgebra); [The cofree Λ-ring adjunction](#hr-1-big-witt-cofree-adjunction); [Integral Frobenius coordinate polynomials](#hr-1-universal-frobenius-polynomials); `mathlib:MvPolynomial`; `mathlib:MvPolynomial.eval₂Hom`; [Exterior λ-operations](#hr-1-exterior-operations).

Source: [B](https://arxiv.org/pdf/0801.1691v6), §1.18, p.13; [W](https://arxiv.org/pdf/2410.23078v5), §2.4, 2.33, p.27.

<a id="hr-1-free-lambda-universal-property"></a>

**The free Λ-ring adjunction.** For a coalgebra (B,s_B) and a function g:I→B, the unique Λ-map L(I)→B sends c_{i,n} to the n-th coordinate of s_B(g(i)). The coaction law proves it is a Λ-map; preserving coactions forces these values and gives uniqueness. Thus L is left adjoint to the underlying-set functor, for all arithmetic Λ-rings, including those with torsion.

Evaluation at x_i describes the inverse map of the adjunction. Its identity and composition laws follow from uniqueness. The empty set gives ℤ and a singleton recovers the full sequence of operations of one chosen element, rather than a generator with forced toric operations.

Prerequisites: [Free Λ-rings in Witt coordinates](#hr-1-free-lambda-ring); [The torsion-free coalgebra–Adams equivalence](#hr-1-wilkerson-comparison); `mathlib:MvPolynomial.eval₂Hom`; `mathlib:MvPolynomial.eval₂Hom_X'`.

Source: [B](https://arxiv.org/pdf/0801.1691v6), §1.18, p.13.

<a id="hr-1-free-adams-local-presentations"></a>

**Prime-local presentations of free Adams maps.** Fix a prime p and regard L(I) as a module over itself through ψᵖ. Over ℤ_(p) it is free on the finitely supported monomials ∏c_{i,n}^{r_{i,n}} with 0≤r_{i,n}<p. After inverting p, it is a polynomial algebra over the source, with extra coordinates c_{i,j} for p∤j. Both assertions describe the twisted scalar action through ψᵖ, not the identity scalar action.

Prove these presentations using the triangular integral Frobenius polynomials and finite-variable elimination, then take the filtered union over finite sets of coordinates. The first presentation has a basis containing 1; the second has the evident nonzero polynomial fibers. Together they establish faithful flatness prime locally for arbitrary I.

Prerequisites: [Free Λ-rings in Witt coordinates](#hr-1-free-lambda-ring); [Integral Frobenius coordinate polynomials](#hr-1-universal-frobenius-polynomials); `mathlib:MvPolynomial`; `mathlib:Module.Free.of_basis`; `mathlib:Matrix.isUnit_iff_isUnit_det`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.22(e), p.12; [H](https://arxiv.org/pdf/1006.3125v3), Lemmas 1.4 and 1.8, pp.8–11.

<a id="hr-1-free-lambda-perfect-cover"></a>

**Perfectly covered free Λ-rings.** Every ψᵖ on L(I) is faithfully flat: at p use the explicit free basis, and away from p use the polynomial presentation. Flatness and nonempty fibers are local on the base, so the two local descriptions combine. Compositions give faithful flatness of every ψᵐ. The criterion for being perfectly covered then gives a faithfully flat map L(I)→L(I)^perf.

The proof applies to the genuine free arithmetic Λ-ring in all its Witt coordinates. Flatness of the toric map x↦xᵖ is a simpler example but cannot stand in for this argument.

Prerequisites: [Prime-local presentations of free Adams maps](#hr-1-free-adams-local-presentations); [Adams operations of a coalgebra](#hr-1-coalgebra-adams-laws); [Perfectly covered bases](#hr-1-perfectly-covered); [Perfection by Adams transition maps](#hr-1-the-colimit-perfection); `mathlib:Module.FaithfullyFlat`; `mathlib:Module.flat_of_localized_maximal`; `mathlib:RingHom.FaithfullyFlat`; `mathlib:RingHom.FaithfullyFlat.stableUnderComposition`; `mathlib:RingHom.FaithfullyFlat.iff_flat_and_comap_surjective`; `mathlib:Module.flat_iff_of_isLocalization`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.22(e), p.12; [W](https://arxiv.org/pdf/2410.23078v5), Remark 2.47 and footnote (2.3), p.32.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `BigWitt.comul` | The ring homomorphism Δ_A for arbitrary A. |
| `BigWitt.comul_ghost` | Outer gh_n ∘ Δ_A = F_n. |
| `BigWitt.comul_natural` | W(W(f)) ∘ Δ_A = Δ_B ∘ W(f). |
| `BigWitt.comul_counit_left` | gh_1 ∘ Δ_A = id_(W(A)). |
| `BigWitt.comul_counit_right` | W(gh_1) ∘ Δ_A = id_(W(A)). |
| `BigWitt.comul_assoc` | Δ_(W(A)) ∘ Δ_A = W(Δ_A) ∘ Δ_A. |
| `BigWitt.comul_unique` | For torsion-free A, any ring map g:W(A)→W(W(A)) with gh_n∘g=F_n for every n equals Δ_A. No pointwise uniqueness by ghosts is asserted for arbitrary A. |
| `BigWitt.comul_teichmuller` | Δ_A([a])=[[a]] for any commutative A. |
| `LambdaCoalgebra.adams` | ψ^n=gh_n∘s as a ring endomorphism. |
| `LambdaCoalgebra.ext` | Two coalgebras on A with equal structure maps are equal. |
| `LambdaCoalgebra.Hom.id` | Identity is a coalgebra morphism. |
| `LambdaCoalgebra.Hom.comp` | Composition of coalgebra morphisms is a coalgebra morphism. |
| `LambdaCoalgebra.Hom.adams` | A coalgebra morphism commutes with every Adams operation. |
| `LambdaCoalgebra.coaction` | The ring map s:A→W(A), with the literal counit and coassociativity equalities as structure fields. |
| `LambdaCoalgebra.coord` | coord s n a is the nth Witt coordinate of s(a); it is not generally a ring homomorphism. |
| `LambdaCoalgebra.ext_coords` | Equality of coord s n a and coord t n a for every a and every positive n gives s=t, without a torsion-free hypothesis. |
| `LambdaCoalgebra.Hom.ext` | Two coalgebra morphisms with equal underlying ring homomorphisms are equal. |
| `LambdaCoalgebra.Hom.comp_toRingHom` | The underlying ring map of g.comp f is g.toRingHom.comp f.toRingHom; identity has underlying RingHom.id. |
| `Adams.toWitt` | The integral ring homomorphism s_ψ. |
| `Adams.toWitt_ghost` | gh_n∘s_ψ=ψ^n. |
| `Adams.toWitt_coord_one` | c_1(a)=a. |
| `Adams.toWitt_unique` | Any ring map with all these ghosts equals s_ψ. |
| `Adams.toWitt_natural` | For an Adams morphism f into torsion-free B, W(f)s_A=s_Bf. |
| `Adams.toWitt_coord_recursion` | n c_n(a)=ψ^n(a)−Σ_(d\|n,d<n)d c_d(a)^(n/d), so coordinates are integral and unique on torsion-free A. |
| `LambdaCoalgebra.exterior` | The operation λⁿ at every natural index. |
| `LambdaCoalgebra.exterior_zero` | λ⁰(a)=1. |
| `LambdaCoalgebra.exterior_one` | λ¹(a)=a. |
| `LambdaCoalgebra.exterior_add` | λⁿ(a+b)=Σ_(i=0)^n λⁱ(a)λ^(n−i)(b). |
| `LambdaCoalgebra.exterior_natural` | A coalgebra morphism preserves all λⁿ. |
| `LambdaCoalgebra.exterior_two` | λ²(a)=−s(a)_2 for every commutative A, fixing the exterior/Witt sign convention. |
| `LambdaCoalgebra.exterior_three` | λ³(a)=s(a)_3−s(a)_1s(a)_2. |
| `LambdaCoalgebra.exterior_zero_element` | λⁿ(0)=0 whenever n>0. |
| `FreeLambdaRing.coord` | c_(i,n) is the polynomial variable X(i,n). |
| `FreeLambdaRing.gen` | x_i=c_(i,1). |
| `FreeLambdaRing.coaction` | The map s_L on polynomial generators above satisfies both coalgebra axioms. |
| `FreeLambdaRing.adams_coord` | ψ^m(c_(i,n))=f_(m,n) in the ith block. |
| `FreeLambdaRing.reindex` | A map I→J induces the coalgebra map c_(i,n)↦c_(r(i),n), respecting identity and composition. |
| `FreeLambdaRing.coaction_gen` | s_L(x_i)=u_i, so s_L(x_i)_n=c_(i,n); these coordinates detect a free Λ-morphism from its values on x_i. |
| `FreeLambdaRing.lift` | For an arbitrary-ring coalgebra (A,s) and g:I→A, the coalgebra morphism sending c_(i,n) to s(g(i))_n. |
| `FreeLambdaRing.lift_gen` | lift s g sends x_i to g(i). |
| `FreeLambdaRing.lift_unique` | A coalgebra morphism with the prescribed values g(i) on every x_i equals lift s g, even when A has torsion. |
| `FreeLambdaRing.universalProperty` | The natural equivalence (I→A) ≃ Hom_Λ(L(I),A), given by lift and restriction to x_i; proved in free-lambda-universal-property. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `BigWitt.comul_teichmuller_test`: Δ_A([a])=[[a]] for every a.
- `BigWitt.comul_zero_test`: Δ_A(0)=0, even for A=ℤ/4ℤ.
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

## HR.2 — Derived Habiro completion

The ordinary relative ring is constructed through complete derived algebra objects. The localization resolution makes the completion and the homotopy detection arguments explicit.

<a id="hr-2-habiro-complete-modules"></a>

**Complete objects and completion.** In D(ℤ[q^{±1}]), call M Habiro-complete when RHom(R_r,M)=0. Its completion is
\[
 L_HM\simeq\lim_{m\mid n}M^\wedge_{(q^m-1)}
       \simeq\lim_n M/P_n.
\]
The first limit has arrows from a larger divisible index to a smaller one. Both descriptions use derived completion and derived quotients. In particular completion kills R_r and the unit ℤ[q^{±1}] completes to the integral Habiro ring. Multiplication by q becomes invertible in the polynomial completion because q has invertible constant term relative to every cyclotomic quotient; polynomial and Laurent formulations therefore agree.

Build the comparison of the two limits using the cofinal divisibility between cyclotomic powers and q-factorials supplied by HC.1. This is a derived completion functor, not the operation of imposing that all qᵐ−1 are invertible.

Prerequisites: `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E1`; `mathlib:IsLocalization`; `mathlib:LaurentPolynomial`; `mathlib:Polynomial.cyclotomic`; `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, B.1, p.77; §3, Theorem 3.11(a), p.25.

<a id="hr-2-the-two-term-resolution"></a>

**A free resolution of the rational localization.** There is a length-one free resolution of R_r over B=ℤ[q^{±1}] with differential on the direct-sum generators
\[
d((a_i))_i=a_i-(1-q^i)a_{i-1},\qquad a_{-1}=0,
\]
and augmentation (a_i)↦Σ_i a_i/P_i. On basis elements this is d(e_i)=e_i−(1−q^{i+1})e_{i+1}, so the augmentation of d(e_i) vanishes. Injectivity follows by looking at the smallest nonzero coefficient of a finite-support element. The cokernel is the localization because inverting all P_i is equivalent to inverting all 1−qⁱ.

Applying Hom turns the resolution into a map of products. It computes RHom(R_r,−), showing that its Ext groups on static modules occur only in degrees 0 and 1. The augmentation uses inverse q-factorials; using P_i itself would not satisfy the relation.

Prerequisites: [Complete objects and completion](#hr-2-habiro-complete-modules); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, proof of Lemma B.2, pp.77–78; telescope differential as specified above.

<a id="hr-2-completeness-via-the-factorial-tower"></a>

**The completion adjunction.** For every derived B-module M, the natural map M→lim_n M/P_n exhibits Habiro completion: its target is complete and its fiber is an R_r-module. Equivalently it is left adjoint to the full inclusion of complete modules. The resolution identifies the local and complete parts, and the divisibility of q-factorials identifies the localization telescope.

The functor is idempotent, is the identity on complete objects, and sends R_r-modules to zero. Its kernel is the full subcategory of R_r-modules. These statements give the universal factorization of maps to a complete target, not only a formula for its homotopy groups. No exchange of arbitrary inverse limits with tensor products is used.

Prerequisites: [Complete objects and completion](#hr-2-habiro-complete-modules); [A free resolution of the rational localization](#hr-2-the-two-term-resolution); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E3`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, B.1 and Lemma B.2(c), p.77.

<a id="hr-2-completeness-on-homotopy-groups"></a>

**Completeness of homotopy modules.** M is Habiro-complete if and only if every π_n(M) is complete as an ordinary B-module, in the sense Hom_B(R_r,π_n M)=Ext¹_B(R_r,π_n M)=0. The two-term resolution gives
\[
0\to\operatorname{Ext}^1_B(R_r,\pi_{n+1}M)
\to\pi_n\operatorname{RHom}_B(R_r,M)
\to\operatorname{Hom}_B(R_r,\pi_nM)\to0.
\]
Use the homological dimension bound and convergent Postnikov truncations to obtain the equivalence even for unbounded M. A proof must retain both Hom and Ext¹; vanishing of just Hom is insufficient. The enhanced t-structure and its convergence are imported, rather than inferred from an ordinary triangulated-category API.

Prerequisites: [Complete objects and completion](#hr-2-habiro-complete-modules); [A free resolution of the rational localization](#hr-2-the-two-term-resolution); `EnhancedDerivedSheaves:E1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, Lemma B.2(d) and proof, pp.77–78.

<a id="hr-2-the-derived-nakayama-lemma"></a>

**Cyclotomic Nakayama.** On Habiro-complete objects the reductions M/Φ_m(q), m≥1, are jointly conservative. If all vanish, successive cyclotomic filtrations show M/P_n=0 for every n, and the completion formula gives M=0. The same argument applied to the fiber of a map proves joint conservativity for maps.

For a static complete module, vanishing of all ordinary quotients is already enough to prove the module is zero: apply the finite factor filtration and ordinary Nakayama argument before passing to the completion. Without completeness, R_r has zero cyclotomic reductions and is nonzero. This counterexample is part of the theorem's usable boundary.

Prerequisites: [The completion adjunction](#hr-2-completeness-via-the-factorial-tower); [Complete objects and completion](#hr-2-habiro-complete-modules); `DerivedDeRhamCohomology:DD.1`; `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, Lemma B.3, p.78; Remark B.5, p.79.

<a id="hr-2-the-detection-results"></a>

**Detecting homotopy bounds and staticity.** For complete M, cyclotomic reductions detect vanishing of individual homotopy modules and the corresponding upper or lower degree bounds. In particular, if every derived M/Φ_m is static, then M is static. Use completeness on homotopy groups and the Nakayama result to kill homotopy groups outside the prescribed range.

The staticity implication goes in this direction only. A static module with Φ_m-torsion can have a nonstatic derived quotient: ℤ with q acting as 1 has a derived quotient by q−1 containing Σℤ. The argument for the inverse limit of finite relative rings in HR.4 verifies the stronger hypothesis of static *derived* reductions, rather than using the converse.

Prerequisites: [Cyclotomic Nakayama](#hr-2-the-derived-nakayama-lemma); [Completeness of homotopy modules](#hr-2-completeness-on-homotopy-groups); [Complete objects and completion](#hr-2-habiro-complete-modules).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, Corollary B.4, p.78; §2.2, proof of Theorem 2.9, p.17.

<a id="hr-2-the-monoidal-structure"></a>

**The completed tensor product.** The R_r-local objects form a tensor ideal. Thus the localization carries a symmetric monoidal structure with M⊗_HN=L_H(M⊗_B^L N) and unit L_HB. Its associator, unitors and symmetry come from symmetric monoidal localization, and the tensor product is characterized by the completion universal property.

The ordinary derived tensor of two complete objects need not be complete, and derived torsion must remain visible even at finite cyclotomic stages. A useful calculation is that suitable quotients at q²−1 and q³−1 have tensor product ℤ⊕Σℤ at their common root, rather than just ℤ. This prevents an underived quotient convention from concealing the monoidal issue.

Prerequisites: [Complete objects and completion](#hr-2-habiro-complete-modules); [The completion adjunction](#hr-2-completeness-via-the-factorial-tower); `EnhancedDerivedSheaves:E5:abstract`; `EnhancedDerivedSheaves:E1`; `StableHomotopyKTheory:H.6`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, B.1, p.77; §2.1, Setup 2.1(c), p.13; [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf), §2.2.1, Proposition 2.2.1.9, p.197.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `habiroLocalisation` | Rr, with IsLocalization for the submonoid of LaurentPolynomial ℤ generated by the q^m − 1. |
| `habiroLocalisation_eq_cyclotomic` | Rr is also the localisation at all Φ_d(q), d ≥ 1. |
| `IsHabiroComplete` | RHom_{ℤ[q^{±1}]}(Rr, M) ≃ 0. |
| `habiroCompletion` | M^∧_H = lim_{m ≥ 1} M^∧_{(q^m−1)} over the divisibility poset. |
| `habiroCompletion.unit` | The canonical map M → M^∧_H. |
| `IsHabiroComplete.of_adicComplete` | A derived (q^m − 1)-complete object is Habiro-complete. |
| `isHabiroComplete_habiroCompletion` | M^∧_H is Habiro-complete. |
| `IsHabiroComplete.limit` | Habiro-complete objects are closed under limits, fibres and shifts. |
| `isHabiroComplete_iff_restrictScalars` | Completeness over A[q^{±1}] is completeness of the underlying ℤ[q^{±1}]-module. |
| `habiroCompletion_polynomial_eq_laurent` | A[q]^∧_H ≃ A[q^{±1}]^∧_H; in particular q is a unit in A[q]^∧_H. |
| `habiroTensor` | M ⊗̂^L_H N = (M ⊗^L N)^∧_H on D̂_H(A[q^{±1}]). |
| `habiroTensor_unit` | The unit is A[q^{±1}]^∧_H; for A = ℤ it is the classical Habiro ring. |
| `habiroComplete.symmetricMonoidal` | The symmetric monoidal ∞-category structure on D̂_H. |
| `habiroCompletion_monoidal` | Completion D(A[q^{±1}]) → D̂_H is symmetric monoidal. |
| `habiroCompletion_tensor` | (M ⊗^L N)^∧_H ≃ M^∧_H ⊗̂ N^∧_H. |
| `habiroCompletion_eq_zero_iff` | M^∧_H ≃ 0 iff M is an Rr-module. |
| `habiroTensor_baseChange` | Base change along A → A' is symmetric monoidal for ⊗̂. |
| `habiroComplete_spectral_comparison` | On Hℤ[q^{±1}]-modules, restriction to spherical coefficients commutes with completion. The derived tensor comparison is Hℤ[q^{±1}]-relative, followed by completion; restriction to ℛ itself is lax monoidal. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `habiroCompletion_localisation_eq_zero`: Rr^∧_H ≃ 0, since q^m − 1 is a unit on Rr and so Rr/(q^m − 1) ≃ 0 for every m; and Rr is not Habiro-complete (RHom(Rr, Rr) contains the identity). A definition that confused completion with inverting the q^m − 1 would return Rr.
- `isHabiroComplete_powerSeries`: ℤ[[q − 1]] = ℤ[q]^∧_{(q−1)} is Habiro-complete: it is derived (q − 1)-complete and q − 1 acts invertibly on Rr.
- `habiroCompletion_ne_powerSeries`: ℤ[q^{±1}]^∧_H is not ℤ[[q − 1]]: modulo Φ_2(q) = q + 1, ℤ[[q − 1]]/(q + 1) ≅ ℤ[[t]]/(t + 2) ≅ ℤ_2 (t = q − 1), whereas ℤ[q^{±1}]^∧_H/(q + 1) ≅ ℤ (by the factorial-tower description: on π_0 the tower is constantly ℤ[q]/(q + 1) = ℤ, and on π_1 its transition maps are multiplication by 1 − (−1)^{n+1} ∈ {0, 2}, so its limit and lim^1 vanish).
- `habiroCompletion_q_inverse`: q·(1 + q − q^2) − 1 = −(q;q)_2 = −(1 − q)(1 − q^2), so q is invertible in ℤ[q]/((q;q)_2), a stage of the completion, with inverse 1 + q − q^2.
- `not_isHabiroComplete_laurent`: ℤ[q^{±1}] is not Habiro-complete: the element Σ_{n ≥ 0} (q;q)_n of lim_N ℤ[q]/(q;q)_N is not the image of a Laurent polynomial f, since otherwise q^s f − q^s Σ_{k<N}(q;q)_k, of degree below N(N+1)/2 = deg (q;q)_N for N large, would be divisible by (q;q)_N and hence zero for all large N, forcing (q;q)_N = 0.
- `habiroTensor_unit_int`: For A = ℤ the unit is lim_N ℤ[q]/((q;q)_N), in which q is a unit (q·(1 + q − q^2) ≡ 1 mod (q;q)_2 at the second stage); it is not ℤ[q^{±1}] (not_isHabiroComplete_laurent).
- `habiroTensor_torsion`: ℤ[q]/(q^2 − 1) ⊗̂^L_H ℤ[q]/(q^3 − 1) ≃ ℤ ⊕ Σℤ: π_0 = ℤ[q]/(q^2 − 1, q^3 − 1) = ℤ[q]/(q − 1) and π_1 = ker(q − 1 on ℤ[q]/(q^2 − 1)) = ℤ·(1 + q); both are killed by q^2 − 1, so no completion correction occurs, but the derived Tor_1 must be kept. An underived definition would lose π_1.
- `ordinary_tensor_not_complete`: H ⊗^L_{ℤ[q^{±1}]} H is not Habiro-complete for the Habiro ring H: its completion is H (both sides are ℤ[q]/((q;q)_n) modulo (q;q)_n), but the multiplication H ⊗ H → H on π_0 is not injective, since x ⊗ 1 − 1 ⊗ x ≠ 0 for any x ∈ H outside ℚ(q) (H is an uncountable domain, HabiroCyclotomicCompletions HC.4).
- `habiroCompletion_ne_smashing`: Rr ⊗ ℤ[[q − 1]] ≠ 0 (it contains ℤ((q − 1)), where q − 1 is inverted) although ℤ[[q − 1]] is complete, while (Rr ⊗ ℤ[[q − 1]])^∧_H ≃ 0: the smashing localisation Rr ⊗ − and Habiro completion are complementary.
- `habiroTensor_unit_law`: For complete M, A[q^{±1}]^∧_H ⊗̂ M ≃ M, and 0 ⊗̂ M ≃ 0.

## Spherical coefficients and the solid comparison

The spherical completion extends the preceding algebraic construction. The statements about solid tensor products additionally assume the following light solid spectral contract; all boundedness restrictions are part of those statements.

Work with hypersheaves of spectra on light profinite sets. The discrete functor is fully faithful symmetric monoidal and left adjoint to evaluation at the point. For Null=cofib(𝕊[{∞}]→𝕊[ℕ∪{∞}]) and its shift σ, solidity means that 1−σ* is invertible on the internal Hom from Null. Discrete spectra are solid; solid objects are closed under limits and colimits and admit accessible symmetric monoidal solidification. Null^■≃∏_ℕ𝕊 is a compact generator, and the product tensor calculation (∏_ℕ𝕊)⊗^■(∏_ℕ𝕊)≃∏_{ℕ²}𝕊 is functorial.

The contract further includes tensor compatibility with split finite free towers and derived relative base change, countable limits commuting with ω₁-filtered colimits, the spectral null-family calculation including all homotopy, and a compatible t-structure with uniformly bounded-below simplicial resolutions and their realization comparison. None of these says that tensor commutes with every inverse limit. A countable product of condensed complete units is also not identified with the condensed completion of an ordinary spectral product without its own comparison. The cited written sources motivate these hypotheses; they do not establish the full spectral contract.

<a id="hr-2-spherical-rational-localization"></a>

**Spherical cyclotomic localization.** Let ℛ=𝕊[ℤ]. Form ℛ_r by the telescope that inverts each 1−qⁱ, equivalently the E∞ localization at all cyclotomic factors. It is an idempotent ℛ-algebra and has π₀=R_r. Its fiber over ℛ is Σ⁻¹colim_n ℛ/P_n, with the quotient maps induced by factorial divisibility. This is a statement in ℛ-modules, retaining all spherical homotopy.

In particular ℛ_r is not replaced by the Eilenberg–Mac Lane spectrum of R_r. The two-term algebraic resolution is an explanation of its π₀-level calculation, not a definition that discards the higher homotopy of the sphere.

Prerequisites: `StableHomotopyKTheory:H.5:spectra`; `StableHomotopyKTheory:H.5:S-delooping`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; `EnhancedDerivedSheaves:E5:abstract/module-objects`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E5:abstract`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B.1 and proof of B.2, printed/PDF p.77.

<a id="hr-2-spectral-habiro-completion"></a>

**Spectral completion and its unit.** For an ℛ-module M, define L_HM=RHom_ℛ(fib(ℛ→ℛ_r),M). The fiber triangle gives the localization–completion adjunction, the equivalent formula lim_n M/P_n, and idempotence. Set S_H=L_Hℛ. Complete modules carry the localized symmetric monoidal product, and their unit is S_H.

The comparison with derived modules over an Eilenberg–Mac Lane ring is symmetric monoidal when tensors are relative to that ring. Restricting such modules along ℛ→Hℤ[q^{±1}] gives a lax monoidal functor, not a strong monoidal identification of all spherical modules with complexes. The statement uses actual spectra, module categories, internal Hom and coherent monoidal localization from the named suppliers.

Prerequisites: [Spherical cyclotomic localization](#hr-2-spherical-rational-localization); `StableHomotopyKTheory:H.6`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`; `DerivedDeRhamCohomology:DD.1`; [A free resolution of the rational localization](#hr-2-the-two-term-resolution); [The completion adjunction](#hr-2-completeness-via-the-factorial-tower); [Completeness of homotopy modules](#hr-2-completeness-on-homotopy-groups); [Cyclotomic Nakayama](#hr-2-the-derived-nakayama-lemma); [Detecting homotopy bounds and staticity](#hr-2-the-detection-results); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `EnhancedDerivedSheaves:E5:abstract`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), B.1–B.5, printed/PDF pp.77–79; [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 2.2.1.9, printed p.197; [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf), Theorem 7.1.2.13, printed p.1212.

<a id="hr-2-habiro-complete-solid-spectra"></a>

**Complete solid modules and the discrete embedding.** In light solid condensed spectra, define completeness by the same localization orthogonality and form completion with the quotient tower. The functor from complete ordinary spectra is M↦L_H(discrete M); evaluation at the point is its right adjoint and recovers M. Hence this completed discrete functor is fully faithful. Ordinary discreteness alone need not preserve an inverse-limit completion.

This construction assumes a stable presentable category of light solid hypersheaves, spectral module objects, solid tensor, internal Hom, evaluation at the point, and the relevant limit and localization compatibilities. Mathlib's light condensed modules do not supply those assumptions. Coproducts here are condensed coproducts followed by completion, not arbitrary algebraic direct sums declared complete.

Prerequisites: [Complete objects and completion](#hr-2-habiro-complete-modules); [The completion adjunction](#hr-2-completeness-via-the-factorial-tower); `VStackSheavesAndLisseCategories:VS2`; `StableHomotopyKTheory:H.6`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, B.6–B.7, p.79.

<a id="hr-2-solid-habiro-unit-idempotence"></a>

**Solid idempotence of the unit.** Under the solid product/tower and balanced-tensor comparison inputs, the multiplication S_H⊗^■_ℛ S_H→S_H is an equivalence. Reduce to finite quotients: S_H/P_n is a finite direct sum of d_n=n(n+1)/2 spheres. Indeed (−1)^nP_n is monic of degree d_n and its constant coefficient is a unit, so polynomial and Laurent quotients have the same finite basis. The argument concerns the whole spectral module, not only its π₀.

The polynomial representatives split the quotient tower as 𝕊-modules; these splittings are not asserted to be ℛ-linear. Apply the supplied solid product formula to the double tower in independent q₁,q₂, and then use derived relative base change identifying q₁=q₂ to obtain the ℛ-balanced tensor statement. The light solid compact generator is Null_R=R⊗^■∏_ℕ𝕊. Its existence motivates the comparison but does not by itself prove that tensor commutes with the required towers; that compatibility is a separate hypothesis.

Prerequisites: [Spectral completion and its unit](#hr-2-spectral-habiro-completion); [Complete solid modules and the discrete embedding](#hr-2-habiro-complete-solid-spectra); `EnhancedDerivedSheaves:E5:abstract/module-objects`; `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; `EnhancedDerivedSheaves:E5:abstract`; `HabiroCyclotomicCompletions:HC.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of B.8, printed/PDF pp.79–80, first two paragraphs; [T](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf), §5.3, printed p.86 (PDF p.90), paragraph defining Null_R.

<a id="hr-2-completed-countable-free-solid-modules"></a>

**Completed sums of countable products.** For countable sets I_n, allowing empty and finite sets, set F_I=⊕_n∏_{i∈I_n}S_H and C_I=L_HF_I. Put J_r=fib(S_H→S_H/P_r), with its specified map to S_H, and J₀=S_H. For proper functions f:ℕ→ℕ, meaning f(n)→∞, there is a natural equivalence
\[
 C_I\simeq\mathop{\rm colim}_{f}\prod_n\prod_{i\in I_n}J_{f(n)}.
\]
The order on profiles is reverse pointwise order; an arrow f→g has f(n)≥g(n), and its maps are the corresponding ideal inclusions. The J_r are fiber objects and multiplication maps, not subsets of a spectrum.

The equivalence describes factorial decay in the block index and is natural for the specified finite-support block maps. The family constantly equal to 1 is not decaying; a family weighted by P_n is. The countable product and completion contracts are hypotheses of this spectral assertion. Bosco's abelian null-family formula supplies its model, not a proof for arbitrary light solid spectra.

Prerequisites: [Solid idempotence of the unit](#hr-2-solid-habiro-unit-idempotence); [Complete solid modules and the discrete embedding](#hr-2-habiro-complete-solid-spectra); `HabiroCyclotomicCompletions:HC.1/topology-completeness-and-universal-property`; `EnhancedDerivedSheaves:E5:abstract`; [Spectral completion and its unit](#hr-2-spectral-habiro-completion).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of B.8, printed/PDF p.80, completed sum formula; [Bosco](https://arxiv.org/pdf/2306.06100v1), Lemma A.4 and its proof, printed/PDF p.93.

<a id="hr-2-countable-solid-habiro-tensor"></a>

**Tensor products of completed countable sums.** Under the same solid contracts, the solid tensor of C_I and C_J agrees with the Habiro completion of the double-index family tensor. Factorial weights in the two indices can be compared with a proper radial weight: P_aP_b divides P_{a+b}, and proper f(n)+g(m) is dominated by a suitable proper h(n,m). Conversely, a proper h admits separable proper lower profiles after taking successive finite minima. Both directions are needed to identify the profile colimits.

The passage through countable products and these colimits uses the supplier's exactness and the commutation of ω₁-filtered colimits with countable limits. An abelian p-adic completed tensor comparison has analogous weights, but cannot replace the spectral proof. The polynomial divisibility comes from the existing q-binomial/factorial library.

Prerequisites: [Completed sums of countable products](#hr-2-completed-countable-free-solid-modules); `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`; `EnhancedDerivedSheaves:E5:abstract`; [Solid idempotence of the unit](#hr-2-solid-habiro-unit-idempotence); [Spectral completion and its unit](#hr-2-spectral-habiro-completion); [Complete solid modules and the discrete embedding](#hr-2-habiro-complete-solid-spectra).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of B.8, printed/PDF p.80, final three paragraphs; [Bosco](https://arxiv.org/pdf/2306.06100v1), Proposition A.3, printed/PDF pp.92–93.

<a id="hr-2-the-solid-comparison-is-bounded-below"></a>

**Bounded-below solid tensor closure.** Assume the preceding unit, profile tensor and resolution contracts. If M and N are bounded-below Habiro-complete solid S_H-modules, their solid tensor is again Habiro-complete and agrees with the completed tensor comparison. Resolve them by the countable-product free modules with a uniform lower homotopy bound; realization and the tensor comparisons then preserve completeness.

The ordinary completed-discrete embedding is consequently symmetric monoidal on bounded-below complete objects. The proof uses the uniform bound and the supplied exactness of these realizations. It does not assert the same closure for every unbounded pair. The boundedness convention is homotopy bounded below, equivalently cohomology bounded above in the abelian comparison.

Prerequisites: [Complete solid modules and the discrete embedding](#hr-2-habiro-complete-solid-spectra); [The completed tensor product](#hr-2-the-monoidal-structure); `VStackSheavesAndLisseCategories:VS2`; `StableHomotopyKTheory:H.6`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, Lemma B.8 and proof, pp.79–80.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `SphericalCyclotomicLocalization` | The commutative R-algebra T with its unit R→T. |
| `SphericalCyclotomicLocalization.map` | For a commutative R-algebra B in which every q^m−1, m≥1, is invertible, the space of R-algebra maps T→B is contractible; otherwise it is empty. |
| `SphericalCyclotomicLocalization.invert` | Multiplication by q^m−1 on T is an equivalence for every m≥1. |
| `SphericalCyclotomicLocalization.idempotent` | The multiplication T⊗_R T→T is an equivalence of commutative R-algebras. |
| `SphericalCyclotomicLocalization.fibre` | fib(R→T) ≃ Σ^{-1}colim_{n≥1}R/P_n with transition multiplication by 1−q^{n+1}. |
| `SphericalCyclotomicLocalization.pi` | π_kT ≅ π_kR[{(q^m−1)^{-1}}_{m≥1}], naturally as Z[q±1]-modules. |
| `SpectralHabiroCompletion` | M↦L_HM with a natural unit η_M:M→L_HM and SH=L_HR. |
| `SpectralHabiroCompletion.factorial` | L_HM ≃ lim_{n≥1}M/P_n, with transition induced by P_n \| P_{n+1}. |
| `SpectralHabiroCompletion.adjunction` | For complete N, Map_R(L_HM,N)→Map_R(M,N) is an equivalence. |
| `SpectralHabiroCompletion.idempotent` | η_{L_HM} and L_H(η_M) are equivalences, agreeing under the reflection coherence. |
| `SpectralHabiroCompletion.tensor` | The tensor on C_H is L_H(M⊗_RN); its unit is SH, with associativity, unit and symmetry inherited via monoidal localization. |
| `SpectralHabiroCompletion.homotopy_exact` | 0→Ext¹_{Z[q±1]}(Rr,π_{k+1}M)→π_kRHom_R(T,M)→Hom_{Z[q±1]}(Rr,π_kM)→0, naturally in M and k∈Z. |
| `SpectralHabiroCompletion.complete_iff_pi` | M is complete iff each π_kM is complete in the algebraic Hom/Ext¹ criterion. |
| `SpectralHabiroCompletion.nakayama` | If M is complete and M/Φ_m=0 for every positive m, then M=0. |
| `SpectralHabiroCompletion.detect_degree` | For complete M and k∈Z, π_k(M/Φ_m)=0 for all positive m implies π_kM=0. |
| `SpectralHabiroCompletion.restrict_HZ` | Under Mod_{HZ[q±1]}≃D(Z[q±1]), restriction along R→HZ[q±1] commutes with L_H. The tensor comparison uses the HZ[q±1]-relative tensor followed by completion; restriction to R-modules is only lax monoidal. |
| `SpectralHabiroCompletion.map` | For an R-linear map u:M→N, L_H(u):L_HM→L_HN is the induced map between the reflections. |
| `SpectralHabiroCompletion.map_id` | L_H(id_M)=id_{L_HM}, with the canonical functor coherence. |
| `SpectralHabiroCompletion.map_comp` | L_H(v∘u)=L_H(v)∘L_H(u), coherently for composable R-linear maps. |
| `SpectralHabiroCompletion.unit_naturality` | L_H(u)∘η_M=η_N∘u for every R-linear u:M→N. |
| `IsHabiroCompleteSolid` | Habiro-completeness in Mod_{S[q^{±1}]}(Sp■). |
| `habiroCompletionSolid` | Condensed Habiro completion lim_n (−)/(q;q)_n in Mod_{S[q^{±1}]}(Sp■). |
| `toSolid` | The functor M ↦ (M̲)^∧_H. |
| `toSolid_fullyFaithful` | toSolid is fully faithful. |
| `toSolid_eval_point` | toSolid(M)(∗) ≃ M for Habiro-complete M. |
| `CountableSolidHabiroFree` | For a countable block family I, construct C_I=L_H(⊕_n∏_{i∈I_n}SH). |
| `CountableSolidHabiroFree.ideal` | J_r is fib(SH→SH/P_r), with transition J_s→J_r for r≤s induced by P_r \| P_s. |
| `CountableSolidHabiroFree.null_family` | C_I ≃ colim_{f→∞}∏_{n,i∈I_n}J_{f(n)}, natural in finite-support block maps. |
| `CountableSolidHabiroFree.inclusion` | The nth block map ∏_{i∈I_n}SH→C_I is the completed coproduct injection. |
| `CountableSolidHabiroFree.ext` | For complete Q, restriction to the block inclusions gives Map(C_I,Q)≃∏_n Map(∏_{i∈I_n}SH,Q). |
| `CountableSolidHabiroFree.complete` | RHom_R(T,C_I)=0, and C_I→lim_r C_I/P_r is an equivalence. |
| `CountableSolidHabiroFree.transition` | If f≥g pointwise, the profile transition is ∏J_{f(n)}→∏J_{g(n)}; min(f,g) gives a common target. |
| `CountableSolidHabiroFree.map` | For an SH-linear finite-support block map u:F_I→F_J, define C(u)=L_H(u):C_I→C_J. A finite-support block map means each input block map factors through a finite subcoproduct of output blocks. |
| `CountableSolidHabiroFree.map_id` | C(id_{F_I})=id_{C_I}. |
| `CountableSolidHabiroFree.map_comp` | C(v∘u)=C(v)∘C(u) for composable finite-support block maps, with the reflection coherence. |
| `CountableSolidHabiroFree.inclusion_naturality` | For such u, C(u)∘η_{F_I}∘ι_n=η_{F_J}∘u∘ι_n, where ι_n includes the nth input block. |
| `CountableSolidHabiroTensor.comparison` | C_I⊗■_SHC_J ≃ L_H(F_I⊗■_SHF_J), naturally in countable block families. |
| `CountableSolidHabiroTensor.factorial_mul_dvd` | For a,b∈N, P_aP_b divides P_{a+b} in Z[q], obtained from QM.0’s Gaussian polynomial. |
| `CountableSolidHabiroTensor.separable_weights` | If for each k there exists B such that m+n≥B implies h(m,n)≥k, there are f,g:N→N tending to infinity with f(m)+g(n)≤h(m,n) for every m,n. |
| `CountableSolidHabiroTensor.radial_max` | If f,g tend to infinity, max(f(m),g(n)) tends to infinity as m+n→∞. |
| `CountableSolidHabiroTensor.bounded_below` | With the stated light solid spectral resolution contract, e(M)⊗^■_{S_H}e(N)≃e(L_H(M⊗_ℛN)) for bounded-below complete M,N. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `SphericalCyclotomicLocalization.pi_zero`: π_0T ≅ Rr as Z[q±1]-algebras.
- `SphericalCyclotomicLocalization.first_transition`: The first transition R/P_1→R/P_2 is induced by 1−q², so P_2=P_1(1−q²).
- `SphericalCyclotomicLocalization.cyclotomic_tensor_zero`: T⊗_R(R/(q^m−1)) ≃ 0 for every positive m.
- `SpectralHabiroCompletion.zero`: L_H0≃0.
- `SpectralHabiroCompletion.local_zero`: L_HT≃0 although π_0T=Rr≠0; localization and completion are different functors.
- `SpectralHabiroCompletion.cyclotomic_fixed`: η_{R/(q−1)} is an equivalence; its homotopy groups are complete because 1−q acts by zero.
- `SpectralHabiroCompletion.integral_unit`: L_H(HZ[q±1]) ≃ H(H), where H is HC.1’s classical integral Habiro ring. Surjective transition maps and finite-free polynomial quotients eliminate higher derived limits in this case.
- `toSolid_unit`: toSolid(S_H) = S_H ≃ lim_n S[q^{±1}]/(q;q)_n, each stage a finite direct sum of copies of S (rank n(n+1)/2, the degree of (q;q)_n).
- `toSolid_torsion`: For M killed by a power of some q^m − 1 (for example ℤ[q]/(q − 1) = ℤ), toSolid(M) is the discrete condensed spectrum M̲: no completion occurs.
- `toSolid_sum_ne_discrete`: The discrete condensed spectrum of ⊕_{n ∈ ℕ} S_H is not Habiro-complete in Sp■; toSolid applied to (⊕_n S_H)^∧_H is its condensed completion colim_{f → ∞} ∏_n (q;q)_{f(n)} S_H, not the discrete sum.
- `CountableSolidHabiroFree.empty`: If every I_n is empty then C_I=0.
- `CountableSolidHabiroFree.one_block`: If I_0 is a singleton and every other I_n is empty then C_I≃SH.
- `CountableSolidHabiroFree.constant_not_null`: For singleton blocks, the constant family (1,1,…) in ∏_NSH is not in the image of C_I→∏_NSH: modulo P_1=1−q (the same ideal as q−1) it is nonzero in infinitely many coordinates.
- `CountableSolidHabiroFree.decaying_family`: For singleton blocks the maps P_n:SH→SH in the nth coordinate assemble to a map SH→C_I, since n↦n is a proper weight.

## HR.3 — Finite cyclotomic descent

At a fixed positive m the intersections of cyclotomic supports are organized by prime-power chains. This reduces the reconstruction to finite coherent data without losing morphisms.

<a id="hr-3-the-divisor-poset-and-its-intersections"></a>

**Cyclotomic intersections.** Let T=Div(m), Q be the poset of nonempty subsets of T, and I_S=(Φ_d(q)∣d∈S). If S is not contained in a single prime-power chain, I_S is the unit ideal. If |S|≥2 lies in a p-power chain with p-free part d, its radical is (p,Φ_d(q)); different p-free parts become disjoint after p-completion. These statements follow from the cyclotomic resultant/intersection calculation of W, Lemma 2.1.

Singletons retain their Φ_d-adic supports. The distinction between ideals and their radicals is needed: completion categories depend only on the radical, whereas quotient rings need not. For m=4, {1,4} has a nontrivial intersection although it is not a vertex of the reduced index; it is recovered through the maximal chain {1,2,4}.

Prerequisites: `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`; `HabiroCyclotomicCompletions:HC.4/cyclotomic-congruence-and-prime-ideal`; `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; `mathlib:Polynomial.cyclotomic`; `mathlib:Nat.divisors`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.1, Lemma 2.1, p.8; [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, proof of Corollary 2.4 and Remark 2.5, pp.14–15.

<a id="hr-3-finite-descent-index"></a>

**The finite prime-chain index.** Define P⊆Q to consist of the singleton divisors and, for each p∣m and p-free d∣m, the maximal chain C_{p,d}={d,dp,…,dp^{v_p(m)}}. Use distinct subsets as vertices and subset inclusion as arrows. The index is finite. Its data are separate from the ideal attached to each subset.

For m=1 it has one singleton and no prime-chain vertex. For m=6 it has eight vertices, with the incidence graph of the four singleton divisors and four two-element prime chains. For m=12 it has eleven vertices. These examples fix the maximal-chain convention and prevent adding every proper prime-power subchain as a new vertex.

Prerequisites: `mathlib:Nat.divisors`; `mathlib:Nat.primeFactors`; `mathlib:Nat.factorization`; `mathlib:CategoryTheory.Nerve.quasicategory`; [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); `mathlib:Nat.exists_eq_pow_mul_and_not_dvd`; `mathlib:Nat.factorization_mul`; `mathlib:Nat.Prime.factorization_pow`; `mathlib:Nat.factorization_eq_zero_of_not_dvd`; `mathlib:Nat.factorization_le_iff_dvd`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of Corollary 2.4, p. 15, definition of P.

<a id="hr-3-finite-index-height-one"></a>

**Height one of the reduced index.** Every nonidentity arrow of P goes from a singleton to a maximal prime-power chain. Distinct maximal chains are incomparable, and no nonidentity arrow can follow another. Thus its nerve has no nondegenerate simplices above dimension one. Prove this from uniqueness of the p-free part and maximality of the displayed chains.

There may still be cycles in the undirected incidence graph, as for m=6. Height one removes additional compositional cocycles; it does not make all edge comparisons identical or make the mapping space discrete.

Prerequisites: [The finite prime-chain index](#hr-3-finite-descent-index); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of Corollary 2.4, p. 15, definition of P and maximal prime-power subsets.

<a id="hr-3-prime-edge-factorisation"></a>

**Consecutive prime edges determine chain data.** Whenever d, pd divide m there is exactly one maximal p-power chain containing that consecutive pair. Write d=pⁱe with p∤e to find it. Consecutive comparisons along that chain determine all longer comparisons by composition. Each elementary prime edge therefore belongs to precisely one chain, and the composite from pʲe to pⁱe uses its unique successive path.

This calculation allows descent objects to be specified by E_d and h_{p,d} without introducing independent maps for nonconsecutive ratios. The higher associativity of composition comes from the enhanced categorical supplier; an arbitrary choice of strict inverse maps is unnecessary.

Prerequisites: [The finite prime-chain index](#hr-3-finite-descent-index); `mathlib:Nat.exists_eq_pow_mul_and_not_dvd`; `mathlib:Nat.factorization_mul`; `mathlib:Nat.Prime.factorization_pow`; `mathlib:Nat.factorization_eq_zero_of_not_dvd`; `mathlib:Nat.factorization_le_iff_dvd`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Corollary 2.4 and its proof, pp. 14–15, comparisons h_(p,d) and the prime-power index.

<a id="hr-3-the-general-descent-principle"></a>

**Descent for monoidal localizations.** Let I be a poset site and D a presentable stable symmetric monoidal ∞-category. For each Z let D_Z⊆D be full and stable with a left adjoint L_Z. Require D_{Z₁}⊆D_{Z₂} for Z₁→Z₂ and require L_Z(x⊗y)≃L_Z(L_Zx⊗y). These data induce a coherent contravariant functor Z↦D_Z into CAlg(Pr^L_st), with the localized monoidal structures.

For a finite cover {Z_i→Z} whose localizations are jointly conservative on D_Z, restriction is an equivalence D_Z≃lim_{∅≠S}D_{Z_S}, where Z_S is the meet of the Z_i in S. The corresponding equivalence holds for commutative algebra objects. If every cover has a finite refinement and every such finite family is conservative, both functors are sheaves. The proof uses the finite augmented cube and stable exactness. It yields mapping-space equivalences as well as effective object reconstruction; conservativity is a hypothesis, not a consequence of merely having left adjoints.

Prerequisites: `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`; `EnhancedDerivedSheaves:E5:presentability/presentable-categories`; `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, Setup 2.1 and Lemma 2.2, pp.13–14; [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf), §2.2.1, Proposition 2.2.1.9, p.197.

<a id="hr-3-coherent-completion-diagram"></a>

**The diagram of completion categories.** For S∈Q, take the full stable category of derived I_S-complete objects over ℤ[q^{±1}], with its completed tensor product. For S⊆U, the larger ideal gives the full subcategory inclusion in the appropriate direction, and I_U-completion is the transition left adjoint. The radical calculations identify its repeated values on prime chains.

These localizations assemble into an actual coherent functor Q→CAlg(Pr^L_st). Use monoidal localization and restricted straightening to produce the coherences and their uniqueness. A list of ordinary categories and pairwise functors does not replace this object. The module and algebra limits are taken in the enhanced categories supplied by E0/E3/E5.

Prerequisites: [The finite prime-chain index](#hr-3-finite-descent-index); `mathlib:Polynomial.cyclotomic`; [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E5:abstract`; `EnhancedDerivedSheaves:E5:presentability`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, Setup 2.1 and Remark 2.3, pp.13–14; [HTT](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §3.2, Theorem 3.2.0.1, pp.169–170 (PDF pp.187–188); [HA](https://www.math.ias.edu/~lurie/papers/HA.pdf), §2.2.1, Proposition 2.2.1.9, p.197.

<a id="hr-3-finite-localisation-contract"></a>

**Verifying the finite descent hypotheses.** The cyclotomic localizations satisfy the contract of the general descent principle for the finite cover by singleton supports: the completion inclusions are reflective and stable, localization is compatible with tensor, and the singleton reductions are jointly conservative on (qᵐ−1)-complete objects. Use the factorization qᵐ−1=∏_{d∣m}Φ_d and finite successive cofiber triangles for conservativity.

The augmented finite cube reconstructs objects because finite limits and finite colimits coincide in a stable category. This argument uses finiteness throughout. It does not allow a left adjoint to be moved through an arbitrary infinite inverse limit, and it supplies the module descent needed before passing to commutative algebra objects.

Prerequisites: [The diagram of completion categories](#hr-3-coherent-completion-diagram); `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; [Descent for monoidal localizations](#hr-3-the-general-descent-principle); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E3`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof sketch of Lemma 2.2, p. 14; proof of Corollary 2.4, pp. 14–15.

<a id="hr-3-reconstruction-functor"></a>

**Reconstruction from the reduced index.** Starting with compatible complete algebra objects on P, take the right Kan extension to Q and the finite ambient limit with the descent augmentation. The localization contract shows that restricting this reconstruction returns the given local objects. Conversely reconstruction after restriction returns the original complete algebra.

Construct the two equivalences naturally, with their unit, counit and triangle coherences. For a fixed marked local datum, the space of reconstructed algebras is contractible. This is stronger and more useful than choosing an isomorphism class of an ordinary ring; the same reconstruction controls maps and their homotopies.

Prerequisites: [The diagram of completion categories](#hr-3-coherent-completion-diagram); [Verifying the finite descent hypotheses](#hr-3-finite-localisation-contract); [The complete descent equivalence](#hr-3-the-morphism-level-statement); [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E3`; `EnhancedDerivedSheaves:E5:abstract`; `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof sketch of Lemma 2.2, p. 14, essential-surjectivity step; proof of Corollary 2.4, p. 15.

<a id="hr-3-prime-edge-mapping-spaces"></a>

**Mapping spaces of prime-edge data.** For local objects E,F with their edge equivalences, let V=∏_{d∣m}Map(E_d,F_d) and W=∏_{p,d:pd∣m}Map(E_{pd}̂_p,F_d̂_p). There are two maps V⇒W: first apply the source edge comparison and then the map at d; alternatively apply the map at pd and then the target edge comparison. The mapping space of descent objects is the homotopy equalizer of these maps.

An element is a family of local maps together with a specified path on each prime edge. It is not the strict equalizer of a set of maps. At m=6 all four edge paths are retained, while height one supplies no additional compositional cocycle around the undirected cycle. This formulation exposes the full-faithfulness part of descent.

Prerequisites: [The finite prime-chain index](#hr-3-finite-descent-index); [Height one of the reduced index](#hr-3-finite-index-height-one); [Consecutive prime edges determine chain data](#hr-3-prime-edge-factorisation); [Reconstruction from the reduced index](#hr-3-reconstruction-functor); [The complete descent equivalence](#hr-3-the-morphism-level-statement); `EnhancedDerivedSheaves:E0`; `EnhancedDerivedSheaves:E5:abstract`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Proof of Corollary 2.4, p. 15, final limit and unravelling; Lemma 2.2, p. 14.

<a id="hr-3-the-morphism-level-statement"></a>

**The complete descent equivalence.** The localization diagram induces an equivalence from complete module categories, and from their commutative algebra categories, to the finite prime-chain limit. Restriction and reconstruction are inverse at the ∞-categorical level; the preceding mapping-space formula gives full faithfulness. This statement includes the naturality of gluing maps and their coherences.

Use the general descent principle on Q, then show that right Kan extension from P recovers the redundant nonempty subsets using the intersection ideals. Contractible choices of equivalences are part of the conclusion. An ordinary ring equalizer can be extracted after staticity, but cannot serve as the proof of the enhanced equivalence.

Prerequisites: [Descent for monoidal localizations](#hr-3-the-general-descent-principle); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, Remark 2.3 and proof of Corollary 2.4, pp.14–15.

<a id="hr-3-the-complete-descent-corollary"></a>

**Gluing cyclotomically complete algebras.** Given Φ_d-complete E∞ ℤ[q^{±1}]-algebras E_d for every d∣m and equivalences h_{p,d}:E_{pd}̂_p≃E_d̂_p whenever pd∣m, there is a (qᵐ−1)-complete E∞ algebra E inducing exactly these localizations and comparisons. Its space of marked solutions is contractible. The prime-chain index and descent equivalence prove the result without an extra cocycle condition.

The uniqueness is uniqueness of marked objects in the enhanced category. The h_{p,d} must be algebra equivalences after p-completion, not ring maps on degree-zero coefficients alone. These are the data used to define H_{R/A,m} in HR.4.

Prerequisites: [The complete descent equivalence](#hr-3-the-morphism-level-statement); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, Corollary 2.4 and preceding paragraph, p.14.

<a id="hr-3-the-fracture-square-pieces"></a>

**Arithmetic fracture pieces.** After inverting m, the glued algebra splits as the product of its cyclotomic pieces E_d[1/m]. If m=p^αn with p∤n, its p-completion splits over d∣n into the corresponding maximal p-power-chain pieces. The equivalences h identify the p-completions of E_d,E_{pd},…,E_{p^αd}; one representative for each chain therefore supplies that factor.

These identifications are canonical relative to the marked edge data and respect the fracture maps. They are used to compare finite stages and Taylor series prime locally, before the rational and integral pieces are reassembled.

Prerequisites: [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); [Descent for monoidal localizations](#hr-3-the-general-descent-principle); `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.1, Remark 2.5, p.15.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `CyclotomicIndex.primeChain` | For m,d,p define the finset {d p^i : i ≤ v_p(m)}; for p prime dividing m and p-free d dividing m it is a vertex. |
| `CyclotomicIndex.vertices` | The finset of vertices is the union of singleton divisors and maximal chains at prime factors of m. |
| `CyclotomicIndex.mem_vertices` | S is a vertex iff S is a singleton divisor or S=C(m,d,p) for p dividing m and p-free d dividing m. |
| `CyclotomicIndex.vertex_subset` | Every vertex is a subset of Nat.divisors(m). |
| `CyclotomicIndex.vertex_nonempty` | Every vertex is nonempty. |
| `CyclotomicIndex.le_iff_subset` | For S,U∈P(m), S≤U if and only if their underlying finite subsets satisfy S⊆U. Use the inherited subtype order on finite sets. |
| `CyclotomicIndex.nerve_quasicategory` | The nerve of P(m), using Mathlib’s preorder category, is a quasicategory. |
| `CyclotomicCompletionDiagram.obj` | F(S)=D̂_{I_S}(A[q]) with its completed monoidal structure. |
| `CyclotomicCompletionDiagram.map` | For S⊆U, F(S)→F(U) is derived I_U-completion restricted to D_S. |
| `CyclotomicCompletionDiagram.map_id` | The transition S⊆S is canonically equivalent to identity, using the localization counit. |
| `CyclotomicCompletionDiagram.map_comp` | For S⊆U⊆V the transition is coherently the composite, with unit, associativity and higher coherence supplied by the straightened fibration. |
| `CyclotomicCompletionDiagram.unit` | The unit of D_S is (A[q])^∧_{I_S}. |
| `CyclotomicCompletionDiagram.chain` | At C(m,d,p) the category is D̂_{(p,Φ_d)}(A[q]); the map from {p^i d} is p-completion on Φ_{p^i d}-complete objects. |
| `CyclotomicCompletionDiagram.algebraSections` | Apply CAlg and take the coherent limit to obtain the infinity-category of compatible local algebras, including its mapping spaces. |
| `CyclotomicReconstruction.ofSection` | A coherent P(m)-section maps to its Q(m)-extended finite limit algebra, which is (q^m−1)-complete. |
| `CyclotomicReconstruction.complete` | Completion of the reconstruction at Φ_d is naturally equivalent to the singleton component E_d, respecting every prime edge. |
| `CyclotomicReconstruction.map` | A coherent map of local sections induces a map of reconstructed algebras. |
| `CyclotomicReconstruction.map_id` | Reconstruction carries the identity section map to the identity map. |
| `CyclotomicReconstruction.map_comp` | Reconstruction carries composition to composition, with coherent functor laws. |
| `CyclotomicReconstruction.unit` | E→R(C(E)) is the natural equivalence defined by completion units and the limiting cone. |
| `CyclotomicReconstruction.counit` | C(R(s))→s is the natural equivalence on local sections; together with the unit it satisfies the triangle homotopies. |
| `CyclotomicReconstruction.solutionSpace` | For each fixed prime-edge input s, the space of pairs (E,C(E)≃s) is contractible. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `CyclotomicIndex.test_one`: vertices(1) = {{1}}.
- `CyclotomicIndex.test_four`: vertices(4) = {{1},{2},{4},{1,2,4}}.
- `CyclotomicIndex.test_six`: vertices(6) = {{1},{2},{3},{6},{1,2},{3,6},{1,3},{2,6}}.
- `CyclotomicIndex.test_not_pair_four`: {1,4} is not a vertex of P(4), although it is a surviving intersection in Q(4).
- `CyclotomicIndex.test_incomparable_singletons`: For the vertices S={1} and U={2} of P(2), neither S≤U nor U≤S holds, although 1 divides 2. This distinguishes the required subset order from divisibility of singleton members.
- `CyclotomicCompletionDiagram.test_one`: At m=1 the diagram is the single category D̂_{q−1}(A[q]).
- `CyclotomicCompletionDiagram.test_four`: At m=4 all subsets of size at least two in Q(4) give D̂_{(2,q−1)}; in P(4) this is the single chain vertex.
- `CyclotomicCompletionDiagram.test_six_empty`: At m=6 the full-cube value at {1,6} is the zero stable category; its CAlg category is terminal, whereas {1,2} has the (2,q−1)-complete value.
- `CyclotomicReconstruction.test_one`: At m=1, R(E_1)≃E_1 with the indicated completion counit.
- `CyclotomicReconstruction.test_prime`: At m=p, prime, R is the specified homotopy pullback over the common p-completion, naturally on objects and morphisms.
- `CyclotomicReconstruction.test_unit`: For E_d=(A[q])^∧_{Φ_d} with canonical common-completion identifications, R(E_d)≃(A[q])^∧_{q^m−1}, as complete E∞-A[q]-algebras.
- `CyclotomicReconstruction.test_four`: At m=4 the comparison on the surviving {1,4} overlap is h_(2,1) composed with h_(2,2); it is not an independently supplied third comparison.

## HR.4 — q-Witt interfaces for the finite rings

The degree-zero q-Witt objects are imported from QW.0–QW.4. Their quotients, Frobenius maps and relative ghosts give the reduction of the finite Habiro deformation.

<a id="hr-4-truncated-big-witt-vectors"></a>

**Truncated big Witt vectors.** For a divisor-stable truncation set S, W_S(R) has underlying coordinates R^S and universal integral ring laws for which the ghosts gh_n=Σ_{d∣n}d a_d^{n/d} are ring maps. Construct the laws on universal torsion-free rings and specialize to arbitrary R. The API includes natural maps, restrictions, multiplicative Teichmüller lifts, Frobenius and additive Verschiebung with their exact truncation indices.

Ghosts are jointly injective on torsion-free R. The identity F_nV_n=n is a scalar identity on the appropriate source; V_nF_n is not generally multiplication by n. The p-typical subtruncation translates {1,p,…,p^a} to Mathlib length a+1. These are imported big Witt objects, rather than redefinitions of Mathlib's p-typical vectors.

Prerequisites: [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); `mathlib:WittVector`; `mathlib:TruncatedWittVector`; `mathlib:WittVector.ghostComponent`; `mathlib:WittVector.frobenius`; `mathlib:WittVector.verschiebung`; `mathlib:WittVector.teichmuller`; `mathlib:Nat.divisors`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.2, 2.6, p.10; Remark 2.7, p.11; §2.4, 2.31, p.26.

<a id="hr-4-q-witt-vectors"></a>

**Absolute q-Witt vectors.** For m≥1, q-W_m(R) is W_m(R)[q] modulo the q-FV ideal. Its generators are (qᵈ−1)im(V_{m/d}) for d∣m and the images of
\[
 [d/e]_{q^e}\,V_{m/d}-V_{m/e}F_{d/e}\qquad(e\mid d\mid m).
\]
It is initial among the compatible q-Frobenius–Verschiebung systems. In particular FV=m/d while VF=[m/d]_{q^d}; these two relations must remain distinct. For prime-torsion-free coefficients the relative cyclotomic ghost components provide joint injectivity in the indicated q-Witt setting.

At q=1 this quotient is not automatically the original big Witt ring. The relation qᵐ−1=0 belongs to the construction, and the absence of ordinary restriction maps is a feature of its cyclotomic quotients, not a missing choice of coordinate projection.

Prerequisites: [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`; `mathlib:Polynomial.cyclotomic`; `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.2, Definition 2.8, Lemma 2.9 and Remark 2.11, p.11; 2.13, p.13; §2.2, Lemma 2.23, p.20.

<a id="hr-4-the-lambda-ring-comparison-maps"></a>

**The maps s_m and c_m.** For a Λ-ring A, restrict its Witt section to obtain s_m:A→W_m(A). Its ghost at m/d is ψ^{m/d}. Define auxiliary additive maps ε_d recursively by
gh_m=Σ_{d∣m}d ψ^{m/d}ε_d Res_d^m. Then the comparison map c_m:q-W_m(A)→A[q]/(qᵐ−1) is given by
\[
 c_m=\sum_{d\mid m}[d]_{q^{m/d}}\,\psi^{m/d}\,\epsilon_d\,\mathrm{Res}_d^m.
\]
Its Φ_d-component is ψᵈgh_{m/d}; it sends Frobenius to the quotient projection, Verschiebung to the corresponding q-integer, and c_ms_m to ψᵐ.

When all Adams operations are injective, its image is the specified sum of twisted coordinate images; when A is perfect it is an isomorphism. These formulas establish the coefficient action used in the relative quotient, not an a priori untwisted A-algebra structure on q-W_m(R).

Prerequisites: [Absolute q-Witt vectors](#hr-4-q-witt-vectors); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); `mathlib:Polynomial.cyclotomic`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.4, 2.31, p.26; Lemma 2.34, p.27; Corollary 2.35, p.28; Corollary 2.37, p.29.

<a id="hr-4-relative-q-witt-rings"></a>

**Relative q-Witt vectors.** For A→R with A a Λ-ring, first tensor q-W_m(R) over q-W_m(A) with A[q]/(qᵐ−1) through c_m. Then quotient by the ideal generated by
V_{m/d}(xy)⊗1−V_{m/d}(x)⊗c_d(y), for d∣m, x∈q-W_d(R), y∈q-W_d(A). The resulting q-W_m(R/A) is initial for relative q-FV systems over A. Its cyclotomic ghost at d takes values in (R⊗_{A,ψᵈ}A)[q]/Φ_d(q).

The construction is natural in maps of pairs and commutes with coefficient base change in the specified relative form. For R=A, the relative ring is A[q]/(qᵐ−1); for A=ℤ it is the absolute q-Witt ring. A perfect Λ-base gives the naive comparison isomorphism. A toric Λ-base need not be perfect, so its absolute q-Witt ring is not automatically its relative self-ring.

Prerequisites: [Absolute q-Witt vectors](#hr-4-q-witt-vectors); [The maps s_m and c_m](#hr-4-the-lambda-ring-comparison-maps); [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations); [Perfectly covered bases](#hr-1-perfectly-covered); [The category of relative inputs](#hr-1-morphisms-of-pairs).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.5, Definition 2.40 and Lemma 2.41, p.30; 2.44, p.31; Lemma 2.46, pp.31–32; Remark 2.47, p.32.

<a id="hr-4-q-witt-vectors-of-etale-maps"></a>

**Étale q-Witt maps and Frobenius pushouts.** For an étale map A→R, the induced maps of truncated big Witt and q-Witt rings are étale, and the Frobenius squares are pushouts. For m and d∣m, the Frobenius edge has target W_d or q-W_d, and index m/d; this fixes the source's conflicting target index in the display of Proposition 2.48.

The proof applies étale base change for the big Witt Frobenius, then checks the defining q-FV relations and the quotient presentation. The relative quotient consequently gives an étale algebra over A[q]/(qᵐ−1). The pushout squares are also derived pushouts because the relevant maps are flat.

Prerequisites: [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); [Absolute q-Witt vectors](#hr-4-q-witt-vectors); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:Algebra.Etale`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.6, Proposition 2.48 and Lemma 2.50, p.33; [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, paragraph before Theorem 2.9, p.16.

<a id="hr-4-ghost-maps-and-etale-base-change"></a>

**Relative ghost squares.** For an étale A-algebra R, each relative cyclotomic ghost square is a pushout over the corresponding comparison map c_m and twisted ghost of A. Thus reducing q-W_m(R/A) along Φ_d gives (R⊗_{A,ψᵈ}A)[q]/Φ_d. The statement is both ordinary and derived: étale flatness removes higher Tor in these squares.

These identifications are compatible with q-Frobenius, maps of pairs and the linearized completed Frobenius on prime edges. They supply the reduced gluing datum in the proof of the finite-stage comparison; just knowing the individual ghost quotient rings without their commuting squares would be insufficient.

Prerequisites: [Étale q-Witt maps and Frobenius pushouts](#hr-4-q-witt-vectors-of-etale-maps); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.6, Corollary 2.51, p.34; [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, proof of Theorem 2.9, p.17.

<a id="hr-4-there-is-no-restriction-map"></a>

**The obstruction to Witt restriction.** Ordinary Witt restriction cannot generally extend to the cyclotomic q-Witt quotients while commuting with the full projection to the divisor cyclotomic quotient. For m=p^α, the proposed restriction would have to annihilate a class whose image in the target is the nonzero scalar p, contradicting the required quotient compatibility. The obstruction is formulated for that entire commuting diagram, not as the claim that no ring homomorphism between the two rings exists.

In characteristic p special maps can exist: for example a map ℤ/4→𝔽₂ is not prohibited by a contradiction requiring p to survive in the target. The relative Habiro transitions are therefore identified with Frobenius, whose quotient compatibility is the correct one.

Prerequisites: [Absolute q-Witt vectors](#hr-4-q-witt-vectors); [Truncated big Witt vectors](#hr-4-truncated-big-witt-vectors); `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum`; `mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one`.

Source: [W](https://arxiv.org/pdf/2410.23078v5), §1.3, p.3; §2.2, 2.14, p.13.

<a id="hr-4-an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift"></a>

**Naive quotients force global Frobenius.** Let R be étale over ℤ, and let R→R̂_p be injective for a prime p dividing m. A ℤ[q]-algebra isomorphism q-W_m(R)≅R[q]/(qᵐ−1) forces a global Frobenius lift R→R compatible with the completed lift at p. The forced maps at admissible primes commute. Use the ghost/Frobenius pushout identities to recover the endomorphism on coefficients and the injection into R̂_p to descend its equality.

This is an obstruction theorem with a specified polynomial-algebra structure. An unmarked abstract ring isomorphism would not supply the same conclusion. HR.7 applies it at p=5 to R=ℤ[∛2][1/6], where the global endomorphisms and the completed Frobenius cannot agree.

Prerequisites: [Étale q-Witt maps and Frobenius pushouts](#hr-4-q-witt-vectors-of-etale-maps); [Relative ghost squares](#hr-4-ghost-maps-and-etale-base-change); [Absolute q-Witt vectors](#hr-4-q-witt-vectors); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); [Torsion-free Λ-rings](#hr-1-lambda-rings-with-commuting-adams-operations).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.6, Corollary 2.52, p.35.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `BigWittVector` | BigWittVector S R, the S-truncated big Witt ring, a commutative ring whose underlying set is R^S. |
| `BigWittVector.ghost` | gh_n: W_S(R) → R for n ∈ S, gh_n(x) = Σ_{d\|n} d·x_d^{n/d}, a ring map. |
| `BigWittVector.ghost_injective` | If R is ℤ-torsion-free, x ↦ (gh_n(x))_{n∈S} is injective. |
| `BigWittVector.frobenius` | F_{m/d}: W_m(R) → W_d(R) for d \| m, a ring map with gh_e ∘ F_{m/d} = gh_{(m/d)e}. |
| `BigWittVector.verschiebung` | V_{m/d}: W_d(R) → W_m(R) for d \| m, additive, with gh_e ∘ V_n = n·gh_{e/n} if n \| e and 0 otherwise. |
| `BigWittVector.restrict` | Res_{m/d}: W_m(R) → W_d(R), restriction of coordinates to T_d, a ring map commuting with gh_e for e \| d. |
| `BigWittVector.teichmuller` | τ_m: R → W_m(R), multiplicative, with gh_e(τ_m(r)) = r^e. |
| `BigWittVector.frobenius_comp` | F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e} for e \| d \| m. |
| `BigWittVector.frobenius_verschiebung` | F_n ∘ V_n = n, and F_n ∘ V_k = V_k ∘ F_n when (k, n) = 1. |
| `BigWittVector.frobenius_teichmuller` | F_{m/d}(τ_m(r)) = τ_d(r)^{m/d}. |
| `BigWittVector.eq_sum_verschiebung_teichmuller` | x = Σ_{d\|m} V_{m/d}(τ_d(x_{m/d})) for x = (x_d)_{d\|m}. |
| `BigWittVector.restrict_verschiebung` | Res_{m/d} ∘ V_n = V_n ∘ Res if n \| d, and Res_{m/d} ∘ V_n = 0 if n ∤ d. |
| `BigWittVector.map` | A ring map R → R′ induces W_S(R) → W_S(R′) coordinatewise, commuting with gh, F, V, Res and τ; map_id and map_comp. |
| `BigWittVector.equivTruncatedWittVector` | For p prime and m = p^n, W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R via x ↦ (x_{p^i})_{i≤n}, identifying gh_{p^k} with WittVector.ghostComponent k (k ≤ n) and F_p, V_p, τ with the p-typical operators. |
| `BigWittVector.lambdaSection` | For a Λ-ring A (HR.1), s: A → W_S(A) with gh_n(s(x)) = ψ^n(x); for torsion-free A it exists by Dwork's criterion with the Frobenius lifts ψ^p. |
| `QWittVector` | q-W_m(R) := W_m(R)[q]/I_m, an algebra over ℤ[q]/(q^m − 1). |
| `QFVSystem` | q-FV-systems of rings over R (q-Witt Definition 2.8) and their morphisms. |
| `QWittVector.ofWitt` | The surjection W_m(R)[q]/(q^m − 1) → q-W_m(R). |
| `QWittVector.frobenius` | F_{m/d}: q-W_m(R) → q-W_d(R), a ℤ[q]-algebra map, for d \| m. |
| `QWittVector.verschiebung` | V_{m/d}: q-W_d(R) → q-W_m(R), ℤ[q]-linear, for d \| m. |
| `QWittVector.frobenius_verschiebung` | F_{m/d} ∘ V_{m/d} = m/d. |
| `QWittVector.verschiebung_frobenius` | V_{m/d} ∘ F_{m/d} = [m/d]_{q^d}. |
| `QWittVector.frobenius_comp` | F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e}. |
| `QWittVector.lift` | For every q-FV-system (W_m) over R, the unique morphism of systems q-W_•(R) → W_•; lift ∘ ofWitt is the structure map, and uniqueness. |
| `QWittVector.truncatedLift` | Initiality among S-truncated q-FV-systems for every truncation set S (Remark 2.12). |
| `QWittVector.ghost` | gh_{m/d}: q-W_m(R) → R[q]/Φ_d(q), gh_{m/d} = gh_1 ∘ F_{m/d}, and gh_{m/d} ∘ ofWitt is the classical gh_{m/d} followed by R → R[ζ_d]. |
| `QWittVector.ghost_one_eq_quotient` | gh_1 identifies R[q]/Φ_m(q) with q-W_m(R)/(im V_p : p prime, p \| m). |
| `QWittVector.ghost_jointly_injective` | If R is p-torsion-free for all primes p \| m, (gh_{m/d})_{d\|m} is injective (Lemma 2.23). |
| `QWittVector.teichmuller` | τ_m: R → q-W_m(R), multiplicative, the image of the Witt Teichmüller lift. |
| `QWittVector.map` | Ring maps R → R′ induce q-W_m(R) → q-W_m(R′) compatible with F, V, gh and τ; map_id and map_comp. |
| `Polynomial.span_geomSum_eq_span_cyclotomic` | q-Witt Lemma 2.2: in ℤ[q], the ideal generated by the [p]_{q^{m/p}} for the primes p \| m is (Φ_m(q)). |
| `QWittVector.trivialMap` | s_m: A[q]/(q^m − 1) → q-W_m(A). |
| `QWittVector.ghost_trivialMap` | gh_{m/d} ∘ s_m = ψ^{m/d} ∘ (A[q]/(q^m − 1) → A[q]/Φ_d(q)). |
| `BigWittVector.epsilon` | ε_m: W_m(A) → A with gh_m(x) = Σ_{d\|m} d·ψ^{m/d}(ε_d(Res_{m/d}(x))). |
| `QWittVector.cyclicMap` | c_m: q-W_m(A) → A[q]/(q^m − 1), a ring map. |
| `QWittVector.cyclicMap_ofWitt` | c_m on the image of x ∈ W_m(A) is Σ_{d\|m} [d]_{q^{m/d}} ψ^{m/d}(ε_d(Res_{m/d}(x))). |
| `QWittVector.cyclicMap_mod_cyclotomic` | c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q) for d \| m. |
| `QWittVector.cyclicMap_frobenius` | (A[q]/(q^m − 1) → A[q]/(q^d − 1)) ∘ c_m = c_d ∘ F_{m/d}. |
| `QWittVector.cyclicMap_verschiebung` | c_m ∘ V_{m/d} = [m/d]_{q^d} · c_d. |
| `QWittVector.cyclicMap_trivialMap` | c_m ∘ s_m = ψ^m, extended ℤ[q]-linearly. |
| `QWittVector.cyclicMap_injective` | If every ψ^m is injective, c_m is injective with image Σ_{d\|m} [d]_{q^{m/d}} ψ^{m/d}(A)[q]/(q^m − 1). |
| `QWittVector.cyclicMapEquivOfPerfect` | For a perfect Λ-ring A, s_m and c_m are isomorphisms. |
| `QWittVector.cyclicMap_natural` | c_m and s_m are natural in maps of Λ-rings. |
| `RelQWittVector` | q-W_m(R/A), an A[q]/(q^m − 1)-algebra. |
| `RelQFVSystem` | Relative q-FV-systems (q-Witt Definition 2.40) and their morphisms. |
| `RelQWittVector.mk` | The surjection q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m − 1) → q-W_m(R/A). |
| `RelQWittVector.frobenius` | F_{m/d}: q-W_m(R/A) → q-W_d(R/A), an A[q]-algebra map, for d \| m. |
| `RelQWittVector.verschiebung` | V_{m/d}: q-W_d(R/A) → q-W_m(R/A), A[q]-linear, for d \| m. |
| `RelQWittVector.frobenius_verschiebung` | F_{m/d}V_{m/d} = m/d, V_{m/d}F_{m/d} = [m/d]_{q^d}, and the composition laws along chains of divisors. |
| `RelQWittVector.lift` | The unique morphism from q-W_•(R/A) to any relative q-FV-system over R, with its compatibility with mk. |
| `RelQWittVector.ghost` | gh_{m/d}: q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q), with gh_{m/d} = gh_{d/d} ∘ F_{m/d}. |
| `RelQWittVector.ghost_top_eq_quotient` | gh_{m/m} is the quotient of q-W_m(R/A) by the images of the V_{m/d}, d ≠ m. |
| `RelQWittVector.map` | A morphism of pairs (A, R) → (A′, R′) (a Λ-map A → A′ and a compatible R → R′) induces q-W_m(R/A) → q-W_m(R′/A′) compatible with F, V and gh; map_id and map_comp. |
| `RelQWittVector.baseChangeEquiv` | q-W_m(R/A) ⊗_A A′ ≅ q-W_m(R ⊗_A A′/A′) for a map of Λ-rings A → A′ (Lemma 2.46). |
| `RelQWittVector.selfEquiv` | q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection and V_{m/d} multiplication by [m/d]_{q^d}. |
| `RelQWittVector.equivAbsolute` | For A = ℤ, q-W_m(R/ℤ) ≅ q-W_m(R) (q-Witt Remark 2.47 with the perfect Λ-ring ℤ). |
| `RelQWittVector.ghost_jointly_injective` | For A perfectly covered and R p-torsion-free for all primes p \| m, the relative ghost maps gh_{m/d} (d \| m) are jointly injective. |
| `RelQWittVector.cyclicMap` | For a Λ-A-algebra R, c_{m/A}: q-W_m(R/A) → R[q]/(q^m − 1) and s_{m/A}: R ⊗_{A,ψ^m} A[q]/(q^m − 1) → q-W_m(R/A), with c_{m/A} ∘ s_{m/A} the linearised Adams operation (2.45). |
| `RelQWittVector.cyclicMapEquiv` | For A perfectly covered and R relatively perfect over A (R carries a Λ-structure for which A → R is a Λ-map and the linearised Adams maps R ⊗_{A,ψ^m} A → R are bijective), s_{m/A} and c_{m/A} are isomorphisms (Remark 2.47). |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

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
- `QWittVector.cyclicMap_trivialMap_toric`: For A = ℤ[T] with ψ^p(T) = T^p, s_2(T) = τ_2(T) and c_2(s_2(T)) = T^2 = ψ^2(T).
- `QWittVector.cyclicMap_range_toric`: For A = ℤ[T] with ψ^p(T) = T^p, the image of c_2 is ℤ[T^2, q]/(q^2 − 1) + (1 + q)·ℤ[T, q]/(q^2 − 1), which does not contain T (its image under q ↦ −1 is ℤ[T^2]); so c_2 does not identify q-W_2(ℤ[T]) with ℤ[T][q]/(q^2 − 1).
- `QWittVector.cyclicMap_one`: For m = 1, s_1 and c_1 are the identity of A.
- `QWittVector.cyclicMapEquivOfPerfect_int`: q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) for all m; for m = 2 this agrees with the isomorphism of the q-Witt vector test, c_2(V_2(1)) = 1 + q.
- `RelQWittVector.one`: q-W_1(R/A) ≅ R.
- `RelQWittVector.selfEquiv_ops`: q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection onto A[q]/(q^d − 1) and V_{m/d} multiplication by [m/d]_{q^d}; hence F_{m/d}V_{m/d} = [m/d]_{q^d} mod (q^d − 1) = m/d.
- `RelQWittVector.equivAbsolute_two`: For A = ℤ, q-W_2(ℤ/ℤ) ≅ ℤ[q]/(q^2 − 1) ≅ q-W_2(ℤ), and in general q-W_m(R/ℤ) ≅ q-W_m(R).
- `RelQWittVector.relative_ne_absolute_toric`: For A = R = ℤ[T] with ψ^p(T) = T^p, q-W_2(ℤ[T]/ℤ[T]) ≅ ℤ[T][q]/(q^2 − 1), whereas c_2 identifies the absolute q-W_2(ℤ[T]) with a subring not containing T: the relative and absolute rings differ.
- `RelQWittVector.ghost_toric`: For A = R = ℤ[T], the relative ghost maps of q-W_2(A/A) = A[q]/(q^2 − 1) are the projections to A[q]/(q + 1) and A[q]/(q − 1) (after a ⊗ b ↦ ψ^d(a)b identifies A ⊗_{A,ψ^d} A with A), and they are jointly injective because A is 2-torsion-free.

## Marked étale deformation and the Habiro–q-Witt comparison

Étale object lifting and nilpotent rigidity play different roles. A chosen lift exists for any quotient; unique maps are obtained only at the nilpotent finite levels, and then by completion.

<a id="hr-4-marked-etale-deformation"></a>

**Marked deformations.** Fix B, an ideal I and an étale B/I-algebra D. A marked étale deformation is an étale B-algebra E with an identification E/IE≅D. A map of marked deformations is a B-algebra map whose reduction respects the chosen identification. Conjugating by markings defines the reduction functor and its action on morphisms.

The marking is actual data. An unmarked isomorphism E/IE≅D remembered only as an existence proposition would not define the morphism category or the contractible marked solution space used later.

Prerequisites: `mathlib:Algebra.Etale`; `mathlib:Algebra.Etale.baseChange`; `mathlib:Algebra.Etale.of_isLocalizationAway`; `mathlib:Algebra.TensorProduct.map`; `mathlib:Algebra.TensorProduct.quotientTensorEquiv`; `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`; `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`.

Source: [Stacks 0ALI](https://stacks.math.columbia.edu/tag/0ALI), §15.11, Lemma 15.11.2, marked fiber of the reduction functor.

<a id="hr-4-etale-quotient-lift"></a>

**Lifting objects across a quotient.** Every étale B/I-algebra D lifts to an étale B-algebra for an arbitrary ideal I. Lift a finite étale presentation, its equations and its invertible Jacobian determinant to B, and invert a lifted determinant to obtain E with E/IE≅D. The construction needs neither I nilpotent nor B Noetherian.

Here “étale” is the finite-presentation étale condition, not “finite as a module.” Object existence across an arbitrary ideal does not imply uniqueness of lifts or maps. Those conclusions require the nilpotent argument below, so the lift and its marking must remain explicit in the completion construction.

Prerequisites: [Marked deformations](#hr-4-marked-etale-deformation); `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`; `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`.

Source: [Stacks 04D1](https://stacks.math.columbia.edu/tag/04D1), §10.143, Lemma 10.143.10 and proof.

<a id="hr-4-nilpotent-deformation-rigidity"></a>

**Nilpotent invariance of étale algebras.** If I is nilpotent, reduction gives an equivalence between étale B-algebras and étale B/I-algebras. In the marked fiber over D, any two lifts have a unique marking-preserving isomorphism and each compatible map of reductions lifts uniquely. The same source proves locally nilpotent invariance; the finite-power application here uses the nilpotent case.

Formal étaleness gives full faithfulness, and the quotient-lift construction gives essential surjectivity. Apply this at B/I^n, where the kernel of reduction to B/I is nilpotent. Applying it directly at a nonnilpotent ideal of B would assert false rigidity.

Prerequisites: [Marked deformations](#hr-4-marked-etale-deformation); [Lifting objects across a quotient](#hr-4-etale-quotient-lift); `mathlib:Algebra.FormallySmooth.exists_lift`; `mathlib:Algebra.FormallyUnramified.lift_unique`; `mathlib:Algebra.TensorProduct.quotientTensorEquiv`.

Source: [Stacks 0ALI](https://stacks.math.columbia.edu/tag/0ALI), §15.11, Lemma 15.11.2 and proof.

<a id="hr-4-completed-etale-deformation"></a>

**Completing a marked lift.** Let I be finitely generated, choose a marked étale lift E of D, and put W=lim_n E/I^nE, the ordinary I-adic completion. The finite-generation hypothesis gives I-adic completeness and identifies W/I^nW with the corresponding finite-level marked deformation. In particular W/IW≅D and every W/I^nW is étale over B/I^n.

Changing the chosen lift gives a canonical marked isomorphism of completions, since nilpotent rigidity identifies all finite levels and their maps. W is a completed étale deformation; it need not be an ordinary étale or flat B-algebra. Its completion and comparison maps are the reusable objects.

Prerequisites: [Marked deformations](#hr-4-marked-etale-deformation); `mathlib:AdicCompletion`; `mathlib:AdicCompletion.isAdicComplete`; `mathlib:AdicCompletion.eval_surjective`; `mathlib:AdicCompletion.ker_evalOneₐ_eq_map`; `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval`; `mathlib:Algebra.TensorProduct.quotientTensorEquiv`; `mathlib:Algebra.Etale.baseChange`; `mathlib:MvPowerSeries.toAdicCompletionAlgEquiv`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Theorem 2.9, pp.16–17, first proof paragraph.

<a id="hr-4-completed-deformation-map-equivalence"></a>

**The mapping property of the completion.** For an ordinary I-adically complete B-algebra C, restriction to the marking gives
\[
 \operatorname{Hom}_B(W,C)\cong
 \operatorname{Hom}_{B/I}(D,C/IC).
\]
Lift the map uniquely at every nilpotent finite level using étale rigidity, check the transition compatibility by uniqueness, and pass to the complete inverse limit. Conversely a map from W has the given reduction and agrees with all these lifts. This also proves independence of E and naturality in complete targets.

Ordinary completeness of C and finite generation in the construction of W remain in force. This is not the assertion that E itself has the same mapping property for an arbitrary noncomplete target.

Prerequisites: [Completing a marked lift](#hr-4-completed-etale-deformation); `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; `mathlib:Algebra.FormallyUnramified.ext_of_iInf`; `mathlib:AdicCompletion.liftAlgHom`; `mathlib:AdicCompletion.ofAlgEquiv`; [Nilpotent invariance of étale algebras](#hr-4-nilpotent-deformation-rigidity); `mathlib:Algebra.TensorProduct.quotientTensorEquiv`.

Source: [Stacks 0ALI](https://stacks.math.columbia.edu/tag/0ALI), §15.11, Lemma 15.11.2, full faithfulness at each finite power.

<a id="hr-4-complete-principal-deformation-universality"></a>

**Unique complete principal deformation.** Let f be a non-zero-divisor in B and let D be étale over B/f. There is a unique f-complete E∞ B-algebra C with a specified derived reduction C/f≃D; the marked solution space is contractible. Construct its finite nilpotent étale lifts and their limit. The ordinary completion W is static, f is regular on it, and it realizes this enhanced deformation.

Comparing derived and ordinary completion uses the supplied bounded f-torsion criterion: the ordinary étale lift is f-torsion-free by flatness over B, so the required bound is uniform. No Noetherian hypothesis is introduced. The static algebra B/f is not a candidate replacement for C, since its derived quotient by f has nonzero π₁.

Prerequisites: [Lifting objects across a quotient](#hr-4-etale-quotient-lift); [Completing a marked lift](#hr-4-completed-etale-deformation); [The mapping property of the completion](#hr-4-completed-deformation-map-equivalence); `mathlib:Algebra.Smooth.flat`; `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E1`; `EnhancedDerivedSheaves:E5:abstract`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Theorem 2.9, pp.16–17, unique completed deformation and staticity.

<a id="hr-4-the-finite-relative-habiro-rings"></a>

**The finite relative Habiro stage.** For perfectly covered A, R étale over A and m≥1, define E_d=(R⊗_{A,ψᵈ}A)[q]̂_{Φ_d(q)} for d∣m. Completed linearized Frobenius identifies E_{pd}̂_p with E_d̂_p. Cyclotomic descent glues these marked pieces to H_{R/A,m}, a (qᵐ−1)-complete E∞ A[q]-algebra. The completed polynomial twists are static and their defining cyclotomic element is regular.

The construction is functorial in pairs and in divisible indices m. Its transition H_{R/A,m}→H_{R/A,d} for d∣m is induced by restricting the compatible local data. These maps form an inverse system; the larger divisible index maps to the smaller one. No independent restriction of q-Witt coordinates is built into this definition.

Prerequisites: [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); [The complete descent equivalence](#hr-3-the-morphism-level-statement); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); [Perfectly covered bases](#hr-1-perfectly-covered); [The category of relative inputs](#hr-1-morphisms-of-pairs); `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7 and Remark 2.8, pp.15–16.

<a id="hr-4-cyclotomic-ghost-lift-coherence"></a>

**Lifting the reduced ghost diagram coherently.** The relative ghosts of q-W_m(R/A) and their Frobenius edge squares lift to the complete marked deformation. At a singleton the principal deformation property supplies a unique lift to E_d. At prime edges the ghost pushout square and the completed linearized Frobenius supply the comparison; marking-preserving uniqueness makes the two lifts agree coherently.

Use the mapping spaces of finite descent to assemble the maps and paths into an enhanced algebra equivalence W≃H_{R/A,m}. Only after proving staticity may one take π₀ and call it an ordinary ring equivalence. This step records the diagram-level compatibility required for Frobenius transitions, rather than merely comparing quotient objects one at a time.

Prerequisites: [Unique complete principal deformation](#hr-4-complete-principal-deformation-universality); [The mapping property of the completion](#hr-4-completed-deformation-map-equivalence); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); [Relative ghost squares](#hr-4-ghost-maps-and-etale-base-change); [Perfectly covered bases](#hr-1-perfectly-covered); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); [Relative Frobenius in characteristic p](#hr-1-relative-frobenius-of-an-etale-algebra); [Cyclotomic intersections](#hr-3-the-divisor-poset-and-its-intersections); [The diagram of completion categories](#hr-3-coherent-completion-diagram); [Verifying the finite descent hypotheses](#hr-3-finite-localisation-contract); [Reconstruction from the reduced index](#hr-3-reconstruction-functor); [Mapping spaces of prime-edge data](#hr-3-prime-edge-mapping-spaces); [Étale q-Witt maps and Frobenius pushouts](#hr-4-q-witt-vectors-of-etale-maps); `DerivedDeRhamCohomology:DD.1`; `EnhancedDerivedSheaves:E1`; `EnhancedDerivedSheaves:E5:abstract`; [Nilpotent invariance of étale algebras](#hr-4-nilpotent-deformation-rigidity); `mathlib:Algebra.Etale.baseChange`; `mathlib:Algebra.Smooth.flat`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Theorem 2.9 full proof, pp.16–17, the two ghost diagrams; [W](https://arxiv.org/pdf/2410.23078v5), Corollary 2.51, p.34, statement and proof.

<a id="hr-4-the-etale-lift"></a>

**The finite-stage Habiro–q-Witt theorem.** Assume A perfectly covered and R étale over A. Then H_{R/A,m} is the unique (qᵐ−1)-complete marked deformation of q-W_m(R/A). It is static, qᵐ−1 is a non-zero-divisor, and its derived and ordinary quotient by qᵐ−1 is q-W_m(R/A). Its Φ_d-quotient is (R⊗_{A,ψᵈ}A)[q]/Φ_d for d∣m. All comparisons are natural in maps of pairs.

The proof combines relative q-Witt étaleness, the complete principal deformation theorem, and the coherent ghost identification with the finite gluing construction. The étale hypothesis on R is part of the statement even though the displayed statement of Q, Theorem 2.9 abbreviates it. Merely being an A-algebra does not give the deformation argument.

Prerequisites: [The finite relative Habiro stage](#hr-4-the-finite-relative-habiro-rings); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); [Étale q-Witt maps and Frobenius pushouts](#hr-4-q-witt-vectors-of-etale-maps); [Relative ghost squares](#hr-4-ghost-maps-and-etale-base-change); [The complete descent equivalence](#hr-3-the-morphism-level-statement); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); [The category of relative inputs](#hr-1-morphisms-of-pairs); `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Theorem 2.9 and proof, pp.16–17.

<a id="hr-4-the-transitions-are-frobenius"></a>

**Transitions deform q-Witt Frobenius.** For d∣m, reduction of H_{R/A,m}→H_{R/A,d} modulo qᵐ−1 and qᵈ−1 identifies the induced map with F_{m/d}:q-W_m(R/A)→q-W_d(R/A). The reduced ghosts determine it, and uniqueness of the lifted marked deformation gives the commuting comparison square.

For e∣d∣m the transition composite equals the direct transition, coherently before taking π₀ and as an equality of ring maps afterwards. Thus the inverse system lifts Witt Frobenius, not Witt restriction. The two maps cannot be exchanged merely because both decrease the truncation index.

Prerequisites: [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift); [The finite relative Habiro stage](#hr-4-the-finite-relative-habiro-rings); [Relative ghost squares](#hr-4-ghost-maps-and-etale-base-change); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7 and footnote (2.1), p.16; Remark 2.10, p.17.

<a id="hr-4-the-limit-of-the-finite-stages-is-static"></a>

**Staticity of the inverse limit.** The derived inverse limit of H_{R/A,m} along divisibility is an ordinary ring. Fix d. Derived reduction by Φ_d is a finite cofiber and therefore commutes with limits in the stable category. On the cofinal tail of indices divisible by d, the reduction identifies with the fixed static algebra (R⊗_{A,ψᵈ}A)[q]/Φ_d, and the transition maps identify with its identity. Hence every cyclotomic derived reduction of the limit is static.

The limit is Habiro-complete because completeness is closed under limits. HR.2's detection theorem now kills its homotopy in every degree except zero. This proof does not infer exactness of an inverse limit of arbitrary ordinary rings, and does not assume surjective transitions before proving them.

Prerequisites: [Transitions deform q-Witt Frobenius](#hr-4-the-transitions-are-frobenius); [The finite relative Habiro stage](#hr-4-the-finite-relative-habiro-rings); [Detecting homotopy bounds and staticity](#hr-2-the-detection-results); [Complete objects and completion](#hr-2-habiro-complete-modules); `DerivedDeRhamCohomology:DD.1`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Theorem 2.9 and proof, pp.16–17; Appendix B, Corollary B.4, p.78.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `EtaleDeformation.ofAlgebra` | Package an étale B-algebra E and ε:(B/I)⊗_B E≅D. |
| `EtaleDeformation.carrier_etale` | Every packaged carrier is Algebra.Etale over B, using the existing class. |
| `EtaleDeformation.reduction_etale` | D is étale over B/I by base change and the marking. |
| `EtaleDeformation.transportMarking` | For e:D≅D′, retain E and replace ε by e∘ε. |
| `EtaleDeformation.reduceMap` | A B-algebra map of carriers gives the specified conjugated B/I-algebra map between the marked targets. |
| `EtaleDeformation.reduceMap_id` | Reduction sends the identity to the identity. |
| `EtaleDeformation.reduceMap_comp` | Reduction sends h∘g to the composite of their reductions. |
| `EtaleDeformation.unit` | The canonical deformation of B/I has carrier B and the tensor-unit marking. |
| `EtaleDeformation.split` | The canonical deformation of (B/I)×(B/I) has carrier B×B and the product marking. |
| `EtaleDeformation.localisation` | For a∈B, use E=B[1/a] and the identity marking of (B/I)⊗_B E; its reduced algebra is (B/I)[1/ā]. |
| `CompletedEtaleLift.instCommRing` | The existing completion ring structure. |
| `CompletedEtaleLift.instAlgebra` | The B-algebra structure induced from E. |
| `CompletedEtaleLift.of` | The B-algebra map E→W of the existing completion unit. |
| `CompletedEtaleLift.complete` | W is complete for the extended ideal IW, for I finitely generated. |
| `CompletedEtaleLift.reductionEquiv` | The marked B/I-algebra equivalence (B/I)⊗_B W≅D. |
| `CompletedEtaleLift.reduction_of` | Reducing E→W and then applying the completed marking equals ε. |
| `CompletedEtaleLift.homEquiv` | For ordinary I-complete C, Hom_B(W,C)≃Hom_{B/I}(D,C/IC), by lifting uniquely at every finite power. |
| `CompletedEtaleLift.map` | Lift a B/I-algebra map g:D→D′ uniquely to W_L→W_M for any two selected object lifts. |
| `CompletedEtaleLift.map_reduction` | The completed map reduces to g under the two markings. |
| `CompletedEtaleLift.map_id` | The lift of the identity is the identity. |
| `CompletedEtaleLift.map_comp` | The lift of h∘g equals the composite of the lifted maps. |
| `CompletedEtaleLift.equivOfMarking` | For two object lifts of D, the unique map inducing identity on D is an algebra equivalence of their completions. |
| `CompletedEtaleLift.equivOfMarking_reduction` | The comparison intertwines the two markings. |
| `CompletedEtaleLift.equivOfMarking_trans` | The marked comparisons satisfy the transitivity law; inverse and identity follow from map_comp and map_id. |
| `RelHabiroStage` | H_{R/A,m}, a (q^m − 1)-complete E∞-A[q]-algebra (an ordinary ring by the comparison theorem). |
| `RelHabiroStage.localPiece` | E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} for d \| m. |
| `RelHabiroStage.gluing` | h_d: (E_{pd})^∧_p ≃ (E_d)^∧_p, induced by ϕ_{p/A}, for pd \| m. |
| `RelHabiroStage.completionEquiv` | (H_{R/A,m})^∧_{Φ_d(q)} ≃ E_d, under which h_d is the identity of (H_{R/A,m})^∧_{(Φ_d(q),Φ_{pd}(q))}. |
| `RelHabiroStage.transition` | t_{m,d}: H_{R/A,m} → H_{R/A,d} for d \| m, from H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d−1)}. |
| `RelHabiroStage.map` | H_{R/A,m} → H_{R′/A′,m} for a morphism of pairs, compatible with the completionEquiv; map_id and map_comp. |
| `RelHabiroStage.equivOfIso` | Isomorphic étale presentations (A, R) ≅ (A′, R′) give equivalent H_{R/A,m}. |
| `RelHabiroStage.selfEquiv` | H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `EtaleDeformation.test_unit`: The carrier of unit(I) is B as a B-algebra, including the zero-ring case.
- `EtaleDeformation.test_split_swap`: The swap automorphism of the split lift reduces, through the canonical marking, to (x,y)↦(y,x). For a nonzero B/I this changes (1,0).
- `EtaleDeformation.test_localisation`: At B=ℤ,I=0,a=2 the localization deformation has carrier ℤ[1/2] as a ℤ-algebra and is not a finite ℤ-module. Requiring module-finiteness would reject this valid étale deformation.
- `CompletedEtaleLift.test_zero_ideal`: At I=0, W≅D as a B-algebra, with the B-algebra structure on D obtained by restricting scalars from B/I.
- `CompletedEtaleLift.test_nilpotent`: If I is nilpotent, the canonical completion map E→W is bijective, hence an algebra equivalence. Each quotient family is eventually constant; finite generation is not needed for this test.
- `CompletedEtaleLift.test_split_swap`: For B/I nonzero, the unique completed map lifting the reduced transposition of D=(B/I)² is not the identity, since its reduction moves (1,0).
- `CompletedEtaleLift.test_localisation_series`: For B=ℤ[t], I=(t), L the étale localization at 2, W≅ℤ[1/2][[t]], intertwining the B-structure with polynomial evaluation at the power-series variable. Completion admits ∑_n t^n/2^n; replacing W by ℤ[[t]][1/2] would wrongly exclude it.
- `RelHabiroStage.one`: m = 1: there are no prime edges and H_{R/A,1} ≃ E_1 = R[q]^∧_{(q−1)}.
- `RelHabiroStage.int`: A = R = ℤ: every ϕ_{p/ℤ} is the identity of ℤ_p, so all h_d are identities and H_{ℤ/ℤ,m} ≃ ℤ[q]^∧_{(q^m−1)} (identity gluings reconstruct ℤ[q]^∧_{(q^m−1)}, Remark 2.8).
- `RelHabiroStage.selfEquiv`: For R = A (perfectly covered), a ⊗ b ↦ ψ^d(a)b identifies E_d with A[q]^∧_{Φ_d(q)} and h_d with the identity, so H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}.
- `RelHabiroStage.localised`: A = ℤ, R = ℤ[1/2], m = 2: (E_2)^∧_2 = 0, so there is no gluing, E_1 = ℤ[1/2][[q − 1]], E_2 = ℤ[1/2][[q + 1]] and H_{ℤ[1/2]/ℤ,2} ≃ ℤ[1/2][[q − 1]] × ℤ[1/2][[q + 1]] ≅ ℤ[1/2][q]^∧_{(q^2−1)}.

## HR.5 — The relative ring and cyclotomic Taylor series

After staticity, the enhanced inverse limit has an ordinary ring presentation. The Taylor description must preserve full coefficient algebras and distinguish coefficient extension from Frobenius re-expansion.

<a id="hr-5-the-relative-habiro-ring"></a>

**The relative Habiro ring.** Set H_{R/A}=lim_m H_{R/A,m}, with the Frobenius transitions just constructed. Staticity identifies the enhanced limit with the ordinary inverse-limit ring. The factorial sequence is cofinal in the divisibility index, so it gives an equivalent tower. Its projections, compatible-family lifting map and uniqueness give the ordinary limit universal property for any ring B.

H_{R/A} is Habiro-complete; its (qᵐ−1)-completion is H_{R/A,m}, its quotient by qᵐ−1 is q-W_m(R/A), and its Φ_m-quotient is the twisted cyclotomic coefficient algebra. The m=1 completion is R[[q−1]]. Maps of pairs induce compatible stage maps and a functorial map on H. The ring is not a localization inverting q−1; already for ℤ its q−1 element is noninvertible.

Prerequisites: [Staticity of the inverse limit](#hr-4-the-limit-of-the-finite-stages-is-static); [The finite relative Habiro stage](#hr-4-the-finite-relative-habiro-rings); [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift); [Transitions deform q-Witt Frobenius](#hr-4-the-transitions-are-frobenius); [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); [The complete descent equivalence](#hr-3-the-morphism-level-statement); [Complete objects and completion](#hr-2-habiro-complete-modules); [Detecting homotopy bounds and staticity](#hr-2-the-detection-results); [The category of relative inputs](#hr-1-morphisms-of-pairs).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7 and footnote (2.1), p.16; Theorem 2.9 and proof, pp.16–17; proof of Lemma 2.12, p.18.

<a id="hr-5-roots-choices-and-substitutions"></a>

**Compatible roots and the two Taylor maps.** Choose primitive roots ζ_m∈ℂ with ζ_{mn}=ζ_mζ_n for coprime m,n and ζ_{p^a}=ζ_{p^{a+1}}ᵖ. One such system is ζ_m=∏_{p∣m}exp(2πi/p^{v_p(m)}). Put C_m=R^(m)⊗_ℤℤ[ζ_m], retaining this tensor algebra in full, and T_m=C_m[[q−ζ_m]]. Put T_{p,m}=(R̂_p⊗_{A,ψᵐ}A)̂_p[ζ_{pm}][[q−ζ_m]].

The map can_{p,m}:T_m→T_{p,m} extends coefficients and keeps the variable q−ζ_m. The map φ_{p,m}:T_{pm}→T_{p,m} first applies completed linearized Frobenius to the coefficients and then substitutes q−ζ_{pm}=(q−ζ_m)+(ζ_m−ζ_{pm}). The difference is p-adically topologically nilpotent, making this re-expansion converge. Taylor expansion τ_m sends q to ζ_m+X_m and its constant coefficient is evaluation at ζ_m.

Changing a compatible root system gives canonical isomorphisms between these presentations. In the abstract algebra R^(m)[z]/Φ_m(z), with a separate formal power-series variable, the relabeling can be represented by the identity. On a fixed realized coefficient algebra, the actual Galois action is generally nontrivial: it sends the chosen root to its new conjugate. Independence of presentations must not be confused with triviality of that action. The usual roots exp(2πi/m) fail the compatibility at orders 3 and 6, where the required difference is a unit.

Prerequisites: [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); `HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots`; `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`; `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; `mathlib:IsPrimitiveRoot`; `mathlib:Polynomial.cyclotomic`; `mathlib:PowerSeries`; `mathlib:PadicInt`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.11, p.17.

<a id="hr-5-the-ell-adic-taylor-comparison"></a>

**Prime-adic and rational Taylor comparison.** For ℓ∤m, the full algebra ℤ_ℓ[ζ_m]=ℤ_ℓ[z]/Φ_m(z) is finite étale and decomposes into all its unramified factors. Taylor expansion identifies the (ℓ,Φ_m)-complete polynomial algebra with power series over this entire coefficient algebra. The separability of Φ_m modulo ℓ and Hensel lifting prove the comparison factor by factor. Over ℚ, Φ_m is irreducible and the rational Φ_m-completion has the analogous full cyclotomic Taylor description.

Do not assert irreducibility of Φ_m over 𝔽_ℓ. Its factors have degree ord_m(ℓ), and there can be several of them. At m=5, ℓ=11 there are four linear factors, so the integral Taylor comparison has four ℤ₁₁ power-series factors. The comparison needs every idempotent factor and remains valid with this correction.

Prerequisites: `mathlib:Polynomial.separable_cyclotomic`; `mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one`; `mathlib:Polynomial.cyclotomic.irreducible_rat`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:PadicInt`; `mathlib:IsAdicComplete`; `mathlib:PowerSeries`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, proof of Lemma 2.12, prime-adic and rational steps, p.18.

<a id="hr-5-the-equaliser-presentation"></a>

**The Taylor equalizer.** For a fixed compatible root system there is a canonical ring isomorphism
\[
 H_{R/A}\cong\operatorname{Eq}\left(
 \prod_{m\geq1}T_m\ \substack{\longrightarrow\\[-6pt]\longrightarrow}\
 \prod_{p,m}T_{p,m}\right),
\]
where the two components at (p,m) are can_{p,m}(f_m) and φ_{p,m}(f_{pm}). Thus a family belongs to the relative ring exactly when these completed Taylor expansions agree on every prime edge.

Prove it by the finite cyclotomic descent equivalence, the arithmetic fracture pieces, and the full prime-adic and rational Taylor comparisons, then pass to the cofinal inverse limit. The enhanced comparison precedes its ordinary equalizer consequence. A single chosen embedding of C_m into an extension field would lose factors, and equality only of root values would discard higher Taylor coefficients.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [Compatible roots and the two Taylor maps](#hr-5-roots-choices-and-substitutions); [Prime-adic and rational Taylor comparison](#hr-5-the-ell-adic-taylor-comparison); [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); [Detecting homotopy bounds and staticity](#hr-2-the-detection-results); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); `mathlib:RingHom.eqLocus`; `mathlib:CommRingCat.equalizerForkIsLimit`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Lemma 2.12 and proof, p.18.

<a id="hr-5-untwisted-relative-habiro-rings"></a>

**When the twists can be removed.** If R has global compatible Frobenius/Λ-operations extending those on A and their linearizations are invertible in the required twists, these maps identify the twisted pieces with the untwisted cyclotomic completions. The gluing and its transitions then give the naive Habiro completion of R[q]. In particular R=A, toric self-bases and R=ℤ[1/N] with identity Adams operations have the untwisted description.

For a general étale algebra R the completed Frobenius does not extend globally, so these identifications are unavailable. This theorem gives a sufficient compatibility condition and its examples; it does not replace the twisted construction for every étale R.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [Gluing cyclotomically complete algebras](#hr-3-the-complete-descent-corollary); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `mathlib:Algebra.Etale.of_isLocalizationAway`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Remark 2.8, p.16; §1.4, Notation 1.22(e), p.12.

<a id="hr-5-completed-base-change"></a>

**Completed base change of the ring.** Let A→A′ be a map of perfectly covered Λ-rings and set R′=R⊗_AA′ with R étale over A. Then
\[
 (H_{R/A,m}\otimes^L_{A[q]}A'[q])^\wedge_{q^m-1}
 \simeq H_{R'/A',m},\qquad
 L_H(H_{R/A}\otimes^L_{A[q]}A'[q])\simeq H_{R'/A'}.
\]
Use relative q-Witt base change, uniqueness of the complete étale deformation and the completion universal property. The statement is derived from those interfaces; it is not a quoted base-change theorem of Q.

If A′ is flat over A, the tensor is ordinary, but completion is still required. For A=R=ℤ and A′=ℤ[x] with toric operations, H⊗_ℤℤ[x]=H[x] is strictly smaller than the Habiro completion of ℤ[x][q]. Flatness permits removal of Tor, not removal of the completion.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [When the twists can be removed](#hr-5-untwisted-relative-habiro-rings); [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); [The category of relative inputs](#hr-1-morphisms-of-pairs); [Complete objects and completion](#hr-2-habiro-complete-modules).

Source: [W](https://arxiv.org/pdf/2410.23078v5), §2.5, Lemma 2.46, pp.31–32; [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Theorem 2.9, pp.16–17; deduction by completed deformation.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `HabiroRings.relativeHabiro` | H_{R/A} = lim_m H_{R/A,m} for R étale over a perfectly covered Λ-ring A. |
| `HabiroRings.relativeHabiro.proj` | The maps π_m: H_{R/A} → H_{R/A,m}, compatible with the transition maps. |
| `HabiroRings.relativeHabiro.ext` | Two elements with the same projections π_m for all m are equal. |
| `HabiroRings.relativeHabiro.lift` | A compatible family of A[q]-algebra maps B → H_{R/A,m}, factors uniquely through H_{R/A}; π_m ∘ lift is the m-th map. |
| `HabiroRings.relativeHabiro.factorialEquiv` | The limit over the chain {n!} is canonically isomorphic to H_{R/A}. |
| `HabiroRings.relativeHabiro.isStatic` | H_{R/A} is static. |
| `HabiroRings.relativeHabiro.isHabiroComplete` | H_{R/A} is Habiro-complete in the sense of B.1. |
| `HabiroRings.relativeHabiro.completionEquiv` | (H_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m} for every m. |
| `HabiroRings.relativeHabiro.cyclotomicCompletionEquiv` | (H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}; for d = 1 this is R[[q−1]]. |
| `HabiroRings.relativeHabiro.quotientEquiv` | H_{R/A}/(q^m−1) ≃ qW_m(R/A) (Theorem 2.9), under which the transition maps become the Frobenii F_{m/d} (Remark 2.10). |
| `HabiroRings.relativeHabiro.map` | The ring map H_{R/A} → H_{R'/A'} of a morphism of pairs, with map_id and map_comp. |
| `HabiroRings.CompatibleRoots` | A family (ζ_m)_{m ≥ 1} of primitive m-th roots of unity in ℂ with ζ_{mn} = ζ_mζ_n for coprime m, n and ζ_{p^α} = ζ_{p^{α+1}}^p. |
| `HabiroRings.CompatibleRoots.standard` | ζ_m := ∏_p e^{2πi/p^{v_p(m)}}. |
| `HabiroRings.coeffAlgebra` | (R ⊗_{A,ψ^m} A)[ζ_m] := (R ⊗_{A,ψ^m} A) ⊗_Z Z[ζ_m] ≅ (R ⊗_{A,ψ^m} A)[x]/Φ_m(x). |
| `HabiroRings.taylorFactor` | T_m := coeffAlgebra_m[[q − ζ_m]] and T_{p,m} := (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q − ζ_m]]. |
| `HabiroRings.canonicalMap` | can_{p,m}: T_m → T_{p,m}, extension of coefficients with the variable kept. |
| `HabiroRings.frobeniusMap` | φ_{p,m}: T_{pm} → T_{p,m}, φ_{p/A} ⊗ id on coefficients followed by rex_{ζ_m − ζ_{pm}}. |
| `HabiroRings.taylorComponent` | τ_m: (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} → T_m, q ↦ ζ_m + (q − ζ_m); its constant coefficient is evaluation at ζ_m. |
| `HabiroRings.CompatibleRoots.sub_topologicallyNilpotent` | ζ_m − ζ_{pm} is topologically nilpotent in the p-complete coefficient ring of T_{p,m}. |
| `HabiroRings.frobeniusMap_int` | For A = R = Z, φ_{p,m} is HC.3's rex_{ζ_m − ζ_{pm}} after extension of coefficients. |
| `HabiroRings.CompatibleRoots.galoisEquiv` | A change of compatible roots induces isomorphisms of the full coefficient and Taylor presentations intertwining can, φ and τ. Abstractly these are relabelings of the formal cyclotomic generator; the Galois action on a fixed realized coefficient algebra is not asserted to be trivial. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `HabiroRings.relativeHabiro_zero`: For R = 0, H_{0/A} = 0.
- `HabiroRings.relativeHabiro_self`: For R = A, H_{A/A} ≅ A[q]^N = lim_m A[q]^∧_{(q^m−1)}; for A = Z this is Habiro's ring H (HabiroRings:HR.5/untwisted-relative-habiro-rings). A definition that completed q-adically or (q−1)-adically, or twisted E_d without the linearisation, fails.
- `HabiroRings.relativeHabiro_quotient_Phi4_gaussian`: For A = Z and R = Z[i][1/2] (= O_F[1/disc F], F = Q(i)), H_{R/Z}/Φ_4(q) ≅ R[q]/(q²+1) ≅ R × R, because q² + 1 = (q − i)(q + i) and (q − i) − (q + i) = −2i is a unit; and H_{R/Z}/(q − 1) ≅ R. A definition adjoining ζ_4 through one embedding would give R instead of R × R.
- `HabiroRings.relativeHabiro_qMinusOne`: (H_{R/A})^∧_{(q−1)} ≅ R[[q−1]], compatibly with the projection to H_{R/A,1}.
- `HabiroRings.relativeHabiro_quotient_qWitt`: H_{R/A}/(q^m − 1) ≅ qW_m(R/A); for A = R = Z this is Z[q]/(q^m − 1), by qW_m(Z) ≅ Z[q]/(q^m − 1) (q-Witt v5 Corollary 2.37).
- `HabiroRings.relativeHabiro_not_localisation`: For A = R = Z, q − 1 is not a unit of H_{Z/Z}, since its image in (H_{Z/Z})^∧_{(q−1)} = Z[[q−1]] is not invertible; the construction completes and does not invert the q^m − 1.
- `HabiroRings.relativeHabiro_not_naive`: For R = Z[∛2][1/6], H_{R/Z,5} is not isomorphic to R[q]^∧_{(q^5−1)} as a Z[q]-algebra (HabiroRings:HR.7/the-stage-is-not-the-naive-completion).
- `HabiroRings.CompatibleRoots.standard_two_adic`: For the standard system ζ_6 = ζ_2ζ_3 = −ζ_3, so ζ_3 − ζ_6 = 2ζ_3 has positive 2-adic valuation, whereas e^{2πi/3} − e^{2πi/6} = −1 is a unit; with the traditional roots there is no 2-adic re-expansion from order 6 to order 3.
- `HabiroRings.taylorComponent_value_ne_expansion`: In H_{Z/Z}, f = 1 − q³ and 0 have the same value 0 at ζ_3, but τ_3(f) = −3ζ_3²X − 3ζ_3X² − X³ ≠ 0 with X = q − ζ_3; the value at one root does not determine the Taylor expansion there.
- `HabiroRings.coeffAlgebra_gaussian`: For A = Z, R = Z[i][1/2] and m = 4, coeffAlgebra_4 = R ⊗_Z Z[i] ≅ R × R; e = (1⊗1 − i⊗i)/2 is an idempotent sent to 1 by the embedding ζ_4 ↦ i and to 0 by ζ_4 ↦ −i, so choosing one embedding loses a factor.
- `HabiroRings.frobeniusMap_int_example`: For A = R = Z, p = 2, m = 1: φ_{2,1} sends q + 1 = q − ζ_2 ∈ Z[[q − ζ_2]] to (q − 1) + 2 ∈ Z_2[[q − 1]], and can_{2,1} is the inclusion Z[[q − 1]] ⊂ Z_2[[q − 1]].
- `HabiroRings.CompatibleRoots.galoisEquiv_neg_one`: For a = −1, σ_{−1} ∘ can = can ∘ σ_{−1}, σ_{−1} ∘ φ = φ ∘ σ_{−1}, and σ_{−1} ∘ τ_m for (ζ) is τ_m for (ζ^{−1}).
- `HabiroRings.rex_needs_completion`: The re-expansion of Σ_k (q − 1)^k at ζ_3 would have constant coefficient Σ_k (ζ_3 − 1)^k, which has no meaning in the discrete ring Z[ζ_3] and converges in Z_3[ζ_3] because (1 − ζ_3)² = −3ζ_3.

## Classical and number-field coefficient rings

The ring comparison needs unramified coefficients. The later K₃ line construction additionally needs 6 inverted.

<a id="hr-5-number-field-comparison-the-classical-ring"></a>

**The classical Habiro ring.** For A=R=ℤ with identity Adams operations, the relative ring is canonically Habiro's integral completion lim_n ℤ[q]/P_n. The comparisons identify its projections, q-factorial topology, root evaluations and Taylor maps with the established HC.1/HC.3 library. Its q−1 Taylor map is the classical injective map of HC.4.

The proof removes the identity twists and applies the existing completion universal property, rather than replanning the classical construction. This specialization provides the basic compatibility test for the relative formulas, including the p-adic re-expansion maps.

Prerequisites: [The Taylor equalizer](#hr-5-the-equaliser-presentation); [When the twists can be removed](#hr-5-untwisted-relative-habiro-rings); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; `HabiroCyclotomicCompletions:HC.3/the-taylor-map`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Remark 2.14, p.19; §1.1, Question 1.1, p.3.

<a id="hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale"></a>

**Unramified number-field coefficients.** For a number field F and a nonzero integer Δ divisible by disc(F), R=𝒪_F[1/Δ] is étale over ℤ. Use the finite free integral basis and the discriminant criterion to show that primes not dividing Δ are unramified, while at primes dividing Δ the localized algebra has no fiber. The localization and étale local criteria give the result.

Neither all primes nor a global Frobenius lift are claimed. The p-completion is zero for p∣Δ, and the nonzero completions at the other primes carry their canonical unramified Frobenius. Divisibility by 6 is unnecessary for this ring assertion; it enters with the line bundles.

Prerequisites: `mathlib:NumberField.RingOfIntegers`; `mathlib:NumberField.discr`; `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`; `mathlib:Algebra.formallyUnramified_iff_forall`; `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`; `mathlib:Algebra.Etale.of_formallyUnramified_of_flat`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Corollary 2.13, p.19, and the étale setup in 2.7, p.15.

<a id="hr-5-number-field-comparison-the-number-field-ring"></a>

**The GSWZ ring comparison.** For R=𝒪_F[1/Δ] as above and base ℤ, the relative Taylor equalizer identifies H_{R/ℤ} with the number-field ring H_R of GSWZ. The isomorphism κ respects each full cyclotomic coefficient algebra, root value, Taylor expansion and completed prime-edge Frobenius. At p∣Δ its p-completed terms vanish.

The comparison imports the actual HB.6 ring with its root and gluing maps. It is a ℤ[q]-algebra comparison, not an assumed R-algebra structure obtained by inserting all constants. Constants must themselves satisfy the Frobenius gluing condition, which usually fails. This distinction is essential for transporting modules and their scalar-extension maps in HR.6.

Prerequisites: [The Taylor equalizer](#hr-5-the-equaliser-presentation); [Compatible roots and the two Taylor maps](#hr-5-roots-choices-and-substitutions); [Unramified number-field coefficients](#hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale); [The classical Habiro ring](#hr-5-number-field-comparison-the-classical-ring); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); `HabiroNumberFields:HB.6/the-gluing-condition`; `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`; `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`; `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`; `HabiroNumberFields:HB.6`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Corollary 2.13, p.19; §1.1, paragraph 1.4, p.4.

## HR.6 — Habiro–Hodge coefficients and scalar extension

In the étale case the degree-zero coefficients of the Habiro–Hodge construction are the relative ring. Invertible modules can then be transported through the number-field comparison, with their actual tensor data.

<a id="hr-6-the-degree-zero-identification"></a>

**The étale Habiro–Hodge comparison.** For perfectly covered A and R étale over A, the Habiro–Hodge complex supplied by HQ is canonically equivalent to the static E∞ algebra H_{R/A}. With the empty étale framing, its q-Hodge filtration is the (q−1)-adic filtration. The equivalence is natural in pairs and respects the cyclotomic quotient and completion comparisons.

At every qᵐ−1 quotient use the derived q-de Rham–Witt comparison for smooth algebras; in relative dimension zero its forms reduce to q-W_m(R/A). The unique complete étale deformation identifies that stage with H_{R/A,m}, and the limit gives the stated equivalence. Q, Corollary 3.13 uses Corollary 3.31 and Theorem 3.11(a), so HQ.4's derived smooth-form node is the precise supplier. The canonical filtration is supplied by HQ.5.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift); `HabiroCohomologyFoundations:HQ.3/habiro-descent`; `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`; `HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades`; `HabiroCohomologyFoundations:HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras`; `HabiroCohomologyFoundations:HQ.4/etale-base-change-and-the-sheaf-property`; `HabiroCohomologyFoundations:HQ.5`; `mathlib:Algebra.FormallyEtale.iff_comp_bijective`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §3, Corollary 3.13, preceding paragraph and proof, p.27; §1.1, paragraph 1.4, p.4.

<a id="hr-6-completed-scalar-extension"></a>

**Scalar extension of complete modules.** For a morphism of pairs inducing f:H→H′, define f^*M=L_H(M⊗_H^L H′). It is left adjoint to restriction on complete modules. The adjunction and monoidal localization give coherent identity, composition, tensor and unit maps. On perfect modules the ordinary derived tensor is already complete; in particular an invertible H-module pulls back by the usual tensor product and gives the ordinary Picard map.

An arbitrary infinite direct sum can fail to be complete, so the formula cannot omit completion on all modules. HR.5's coefficient base-change theorem applies only to the specified base-change pair; the present module functor applies to any actual morphism of pairs.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [Complete objects and completion](#hr-2-habiro-complete-modules); [The completed tensor product](#hr-2-the-monoidal-structure); [The category of relative inputs](#hr-1-morphisms-of-pairs); [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift).

Source: [Q](https://arxiv.org/pdf/2510.04782v2), Appendix B, B.1, p.77; application of monoidal completion.

<a id="hr-6-the-transported-regulator"></a>

**Transporting the K₃ line bundles.** Let F be a number field, choose positive Δ divisible by 6·|disc(F)|, put R=𝒪_F[1/Δ], and let κ:H_{R/ℤ}≃H_R be the Taylor-compatible comparison. Under HB.7's effective global descent and tensor-bijectivity hypotheses, define M_ξ=κ^*H_{R,ξ} for ξ∈K₃(F). The imported inverse pairing and multiplication equivalences give M₀≃H and M_ξ⊗_H M_η≃M_{ξ+η}; hence ρ_F:K₃(F)→Pic(H), ξ↦[M_ξ], is a group homomorphism.

These are actual invertible modules and actual pairing maps. Local p-adic freeness, a symbol for an unspecified line, or a homomorphism between unnamed groups would not supply this construction. No global freeness or existence of a nonzero Picard class follows from it.

Prerequisites: [The GSWZ ring comparison](#hr-5-number-field-comparison-the-number-field-ring); [Scalar extension of complete modules](#hr-6-completed-scalar-extension); `HabiroNumberFields:HB.7/the-global-module`; `HabiroNumberFields:HB.7/operations-on-the-modules`; `HabiroNumberFields:HB.7`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.1, paragraph 1.4, p.4; [G](https://arxiv.org/pdf/2412.04241v2), §1.5, Theorem 2, p.10; §3.3, proof, p.43.

<a id="hr-6-the-q-minus-one-completion-is-not-injective"></a>

**The q−1 completion map.** The first finite-stage projection gives c:H_{R/A}→R[[X]], X=q−1, compatibly with completion and maps of pairs. In the classical integral case HC.4 supplies injectivity. For R=ℤ[1/p], the ring splits into nonzero factors S_a indexed by p-adic valuation of root orders. The map c is injective on the a=0 factor and kills every factor a≥1.

Thus c has nonzero kernel after inverting a prime: the idempotent supported on an a≥1 factor is killed. This is a ring-level obstruction to extending classical Taylor injectivity to all relative coefficients. It says nothing about whether a particular transported K₃ class is nonzero.

Prerequisites: [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [When the twists can be removed](#hr-5-untwisted-relative-habiro-rings); `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`; `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`; `HabiroCyclotomicCompletions:HC.5`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.1, paragraph 1.4, p.4; §2.2, proof of Lemma 2.12, p.18; localization example above.

<a id="hr-6-order-one-fibre"></a>

**Trivializing the order-one fiber.** Under the HB.7 descent and tensor hypotheses, let v=constantCoeff∘c:H→R. The evaluation of a transported section at the order-one root defines an R-linear map e_ξ:R⊗_{H,v}M_ξ→R, r⊗f↦r f₁(0). The order-one Kummer torsor is canonically trivial, so this value needs no root choice. The actual inverse-tensor certificate supplied by HB.7 gives a preimage of 1.

The source is invertible over R, so the surjective map e_ξ is bijective; its resulting linear equivalence is uniquely determined by the evaluation map. This trivializes the fiber at q=1. It does not trivialize M_ξ over H. There is no assumed R→H coefficient map: the scalar structure in this tensor product is v:H→R.

Prerequisites: [Transporting the K₃ line bundles](#hr-6-the-transported-regulator); [The q−1 completion map](#hr-6-the-q-minus-one-completion-is-not-injective); [The GSWZ ring comparison](#hr-5-number-field-comparison-the-number-field-ring); `HabiroNumberFields:HB.7/followup-effective-global-descent`; `HabiroNumberFields:HB.7/followup-tensor-bijectivity`; `HabiroNumberFields:HB.7`; `mathlib:Module.Invertible`; `mathlib:Module.Invertible.bijective_of_surjective`; `mathlib:PowerSeries.constantCoeff`; `mathlib:TensorProduct.lid`.

Source: [G](https://arxiv.org/pdf/2412.04241v2), Definition 1.4, printed p.10; Proposition 1.5(f), printed p.11; [G](https://arxiv.org/pdf/2412.04241v2), Theorem 2, (25), printed p.10; its proof in §3.3, printed p.43.

<a id="hr-6-completed-regulator-triviality"></a>

**From the first fiber to the completed line.** For any commutative R, an invertible module P over B=R[[X]] with a specified equivalence P/XP≃R is free of rank one. Lift a generator and use X∈Jac(B) and Nakayama to obtain a surjection B→P; invertibility makes it an isomorphism. Finite projectivity ensures that completed base change of the transported line has the requisite reduction and remains invertible.

Apply this to P=B⊗_H M_ξ, using the order-one equivalence and the tensor base-change identifications. The full basis is not canonical: another lift changes it by a unit in 1+XB. R need not be a local ring. The supplier's integral constant evaluation suffices; one must not assume every higher Taylor coefficient of a line section is integral.

Prerequisites: [Trivializing the order-one fiber](#hr-6-order-one-fibre); [Scalar extension of complete modules](#hr-6-completed-scalar-extension); `HabiroNumberFields:HB.7/followup-picard-character`; `mathlib:Module.Invertible`; `mathlib:Module.Invertible.bijective_of_surjective`; `mathlib:Module.Invertible.free_iff_linearEquiv`; `mathlib:CommRing.Pic.mk`; `mathlib:CommRing.Pic.mk_eq_one_iff`; `mathlib:CommRing.Pic.mapRingHom`; `mathlib:PowerSeries.constantCoeff_surj`; `mathlib:PowerSeries.X_dvd_iff`; `mathlib:PowerSeries.isUnit_iff_constantCoeff`; `mathlib:Ideal.mem_jacobson_iff`; `mathlib:Submodule.mkQ_surjective`; `mathlib:LinearMap.toSpanSingleton`; `mathlib:LinearMap.surjective_of_surjective_comp_mkQ`; `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`; `mathlib:TensorProduct.quotTensorEquivQuotSMul`; `mathlib:RingHom.quotientKerEquivOfSurjective`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.1, paragraph 1.4, printed p.4; [G](https://arxiv.org/pdf/2412.04241v2), Proposition 1.5(f), printed p.11; §3.3, printed p.45.

<a id="hr-6-the-regulator-dies-after-q-minus-one-completion"></a>

**Vanishing of the completed Picard class.** Under the same number-field global descent and integral linear-jet hypotheses, Pic(c)(ρ_F(ξ))=0 in Pic(R[[X]]) for every ξ∈K₃(F). The completed line is B⊗_H M_ξ, and the preceding fiber and Nakayama argument supplies an actual free rank-one B-module. Its inverse pairing and all tensor identifications are transported from HB.7.

The result is conditional on that supplier's global line construction. It does not follow from local rank one alone or from the printed p-adic section definition without its corrected integral condition. Nor does it assert that ρ_F is nonzero before completion. The geometric completion theorem for invertible modules supplies the final deduction once the actual integral fiber is known.

Prerequisites: [Transporting the K₃ line bundles](#hr-6-the-transported-regulator); [The q−1 completion map](#hr-6-the-q-minus-one-completion-is-not-injective); `HabiroNumberFields:HB.7/the-global-module`; `HabiroNumberFields:HB.7/invertible-local-sections`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §1.1, paragraph 1.4, p.4; [G](https://arxiv.org/pdf/2412.04241v2), §1.5, Proposition 1.5(f), p.11; §3.3, p.45; with the stated integral descent hypothesis.

<a id="hr-6-regulator-scalar-square"></a>

**Supported field scalar comparison.** For a number-field embedding F→E, choose one positive Δ divisible by both 6·|disc(F)| and 6·|disc(E)|, and put R=𝒪_F[1/Δ], S=𝒪_E[1/Δ]. Assuming HB.7's effective descent and arithmetic naturality, its actual module equivalence transports to H_{S/ℤ}⊗_{H_{R/ℤ}}M_ξ≃M_{res ξ}. Hence Pic(H_Rel→H′_Rel)(ρ_F(ξ))=ρ_E(res ξ).

The κ comparisons commute with Taylor expansion, the coefficient map R→S, and order-one evaluation. They therefore give commuting first-fiber and completed Picard squares. Identity and successive embeddings obey the tensor unit and associator coherences. The input is the HB.7 equivalence over the Habiro rings, not a tensor over R, since H need not be an R-algebra. This is the supported field pullback; no trace or arbitrary coefficient-change formula is asserted.

Prerequisites: [Transporting the K₃ line bundles](#hr-6-the-transported-regulator); [Scalar extension of complete modules](#hr-6-completed-scalar-extension); [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [The GSWZ ring comparison](#hr-5-number-field-comparison-the-number-field-ring); `HabiroNumberFields:HB.7/followup-field-pullback`; `HabiroNumberFields:HB.7/followup-scalar-equivalence`; `HabiroNumberFields:HB.7/followup-picard-character`; [Trivializing the order-one fiber](#hr-6-order-one-fibre); [From the first fiber to the completed line](#hr-6-completed-regulator-triviality); `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`; `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`; `mathlib:CommRing.Pic.mk_eq_mk_iff`; `mathlib:CommRing.Pic.mapRingHom_comp_mapRingHom`; `mathlib:CommRing.Pic.mapRingHom_id`.

Source: [G](https://arxiv.org/pdf/2412.04241v2), Definition 1.1, (13), printed pp.6–7; Definition 1.4, printed pp.9–10; [Q](https://arxiv.org/pdf/2510.04782v2), Corollary 2.13, printed p.19, and proof.

### API

The hypotheses of each construction above apply to its API. Conditional spectral and arithmetic comparisons retain their stated supplier hypotheses.

| Declaration | Required interface |
| --- | --- |
| `HabiroRings.completedScalarExtension` | f^*M = (M ⊗^L_{H_{R/A}} H_{R'/A'})^∧_H. |
| `HabiroRings.completedScalarExtension.adjunction` | f^* is left adjoint to restriction of scalars D̂_H(H_{R'/A'}) → D̂_H(H_{R/A}). |
| `HabiroRings.completedScalarExtension.monoidal` | f^*(M ⊗̂^L N) ≃ f^*M ⊗̂^L f^*N and f^*H_{R/A} ≃ H_{R'/A'}. |
| `HabiroRings.completedScalarExtension.map_id` | id^* ≃ id. |
| `HabiroRings.completedScalarExtension.map_comp` | (g ∘ f)^* ≃ g^* ∘ f^*. |
| `HabiroRings.completedScalarExtension.perfect` | On perfect complexes f^* ≃ − ⊗^L_{H_{R/A}} H_{R'/A'}, uncompleted. |
| `HabiroRings.completedScalarExtension.quotient` | f^*(H_{R/A}/(q^m − 1)) ≃ H_{R'/A'}/(q^m − 1). |
| `HabiroRings.picMap` | Pic(H_{R/A}) → Pic(H_{R'/A'}), [L] ↦ [L ⊗_{H_{R/A}} H_{R'/A'}]. |
| `HabiroRings.picMap_eq` | picMap agrees with f^* on invertible objects under the fully faithful inclusion of Pic(H_{R/A}) into the invertible objects of D̂_H(H_{R/A}). |
| `OrderOneFibre.map_eq_eval` | For every x in R⊗_H M, t(x)=e(x). |
| `OrderOneFibre.inverse_one` | e(t^{-1}(1))=1. |
| `OrderOneFibre.coordinates` | For every x in the fibre, e(x)·t^{-1}(1)=x. |
| `OrderOneFibre.unique` | Any R-linear equivalence with underlying evaluation e equals t. |
| `OrderOneFibre.rescale` | If evaluation is multiplied by a unit u of R, its normalized fibre equivalence is u times t. |
| `OrderOneFibre.naturality` | For a ring homomorphism f:R→S and an f-semilinear map u between the actual fibres, if e′(u(x))=f(e(x)) for every x, then t′(u(x))=f(t(x)). This preserves the normalization under HB.7 supported field pullback; it does not assert existence of u or arithmetic naturality. |

### Examples and unit specifications

Each specification fixes a convention, a universal property or a hypothesis that the construction must preserve.

- `HabiroRings.completedScalarExtension_id`: For f = id, f^* ≃ id and picMap = id.
- `HabiroRings.completedScalarExtension_quotient_example`: For f: (Z, Z) → (Z, Z[1/2]), f^*(H_{Z/Z}/(q² − 1)) ≃ H_{Z[1/2]/Z}/(q² − 1) ≅ Z[1/2][q]/(q² − 1) ≅ Z[1/2] × Z[1/2], since (q − 1) − (q + 1) = −2 is a unit.
- `HabiroRings.directSum_not_habiroComplete`: ⊕_{n≥0} H_{Z/Z} is not Habiro-complete: Σ_n (q;q)_n e_n converges in its Habiro completion but has infinitely many non-zero coordinates; so f^* and colimits must be completed.
- `HabiroRings.completedScalarExtension_free`: For M = H_{R/A}^n, f^*M ≃ H_{R'/A'}^n, without completion.
- `HabiroRings.completedScalarExtension_adjunction_unit`: For Habiro-complete N over H_{R'/A'}, maps f^*H_{R/A} → N correspond to maps H_{R/A} → N of H_{R/A}-modules, i.e. to the underlying object of N.
- `OrderOneFibreTests.identity`: For H=R, M=R and e the Mathlib tensor-unit map, t(1⊗r)=r for every r. In the actual regulator application this is ξ=0.
- `OrderOneFibreTests.negativeUnit`: For H=R=Z and e the negative tensor-unit map, t(1⊗3)=−3. A construction ignoring the evaluation normalization fails.
- `OrderOneFibreTests.inverseGenerator`: For any fibre/e/preimage of 1 and any r, t(r·t^{-1}(1))=r. This is a statement about the base-changed fibre only.
- `OrderOneFibreTests.zeroEvaluation`: For H=R=M=Z, the zero evaluator on Z⊗_Z Z has no preimage of 1 and cannot be used to construct t.

## HR.7 — Examples that distinguish the arithmetic construction

These computations test the coefficient algebra, the gluing law and the finite-stage polynomial structure. They also identify the limits of otherwise familiar classical statements.

<a id="hr-7-phi-five-over-f-eleven"></a>

**All four factors of Φ₅ modulo 11.** Compute Φ₅(q)=q⁴+q³+q²+q+1=(q−3)(q−4)(q−5)(q−9) in 𝔽₁₁[q]. The four roots are distinct, so the Chinese remainder map gives 𝔽₁₁[q]/Φ₅≃𝔽₁₁⁴. Hensel lifting produces the corresponding four ℤ₁₁ factors and hence four Taylor-series factors; at precision 11⁴ the roots lifting 3,4,5,9 are 2786,7825,1963,2066.

This repairs the finite-field irreducibility assertion in the proof of Q, Lemma 2.12 without changing its full-algebra comparison. Mathlib's polynomial evaluation and CRT supply the abstract factorization, while Tau Ceti's conjugate residue map and its lift give an independent all-conjugates interface. Keeping a single root would lose three factors.

Prerequisites: [Prime-adic and rational Taylor comparison](#hr-5-the-ell-adic-taylor-comparison); `mathlib:Polynomial.cyclotomic`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:PadicInt`; `tauceti:TauCeti.Cyclotomic.conjugateResiduesRingHom`; `tauceti:TauCeti.Cyclotomic.conjugateResidues_lift`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, proof of Lemma 2.12, p.18; explicit splitting calculation above.

<a id="hr-7-inverting-a-prime"></a>

**The components after inverting p.** For R=ℤ[1/p] with identity Adams operations, prime-edge conditions at p vanish and the Taylor equalizer splits as ∏_{a≥0}S_a, with root orders having v_p(m)=a in S_a. Each factor is nonzero. The first Taylor map c at q=1 uses only S₀, is injective on that factor by the existing classical root-connectivity argument, and kills the other factors.

This ring has nontrivial idempotents and is not a domain. It also shows why a Taylor map at one root need not detect the entire relative ring. The admissible coefficient ring is ℤ[1/p], which is étale over ℤ; ℤ_(p) is a different localization and is not the finite-presentation étale input in this example.

Prerequisites: [When the twists can be removed](#hr-5-untwisted-relative-habiro-rings); `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`; `mathlib:Algebra.Etale`; `HabiroCyclotomicCompletions:HC.5`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, 2.7 and Remark 2.8, pp.15–16; specialization of the Taylor equalizer.

<a id="hr-7-constant-families-do-not-glue"></a>

**Constants over the localized cubic ring.** Take F=ℚ(∛2), whose integers are ℤ[∛2] and whose discriminant is −108; put R=ℤ[∛2][1/6]. It is étale over ℤ. In the Taylor presentation a constant family r belongs to H_{R/ℤ} exactly when every completed Frobenius φ_p, p∤6, fixes its image. There is generally no map inserting all of R as constants.

At p=5, x³−2=(x−3)(x²+3x+4) modulo 5, and the quadratic factor is irreducible. Thus R̂₅ is ℤ₅ times an unramified quadratic extension, where Frobenius moves the quadratic component of ∛2. The element ∛2 therefore fails the gluing test. Every global endomorphism of R fixes the cubic generator, so it cannot recover this completed map.

Prerequisites: [The Taylor equalizer](#hr-5-the-equaliser-presentation); [Unramified number-field coefficients](#hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale); [Completed étale Frobenius](#hr-1-the-etale-frobenius-lift); `mathlib:PadicInt`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Remark 2.8 and 2.11, pp.16–17; explicit cubic calculation above.

<a id="hr-7-the-stage-is-not-the-naive-completion"></a>

**The finite-stage obstruction.** For the same R and any m divisible by 5, H_{R/ℤ,m} is not isomorphic to R[q]̂_{qᵐ−1} as a ℤ[q]-algebra. Such an isomorphism would reduce to a naive q-Witt quotient comparison and, by W, Corollary 2.52 and the injection R→R̂₅, force a global Frobenius lift at 5. The preceding endomorphism calculation rules this out.

The nonisomorphism is tied to the marked polynomial variable q. It does not claim that no abstract unmarked ring isomorphism can exist. This example verifies both the necessity of the Adams twists in finite gluing and the distinction between Frobenius transitions and ordinary Witt restriction.

Prerequisites: [Naive quotients force global Frobenius](#hr-4-an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift); [The relative Habiro ring](#hr-5-the-relative-habiro-ring); [Constants over the localized cubic ring](#hr-7-constant-families-do-not-glue); [Unramified number-field coefficients](#hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale); [The finite-stage Habiro–q-Witt theorem](#hr-4-the-etale-lift); [Relative q-Witt vectors](#hr-4-relative-q-witt-rings); `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`.

Source: [Q](https://arxiv.org/pdf/2510.04782v2), §2.2, Remark 2.8, p.16; [W](https://arxiv.org/pdf/2410.23078v5), §2.6, Corollary 2.52 and preceding discussion, pp.34–35.

## Sources

The main locators refer to the fixed versions linked here. Q, W, H, B, G and Bosco use PDF page numbers, which agree with their printed page numbers at the cited passages. The thesis T has four preliminary PDF pages: printed p.86 is PDF p.90. Higher Topos Theory has eighteen preliminary PDF pages; the displayed HTT locators give both numbers. Stacks locators use the numbered web sections and stable tags.

- **Q — Ferdinand Wagner, _q-Hodge complexes over the Habiro ring_, arXiv:2510.04782v2.** [Full text](https://arxiv.org/pdf/2510.04782v2). The relative arithmetic construction uses §§2.1–2.2, pp.13–19; the degree-zero comparison uses Corollary 3.13, p.27; completion uses Appendix B, pp.77–80. The two-term resolution, finite-field splitting and étale hypotheses are stated in the corrected mathematical forms specified above.
- **W — Ferdinand Wagner, _q-Witt vectors and q-Hodge complexes_, arXiv:2410.23078v5.** [Full text](https://arxiv.org/pdf/2410.23078v5). Degree-zero q-Witt operations and the Λ/relative comparisons occur in §§2.1–2.6, pp.8–35. The Frobenius target in Proposition 2.48 is W_d, as dictated by its index and pushout proof.
- **H — Lars Hesselholt, _The big de Rham–Witt complex_, arXiv:1006.3125v3.** [Full text](https://arxiv.org/pdf/1006.3125v3). Dwork's criterion, integral Frobenius polynomials, generating series and the Witt comonad are in §1, pp.6–19; the cofree adjunction is in §2, p.24. Only the foundational Witt and Λ interfaces needed here are used.
- **B — James Borger, _The basic geometry of Witt vectors, I: The affine case_, arXiv:0801.1691v6.** [Full text](https://arxiv.org/pdf/0801.1691v6). The torsion-free Adams comparison and free arithmetic Λ-ring are in §1, especially 1.17–1.18, pp.12–13.
- **G — Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, _The Habiro ring of a number field_, arXiv:2412.04241v2.** [Full text](https://arxiv.org/pdf/2412.04241v2). The ring is Definition 1.1, pp.6–7; the global line is Definition 1.4, p.10; tensor multiplication is Theorem 2, p.10, with proof in §3.3, p.43. Proposition 1.5(f), p.11, and §3.3, p.45, motivate the first-fiber comparison. The actual integral global lines and supported arithmetic maps are imported from HB.7 with its stated hypotheses.
- **Bosco — Guido Bosco, _Rational p-adic Hodge theory for rigid-analytic varieties_, arXiv:2306.06100v1.** [Full text](https://arxiv.org/pdf/2306.06100v1). Proposition A.3 and Lemma A.4, pp.92–93, supply the written abelian p-adic model for the null-family and boundedness arguments. They do not prove the general light solid spectral contract.
- **T — Ferdinand Wagner, _q-Hodge filtrations, Habiro cohomology, and ku_, thesis, 15 August 2025.** [Full text](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf). §§5.1–5.3, printed pp.85–86 (PDF pp.89–90), describe light solid spectra and their countable-product compact generator.
- **HA — Jacob Lurie, _Higher Algebra_, 18 September 2017.** [Full text](https://www.math.ias.edu/~lurie/papers/HA.pdf). Proposition 2.2.1.9, p.197, supplies symmetric monoidal localization; Corollaries 3.2.2.4–3.2.2.5, pp.358–359, compute limits of algebra objects; Theorem 7.1.2.13, p.1212, supplies the symmetric monoidal Eilenberg–Mac Lane derived-module comparison.
- **HTT — Jacob Lurie, _Higher Topos Theory_, 9 April 2017 edition.** [Full text](https://www.math.ias.edu/~lurie/papers/HTT.pdf). Theorem 3.2.0.1, printed pp.169–170 (PDF pp.187–188), supplies straightening; §5.4.7, printed pp.449–452 (PDF pp.467–470), supplies the accessible-category limits and adjoint accessibility used by the enhanced categorical owner.
- **Stacks Project.** [Lemma 10.143.10, Tag 04D1](https://stacks.math.columbia.edu/tag/04D1), in §10.143, supplies étale object lifting for arbitrary quotient ideals. [Lemma 15.11.2, Tag 0ALI](https://stacks.math.columbia.edu/tag/0ALI), in §15.11, supplies nilpotent invariance and full faithfulness. They are used separately before passing to completed marked deformations.
