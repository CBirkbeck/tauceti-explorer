# Deligne weights, purity and the Weil bounds

This part develops the numerical language of weights, the initial Weil estimate for curves and abelian varieties, the proof of Weil I for smooth projective varieties, and the local and analytic preparation for Weil II’s sharp curve theorem. It ends with interfaces for arithmetic realizations and Frobenius equidistribution. The general direct-image theorem, mixed complexes, canonical weight filtrations, geometric semisimplicity and absolute hard Lefschetz belong to the companion part DWP.7–DWP.9.

The central design is a chain of actual estimates. Symplectic monodromy and positive tensor-power Euler products give a half-unit bound. A pencil identifies the needed rational local factors. Products of varieties remove the error in middle degree, and weak Lefschetz and duality give every smooth projective degree. For nonconstant coefficients, determinantal weights and local monodromy purity prepare a different argument: the strict analytic bound feeds square improvement on a pencil in a product of curves. Its limit is the sharp bound, with duality supplying equality for parabolic cohomology.

The objects carry reusable APIs, not just names attached to these endpoints. In particular, eigenvalues are multisets of characteristic roots, mixedness is a finite filtration by actual subsheaves, and the compact form retains the central degree action. Each construction has small and degenerate examples together with tests that reject plausible wrong conventions.

## Conventions and ownership

Write k₀=𝔽_q with q=pᵃ>1, ℓ≠p, X=X₀×k̄₀ and q_x=q^{deg x}=N(x). Cohomology means geometric étale cohomology with the indicated ℓ-adic coefficients. Frobenius on cohomology is **geometric Frobenius**. It acts on ℚ_ℓ(1) by q⁻¹, so twisting by (r) subtracts 2r from the weight. The q-power scheme endomorphism acts as arithmetic Frobenius on geometric points and on the Tate module; its pullback on cohomology agrees with the corresponding geometric Galois action under the stated contravariance. These actions are compared explicitly in DWP.1.

The Weil group uses geometric degree +1. Weil I §6 instead writes arithmetic degree; a geometric Frobenius of a degree-e point has arithmetic coordinate −e. On the vanishing system for an odd-dimensional fibre of dimension d, its cup-product multiplier is q^{de}. The dimension d is fixed while the closed-point degree e varies.

A fixed ι is a field embedding of the coefficient algebraic closure into ℂ; continuity is not assumed. Integer Weil purity includes algebraicity and every conjugate. Real ι-purity is a statement at one embedding. A pure zero object satisfies each purity predicate but has an empty set of actual weights. Purity never implies that an arithmetic Frobenius matrix is semisimple. The ordinary transpose and the contragredient are distinguished: their spectra are respectively α and α⁻¹.

RS-17 makes DWP.0 the single owner of Weil numbers, ι-weights and reciprocal-spectrum linear algebra. DWP imports the actual étale coefficient categories, local monodromy filtrations, pencils, vanishing cycles, duality and trace formulas from their owners. WC.3 owns integral degree factors and independence of ℓ; WC.5 owns component-aware all-extension point counts. DWP.7–DWP.9 are imported by their existing declaration ids. Neither a Hecke eigenspace nor a pure ambient realization automatically has compatible rational factors at every prime.

## The layers and the proof order

The eight current layers are described below. Their declaration graph, rather than the numerical order of their labels, determines the proof order. The coefficient definitions at the beginning of DWP.5 precede the DWP.2 adapter to punctual purity. The local and analytic suffix of DWP.5 follows the earlier estimates. Separating those prefixes avoids a spurious cycle between whole layers.

| Layer | Purpose | Principal output |
| --- | --- | --- |
| DWP.0 | Numerical weights and functorial linear algebra | Weil numbers, twists, characteristic spectra and weight decomposition |
| DWP.1 | Initial Weil estimate | Pure H¹ of curves and abelian varieties |
| DWP.2 | Fundamental estimate with its actual hypotheses | The coarse bound from symplectic monodromy and positive Euler products |
| DWP.3 | Arithmetic pencil factors | Rational local factors of the radical quotient |
| DWP.4 | Dimension induction | Smooth projective purity in every degree |
| DWP.5 | Coefficient, local and analytic preparation | Local monodromy purity, compact Weil form and strict initial curve bound |
| DWP.6 | Square improvement | Sharp purity of parabolic curve cohomology and compact-support upper bounds |
| DWP.10 | Arithmetic interfaces | Stable-subquotient transport and Frobenius equidistribution |

DWP.4 uses all three pencil cases: zero vanishing cycles, zero radical quotient, and nonzero quotient. The radical E∩E⊥ is retained. Leray is used by subquotients and filtrations, without an assumed degeneration. DWP.6 uses the coefficient-specific node, boundary tangency and crossing calculations; it does not invoke DWP.7 to prove the curve theorem that DWP.7 itself needs.

For the arithmetic exceptional set in DWP.3, global Haar measure zero alone is insufficient. The required argument proves nullity in every arithmetic degree fibre. Clopen finite-quotient neighbourhoods have continuous conditional fibre masses; monotone convergence and Dini give a uniform bound over the compact degree quotient. Finite-quotient Chebotarev with its constant-field congruences then gives an exceptional proportion tending to zero in each sufficiently large degree. This is the precise supplier contract used in the rationality proof.

## Layer specifications

Every item states the mathematical declaration, its direct inputs and its proof or construction. API names are suggested library names. A planet is a visible landmark of its layer; its choice does not assert an implementation.

## DWP.0 — Eigenvalue weights and functorial linear algebra

<a id="dwp-0-weil-q-number"></a>

### Weil q-numbers of integer weight

Fix a real number q > 1 and n ∈ ℤ. An element α of a field K of characteristic 0 is a Weil q-number of weight n (Deligne: pure of weight n relative to q) if α is algebraic over ℚ and every complex root of its minimal polynomial over ℚ has absolute value q^{n/2}. The predicate depends only on the minimal polynomial of α. So it is preserved and reflected by every field homomorphism K → K′, and it does not depend on the ambient field or on a chosen splitting field. Equivalently, |σ(α)| = q^{n/2} for every field homomorphism σ : ℚ(α) → ℂ. When K is algebraic over ℚ, it is equivalent to |φ(α)| = q^{n/2} for every field homomorphism φ : K → ℂ. A Weil q-number is nonzero, and its weight is unique. Integrality over ℤ is a separate predicate.

Algebraicity is a clause of the definition. In Mathlib's convention the minimal polynomial of a transcendental element is 0 and has no roots, so the conjugate clause alone would hold vacuously.

q > 1 is what makes the weight unique; for q = 1 a root of unity would have every weight. In the finite-field applications q = #k₀ = p^a, and at a closed point x the base is q_x = q^{deg x}.

The comparison with all homomorphisms φ : K → ℂ needs K algebraic over ℚ (ℚ̄ or a number field). A field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and the condition would be vacuous. For K = ℚ̄_ℓ the comparison with isomorphisms ι : ℚ̄_ℓ ≅ ℂ is the theorem weil-number-iff-iota-pure-for-every-iota.

Weights are integers, as in Weil II (1.2.1). Real weights are the ι-weights of the node iota-weight.

Atlas landmark: **Weil q-number**.

The design is used in:

- DeligneWeightsAndPurity:DWP.0/endomorphism-weights: Weil purity of an endomorphism is this predicate on each eigenvalue.
- DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic: products, inverses and conjugates.
- FiniteFieldsAndCharacterSums:FF.2/additive-l-function-purity: the reciprocal roots of the L-polynomial are Weil q-numbers of weight 1 (IsWeilNumber.of_aeval_eq_zero).
- MordellLawrenceVenkatesh:LV.1/faltings-finiteness: Frobenius eigenvalues as Weil q-numbers, stable under products and inverses.
- PadicDifferentialEquationsAndRigidCohomology:RD.7/weil-factors-rational-and-integral: Weil q-numbers of integral weight as roots of the rigid Weil factors.
- DeligneWeightsAndPurity:DWP.1: the all-conjugates bound √q for curves and abelian varieties.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.IsWeilNumber` | data | Algebraicity over ℚ and modulus q^(n/2) at every complex root of the minimal polynomial. |
| `TauCeti.Weights.IsWeilNumber.isAlgebraic` | projection | A Weil q-number is algebraic over ℚ. |
| `TauCeti.Weights.IsWeilNumber.norm_eq` | characterisation | Every field embedding into ℂ sends the Weil number to a number of modulus q^(n/2). |
| `TauCeti.Weights.isWeilNumber_iff_forall_embedding` | characterisation | If the ambient field is algebraic over ℚ, purity is equivalent to the common modulus at every complex embedding. |
| `TauCeti.Weights.isWeilNumber_map_iff` | functoriality | Field homomorphisms preserve and reflect the minimal-polynomial purity predicate. |
| `TauCeti.Weights.IsWeilNumber.of_aeval_eq_zero` | characterisation | If P ∈ ℚ[T] is nonzero, P(α) = 0 and every complex root of P has absolute value q^{n/2}, then α is a Weil q-number of weight n. |
| `TauCeti.Weights.IsWeilNumber.ne_zero` | characterisation | A Weil q-number is nonzero. |
| `TauCeti.Weights.IsWeilNumber.weight_unique` | characterisation | For q>1 a nonzero Weil number has a unique integer weight. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isWeilNumber_roots_T2_sub_T_add_two` | value | The roots of T² − T + 2 are Weil 2-numbers of weight 1: the discriminant is −7, so the roots (1 ± i√7)/2 are complex conjugate with product 2. |
| `TauCeti.Weights.not_isWeilNumber_one_add_sqrt_two` | non-example | 1 + √2 is a Weil q-number for no q > 1 and no n. Its conjugates 1 ± √2 have absolute values with product 1, forcing n = 0, while \|1 + √2\| ≠ 1. It has absolute value q^{1/2} at one real embedding for q = (1 + √2)², so one embedding does not suffice. |
| `TauCeti.Weights.isWeilNumber_inv_not_isIntegral` | non-example | For an integer q ≥ 2, q⁻¹ ∈ ℚ is a Weil q-number of weight −2 and is not integral over ℤ: purity and integrality are separate predicates. |
| `TauCeti.Weights.isWeilNumber_rootOfUnity` | degenerate | A root of unity is a Weil q-number of weight 0 for every q > 1; 0 is a Weil q-number of no weight. |

Proof or construction:

1. Conjugates: the field homomorphisms ℚ(α) → ℂ correspond to the complex roots of the minimal polynomial of α, through the adjoin-root presentation of ℚ(α).
2. Invariance: an injective ℚ-algebra map f satisfies minpoly ℚ (f α) = minpoly ℚ α (mathlib:minpoly.algHom_eq), and a ring homomorphism between fields of characteristic 0 is a ℚ-algebra map.
3. All embeddings of K: when K is algebraic over ℚ, each σ : ℚ(α) → ℂ extends to K → ℂ by mathlib:IsAlgClosed.lift applied to K over ℚ(α).
4. Roots of a rational polynomial P with P(α) = 0: the minimal polynomial divides P, so its complex roots are roots of P.
5. Nonvanishing and uniqueness: q^{n/2} > 0, so α ≠ 0. The minimal polynomial has a complex root, and q^{n/2} = q^{m/2} with q > 1 forces n = m.

Acceptance checks:

- i√q is a Weil q-number of weight 1 for every integer q ≥ 2 (its conjugates are ±i√q).
- For q ∈ ℚ with q > 1 and k ∈ ℤ, q^k is a Weil q-number of weight 2k.
- (3 + 4i)/5 is a Weil q-number of weight 0 for every q > 1, but it is neither an algebraic integer nor a root of unity.

Direct inputs: `mathlib:minpoly.algHom_eq`, `mathlib:IsAlgClosed.lift`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Définition (1.2.1), p. 153; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, Lemme (1.7), p. 276; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

<a id="dwp-0-weil-number-arithmetic"></a>

### Products, inverses, conjugation and integrality of Weil q-numbers

Let q > 1, and let α, β ∈ K be Weil q-numbers of weights n and m. (i) αβ is a Weil q-number of weight n + m, α⁻¹ one of weight −n, and α^k one of weight kn for k ∈ ℤ. (ii) If q is rational, q^k is a Weil q-number of weight 2k for k ∈ ℤ. (iii) If q is rational, then for every field homomorphism σ : K → ℂ the complex conjugate of σ(α) is q^n/σ(α). In particular α + q^n α⁻¹ is a totally real algebraic number. (iv) If α is integral over ℤ, then n ≥ 0, and if moreover n = 0 then α is a root of unity. A sum of Weil q-numbers is not a Weil q-number in general.

Products need a common field: the conjugates of αβ are the σ(α)σ(β) for σ : ℚ(α, β) → ℂ, and each such σ restricts to embeddings of ℚ(α) and of ℚ(β).

Integrality is needed in (iv): (3 + 4i)/5 has weight 0 and is not a root of unity, and q⁻¹ has weight −2.

(iii) uses q ∈ ℚ so that q^n α⁻¹ lies in K.

Proof or construction:

1. Common field: every embedding of ℚ(αβ) into ℂ extends to ℚ(α, β) (mathlib:IsAlgClosed.lift), so the conjugates of αβ are products σ(α)σ(β) of conjugates taken with the same σ.
2. Inverses and powers: |σ(α)⁻¹| = q^{−n/2} and |σ(α)^k| = q^{kn/2}.
3. q^k is rational, it is its own only conjugate, and |q^k| = q^{2k/2}.
4. Complex conjugation: σ(α)·conj(σ(α)) = |σ(α)|² = q^n.
5. Integrality: the norm of α from ℚ(α) to ℚ is a nonzero integer of absolute value q^{nd/2}, where d = [ℚ(α) : ℚ]. So q^{nd/2} ≥ 1 and n ≥ 0. For n = 0 every conjugate has absolute value 1, and mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one applied to the number field ℚ(α) makes α a root of unity.

Acceptance checks:

- 1 + i is a Weil 2-number of weight 1, and (1 + i)² = 2i one of weight 2. The sum (1 + i) + 1 = 2 + i has absolute value √5 and is not a Weil 2-number.
- For α = (1 + i√7)/2 and q = 2: α + 2/α = α + ᾱ = 1, totally real as (iii) predicts.
- ζ₅ has weight 0, is integral and is a root of unity; (3 + 4i)/5 has weight 0 and is neither.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:IsAlgClosed.lift`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Définition (1.2.12), p. 156; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.14), p. 156.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

<a id="dwp-0-weil-number-base-extension"></a>

### Weil numbers under powers: change of q to q^r

Let q > 1, n ∈ ℤ and r ≥ 1. An element α of K is a Weil q-number of weight n if and only if α^r is a Weil q^r-number of weight n.

r ≥ 1. The backward implication needs algebraicity of α, which follows from that of α^r, since α is a root of T^r − α^r.

In the finite-field applications, a finite extension of k₀ of degree r replaces the geometric Frobenius F by F^r and q by q^r. At a closed point x of degree d, F_x = F^d and q_x = q^d.

Proof or construction:

1. Every embedding τ : ℚ(α^r) → ℂ extends to σ : ℚ(α) → ℂ (mathlib:IsAlgClosed.lift), and then τ(α^r) = σ(α)^r. Conversely, σ(α)^r is a conjugate of α^r.
2. |σ(α)|^r = (q^r)^{n/2} if and only if |σ(α)| = q^{n/2}, since x ↦ x^r is injective on [0, ∞).
3. α is algebraic over ℚ if and only if α^r is.

Acceptance checks:

- α = 1 + i (q = 2, weight 1): α² = 2i is a Weil 4-number of weight 1, since |2i| = 2 = 4^{1/2}.
- 1 and ζ₃ have the same cube and both have weight 0: the power forgets the difference between α and ζα, but not the weight.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:IsAlgClosed.lift`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.1), p. 275; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1, (1.1.13), p. 152.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`.

<a id="dwp-0-iota-weight"></a>

### ι-weights of nonzero elements of a coefficient field

Let E be a field, ι : E → ℂ a field homomorphism (not assumed continuous; Deligne takes an isomorphism ι : ℚ̄_ℓ ≅ ℂ), and q > 1 real. For α ∈ E^×, the ι-weight of α relative to q is w_{ι,q}(α) = 2 log_q |ι(α)| ∈ ℝ, so that |ι(α)| = q^{w/2}. α is ι-pure of weight β ∈ ℝ if w_{ι,q}(α) = β. The ι-weight is a group homomorphism E^× → ℝ: w(αβ) = w(α) + w(β) and w(α⁻¹) = −w(α). Moreover w_{ι,q}(q) = 2 when q ∈ ℚ, w_{ι,q^r}(α^r) = w_{ι,q}(α) for r ≥ 1, and w_{ι∘τ,q}(α) = w_{ι,q}(τ(α)) for a field homomorphism τ. A Weil q-number of weight n is ι-pure of weight n for every ι. An element of integer ι-weight need not be algebraic or a Weil q-number.

ι need not be continuous and is not canonical; ι-weights depend on ι. Purity for every ι is the theorem weil-number-iff-iota-pure-for-every-iota.

Weights are real numbers, as Weil II (1.2.8) allows. Restricting to integers would exclude the rank-one real-weight twists of DWP.5.

0 has no ι-weight.

q > 1 is part of the datum. At a closed point x, the Frobenius is F^{deg x} and the base is q^{deg x}, and w_{ι,q^r}(α^r) = w_{ι,q}(α) keeps the weight unchanged.

Atlas landmark: **ι-weight**.

The design is used in:

- DeligneWeightsAndPurity:DWP.0/endomorphism-weights: ι-weights of the eigenvalues of an endomorphism.
- DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters: a twist by b shifts ι-weights by w_ι(b).
- PadicDifferentialEquationsAndRigidCohomology:RD.6/pointwise-iota-weights: the ι-pure and ι-mixed predicates on Frobenius eigenvalues.
- DeligneWeightsAndPurity:DWP.5: pointwise ι-pure Weil sheaves (Weil II (1.2.6)).
- WeightsInEtaleCohomology:R34.1: weights for a chosen embedding compared with weights for all embeddings.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.iotaWeight` | constructor | The real number 2 log(\|ια\|)/log(q), with q>1 and α≠0. |
| `TauCeti.Weights.IsIotaPure` | data | Nonvanishing and the specified real ι-weight. |
| `TauCeti.Weights.iotaWeight_mul` | simp | The ι-weight of a product of nonzero scalars is the sum of their weights. |
| `TauCeti.Weights.iotaWeight_inv` | simp | The ι-weight of an inverse is the negative of the weight. |
| `TauCeti.Weights.iotaWeight_pow_base` | simp | Raising α and q to the same positive integer power preserves the ι-weight. |
| `TauCeti.Weights.iotaWeight_comp` | compatibility | Composition of field embeddings transports the ι-weight. |
| `TauCeti.Weights.norm_eq_rpow_iotaWeight` | characterisation | For q>1 and α≠0, the modulus is q raised to half the ι-weight. |
| `TauCeti.Weights.IsWeilNumber.isIotaPure` | compatibility | A Weil number is ι-pure of its integer weight for every complex embedding. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.iotaWeight_q` | value | For q ∈ ℚ with q > 1 and every ι: w_{ι,q}(q) = 2 and w_{ι,q}(q⁻¹) = −2. So ℚ_ℓ(1), on which geometric Frobenius acts by q⁻¹, has weight −2. |
| `TauCeti.Weights.iotaWeight_depends_on_iota` | non-example | For E = ℚ(√2) and q = 2, α = 1 + √2 has ι-weight 2 log₂(1 + √2) at one real embedding and −2 log₂(1 + √2) at the other: the ι-weight depends on ι. |
| `TauCeti.Weights.iotaWeight_transcendental` | non-example | For E=ℚ(t), choose a transcendental complex number z of modulus √2 and send t to z. Then the ι-weight of t relative to 2 is 1, an integer, although t is not algebraic. The numeric test accepts the supplied transcendence and modulus conditions; no Lindemann–Weierstrass theorem is assumed. |
| `TauCeti.Weights.iotaWeight_rootOfUnity` | degenerate | w_{ι,q}(ζ) = 0 for every root of unity ζ ∈ E and every ι. |

Proof or construction:

1. Real.logb q is a homomorphism from the positive reals under multiplication to ℝ, and α ↦ ‖ι(α)‖ is multiplicative on E^×.
2. logb (q^r) (x^r) = logb q x for r ≥ 1 and x > 0.
3. A Weil q-number α satisfies |ι(α)| = q^{n/2}, because ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).

Acceptance checks:

- ℚ_ℓ(r): the geometric Frobenius acts by q^{−r}, of ι-weight −2r for every ι (Weil I (3.1)).
- α = (1 + i√7)/2 ∈ ℚ̄: ι-weight 1 relative to 2 for every ι.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.8), p. 155.

Declaration id: `DeligneWeightsAndPurity:DWP.0/iota-weight`.

<a id="dwp-0-embeddings-into-the-complex-numbers"></a>

### Embeddings into ℂ extending a given embedding, and isomorphisms ℚ̄_ℓ ≅ ℂ

(i) Let E be a field of characteristic 0 with #E ≤ 𝔠, k ⊆ E a countable subfield, and σ : k → ℂ a field homomorphism. Then σ extends to a field homomorphism E → ℂ. (ii) If moreover E is algebraically closed with #E = 𝔠, then σ extends to a field isomorphism E ≅ ℂ. (iii) For every prime ℓ, #ℚ_ℓ = #ℚ̄_ℓ = 𝔠. So field isomorphisms ι : ℚ̄_ℓ ≅ ℂ exist, and every embedding into ℂ of a number field K ⊂ ℚ̄_ℓ extends to one. (iv) If α ∈ E is transcendental over ℚ, then for every transcendental z ∈ ℂ there is a field homomorphism ι : E → ℂ with ι(α) = z, which is an isomorphism in case (ii).

The extensions are not continuous for the ℓ-adic topology and are not canonical. Their existence uses transcendence bases, hence the axiom of choice. Deligne notes in Weil II (1.2.11) that for algebraicity statements the embeddings of the algebraic numbers suffice, and those need no choice.

Countability of k leaves room: ℂ has transcendence degree 𝔠 over σ(k), at least that of E over k.

(ii) needs #E = 𝔠, not only #E ≤ 𝔠: a countable algebraically closed field is not isomorphic to ℂ.

Proof or construction:

1. Transcendence degrees: for a countable subfield k, a transcendence basis of ℂ over σ(k) has cardinality 𝔠 (mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt with mathlib:Cardinal.mk_complex). A transcendence basis of E over k has cardinality at most #E ≤ 𝔠.
2. Choose a transcendence basis B of E over k and an injection of B into a transcendence basis of ℂ over σ(k). This gives k(B) → ℂ extending σ.
3. E is algebraic over k(B); extend to E → ℂ by mathlib:IsAlgClosed.lift.
4. For (ii), equip ℂ with its k-algebra structure through σ and match transcendence bases. The pinned classification returns a ring equivalence; prove separately that its construction restricts to σ by tracing the polynomial algebra equivalence and extending it as a base-compatible algebra-closure equivalence. This compatibility is not a theorem exposed by the cited ring-equivalence declaration and is recorded as a precise closure gap. The special k=ℚ isomorphism uses the existing characteristic-zero cardinal classification.
5. (iii): #ℤ_ℓ ≥ 𝔠, because (a_i) ↦ Σ a_i ℓ^i is injective on sequences in {0, 1}. #ℚ_ℓ ≤ 𝔠, because ℚ_ℓ is a quotient of a set of sequences of rationals. #ℚ̄_ℓ = #ℚ_ℓ by mathlib:Algebra.IsAlgebraic.cardinalMk_le_max.
6. (iv): apply (i) or (ii) to k = ℚ(α) with σ : ℚ(α) ≅ ℚ(z), α ↦ z.

Acceptance checks:

- Isomorphisms ℚ̄_5 ≅ ℂ exist, and a given embedding of ℚ(√−1) ⊂ ℚ̄_5 into ℂ extends to one.
- No such isomorphism is continuous: ℓ^n → 0 in ℚ̄_ℓ, while ι(ℓ^n) = ℓ^n → ∞ in ℂ.

Direct inputs: `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt`, `mathlib:Cardinal.mk_complex`, `mathlib:IsAlgClosed.lift`, `mathlib:IsAlgClosed.equivOfTranscendenceBasis`, `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero`, `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.11), p. 156; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Remarque (1.2.11), p. 156.

Declaration id: `DeligneWeightsAndPurity:DWP.0/embeddings-into-the-complex-numbers`.

<a id="dwp-0-weil-number-iff-iota-pure-for-every-iota"></a>

### Algebraicity and Weil purity from ι-purity at every ι

Let E be a field of characteristic 0 with #E ≤ 𝔠 (for instance a finite extension of ℚ_ℓ, or ℚ̄_ℓ), q > 1 and n ∈ ℤ. For α ∈ E the following are equivalent: (a) α is a Weil q-number of weight n; (b) |ι(α)| = q^{n/2} for every field homomorphism ι : E → ℂ. If E is algebraically closed with #E = 𝔠, (b) may be restricted to field isomorphisms ι : E ≅ ℂ. In particular, an endomorphism that is ι-pure of weight n for every ι is pure of weight n.

The cardinality bound is needed: a field of characteristic 0 of cardinality greater than 𝔠 has no homomorphism to ℂ, and (b) would be vacuous.

(b) for a single ι does not imply (a): see the tests of the node iota-weight.

Proof or construction:

1. (a) ⇒ (b): ι(α) is a complex root of the minimal polynomial of α (node weil-q-number).
2. (b) ⇒ α algebraic: if α were transcendental, part (iv) of the lemma embeddings-into-the-complex-numbers gives ι with ι(α) = z for any transcendental z; all but countably many complex numbers are transcendental, so z can be chosen with |z| ≠ q^{n/2}.
3. (b) ⇒ the conjugate condition: every σ : ℚ(α) → ℂ extends to E → ℂ, by part (i) of the lemma with k = ℚ(α), which is countable. So |σ(α)| = q^{n/2}.
4. Isomorphism variant: use part (ii) of the lemma in both steps.

Acceptance checks:

- A root α ∈ ℚ̄_5 of T² − T + 2 satisfies |ι(α)| = √2 for every ι : ℚ̄_5 ≅ ℂ.
- A transcendental t ∈ ℚ_5 (one exists, since #ℚ_5 = 𝔠) is ι-pure of weight 0 relative to 5 for an ι with ι(t) = e^{i}, and of weight 2 for an ι with ι(t) = 5e^{i}.

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/embeddings-into-the-complex-numbers](#dwp-0-embeddings-into-the-complex-numbers).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`.

<a id="dwp-0-endomorphism-weights"></a>

### Eigenvalues, Weil purity and ι-weights of an invertible endomorphism

Let E be a field of characteristic 0 with algebraic closure Ē, V a finite-dimensional E-vector space and F an invertible E-linear endomorphism of V. The eigenvalues of F are the roots of its characteristic polynomial det(T − F) in Ē, counted with multiplicity. The multiplicity of α equals the Ē-dimension of the maximal generalized eigenspace of F ⊗ Ē at α. (V, F) is pure of weight n relative to q if every eigenvalue is a Weil q-number of weight n. For a field homomorphism ι : Ē → ℂ, (V, F) is ι-pure of weight β ∈ ℝ if every eigenvalue has ι-weight β, and the ι-weights of (V, F) are the ι-weights of its eigenvalues, a finite subset of ℝ. The multiset of eigenvalues is stable under Aut(Ē/E), so none of these notions depends on the choice of Ē or of a splitting field inside Ē. V = 0 is pure of every weight and has no weights.

F must be invertible, since the eigenvalue 0 has no weight. Frobenius on ℓ-adic cohomology over a finite field is invertible; for a general endomorphism this is a hypothesis.

Weights are read off the characteristic polynomial through generalized eigenspaces. No eigenbasis and no semisimplicity is assumed, and a Jordan block can be pure.

In the applications E is ℚ_ℓ, a finite extension of it, or ℚ̄_ℓ; Weil II (1.2.4) applies the terminology to vector spaces with a Frobenius.

The ι-weights depend on ι only through the multiset {ι(α)}. That multiset does not change when the roots are taken in another splitting field inside Ē, because the roots form one Aut(Ē/E)-stable multiset.

Atlas landmark: **Weights of an endomorphism**.

The design is used in:

- DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions: stability under subobjects, quotients and extensions.
- DeligneWeightsAndPurity:DWP.0/weight-decomposition: decomposition of V by weight.
- DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues: weights on the two sides of a perfect pairing.
- DeligneWeightsAndPurity:DWP.2: the weight of a lisse sheaf on a curve through the Frobenius at each closed point (Weil I (3.1)).
- DeligneWeightsAndPurity:DWP.5: pointwise purity of Weil sheaves (Weil II (1.2.2), (1.2.6)).
- WeilConjectures:WC.3: degreewise purity of Frobenius on H^i.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.eigenvalues` | constructor | The characteristic-root multiset in an algebraic closure, of cardinality dim V. |
| `TauCeti.Weights.IsPure` | data | Every characteristic root is a Weil number of the specified integer weight. |
| `TauCeti.Weights.IsIotaPureEnd` | data | Every characteristic root has the specified real ι-weight. |
| `TauCeti.Weights.iotaWeights` | constructor | The finite set of real ι-weights of characteristic roots. |
| `TauCeti.Weights.count_eigenvalues` | characterisation | Root multiplicity is the dimension of its maximal generalized eigenspace after scalar extension. |
| `TauCeti.Weights.eigenvalues_map_aut` | compatibility | The characteristic-root multiset is invariant under every automorphism of the algebraic closure over the coefficient field. |
| `TauCeti.Weights.isPure_baseChange_iff` | compatibility | Purity is preserved and reflected under coefficient field extension; the ι-variant uses compatible closure embeddings. |
| `TauCeti.Weights.IsPure.isIotaPureEnd` | compatibility | Integer purity implies real ι-purity for every ι. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.isPure_jordanBlock` | value | F = [[q, 1], [0, q]] on E² is pure of weight 2 relative to q and is not semisimple: purity does not see Jordan blocks. |
| `TauCeti.Weights.eigenvalues_rotation` | value | F = [[0, −q], [1, 0]] on ℚ² has characteristic polynomial T² + q, no eigenvalue in ℚ, eigenvalues ±i√q in ℚ̄, and is pure of weight 1. |
| `TauCeti.Weights.not_isPure_diag` | non-example | F = diag(1, q) is not pure; its weights are {0, 2}. |
| `TauCeti.Weights.isPure_zero_space` | degenerate | On V = 0, F is pure of every weight and has no weights. |

Proof or construction:

1. Eigenvalues: the characteristic polynomial commutes with extension of scalars (mathlib:LinearMap.charpoly_baseChange), and over Ē its roots are the eigenvalues (mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly).
2. Multiplicity: mathlib:LinearMap.finrank_maxGenEigenspace_eq identifies the root multiplicity with the dimension of the maximal generalized eigenspace. These spaces span V ⊗ Ē (mathlib:Module.End.iSup_maxGenEigenspace_eq_top) and are independent (mathlib:Module.End.independent_maxGenEigenspace).
3. Galois stability: det(T − F) has coefficients in E, so every τ ∈ Aut(Ē/E) permutes its roots with multiplicities.
4. Independence of choices: Weil purity depends only on minimal polynomials over ℚ (node weil-q-number), and the multiset of ι-values is invariant by the previous step.

Acceptance checks:

- Jordan block [[q, 1], [0, q]]: pure of weight 2, with a generalized eigenspace of dimension 2 and an eigenspace of dimension 1.
- Frobenius on H¹ of an elliptic curve over 𝔽_q with trace a: characteristic polynomial T² − aT + q, pure of weight 1 because |a| ≤ 2√q (the compatibility case DWP.1 imports).

Direct inputs: [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.6), p. 282; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Variante (1.2.4), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`.

<a id="dwp-0-characteristic-polynomial-in-short-exact-sequences"></a>

### Multiplicativity of the characteristic polynomial along an invariant subspace

Let V be a finite-dimensional E-vector space, F ∈ End_E(V), and W ⊆ V an F-stable subspace, with induced endomorphisms F_W of W and F_{V/W} of V/W. Then det(T − F) = det(T − F_W)·det(T − F_{V/W}). Consequently det(1 − tF) = det(1 − tF_W)·det(1 − tF_{V/W}) and det F = det F_W · det F_{V/W}, and the eigenvalue multiset of F is the sum of those of F_W and F_{V/W}.

A vector-space complement of W, which need not be F-stable, gives a block upper-triangular matrix. The statement concerns characteristic polynomials only; the extension need not split F-equivariantly.

Proof or construction:

1. Extend a basis of W to a basis of V. The matrix of F is block upper triangular, with diagonal blocks the matrices of F_W and F_{V/W}.
2. mathlib:Matrix.charpoly_fromBlocks_zero₂₁ computes the characteristic polynomial of a block upper-triangular matrix as the product of those of the diagonal blocks. The split case is mathlib:LinearMap.charpoly_prodMap.
3. The roots of a product are the sum of the roots of the factors.

Acceptance checks:

- Jordan block [[q, 1], [0, q]] with W = E e₁: F_W = q, F_{V/W} = q, and (T − q)² = (T − q)(T − q).

Direct inputs: `mathlib:Matrix.charpoly_fromBlocks_zero₂₁`, `mathlib:LinearMap.charpoly_prodMap`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.3), p. 276.

Declaration id: `DeligneWeightsAndPurity:DWP.0/characteristic-polynomial-in-short-exact-sequences`.

<a id="dwp-0-purity-under-subquotients-and-extensions"></a>

### Purity and weights under subobjects, quotients, extensions and direct sums

Let F be an invertible endomorphism of V and W ⊆ V an F-stable subspace. (i) (V, F) is pure of weight n if and only if (W, F_W) and (V/W, F_{V/W}) are both pure of weight n; the same holds for ι-purity of weight β. (ii) The ι-weights of V are the union of those of W and of V/W, and likewise for a direct sum. (iii) So the pairs (V, F) that are pure of weight n form a class closed under subobjects, quotients and extensions.

F_W and F_{V/W} are invertible when F is: F_W is injective on a finite-dimensional space, and det F = det F_W · det F_{V/W}.

(i) does not say that an extension of pure objects of the same weight splits: the Jordan block is a non-split extension of (E, q) by (E, q).

Proof or construction:

1. The lemma characteristic-polynomial-in-short-exact-sequences gives the eigenvalue multiset of V as the sum of those of W and V/W.
2. Purity and ι-weights are conditions on each eigenvalue (node endomorphism-weights).

Acceptance checks:

- V = E², F = diag(1, q), W = E e₂: W has weight 2, V/W has weight 0, and V is not pure.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(i), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`.

<a id="dwp-0-characteristic-power-series-and-traces"></a>

### The characteristic power series det(1 − tF) and traces of powers

Let F be an endomorphism of a finite-dimensional vector space V over a field E. (i) det(1 − tF) ∈ E[t] is the reverse of det(T − F): det(1 − tF) = t^{dim V} det(t⁻¹ − F), and over Ē it is ∏(1 − αt) over the eigenvalues α. (ii) In E[[t]], t (d/dt) log det(1 − tF)⁻¹ = Σ_{n≥1} Tr(F^n) t^n. (iii) If E has characteristic 0, the traces Tr(F^n) for 1 ≤ n ≤ dim V determine det(1 − tF), hence the eigenvalue multiset.

(iii) needs characteristic 0 (characteristic greater than dim V suffices). On 𝔽_p^p, the identity and the zero map have equal traces of all powers.

The logarithm is taken of a power series with constant term 1.

Proof or construction:

1. (i): mathlib:Matrix.reverse_charpoly identifies the reverse of the characteristic polynomial with det(1 − tM). Over an algebraically closed field the characteristic polynomial is the product of the T − α.
2. (ii), as in Weil I: both sides are additive in V along a short exact sequence (lemma characteristic-polynomial-in-short-exact-sequences, and additivity of the trace). For dim V = 1 and F = α, the identity is t d/dt log(1 − αt)⁻¹ = Σ α^n t^n. Over Ē, V has a full F-stable flag, which reduces the general case to dimension 1.
3. (iii): Newton's identities. In characteristic 0 the power sums p_n = Tr(F^n) = Σ α_i^n for n ≤ d determine the elementary symmetric functions of the α_i, which are the coefficients of det(1 − tF) up to sign (mathlib:Matrix.trace_eq_sum_roots_charpoly gives p₁ = Σ α_i).

Acceptance checks:

- F = diag(1, q): det(1 − tF) = (1 − t)(1 − qt), and Σ (1 + q^n) t^n = t d/dt (−log(1 − t) − log(1 − qt)).
- Over 𝔽_p, id and 0 on 𝔽_p^p: Tr(F^n) = p = 0 for both, while det(1 − t·id) = (1 − t)^p ≠ 1.

Direct inputs: [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences), `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.trace_eq_sum_roots_charpoly`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.3), p. 275.

Declaration id: `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

<a id="dwp-0-spectra-of-polynomials-in-an-endomorphism"></a>

### Eigenvalues of P(F), F^r and F⁻¹, with multiplicities

Let F be an endomorphism of a finite-dimensional E-vector space V with eigenvalue multiset {α₁, …, α_d} ⊂ Ē, and let P ∈ E[T]. Then the eigenvalue multiset of P(F) is {P(α₁), …, P(α_d)}, with multiplicities. In particular F^r has eigenvalues α_i^r (r ≥ 1), and if F is invertible, F⁻¹ has eigenvalues α_i⁻¹. The maximal generalized eigenspace of F at α is contained in that of P(F) at P(α).

The statement is about multisets. Mathlib's spectral mapping theorem (spectrum.map_polynomial_aeval_of_nonempty) is an equality of sets, which loses multiplicities: for F = diag(1, −1) and P = T², the multiset is {1, 1}, while the set is {1}.

Proof or construction:

1. Extend scalars to Ē (mathlib:LinearMap.charpoly_baseChange). V_Ē is the direct sum of the maximal generalized eigenspaces V_α (mathlib:Module.End.iSup_maxGenEigenspace_eq_top, mathlib:Module.End.independent_maxGenEigenspace), and each is F-stable.
2. On V_α, F − α is nilpotent, and P(F) − P(α) = (F − α)Q(F) with Q ∈ Ē[T]. So P(F) − P(α) is nilpotent on V_α, and the characteristic polynomial of P(F) on V_α is (T − P(α))^{dim V_α}.
3. The characteristic polynomial is multiplicative on the direct sum (mathlib:LinearMap.charpoly_prodMap), and dim V_α is the multiplicity of α (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
4. F⁻¹: on V_α, F⁻¹ − α⁻¹ = −α⁻¹F⁻¹(F − α) is nilpotent. Alternatively, mathlib:Matrix.charpoly_inv gives the characteristic polynomial of the inverse matrix through the reversed polynomial.

Acceptance checks:

- F = diag(1, −1), P = T²: eigenvalues {1, 1}, and F² = id.
- The square of the Jordan block [[q, 1], [0, q]] is [[q², 2q], [0, q²]], with eigenvalue q² of multiplicity 2.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), `mathlib:LinearMap.charpoly_baseChange`, `mathlib:Module.End.iSup_maxGenEigenspace_eq_top`, `mathlib:Module.End.independent_maxGenEigenspace`, `mathlib:LinearMap.charpoly_prodMap`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`, `mathlib:Matrix.charpoly_inv`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.1), p. 275.

Declaration id: `DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism`.

<a id="dwp-0-finite-field-base-extension-of-weights"></a>

### Weights under a finite extension of the finite base field

Let F be an invertible endomorphism of V, q > 1 and r ≥ 1. (V, F) is pure of weight n relative to q if and only if (V, F^r) is pure of weight n relative to q^r. For every ι, the ι-weights of F relative to q equal the ι-weights of F^r relative to q^r, with multiplicities. In the finite-field situation, passing from k₀ = 𝔽_q to its extension of degree r replaces the geometric Frobenius F by F^r and q by q^r, so the weights do not change. At a closed point x, F_x = F^{deg x} acts with base q_x = q^{deg x}.

The equivalence concerns weights only: F^r can have a repeated eigenvalue where F has distinct ones (α and ζα with ζ^r = 1).

Proof or construction:

1. The theorem spectra-of-polynomials-in-an-endomorphism with P = T^r: the eigenvalues of F^r are the α_i^r.
2. The theorem weil-number-base-extension for Weil purity, and iotaWeight_pow_base (node iota-weight) for ι-weights.

Acceptance checks:

- F = [[0, −q], [1, 0]] has eigenvalues ±i√q, of weight 1 relative to q. F² = −q·id has eigenvalue −q twice, of weight 1 relative to q².

Direct inputs: [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1, (1.1.13), p. 152.

Declaration id: `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`.

<a id="dwp-0-spectra-of-tensor-products-and-duals"></a>

### Eigenvalues of tensor products, contragredients and Hom spaces

Let F and G be invertible endomorphisms of finite-dimensional E-spaces V and W, with eigenvalue multisets {α_i} and {β_j}. (i) F ⊗ G on V ⊗_E W has eigenvalue multiset {α_i β_j}. (ii) The transpose F^* on V^* has the eigenvalues of F. The contragredient F^∨ = (F⁻¹)^* has eigenvalues {α_i⁻¹}. (iii) On Hom_E(V, W), the endomorphism u ↦ G ∘ u ∘ F⁻¹ has eigenvalues {β_j α_i⁻¹}. (iv) F^{⊗k} on V^{⊗k} has as eigenvalues the products of k eigenvalues, and det F = ∏ α_i. Consequently, if V is pure of weight n and W of weight m, then V ⊗ W is pure of weight n + m, V^∨ of weight −n, Hom(V, W) of weight m − n, and V^{⊗k} of weight kn. The ι-weights behave in the same way.

Dual means the contragredient (F⁻¹)^*, as for representations and for the dual of a lisse sheaf in Weil II (1.2.5)(ii). The transpose F^* has the same eigenvalues as F, not their inverses.

No semisimplicity is used; multiplicities are dimensions of generalized eigenspaces.

Proof or construction:

1. Over Ē, V = ⊕ V_α and W = ⊕ W_β (maximal generalized eigenspaces), so V ⊗ W = ⊕ V_α ⊗ W_β.
2. On V_α ⊗ W_β, F ⊗ G − αβ = (F − α) ⊗ G + α(1 ⊗ (G − β)) is a sum of two commuting nilpotent endomorphisms, hence nilpotent. The dimensions multiply.
3. Transpose: in the dual basis the matrix of F^* is the transpose, which has the same characteristic polynomial (mathlib:LinearMap.det_dualMap for the determinant). The contragredient is the transpose of F⁻¹, whose eigenvalues are given by the theorem spectra-of-polynomials-in-an-endomorphism.
4. Hom(V, W) ≅ V^* ⊗ W, and u ↦ GuF⁻¹ corresponds to F^∨ ⊗ G.
5. Consistency checks: det(A ⊗ B) = det(A)^{dim W} det(B)^{dim V} (mathlib:Matrix.det_kronecker) and Tr(F ⊗ G) = Tr F · Tr G (mathlib:LinearMap.trace_tensorProduct').
6. Weights: products and inverses of Weil q-numbers (theorem weil-number-arithmetic), and additivity of ι-weights.

Acceptance checks:

- diag(1, q) ⊗ diag(1, q) = diag(1, q, q, q²), with weights 0, 2, 2, 4.
- The contragredient of ℚ_ℓ(1) is ℚ_ℓ(−1): the eigenvalue q⁻¹ becomes q, and the weight −2 becomes 2.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), `mathlib:Matrix.det_kronecker`, `mathlib:LinearMap.trace_tensorProduct'`, `mathlib:LinearMap.det_dualMap`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`.

<a id="dwp-0-twisting-by-rank-one-characters"></a>

### Twists V^{(b)} and Tate twists V(r)

For b ∈ E^× and an E-space V with invertible F, the twist is V^{(b)} = (V, bF) = V ⊗ E^{(b)}, where E^{(b)} is the rank-one space on which F acts by b (Weil II (1.2.7)). Its eigenvalues are the bα_i, and its ι-weights are those of V shifted by w_{ι,q}(b). With the geometric Frobenius convention, ℚ_ℓ(1) = E^{(q⁻¹)}, and the Tate twist V(r) = V ⊗ ℚ_ℓ(1)^{⊗r} = V^{(q^{−r})} (r ∈ ℤ) shifts weights by −2r. When E contains a square root q^{1/2}, the half twist V^{(q^{−1/2})} shifts weights by −1. It depends on the choice of q^{1/2}: the two choices differ by the twist by −1, of weight 0. Twisting is functorial and exact, satisfies V^{(b)} ⊗ W^{(c)} = (V ⊗ W)^{(bc)}, and dualizes as (V^{(b)})^∨ = (V^∨)^{(b⁻¹)}.

Geometric Frobenius: ℚ_ℓ(1) has eigenvalue q⁻¹ and weight −2 (Weil II (1.2.5)(iv)); with arithmetic Frobenius the signs reverse. The comparison with the Galois action on roots of unity is EtaleDualityAndPerverseSheaves EDC.0's.

b need not be an ℓ-adic unit. For b not a unit, E^{(b)} is a Weil sheaf on Spec 𝔽_q and not an étale sheaf (Weil II (1.1.14), (1.2.7)).

For b of non-integral ι-weight the twist shifts ι-weights by a real number. These are DWP.5's rank-one real-weight twists, which are distinct from Tate twists.

The design is used in:

- GlobalShtukasAndFunctionFieldLanglands:GS.1/modified-commutativity-and-tate-twist: the half Tate twist and the correction factor q^{−d/2}.
- DeligneWeightsAndPurity:DWP.5: rank-one real-weight twists.
- WeilConjectures:WC.2: the Tate twist in the Poincaré pairing H^i × H^{2d−i} → ℚ_ℓ(−d).
- DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues: a pairing into E^{(c)}.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.twist` | constructor | Multiply the invertible Frobenius endomorphism by a nonzero scalar b. |
| `TauCeti.Weights.tateTwist` | constructor | The integer twist multiplies geometric Frobenius by q^(−r). |
| `TauCeti.Weights.eigenvalues_twist` | characterisation | Multiplication by b multiplies every characteristic root by b. |
| `TauCeti.Weights.iotaWeights_twist` | characterisation | A scalar twist translates the weight set by the scalar’s ι-weight. |
| `TauCeti.Weights.IsPure.tateTwist` | compatibility | For a positive integral q, an integer Tate twist shifts a pure weight n to n−2r. |
| `TauCeti.Weights.twist_tensor` | compatibility | Scalar twists of tensor factors multiply their scalars. |
| `TauCeti.Weights.twist_twist` | simp | Two successive scalar twists equal the twist by the product. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.tateTwist_weight` | value | ℚ_ℓ(1) = E^{(q⁻¹)} is pure of weight −2, and ℚ_ℓ(r) of weight −2r. |
| `TauCeti.Weights.twist_one` | degenerate | twist 1 F = F, and V(0) = V. |
| `TauCeti.Weights.halfTwist_depends_on_sqrt` | non-example | The half twist depends on the square root: for V = E and F = 1, the choices q^{1/2} and −q^{1/2} give eigenvalues q^{−1/2} and −q^{−1/2}, non-isomorphic Frobenius modules, both of weight −1. |
| `TauCeti.Weights.twist_nonintegral_weight` | non-example | For b with w_{ι,q}(b) = 1/2, for instance b transcendental with \|ι(b)\| = q^{1/4}, E^{(b)} is ι-pure of the non-integral weight 1/2 and is not pure in the sense of Weil numbers. |

Proof or construction:

1. Eigenvalues: det(T − bF) = b^d det(T/b − F), or the theorem spectra-of-tensor-products-and-duals with the rank-one factor E^{(b)}.
2. Weights: w_ι(bα) = w_ι(b) + w_ι(α) (node iota-weight). For Weil numbers, q^{−r}α has weight n − 2r (theorem weil-number-arithmetic).
3. Functoriality, exactness and the tensor and dual formulas hold on underlying spaces, where the twist is the identity.

Acceptance checks:

- H²(ℙ¹) = ℚ_ℓ(−1) has F = q and weight 2; its twist H²(ℙ¹)(1) is ℚ_ℓ with F = 1 and weight 0.

Direct inputs: [DWP.0/iota-weight](#dwp-0-iota-weight), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `EtaleDualityAndPerverseSheaves:EDC.0`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.7), p. 154; [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(iv), p. 154.

Declaration id: `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`.

<a id="dwp-0-reciprocal-pairing-of-eigenvalues"></a>

### Eigenvalues under a Frobenius-equivariant perfect pairing

Let V and V′ be E-spaces of finite dimension d with invertible endomorphisms F and F′, and ⟨ , ⟩ : V × V′ → E a perfect bilinear pairing with ⟨Fx, F′y⟩ = c⟨x, y⟩ for some c ∈ E^×. Then: (i) under the isomorphism V′ ≅ V^* given by the pairing, F′ corresponds to c·(F⁻¹)^*; (ii) the eigenvalue multiset of F′ is {c/α_i}, and det(T − F′) = (−T)^d det(c/T − F) / det F; (iii) over Ē, the maximal generalized eigenspaces satisfy ⟨V_α, V′_β⟩ = 0 unless αβ = c, and the pairing restricts to a perfect pairing V_α × V′_{c/α} → Ē; (iv) if V is pure of weight n and c is a Weil q-number of weight w, then V′ is pure of weight w − n, and likewise for ι-weights. For V′ = V, the eigenvalue multiset of F is stable under α ↦ c/α.

Perfectness is needed: for the zero pairing the equivariance holds for every F′.

c is the eigenvalue of Frobenius on the target line. For Poincaré duality H^i × H^{2m−i} → H^{2m} ≅ ℚ_ℓ(−m), c = q^m (Weil I (2.4)–(2.5)). The geometric inputs, that cup product commutes with F and that F acts by q^m on H^{2m}, belong to EDC and WC.2.

No semisimplicity is assumed: (iii) is a statement about generalized eigenspaces.

The parity of the multiplicity of ±√c for a symmetric or alternating self-pairing, and the sign of the functional equation, are WeilConjectures WC.2's.

Atlas landmark: **Reciprocal pairing**.

Proof or construction:

1. (i): ⟨x, F′y⟩ = c⟨F⁻¹x, y⟩, so the adjoint of F′ with respect to the pairing is cF⁻¹.
2. (ii): the transpose has the same characteristic polynomial. mathlib:Matrix.charpoly_inv expresses the characteristic polynomial of an inverse through the reversed polynomial, and scaling by c gives the formula. The eigenvalues are the c/α_i by the theorem spectra-of-polynomials-in-an-endomorphism applied to F⁻¹.
3. (iii): ⟨Fx, y⟩ = c⟨x, F′⁻¹y⟩, so ⟨(F − α)^N x, y⟩ = ⟨x, (cF′⁻¹ − α)^N y⟩. For x ∈ V_α take N with (F − α)^N x = 0. On V′_β, cF′⁻¹ − α is c/β − α plus a nilpotent, hence invertible unless αβ = c. So ⟨x, y⟩ = 0 unless αβ = c, and perfectness on the direct sums forces each V_α × V′_{c/α} to be perfect.
4. (iv): c/α is a Weil q-number of weight w − n (theorem weil-number-arithmetic), and w_ι(c/α) = w_ι(c) − w_ι(α).

Acceptance checks:

- A curve of genus g: H⁰ × H² with c = q gives eigenvalue 1 on H⁰ and q on H². H¹ × H¹ is alternating with c = q, so the eigenvalues on H¹ are stable under α ↦ q/α.
- The Jordan block F = [[q, 1], [0, q]] paired with V′ = E² for c = q²: F′ = q²(F⁻¹)^* has eigenvalue q with multiplicity 2 and is again a Jordan block.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/weil-number-arithmetic](#dwp-0-weil-number-arithmetic), `mathlib:Matrix.charpoly_inv`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.5), p. 281; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, (2.5), p. 281; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`.

<a id="dwp-0-disjoint-spectra-no-intertwiner"></a>

### Disjoint spectra: no nonzero Frobenius-equivariant maps between different weights

Let F and G be endomorphisms of finite-dimensional E-spaces V and W whose characteristic polynomials have no common root in Ē, equivalently are coprime in E[T]. Then every E-linear u : V → W with u ∘ F = G ∘ u is zero. In particular: (i) if V is pure of weight n and W pure of weight m ≠ n, relative to q > 1, or ι-pure of weights β ≠ γ, then there is no nonzero equivariant map V → W; (ii) if W ⊆ V is F-stable, with W pure of weight n and V/W pure of weight m ≠ n, then W has a unique F-stable complement.

q > 1 is needed for the weights to separate eigenvalues (node weil-q-number).

Equal weights allow non-split extensions (the Jordan block) and nonzero maps.

Atlas landmark: **Weight separation**.

Proof or construction:

1. Coprimality: two polynomials with no common root in Ē are coprime (mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed). Write aP_F + bP_G = 1.
2. Cayley–Hamilton: P_F(F) = 0 (mathlib:LinearMap.aeval_self_charpoly). From uF = Gu we get 0 = uP_F(F) = P_F(G)u. Since a(G)P_F(G) = 1 − b(G)P_G(G) = 1, P_F(G) is invertible, and u = 0. No extension of scalars is needed.
3. Different weights give disjoint eigenvalue sets, by uniqueness of the weight (node weil-q-number, q > 1) or of the ι-weight.
4. (ii): with P_n and P_m the characteristic polynomials of W and V/W, V = ker P_n(F) ⊕ ker P_m(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime and Cayley–Hamilton). ker P_n(F) contains W and has the same dimension, so ker P_m(F) is an F-stable complement. It is unique, because an F-stable complement is isomorphic to V/W, hence annihilated by P_m(F).

Acceptance checks:

- V = (E, 1) and W = (E, q): every equivariant map V → W is zero.
- Jordan block: W = E e₁ and V/W both have weight 2, and there is no F-stable complement.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight), `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277.

Declaration id: `DeligneWeightsAndPurity:DWP.0/disjoint-spectra-no-intertwiner`.

<a id="dwp-0-weight-decomposition"></a>

### Decomposition of a Frobenius module by weights

Let F be an invertible endomorphism of a finite-dimensional E-space V, and q > 1. (i) If every eigenvalue of F is a Weil q-number, then V = ⊕_n V_n, a finite sum over n ∈ ℤ. Here V_n = ker P_n(F), and P_n ∈ E[T] is the monic polynomial whose roots are the eigenvalues of weight n, with their multiplicities. Each V_n is F-stable and pure of weight n, and det(T − F) = ∏ P_n. (ii) For ι : Ē → ℂ the same holds over Ē with real weights: V ⊗ Ē = ⊕_β (V ⊗ Ē)_β. (iii) The decompositions are functorial: an equivariant map V → W maps V_n into W_n.

(i) holds over E itself. P_n has coefficients in E because Aut(Ē/E) permutes the eigenvalues, preserving multiplicities and Weil weights, and E is perfect.

(ii) does not descend to E in general, because the ι-weight is not Galois-invariant. Take E = ℚ and F with characteristic polynomial T² − 2T − 1 (eigenvalues 1 ± √2). For every ι it has the two distinct ι-weights ±2 log₂(1 + √2) relative to 2, but no F-stable line over ℚ.

Each V_n need not be semisimple.

Separating the factors of a zeta function, with their integrality and ℓ-independence, is WeilConjectures WC.3's. This node decomposes one Frobenius module.

Atlas landmark: **Weight decomposition**.

Proof or construction:

1. Group the eigenvalues by weight, which is unique for q > 1, and set P_n = ∏_{w(α) = n} (T − α)^{m_α}.
2. P_n ∈ E[T]: it is invariant under Aut(Ē/E) (node endomorphism-weights), and in characteristic 0 the fixed field of Aut(Ē/E) is E.
3. The P_n are pairwise coprime (theorem disjoint-spectra-no-intertwiner, first step), so V = ⊕ ker P_n(F) (mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime with Cayley–Hamilton, mathlib:LinearMap.aeval_self_charpoly).
4. The characteristic polynomial of F on V_n is P_n: V_n ⊗ Ē is the sum of the generalized eigenspaces at the roots of P_n, whose dimensions are the multiplicities (mathlib:LinearMap.finrank_maxGenEigenspace_eq).
5. Functoriality: the theorem disjoint-spectra-no-intertwiner applied to the components V_n → W_m with n ≠ m.

Acceptance checks:

- F = diag(1, q) ⊕ [[q, 1], [0, q]] on E⁴: V₀ = E e₁, and V₂ has dimension 3.
- Descent fails for ι-weights: T² − 2T − 1 over ℚ, as in the hypotheses.

Direct inputs: [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner), [DWP.0/weil-q-number](#dwp-0-weil-q-number), `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:LinearMap.finrank_maxGenEigenspace_eq`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, preuve de (1.7) ⇒ (1.6), p. 277.

Declaration id: `DeligneWeightsAndPurity:DWP.0/weight-decomposition`.

## DWP.1 — Curves and abelian varieties: the initial Weil estimate

<a id="dwp-1-frobenius-endomorphism-over-a-finite-field"></a>

### The q-Frobenius endomorphism of a variety over 𝔽_q

Import scheme Frobenius from SF.0 and instantiate its q-power iterate over 𝔽_q. Let V be a variety (a separated scheme of finite type) over 𝔽_q. The q-Frobenius π_V : V → V is the identity on the underlying space and f ↦ f^q on the structure sheaf. It is an 𝔽_q-morphism. It commutes with every 𝔽_q-morphism φ : W → V, that is φ ∘ π_W = π_V ∘ φ, and on V(𝔽̄_q) it acts by raising coordinates to the q-th power, so V(𝔽_{q^m}) is the fixed-point set of π_V^m. Its differential is 0. For an abelian variety A over 𝔽_q, π_A fixes 0 and is an endomorphism of A, of degree q^g. After extending scalars to 𝔽_{q^m}, the Frobenius is π_A^m.

π_V is the relative (q-power) Frobenius over 𝔽_q, not the absolute p-Frobenius when q = p^a with a > 1.

On 𝔽̄_q-points π_V agrees with the arithmetic Frobenius acting on coordinates. The geometric Frobenius on étale cohomology is (π_V)^* (Weil I (1.15)); the conventions are those of DWP.0.

The design is used in:

- DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism: π†π = q.
- DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties: #A(𝔽_{q^m}) = deg(1 − π^m).
- WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology: π_A against the arithmetic and geometric Frobenius.
- WeilConjectures:WC.5: point counts as fixed points of the Frobenius.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.frobeniusEndo` | constructor | The supplied scheme q-Frobenius, viewed as an endomorphism over 𝔽_q. |
| `TauCeti.Weights.frobeniusEndo_comp` | compatibility | The q-Frobenius commutes with every morphism over 𝔽_q. |
| `TauCeti.Weights.fixedPoints_frobeniusEndo_pow` | characterisation | The fixed points of the mth Frobenius power on geometric points are the points over 𝔽_(q^m), for m≥1. |
| `TauCeti.Weights.frobeniusEndo_baseChange` | compatibility | Relative Frobenius after degree-m constant extension is the scalar extension of the mth original power. |
| `TauCeti.Weights.AbelianVariety.frobenius` | constructor | The group endomorphism on an abelian variety induced by its supplied scheme Frobenius. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.frobeniusEndo_projectiveLine_fixed` | value | The fixed points of π on ℙ¹(𝔽̄_q) are the q + 1 points of ℙ¹(𝔽_q). |
| `TauCeti.Weights.frobeniusEndo_spec_field` | degenerate | On Spec 𝔽_q, π is the identity. |
| `TauCeti.Weights.frobeniusEndo_not_absolute` | non-example | For q = p², π_V is the square of the absolute Frobenius, not the absolute Frobenius itself; its fixed points on 𝔸¹(𝔽̄_q) are 𝔽_{p²}, not 𝔽_p. |
| `TauCeti.Weights.deg_frobenius_elliptic` | value | For an elliptic curve over 𝔽_q, deg π_E = q. |

Proof or construction:

1. Locally V = Spec R with R an 𝔽_q-algebra, and π_V corresponds to r ↦ r^q, an 𝔽_q-algebra endomorphism since a^q = a for a ∈ 𝔽_q. These glue, since x ↦ x^q commutes with localization.
2. Naturality: an 𝔽_q-algebra map commutes with x ↦ x^q.
3. Points: for x ∈ V(𝔽̄_q) with coordinates (x_i), π_V(x) = (x_i^q). The fixed points of π_V^m are the points with coordinates in 𝔽_{q^m}.
4. d(x^q) = qx^{q−1}dx = 0 in characteristic p.
5. For A an abelian variety, 0 ∈ A(𝔽_q) is fixed, so π_A is a homomorphism (rigidity, AbelianSchemesAndArithmeticModuli A1). deg π_A = q^g, as P_{π}(0) in the node point-counts-of-abelian-varieties shows.

Acceptance checks:

- On ℙ¹ over 𝔽_q, π is [x : y] ↦ [x^q : y^q], and its fixed points are the q + 1 points of ℙ¹(𝔽_q).
- For an elliptic curve E over 𝔽_q, π_E is the q-power Frobenius endomorphism, and 1 − π_E is separable.

Direct inputs: [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `SchemeAndStackFoundations:SF.0`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, p. 75.

Declaration id: `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`.

<a id="dwp-1-rosati-of-the-frobenius-endomorphism"></a>

### Milne II.1.2: π†π = q

Let A be an abelian variety over 𝔽_q, λ a polarization of A defined over 𝔽_q, and † the Rosati involution of λ. Then π_A^† ∘ π_A = q in End⁰(A), that is π_A^∨ ∘ λ ∘ π_A = q·λ.

λ must be defined over 𝔽_q, so that it commutes with the Frobenius. A polarization over 𝔽_q exists, since A is projective over 𝔽_q (requested from AbelianSchemesAndArithmeticModuli A2).

This is where the Frobenius–Verschiebung relation enters, as RS-17 keeps it: π^∨ corresponds to the Verschiebung through λ.

Proof or construction:

1. With λ = φ_D for an ample divisor D (over 𝔽̄_q): λ(a) = [t_a^*D − D].
2. For any divisor D′ over 𝔽_q, π^*D′ = qD′: locally D′ = div f and f ∘ π = f^q.
3. For a ∈ A(𝔽̄_q): (π^∨λπ)(a) = [π^*t_{π(a)}^*D − π^*D] = [t_a^*π^*D − π^*D] = [t_a^*(qD) − qD] = qλ(a), using π ∘ t_a = t_{π(a)} ∘ π.

Acceptance checks:

- An elliptic curve with λ the principal polarization: π† = π̂, and π̂π = [q] = deg π.

Direct inputs: [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A2`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.2, p. 76.

Declaration id: `DeligneWeightsAndPurity:DWP.1/rosati-of-the-frobenius-endomorphism`.

<a id="dwp-1-absolute-values-from-the-rosati-involution"></a>

### Milne II.1.3: α†α = r forces |a|² = r for the roots of P_α

Let A be an abelian variety over a field k with a polarization and Rosati involution †, and α ∈ End⁰(A) with α†α = r ∈ ℤ_{>0}. Then ℚ[α] is a product of fields, stable under †, and † acts on each real factor of ℚ[α] ⊗ ℝ as the identity and on each complex factor as complex conjugation. Every root a of P_α in ℂ satisfies |a|² = r.

The positivity of the Rosati involution (AbelianSchemesAndArithmeticModuli A6/rosati-positivity) is the key input. No Tate isogeny theorem and no cohomological purity is used, as RS-17 requires.

ℚ[α] is commutative. A factor of ℚ[α] ⊗ ℝ with † trivial is ℝ, and † is conjugation on each factor ℂ.

Proof or construction:

1. ℚ[α] has no nonzero nilpotents. For a ≠ 0 put b = a†a; then Tr(b) > 0 (Rosati positivity), b† = b and Tr(b²) = Tr(b†b) > 0, so b² ≠ 0, b⁴ ≠ 0, and so on. Hence ℚ[α] is a product of fields K_i.
2. † is an automorphism of ℚ[α] (α† = rα⁻¹ ∈ ℚ[α]). It permutes the factors, and positivity forces it to preserve each one: otherwise Tr(aa†) would vanish on a single factor.
3. On ℚ[α] ⊗ ℝ = ∏ ℝ × ∏ ℂ, † is a positive involution of each factor: the identity on ℝ, and complex conjugation on ℂ (the identity of ℂ is not positive: Tr(i·i) < 0).
4. For every σ : ℚ[α] → ℂ, σ(α†) = conj(σ(α)), so r = σ(α†α) = |σ(α)|². So the roots of the minimal polynomial of α have |·|² = r, and by AbelianSchemesAndArithmeticModuli A6/trace-and-degree-on-a-subfield (10.24) the roots of P_α are among them.

Acceptance checks:

- α = [n] on any A: [n]†[n] = n², and P_{[n]} = (X − n)^{2g} has roots of absolute value n.

Direct inputs: `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.3, p. 77; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Lemma 1.3, p. 77.

Declaration id: `DeligneWeightsAndPurity:DWP.1/absolute-values-from-the-rosati-involution`.

<a id="dwp-1-weil-estimate-for-abelian-varieties"></a>

### The Weil estimate for abelian varieties over 𝔽_q

Let A be an abelian variety of dimension g over 𝔽_q. Every root of the characteristic polynomial P_{π_A} ∈ ℤ[X] is a Weil q-number of weight 1: all its complex conjugates have absolute value q^{1/2}. Equivalently, for every ℓ ∤ q, the geometric Frobenius on H¹(A_{𝔽̄_q}, ℚ_ℓ) is pure of weight 1, and the geometric Frobenius on V_ℓA is pure of weight −1. The same holds for π_A^m relative to q^m.

This is the independent abelian-variety proof that RS-17 keeps for DWP.1. It uses the polarization, Rosati positivity and π†π = q. It depends on no Tate isogeny theorem and nothing from DWP.4.

The statement on H¹ and V_ℓA uses the comparison of the Frobenius conventions: π_A acts on V_ℓA as the arithmetic Frobenius, and on H¹ = (V_ℓA)^∨ the geometric Frobenius has characteristic polynomial P_{π_A} (ArithmeticGaloisRepresentations R01.6; AbelianSchemesAndArithmeticModuli A4).

Atlas landmark: **Weil estimate for abelian varieties**.

Proof or construction:

1. π†π = q (theorem rosati-of-the-frobenius-endomorphism).
2. Theorem absolute-values-from-the-rosati-involution with α = π and r = q: every complex root of P_π has absolute value q^{1/2}. P_π ∈ ℤ[X], so the roots are algebraic and every conjugate is again a root, so they are Weil q-numbers of weight 1 (DWP.0/weil-q-number).
3. On V_ℓA the characteristic polynomial of π is P_π (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module). The geometric Frobenius acts by π⁻¹ on V_ℓA, of weight −1, and by the transpose of π on H¹, of weight 1.
4. Base extension: π_{A ⊗ 𝔽_{q^m}} = π^m, with roots a_i^m (DWP.0/weil-number-base-extension).

Acceptance checks:

- E: y² = x³ − x over 𝔽_3: P_π = X² + 3, with roots ±i√3 of absolute value √3.
- A supersingular elliptic curve over 𝔽_p with a = 0: roots ±i√p.

Direct inputs: [DWP.1/rosati-of-the-frobenius-endomorphism](#dwp-1-rosati-of-the-frobenius-endomorphism), [DWP.1/absolute-values-from-the-rosati-involution](#dwp-1-absolute-values-from-the-rosati-involution), `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension), `ArithmeticGaloisRepresentations:R01.6`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Theorem 1.1(b), p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Remark 1.4, p. 78.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`.

<a id="dwp-1-point-counts-of-abelian-varieties"></a>

### Point counts of abelian varieties over 𝔽_{q^m}, and their bounds

Let A be an abelian variety of dimension g over 𝔽_q with P_{π_A}(X) = ∏_{i=1}^{2g}(X − a_i). Then for all m ≥ 1, N_m = #A(𝔽_{q^m}) = deg(1 − π^m) = P_{π^m}(1) = ∏_i(1 − a_i^m), and |N_m − q^{mg}| ≤ 2g·q^{m(g−1/2)} + (2^{2g} − 2g − 1)·q^{m(g−1)}. The zeta function is Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}}, where P_r(t) = ∏(1 − a_{i_1}⋯a_{i_r}t) over 1 ≤ i_1 < … < i_r ≤ 2g, the characteristic polynomial of π on ∧^r T_ℓA.

1 − π^m is separable (its differential is −1) and étale, so its degree is the number of geometric points in its kernel, which is A(𝔽_{q^m}).

The bound uses the Weil estimate. The leading term ∏ a_i = deg π = q^g is exact.

Proof or construction:

1. d(π − 1) = dπ − 1 = −1 at the origin, so π − 1 is étale, and ker(π − 1) = A(𝔽_q) with every point of multiplicity one. Hence #A(𝔽_q) = deg(π − 1) = P_π(1) (AbelianSchemesAndArithmeticModuli A6/degree-of-an-endomorphism, A6/characteristic-polynomial-of-an-endomorphism). Replace π by π^m.
2. The eigenvalues of π^m are the a_i^m (DWP.0/spectra-of-polynomials-in-an-endomorphism), so P_{π^m}(1) = ∏(1 − a_i^m).
3. Expand ∏(1 − a_i^m): the term ∏a_i^m = q^{mg}; the 2g terms that are products of 2g − 1 roots have absolute value q^{m(g−1/2)}; the remaining 2^{2g} − 2g − 1 terms have absolute value at most q^{m(g−1)} (Weil estimate).
4. Zeta function: log Z = Σ N_m t^m/m with N_m = Σ_r (−1)^r Tr(π^m | ∧^r), and the eigenvalues of π on ∧^r T_ℓA are the r-fold products (DWP.0/spectra-of-tensor-products-and-duals).

Acceptance checks:

- E: y² = x³ − x over 𝔽_3: N_1 = P_π(1) = 1 + 3 = 4, and |4 − 3| = 1 ≤ 2√3.
- g = 1: the bound reads |N_m − q^m| ≤ 2q^{m/2} + 1, that is Hasse's |N_m − q^m − 1| ≤ 2q^{m/2}, loosened by the constant term.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, [DWP.0/spectra-of-polynomials-in-an-endomorphism](#dwp-0-spectra-of-polynomials-in-an-endomorphism), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, Theorem 1.1(a), p. 75; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76.

Declaration id: `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`.

<a id="dwp-1-weil-estimate-for-curves"></a>

### The Weil estimate for curves, through the Jacobian

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, J its Jacobian, and P_{π_J}(X) = ∏(X − a_i). Then #C(𝔽_{q^m}) = 1 − Σ_i a_i^m + q^m for all m ≥ 1, the a_i are Weil q-numbers of weight 1, |#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}, and Z(C, t) = P_{π_J}^{rev}(t)/((1 − t)(1 − qt)) with P^{rev}(t) = ∏(1 − a_i t).

Geometric connectedness is needed. If C has components defined only over 𝔽_{q^d}, permuted by the Frobenius, the counts change: two conjugate copies of ℙ¹ over 𝔽_{q²} give #C(𝔽_{q^m}) = 0 for m odd and 2(q^m + 1) for m even. RS-17 keeps these component permutations.

The fixed-point formula (Γ_α · Δ) = 1 − Tr(α′) + deg α is imported (RS-17: the curve and Jacobian trace comparison of TraceFormula Layer 8, requested from SchemeAndStackFoundations SF.2). The source's own proof of it has a step that the author marks "Needs fixing" (recorded in sourceIssues).

Atlas landmark: **Weil estimate for curves**.

Proof or construction:

1. Import the Abel–Jacobi morphism after choosing a geometric base point P, and its étale H¹ comparison. Frobenius need not fix P: f_P∘π_C and π_J∘f_P differ by a translation, whose action on H¹ is trivial. Thus the comparison on H¹ and on the Jacobian Tate module is Frobenius-equivariant. A rational base point is obtained after finite extension wherever the upstream pointed construction requires it; the base-point-free Jacobian descent is an explicit Part II contract.
2. Fixed points: #C(𝔽_q) = (Γ_{π_C} · Δ) = 1 − Tr(π_J) + deg π_C = 1 − Σ a_i + q (Milne III.11.2, imported).
3. Replace q by q^m: the Frobenius of C ⊗ 𝔽_{q^m} is π_C^m, and π_J^m has eigenvalues a_i^m.
4. The a_i are Weil q-numbers of weight 1 (theorem weil-estimate-for-abelian-varieties applied to J), which gives the bound.
5. Z(C, t) = exp(Σ N_m t^m/m) = ∏(1 − a_i t)/((1 − t)(1 − qt)).

Acceptance checks:

- ℙ¹ (g = 0): #ℙ¹(𝔽_{q^m}) = q^m + 1 and Z = 1/((1 − t)(1 − qt)).
- E: y² = x³ − x over 𝔽_3: 1 − (i√3 + (−i√3)) + 3 = 4 = #E(𝔽_3).

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Theorem 11.1, p. 118; [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Corollary 11.4, p. 119.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`.

<a id="dwp-1-weights-of-the-cohomology-of-curves"></a>

### The weights of H⁰, H¹ and H² of a curve over 𝔽_q

Let C be a smooth projective geometrically connected curve of genus g over 𝔽_q, and ℓ ∤ q. Then H⁰(C_{𝔽̄_q}, ℚ_ℓ) = ℚ_ℓ is pure of weight 0, H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1) is pure of weight 2, and H¹(C_{𝔽̄_q}, ℚ_ℓ) ≅ H¹(J_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓJ)^∨ is pure of weight 1, with the geometric Frobenius having characteristic polynomial P_{π_J}. The same holds after any finite extension of 𝔽_q.

Geometric connectedness makes H⁰ one-dimensional. For a curve whose components are permuted by the Frobenius, H⁰ is a permutation representation, of weight 0 but not trivial.

H¹(C) ≅ H¹(J) through the Abel–Jacobi map (Milne III.9.6), and H¹(J) ≅ (T_ℓJ)^∨ (AbelianSchemesAndArithmeticModuli A4). These are imported.

Proof or construction:

1. H⁰: C_{𝔽̄_q} is connected, so H⁰ = ℚ_ℓ with trivial Frobenius action, of weight 0.
2. H²: the trace map H²(C_{𝔽̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−1), on which the geometric Frobenius acts by q, of weight 2 (DWP.0/twisting-by-rank-one-characters).
3. The étale Abel–Jacobi comparison H¹(J)≅H¹(C) is independent of the geometric base point, since translation acts trivially on H¹. Use the requested base-point-free descent or a finite extension and descent to obtain Frobenius equivariance. H¹(J)=(V_ℓJ)∨, and geometric Frobenius has characteristic polynomial P_{π_J}; its roots have weight 1 by the abelian-variety theorem.

Acceptance checks:

- ℙ¹: H⁰ = ℚ_ℓ (weight 0), H¹ = 0, H² = ℚ_ℓ(−1) (weight 2), and #ℙ¹(𝔽_q) = 1 + q.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `ArithmeticGaloisRepresentations:R01.6`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Remark 11.5, p. 119; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §1 pp. 2–3; §7.1 p. 64.

Declaration id: `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`.

<a id="dwp-1-compatibility-with-the-hasse-bound"></a>

### Compatibility with the Hasse bound for elliptic curves

For an elliptic curve E over 𝔽_q with a = q + 1 − #E(𝔽_q) (the trace of Frobenius of Tau Ceti EllipticCurves Layer 3), P_{π_E}(X) = X² − aX + q, and the Weil estimate for abelian varieties (g = 1) gives |a| ≤ 2√q. This is the Hasse bound that Tau Ceti EllipticCurves Layer 3 proves independently. The two agree, and this node proves only the identification of the characteristic polynomials.

RS-17: a compatibility proof, not a second proof of Hasse. The Hasse theorem is imported from Tau Ceti EllipticCurves Layer 3.

Proof or construction:

1. P_π(1) = #E(𝔽_q) (theorem point-counts-of-abelian-varieties) and P_π(0) = deg π = q, so P_π = X² − aX + q with a = q + 1 − #E(𝔽_q).
2. The roots α, ᾱ have |α| = √q (Weil estimate), so |a| = |α + ᾱ| ≤ 2√q.
3. Tau Ceti EllipticCurves Layer 3 defines the trace of Frobenius through the same point count, so the two statements concern the same integer.

Acceptance checks:

- y² = x³ − x over 𝔽_3: a = 0. y² + y = x³ over 𝔽_2: #E(𝔽_2) = 3, a = 0, and P = X² + 2.

Direct inputs: [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.1/point-counts-of-abelian-varieties](#dwp-1-point-counts-of-abelian-varieties), `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter III, Theorem 11.1, p. 118.

Declaration id: `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

<a id="dwp-1-the-frobenius-and-points-over-extensions"></a>

### Compatibility of the Weil estimate with finite base extension

For A (resp. C) over 𝔽_q and m ≥ 1, the Frobenius of A ⊗ 𝔽_{q^m} over 𝔽_{q^m} is π_A^m, P_{π^m}(X) = ∏(X − a_i^m), and the Weil estimate over 𝔽_{q^m} (weight 1 relative to q^m) is equivalent to that over 𝔽_q (weight 1 relative to q). The same holds for the weights of H⁰, H¹ and H² of curves.

RS-17 keeps compatibility under finite base extension as a review correction. The base-change isomorphism of étale cohomology is imported.

Proof or construction:

1. The Frobenius of V ⊗ 𝔽_{q^m} is π_V^m (node frobenius-endomorphism-over-a-finite-field).
2. The eigenvalues of π^m are the a_i^m, and weights relative to q^m of the a_i^m equal weights relative to q of the a_i (DWP.0/weil-number-base-extension, DWP.0/finite-field-base-extension-of-weights).

Acceptance checks:

- E over 𝔽_3 with P_π = X² + 3: over 𝔽_9, P_{π²} = (X + 3)², with roots −3 of absolute value 3 = 9^{1/2}.

Direct inputs: [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), [DWP.0/weil-number-base-extension](#dwp-0-weil-number-base-extension).

Sources: [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76.

Declaration id: `DeligneWeightsAndPurity:DWP.1/the-frobenius-and-points-over-extensions`.

## DWP.2 — Weil I's fundamental estimate, with its actual hypotheses

<a id="dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves"></a>

### The Weil I curve coefficient interface

On an open U₀⊂ℙ¹ over 𝔽_q, specialize DWP.5’s common punctual purity predicate to a lisse ℚ_ℓ-sheaf ℱ₀: integer weight β means each closed-point stalk is pure β relative to q^(deg x). The local determinant and Euler product are the WC.1/SF.2 coefficient L-function, with local variable t^(deg x). Changing geometric stalk conjugates Frobenius and leaves its determinant unchanged; tensor weights add, dual weights negate, and the Tate line ℚ_ℓ(r) has weight −2r. This comparison fixes the inputs of Weil I §3 without defining a second purity predicate or L-function.

This is Weil I (3.1): all complex conjugates of the Frobenius eigenvalues, that is, Weil q_x-numbers. DWP.5 generalizes it to Weil II's pointwise purity on schemes of finite type and to real ι-weights, and must identify its predicate with this one on open subsets of ℙ¹.

F₀ has a fixed ℚ_ℓ-model, as RS-17 keeps. ℚ̄_ℓ enters only through the eigenvalues.

The geometric Frobenius is used (DWP.0 conventions).

Atlas landmark: **Weight of a lisse sheaf on a curve**.

Proof or construction:

1. Use the common closed-stalk definition and geometric-Frobenius convention. Coefficient-extension invariance identifies the ℚ_ℓ model with its algebraic closure.
2. Import local characteristic-polynomial conjugacy invariance and the Euler determinant formula from WC.1/SF.2. Apply the numeric tensor, dual and Tate identities to the stalks.

Acceptance checks:

- ℚ_ℓ(1) on 𝔾_m has weight −2, and Z(𝔾_m, ℚ_ℓ(1), t) = Z(𝔾_m, ℚ_ℓ, t/q) = (1 − t/q)/(1 − t).
- ℚ_ℓ(r) on U₀ has weight −2r: F_x acts by q_x^{−r}.
- The constant sheaf ℚ_ℓ has weight 0, and the zero sheaf has every weight.
- For q = p odd, the geometrically constant rank-one sheaf on which F_x acts by 2^{deg x} has no weight, since 2 = p^{β/2} has no integer solution β. It is ι-pure of the real weight 2 log_p 2.
- Z(𝔸¹, ℚ_ℓ, t) = 1/(1 − qt).

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `WeilConjectures:WC.1`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.1), p. 283.

Declaration id: `DeligneWeightsAndPurity:DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves`.

<a id="dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense"></a>

### Open subgroups of Sp(V)(ℚ_ℓ) are Zariski-dense

Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ, and H ⊆ Sp(V, ψ)(ℚ_ℓ) a subgroup open for the ℓ-adic topology. Then H is Zariski-dense in the algebraic group Sp(V, ψ). Consequently, for every algebraic representation W of Sp(V, ψ), such as ⊗^m V, the H-invariants and H-coinvariants of W are the Sp(V, ψ)-invariants and Sp(V, ψ)-coinvariants.

Openness is for the ℓ-adic topology. RS-17 keeps it as the hypothesis of Theorem 3.2, rather than any weaker density statement.

Connectedness of Sp is essential: an open subgroup of O(V)(ℚ_ℓ) is dense only in the identity component.

Proof or construction:

1. The Zariski closure Ĥ of H is an algebraic subgroup of Sp(V). Its ℚ_ℓ-points contain the open subgroup H, so its Lie algebra is sp(V) and dim Ĥ = dim Sp(V) (ReductiveGroups Layers 2–3).
2. Sp(V) is connected, so Ĥ = Sp(V).
3. A vector or functional fixed by H is fixed by its Zariski closure, because the action is algebraic.

Acceptance checks:

- Sp_{2g}(ℤ_ℓ) is open in Sp_{2g}(ℚ_ℓ) and Zariski-dense.
- A finite subgroup of Sp(V)(ℚ_ℓ) is neither open nor Zariski-dense when dim V > 0.

Direct inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense`.

<a id="dwp-2-symplectic-coinvariants-of-even-tensor-powers"></a>

### Coinvariants of ⊗^{2k}V under the symplectic group, over ℚ_ℓ

Let V be a ℚ_ℓ-vector space of dimension 2r ≥ 2 with a nondegenerate alternating form ψ : V ⊗ V → L, where L is one-dimensional (L = ℚ_ℓ(−β)). For a partition P of {1, …, 2k} into pairs {a_i, b_i} with a_i < b_i, let ψ_P : ⊗^{2k}V → L^{⊗k}, v₁ ⊗ … ⊗ v_{2k} ↦ ∏_i ψ(v_{a_i}, v_{b_i}). The ψ_P span the Sp(V, ψ)-invariant maps ⊗^{2k}V → L^{⊗k}. For a suitable subset 𝒫′ of the pair partitions, depending on dim V and k, the ψ_P with P ∈ 𝒫′ induce an isomorphism (⊗^{2k}V)_{Sp(V, ψ)} ≅ (L^{⊗k})^N with N = #𝒫′ ≥ 1. The isomorphism is compatible with every automorphism of V that multiplies ψ by a scalar, acting on L by that scalar.

Over ℂ this is Weyl's first fundamental theorem for Sp (Brauer algebra), imported from Tau Ceti SchurWeyl Layer 9.

The passage to ℚ_ℓ is proved here, as RS-17 requires: the group Sp and the representation ⊗^{2k}V are defined over ℚ, and invariants of an algebraic group under flat base change of fields commute with extension of scalars. No statement about ℓ-adically open subgroups is transferred by extension of scalars.

For dim V ≥ 2k all (2k − 1)!! pair partitions are independent. For smaller V the ψ_P are dependent.

Proof or construction:

1. Over ℂ: the Sp-invariant multilinear forms on V^{2k} are spanned by the ψ_P (SchurWeyl Layer 9).
2. Descent to ℚ: choose a symplectic basis defined over ℚ. The invariants of Sp_{2r} over ℚ on (⊗^{2k}ℚ^{2r})^∨ span the complex invariants after ⊗ ℂ, since invariants commute with flat base change. So the ψ_P span over ℚ.
3. Base change to ℚ_ℓ, by the same argument.
4. Coinvariants are dual to the invariants of the dual representation, so choosing a basis 𝒫′ of the span gives the isomorphism, with N = dimension of the invariants.

Acceptance checks:

- dim V = 2, k = 1: (V ⊗ V)_{Sp} ≅ L through ψ, N = 1.
- dim V = 2, k = 2: the invariants of SL₂ on ⊗⁴V have dimension 2 (the Catalan number C₂), while there are 3 pair partitions. The three ψ_P are dependent, and N = 2.

Direct inputs: `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/symplectic-coinvariants-of-even-tensor-powers`.

<a id="dwp-2-compact-cohomology-of-even-tensor-powers"></a>

### Compact cohomology and the L-function of ⊗^{2k}F

Under the hypotheses of Theorem 3.2, with U affine and F₀ ≠ 0: H⁰_c(U, ⊗^{2k}F) = 0, H²_c(U, ⊗^{2k}F) ≅ ℚ_ℓ(−kβ − 1)^N with N ≥ 1 as Frobenius modules, and Z(U₀, ⊗^{2k}F₀, t) = det(1 − F^*t, H¹_c(U, ⊗^{2k}F)) / (1 − q^{kβ+1}t)^N. So Z(U₀, ⊗^{2k}F₀, t) is the Taylor expansion of a rational function whose only poles are at t = q^{−kβ−1}.

U affine: shrinking U₀ changes neither the hypotheses nor the conclusion of Theorem 3.2.

Weil I (2.10) (H⁰_c = 0 on an affine curve; H²_c = coinvariants(−1)) is requested from EtaleDualityAndPerverseSheaves EDC.2. The trace formula (1.14.3) is requested from SchemeAndStackFoundations SF.2, which carries the CohomologicalPointCounting trace formula that RS-17 names.

Only the absolute value of the pole, |q^{−kβ−1}|, is used afterwards.

Proof or construction:

1. H⁰_c(U, G) = 0 for a lisse G on the affine curve U (Weil I (2.10)(i), EDC.2).
2. H²_c(U, G) = (G_ū)_{π₁(U, ū)}(−1) (Weil I (2.10)(ii), EDC.2), for G = ⊗^{2k}F.
3. The geometric monodromy is open in Sp, so its coinvariants are the Sp-coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). These are ℚ_ℓ(−kβ)^N (theorem symplectic-coinvariants-of-even-tensor-powers), Frobenius-equivariantly because ψ is a morphism of sheaves into ℚ_ℓ(−β).
4. Trace formula (1.14.3), requested from SF.2: Z = ∏_i det(1 − F^*t, H^i_c)^{(−1)^{i+1}}, and F^* = q^{kβ+1} on H²_c = ℚ_ℓ(−kβ − 1)^N.

Acceptance checks:

- For F₀ the first cohomology of a family of elliptic curves with non-constant j (weight 1, rank 2, ψ the Weil pairing into ℚ_ℓ(−1)) and k = 1: H²_c(U, ⊗²F) ≅ ℚ_ℓ(−2), N = 1, with a pole at t = q^{−2}.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, (3.7), p. 285; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §2, Scholie (2.10), p. 282.

Declaration id: `DeligneWeightsAndPurity:DWP.2/compact-cohomology-of-even-tensor-powers`.

<a id="dwp-2-positivity-of-even-tensor-power-traces"></a>

### Lemma 3.3: nonnegative rational log-derivatives of even tensor powers

Under hypothesis (iii) of Theorem 3.2, for every even integer 2k and every x ∈ |U₀|, the power series t (d/dt) log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has nonnegative rational coefficients.

Deligne's "positifs" means nonnegative.

Proof or construction:

1. By (iii), det(1 − F_x t, F₀) ∈ ℚ[t], so Tr(F_x^n, F₀) ∈ ℚ for all n (DWP.0/characteristic-power-series-and-traces).
2. Tr(F_x^n, ⊗^{2k}F₀) = Tr(F_x^n, F₀)^{2k} (mathlib:LinearMap.trace_tensorProduct' iterated), a nonnegative rational number.
3. Apply Weil I (1.5.3), the identity (ii) of DWP.0/characteristic-power-series-and-traces.

Acceptance checks:

- F_x with eigenvalues ±i√q and 2k = 2: Tr(F_x^n) is 0 for odd n and ±2q^{n/2} for even n. The negative sign occurs for n ≡ 2 mod 4, but the squares 4q^n are nonnegative.

Direct inputs: [DWP.0/characteristic-power-series-and-traces](#dwp-0-characteristic-power-series-and-traces), `mathlib:LinearMap.trace_tensorProduct'`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.3), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/positivity-of-even-tensor-power-traces`.

<a id="dwp-2-positive-local-factors"></a>

### Lemma 3.4: local factors of even tensor powers have nonnegative coefficients

Under hypothesis (iii) of Theorem 3.2, for every even 2k and x ∈ |U₀|, the local factor det(1 − F_x t^{deg x}, ⊗^{2k}F₀)⁻¹ ∈ ℚ[[t]] has constant term 1 and nonnegative coefficients.

Substituting t^{deg x} for t preserves nonnegativity.

Proof or construction:

1. log det(1 − F_x t, ⊗^{2k}F₀)⁻¹ has no constant term and nonnegative coefficients (lemma positivity-of-even-tensor-power-traces, divided termwise by n).
2. The exponential of a power series with nonnegative coefficients and no constant term has nonnegative coefficients.
3. Substitute t^{deg x}.

Acceptance checks:

- For F₀ = ℚ_ℓ(−1) and 2k = 2: the local factor is 1/(1 − q_x² t^{deg x}) = Σ q_x^{2m} t^{m deg x}.

Direct inputs: [DWP.2/positivity-of-even-tensor-power-traces](#dwp-2-positivity-of-even-tensor-power-traces).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.4), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/positive-local-factors`.

<a id="dwp-2-radius-of-convergence-of-positive-products"></a>

### Lemma 3.5: factors of a product of positive power series converge at least as far

Let (f_i) be a countable family of power series f_i = Σ_n a_{i,n} t^n with constant term 1 and nonnegative real coefficients, such that ord(f_i − 1) → ∞, and let f = ∏_i f_i = Σ_n a_n t^n. Then a_{i,n} ≤ a_n for all i and n. Hence the radius of absolute convergence of each f_i is at least that of f.

Nonnegativity of all coefficients is essential; without it cancellation can make f converge further than a factor.

Proof or construction:

1. Expanding the product, each coefficient a_n is a sum of nonnegative terms, one of which is a_{i,n}·1·1⋯.
2. Comparison of power series with nonnegative coefficients gives the radii.

Acceptance checks:

- f₁ = 1/(1 − t) and f₂ = 1/(1 − t²): f = f₁f₂ has radius 1, and so do f₁ and f₂.
- Without positivity: (1 − t) · 1/(1 − t) = 1 has infinite radius, while the second factor has radius 1.

Direct inputs: .

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.5), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/radius-of-convergence-of-positive-products`.

<a id="dwp-2-poles-of-positive-products"></a>

### Lemma 3.6: poles of the factors lie no closer than the poles of the product

Under the hypotheses of Lemma 3.5, if f and all the f_i are Taylor expansions at 0 of meromorphic functions on ℂ, then inf{|z| : f_i has a pole at z} ≥ inf{|z| : f has a pole at z}.

The functions used (local factors and the L-function of ⊗^{2k}F₀) are rational, hence meromorphic.

Proof or construction:

1. For a function meromorphic on ℂ and holomorphic at 0, the radius of convergence of its Taylor series at 0 is the modulus of its nearest pole. The Taylor series converges on the largest disc of holomorphy, and cannot converge beyond a pole.
2. Apply Lemma 3.5.

Acceptance checks:

- f₁ = 1/(1 − 2t) and f₂ = 1/(1 − t): the product f = f₁f₂ has its nearest pole at 1/2, and the pole of f₂ at 1 lies further out, as the lemma requires.

Direct inputs: [DWP.2/radius-of-convergence-of-positive-products](#dwp-2-radius-of-convergence-of-positive-products).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Lemme (3.6), p. 284.

Declaration id: `DeligneWeightsAndPurity:DWP.2/poles-of-positive-products`.

<a id="dwp-2-fundamental-estimate-theorem-3-2"></a>

### Weil I, Theorem 3.2: the fundamental estimate

Let U₀ ⊆ ℙ¹ over 𝔽_q be open, F₀ a lisse ℚ_ℓ-sheaf on U₀, and β ∈ ℤ. Assume (i) F₀ carries a nondegenerate alternating pairing ψ : F₀ ⊗ F₀ → ℚ_ℓ(−β); (ii) the image of the geometric fundamental group π₁(U, ū) in GL(F_ū) is an open subgroup of Sp(F_ū, ψ); (iii) for every x ∈ |U₀|, det(1 − F_x t, F₀) has rational coefficients. Then F₀ has weight β: every eigenvalue of every F_x is an algebraic number all of whose complex conjugates have absolute value q_x^{β/2}.

(ii) is openness for the ℓ-adic topology in the symplectic group of ψ, as RS-17 keeps it.

(iii) is rationality of the Frobenius polynomials of the fixed ℚ_ℓ-sheaf.

One may assume U affine and F₀ ≠ 0.

No purity of cohomology is assumed: the estimate is proved directly from positivity and the poles of the L-function of the even tensor powers.

Atlas landmark: **Fundamental estimate**.

Proof or construction:

1. Reduce to U affine and F₀ ≠ 0.
2. Fix x of degree d and an eigenvalue α of F_x on F₀. By (iii), α is algebraic and every complex conjugate of α is again an eigenvalue. α^{2k} is an eigenvalue of F_x on ⊗^{2k}F₀ (DWP.0/spectra-of-tensor-products-and-duals). So the local factor det(1 − F_x t^d, ⊗^{2k}F₀)⁻¹ has a pole at every t with t^d = α^{−2k}.
3. That local factor is one factor of Z(U₀, ⊗^{2k}F₀, t) = ∏_y (local factor at y). All the factors have nonnegative coefficients (lemma positive-local-factors), and Z is rational with poles only at q^{−kβ−1} (theorem compact-cohomology-of-even-tensor-powers). Lemma poles-of-positive-products gives |α|^{−2k/d} ≥ q^{−kβ−1}, that is, |α| ≤ q_x^{β/2 + 1/(2k)}.
4. Letting k → ∞ gives |α| ≤ q_x^{β/2}.
5. ψ is Frobenius-equivariant with values in ℚ_ℓ(−β), on which F_x acts by q_x^β. So q_x^β/α is also an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues with c = q_x^β), and the previous step applied to it gives |α| ≥ q_x^{β/2}. The same argument applies to every complex conjugate of α.

Acceptance checks:

- The first cohomology of a family of elliptic curves over an open subset of ℙ¹ with non-constant j has weight 1, carries the Weil pairing, has monodromy open in SL₂ = Sp₂, and has rational Frobenius polynomials. Theorem 3.2 gives |a_x| ≤ 2√q_x at every fibre, compatibly with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

Direct inputs: [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/positive-local-factors](#dwp-2-positive-local-factors), [DWP.2/poles-of-positive-products](#dwp-2-poles-of-positive-products), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/weil-q-number](#dwp-0-weil-q-number).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Théorème (3.2), p. 284; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, proof of (3.2), p. 285.

Declaration id: `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`.

<a id="dwp-2-coarse-bound-on-compact-cohomology"></a>

### Corollary 3.8: the coarse bound on H¹_c(U, F)

Under the hypotheses of Theorem 3.2, with U affine, every eigenvalue α of F^* on H¹_c(U, F) is an algebraic number, and every complex conjugate of α satisfies |α| ≤ q^{β/2 + 1}.

This is an upper bound for H¹_c, not purity. Sharp curve-coefficient purity is DWP.6.

Proof or construction:

1. H⁰_c(U, F) = 0 (U affine), and H²_c(U, F) = (F_ū)_{π₁}(−1) = 0, since the standard representation of Sp has no coinvariants (lemma open-subgroups-of-symplectic-groups-are-zariski-dense). So by (1.14.3), Z(U₀, F₀, t) = det(1 − F^*t, H¹_c(U, F)).
2. The left side has rational coefficients by its product expansion and (iii). So the polynomial on the right has rational coefficients, 1/α is a root, α is algebraic, and its conjugates are also eigenvalues.
3. With N=rank ℱ and |α_(x,j)|=q_x^(β/2), choose |t|=q^(−β/2−1−ε). Because U₀⊂ℙ¹, the number of its degree-e closed points is at most #ℙ¹(𝔽_(q^e))=q^e+1. Hence Σ_(x,j)|α_(x,j)t^(deg x)|≤N Σ_(e≥1)(q^e+1)q^(−e(1+ε))=N[Σ q^(−eε)+Σ q^(−e(1+ε))]<∞. Both geometric series are required for the original open of ℙ¹.
4. An absolutely convergent product of nonzero factors has no zero, so |1/α| ≥ q^{−β/2−1}.

Acceptance checks:

- β = 1 (a family of elliptic curves): every eigenvalue on H¹_c(U, F) satisfies |α| ≤ q^{3/2}.

Direct inputs: [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.8), p. 286.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-compact-cohomology`.

<a id="dwp-2-coarse-bound-on-cohomology-of-the-projective-line"></a>

### Corollary 3.9: the two-sided coarse bound on H¹(ℙ¹, j_*F)

Let j : U → ℙ¹ be the inclusion. Under the hypotheses of Theorem 3.2, every eigenvalue α of F^* on H¹(ℙ¹, j_*F) is an algebraic number, and every complex conjugate of α satisfies q^{β/2} ≤ |α| ≤ q^{β/2 + 1}; in Deligne's notation q^{(β+1)/2 − 1/2} ≤ |α| ≤ q^{(β+1)/2 + 1/2}.

Poincaré duality (2.12) for j_*F on ℙ¹ is requested from EtaleDualityAndPerverseSheaves EDC.2.

Proof or construction:

1. The exact sequence 0 → j_!F → j_*F → j_*F/j_!F → 0 has a punctual third term, so H¹_c(U, F) → H¹(ℙ¹, j_*F) is surjective. Every α is therefore an eigenvalue on H¹_c(U, F), and Corollary 3.8 gives |α| ≤ q^{β/2+1}.
2. Poincaré duality (2.12) pairs H¹(ℙ¹, j_*F) with H¹(ℙ¹, j_*F^∨(1)) into ℚ_ℓ, and ψ identifies F^∨ with F(β). So q^{β+1}/α is an eigenvalue (DWP.0/reciprocal-pairing-of-eigenvalues), and |q^{β+1}α⁻¹| ≤ q^{β/2+1} gives |α| ≥ q^{β/2}.

Acceptance checks:

- β = 1: every eigenvalue on H¹(ℙ¹, j_*F) satisfies q^{1/2} ≤ |α| ≤ q^{3/2}. Purity (|α| = q) is DWP.4's sharpening.

Direct inputs: [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues), `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 286; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3, Corollaire (3.9), p. 287.

Declaration id: `DeligneWeightsAndPurity:DWP.2/coarse-bound-on-cohomology-of-the-projective-line`.

## DWP.3 — Pencil local-factor rationality and the radical quotient

<a id="dwp-3-radical-quotient-of-the-vanishing-system"></a>

### Arithmetic descent of the pencil radical quotient

For a finite-field Lefschetz pencil on a geometrically connected smooth projective even-dimensional variety, the LPV.4 vanishing system ℰ and its radical quotient ℱ=ℰ/(ℰ∩ℰ⊥) descend to lisse ℚ_ℓ-sheaves ℰ₀ and ℱ₀ over the smooth-parameter open U₀. The supplied perfect alternating pairing on ℱ₀ has values in ℚ_ℓ(−d), with d odd the fixed fibre dimension, so a local geometric Frobenius of degree e acts by a symplectic similitude with multiplier q^(de). The zero quotient is permitted. LPV.4 owns the construction and perfection of the quotient; this node supplies its finite-field descent and arithmetic normalization.

Use the actual LPV.3 pencil and LPV.4 quotient with their fixed ℚ_ℓ model. No replacement of fibre dimension d by point degree e is permitted.

Atlas landmark: **Arithmetic pencil descent**.

Proof or construction:

1. Import the LPV.4 quotient and pairing. Arithmetic Frobenius permutes the vanishing cycles, preserving their span and its radical; the lisse fibre/representation descent equivalence supplies ℰ₀ and ℱ₀.
2. The Frobenius-equivariant cup-product pairing takes values in ℚ_ℓ(−d). Geometric Frobenius acts there by q^(de), giving the multiplier.
3. If the quotient is zero, its local polynomial is 1 and the rationality/purity statements are vacuous; the dimension induction still retains the radical and constant pieces.

Acceptance checks:

- A Lefschetz pencil of plane cubics (X = ℙ², n = 1): ℰ = H¹ of the fibres, ℰ ∩ ℰ^⊥ = 0, and ℱ₀ is the rank-2 sheaf with its Weil pairing into ℚ_ℓ(−1).
- For a pencil of plane cubics, ℱ₀ has rank 2 and ψ is the Weil pairing.
- If ℰ ⊆ ℰ^⊥, then ℱ₀ = 0 and Theorem 6.2 holds trivially.
- ψ need not be perfect on ℰ itself when ℰ ∩ ℰ^⊥ ≠ 0; only the quotient carries a perfect pairing.
- rank ℱ₀ is even, since ℱ₀ carries a perfect alternating pairing.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.1), p. 295.

Declaration id: `DeligneWeightsAndPurity:DWP.3/radical-quotient-of-the-vanishing-system`.

<a id="dwp-3-geometrically-constant-lisse-sheaves"></a>

### Weil I Lemma 6.4: geometrically constant lisse sheaves come from 𝔽_q

Let 𝒢₀ be a lisse ℚ_ℓ-sheaf on U₀ whose pullback 𝒢 to U is constant. Then there are ℓ-adic units α_i ∈ ℚ̄_ℓ with det(1 − F_x t^{deg x}, 𝒢₀) = ∏_i(1 − α_i^{deg x} t^{deg x}) for every x ∈ |U₀|. In fact 𝒢₀ is the pullback of its direct image to Spec 𝔽_q, a representation G₀ of Gal(𝔽̄_q/𝔽_q), and ∏(1 − α_i t) = det(1 − F t, G₀).

The α_i are ℓ-adic units because Gal(𝔽̄_q/𝔽_q) is compact.

The lemma applies to R^i f_*ℚ_ℓ for i ≠ n, to R^n f_*ℚ_ℓ/ℰ₀ and to ℰ₀ ∩ ℰ₀^⊥, which are geometrically constant for a Lefschetz pencil (LefschetzPencilsAndVanishingCycles LPV.4).

Proof or construction:

1. 𝒢₀ corresponds to a representation of π₁(U₀, u) trivial on π₁(U, u), so it factors through π₁(U₀)/π₁(U) = Gal(𝔽̄_q/𝔽_q).
2. The Frobenius at x maps to F^{deg x} in Gal(𝔽̄_q/𝔽_q), so its eigenvalues are the α_i^{deg x} (DWP.0/finite-field-base-extension-of-weights).

Acceptance checks:

- The Tate twist ℚ_ℓ(−1) on U₀: α = q, and det(1 − F_x t^{deg x}) = 1 − q^{deg x} t^{deg x}.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.4`, [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.4), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.4), p. 296.

Declaration id: `DeligneWeightsAndPurity:DWP.3/geometrically-constant-lisse-sheaves`.

<a id="dwp-3-zeta-of-the-fibres-and-the-pencil-factorization"></a>

### The zeta functions of the fibres, split into a constant part and the ℱ₀ part

In the setting of radical-quotient-of-the-vanishing-system, there are ℓ-adic units α_1, …, α_N and β_1, …, β_M in ℚ̄_ℓ, with α_i ≠ β_j for all i and j, such that for every x ∈ |U₀|, Z(X_x, t) = [∏_i(1 − α_i^{deg x} t) / ∏_j(1 − β_j^{deg x} t)] · det(1 − F_x t, ℱ₀)^{(−1)^{n+1}}, where t is the variable for the residue field k(x). In particular the right-hand side lies in ℚ(t).

Z(X_x, t) ∈ ℚ(t) is the rationality of the zeta function over ℚ (WeilConjectures WC.1). The cohomological formula is Weil I (1.5.4), requested from SchemeAndStackFoundations SF.2.

Common α_i = β_j can be cancelled, so they may be assumed distinct. This is the finite eigenvalue family bookkeeping RS-17 asks for, with no appeal to purity.

No Riemann hypothesis is used: the α and β are arbitrary ℓ-adic units.

Proof or construction:

1. For x ∈ |U₀|, the fibre X_x is smooth projective over k(x), and H^i(X_x̄) is the stalk of R^i f_*ℚ_ℓ at a geometric point over x (proper base change, SF.2).
2. (1.5.4) over k(x): Z(X_x, t) = ∏_i det(1 − F_x t, R^i f_*ℚ_ℓ)^{(−1)^{i+1}}.
3. Filter R^n by ℰ ∩ ℰ^⊥ ⊆ ℰ ⊆ R^n: the factor splits as det(on R^n/ℰ)·det(on ℰ ∩ ℰ^⊥)·det(on ℱ₀) (DWP.0/characteristic-polynomial-in-short-exact-sequences).
4. Lemma geometrically-constant-lisse-sheaves on R^i (i ≠ n), R^n/ℰ₀ and ℰ₀ ∩ ℰ₀^⊥ gives the α and β factors. Cancel common values.
5. Z(X_x, t) ∈ ℚ(t) (WC.1).

Acceptance checks:

- A pencil of plane cubics (n = 1): Z(X_x, t) = det(1 − F_x t, ℱ₀)/((1 − t)(1 − q_x t)). There are no α's, and β = (1, q), from H⁰ = ℚ_ℓ and H² = ℚ_ℓ(−1).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.0/characteristic-polynomial-in-short-exact-sequences](#dwp-0-characteristic-polynomial-in-short-exact-sequences), `WeilConjectures:WC.1`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.4), p. 296; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.5.4), p. 276.

Declaration id: `DeligneWeightsAndPurity:DWP.3/zeta-of-the-fibres-and-the-pencil-factorization`.

<a id="dwp-3-powers-of-a-family-determine-the-family"></a>

### Weil I Lemma 6.7: a family is determined by its n-th powers for enough n

Let K be a finite set of nonnegative integers different from 1, and (δ_j)_{j ≤ Q}, (ε_j)_{j ≤ Q} two families of elements of a field. If, for all sufficiently large n divisible by no element of K, the families (δ_j^n) and (ε_j^n) agree up to order, then (δ_j) and (ε_j) agree up to order.

K must exclude 1: every integer is divisible by 1.

The families are finite and counted with multiplicity.

Proof or construction:

1. Induction on Q. For each j, the n with δ_0^n = ε_j^n form an ideal n_jℤ.
2. If δ_0 ≠ ε_j for all j, then all n_j ≠ 1, and there are arbitrarily large n divisible by no n_j and no element of K. Then δ_0^n ≠ ε_j^n for all j, contradicting the hypothesis. So δ_0 = ε_{j₀} for some j₀.
3. Remove δ_0 and ε_{j₀} and apply the induction hypothesis.

Acceptance checks:

- δ = (1, −1), ε = (−1, 1): equal. δ = (ζ₃), ε = (1): the cubes agree, but for n not divisible by 3 they differ, and with K = {3} the hypothesis fails, as it should.

Direct inputs: .

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.7), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/powers-of-a-family-determine-the-family`.

<a id="dwp-3-open-image-in-the-symplectic-similitude-group"></a>

### Weil I Lemma 6.11: the arithmetic monodromy of ℱ₀ is open in H

Let d be the fixed odd pencil fibre dimension and ℱ₀≠0 its supplied radical quotient with pairing into ℚ_ℓ(−d). Use the arithmetic coordinate a∈ℤ̂, where geometric Frobenius of a degree-e point has a=−e. In a fixed finite ℓ-adic coefficient model define H={(a,g)∈ℤ̂×GSp(ℱ,ψ): μ(g)=q^(−da)}. Then (arithmetic degree,ρ):π₁(U₀)→H has open image H₁, compact because π₁(U₀) is profinite. Its degree-zero image is open in Sp for the ℓ-adic topology.

The openness of the geometric monodromy in Sp(ℱ, ψ) is Weil I (5.10), which LefschetzPencilsAndVanishingCycles LPV.5 owns: open symplectic monodromy for the fixed ℚ_ℓ model.

ℱ₀ ≠ 0 is assumed. For ℱ₀ = 0 the statements are empty.

Proof or construction:

1. The pairing forces μ(ρ(σ))=q^(−da(σ)), so the map lands in H. In particular a(F_x)=−e gives multiplier q^(de).
2. The arithmetic exact sequence is surjective onto ℤ̂ for geometrically connected U₀. Its geometric kernel image is open in Sp by the fixed-model LPV.5 theorem. Therefore the total image is open in H; its compactness follows from profiniteness.

Acceptance checks:

- For plane cubics the geometric image is a compact open subgroup of Sp₂(ℚ_ℓ)=SL₂(ℚ_ℓ). At degree e its determinant is q^e, not q^(−e).

Direct inputs: [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 297; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.10), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/open-image-in-the-symplectic-similitude-group`.

<a id="dwp-3-haar-null-exceptional-eigenvalue-locus"></a>

### Weil I Lemma 6.12: the eigenvalue-δ^a locus is closed and Haar-null

For an ℓ-adic unit δ in the fixed finite coefficient field, the locus Z_δ={(a,g)∈H₁: δ^a is an eigenvalue of g} is closed and null in each arithmetic-degree fibre, hence Haar-null in H₁. For a bad geometric eigenvalue δ₀^e the arithmetic-degree locus uses δ=δ₀⁻¹, since a(F_x)=−e.

δ^a for a ∈ ℤ̂ is defined because δ is an ℓ-adic unit.

This is the compact ℓ-adic Haar-null step that RS-17 asks DWP.3 to prove itself.

ℱ ≠ 0 is needed: for ℱ = 0 there are no eigenvalues and Z_δ = ∅.

Proof or construction:

1. Closedness: (a, g) ↦ det(δ^a − g) is continuous, and Z_δ is its zero set.
2. At fixed arithmetic coordinate a, the similitude fibre has multiplier q^(−da) and is a translate of Sp. The determinant equation det(δ^a−g)=0 cuts out a proper algebraic subset: in a symplectic basis choose distinct nonzero diagonal parameters avoiding δ^a and its multiplier partner. An ℓ-adic analytic proper algebraic zero set has Haar measure zero in every compact open part of this fibre.
3. H₁ ∩ ({a} × Z_{δ,a}) is null in the fibre of H₁ over a, and Fubini for the projection H₁ → ℤ̂ gives measure 0.

Acceptance checks:

- ℱ of rank 2 and δ = 1: the set of g ∈ SL₂(ℤ_ℓ) with eigenvalue 1 (unipotent-type) is a proper analytic subset of measure 0.

Direct inputs: [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Lemme (6.12), p. 298; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, proof of (6.12), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/haar-null-exceptional-eigenvalue-locus`.

<a id="dwp-3-exceptional-frobenius-set-has-density-zero"></a>

### The Frobenius elements landing in a Haar-null set have density zero

Let δ_1, …, δ_Q be ℓ-adic units. The set L of x ∈ |U₀| such that some δ_j^{deg x} is an eigenvalue of F_x on ℱ₀ has Dirichlet density 0. More precisely, the proportion of the closed points of degree n that lie in L tends to 0 as n → ∞. In particular, for every sufficiently large n there are closed points of degree n outside L.

The atlas's completion contract for DWP.3 splits this into two steps. The first is finite-quotient Chebotarev with constant-field degree congruences (imported from FunctionFieldArithmetic FA.5). The second is the approximation of the closed Haar-null set by open neighbourhoods of small measure, proved here. Topological density alone does not give density zero.

Proof or construction:

1. For Z=∪Z_(δ_j⁻¹) choose decreasing conjugation-invariant clopen neighborhoods C_m with intersection Z, from a cofinal family of open normal subgroups of the fixed compact ℓ-adic model H₁.
2. Conditional Haar mass a↦μ_a(C_m∩H₁,a) is a continuous locally constant function on ℤ̂: each C_m comes from a finite quotient. The functions decrease to zero at every a because the exceptional locus is null in every degree fibre. Compactness and Dini’s theorem give uniform convergence to zero; total Haar mass zero alone would not give this uniform statement.
3. For any ε choose one finite quotient with every fibre mass <ε. The requested finite-quotient Chebotarev theorem, with constant-field congruences and its per-degree error, bounds the exceptional fraction at degree e by ε+o(1). The finitely many degree residue classes make the error uniform.
4. Let ε tend to zero. Thus #L_e=o(q^e/e); since U₀ is a geometrically connected open of ℙ¹, its degree-e closed-point count is asymptotic to q^e/e, so every sufficiently large degree has a point outside L.

Acceptance checks:

- For the pencil of plane cubics and δ = 1: 1 is an eigenvalue of F_x on ℱ₀ = H¹(E_x) iff #E_x(k(x)) = det(1 − F_x | H¹) = 0. That is impossible, since E_x has a rational point, so L = ∅.

Direct inputs: [DWP.3/haar-null-exceptional-eigenvalue-locus](#dwp-3-haar-null-exceptional-eigenvalue-locus), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), `FunctionFieldArithmetic:FA.5`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/exceptional-frobenius-set-has-density-zero`.

<a id="dwp-3-denominators-away-from-the-exceptional-set"></a>

### Weil I Proposition 6.6: the denominator of (6.6.1) away from K and L

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units with γ_i ≠ δ_j. There are a finite set K of nonnegative integers different from 1 and a density-zero set L ⊂ |U₀| such that, for x ∉ L with deg x divisible by no element of K, the rational function det(1 − F_x t, ℱ₀)·∏_i(1 − γ_i^{deg x} t) / ∏_j(1 − δ_j^{deg x} t), written in lowest terms, has denominator ∏_j(1 − δ_j^{deg x} t).

The two exceptional sets are exactly where cancellation can happen: δ_j^{deg x} equal to some γ_i^{deg x} (controlled by K), or δ_j^{deg x} an eigenvalue of F_x (controlled by L).

Proof or construction:

1. For each i and j, the n with γ_i^n = δ_j^n form n_{ij}ℤ with n_{ij} ≠ 1 (since γ_i ≠ δ_j). Let K = {n_{ij}}.
2. L = the x with some δ_j^{deg x} an eigenvalue of F_x on ℱ₀, of density 0 (lemma exceptional-frobenius-set-has-density-zero).
3. For x ∉ L with deg x divisible by no element of K, no factor 1 − δ_j^{deg x}t of the denominator cancels against the numerator.

Acceptance checks:

- γ = ∅, δ = (q): the denominator is 1 − q^{deg x} t unless q^{deg x} is an eigenvalue of F_x, which happens only on a density-zero set.

Direct inputs: [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.6), p. 296; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.13), p. 298.

Declaration id: `DeligneWeightsAndPurity:DWP.3/denominators-away-from-the-exceptional-set`.

<a id="dwp-3-divisibility-criterion"></a>

### Weil I Proposition 6.8: an intrinsic characterisation of the γ-polynomial

Let (γ_i)_{i ≤ P} and (δ_j)_{j ≤ Q} be families of ℓ-adic units, R(t) = ∏(1 − γ_i t) and S(t) = ∏(1 − δ_j t). If, for every x ∈ |U₀|, ∏_j(1 − δ_j^{deg x} t) divides ∏_i(1 − γ_i^{deg x} t)·det(1 − F_x t, ℱ₀), then S(t) divides R(t). Consequently R(t) is the least common multiple of the S(t) satisfying this hypothesis, which characterises the γ-family intrinsically from the polynomials ∏(1 − γ_i^{deg x}t)·det(1 − F_x t, ℱ₀).

The divisibility is required for every x, but it is used only for x outside the exceptional sets of Proposition 6.6.

Proof or construction:

1. Cancel common pairs γ_i = δ_j until the families are disjoint.
2. Proposition 6.6: for x outside K and L the denominator of (6.6.1) is ∏(1 − δ_j^{deg x}t). But by hypothesis (6.6.1) is a polynomial, so no δ remains after cancellation: S divides R.

Acceptance checks:

- γ = (q, q), δ = (q): S | R. δ = (q²) with γ = (q): the hypothesis fails at a generic x.

Direct inputs: [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Proposition (6.8), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/divisibility-criterion`.

<a id="dwp-3-rationality-of-pencil-local-factors"></a>

### Weil I Theorem 6.2: the local factors of the radical quotient have rational coefficients

In the setting of radical-quotient-of-the-vanishing-system, for every x ∈ |U₀|, det(1 − F_x t, ℱ₀) ∈ ℚ[t].

No Riemann hypothesis, no purity and no semisimplicity is assumed. The proof uses only the rationality of the fibres' zeta functions, geometric constancy of the other pieces, open symplectic monodromy and Chebotarev.

The statement holds trivially for ℱ₀ = 0.

Atlas landmark: **Rationality theorem (Weil I 6.2)**.

Proof or construction:

1. By the factorization theorem it suffices to show that ∏(1 − α_i t) and ∏(1 − β_j t) have rational coefficients, that is, that the α-family and the β-family are defined over ℚ (6.5).
2. With (γ, δ) = (α, β), the function (6.6.1) is Z(X_x, t) ∈ ℚ(t), since n is odd. By Proposition 6.6, for x ∉ L with deg x divisible by no element of K, the denominator of Z(X_x, t) in lowest terms is ∏(1 − β_j^{deg x}t). So the multiset (β_j^{deg x}) is stable under Gal(ℚ̄/ℚ), and each β_j is algebraic.
3. For σ ∈ Gal(ℚ̄/ℚ), the families (σβ_j) and (β_j) have the same n-th powers for every large n divisible by no element of K, because such n occur as degrees of points outside L (lemma exceptional-frobenius-set-has-density-zero). Lemma 6.7 gives (σβ_j) = (β_j), so ∏(1 − β_j t) ∈ ℚ[t] (6.9).
4. After the β-polynomial is rational, fix a closed point of positive degree e. The polynomial M_x(t)=Z(X_x,t)∏(1−β_j^e t)=∏(1−α_i^e t)det(1−F_x t,ℱ₀) lies in ℚ[t]. Every α_i^e is a reciprocal root of M_x, so every α_i is algebraic. This supplies algebraicity before applying Galois conjugation to the α-family.
5. The polynomials M_x are rational. Proposition 6.8 characterises ∏(1−α_i t) as the lcm of candidate S whose degree-e transforms divide every M_x. For any candidate, one positive-degree point forces each root scalar to be algebraic and an ℓ-adic unit, since M_x has only unit reciprocal roots. Therefore the unit requirement does not break Galois invariance of the intrinsic characterization: a conjugated candidate is again eligible. The α-polynomial is fixed by Gal(ℚ̄/ℚ), hence lies in ℚ[t].
6. Hence det(1 − F_x t, ℱ₀) = Z(X_x, t)·∏(1 − β_j^{deg x}t)/∏(1 − α_i^{deg x}t) ∈ ℚ(t), and being a polynomial it lies in ℚ[t].

Acceptance checks:

- Plane cubics: det(1 − F_x t, ℱ₀) = 1 − a_x t + q_x t², with a_x = q_x + 1 − #E_x(k(x)) ∈ ℤ.

Direct inputs: [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.3/denominators-away-from-the-exceptional-set](#dwp-3-denominators-away-from-the-exceptional-set), [DWP.3/divisibility-criterion](#dwp-3-divisibility-criterion), [DWP.3/powers-of-a-family-determine-the-family](#dwp-3-powers-of-a-family-determine-the-family).

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Théorème (6.2), p. 295; [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, (6.9), p. 297.

Declaration id: `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`.

<a id="dwp-3-coarse-bound-for-the-pencil"></a>

### Weil I Corollary 6.3: the coarse bound on H¹(D, j_*ℱ)

Let j : U → D be the inclusion. Every eigenvalue α of F^* on H¹(D, j_*ℱ) is an algebraic number, and every complex conjugate satisfies q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

This is where DWP.3 meets DWP.2. ℱ₀ satisfies the hypotheses of Theorem 3.2 with β = n: the pairing ψ from radical-quotient-of-the-vanishing-system, open symplectic monodromy (Weil I (5.10), LPV.5), and rational local factors (Theorem 6.2).

Proof or construction:

1. Theorem 3.2's hypotheses hold for ℱ₀ with β = n (Weil I (5.10) and (6.2)).
2. Apply DWP.2/coarse-bound-on-cohomology-of-the-projective-line (Corollary 3.9) with β = n: q^{(n+1)/2 − 1/2} ≤ |α| ≤ q^{(n+1)/2 + 1/2}.

Acceptance checks:

- Plane cubics (n = 1): the eigenvalues on H¹(D, j_*ℱ) satisfy q^{1/2} ≤ |α| ≤ q^{3/2}.

Direct inputs: [DWP.3/rationality-of-pencil-local-factors](#dwp-3-rationality-of-pencil-local-factors), [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.2/fundamental-estimate-theorem-3-2](#dwp-2-fundamental-estimate-theorem-3-2), [DWP.2/coarse-bound-on-cohomology-of-the-projective-line](#dwp-2-coarse-bound-on-cohomology-of-the-projective-line), `LefschetzPencilsAndVanishingCycles:LPV.5`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §6, Corollaire (6.3), p. 295.

Declaration id: `DeligneWeightsAndPurity:DWP.3/coarse-bound-for-the-pencil`.

## DWP.4 — Weil I: dimension induction and tensor-power removal of the error

<a id="dwp-4-middle-cohomology-half-unit-bound"></a>

### The half-unit bound in even dimension

Let X₀ be smooth projective of pure even dimension d over 𝔽_q, ℓ ≠ char 𝔽_q. Every eigenvalue α of geometric Frobenius on Hᵈ(X,ℚ_ℓ) is algebraic; every complex conjugate satisfies q^(d/2−1/2) ≤ |α| ≤ q^(d/2+1/2). No semisimplicity or degeneration of Leray is required. The induction retains E∩E⊥ and covers zero vanishing cycles, a zero radical quotient, and a nonzero quotient.

Atlas landmark: **Half-unit bound**.

Proof or construction:

1. Induct on even d, beginning with dimension zero. After a finite extension choose a pencil, a rational smooth fibre and a smooth hyperplane section Y of that fibre; make exceptional values and vanishing-cycle signs rational. Transfer inequalities back using Frobenius powers and the base-extension weight comparison.
2. Pullback from X to its blowup along the pencil axis is injective. The degree-d Leray filtration has graded subquotients of A=H²(ℙ¹,R^(d−2)f_*ℚ_ℓ), B=H⁰(ℙ¹,Rᵈf_*ℚ_ℓ), C=H¹(ℙ¹,R^(d−1)f_*ℚ_ℓ). This filtration suffices without any degeneration assertion.
3. Write n=d−1=2m+1. In the nonzero vanishing-cycle case the outer sheaves are geometrically constant. Weak Lefschetz and its Gysin transpose identify A with H^(d−2)(Y)(−1) and make B a quotient of it. Their eigenvalues have exact modulus q^(d/2) by induction.
4. In the zero-cycle case B is an extension of the same constant-fibre term by skyscrapers ℚ_ℓ(m−n)=ℚ_ℓ(−d/2); C vanishes because Rⁿ is geometrically constant. Make the skyscrapers rational after extension, so their eigenvalues are q^(d/2).
5. For nonzero cycles with E/rad ≠0, sequences (7.1.2) and (7.1.3) give a surjection H¹(j_*E)→C and an injection H¹(j_*E)→H¹(j_*(E/rad)); H¹ of the geometrically constant factors on ℙ¹ vanishes. Apply the pencil coarse bound.
6. If E⊂E⊥, retain (7.1.4) and (7.1.5): C injects into H¹(G), a quotient of the singular-fibre skyscraper sections ℚ_ℓ(−d/2). Thus all cases give the interval. Algebraicity and all conjugates pass through extensions, subquotients and finite-field descent.

Acceptance checks:

- For d=0, Frobenius permutes geometric points and its eigenvalues are roots of unity.
- A quadric surface pencil has E=0 and singular-fibre ℚ_ℓ(−1) terms; these give weight 2 rather than disappearing.

Direct inputs: [DWP.3/coarse-bound-for-the-pencil](#dwp-3-coarse-bound-for-the-pencil), [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.4`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Lemme (7.1) and (7.1.1)–(7.1.5), pp. 298–300.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-half-unit-bound`.

<a id="dwp-4-middle-cohomology-purity"></a>

### Purity in the middle degree

For smooth projective X₀ of any pure dimension d over 𝔽_q, every geometric-Frobenius eigenvalue on Hᵈ(X,ℚ_ℓ) is a Weil q-number of weight d.

Atlas landmark: **Middle cohomology purity**.

Proof or construction:

1. For every positive even k, Künneth exhibits αᵏ as an eigenvalue on H^(kd)(Xᵏ). Apply the even-dimensional half-unit theorem to get q^(d/2−1/(2k))≤|α|≤q^(d/2+1/(2k)).
2. Algebraicity of αᵏ implies algebraicity of α; each embedding of ℚ(α) restricts to one of ℚ(αᵏ), so the inequalities hold for every conjugate. Take arbitrarily large even k to get equality.

Acceptance checks:

- A nonsemisimple Frobenius operator is permitted: Künneth uses characteristic roots, not eigenbases.
- Only even k are used; odd-dimensional X is therefore included.

Direct inputs: [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §7, Théorème (7.2), (7.3), p. 300.

Declaration id: `DeligneWeightsAndPurity:DWP.4/middle-cohomology-purity`.

<a id="dwp-4-smooth-projective-purity"></a>

### The Weil theorem for smooth projective varieties

For every smooth projective X₀ over 𝔽_q and every i≥0, each eigenvalue of geometric Frobenius on Hⁱ(X,ℚ_ℓ) is a Weil q-number of weight i. This is Weil I Lemma 1.7; integral cohomological factors and their ℓ-independence are exported to WC.3 rather than proved again here.

Atlas landmark: **Weil purity theorem**.

Proof or construction:

1. After finite base extension split the finitely many geometric connected components and work with pure dimension on each. Recover the original eigenvalues from their powers.
2. By Poincaré duality it suffices to handle i≤d. For i<d, successive smooth hyperplane sections and weak Lefschetz inject degree i into the middle cohomology of a smooth projective section of dimension i. Apply middle purity; duality supplies degrees above d.

Acceptance checks:

- H^(2r)(ℙᴺ)=ℚ_ℓ(−r), with eigenvalue qʳ and weight 2r; odd degrees vanish.
- Components not defined over 𝔽_q are handled by permutation Frobenius before any point-count main term is identified.
- Smooth proper nonprojective varieties require DWP.7; this theorem asserts projectivity.

Direct inputs: [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `EtaleDualityAndPerverseSheaves:EDC.4`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §1, Lemme (1.7), p. 276; §7 (7.2)–(7.3), p. 300.

Declaration id: `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`.

## DWP.5 — Weil II local weights and the analytic preparation

<a id="dwp-5-weil-group"></a>

### The Weil group of a finite-field scheme

For connected X₀/𝔽_q with geometric point x, let W(X₀,x)=π₁(X₀,x)×_{Gal(𝔽̄_q/𝔽_q)}ℤ, where 1∈ℤ maps to geometric Frobenius. Its topology makes the geometric kernel open with its profinite topology and the degree quotient discrete. For geometrically connected X₀ the sequence 1→π₁(X,x)→W(X₀,x)→ℤ→0 is exact. A closed-point geometric Frobenius has degree +deg(x). This degree is the negative of the arithmetic coordinate in Weil I §6.

Atlas landmark: **Weil group**.

The design is used in:

- DeligneWeightsAndPurity:DWP.5/weil-sheaf: distinguishes Weil descent from continuous Galois descent.
- DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution: labels the actual degree fibres.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.WeilGroup` | constructor | The topological pullback group with its projection to π₁ and its geometric-degree homomorphism to ℤ. |
| `TauCeti.Weights.WeilGroup.degree` | projection | The integer degree of a Weil element. |
| `TauCeti.Weights.WeilGroup.geometricKernel` | characterisation | The degree-zero subgroup is the geometric fundamental group for geometrically connected X₀. |
| `TauCeti.Weights.WeilGroup.frobenius_degree` | simp | The local geometric Frobenius has degree deg(x). |
| `TauCeti.Weights.WeilGroup.baseExtension` | functoriality | Over 𝔽_(qᵃ), the Weil group is the subgroup of degrees divisible by a, with the new degree divided by a. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weilGroup_point` | compatibility | For Spec 𝔽_q, W=ℤ with degree the identity and trivial geometric kernel. |
| `TauCeti.Weights.weilGroup_degree_sign` | non-example | A local geometric Frobenius of degree e has Weil II degree e and Weil I arithmetic coordinate −e. |
| `TauCeti.Weights.weilGroup_base_extension_two` | computation | For Spec 𝔽_(q²) over 𝔽_q, arithmetic degrees lie in 2ℤ; degree-one relative Frobenius maps to degree 2. |

Proof or construction:

1. Use the arithmetic/geometric fundamental sequence supplied by IG.1 and form the group pullback with geometric Frobenius powers. Give each degree coset the translated profinite topology.
2. Restriction from 𝔽_q to 𝔽_p changes the Frobenius generator and the degree by the extension degree; distinguish the corresponding Weil groups rather than identifying their degrees.

Acceptance checks:

- The map to arithmetic π₁ is injective, but the subspace profinite topology on its image is not the Weil topology.

Direct inputs: `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `mathlib:MonoidHom.eqLocus`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1 (1.1.7)–(1.1.13.1), pp. 150–153.

Declaration id: `DeligneWeightsAndPurity:DWP.5/weil-group`.

<a id="dwp-5-weil-sheaf"></a>

### Weil sheaves and étale descent

A constructible Weil sheaf on X₀/𝔽_q is a constructible ℚ̄_ℓ-sheaf on X=X₀×𝔽̄_q together with compatible Weil descent isomorphisms; equivalently an isomorphism F*ℱ≅ℱ for the chosen geometric-Frobenius descent action. For a lisse sheaf on connected X this is a continuous finite-coefficient-model representation of W(X₀,x). An ordinary étale sheaf requires extension of that representation to continuous π₁(X₀,x); a Frobenius isomorphism alone does not ensure it. On a point a rank-one Weil action with scalar b descends étale exactly when b is an ℓ-adic unit.

The design is used in:

- DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness: the coefficient objects on which weights are defined.
- DeligneWeightsAndPurity:DWP.5/rank-one-normalization: real twists may be Weil lines without a specified étale realization.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.WeilSheaf` | data | A geometric constructible sheaf with Weil descent data. |
| `TauCeti.Weights.WeilSheaf.frobenius` | projection | The invertible action on every closed-point stalk, up to conjugacy. |
| `TauCeti.Weights.WeilSheaf.ofEtale` | constructor | Restrict an étale sheaf to Weil descent. |
| `TauCeti.Weights.WeilSheaf.etaleDescent_iff` | characterisation | Étale descent means extension to a continuous arithmetic fundamental-group representation. |
| `TauCeti.Weights.WeilSheaf.pullback` | functoriality | Pull back descent along an 𝔽_q-morphism, preserving identity and composition. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.weilSheaf_nonunit` | non-example | On Spec 𝔽_q the scalar ℓ defines a Weil line which has no étale descent. |
| `TauCeti.Weights.weilSheaf_constant` | computation | The constant line with Frobenius 1 descends étale. |
| `TauCeti.Weights.weilSheaf_tate` | compatibility | For ℓ≠p the Tate line has geometric scalar q⁻¹ and agrees with EDC.0, hence descends étale. |

Proof or construction:

1. Import the genuine constructible sheaf and coefficient-lattice categories from SF.2/EDC.0, and equip geometric sheaves with descent isomorphisms satisfying the cocycle law.
2. Apply the lisse fibre/representation equivalence. A continuous profinite image is compact; on a point this gives the unit criterion, and the compact closure of the cyclic unit action gives the converse.

Acceptance checks:

- No ambient topology on ℚ̄_ℓ replaces the explicit finite E/ℚ_ℓ model.

Direct inputs: [DWP.5/weil-group](#dwp-5-weil-group), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `ArithmeticGaloisRepresentations:R01.6`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1 (1.1.6), (1.1.10)–(1.1.14), pp. 150–153.

Declaration id: `DeligneWeightsAndPurity:DWP.5/weil-sheaf`.

<a id="dwp-5-punctual-purity-and-mixedness"></a>

### Punctual purity and finite mixed filtrations

Let ℓ be prime and X be of finite type over ℤ[1/ℓ]; use constructible ℚ̄_ℓ-sheaves, or Weil sheaves when X is over a finite field. Punctual purity of integer weight n requires every geometric-Frobenius eigenvalue at each closed point x to be a Weil N(x)-number of weight n. Fixed-ι punctual purity of real weight β uses |ια|=N(x)^(β/2). Mixedness, respectively ι-mixedness, means existence of a finite filtration by subsheaves with pure, respectively ι-pure, successive quotients. Actual weights are the weights of nonzero quotients; the zero sheaf has no actual weights. Bounds ≤b or ≥b apply to these actual weights. Weight classes modulo ℤ are real weights in ℝ/ℤ; the canonical decomposition into those classes belongs to DWP.8.

Atlas landmark: **Pure and mixed sheaves**.

The design is used in:

- DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions: the common predicates on schemes over ℤ[1/ℓ].
- DeligneWeightsAndPurity:DWP.6/sharp-curve-purity: states the real-weight theorem.
- PadicDifferentialEquationsAndRigidCohomology:RD.6: imports only numeric predicates; its F-isocrystal stalk category remains its own.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.IsPunctuallyPure` | data | Integer purity at all closed stalks. |
| `TauCeti.Weights.IsPunctuallyIotaPure` | data | Real purity at all closed stalks for a specified coefficient isomorphism ι. |
| `TauCeti.Weights.IsMixed` | data | Existence of a finite integer-pure subsheaf filtration. |
| `TauCeti.Weights.IsIotaMixed` | data | Existence of a finite real-ι-pure subsheaf filtration. |
| `TauCeti.Weights.punctualWeights` | data | The finite set of actual weights of nonzero graded pieces. |
| `TauCeti.Weights.pure_zero` | simp | The zero sheaf is pure of every weight and has empty actual weight set. |
| `TauCeti.Weights.pure_subquotient` | functoriality | Subsheaves and quotient sheaves of a pure sheaf are pure of the same weight. |
| `TauCeti.Weights.mixed_extension` | compatibility | An extension of mixed sheaves is mixed; actual weights form the union. |
| `TauCeti.Weights.pure_tensor` | compatibility | Tensor products add weights; lisse duals negate them. |
| `TauCeti.Weights.pure_tateTwist` | compatibility | Twisting by r∈ℤ subtracts 2r. |
| `TauCeti.Weights.pure_pullback_finitePushforward` | functoriality | Pullback and finite direct image preserve purity, with residue-degree powers of Frobenius included. |
| `TauCeti.Weights.mixed_iff_finite_filtration` | characterisation | Mixedness is precisely a finite subsheaf filtration with pure quotients, with no strictness or canonical splitting built into the predicate. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.punctual_tate_line` | computation | ℚ̄_ℓ(1) is pure of weight −2. |
| `TauCeti.Weights.punctual_zero_weights` | degenerate | The zero sheaf is pure of every weight, mixed, and has empty actual weight set. |
| `TauCeti.Weights.mixed_two_tate_weights` | non-example | ℚ̄_ℓ⊕ℚ̄_ℓ(−1) on Spec 𝔽_q is mixed with actual weights {0,2}, and is not pure of any weight. |
| `TauCeti.Weights.punctual_jordan` | compatibility | The rank-two unipotent Jordan Frobenius on a point is pure of weight 0 although arithmetic Frobenius is not semisimple. |

Proof or construction:

1. Apply the DWP.0 eigenvalue predicates to the actual closed-point stalk Frobenius. Define mixedness through finite filtrations in the imported abelian sheaf category, without inferring it from pointwise spectral decompositions.
2. Characteristic-polynomial exactness on stalks proves purity stability under subobjects, quotients and extensions. Refine filtrations for mixed stability. Stalk base change, finite pushforward and tensor products give the remaining operations; lisse duals negate weights.

Acceptance checks:

- Every mixed sheaf is ι-mixed for every ι, with the same integer actual weights.
- A finite Frobenius module on a point is automatically ι-mixed; this is not an automatic global filtration theorem.

Direct inputs: [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.0/endomorphism-weights](#dwp-0-endomorphism-weights), [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2 (1.2.2)–(1.2.8), pp. 153–155.

Declaration id: `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`.

<a id="dwp-5-real-sheaves"></a>

### Totally real and ι-real sheaves

A sheaf is totally real when every closed-point local characteristic polynomial has algebraic totally real coefficients; it is ι-real when those coefficients map into ℝ under the fixed ι. These are coefficient conditions, not assertions that every eigenvalue is real. A pure sheaf of integer weight n is a direct summand of the totally real sheaf ℱ⊕ℱ∨(−n); for real ι-weight β use a rank-one Weil twist of weight 2β in place of the integer Tate normalization.

The design is used in:

- DeligneWeightsAndPurity:DWP.5/generalized-majoration: even tensor trace positivity.
- DeligneWeightsAndPurity:DWP.6/sharp-curve-purity: real envelope of an external-product system.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.IsTotallyReal` | data | All local polynomial coefficients are algebraic and totally real. |
| `TauCeti.Weights.IsIotaReal` | data | All local polynomial coefficients become real under ι. |
| `TauCeti.Weights.totallyReal_iotaReal` | compatibility | Total reality implies ι-reality for every ι. |
| `TauCeti.Weights.pure_real_envelope` | constructor | The reciprocal-normalized dual direct sum of a pure sheaf is real and contains the original as a direct summand. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.real_nonreal_roots` | non-example | A point module with polynomial T²−T+2 is totally real, although its roots are nonreal. |
| `TauCeti.Weights.real_zero` | degenerate | The zero object has local polynomial 1 and is totally real. |
| `TauCeti.Weights.real_envelope_line` | computation | A pure weight-zero line with scalar (3+4i)/5 has real envelope polynomial T²−(6/5)T+1. |

Proof or construction:

1. Complex conjugation sends a weight-n eigenvalue α to N(x)ⁿ/α. Add the reciprocal-normalized dual spectrum to obtain conjugation-invariant local polynomials for every embedding.
2. For fixed ι and real β use the chosen Weil line with local eigenvalue N(x)^β, not an integer Tate twist when β is not integral.

Acceptance checks:

- ι-real is weaker than totally real. The direct-summand construction preserves the original sheaf.

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.0/reciprocal-pairing-of-eigenvalues](#dwp-0-reciprocal-pairing-of-eigenvalues).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2 (1.2.12)–(1.2.14), pp. 155–156.

Declaration id: `DeligneWeightsAndPurity:DWP.5/real-sheaves`.

<a id="dwp-5-rank-one-normalization"></a>

### Finite geometric monodromy and rank-one normalization

For normal geometrically connected X₀/𝔽_q, the image of π₁(X) in the abelianization of W(X₀) is an extension of a finite prime-to-p group by a pro-p group. Consequently every rank-one ℓ-adic Weil representation (ℓ≠p, finite coefficient model) has finite geometric image and is a constant Weil character times a finite-order character; it is punctually ι-pure. An irreducible rank-r system becomes finite-determinant after a rank-one Weil twist. Choosing a twist of arbitrary real weight uses Weil lines and does not assert that it is a motivic Tate twist.

Proof or construction:

1. On a smooth curve use the finite-field idèle/class-field description: the geometric abelian quotient is a finite prime-to-p group times a pro-p group. A compact ℓ-adic image has an open pro-ℓ subgroup. The pro-p part has finite image for p≠ℓ, and the finite part remains finite, so geometric rank-one monodromy is finite.
2. For normal higher-dimensional X choose a curve surjecting onto the relevant fundamental group and specialize a relative curve using the uniform lattice monodromy theorem.
3. A character trivial on the geometric kernel factors through degree. Taking a root of its determinant scalar makes an irreducible determinant finite order. Its constant scalar defines the real weight.

Acceptance checks:

- A constant scalar b over 𝔽_q gives local scalar b^(deg x); normalizing over 𝔽_p instead gives b^a at q=pᵃ.
- Finite determinant does not itself prove the conjectural purity statement (1.2.10)(i).

Direct inputs: [DWP.5/weil-group](#dwp-5-weil-group), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `FunctionFieldArithmetic:FA.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 (1.3.1), (1.3.4), (1.3.6); §1.11 (1.11.4), pp. 156–158, 184–185.

Declaration id: `DeligneWeightsAndPurity:DWP.5/rank-one-normalization`.

<a id="dwp-5-determinantal-weights"></a>

### Determinantal weights of irreducible constituents

For a lisse Weil sheaf on normal connected X₀, an irreducible constituent ℱ of rank r has determinantal ι-weight β when det ℱ is punctually ι-pure of weight rβ. The determinantal-weight multiset of any lisse sheaf lists these β with constituent multiplicities. It is independent of a Jordan–Hölder filtration. It is not the multiset of all stalk weights until purity of constituents has been proved.

Atlas landmark: **Determinantal weights**.

The design is used in:

- DeligneWeightsAndPurity:DWP.5/generalized-majoration: converts determinantal upper bounds into punctual bounds.
- DeligneWeightsAndPurity:DWP.5/local-monodromy-purity: normalizes real weights without presupposing purity.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.determinantalWeight` | data | For an irreducible of rank r>0, the determinant weight divided by r. |
| `TauCeti.Weights.determinantalWeights` | data | The multiset of determinantal weights of irreducible constituents. |
| `TauCeti.Weights.determinantalWeight_det` | characterisation | The determinant is pure of weight r times the determinantal weight. |
| `TauCeti.Weights.determinantalWeights_exact` | compatibility | The multiset for an extension is the sum of those of its subobject and quotient. |
| `TauCeti.Weights.determinantalWeights_twist` | functoriality | A rank-one twist of weight c adds c to every determinantal weight. |
| `TauCeti.Weights.determinantalWeight_pure` | compatibility | For an irreducible punctually pure sheaf of weight β, its determinantal weight is β. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.detWeight_tate` | computation | The Tate line ℚ̄_ℓ(r) has determinantal weight −2r. |
| `TauCeti.Weights.detWeight_zero` | degenerate | The zero sheaf has empty determinantal-weight multiset. |
| `TauCeti.Weights.detWeight_rank_divisor` | non-example | A rank-two pure system of weight 1 has determinant weight 2 and determinantal weight 1, not 2. |

Proof or construction:

1. Rank-one normalization gives a unique real weight for det ℱ; divide it by positive rank. Jordan–Hölder uniqueness gives independence of the multiset.
2. Jordan–Hölder factors of an extension are the union of those of its subobject and quotient. A rank-one twist multiplies the rank-r determinant by its rth power, adding the twist weight to the normalized determinantal weight. For a pure constituent, tensor spectra identify the determinant weight as r times the punctual weight.

Acceptance checks:

- Vanishing sheaves have the empty multiset; division by rank occurs only for nonzero irreducibles.

Direct inputs: [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 (1.3.5), (1.3.12)–(1.3.13), pp. 158–160.

Declaration id: `DeligneWeightsAndPurity:DWP.5/determinantal-weights`.

<a id="dwp-5-geometric-monodromy-and-central-degree"></a>

### Unipotent radical and central degree in Weil monodromy

For a lisse finite-model Weil system on normal geometrically connected X₀, let G_geom be the Zariski closure of geometric monodromy and G the algebraic-by-discrete extension G_geom⋊ℤ induced by a degree-one lift. The radical of G_geom° is unipotent. If the system is semisimple as a Weil representation, its geometric restriction is semisimple and G_geom° is semisimple. Then degree on Z(G) has finite kernel and image of finite index in ℤ. For a central g of degree m≠0, the spectrum on the determinantal-weight-β constituent has |ια|=q^(mβ/2). Every irreducible Weil system becomes an étale system after a rank-one Weil twist.

Proof or construction:

1. Grothendieck: characters of the radical in the adjoint monodromy action have finite orbit; determinant characters of constituents of its weight spaces have finite geometric image by the rank-one theorem, forcing the radical torus to vanish.
2. Semisimple restriction to a normal subgroup and complete reducibility make geometric monodromy reductive, so its connected radical is trivial. Import the reductive-group central-degree criterion: faithful finite-kernel representations, finite outer automorphism group and centralizer of the derived group.
3. Schur gives a central scalar on each irreducible; the determinant determines its absolute value. For étale descent use the compact normalizer modulo the semisimple geometric group (1.3.15), and normalize the degree scalar to an ℓ-adic unit.

Acceptance checks:

- Arithmetic Frobenius semisimplicity is a hypothesis here, and is not inferred from purity.
- G is an extension by ℤ, not a finite-type algebraic group with infinitely many components.

Direct inputs: [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.5/determinantal-weights](#dwp-5-determinantal-weights), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `ArithmeticGaloisRepresentations:R01.6`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.3 (1.3.7)–(1.3.15), pp. 158–161.

Declaration id: `DeligneWeightsAndPurity:DWP.5/geometric-monodromy-and-central-degree`.

<a id="dwp-5-generalized-majoration"></a>

### Deligne’s generalized majoration theorem

For a normal connected X₀ of finite type over 𝔽_q, the irreducible constituents of a lisse ι-real sheaf are punctually ι-pure. More precisely, on a smooth curve let r be its maximal determinantal weight; every stalk eigenvalue has ι-weight ≤r, and each irreducible constituent of determinantal weight β is punctually pure of weight β. No open symplectic-image or rational-coefficient hypothesis is imposed.

Atlas landmark: **Generalized majoration theorem**.

Proof or construction:

1. Reduce to curves using fundamental-group Bertini and normality. On the curve take even tensor powers; ι-real traces have nonnegative even powers, so local factors have nonnegative real coefficients.
2. The H²_c coinvariant formula and determinantal tensor weights put global poles at weights ≤2kr+2. Compare the local-factor pole radii to obtain w(α)≤r+1/k, then let k increase.
3. For the constituent of weight β take the exterior power of degree N+1, where N is the sum of ranks of constituents with larger determinantal weights. Its determinantal upper bound forces each eigenvalue of this constituent to have weight ≤β; the determinant has average β, so all weights are β.

Acceptance checks:

- The real envelope of a pure sheaf recovers its constituent purity without changing the original object.

Direct inputs: [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.5/determinantal-weights](#dwp-5-determinantal-weights), [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.2/positive-local-factors](#dwp-2-positive-local-factors), [DWP.2/poles-of-positive-products](#dwp-2-poles-of-positive-products), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `EtaleDualityAndPerverseSheaves:EDC.2`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.5 Théorème (1.5.1), Proposition (1.5.2), Corollaire (1.5.3), pp. 163–165.

Declaration id: `DeligneWeightsAndPurity:DWP.5/generalized-majoration`.

<a id="dwp-5-initial-curve-and-boundary-bounds"></a>

### Initial cohomological and boundary weight bounds

For j:U₀→C₀ with C₀ smooth projective over 𝔽_q and ℱ lisse punctually ι-pure of real weight β, boundary eigenvalues of j_*ℱ have ι-weight ≤β, and those on H¹_c(U,ℱ) have weight ≤β+2. These initial non-strict bounds precede the strict analytic bound and the sharp curve theorem.

Proof or construction:

1. Normalize β to zero by a real Weil twist and embed in a real envelope. Generalized majoration, H⁰ invariants and H²_c coinvariants give the coarse compact-cohomology bound using the Euler product in its disc of absolute convergence.
2. Apply the tensor-power trick to boundary sections using invariants and their embedding into tensor invariants: the fixed additive error tends to zero, giving boundary weights ≤β.

Acceptance checks:

- The bound ≤β+2 is deliberately non-strict; the strict bound comes from (2.2.10).

Direct inputs: [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.2/radius-of-convergence-of-positive-products](#dwp-2-radius-of-convergence-of-positive-products), `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.8 Propositions (1.8.1)–(1.8.2), pp. 171–173.

Declaration id: `DeligneWeightsAndPurity:DWP.5/initial-curve-and-boundary-bounds`.

<a id="dwp-5-local-monodromy-purity"></a>

### The local weight–monodromy theorem on a curve

Let U₀ be a smooth curve over 𝔽_q and ℱ lisse punctually ι-pure of real weight β. At a missing point of its smooth completion take the local Weil representation V and the monodromy filtration M centered at zero after the quasi-unipotent inertia reduction. Then GrᵢᴹV is pure of weight β+i relative to the residue cardinality. With N:V→V(−1), geometric F satisfies FNF⁻¹=q_x⁻¹N in untwisted coordinates. The inertia invariants have only weights ≤β. This is an equal-characteristic curve theorem.

Atlas landmark: **Local weight–monodromy theorem**.

Proof or construction:

1. Pass to a finite cover killing the finite inertia part and use the supplied nilpotent logarithm and SL₂/primitive monodromy-filtration description. Normalize β to zero.
2. For the primitive summand P_(−j), the boundary bound says weights ≤0. Clebsch–Gordan puts α²q_xʲ in P₀ of V⊗V, so w(α)≤−j. Apply the same reasoning to the dual, whose primitive eigenvalue is α⁻¹q_x⁻ʲ, to get the opposite inequality.
3. Recover all graded weights using the monodromy strings and twist signs. Descend along the finite cover: powers of Frobenius preserve relative weights, and roots of unity do not change them.

Acceptance checks:

- For a two-step nodal string with center β=1 the grades have weights 0 and 2 and N maps Gr₁ to Gr₋₁(−1).
- This asserts no mixed-characteristic weight–monodromy theorem for varieties over p-adic fields.

Direct inputs: [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), `LefschetzPencilsAndVanishingCycles:LPV.1`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.7 (1.7.1)–(1.7.12), §1.8 Théorème (1.8.4), pp. 169–176.

Declaration id: `DeligneWeightsAndPurity:DWP.5/local-monodromy-purity`.

<a id="dwp-5-local-weight-corollaries"></a>

### Boundary mixedness and extension of purity

For an ι-mixed local system on a smooth curve, the relative monodromy filtration exists and agrees with the local weight filtration on pure graded pieces. Along a smooth divisor, the relative construction is lisse and compatible with transverse curves and fibres under the tame hypotheses of (1.8.6)–(1.8.7). For an open immersion of finite-type 𝔽_q schemes, underived j_* takes ι-mixed sheaves with weights ≤β to ι-mixed sheaves with weights ≤β. A lisse sheaf pure on a dense open is pure everywhere; on normal X a lisse ι-mixed sheaf has a finite filtration by lisse pure sheaves. On connected X an ι-mixed lisse sheaf pure of weight β at one closed point is pure of weight β everywhere.

Proof or construction:

1. Use the pure local theorem and the supplier’s uniqueness and tensor compatibility of relative monodromy filtrations; restrict to transverse curves to identify divisor grades.
2. For j_* mixedness dévissage the support, normalize, take finite covers to arrange tame behavior, and use the boundary-invariant theorem at generic divisors; no Rj_* bound is claimed.
3. Apply the dense-open upper bound to both a sheaf and its dual to get equality. On normal X extend the generic pure constituent filtration by j_* and intersect with the original lisse sheaf. Ranks of the graded pieces are constant on a connected base, giving the one-point purity criterion.

Acceptance checks:

- The extension statement concerns underived j_*; it is not the six-operation weight theorem.
- For a divisor finite étale over the base these grades commute with specialization as needed by DWP.7.

Direct inputs: [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `LefschetzPencilsAndVanishingCycles:LPV.1`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.8 Corollaires (1.8.5)–(1.8.12), pp. 176–179.

Declaration id: `DeligneWeightsAndPurity:DWP.5/local-weight-corollaries`.

<a id="dwp-5-stalk-newton-polygon"></a>

### Newton polygons of Frobenius stalks

Fix a rational-valued additive nonarchimedean valuation v on the coefficient algebraic closure normalized by v(p)=1. For a rank-r closed stalk at x with geometric Frobenius eigenvalues α₁,…,αᵣ, let s₁≤…≤sᵣ be v(αᵢ)/v(N(x)), counted with multiplicity. Its Newton polygon has vertices (k,Σ_{i≤k}sᵢ), k=0,…,r, and linear interpolation. Equivalently the kth ordinate is the minimum normalized valuation of products of k distinct eigenvalue positions, the spectrum of the kth exterior power. This is the stalk specialization of the general Newton-polygon convention, not a new p-adic cohomology theory.

The design is used in:

- DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds: states specialization and the nilpotence bound.
- PadicDifferentialEquationsAndRigidCohomology:RD.6: shares normalized slope conventions without duplicating F-isocrystals.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.stalkNewtonPolygon` | constructor | The cumulative-slope polygon normalized by v(N(x)). |
| `TauCeti.Weights.stalkNewtonPolygon_zero` | simp | The origin is (0,0); rank zero has the single origin. |
| `TauCeti.Weights.stalkNewtonPolygon_endpoint` | characterisation | The endpoint is (r,v(det F_x)/v(N(x))). |
| `TauCeti.Weights.stalkNewtonPolygon_exterior` | characterisation | The kth ordinate is the minimum normalized valuation of kth exterior eigenvalues. |
| `TauCeti.Weights.stalkNewtonPolygon_baseExtension` | compatibility | Finite residue-field extension leaves the polygon unchanged. |
| `TauCeti.Weights.stalkNewtonPolygon_tateTwist` | compatibility | Twisting by a adds −a to every normalized slope. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.newton_two_slopes` | computation | The point module diag(1,q) has vertices (0,0),(1,0),(2,1). |
| `TauCeti.Weights.newton_empty` | degenerate | Rank zero has only (0,0). |
| `TauCeti.Weights.newton_base_extension` | compatibility | Replacing diag(1,q) by diag(1,q²) over 𝔽_(q²) retains slopes 0,1, not 0,2. |

Proof or construction:

1. Order the finite multiset of normalized slopes, take cumulative sums, and interpolate. The exterior-power spectrum supplies the minimum-product characterization, including repeated eigenvalues and k=0.

Acceptance checks:

- Frobenius powers and the residue-cardinality powers cancel in normalized slopes.

Direct inputs: [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), `mathlib:AddValuation`, `mathlib:Multiset.sort`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.6), pp. 181–182.

Declaration id: `DeligneWeightsAndPurity:DWP.5/stalk-newton-polygon`.

<a id="dwp-5-nonarchimedean-boundary-bounds"></a>

### Nonarchimedean bounds at the boundary

Fix an embedding ι of the coefficient field into an algebraically closed nonarchimedean valued field of characteristic zero. For a lisse Weil sheaf on a smooth curve, a normalized nonarchimedean bound b^(deg x)≤|ια|≤c^(deg x) at closed points extends to every eigenvalue of its local boundary Weil representations. Generic ℓ′-adic units remain units at the boundary. For valuations with v(p)>0, if almost all stalk Newton polygons agree, the boundary polygon lies on or above that polygon with the same endpoint. If local normalized slopes lie in [β,γ], N^(⌊γ−β⌋+1)=0.

Proof or construction:

1. The upper bound for j_* follows from the analytic local-factor/boundary argument applied to an absolute value, as in (1.10.1). Extend from invariants to all monodromy strings using |q|≤1; use the dual for the lower bound.
2. Use exterior powers to turn all cumulative-slope inequalities into the absolute-value inequalities. Rank-one determinant normalization fixes the endpoint.
3. N lowers the normalized Frobenius slope by one; a string longer than γ−β cannot fit in the allowed interval.

Acceptance checks:

- A split ordinary rank-two module has slopes 0,1; specialization can give slopes 1/2,1/2, whose polygon lies above the ordinary one.
- Unit bounds are a separate nonarchimedean statement; real purity alone does not imply them.

Direct inputs: [DWP.5/stalk-newton-polygon](#dwp-5-stalk-newton-polygon), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.10 (1.10.1)–(1.10.9), pp. 180–183.

Declaration id: `DeligneWeightsAndPurity:DWP.5/nonarchimedean-boundary-bounds`.

<a id="dwp-5-specialization-of-monodromy"></a>

### Specialization of geometric monodromy

Let f:X→S be smooth with geometrically connected curve fibres, S reduced irreducible with generic point η, and g:S→X a section. For a lisse ℤ_ℓ-sheaf ℱ, after shrinking S to a nonempty open there is, simultaneously for every n, a lisse subgroup of Aut(g*ℱ/ℓⁿ) whose stalk is the image of the geometric fibre fundamental group. If f has a smooth proper curve compactification with boundary finite étale over S, the image is locally constant without further shrinking under the stated tame conditions; the inertia images at sections of the boundary specialize compatibly. The extension (1.11.5) covers finite-type families after stratification and dévissage, with the model and the locally constant image conditions kept explicit.

Proof or construction:

1. At finite level construct the finite étale cover representing the kernel. One finite shrinking handles the first level and the tame ramification data.
2. Higher-level kernels in Aut(ℱ/ℓⁿ) are pro-ℓ; their prime-to-p ramification and the specialization theorem for tame fundamental groups give one common open valid for all levels, not a separate open for each n.
3. For the general case spread the finite models and stratify; reduce the comparison to relative curves by general hyperplane sections, preserving the finite-level images.

Acceptance checks:

- A different shrinking for each n would not prove the ℓ-adic statement.
- This theorem supplies the higher-dimensional proof of the geometric abelianization result; it uses no direct-image weight theorem.

Direct inputs: `ArithmeticGaloisRepresentations:R01.6`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.11 (1.11.1)–(1.11.5), pp. 183–185.

Declaration id: `DeligneWeightsAndPurity:DWP.5/specialization-of-monodromy`.

<a id="dwp-5-hadamard-de-la-vallee-poussin"></a>

### The abstract Hadamard–de la Vallée-Poussin theorem

Let G be a locally compact extension of Γ=ℤ or ℝ by a compact group G⁰; in the ℤ case the center maps onto a finite-index subgroup of Γ, and in the ℝ case the extension is a product. Fix the norm character ω₁, a countable family of conjugacy classes with norms N_v>1, and absolute convergence of the trivial Euler product for real part >1. Regard L as a function on the representation Riemann surfaces r=ρ⊗ω_s. If it continues meromorphically to real part ≥1 and is holomorphic there except a simple pole at r=ω₁, then it has no zeros on real part 1 except possibly at one representation r=ω₁ε with ε a one-dimensional order-two character. The curve application excludes this exception by the connected double-cover zeta comparison. The norm-character translation is part of the statement, so imaginary twists are not incorrectly assigned separate pole conditions.

Atlas landmark: **Hadamard–de la Vallée-Poussin theorem**.

Proof or construction:

1. For Re(s)>1 expand negative logarithmic derivatives as sums of positive Dirac measures on powers of the local classes. Their boundary orders define an integer-valued functional ν on characters with ν(1)=1, ν(nontrivial)≤0, conjugation invariance and ν(ρ⊗ρ̄)≥0.
2. Use Peter–Weyl approximation and normalized compact Haar to test squares of class functions concentrated near the identity. The positivity relations force ν to be supported on at most one nontrivial quadratic character; import the exact finite 3,4,1 coefficient inequality from the arithmetic Dirichlet-series owner, not its whole application.
3. For a curve the quadratic character defines a connected finite étale double cover. Its zeta function and that of the curve both have a simple pole at t=q⁻¹ by the initial curve Weil estimate. Their ratio rules out the exceptional zero.

Acceptance checks:

- The theorem assumes continuation and the pole data for every relevant irreducible; positivity alone does not manufacture continuation.
- The possible quadratic exception belongs to the abstract theorem and is removed only in its curve application.

Direct inputs: [DWP.1/weil-estimate-for-curves](#dwp-1-weil-estimate-for-curves), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`, `FunctionFieldArithmetic:FA.5`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.1 (2.1.1)–(2.1.9); §2.2 (2.2.9), pp. 185–191, 196–197.

Declaration id: `DeligneWeightsAndPurity:DWP.5/hadamard-de-la-vallee-poussin`.

<a id="dwp-5-compact-weil-form"></a>

### The compact form of Weil monodromy

Let X₀ be a normal geometrically connected scheme over 𝔽_q and G an algebraic-by-ℤ group satisfying Weil II (2.2.4): (a) its algebraic degree-zero kernel G⁰ is an extension of a finite group by a semisimple group; (b) a finite coefficient field E/ℚ_ℓ models G⁰ and the geometric Weil-group homomorphism is continuous and Zariski dense; (c) an algebraic representation gives an ι-mixed Weil sheaf and its restriction to G⁰ has finite kernel. Fix ι. Write Z_c for the center and choose a maximal compact subgroup U of the complex algebraic quotient G/Z_c. Define G_R as its inverse image in G_ℂ, with discrete degree; its degree-zero kernel is compact. Every local ιF_x has semisimple part conjugate to an element of G_R, uniquely up to G_R conjugacy. Restriction gives an equivalence between algebraic finite-dimensional representations of G and continuous finite-dimensional complex representations of G_R. For an irreducible representation r the associated sheaf is ι-pure of weight 2Re(r), where Re(r) is the source’s central norm exponent (a positive scalar q^(τ deg) has weight 2Re(τ)).

The design is used in:

- DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound: interprets all irreducible Euler factors.
- DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution: defines the measured degree-fibre conjugacy space.

The API exposes the following operations and characterizations.

| Declaration | Role | Specification |
| --- | --- | --- |
| `TauCeti.Weights.compactWeilForm` | constructor | The inverse image of the chosen maximal compact subgroup of the quotient by the central scalars. |
| `TauCeti.Weights.compactWeilForm.geometricKernel` | projection | The compact degree-zero subgroup and its normalized Haar probability. |
| `TauCeti.Weights.compactWeilForm.degree` | projection | The geometric-degree map to ℤ with central weight action retained. |
| `TauCeti.Weights.compactWeilForm.frobeniusClass` | constructor | The compact conjugacy class of the semisimple Frobenius part in its degree fibre. |
| `TauCeti.Weights.compactWeilForm.conjugacy_iff` | characterisation | Two elements of G_R conjugate in G_ℂ are conjugate in G_R. |
| `TauCeti.Weights.compactWeilForm.representationEquivalence` | equivalence | Algebraic representations of G correspond to continuous finite-dimensional representations of G_R, respecting tensor and dual operations. |

Unit tests distinguish the intended object from nearby definitions.

| Test | Kind | Mathematical assertion |
| --- | --- | --- |
| `TauCeti.Weights.compact_constant_weight` | computation | For a constant pure line of weight β, degree n acts by q^(nβ/2) times a unit complex scalar; the degree-zero kernel is trivial. |
| `TauCeti.Weights.compact_elliptic` | compatibility | For full SL₂ geometric monodromy of H¹ of a nonisotrivial elliptic family, G_R is SU(2)×ℤ and (g,n) acts by q^(n/2)g. |
| `TauCeti.Weights.compact_jordan_part` | non-example | A unipotent Jordan arithmetic Frobenius of weight zero contributes its semisimple class 1; its unipotent part is not declared unitary. |

Proof or construction:

1. Use the general maximal-compact/complexification theorem for a semisimple complex group from the reductive and compact-group suppliers; construct the inverse image with the discrete-degree topology.
2. Central-degree scalar magnitudes and generalized majoration determine the eigenvalue moduli in a faithful mixed realization. The Jordan semisimple part can therefore be moved into the compact form.
3. Compact characters separate compact conjugacy classes and extend algebraically across complexification; this proves uniqueness and the representation equivalence, retaining the central scalar exponent.

Acceptance checks:

- The mixed representation with finite kernel on the geometric subgroup is an input; conjecture (1.2.9) is not used to supply it. The geometric subgroup may be disconnected; no faithfulness on the whole degree group is assumed.

Direct inputs: [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.2 (2.2.1)–(2.2.8), pp. 193–196.

Declaration id: `DeligneWeightsAndPurity:DWP.5/compact-weil-form`.

<a id="dwp-5-strict-initial-h1-bound"></a>

### The strict initial H¹ bound

For a smooth curve U₀/𝔽_q and a lisse sheaf punctually ι-pure of real weight β, every eigenvalue on H¹_c(U,ℱ) has ι-weight strictly less than β+2. This bound does not assert β+1; it is the analytic input to the square-improvement argument.

Proof or construction:

1. Normalize β to zero, pass to irreducible constituents and connected geometric monodromy using finite covers and component/base-extension comparisons. The real-envelope majoration constructs the compact form for the required mixed realization.
2. The trace formula gives meromorphic continuation of the representation Euler products. H⁰ and H²_c supply the prescribed trivial poles, and the initial cohomological estimates supply holomorphy to the boundary. Apply abstract Hadamard–de la Vallée-Poussin and exclude the quadratic exception by the connected double cover.
3. Nonvanishing for |t|≤q⁻¹ excludes numerator roots of weight 2; the initial bound already puts them at most 2. Restore the twist to get the strict inequality.

Acceptance checks:

- For a pure weight-zero coefficient, a nonconstant constituent of integer weight <2 has weight ≤1; the integer clause must be proved in the pencil application.

Direct inputs: [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.2 Théorème (2.2.9), Corollaire (2.2.10), pp. 196–197.

Declaration id: `DeligneWeightsAndPurity:DWP.5/strict-initial-h1-bound`.

<a id="dwp-5-abstract-degree-equidistribution"></a>

### Character decay and degree-fibre equidistribution

In the abstract compact-by-ℤ setting, add hypotheses (C) of (2.1.10): all irreducible Euler products are nonvanishing and holomorphic on Re(s)≥1 except the simple trivial norm-character pole; and (D): norms are powers of q. Fix a positive-degree central element z of degree d. The translated, normalized prime-power Dirac measures on degree nd+i conjugacy fibres converge weakly to the pushforward of normalized Haar on the corresponding degree-i fibre. The measures count powers with their degree weights; replacing them with rational-point Frobenius classes requires the actual identity (3.5.2.1).

Proof or construction:

1. Subtract the Haar main term from the negative logarithmic-derivative measure. The trivial factor cancels its unique pole, so its Fourier–Laplace transform extends holomorphically past the convergence boundary.
2. For each nontrivial irreducible character, Cauchy coefficient estimates on a disk of radius greater than one give exponential decay of the normalized degree coefficients after central translation.
3. Use compact-group character density and bounded total mass to pass from characters to continuous class functions. Retain degree residue classes modulo d.

Acceptance checks:

- An average over all degrees does not replace convergence in a fixed degree progression.
- Constant test function 1 verifies mass normalization on each fibre.

Direct inputs: [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin), `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §2.1 (2.1.10)–(2.1.13), pp. 191–193.

Declaration id: `DeligneWeightsAndPurity:DWP.5/abstract-degree-equidistribution`.

## DWP.6 — Pure local systems on curves and the square-improvement argument

<a id="dwp-6-coefficient-specific-vanishing-cycles"></a>

### Vanishing cycles with unipotent boundary coefficients

Let S₀ be a smooth projective surface, D₀ a strict normal-crossings divisor, V₀=S₀−D₀, and ℱ₀ a lisse sheaf on V₀ with unipotent local monodromy along D₀. Choose a pencil satisfying Weil II (3.1.1)(A)–(D), with each exceptional fibre having just one of the three indicated singularities. For j_!ℱ on the blown-up pencil, Φ^a vanishes for a≠1. At an ordinary node outside D, Φ¹=ℱ_x(−1)⊗ε(B), where ε(B) is the sign line on the two branches. At a tangency with D, or a transverse intersection of two branches of D, a locally constant graded boundary filtration gives Gr Φ¹=Gr ℱ_x⊗ε(B), with no Tate twist in these two cases.

Proof or construction:

1. Import blowup injectivity, the pencil Leray filtration, the vanishing-cycle triangle and ordinary nodal calculation from the geometric suppliers. For the node tensor that calculation with the locally constant stalk.
2. For tangency apply Φ to 0→j_!ℚ_ℓ→ℚ_ℓ→ℚ_(ℓ,D)→0; the two nearby points give their reduced permutation sign line in degree one.
3. For crossing use the normalization resolution 0→j_!ℚ_ℓ→ℚ_ℓ→i_*ℚ_(ℓ,D′)→ℚ_(ℓ,x)⊗ε(B)→0. The two smooth terms have no vanishing cycles, leaving the sign line in degree one.
4. Dévissage along a finite locally constant graded filtration of the unipotent coefficient gives the general cases. Preserve the arithmetic branch permutation; the sign line has weight zero.

Acceptance checks:

- The ordinary node raises weight by 2 through (−1); the tangency and crossing do not.
- A Frobenius exchange of branches gives scalar −1 on ε(B), which changes no weight.
- Pencil position hypotheses are explicit, including at most one exceptional point per fibre.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.2`, `LefschetzPencilsAndVanishingCycles:LPV.3`, `LefschetzPencilsAndVanishingCycles:LPV.4`, `EtaleDualityAndPerverseSheaves:EDC.4`, [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.1 (3.1.1)–(3.1.5), pp. 197–200.

Declaration id: `DeligneWeightsAndPurity:DWP.6/coefficient-specific-vanishing-cycles`.

<a id="dwp-6-real-cohomological-factors"></a>

### Reality of curve cohomological factors

If U₀ is a smooth finite-field curve and ℱ₀ is lisse, punctually ι-pure of real weight β and ι-real, then each polynomial ι det(1−tF,Hⁱ_c(U,ℱ)) has real coefficients. Geometric connectedness is unnecessary after component and finite-extension descent.

Proof or construction:

1. The local Euler factors and the trace-formula rational function are real. H²_c has weight β+2, while H¹_c has weights strictly below β+2; thus its pole multiset is exactly the weight-(β+2) denominator roots and is conjugation invariant.
2. For affine components H⁰_c vanishes. For projective components express H⁰ as the dual of H² for ℱ∨(1), which is again pure and real, and obtain a real H⁰ polynomial.
3. The remaining numerator is real. Split geometric components over a finite extension and reassemble with Frobenius permutation as in (0.5); no cancellation between degrees is assumed without the strict bound.

Acceptance checks:

- The conclusion concerns polynomial coefficients, not real eigenvalues.
- Using the final sharp curve theorem here would make the square-improvement proof circular.

Direct inputs: [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.5/real-sheaves](#dwp-5-real-sheaves), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 Proposition (3.2.1), Remarque (3.2.2), p. 200.

Declaration id: `DeligneWeightsAndPurity:DWP.6/real-cohomological-factors`.

<a id="dwp-6-square-improvement"></a>

### Square improvement on the product of a curve

For a smooth finite-field curve U₀ and lisse punctually ι-pure weight-zero ℱ₀, every eigenvalue α of H¹_c(U,ℱ) satisfies w_ι(α)≤1+2^(−k), for every integer k≥0. The step k→k+1 is proved on a pencil in the compactified surface U₀×U₀ and uses the three coefficient-specific vanishing-cycle cases; it is not a direct application of the general direct-image theorem.

Atlas landmark: **Square improvement**.

Proof or construction:

1. The initial bound supplies k=0. A finite surjective smooth curve cover makes boundary monodromy tame unipotent; pullback on compact-support cohomology is injective via the trace map over ℚ_ℓ. Finite base extension arranges general position and rational exceptional values; descend the result.
2. Put ℋ=ℱ⊠ℱ on the open product surface and blow up the pencil axis. Leray in total degree two has terms H²(ℙ¹,R⁰f_!ℋ), H¹(ℙ¹,R¹f_!ℋ), H⁰(ℙ¹,R²f_!ℋ). Blowup pullback is injective and Künneth embeds H¹_c(U,ℱ)⊗H¹_c(U,ℱ) in the abutment.
3. The real envelope ℋ⊕ℋ∨ is pure of weight zero and real. Reality of fibre cohomological polynomials makes the lisse R¹ a direct summand of an ι-real sheaf; generalized majoration supplies its finite pure-constituent filtration. The strict H¹ bound gives all constituent weights <2.
4. The five-term specialization sequence from Φ^a=0 for a≠1 shows R¹ has no sections supported at exceptional values. Intersect its lisse pure filtration with its injection into j_*j*R¹. Every nonconstant graded constituent has a nonzero exceptional quotient somewhere, since otherwise it extends lisse over simply connected ℙ¹ and is geometrically constant.
5. The local monodromy theorem and the three Φ¹ computations make each such nonconstant constituent weight an integer; hence its weight is ≤1. Apply the inductive bound to its H¹. Geometrically constant constituents contribute H¹=0. This bounds the middle Leray term by 2+2^(−k); invariant/coinvariant descriptions bound the two outer terms by 2.
6. The finite Leray filtration transfers the bound to α². Divide by two to get w_ι(α)≤1+2^(−k−1), with no degeneration or semisimplicity assumption.

Acceptance checks:

- The integer-weight step is essential: a real weight <2 need not be ≤1.
- The empty vanishing-cycle case yields a constant constituent and zero H¹, not a failed irreducibility argument.
- No theorem from DWP.7 is used in the proof of its own curve input.

Direct inputs: [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles), [DWP.6/real-cohomological-factors](#dwp-6-real-cohomological-factors), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), `LefschetzPencilsAndVanishingCycles:LPV.3`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.4`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 (3.2.4)–(3.2.14), pp. 201–204.

Declaration id: `DeligneWeightsAndPurity:DWP.6/square-improvement`.

<a id="dwp-6-sharp-curve-purity"></a>

### Purity of parabolic curve cohomology

Let C₀ be a smooth projective finite-field curve, j:U₀→C₀ a dense open, and ℱ₀ lisse and punctually ι-pure of real weight β. For i=0,1,2, every eigenvalue on Hⁱ(C,j_*ℱ) has ι-weight exactly β+i. In degree one this group is the image of H¹_c(U,ℱ)→H¹(U,ℱ). If ℱ is integer-pure for every embedding, the eigenvalues are algebraic Weil q-numbers of weight β+i.

Atlas landmark: **Curve purity theorem**.

Proof or construction:

1. The exact sequence j_!ℱ→j_*ℱ→boundary and square improvement give the upper bound β+1 in degree one by taking all k. The extreme degrees have exact weights β and β+2 from geometric invariants and coinvariants.
2. Apply the upper bound to ℱ∨(1), of weight −β−2. Frobenius-equivariant parabolic Poincaré duality identifies its H¹ eigenvalues with α⁻¹, giving −w_ι(α)≤−β−1. Combine both inequalities.
3. For integer purity run the argument for every embedding. The exact modulus at every complex embedding implies algebraicity and Weil purity by DWP.0’s all-embeddings characterization; the prescribed-embedding extension obligation is retained there. Finite ℓ-adic coefficients alone do not prove algebraicity over ℚ.

Acceptance checks:

- For constant coefficients on a smooth projective genus-g curve, H¹ has weight 1 and dimension 2g.
- For ℚ_ℓ(1) the H¹ weight is −1.
- Purity allows nonsemisimple arithmetic Frobenius.

Direct inputs: [DWP.6/square-improvement](#dwp-6-square-improvement), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/punctual-purity-and-mixedness](#dwp-5-punctual-purity-and-mixedness), `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`, [DWP.0/embeddings-into-the-complex-numbers](#dwp-0-embeddings-into-the-complex-numbers), [DWP.0/weil-number-iff-iota-pure-for-every-iota](#dwp-0-weil-number-iff-iota-pure-for-every-iota).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 Théorème (3.2.3), (3.2.5), (3.2.15), pp. 200–204; [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Proposition 6.1.1 and proof, pp. 42–43.

Declaration id: `DeligneWeightsAndPurity:DWP.6/sharp-curve-purity`.

<a id="dwp-6-compact-support-curve-bound"></a>

### Compact-support bounds for pure curve coefficients

For a smooth finite-field curve U₀ and lisse punctually ι-pure real-weight-β ℱ₀, Hⁱ_c(U,ℱ) has only ι-weights ≤β+i, for i=0,1,2. For integer purity, these are algebraic integer-weight bounds for every complex conjugate. The parabolic image in degree one is pure β+1, while the extra boundary contribution has weights ≤β.

Atlas landmark: **Curve cohomology weight bound**.

Proof or construction:

1. Choose the smooth projective compactification. Local monodromy bounds j_*ℱ at the boundary by β. The exact sequence H⁰(boundary)→H¹_c(U,ℱ)→H¹(C,j_*ℱ) gives the required degree-one upper bound.
2. On affine components H⁰_c=0; on proper components H⁰ is the invariant space of weight β. H²_c is the coinvariant space (−1), of weight β+2. Handle components and finite base extension explicitly.
3. This curve theorem is the input to the geometric dévissage of general Rf_! in DWP.7, whose proof is imported there rather than duplicated here.

Acceptance checks:

- For ℚ_ℓ on 𝔾_m, H¹_c has weight 0 and H²_c has weight 2; H¹_c is not pure of weight 1.
- The result is valid for real ι-weights, not only integral weights.

Direct inputs: [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology`, [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.2 (3.2.3); §3.3 proof of (3.3.1), pp. 200, 204–205.

Declaration id: `DeligneWeightsAndPurity:DWP.6/compact-support-curve-bound`.

## DWP.10 — Arithmetic interfaces and acceptance checks

<a id="dwp-10-weight-transport-to-stable-subquotients"></a>

### Weights on stable arithmetic subquotients

Let (V,F) be a finite-dimensional invertible Frobenius module and let a commuting algebra of correspondences act on V. Every Frobenius-stable correspondence-stable subquotient of a pure weight-w module is pure of weight w; for a mixed module its actual weights are a subset of those of V. Scalar extension preserves and reflects purity, tensor products add pure weights, duals negate them and an integer Tate twist subtracts 2r. A Hecke eigenspace inherits the conclusion only when it is actually Frobenius-stable. This statement does not imply ℓ-independence of a chosen eigenspace.

Atlas landmark: **Weight transport**.

Proof or construction:

1. Use the actual invariant subspace and quotient characteristic-polynomial factorization, without diagonalizing the commuting algebra or Frobenius. Apply the common numeric predicates, which are invariant under coefficient extension.
2. For mixed modules intersect the finite filtration with the subobject and take quotient filtrations; remove zero graded pieces.
3. Apply the tensor/dual/twist spectrum identities. A Hecke eigencondition alone is not a substitute for commutation and Frobenius stability.

Acceptance checks:

- A size-two Jordan block at eigenvalue 1 and its invariant line are both pure weight 0.
- A Hecke-stable line moved by Frobenius is excluded.
- A mixed module diag(1,q) admits a weight-0 stable line and a weight-2 quotient; neither inherits the entire actual weight set.

Direct inputs: [DWP.0/purity-under-subquotients-and-extensions](#dwp-0-purity-under-subquotients-and-extensions), [DWP.0/spectra-of-tensor-products-and-duals](#dwp-0-spectra-of-tensor-products-and-duals), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.0/weight-decomposition](#dwp-0-weight-decomposition).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.2 (1.2.2), (1.2.3), (1.2.6)–(1.2.8), pp. 153–155.

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`.

<a id="dwp-10-compatible-realization-export"></a>

### Compatible degree factors and point counts

For smooth projective X₀/𝔽_q, the WC.3 integral factors Π_i identify the Weil weight-i root multisets across every ℓ≠p, and WC.5 supplies the all-extension point-count estimate. The endpoint for a pure-dimensional scheme with geometric-component permutation σ is c_n(1+q^(nd)), with c_n=#Fix(σⁿ), rather than a universal single q^(nd). To export a compatible stable arithmetic subquotient, supply a normalized rational factor Q(T), independent of ℓ, whose image is exactly its Frobenius factor in every realization. Under that additional hypothesis its roots and weights agree across realizations; purity of the ambient space alone does not construct Q.

Proof or construction:

1. Import the canonical degree-factor theorem from WC.3 and the component-aware bound from WC.5. Use smooth-projective purity only as their weight input, not as a second proof of those owners’ targets.
2. For a supplied rational subquotient factor use the coefficient embeddings and the ambient purity theorem to transfer the common root multiset. Factor identification is an input; no arbitrary Hecke constituent is declared compatible.
3. Track geometric component permutation under each extension, and treat dimension zero by its exact finite-étale cycle formula.

Acceptance checks:

- A degree-two closed point has N_n=2 for even n and 0 for odd n.
- Even a rational ambient polynomial (T²−T+2) can have two different irrational linear subspace factors after splitting; choosing one does not supply a rational compatible factor.

Direct inputs: [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), `WeilConjectures:WC.3/degreewise-pure-factor-extraction`, `WeilConjectures:WC.3/integral-factors-and-ell-independence-from-purity`, `WeilConjectures:WC.5/all-extension-point-count-bound`, `WeilConjectures:WC.5/components-and-dimension-zero`.

Sources: [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Weil I §1 (1.6)–(1.8), pp. 275–277; Weil II §3.3 (3.3.9), p. 207.

Declaration id: `DeligneWeightsAndPurity:DWP.10/compatible-realization-export`.

<a id="dwp-10-finite-residue-semistable-curve-weights"></a>

### Weights in the semistable curve filtration

For a proper semistable curve over a trait with finite residue field, import LPV.7’s Frobenius-equivariant normalization sequence and monodromy filtration of generic H¹ centered at 1. Its graded pieces H¹(Γ), ⊕H¹(Ỹ_v), H₁(Γ)(−1) have weights respectively 0,1,2. The graph may have a Frobenius permutation, and the normalized components may need finite residue-field extension; these change no weight. This is the finite-residue-field curve consequence, not a general mixed-characteristic weight–monodromy theorem.

Proof or construction:

1. The graph groups are subquotients of finite permutation modules, hence have root-of-unity eigenvalues of weight 0. Their (−1) twist has weight 2.
2. Apply initial curve purity to the smooth projective normalization components; after splitting them over a finite extension descend through the power comparison.
3. Import LPV.7’s exact filtration and N-factorization. We supply only Frobenius weights of its graded pieces; do not reconstruct the graph or the general monodromy filtration.

Acceptance checks:

- Split multiplicative genus-one reduction gives gr_0=ℚ_ℓ and gr_2=ℚ_ℓ(−1), weights 0,2, with gr_1=0.
- Good reduction gives only gr_1 of weight 1.
- A nonsplit node has an unramified sign character in the graph pieces; purity is unchanged.

Direct inputs: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), [DWP.0/finite-field-base-extension-of-weights](#dwp-0-finite-field-base-extension-of-weights), [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §1.8 (1.8.4), pp. 175–176; the LPV.7 semistable-curve supplier identifies the three pieces.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`.

<a id="dwp-10-mixed-nearby-and-newton-exports"></a>

### Mixed nearby cycles and Newton restrictions

The arithmetic consumers use the already planned DWP.8 theorem that nearby-cycle cohomology sheaves of a mixed sheaf remain mixed, and its proper direct-image purity over ℤ[1/ℓ]. For an integral weight-w eigenvalue, DWP.7’s Newton couple (r,s) satisfies r+s=w and r,s≥0; its cohomological valuation triangles retain the separate compact-support/proper and smooth ordinary hypotheses. DWP.0 supplies the shared numeric Weil/ι-weight predicates to RD.6; RD.6 supplies its own F-isocrystal fibres and defines pointwise purity and mixedness there.

Proof or construction:

1. Import the existing companion nodes with their exact hypotheses and weight shifts. Do not infer a nearby-cycle weight upper bound from mixedness alone.
2. Apply the numeric root predicate in the p-adic coefficient field via field-homomorphism invariance; a p-adic realization does not create a second Weil-number definition.
3. For ordinary slopes 0,1 of weight-one curve H¹, compute Newton couples (0,1),(1,0). In the supersingular case compute (1/2,1/2).

Acceptance checks:

- The Tate line has weight −2 and slope −1, hence is not an integral coefficient example.
- Mixed nearby cycles need not be pure of a single weight.

Direct inputs: `DeligneWeightsAndPurity:DWP.8/nearby-cycles-preserve-mixedness-6-1-13`, `DeligneWeightsAndPurity:DWP.8/variant-over-z-one-over-ell-6-2-7`, `DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`, `DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8`, [DWP.0/weil-q-number](#dwp-0-weil-q-number), [DWP.0/iota-weight](#dwp-0-iota-weight).

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Weil II §3.3 (3.3.7)–(3.3.8), pp. 206–207; (6.1.13), (6.2.7), pp. 248, 250–251.

Declaration id: `DeligneWeightsAndPurity:DWP.10/mixed-nearby-and-newton-exports`.

<a id="dwp-10-frobenius-equidistribution"></a>

### Deligne’s Frobenius equidistribution theorem

In Weil II §2.2’s algebraic-by-ℤ monodromy setting, let X₀/𝔽_q be normal and geometrically connected of dimension N≥1, with the hypotheses (a)–(c) and compact form G_R of DWP.5 (finite kernel is required on the geometric subgroup). Let G_R^i denote degree-i conjugacy classes with the pushforward of normalized compact Haar. For a central z of positive degree d and fixed i, translate by z^(−n) the measure q^(−(nd+i)N) Σ_(x∈X₀(𝔽_(q^(nd+i)))) δ_[ιF_x,ss]. As n→∞ it converges weakly to Haar on the degree-i conjugacy fibre. The sum is over rational points with Frobenius powers, and normalization uses the base dimension N. This is Weil II (3.5.3), not Weil I’s estimate or density of individual Weil numbers.

Atlas landmark: **Frobenius equidistribution**.

Proof or construction:

1. For every irreducible continuous unitary representation of G_R, the corresponding algebraic representation gives a coefficient sheaf ι-pure of weight zero by the compact-form equivalence. Import DWP.7’s general compact-support bounds and its real-ι variant to continue its Euler product, with no zero or pole to the right of N−1/2 except the simple trivial norm-character pole at N. Normality/geometric connectedness identify the top-degree invariant contribution. Nonunitary central weights must be normalized before this analytic boundary is used.
2. Rescale the norm character to replace the abstract convergence boundary 1 by N and apply the degree-fibre equidistribution theorem.
3. Use (3.5.2.1): a degree-e closed point contributes e rational points when e divides m, each with local Frobenius F_x^(m/e). This identifies prime-power degree measures with the rational-point measure. Retain the central translation and every residue class i modulo d.

Acceptance checks:

- The constant test function has limiting integral 1; q^(−m) is correct only when N=1.
- Dimension zero is excluded: a single constant Frobenius orbit need not become Haar-distributed.
- Only semisimple conjugacy classes enter the measured space.

Direct inputs: [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`, `SchemeAndStackFoundations:SF.2`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.1)–(3.5.3), pp. 210–211.

Declaration id: `DeligneWeightsAndPurity:DWP.10/frobenius-equidistribution`.

<a id="dwp-10-finite-field-sato-tate"></a>

### Finite-field Sato–Tate for elliptic families

Let E₀→C₀ be a smooth elliptic family over a smooth geometrically connected finite-field curve, with nonconstant j-invariant. Import the full SL₂ geometric monodromy theorem of Weil II (3.5.5) from its universal elliptic-family/modular-curve supplier. Then the normalized H¹ Frobenius classes lie in SU(2). Define θ_x∈[0,π] by eigenvalues q^(m/2)e^(±iθ_x) at x∈C₀(𝔽_(q^m)); #E_x(𝔽_(q^m))=1+q^m−2q^(m/2)cos θ_x. The measures q^(−m) Σ_x δ_(θ_x) converge to (2/π)sin²θ dθ. The printed density and point-count sign in (3.5.6)–(3.5.7) are corrected as the confirmed source issues record.

Atlas landmark: **Finite-field Sato–Tate**.

Proof or construction:

1. Import elliptic-family full geometric monodromy, including the level structure, finite-index fundamental-group image, and prime-to-p level hypothesis. The determinant q^m and compact-form comparison identify SU(2)×ℤ with action (g,m)↦q^(m/2)g.
2. Apply Frobenius equidistribution with N=1. Push Haar forward to the conjugacy angle using the compact-group Weyl integration supplier.
3. Check mass and trace moments explicitly: ∫(2/π)sin²θ=1; the normalized trace a=2cosθ has mean 0 and second moment 1. The Hasse interval is a∈[−2,2].

Acceptance checks:

- Constant j does not meet the full-monodromy hypothesis.
- The printed (1/(2π))sin²θ has mass 1/4 and is rejected.
- The minus point-count sign agrees with the cohomological trace formula.

Direct inputs: [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound), `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

Sources: [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3.5 (3.5.4)–(3.5.7), pp. 211–212.

Declaration id: `DeligneWeightsAndPurity:DWP.10/finite-field-sato-tate`.

<a id="dwp-10-weight-acceptance-suite"></a>

### The weight-facing acceptance suite

The common predicates and transports must reproduce: H^(2r)(ℙᴺ)=ℚ_ℓ(−r) of weight 2r and vanishing odd cohomology; H⁰(𝔾_m)=ℚ_ℓ of weight 0, H¹(𝔾_m)=ℚ_ℓ(−1) of weight 2, H¹_c(𝔾_m)=ℚ_ℓ of weight 0 and H²_c(𝔾_m)=ℚ_ℓ(−1) of weight 2; H¹ of a smooth projective genus-g curve of weight 1 with reciprocal pairs α_iα_(i+g)=q; the finite-residue-field semistable graded weights 0,1,2; and the component-aware all-extension point count. In Yu’s unitary Rankin–Selberg use, supplied Lafforgue correspondences make ℱ₁⊗ℱ₂∨ pure of weight zero; its proper curve cohomological factors have distinct weights 0,1,2 and cannot cancel. Correspondence construction, automorphic poles and functional equations remain with their existing owners.

Proof or construction:

1. Import explicit ℙᴺ/𝔾_m cohomology from EDC.3 and WC.7 rather than proving it again. Check each Tate sign against geometric Frobenius q⁻¹ on ℚ_ℓ(1).
2. Use initial curve purity and the alternating duality pairing for Yu’s σ_iσ_(i+g)=q bookkeeping, including multiplicity and odd/zero genus cases.
3. For the supplied pure Rankin–Selberg coefficient, use sharp proper curve purity and numeric disjoint-weight spectra. Import its Euler determinant formula and duality from WC.1/EDC.2; this proves only the weight input to Yu §6.1.1.
4. Import semistable weights and WC.5’s component formula; retain the strict difference between purity of projective cohomology and mixed compact-support cohomology.

Acceptance checks:

- For genus zero the H¹ root multiset is empty; paired-root claims are vacuous.
- The two curve roots of T²−T+2 have product 2, each weight 1, although neither is real.
- The compact-support 𝔾_m example rules out the false assertion that every smooth curve H¹_c is pure weight 1.

Direct inputs: [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), [DWP.6/sharp-curve-purity](#dwp-6-sharp-curve-purity), [DWP.10/weight-transport-to-stable-subquotients](#dwp-10-weight-transport-to-stable-subquotients), [DWP.10/finite-residue-semistable-curve-weights](#dwp-10-finite-residue-semistable-curve-weights), [DWP.10/compatible-realization-export](#dwp-10-compatible-realization-export), `EtaleDualityAndPerverseSheaves:EDC.3`, `WeilConjectures:WC.7`, `WeilConjectures:WC.1`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves`, [DWP.0/disjoint-spectra-no-intertwiner](#dwp-0-disjoint-spectra-no-intertwiner).

Sources: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu §1 pp. 2–3, Proposition 6.1.1 pp. 42–43, §7.1 p. 64; Weil II (3.2.3).

Declaration id: `DeligneWeightsAndPurity:DWP.10/weight-acceptance-suite`.

## Cross-roadmap contracts

A named companion declaration is imported directly in the specifications above. The contracts below identify inputs whose supplier has no declaration at the required generality. They are mathematical inputs with a single owner. The Part II extensions start from the inspected upstream objects rather than defining them again.

| Supplier | Required input | Consumers |
| --- | --- | --- |
| `EtaleDualityAndPerverseSheaves:EDC.0` | The coefficient conventions: ℚ_ℓ(1) as the Tate twist on which the geometric Frobenius of 𝔽_q acts by q⁻¹, compared with the inverse arithmetic Galois action on ℓ-power roots of unity, and extension of coefficients from finite extensions of ℚ_ℓ to ℚ̄_ℓ. | [DWP.0/twisting-by-rank-one-characters](#dwp-0-twisting-by-rank-one-characters), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries) |
| `SchemeAndStackFoundations:SF.2` | The Grothendieck–Lefschetz trace formula for lisse (and constructible) ℚ_ℓ-sheaves on a curve over 𝔽_q in the form of Weil I (1.14.3), Z(U₀, F₀, t) = ∏_i det(1 − F^*t, H^i_c(U, F))^{(−1)^{i+1}}, with finiteness of H^i_c. This is the CohomologicalPointCounting trace formula (TraceFormula Layer 14) that RS-17 names as DWP.2's supplier. The fixed-point formula for a curve and its Jacobian, #Fix(α) = (Γ_α · Δ) = 1 − Tr(α′ \| T_ℓJ) + deg α (Milne, Abelian Varieties, III.11.2; RS-17 names it the curve and Jacobian trace comparison of TraceFormula Layer 8). Proper base change for the pencil f : X̃ → D (the stalk of R^i f_*ℚ_ℓ at a geometric point over x is H^i(X_x̄)), and the trace formula (1.5.4) for the fibres. Frobenius-equivariant finite-dimensional ℓ-adic Künneth and Leray with an actual finite filtration of the abutment; finite-extension descent of smooth embeddings, pencils and singular-value/sign data. Finite surjective curve-cover pullback and rational trace splitting for compact-support cohomology, including ramified finite covers; Leray/Künneth and finite-field descent in the surface pencil. Closed geometric stalks, pullback and finite pushforward/descent interfaces in the actual étale coefficient categories, with local conjugacy invariance and finite-model compatibility. | [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.1/weil-estimate-for-curves](#dwp-1-weil-estimate-for-curves), [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.4/middle-cohomology-purity](#dwp-4-middle-cohomology-purity), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries), [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy), [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.6/real-cohomological-factors](#dwp-6-real-cohomological-factors), [DWP.6/square-improvement](#dwp-6-square-improvement), [DWP.10/frobenius-equidistribution](#dwp-10-frobenius-equidistribution) |
| `EtaleDualityAndPerverseSheaves:EDC.2` | Weil I (2.10): for a smooth connected curve X over an algebraically closed field and a lisse ℚ_ℓ-sheaf F, H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x)_{π₁(X, x)}(−1). Weil I (2.12): Poincaré duality H¹(X̄, j_*F) × H¹(X̄, j_*F^∨(1)) → ℚ_ℓ on a smooth projective curve, Frobenius-equivariantly. Poincaré duality on the smooth fibres of the pencil, giving the alternating cup-product pairing into ℚ_ℓ(−n). | [DWP.2/compact-cohomology-of-even-tensor-powers](#dwp-2-compact-cohomology-of-even-tensor-powers), [DWP.2/coarse-bound-on-compact-cohomology](#dwp-2-coarse-bound-on-compact-cohomology), [DWP.2/coarse-bound-on-cohomology-of-the-projective-line](#dwp-2-coarse-bound-on-cohomology-of-the-projective-line), [DWP.5/generalized-majoration](#dwp-5-generalized-majoration), [DWP.5/initial-curve-and-boundary-bounds](#dwp-5-initial-curve-and-boundary-bounds), [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/strict-initial-h1-bound](#dwp-5-strict-initial-h1-bound), [DWP.6/real-cohomological-factors](#dwp-6-real-cohomological-factors), [DWP.6/square-improvement](#dwp-6-square-improvement) |
| `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-9-schur-weyl-duality-for-the-orthogonal-and-symplectic-groups-the-brauer-algebra` | The first fundamental theorem for the complex symplectic group: the Sp(V)-invariant multilinear forms on V^{2k} are spanned by the pair contractions ψ_P (Brauer algebra), with the dimension of the invariants. | [DWP.2/symplectic-coinvariants-of-even-tensor-powers](#dwp-2-symplectic-coinvariants-of-even-tensor-powers) |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` | Zariski closure of a subgroup of the ℚ_ℓ-points of a linear algebraic group as an algebraic subgroup, and connectedness of Sp_{2g}. | [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense) |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` | The Lie algebra of an algebraic subgroup over ℚ_ℓ, and the fact that an algebraic subgroup whose ℚ_ℓ-points contain an ℓ-adically open subgroup of G(ℚ_ℓ) has full dimension. Its ℓ-adic analytic open-subgroup dimension comparison is requested in ReductiveGroups, Part II, together with the actual analytic local charts; the algebraic Lie API alone is not asserted to prove it. | [DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense](#dwp-2-open-subgroups-of-symplectic-groups-are-zariski-dense) |
| `AbelianSchemesAndArithmeticModuli:A2` | A polarization of an abelian variety over 𝔽_q defined over 𝔽_q (A is projective over 𝔽_q), with its dual map π^∨ compatible with the Frobenius. | [DWP.1/rosati-of-the-frobenius-endomorphism](#dwp-1-rosati-of-the-frobenius-endomorphism) |
| `ArithmeticGaloisRepresentations:R01.6` | The Tate module T_ℓA of an abelian variety over 𝔽_q with its Galois action, the Frobenius endomorphism acting as the arithmetic Frobenius, and H¹(A_{𝔽̄_q}, ℚ_ℓ) ≅ (V_ℓA)^∨. Finite E/ℚ_ℓ model and integral lattice for ℓ-adic representations, compact profinite image and étale descent after scalar normalization, uniformly across finite coefficient extension. | [DWP.1/weil-estimate-for-abelian-varieties](#dwp-1-weil-estimate-for-abelian-varieties), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves), [DWP.5/weil-sheaf](#dwp-5-weil-sheaf), [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy) |
| `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property` | The pointed Abel–Jacobi map and Albanese universal property from JacobianChallenge Layer F. Beyond the inspected pointed v1 scope, request JacobianChallenge, Part II: base-point-free Pic⁰/Jacobian descent over finite fields, the étale H¹(J)≅H¹(C) comparison, and triviality of translation on H¹, all compatible with Frobenius and finite coefficient/base extension. A geometric base point changes π_J∘f_P=f_P∘π_C by translation; exact equality requires P rational. No rational point on the original curve is assumed. | [DWP.1/weil-estimate-for-curves](#dwp-1-weil-estimate-for-curves), [DWP.1/weights-of-the-cohomology-of-curves](#dwp-1-weights-of-the-cohomology-of-curves) |
| `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1` | The trace of Frobenius a = q + 1 − #E(𝔽_q) and the Hasse bound \|a\| ≤ 2√q, with which the abelian-variety estimate is compared (not reproved). | [DWP.1/compatibility-with-the-hasse-bound](#dwp-1-compatibility-with-the-hasse-bound) |
| `LefschetzPencilsAndVanishingCycles:LPV.3` | A Lefschetz pencil of hyperplane sections of a smooth projective variety over 𝔽_q defined over 𝔽_q (after a Veronese embedding and a finite extension if necessary), with its axis, parameter line, blow-up f : X̃ → D and singular set S. Weil II §3.1 general-position pencil on a smooth projective surface with a strict normal-crossings boundary: ordinary node, simple boundary tangency, and transverse crossing, one exceptional point per fibre; in arbitrary characteristic as required in (3.2.14). This is an extension of the already planned constant-coefficient pencil theorem, not its re-planning. | [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles), [DWP.6/square-improvement](#dwp-6-square-improvement) |
| `LefschetzPencilsAndVanishingCycles:LPV.4` | The lisse sheaf R^n f_*ℚ_ℓ on U = D − S, the vanishing part ℰ as a π₁(U₀)-stable subsheaf defined over 𝔽_q, the cup-product pairing into ℚ_ℓ(−n), and geometric constancy of R^i f_*ℚ_ℓ (i ≠ n), R^n/ℰ and ℰ ∩ ℰ^⊥ (Weil I §5). | [DWP.3/geometrically-constant-lisse-sheaves](#dwp-3-geometrically-constant-lisse-sheaves), [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles) |
| `LefschetzPencilsAndVanishingCycles:LPV.5` | Weil I (5.10): for the fixed ℚ_ℓ model, the image of π₁(U, u) in Sp(ℰ/(ℰ ∩ ℰ^⊥), ψ) is open. | [DWP.3/coarse-bound-for-the-pencil](#dwp-3-coarse-bound-for-the-pencil) |
| `FunctionFieldArithmetic:FA.5` | The function-field Chebotarev density theorem for finite Galois covers of a curve over 𝔽_q, with the constant-field degree congruences, and its per-degree form: the Frobenius elements of the degree-n points equidistribute in the fibre over n, with error tending to 0. Connected finite étale double-cover zeta comparison with the simple pole at q⁻¹, used solely to exclude the quadratic exception. Its finite-cover curve estimate uses the initial curve Weil bound, not the general DWP.10 equidistribution theorem; retain this direction to avoid a proof cycle. | [DWP.3/exceptional-frobenius-set-has-density-zero](#dwp-3-exceptional-frobenius-set-has-density-zero), [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin) |
| `WeilConjectures:WC.1` | Rationality over ℚ of the zeta function Z(V, t) of a variety over a finite field, from the integral point-count series (Weil I §1, the Hankel-determinant and Fatou argument). | [DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves](#dwp-2-weights-and-l-functions-of-lisse-sheaves-on-curves), [DWP.3/zeta-of-the-fibres-and-the-pencil-factorization](#dwp-3-zeta-of-the-fibres-and-the-pencil-factorization), [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite) |
| `EtaleDualityAndPerverseSheaves:EDC.4` | Weak Lefschetz and its Gysin transpose; blowup pullback injectivity and codimension-two blowup decomposition, all Frobenius-equivariant without hard Lefschetz. | [DWP.4/middle-cohomology-half-unit-bound](#dwp-4-middle-cohomology-half-unit-bound), [DWP.4/smooth-projective-purity](#dwp-4-smooth-projective-purity), [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles), [DWP.6/square-improvement](#dwp-6-square-improvement) |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.1` | Arithmetic/geometric exact sequence, geometric Frobenius degree convention, tame specialization of curve fundamental groups, and connected finite étale cover classification. | [DWP.3/radical-quotient-of-the-vanishing-system](#dwp-3-radical-quotient-of-the-vanishing-system), [DWP.3/open-image-in-the-symplectic-similitude-group](#dwp-3-open-image-in-the-symplectic-similitude-group), [DWP.5/weil-group](#dwp-5-weil-group), [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization), [DWP.5/specialization-of-monodromy](#dwp-5-specialization-of-monodromy) |
| `FunctionFieldArithmetic:FA.4` | Finite-field curve geometric abelianized Weil group as finite prime-to-p by pro-p, from idèle class theory, local units and finite Picard group; no number-field replacement. | [DWP.5/rank-one-normalization](#dwp-5-rank-one-normalization) |
| `LefschetzPencilsAndVanishingCycles:LPV.1` | Quasi-unipotent inertia, N:V→V(−1), centered monodromy filtration, primitive/SL₂ string description, Clebsch–Gordan tensor compatibility, duality and uniqueness/existence criteria for relative monodromy filtration; preserve geometric-Frobenius signs. | [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity), [DWP.5/local-weight-corollaries](#dwp-5-local-weight-corollaries) |
| `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity` | Only the finite 3,4,1 trigonometric nonnegative coefficient combination and the exact-abscissa positivity input needed in Weil II §2; the generalized character/pole-order argument is owned here. | [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin) |
| `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem` | Uniform density of representative matrix coefficients and the square-character approximation used in the abstract positive pole-order argument. | [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin) |
| `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups` | Normalized Haar probability, character orthogonality and density among continuous class functions; conjugacy separation, and the SU(2) engine with chamber density (2/π)sin²θ. Haar disintegration over a compact quotient and continuity of conditional fibre mass for clopen finite-quotient sets; Dini’s theorem gives uniform decay from pointwise null fibres. Proper algebraic subsets of fixed ℓ-adic analytic symplectic cosets are null; if absent, extend CompactGroups, Part II for this analytic-measure input. | [DWP.5/hadamard-de-la-vallee-poussin](#dwp-5-hadamard-de-la-vallee-poussin), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form), [DWP.5/abstract-degree-equidistribution](#dwp-5-abstract-degree-equidistribution), [DWP.10/finite-field-sato-tate](#dwp-10-finite-field-sato-tate) |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` | Semisimple complex groups: maximal compact subgroup and complexification, finite outer automorphism and compact-normalizer/central-degree criteria of Weil II (1.3.10)–(1.3.15), beyond any currently stated compact-group supplier theorem. | [DWP.5/geometric-monodromy-and-central-degree](#dwp-5-geometric-monodromy-and-central-degree), [DWP.5/compact-weil-form](#dwp-5-compact-weil-form) |
| `LefschetzPencilsAndVanishingCycles:LPV.2` | The actual vanishing-cycle triangle, five-term specialization sequence, normalization resolution and nodal branch sign line; coefficient-specific weight computations remain in DWP.6. | [DWP.6/coefficient-specific-vanishing-cycles](#dwp-6-coefficient-specific-vanishing-cycles) |
| `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing` | Weil II (3.5.5) full SL₂ geometric monodromy for a smooth elliptic family with nonconstant j: prime-to-p level n≥3, finite-index image into the universal level curve, and finite-index ℓ-adic SL₂ image. If the roadmap does not supply the exact universal family theorem, add ModularCurves, Part II; no new pencil open-image proof substitutes for it. | [DWP.10/finite-field-sato-tate](#dwp-10-finite-field-sato-tate) |
| `EtaleDualityAndPerverseSheaves:EDC.3` | Frobenius-equivariant projective-space and multiplicative-group cohomology with compact support and duality, agreeing with the WC.7 examples. | [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite) |
| `WeilConjectures:WC.7` | Only the explicit ℙᴺ and 𝔾_m cohomology examples and their factor conventions used as weight acceptance checks; no independent zeta/point-count proof here. | [DWP.10/weight-acceptance-suite](#dwp-10-weight-acceptance-suite) |
| `LefschetzPencilsAndVanishingCycles:LPV.0` | The local trait, Weil representation, tame character and branch sign-line conventions used by Weil II §1.8; no second local monodromy definition here. | [DWP.5/local-monodromy-purity](#dwp-5-local-monodromy-purity) |
| `SchemeAndStackFoundations:SF.0` | Absolute p-Frobenius of characteristic-p schemes, its q=p^a iterate as an 𝔽_q-morphism, base change and naturality; the DWP.1 adapter identifies its geometric-point action and induced abelian-variety endomorphism. | [DWP.1/frobenius-endomorphism-over-a-finite-field](#dwp-1-frobenius-endomorphism-over-a-finite-field) |

## Pinned library inputs

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Each listed statement was checked at that pin. The general étale geometry and coefficient interfaces are supplier inputs, not structures manufactured by the suggested file. The ring equivalence supplied by classification of algebraically closed fields does not by itself prove compatibility with a prescribed embedding of a subfield.

| Declaration | Module | Exact role |
| --- | --- | --- |
| `mathlib:minpoly.algHom_eq` | `Mathlib/FieldTheory/Minpoly/Basic.lean` | minpoly A (f x) = minpoly A x for an injective A-algebra map f: the Weil-number predicate, defined through the minimal polynomial over ℚ, is invariant under field homomorphisms. |
| `mathlib:IsAlgClosed.lift` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` | For algebraic torsion-free domain R-algebras S and an algebraically closed field M carrying a torsion-free R-algebra structure, constructs an R-algebra homomorphism S→M. It extends the chosen base algebra map, not an arbitrary embedding without first installing that algebra structure. |
| `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | Kronecker: an algebraic integer of a number field all of whose complex embeddings have norm 1 is a root of unity (integral Weil numbers of weight 0). |
| `mathlib:IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` | An uncountable algebraically closed field has a transcendence basis (over a countable ring) of its own cardinality: trdeg(ℂ/σ(k)) = 𝔠. |
| `mathlib:Cardinal.mk_complex` | `Mathlib/Analysis/Complex/Cardinality.lean` | #ℂ = 𝔠. |
| `mathlib:IsAlgClosed.equivOfTranscendenceBasis` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` | A ring equivalence between algebraically closed R-algebras from equipotent transcendence bases. The declaration returns a ring equivalence and does not state compatibility with a prescribed embedding of R; that compatibility is a separate obligation in the DWP.0 extension lemma. |
| `mathlib:IsAlgClosed.ringEquiv_of_equiv_of_charZero` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean` | Two uncountable algebraically closed fields of characteristic 0 of the same cardinality are isomorphic: ℚ̄_ℓ ≅ ℂ. |
| `mathlib:Algebra.IsAlgebraic.cardinalMk_le_max` | `Mathlib/RingTheory/Algebraic/Cardinality.lean` | #L ≤ max #R ℵ₀ for L algebraic over R: #ℚ̄_ℓ = #ℚ_ℓ. |
| `mathlib:LinearMap.charpoly_baseChange` | `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean` | For a finite free module over a commutative ring R and any commutative R-algebra A, the base-changed characteristic polynomial is the coefficient image under R→A. |
| `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly` | `Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean` | Over a domain, f has eigenvalue μ iff μ is a root of f.charpoly. |
| `mathlib:LinearMap.finrank_maxGenEigenspace_eq` | `Mathlib/LinearAlgebra/Eigenspace/Zero.lean` | finrank (maxGenEigenspace φ μ) = rootMultiplicity μ φ.charpoly: multiplicities are dimensions of generalized eigenspaces. |
| `mathlib:Module.End.iSup_maxGenEigenspace_eq_top` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean` | Over an algebraically closed field, the maximal generalized eigenspaces of an endomorphism of a finite-dimensional space span it. |
| `mathlib:Module.End.independent_maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | The maximal generalized eigenspaces for distinct eigenvalues are independent. |
| `mathlib:Matrix.charpoly_fromBlocks_zero₂₁` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | The characteristic polynomial of a block triangular matrix with a zero lower-left block is the product of those of the diagonal blocks. |
| `mathlib:LinearMap.charpoly_prodMap` | `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean` | (f₁.prodMap f₂).charpoly = f₁.charpoly * f₂.charpoly. |
| `mathlib:Matrix.reverse_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` | M.charpoly.reverse = M.charpolyRev = det(1 − X·M): the characteristic power series det(1 − tF). |
| `mathlib:Matrix.trace_eq_sum_roots_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean` | Over an algebraically closed field, the trace is the sum of the roots of the characteristic polynomial. |
| `mathlib:Matrix.charpoly_inv` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` | A⁻¹.charpoly = (−1)^n · C(det A)⁻¹ · A.charpolyRev for invertible A: the characteristic polynomial of the inverse through the reversed polynomial. |
| `mathlib:Matrix.det_kronecker` | `Mathlib/LinearAlgebra/Matrix/Kronecker.lean` | det (A ⊗ₖ B) = det A ^ card n * det B ^ card m. |
| `mathlib:LinearMap.trace_tensorProduct'` | `Mathlib/LinearAlgebra/Trace.lean` | For the surrounding finite-free commutative-ring module hypotheses, the trace of the tensor-product map is the product of traces; the field case suffices here. |
| `mathlib:LinearMap.det_dualMap` | `Mathlib/LinearAlgebra/Determinant.lean` | For a finite free module the determinant of the ordinary transpose dual map equals the original determinant. The inverse dual needed for a Frobenius contragredient requires an inverse first. |
| `mathlib:Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean` | p, q ∈ k[X] are coprime iff they have no common root in an algebraically closed extension K. |
| `mathlib:LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | Cayley–Hamilton: aeval f f.charpoly = 0. |
| `mathlib:Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` | `Mathlib/RingTheory/Polynomial/Basic.lean` | For coprime p, q: ker p(f) ⊔ ker q(f) = ker (pq)(f). |
| `mathlib:AddValuation` | `Mathlib/RingTheory/Valuation/Basic.lean` | For a ring R and a linearly ordered additive commutative monoid with top Γ, AddValuation R Γ is Valuation R with multiplicative order-dual value group; it has v(0)=∞, v(1)=0, v(xy)=v(x)+v(y) and v(x+y)≥min(v(x),v(y)). It supplies the existing valuation object, not a new Newton-polygon definition. |
| `mathlib:Multiset.sort` | `Mathlib/Data/Multiset/Sort.lean` | For a decidable transitive antisymmetric total relation, sort turns a multiset into its sorted list. The accompanying pairwise_sort and sort_eq statements identify its order and underlying multiset; cumulative normalized slopes use this existing operation. |
| `mathlib:MonoidHom.eqLocus` | `Mathlib/Algebra/Group/Subgroup/Ker.lean` | The equalizer subgroup of two monoid homomorphisms from a group to a monoid. The Weil-group pullback core is the equality locus of the two projected arithmetic-degree homomorphisms. |

## Boundaries of the source arguments

The conjectures and applications are kept separate from the proved estimates. In particular, finite-determinant normalization is not a proof of all the conclusions conjectured in Weil II (1.2.10).

**La conjecture de Weil. II, (1.2.9)–(1.2.10), p. 155.** (1.2.9) every sheaf on a finite-type scheme over 𝔽_p is ι-mixed. (1.2.10), for an irreducible lisse sheaf on normal connected X with finite-order determinant: (i) weight-zero purity; (ii) a common number field for local polynomials; (iii) units at places away from p; (iv) |v(α)/v(N(x))|≤rank(ℱ)/2 at places above p; (v) compatible λ-adic companions after enlarging that field; (vi) crystalline companions. None is introduced here as an unconditional theorem. Finite-determinant normalization proves none of these conjectural conclusions. Their current status is not inferred from the 1980 text.

**La conjecture de Weil. II, §1.6–§1.7; (1.8.14); §1.9.** LPV.1 owns nilpotent monodromy filtrations and SL₂ strings; (1.8.14) is a Hodge-theoretic analogy, not a second variation-of-Hodge-structure plan. The normal-crossings multivariable estimates of §1.9 are explicitly unused by the subsequent curve/square-improvement targets and require a separate SNC consumer before becoming targets here.

**La conjecture de Weil. II, §3.3–§3.4, §4–§6.** DWP.7–DWP.9 own general direct-image bounds, mixed complexes, canonical weight filtrations, geometric semisimplicity and hard Lefschetz. This part imports their existing nodes for the arithmetic/equidistribution exports. Bergström–Faber–Payne’s orientation-corrected stack boundary spectral sequence is covered by the existing DWP.8 companion packet, not replanned here.

**Indecomposable vector bundles and stable Higgs bundles over smooth projective curves, Prop. 4.7 and Appendix B.** The full Zariski-density theorem and Katz–Sarnak universal-family monodromy belong to UniversalHypersurfaceMonodromy, the accepted LPV Part II route. Our Frobenius equidistribution theorem supplies its analytic input; it is not a numeric DWP.0 theorem. The published proof uses explicit families, removing the preprint’s unproved moduli-family shortcut.

## Source corrections

The mathematical specifications use the corrected conventions below. Published and preprint versions are distinguished. A known source issue is identified by its extraction/review record rather than being presented as a new discovery.

### DeligneWeightsAndPurity/E1

**Chapter III, proof of Proposition 11.2, p. 119 (footnote 6).** deg f^*((1 × α)^*)L(J × Θ) = L(C · α) (footnote 6: "Needs fixing.")

Correction: The degree of the pullback of L(J × Θ) along (1 × α) ∘ (f × f) ∘ Δ must be computed from the theta divisor's intersection with f(C) (Milne III.6.12, Lang 1959 IV §3). The step is incomplete as printed. The node weil-estimate-for-curves imports the fixed-point formula from its RS-17 supplier instead of relying on this proof.

Reason: The author marks the displayed identity with a footnote reading "Needs fixing"; the degree computation it records is not justified in the printed proof.

Flagged by the author in the text (footnote 6); not on the author's errata page for v2.00.

### DeligneWeightsAndPurity/E2

**arXiv:1406.3839v2, Appendix B pp. 35–36 and bibliography [D1] p. 37; published Appendix B p. 357, [Del74] reference.** [D1] La conjecture de Weil I., Publ. Math. 52 (1981), 313–428; Appendix B cites 3.5.3.

Correction: The equidistribution source is Deligne, La conjecture de Weil II, Publ. Math. IHÉS 52 (1980), 137–252, §3.5.3. The published reference [Del74] names Weil I but its §3.5.3 citation is likewise a Weil II theorem.

Reason: The volume and theorem locator identify Weil II; Weil I has no §3.5.3 equidistribution theorem.

Confirmed RT-AREA-etale/1; no separate author correction found in the versions compared.

### DeligneWeightsAndPurity/E3

**arXiv:1406.3839v2, Appendix B p. 35; published Appendix B p. 357.** The preprint uses H¹(−1) while displaying normalized eigenvalues q^(−n/2)σ_i.

Correction: Choose a square root of q with positive ι-image and tensor with its inverse degree character, the chosen half-weight normalization H¹(1/2). This is a rank-one Weil scalar twist, not the integer twist (−1).

Reason: H¹ has weight 1; an ordinary (−1) twist gives weight 3, whereas the displayed normalized spectrum has weight 0.

PAPER-SCHIFFMANN-16/E6; the published version uses the corrected half twist.

### DeligneWeightsAndPurity/E4

**(3.5.6)–(3.5.7), p. 212.** The SU(2) angle density is (1/(2π))sin²θ dθ.

Correction: Use (2/π)sin²θ dθ on [0,π].

Reason: The printed measure has mass 1/4; normalized Haar pushforward has mass 1.

PAPER-DELIGNE-80/E50, confirmed by REV-PAPER-DELIGNE-80; scan inspected in this run.

### DeligneWeightsAndPurity/E5

**(3.5.6), p. 212.** For eigenvalues q^(n/2)e^(±iθ), the point count is given with +2cosθ q^(n/2).

Correction: The count is 1+q^n−2cosθ q^(n/2).

Reason: The cohomological trace formula subtracts the H¹ trace.

PAPER-DELIGNE-80/E51, confirmed by REV-PAPER-DELIGNE-80; scan inspected in this run.

### DeligneWeightsAndPurity/E6

**Yu arXiv v5, (6.1.1)–(6.1.2), pp. 42–43.** H⁰(ℱ₁⊗ℱ₂∨)=Hom(ℱ₁,ℱ₂), with the opposite order likewise in H².

Correction: Use H⁰=Hom(ℱ₂,ℱ₁) and H²=Hom(ℱ₁,ℱ₂)∨(−1).

Reason: The tensor–Hom identification fixes the order; the self-pair and absence-of-common-constituent uses are symmetric, so this changes no weight input or pole count.

PAPER-YU-23/E14, confirmed by REV-PAPER-YU-23; rechecked in the public v5 proof.

## Structure and interfaces

The packet keeps the current stage ids. The following proposals give the precise boundaries an assembly or restructuring review must preserve.

Implement the confirmed ownership findings RT-AREA-etale/1 and /9 without editing the atlas, other packets or accepted route files. DWP.10 currently hosts the newly planned equidistribution declarations; DWP.0 supplies only shared numeric predicates.

Create DeligneWeightsAndPurity:DWP.8:equidistribution, importing DWP.5, DWP.7 and the necessary DWP.8 geometric semisimplicity; move the DWP.10 Frobenius-equidistribution and finite-field-Sato–Tate nodes there on acceptance. Extend UniversalHypersurfaceMonodromy (LPV, Part II) with Katz–Sarnak 10.1.16/10.2.2 and the Schiffmann density application, retaining the accepted explicit-family route and its characteristic hypotheses. Correct PAPER-SCHIFFMANN-16/36’s analytic supplier to DWP.8:equidistribution; the full density theorem stays with the accepted LPV Part II owner. Add the stage edge DeligneWeightsAndPurity:DWP.0 → PadicDifferentialEquationsAndRigidCohomology:RD.6, and add RD.6 to the RS-17 DWP.0 owner’s formerly list. RD.6 imports IsWeilNumber and iotaWeight and defines only pointwise F-isocrystal purity/mixedness.

DWP.5 has separate coefficient definitions, local monodromy estimates and analytic compact-group preparation. Six planets cannot describe every construction.

Expose sublayers DWP.5:coefficients (Weil group, Weil sheaf, punctual purity/mixedness and determinantal weights), DWP.5:local (majoration, local monodromy purity and nonarchimedean bounds) and DWP.5:analytic (Hadamard–de la Vallée-Poussin, compact Weil form and abstract degree equidistribution), preserving the internal prerequisite order. Keep this packet on the eight current scope ids until review. The coefficient-definition prefix precedes the DWP.2 curve adapter; DWP.2 feeds only the local/analytic proof suffix. Do not turn these node-level dependencies into a coarse DWP.5→DWP.2→DWP.5 stage cycle.

The inspected upstream layers supply algebraic semisimple groups and fine fixed-pairing level curves, but do not assert the exact maximal-compact comparison or universal-family full-monodromy theorem used in Weil II §2.2 and §3.5.5.

Request ReductiveGroups, Part II for complex maximal compact/complexification, compact normalizers and finite outer automorphisms, importing CompactGroups and the existing reductive structure; request ModularCurves, Part II for universal elliptic-family SL₂ monodromy and the nonconstant-j finite-index passage. Do not replan their existing algebraic-group or fine-moduli constructions. Extend CompactGroups, Part II for nullity of proper algebraic zero sets in ℓ-adic analytic cosets and continuous conditional Haar disintegration/Dini uniformity over the degree quotient; this input is not asserted by the inspected complex compact-character layer. Extend JacobianChallenge, Part II for base-point-free finite-field Jacobian descent and the Frobenius-equivariant étale H¹ comparison, importing its pointed Abel–Jacobi construction and the existing étale coefficient/cohomology suppliers. Include the ℓ-adic open-subgroup dimension comparison in the requested ReductiveGroups, Part II.

Upstream observation: The current 5B explicitly does not assert connectedness of determinant fibres. Weil II §3.5.5 needs the exact full monodromy result, not merely fixed-pairing fine representability. The requested Part II carries this extension; no edits to upstream roadmaps are proposed by this job.

Upstream observation: Layer F supplies a pointed universal property and base change, but does not state the étale H¹ comparison and its translation invariance. DWP.1 requires this exact comparison and base-point-free finite-field descent; the Part II contract records both, without altering or reviewing the upstream roadmap.

## Proof and signature obligations

All eight stages have their targets and prerequisite chains specified. Supplier closure remains distinct from coverage. The following two obligations are explicit:

**Prescribed-base compatibility of the complex isomorphism.** The pinned equivOfTranscendenceBasis returns a ring equivalence, without a theorem that it extends a prescribed σ:k→ℂ. Its polynomial/base-algebra-compatible construction must be traced through the algebraic-closure equivalence, or supplied as an explicit AlgEquiv extension theorem. The cardinal classification alone is insufficient. The target is stated fully and this proof obligation remains visible.

**Unavailable geometric and analytic interfaces in suggested signatures.** The pinned libraries lack the actual constructible ℓ-adic/Weil coefficient categories, closed-stalk descent, compact-support cohomology, vanishing-cycle objects and algebraic-by-discrete Weil-monodromy realization interfaces used by the geometric and representation-Euler-family statements. Their precise theorem/API/test specifications are in the packet and reader; suggested-file entries that require these carriers are explicitly omitted with names and supplier blockers, as PROTOCOL §13 requires. They are not replaced by opaque proposition parameters or fabricated cohomology fields. The file elaborates numerical definitions and genuine subgroup, stalk-family and valuation cores; instantiation as schemes/sheaves or the compact Weil representation category is an owner-interface obligation. Standalone positivity, multiset and error-removal lemmas elaborate without those interfaces.

The suggested Lean companion instantiates the numerical definitions against existing polynomial, valuation, subgroup and vector-space types. Its stalk-family and Weil-group cores accept genuine mathematical data supplied by the geometric owners. They do not define a sheaf category or a scheme. It records every unavailable geometric signature by its exact packet name and supplier; these records are not elaborated theorems. Compilation checks the signatures that can be expressed at the pin and supplies no implementation claim.

## Sources and reading boundary

The source versions, checksums and locators below make the comparison reproducible. The plan follows the published Weil I and Weil II arguments; the application sources determine arithmetic uses and the scope of equidistribution. Their unrelated automorphic and moduli constructions stay with their owners.

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Pierre Deligne. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, 36 PDF pages (printed page = PDF page + 271); locators give printed pages. Accessed 2026-10-06.

Reading boundary: §1–§3 and (5.12)–(7.3), including every dimension-induction case. The geometric pencil construction is imported from LPV.

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Pierre Deligne. Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135); locators give printed pages. Accessed 2026-10-06.

Reading boundary: coefficient definitions and local arguments in §1, all §2, and (3.1)–(3.5). The source-boundary notes distinguish conjectures, unused normal-crossings generalizations, and companion-part imports.

- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), J. S. Milne. Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6. Accessed 2026-10-06.

Reading boundary: Chapter II §1 and Chapter III §§9–11, with the proof warning in III.11.2 kept visible.

- [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Hongjie Yu. arXiv:1807.04659v5, 18 July 2022; supplied lead: Annals of Mathematics 197 (2023), no. 2; locators refer to the public author preprint. Accessed 2026-10-06.

Reading boundary: §§1, 2.1, 6.1.1 and 7.1 for the routed weight uses; no claim to read or reconstruct the entire automorphic argument.

- [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf), Olivier Schiffmann. Annals of Mathematics 183 (2016), 297–362; published Proposition 4.7 and Appendix B; compared arXiv:1406.3839v2 Proposition 4.8. Accessed 2026-10-06.

Reading boundary: published Proposition 4.7 and Appendix B, compared with preprint v2 Proposition 4.8, Appendix B and bibliography [D1].

Versions inspected:

| Version | Citation | SHA-256 |
| --- | --- | --- |
| published | [Deligne, La conjecture de Weil. I, Publ. Math. IHÉS 43 (1974), Numdam](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` |
| published | [Deligne, La conjecture de Weil. II, Publ. Math. IHÉS 52 (1980), Numdam](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| author copy | [J. S. Milne, Abelian Varieties, course notes v2.00 (2008)](https://www.jmilne.org/math/CourseNotes/AV.pdf) | `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef` |
| author preprint | [Yu, arXiv:1807.04659v5 (2022), for the routed weight-facing inputs only](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |
| published | [Schiffmann, Annals 183 (2016), Prop. 4.7 and Appendix B](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf) | `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5` |
| preprint | [Schiffmann v2 (2014), Prop. 4.8, Appendix B and bibliography [D1]](https://arxiv.org/pdf/1406.3839v2) | `7e5cbf6e3bb9caf4c48959493987c4543c2244cccdf17fa0fa426593a8639bb2` |
