# Abelian Schemes And Arithmetic Moduli

## Purpose

This roadmap builds the dimension-general abelian-scheme library behind the Siegel, PEL and Hilbert modular varieties. It runs from abelian schemes and rigidity (A1), duals and polarizations (A2), quotients, torsion and pairings (A3) and degree-one realizations (A4), through complex uniformization (A5), to the arithmetic Hom groups and the moduli exports (A6).

This first checkpoint plans the field-level core of A6, from Milne's *Abelian Varieties* §§10–14. That core extends Tau Ceti's field Hom/End API. It adds the Rosati involution of A2. These are the statements that DeligneWeightsAndPurity DWP.1, ModularCurvesPartII R14.2, FaltingsFinitenessAndIsogenyTheorems R28.1 and ArithmeticStatistics request.

## Scope and boundaries

RS-02 is accepted. It makes this roadmap Part II of Tau Ceti's JacobianChallenge, extending the field-level abelian variety to abelian schemes over general bases.

- The field-level carrier is Tau Ceti's `AbelianVariety K`: a proper, geometrically integral group scheme over `Spec K`, with the group `A ⟶ B`, the ring `End A`, `IsIsogeny`, `mulBy` and `prod`. Every A6 node extends this API.
- The field dual, φ_L and polarizations are imported from JacobianChallenge Layer E, as RS-02 directs A2 to do. The relative dual and the polarization types are A2's.
- Intersection numbers and degrees of finite morphisms are requested from SchemeAndStackFoundations SF.5.
- Polarized moduli stacks are PELModuli's, and real multiplication is HilbertModularVarietiesAndShimuraCurves'. A6 exports to them and does not construct them.

## Conventions

- k is a field and A an abelian variety over k of dimension g; End⁰(A) = End(A) ⊗ ℚ and Hom⁰ = Hom ⊗ ℚ.
- ℓ is a prime different from char k, T_ℓA = lim A[ℓ^n](k^sep), and V_ℓA = T_ℓA ⊗ ℚ_ℓ.
- deg α is the degree of α as a finite morphism when α is an isogeny, and 0 otherwise. P_α(r) = deg(α − r).
- A polarization is an isogeny λ : A → A^∨ that becomes φ_L for an ample L over k̄. The Rosati involution is α† = λ⁻¹α^∨λ.

## A0 Relative algebraic geometry for polarized moduli

No nodes yet.

### What is missing

- Not planned in checkpoint 1. RS-02 keeps A0 as the import boundary for AlgebraicModuliForArithmeticGeometry R09.1–R09.6; the library audit classes it as a process layer. Its re-exports to A1 and A2 are to be written with those stages.

## A1 Abelian schemes and rigidity

No nodes yet.

### What is missing

- Not planned in checkpoint 1: abelian schemes over a base, rigidity over nonreduced bases, the theorem of the cube, and the comparison with the field carrier (Tau Ceti AbelianVariety) and with ModularCurves 1D. Milne's notes treat only the field case; a public source for the relative statements is still to be chosen.

## A2 Duals, Picard functors, and polarizations

### Objects

#### Definition. The Rosati involution of a polarization

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Polarization/Rosati.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

Let λ : A → A^∨ be a polarization of an abelian variety A over k. Since λ is an isogeny, it has an inverse in Hom⁰(A^∨, A). The Rosati involution is α ↦ α† = λ⁻¹ ∘ α^∨ ∘ λ on End⁰(A). It is a ℚ-linear anti-involution: (α + β)† = α† + β†, (αβ)† = β†α†, a† = a for a ∈ ℚ, and α†† = α. It is the adjoint for the Weil pairing: e_ℓ^λ(αx, y) = e_ℓ^λ(x, α†y) on V_ℓA. Over k̄, with char k ≠ 2, L ↦ λ⁻¹ ∘ φ_L identifies NS(A) ⊗ ℚ with the †-symmetric elements of End⁰(A).

*Hypotheses.*

- † depends on λ. For a principal polarization it preserves End(A); for general λ it preserves End⁰(A) only.
- The source prints (αβ)† = β α without daggers; the author's errata page corrects this to β†α†.
- The identification with NS(A) ⊗ ℚ uses the characterization of the φ_L as the homomorphisms with skew-symmetric e_ℓ pairing, which needs char k ≠ 2 and odd ℓ (Milne 13.6).

*API.*

- `Polarization.rosati` (*constructor*) — Polarization.rosati (λ : Polarization A) : End⁰ A ≃ₗ[ℚ] (End⁰ A)ᵐᵒᵖ, α ↦ λ⁻¹ ∘ α^∨ ∘ λ.
- `rosati_mul` (*simp*) — (α * β)† = β† * α†.
- `rosati_rosati` (*simp*) — α†† = α.
- `rosati_algebraMap` (*simp*) — (algebraMap ℚ _ a)† = algebraMap ℚ _ a.
- `weilPairing_rosati` (*compatibility*) — e_ℓ^λ (α x) y = e_ℓ^λ x (α† y).
- `rosati_eq_self_iff` (*characterisation*) — Over k̄ with char k ≠ 2: α† = α ↔ λ ∘ α ∈ the image of NS(A) ⊗ ℚ.
- `rosati_principal_mem_End` (*characterisation*) — For λ principal, α ∈ End A → α† ∈ End A.

*Used by.*

- `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity` — the positive definite trace form Tr(αα†)
- `AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties` — automorphisms of (A, λ) are the α with α†α = 1
- `DeligneWeightsAndPurity:DWP.1` — π†π = q for the Frobenius, which gives the √q bound
- `FaltingsFinitenessAndIsogenyTheorems:R28.1` — the automorphism and polarization finiteness statements

*Unit tests.* A wrong definition fails one of these.

- `rosati_elliptic` (value) — For an elliptic curve with its principal polarization, α† is the dual isogeny and αα† = [deg α].
- `rosati_mulBy` (degenerate) — [n]† = [n] for every polarization.
- `rosati_not_multiplicative` (non-example) — † is not multiplicative: for a supersingular E over 𝔽̄_p and non-commuting α, β ∈ End(E), (αβ)† = β†α† ≠ α†β†.
- `rosati_product` (value) — On E × E with the product principal polarization, † is conjugate transpose on M_2(End⁰(E)).

*Construction.*

1. α^∨ is the dual homomorphism, and (αβ)^∨ = β^∨α^∨ (A2), whence the anti-multiplicativity.
2. α†† = λ⁻¹(λ⁻¹α^∨λ)^∨λ = α, using the symmetry λ^∨ = λ under biduality (A2).
3. Adjointness: e_ℓ^λ(αx, y) = e_ℓ(αx, λy) = e_ℓ(x, α^∨λy) = e_ℓ^λ(x, α†y), from Milne 13.2(a) (A3's Weil pairing).
4. NS(A) ⊗ ℚ: λ∘α = φ_L for some L iff e_ℓ^{λα} is skew-symmetric, iff α† = α.

*Acceptance.*

- Elliptic curve E with λ principal: α† is the dual isogeny α̂, and αα† = [deg α].
- A = E × E with the product principal polarization: † is the conjugate transpose on M_2(End⁰(E)).

*Uses.* `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`.

*Planet:* Rosati involution.

*Sources.*

- Abelian Varieties, §14, p. 61: “The Rosati involution on End” The definition α† = λ⁻¹α^∨λ.
- Abelian Varieties, §14, p. 61: “This has the following obvious properties:” Additivity, anti-multiplicativity and ℚ-linearity.
- Abelian Varieties, §11, p. 53: “such that, over kal” A polarization is an isogeny that becomes φ_L for L ample over k̄.

### What is missing

- Only the Rosati involution is planned (field level). Still to be planned: the relative Picard functor through A0, Raynaud's abelian-space-to-scheme theorem, the dual abelian scheme and Poincaré bundle, φ_L and its identities, polarizations, polarization types, and Riemann–Roch for abelian varieties (deg φ_L = χ(L)²), which the node degree-formulas-for-polarized-isogenies imports.

## A3 Finite flat quotients, torsion, and pairings

No nodes yet.

### What is missing

- Not planned in checkpoint 1: fppf quotients by finite locally free subgroups, isogenies and their duals, [n] finite locally free of rank n^{2g}, factorization through [n], and the Weil pairings. The A6 nodes use these as the stage prerequisite A3.

## A4 Degree-one realizations and deformation theory

No nodes yet.

### What is missing

- Not planned in checkpoint 1: H¹_dR, the étale Tate module (at field level T_ℓA free of rank 2g, used by the A6 nodes), comparisons, and Serre–Tate.

## A5 Complex uniformization with polarization and level

No nodes yet.

### What is missing

- Not planned in checkpoint 1: complex uniformization with polarization and level.

## A6 Arithmetic Hom groups and moduli export

### Objects

#### Definition. The degree of an endomorphism, extended to End⁰(A)

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Degree.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`.

Let A be an abelian variety of dimension g over a field k. For α ∈ End(A), deg α is the degree of α as a finite surjective morphism if α is an isogeny, the degree [k(A) : α^*k(A)] of the extension of function fields, and deg α = 0 otherwise. Then deg(αβ) = deg α · deg β, deg(nα) = n^{2g} deg α for n ∈ ℤ, and deg [n] = n^{2g}. On End⁰(A) = End(A) ⊗ ℚ, deg α = n^{−2g} deg(nα) for any n ≥ 1 with nα ∈ End(A); this does not depend on n. deg α ≠ 0 exactly when α is invertible in End⁰(A).

*Hypotheses.*

- The degree counts inseparable degree. For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p while ker π(k̄) = 0. So deg is not the number of geometric points of the kernel.
- The extension to End⁰(A) uses that End(A) is torsion-free (theorem hom-to-tate-module-homs-is-injective).
- deg [n] = n^{2g} is AbelianSchemesAndArithmeticModuli A3's statement that [n] is finite locally free of rank n^{2g}.

*API.*

- `Hom.deg` (*constructor*) — Hom.deg (α : A ⟶ B) : ℕ, the degree of α if it is an isogeny and 0 otherwise.
- `deg_comp` (*simp*) — Hom.deg (α ≫ β) = Hom.deg α * Hom.deg β.
- `deg_mulBy` (*simp*) — Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) for g the dimension of A.
- `isIsogeny_iff_deg_ne_zero` (*characterisation*) — IsIsogeny α ↔ Hom.deg α ≠ 0 for α : A ⟶ B with dim A = dim B.
- `End.degRat` (*constructor*) — End.degRat : End A ⊗[ℤ] ℚ → ℚ, the extension n^{−2g} deg(nα).

*Used by.*

- `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism` — P_α(r) = deg(α − r)
- `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank` — deg as a positive integer-valued polynomial on nonzero endomorphisms of a simple variety
- `SmallRamificationAndAbelianVarietyBaseCases` — #A(𝔽_q) = deg(1 − F) for the Frobenius F
- `DeligneWeightsAndPurity:DWP.1` — deg(1 − π^n) and the point counts of the Weil estimate

*Unit tests.* A wrong definition fails one of these.

- `deg_mulBy_two_elliptic` (value) — On an elliptic curve deg [2] = 4 (four 2-torsion points when char k ≠ 2).
- `deg_zero` (degenerate) — deg 0 = 0 and deg 1 = 1.
- `deg_frobenius_ne_card_ker` (non-example) — For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p although π is injective on k̄-points: deg is not the number of geometric points of the kernel.
- `deg_neg_one` (value) — deg [−1] = 1, consistent with deg [n] = n^{2g}.

*Construction.*

1. The degree of a finite surjective morphism of integral varieties of the same dimension is the degree of the function-field extension; it is multiplicative under composition (request to SchemeAndStackFoundations SF.5).
2. deg [n] = n^{2g}: AbelianSchemesAndArithmeticModuli A3.
3. deg(nα) = deg [n] · deg α = n^{2g} deg α, so n^{−2g} deg(nα) does not depend on n.
4. An isogeny α has a quasi-inverse: if d = deg α then d = β ∘ α for an isogeny β (A3), so α is a unit of End⁰(A). Conversely a unit of End⁰(A) has finite kernel.

*Acceptance.*

- deg [2] = 4 on an elliptic curve, and 2^{2g} on an abelian variety of dimension g.
- For the Frobenius π of an elliptic curve over 𝔽_q, deg π = q, deg(1 − π) = #E(𝔽_q).

*Uses.* `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`, `AbelianSchemesAndArithmeticModuli:A3`, `SchemeAndStackFoundations:SF.5`.

*Sources.*

- Abelian Varieties, §10, Theorem 10.9, p. 46: “otherwise, we set deg” Degree 0 for a non-isogeny.
- Abelian Varieties, §10, Remark 10.11, p. 47: “We can use this formula to extend the deﬁnition of deg” Extension of deg to End⁰(A) through deg(nα) = n^{2g} deg α.

#### Definition. The characteristic polynomial and trace of an endomorphism

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Charpoly.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`.

Let A be an abelian variety of dimension g over a field k and α ∈ End(A). There is a unique monic polynomial P_α ∈ ℤ[X] of degree 2g with P_α(r) = deg(α − r) for all r ∈ ℤ. Its coefficients define the trace: P_α(X) = X^{2g} − Tr(α)X^{2g−1} + … + deg(α). For α ∈ End⁰(A), P_α(X) = n^{−2g}P_{nα}(nX) (nα ∈ End(A)) is monic with rational coefficients and P_α(r) = deg(α − r) for r ∈ ℚ. Tr : End⁰(A) → ℚ is ℚ-linear.

*Hypotheses.*

- Uniqueness holds because a polynomial is determined by its values on ℤ (infinitely many points).
- Integrality of the coefficients for α ∈ End(A) uses an ample symmetric divisor D, with (2)^*D ≡ 4D.
- P_α is not the minimal polynomial of α in End⁰(A): for α = [n] it is (X − n)^{2g}.

*API.*

- `End.charpoly` (*constructor*) — End.charpoly (α : End A) : ℤ[X], monic of degree 2g.
- `End.charpoly_eval` (*characterisation*) — (End.charpoly α).eval r = Hom.deg (α − r) for r : ℤ.
- `End.charpoly_monic` (*characterisation*) — (End.charpoly α).Monic ∧ (End.charpoly α).natDegree = 2 * g.
- `End.trace` (*constructor*) — End.trace (α : End A) : ℤ := −(End.charpoly α).coeff (2g − 1).
- `End.charpoly_coeff_zero` (*simp*) — (End.charpoly α).coeff 0 = Hom.deg α.
- `End.trace_add` (*simp*) — End.trace (α + β) = End.trace α + End.trace β.

*Used by.*

- `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module` — P_α equals the characteristic polynomial of V_ℓα
- `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity` — the trace form Tr(αα†)
- `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield` — trace and degree through a subfield of End⁰(A)
- `DeligneWeightsAndPurity:DWP.1` — the characteristic polynomial of Frobenius in the Weil estimate
- `FaltingsFinitenessAndIsogenyTheorems:R28.1` — characteristic polynomials of Frobenius and isogeny classes

*Unit tests.* A wrong definition fails one of these.

- `charpoly_mulBy` (value) — End.charpoly (mulBy A n) = (X − n)^{2g}.
- `charpoly_zero` (degenerate) — End.charpoly 0 = X^{2g}, since deg(−r) = r^{2g}.
- `charpoly_frobenius_elliptic` (value) — For an elliptic curve over 𝔽_q with trace of Frobenius a: End.charpoly π = X² − aX + q.
- `charpoly_ne_minpoly` (non-example) — The minimal polynomial of [n] in End⁰(A) is X − n, not End.charpoly (mulBy A n) = (X − n)^{2g}: P_α is not the minimal polynomial.

*Construction.*

1. Existence over ℚ: by the theorem degree-is-a-polynomial-function, r ↦ deg(α − r) is a polynomial of degree at most 2g in r.
2. Monic with integer coefficients: with D ample symmetric, P_α(−n) = (D_n^g)/(D^g) for D_n = (α + n)^*D, and D_n ≡ (n(n − 1)/2)D′ + (α + 1)^*D + … (Milne's proof of 10.9) makes the leading coefficient 1 and the others integers.
3. Uniqueness: mathlib:Polynomial.funext over the infinite domain ℚ.
4. Extension to End⁰(A) by rescaling, and linearity of Tr from the polynomial-function structure.

*Acceptance.*

- P_{[n]} = (X − n)^{2g} and Tr [n] = 2gn.
- For the Frobenius π of an elliptic curve over 𝔽_q: P_π = X² − aX + q with a = q + 1 − #E(𝔽_q).

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `mathlib:Polynomial.funext`.

*Planet:* Characteristic polynomial.

*Sources.*

- Abelian Varieties, §10, Theorem 10.9, p. 46: “There is a unique monic polynomial” Existence and uniqueness of P_α.
- Abelian Varieties, §10, p. 48: “the characteristic polynomial of” P_α is called the characteristic polynomial, and Tr is read off it.

### Theorems

#### Theorem. The degree is a homogeneous polynomial function of degree 2g on End⁰(A)

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Degree.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`.

Let A be an abelian variety of dimension g over a field k. The function deg : End⁰(A) → ℚ is a homogeneous polynomial function of degree 2g: for every finite family e_1, …, e_n in End⁰(A), deg(x_1e_1 + … + x_ne_n) is given by a homogeneous polynomial of degree 2g in (x_1, …, x_n) with rational coefficients.

*Hypotheses.*

- The source's Lemma 10.12 must be read with a bound on degrees: if x ↦ f(xv + w) is a polynomial of degree at most d for all v and w, then f is a polynomial function. Without the bound the proof's first sum can be infinite (a known erratum, recorded in sourceIssues).
- The proof uses intersection numbers of divisors and their behaviour under finite surjective maps, requested from SchemeAndStackFoundations SF.5, and the theorem of the cube (A1).

*Proof.*

1. Reduce to a bounded-degree Lemma 10.12: it suffices that n ↦ deg(nα + β) is a polynomial of degree at most 2g, for α, β ∈ End(A).
2. Let D be very ample and D_n = (nα + β)^*D. Then (D_n^g) = deg(nα + β)·(D^g) (degree formula for intersection numbers under a finite surjective map, SF.5), and (D^g) > 0.
3. Theorem of the cube (A1, Milne Corollary 5.3): D_{n+2} − 2D_{n+1} + D_n ≡ D′ with D′ = (2α)^*D − 2α^*D, independent of n. By induction D_n ≡ (n(n − 1)/2)D′ + nD_1 − (n − 1)D_0.
4. Hence (D_n^g) is a polynomial of degree at most 2g in n, and so is deg(nα + β).
5. Homogeneity: deg(nα) = n^{2g} deg α.

*Acceptance.*

- On an elliptic curve with End(E) = ℤ[i], deg(a + bi) = a² + b², a homogeneous quadratic form (g = 1).
- On E × E, deg of diag(a, b) is a²b², homogeneous of degree 4.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A1`, `SchemeAndStackFoundations:SF.5`.

*Sources.*

- Abelian Varieties, §10, Proposition 10.13, p. 47: “is a homogeneous poly-” deg is a homogeneous polynomial function of degree 2g on End⁰(A).

#### Theorem. Endomorphisms of simple abelian varieties form a division algebra

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Simple.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`.

Let A be a simple abelian variety over a field k: A ≠ 0 and its only abelian subvarieties are 0 and A. Then every nonzero α ∈ End(A) is an isogeny, and End⁰(A) = End(A) ⊗ ℚ is a division algebra. If A and B are simple, Hom⁰(A, B) = 0 unless A and B are isogenous, in which case it is free of rank one over End⁰(A) on the right and over End⁰(B) on the left. For simple A, End⁰(Aⁿ) ≅ M_n(End⁰(A)).

*Hypotheses.*

- The argument through the image of α works over every field. The source argues through the connected component of the kernel, which needs geometric reducedness over an imperfect field; the author flags this in footnote 11.

*Proof.*

1. The image α(A) is an abelian subvariety of A: it is closed, a subgroup, and geometrically integral because scheme-theoretic image commutes with the flat base change k → k̄ and A_{k̄} is integral (A1).
2. Simplicity: α(A) = 0, so α = 0, or α(A) = A. In the second case dim ker α = 0, so α is finite and surjective, hence an isogeny.
3. An isogeny α of degree d satisfies d = β ∘ α for an isogeny β (A3), so α is a unit in End⁰(A).
4. For simple A and B, a nonzero homomorphism A → B is an isogeny by the same image argument, and composing with a quasi-inverse gives the module structures.
5. End⁰(Aⁿ) = M_n(End⁰(A)) by composing with the inclusions and projections of the product.

*Acceptance.*

- A supersingular elliptic curve over 𝔽̄_p: End⁰ is the quaternion algebra over ℚ ramified at p and ∞, a division algebra.
- E × E is not simple: the diagonal is an abelian subvariety, and End⁰(E × E) = M_2(End⁰(E)) is not a division algebra.

*Uses.* `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A3`.

*Sources.*

- Abelian Varieties, §10, p. 43: “is a division algebra” End⁰(A) of a simple A is a division algebra.
- Abelian Varieties, §10, p. 42: “An abelian variety A is said to be simple if there does not exist an abelian variety” The definition of a simple abelian variety.

#### Theorem. Poincaré complete reducibility

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Poincare.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`.

Let A be an abelian variety over a field k. For every abelian subvariety B ⊆ A there is an abelian subvariety B′ ⊆ A such that (b, b′) ↦ b + b′ : B × B′ → A is an isogeny. Consequently A is isogenous to a product A_1^{n_1} × … × A_r^{n_r} of simple abelian varieties, pairwise non-isogenous, and the multiset of isogeny classes with multiplicities is unique.

*Hypotheses.*

- The source proves this with B′ the connected component through 0 of ker(i^∨ ∘ φ_L), for i : B → A the inclusion and L ample. Over an imperfect field, geometric reducedness of B′ is not proved in the source (footnote 10). The node states the theorem over every field, and the imperfect case is recorded as a gap.
- Uniqueness of the decomposition follows from the theorem endomorphisms-of-simple-abelian-varieties: Hom⁰ between non-isogenous simple factors vanishes.

*Proof.*

1. Choose an ample L on A. φ_L : A → A^∨ is an isogeny, and so is its restriction φ_{L|B} = i^∨ ∘ φ_L ∘ i : B → B^∨, because L|B is ample (A2; the field dual and φ_L are JacobianChallenge Layer E's).
2. Let B′ = (ker(i^∨ ∘ φ_L))^0, reduced (the gap concerns geometric reducedness when k is imperfect). Then dim B′ ≥ dim A − dim B.
3. B ∩ B′ ⊆ ker φ_{L|B} is finite, so B × B′ → A has finite kernel and, by dimension, is an isogeny.
4. Induction on dim A gives the decomposition into simple factors.
5. Uniqueness: an isogeny ∏ A_i^{n_i} → ∏ B_j^{m_j} induces isomorphisms of Hom⁰ spaces, and Hom⁰ between non-isogenous simple varieties vanishes.

*Acceptance.*

- E × E′ for non-isogenous elliptic curves E and E′: the only abelian subvarieties are 0, E × 0, 0 × E′ and E × E′.
- For B the diagonal in E × E, the anti-diagonal is a complement B′, and B × B′ → E × E has kernel of order 4.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A2`.

*Planet:* Poincaré complete reducibility.

*Sources.*

- Abelian Varieties, §10, Proposition 10.1, p. 42: “is an isogeny.” A1 × … × An → A is an isogeny.

#### Theorem. Hom(A, B) embeds in Hom(T_ℓA, T_ℓB); Hom(A, B) is torsion-free

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Hom/TateModule.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`.

Let A and B be abelian varieties over a field k and ℓ ≠ char k a prime. The map Hom(A, B) → Hom_{ℤ_ℓ}(T_ℓA, T_ℓB) is injective, so Hom(A, B) is torsion-free. If T_ℓα is divisible by ℓ^n in Hom(T_ℓA, T_ℓB), then α is divisible by ℓ^n in Hom(A, B).

*Hypotheses.*

- ℓ ≠ char k. For ℓ = p the ℓ-adic Tate module can be 0 (supersingular varieties) and the map is not injective.
- T_ℓA = lim A[ℓ^n](k^sep), free of rank 2g over ℤ_ℓ, is AbelianSchemesAndArithmeticModuli A4's.

*Proof.*

1. If T_ℓα = 0, then α kills A[ℓ^n](k^sep) for all n. On a simple abelian subvariety A′ ⊆ A, ker(α|A′) contains A′[ℓ^n] for all n, so it is not finite, and α|A′ = 0 (theorem endomorphisms-of-simple-abelian-varieties).
2. By the theorem poincare-complete-reducibility, A is the image of a product of simple abelian subvarieties, so α = 0.
3. Divisibility: if T_ℓα ∈ ℓ^n Hom(T_ℓA, T_ℓB), then α vanishes on the group scheme A[ℓ^n], which is étale since ℓ ≠ p. So α = β ∘ [ℓ^n] (A3: a homomorphism killing A[m] factors through [m]).

*Acceptance.*

- For an ordinary elliptic curve over 𝔽̄_p, End(E) embeds in End(T_ℓE) ≅ M_2(ℤ_ℓ) for ℓ ≠ p.
- For ℓ = p and E supersingular over 𝔽̄_p, T_pE = 0, so injectivity fails.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`.

*Sources.*

- Abelian Varieties, §10, Lemma 10.6, p. 45: “is injective. In particular,” Hom(A, B) → Hom(T_ℓA, T_ℓB) is injective.
- Abelian Varieties, §10, Lemma 10.6, p. 45: “is torsion-free.” Hom(A, B) is torsion-free.

#### Theorem. Hom(A, B) is free of finite rank, and Hom ⊗ ℤ_ℓ → Hom(T_ℓA, T_ℓB) is injective

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Hom/Finite.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`.

Let A and B be abelian varieties over a field k and ℓ ≠ char k. The map Hom(A, B) ⊗ ℤ_ℓ → Hom_{ℤ_ℓ}(T_ℓA, T_ℓB) is injective with torsion-free cokernel. Hence Hom(A, B) is a free ℤ-module of finite rank at most 4 dim A · dim B, and End⁰(A) is a finite-dimensional ℚ-algebra. The Néron–Severi group NS(A) is free of finite rank at most 4 (dim A)².

*Hypotheses.*

- The source's proof has two known faults, listed on the author's errata page. The submodule M must lie in End⁰(A), not End(T_ℓA). Choosing a ℚ-basis of End⁰(A) assumes the finite-dimensionality being proved. The proof steps below take the corrected route: a lattice argument for each finitely generated saturated submodule, then a rank bound.
- NS(A) ↪ Hom(A, A^∨) through L ↦ φ_L needs the dual abelian variety (A2 and Tau Ceti JacobianChallenge Layer E).

*Proof.*

1. Simple case, lattice step: for A simple and e_1, …, e_m ∈ End(A) linearly independent over ℤ, let W = ℚe_1 + … + ℚe_m ⊆ End⁰(A). deg is a polynomial function on W (theorem degree-is-a-polynomial-function) with deg ≥ 1 on the nonzero elements of W ∩ End(A) (theorem endomorphisms-of-simple-abelian-varieties). So W ∩ End(A) is discrete in W ⊗ ℝ and is finitely generated (mathlib:instModuleFinite_of_discrete_submodule).
2. ℤ_ℓ-independence: for the finitely generated saturated submodule N = W ∩ End(A), the map N ⊗ ℤ_ℓ → End(T_ℓA) is injective. ℓ-adic approximation of the coefficients, together with divisibility detected on T_ℓ (theorem hom-to-tate-module-homs-is-injective), forces the coefficients to be divisible by arbitrarily high powers of ℓ.
3. Rank bound: so m ≤ rank_{ℤ_ℓ} End(T_ℓA) = 4g². End⁰(A) is finite-dimensional and End(A) = End⁰(A) ∩ End(A) is finitely generated, by the lattice step applied to a ℚ-basis.
4. General A and B: choose isogenies ∏ A_i^{r_i} → A and B → ∏ B_j^{s_j} with simple factors (theorem poincare-complete-reducibility). Then Hom(A, B) ↪ ∏ Hom(A_i, B_j), and each factor is 0 or embeds in some End(A_i).
5. Torsion-free cokernel: from the divisibility statement of hom-to-tate-module-homs-is-injective.
6. NS(A): L ↦ φ_L embeds NS(A) in Hom(A, A^∨) (A2).

*Acceptance.*

- E without CM in characteristic 0: End(E) = ℤ, rank 1 ≤ 4.
- Supersingular E over 𝔽̄_p: End(E) is a maximal order in a quaternion algebra, of rank 4 = 4·1·1, and the bound is attained.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`, `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `mathlib:instModuleFinite_of_discrete_submodule`, `AbelianSchemesAndArithmeticModuli:A2`.

*Planet:* Finiteness of Hom.

*Sources.*

- Abelian Varieties, §10, Theorem 10.15, p. 49: “is injective, with torsion-free cokernel. Hence” Injectivity with torsion-free cokernel.
- Abelian Varieties, §10, Theorem 10.15, p. 49: “is a free Z-module of ﬁnite rank” Hom(A, B) is free of finite rank.
- Abelian Varieties, §10, Corollary 10.18, p. 50: “The N´eron-Severi group of an abelian variety is a free Z-module of” NS(A) is free of finite rank.

#### Theorem. The endomorphism algebra End⁰(A) is semisimple

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/End/Semisimple.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

Let A be an abelian variety over a field k, isogenous to A_1^{n_1} × … × A_r^{n_r} with the A_i simple and pairwise non-isogenous. Then End⁰(A) ≅ ∏_i M_{n_i}(D_i), with D_i = End⁰(A_i) a division algebra of finite dimension over ℚ. So End⁰(A) is a finite-dimensional semisimple ℚ-algebra. Moreover End(Aⁿ) = M_n(End(A)), and End(A × B) is the ring of matrices [[End(A), Hom(B, A)], [Hom(A, B), End(B)]], compatibly with T_ℓ.

*Hypotheses.*

- Semisimplicity is of End⁰(A), not of End(A), which is an order.

*Proof.*

1. An isogeny A → ∏ A_i^{n_i} induces End⁰(A) ≅ End⁰(∏ A_i^{n_i}).
2. End⁰(∏ A_i^{n_i}) = ∏ M_{n_i}(D_i), since Hom⁰(A_i, A_j) = 0 for i ≠ j and End⁰(A_i^{n}) = M_n(D_i).
3. A finite product of matrix algebras over division rings is semisimple (mathlib:isSemisimpleRing_iff_pi_matrix_divisionRing). Finite dimension over ℚ comes from the theorem hom-is-free-of-finite-rank.
4. Block decompositions: the product's universal property (tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod) and T_ℓ(A × B) = T_ℓA ⊕ T_ℓB.

*Acceptance.*

- End⁰(E × E′) = ℚ × ℚ for non-isogenous elliptic curves without CM; End⁰(E × E) = M_2(ℚ).
- For a CM elliptic curve E with End⁰(E) = K imaginary quadratic: End⁰(E²) = M_2(K).

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod`, `mathlib:isSemisimpleRing_iff_pi_matrix_divisionRing`.

*Sources.*

- Abelian Varieties, §10, p. 43: “Shortly, we shall see that” End⁰(A) ≅ ∏ M_{n_i}(D_i), and it is finite-dimensional.

#### Lemma. Monic polynomials are determined by ℓ-adic absolute values of resultants

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Charpoly/LAdic.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/polynomials-determined-by-l-adic-values`.

Let P = ∏(X − a_i) and Q = ∏(X − b_i) be monic polynomials of the same degree with coefficients in ℚ_ℓ. If |∏_i F(a_i)|_ℓ = |∏_i F(b_i)|_ℓ for all F ∈ ℤ[T], then P = Q.

*Hypotheses.*

- The hypothesis concerns absolute values only; it is extended to F with coefficients in ℚ_ℓ by continuity.

*Proof.*

1. By continuity the hypothesis holds for all F ∈ ℚ_ℓ[T].
2. Let d and e be the multiplicities of a_1 in P and in Q. Take α ∈ ℚ̄_ℓ close to a_1 with α ≠ a_1, and F its minimal polynomial of degree m. Then |∏F(a_i)|_ℓ = |∏(a_i − α)|_ℓ^m, because Galois automorphisms preserve |·|_ℓ and permute the a_i.
3. Comparing as α → a_1, the factors not involving a_1 are constant, so |α − a_1|^d = c·|α − a_1|^e forces d = e.

*Acceptance.*

- P = (X − 1)² and Q = (X − 1)(X − 1 − ℓ): F = T − 1 gives 0 for both, but F = T − 1 − ℓ gives |ℓ²|_ℓ = ℓ⁻² for P and |0|_ℓ = 0 for Q, so the hypothesis separates them.

*Sources.*

- Abelian Varieties, §10, Lemma 10.21, p. 51: “We need two elementary lemmas.” Lemmas 10.21 and 10.22.

#### Lemma. A multiplicative polynomial function evaluated on polynomials in an element

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Charpoly/LAdic.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/multiplicative-polynomial-functions`.

Let E be an algebra over a field K and δ : E → K a polynomial function with δ(αβ) = δ(α)δ(β). For α ∈ E let P = ∏_i (X − a_i) be the polynomial with P(x) = δ(α − x). Then δ(F(α)) = ±∏_i F(a_i) for every F ∈ K[T].

*Hypotheses.*

- The sign is (−1)^{deg F · deg P}; only absolute values are used in the application.

*Proof.*

1. After extending K, the roots b_j of F lie in K and F = c∏(T − b_j).
2. δ(F(α)) = δ(c)∏_j δ(α − b_j) = δ(c)∏_j P(b_j) = ±∏_{i,j}(b_j − a_i) = ±∏_i F(a_i), using multiplicativity and homogeneity of δ.

*Acceptance.*

- E = M_2(K) and δ = det: δ(α − x) = charpoly(α)(x), and det F(α) = ∏F(a_i) over the eigenvalues.

*Sources.*

- Abelian Varieties, §10, Lemma 10.22, p. 51: “We need two elementary lemmas.” Lemmas 10.21 and 10.22.

#### Theorem. P_α is the characteristic polynomial of α on V_ℓA, for every ℓ ≠ char k

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Charpoly/LAdic.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

Let A be an abelian variety over a field k, α ∈ End(A), and ℓ ≠ char k. Then P_α(X) = det(X − V_ℓα | V_ℓA), where V_ℓA = T_ℓA ⊗ ℚ_ℓ. Hence Tr α and deg α are the trace and determinant of α on V_ℓA, and the characteristic polynomial of V_ℓα has integer coefficients independent of ℓ. The same holds for α ∈ End⁰(A) with rational coefficients.

*Hypotheses.*

- ℓ ≠ char k. For ℓ = p the p-adic Tate module has rank less than 2g in general, and the statement fails.

*Proof.*

1. Reduce to k separably closed.
2. For β ∈ End(A): |deg β|_ℓ = #(ker β)(ℓ)^{−1} = #coker(T_ℓβ)^{−1} = |det T_ℓβ|_ℓ. The ℓ-part of deg β is the order of the ℓ-part of ker β(k^sep), because the inseparable degree is a power of p (A3, A4).
3. Lemma multiplicative-polynomial-functions with δ = deg on End⁰(A): |∏F(a_i)|_ℓ = |deg F(α)|_ℓ = |det T_ℓ F(α)|_ℓ = |∏F(b_i)|_ℓ, for a_i the roots of P_α and b_i the eigenvalues of T_ℓα.
4. Lemma polynomials-determined-by-l-adic-values gives P_α = det(X − V_ℓα).

*Acceptance.*

- For the Frobenius π of E/𝔽_q and every ℓ ≠ p, the characteristic polynomial of π on V_ℓE is X² − aX + q.
- For [n], det(X − n | V_ℓA) = (X − n)^{2g} = P_{[n]}.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/polynomials-determined-by-l-adic-values`, `AbelianSchemesAndArithmeticModuli:A6/multiplicative-polynomial-functions`, `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A3`.

*Planet:* ℓ-independence of the characteristic polynomial.

*Sources.*

- Abelian Varieties, §10, Proposition 10.20, p. 50: “is the characteristic polynomial of” P_α is the characteristic polynomial of α on V_ℓA.

#### Theorem. Trace and degree through a subfield of End⁰(A); V_ℓA is free over K ⊗ ℚ_ℓ

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Charpoly/Subfield.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.

Let A be an abelian variety of dimension g over k and K ⊆ End⁰(A) a subfield (a ℚ-subalgebra that is a field, with the same identity), of degree f = [K : ℚ]. Then f divides 2g, V_ℓA is a free K ⊗_ℚ ℚ_ℓ-module of rank 2g/f for every ℓ ≠ char k, and for α ∈ K: Tr(α) = (2g/f) Tr_{K/ℚ}(α) and deg(α) = Nm_{K/ℚ}(α)^{2g/f}. For α ∈ End⁰(A) with ℚ[α] a product of fields, the complex roots of P_α are the roots of the characteristic polynomial of α on ℚ[α].

*Hypotheses.*

- K must share the identity of End⁰(A); a field embedded in a corner eAe has a different identity.

*Proof.*

1. V_ℓA is a K ⊗ ℚ_ℓ-module; decompose K ⊗ ℚ_ℓ = ∏ K_λ, so that V_ℓA = ⊕ V_λ.
2. For α generating K, the characteristic polynomial P_α of α on V_ℓA has rational coefficients (theorem characteristic-polynomial-on-tate-module) and is a product of the characteristic polynomials of α on the V_λ.
3. Every monic irreducible rational factor of P_α shares a root with the minimal polynomial of α over ℚ, hence equals it. So P_α is a power of the minimal polynomial, and all V_λ have the same rank over K_λ.
4. The trace and norm formulas follow by taking traces and determinants.

*Acceptance.*

- A CM elliptic curve with K = End⁰(E) imaginary quadratic: f = 2 = 2g, V_ℓE free of rank 1 over K ⊗ ℚ_ℓ, and deg(α) = Nm_{K/ℚ}(α).
- GL₂(K)-type A of dimension [K : ℚ] = g: V_ℓA free of rank 2 over K ⊗ ℚ_ℓ.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

*Sources.*

- Abelian Varieties, §10, Proposition 10.23, p. 52: “Let K be a Q-subalgebra of End” V_ℓA is free over K ⊗ ℚ_ℓ of rank 2g/f, with the trace and degree formulas.

#### Theorem. Degrees of polarizations under isogenies

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Polarization/Degree.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies`.

Let α : A → B be an isogeny of abelian varieties over k and λ′ a polarization of B. Then α^*λ′ = α^∨ ∘ λ′ ∘ α is a polarization of A and deg(α^*λ′) = deg(λ′)·deg(α)². The degree of a polarization is a square, deg φ_L = χ(L)², and a principal polarization has degree 1.

*Hypotheses.*

- deg α^∨ = deg α, for the dual isogeny (A2, A3).
- deg φ_L = χ(L)² is Mumford's Riemann–Roch theorem for abelian varieties. The source states it without proof, and A2 owns it; it is a gap until A2 plans it.

*Proof.*

1. α^∨λ′α becomes φ_{α^*L′} over k̄ when λ′ = φ_{L′}, and α^*L′ is ample because α is finite.
2. Multiplicativity of degrees (node degree-of-an-endomorphism) and deg α^∨ = deg α (A2, A3).
3. deg φ_L = χ(L)² is imported from A2.

*Acceptance.*

- E an elliptic curve with principal polarization λ and α = [n]: deg([n]^*λ) = n⁴ = deg(n²λ).
- A principally polarized Jacobian: deg λ = 1.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A2`.

*Sources.*

- Abelian Varieties, §13, Remark 13.9, p. 60: “are related by” deg λ = deg λ′ · deg(α)².
- Abelian Varieties, §11, Theorem 11.1, p. 54: “Zariski cohomology” deg φ_L = χ(L)², with χ(L) the Euler characteristic.

#### Theorem. Positivity of the Rosati involution

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Polarization/Rosati.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`.

Let (A, λ) be a polarized abelian variety of dimension g over k, with Rosati involution †. The bilinear form (α, β) ↦ Tr(α ∘ β†) on End⁰(A) is symmetric and positive definite: Tr(αα†) > 0 for α ≠ 0. More precisely, if λ is defined by an ample divisor D over k̄, then Tr(αα†) = (2g/(D^g))·(D^{g−1} · α^*D).

*Hypotheses.*

- The source omits the calculation proving the formula; it cites the author's 1986 article, §17. That proof was not read, and it is recorded as a gap.
- Positive definiteness over ℚ implies it over ℝ: a rational quadratic form that is positive on ℚ^n ∖ 0 is positive semidefinite over ℝ, and its radical is a rational subspace, hence 0.

*Proof.*

1. Positivity from the formula: α^*D is effective and nonzero for α ≠ 0, and (D^{g−1} · E) > 0 for D ample and E effective nonzero (SF.5).
2. The formula (Milne 1986 §17; Mumford §21): express Tr(αα†) through the Riemann–Roch polynomial χ(L ⊗ α^*L^n) and intersection numbers. This is the gap recorded for this node.

*Acceptance.*

- An elliptic curve with λ principal: α† = α̂, αα† = deg α, and Tr(αα†) = 2 deg α > 0.
- E with End(E) = ℤ[i]: Tr((a + bi)(a − bi)) = 2(a² + b²).

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `SchemeAndStackFoundations:SF.5`.

*Planet:* Rosati positivity.

*Sources.*

- Abelian Varieties, §14, Theorem 14.3, p. 62: “is positive deﬁnite, i.e., Tr” Tr(αα†) > 0 for α ≠ 0.

#### Theorem. Automorphism groups of polarized abelian varieties are finite, and rigid at level n ≥ 3 prime to p

*Module* `TauCeti/AlgebraicGeometry/AbelianVariety/Polarization/Automorphism.lean`. *Node* `AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties`.

Let (A, λ) be a polarized abelian variety over k. (i) Aut(A, λ) = {α ∈ Aut(A) : α^∨λα = λ} is finite. (ii) If n ≥ 3 and char k ∤ n, an automorphism of (A, λ) acting as the identity on A[n](k̄) is the identity.

*Hypotheses.*

- (ii) needs char k ∤ n, or trivial action on the finite group scheme A[n]. The source states it for all n ≥ 3 with trivial action on A_n(k^al), which is false when char k divides n: a supersingular elliptic curve E over 𝔽̄_2 has E[4](k̄) = 0 and 24 automorphisms, all preserving the principal polarization (recorded in sourceIssues).
- In the source's proof of (a), the compact set is {α ∈ End(A) ⊗ ℝ : Tr(αα†) = 2g}, not End(A) ⊗ ℝ (sourceIssues).
- In the source's proof of (b), the contradiction needs β†β to be nilpotent. This holds because β and β† commute, since α† = α⁻¹ (sourceIssues).

*Proof.*

1. (i): α ∈ Aut(A, λ) iff α†α = 1. Then Tr(αα†) = 2g, so α lies in End(A) ∩ {Tr(xx†) = 2g}, the intersection of a lattice (theorem hom-is-free-of-finite-rank) with an ellipsoid (theorem rosati-positivity), which is finite.
2. (ii): α − 1 kills A[n], which is étale since char k ∤ n, so α − 1 = nβ with β ∈ End(A) (theorem hom-to-tate-module-homs-is-injective).
3. The eigenvalues of α on V_ℓA are roots of unity (α has finite order by (i)) of the form 1 + nπ with π an algebraic integer (theorem characteristic-polynomial-on-tate-module). For n ≥ 3, a root of unity ζ ≠ 1 of that form would give, after passing to a primitive p-th root, ±p = n^{p−1}N(π), impossible. So α is unipotent and β is nilpotent.
4. β† = (α⁻¹ − 1)/n commutes with β, so β†β is nilpotent and Tr(β†β) = 0. Rosati positivity forces β = 0, so α = 1.

*Acceptance.*

- An elliptic curve with j = 1728 over ℂ: Aut(E, λ) = μ₄, finite, and [i] acts nontrivially on E[3].
- The counterexample to the source's version of (ii): supersingular E over 𝔽̄_2, n = 4: E[4](k̄) = 0, and Aut(E) ≠ 1.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

*Sources.*

- Abelian Varieties, §14, Proposition 14.4, p. 62: “The group of automorphisms of” (a): Aut(A, λ) is finite.
- Abelian Varieties, §14, Proposition 14.4, p. 62: “is equal to the identity.” (b): rigidity at level n ≥ 3.
- Abelian Varieties, §14, Lemma 14.5, p. 63: “This is impossible because p is prime.” The root-of-unity lemma.

### What is missing

- Weil restriction along finite locally free S′ → S through AlgebraicModuliForArithmeticGeometry R09.3, the finite-étale preservation of abelian schemes, and T_ℓ(Res_{L/K} A) ≅ Ind T_ℓ(A) (Poonen, Rational points on varieties, §4.6).
- Compatibility of the Hom/End API with relative dualization and geometric fibres.
- The gaps recorded for Rosati positivity and for Poincaré reducibility over imperfect fields.

## Requests to other roadmaps

- `SchemeAndStackFoundations:SF.5` — The degree of a finite surjective morphism of integral varieties of the same dimension, multiplicative under composition. Intersection numbers (D₁ · … · D_g) of Cartier divisors on a projective variety of dimension g over a field, with (f^*D₁ · … · f^*D_g) = deg(f)(D₁ · … · D_g) for f finite surjective, and (D^{g−1} · E) > 0 for D ample and E effective nonzero. Needed by `degree-of-an-endomorphism`, `degree-is-a-polynomial-function`, `rosati-positivity`.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties` — At field level: the dual abelian variety A^∨ with dual homomorphisms α^∨, (αβ)^∨ = β^∨α^∨ and biduality; φ_L : A → A^∨ for a line bundle L, an isogeny when L is ample; and polarizations (isogenies A → A^∨ that become φ_L for an ample L over k̄), as RS-02 directs A2 to import them. Needed by `poincare-complete-reducibility`, `degree-formulas-for-polarized-isogenies`, `rosati-involution`.

## Gaps

- **The Rosati positivity formula is not proved in the source read.** Milne's Theorem 14.3 states Tr(αα†) = (2g/(D^g))(D^{g−1}·α^*D) and omits the calculation, citing his 1986 article §17. Neither that article nor Mumford §21 was read. The positivity of the right-hand side is covered by the SF.5 request; the formula is not.
- **Poincaré reducibility over imperfect fields.** The source constructs the complement B′ as a reduced connected component of a kernel and notes (footnote 10) that its geometric reducedness over an imperfect field is not proved. A proof covering imperfect fields has not been read.
- **deg φ_L = χ(L)² is stated without proof.** Milne's Theorem 11.1 quotes Mumford's Riemann–Roch theorem for abelian varieties without proof. It belongs to A2, which is not yet planned.

## Mistakes found in the source

These are recorded in the packet's `sourceIssues`. E1–E3 are new. E4–E6 are on the author's errata page and are listed because the nodes above use the corrected statements.

- **E1** (error, §14, Proposition 14.4(b), p. 62; new). Add the hypothesis char k ∤ n, or require α to act as the identity on the finite group scheme A_n. A supersingular elliptic curve E over 𝔽̄_2 has E[4](k̄) = 0 and an automorphism group of order 24. Every automorphism preserves the principal polarization, so for n = 4 every automorphism acts as the identity on A_4(k^al), and not all are the identity. The proof uses Lemma 10.16 (through 8.12), which needs trivial action on the group scheme.
- **E2** (error, §14, proof of Proposition 14.4(a), p. 62; new). The compact set is {α ∈ End(A) ⊗ ℝ : Tr(αα†) = 2g}, an ellipsoid by Theorem 14.3; its intersection with the discrete End(A) is finite. A nonzero real vector space is not compact. The finiteness argument needs a compact set containing Aut(A, λ).
- **E3** (gap, §14, proof of Proposition 14.4(b), p. 62; new). Add that β and β† commute, because α† = α⁻¹ commutes with α. Then β′ = β†β is nilpotent, since β is, and the nonvanishing of all β′^{2^k} contradicts the nilpotence of β′. Equivalently, Tr(β†β) = 0 contradicts Theorem 14.3. Nilpotence of β alone does not make β†β nilpotent: in M_2(ℝ) with the transpose, β = e₁₂ is nilpotent while βᵀβ = e₂₂ is idempotent.
- **E4** (gap, §10, Lemma 10.12, p. 47; known). Require that the degree of x ↦ f(xv + w) be bounded by a fixed d (at most 2g in the application). Without a bound, the degree d in the proof depends on x_1, …, x_{n−1}, and the first displayed sum may be infinite.
- **E5** (gap, §10, proof of Theorem 10.15, p. 49; known). M must be the ℤ-submodule of End⁰(A) generated by the e_i. The finite-dimensionality of End⁰(A) must be proved first: the rank of any finitely generated saturated submodule is bounded by rank End(T_ℓA) = 4g². The degree map is defined on End⁰(A), not on End(T_ℓA), and choosing a ℚ-basis assumes the finite-dimensionality that is being proved.
- **E6** (misprint, §14, p. 61; known). (αβ)† = β†α†. The Rosati involution is an anti-involution; the daggers on the right-hand side are missing.

## Library baseline

- `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` (TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean) — A homomorphism of abelian varieties over a field is an isogeny when its scheme morphism is finite and surjective.
- `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean) — The endomorphism [n] of an abelian variety, the n-th power for the group law.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End` (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean) — The endomorphism ring End A = Additive (A ⟶ A) of an abelian variety over a field, with its Ring instance.
- `Polynomial.funext` (Mathlib/Algebra/Polynomial/Roots.lean) — Over an infinite domain, polynomials with the same values everywhere are equal: uniqueness of P_α.
- `instModuleFinite_of_discrete_submodule` (Mathlib/Algebra/Module/ZLattice/Basic.lean) — A discrete ℤ-submodule of a finite-dimensional real normed space is a finite ℤ-module: the lattice step for End(A).
- `TauCeti.AlgebraicGeometry.AbelianVariety.prod` (TauCeti/AlgebraicGeometry/AbelianVariety/Product.lean) — The product of two abelian varieties over a field, with its projections and binary-product structure.
- `isSemisimpleRing_iff_pi_matrix_divisionRing` (Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean) — Artin–Wedderburn: a ring is semisimple iff it is a finite product of matrix rings over division rings.

## Sources

- J. S. Milne, *Abelian Varieties*. Course notes, version 2.00 (March 16, 2008), 172 pages; printed page = PDF page − 6; locators give printed pages and result numbers. https://www.jmilne.org/math/CourseNotes/AV.pdf (SHA-256 `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`). Read: cc-fb70e5, 2026-09-29 (checkpoint 1): contents and conventions, pp. iii–vi; §10 Endomorphisms, pp. 42–53, in full; §11, pp. 53–54; §12, pp. 54–56; §13 Weil pairings, pp. 57–61; §14 The Rosati involution, pp. 61–63; the author's errata page for v2.00.

## Non-goals

- Polarized moduli stacks and their compactifications (PELModuli, ShimuraCompactifications).
- A second field-level dual or Picard construction: those are JacobianChallenge Layer E's.
