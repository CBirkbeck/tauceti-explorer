# Habiro rings, HR.1: relative bases and local Frobenius

This document is the HR.1 supplement to the accepted blueprint `BP-HabiroRings`. The parent develops the torsion-free Adams description of Λ-rings, perfectly covered bases, colimit perfection, the category of étale pairs, relative Frobenius, and its unique lift on p-completions. This supplement supplies the two inputs the parent explicitly left open: the comparison with big Witt coalgebras, and the construction and perfect covering of free Λ-rings. It preserves every accepted node identifier and imports their interfaces. Every declaration here is a plan, with implementation status unchecked.

The distinguishing requirement is integrality. Rational ghost coordinates make many formulas transparent, but they do not define an integral Λ-ring, a free Λ-ring, or a faithfully flat Adams map. The proof graph keeps the two prime congruences distinct, constructs sections using Dwork’s integral criterion, and proves flatness by explicit localized module presentations. Its primary coalgebra and free-ring constructions allow torsion in coefficient rings. Only the equivalence with Adams data requires additive torsion-freeness.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-17 result marks HR.1 not built. The pinned source searches confirm that Mathlib’s Witt vectors are p-typical, while the all-prime big Witt functor, Λ-coalgebras, Wilkerson comparison and free Λ-rings are absent. This document uses Mathlib polynomial rings, evaluation, additive torsion-freeness, bases, localization and faithful flatness. It does not recreate those library notions. The source statements behind every cited baseline declaration were read at the pin.

## Ownership, scope, and conventions

Throughout, a ring is a commutative unital ring, with the zero ring permitted. Positive indices m,n,d belong to the positive integers. A prime p is an ordinary positive rational prime. Additive torsion-freeness means that multiplication by every nonzero natural number is injective; over the integers it is also flatness. Congruence modulo p means that the difference belongs to the ideal pA. Adams operations are indexed multiplicatively: ψ¹ is the identity and ψ^(mn)=ψ^m∘ψ^n. They fix integer scalars. The Frobenius condition is ψ^p(a)≡aᵖ mod p, as corrected in the accepted parent.

The full big Witt ring W(A) means W_S(A) for S all positive integers. Its coordinates c_n are indexed starting at 1, and its ghosts are gh_n(c)=Σ_(d|n)d c_d^(n/d). The imported HR.4 node `HabiroRings:HR.4/truncated-big-witt-vectors` already covers arbitrary truncation sets, including this S. The carrier, integral ring operations, functor, restrictions, Teichmüller maps, finite Frobenius and Verschiebung, ghost injectivity and p-typical comparison are retained there. The universal-polynomial node here refines that interface to full Frobenius F_m and exposes the precise triangular and congruence properties needed for HR.1. It is not another construction of W_S.

The prime congruence f_(p,n)≡c_nᵖ is a congruence of universal coordinate polynomials. The stronger congruence F_p(a)≡aᵖ mod pW(A) uses the Witt ring multiplication and the Witt ideal pW(A). They are both true, but one must not silently infer the second by reducing coordinates in A. The comultiplication proof needs the second; the free Adams basis proof needs the first.

The structure map of a Λ-coalgebra is written s:A→W(A). Its coordinates c_d(a), denoted δ_d(a) by Wagner, are generally neither additive nor multiplicative. They are not exterior λ^d(a). Exterior operations are defined by the signed generating series below. For a prime p on a torsion-free Adams ring, c_p(a) is the p-derivation (ψ^p(a)−aᵖ)/p, and the general δ-ring dictionary is imported from `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

The accepted RS-10 round-two ownership decision is binding. While the proposed QWittVectors roadmap is uninstalled, HabiroRings HR.1 remains the interim owner of Λ/Adams/perfect-covering interfaces, and HR.4 of big and q-Witt vectors. QW.1 and QW.2 are transfer destinations, not parallel prerequisite nodes. Installation must transfer these interfaces atomically with their consumers. The present supplement creates no second owner. HR.1 retains the completed étale Frobenius-lift construction, and HR.4 retains its Habiro-specific applications.

## Retained HR.1 targets

The following six targets retain their accepted parent statements, construction routes, APIs and unit tests. Their detailed interfaces are reproduced to make this stage readable by itself. The packet imports them rather than copying their nodes. The two gaps mentioned by their accepted notes are supplied by the new declarations in the next section.

### Torsion-free Λ-rings: Adams operations with the Frobenius congruence ψ^p(x) ≡ x^p

Imported node: `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`.

A Λ-ring, in the torsion-free form the stage text asks for, is a commutative ring A that is torsion free as an abelian group together with ring endomorphisms ψ^m : A → A for every integer m ≥ 1 (the Adams operations) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n for all m, n ≥ 1 (so the ψ^m commute), and, for every prime p and every x ∈ A, ψ^p(x) ≡ x^p modulo pA (the Frobenius congruence; NOT ψ^p(x) ≡ x). A morphism of Λ-rings is a ring map commuting with every ψ^m; this is the category of Λ-rings. Since A is torsion free, δ_p(x) := (ψ^p(x) − x^p)/p is well defined and is a p-derivation, so A is a δ-ring at every prime with Frobenius ψ^p (the δ-ring interface of PrismaticCohomology PR.0). A Λ-ring is perfect when every ψ^p (equivalently every ψ^m) is bijective. Standing examples: ℤ and ℚ with every ψ^m the identity (ℚ is perfect); the polynomial ring ℤ[x_i | i ∈ I] with the toric structure ψ^m(x_i) = x_i^m, i.e. ψ^m = expand m, which is the source's toric Λ-structure 'λ^n(x_i) = 0 for all n > 1'. In the sources a Λ-ring is a coalgebra for the big Witt vectors, with structure map s : A → W(A) and ψ^m(x) = Σ_{d|m} d·δ_d(x)^{m/d} = gh_m(s(x)) (q-Witt 2.31); for torsion-free A the ψ^m determine s, and the Wilkerson comparison below supplies that identification. 'Λ-ring' means the arithmetic λ-ring, not an Iwasawa algebra.

Hypotheses: A is commutative and torsion free (nx = 0 with n ≥ 1 forces x = 0). This is the stage text's standing hypothesis; every perfectly covered Λ-ring of the source is p-torsion free for every p (Wagner 2.7), so the restriction loses nothing for this roadmap.; The Frobenius congruence is ψ^p(x) − x^p ∈ pA. The packet's former form 'ψ^p is the identity modulo p' is false for the toric structure (ψ^p(x) − x = x^p − x ∉ pℤ[x]).; Commutation ψ^m ∘ ψ^n = ψ^n ∘ ψ^m follows from ψ^(mn) = ψ^m ∘ ψ^n and is not a separate axiom.; Free Λ-rings ℤ{x_i} are constructed below in Witt coordinates, with a triangular change to exterior generators and the torsion-free Wilkerson comparison..

Construction and proof route:

1. Define the structure (ψ^m)_{m ≥ 1} with ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and the Frobenius congruence at every prime; derive commutation from mn = nm.
2. Define morphisms as ring maps commuting with every ψ^m, with identities and composition: the category of Λ-rings.
3. Construct δ_p(x) = (ψ^p(x) − x^p)/p using torsion freeness; the δ-ring identities for δ_p follow from ψ^p being a ring map (the PR.0 correspondence between Frobenius lifts and δ-structures on p-torsion-free rings).
4. Construct the trivial structures on ℤ (Fermat: n^p ≡ n mod p) and on ℚ (pℚ = ℚ), and the toric structure on MvPolynomial I ℤ with ψ^m = expand m: expand (mn) = expand m ∘ expand n, and expand p f ≡ f^p modulo p because f ↦ f^p is additive modulo p and fixes integer coefficients modulo p.
5. Define perfectness as bijectivity of every ψ^p.

Retained API:

- `LambdaRing` (structure): A torsion-free commutative ring with ring endomorphisms ψ^m (m ≥ 1) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and ψ^p(x) − x^p ∈ p·A for every prime p.
- `LambdaRing.adams` (projection): The Adams operation ψ^m as a ring endomorphism.
- `LambdaRing.adams_one` (simp): ψ^1 = id.
- `LambdaRing.adams_mul` (relation): ψ^(mn) = ψ^m ∘ ψ^n.
- `LambdaRing.adams_comm` (relation): ψ^m ∘ ψ^n = ψ^n ∘ ψ^m, derived from adams_mul.
- `LambdaRing.adams_prime_sub_pow_mem` (relation): For p prime and x ∈ A, ψ^p(x) − x^p ∈ p·A (the Frobenius congruence; replaces the former frobCongruence).
- `LambdaRing.Hom` (structure): Ring maps f with f ∘ ψ^m = ψ^m ∘ f for all m, with Hom.id and Hom.comp; the category LambdaRingCat.
- `LambdaRing.delta` (data): δ_p(x) = (ψ^p(x) − x^p)/p, well defined by torsion freeness.
- `LambdaRing.toDeltaRing` (compatibility): δ_p is a p-derivation, so A is a δ-ring at p with Frobenius ψ^p in the sense of PrismaticCohomology PR.0, and Λ-maps are δ-maps.
- `LambdaRing.IsPerfect` (data): Every ψ^p is bijective (equivalently every ψ^m).
- `LambdaRing.trivialInt` (example): ℤ (and ℚ) with ψ^m = id; ℚ is perfect.
- `LambdaRing.toric` (example): MvPolynomial I ℤ with ψ^m = MvPolynomial.expand m, so ψ^m(x_i) = x_i^m.
- `LambdaRing.toBigWitt` (compatibility): The structure map s : A → W(A) to the big Witt vectors with gh_m ∘ s = ψ^m (q-Witt 2.31); uses the imported HR.4 big Witt functor and the Wilkerson comparison supplied below.

Retained unit tests:

- `LambdaRing.toric_adams_computation` (computation): In ℤ[x] with the toric structure, ψ^2(x^2 + 3x) = x^4 + 3x^2 and ψ^2(ψ^3(x)) = ψ^3(ψ^2(x)) = ψ^6(x) = x^6.
- `LambdaRing.toric_congruence` (non-example): In toric ℤ[x], ψ^p(x) − x^p = 0 ∈ pℤ[x], whereas ψ^p(x) − x = x^p − x ∉ pℤ[x] (its coefficient of x is −1): a definition with the congruence 'ψ^p ≡ id mod p' would exclude the toric example.
- `LambdaRing.not_trivial_on_polynomials` (non-example): The identity operations on ℤ[x] are not a Λ-structure: ψ^2(x) − x^2 = x − x^2 ∉ 2ℤ[x]. A definition omitting the congruence would accept it.
- `LambdaRing.int_delta` (degenerate): ℤ with ψ^m = id is a Λ-ring (n^p ≡ n mod p) and δ_2(3) = (3 − 9)/2 = −3.
- `LambdaRing.rat_isPerfect` (degenerate): ℚ with ψ^m = id is a perfect Λ-ring; the congruence is vacuous because pℚ = ℚ.
- `LambdaRing.toric_toDeltaRing` (compatibility): For toric ℤ[x], δ_p(x) = (x^p − x^p)/p = 0, so the PR.0 δ-structure is the one with Frobenius x ↦ x^p.

Prerequisites: `PrismaticCohomology:PR.0`, `mathlib:IsAddTorsionFree`, `mathlib:MvPolynomial.expand`, `mathlib:Polynomial.expand`, `mathlib:Polynomial.expand_mul`.

### Perfectly covered Λ-rings, in three equivalent descriptions

Imported node: `HabiroRings:HR.1/perfectly-covered`.

A Λ-ring A is perfectly covered when there is a faithfully flat Λ-map A → A_∞ into a perfect Λ-ring (Wagner 1.22(e)). The following are equivalent: (i) some faithfully flat Λ-map from A into a perfect Λ-ring exists; (ii) every Adams operation ψ^m : A → A is faithfully flat, i.e. A is faithfully flat as a module over itself through ψ^m; (iii) the canonical map A → A_∞ into the colimit perfection is faithfully flat (the q-Witt paper's definition, Remark 2.47). Examples: ℤ; every perfect Λ-ring; the toric polynomial rings ℤ[x_i | i ∈ I]; the free-Λ-ring example is proved by the localized presentations below. The property is not automatic: ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring that is not perfectly covered. With the torsion-free definition of the previous node the source's consequence 'A is p-torsion free' is built in; what later layers use is that A, its étale algebras R and their twists R ⊗_{A,ψ^m} A are p-torsion free, so their derived p-completions are the classical ones (the 'static' remark of 2.7).

Hypotheses: Faithful flatness is Mathlib's Module.FaithfullyFlat, for A regarded as a module over itself through ψ^m.; The condition is not automatic; no statement of this roadmap is made for a Λ-ring that is not perfectly covered.; The source states the free-Λ-ring example without proof; the free-lambda-perfect-cover theorem below supplies its proof..

Construction and proof route:

1. (i) ⇒ (ii): for a faithfully flat Λ-map A → A_∞ into a perfect Λ-ring, (N ⊗_{A,ψ^m} A) ⊗_A A_∞ ≅ N ⊗_{A,ψ^m} A_∞ ≅ N ⊗_A A_∞, the last because ψ^m is an automorphism of A_∞ compatible with A → A_∞; so exactness and faithfulness of N ↦ N ⊗_{A,ψ^m} A can be checked after the faithfully flat base change (q-Witt, footnote (2.3) to Remark 2.47).
2. (ii) ⇒ (iii): A_∞ is a filtered colimit of copies of A along the ψ^m, and a filtered colimit of faithfully flat A-algebras is faithfully flat.
3. (iii) ⇒ (i): A_∞ is perfect (the-colimit-perfection).
4. Examples: a perfect Λ-ring is covered by the identity; for toric ℤ[x_i], ℤ[x_i] is free over ψ^m(ℤ[x_i]) = ℤ[x_i^m] with basis the monomials ∏ x_i^(a_i), 0 ≤ a_i < m (Module.Free.of_basis), hence faithfully flat.
5. Non-example: in A = ℤ[x,y]/(xy) with the toric structure let M be A through ψ^p. Flatness would give Ann_M(x) = Ann_A(x)·M; but Ann_A(x) = yA, Ann_M(x) = {m : x^p m = 0} = yA and Ann_A(x)·M = ψ^p(y)A = y^pA, and y ∉ y^pA.
6. Torsion: A is torsion free by definition; étale (hence flat) A-algebras and their base changes along ψ^m are torsion free, so their derived and classical p-completions agree (DD.1's bounded-torsion criterion).

Retained API:

- `LambdaRing.IsPerfectlyCovered` (data): There is a faithfully flat Λ-map from A into a perfect Λ-ring.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_adams` (characterisation): (i) ⇔ (ii): every ψ^m is faithfully flat.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_colimPerfection` (characterisation): (i) ⇔ (iii): A → A_∞ is faithfully flat.
- `LambdaRing.IsPerfect.isPerfectlyCovered` (example): A perfect Λ-ring is perfectly covered.
- `LambdaRing.isPerfectlyCovered_int` (example): ℤ is perfectly covered.
- `LambdaRing.isPerfectlyCovered_toric` (example): Toric ℤ[x_i | i ∈ I] is perfectly covered.
- `LambdaRing.not_isPerfectlyCovered_toric_xy` (example): ℤ[x,y]/(xy) with the toric structure is not perfectly covered.
- `LambdaRing.IsPerfectlyCovered.adicCompletion_static` (compatibility): For R flat over A, the derived p-completion of R ⊗_{A,ψ^m} A is the classical AdicCompletion (DD.1).

Retained unit tests:

- `LambdaRing.isPerfectlyCovered_int` (degenerate): ℤ is perfectly covered by the identity ℤ → ℤ, a perfect Λ-ring.
- `LambdaRing.toric_free_over_adams` (computation): ℤ[x] is free over ψ^2(ℤ[x]) = ℤ[x^2] with basis {1, x}; for example x^3 + 5x^2 + 1 = x·x^2 + (5x^2 + 1)·1 with x^2, 5x^2 + 1 ∈ ℤ[x^2].
- `LambdaRing.toric_colimPerfection_free` (characterisation): For toric ℤ[x], A → A_∞ = ℤ[x^a | a ∈ ℚ_{≥0}] is free with basis {x^a : a ∈ ℚ, 0 ≤ a < 1}, in agreement with (ii) ⇔ (iii).
- `LambdaRing.not_isPerfectlyCovered_toric_xy` (non-example): A = ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring (a Λ-quotient of toric ℤ[x,y]) whose ψ^p is not flat: y lies in the x-annihilator of A through ψ^p but not in y^pA. A definition that took perfect covering to be automatic, or only required injectivity of the ψ^m, would accept it (every ψ^m is injective here).

Prerequisites: `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`, `HabiroRings:HR.1/the-colimit-perfection`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat`, `mathlib:Module.Free.of_basis`, `mathlib:MvPolynomial.expand`, `DerivedDeRhamCohomology:DD.1`.

### The Frobenius lift on the p-completion of an étale algebra, and the linearised Frobenius

Imported node: `HabiroRings:HR.1/the-etale-frobenius-lift`.

Let A be a perfectly covered Λ-ring, R an étale A-algebra and p a prime, and let R̂_p be the p-adic completion. The p-th Adams operation ψ^p of A extends uniquely to a Frobenius lift φ_p : R̂_p → R̂_p, that is, the unique ring endomorphism with φ_p ∘ ι = ι ∘ ψ^p on A (ι : A → R̂_p) and φ_p(x) ≡ x^p mod pR̂_p. The linearised Frobenius φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p, x ⊗ a ↦ φ_p(x)·ι(a), is an isomorphism. All rings involved are p-torsion free, so these classical completions are the derived ones. The construction is natural for morphisms of pairs, compatible with base change along Λ-maps A → A' (φ'_p on (R ⊗_A A')^∧_p is the completed tensor product of φ_p and ψ'^p, and φ_{p/A'} is the completed base change of φ_{p/A}), and φ_p^k is the unique lift of ψ^(p^k), whose linearisation (R̂_p ⊗_{A,ψ^(p^k)} A)^∧_p → R̂_p is the composite of the Frobenius twists of φ_{p/A}, hence also an isomorphism. The completed tensor products are never replaced by uncompleted ones. R itself need not have a ring endomorphism lifting Frobenius at p.

Hypotheses: A is perfectly covered (the source's standing hypothesis in §2.2); the proof uses only that A is p-torsion free and ψ^p is a Frobenius lift.; R is étale over A; completions are p-adic.; Uniqueness is part of the statement and is what gives naturality, base change and iterates..

Construction and proof route:

1. Regard R̂_p as an A-algebra through A --ψ^p--> A → R̂_p. Then R → R̂_p/p = R/p, x ↦ x^p, is an A-algebra map for this structure because ψ^p(a) ≡ a^p mod p.
2. R is formally smooth over A and R̂_p is p-adically complete (AdicCompletion.isAdicComplete, the ideal (p) being finitely generated), so this map lifts to an A-algebra map R → R̂_p (Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete); the lift is unique because R is formally unramified and ⋂_n p^n R̂_p = 0 (Algebra.FormallyUnramified.ext_of_iInf).
3. Extend to R̂_p by the universal property of the completion (IsAdicComplete.liftRingHom); uniqueness on R̂_p follows from uniqueness on R.
4. The linearised Frobenius is a map of p-adically complete, p-torsion-free rings (R ⊗_{A,ψ^p} A is flat over A); modulo p it is the relative Frobenius of the étale A/p-algebra R/p, an isomorphism by relative-frobenius-of-an-etale-algebra; a map of complete separated p-torsion-free modules that is bijective modulo p is bijective (successive approximation).
5. Naturality, base change and iterates: in each case both sides are ring maps out of R̂_p (or its twist) over the same map on A that agree modulo p, so they coincide by the uniqueness step; iterates of isomorphisms are isomorphisms.
6. Record the non-example of a global lift (test no_global_frobenius).

Retained API:

- `frobLift` (data): The Frobenius lift φ_p : R̂_p → R̂_p.
- `frobLift_comp_algebraMap` (simp): φ_p ∘ ι = ι ∘ ψ^p on A.
- `frobLift_sub_pow_mem` (relation): φ_p(x) − x^p ∈ p·R̂_p.
- `frobLift_unique` (extensionality): A ring endomorphism of R̂_p restricting to ψ^p on A and congruent to x ↦ x^p modulo p equals φ_p.
- `frobLift_toDeltaRing` (compatibility): R̂_p is a δ-ring (PrismaticCohomology PR.0) with Frobenius φ_p, and Â_p → R̂_p is a δ-map.
- `linearisedFrob` (data): φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p.
- `linearisedFrob_bijective` (characterisation): φ_{p/A} is an isomorphism (replaces linearisedFrob_equiv).
- `frobLift_naturality` (functoriality): For a morphism of pairs (f, g), ĝ_p ∘ φ_p = φ'_p ∘ ĝ_p.
- `linearisedFrob_baseChange` (compatibility): For A → A' a Λ-map and R' = R ⊗_A A', φ_{p/A'} is the completed base change of φ_{p/A}.
- `frobLift_iterate` (relation): φ_p^k is the unique lift of ψ^(p^k), and its linearisation is an isomorphism (replaces linearisedFrob_iterate).
- `frobLift_self` (example): For R = A, φ_p is the p-completion of ψ^p on Â_p.

Retained unit tests:

- `frobLift_gaussian_inert` (computation): A = ℤ, R = ℤ[i][1/2] (étale over ℤ), p = 3: R̂_3 = ℤ_3[i] and φ_3(i) = −i, because φ_3(i)^2 = −1 and φ_3(i) ≡ i^3 = −i mod 3 while i ≢ −i mod 3.
- `frobLift_gaussian_split` (computation): Same R, p = 5: x^2 + 1 ≡ (x + 2)(x − 2) mod 5, R̂_5 ≅ ℤ_5 × ℤ_5 and φ_5 = id (it fixes the idempotents, since φ_5(e) ≡ e^5 = e mod 5, and ℤ_5 has no other endomorphism).
- `frobLift_self` (degenerate): R = A: φ_p = ψ^p on Â_p and the linearised Frobenius is the identity; for toric A = ℤ[x], φ_p(x) = x^p on ℤ[x]^∧_p.
- `no_global_frobenius` (non-example): A = ℤ, R = ℤ[2^(1/3), 1/6] (étale: 3x^2 is a unit where x^3 = 2). Every ring endomorphism of R is the identity (ℚ(2^(1/3)) has no nontrivial automorphism), and the identity is not a Frobenius lift at 5: x^3 − 2 ≡ (x + 2)(x^2 − 2x − 1) mod 5 with irreducible quadratic factor, so R/5R ≅ 𝔽_5 × 𝔽_25, where x ↦ x^5 is not the identity. Yet φ_5 exists on R̂_5 ≅ ℤ_5 × W(𝔽_25).

Prerequisites: `HabiroRings:HR.1/perfectly-covered`, `HabiroRings:HR.1/morphisms-of-pairs`, `HabiroRings:HR.1/relative-frobenius-of-an-etale-algebra`, `PrismaticCohomology:PR.0`, `DerivedDeRhamCohomology:DD.1`, `mathlib:Algebra.Etale`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.FormallyUnramified.ext_of_iInf`, `mathlib:IsAdicComplete.liftRingHom`.

### The category of pairs (A, R): étale algebras over perfectly covered Λ-rings

Imported node: `HabiroRings:HR.1/morphisms-of-pairs`.

An étale pair (A, R) is a perfectly covered Λ-ring A together with an étale A-algebra R. A morphism (A, R) → (A', R') is a pair (f, g) of a Λ-ring map f : A → A' and a ring map g : R → R' with g ∘ (A → R) = (A' → R') ∘ f; identities and composition are componentwise. The Λ-compatibility is a condition on f only: R carries no Adams operations, and compatibility of the completed maps ĝ_p with the Frobenius lifts is a theorem (frobLift_naturality of the-etale-frobenius-lift), not an extra condition. Base change along a Λ-map A → A' with A' perfectly covered sends (A, R) to (A', R ⊗_A A').

Hypotheses: f is a Λ-map (commutes with every ψ^m); g is any ring map over f.; R and R' are étale over A and A'..

Construction and proof route:

1. Define objects and morphisms; identity and associativity hold componentwise.
2. Define the forgetful functors to Λ-rings (A, R) ↦ A and to ring maps (A, R) ↦ (A → R).
3. Define base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map A → A' with A' perfectly covered; R ⊗_A A' is étale over A' (Algebra.Etale.baseChange) and the canonical maps form a morphism of pairs.

Retained API:

- `EtalePair` (structure): A perfectly covered Λ-ring A with an étale A-algebra R.
- `EtalePair.Hom` (structure): A Λ-map f on bases and a ring map g on algebras with g ∘ algebraMap = algebraMap ∘ f.
- `EtalePair.instCategory` (instance): The category structure, with Hom.id and Hom.comp componentwise.
- `EtalePair.Hom.base` (projection): The Λ-map on bases.
- `EtalePair.Hom.alg` (projection): The ring map on algebras.
- `EtalePair.forget` (functoriality): The forgetful functor to Λ-rings.
- `EtalePair.baseChange` (functoriality): Base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map to a perfectly covered A'.

Retained unit tests:

- `EtalePair.not_hom_of_non_lambda` (non-example): On toric ℤ[x], the ring automorphism f(x) = x + 1 is not a Λ-map: f(ψ^2(x)) = (x + 1)^2 = x^2 + 2x + 1 but ψ^2(f(x)) = x^2 + 1. So (f, f) is not a morphism of pairs (ℤ[x], ℤ[x]) → (ℤ[x], ℤ[x]), although it is a ring map over f.
- `EtalePair.hom_self` (degenerate): Morphisms (A, A) → (A', A') are exactly the Λ-maps A → A' (g = f is forced).
- `EtalePair.conj_frobenius` (characterisation): Complex conjugation g on R = ℤ[i][1/2] gives a morphism (ℤ, R) → (ℤ, R); its 3-adic completion commutes with φ_3 (both are conjugation on ℤ_3[i]) without this being imposed.
- `EtalePair.baseChange_toric` (compatibility): (ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x][i][1/2]) along the Λ-map ℤ → toric ℤ[x] is a morphism of pairs, and it is the base change of the first pair.

Prerequisites: `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`, `HabiroRings:HR.1/perfectly-covered`, `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`.

### The colimit perfection of a Λ-ring

Imported node: `HabiroRings:HR.1/the-colimit-perfection`.

For a Λ-ring A, the colimit perfection A_∞ is the colimit of the diagram on ℕ ordered by divisibility that sends m to A and d | m to ψ^(m/d) : A → A (equivalently the sequential colimit of A along ψ^2, ψ^3, ψ^4, …), with the Adams operations induced by the ψ^m of A. It is a perfect Λ-ring, the map A → A_∞ from the copy at m = 1 is a Λ-map, and it is initial among Λ-maps from A to perfect Λ-rings: for f : A → B with B perfect, the unique extension sends the class of x in the copy at m to (ψ_B^m)^(-1)(f(x)).

Hypotheses: A is a Λ-ring (torsion-free form); a filtered colimit of torsion-free rings is torsion free and the Frobenius congruence passes to the colimit..

Construction and proof route:

1. Form the colimit in commutative rings; the transition maps are ring maps and commute with every ψ^n, so the ψ^n pass to the colimit and satisfy the Λ-ring axioms.
2. ψ^p on A_∞ is bijective: its inverse sends the class of x at stage m to the class of x at stage pm.
3. Universal property: the maps (ψ_B^m)^(-1) ∘ f are compatible with the transition maps because f commutes with the ψ^n, and uniqueness holds on each stage.

Retained API:

- `LambdaRing.colimPerfection` (data): The colimit perfection A_∞ with its Λ-structure.
- `LambdaRing.colimPerfection.of` (projection): The Λ-map A → A_∞ from the stage m = 1.
- `LambdaRing.colimPerfection.isPerfect` (instance): A_∞ is perfect.
- `LambdaRing.colimPerfection.lift` (universal-property): For f : A → B a Λ-map to a perfect Λ-ring, the unique Λ-map A_∞ → B with lift ∘ of = f.
- `LambdaRing.colimPerfection.map` (functoriality): A Λ-map A → A' induces A_∞ → A'_∞, with map_id and map_comp.

Retained unit tests:

- `LambdaRing.colimPerfection_toric` (computation): For toric ℤ[x], A_∞ ≅ ℤ[x^a | a ∈ ℚ_{≥0}] (the monoid algebra of ℚ_{≥0}) with ψ^m(x^a) = x^(ma); the class of x at stage m is x^(1/m).
- `LambdaRing.colimPerfection_of_isPerfect` (degenerate): For ℤ, ℚ or any perfect Λ-ring, of : A → A_∞ is an isomorphism.
- `LambdaRing.colimPerfection_lift_apply` (characterisation): For the toric map ℤ[x] → B = ℤ[x^a | a ∈ ℚ_{≥0}], the lift sends the class of x^k at stage m to x^(k/m).

Prerequisites: `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`.

### The relative Frobenius of an étale algebra in characteristic p is an isomorphism

Imported node: `HabiroRings:HR.1/relative-frobenius-of-an-etale-algebra`.

Let p be a prime, A an 𝔽_p-algebra and B an étale A-algebra. Then the relative Frobenius F_{B/A} : B ⊗_{A,Frob_A} A → B, b ⊗ a ↦ b^p·a, is an isomorphism of A-algebras. (Wagner 2.7 invokes this as [Stacks, Tag 0EBS] when it checks the linearised Frobenius modulo p; it is in neither pinned library.)

Hypotheses: B is étale (flat, finitely presented, unramified) over A; the statement fails for smooth non-étale B..

Construction and proof route:

1. B ⊗_{A,Frob} A is étale over A (Algebra.Etale.baseChange) and B is étale over A, so F_{B/A} is an étale map between étale A-algebras (Algebra.Etale.of_restrictScalars).
2. F_{B/A} is a universal homeomorphism: composed with b ↦ b ⊗ 1 in either order it gives the absolute Frobenius of B, respectively of B ⊗_{A,Frob} A, and absolute Frobenii are the identity on spectra after any base change; in particular F_{B/A} is surjective on spectra and universally injective.
3. Being étale, F_{B/A} has an open-immersion diagonal (Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul); being universally injective, its diagonal is surjective (AlgebraicGeometry.universallyInjective_eq_diagonal); so the diagonal is an isomorphism and Spec F_{B/A} is a monomorphism.
4. A flat, quasi-compact, surjective monomorphism of schemes is an isomorphism (AlgebraicGeometry.Flat.isIso_of_surjective_of_mono); hence F_{B/A} is an isomorphism.

Prerequisites: `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_restrictScalars`, `mathlib:frobenius`, `mathlib:Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul`, `mathlib:AlgebraicGeometry.universallyInjective_eq_diagonal`, `mathlib:AlgebraicGeometry.Flat.isIso_of_surjective_of_mono`.

## New declarations supplying the parent’s gaps

The declaration graph begins with the imported big Witt ring and the integral ghost-image criterion. Universal Frobenius polynomials supply full Frobenius and both prime congruences. From these come the Witt comonad and arbitrary-ring coalgebras. On torsion-free rings Dwork gives the unique Adams section; double ghost injectivity proves its coalgebra equation and the Wilkerson comparison. Separately, the comonad constructs the free coalgebra directly on a polynomial ring, even when its target has torsion. Its universal property is therefore an arbitrary-ring result. The local presentations finish the faithful-flatness proof, and the imported perfection equivalence converts it to the perfect-cover statement.

This ordering matters for avoiding circularity. The definition of the free coalgebra does not assume that an Adams-compatible evaluation map already preserves an unspecified λ-structure. It specifies the coaction on every polynomial generator using Δ. Its universal lift then uses the coaction identity in the target. The Adams formula follows from the cofree identity W(gh_m)Δ=F_m. Wilkerson is needed only to identify this universal property with the accepted torsion-free Adams convention.

### Dwork’s ghost-image criterion

Node: `HabiroRings:HR.1/dwork-ghost-image` (theorem).

Let A be a torsion-free commutative ring and let φ_p be a ring endomorphism lifting x ↦ xᵖ modulo p for each prime p. A sequence y_n indexed by positive integers is the ghost sequence of a unique a ∈ W(A) if and only if y_n − φ_p(y_(n/p)) belongs to p^(v_p(n))A for every prime p dividing n. The φ_p need not commute for this criterion.

Hypotheses: A torsion-free; one Frobenius lift at each prime.

Construction and proof route:

1. Use the integer power congruence: u ≡ v mod p implies u^(p^r) ≡ v^(p^r) mod p^(r+1), by binomial expansion and induction.
2. For ghost sequences, separate divisors of n according to their p-adic valuation, as Hesselholt Lemma 1.1 does, to obtain the stated p^(v_p(n)) congruence.
3. Conversely induct on n. With coordinates a_d for proper divisors fixed, set N_n = y_n − Σ_(d|n,d<n) d a_d^(n/d). The congruences imply divisibility by every p^(v_p(n)), hence by n (coprime integer factors and Bézout). Choose a_n with n a_n = N_n; torsion-freeness proves uniqueness.
4. No division in A or inversion of n is part of the definition: existence of the divisible numerator is proved first.

Acceptance:

- For A = ℤ and identity φ_p, ghosts (y_1,y_2)=(1,3) force (a_1,a_2)=(1,1).
- (1,2) cannot be the first two ghosts over ℤ. Modulo-p congruence alone at n=p² is insufficient.

Direct prerequisites: `HabiroRings:HR.4/truncated-big-witt-vectors`, `mathlib:IsAddTorsionFree`.

Sources: Lars Hesselholt, Lemma 1.1, pp.6–7. Exactly the integral ghost-image condition; the infinite truncation set is permitted.

### Universal Frobenius polynomials

Node: `HabiroRings:HR.1/universal-frobenius-polynomials` (theorem).

For C = ℤ[c_n | n ≥ 1] there are universal polynomials f_(m,n) giving the nth coordinate of F_m on W. They involve only c_j with j ≤ mn, are homogeneous of weight mn for wt(c_j)=j, and satisfy Σ_(d|n) d f_(m,d)^(n/d) = Σ_(e|mn) e c_e^(mn/e). For prime p, f_(p,n)=p c_(pn)+P_(p,n) with P involving only j<pn, and f_(p,n) ≡ c_nᵖ mod p. These are coordinate congruences, distinct from the Witt-ring congruence F_p(a)≡aᵖ mod pW(A).

Hypotheses: m,n positive; p prime; arbitrary specialization ring A.

Construction and proof route:

1. Use the imported F_m and Hesselholt Lemma 1.4 on the universal torsion-free polynomial ring, with Dwork’s criterion supplying integral coordinates.
2. Induct through the ghost equation: the new variable c_(mn) occurs with coefficient mn and the new unknown f_(m,n) with coefficient n. Cancellation gives coefficient m; every other variable has smaller index.
3. The same recursion, retaining integer grading, proves weight mn. Hesselholt Lemma 1.8 proves f_(p,n)≡c_nᵖ mod p by strengthening the numerator congruence before cancelling n.
4. Separately retain Lemma 1.18’s stronger Witt-ring divisibility; reducing coordinates naively is not a proof of divisibility inside W(A).

Acceptance:

- f_(2,1)=c_1²+2c_2; f_(2,2)=2c_4−2c_1²c_2−c_2².
- All formulas specialize to rings with torsion; ghost uniqueness is used only over the universal polynomial ring.

Direct prerequisites: `HabiroRings:HR.4/truncated-big-witt-vectors`, `HabiroRings:HR.1/dwork-ghost-image`, `mathlib:MvPolynomial`.

Sources: Lars Hesselholt, Lemma 1.4, pp.8–9; Lemmas 1.8 and 1.18, pp.11,16. Universal polynomial construction; weight and triangular coefficient are derived from its displayed ghost equations, while the two prime congruences are explicitly separated.

### The big Witt comultiplication

Node: `HabiroRings:HR.1/big-witt-comonad` (construction).

On the imported full big Witt functor W, construct the natural ring homomorphism Δ_A:W(A)→W(W(A)), characterized universally by outer gh_n(Δ_A(a))=F_n(a). Together with ε_A=gh_1 it satisfies both counit identities and coassociativity, hence is a comonad on commutative rings. The characterization by ghosts alone is asserted as uniqueness for torsion-free A; for arbitrary A, Δ is the specialization of these universal integral polynomials.

Hypotheses: A any commutative ring; outer ghost takes values in W(A).

Construction and proof route:

1. Over C=ℤ[c_n], W(C) is torsion-free: the imported injective ghost embeds it into C^ℕ, using Hesselholt Lemma 1.9.
2. Apply Dwork to the sequence (F_n(a)) in W(C). The lifts F_p exist by the separate Witt-ring congruence of Lemma 1.18, and F_n=F_p F_(n/p) makes the required differences zero.
3. Construct Δ on the universal point. Every coordinate is a polynomial in finitely many c_n. Specialize to every A; ring-homomorphism and naturality identities descend from independent universal points.
4. Prove counits and coassociativity by double/triple ghosts over universal torsion-free polynomial rings, then specialize. Double ghosts give gh_m gh_n Δ(a)=gh_(mn)(a).

Uses: Hesselholt Definition 1.21 and Proposition 1.19: Coassociativity defines Λ-coalgebras and their canonical cofree structures. Wagner §2.31; HabiroRings HR.4 relative-q-witt-rings: Provides the canonical structure map whose coordinates are the δ_d used in relative formulas.

API:

- `BigWitt.comul` (constructor): The ring homomorphism Δ_A for arbitrary A.
- `BigWitt.comul_ghost` (characterisation): Outer gh_n ∘ Δ_A = F_n.
- `BigWitt.comul_natural` (functoriality): W(W(f)) ∘ Δ_A = Δ_B ∘ W(f).
- `BigWitt.comul_counit_left` (relation): gh_1 ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_counit_right` (relation): W(gh_1) ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_assoc` (relation): Δ_(W(A)) ∘ Δ_A = W(Δ_A) ∘ Δ_A.

Unit tests:

- `BigWitt.comul_teichmuller_test` (compatibility): Δ_A([a])=[[a]] for every a.
- `BigWitt.comul_zero_test` (degenerate): Δ_A(0)=0, even for A=ℤ/4ℤ.
- `BigWitt.comul_ghost_six_test` (computation): gh_2(gh_3(Δ_ℤ(a)))=gh_6(a).

Acceptance:

- Δ sends a Teichmüller element [a] to [[a]].
- Counit is gh_1, not the entire ghost sequence.

Direct prerequisites: `HabiroRings:HR.4/truncated-big-witt-vectors`, `HabiroRings:HR.1/dwork-ghost-image`, `HabiroRings:HR.1/universal-frobenius-polynomials`.

Sources: Lars Hesselholt, Proposition 1.19, pp.17–18. The comultiplication and its identities are exactly Proposition 1.19; torsion does not give pointwise ghost uniqueness.

### The Witt comonad identities

Node: `HabiroRings:HR.1/big-witt-comonad-laws` (theorem).

The natural integral Δ satisfies outer gh_n∘Δ=F_n, both counit identities gh_1∘Δ=id and W(gh_1)∘Δ=id, and coassociativity Δ_(W(A))∘Δ=W(Δ)∘Δ. All identities hold on arbitrary commutative rings and are natural in ring maps.

Hypotheses: A arbitrary commutative ring.

Construction and proof route:

1. The outer ghost identity is the defining Dwork recursion over the universal point.
2. Prove the two counits and coassociativity by double and triple ghosts over torsion-free universal polynomial rings; the common double ghost is gh_(mn), and the common triple ghost is gh_(mnk).
3. Descend the integral coordinate polynomial identities to arbitrary A. This single simultaneous theorem promotes the comultiplication API identities used by the coalgebra and free constructions.

Acceptance:

- Every identity remains valid for A=ℤ/4ℤ; no ghost injectivity on that ring is asserted.

Direct prerequisites: `HabiroRings:HR.1/big-witt-comonad`, `HabiroRings:HR.4/truncated-big-witt-vectors`.

Sources: Lars Hesselholt, Proposition 1.19, pp.17–18. The source proves these comonad identities together.

### Λ-rings as big Witt coalgebras

Node: `HabiroRings:HR.1/lambda-coalgebra` (definition).

A Λ-coalgebra on a commutative ring A is a ring homomorphism s:A→W(A) with ε_A s=id_A and Δ_A s=W(s)s. A morphism f:(A,s)→(B,t) is a ring homomorphism with W(f)s=tf. Its Adams endomorphism is ψ^n=gh_n s. This notion is defined for all commutative rings; the parent’s Adams description is compared only on torsion-free rings.

Hypotheses: No torsion-freeness assumption in the coalgebra definition.

Construction and proof route:

1. Use the imported functor and the comonad node for the two literal equalities of ring homomorphisms.
2. Define morphisms by the displayed commuting square; identity/composition follow functor laws. Define Adams operations by ghost composition, without choosing division.
3. Expose coordinate projections and a coalgebra extensionality theorem: equality of structure maps, equivalently equality of every Witt coordinate, determines the structure. Ghosts alone need torsion-freeness.

Uses: Wagner §2.31: Makes the source’s structure map and δ_d available without restricting coefficients artificially. Borger §1.17: Separates arbitrary-ring Λ-structures from the torsion-free Frobenius-lift description.

API:

- `LambdaCoalgebra.adams` (data): ψ^n=gh_n∘s as a ring endomorphism.
- `LambdaCoalgebra.ext` (extensionality): Two coalgebras on A with equal structure maps are equal.
- `LambdaCoalgebra.Hom.id` (constructor): Identity is a coalgebra morphism.
- `LambdaCoalgebra.Hom.comp` (functoriality): Composition of coalgebra morphisms is a coalgebra morphism.
- `LambdaCoalgebra.Hom.adams` (compatibility): A coalgebra morphism commutes with every Adams operation.

Unit tests:

- `LambdaCoalgebra.adams_one_test` (degenerate): For every coalgebra, ψ¹=id_A.
- `LambdaCoalgebra.adams_two_coord_test` (computation): ψ²(a)=s(a)_1²+2s(a)_2.
- `LambdaCoalgebra.hom_adams_test` (compatibility): Every coalgebra morphism commutes with ψ⁶.

Acceptance:

- On W(A) the coaction is Δ_A.
- Equality of Adams operations is not claimed to detect coalgebras on rings with torsion.

Direct prerequisites: `HabiroRings:HR.1/big-witt-comonad`, `HabiroRings:HR.1/big-witt-comonad-laws`, `HabiroRings:HR.4/truncated-big-witt-vectors`.

Sources: Lars Hesselholt, Definition 1.21 and Definition 1.23, pp.18–19. Exact coalgebra convention; the symbol s avoids confusing the coaction with exterior λⁿ.

### Adams laws of a Witt coalgebra

Node: `HabiroRings:HR.1/coalgebra-adams-laws` (theorem).

For every Λ-coalgebra s on A, ψ¹=id, ψ^(mn)=ψ^m∘ψ^n, and ψ^p(a)−aᵖ∈pA for each prime p. A coalgebra morphism commutes with them. These laws do not make the converse unique for rings with torsion.

Hypotheses: A arbitrary commutative ring; m,n positive; p prime.

Construction and proof route:

1. Apply double ghosts to Δs=W(s)s to get the multiplicative-index law. Apply the counit for index 1.
2. Apply gh_1 to F_p(s(a))−s(a)ᵖ∈pW(A); use the outer ghost equation and coalgebra equation to identify gh_1F_p(s(a)) with ψ^p(a).
3. For morphisms compose the coalgebra square with gh_n and use naturality.

Acceptance:

- On the cofree W(A), ψ^n=F_n.
- For the integer binomial structure, all ψ^n are identity.

Direct prerequisites: `HabiroRings:HR.1/lambda-coalgebra`, `HabiroRings:HR.1/big-witt-comonad-laws`, `HabiroRings:HR.1/universal-frobenius-polynomials`.

Sources: Lars Hesselholt, Lemma 1.24, p.19. Composition and Frobenius-lift laws are the source’s Adams operations lemma.

### The Witt section of torsion-free Adams data

Node: `HabiroRings:HR.1/adams-to-witt-section` (construction).

For torsion-free A with the parent’s commuting Adams operations, construct the unique ring homomorphism s_ψ:A→W(A) with gh_n(s_ψ(a))=ψ^n(a). Coordinates c_n(a) are uniquely characterized by n c_n(a)=ψ^n(a)−Σ_(d|n,d<n)d c_d(a)^(n/d). In particular c_1(a)=a and c_p(a)=(ψ^p(a)−aᵖ)/p. This is an integral construction, natural for Adams-compatible ring maps.

Hypotheses: A torsion-free; ψ as in the accepted parent; m,n positive.

Construction and proof route:

1. For n divisible by p, ψ^n(a)=ψ^p(ψ^(n/p)(a)); Dwork’s differences are zero. Apply its unique-image criterion to the sequence ψ^n(a).
2. Additivity and multiplicativity of s follow by comparing ghosts, since all ψ^n are ring maps and the ghost map is injective on torsion-free A.
3. The divisor recursion gives coordinates, including the one-prime δ formula. Naturality follows from coordinatewise W(f) and equality of ghosts in the torsion-free target.
4. The coaction equation is the separate Wilkerson comparison node; do not assume any section of gh_1 is automatically a coalgebra.

Uses: HabiroRings:HR.4/relative-q-witt-rings: The c_d(a), Wagner’s δ_d(a), supply the relative relation with Adams ghosts. Wagner §2.31: Recovers the cofree-section coordinates of a Λ-ring from the parent’s convention.

API:

- `Adams.toWitt` (constructor): The integral ring homomorphism s_ψ.
- `Adams.toWitt_ghost` (characterisation): gh_n∘s_ψ=ψ^n.
- `Adams.toWitt_coord_one` (simp): c_1(a)=a.
- `Adams.toWitt_unique` (universal-property): Any ring map with all these ghosts equals s_ψ.
- `Adams.toWitt_natural` (functoriality): For an Adams morphism f into torsion-free B, W(f)s_A=s_Bf.

Unit tests:

- `Adams.toWitt_integer_two_test` (computation): For identity Adams on ℤ, s(2)_2=−1 and s(2)_3=−2.
- `Adams.toWitt_zero_test` (degenerate): s_ψ(0)=0.
- `Adams.toWitt_prime_delta_test` (compatibility): p s_ψ(a)_p=ψ^p(a)−aᵖ; c_p is the PR.0 p-derivation on torsion-free rings.

Acceptance:

- For ℤ with identity Adams, the first coordinates of s(2) are c_1=2,c_2=−1,c_3=−2.
- For toric ℤ[x], s(x)=[x].

Direct prerequisites: `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`, `HabiroRings:HR.1/dwork-ghost-image`, `HabiroRings:HR.4/truncated-big-witt-vectors`, `mathlib:IsAddTorsionFree`.

Sources: James Borger, §1.6–1.9 and §1.17, pp.8–10,12–13. Torsion-free equivalence; the explicit integral recursive proof is Dwork’s lemma as read in H.; Ferdinand Wagner, §2.31, p.26. Identifies exactly the section and ghost formula needed by HR.4.

### Ghosts and naturality of the Adams section

Node: `HabiroRings:HR.1/adams-witt-section-laws` (theorem).

For torsion-free Adams rings A,B, the reconstructed section satisfies gh_n∘s_ψ=ψ^n. It is the unique ring map with these ghosts, and W(f)s_A=s_Bf for every Adams-compatible ring map f:A→B.

Hypotheses: A,B torsion-free.

Construction and proof route:

1. Apply Dwork’s defining image condition to each reconstructed section.
2. Ghost injectivity proves uniqueness of the ring map and naturality in a torsion-free target. This promotes the section API identities consumed by Wilkerson comparison.

Acceptance:

- For the integer structure the ghosts of s(2) are all 2.

Direct prerequisites: `HabiroRings:HR.1/adams-to-witt-section`, `HabiroRings:HR.1/dwork-ghost-image`, `HabiroRings:HR.4/truncated-big-witt-vectors`.

Sources: Ferdinand Wagner, §2.31, p.26. The Adams ghost formula; existence and uniqueness are proved with the Dwork source above.

### Wilkerson’s torsion-free comparison

Node: `HabiroRings:HR.1/wilkerson-comparison` (theorem).

For a torsion-free commutative ring A, Λ-coalgebra structures are in natural bijection with the parent’s Adams structures. The forward map is ψ^n=gh_n s; the inverse is s_ψ from Dwork. Ring homomorphisms between torsion-free objects are coalgebra morphisms if and only if they commute with all Adams operations. Thus the comparison is an equivalence on the torsion-free subcategories, not on all commutative rings.

Hypotheses: A,B torsion-free.

Construction and proof route:

1. Adams laws are supplied by the coalgebra-adams-laws node. For the converse, prove Δs_ψ=W(s_ψ)s_ψ using outer ghosts in W(A).
2. For outer n, compare ghosts m in A: both sides equal ψ^(mn)(a) by commuting operations and gh_m s_ψ=ψ^m. The inner ghost is injective; then the outer ghost is injective because W(A) is torsion-free.
3. Apply uniqueness of the Witt section for inverse identities and morphism reflection. These equalities also prove naturality of the structure bijection.
4. Import the existing PR.0 torsion-free Frobenius/delta dictionary for the prime-coordinate interpretation; never identify c_p with exterior λ^p.

Acceptance:

- Applied to ℤ it returns the binomial Λ-structure.
- Applied to the free ring below it recovers its constructed coaction.

Direct prerequisites: `HabiroRings:HR.1/coalgebra-adams-laws`, `HabiroRings:HR.1/adams-witt-section-laws`, `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`, `HabiroRings:HR.4/truncated-big-witt-vectors`, `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

Sources: James Borger, §1.17, pp.12–13. Borger states the torsion-free/flat identification; the proof route spells it out through Dwork and double ghost injectivity.; Lars Hesselholt, Lemma 1.24, p.19 and Proposition 1.19, p.17. Matches the torsion-free converse, with no torsionful extrapolation.

### The cofree Λ-ring adjunction

Node: `HabiroRings:HR.1/big-witt-cofree-adjunction` (theorem).

For any commutative ring A, (W(A),Δ_A) is the cofree Λ-ring. For every Λ-coalgebra (B,s_B), ring maps f:B→A correspond bijectively to coalgebra maps f♯:B→W(A), with f♯=W(f)s_B and inverse gh_1∘f♯. This is natural in both variables. In particular W(gh_m)Δ_A=F_m for every positive m.

Hypotheses: A,B arbitrary, including rings with torsion.

Construction and proof route:

1. Use naturality and coassociativity of Δ to prove W(f)s_B is a coalgebra map.
2. The two counits prove the bijections inverse without ghost injectivity at B or A.
3. For the last formula, compare double ghosts mn over the universal torsion-free polynomial ring and specialize to arbitrary rings. This is a natural polynomial identity, not an argument using ghosts on torsionful A.

Acceptance:

- For f=id_A from a Λ-ring A, the transpose is its own coaction s_A.
- For B=W(A), transpose of gh_1 is id_(W(A)).

Direct prerequisites: `HabiroRings:HR.1/big-witt-comonad-laws`, `HabiroRings:HR.1/lambda-coalgebra`.

Sources: Lars Hesselholt, §2, p.24 (cofree adjunction); Proposition 1.19. The right adjoint is W with its comultiplication; gives the all-ring universal property used to construct free Λ-rings.

### Exterior operations from Witt coordinates

Node: `HabiroRings:HR.1/exterior-operations` (construction).

For a Λ-coalgebra (A,s), define λ^n(a) as the coefficient of t^n in γ(s(a))(-t)⁻¹, where γ(c)=∏_(d≥1)(1−c_d t^d)⁻¹. Equivalently use the finite coefficient of ∏_(1≤d≤n)(1−c_d(a)(−t)^d); λ⁰(a)=1. This is the special arithmetic exterior λ convention. The c_d themselves are Witt coordinates, not exterior operations.

Hypotheses: n natural; A any commutative ring.

Construction and proof route:

1. Hesselholt Proposition 1.14 gives γ; coefficient n uses only d≤n, so the product is finite at each coefficient.
2. Substitute −t and invert γ, giving the finite product formula with signs fixed.
3. Use that s is a ring map and γ sends Witt addition to power-series multiplication for the sum relation. Degree 1 and small-degree formulas follow by multiplying the finite factors.
4. Do not replan the general symmetric-function ring: the Witt-coordinate polynomial ring of the free construction below already represents the same functor.

Uses: Parent HR.1 free example and Wagner §1.22(e): Pins the exterior-generator convention λⁿ(x)=0, n>1, for toric examples. Borger §1.18: Compares the free-ring generator description with classical symmetric functions via triangular exterior coordinates.

API:

- `LambdaCoalgebra.exterior` (constructor): The operation λⁿ at every natural index.
- `LambdaCoalgebra.exterior_zero` (simp): λ⁰(a)=1.
- `LambdaCoalgebra.exterior_one` (simp): λ¹(a)=a.
- `LambdaCoalgebra.exterior_add` (relation): λⁿ(a+b)=Σ_(i=0)^n λⁱ(a)λ^(n−i)(b).
- `LambdaCoalgebra.exterior_natural` (functoriality): A coalgebra morphism preserves all λⁿ.

Unit tests:

- `LambdaCoalgebra.exterior_integer_two_test` (computation): In the integer binomial Λ-ring, λ²(2)=1 and λ³(2)=0.
- `LambdaCoalgebra.exterior_zero_element_test` (degenerate): λⁿ(0)=0 for n>0.
- `LambdaCoalgebra.exterior_witt_sign_test` (non-example): λ²(a)=−s(a)_2; for a=2 in ℤ these values are 1 and −1 and are unequal.

Acceptance:

- λ²(a)=−c_2(a), λ³(a)=c_3(a)+c_1(a)c_2(a).
- On ℤ, λⁿ(k)=binomial(k,n) with integer-valued generalized binomial coefficients.

Direct prerequisites: `HabiroRings:HR.1/lambda-coalgebra`, `HabiroRings:HR.4/truncated-big-witt-vectors`, `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

Sources: Lars Hesselholt, Remark 1.22, p.18, and Proposition 1.14, p.14. The source distinguishes the traditional exterior λ operations from the Witt components of the structure map.

### The free Λ-ring in Witt coordinates

Node: `HabiroRings:HR.1/free-lambda-ring` (construction).

For a type/set I define L(I)=ℤ[c_(i,n) | i∈I,n≥1], with generator x_i=c_(i,1). Let u_i∈W(L(I)) have coordinates c_(i,n). Define the ring map s_L by s_L(c_(i,n))=(Δ(u_i))_n (outer nth Witt coordinate, a Witt vector in L(I)). It is a Λ-coalgebra. Adams acts by ψ^m(c_(i,n))=(F_m(u_i))_n=f_(m,n) in the ith block. The universal property is stated separately.

Hypotheses: I arbitrary, possibly empty/infinite.

Construction and proof route:

1. Use baseline MvPolynomial and eval₂Hom into W(L(I)) to define s_L from the displayed generator values.
2. Use W(gh_1)Δ=id for the counit on each polynomial generator. Coassociativity on each generator follows from the coassociativity identity for Δ and coordinate naturality; use polynomial ring extensionality.
3. The cofree adjunction supplies W(gh_m)Δ=F_m, which proves the displayed Adams formula on each c_(i,n).
4. The additive group is torsion-free by coefficientwise integer cancellation. The alternative exterior coordinates are triangular with leading sign (−1)^(n+1)c_(i,n), so they also freely generate the same polynomial ring.

Uses: Wagner §1.22(e), p.12: Supplies the free Λ-ring example of a perfectly covered base. Wagner q-Witt §2.33, p.27: Supplies the free all-prime Λ-ring used to prove preservation of torsion-freeness for the partial-Λ left adjoint.

API:

- `FreeLambdaRing.coord` (data): c_(i,n) is the polynomial variable X(i,n).
- `FreeLambdaRing.gen` (constructor): x_i=c_(i,1).
- `FreeLambdaRing.coaction` (structure): The map s_L on polynomial generators above satisfies both coalgebra axioms.
- `FreeLambdaRing.adams_coord` (simp): ψ^m(c_(i,n))=f_(m,n) in the ith block.
- `FreeLambdaRing.reindex` (functoriality): A map I→J induces the coalgebra map c_(i,n)↦c_(r(i),n), respecting identity and composition.

Unit tests:

- `FreeLambdaRing.adams_two_generator_test` (computation): ψ²(x_i)=x_i²+2c_(i,2).
- `FreeLambdaRing.empty_adams_test` (degenerate): L(∅)≃ℤ with identity Adams operations.
- `FreeLambdaRing.exterior_newton_three_test` (compatibility): Put e_2=−c_2 and e_3=c_3+x c_2. Then ψ³(x)=x³−3xe_2+3e_3.
- `FreeLambdaRing.not_toric_test` (non-example): In L({*}), ψ²(x)≠x² because 2c_2≠0.

Acceptance:

- For one generator, ψ²(x)=x²+2c_2 and ψ³(x)=x³+3c_3.
- The free Λ-ring is not the toric polynomial ring on the same generator.

Direct prerequisites: `HabiroRings:HR.1/big-witt-comonad-laws`, `HabiroRings:HR.1/lambda-coalgebra`, `HabiroRings:HR.1/big-witt-cofree-adjunction`, `HabiroRings:HR.1/universal-frobenius-polynomials`, `mathlib:MvPolynomial`, `mathlib:MvPolynomial.eval₂Hom`.

Sources: James Borger, §1.18, p.13. Free adjoint and representer. The explicit Witt-coordinate coaction is obtained from Hesselholt’s comonad and gives arbitrary generator sets by independent blocks.; Ferdinand Wagner, §2.33, p.27. Confirms polynomial torsion-free freeness is the input to the source’s partial-Λ adjunction.

### The free Λ-ring universal property

Node: `HabiroRings:HR.1/free-lambda-universal-property` (theorem).

For every Λ-coalgebra A, coalgebra maps L(I)→A correspond bijectively to functions I→A. For g:I→A, lift(g) is polynomial evaluation c_(i,n)↦s_A(g(i))_n, sends x_i to g(i), and is the unique coalgebra map doing so. It is natural under maps of I and coalgebra morphisms of A. On torsion-free A this is exactly the parent’s Adams-compatible free adjunction via Wilkerson.

Hypotheses: A any commutative ring with a coalgebra; no torsion-free restriction for the primary adjunction.

Construction and proof route:

1. Construct lift(g) using eval₂Hom and the integer ring map. The counit gives lift(g)(x_i)=g(i).
2. On each polynomial variable the coalgebra condition is precisely Δs_A=W(s_A)s_A, after specializing the Δ-polynomials from u_i to s_A(g(i)).
3. If f is a coalgebra map and f(x_i)=g(i), apply coordinates to W(f)s_L(x_i)=s_A(g(i)); the counit of Δ gives s_L(x_i)=u_i, hence f(c_(i,n))=s_A(g(i))_n. Polynomial extensionality gives uniqueness.
4. Evaluation and uniqueness prove naturality, identity and composition of reindexing. Apply Wilkerson for the torsion-free Adams formulation.

Acceptance:

- The unique lift x↦2 to the integer Λ-ring sends c_2↦−1 and c_3↦−2.
- Reindexing by identity is identity; an empty generator type gives the unique map from ℤ.

Direct prerequisites: `HabiroRings:HR.1/free-lambda-ring`, `HabiroRings:HR.1/wilkerson-comparison`, `mathlib:MvPolynomial.eval₂Hom`, `mathlib:MvPolynomial.eval₂Hom_X'`.

Sources: James Borger, §1.18, p.13. Exact free adjunction. The coordinate proof also explains why toric ℤ[x] cannot replace L({*}).

### Local presentations of free Adams operations

Node: `HabiroRings:HR.1/free-adams-local-presentations` (theorem).

Fix a prime p. Give L(I) the module/algebra structure over itself through ψ^p. Over ℤ_(p), this module is free with basis the finitely supported monomials ∏c_(i,n)^r_(i,n) with 0≤r_(i,n)<p. After inverting p it is a polynomial algebra over the source, with additional variables c_(i,j) for p∤j. Both presentations carry the source map ψ^p, rather than the ordinary polynomial scalar action. They are valid for arbitrary I.

Hypotheses: p prime; arbitrary I; coefficient localization commutes with ψ because ψ fixes integers.

Construction and proof route:

1. For finite I, grade L(I) by wt(c_(i,n))=n. The multiplication map from the direct sum of source copies, with source weight multiplied by p and shifted by each candidate basis monomial, preserves weight.
2. In each weight this is a square finite integer matrix: unique exponent division a=pq+r gives equality of ranks. The universal Frobenius-polynomial congruence makes its reduction mod p the monomial permutation matrix. Its determinant is a unit in ℤ_(p), so every finite weight map is an isomorphism. Combining weights yields the first basis, containing 1.
3. Over ℤ[1/p], use f_(p,n)=p c_(i,pn)+P with all indices smaller than pn. Recursively solve for every c_(i,pn) in terms of the image variables ψ^p(c_(i,n)) and the additional c_(i,j), p∤j. Reverse substitution gives a polynomial-ring isomorphism, not just generation.
4. For arbitrary I, every polynomial and relation uses finitely many generator blocks. The finite-I presentation is compatible with inclusions; adjoining blocks adds independent restricted monomials/polynomial variables. The filtered union gives the asserted basis and isomorphism without any infinite determinant.

Acceptance:

- For p=2 and a single block, the p-local basis includes 1,c_1,c_2,c_1c_2; coefficient exponents are at most one.
- Away 2 the formula c_2=(ψ²(c_1)−c_1²)/2 starts the recursion, with c_1 an additional odd-index variable.
- Do not apply a finite-type Jacobian criterion to the infinite polynomial ring.

Direct prerequisites: `HabiroRings:HR.1/free-lambda-ring`, `HabiroRings:HR.1/universal-frobenius-polynomials`, `mathlib:MvPolynomial`, `mathlib:Module.Free.of_basis`, `mathlib:Matrix.isUnit_iff_isUnit_det`.

Sources: Ferdinand Wagner, §1.22(e), p.12. The source asserts the resulting perfect covering, but supplies no flatness proof. The two presentations here are the derived proof route using Hesselholt’s integral coordinate polynomials, not a quotation of a missing source proof.; Lars Hesselholt, Lemmas 1.4 and 1.8, pp.8–11. The triangular ghost recursion and coordinatewise prime congruence are the precise inputs to the two presentations.

### Free Λ-rings are perfectly covered

Node: `HabiroRings:HR.1/free-lambda-perfect-cover` (theorem).

For every I and every positive m, ψ^m:L(I)→L(I) is faithfully flat. Consequently L(I) is perfectly covered in the parent’s sense, and its canonical map to the colimit perfection L(I)_∞ is faithfully flat and a Λ-map into a perfect Λ-ring.

Hypotheses: I arbitrary; m positive; faithfulness means the full module or ring-map predicate from Mathlib.

Construction and proof route:

1. For m=p prime, the two local presentations make ψ^p faithfully flat after base localization at ℤ_(p) and ℤ[1/p]: a nonempty free basis in the first case, and a polynomial ring containing the constant basis vector in the second.
2. At a maximal ideal of the source L(I), its contraction to ℤ is either (p), another prime ideal, or (0). Choose ℤ_(p) in the first case and ℤ[1/p] in the other two. Further localization of the corresponding free presentation is flat and has nonzero residue fibre.
3. Apply Module.flat_of_localized_maximal for flatness, and the nonzero-fibre criterion in Module.FaithfullyFlat (equivalently the RingHom criterion) for faithfulness. This is local descent with the twisted scalar action, not descent from integer torsion-freeness alone.
4. Factor m into primes, use Adams composition and RingHom.FaithfullyFlat.stableUnderComposition; m=1 is identity. Apply the imported perfectly-covered equivalence and colimit perfection to conclude the covering statement.

Acceptance:

- L(∅)=ℤ has identity Adams and is already perfect.
- For one generator ψ² is faithfully flat but not surjective; hence free does not mean perfect.

Direct prerequisites: `HabiroRings:HR.1/free-adams-local-presentations`, `HabiroRings:HR.1/coalgebra-adams-laws`, `HabiroRings:HR.1/perfectly-covered`, `HabiroRings:HR.1/the-colimit-perfection`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.flat_of_localized_maximal`, `mathlib:RingHom.FaithfullyFlat`, `mathlib:RingHom.FaithfullyFlat.stableUnderComposition`, `mathlib:RingHom.FaithfullyFlat.iff_flat_and_comap_surjective`.

Sources: Ferdinand Wagner, §1.22(e), p.12. Exactly the asserted example; the preceding new theorem supplies the omitted proof.; Ferdinand Wagner, Remark 2.47 and footnote (2.3), p.32. Supplies the parent equivalence between all Adams maps faithfully flat and the canonical colimit perfect cover.

## The localized flatness argument as a library contract

The free ring on I has one coordinate block for each generator, not one ring variable for each generator. For a singleton the first ghost identity reads ψ²(c_1)=c_1²+2c_2, so the extra variable c_2 is visible before any higher operation. This makes the standard toric polynomial example a useful nonexample for the free universal property. The toric structure forces c_2(x)=0; evaluating x at the integer 2 would require c_2(2)=−1, so that evaluation is not a Λ-map. The free polynomial ring has exactly the additional variables needed to permit that map.

Fix a prime p and initially suppose I finite. Give the source and target coordinate rings their positive integer grading wt(c_(i,n))=n. The Adams map is homogeneous of degree p, meaning source weight d maps to target weight pd. For each restricted exponent vector r with r_(i,n)<p, the corresponding monomial b_r supplies one candidate source-module summand. The multiplication map sends its coefficient a to ψ^p(a)b_r. In weight N only finitely many pairs of a monomial in a source copy and b_r occur: all variables have positive weight, only indices n≤N occur, and I is finite.

The equal-rank argument must respect the weight scaling. Every ordinary target monomial with exponents e has a unique decomposition e=pq+r, coordinatewise, with 0≤r<p. Its weight is p·wt(q)+wt(r). Thus the domain and target weight-N pieces have identical finite ranks over the integer coefficient ring. Reduction modulo p identifies ψ^p(c_(i,n)) with c_(i,n)^p, so it turns the multiplication map into exactly this monomial bijection. The finite matrix therefore has determinant not divisible by p. Over ℤ_(p) it is invertible. Combining the weight pieces proves both spanning and independence of the restricted monomials, and the basis contains the monomial 1. No assertion that a merely injective endomorphism is flat enters this proof.

For the other coefficient localization, put p in the units. The triangular formula ψ^p(c_(i,n))=p c_(i,pn)+P_(p,n) allows induction on the target coordinate index. All variables occurring in P have smaller index than pn. Coordinates with index prime to p are kept as additional polynomial variables. For an index divisible by p, solve for c_(i,pn). This expresses every original coordinate in the new polynomial variables. To prove algebraic independence, define the reverse substitutions recursively in the independent formal source and additional variables and check both composites on each generator. Surjectivity alone would not establish the polynomial-algebra presentation. The resulting algebra equivalence is over the source with structure map ψ^p, so it also determines the scalar action used in the flatness statement.

For arbitrary I, every polynomial lies in a finite collection of generator blocks. These local bases and substitutions are compatible with inclusions of such blocks. A finite relation among the candidate basis monomials has finitely many coefficients and variables; it reduces to the finite-block independence result. A target polynomial’s expansion also reduces to that result. This proves the full basis directly without assuming a finite-dimensional graded piece when I is infinite. The same finite-support argument proves the away-p polynomial presentation. It is also possible to package the passage as a filtered union of compatible free presentations, but the finite-support proof pins exactly which module basis is retained.

To globalize, regard the target as a module over the source through ψ^p. At every maximal ideal of the source, its contraction to ℤ is a prime ideal of ℤ. If it is (p), the local basis over ℤ_(p) is available. If it is another nonzero prime ideal or (0), the away-p presentation is available. Further localization gives a flat module at that source maximal ideal, with nonzero residue fibre because the presentations have a constant basis vector. Mathlib’s local flatness criterion and faithful-flatness definition now apply to this twisted module. The result is faithful flatness of ψ^p globally. Composite positive m follows by prime factorization and stability under composition; index 1 uses the identity map. The imported parent theorem on colimit perfection then gives the canonical faithfully flat cover.

Wagner §1.22(e) states the free example but does not give this proof. The packet deliberately identifies the argument as a derived proof route based on Hesselholt’s universal Frobenius polynomials. It does not attribute the two localized presentations to a nonexistent lemma in Wagner. Conversely, this supplement uses no missing general theory of symmetric functions as an unrecorded prerequisite: the big Witt representing polynomial coordinates give the free object, and the finite triangular exterior change of variables identifies its traditional generators.

## Sources, baseline, and verification

The source versions are fixed by URL, version and SHA-256 in the packet. The mathematical passages read are Hesselholt §1, pp.6–19, with the cofree discussion on p.24; Borger §1.6–1.9 and §1.17–1.18; Wagner’s q-Witt §2.31–2.33, Remark 2.47 and footnote (2.3); and q-Hodge §1.22(e), together with the parent’s étale/completion passages. Hesselholt’s reference to Wilkerson on p.19 and Borger’s flat comparison provide public source support; the recursive proof here removes the need to obtain the 1982 paper privately. Numbered locators refer to the cited arXiv versions, whose numbering is explicit, rather than assuming another edition has identical pagination.

- Lars Hesselholt, [The big de Rham–Witt complex](https://arxiv.org/pdf/1006.3125v3), arXiv:1006.3125v3; source numbering of this version (Acta Math. 214 (2015)). Read 2026-10-06.
- James Borger, [The basic geometry of Witt vectors, I: The affine case](https://arxiv.org/pdf/0801.1691v6), arXiv:0801.1691v6 (14 December 2015 revision). Read 2026-10-06.
- Ferdinand Wagner, [q-Witt vectors and q-Hodge complexes](https://arxiv.org/pdf/2410.23078v5), arXiv:2410.23078v5 (6 October 2025). Read 2026-10-06.
- Ferdinand Wagner, [q-Hodge complexes, Habiro rings, and algebraic Habiro cohomology](https://arxiv.org/pdf/2510.04782v2), arXiv:2510.04782v2 (8 October 2025). Read 2026-10-06.

The baseline declarations used directly by the new graph are:

- `mathlib:Matrix.isUnit_iff_isUnit_det`: A finite square matrix over a commutative ring is a unit iff its determinant is a unit; supplies each weighted local matrix inverse.
- `mathlib:PowerSeries`: Actual formal power series carrier, with the finite-product exterior generating series.
- `mathlib:PowerSeries.coeff`: The nth coefficient linear map; defines exterior operations from their signed product.
- `mathlib:IsAddTorsionFree`: Injectivity of nonzero natural-number scalar multiplication; cancellation in ghost recursion and comparison.
- `mathlib:MvPolynomial`: Polynomial ring on an arbitrary index type; the free Λ-ring uses I × positive integers.
- `mathlib:MvPolynomial.eval₂Hom`: Ring evaluation of polynomials along a coefficient ring homomorphism and chosen values of variables; constructs coaction and free lifts.
- `mathlib:MvPolynomial.eval₂Hom_X'`: Evaluation sends X i to its assigned value; generator contract of the free lift.
- `mathlib:Module.Free.of_basis`: A specified basis yields a free module; use for the localized Adams module.
- `mathlib:Module.FaithfullyFlat`: Flatness and nonvanishing modulo every maximal ideal, with faithful-flat instances for nontrivial free modules.
- `mathlib:Module.flat_of_localized_maximal`: Flatness of all localized modules at maximal ideals implies flatness; apply to C with the scalar action through ψᵖ.
- `mathlib:RingHom.FaithfullyFlat`: Faithfully flat ring map through its induced Algebra, not just injectivity.
- `mathlib:RingHom.FaithfullyFlat.stableUnderComposition`: Composition of faithfully flat ring maps is faithfully flat, giving composite Adams indices.
- `mathlib:RingHom.FaithfullyFlat.iff_flat_and_comap_surjective`: Faithfully flat iff flat with surjective map on prime spectra; localized free presentations give nonzero fibres.

The upstream models read are the AdicSpaces and LocalFieldsRamification documents. Their separation of hypotheses, canonical maps, comparison theorems, consumer contracts and wrong-generalization tests informs this stage. No upstream roadmap is replanned. The HR.1 atlas edges retain PR.0 as the prerequisite and HR.2 as the immediate consumer; HR.4 consumes the newly supplied section coordinates through its existing relative-q-Witt target. There is no dependency from the imported big Witt carrier to this new free-ring theorem, so the graph does not acquire a cycle.

The suggested file gives the real coordinate carrier, ring-homomorphism equalities defining a coalgebra, a polynomial free carrier, concrete evaluation maps, the exterior coefficient product, actual localized bases and algebra equivalences, and the faithful-flat ring-map statements. Its parent adapters are named and bounded explicitly; they are replaced by supplier imports at assembly. A type carrying only an unspecified proposition, or a pointwise ring structure on Witt coordinates, cannot satisfy these signatures and tests. Every API item and every new unit test appears there; retained parent API and tests remain in the parent suggested file.

## Coverage and integration

The packet is complete at target granularity and HR.1 is planned. It has fifteen new nodes: ten theorems, four constructions and one definition, with twenty-six API items and sixteen unit tests. It adds three planets, “Big Witt comonad”, “Wilkerson’s theorem”, and “Free Λ-ring”. Retain the parent’s three HR.1 planets for a combined six. The parent’s six HR.1 nodes are imported explicitly, and its HR.4 big Witt node supplies the functor. The new graph has no local mathematical gap. The existing PR.0 torsion-free Frobenius equivalence supplies the old δ dictionary need at exact-node granularity.

One inherited external request remains: `DerivedDeRhamCohomology:DD.1` must supply derived principal completion, derived Nakayama, and the bounded-torsion comparison with classical completion. The imported perfectly-covered criterion and completed étale Frobenius lift depend on that interface. The stage therefore is not marked closed. Its assembly must join this document and its fifteen nodes to the six parent targets, replace exactly the two local HR.1 gap records, and keep every unrelated parent gap. The same operation retains all six planet names and routes the prime δ dictionary to its existing PR.0 node. The QW ownership transfer applies only as part of the accepted atomic installation decision.

The checker and elaboration results are recorded in the handoff note. No statement in this document claims that any of these new declarations is formalised. Independent review checks the source matches, the arbitrary-ring versus torsion-free boundary, the two distinct prime congruences, the finite-weight basis proof, the scalar twist in localization, and the assembly contract.
