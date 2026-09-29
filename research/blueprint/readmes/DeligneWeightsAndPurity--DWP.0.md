# Deligne weights, purity and the Weil bounds: stages DWP.0–DWP.6 and DWP.10

## Purpose

This document plans part DWP.0 of `DeligneWeightsAndPurity`. The part covers the numerical and linear-algebraic notion of weight (DWP.0), the initial Weil estimate for curves and abelian varieties (DWP.1), Weil I's fundamental estimate, rationality theorem and induction (DWP.2–DWP.4), the Weil II preparations on curves (DWP.5–DWP.6), and the arithmetic interfaces (DWP.10).

The checkpoints so far:

- Checkpoint 1: DWP.0, the weight linear algebra.
- Checkpoint 2: DWP.2, Weil I §3's fundamental estimate.
- Checkpoint 3: DWP.1, the Weil estimate for abelian varieties and curves through the Rosati involution.
- Checkpoint 4: DWP.3, Weil I §6's rationality of the local factors of a Lefschetz pencil.

## Scope and boundaries

RS-17 is accepted. It keeps DWP.0 whole, as the single owner of the Weil-number, ι-weight and reciprocal-spectrum algebra, and narrows DWP.1–DWP.3:

- **DWP.1:** the independent curve and abelian-variety estimate, importing polarizations, Rosati positivity and the curve trace comparison.
- **DWP.2:** Weil I 3.2 with its hypotheses, and Lemmas 3.3–3.9.
- **DWP.3:** Weil I 6.2, instantiating the radical quotient and open ℚ_ℓ monodromy. It imports the pencil geometry (LPV.3–LPV.5) and finite-cover Chebotarev (FA.5), and proves the Haar-null exceptional-locus bridge itself.

- WeilConjectures WC.3 owns the separation of zeta-function factors, and WC.2 the functional equation.
- The sheaf-level predicates are DWP.5's, and the monodromy filtration is LPV.1's.

## Conventions

- q > 1 is real in the definitions. In the applications q = #k₀ = p^a, and at a closed point x, q_x = q^{deg x}.
- Frobenius is the geometric Frobenius: ℚ_ℓ(1) has eigenvalue q⁻¹ and weight −2.
- Four notions are kept distinct: algebraicity over ℚ, integrality over ℤ, purity at every complex embedding, and ι-purity for one embedding.
- Eigenvalues are the roots of the characteristic polynomial, with multiplicities equal to the dimensions of generalized eigenspaces. No semisimplicity is assumed.

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

### Objects

#### Definition. The q-Frobenius endomorphism of a variety over 𝔽_q

*Module* `TauCeti/Weights/AbelianWeil/Frobenius.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`.

Let V be a variety (a separated scheme of finite type) over 𝔽_q. The q-Frobenius π_V : V → V is the identity on the underlying space and f ↦ f^q on the structure sheaf. It is an 𝔽_q-morphism. It commutes with every 𝔽_q-morphism φ : W → V, that is φ ∘ π_W = π_V ∘ φ, and on V(𝔽̄_q) it acts by raising coordinates to the q-th power, so V(𝔽_{q^m}) is the fixed-point set of π_V^m. Its differential is 0. For an abelian variety A over 𝔽_q, π_A fixes 0 and is an endomorphism of A, of degree q^g. After extending scalars to 𝔽_{q^m}, the Frobenius is π_A^m.

*Hypotheses.*

- π_V is the relative (q-power) Frobenius over 𝔽_q, not the absolute p-Frobenius when q = p^a with a > 1.
- On 𝔽̄_q-points π_V agrees with the arithmetic Frobenius acting on coordinates. The geometric Frobenius on étale cohomology is (π_V)^* (Weil I (1.15)); the conventions are those of DWP.0.

*API.*

- `frobeniusEndo` (*constructor*) — frobeniusEndo (V : Scheme over 𝔽_q) : V ⟶ V, the identity on spaces and f ↦ f^q on sections.
- `frobeniusEndo_comp` (*compatibility*) — φ ≫ frobeniusEndo V = frobeniusEndo W ≫ φ for every 𝔽_q-morphism φ : W ⟶ V.
- `fixedPoints_frobeniusEndo_pow` (*characterisation*) — the fixed points of π_V^m on V(𝔽̄_q) are V(𝔽_{q^m}).
- `frobeniusEndo_baseChange` (*compatibility*) — the Frobenius of V ⊗ 𝔽_{q^m} over 𝔽_{q^m} is (π_V)^m ⊗ 𝔽_{q^m}.
- `AbelianVariety.frobenius` (*constructor*) — the Frobenius endomorphism π_A ∈ End A of an abelian variety over 𝔽_q.

*Used by.*

- `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism` — π†π = q
- `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties` — #A(𝔽_{q^m}) = deg(1 − π^m)
- `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology` — π_A against the arithmetic and geometric Frobenius
- `WeilConjectures:WC.5` — point counts as fixed points of the Frobenius

*Unit tests.* A wrong definition fails one of these.

- `frobeniusEndo_projectiveLine_fixed` (value) — The fixed points of π on ℙ¹(𝔽̄_q) are the q + 1 points of ℙ¹(𝔽_q).
- `frobeniusEndo_spec_field` (degenerate) — On Spec 𝔽_q, π is the identity.
- `frobeniusEndo_not_absolute` (non-example) — For q = p², π_V is the square of the absolute Frobenius, not the absolute Frobenius itself; its fixed points on 𝔸¹(𝔽̄_q) are 𝔽_{p²}, not 𝔽_p.
- `deg_frobenius_elliptic` (value) — For an elliptic curve over 𝔽_q, deg π_E = q.

*Construction.*

1. Locally V = Spec R with R an 𝔽_q-algebra, and π_V corresponds to r ↦ r^q, an 𝔽_q-algebra endomorphism since a^q = a for a ∈ 𝔽_q. These glue, since x ↦ x^q commutes with localization.
2. Naturality: an 𝔽_q-algebra map commutes with x ↦ x^q.
3. Points: for x ∈ V(𝔽̄_q) with coordinates (x_i), π_V(x) = (x_i^q). The fixed points of π_V^m are the points with coordinates in 𝔽_{q^m}.
4. d(x^q) = qx^{q−1}dx = 0 in characteristic p.
5. For A an abelian variety, 0 ∈ A(𝔽_q) is fixed, so π_A is a homomorphism (rigidity, AbelianSchemesAndArithmeticModuli A1). deg π_A = q^g, as P_{π}(0) in the node point-counts-of-abelian-varieties shows.

*Acceptance.*

- On ℙ¹ over 𝔽_q, π is [x : y] ↦ [x^q : y^q], and its fixed points are the q + 1 points of ℙ¹(𝔽_q).
- For an elliptic curve E over 𝔽_q, π_E is the q-power Frobenius endomorphism, and 1 − π_E is separable.

*Uses.* `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`.

*Sources.*

- Abelian Varieties, Chapter II, §1, p. 75: “is deﬁned to be the identity” π_V is the identity on the space and f ↦ f^q on functions.
- Abelian Varieties, Chapter II, §1, p. 75: “and so it is an endomorphism of A.” π_A fixes 0, so it is an endomorphism.

### Theorems

#### Theorem. Milne II.1.2: π†π = q

*Module* `TauCeti/Weights/AbelianWeil/Rosati.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`.

Let A be an abelian variety over 𝔽_q, λ a polarization of A defined over 𝔽_q, and † the Rosati involution of λ. Then π_A^† ∘ π_A = q in End⁰(A), that is π_A^∨ ∘ λ ∘ π_A = q·λ.

*Hypotheses.*

- λ must be defined over 𝔽_q, so that it commutes with the Frobenius. A polarization over 𝔽_q exists, since A is projective over 𝔽_q (requested from AbelianSchemesAndArithmeticModuli A2).
- This is where the Frobenius–Verschiebung relation enters, as RS-17 keeps it: π^∨ corresponds to the Verschiebung through λ.

*Proof.*

1. With λ = φ_D for an ample divisor D (over 𝔽̄_q): λ(a) = [t_a^*D − D].
2. For any divisor D′ over 𝔽_q, π^*D′ = qD′: locally D′ = div f and f ∘ π = f^q.
3. For a ∈ A(𝔽̄_q): (π^∨λπ)(a) = [π^*t_{π(a)}^*D − π^*D] = [t_a^*π^*D − π^*D] = [t_a^*(qD) − qD] = qλ(a), using π ∘ t_a = t_{π(a)} ∘ π.

*Acceptance.*

- An elliptic curve with λ the principal polarization: π† = π̂, and π̂π = [q] = deg π.

*Uses.* `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A2`.

*Sources.*

- Abelian Varieties, Chapter II, Lemma 1.2, p. 76: “Rosati involution on End” Lemma 1.2: π†π = q for the Rosati involution.

#### Theorem. Milne II.1.3: α†α = r forces |a|² = r for the roots of P_α

*Module* `TauCeti/Weights/AbelianWeil/Rosati.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution`.

Let A be an abelian variety over a field k with a polarization and Rosati involution †, and α ∈ End⁰(A) with α†α = r ∈ ℤ_{>0}. Then ℚ[α] is a product of fields, stable under †, and † acts on each real factor of ℚ[α] ⊗ ℝ as the identity and on each complex factor as complex conjugation. Every root a of P_α in ℂ satisfies |a|² = r.

*Hypotheses.*

- The positivity of the Rosati involution (AbelianSchemesAndArithmeticModuli A6/rosati-positivity) is the key input. No Tate isogeny theorem and no cohomological purity is used, as RS-17 requires.
- ℚ[α] is commutative. A factor of ℚ[α] ⊗ ℝ with † trivial is ℝ, and † is conjugation on each factor ℂ.

*Proof.*

1. ℚ[α] has no nonzero nilpotents. For a ≠ 0 put b = a†a; then Tr(b) > 0 (Rosati positivity), b† = b and Tr(b²) = Tr(b†b) > 0, so b² ≠ 0, b⁴ ≠ 0, and so on. Hence ℚ[α] is a product of fields K_i.
2. † is an automorphism of ℚ[α] (α† = rα⁻¹ ∈ ℚ[α]). It permutes the factors, and positivity forces it to preserve each one: otherwise Tr(aa†) would vanish on a single factor.
3. On ℚ[α] ⊗ ℝ = ∏ ℝ × ∏ ℂ, † is a positive involution of each factor: the identity on ℝ, and complex conjugation on ℂ (the identity of ℂ is not positive: Tr(i·i) < 0).
4. For every σ : ℚ[α] → ℂ, σ(α†) = conj(σ(α)), so r = σ(α†α) = |σ(α)|². So the roots of the minimal polynomial of α have |·|² = r, and by AbelianSchemesAndArithmeticModuli A6/trace-and-degree-on-a-subfield (10.24) the roots of P_α are among them.

*Acceptance.*

- α = [n] on any A: [n]†[n] = n², and P_{[n]} = (X − n)^{2g} has roots of absolute value n.

*Uses.* `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`.

*Sources.*

- Abelian Varieties, Chapter II, Lemma 1.3, p. 77: “is an integer r” Lemma 1.3: α†α = r implies |a|² = r for the roots of P_α.
- Abelian Varieties, Chapter II, Lemma 1.3, p. 77: “We ﬁrst show that” ℚ[α] has no nonzero nilpotents.

#### Theorem. The Weil estimate for abelian varieties over 𝔽_q

*Module* `TauCeti/Weights/AbelianWeil/Estimate.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`.

Let A be an abelian variety of dimension g over 𝔽_q. Every root of the characteristic polynomial P_{π_A} ∈ ℤ[X] is a Weil q-number of weight 1: all its complex conjugates have absolute value q^{1/2}. Equivalently, for every ℓ ∤ q, the geometric Frobenius on H¹(A_{𝔽̄_q}, ℚ_ℓ) is pure of weight 1, and the geometric Frobenius on V_ℓA is pure of weight −1. The same holds for π_A^m relative to q^m.

*Hypotheses.*

- This is the independent abelian-variety proof that RS-17 keeps for DWP.1. It uses the polarization, Rosati positivity and π†π = q. It depends on no Tate isogeny theorem and nothing from DWP.4.
- The statement on H¹ and V_ℓA uses the comparison of the Frobenius conventions: π_A acts on V_ℓA as the arithmetic Frobenius, and on H¹ = (V_ℓA)^∨ the geometric Frobenius has characteristic polynomial P_{π_A} (ArithmeticGaloisRepresentations R01.6; AbelianSchemesAndArithmeticModuli A4).

*Proof.*

1. π†π = q (theorem rosati-of-the-frobenius-endomorphism).
2. Theorem absolute-values-from-the-rosati-involution with α = π and r = q: every complex root of P_π has absolute value q^{1/2}. P_π ∈ ℤ[X], so the roots are algebraic and every conjugate is again a root, so they are Weil q-numbers of weight 1 (DWP.0/weil-q-number).
3. On V_ℓA the characteristic polynomial of π is P_π (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module). The geometric Frobenius acts by π⁻¹ on V_ℓA, of weight −1, and by the transpose of π on H¹, of weight 1.
4. Base extension: π_{A ⊗ 𝔽_{q^m}} = π^m, with roots a_i^m (DWP.0/weil-number-base-extension).

*Acceptance.*

- E: y² = x³ − x over 𝔽_3: P_π = X² + 3, with roots ±i√3 of absolute value √3.
- A supersingular elliptic curve over 𝔽_p with a = 0: roots ±i√p.

*Uses.* `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`, `DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `ArithmeticGaloisRepresentations:R01.6`.

*Planet:* Weil estimate for abelian varieties.

*Sources.*

- Abelian Varieties, Chapter II, Theorem 1.1(b), p. 75: “(Riemann hypothesis)” Theorem 1.1(b): |a_i| = q^{1/2}.
- Abelian Varieties, Chapter II, Remark 1.4, p. 78: “We have actually proved the following” ℚ[π] is a product of fields, and |σ(π)| = q^{1/2} for every σ.

#### Theorem. Point counts of abelian varieties over 𝔽_{q^m}, and their bounds

*Module* `TauCeti/Weights/AbelianWeil/PointCount.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`.

Let A be an abelian variety of dimension g over 𝔽_q with P_{π_A}(X) = ∏_{i=1}^{2g}(X − a_i). Then for all m ≥ 1, N_m = #A(𝔽_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏_i(1 − a_i^m), and |N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}. The zeta function is Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}, where P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t) over 1 ≤ i_1 < … < i_r ≤ 2g, the characteristic polynomial of π on ∧^r T_ℓA.

*Hypotheses.*

- 1 − π^m is separable (its differential is −1) and étale, so its degree is the number of geometric points in its kernel, which is A(𝔽_{q^m}).
- The bound uses the Weil estimate. The leading term ∏ a_i = deg π = q^g is exact.

*Proof.*

1. d(π − 1) = dπ − 1 = −1 at the origin, so π − 1 is étale, and ker(π − 1) = A(𝔽_q) with every point of multiplicity one. Hence #A(𝔽_q) = deg(π − 1) = P_π(1) (AbelianSchemesAndArithmeticModuli A6/degree-of-an-endomorphism, A6/characteristic-polynomial-of-an-endomorphism). Replace π by π^m.
2. The eigenvalues of π^m are the a_i^m (DWP.0/spectra-of-polynomials-in-an-endomorphism), so P_{π^m}(1) = ∏(1 − a_i^m).
3. Expand ∏(1 − a_i^m): the term ∏a_i^m = q^{mg}; the 2g terms that are products of 2g − 1 roots have absolute value q^{m(g−1/2)}; the remaining 2^{2g} − 2g − 1 terms have absolute value at most q^{m(g−1)} (Weil estimate).
4. Zeta function: log Z = Σ N_m t^m/m with N_m = Σ_r (−1)^r Tr(π^m | ∧^r), and the eigenvalues of π on ∧^r T_ℓA are the r-fold products (DWP.0/spectra-of-tensor-products-and-duals).

*Acceptance.*

- E: y² = x³ − x over 𝔽_3: N_1 = P_π(1) = 1 + 3 = 4, and |4 − 3| = 1 ≤ 2√3.
- g = 1: the bound reads |N_m − q^m| ≤ 2q^{m/2} + 1, that is Hasse's |N_m − q^m − 1| ≤ 2q^{m/2}, loosened by the constant term.

*Uses.* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`.

*Sources.*

- Abelian Varieties, Chapter II, Theorem 1.1(a), p. 75: “(Riemann hypothesis)” Theorem 1.1: N_m = ∏(1 − a_i^m) and the bound.
- Abelian Varieties, Chapter II, proof of Theorem 1.1, p. 76: “is zero — in fact, that this is true for any variety.” dπ = 0, so π − 1 is étale.

#### Theorem. The Weil estimate for curves, through the Jacobian

*Module* `TauCeti/Weights/AbelianWeil/Curve.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`.

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, J its Jacobian, and P_{π_J}(X) = ∏(X − a_i). Then #C(𝔽_{q^m}) = 1 − Σ_i a_i^m + q^m for all m ≥ 1, the a_i are Weil q-numbers of weight 1, |#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}, and Z(C, t) = P_{π_J}^{rev}(t)/((1 − t)(1 − qt)) with P^{rev}(t) = ∏(1 − a_i t).

*Hypotheses.*

- Geometric connectedness is needed. If C has components defined only over 𝔽_{q^d}, permuted by the Frobenius, the counts change: two conjugate copies of ℙ¹ over 𝔽_{q²} give #C(𝔽_{q^m}) = 0 for m odd and 2(q^m + 1) for m even. RS-17 keeps these component permutations.
- The fixed-point formula (Γ_α · Δ) = 1 − Tr(α′) + deg α is imported (RS-17: the curve and Jacobian trace comparison of TraceFormula Layer 8, requested from SchemeAndStackFoundations SF.2). The source's own proof of it has a step that the author marks "Needs fixing" (recorded in sourceIssues).

*Proof.*

1. The Frobenius π_C induces π_J on J through the Albanese property (JacobianChallenge Layer F): f_P ∘ π_C = π_J ∘ f_P.
2. Fixed points: #C(𝔽_q) = (Γ_{π_C} · Δ) = 1 − Tr(π_J) + deg π_C = 1 − Σ a_i + q (Milne III.11.2, imported).
3. Replace q by q^m: the Frobenius of C ⊗ 𝔽_{q^m} is π_C^m, and π_J^m has eigenvalues a_i^m.
4. The a_i are Weil q-numbers of weight 1 (theorem weil-estimate-for-abelian-varieties applied to J), which gives the bound.
5. Z(C, t) = exp(Σ N_m t^m/m) = ∏(1 − a_i t)/((1 − t)(1 − qt)).

*Acceptance.*

- ℙ¹ (g = 0): #ℙ¹(𝔽_{q^m}) = q^m + 1 and Z = 1/((1 − t)(1 − qt)).
- E: y² = x³ − x over 𝔽_3: 1 − (i√3 + (−i√3)) + 3 = 4 = #E(𝔽_3).

*Uses.* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `SchemeAndStackFoundations:SF.2`.

*Planet:* Weil estimate for curves.

*Sources.*

- Abelian Varieties, Chapter III, Theorem 11.1, p. 118: “The number N of points on C with coordinates in k is equal to” #C(𝔽_q) = 1 − Σa_i + q, and |N − q − 1| ≤ 2g√q.
- Abelian Varieties, Chapter III, Corollary 11.4, p. 119: “The zeta function of C is equal to” Z(C, t) = P(t)/((1 − t)(1 − qt)).

#### Theorem. The weights of H⁰, H¹ and H² of a curve over 𝔽_q

*Module* `TauCeti/Weights/AbelianWeil/Curve.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`.

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, and ℓ ∤ q. Then H⁰(C_{𝔽̄_q}, ℚ_ℓ) = ℚ_ℓ is pure of weight 0, H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1) is pure of weight 2, and H¹(C_{𝔽̄_q}, ℚ_ℓ) ≅ H¹(J_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓJ)^∨ is pure of weight 1, with the geometric Frobenius having characteristic polynomial P_{π_J}. The same holds after any finite extension of 𝔽_q.

*Hypotheses.*

- Geometric connectedness makes H⁰ one-dimensional. For a curve whose components are permuted by the Frobenius, H⁰ is a permutation representation, of weight 0 but not trivial.
- H¹(C) ≅ H¹(J) through the Abel–Jacobi map (Milne III.9.6), and H¹(J) ≅ (T_ℓJ)^∨ (AbelianSchemesAndArithmeticModuli A4). These are imported.

*Proof.*

1. H⁰: C_{𝔽̄_q} is connected, so H⁰ = ℚ_ℓ with trivial Frobenius action, of weight 0.
2. H²: the trace map H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1), on which the geometric Frobenius acts by q, of weight 2 (DWP.0/twisting-by-rank-one-characters).
3. H¹: the Abel–Jacobi map induces H¹(J) ≅ H¹(C) (Milne III.9.6), and H¹(J) = (V_ℓJ)^∨ with the geometric Frobenius having characteristic polynomial P_{π_J}. Its roots have weight 1 by the theorem weil-estimate-for-abelian-varieties.

*Acceptance.*

- ℙ¹: H⁰ = ℚ_ℓ (weight 0), H¹ = 0, H² = ℚ_ℓ(−1) (weight 2), and #ℙ¹(𝔽_q) = 1 + q.

*Uses.* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`, `ArithmeticGaloisRepresentations:R01.6`.

*Sources.*

- Abelian Varieties, Chapter III, Remark 11.5, p. 119: “and so (11.2) can be rewritten as” H¹(C) = H¹(J) = (T_ℓJ)^∨ and the cohomological form of the fixed-point formula.

#### Theorem. Compatibility with the Hasse bound for elliptic curves

*Module* `TauCeti/Weights/AbelianWeil/Hasse.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

For an elliptic curve E over 𝔽_q with a = q + 1 − #E(𝔽_q) (the trace of Frobenius of Tau Ceti EllipticCurves Layer 3), P_{π_E}(X) = X² − aX + q, and the Weil estimate for abelian varieties (g = 1) gives |a| ≤ 2√q. This is the Hasse bound that Tau Ceti EllipticCurves Layer 3 proves independently. The two agree, and this node proves only the identification of the characteristic polynomials.

*Hypotheses.*

- RS-17: a compatibility proof, not a second proof of Hasse. The Hasse theorem is imported from Tau Ceti EllipticCurves Layer 3.

*Proof.*

1. P_π(1) = #E(𝔽_q) (theorem point-counts-of-abelian-varieties) and P_π(0) = deg π = q, so P_π = X² − aX + q with a = q + 1 − #E(𝔽_q).
2. The roots α, ᾱ have |α| = √q (Weil estimate), so |a| = |α + ᾱ| ≤ 2√q.
3. Tau Ceti EllipticCurves Layer 3 defines the trace of Frobenius through the same point count, so the two statements concern the same integer.

*Acceptance.*

- y² = x³ − x over 𝔽_3: a = 0. y² + y = x³ over 𝔽_2: #E(𝔽_2) = 3, a = 0, and P = X² + 2.

*Uses.* `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`.

*Sources.*

- Abelian Varieties, Chapter III, Theorem 11.1, p. 118: “Therefore, j” |N − q − 1| ≤ 2g√q, which for g = 1 is Hasse's bound.

#### Theorem. Compatibility of the Weil estimate with finite base extension

*Module* `TauCeti/Weights/AbelianWeil/Frobenius.lean`. *Node* `DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions`.

For A (resp. C) over 𝔽_q and m ≥ 1, the Frobenius of A ⊗ 𝔽_{q^m} over 𝔽_{q^m} is π_A^m, P_{π^m}(X) = ∏(X − a_i^m), and the Weil estimate over 𝔽_{q^m} (weight 1 relative to q^m) is equivalent to that over 𝔽_q (weight 1 relative to q). The same holds for the weights of H⁰, H¹ and H² of curves.

*Hypotheses.*

- RS-17 keeps compatibility under finite base extension as a review correction. The base-change isomorphism of étale cohomology is imported.

*Proof.*

1. The Frobenius of V ⊗ 𝔽_{q^m} is π_V^m (node frobenius-endomorphism-over-a-finite-field).
2. The eigenvalues of π^m are the a_i^m, and weights relative to q^m of the a_i^m equal weights relative to q of the a_i (DWP.0/weil-number-base-extension, DWP.0/finite-field-base-extension-of-weights).

*Acceptance.*

- E over 𝔽_3 with P_π = X² + 3: over 𝔽_9, P_{π²} = (X + 3)², with roots −3 of absolute value 3 = 9^{1/2}.

*Uses.* `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`.

*Sources.*

- Abelian Varieties, Chapter II, proof of Theorem 1.1, p. 76: “Hence” Replacing π by π^m.

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

### Objects

#### Construction. The radical quotient ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥) of the vanishing local system of a pencil

*Module* `TauCeti/Weights/WeilI/Pencil.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`.

Let X₀ ⊂ P₀ be a smooth projective variety over 𝔽_q, geometrically connected of even dimension n + 1 = 2m + 2, and (X_t)_{t ∈ D} a Lefschetz pencil of hyperplane sections defined over 𝔽_q, with axis A₀ of codimension 2, parameter line D₀, blow-up f : X̃₀ → D₀, singular set S₀ ⊂ D₀ and U₀ = D₀ − S₀. On U, R^n f_*ℚ_ℓ is lisse. Its vanishing part ℰ is π₁(U, u)-stable, is defined over 𝔽_q as a lisse subsheaf ℰ₀ ⊂ R^n f_*ℚ_ℓ|U₀, and cup product is an alternating form ψ : R^n f_*ℚ_ℓ ⊗ R^n f_*ℚ_ℓ → ℚ_ℓ(−n) (n odd). The radical quotient is ℱ₀ = ℰ₀/(ℰ₀ ∩ ℰ₀^⊥), on which ψ induces a perfect alternating pairing ℱ₀ ⊗ ℱ₀ → ℚ_ℓ(−n). ℱ₀ may be 0.

*Hypotheses.*

- The geometry (the pencil, R^n f_*, ℰ and ψ) is LefschetzPencilsAndVanishingCycles LPV.3–LPV.4's. This node only forms the radical quotient and records its descent to 𝔽_q, as RS-17 asks DWP.3 to instantiate it.
- The zero quotient ℱ₀ = 0 (when ℰ ⊆ ℰ^⊥) is allowed. Theorem 6.2 is then vacuous and the pencil contributes only geometrically constant factors.
- The coefficients stay ℚ_ℓ, a fixed model, as LPV.5 requires for its open-image theorem.

*API.*

- `Pencil.vanishing` (*constructor*) — Pencil.vanishing P : LisseSubsheaf (R^n f₀_* ℚ_ℓ) over U₀ (from LPV.4).
- `Pencil.radicalQuotient` (*constructor*) — radicalQuotient P := vanishing P ⧸ (vanishing P ⊓ (vanishing P)ᗮ).
- `Pencil.radicalQuotient_pairing` (*constructor*) — the perfect alternating pairing radicalQuotient P ⊗ radicalQuotient P ⟶ ℚ_ℓ(−n).
- `Pencil.radicalQuotient_perfect` (*characterisation*) — the induced pairing is perfect.
- `Pencil.radicalQuotient_eq_zero_iff` (*characterisation*) — radicalQuotient P = 0 ↔ vanishing P ≤ (vanishing P)ᗮ.

*Used by.*

- `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors` — Theorem 6.2 concerns det(1 − F_x t, ℱ₀)
- `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil` — Theorem 3.2 applied to ℱ₀
- `DeligneWeightsAndPurity:DWP.4` — the induction on dimension through H¹(D, j_*ℱ)

*Unit tests.* A wrong definition fails one of these.

- `radicalQuotient_cubic_pencil` (value) — For a pencil of plane cubics, ℱ₀ has rank 2 and ψ is the Weil pairing.
- `radicalQuotient_zero` (degenerate) — If ℰ ⊆ ℰ^⊥, then ℱ₀ = 0 and Theorem 6.2 holds trivially.
- `not_perfect_on_E` (non-example) — ψ need not be perfect on ℰ itself when ℰ ∩ ℰ^⊥ ≠ 0; only the quotient carries a perfect pairing.
- `radicalQuotient_rank_even` (characterisation) — rank ℱ₀ is even, since ℱ₀ carries a perfect alternating pairing.

*Construction.*

1. R^n f_*ℚ_ℓ on U is the pullback of R^n f₀_*ℚ_ℓ on U₀ (proper base change, LPV.4). ℰ is spanned by the vanishing cycles and is stable under π₁(U, u), and also under the arithmetic π₁(U₀, u) because the set of vanishing cycles is Frobenius-stable. So ℰ descends to ℰ₀ (LPV.4).
2. ψ is Poincaré duality on the fibres, which are smooth of odd dimension n, so it is alternating with values in ℚ_ℓ(−n) (EtaleDualityAndPerverseSheaves EDC.2).
3. ℰ₀ ∩ ℰ₀^⊥ is the radical of ψ restricted to ℰ₀, a lisse subsheaf, so ψ is perfect on the quotient.

*Acceptance.*

- A Lefschetz pencil of plane cubics (X = ℙ², n = 1): ℰ = H¹ of the fibres, ℰ ∩ ℰ^⊥ = 0, and ℱ₀ is the rank-2 sheaf with its Weil pairing into ℚ_ℓ(−1).

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.3`, `LefschetzPencilsAndVanishingCycles:LPV.4`, `EtaleDualityAndPerverseSheaves:EDC.2`.

*Planet:* Radical quotient of a pencil.

*Sources.*

- La conjecture de Weil. I, §6, (6.1), p. 295: “La partie évanescente de la cohomologie” The vanishing part ℰ, a local system on U.
- La conjecture de Weil. I, §6, (6.1), p. 295: “Le cup-produit est une forme alternée” The alternating cup-product ψ and the induced perfect pairing on ℰ₀/(ℰ₀ ∩ ℰ₀^⊥).
- La conjecture de Weil. I, §6, (6.1), p. 295: “On suppose que X est connexe de dimension paire” X connected of even dimension n + 1.

### Theorems

#### Lemma. Weil I Lemma 6.4: geometrically constant lisse sheaves come from 𝔽_q

*Module* `TauCeti/Weights/WeilI/Pencil.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`.

Let 𝒢₀ be a lisse ℚ_ℓ-sheaf on U₀ whose pullback 𝒢 to U is constant. Then there are ℓ-adic units α_i ∈ ℚ̄_ℓ with det(1 − F_x t^{deg x}, 𝒢₀) = ∏_i(1 − α_i^{deg x} t^{deg x}) for every x ∈ |U₀|. In fact 𝒢₀ is the pullback of its direct image to Spec 𝔽_q, a representation G₀ of Gal(𝔽̄_q/𝔽_q), and ∏(1 − α_i t) = det(1 − F t, G₀).

*Hypotheses.*

- The α_i are ℓ-adic units because Gal(𝔽̄_q/𝔽_q) is compact.
- The lemma applies to R^i f_*ℚ_ℓ for i ≠ n, to R^n f_*ℚ_ℓ/ℰ₀ and to ℰ₀ ∩ ℰ₀^⊥, which are geometrically constant for a Lefschetz pencil (LefschetzPencilsAndVanishingCycles LPV.4).

*Proof.*

1. 𝒢₀ corresponds to a representation of π₁(U₀, u) trivial on π₁(U, u), so it factors through π₁(U₀)/π₁(U) = Gal(𝔽̄_q/𝔽_q).
2. The Frobenius at x maps to F^{deg x} in Gal(𝔽̄_q/𝔽_q), so its eigenvalues are the α_i^{deg x} (DWP.0/finite-field-base-extension-of-weights).

*Acceptance.*

- The Tate twist ℚ_ℓ(−1) on U₀: α = q, and det(1 − F_x t^{deg x}) = 1 − q^{deg x} t^{deg x}.

*Uses.* `LefschetzPencilsAndVanishingCycles:LPV.4`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`.

*Sources.*

- La conjecture de Weil. I, §6, Lemme (6.4), p. 295: “tel que son image réci-” Lemma 6.4.
- La conjecture de Weil. I, §6, proof of (6.4), p. 296: “est l'image réciproque d'un faisceau sur Spec” 𝒢₀ is a pullback from Spec 𝔽_q.

#### Theorem. The zeta functions of the fibres, split into a constant part and the ℱ₀ part

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`.

In the setting of radical-quotient-of-the-vanishing-system, there are ℓ-adic units α_1, …, α_N and β_1, …, β_M in ℚ̄_ℓ, with α_i ≠ β_j for all i and j, such that for every x ∈ |U₀|, Z(X_x, t) = [∏_i(1 − α_i^{deg x} t) / ∏_j(1 − β_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{n+1}}, where t is the variable for the residue field k(x). In particular the right-hand side lies in ℚ(t).

*Hypotheses.*

- Z(X_x, t) ∈ ℚ(t) is the rationality of the zeta function over ℚ (WeilConjectures WC.1). The cohomological formula is Weil I (1.5.4), requested from SchemeAndStackFoundations SF.2.
- Common α_i = β_j can be cancelled, so they may be assumed distinct. This is the finite eigenvalue family bookkeeping RS-17 asks for, with no appeal to purity.
- No Riemann hypothesis is used: the α and β are arbitrary ℓ-adic units.

*Proof.*

1. For x ∈ |U₀|, the fibre X_x is smooth projective over k(x), and H^i(X_x̄) is the stalk of R^i f_*ℚ_ℓ at a geometric point over x (proper base change, SF.2).
2. (1.5.4) over k(x): Z(X_x, t) = ∏_i det(1 − F_x t, R^i f_*ℚ_ℓ)^{(−1)^{i+1}}.
3. Filter R^n by ℰ ∩ ℰ^⊥ ⊆ ℰ ⊆ R^n: the factor splits as det(on R^n/ℰ)·det(on ℰ ∩ ℰ^⊥)·det(on ℱ₀) (DWP.0/characteristic-polynomial-in-short-exact-sequences).
4. Lemma geometrically-constant-lisse-sheaves on R^i (i ≠ n), R^n/ℰ₀ and ℰ₀ ∩ ℰ₀^⊥ gives the α and β factors. Cancel common values.
5. Z(X_x, t) ∈ ℚ(t) (WC.1).

*Acceptance.*

- A pencil of plane cubics (n = 1): Z(X_x, t) = det(1 − F_x t, ℱ₀)/((1 − t)(1 − q_x t)). There are no α's, and β = (1, q), from H⁰ = ℚ_ℓ and H² = ℚ_ℓ(−1).

*Uses.* `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`, `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`, `WeilConjectures:WC.1`, `SchemeAndStackFoundations:SF.2`.

*Sources.*

- La conjecture de Weil. I, §6, (6.4), p. 296: “écrit sous forme irréductible” The factorization of Z(X_x, t).
- La conjecture de Weil. I, §1, (1.5.4), p. 276: “Cette formule est l'interprétation cohomologique de Grothendieck” The cohomological formula for Z.

#### Lemma. Weil I Lemma 6.7: a family is determined by its n-th powers for enough n

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`.

Let K be a finite set of integers different from 1, and (δ_j)_{j ≤ Q}, (ε_j)_{j ≤ Q} two families of elements of a field. If, for all sufficiently large n divisible by no element of K, the families (δ_j^n) and (ε_j^n) agree up to order, then (δ_j) and (ε_j) agree up to order.

*Hypotheses.*

- K must exclude 1: every integer is divisible by 1.
- The families are finite and counted with multiplicity.

*Proof.*

1. Induction on Q. For each j, the n with δ_0^n = ε_j^n form an ideal n_jℤ.
2. If δ_0 ≠ ε_j for all j, then all n_j ≠ 1, and there are arbitrarily large n divisible by no n_j and no element of K. Then δ_0^n ≠ ε_j^n for all j, contradicting the hypothesis. So δ_0 = ε_{j₀} for some j₀.
3. Remove δ_0 and ε_{j₀} and apply the induction hypothesis.

*Acceptance.*

- δ = (1, −1), ε = (−1, 1): equal. δ = (ζ₃), ε = (1): the cubes agree, but for n not divisible by 3 they differ, and with K = {3} the hypothesis fails, as it should.

*Sources.*

- La conjecture de Weil. I, §6, proof of (6.7), p. 297: “On procède par récurrence sur” Induction on the size of the family.

#### Lemma. Weil I Lemma 6.11: the arithmetic monodromy of ℱ₀ is open in H

*Module* `TauCeti/Weights/WeilI/Density.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`.

Let u ∈ U and ℱ = ℱ₀,u, with the perfect alternating ψ. π₁(U₀, u) acts through symplectic similitudes, ρ : π₁(U₀, u) → CSp(ℱ, ψ). Let χ : ℤ̂ → ℤ_ℓ^× be the character by which Gal(𝔽̄_q/𝔽_q) ≅ ℤ̂ acts on ℚ_ℓ(−n), and H = {(a, g) ∈ ℤ̂ × CSp(ℱ, ψ) : μ(g) = χ(a)}, where μ is the multiplier. Then (deg, ρ) : π₁(U₀, u) → H has open image H₁.

*Hypotheses.*

- The openness of the geometric monodromy in Sp(ℱ, ψ) is Weil I (5.10), which LefschetzPencilsAndVanishingCycles LPV.5 owns: open symplectic monodromy for the fixed ℚ_ℓ model.
- ℱ₀ ≠ 0 is assumed. For ℱ₀ = 0 the statements are empty.

*Proof.*

1. ψ takes values in ℚ_ℓ(−n), so ρ(σ) multiplies ψ by χ(deg σ): the map lands in H.
2. π₁(U₀, u) maps onto ℤ̂ = Gal(𝔽̄_q/𝔽_q), because U₀ is geometrically connected.
3. The kernel of H → ℤ̂ is Sp(ℱ, ψ), and the image of π₁(U, u) there is open (LPV.5). An extension of an open subgroup of the kernel by a surjection onto the quotient is open.

*Acceptance.*

- Plane cubics: the image of π₁(U) is open in SL₂(ℚ_ℓ) = Sp₂.

*Uses.* `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `LefschetzPencilsAndVanishingCycles:LPV.5`.

*Sources.*

- La conjecture de Weil. I, §6, (6.10), p. 297: “par similitudes symplectiques” π₁(U₀) acts by symplectic similitudes.
- La conjecture de Weil. I, §6, (6.10), p. 298: “le sous-groupe défini par l'équation” The group H.

#### Lemma. Weil I Lemma 6.12: the eigenvalue-δ^a locus is closed and Haar-null

*Module* `TauCeti/Weights/WeilI/Density.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`.

Let δ be an ℓ-adic unit and ℱ ≠ 0. The set Z_δ of (a, g) ∈ H₁ such that δ^a is an eigenvalue of g is closed in the compact group H₁ and has Haar measure 0.

*Hypotheses.*

- δ^a for a ∈ ℤ̂ is defined because δ is an ℓ-adic unit.
- This is the compact ℓ-adic Haar-null step that RS-17 asks DWP.3 to prove itself.
- ℱ ≠ 0 is needed: for ℱ = 0 there are no eigenvalues and Z_δ = ∅.

*Proof.*

1. Closedness: (a, g) ↦ det(δ^a − g) is continuous, and Z_δ is its zero set.
2. Fibres: for fixed a, CSp_a = {g : μ(g) = χ(a)} is a homogeneous space under Sp(ℱ, ψ), an ℓ-adic analytic manifold. Z_{δ,a} = {g ∈ CSp_a : det(δ^a − g) = 0} is a proper Zariski-closed subset (some g ∈ CSp_a has no eigenvalue δ^a, because rank ℱ ≥ 2 and scaling a symplectic basis moves the eigenvalues), so it has measure 0 in CSp_a.
3. H₁ ∩ ({a} × Z_{δ,a}) is null in the fibre of H₁ over a, and Fubini for the projection H₁ → ℤ̂ gives measure 0.

*Acceptance.*

- ℱ of rank 2 and δ = 1: the set of g ∈ SL₂(ℤ_ℓ) with eigenvalue 1 (unipotent-type) is a proper analytic subset of measure 0.

*Uses.* `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`.

*Sources.*

- La conjecture de Weil. I, §6, Lemme (6.12), p. 298: “est un fermé de mesure nulle” Z is closed of measure zero.
- La conjecture de Weil. I, §6, proof of (6.12), p. 298: “et on applique Fubini à la” Fubini over the projection to ℤ̂.

#### Lemma. The Frobenius elements landing in a Haar-null set have density zero

*Module* `TauCeti/Weights/WeilI/Density.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`.

Let δ_1, …, δ_Q be ℓ-adic units. The set L of x ∈ |U₀| such that some δ_j^{deg x} is an eigenvalue of F_x on ℱ₀ has Dirichlet density 0. More precisely, the proportion of the closed points of degree n that lie in L tends to 0 as n → ∞. In particular, for every sufficiently large n there are closed points of degree n outside L.

*Hypotheses.*

- The atlas's completion contract for DWP.3 splits this into two steps. The first is finite-quotient Chebotarev with constant-field degree congruences (imported from FunctionFieldArithmetic FA.5). The second is the approximation of the closed Haar-null set by open neighbourhoods of small measure, proved here. Topological density alone does not give density zero.

*Proof.*

1. Z = ∪_j Z_{δ_j} ⊂ H₁ is closed and Haar-null (Lemma 6.12). By regularity of Haar measure on the compact group H₁, for every ε > 0 there is an open-closed neighbourhood V ⊇ Z, a finite union of cosets of an open normal subgroup, with μ(V) < ε.
2. V is the preimage of a subset of a finite quotient G of H₁. Chebotarev for the finite Galois cover of U₀ with group G, including the constant-field degree congruences (FA.5), gives density(x : (deg x, ρ(F_x)) ∈ V) = μ(V) < ε.
3. x ∈ L means (deg x, ρ(F_x)) ∈ Z ⊆ V, so the upper density of L is below ε for every ε > 0.
4. Per degree: Chebotarev with constant-field congruences equidistributes the Frobenius elements of the degree-n points in the fibre of G over n, with an error that tends to 0 (FA.5, which uses the curve Weil estimate DWP.1). The fibre of V over n has relative measure below ε for n large, because Z has null fibres (Lemma 6.12). So the proportion of degree-n points in L is eventually below ε.

*Acceptance.*

- For the pencil of plane cubics and δ = 1: 1 is an eigenvalue of F_x on ℱ₀ = H¹(E_x) iff #E_x(k(x)) = det(1 − F_x | H¹) = 0. That is impossible, since E_x has a rational point, so L = ∅.

*Uses.* `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`, `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`, `FunctionFieldArithmetic:FA.5`.

*Sources.*

- La conjecture de Weil. I, §6, (6.13), p. 298: “théorème de densité de Gebotarev” Density zero via Chebotarev.

#### Theorem. Weil I Proposition 6.6: the denominator of (6.6.1) away from K and L

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`.

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units with γ_i ≠ δ_j. There are a finite set K of integers different from 1 and a density-zero set L ⊂ |U₀| such that, for x ∉ L with deg x divisible by no element of K, the rational function det(1 − F_x t, ℱ₀)·∏_i(1 − γ_i^{deg x} t) / ∏_j(1 − δ_j^{deg x} t), written in lowest terms, has denominator ∏_j(1 − δ_j^{deg x} t).

*Hypotheses.*

- The two exceptional sets are exactly where cancellation can happen: δ_j^{deg x} equal to some γ_i^{deg x} (controlled by K), or δ_j^{deg x} an eigenvalue of F_x (controlled by L).

*Proof.*

1. For each i and j, the n with γ_i^n = δ_j^n form n_{ij}ℤ with n_{ij} ≠ 1 (since γ_i ≠ δ_j). Let K = {n_{ij}}.
2. L = the x with some δ_j^{deg x} an eigenvalue of F_x on ℱ₀, of density 0 (lemma exceptional-frobenius-set-has-density-zero).
3. For x ∉ L with deg x divisible by no element of K, no factor 1 − δ_j^{deg x}t of the denominator cancels against the numerator.

*Acceptance.*

- γ = ∅, δ = (q): the denominator is 1 − q^{deg x} t unless q^{deg x} is an eigenvalue of F_x, which happens only on a density-zero set.

*Uses.* `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`, `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`.

*Sources.*

- La conjecture de Weil. I, §6, Proposition (6.6), p. 296: “écrit sous forme irréductible” The denominator in lowest terms.
- La conjecture de Weil. I, §6, (6.13), p. 298: “théorème de densité de Gebotarev” The proof of (6.6).

#### Theorem. Weil I Proposition 6.8: an intrinsic characterisation of the γ-polynomial

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`.

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units, R(t) = ∏(1 − γ_i t) and S(t) = ∏(1 − δ_j t). If, for every x ∈ |U₀|, ∏_j(1 − δ_j^{deg x} t) divides ∏_i(1 − γ_i^{deg x} t)·det(1 − F_x t, ℱ₀), then S(t) divides R(t). Consequently R(t) is the least common multiple of the S(t) satisfying this hypothesis, which characterises the γ-family intrinsically from the polynomials ∏(1 − γ_i^{deg x}t)·det(1 − F_x t, ℱ₀).

*Hypotheses.*

- The divisibility is required for every x, but it is used only for x outside the exceptional sets of Proposition 6.6.

*Proof.*

1. Cancel common pairs γ_i = δ_j until the families are disjoint.
2. Proposition 6.6: for x outside K and L the denominator of (6.6.1) is ∏(1 − δ_j^{deg x}t). But by hypothesis (6.6.1) is a polynomial, so no δ remains after cancellation: S divides R.

*Acceptance.*

- γ = (q, q), δ = (q): S | R. δ = (q²) with γ = (q): the hypothesis fails at a generic x.

*Uses.* `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`.

*Sources.*

- La conjecture de Weil. I, §6, Proposition (6.8), p. 297: “Cette proposition fournit une caractérisation intrinsèque de” The intrinsic characterisation of R(t).

#### Theorem. Weil I Theorem 6.2: the local factors of the radical quotient have rational coefficients

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`.

In the setting of radical-quotient-of-the-vanishing-system, for every x ∈ |U₀|, det(1 − F_x t, ℱ₀) ∈ ℚ[t].

*Hypotheses.*

- No Riemann hypothesis, no purity and no semisimplicity is assumed. The proof uses only the rationality of the fibres' zeta functions, geometric constancy of the other pieces, open symplectic monodromy and Chebotarev.
- The statement holds trivially for ℱ₀ = 0.

*Proof.*

1. By the factorization theorem it suffices to show that ∏(1 − α_i t) and ∏(1 − β_j t) have rational coefficients, that is, that the α-family and the β-family are defined over ℚ (6.5).
2. With (γ, δ) = (α, β), the function (6.6.1) is Z(X_x, t) ∈ ℚ(t), since n is odd. By Proposition 6.6, for x ∉ L with deg x divisible by no element of K, the denominator of Z(X_x, t) in lowest terms is ∏(1 − β_j^{deg x}t). So the multiset (β_j^{deg x}) is stable under Gal(ℚ̄/ℚ), and each β_j is algebraic.
3. For σ ∈ Gal(ℚ̄/ℚ), the families (σβ_j) and (β_j) have the same n-th powers for every large n divisible by no element of K, because such n occur as degrees of points outside L (lemma exceptional-frobenius-set-has-density-zero). Lemma 6.7 gives (σβ_j) = (β_j), so ∏(1 − β_j t) ∈ ℚ[t] (6.9).
4. Then the polynomials ∏(1 − α_i^{deg x}t)·det(1 − F_x t, ℱ₀) = Z(X_x, t)·∏(1 − β_j^{deg x}t) lie in ℚ[t]. Proposition 6.8 characterises ∏(1 − α_i t) as the lcm of the S(t) dividing all of them, a Galois-stable characterisation, so ∏(1 − α_i t) ∈ ℚ[t].
5. Hence det(1 − F_x t, ℱ₀) = Z(X_x, t)·∏(1 − β_j^{deg x}t)/∏(1 − α_i^{deg x}t) ∈ ℚ(t), and being a polynomial it lies in ℚ[t].

*Acceptance.*

- Plane cubics: det(1 − F_x t, ℱ₀) = 1 − a_x t + q_x t², with a_x = q_x + 1 − #E_x(k(x)) ∈ ℤ.

*Uses.* `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`, `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`, `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`, `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`.

*Planet:* Rationality theorem (Weil I 6.2).

*Sources.*

- La conjecture de Weil. I, §6, Théorème (6.2), p. 295: “est à coefficients rationnels” Theorem 6.2: rational coefficients.
- La conjecture de Weil. I, §6, (6.9), p. 297: “Prouvons (6.5) et donc (6.2) (modulo (6.6))” The proof of 6.2 from 6.6–6.8.

#### Theorem. Weil I Corollary 6.3: the coarse bound on H¹(D, j_*ℱ)

*Module* `TauCeti/Weights/WeilI/Rationality.lean`. *Node* `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`.

Let j : U → D be the inclusion. Every eigenvalue α of F^* on H¹(D, j_*ℱ) is an algebraic number, and every complex conjugate satisfies q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

*Hypotheses.*

- This is where DWP.3 meets DWP.2. ℱ₀ satisfies the hypotheses of Theorem 3.2 with β = n: the pairing ψ from radical-quotient-of-the-vanishing-system, open symplectic monodromy (Weil I (5.10), LPV.5), and rational local factors (Theorem 6.2).

*Proof.*

1. Theorem 3.2's hypotheses hold for ℱ₀ with β = n (Weil I (5.10) and (6.2)).
2. Apply DWP.2/coarse-bound-on-cohomology-of-the-projective-line (Corollary 3.9) with β = n: q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

*Acceptance.*

- Plane cubics (n = 1): the eigenvalues on H¹(D, j_*ℱ) satisfy q^{1/2} ≤ |α| ≤ q^{3/2}.

*Uses.* `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`, `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`, `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`, `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`, `LefschetzPencilsAndVanishingCycles:LPV.5`.

*Sources.*

- La conjecture de Weil. I, §6, Corollaire (6.3), p. 295: “les hypothèses de (3.2) sont en effet vérifiées par” Corollary 6.3 from (3.2) and (3.9).

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
- `SchemeAndStackFoundations:SF.2` — The Grothendieck–Lefschetz trace formula for lisse (and constructible) ℚ_ℓ-sheaves on a curve over 𝔽_q in the form of Weil I (1.14.3), Z(U₀, F₀, t) = ∏_i det(1 − F^*t, H^i_c(U, F))^{(−1)^{i+1}}, with finiteness of H^i_c. This is the CohomologicalPointCounting trace formula (TraceFormula Layer 14) that RS-17 names as DWP.2's supplier. The fixed-point formula for a curve and its Jacobian, #Fix(α) = (Γ_α · Δ) = 1 − Tr(α′ | T_ℓJ) + deg α (Milne, Abelian Varieties, III.11.2; RS-17 names it the curve and Jacobian trace comparison of TraceFormula Layer 8). Proper base change for the pencil f : X̃ → D (the stalk of R^i f_*ℚ_ℓ at a geometric point over x is H^i(X_x̄)), and the trace formula (1.5.4) for the fibres. Needed by `weil-estimate-for-curves`, `coarse-bound-on-compact-cohomology`, `compact-cohomology-of-even-tensor-powers`, `weights-and-l-functions-of-lisse-sheaves-on-curves`, `zeta-of-the-fibres-and-the-pencil-factorization`.
- `EtaleDualityAndPerverseSheaves:EDC.2` — Weil I (2.10): for a smooth connected curve X over an algebraically closed field and a lisse ℚ_ℓ-sheaf F, H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x)_{π₁(X, x)}(−1). Weil I (2.12): Poincaré duality H¹(X̄, j_*F) × H¹(X̄, j_*F^∨(1)) → ℚ_ℓ on a smooth projective curve, Frobenius-equivariantly. Poincaré duality on the smooth fibres of the pencil, giving the alternating cup-product pairing into ℚ_ℓ(−n). Needed by `coarse-bound-on-cohomology-of-the-projective-line`, `coarse-bound-on-compact-cohomology`, `compact-cohomology-of-even-tensor-powers`, `radical-quotient-of-the-vanishing-system`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra` — The first fundamental theorem for the complex symplectic group: the Sp(V)-invariant multilinear forms on V^{2k} are spanned by the pair contractions ψ_P (Brauer algebra), with the dimension of the invariants. Needed by `symplectic-coinvariants-of-even-tensor-powers`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` — Zariski closure of a subgroup of the ℚ_ℓ-points of a linear algebraic group as an algebraic subgroup, and connectedness of Sp_{2g}. Needed by `open-subgroups-of-symplectic-groups-are-zariski-dense`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` — The Lie algebra of an algebraic subgroup over ℚ_ℓ, and the fact that an algebraic subgroup whose ℚ_ℓ-points contain an ℓ-adically open subgroup of G(ℚ_ℓ) has full dimension. Needed by `open-subgroups-of-symplectic-groups-are-zariski-dense`.
- `AbelianSchemesAndArithmeticModuli:A2` — A polarization of an abelian variety over 𝔽_q defined over 𝔽_q (A is projective over 𝔽_q), with its dual map π^∨ compatible with the Frobenius. Needed by `rosati-of-the-frobenius-endomorphism`.
- `ArithmeticGaloisRepresentations:R01.6` — The Tate module T_ℓA of an abelian variety over 𝔽_q with its Galois action, the Frobenius endomorphism acting as the arithmetic Frobenius, and H¹(A_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓA)^∨. Needed by `weil-estimate-for-abelian-varieties`, `weights-of-the-cohomology-of-curves`.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property` — The Abel–Jacobi map f_P : C → J and its universal property, so that an endomorphism of C (such as the Frobenius) induces one of J with f_P ∘ α = α′ ∘ f_P, and the induced isomorphism H¹(J) ≅ H¹(C). Needed by `weil-estimate-for-curves`, `weights-of-the-cohomology-of-curves`.
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1` — The trace of Frobenius a = q + 1 − #E(𝔽_q) and the Hasse bound |a| ≤ 2√q, with which the abelian-variety estimate is compared (not reproved). Needed by `compatibility-with-the-hasse-bound`.
- `LefschetzPencilsAndVanishingCycles:LPV.3` — A Lefschetz pencil of hyperplane sections of a smooth projective variety over 𝔽_q defined over 𝔽_q (after a Veronese embedding and a finite extension if necessary), with its axis, parameter line, blow-up f : X̃ → D and singular set S. Needed by `radical-quotient-of-the-vanishing-system`.
- `LefschetzPencilsAndVanishingCycles:LPV.4` — The lisse sheaf R^n f_*ℚ_ℓ on U = D − S, the vanishing part ℰ as a π₁(U₀)-stable subsheaf defined over 𝔽_q, the cup-product pairing into ℚ_ℓ(−n), and geometric constancy of R^i f_*ℚ_ℓ (i ≠ n), R^n/ℰ and ℰ ∩ ℰ^⊥ (Weil I §5). Needed by `radical-quotient-of-the-vanishing-system`, `geometrically-constant-lisse-sheaves`.
- `LefschetzPencilsAndVanishingCycles:LPV.5` — Weil I (5.10): for the fixed ℚ_ℓ model, the image of π₁(U, u) in Sp(ℰ/(ℰ ∩ ℰ^⊥), ψ) is open. Needed by `open-image-in-the-symplectic-similitude-group`, `coarse-bound-for-the-pencil`.
- `FunctionFieldArithmetic:FA.5` — The function-field Chebotarev density theorem for finite Galois covers of a curve over 𝔽_q, with the constant-field degree congruences, and its per-degree form: the Frobenius elements of the degree-n points equidistribute in the fibre over n, with error tending to 0. Needed by `exceptional-frobenius-set-has-density-zero`.
- `WeilConjectures:WC.1` — Rationality over ℚ of the zeta function Z(V, t) of a variety over a finite field, from the integral point-count series (Weil I §1, the Hankel-determinant and Fatou argument). Needed by `zeta-of-the-fibres-and-the-pencil-factorization`.

## Mistakes found in the sources

- **E1** (gap, Chapter III, proof of Proposition 11.2, p. 119 (footnote 6)). The degree of the pullback of L(J × Θ) along (1 × α) ∘ (f × f) ∘ Δ must be computed from the theta divisor's intersection with f(C) (Milne III.6.12, Lang 1959 IV §3). The step is incomplete as printed. The node weil-estimate-for-curves imports the fixed-point formula from its RS-17 supplier instead of relying on this proof. The author marks the displayed identity with a footnote reading "Needs fixing"; the degree computation it records is not justified in the printed proof. Known: Flagged by the author in the text (footnote 6); not on the author's errata page for v2.00.

## Library baseline

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

- Pierre Deligne, *La conjecture de Weil. I*. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf (SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`). Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): §1 (1.1)–(1.15), pp. 273–279, including the proof of (1.7) ⇒ (1.6); §2 (2.1)–(2.14), pp. 280–283; §3 (3.1)–(3.6), pp. 283–284; cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 2): §3 (3.1)–(3.9) in full, pp. 283–287, and Scholie (2.10), p. 282; cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 4): (5.12)–(5.13) and §6 (6.1)–(6.13), pp. 294–298, in full.
- Pierre Deligne, *La conjecture de Weil. II*. Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135); locators give printed pages. https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf (SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`). Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 1): (1.1.11)–(1.1.15), pp. 152–153; §1.2 (1.2.1)–(1.2.14), pp. 153–156; the opening of §1.3, pp. 156–157.
- J. S. Milne, *Abelian Varieties*. Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6. https://www.jmilne.org/math/CourseNotes/AV.pdf (SHA-256 `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`). Read: cc-fb70e5, 2026-09-29 (part DWP.0, checkpoint 3): Chapter II §1, pp. 75–78, in full; Chapter III §§9–11, pp. 113–119 (Corollary 9.6, Theorem 11.1, Proposition 11.2 with its proof, Lemma 11.3, Corollary 11.4, Remark 11.5); the author's errata page for v2.00.

## Non-goals

- General sheaf-level purity (DWP.5, DWP.7) and the Lefschetz pencil geometry itself (LPV).
- A second proof of the Hasse bound or of Rosati positivity.
- The separation and descent of zeta-function factors (WC.3), and the sign of the functional equation (WC.2).
