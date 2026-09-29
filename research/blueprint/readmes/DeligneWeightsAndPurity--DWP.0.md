# Deligne weights, purity and the Weil bounds: stages DWP.0–DWP.6 and DWP.10

## Purpose

This document plans part DWP.0 of `DeligneWeightsAndPurity`. The part covers the numerical and linear-algebraic notion of weight (DWP.0), the initial Weil estimate for curves and abelian varieties (DWP.1), Weil I's fundamental estimate, rationality theorem and induction (DWP.2–DWP.4), the Weil II preparations on curves (DWP.5–DWP.6), and the arithmetic interfaces (DWP.10).

Checkpoint 1 plans DWP.0 at declaration level, from Weil I §§1–2 and Weil II §1.2: Weil q-numbers, ι-weights, and the weights of a Frobenius acting on a finite-dimensional space. Checkpoint 2 plans DWP.2, Weil I §3: the weight of a lisse sheaf on an open curve, the symplectic coinvariants of even tensor powers, the positivity lemmas, the fundamental estimate 3.2 and the coarse bounds 3.8–3.9. The other stages are recorded with the sources to read next.

## Scope and boundaries

RS-17 is accepted. It keeps DWP.0 whole and makes it the single owner of the Weil-number and ι-weight definitions and of the Frobenius-equivariant reciprocal-spectrum linear algebra. It lists as former owners WeightsInEtaleCohomology R34.1 and R34.5, WeilConjectures WC.2 and DeligneWeightsAndPurity DWP.5. These now import from DWP.0.

It narrows DWP.2 to Weil I 3.2 with its actual hypotheses: a fixed ℚ_ℓ model, open symplectic geometric monodromy, and rational local factors. Also retained are the ℚ_ℓ symplectic coinvariants, reached by a characteristic-zero descent from the complex invariant theory, the positivity and radius lemmas 3.3–3.6, and the coarse estimates 3.8–3.9.

- WeilConjectures WC.3 owns the separation of the factors of a zeta function by weight, with their integrality and ℓ-independence. WC.2 owns the functional equation and its sign.
- The sheaf-level predicates of Weil II (1.2.2) are DWP.5's. The curve case of Weil I (3.1) is planned in DWP.2, and DWP.5 must identify its predicate with it.
- The monodromy filtration of Weil II §1.6 is LefschetzPencilsAndVanishingCycles LPV.1's.
- Imports: the trace formula (1.14.3) from SchemeAndStackFoundations SF.2 (the CohomologicalPointCounting trace formula RS-17 names), Weil I (2.10) and (2.12) from EtaleDualityAndPerverseSheaves EDC.2, complex symplectic invariant theory from Tau Ceti SchurWeyl Layer 9, algebraic subgroups and Lie algebras from Tau Ceti ReductiveGroups Layers 2–3, and coefficient conventions from EDC.0.

## Conventions

- q > 1 is real in the definitions. In the applications q = #k₀ = p^a, and at a closed point x, q_x = q^{deg x}.
- Frobenius is the geometric Frobenius: ℚ_ℓ(1) has eigenvalue q⁻¹ and weight −2. Passing from k₀ to its extension of degree r replaces F by F^r and q by q^r.
- Four notions are kept distinct: algebraicity over ℚ, integrality over ℤ, purity at every complex embedding (Weil q-numbers, integer weights), and ι-purity for one field homomorphism ι into ℂ (real weights, no algebraicity).
- Eigenvalues are the roots of the characteristic polynomial in an algebraic closure, with multiplicities equal to the dimensions of generalized eigenspaces. No eigenbasis and no semisimplicity is assumed.
- The dual of (V, F) is the contragredient (V^*, (F⁻¹)^*).

## DWP.0 Eigenvalue weights and functorial linear algebra

### Objects

#### Definition. Weil q-numbers of integer weight

*Module* `TauCeti/Weights/WeilNumber.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

Fix a real number q > 1 and n ∈ ℤ. An element α of a field K of characteristic 0 is a Weil q-number of weight n (Deligne: pure of weight n relative to q) if α is algebraic over ℚ and every complex root of its minimal polynomial over ℚ has absolute value q^{n/2}. The predicate depends only on the minimal polynomial of α. So it is preserved and reflected by every field homomorphism K → K′, and it does not depend on the ambient field or on a chosen splitting field. Equivalently, |σ(α)| = q^{n/2} for every field homomorphism σ : ℚ(α) → ℂ. When K is algebraic over ℚ, it is equivalent to |φ(α)| = q^{n/2} for every field homomorphism φ : K → ℂ. A Weil q-number is nonzero, and its weight is unique. Integrality over ℤ is a separate predicate.

*Hypotheses.*

- Algebraicity is a clause of the definition. In Mathlib's convention the minimal polynomial of a transcendental element is 0 and has no roots, so the conjugate clause alone would hold vacuously.
- q > 1 is what makes the weight unique; for q = 1 a root of unity would have every weight. In the finite-field applications q = #k₀ = p^a, and at a closed point x the base is q_x = q^{deg x}.
- The comparison with all homomorphisms φ : K → ℂ needs K algebraic over ℚ (ℚ̄ or a number field). A field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and the condition would be vacuous. For K = ℚ̄_ℓ the comparison with isomorphisms ι : ℚ̄_ℓ ≅ ℂ is the theorem weil-number-iff-iota-pure-for-every-iota.
- Weights are integers, as in Weil II (1.2.1). Real weights are the ι-weights of the node iota-weight.

*API.*

- `IsWeilNumber` (*data*) — IsWeilNumber (q : ℝ) (n : ℤ) (α : K) : Prop := IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2).
- `IsWeilNumber.isAlgebraic` (*projection*) — A Weil q-number is algebraic over ℚ.
- `IsWeilNumber.norm_eq` (*characterisation*) — ‖φ α‖ = q ^ (n / 2) for every φ : K →+* ℂ.
- `isWeilNumber_iff_forall_embedding` (*characterisation*) — [Algebra.IsAlgebraic ℚ K] : IsWeilNumber q n α ↔ ∀ φ : K →+* ℂ, ‖φ α‖ = q ^ (n / 2).
- `isWeilNumber_map_iff` (*functoriality*) — IsWeilNumber q n (f α) ↔ IsWeilNumber q n α for f : K →+* K′.
- `IsWeilNumber.of_aeval_eq_zero` (*characterisation*) — If P ∈ ℚ[T] is nonzero, P(α) = 0 and every complex root of P has absolute value q^{n/2}, then α is a Weil q-number of weight n.
- `IsWeilNumber.ne_zero` (*characterisation*) — A Weil q-number is nonzero.
- `IsWeilNumber.weight_unique` (*characterisation*) — 1 < q → IsWeilNumber q n α → IsWeilNumber q m α → n = m.

*Used by.*

- `DeligneWeightsAndPurity:DWP.0/endomorphism-weights` — Weil purity of an endomorphism is this predicate on each eigenvalue
- `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic` — products, inverses and conjugates
- `FiniteFieldsAndCharacterSums:FF.2/additive-l-function-purity` — the reciprocal roots of the L-polynomial are Weil q-numbers of weight 1 (IsWeilNumber.of_aeval_eq_zero)
- `MordellLawrenceVenkatesh:LV.1/faltings-finiteness` — Frobenius eigenvalues as Weil q-numbers, stable under products and inverses
- `PadicDifferentialEquationsAndRigidCohomology:RD.7/weil-factors-rational-and-integral` — Weil q-numbers of integral weight as roots of the rigid Weil factors
- `DeligneWeightsAndPurity:DWP.1` — the all-conjugates bound √q for curves and abelian varieties

*Unit tests.* A wrong definition fails one of these.

- `isWeilNumber_roots_T2_sub_T_add_two` (value) — The roots of T² − T + 2 are Weil 2-numbers of weight 1: the discriminant is −7, so the roots (1 ± i√7)/2 are complex conjugate with product 2.
- `not_isWeilNumber_one_add_sqrt_two` (non-example) — 1 + √2 is a Weil q-number for no q > 1 and no n. Its conjugates 1 ± √2 have absolute values with product 1, forcing n = 0, while |1 + √2| ≠ 1. It has absolute value q^{1/2} at one real embedding for q = (1 + √2)², so one embedding does not suffice.
- `isWeilNumber_inv_not_isIntegral` (non-example) — For an integer q ≥ 2, q⁻¹ ∈ ℚ is a Weil q-number of weight −2 and is not integral over ℤ: purity and integrality are separate predicates.
- `isWeilNumber_rootOfUnity` (degenerate) — A root of unity is a Weil q-number of weight 0 for every q > 1; 0 is a Weil q-number of no weight.

*Construction.*

1. Conjugates: the field homomorphisms ℚ(α) → ℂ correspond to the complex roots of the minimal polynomial of α, through the adjoin-root presentation of ℚ(α).
2. Invariance: an injective ℚ-algebra map f satisfies minpoly ℚ (f α) = minpoly ℚ α (mathlib:minpoly.algHom_eq), and a ring homomorphism between fields of characteristic 0 is a ℚ-algebra map.
3. All embeddings of K: when K is algebraic over ℚ, each σ : ℚ(α) → ℂ extends to K → ℂ by mathlib:IsAlgClosed.lift applied to K over ℚ(α).
4. Roots of a rational polynomial P with P(α) = 0: the minimal polynomial divides P, so its complex roots are roots of P.
5. Nonvanishing and uniqueness: q^{n/2} > 0, so α ≠ 0. The minimal polynomial has a complex root, and q^{n/2} = q^{m/2} with q > 1 forces n = m.

*Acceptance.*

- i√q is a Weil q-number of weight 1 for every integer q ≥ 2 (its conjugates are ±i√q).
- For q ∈ ℚ with q > 1 and k ∈ ℤ, q^k is a Weil q-number of weight 2k.
- (3 + 4i)/5 is a Weil q-number of weight 0 for every q > 1, but it is neither an algebraic integer nor a root of unity.

*Uses.* `mathlib:minpoly.algHom_eq`, `mathlib:IsAlgClosed.lift`.

*Planet:* Weil q-number.

*Sources.*

- La conjecture de Weil. II, §1.2, Définition (1.2.1), p. 153: “est algébrique et que tous ses conjugués complexes sont de valeur” The definition: algebraic, with every complex conjugate of absolute value q^{n/2}.
- La conjecture de Weil. I, §1, Lemme (1.7), p. 276: “sont des nombres algébriques dont tous les conjugués complexes” The same condition on Frobenius eigenvalues in Weil I.

#### Definition. ι-weights of nonzero elements of a coefficient field

*Module* `TauCeti/Weights/IotaWeight.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/iota-weight`.

Let E be a field, ι : E → ℂ a field homomorphism (not assumed continuous; Deligne takes an isomorphism ι : ℚ̄_ℓ ≅ ℂ), and q > 1 real. For α ∈ E^×, the ι-weight of α relative to q is w_{ι,q}(α) = 2 log_q |ι(α)| ∈ ℝ, so that |ι(α)| = q^{w/2}. α is ι-pure of weight β ∈ ℝ if w_{ι,q}(α) = β. The ι-weight is a group homomorphism E^× → ℝ: w(αβ) = w(α) + w(β) and w(α⁻¹) = −w(α). Moreover w_{ι,q}(q) = 2 when q ∈ ℚ, w_{ι,q^r}(α^r) = w_{ι,q}(α) for r ≥ 1, and w_{ι∘τ,q}(α) = w_{ι,q}(τ(α)) for a field homomorphism τ. A Weil q-number of weight n is ι-pure of weight n for every ι. An element of integer ι-weight need not be algebraic or a Weil q-number.

*Hypotheses.*

- ι need not be continuous and is not canonical; ι-weights depend on ι. Purity for every ι is the theorem weil-number-iff-iota-pure-for-every-iota.
- Weights are real numbers, as Weil II (1.2.8) allows. Restricting to integers would exclude the rank-one real-weight twists of DWP.5.
- 0 has no ι-weight.
- q > 1 is part of the datum. At a closed point x, the Frobenius is F^{deg x} and the base is q^{deg x}, and w_{ι,q^r}(α^r) = w_{ι,q}(α) keeps the weight unchanged.

*API.*

- `iotaWeight` (*constructor*) — iotaWeight (ι : E →+* ℂ) (q : ℝ) (α : E) : ℝ := 2 * Real.logb q ‖ι α‖.
- `IsIotaPure` (*data*) — IsIotaPure ι q β α : Prop := α ≠ 0 ∧ iotaWeight ι q α = β.
- `iotaWeight_mul` (*simp*) — iotaWeight ι q (α * β) = iotaWeight ι q α + iotaWeight ι q β for α, β ≠ 0.
- `iotaWeight_inv` (*simp*) — iotaWeight ι q α⁻¹ = −iotaWeight ι q α.
- `iotaWeight_pow_base` (*simp*) — iotaWeight ι (q ^ r) (α ^ r) = iotaWeight ι q α for r ≥ 1.
- `iotaWeight_comp` (*compatibility*) — iotaWeight (ι.comp τ) q α = iotaWeight ι q (τ α).
- `norm_eq_rpow_iotaWeight` (*characterisation*) — ‖ι α‖ = q ^ (iotaWeight ι q α / 2) for α ≠ 0 and 1 < q.
- `IsWeilNumber.isIotaPure` (*compatibility*) — IsWeilNumber q n α → IsIotaPure ι q n α for every ι.

*Used by.*

- `DeligneWeightsAndPurity:DWP.0/endomorphism-weights` — ι-weights of the eigenvalues of an endomorphism
- `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters` — a twist by b shifts ι-weights by w_ι(b)
- `PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights` — the ι-pure and ι-mixed predicates on Frobenius eigenvalues
- `DeligneWeightsAndPurity:DWP.5` — pointwise ι-pure Weil sheaves (Weil II (1.2.6))
- `WeightsInEtaleCohomology:R34.1` — weights for a chosen embedding compared with weights for all embeddings

*Unit tests.* A wrong definition fails one of these.

- `iotaWeight_q` (value) — For q ∈ ℚ with q > 1 and every ι: w_{ι,q}(q) = 2 and w_{ι,q}(q⁻¹) = −2. So ℚ_ℓ(1), on which geometric Frobenius acts by q⁻¹, has weight −2.
- `iotaWeight_depends_on_iota` (non-example) — For E = ℚ(√2) and q = 2, α = 1 + √2 has ι-weight 2 log₂(1 + √2) at one real embedding and −2 log₂(1 + √2) at the other: the ι-weight depends on ι.
- `iotaWeight_transcendental` (non-example) — For E = ℚ(t), t transcendental, and ι(t) = √2·e^{i} (transcendental by Lindemann–Weierstrass), w_{ι,2}(t) = 1, an integer, although t is not algebraic.
- `iotaWeight_rootOfUnity` (degenerate) — w_{ι,q}(ζ) = 0 for every root of unity ζ ∈ E and every ι.

*Construction.*

1. Real.logb q is a homomorphism from the positive reals under multiplication to ℝ, and α ↦ ‖ι(α)‖ is multiplicative on E^×.
2. logb (q^r) (x^r) = logb q x for r ≥ 1 and x > 0.
3. A Weil q-number α satisfies |ι(α)| = q^{n/2}, because ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).

*Acceptance.*

- ℚ_ℓ(r): the geometric Frobenius acts by q^{−r}, of ι-weight −2r for every ι (Weil I (3.1)).
- α = (1 + i√7)/2 ∈ ℚ̄: ι-weight 1 relative to 2 for every ι.

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

*Planet:* ι-weight.

*Sources.*

- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “Dans toute la suite, nos arguments concerneront séparément” The arguments run one ι at a time, whence the ι-weight (1.2.6.1).
- La conjecture de Weil. II, §1.2, Remarque (1.2.8), p. 155: “il est commode de leur permettre d'être” ι-weights are allowed to be arbitrary real numbers.

#### Definition. Eigenvalues, Weil purity and ι-weights of an invertible endomorphism

*Module* `TauCeti/Weights/Endomorphism.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`.

Let E be a field of characteristic 0 with algebraic closure Ē, V a finite-dimensional E-vector space and F an invertible E-linear endomorphism of V. The eigenvalues of F are the roots of its characteristic polynomial det(T − F) in Ē, counted with multiplicity. The multiplicity of α equals the Ē-dimension of the maximal generalized eigenspace of F ⊗ Ē at α. (V, F) is pure of weight n relative to q if every eigenvalue is a Weil q-number of weight n. For a field homomorphism ι : Ē → ℂ, (V, F) is ι-pure of weight β ∈ ℝ if every eigenvalue has ι-weight β, and the ι-weights of (V, F) are the ι-weights of its eigenvalues, a finite subset of ℝ. The multiset of eigenvalues is stable under Aut(Ē/E), so none of these notions depends on the choice of Ē or of a splitting field inside Ē. V = 0 is pure of every weight and has no weights.

*Hypotheses.*

- F must be invertible, since the eigenvalue 0 has no weight. Frobenius on ℓ-adic cohomology over a finite field is invertible; for a general endomorphism this is a hypothesis.
- Weights are read off the characteristic polynomial through generalized eigenspaces. No eigenbasis and no semisimplicity is assumed, and a Jordan block can be pure.
- In the applications E is ℚ_ℓ, a finite extension of it, or ℚ̄_ℓ; Weil II (1.2.4) applies the terminology to vector spaces with a Frobenius.
- The ι-weights depend on ι only through the multiset {ι(α)}. That multiset does not change when the roots are taken in another splitting field inside Ē, because the roots form one Aut(Ē/E)-stable multiset.

*API.*

- `eigenvalues` (*constructor*) — eigenvalues (F : V →ₗ[E] V) : Multiset Ē := (F.charpoly.map (algebraMap E Ē)).roots, of cardinality finrank E V.
- `IsPure` (*data*) — IsPure q n F : Prop := ∀ α ∈ eigenvalues F, IsWeilNumber q n α.
- `IsIotaPureEnd` (*data*) — IsIotaPureEnd ι q β F : Prop := ∀ α ∈ eigenvalues F, IsIotaPure ι q β α.
- `iotaWeights` (*constructor*) — iotaWeights ι q F : Finset ℝ, the image of eigenvalues F under iotaWeight ι q.
- `count_eigenvalues` (*characterisation*) — (eigenvalues F).count α = finrank Ē (maxGenEigenspace (F.baseChange Ē) α).
- `eigenvalues_map_aut` (*compatibility*) — (eigenvalues F).map τ = eigenvalues F for τ : Ē ≃ₐ[E] Ē.
- `isPure_baseChange_iff` (*compatibility*) — IsPure q n (F.baseChange E′) ↔ IsPure q n F for a field extension E′/E; likewise for ι-weights.
- `IsPure.isIotaPureEnd` (*compatibility*) — IsPure q n F → IsIotaPureEnd ι q n F for every ι.

*Used by.*

- `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions` — stability under subobjects, quotients and extensions
- `DeligneWeightsAndPurity:DWP.0/weight-decomposition` — decomposition of V by weight
- `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues` — weights on the two sides of a perfect pairing
- `DeligneWeightsAndPurity:DWP.2` — the weight of a lisse sheaf on a curve through the Frobenius at each closed point (Weil I (3.1))
- `DeligneWeightsAndPurity:DWP.5` — pointwise purity of Weil sheaves (Weil II (1.2.2), (1.2.6))
- `WeilConjectures:WC.3` — degreewise purity of Frobenius on H^i

*Unit tests.* A wrong definition fails one of these.

- `isPure_jordanBlock` (value) — F = [[q, 1], [0, q]] on E² is pure of weight 2 relative to q and is not semisimple: purity does not see Jordan blocks.
- `eigenvalues_rotation` (value) — F = [[0, −q], [1, 0]] on ℚ² has characteristic polynomial T² + q, no eigenvalue in ℚ, eigenvalues ±i√q in ℚ̄, and is pure of weight 1.
- `not_isPure_diag` (non-example) — F = diag(1, q) is not pure; its weights are {0, 2}.
- `isPure_zero_space` (degenerate) — On V = 0, F is pure of every weight and has no weights.

*Construction.*

1. Eigenvalues: the characteristic polynomial commutes with extension of scalars (mathlib:LinearMap.charpoly_baseChange), and over Ē its roots are the eigenvalues (mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly).
2. Multiplicity: mathlib:LinearMap.finrank_maxGenEigenspace_eq identifies the root multiplicity with the dimension of the maximal generalized eigenspace. These spaces span V ⊗ Ē (mathlib:Module.End.iSup_maxGenEigenspace_eq_top) and are independent (mathlib:Module.End.independent_maxGenEigenspace).
3. Galois stability: det(T − F) has coefficients in E, so every τ ∈ Aut(Ē/E) permutes its roots with multiplicities.
4. Independence of choices: Weil purity depends only on minimal polynomials over ℚ (node weil-q-number), and the multiset of ι-values is invariant by the previous step.

*Acceptance.*

- Jordan block [[q, 1], [0, q]]: pure of weight 2, with a generalized eigenspace of dimension 2 and an eigenspace of dimension 1.
- Frobenius on H¹ of an elliptic curve over 𝔽_q with trace a: characteristic polynomial T² − aT + q, pure of weight 1 because |a| ≤ 2√q (the compatibility case DWP.1 imports).

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`.

*Planet:* Weights of an endomorphism.

*Sources.*

- La conjecture de Weil. I, §2, (2.6), p. 282: “(i.e. la dimension du sous-espace propre généralisé correspondant)” The multiplicity of an eigenvalue is the dimension of its generalized eigenspace.
- La conjecture de Weil. II, §1.2, Variante (1.2.4), p. 154: “vectoriels munis d'une action de Frobenius” The weight terminology for vector spaces with a Frobenius.
- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “On notera que, pour k un corps fini, une représentation V” Every Frobenius module over a finite field is ι-mixed.

#### Construction. Twists V^{(b)} and Tate twists V(r)

*Module* `TauCeti/Weights/Twist.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`.

For b ∈ E^× and an E-space V with invertible F, the twist is V^{(b)} = (V, bF) = V ⊗ E^{(b)}, where E^{(b)} is the rank-one space on which F acts by b (Weil II (1.2.7)). Its eigenvalues are the bα_i, and its ι-weights are those of V shifted by w_{ι,q}(b). With the geometric Frobenius convention, ℚ_ℓ(1) = E^{(q⁻¹)}, and the Tate twist V(r) = V ⊗ ℚ_ℓ(1)^{⊗r} = V^{(q^{−r})} (r ∈ ℤ) shifts weights by −2r. When E contains a square root q^{1/2}, the half twist V^{(q^{−1/2})} shifts weights by −1. It depends on the choice of q^{1/2}: the two choices differ by the twist by −1, of weight 0. Twisting is functorial and exact, satisfies V^{(b)} ⊗ W^{(c)} = (V ⊗ W)^{(bc)}, and dualizes as (V^{(b)})^∨ = (V^∨)^{(b⁻¹)}.

*Hypotheses.*

- Geometric Frobenius: ℚ_ℓ(1) has eigenvalue q⁻¹ and weight −2 (Weil II (1.2.5)(iv)); with arithmetic Frobenius the signs reverse. The comparison with the Galois action on roots of unity is EtaleDualityAndPerverseSheaves EDC.0's.
- b need not be an ℓ-adic unit. For b not a unit, E^{(b)} is a Weil sheaf on Spec 𝔽_q and not an étale sheaf (Weil II (1.1.14), (1.2.7)).
- For b of non-integral ι-weight the twist shifts ι-weights by a real number. These are DWP.5's rank-one real-weight twists, which are distinct from Tate twists.

*API.*

- `twist` (*constructor*) — twist (b : Eˣ) (F : V →ₗ[E] V) : V →ₗ[E] V := (b : E) • F.
- `tateTwist` (*constructor*) — tateTwist (q : Eˣ) (r : ℤ) F := twist (q ^ (−r)) F.
- `eigenvalues_twist` (*characterisation*) — eigenvalues (twist b F) = (eigenvalues F).map (b * ·).
- `iotaWeights_twist` (*characterisation*) — iotaWeights ι q (twist b F) = (iotaWeights ι q F).image (· + iotaWeight ι q b).
- `IsPure.tateTwist` (*compatibility*) — IsPure q n F → IsPure q (n − 2r) (tateTwist q r F), for q a positive integer viewed in E and in ℝ.
- `twist_tensor` (*compatibility*) — TensorProduct.map (twist b F) (twist c G) = twist (b * c) (TensorProduct.map F G).
- `twist_twist` (*simp*) — twist b (twist c F) = twist (b * c) F.

*Used by.*

- `GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist` — the half Tate twist and the correction factor q^{−d/2}
- `DeligneWeightsAndPurity:DWP.5` — rank-one real-weight twists
- `WeilConjectures:WC.2` — the Tate twist in the Poincaré pairing H^i × H^{2d−i} → ℚ_ℓ(−d)
- `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues` — a pairing into E^{(c)}

*Unit tests.* A wrong definition fails one of these.

- `tateTwist_weight` (value) — ℚ_ℓ(1) = E^{(q⁻¹)} is pure of weight −2, and ℚ_ℓ(r) of weight −2r.
- `twist_one` (degenerate) — twist 1 F = F, and V(0) = V.
- `halfTwist_depends_on_sqrt` (non-example) — The half twist depends on the square root: for V = E and F = 1, the choices q^{1/2} and −q^{1/2} give eigenvalues q^{−1/2} and −q^{−1/2}, non-isomorphic Frobenius modules, both of weight −1.
- `twist_nonintegral_weight` (non-example) — For b with w_{ι,q}(b) = 1/2, for instance b transcendental with |ι(b)| = q^{1/4}, E^{(b)} is ι-pure of the non-integral weight 1/2 and is not pure in the sense of Weil numbers.

*Construction.*

1. Eigenvalues: det(T − bF) = b^d det(T/b − F), or the theorem spectra-of-tensor-products-and-duals with the rank-one factor E^{(b)}.
2. Weights: w_ι(bα) = w_ι(b) + w_ι(α) (node iota-weight). For Weil numbers, q^{−r}α has weight n − 2r (theorem weil-number-arithmetic).
3. Functoriality, exactness and the tensor and dual formulas hold on underlying spaces, where the twist is the identity.

*Acceptance.*

- H²(ℙ¹) = ℚ_ℓ(−1) has F = q and weight 2; its twist H²(ℙ¹)(1) is ℚ_ℓ with F = 1 and weight 0.

*Uses.* `DeligneWeightsAndPurity:DWP.0/iota-weight`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `EtaleDualityAndPerverseSheaves:EDC.0`.

*Sources.*

- La conjecture de Weil. II, §1.2, (1.2.7), p. 154: “de rang un et pour lequel F soit la multiplication par b.” The rank-one Weil sheaf on which F acts by b.
- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(iv), p. 154: “est ponctuellement pur de poids —2.” ℚ_ℓ(1) is pointwise pure of weight −2.

### Theorems

#### Theorem. Products, inverses, conjugation and integrality of Weil q-numbers

*Module* `TauCeti/Weights/WeilNumber.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

Let q > 1, and let α, β ∈ K be Weil q-numbers of weights n and m. (i) αβ is a Weil q-number of weight n + m, α⁻¹ one of weight −n, and α^k one of weight kn for k ∈ ℤ. (ii) If q is rational, q^k is a Weil q-number of weight 2k for k ∈ ℤ. (iii) If q is rational, then for every field homomorphism σ : K → ℂ the complex conjugate of σ(α) is q^n/σ(α). In particular α + q^n α⁻¹ is a totally real algebraic number. (iv) If α is integral over ℤ, then n ≥ 0, and if moreover n = 0 then α is a root of unity. A sum of Weil q-numbers is not a Weil q-number in general.

*Hypotheses.*

- Products need a common field: the conjugates of αβ are the σ(α)σ(β) for σ : ℚ(α, β) → ℂ, and each such σ restricts to embeddings of ℚ(α) and of ℚ(β).
- Integrality is needed in (iv): (3 + 4i)/5 has weight 0 and is not a root of unity, and q⁻¹ has weight −2.
- (iii) uses q ∈ ℚ so that q^n α⁻¹ lies in K.

*Proof.*

1. Common field: every embedding of ℚ(αβ) into ℂ extends to ℚ(α, β) (mathlib:IsAlgClosed.lift), so the conjugates of αβ are products σ(α)σ(β) of conjugates taken with the same σ.
2. Inverses and powers: |σ(α)⁻¹| = q^{−n/2} and |σ(α)^k| = q^{kn/2}.
3. q^k is rational, it is its own only conjugate, and |q^k| = q^{2k/2}.
4. Complex conjugation: σ(α)·conj(σ(α)) = |σ(α)|² = q^n.
5. Integrality: the norm of α from ℚ(α) to ℚ is a nonzero integer of absolute value q^{nd/2}, where d = [ℚ(α) : ℚ]. So q^{nd/2} ≥ 1 and n ≥ 0. For n = 0 every conjugate has absolute value 1, and mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one applied to the number field ℚ(α) makes α a root of unity.

*Acceptance.*

- 1 + i is a Weil 2-number of weight 1, and (1 + i)² = 2i one of weight 2. The sum (1 + i) + 1 = 2 + i has absolute value √5 and is not a Weil 2-number.
- For α = (1 + i√7)/2 and q = 2: α + 2/α = α + ᾱ = 1, totally real as (iii) predicts.
- ζ₅ has weight 0, is integral and is a root of unity; (3 + 4i)/5 has weight 0 and is neither.

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `mathlib:IsAlgClosed.lift`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`.

*Sources.*

- La conjecture de Weil. II, §1.2, Définition (1.2.12), p. 156: “sont des nombres algébriques totalement réels” Totally real Frobenius polynomials, reached through α + q^n/α.
- La conjecture de Weil. II, §1.2, Remarque (1.2.14), p. 156: “Tout faisceau lisse ponctuellement pur y est facteur direct” A pure object is a direct factor of a totally real one, V ⊕ V^∨(−n), by (iii).

#### Theorem. Weil numbers under powers: change of q to q^r

*Module* `TauCeti/Weights/WeilNumber.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`.

Let q > 1, n ∈ ℤ and r ≥ 1. An element α of K is a Weil q-number of weight n if and only if α^r is a Weil q^r-number of weight n.

*Hypotheses.*

- r ≥ 1. The backward implication needs algebraicity of α, which follows from that of α^r, since α is a root of T^r − α^r.
- In the finite-field applications, a finite extension of k₀ of degree r replaces the geometric Frobenius F by F^r and q by q^r. At a closed point x of degree d, F_x = F^d and q_x = q^d.

*Proof.*

1. Every embedding τ : ℚ(α^r) → ℂ extends to σ : ℚ(α) → ℂ (mathlib:IsAlgClosed.lift), and then τ(α^r) = σ(α)^r. Conversely, σ(α)^r is a conjugate of α^r.
2. |σ(α)|^r = (q^r)^{n/2} if and only if |σ(α)| = q^{n/2}, since x ↦ x^r is injective on [0, ∞).
3. α is algebraic over ℚ if and only if α^r is.

*Acceptance.*

- α = 1 + i (q = 2, weight 1): α² = 2i is a Weil 4-number of weight 1, since |2i| = 2 = 4^{1/2}.
- 1 and ζ₃ have the same cube and both have weight 0: the power forgets the difference between α and ζα, but not the weight.

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `mathlib:IsAlgClosed.lift`.

*Sources.*

- La conjecture de Weil. I, §1, (1.5.1), p. 275: “Une formule analogue vaut pour les itérés de F” Extension of the finite field replaces F by its iterates.
- La conjecture de Weil. II, §1.1, (1.1.13), p. 152: “étant la puissance entière” The Frobenius at a point of degree d maps to the d-th power of the Frobenius substitution.

#### Lemma. Embeddings into ℂ extending a given embedding, and isomorphisms ℚ̄_ℓ ≅ ℂ

*Module* `TauCeti/Weights/ComplexEmbedding.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers`.

(i) Let E be a field of characteristic 0 with #E ≤ 𝔠, k ⊆ E a countable subfield, and σ : k → ℂ a field homomorphism. Then σ extends to a field homomorphism E → ℂ. (ii) If moreover E is algebraically closed with #E = 𝔠, then σ extends to a field isomorphism E ≅ ℂ. (iii) For every prime ℓ, #ℚ_ℓ = #ℚ̄_ℓ = 𝔠. So field isomorphisms ι : ℚ̄_ℓ ≅ ℂ exist, and every embedding into ℂ of a number field K ⊂ ℚ̄_ℓ extends to one. (iv) If α ∈ E is transcendental over ℚ, then for every transcendental z ∈ ℂ there is a field homomorphism ι : E → ℂ with ι(α) = z, which is an isomorphism in case (ii).

*Hypotheses.*

- The extensions are not continuous for the ℓ-adic topology and are not canonical. Their existence uses transcendence bases, hence the axiom of choice. Deligne notes in Weil II (1.2.11) that for algebraicity statements the embeddings of the algebraic numbers suffice, and those need no choice.
- Countability of k leaves room: ℂ has transcendence degree 𝔠 over σ(k), at least that of E over k.
- (ii) needs #E = 𝔠, not only #E ≤ 𝔠: a countable algebraically closed field is not isomorphic to ℂ.

*Proof.*

1. Transcendence degrees: for a countable subfield k, a transcendence basis of ℂ over σ(k) has cardinality 𝔠 (mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt with mathlib:Cardinal.mk_complex). A transcendence basis of E over k has cardinality at most #E ≤ 𝔠.
2. Choose a transcendence basis B of E over k and an injection of B into a transcendence basis of ℂ over σ(k). This gives k(B) → ℂ extending σ.
3. E is algebraic over k(B); extend to E → ℂ by mathlib:IsAlgClosed.lift.
4. (ii): when E is algebraically closed of cardinality 𝔠, both transcendence bases have cardinality 𝔠. mathlib:IsAlgClosed.equivOfTranscendenceBasis, applied over k with ℂ a k-algebra through σ, gives a ring isomorphism E ≅ ℂ. Mathlib states only the ring isomorphism: that it restricts to σ on k holds by its construction (a k-algebra isomorphism of polynomial rings extended to algebraic closures) and is a proof obligation here. The case k = ℚ, with no compatibility to check, is mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero.
5. (iii): #ℤ_ℓ ≥ 𝔠, because (a_i) ↦ Σ a_i ℓ^i is injective on sequences in {0, 1}. #ℚ_ℓ ≤ 𝔠, because ℚ_ℓ is a quotient of a set of sequences of rationals. #ℚ̄_ℓ = #ℚ_ℓ by mathlib:Algebra.IsAlgebraic.cardinalMk_le_max.
6. (iv): apply (i) or (ii) to k = ℚ(α) with σ : ℚ(α) ≅ ℚ(z), α ↦ z.

*Acceptance.*

- Isomorphisms ℚ̄_5 ≅ ℂ exist, and a given embedding of ℚ(√−1) ⊂ ℚ̄_5 into ℂ extends to one.
- No such isomorphism is continuous: ℓ^n → 0 in ℚ̄_ℓ, while ι(ℓ^n) = ℓ^n → ∞ in ℂ.

*Uses.* `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt`, `mathlib:Cardinal.mk_complex`, `mathlib:IsAlgClosed.lift`, `mathlib:IsAlgClosed.equivOfTranscendenceBasis`, `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero`, `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max`.

*Sources.*

- La conjecture de Weil. II, §1.2, Remarque (1.2.11), p. 156: “Je ne prétends pas croire à l'existence d'isomorphismes” ι is an expository device, and its existence depends on choice.
- La conjecture de Weil. II, §1.2, Remarque (1.2.11), p. 156: “ne requiert pas l'axiome du choix” Embeddings of the algebraic numbers alone need no choice.

#### Theorem. Algebraicity and Weil purity from ι-purity at every ι

*Module* `TauCeti/Weights/IotaWeight.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`.

Let E be a field of characteristic 0 with #E ≤ 𝔠 (for instance a finite extension of ℚ_ℓ, or ℚ̄_ℓ), q > 1 and n ∈ ℤ. For α ∈ E the following are equivalent: (a) α is a Weil q-number of weight n; (b) |ι(α)| = q^{n/2} for every field homomorphism ι : E → ℂ. If E is algebraically closed with #E = 𝔠, (b) may be restricted to field isomorphisms ι : E ≅ ℂ. In particular, an endomorphism that is ι-pure of weight n for every ι is pure of weight n.

*Hypotheses.*

- The cardinality bound is needed: a field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and (b) would be vacuous.
- (b) for a single ι does not imply (a): see the tests of the node iota-weight.

*Proof.*

1. (a) ⇒ (b): ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).
2. (b) ⇒ α algebraic: if α were transcendental, part (iv) of the lemma embeddings-into-the-complex-numbers gives ι with ι(α) = z for any transcendental z; all but countably many complex numbers are transcendental, so z can be chosen with |z| ≠ q^{n/2}.
3. (b) ⇒ the conjugate condition: every σ : ℚ(α) → ℂ extends to E → ℂ, by part (i) of the lemma with k = ℚ(α), which is countable. So |σ(α)| = q^{n/2}.
4. Isomorphism variant: use part (ii) of the lemma in both steps.

*Acceptance.*

- A root α ∈ ℚ̄_5 of T² − T + 2 satisfies |ι(α)| = √2 for every ι : ℚ̄_5 ≅ ℂ.
- A transcendental t ∈ ℚ_5 (one exists, since #ℚ_5 = 𝔠) is ι-pure of weight 0 relative to 5 for an ι with ι(t) = e^{i}, and of weight 2 for an ι with ι(t) = 5e^{i}.

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers`.

*Sources.*

- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “est alors automatiquement algébrique, sans quoi” Purity at every ι forces algebraicity.
- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “quel nombre transcendant” For transcendental α, ι(α) could be any transcendental number.

#### Lemma. Multiplicativity of the characteristic polynomial along an invariant subspace

*Module* `TauCeti/Weights/Charpoly.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`.

Let V be a finite-dimensional E-vector space, F ∈ End_E(V), and W ⊆ V an F-stable subspace, with induced endomorphisms F_W of W and F_{V/W} of V/W. Then det(T − F) = det(T − F_W)·det(T − F_{V/W}). Consequently det(1 − tF) = det(1 − tF_W)·det(1 − tF_{V/W}) and det F = det F_W · det F_{V/W}, and the eigenvalue multiset of F is the sum of those of F_W and F_{V/W}.

*Hypotheses.*

- A vector-space complement of W, which need not be F-stable, gives a block upper-triangular matrix. The statement concerns characteristic polynomials only; the extension need not split F-equivariantly.

*Proof.*

1. Extend a basis of W to a basis of V. The matrix of F is block upper triangular, with diagonal blocks the matrices of F_W and F_{V/W}.
2. mathlib:Matrix.charpoly_fromBlocks_zero₂₁ computes the characteristic polynomial of a block upper-triangular matrix as the product of those of the diagonal blocks. The split case is mathlib:LinearMap.charpoly_prodMap.
3. The roots of a product are the sum of the roots of the factors.

*Acceptance.*

- Jordan block [[q, 1], [0, q]] with W = E e₁: F_W = q, F_{V/W} = q, and (T − q)² = (T − q)(T − q).

*Uses.* `mathlib:Matrix.charpoly_fromBlocks_zero₂₁`, `mathlib:LinearMap.charpoly_prodMap`.

*Sources.*

- La conjecture de Weil. I, §1, (1.5.3), p. 276: “et observer que les deux membres sont additifs en V dans” Additivity in short exact sequences, used to prove (1.5.3).

#### Theorem. Purity and weights under subobjects, quotients, extensions and direct sums

*Module* `TauCeti/Weights/Endomorphism.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`.

Let F be an invertible endomorphism of V and W ⊆ V an F-stable subspace. (i) (V, F) is pure of weight n if and only if (W, F_W) and (V/W, F_{V/W}) are both pure of weight n; the same holds for ι-purity of weight β. (ii) The ι-weights of V are the union of those of W and of V/W, and likewise for a direct sum. (iii) So the pairs (V, F) that are pure of weight n form a class closed under subobjects, quotients and extensions.

*Hypotheses.*

- F_W and F_{V/W} are invertible when F is: F_W is injective on a finite-dimensional space, and det F = det F_W · det F_{V/W}.
- (i) does not say that an extension of pure objects of the same weight splits: the Jordan block is a non-split extension of (E, q) by (E, q).

*Proof.*

1. The lemma characteristic-polynomial-in-short-exact-sequences gives the eigenvalue multiset of V as the sum of those of W and V/W.
2. Purity and ι-weights are conditions on each eigenvalue (node endomorphism-weights).

*Acceptance.*

- V = E², F = diag(1, q), W = E e₂: W has weight 2, V/W has weight 0, and V is not pure.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`.

*Sources.*

- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(i), p. 154: “stable par les opérations de passage au quotient, à un sous-faisceau, par extension, image réciproque,” Pointwise purity is stable under quotients, subobjects and extensions.

#### Theorem. The characteristic power series det(1 − tF) and traces of powers

*Module* `TauCeti/Weights/Charpoly.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

Let F be an endomorphism of a finite-dimensional vector space V over a field E. (i) det(1 − tF) ∈ E[t] is the reverse of det(T − F): det(1 − tF) = t^{dim V} det(t⁻¹ − F), and over Ē it is ∏(1 − αt) over the eigenvalues α. (ii) In E[[t]], t (d/dt) log det(1 − tF)⁻¹ = Σ_{n≥1} Tr(F^n) t^n. (iii) If E has characteristic 0, the traces Tr(F^n) for 1 ≤ n ≤ dim V determine det(1 − tF), hence the eigenvalue multiset.

*Hypotheses.*

- (iii) needs characteristic 0 (characteristic greater than dim V suffices). On 𝔽_p^p, the identity and the zero map have equal traces of all powers.
- The logarithm is taken of a power series with constant term 1.

*Proof.*

1. (i): mathlib:Matrix.reverse_charpoly identifies the reverse of the characteristic polynomial with det(1 − tM). Over an algebraically closed field the characteristic polynomial is the product of the T − α.
2. (ii), as in Weil I: both sides are additive in V along a short exact sequence (lemma characteristic-polynomial-in-short-exact-sequences, and additivity of the trace). For dim V = 1 and F = α, the identity is t d/dt log(1 − αt)⁻¹ = Σ α^n t^n. Over Ē, V has a full F-stable flag, which reduces the general case to dimension 1.
3. (iii): Newton's identities. In characteristic 0 the power sums p_n = Tr(F^n) = Σ α_i^n for n ≤ d determine the elementary symmetric functions of the α_i, which are the coefficients of det(1 − tF) up to sign (mathlib:Matrix.trace_eq_sum_roots_charpoly gives p₁ = Σ α_i).

*Acceptance.*

- F = diag(1, q): det(1 − tF) = (1 − t)(1 − qt), and Σ (1 + q^n) t^n = t d/dt (−log(1 − t) − log(1 − qt)).
- Over 𝔽_p, id and 0 on 𝔽_p^p: Tr(F^n) = p = 0 for both, while det(1 − t·id) = (1 − t)^p ≠ 1.

*Uses.* `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`, `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.trace_eq_sum_roots_charpoly`.

*Sources.*

- La conjecture de Weil. I, §1, (1.5.3), p. 275: “d'un espace vectoriel V, on a une identité de séries” The identity (1.5.3) between the log-derivative of det(1 − Ft)⁻¹ and the traces of the powers of F.

#### Theorem. Eigenvalues of P(F), F^r and F⁻¹, with multiplicities

*Module* `TauCeti/Weights/Spectrum.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`.

Let F be an endomorphism of a finite-dimensional E-vector space V with eigenvalue multiset {α₁, …, α_d} ⊂ Ē, and let P ∈ E[T]. Then the eigenvalue multiset of P(F) is {P(α₁), …, P(α_d)}, with multiplicities. In particular F^r has eigenvalues α_i^r (r ≥ 1), and if F is invertible, F⁻¹ has eigenvalues α_i⁻¹. The maximal generalized eigenspace of F at α is contained in that of P(F) at P(α).

*Hypotheses.*

- The statement is about multisets. Mathlib's spectral mapping theorem (spectrum.map_polynomial_aeval_of_nonempty) is an equality of sets, which loses multiplicities: for F = diag(1, −1) and P = T², the multiset is {1, 1}, while the set is {1}.

*Proof.*

1. Extend scalars to Ē (mathlib:LinearMap.charpoly_baseChange). V_Ē is the direct sum of the maximal generalized eigenspaces V_α (mathlib:Module.End.iSup_maxGenEigenspace_eq_top, mathlib:Module.End.independent_maxGenEigenspace), and each is F-stable.
2. On V_α, F − α is nilpotent, and P(F) − P(α) = (F − α)Q(F) with Q ∈ Ē[T]. So P(F) − P(α) is nilpotent on V_α, and the characteristic polynomial of P(F) on V_α is (T − P(α))^{dim V_α}.
3. The characteristic polynomial is multiplicative on the direct sum (mathlib:LinearMap.charpoly_prodMap), and dim V_α is the multiplicity of α (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
4. F⁻¹: on V_α, F⁻¹ − α⁻¹ = −α⁻¹F⁻¹(F − α) is nilpotent. Alternatively, mathlib:Matrix.charpoly_inv gives the characteristic polynomial of the inverse matrix through the reversed polynomial.

*Acceptance.*

- F = diag(1, −1), P = T²: eigenvalues {1, 1}, and F² = id.
- The square of the Jordan block [[q, 1], [0, q]] is [[q², 2q], [0, q²]], with eigenvalue q² of multiplicity 2.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`, `mathlib:LinearMap.charpoly_prodMap`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Matrix.charpoly_inv`.

*Sources.*

- La conjecture de Weil. I, §1, (1.5.1), p. 275: “Une formule analogue vaut pour les itérés de F” Traces of the iterates of Frobenius, whose eigenvalues are the powers of those of F.

#### Theorem. Weights under a finite extension of the finite base field

*Module* `TauCeti/Weights/Endomorphism.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`.

Let F be an invertible endomorphism of V, q > 1 and r ≥ 1. (V, F) is pure of weight n relative to q if and only if (V, F^r) is pure of weight n relative to q^r. For every ι, the ι-weights of F relative to q equal the ι-weights of F^r relative to q^r, with multiplicities. In the finite-field situation, passing from k₀ = 𝔽_q to its extension of degree r replaces the geometric Frobenius F by F^r and q by q^r, so the weights do not change. At a closed point x, F_x = F^{deg x} acts with base q_x = q^{deg x}.

*Hypotheses.*

- The equivalence concerns weights only: F^r can have a repeated eigenvalue where F has distinct ones (α and ζα with ζ^r = 1).

*Proof.*

1. The theorem spectra-of-polynomials-in-an-endomorphism with P = T^r: the eigenvalues of F^r are the α_i^r.
2. The theorem weil-number-base-extension for Weil purity, and iotaWeight_pow_base (node iota-weight) for ι-weights.

*Acceptance.*

- F = [[0, −q], [1, 0]] has eigenvalues ±i√q, of weight 1 relative to q. F² = −q·id has eigenvalue −q twice, of weight 1 relative to q².

*Uses.* `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`.

*Sources.*

- La conjecture de Weil. II, §1.1, (1.1.13), p. 152: “étant la puissance entière” The Frobenius at a point of degree d maps to the d-th power of the Frobenius substitution.

#### Theorem. Eigenvalues of tensor products, contragredients and Hom spaces

*Module* `TauCeti/Weights/Spectrum.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`.

Let F and G be invertible endomorphisms of finite-dimensional E-spaces V and W, with eigenvalue multisets {α_i} and {β_j}. (i) F ⊗ G on V ⊗_E W has eigenvalue multiset {α_i β_j}. (ii) The transpose F^* on V^* has the eigenvalues of F. The contragredient F^∨ = (F⁻¹)^* has eigenvalues {α_i⁻¹}. (iii) On Hom_E(V, W), the endomorphism u ↦ G ∘ u ∘ F⁻¹ has eigenvalues {β_j α_i⁻¹}. (iv) F^{⊗k} on V^{⊗k} has as eigenvalues the products of k eigenvalues, and det F = ∏ α_i. Consequently, if V is pure of weight n and W of weight m, then V ⊗ W is pure of weight n + m, V^∨ of weight −n, Hom(V, W) of weight m − n, and V^{⊗k} of weight kn. The ι-weights behave in the same way.

*Hypotheses.*

- Dual means the contragredient (F⁻¹)^*, as for representations and for the dual of a lisse sheaf in Weil II (1.2.5)(ii). The transpose F^* has the same eigenvalues as F, not their inverses.
- No semisimplicity is used; multiplicities are dimensions of generalized eigenspaces.

*Proof.*

1. Over Ē, V = ⊕ V_α and W = ⊕ W_β (maximal generalized eigenspaces), so V ⊗ W = ⊕ V_α ⊗ W_β.
2. On V_α ⊗ W_β, F ⊗ G − αβ = (F − α) ⊗ G + α(1 ⊗ (G − β)) is a sum of two commuting nilpotent endomorphisms, hence nilpotent. The dimensions multiply.
3. Transpose: in the dual basis the matrix of F^* is the transpose, which has the same characteristic polynomial (mathlib:LinearMap.det_dualMap for the determinant). The contragredient is the transpose of F⁻¹, whose eigenvalues are given by the theorem spectra-of-polynomials-in-an-endomorphism.
4. Hom(V, W) ≅ V^* ⊗ W, and u ↦ GuF⁻¹ corresponds to F^∨ ⊗ G.
5. Consistency checks: det(A ⊗ B) = det(A)^{dim W} det(B)^{dim V} (mathlib:Matrix.det_kronecker) and Tr(F ⊗ G) = Tr F · Tr G (mathlib:LinearMap.trace_tensorProduct').
6. Weights: products and inverses of Weil q-numbers (theorem weil-number-arithmetic), and additivity of ι-weights.

*Acceptance.*

- diag(1, q) ⊗ diag(1, q) = diag(1, q, q, q²), with weights 0, 2, 2, 4.
- The contragredient of ℚ_ℓ(1) is ℚ_ℓ(−1): the eigenvalue q⁻¹ becomes q, and the weight −2 becomes 2.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `mathlib:Matrix.det_kronecker`, `mathlib:LinearMap.trace_tensorProduct'`, `mathlib:LinearMap.det_dualMap`.

*Sources.*

- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(ii), p. 154: “Le produit tensoriel de deux faisceaux ponctuellement purs de poids n et m est ponctuel-” Tensor products add weights.
- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(ii), p. 154: “faisceau lisse ponctuellement pur de poids n est ponctuellement” The dual of a pure lisse sheaf of weight n is pure of weight −n.

#### Theorem. Eigenvalues under a Frobenius-equivariant perfect pairing

*Module* `TauCeti/Weights/Pairing.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`.

Let V and V′ be E-spaces of finite dimension d with invertible endomorphisms F and F′, and ⟨ , ⟩ : V × V′ → E a perfect bilinear pairing with ⟨Fx, F′y⟩ = c⟨x, y⟩ for some c ∈ E^×. Then: (i) under the isomorphism V′ ≅ V^* given by the pairing, F′ corresponds to c·(F⁻¹)^*; (ii) the eigenvalue multiset of F′ is {c/α_i}, and det(T − F′) = (−T)^d det(c/T − F) / det F; (iii) over Ē, the maximal generalized eigenspaces satisfy ⟨V_α, V′_β⟩ = 0 unless αβ = c, and the pairing restricts to a perfect pairing V_α × V′_{c/α} → Ē; (iv) if V is pure of weight n and c is a Weil q-number of weight w, then V′ is pure of weight w − n, and likewise for ι-weights. For V′ = V, the eigenvalue multiset of F is stable under α ↦ c/α.

*Hypotheses.*

- Perfectness is needed: for the zero pairing the equivariance holds for every F′.
- c is the eigenvalue of Frobenius on the target line. For Poincaré duality H^i × H^{2m−i} → H^{2m} ≅ ℚ_ℓ(−m), c = q^m (Weil I (2.4)–(2.5)). The geometric inputs, that cup product commutes with F and that F acts by q^m on H^{2m}, belong to EDC and WC.2.
- No semisimplicity is assumed: (iii) is a statement about generalized eigenspaces.
- The parity of the multiplicity of ±√c for a symmetric or alternating self-pairing, and the sign of the functional equation, are WeilConjectures WC.2's.

*Proof.*

1. (i): ⟨x, F′y⟩ = c⟨F⁻¹x, y⟩, so the adjoint of F′ with respect to the pairing is cF⁻¹.
2. (ii): the transpose has the same characteristic polynomial. mathlib:Matrix.charpoly_inv expresses the characteristic polynomial of an inverse through the reversed polynomial, and scaling by c gives the formula. The eigenvalues are the c/α_i by the theorem spectra-of-polynomials-in-an-endomorphism applied to F⁻¹.
3. (iii): ⟨Fx, y⟩ = c⟨x, F′⁻¹y⟩, so ⟨(F − α)^N x, y⟩ = ⟨x, (cF′⁻¹ − α)^N y⟩. For x ∈ V_α take N with (F − α)^N x = 0. On V′_β, cF′⁻¹ − α is c/β − α plus a nilpotent, hence invertible unless αβ = c. So ⟨x, y⟩ = 0 unless αβ = c, and perfectness on the direct sums forces each V_α × V′_{c/α} to be perfect.
4. (iv): c/α is a Weil q-number of weight w − n (theorem weil-number-arithmetic), and w_ι(c/α) = w_ι(c) − w_ι(α).

*Acceptance.*

- A curve of genus g: H⁰ × H² with c = q gives eigenvalue 1 on H⁰ and q on H². H¹ × H¹ is alternating with c = q, so the eigenvalues on H¹ are stable under α ↦ q/α.
- The Jordan block F = [[q, 1], [0, q]] paired with V′ = E² for c = q²: F′ = q²(F⁻¹)^* has eigenvalue q with multiplicity 2 and is again a Jordan block.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `mathlib:Matrix.charpoly_inv`.

*Planet:* Reciprocal pairing.

*Sources.*

- La conjecture de Weil. I, §2, (2.5), p. 281: “Le cup-produit commute à l'image réciproque F* par le morphisme de Fro-” Cup product commutes with Frobenius: the equivariance hypothesis.
- La conjecture de Weil. I, §2, (2.5), p. 281: “d) Les valeurs propres de F* ont donc la propriété (2.4).” The eigenvalues in the complementary degree are q^m α_j⁻¹, as in (2.4).

#### Theorem. Disjoint spectra: no nonzero Frobenius-equivariant maps between different weights

*Module* `TauCeti/Weights/Separation.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`.

Let F and G be endomorphisms of finite-dimensional E-spaces V and W whose characteristic polynomials have no common root in Ē, equivalently are coprime in E[T]. Then every E-linear u : V → W with u ∘ F = G ∘ u is zero. In particular: (i) if V is pure of weight n and W pure of weight m ≠ n, relative to q > 1, or ι-pure of weights β ≠ γ, then there is no nonzero equivariant map V → W; (ii) if W ⊆ V is F-stable, with W pure of weight n and V/W pure of weight m ≠ n, then W has a unique F-stable complement.

*Hypotheses.*

- q > 1 is needed for the weights to separate eigenvalues (node weil-q-number).
- Equal weights allow non-split extensions (the Jordan block) and nonzero maps.

*Proof.*

1. Coprimality: two polynomials with no common root in Ē are coprime (mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed). Write aP_F + bP_G = 1.
2. Cayley–Hamilton: P_F(F) = 0 (mathlib:LinearMap.aeval_self_charpoly). From uF = Gu we get 0 = uP_F(F) = P_F(G)u. Since a(G)P_F(G) = 1 − b(G)P_G(G) = 1, P_F(G) is invertible, and u = 0. No extension of scalars is needed.
3. Different weights give disjoint eigenvalue sets, by uniqueness of the weight (node weil-q-number, q > 1) or of the ι-weight.
4. (ii): with P_n and P_m the characteristic polynomials of W and V/W, V = ker P_n(F) ⊕ ker P_m(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime and Cayley–Hamilton). ker P_n(F) contains W and has the same dimension, so ker P_m(F) is an F-stable complement. It is unique, because an F-stable complement is isomorphic to V/W, hence annihilated by P_m(F).

*Acceptance.*

- V = (E, 1) and W = (E, q): every equivariant map V → W is zero.
- Jordan block: W = E e₁ and V/W both have weight 2, and there is no F-stable complement.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`.

*Planet:* Weight separation.

*Sources.*

- La conjecture de Weil. I, §1, preuve de (1.7) ⇒ (1.6), p. 277: “sont premiers entre eux” Factors of different weights are coprime.

#### Theorem. Decomposition of a Frobenius module by weights

*Module* `TauCeti/Weights/Separation.lean`. *Node* `DeligneWeightsAndPurity:DWP.0/weight-decomposition`.

Let F be an invertible endomorphism of a finite-dimensional E-space V, and q > 1. (i) If every eigenvalue of F is a Weil q-number, then V = ⊕_n V_n, a finite sum over n ∈ ℤ. Here V_n = ker P_n(F), and P_n ∈ E[T] is the monic polynomial whose roots are the eigenvalues of weight n, with their multiplicities. Each V_n is F-stable and pure of weight n, and det(T − F) = ∏ P_n. (ii) For ι : Ē → ℂ the same holds over Ē with real weights: V ⊗ Ē = ⊕_β (V ⊗ Ē)_β. (iii) The decompositions are functorial: an equivariant map V → W maps V_n into W_n.

*Hypotheses.*

- (i) holds over E itself. P_n has coefficients in E because Aut(Ē/E) permutes the eigenvalues, preserving multiplicities and Weil weights, and E is perfect.
- (ii) does not descend to E in general, because the ι-weight is not Galois-invariant. Take E = ℚ and F with characteristic polynomial T² − 2T − 1 (eigenvalues 1 ± √2). For every ι it has the two distinct ι-weights ±2 log₂(1 + √2) relative to 2, but no F-stable line over ℚ.
- Each V_n need not be semisimple.
- Separating the factors of a zeta function, with their integrality and ℓ-independence, is WeilConjectures WC.3's. This node decomposes one Frobenius module.

*Proof.*

1. Group the eigenvalues by weight, which is unique for q > 1, and set P_n = ∏_{w(α) = n} (T − α)^{m_α}.
2. P_n ∈ E[T]: it is invariant under Aut(Ē/E) (node endomorphism-weights), and in characteristic 0 the fixed field of Aut(Ē/E) is E.
3. The P_n are pairwise coprime (theorem disjoint-spectra-no-intertwiner, first step), so V = ⊕ ker P_n(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime with Cayley–Hamilton, mathlib:LinearMap.aeval_self_charpoly).
4. The characteristic polynomial of F on V_n is P_n: V_n ⊗ Ē is the sum of the generalized eigenspaces at the roots of P_n, whose dimensions are the multiplicities (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
5. Functoriality: the theorem disjoint-spectra-no-intertwiner applied to the components V_n → W_m with n ≠ m.

*Acceptance.*

- F = diag(1, q) ⊕ [[q, 1], [0, q]] on E⁴: V₀ = E e₁, and V₂ has dimension 3.
- Descent fails for ι-weights: T² − 2T − 1 over ℚ, as in the hypotheses.

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`.

*Planet:* Weight decomposition.

*Sources.*

- La conjecture de Weil. I, §1, preuve de (1.7) ⇒ (1.6), p. 277: “Cet ensemble est stable” The eigenvalues of a given weight form a Galois-stable set, so their polynomial has coefficients in the base field.

## DWP.1 Curves and abelian varieties: the initial Weil estimate

No nodes yet.

### What is missing

- Not planned in checkpoint 1. RS-17 narrows DWP.1 to the independent curve and abelian-variety estimate. It imports polarization, Rosati positivity and the H¹ realization from AbelianSchemesAndArithmeticModuli A2 and A6, the curve trace comparison from TraceFormula Layer 8, the Hasse bound from Tau Ceti EllipticCurves Layer 3, and ArithmeticGaloisRepresentations R01.6. Weil I §§1–2 give the cohomological setting; the classical Weil argument needs a public account of the Rosati positivity proof, still to be chosen.

## DWP.2 Weil I's fundamental estimate, with its actual hypotheses

### Objects

#### Definition. The weight and the L-function of a lisse sheaf on an open curve

*Module* `TauCeti/Weights/WeilI/LisseSheaf.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`.

Let U₀ ⊆ ℙ¹ over 𝔽_q be the complement of a finite set of closed points, U = U₀ ⊗ 𝔽̄_q, and F₀ a lisse ℚ_ℓ-sheaf on U₀, with pullback F on U. For a closed point x ∈ |U₀|, write q_x = q^{deg x} and F_x for the geometric Frobenius at x acting on the stalk of F₀ at a geometric point over x. Its characteristic polynomial does not depend on the geometric point. F₀ has weight β ∈ ℤ if, for every x ∈ |U₀|, F_x is pure of weight β relative to q_x (node endomorphism-weights of DWP.0). The L-function is Z(U₀, F₀, t) = ∏_{x ∈ |U₀|} det(1 − F_x t^{deg x}, F₀)⁻¹ ∈ ℚ_ℓ[[t]] (Weil I (1.14.1)). For example ℚ_ℓ(r) has weight −2r.

*Hypotheses.*

- This is Weil I (3.1): all complex conjugates of the Frobenius eigenvalues, that is, Weil q_x-numbers. DWP.5 generalizes it to Weil II's pointwise purity on schemes of finite type and to real ι-weights, and must identify its predicate with this one on open subsets of ℙ¹.
- F₀ has a fixed ℚ_ℓ-model, as RS-17 keeps. ℚ̄_ℓ enters only through the eigenvalues.
- The geometric Frobenius is used (DWP.0 conventions).

*API.*

- `LisseSheaf.HasWeight` (*data*) — HasWeight F₀ β : Prop := ∀ x ∈ |U₀|, IsPure (q ^ deg x) β (frob x F₀).
- `LisseSheaf.frobCharpoly` (*constructor*) — frobCharpoly F₀ x = det(1 − F_x t, F₀) ∈ ℚ_ℓ[t], independent of the geometric point over x.
- `LisseSheaf.lFunction` (*constructor*) — lFunction F₀ : PowerSeries ℚ_ℓ := ∏_x (frobCharpoly F₀ x)(t^{deg x})⁻¹.
- `LisseSheaf.HasWeight.tensor` (*compatibility*) — HasWeight F β → HasWeight G γ → HasWeight (F ⊗ G) (β + γ).
- `LisseSheaf.HasWeight.dual` (*compatibility*) — HasWeight F β → HasWeight F^∨ (−β).
- `LisseSheaf.hasWeight_tate` (*simp*) — HasWeight ℚ_ℓ(r) (−2r).

*Used by.*

- `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2` — the conclusion of Theorem 3.2
- `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology` — the local factors of the L-function
- `DeligneWeightsAndPurity:DWP.4` — the weights of the pencil sheaves on an open subset of ℙ¹
- `DeligneWeightsAndPurity:DWP.5` — the curve case of pointwise purity

*Unit tests.* A wrong definition fails one of these.

- `hasWeight_tate` (value) — ℚ_ℓ(r) on U₀ has weight −2r: F_x acts by q_x^{−r}.
- `hasWeight_constant` (degenerate) — The constant sheaf ℚ_ℓ has weight 0, and the zero sheaf has every weight.
- `not_hasWeight_two` (non-example) — For q = p odd, the geometrically constant rank-one sheaf on which F_x acts by 2^{deg x} has no weight, since 2 = p^{β/2} has no integer solution β. It is ι-pure of the real weight 2 log_p 2.
- `lFunction_affine_line` (value) — Z(𝔸¹, ℚ_ℓ, t) = 1/(1 − qt).

*Construction.*

1. The Frobenius at x is well defined up to conjugacy in π₁(U₀) (Weil I (1.13), (1.15)), so its characteristic polynomial on F₀ is well defined.
2. Weight: apply DWP.0/endomorphism-weights at each closed point with base q_x. Finite extension of 𝔽_q is handled by DWP.0/finite-field-base-extension-of-weights.
3. L-function: a product over closed points of power series with constant term 1. It converges t-adically because there are finitely many closed points of each degree. The trace formula expressing it through H^i_c is requested from SchemeAndStackFoundations SF.2.

*Acceptance.*

- ℚ_ℓ(1) on 𝔾_m has weight −2, and Z(𝔾_m, ℚ_ℓ(1), t) = Z(𝔾_m, ℚ_ℓ, t/q) = (1 − t/q)/(1 − t).

*Uses.* `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `SchemeAndStackFoundations:SF.2`.

*Planet:* Weight of a lisse sheaf on a curve.

*Sources.*

- La conjecture de Weil. I, §3, (3.1), p. 284: “Par exemple, Q^(r) est de poids — 2r.” The weight of a lisse sheaf on a curve; ℚ_ℓ(r) has weight −2r.
- La conjecture de Weil. I, §3, (3.1), p. 283: “complément dans P1 d'un ensemble fini de” U₀ is the complement in ℙ¹ of finitely many closed points.

### Theorems

#### Lemma. Open subgroups of Sp(V)(ℚ_ℓ) are Zariski-dense

*Module* `TauCeti/Weights/WeilI/Symplectic.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`.

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ, and H ⊆ Sp(V, ψ)(ℚ_ℓ) a subgroup open for the ℓ-adic topology. Then H is Zariski-dense in the algebraic group Sp(V, ψ). Consequently, for every algebraic representation W of Sp(V, ψ), such as ⊗^m V, the H-invariants and H-coinvariants of W are the Sp(V, ψ)-invariants and Sp(V, ψ)-coinvariants.

*Hypotheses.*

- Openness is for the ℓ-adic topology. RS-17 keeps it as the hypothesis of Theorem 3.2, rather than any weaker density statement.
- Connectedness of Sp is essential: an open subgroup of O(V)(ℚ_ℓ) is dense only in the identity component.

*Proof.*

1. The Zariski closure Ĥ of H is an algebraic subgroup of Sp(V). Its ℚ_ℓ-points contain the open subgroup H, so its Lie algebra is sp(V) and dim Ĥ = dim Sp(V) (ReductiveGroups Layers 2–3).
2. Sp(V) is connected, so Ĥ = Sp(V).
3. A vector or functional fixed by H is fixed by its Zariski closure, because the action is algebraic.

*Acceptance.*

- Sp_{2g}(ℤ_ℓ) is open in Sp_{2g}(ℚ_ℓ) and Zariski-dense.
- A finite subgroup of Sp(V)(ℚ_ℓ) is neither open nor Zariski-dense when dim V > 0.

*Sources.*

- La conjecture de Weil. I, §3, (3.7), p. 285: “est Zariski-dense dans Sp” π₁ is Zariski-dense in Sp.

#### Theorem. Coinvariants of ⊗^{2k}V under the symplectic group, over ℚ_ℓ

*Module* `TauCeti/Weights/WeilI/Symplectic.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`.

Let V be a ℚ_ℓ-vector space of dimension 2r ≥ 2 with a nondegenerate alternating form ψ : V ⊗ V → L, where L is one-dimensional (L = ℚ_ℓ(−β)). For a partition P of {1, …, 2k} into pairs {a_i, b_i} with a_i < b_i, let ψ_P : ⊗^{2k}V → L^{⊗k}, v₁ ⊗ … ⊗ v_{2k} ↦ ∏_i ψ(v_{a_i}, v_{b_i}). The ψ_P span the Sp(V, ψ)-invariant maps ⊗^{2k}V → L^{⊗k}. For a suitable subset 𝒫′ of the pair partitions, depending on dim V and k, the ψ_P with P ∈ 𝒫′ induce an isomorphism (⊗^{2k}V)_{Sp(V, ψ)} ≅ (L^{⊗k})^N with N = #𝒫′ ≥ 1. The isomorphism is compatible with every automorphism of V that multiplies ψ by a scalar, acting on L by that scalar.

*Hypotheses.*

- Over ℂ this is Weyl's first fundamental theorem for Sp (Brauer algebra), imported from Tau Ceti SchurWeyl Layer 9.
- The passage to ℚ_ℓ is proved here, as RS-17 requires: the group Sp and the representation ⊗^{2k}V are defined over ℚ, and invariants of an algebraic group under flat base change of fields commute with extension of scalars. No statement about ℓ-adically open subgroups is transferred by extension of scalars.
- For dim V ≥ 2k all (2k − 1)!! pair partitions are independent. For smaller V the ψ_P are dependent.

*Proof.*

1. Over ℂ: the Sp-invariant multilinear forms on V^{2k} are spanned by the ψ_P (SchurWeyl Layer 9).
2. Descent to ℚ: choose a symplectic basis defined over ℚ. The invariants of Sp_{2r} over ℚ on (⊗^{2k}ℚ^{2r})^∨ span the complex invariants after ⊗ ℂ, since invariants commute with flat base change. So the ψ_P span over ℚ.
3. Base change to ℚ_ℓ, by the same argument.
4. Coinvariants are dual to the invariants of the dual representation, so choosing a basis 𝒫′ of the span gives the isomorphism, with N = dimension of the invariants.

*Acceptance.*

- dim V = 2, k = 1: (V ⊗ V)_{Sp} ≅ L through ψ, N = 1.
- dim V = 2, k = 2: the invariants of SL₂ on ⊗⁴V have dimension 2 (the Catalan number C₂), while there are 3 pair partitions. The three ψ_P are dependent, and N = 2.

*Sources.*

- La conjecture de Weil. I, §3, (3.7), p. 285: “L'hypothèse (ii) assure que les coinvariants de” The coinvariants of π₁ are those of Sp, computed by Weyl's theorem.

#### Theorem. Compact cohomology and the L-function of ⊗^{2k}F

*Module* `TauCeti/Weights/WeilI/FundamentalEstimate.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`.

Under the hypotheses of Theorem 3.2, with U affine and F₀ ≠ 0: H⁰_c(U, ⊗^{2k}F) = 0, H²_c(U, ⊗^{2k}F) ≅ ℚ_ℓ(−kβ − 1)^N with N ≥ 1 as Frobenius modules, and Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^*t, H¹_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N. So Z(U₀, ⊗^{2k}F₀, t) is the Taylor expansion of a rational function whose only poles are at t = q^{−kβ−1}.

*Hypotheses.*

- U affine: shrinking U₀ changes neither the hypotheses nor the conclusion of Theorem 3.2.
- Weil I (2.10) (H⁰_c = 0 on an affine curve; H²_c = coinvariants(−1)) is requested from EtaleDualityAndPerverseSheaves EDC.2. The trace formula (1.14.3) is requested from SchemeAndStackFoundations SF.2, which carries the CohomologicalPointCounting trace formula that RS-17 names.
- Only the absolute value of the pole, |q^{−kβ−1}|, is used afterwards.

*Proof.*

1. H⁰_c(U, G) = 0 for a lisse G on the affine curve U (Weil I (2.10)(i), EDC.2).
2. H²_c(U, G) = (G_ū)_{π₁(U, ū)}(−1) (Weil I (2.10)(ii), EDC.2), for G = ⊗^{2k}F.
3. The geometric monodromy is open in Sp, so its coinvariants are the Sp-coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). These are ℚ_ℓ(−kβ)^N (theorem symplectic-coinvariants-of-even-tensor-powers), Frobenius-equivariantly because ψ is a morphism of sheaves into ℚ_ℓ(−β).
4. Trace formula (1.14.3), requested from SF.2: Z = ∏_i det(1 − F^*t, H^i_c)^{(−1)^{i+1}}, and F^* = q^{kβ+1} on H²_c = ℚ_ℓ(−kβ − 1)^N.

*Acceptance.*

- For F₀ the first cohomology of a family of elliptic curves with non-constant j (weight 1, rank 2, ψ the Weil pairing into ℚ_ℓ(−1)) and k = 1: H²_c(U, ⊗²F) ≅ ℚ_ℓ(−2), N = 1, with a pole at t = q^{−2}.

*Uses.* `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`, `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Sources.*

- La conjecture de Weil. I, §3, (3.7), p. 285: “Cette fonction Z est donc le développement en série de Taylor d'une fonction rationnelle” Z(U₀, ⊗^{2k}F₀, t) is rational, with poles only at q^{−kβ−1}.
- La conjecture de Weil. I, §2, Scholie (2.10), p. 282: “si X est affine.” H⁰_c vanishes on an affine curve.

#### Lemma. Lemma 3.3: nonnegative rational log-derivatives of even tensor powers

*Module* `TauCeti/Weights/WeilI/Positivity.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces`.

Under hypothesis (iii) of Theorem 3.2, for every even integer 2k and every x ∈ |U₀|, the power series t (d/dt) log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has nonnegative rational coefficients.

*Hypotheses.*

- Deligne's "positifs" means nonnegative.

*Proof.*

1. By (iii), det(1 − F_x t, F₀) ∈ ℚ[t], so Tr(F_x^n, F₀) ∈ ℚ for all n (DWP.0/characteristic-power-series-and-traces).
2. Tr(F_x^n, ⊗^{2k}F₀) = Tr(F_x^n, F₀)^{2k} (mathlib:LinearMap.trace_tensorProduct' iterated), a nonnegative rational number.
3. Apply Weil I (1.5.3), the identity (ii) of DWP.0/characteristic-power-series-and-traces.

*Acceptance.*

- F_x with eigenvalues ±i√q and 2k = 2: Tr(F_x^n) is 0 for odd n and ±2q^{n/2} for even n. The negative sign occurs for n ≡ 2 mod 4, but the squares 4q^n are nonnegative.

*Uses.* `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`, `mathlib:LinearMap.trace_tensorProduct'`.

*Sources.*

- La conjecture de Weil. I, §3, Lemme (3.3), p. 284: “est une série formelle à coefficients rationnels positifs.” The log-derivative has nonnegative rational coefficients.

#### Lemma. Lemma 3.4: local factors of even tensor powers have nonnegative coefficients

*Module* `TauCeti/Weights/WeilI/Positivity.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/positive-local-factors`.

Under hypothesis (iii) of Theorem 3.2, for every even 2k and x ∈ |U₀|, the local factor det(1 − F_x t^{deg x}, ⊗^{2k}F₀)⁻¹ ∈ ℚ[[t]] has constant term 1 and nonnegative coefficients.

*Hypotheses.*

- Substituting t^{deg x} for t preserves nonnegativity.

*Proof.*

1. log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has no constant term and nonnegative coefficients (lemma positivity-of-even-tensor-power-traces, divided termwise by n).
2. The exponential of a power series with nonnegative coefficients and no constant term has nonnegative coefficients.
3. Substitute t^{deg x}.

*Acceptance.*

- For F₀ = ℚ_ℓ(−1) and 2k = 2: the local factor is 1/(1 − q_x² t^{deg x}) = Σ q_x^{2m} t^{m deg x}.

*Uses.* `DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces`.

*Sources.*

- La conjecture de Weil. I, §3, Lemme (3.4), p. 284: “est sans terme constant” The logarithm has no constant term; exponentiate.

#### Lemma. Lemma 3.5: factors of a product of positive power series converge at least as far

*Module* `TauCeti/Weights/WeilI/Positivity.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products`.

Let (f_i) be a countable family of power series f_i = Σ_n a_{i,n} t^n with constant term 1 and nonnegative real coefficients, such that ord(f_i − 1) → ∞, and let f = ∏_i f_i = Σ_n a_n t^n. Then a_{i,n} ≤ a_n for all i and n. Hence the radius of absolute convergence of each f_i is at least that of f.

*Hypotheses.*

- Nonnegativity of all coefficients is essential; without it cancellation can make f converge further than a factor.

*Proof.*

1. Expanding the product, each coefficient a_n is a sum of nonnegative terms, one of which is a_{i,n}·1·1⋯.
2. Comparison of power series with nonnegative coefficients gives the radii.

*Acceptance.*

- f₁ = 1/(1 − t) and f₂ = 1/(1 − t²): f = f₁f₂ has radius 1, and so do f₁ and f₂.
- Without positivity: (1 − t) · 1/(1 − t) = 1 has infinite radius, while the second factor has radius 1.

*Sources.*

- La conjecture de Weil. I, §3, Lemme (3.5), p. 284: “et à coefficients réels positifs.” Power series with nonnegative real coefficients.

#### Lemma. Lemma 3.6: poles of the factors lie no closer than the poles of the product

*Module* `TauCeti/Weights/WeilI/Positivity.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/poles-of-positive-products`.

Under the hypotheses of Lemma 3.5, if f and all the f_i are Taylor expansions at 0 of meromorphic functions on ℂ, then inf{|z| : f_i has a pole at z} ≥ inf{|z| : f has a pole at z}.

*Hypotheses.*

- The functions used (local factors and the L-function of ⊗^{2k}F₀) are rational, hence meromorphic.

*Proof.*

1. For a function meromorphic on ℂ and holomorphic at 0, the radius of convergence of its Taylor series at 0 is the modulus of its nearest pole. The Taylor series converges on the largest disc of holomorphy, and cannot converge beyond a pole.
2. Apply Lemma 3.5.

*Acceptance.*

- f₁ = 1/(1 − 2t) and f₂ = 1/(1 − t): the product f = f₁f₂ has its nearest pole at 1/2, and the pole of f₂ at 1 lies further out, as the lemma requires.

*Uses.* `DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products`.

*Sources.*

- La conjecture de Weil. I, §3, Lemme (3.6), p. 284: “Ces nombres sont en effet les rayons de convergence absolue.” The infima are the radii of absolute convergence.

#### Theorem. Weil I, Theorem 3.2: the fundamental estimate

*Module* `TauCeti/Weights/WeilI/FundamentalEstimate.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`.

Let U₀ ⊆ ℙ¹ over 𝔽_q be open, F₀ a lisse ℚ_ℓ-sheaf on U₀, and β ∈ ℤ. Assume (i) F₀ carries a nondegenerate alternating pairing ψ : F₀ ⊗ F₀ → ℚ_ℓ(−β); (ii) the image of the geometric fundamental group π₁(U, ū) in GL(F_ū) is an open subgroup of Sp(F_ū, ψ); (iii) for every x ∈ |U₀|, det(1 − F_x t, F₀) has rational coefficients. Then F₀ has weight β: every eigenvalue of every F_x is an algebraic number all of whose complex conjugates have absolute value q_x^{β/2}.

*Hypotheses.*

- (ii) is openness for the ℓ-adic topology in the symplectic group of ψ, as RS-17 keeps it.
- (iii) is rationality of the Frobenius polynomials of the fixed ℚ_ℓ-sheaf.
- One may assume U affine and F₀ ≠ 0.
- No purity of cohomology is assumed: the estimate is proved directly from positivity and the poles of the L-function of the even tensor powers.

*Proof.*

1. Reduce to U affine and F₀ ≠ 0.
2. Fix x of degree d and an eigenvalue α of F_x on F₀. By (iii), α is algebraic and every complex conjugate of α is again an eigenvalue. α^{2k} is an eigenvalue of F_x on ⊗^{2k}F₀ (DWP.0/spectra-of-tensor-products-and-duals). So the local factor det(1 − F_x t^d, ⊗^{2k}F₀)⁻¹ has a pole at every t with t^d = α^{−2k}.
3. That local factor is one factor of Z(U₀, ⊗^{2k}F₀, t) = ∏_y (local factor at y). All the factors have nonnegative coefficients (lemma positive-local-factors), and Z is rational with poles only at q^{−kβ−1} (theorem compact-cohomology-of-even-tensor-powers). Lemma poles-of-positive-products gives |α|^{−2k/d} ≥ q^{−kβ−1}, that is, |α| ≤ q_x^{β/2 + 1/(2k)}.
4. Letting k → ∞ gives |α| ≤ q_x^{β/2}.
5. ψ is Frobenius-equivariant with values in ℚ_ℓ(−β), on which F_x acts by q_x^β. So q_x^β/α is also an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues with c = q_x^β), and the previous step applied to it gives |α| ≥ q_x^{β/2}. The same argument applies to every complex conjugate of α.

*Acceptance.*

- The first cohomology of a family of elliptic curves over an open subset of ℙ¹ with non-constant j has weight 1, carries the Weil pairing, has monodromy open in SL₂ = Sp₂, and has rational Frobenius polynomials. Theorem 3.2 gives |a_x| ≤ 2√q_x at every fibre, compatibly with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

*Uses.* `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`, `DeligneWeightsAndPurity:DWP.2/positive-local-factors`, `DeligneWeightsAndPurity:DWP.2/poles-of-positive-products`, `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

*Planet:* Fundamental estimate.

*Sources.*

- La conjecture de Weil. I, §3, Théorème (3.2), p. 284: “Faisons les hypothèses suivantes” The hypotheses (i)–(iii).
- La conjecture de Weil. I, §3, Théorème (3.2), p. 284: “est un sous-groupe ouvert du groupe symplectique” Hypothesis (ii): open symplectic monodromy.
- La conjecture de Weil. I, §3, proof of (3.2), p. 285: “Faisant tendre k vers l'infini, on trouve que” The limit k → ∞.

#### Theorem. Corollary 3.8: the coarse bound on H¹_c(U, F)

*Module* `TauCeti/Weights/WeilI/CoarseBounds.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`.

Under the hypotheses of Theorem 3.2, with U affine, every eigenvalue α of F^* on H¹_c(U, F) is an algebraic number, and every complex conjugate of α satisfies |α| ≤ q^{β/2 + 1}.

*Hypotheses.*

- The bound is coarse, not purity: purity of H¹ is proved in the induction of DWP.4.

*Proof.*

1. H⁰_c(U, F) = 0 (U affine), and H²_c(U, F) = (F_ū)_{π₁}(−1) = 0, since the standard representation of Sp has no coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). So by (1.14.3), Z(U₀, F₀, t) = det(1 − F^*t, H¹_c(U, F)).
2. The left side has rational coefficients by its product expansion and (iii). So the polynomial on the right has rational coefficients, 1/α is a root, α is algebraic, and its conjugates are also eigenvalues.
3. The Euler product converges absolutely for |t| < q^{−β/2−1}. With N = rank F and |α_{x,j}| = q_x^{β/2} (Theorem 3.2), for |t| = q^{−β/2−1−ε} one has Σ_{x,j} |α_{x,j} t^{deg x}| ≤ N Σ_x q_x^{−1−ε} ≤ N Σ_n q^n q^{−n(1+ε)} < ∞. Here 𝔸¹ has q^n points over 𝔽_{q^n}, hence at most q^n closed points of degree n.
4. An absolutely convergent product of nonzero factors has no zero, so |1/α| ≥ q^{−β/2−1}.

*Acceptance.*

- β = 1 (a family of elliptic curves): every eigenvalue on H¹_c(U, F) satisfies |α| ≤ q^{3/2}.

*Uses.* `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`, `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`, `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Sources.*

- La conjecture de Weil. I, §3, Corollaire (3.8), p. 286: “Le premier membre est une série formelle à coefficients rationnels” Rationality of Z and the convergence argument.

#### Theorem. Corollary 3.9: the two-sided coarse bound on H¹(ℙ¹, j_*F)

*Module* `TauCeti/Weights/WeilI/CoarseBounds.lean`. *Node* `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`.

Let j : U → ℙ¹ be the inclusion. Under the hypotheses of Theorem 3.2, every eigenvalue α of F^* on H¹(ℙ¹, j_*F) is an algebraic number, and every complex conjugate of α satisfies q^{β/2} ≤ |α| ≤ q^{β/2 + 1}; in Deligne's notation q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}.

*Hypotheses.*

- Poincaré duality (2.12) for j_*F on ℙ¹ is requested from EtaleDualityAndPerverseSheaves EDC.2.

*Proof.*

1. The exact sequence 0 → j_!F → j_*F → j_*F/j_!F → 0 has a punctual third term, so H¹_c(U, F) → H¹(ℙ¹, j_*F) is surjective. Every α is therefore an eigenvalue on H¹_c(U, F), and Corollary 3.8 gives |α| ≤ q^{β/2+1}.
2. Poincaré duality (2.12) pairs H¹(ℙ¹, j_*F) with H¹(ℙ¹, j_*F^∨(1)) into ℚ_ℓ, and ψ identifies F^∨ with F(β). So q^{β+1}/α is an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues), and |q^{β+1}α⁻¹| ≤ q^{β/2+1} gives |α| ≥ q^{β/2}.

*Acceptance.*

- β = 1: every eigenvalue on H¹(ℙ¹, j_*F) satisfies q^{1/2} ≤ |α| ≤ q^{3/2}. Purity (|α| = q) is DWP.4's sharpening.

*Uses.* `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`, `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Sources.*

- La conjecture de Weil. I, §3, Corollaire (3.9), p. 286: “Un segment de la suite longue de cohomologie définie par la suite exacte courte” Surjectivity of H¹_c(U, F) → H¹(ℙ¹, j_*F).
- La conjecture de Weil. I, §3, Corollaire (3.9), p. 287: “La dualité de Poincaré (2.12) assure que” The dual eigenvalue q^{β+1}/α.

## DWP.3 Pencil local-factor rationality and the radical quotient

No nodes yet.

### What is missing

- Not planned in checkpoint 1: Weil I §6 (rationality theorem), with the pencil geometry imported from LPV.3–LPV.5 and Chebotarev from FunctionFieldArithmetic FA.5, as RS-17 directs.

## DWP.4 Weil I: dimension induction and tensor-power removal of the error

No nodes yet.

### What is missing

- Not planned in checkpoint 1: Weil I §7 (the induction on dimension and removal of the error by tensor powers), with LPV.3–LPV.4 and EDC.4 as suppliers.

## DWP.5 Weil II local weights and the analytic preparation

No nodes yet.

### What is missing

- Not planned in checkpoint 1: the sheaf-level predicates of Weil II (1.2.2)–(1.2.3) and (1.2.6), finite filtrations, local weights and the analytic preparation. They build on this packet's numeric and endomorphism nodes and import the monodromy filtration of Weil II §1.6 from LPV.1.

## DWP.6 Pure local systems on curves and the square-improvement argument

No nodes yet.

### What is missing

- Not planned in checkpoint 1: pure local systems on curves and the square-improvement argument of Weil II §§1.3–1.5.

## DWP.10 Arithmetic interfaces and acceptance checks

No nodes yet.

### What is missing

- Not planned in checkpoint 1: generic weight transport to Hecke-stable subquotients and the weight-facing acceptance suite in RS-17's keeps, importing WC.5's point counts and WC.3's factor descent.

## Requests to other roadmaps

- `EtaleDualityAndPerverseSheaves:EDC.0` — The coefficient conventions: ℚ_ℓ(1) as the Tate twist on which the geometric Frobenius of 𝔽_q acts by q⁻¹, compared with the inverse arithmetic Galois action on ℓ-power roots of unity, and extension of coefficients from finite extensions of ℚ_ℓ to ℚ̄_ℓ. Needed by `twisting-by-rank-one-characters`.
- `SchemeAndStackFoundations:SF.2` — The Grothendieck–Lefschetz trace formula for lisse (and constructible) ℚ_ℓ-sheaves on a curve over 𝔽_q in the form of Weil I (1.14.3), Z(U₀, F₀, t) = ∏_i det(1 − F^*t, H^i_c(U, F))^{(−1)^{i+1}}, with finiteness of H^i_c. This is the CohomologicalPointCounting trace formula (TraceFormula Layer 14) that RS-17 names as DWP.2's supplier. Needed by `weights-and-l-functions-of-lisse-sheaves-on-curves`, `compact-cohomology-of-even-tensor-powers`, `coarse-bound-on-compact-cohomology`.
- `EtaleDualityAndPerverseSheaves:EDC.2` — Weil I (2.10): for a smooth connected curve X over an algebraically closed field and a lisse ℚ_ℓ-sheaf F, H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x)_{π₁(X, x)}(−1). Weil I (2.12): Poincaré duality H¹(X̄, j_*F) × H¹(X̄, j_*F^∨(1)) → ℚ_ℓ on a smooth projective curve, Frobenius-equivariantly. Needed by `compact-cohomology-of-even-tensor-powers`, `coarse-bound-on-compact-cohomology`, `coarse-bound-on-cohomology-of-the-projective-line`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra` — The first fundamental theorem for the complex symplectic group: the Sp(V)-invariant multilinear forms on V^{2k} are spanned by the pair contractions ψ_P (Brauer algebra), with the dimension of the invariants. Needed by `symplectic-coinvariants-of-even-tensor-powers`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` — Zariski closure of a subgroup of the ℚ_ℓ-points of a linear algebraic group as an algebraic subgroup, and connectedness of Sp_{2g}. Needed by `open-subgroups-of-symplectic-groups-are-zariski-dense`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` — The Lie algebra of an algebraic subgroup over ℚ_ℓ, and the fact that an algebraic subgroup whose ℚ_ℓ-points contain an ℓ-adically open subgroup of G(ℚ_ℓ) has full dimension. Needed by `open-subgroups-of-symplectic-groups-are-zariski-dense`.

## Library baseline

Every Mathlib declaration below was read at the pinned commit and resolved by `#check`.

- `minpoly.algHom_eq` (Mathlib/FieldTheory/Minpoly/Basic.lean) — minpoly A (f x) = minpoly A x for an injective A-algebra map f: the Weil-number predicate, defined through the minimal polynomial over ℚ, is invariant under field homomorphisms.
- `IsAlgClosed.lift` (Mathlib/FieldTheory/IsAlgClosed/Basic.lean) — A homomorphism from an algebraic extension S of R into an algebraically closed R-algebra M: extension of complex embeddings from ℚ(α) to algebraic extensions.
- `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` (Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean) — Kronecker: an algebraic integer of a number field all of whose complex embeddings have norm 1 is a root of unity (integral Weil numbers of weight 0).
- `IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` (Mathlib/FieldTheory/IsAlgClosed/Classification.lean) — An uncountable algebraically closed field has a transcendence basis (over a countable ring) of its own cardinality: trdeg(ℂ/σ(k)) = 𝔠.
- `Cardinal.mk_complex` (Mathlib/Analysis/Complex/Cardinality.lean) — #ℂ = 𝔠.
- `IsAlgClosed.equivOfTranscendenceBasis` (Mathlib/FieldTheory/IsAlgClosed/Classification.lean) — Algebraically closed R-algebras with equipotent transcendence bases over R are isomorphic: extension of σ : k → ℂ to E ≅ ℂ.
- `IsAlgClosed.ringEquiv_of_equiv_of_charZero` (Mathlib/FieldTheory/IsAlgClosed/Classification.lean) — Two uncountable algebraically closed fields of characteristic 0 of the same cardinality are isomorphic: ℚ̄_ℓ ≅ ℂ.
- `Algebra.IsAlgebraic.cardinalMk_le_max` (Mathlib/RingTheory/Algebraic/Cardinality.lean) — #L ≤ max #R ℵ₀ for L algebraic over R: #ℚ̄_ℓ = #ℚ_ℓ.
- `LinearMap.charpoly_baseChange` (Mathlib/LinearAlgebra/Charpoly/BaseChange.lean) — (f.baseChange A).charpoly = f.charpoly.map (algebraMap R A): eigenvalues may be computed after extending scalars to Ē.
- `Module.End.hasEigenvalue_iff_isRoot_charpoly` (Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean) — Over a domain, f has eigenvalue μ iff μ is a root of f.charpoly.
- `LinearMap.finrank_maxGenEigenspace_eq` (Mathlib/LinearAlgebra/Eigenspace/Zero.lean) — finrank (maxGenEigenspace φ μ) = rootMultiplicity μ φ.charpoly: multiplicities are dimensions of generalized eigenspaces.
- `Module.End.iSup_maxGenEigenspace_eq_top` (Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean) — Over an algebraically closed field, the maximal generalized eigenspaces of an endomorphism of a finite-dimensional space span it.
- `Module.End.independent_maxGenEigenspace` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean) — The maximal generalized eigenspaces for distinct eigenvalues are independent.
- `Matrix.charpoly_fromBlocks_zero₂₁` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean) — The characteristic polynomial of a block triangular matrix with a zero lower-left block is the product of those of the diagonal blocks.
- `LinearMap.charpoly_prodMap` (Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean) — (f₁.prodMap f₂).charpoly = f₁.charpoly * f₂.charpoly.
- `Matrix.reverse_charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean) — M.charpoly.reverse = M.charpolyRev = det(1 − X·M): the characteristic power series det(1 − tF).
- `Matrix.trace_eq_sum_roots_charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean) — Over an algebraically closed field, the trace is the sum of the roots of the characteristic polynomial.
- `Matrix.charpoly_inv` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean) — A⁻¹.charpoly = (−1)^n · C(det A)⁻¹ · A.charpolyRev for invertible A: the characteristic polynomial of the inverse through the reversed polynomial.
- `Matrix.det_kronecker` (Mathlib/LinearAlgebra/Matrix/Kronecker.lean) — det (A ⊗ₖ B) = det A ^ card n * det B ^ card m.
- `LinearMap.trace_tensorProduct'` (Mathlib/LinearAlgebra/Trace.lean) — trace (map f g) = trace f * trace g.
- `LinearMap.det_dualMap` (Mathlib/LinearAlgebra/Determinant.lean) — det f.dualMap = det f.
- `Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` (Mathlib/FieldTheory/IsAlgClosed/Basic.lean) — p, q ∈ k[X] are coprime iff they have no common root in an algebraically closed extension K.
- `LinearMap.aeval_self_charpoly` (Mathlib/LinearAlgebra/Charpoly/Basic.lean) — Cayley–Hamilton: aeval f f.charpoly = 0.
- `Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` (Mathlib/RingTheory/Polynomial/Basic.lean) — For coprime p, q: ker p(f) ⊔ ker q(f) = ker (pq)(f).

## Sources

- Pierre Deligne, *La conjecture de Weil. I*. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf (SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`). Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): §1 (1.1)–(1.15), pp. 273–279, including the proof of (1.7) ⇒ (1.6); §2 (2.1)–(2.14), pp. 280–283; §3 (3.1)–(3.6), pp. 283–284; cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 2): §3 (3.1)–(3.9) in full, pp. 283–287, and Scholie (2.10), p. 282.
- Pierre Deligne, *La conjecture de Weil. II*. Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135); locators give printed pages. https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf (SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`). Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): (1.1.11)–(1.1.15), pp. 152–153; §1.2 (1.2.1)–(1.2.14), pp. 153–156; the opening of §1.3, pp. 156–157.

## Non-goals

- General sheaf-level purity and mixedness (DWP.5). Neither DWP.0 nor DWP.2 proves purity of cohomology: DWP.2 proves the weight of a symplectic sheaf and coarse bounds.
- The separation and descent of zeta-function factors, their integrality and ℓ-independence (WC.3).
- The monodromy filtration (LPV.1) and the sign of the functional equation (WC.2).
