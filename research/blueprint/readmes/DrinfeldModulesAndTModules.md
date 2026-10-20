# Drinfeld modules, t-motives and characteristic-p special values

Drinfeld modules over function rings of curves, Anderson t-modules and their motives connect function-field arithmetic with special values and transcendence. These nine layers state the objects and comparisons needed for Drinfeld uniformization, the Tate theorem, Taelman’s class formula and Papanikolas’s algebraic-independence theorem. Every target below gives its hypotheses, proof route, prerequisites and source locators; every definition and construction has an API and discriminating checks.

## Purpose

Drinfeld modules are the function-field counterparts of the multiplicative group and of elliptic curves. The Carlitz module t ↦ θ + τ plays the role of G_m: its torsion points generate the Carlitz cyclotomic function fields, which give explicit class field theory for F_q(θ) (Carlitz, Hayes), and its exponential has kernel F_q\[θ]·π̃, as the complex exponential has kernel 2πiℤ. Higher-rank Drinfeld modules have Tate modules with Galois actions, a Tate theorem for their homomorphisms, moduli spaces that carry modular forms and Hecke operators, and, through elliptic sheaves and shtukas, the geometry that realises the Langlands correspondence for GL_r over function fields.

Two further theories make the subject a testing ground for conjectures that are out of reach over number fields. Taelman's class formula expresses the L-value L(E/R) of a Drinfeld module over the integers R of a finite extension of F_q(θ), which for the Carlitz module over F_q\[θ] is ζ\_A(1), as the product of a regulator and the order of a finite class module: an analogue of the analytic class number formula. Papanikolas's theorem proves the function-field analogue of Grothendieck's period conjecture for the rigid analytically trivial dual t-motives of his category: the transcendence degree of the period field equals the dimension of the motivic Galois group. Its application to Carlitz logarithms is the analogue of the conjecture, open over ℚ, that logarithms of algebraic numbers linearly independent over ℚ are algebraically independent.

This roadmap builds the objects those results need, in the generality the sources use, and states the results with all their hypotheses. It is the foundation for the function-field Langlands roadmaps that consume elliptic sheaves (GlobalShtukasAndFunctionFieldLanglands, ExcursionOperatorsAndSpectralAction), and for the multiple zeta values of its proposed Part II.

## Scope and ownership

DM.0–DM.8 are specified below. All nine layers are planned; the exact proof and supplier boundaries are recorded under [Open inputs](#open-inputs). The 134 contracts comprise 123 stable targets imported from the accepted parts and eleven additional targets. The target text states the reconciled mathematical plan. Every target remains unchecked as an implementation.

The numerical period belongs to DM.2. Analytic coefficient twisting, E, Ω and its relation to that numerical period belong to DM.8; the historical target ID DM.2/omega is retained as a stable reference. In DM.4, inverse coefficient Frobenius on perfect algebraic fields supplies the algebraic convention. Scalar Frobenius descent and multizeta degree estimates are owned by DrinfeldModulesAndTModulesPartII, MZ.4.

| Supplier | Imported contract |
| --- | --- |
| FiniteFieldsAndCharacterSums FF.4 | q-linearized polynomials, Ore/composition comparison, evaluation and subspace polynomials; the field-only nodes keep their field hypotheses. |
| AlgebraicCurves Layers 2, 3, 5; JacobianChallenge Layers A–C | Affine Dedekind models, divisors, Riemann–Roch, place completions, line-bundle degree and relative coherent cohomology. |
| AlgebraicVectorBundles L0B, L2B | Finite locally free sheaves, affine finite-projective comparison, pullbacks and totalSpace(E)=linearSpec(E∨). |
| AdicSpaces Layer 0 §§0.4–0.5 | Restricted-series topology, evaluation and Tate algebras. Current Tau Ceti supplies preparation, units and principal ideals; normalized zero/pole and entire-product/growth comparisons are the additional requested interfaces. |
| SchemeAndStackFoundations SF.0–SF.3 | Scheme dimension and normalization, affine fpqc descent, torsors, finite quotients, the étale–Galois dictionary, line-bundle bounds, fppf torsor H¹ and affine quasi-coherent cohomology vanishing. |
| FunctionFieldArithmetic FA.0–FA.1 | Exact constants and infinity normalization; the particular field/curve, conjugate-norm/divisor and Lang base-extension adapters requested below. |
| MotivesAndAlgebraicCycles MC.6 | Arbitrary-field neutral Tannakian reconstruction and torsors; the precise tensor-subcategory recognition exports remain supplier obligations. |
| StableReduction Layer 0 / current Tau Ceti | Generic Fitting ideals and base change. DM.6 supplies the monic-generator comparison for its finite F\[t\]-modules. |

Generic valued skew-field normal forms extend FF.4 as Part II. General global shtuka moduli and the Langlands correspondence belong to their existing roadmaps. Multiple zeta values and their combinatorial basis conjectures belong to DrinfeldModulesAndTModulesPartII, which imports the difference-equation machinery here.

## Conventions

- **The coefficient ring.** F is a finite field with q = p^m elements. C is a smooth projective geometrically connected curve over F with a closed point ∞ of degree δ, A = Γ(C − ∞, O_C), and Q = Frac(A). For nonzero a ∈ A, deg_A(a) = −δ·ord_∞(a) = log_q #(A/(a)). In the polynomial case A = F\[t]. A coefficient algebra is an F-algebra R with an F-algebra map γ : A → R, the characteristic map; its characteristic is ker γ, and γ injective is generic characteristic. Over F\[t] write θ = γ(t), so that the letter t is the algebraic variable and θ its image.
- **Ore rings.** R{τ} is the ring of twisted polynomials with τc = c^q τ. It acts on R by q-linearized polynomials, and multiplication is composition. The differential of an element is its τ^0 coefficient. Evaluation on the points of a finite field need not be faithful, so identities of twisted polynomials or of group-scheme maps are never replaced by equalities of functions on one finite set of points.
- **Inverse twists and dual motives.** On a perfect coefficient field, σ(c) = c^(1/q). On power series and matrices σ acts coefficientwise and fixes the variable t; f^(n) = σ^(−n)(f) is the n-fold coefficient q-Frobenius. Twisting never substitutes t^q for t. The ring L\[t, σ] has σc = c^(1/q)σ and σt = tσ. The star map sends Σ a_i τ^i to Σ a_i^(1/q^i) σ^i and reverses products; on matrices it also transposes.
- **Variance.** The τ-motive of a t-module E is contravariant: M(E) = Hom(E, G_a) as F-module schemes, with A acting through E and τ by q-Frobenius on values. The dual motive of a coordinate t-module is the row module L\[σ]^(1×d), and an intertwiner U induces h ↦ hU\*, so the dual construction is covariant.
- **Analytic normalizations.** C∞ is the completion of an algebraic closure of the completion K∞ of Q at ∞, with |a| = q^(deg_A a); for F\[θ] this gives |θ| = q. The Carlitz module is C_t = θ + τ. Its exponential is exp_C(z) = Σ z^(q^i)/D_i, entire, and its logarithm log_C(z) = Σ z^(q^i)/ℓ\_i converges exactly on |z| < q^(q/(q−1)), where it inverts exp_C. Fix ρ with ρ^(q−1) = −θ. The period π\_BP = θρ∏\_(i≥1)(1 − θ^(1−q^i))^(−1) generates ker exp_C as an F\[θ]-module and has |π\_BP| = q^(q/(q−1)); the Ngo Dac normalization is π\_ND = −π\_BP. The Anderson–Thakur function Ω(t) = ρ^(−q)∏\_(i≥1)(1 − t/θ^(q^i)) satisfies Ω^(−1) = (t − θ)Ω and Ω(θ)^(−1) = −π\_BP. Papanikolas's period π̃ = −1/Ω(θ), used throughout DM.8, is therefore π\_BP.
- **Difference equations.** In DM.8, T is the radius-one restricted power series ring in C∞\[\[t]], L its fraction field, E the ring of entire series whose coefficients are algebraic over k = F_q(θ) and generate a finite extension of k∞, K = k̄(t), and the fixed field of σ on L is F_q(t). For a motive with basis column m, σ(m) = Φm; a fundamental matrix satisfies σ(Ψ) = ΦΨ; its columns span the solutions of the vector equation, while the ordinary inverse matrix of Ψ times m is a basis of the Betti realization. The difference torsor is built from the ordinary matrix product (inverse of Ψ\_1)·Ψ\_2 with right multiplication.
- **Two notations for the polynomial case.** DM.0–DM.7 write F for the finite field and θ = γ(t). DM.8 follows Papanikolas: A = F_q\[θ] and k = F_q(θ) are the coefficient rings inside C∞, t is an independent variable, and some DM.8 statements write F for F_q(t), as each says. The two readings agree through γ.
- **Hypotheses are explicit.** Rank, generic characteristic, abelianness, A-finiteness, purity, uniformizability and rigid analytic triviality are separate conditions, stated wherever they are used. In particular not every t-module is abelian or uniformizable, and not every pre-t-motive is rigid analytically trivial.

In a matrix superscript f^(−1), parentheses denote inverse coefficient Frobenius. An ordinary inverse matrix is explicitly called an inverse or written B_inv when both operations occur together. A τ-trivialization satisfies Υ=Υ^(1)Θ; a dual σ-trivialization satisfies Ψ^(−1)=ΦΨ. For the Carlitz tensor power these are ((t−θ)Ω)^n and Ω^n respectively.

## Layer overview

| Layer | Targets | Direct layers used | Planets |
| --- | ---: | --- | --- |
| [DM.0](#layer-dm-0) | 11 | — | Drinfeld module; Drinfeld rank; Carlitz module; Drinfeld isogeny; Drinfeld kernel; Relative Drinfeld module |
| [DM.1](#layer-dm-1) | 7 | DM.0, DM.4 | Drinfeld torsion; Finite flat torsion theorem; Drinfeld Tate module; Tate Galois representation; Characteristic local shtuka |
| [DM.2](#layer-dm-2) | 9 | DM.0 | C infinity; Drinfeld lattice; Drinfeld exponential; Drinfeld uniformization theorem; Carlitz exponential; Carlitz period |
| [DM.3](#layer-dm-3) | 9 | DM.0, DM.1 | Drinfeld level structure; Fine Drinfeld moduli scheme; Generalized Drinfeld module; Drinfeld Satake compactification; Drinfeld modular form; Drinfeld Hecke correspondence |
| [DM.4](#layer-dm-4) | 13 | DM.0, DM.2 | Anderson t-module; Effective A-motive; Anderson motive anti-equivalence; Pure t-motive; Carlitz tensor power; Effective dual t-motive |
| [DM.5](#layer-dm-5) | 8 | DM.0, DM.1, DM.4 | Tate Hom comparison; Drinfeld Tate theorem; Tate semisimplicity theorem |
| [DM.6](#layer-dm-6) | 13 | DM.0, DM.2 | Monic module cardinality; Exponential unit lattice; Taelman class module; Finite-field nuclear determinant; Taelman L-value; Taelman class formula |
| [DM.7](#layer-dm-7) | 7 | DM.0, DM.1, DM.4, DM.5 | Elliptic sheaf; Normalized elliptic sheaf; Drinfeld elliptic-sheaf construction; Elliptic-sheaf shtuka realization |
| [DM.8](#layer-dm-8) | 57 | DM.2, DM.4 | Rigid analytic triviality; Neutral Tannakian category; Difference Galois torsor; ABP lifting criterion; Period transcendence degree; Carlitz logarithm independence |

The graph of these target contracts and its contraction to layers are acyclic. DM.1 uses DM.4 for its motive and characteristic-completion interfaces. The algebraic targets of DM.4 precede the analytic comparisons of DM.8.

<a id="layer-dm-0"></a>

## Layer DM.0: Drinfeld modules and Carlitz arithmetic

The Frobenius Ore/composition ring is imported from FF.4. This layer specifies positive-rank Drinfeld modules, general rank integrality, relative families and the elementary Carlitz denominator products.

<a id="dm-0-drinfeld-module"></a>

### 0.1 Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.0/drinfeld-module` (definition). **Planet:** Drinfeld module.

Fix a finite field F of size q, a smooth projective geometrically connected curve C/F, a closed point ∞ of degree δ, A=Γ(C−∞,O\_C), and an F-algebra field L with characteristic map γ:A→L. A Drinfeld module is an F-algebra map φ:A→L{τ} with ∂φ\_a=γ(a), not equal to the scalar map C∘γ. The q-Frobenius Ore ring and its identification with F-linear polynomial group endomorphisms are supplied by FF.4. The characteristic is ker γ; generic characteristic means γ injective. The rank theorem below supplies r rather than imposing a potentially circular definition.

**Hypotheses.**

- F finite; L field; A as specified, with exact constant field F.

**Proof route.**

- Import the FF.4 composition-ring comparison.
- Define the characteristic using the constant-coefficient homomorphism; evaluate on every commutative L-algebra to obtain the group-scheme action.
- Use the rank theorem to reconcile this field definition with constant positive rank.

**Needs:** [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-eval-linear`](../packets/FiniteFieldsAndCharacterSums.json); [`mathlib:RingHom.ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5: The survey gives the differential convention and permits rank zero; the positive-rank non-scalar condition is supplied by Hartl Definition 3.7.
- [HARTL-2017](#source-hartl-2017), Definition 3.7, p. 10: Positive rank excludes the scalar action.

**API.**

- **`DrinfeldModule.map`** (projection): The F-algebra map φ:A→L{τ}.
- **`DrinfeldModule.constantCoeff_map`** (simp): ∂φ\_a=γ(a).
- **`DrinfeldModule.charIdeal`** (data): charIdeal φ=ker γ.
- **`DrinfeldModule.baseChange`** (functoriality): Coefficient extension along an injective F-algebra field map carries φ to a Drinfeld module; identity and composition hold.
- **`DrinfeldModule.ext`** (extensionality): Over fixed coefficients and characteristic map, equality of every action polynomial gives equality of Drinfeld modules.

**Checks.**

- **`DrinfeldModule.test_carlitz`** (computation): For C\_t=θ+τ, C\_t(x)=θx+x^q.
- **`DrinfeldModule.test_scalar_rejected`** (non-example): The map a↦C(γ(a)) fails the non-scalar condition.
- **`DrinfeldModule.test_special_characteristic`** (degenerate): Over F, φ\_t=τ has characteristic (t), even though φ itself is injective.

**Acceptance.**

- C\_t=θ+τ has characteristic evaluation at θ.
- The action on group-scheme points is natural in the value algebra.

**Uses.**

- DM.1: Forms torsion kernels.
- DM.4: Produces a one-dimensional abelian Anderson module.

**Used by:** [0.2](#dm-0-rank-polynomial-ring), [0.3](#dm-0-rank-general), [0.5](#dm-0-carlitz-module), [0.6](#dm-0-drinfeld-module-hom), [2.4](#dm-2-lattice-drinfeld-module), [4.1](#dm-4-t-module).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank-polynomial-ring"></a>

### 0.2 Rank over the polynomial ring

**Target** `DrinfeldModulesAndTModules:DM.0/rank-polynomial-ring` (theorem). **Planet:** Drinfeld rank.

For A=F\[t\] and φ\_t=θ+g\_1τ+⋯+g\_rτ^r with g\_r≠0, r≥1, every nonzero a∈F\[t\] satisfies deg\_τ φ\_a=r deg\_t a. If d=deg a, its leading coefficient is lc(a)·g\_r^(Σ\_{i=0}^{d−1}q^(ri)), with empty exponent sum zero.

**Hypotheses.**

- L field; φ a Drinfeld F\[t\]-module.

**Proof route.**

- Expand a(φ\_t) using the polynomial algebra-map universal property.
- FF.4’s Ore multiplication gives the leading coefficient of each power.
- The maximal degree term is unique; field nonzero coefficients preclude cancellation.

**Needs:** [DM.0/drinfeld-module](#dm-0-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`mathlib:Polynomial.aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/AlgebraMap.lean).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5: The polynomial-ring rank is the τ-degree of the image of t.

**Acceptance.**

- For nonzero constants the degree is zero and leading coefficient is the constant.
- For C\_t=θ+τ and a=t² the image is θ²+(θ+θ^q)τ+τ².

**Used by:** [0.4](#dm-0-rank), [0.5](#dm-0-carlitz-module).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank-general"></a>

### 0.3 The general rank theorem

**Target** `DrinfeldModulesAndTModules:DM.0/rank-general` (theorem).

For A=Γ(C−∞,O\_C) with arbitrary δ=deg∞, a field Drinfeld A-module has a unique integer r≥1 such that deg\_τφ\_a=r deg\_A(a), where deg\_A(a)=−δ ord∞(a)=log\_q #(A/(a)), for all a≠0. A rational ∞ is not assumed. The assertion includes integrality of r.

**Hypotheses.**

- The curve and field hypotheses of drinfeld-module.

**Proof route.**

- τ-degree is additive on products and gives an infinity valuation on Frac(A).
- Import the function-ring degree and Riemann–Roch facts.
- Identify L{τ} with the finite projective A⊗F L motive of the one-dimensional module; its rank supplies the integer r. The final finite-projectivity/integrality input is recorded as a gap rather than inferred from proportional valuations alone.

**Needs:** [DM.0/drinfeld-module](#dm-0-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge); [TauCetiRoadmap AlgebraicCurves layer-3-divisors-ld-riemanns-theorem-and-the-genus](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-3-divisors-ld-riemanns-theorem-and-the-genus); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Lemma 1.4, p. 4; Definition 3.7 and Theorem 3.9, pp. 10–12: The source normalizes degree by the residue-field degree at infinity and compares rank-r Drinfeld modules with dimension-one abelian Anderson modules.

**Acceptance.**

- The degree of a depends on δ.
- For F\[t\], recover rank-polynomial-ring.

**Used by:** [0.4](#dm-0-rank), [2.5](#dm-2-uniformization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-rank"></a>

### 0.4 The rank invariant

**Target** `DrinfeldModulesAndTModules:DM.0/rank` (construction).

Define rank φ as the unique r supplied by rank-general, normalized by log\_q|A/(a)|. Its value is locally constant in relative families; over F\[t\] it is the nonzero τ-degree of φ\_t.

**Hypotheses.**

- A and L as in drinfeld-module.

**Proof route.**

- Use uniqueness in rank-general to choose r.
- Field extension preserves nonzero leading coefficients and hence the degree formula.

**Needs:** [DM.0/rank-general](#dm-0-rank-general); [DM.0/rank-polynomial-ring](#dm-0-rank-polynomial-ring).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 3.7, p. 10: The leading-degree formula specifies the relative rank.

**API.**

- **`DrinfeldModule.rank`** (data): The integer r with deg\_τφ\_a=r deg\_A(a).
- **`DrinfeldModule.rank_pos`** (characterisation): 0&lt;rank φ.
- **`DrinfeldModule.rank_baseChange`** (functoriality): rank(baseChange φ)=rank φ.

**Checks.**

- **`DrinfeldModule.rank_test_carlitz`** (computation): rank(C)=1.
- **`DrinfeldModule.rank_test_tau_square`** (computation): rank(φ\_t=τ² over F)=2.
- **`DrinfeldModule.rank_test_infinity_degree`** (non-example): At a point ∞ of degree δ, using −ord∞(a) alone yields δr, and fails the normalization whenever δ&gt;1.

**Acceptance.**

- The invariant is positive and unchanged by field extension.

**Uses.**

- DM.1: Sets the rank of the Tate module.
- DM.3: Specifies each moduli component.

**Used by:** [0.7](#dm-0-isogeny-rank).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-carlitz-module"></a>

### 0.5 The Carlitz module

**Target** `DrinfeldModulesAndTModules:DM.0/carlitz-module` (construction). **Planet:** Carlitz module.

For θ∈L, C:F\[t\]→L{τ} is the F-algebra map with C\_t=θ+τ. Its characteristic is evaluation at θ, rank is one, and C\_t acts as x↦θx+x^q. Generic characteristic holds exactly when θ is transcendental over F.

**Hypotheses.**

- L field containing F.

**Proof route.**

- Apply the polynomial algebra-map universal property to Cθ+τ.
- The constant coefficient is evaluation at θ; degree one proves the non-scalar property.

**Needs:** [DM.0/drinfeld-module](#dm-0-drinfeld-module); [DM.0/rank-polynomial-ring](#dm-0-rank-polynomial-ring); [`mathlib:Polynomial.aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/AlgebraMap.lean).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 3–5: The modern Carlitz sign is plus τ; its exponential and torsion use this convention.

**API.**

- **`carlitz`** (constructor): The Drinfeld module C determined by C\_t=θ+τ.
- **`carlitz_map_X`** (simp): C\_t=Cθ+τ.
- **`carlitz_rank`** (compatibility): rank(C)=1.
- **`carlitz_constantCoeff`** (simp): ∂C\_a=a(θ).

**Checks.**

- **`carlitz_test_square`** (computation): C\_t²=θ²+(θ+θ^q)τ+τ².
- **`carlitz_test_theta_zero`** (degenerate): At θ=0, C\_t=τ and C\[t\]=Spec L\[X\]/(X^q).
- **`carlitz_test_noncommuting`** (non-example): The τ-coefficient of C\_t² is θ+θ^q, not 2θ unless θ^q=θ.

**Acceptance.**

- C\_t²=θ²+(θ+θ^q)τ+τ².

**Uses.**

- DM.2: Fixes the exponential recurrence and period.
- DM.6: Tests the class formula and depth-one sums.

**Used by:** [0.11](#dm-0-carlitz-products), [6.2](#dm-6-integral-model).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-drinfeld-module-hom"></a>

### 0.6 Morphisms and isogenies

**Target** `DrinfeldModulesAndTModules:DM.0/drinfeld-module-hom` (definition). **Planet:** Drinfeld isogeny.

For φ and ψ over the same (L,γ), Hom(φ,ψ) consists of u∈L{τ} with uφ\_a=ψ\_a u for every a. It is an A-module through a·u=ψ\_a u=uφ\_a. Composition is Ore multiplication. A field isogeny is a nonzero such u; an isomorphism is a scalar u=Cc with c∈L×. End(φ) is an A-algebra, potentially noncommutative in special characteristic.

**Hypotheses.**

- Same A, coefficient field and characteristic map.

**Proof route.**

- Take the simultaneous equalizer of the intertwiners.
- Closure under addition and the A-action follows from commutation.
- The Ore degree theorem identifies units as invertible constants.

**Needs:** [DM.0/drinfeld-module](#dm-0-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.3, p. 5; §2.4, pp. 6–7: Intertwining polynomials are the morphisms, and scalar conjugation describes isomorphisms.

**API.**

- **`DrinfeldModule.Hom`** (constructor): The intertwiner A-module.
- **`DrinfeldModule.Hom.comp`** (structure): v∘u=v u; identity is 1.
- **`DrinfeldModule.Hom.smul`** (simp): a·u=ψ\_a u.
- **`DrinfeldModule.isogeny_iff`** (characterisation): Over a field, u is an isogeny iff u≠0.
- **`DrinfeldModule.Hom.ext`** (extensionality): Two morphisms are equal when their underlying Ore polynomials agree.
- **`DrinfeldModule.Hom.id`** (constructor): The identity morphism is the Ore constant 1.
- **`DrinfeldModule.Hom.comp_assoc`** (structure): Composition of intertwiners is associative, with Hom.id as its two-sided identity.

**Checks.**

- **`Hom_test_identity`** (degenerate): 1 belongs to Hom(φ,φ).
- **`Hom_test_scalar_conjugation`** (compatibility): Cc∈Hom(φ,ψ) iff ψ\_a=Cc φ\_a C(c⁻¹), for c≠0.
- **`Hom_test_extra_endomorphism`** (computation): For φ\_t=τ² over F\_{q²}, τ and every scalar in F\_{q²} are endomorphisms; they need not commute.

**Acceptance.**

- Identity and composition satisfy category laws.

**Uses.**

- DM.5: Provides the source of the Tate comparison.
- DM.7: Requires bounded shifts on elliptic-sheaf morphisms.

**Used by:** [0.7](#dm-0-isogeny-rank), [0.8](#dm-0-kernel-scheme), [2.6](#dm-2-exponential-morphisms), [5.2](#dm-5-tate-hom-map), [5.5](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-isogeny-rank"></a>

### 0.7 Rank invariance and separability

**Target** `DrinfeldModulesAndTModules:DM.0/isogeny-rank` (theorem).

A nonzero intertwiner u:φ→ψ over a field forces rank φ=rank ψ. Its kernel has scheme order q^(deg\_τu); it is étale iff ∂u≠0. In generic characteristic ∂u≠0 for every nonzero u. In special characteristic a Frobenius isogeny may have ∂u=0.

**Hypotheses.**

- φ and ψ have the same characteristic map.

**Proof route.**

- Compare τ-degrees in uφ\_a=ψ\_a u.
- FF.4 identifies the derivative of the kernel polynomial as ∂u.
- If the first nonzero coefficient has index i&gt;0, commutation gives γ(a)^(q^i)=γ(a) for all a; generic γ(A) is infinite, a contradiction.

**Needs:** [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom); [DM.0/rank](#dm-0-rank); [`FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Lemma 3.8(b), p. 10; Corollaries 5.11 and 5.17, pp. 20 and 23: The source controls leading degrees and separability of isogenies.

**Acceptance.**

- τ:φ\_t=τ²→φ\_t=τ² over F is inseparable.
- A nonzero scalar has degree zero and trivial kernel.

**Used by:** [3.8](#dm-3-hecke-correspondence).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-kernel-scheme"></a>

### 0.8 Drinfeld kernel schemes

**Target** `DrinfeldModulesAndTModules:DM.0/kernel-scheme` (construction). **Planet:** Drinfeld kernel.

For a nonzero intertwiner u with q-linearized polynomial P\_u, define ker(u)=Spec L\[X\]/(P\_u), with the inherited additive Hopf structure and A-action. It is the general affine group-scheme kernel already provided by Tau Ceti, specialized to the map u of G\_a. Its coordinate algebra is free of rank q^(deg\_τu); geometric points alone need not determine it.

**Hypotheses.**

- L field; u≠0; the kernel of the zero map is G\_a and is not finite.

**Proof route.**

- Use FF.4 to obtain the additive group-scheme endomorphism.
- P\_u is primitive, so its principal ideal is a Hopf ideal.
- Apply kernelSpec and divide by the invertible leading coefficient to obtain the monic basis 1,…,X^(q^deg−1).

**Needs:** [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`tauceti:TauCeti.CommHopfAlgCat.kernelSpec`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Kernel.lean); [`tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Basic.lean).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 5.1, p. 15; §6, pp. 23–24: Isogenies have finite locally free scheme-theoretic kernels, and torsion uses these kernels.

**API.**

- **`DrinfeldKernel.coordinateAlgebra`** (constructor): L\[X\]/(P\_u).
- **`DrinfeldKernel.points`** (characterisation): For an L-algebra B, points are x∈B with P\_u(x)=0.
- **`DrinfeldKernel.baseChange`** (functoriality): Kernel formation commutes with coefficient extension.

**Checks.**

- **`DrinfeldKernel_test_scalar`** (degenerate): ker(Cc)=Spec L for c≠0.
- **`DrinfeldKernel_test_frobenius`** (computation): ker(τ²)=Spec L\[X\]/(X^(q²)); its order is q² and its geometric point set has size one.
- **`DrinfeldKernel_test_etale`** (compatibility): At θ≠0, ker(C\_t) has order q and is étale.

**Acceptance.**

- Scheme order and root count agree only in the étale case.

**Uses.**

- DM.1: Principal ideal torsion is this kernel.
- DM.3: Level structures identify finite étale group schemes.

**Used by:** [1.1](#dm-1-ideal-torsion), [5.6](#dm-5-tate-injectivity).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-relative-drinfeld-module"></a>

### 0.9 Relative Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.0/relative-drinfeld-module` (definition). **Planet:** Relative Drinfeld module.

Over an A-scheme S, take the additive group of an invertible O\_S-module E and a ring map φ:A→End\_F(E) with differential γ. Locally in a linear trivialization, φ\_a=Σ b\_i(a)τ^i; for a≠0 its highest nonzero degree is r deg\_A(a), its coefficient is a unit, and all higher coefficients vanish. Rank r is positive and locally constant on S. Changes of linear frame by u∈O\_S× send b\_i to u^(1−q^i)b\_i. The invertible sheaf and its vector group are imported from AlgebraicVectorBundles, not reconstructed.

**Hypotheses.**

- S an A-scheme; standard form; rank can vary between open-and-closed components.

**Proof route.**

- Import invertible sheaves, their pullbacks and relative vector groups.
- Glue the local Ore actions using the coefficient transformation law.
- Check the degree and differential conditions are invariant under linear frames.

**Needs:** [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.2/hilbert-90`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PINK-2012](#source-pink-2012), Definitions 3.1–3.2, p. 10; Proposition 3.4, pp. 11–12; Definition 3.5, p. 12: Pink specifies the line-bundle version in standard form, with fibrewise rank and coefficient conditions.

**API.**

- **`RelativeDrinfeldModule.pullback`** (functoriality): Pull back the line bundle and action along a map of A-schemes.
- **`RelativeDrinfeldModule.coeff_changeFrame`** (relation): b\_i becomes u^(1−q^i)b\_i.
- **`RelativeDrinfeldModule.rank_fiber`** (compatibility): The rank of each geometric fibre is the specified locally constant rank.
- **`RelativeDrinfeldModule.ext`** (extensionality): On a fixed invertible sheaf, two actions agree when their restrictions on every affine open agree for every a∈A. Families on different line bundles use a compatible line-bundle isomorphism.

**Checks.**

- **`RelativeDrinfeldModule_test_field`** (compatibility): Over Spec L with E=O, recover the field definition and rank.
- **`RelativeDrinfeldModule_test_nonunit`** (non-example): φ\_t=θ+sτ over F\[θ,s\] fails rank one at s=0 and is not a rank-one family on the whole base.
- **`RelativeDrinfeldModule_test_frame`** (computation): For rank-one C\_t=θ+τ, a frame change by u gives θ+u^(1−q)τ.

**Acceptance.**

- The field fibre recovers drinfeld-module.

**Uses.**

- DM.3: Defines the moduli functor.
- DM.7: Descent of the one-dimensional underlying group.

**Used by:** [0.10](#dm-0-relative-standardization), [1.1](#dm-1-ideal-torsion), [3.3](#dm-3-moduli-functor), [3.4](#dm-3-generalized-drinfeld-module), [7.1](#dm-7-elliptic-sheaf).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves); [TauCetiRoadmap AlgebraicVectorBundles l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-relative-standardization"></a>

### 0.10 Standardization over nonreduced bases

**Target** `DrinfeldModulesAndTModules:DM.0/relative-standardization` (theorem).

The relative definition that allows nilpotent coefficients above r deg\_A(a) is equivalent to the standard line-bundle definition: locally a unique additive coordinate change with constant coefficient one removes the higher nilpotent terms. Between standard forms, invertible intertwining coordinate changes are scalar. This theorem is required before treating arbitrary additive coordinates as linear frames.

**Hypotheses.**

- Positive rank; affine local charts; nilpotent higher coefficients as in Hartl Definition 3.7.

**Proof route.**

- Use the standardization input of Hartl Lemma 3.8(a).
- For a standard intertwiner compare its top coefficient in the commutation relation as in Lemma 3.8(b).
- Scalar transition cocycles give the invertible sheaf by descent.

**Needs:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 3.7 and Lemma 3.8, p. 10; Theorem 3.9, pp. 10–12: The source distinguishes nilpotent higher terms from standard form and derives linear transitions.

**Acceptance.**

- Over dual numbers, (1+ετ) conjugates a standard family to a possibly nonstandard one; this is not a linear frame.

**Used by:** [3.2](#dm-3-fine-moduli-scheme), [7.3](#dm-7-drinfeld-to-sheaf).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="dm-0-carlitz-products"></a>

### 0.11 Carlitz denominator products

**Target** `DrinfeldModulesAndTModules:DM.0/carlitz-products` (construction).

For A=F\[θ\], set \[i\]=θ^(q^i)−θ, D\_0=ℓ\_0=1, D\_i=∏\_{j=0}^{i−1}(θ^(q^i)−θ^(q^j)) and ℓ\_i=∏\_{j=1}^i(θ−θ^(q^j)). Then D\_i=\[i\]D\_{i−1}^q and ℓ\_i=−\[i\]ℓ\_{i−1} for i≥1. These are polynomial identities; inverse denominators require transcendental θ or localization.

**Hypotheses.**

- F finite; θ an indeterminate for nonvanishing claims.

**Proof route.**

- Expand the products and use q-power Frobenius.
- Keep the sign in ℓ\_i distinct from the unsigned product of \[j\].

**Needs:** [DM.0/carlitz-module](#dm-0-carlitz-module); [`mathlib:FiniteField.frobeniusAlgHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §2.2, p. 7; §4.2, p. 17: These products normalize Carlitz factorials and the depth-one power sums.

**API.**

- **`carlitzBracket`** (constructor): \[i\]=θ^(q^i)−θ.
- **`carlitzD`** (constructor): The product D\_i, with D\_0=1.
- **`carlitzEll`** (constructor): The signed product ℓ\_i, with ℓ\_0=1.
- **`carlitzD_succ`** (relation): D\_(i+1)=\[i+1\]D\_i^q.
- **`carlitzEll_succ`** (relation): ℓ\_(i+1)=−\[i+1\]ℓ\_i.

**Checks.**

- **`carlitzProducts_test_zero`** (degenerate): D\_0=ℓ\_0=1 and \[0\]=0.
- **`carlitzProducts_test_two`** (computation): D\_2=(θ^(q²)−θ)(θ^(q²)−θ^q).
- **`carlitzProducts_test_sign`** (non-example): ℓ\_1=−D\_1, which differs from D\_1 in odd characteristic.

**Acceptance.**

- D\_1=θ^q−θ and ℓ\_1=θ−θ^q.

**Uses.**

- DM.2: Exponential and logarithm coefficients.
- DM.6: Γ\_n and S\_d(s) normalizations.

**Used by:** [2.7](#dm-2-carlitz-exponential), [6.12](#dm-6-small-power-sum).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM0`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-1"></a>

## Layer DM.1: Torsion, Tate modules and Galois actions

Ideal torsion is treated as a finite group scheme, with characteristic-sensitive étaleness. Tate modules away from the characteristic and effective local-shtuka realizations at the characteristic have separate contracts.

<a id="dm-1-ideal-torsion"></a>

### 1.1 Ideal torsion

**Target** `DrinfeldModulesAndTModules:DM.1/ideal-torsion` (construction). **Planet:** Drinfeld torsion.

For a nonzero ideal I⊂A and a relative rank-r Drinfeld module E/S, define E\[I\]=⋂\_{a∈I}ker φ\_a as an A-stable closed subgroup scheme. Finite generators give the same scheme independent of their choice. E\[A\] is the zero group; E\[(a)\]=ker φ\_a. Coprime ideals give E\[IJ\]≅E\[I\]×E\[J\].

**Hypotheses.**

- I nonzero; S an A-scheme; E relative in standard form.

**Proof route.**

- On affine charts quotient O\_S\[X\] by the q-polynomials for generators of I.
- Use additive intertwiners and the ideal identity to prove independence.
- Bézout idempotents give the Chinese-remainder splitting.

**Needs:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [DM.0/kernel-scheme](#dm-0-kernel-scheme); [`mathlib:Ideal.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Span.lean).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 6.1, p. 23; Lemma 6.3, p. 24: The source defines ideal torsion and establishes principal and coprime-ideal comparisons.

**API.**

- **`DrinfeldModule.idealTorsion`** (constructor): The closed subgroup E\[I\].
- **`DrinfeldModule.idealTorsion_principal`** (compatibility): E\[(a)\]=ker φ\_a.
- **`DrinfeldModule.idealTorsion_baseChange`** (functoriality): Base change of E\[I\] equals the I-torsion of the pulled-back family.
- **`DrinfeldModule.idealTorsion_crt`** (equivalence): For I+J=A, E\[IJ\]≅E\[I\]×E\[J\].

**Checks.**

- **`idealTorsion_test_unit`** (degenerate): E\[A\] is the zero group scheme of order one.
- **`idealTorsion_test_carlitz`** (computation): C\[(t)\]=Spec L\[X\]/(θX+X^q).
- **`idealTorsion_test_scheme_points`** (non-example): At θ=0 this scheme has length q, although its geometric points form the zero group.

**Acceptance.**

- The unit ideal has degree one, not zero.

**Uses.**

- DM.1: Forms the λ-power inverse system.
- DM.3: Defines level structures as scheme isomorphisms.

**Used by:** [1.2](#dm-1-finite-flat-torsion), [3.1](#dm-3-level-structure), [3.8](#dm-3-hecke-correspondence), [5.5](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-finite-flat-torsion"></a>

### 1.2 Finite locally free torsion

**Target** `DrinfeldModulesAndTModules:DM.1/finite-flat-torsion` (theorem). **Planet:** Finite flat torsion theorem.

E\[I\] is finite locally free over S of degree #(A/I)^r for every nonzero ideal I. This holds without I being principal and without invertibility of γ(I). The corresponding effective motive satisfies Dr\_q(M/IM)≅E\[I\] in the finite-shtuka/strict-group comparison.

**Hypotheses.**

- E rank r; I nonzero.

**Proof route.**

- For principal I use the monic q-polynomial quotient basis.
- For arbitrary I use the finite-shtuka comparison for the finite locally free O\_S-module M/IM.
- Hartl Theorem 6.4 gives flatness; geometric fibres and the Dedekind ideal norm give the degree.

**Needs:** [DM.1/ideal-torsion](#dm-1-ideal-torsion); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge); [TauCetiRoadmap AlgebraicCurves layer-3-divisors-ld-riemanns-theorem-and-the-genus](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-3-divisors-ld-riemanns-theorem-and-the-genus).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4 and proof, pp. 24–26: This is the finite locally free ideal-torsion theorem and motive comparison.

**Acceptance.**

- A nonprincipal ideal still has degree #(A/I)^r.
- At characteristic, flatness does not imply étaleness.

**Used by:** [1.3](#dm-1-etale-torsion).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-etale-torsion"></a>

### 1.3 The prime-to-characteristic condition

**Target** `DrinfeldModulesAndTModules:DM.1/etale-torsion` (theorem).

E\[I\] is étale over S iff γ(I)O\_S=O\_S. Over a field this means I is coprime to ker γ. For a principal ideal the derivative is γ(a). An isogeny has an invertible differential exactly when its kernel is étale.

**Hypotheses.**

- Nonzero I; E a relative Drinfeld module.

**Proof route.**

- Use the conormal or co-Lie description in the finite-shtuka comparison.
- For a principal generator compute the q-polynomial derivative by FF.4.
- Localize on S to reduce the ideal condition to a generator with unit image.

**Needs:** [DM.1/finite-flat-torsion](#dm-1-finite-flat-torsion); [`FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-separable-iff`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4(b) and proof, pp. 24–26: Invertibility of the characteristic ideal image characterizes étaleness.

**Acceptance.**

- For C\_t=τ at θ=0, t-torsion is connected; (t−1)-torsion is étale.

**Used by:** [1.4](#dm-1-geometric-torsion-basis), [1.6](#dm-1-continuous-galois-action), [3.1](#dm-3-level-structure), [5.5](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-geometric-torsion-basis"></a>

### 1.4 Geometric torsion bases

**Target** `DrinfeldModulesAndTModules:DM.1/geometric-torsion-basis` (theorem).

If I is prime to the characteristic and Ω is a separably closed coefficient field, E\[I\](Ω) is a free A/I-module of rank r. For its motive, (M/IM)^τ is free of the same rank; the realization of E\[I\] is its finite-field dual, with the dualizing A/I-module Hom\_F(A/I,F) made explicit.

**Hypotheses.**

- I nonzero and γ(I) generates the unit ideal.

**Proof route.**

- Hartl Lemma 6.5 supplies Frobenius frames using Lang’s morphism for restriction of scalars of GL\_r.
- Apply the perfect pairing of Theorem 6.6; use the finite-field trace dual rather than identifying variance silently.

**Needs:** [DM.1/etale-torsion](#dm-1-etale-torsion); [DM.4/contravariant-motive](#dm-4-contravariant-motive).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Proposition 6.5 and Theorem 6.6, p. 26: The source proves freeness and the duality of torsion with motive invariants.

**Acceptance.**

- Rank r gives #(A/I)^r geometric points.
- The assertion is false at the characteristic prime.

**Used by:** [1.5](#dm-1-tate-module), [3.1](#dm-3-level-structure), [5.6](#dm-5-tate-injectivity).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-tate-module"></a>

### 1.5 Drinfeld Tate modules

**Target** `DrinfeldModulesAndTModules:DM.1/tate-module` (construction). **Planet:** Drinfeld Tate module.

For a nonzero prime λ≠ker γ, put A\_λ=lim A/λ^n and define the λ-adic Tate module from the λ-power torsion over L^sep. For general A use the canonical division-module description Hom\_A(K\_λ/A\_λ,E\[λ^∞\](L^sep)), or identify it with the inverse system after choosing a local uniformizer and proving independence of that choice. Transition maps are not multiplication by a nonexistent global generator of a nonprincipal ideal. T\_λE is free of rank r over A\_λ; V\_λE=Frac(A\_λ)⊗T\_λE.

**Hypotheses.**

- λ a nonzero prime away from characteristic; K\_λ=Frac(A\_λ).

**Proof route.**

- Use geometric-torsion-basis at λ^n.
- Surjectivity of division maps and compatible lifted bases give the completed free module.
- Identify coordinate choices with the canonical division-module model.

**Needs:** [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Definitions 2.26 and Proposition 2.28, pp. 12–14: Motive Tate modules are Frobenius invariants; the Drinfeld torsion realization uses their dual.

**API.**

- **`DrinfeldModule.tateModule`** (constructor): The canonical A\_λ-module T\_λE.
- **`DrinfeldModule.tateModule_mod`** (compatibility): T\_λE/λ^nT\_λE≅E\[λ^n\](L^sep), with the division-coordinate convention fixed.
- **`DrinfeldModule.tateMap`** (functoriality): u acts on torsion and induces T\_λu; identity and composition hold.
- **`DrinfeldModule.tateModule_rank`** (characterisation): T\_λE is free of rank rank E.
- **`DrinfeldModule.tateModule.lift`** (universal-property): A compatible system of λ^n-torsion points defines an element of T\_λE, uniquely determined by its finite-level coordinates. The native lift uses a principal ell coordinate.
- **`DrinfeldModule.tateModule.ext`** (extensionality): Elements of the Tate inverse limit agree if all finite-level coordinates agree.

**Checks.**

- **`tateModule_test_carlitz`** (computation): For C and λ≠char, rank\_Aλ T\_λC=1.
- **`tateModule_test_tau_square`** (computation): For φ\_t=τ² over F and λ=(t−1), rank T\_λφ=2.
- **`tateModule_test_isogeny`** (compatibility): A nonzero isogeny induces an injection with finite torsion cokernel, hence a rational Tate isomorphism.
- **`tateModule_test_char_rejected`** (non-example): For φ\_t=τ, the t-power separable torsion is zero; it cannot be a rank-one t-adic Tate module.

**Acceptance.**

- For a principal λ=(ℓ), points satisfy φ\_ℓ(x\_(n+1))=x\_n.

**Uses.**

- DM.5: Tate Hom comparison.
- DM.7: Elliptic-sheaf realization comparison.

**Used by:** [1.6](#dm-1-continuous-galois-action), [5.1](#dm-5-rational-motive-realization), [5.2](#dm-5-tate-hom-map), [7.6](#dm-7-tate-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-continuous-galois-action"></a>

### 1.6 The continuous Tate representation

**Target** `DrinfeldModulesAndTModules:DM.1/continuous-galois-action` (construction). **Planet:** Tate Galois representation.

The natural G\_L-action on T\_λE is A\_λ-linear and continuous for the inverse-limit topology. It gives ρ\_λ:G\_L→Aut\_Aλ(T\_λE), and a choice of basis gives GL\_r(A\_λ). Modulo λ^n its action is the finite torsion action; each stabilizer is open because a finite separable extension splits that torsion.

**Hypotheses.**

- L a coefficient field; λ away from characteristic.

**Proof route.**

- The finite étale coordinate algebra produces finite continuous Galois sets.
- Take compatible actions in the inverse limit and use the inverse-limit basis of neighborhoods.
- Naturality of torsion maps makes every T\_λu equivariant.

**Needs:** [DM.1/tate-module](#dm-1-tate-module); [DM.1/etale-torsion](#dm-1-etale-torsion); [`SchemeAndStackFoundations:SF.2/etale-galois-comparison`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAPIKIAN-2017](#source-papikian-2017), §3.2, pp. 12–14: Finite torsion representations and their Tate limit carry the Galois action.

**API.**

- **`DrinfeldModule.tateGaloisAction`** (structure): The continuous A\_λ-linear G\_L-action.
- **`DrinfeldModule.tateGaloisAction_mod`** (compatibility): Reduction modulo λ^n agrees with the torsion action.
- **`DrinfeldModule.tateMap_equivariant`** (functoriality): T\_λu commutes with G\_L.

**Checks.**

- **`tateGaloisAction_test_sepclosed`** (degenerate): For separably closed L, the Galois action is trivial.
- **`tateGaloisAction_test_finite_field`** (computation): Over F\_{q^m}, arithmetic Frobenius acts on torsion by x↦x^(q^m).
- **`tateGaloisAction_test_basis`** (compatibility): Changing a Tate basis by B replaces every action matrix R by B⁻¹RB.

**Acceptance.**

- A basis change conjugates ρ; the representation is intrinsically basis free.

**Uses.**

- DM.5: Forms equivariant Hom and tests the Frobenius centralizer.

**Used by:** [5.2](#dm-5-tate-hom-map), [7.6](#dm-7-tate-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="dm-1-characteristic-local-realization"></a>

### 1.7 The characteristic-place realization

**Target** `DrinfeldModulesAndTModules:DM.1/characteristic-local-realization` (construction). **Planet:** Characteristic local shtuka.

Fix a characteristic prime p, residue field F\_p of size qhat=q^f, an F\_p-algebra R, and a characteristic map A→R whose local uniformizer image is nilpotent. Complete the rank-r, dimension-one effective A-motive of a Drinfeld module at p. Split F\_p⊗F R into its f coefficient factors and take the distinguished characteristic factor; τ^f induces a qhat-Frobenius linearization on a locally free R\[\[z\]\]-module of rank r. It becomes invertible after z−γ(z) is inverted and has a cokernel locally free of rank one over R and annihilated by z−γ(z), inherited from dimension one. The finite reductions correspond to p-power strict finite group schemes, including the connected part. The equal-characteristic local-shtuka and strict finite-group comparison inputs are recorded as gaps; HS2 does not supply this category.

**Hypotheses.**

- The coefficient splitting, nilpotent characteristic parameter and finite locally free motive are required.
- The F\_p→R coefficient embedding is the one induced by the completed characteristic map and gives the distinguished residue factor. Freeness holds only after a local frame is chosen.

**Proof route.**

- Apply the completion and coefficient-factor decomposition of Hartl §7.
- Iterate Frobenius f times to return to the characteristic factor.
- Compare the finite reductions by the finite-shtuka functor, keeping the connected–étale decomposition separate from separable points.

**Needs:** [DM.4/effective-a-motive](#dm-4-effective-a-motive).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 7.1 and Example 7.2, p. 27; Theorems 7.4 and 7.6, p. 28: The local object uses a residue-degree Frobenius and a distinguished coefficient factor.

**API.**

- **`DrinfeldModule.charLocalRealization`** (constructor): The distinguished completed module with τ^f.
- **`DrinfeldModule.charLocalRealization_rank`** (compatibility): Its R\[\[z\]\]-rank is r.
- **`DrinfeldModule.charLocalRealization_mod`** (compatibility): The finite reductions realize the full characteristic torsion group schemes.

**Checks.**

- **`charLocal_test_supersingular`** (computation): For φ\_t=τ² over F, φ\[t^n\]=Spec F\[X\]/(X^(q^(2n))) is connected of order q^(2n).
- **`charLocal_test_residue_degree`** (non-example): For degree-f p, the characteristic factor is preserved by τ^f, generally not by τ.
- **`charLocal_test_points_insufficient`** (non-example): Replacing φ\[t^n\] by its separable points turns all these connected kernels into the zero group.

**Acceptance.**

- For φ\_t=τ² and p=(t), the p-power kernels retain nonzero scheme length despite having one geometric point.

**Uses.**

- DM.7: The characteristic local comparison retains the effective bound.

**Used by:** [7.7](#dm-7-characteristic-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM1`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-2"></a>

## Layer DM.2: Analytic uniformization and numerical periods

The completed coefficient field, projective A-lattices and their exponentials give Drinfeld uniformization. The Carlitz exponential, logarithm and numerical root/product period are constructed here without an analytic Ω prerequisite.

<a id="dm-2-c-infinity"></a>

### 2.1 The analytic coefficient field

**Target** `DrinfeldModulesAndTModules:DM.2/c-infinity` (construction). **Planet:** C infinity.

Let K=Frac(A), K\_∞ its completion at ∞, choose its real-valued absolute value normalized by |a|=q^(deg\_A(a)), and extend it to an algebraic closure. C\_∞ is the completion of that normed algebraic closure. It is a complete algebraically closed nonarchimedean field of characteristic p containing K; for F\[θ\] and rational ∞, |θ|=q. The choice of norm extension is unique up to the appropriate isometric K\_∞-isomorphism.

**Hypotheses.**

- A as in DM.0; fixed norm extension and completion.

**Proof route.**

- Import the normalized completion from AlgebraicCurves Layer 5 and the explicit extending-norm input recorded in the completed-coefficient gap.
- Use the spectral norm for algebraic extensions.
- For algebraic closedness in characteristic p, first prove perfectness of the completion by Cauchy p-th roots, then apply the simple-root perturbation/Krasner argument of Crew Corollary 1.2.8.5. Do not apply a characteristic-zero Mathlib theorem.

**Needs:** [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components); [`mathlib:UniformSpace.Completion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean); [`mathlib:NormedField.instCompletableTopField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Field/Instances.lean).

**Sources.**

- [CREW-2019](#source-crew-2019), Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35: The completion argument applies in positive characteristic; the perturbation step uses separable roots.

**API.**

- **`CInfty`** (constructor): Completion of the normed algebraic closure of K\_∞.
- **`CInfty.norm_algebraMap`** (compatibility): The embedding preserves the chosen norm on K\_∞.
- **`CInfty.isAlgClosed`** (instance): C\_∞ is algebraically closed.
- **`CInfty.complete`** (instance): C\_∞ is complete.

**Checks.**

- **`CInfty_test_theta`** (computation): For F\[θ\], ‖θ‖=q.
- **`CInfty_test_qroot`** (characterisation): Every c∈C\_∞ has a unique q-th root.
- **`CInfty_test_generic`** (non-example): No nonzero a∈A maps to zero; a finite coefficient field is not a substitute for C\_∞.

**Acceptance.**

- The embedding A→C\_∞ has generic characteristic.

**Uses.**

- DM.2: Convergence and surjectivity of exponential functions.
- DM.8: Analytic coefficient field for periods and twists.

**Used by:** [2.2](#dm-2-a-lattice), [4.6](#dm-4-uniformizability), [8.11](#dm-8-coefficient-twist), [8.10](#dm-8-entire-series), [8.13](#dm-8-tate-analytic-interface), [8.16](#dm-8-analytic-separability), [8.43](#dm-8-abp-size).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-a-lattice"></a>

### 2.2 Projective A-lattices

**Target** `DrinfeldModulesAndTModules:DM.2/a-lattice` (definition). **Planet:** Drinfeld lattice.

An A-lattice in C\_∞ is a finitely generated projective A-submodule Λ⊂C\_∞ of positive rank such that {λ∈Λ:‖λ‖≤R} is finite for each finite R≥0. Its rank is the dimension of K⊗AΛ. In the category of lattices of a fixed positive rank r, morphisms are scalars c∈C\_∞ with cΛ⊂Λ′; isomorphisms are homotheties by nonzero c. Bounded-ball finiteness is required; mere topological discreteness is insufficient.

**Hypotheses.**

- Generic embedding A⊂C\_∞; A Dedekind.

**Proof route.**

- Use the native Submodule, Module.Finite and Module.Projective notions.
- Finite generation and torsion-freeness over Dedekind A give projectivity.
- Define the scalar morphism category and homothety relation.

**Needs:** [DM.2/c-infinity](#dm-2-c-infinity); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4, pp. 6–7: The lattice correspondence uses finite projective modules and scalar homotheties.

**API.**

- **`ALattice`** (constructor): A positive-rank projective A-submodule with finite bounded intersections.
- **`ALattice.rank`** (data): dim\_K(K⊗AΛ).
- **`ALattice.scale`** (functoriality): cΛ is a lattice for c≠0.
- **`ALattice.quotient_card`** (relation): For a≠0, #(a⁻¹Λ/Λ)=#(A/(a))^(rank Λ).
- **`ALattice.ext`** (extensionality): Two lattices with the same submodule carrier are equal; finiteness and projectivity are proof data.

**Checks.**

- **`ALattice_test_principal`** (computation): For A=F\[θ\], A is a rank-one lattice.
- **`ALattice_test_nonprincipal`** (compatibility): For a nonprincipal ideal I⊂A embedded in K\_∞, I is a rank-one projective lattice and is not free as an A-module.
- **`ALattice_test_discrete_constants`** (non-example): The algebraic closure of F inside C\_∞ is discrete but has infinitely many elements of norm one; it fails the bounded-ball condition.

**Acceptance.**

- Nonprincipal ideal lattices must be accepted.
- A scalar inclusion between different ranks is not admitted as a morphism in the fixed-rank uniformization category; finite index must not be inferred from such an inclusion.

**Uses.**

- DM.2: Weierstrass product and inverse uniformization.
- DM.6: The unit lattice is in K\_∞-type spaces with the same discrete/cocompact distinction.

**Used by:** [2.3](#dm-2-lattice-exponential), [2.8](#dm-2-carlitz-period).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-lattice-exponential"></a>

### 2.3 Lattice exponential

**Target** `DrinfeldModulesAndTModules:DM.2/lattice-exponential` (construction). **Planet:** Drinfeld exponential.

For an A-lattice Λ define e\_Λ(z)=z∏\_{0≠λ∈Λ}(1−z/λ), as the limit over finite F-subspaces exhausting Λ. It is an entire F-linear function with derivative one and kernel exactly Λ. The product converges uniformly on every bounded disk, and e\_Λ is surjective on C\_∞.

**Hypotheses.**

- Λ an A-lattice; C\_∞ as constructed above.

**Proof route.**

- Finite subspace polynomials from FF.4 give normalized additive partial products.
- Bounded-ball finiteness makes each tail factor uniformly approach one.
- The analytic zero/product and nonarchimedean Newton-polygon input gives the kernel and surjectivity. This analytic input is requested explicitly.

**Needs:** [DM.2/a-lattice](#dm-2-a-lattice); [`FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`](../packets/FiniteFieldsAndCharacterSums.json); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras); [`mathlib:PowerSeries.IsRestricted.subring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Restricted.lean).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4 and Theorem 2.1, pp. 6–7: The normalized product constructs the exponential in the Drinfeld–lattice correspondence.

**API.**

- **`ALattice.exp`** (constructor): The entire normalized product e\_Λ.
- **`ALattice.exp_add`** (structure): e\_Λ(x+y)=e\_Λ(x)+e\_Λ(y), and e\_Λ(cx)=c e\_Λ(x) for c∈F.
- **`ALattice.exp_ker`** (characterisation): e\_Λ(z)=0 iff z∈Λ.
- **`ALattice.exp_scale`** (functoriality): e\_(cΛ)(cz)=c e\_Λ(z) for c≠0.
- **`ALattice.exp_smul`** (structure): For a compatible scalar tower F→A→C\_∞, e\_Λ(cx)=c e\_Λ(x) for c∈F.

**Checks.**

- **`latticeExp_test_derivative`** (characterisation): The coefficient of z is one.
- **`latticeExp_test_kernel`** (compatibility): For nonzero λ∈Λ, e\_Λ(λ)=0, while e\_Λ(z)≠0 for z∉Λ.
- **`latticeExp_test_scaling`** (computation): Replacing Λ by cΛ conjugates the exponential by z↦cz; omitting its initial z factor fails the derivative test.

**Acceptance.**

- e\_(cΛ)(cz)=c e\_Λ(z).

**Uses.**

- DM.2: Constructs φ\_Λ and identifies morphisms.

**Used by:** [2.4](#dm-2-lattice-drinfeld-module).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-lattice-drinfeld-module"></a>

### 2.4 The module of a lattice

**Target** `DrinfeldModulesAndTModules:DM.2/lattice-drinfeld-module` (construction).

For a≠0, define φ^Λ\_a(X)=aX∏\_{0≠v∈a⁻¹Λ/Λ}(1−X/e\_Λ(v)), and set φ^Λ\_0=0. This is independent of representatives, is q-linearized, and e\_Λ(az)=φ^Λ\_a(e\_Λ(z)). The scalar factor a gives the required derivative a. The map a↦φ^Λ\_a is a rank-r Drinfeld module with r=rank Λ.

**Hypotheses.**

- The generic embedding of A; lattice rank r.

**Proof route.**

- Use the finite F-subspace e\_Λ(a⁻¹Λ/Λ) and its subspace polynomial.
- Compare normalized entire functions with equal simple zeros; the finite quotient determines the degree.
- Surjectivity of e\_Λ proves the additive and multiplicative laws for φ.

**Needs:** [DM.2/lattice-exponential](#dm-2-lattice-exponential); [DM.0/drinfeld-module](#dm-0-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [PAPIKIAN-2017](#source-papikian-2017), Theorem 2.3 and proof, pp. 6–7: The theorem states the functional equation; its displayed finite product needs the factor a, as recorded under sourceIssues.

**API.**

- **`ALattice.drinfeldModule`** (constructor): The Drinfeld module φ^Λ.
- **`ALattice.exp_functionalEquation`** (relation): e\_Λ(az)=φ^Λ\_a(e\_Λ(z)).
- **`ALattice.drinfeldModule_rank`** (compatibility): rank(φ^Λ)=rank Λ.
- **`ALattice.drinfeldModule_scale`** (functoriality): φ^(cΛ)\_a(X)=c φ^Λ\_a(c⁻¹X).

**Checks.**

- **`latticeModule_test_one`** (degenerate): φ^Λ\_1(X)=X.
- **`latticeModule_test_linear`** (non-example): For nonconstant a, the coefficient of X is a, not one.
- **`latticeModule_test_carlitz`** (compatibility): For Λ=πA with the Carlitz period normalization below, φ^Λ=C.

**Acceptance.**

- φ^Λ\_a has derivative a and degree |A/(a)|^r.

**Uses.**

- DM.2: Inverse functor for uniformization.
- DM.3: Analytic points of level moduli.

**Used by:** [2.5](#dm-2-uniformization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-uniformization"></a>

### 2.5 Drinfeld uniformization

**Target** `DrinfeldModulesAndTModules:DM.2/uniformization` (theorem). **Planet:** Drinfeld uniformization theorem.

Every rank-r Drinfeld A-module φ over C\_∞ in generic characteristic has a unique entire F-linear exponential exp\_φ with derivative one and exp\_φ(az)=φ\_a(exp\_φ(z)). It is surjective; its kernel is a projective A-lattice of rank r. These functors give an equivalence between rank-r field Drinfeld modules over C\_∞ and rank-r A-lattices with scalar morphisms. No automatic statement is asserted for arbitrary t-modules or families.

**Hypotheses.**

- C\_∞, generic characteristic, rank r≥1.

**Proof route.**

- For F\[t\], the coefficient recurrence is α\_0=1 and (θ^(q^i)−θ)α\_i=Σ\_{j=1}^{min(r,i)}g\_j α\_(i−j)^(q^j).
- Establish infinite radius and simple zeros from the analytic input.
- The functional equation gives the A-module kernel; quotient torsion counts and the infinite-place finiteness input give projective rank r.
- For general A, restrict along a separating F\[t\]⊂A and recover the full A-action by uniqueness; the exact general-A kernel-rank input is recorded.

**Needs:** [DM.2/lattice-drinfeld-module](#dm-2-lattice-drinfeld-module); [DM.0/rank-general](#dm-0-rank-general); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [BP-RAPID](#source-bp-rapid), Theorem 2.1, p. 7; §2.5, pp. 7–8: The Drinfeld–lattice classification is stated with rank and the field setting.

**Acceptance.**

- A nonprincipal ideal lattice stays projective, not artificially free.
- The exponential of a general t-module may be nonsurjective.

**Used by:** [2.6](#dm-2-exponential-morphisms), [2.7](#dm-2-carlitz-exponential).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-exponential-morphisms"></a>

### 2.6 Morphisms in uniformization

**Target** `DrinfeldModulesAndTModules:DM.2/exponential-morphisms` (comparison).

For φ,ψ of the same positive rank r over C\_∞, differentiation gives a bijection Hom(φ,ψ)≅{c∈C\_∞:cΛ\_φ⊂Λ\_ψ}; the corresponding polynomial u satisfies u(exp\_φ(z))=exp\_ψ(cz). It is compatible with A-actions, identities and composition. In particular scalar homothety classifies isomorphisms.

**Hypotheses.**

- Generic characteristic over C\_∞.
- The two lattices have the same A-rank r. For c≠0 this makes Λ\_ψ/cΛ\_φ finite; different-rank scalar inclusions are excluded.

**Proof route.**

- For c≠0 use equal ranks and finite generation to prove the scalar inclusion has finite index; form the corresponding finite F-subspace polynomial. The zero scalar gives the zero morphism separately.
- Construct u from the finite quotient when c≠0 and use the normalized product.
- Differentiating gives ∂u=c; uniqueness follows from surjectivity.
- Use the functional equations to verify intertwining.

**Needs:** [DM.2/uniformization](#dm-2-uniformization); [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.4, pp. 6–7 (equal-rank lattices): The Weierstrass–Drinfeld dictionary matches intertwiners with lattice scalars.

**Acceptance.**

- A nonzero morphism is separable; c=0 corresponds only to u=0.
- For A=F\[t\], take Λ=A and Λ′=A+Aα with α∈F\_(q²)∖F⊂C\_∞ (so α∉Frac(A)) and the usual infinity embedding. The scalar 1 gives Λ⊂Λ′, but cannot be the differential of a nonzero Ore intertwiner between ranks one and two. This rejects the omitted equal-rank hypothesis.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-carlitz-exponential"></a>

### 2.7 Carlitz exponential and logarithm

**Target** `DrinfeldModulesAndTModules:DM.2/carlitz-exponential` (construction). **Planet:** Carlitz exponential.

For transcendental θ with ‖θ‖=q, exp\_C(z)=Σ\_{i≥0}z^(q^i)/D\_i is entire and satisfies exp\_C(θz)=θ exp\_C(z)+exp\_C(z)^q. The local inverse is log\_C(z)=Σ z^(q^i)/ℓ\_i on its convergence disk, in particular at z=1. The logarithm is not declared entire.

**Hypotheses.**

- A=F\[θ\]; C\_t=θ+τ; the norm normalization above.

**Proof route.**

- Use carlitzD\_succ for the exponential recurrence and degree(D\_i)=i q^i for infinite radius.
- Use carlitzEll\_succ for the logarithm recurrence.
- The normalized local inverse theorem identifies the two series on a sufficiently small disk.

**Needs:** [DM.0/carlitz-products](#dm-0-carlitz-products); [DM.2/uniformization](#dm-2-uniformization).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 3–5: The source gives the exponential coefficients, Carlitz equation and period setting.
- [PAP-v2](#source-pap-v2), §1.2.2, p. 4: The Carlitz logarithm is introduced as the inverse series of the Carlitz exponential, with the denominators (θ−θ^q)⋯(θ−θ^(q^i)), and is said to converge exactly where ‖z‖ is below ‖θ‖^(q/(q−1)); this supplies the disk of the inverse identity.

**API.**

- **`carlitzExp`** (constructor): Σ z^(q^i)/D\_i.
- **`carlitzExp_functionalEquation`** (relation): exp\_C(θz)=θexp\_C(z)+exp\_C(z)^q.
- **`carlitzLog`** (constructor): The local inverse series Σ z^(q^i)/ℓ\_i.
- **`carlitzExp_log_one`** (example): exp\_C(log\_C(1))=1.
- **`carlitzExp_carlitzLog`** (characterisation): For ‖z‖&lt;‖θ‖^(q/(q−1)), which is q^(q/(q−1))=‖π\_BP‖ under the normalization ‖θ‖=q, the series log\_C(z) converges and exp\_C(log\_C(z))=z; log\_C is the compositional inverse of exp\_C on this open disk.

**Checks.**

- **`carlitzExp_test_coeff`** (computation): The z^q coefficient is (θ^q−θ)⁻¹.
- **`carlitzExp_test_zero`** (degenerate): exp\_C(0)=log\_C(0)=0.
- **`carlitzExp_test_log_sign`** (non-example): The z^q coefficient of log\_C is (θ−θ^q)⁻¹; using D\_1 gives the wrong sign in odd characteristic.

**Acceptance.**

- log\_C converges at one because ‖ℓ\_i‖ grows rapidly.

**Uses.**

- DM.6: The Carlitz unit lattice and ζ\_A(1).
- DM.8: Period and logarithm inputs.
- DM.8/carlitz-deformation and DM.8/logarithm-division: A small algebraic argument α with ‖α‖&lt;q^(q/(q−1)) has a convergent logarithm with exp\_C(log\_C(α))=α; the deformation series specializes to it at θ and larger logarithms are divided down to it.

**Used by:** [2.8](#dm-2-carlitz-period), [6.3](#dm-6-unit-lattice), [6.12](#dm-6-small-power-sum), [6.13](#dm-6-carlitz-class-examples), [8.37](#dm-8-carlitz-deformation), [8.56](#dm-8-logarithm-linear-relations), [8.40](#dm-8-logarithm-division).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-carlitz-period"></a>

### 2.8 The Carlitz period

**Target** `DrinfeldModulesAndTModules:DM.2/carlitz-period` (construction). **Planet:** Carlitz period.

Choose ρ∈C\_∞ with ρ^(q−1)=−θ. Set π\_BP=θρ∏\_{i≥1}(1−θ^(1−q^i))⁻¹. Then ker exp\_C=π\_BP A and ‖π\_BP‖=q^(q/(q−1)). Changing ρ by ξ∈F× changes π\_BP by ξ. The source-selected Ngo Dac period is π\_ND=−π\_BP; it generates the same lattice.

**Hypotheses.**

- A=F\[θ\], generic characteristic, chosen ρ.

**Proof route.**

- The factors converge as θ^(1−q^i)→0.
- The product formula for exp\_C and the minimal nonzero zero identify the lattice generator.
- Compute the norm and the root-of-unity dependence.

**Needs:** [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [DM.2/a-lattice](#dm-2-a-lattice).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §2.2, pp. 4–5: The source uses π\_BP; the sign adapter to Ngo Dac’s Ω normalization is specified here.

**API.**

- **`carlitzPeriod`** (constructor): The product π\_BP with the chosen root ρ.
- **`carlitzPeriod_ker`** (characterisation): exp\_C(z)=0 iff z∈π\_BP A.
- **`carlitzPeriod_norm`** (data): ‖π\_BP‖=q^(q/(q−1)).
- **`carlitzPeriod_changeRoot`** (functoriality): Replacing ρ by ξρ replaces π by ξπ.

**Checks.**

- **`carlitzPeriod_test_zero`** (characterisation): π\_BP≠0 and exp\_C(π\_BP)=0.
- **`carlitzPeriod_test_sign`** (compatibility): π\_ND=−π\_BP gives the same A-lattice.
- **`carlitzPeriod_test_norm`** (computation): For q=2, ‖π\_BP‖=4.

**Acceptance.**

- The lattice is independent of multiplication by F×.

**Uses.**

- DM.2: Normalizes Ω(θ) and π^(q−1).
- DM.8: Carlitz period supplier contract.

**Used by:** [8.12](#dm-2-omega), [2.9](#dm-2-period-power), [6.13](#dm-6-carlitz-class-examples), [8.54](#dm-8-carlitz-group), [8.40](#dm-8-logarithm-division).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-2-period-power"></a>

### 2.9 The invariant Carlitz period power

**Target** `DrinfeldModulesAndTModules:DM.2/period-power` (theorem).

π\_BP^(q−1)=π\_ND^(q−1)=−θ^q∏\_{i≥1}(1−θ^(1−q^i))^(−(q−1)) belongs to K\_∞×. It is independent of the root ρ. The period itself need not lie in K\_∞ when q&gt;2.

**Hypotheses.**

- The period/root convention above.

**Proof route.**

- Raise the defining product to q−1 and substitute ρ^(q−1)=−θ.
- The scalar sign between the two periods has (q−1)-st power one.
- Every factor is in K\_∞ and their product converges there.

**Needs:** [DM.2/carlitz-period](#dm-2-carlitz-period).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §4.2, p. 17; §2 notation, pp. 5–7: The period normalization supplies the root-independent power used in depth-one special values.

**Acceptance.**

- For q&gt;2 the valuation −q/(q−1) excludes π from K\_∞, whose valuation group is Z.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-3"></a>

## Layer DM.3: Moduli, modular forms and compactification

Level structures lead to fine moduli under the stated level hypotheses. Generic Satake compactification, reciprocal principal-level models and arithmetic compactification retain their distinct source generalities.

<a id="dm-3-level-structure"></a>

### 3.1 Prime-to-characteristic level structures

**Target** `DrinfeldModulesAndTModules:DM.3/level-structure` (definition). **Planet:** Drinfeld level structure.

For a nonzero proper ideal N⊂A and an A\[1/N\]-scheme S, a full level-N structure on a rank-r Drinfeld module E is an A-linear isomorphism of finite étale S-group schemes (N⁻¹/A)^r\_S→E\[N\]. Here A\[1/N\]=Γ(Spec A−V(N),O); no generator of N is chosen. For N′⊂N, restriction to N-torsion forgets the extra level. The domain is canonically an ideal-quotient module, not a chosen (A/N)^r basis.

**Hypotheses.**

- Rank r fixed; all primes dividing N inverted on S.

**Proof route.**

- Use ideal torsion and its étaleness in DM.1.
- Define the isomorphism functor and its finite étale torsor of frames.
- Restrict along N⁻¹/A⊂N′⁻¹/A and check identity and successive restrictions.

**Needs:** [DM.1/ideal-torsion](#dm-1-ideal-torsion); [DM.1/etale-torsion](#dm-1-etale-torsion); [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), §2, equation (2.4) and Theorem 2.3, pp. 7–8: The good open base uses a group-scheme isomorphism from the fractional-ideal quotient.

**API.**

- **`DrinfeldLevel`** (constructor): An A-linear finite étale group-scheme isomorphism (N⁻¹/A)^r\_S≅E\[N\].
- **`DrinfeldLevel.pullback`** (functoriality): Pullback of E and the level along an A\[1/N\]-scheme map.
- **`DrinfeldLevel.forget`** (functoriality): Restrict a level-N′ structure to N-torsion for N′⊂N.
- **`DrinfeldLevel.change`** (structure): GL\_r(A/N) acts by precomposition after the ideal-quotient identification; the intrinsic frame group is Aut\_A((N⁻¹/A)^r).
- **`DrinfeldLevel.ext`** (extensionality): For the same underlying Drinfeld family, level frames are equal when their finite étale group-scheme maps agree.

**Checks.**

- **`DrinfeldLevel_test_rank_one`** (computation): For Carlitz and (t) away from θ=0, a nonzero t-torsion section gives a full level.
- **`DrinfeldLevel_test_basis`** (non-example): For rank two, sending both basis vectors to the same nonzero torsion point is not a level structure.
- **`DrinfeldLevel_test_characteristic`** (non-example): For φ\_t=τ at characteristic (t), the length-q connected kernel is not isomorphic to the étale constant F-group scheme.

**Acceptance.**

- For A=F\[t\] and N=(t), the level is an ordered F-basis of ker φ\_t.

**Uses.**

- DM.3: Fine moduli, change of level and Hecke correspondences.
- DM.7: Level data transports across the elliptic-sheaf dictionary.

**Used by:** [3.3](#dm-3-moduli-functor), [3.2](#dm-3-fine-moduli-scheme).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-fine-moduli-scheme"></a>

### 3.2 Fine level representability and smoothness

**Target** `DrinfeldModulesAndTModules:DM.3/fine-moduli-scheme` (theorem). **Planet:** Fine Drinfeld moduli scheme.

For any nonzero proper N⊂A, the full level-N functor over Spec A\[1/N\] is represented by an affine smooth scheme M\_r(N) of finite type and relative dimension r−1, with universal family. For a compact open K⊂GL\_r(Â), call K fine if its image in some GL\_r(A/p) is unipotent. Write N\_K for the largest ideal with K(N\_K)⊂K. The K-level moduli scheme over A\[1/N\_K\] is a fine smooth moduli scheme when K is fine; for general K it is coarse. These assertions do not require the two-prime condition needed for an all-characteristics level functor over Spec A.

**Hypotheses.**

- r≥1; A as in DM.0; level primes inverted; K fine for a universal family.

**Proof route.**

- Construct principal-level charts from the standard coefficient and torsion equations.
- Infinitesimal deformations give a formally smooth rank-r−1 space; finite presentation supplies smoothness.
- Use finite quotients and descent. A scalar fixing a fine level acts both semisimply and unipotently on torsion, hence is one.
- The precise chart/deformation proof in Drinfeld §5 is an explicit source proof gap; Hartl–Yu states the result and proves the fine-subgroup extension.

**Needs:** [DM.3/level-structure](#dm-3-level-structure); [DM.0/relative-standardization](#dm-0-relative-standardization); [`SchemeAndStackFoundations:SF.1/finite-group-quotient`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Theorem 2.3, p. 8; Definition 2.6, Lemma 2.7 and Proposition 2.8, pp. 10–11: The source gives the good-open smoothness, level rigidity, and fine/coarse distinction.

**Acceptance.**

- At A=F\[t\], level (t), rank one is zero-dimensional over F(t).
- At rank two the principal-level generic fiber is a smooth affine curve.

**Used by:** [3.3](#dm-3-moduli-functor), [3.6](#dm-3-satake-compactification), [3.9](#dm-3-integral-compactification).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-moduli-functor"></a>

### 3.3 The Drinfeld moduli stack

**Target** `DrinfeldModulesAndTModules:DM.3/moduli-functor` (construction).

For r≥1, define the groupoid over each A-scheme S of rank-r relative Drinfeld modules and their isomorphisms, with pullback along base maps. It is an fpqc stack and a smooth Deligne–Mumford stack of relative dimension r−1 over Spec A. On A\[1/N\], full level-N objects define its frame cover; the quotient groupoid of the fine level scheme by Aut\_A((N⁻¹/A)^r) recovers the unlevelled stack. Its set of isomorphism classes is not its stack structure.

**Hypotheses.**

- Fixed A, rank r and standard relative convention; N nonzero proper on the stated good open.

**Proof route.**

- Descend line bundles, q-linearized action maps and level frames using SF.1/qcoh-fpqc-descent and affine-fpqc-descent; the finite-level torsion supplier has its own recorded gap.
- Construct the fine cover on each good open by fine-moduli-scheme.
- Use two coprime nonzero ideals to cover Spec A; quotient presentations glue and prove the stack assertions.

**Needs:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [DM.3/level-structure](#dm-3-level-structure); [DM.3/fine-moduli-scheme](#dm-3-fine-moduli-scheme); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/finite-quotient-coarse`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Theorem 2.3 and §2 equations (2.7)–(2.9), pp. 8–9; Proposition 2.8, pp. 10–11: The fine-level cover and its finite quotient give the stack presentation; the source states scheme-level results, and stack gluing is a supplier input.

**API.**

- **`DrinfeldModuli`** (constructor): The fibred groupoid of rank-r relative Drinfeld modules.
- **`DrinfeldModuli.pullback`** (functoriality): Base pullback with identity/composition coherence.
- **`DrinfeldModuli.levelAtlas`** (compatibility): The fine level scheme gives an étale atlas on A\[1/N\].
- **`DrinfeldModuli.quotientPresentation`** (equivalence): The quotient stack of the level atlas by the frame group is the unlevelled stack on that base.

**Checks.**

- **`DrinfeldModuli_test_rank_one`** (computation): The unlevelled Carlitz object has the scalar automorphism group F×; a full nontrivial good level has trivial stabilizer.
- **`DrinfeldModuli_test_dimension`** (characterisation): Relative dimensions at ranks one and two are zero and one.
- **`DrinfeldModuli_test_iso_classes`** (non-example): Replacing each groupoid by its set of isomorphism classes loses the automorphism group when q&gt;2.

**Acceptance.**

- Rank-one scalar automorphisms F× remain in the unlevelled groupoid.

**Uses.**

- DM.3: Locates fine level schemes and coarse quotients.
- DM.7: Transports the relative moduli interpretation.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-generalized-drinfeld-module"></a>

### 3.4 Generalized Drinfeld modules

**Target** `DrinfeldModulesAndTModules:DM.3/generalized-drinfeld-module` (definition). **Planet:** Generalized Drinfeld module.

A generalized Drinfeld A-module of rank ≤r over S is a line bundle E with an F-linear A-action, differential γ, every field fiber a Drinfeld module of positive rank ≤r, and the global degree bound φ\_a=Σ\_{i=0}^{r deg\_A(a)}b\_iτ^i. Coefficients b\_i are sections of E^(1−q^i). Isomorphisms preserve the line-bundle structure. Weakly separating means that for each algebraically closed field L over the base, any fixed Drinfeld-module isomorphism class occurs at only finitely many points of S(L). The global bound cannot be replaced by a fiberwise bound on nonreduced bases.

**Hypotheses.**

- S an A-scheme; fixed integer r≥1; standard F-linear line bundle.

**Proof route.**

- Glue the bounded q-linearized coefficient descriptions under line-bundle changes.
- Define field-fiber positivity and weak separation independently of level.
- Pullback preserves generalized families; weak separation is a condition on the resulting classifying map, not invariant under arbitrary positive-dimensional base change.

**Needs:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [PINK-2012](#source-pink-2012), Definitions 3.1–3.2, p. 10; Definition 3.9, p. 13: Generalized families permit rank drops, while weak separation controls compactification uniqueness.

**API.**

- **`GeneralizedDrinfeldModule`** (constructor): Bounded F-linear action on a line bundle with positive-rank field fibers.
- **`GeneralizedDrinfeldModule.coefficient`** (projection): b\_i(a)∈Γ(S,E^(1−q^i)).
- **`GeneralizedDrinfeldModule.pullback`** (functoriality): The degree-bound and fiber conditions survive base pullback.
- **`GeneralizedDrinfeldModule.isWeaklySeparating`** (characterisation): Every geometric isomorphism class has a finite fiber in S(L).
- **`GeneralizedDrinfeldModule.ext`** (extensionality): On a fixed line bundle, equality of all action coefficients on a trivializing cover determines the generalized family; no equality from geometric fibres alone is asserted over a nonreduced base.

**Checks.**

- **`generalized_test_boundary`** (computation): Over F(θ)\[g\], φ\_t=θ+τ+gτ² has generic rank two and rank one at g=0; it is generalized of rank ≤2.
- **`generalized_test_scalar`** (non-example): At a point where all positive τ-coefficients vanish the fiber is scalar, so the family is rejected.
- **`generalized_test_nilpotents`** (non-example): Over F(θ)\[ε\]/(ε²), θ+τ+ετ³ has fiber rank one but fails the rank-≤1 global degree bound.
- **`generalized_test_constant_family`** (non-example): A constant family over a positive-dimensional affine line is not weakly separating.

**Acceptance.**

- Boundary rank drops are positive; a scalar action alone is not allowed.

**Uses.**

- DM.3: Defines generic and arithmetic Satake compactifications and their universal family.

**Used by:** [3.6](#dm-3-satake-compactification), [3.5](#dm-3-reciprocal-compactification), [3.9](#dm-3-integral-compactification).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves); [TauCetiRoadmap AlgebraicVectorBundles l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-reciprocal-compactification"></a>

### 3.5 The principal-level reciprocal model

**Target** `DrinfeldModulesAndTModules:DM.3/reciprocal-compactification` (construction).

Let V=F^r, S=Sym\_F V and Q(V)=Frac(S). In Q(V), let R(V) be generated by 1/v for nonzero v∈V, graded with deg(1/v)=1. Q\_r=Proj R(V) is normal, integral and projective. On A\[1/t\] for A=F\[t\], its open principal-level scheme is the complement of all F-rational hyperplanes in P^(r−1), embedded by reciprocals. The generalized action is φ\_t(X)=tX∏\_{v≠0}(1−(1/v)X) on the line O(−1), and its Lie dual is O(1). It is weakly separating. This model supplies both generic and arithmetic construction seeds.

**Hypotheses.**

- r≥1; q-linearized finite-subspace product imported from FF.4; in the integral model t is inverted.

**Proof route.**

- Use the reciprocal relations 1/(cv)=c⁻¹/v and (1/v)(1/w)=(1/(v+w))(1/v+1/w) when v,w,v+w≠0.
- Construct Proj and identify its dense open by localization.
- Normality of R(V) is the Pink–Schieder input cited by the source; record its uninspected proof as a precise gap.
- The nonvanishing of some degree-one reciprocal at each Proj point prevents rank zero; finite permutations of reciprocal values prove weak separation.
- Expand the product using unordered subsets, one term for each subset of V∖{0}. Do not use the ordered-tuple sum in Hartl–Yu (3.7), p. 18: source issue E8 explains its factorial overcount.

**Needs:** [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/subspace-polynomial-is-linearized`](../packets/FiniteFieldsAndCharacterSums.json); [`SchemeAndStackFoundations:SF.0/relative-proj`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/proj-base-change`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19: The model works over A\[1/t\], and the source reduces normality to Pink–Schieder.

**API.**

- **`DrinfeldReciprocalRing`** (constructor): The graded reciprocal subalgebra R(V)⊂Frac(Sym\_F V).
- **`DrinfeldReciprocalScheme`** (constructor): Q\_r=Proj R(V).
- **`DrinfeldReciprocalScheme.universalAction`** (data): The bounded action tX∏(1−X/v) on O(−1).
- **`DrinfeldReciprocalScheme.lieDual`** (compatibility): Lie(E)∨≅O(1).

**Checks.**

- **`reciprocal_test_rank_one`** (computation): For r=1, the reciprocal ring is a polynomial ring in one degree-one generator, so Proj is a point.
- **`reciprocal_test_rank_two`** (computation): Q\_2 is P¹ and its open removes the q+1 F-rational points.
- **`reciprocal_test_product_scalar`** (non-example): Removing the factor t from φ\_t gives derivative one rather than t and fails the characteristic-map condition.

**Acceptance.**

- At rank one Q\_1 is Spec F; at rank two Q\_2 is P¹.

**Uses.**

- DM.3: The existence proof starts with this explicit principal-level model.

**Used by:** [3.6](#dm-3-satake-compactification), [3.7](#dm-3-modular-forms), [3.9](#dm-3-integral-compactification).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-satake-compactification"></a>

### 3.6 The generic Satake compactification

**Target** `DrinfeldModulesAndTModules:DM.3/satake-compactification` (construction). **Planet:** Drinfeld Satake compactification.

For fine K, a Satake compactification of M\_r(K)/K\_0, where K\_0=Frac(A), is a normal integral proper K\_0-scheme containing M\_r(K) densely, together with a weakly separating generalized Drinfeld module extending its universal family. It exists, is projective, and is unique together with the extension up to unique isomorphism restricting to the given family. This is a generic-fiber theorem; it neither supplies arbitrary integral base change nor an explicit general boundary stratification.

**Hypotheses.**

- r≥1; fine compact open K⊂GL\_r(Â); generic base K\_0.

**Proof route.**

- The normalized closure of the diagonal compares two candidates; extension of isomorphisms and weak separation make its projections finite and hence isomorphisms.
- Construct the F\[t\], (t)-level case by reciprocal-compactification.
- Use normalization for coefficient restriction and finite quotients for change of level, exactly as Pink Lemmas 4.4–4.5 and Theorem 4.2.

**Needs:** [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [DM.3/fine-moduli-scheme](#dm-3-fine-moduli-scheme); [DM.3/reciprocal-compactification](#dm-3-reciprocal-compactification); [`SchemeAndStackFoundations:SF.0/nagata-normalization-finite`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/excellent-examples`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/finite-group-quotient`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PINK-2012](#source-pink-2012), Definition 4.1 and Theorem 4.2, p. 14; proof, pp. 14–16: The universal property uses normality, weak separation and extension of the generic family.

**API.**

- **`DrinfeldSatake`** (constructor): The normal proper generic compactification with its generalized family.
- **`DrinfeldSatake.openImmersion`** (projection): M\_r(K)↪M̄\_r(K), dense.
- **`DrinfeldSatake.unique`** (universal-property): A unique compatible isomorphism joins any two such compactifications.
- **`DrinfeldSatake.changeLevel`** (functoriality): A finite level map extends uniquely to the compactifications, compatibly with compositions.

**Checks.**

- **`satake_test_rank_one`** (degenerate): The compactification equals the zero-dimensional rank-one moduli scheme.
- **`satake_test_rank_two`** (computation): For F\[t\] and level (t), its generic rank-two compactification is P¹ with q+1 cusps.
- **`satake_test_general_boundary`** (non-example): Normal projectivity and weak separation alone do not provide a named disjoint union of every lower-rank moduli stratum.

**Acceptance.**

- At rank one there is no smaller positive-rank boundary.
- At rank two and A=F\[t\], level (t), the compactification is P¹ and has q+1 missing rational points.

**Uses.**

- DM.3: Carries the modular-form line and compact Hecke maps.

**Used by:** [3.7](#dm-3-modular-forms), [3.8](#dm-3-hecke-correspondence).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-modular-forms"></a>

### 3.7 Algebraic Drinfeld modular forms

**Target** `DrinfeldModulesAndTModules:DM.3/modular-forms` (definition). **Planet:** Drinfeld modular form.

On the generic Satake compactification for fine K, set ω=Lie(E)∨ and M\_k(K)=H⁰(M̄\_r(K),ω^⊗k), k≥0; a cusp form vanishes on the reduced boundary. The multiplication of sections makes ⊕\_k M\_k(K) a graded K\_0-algebra. The line ω is ample and the section ring is a finitely generated normal integral domain whose Proj recovers M̄. For nonfine K use invariants at a fine normal sublevel, not a nonexistent universal line on coarse moduli. These are algebraic modular forms; their agreement with analytic holomorphy is a separate comparison.

**Hypotheses.**

- Generic base; k a nonnegative integer; fine K for the line-bundle formulation.

**Proof route.**

- Identify the Lie dual under standard coordinates.
- Pull back to the reciprocal model and use finite-surjective descent of ampleness.
- Import SF.2/ample-serre-vanishing under its proper Noetherian ample hypotheses and SF.0/relative-proj. Use the existing AlgebraicVectorBundles Lie-dual interface. The finite-quotient projectivity and normal section-ring/Proj comparisons are separate recorded inputs.
- Take fine-level invariants to make level-independent spaces for general K.

**Needs:** [DM.3/satake-compactification](#dm-3-satake-compactification); [DM.3/reciprocal-compactification](#dm-3-reciprocal-compactification); [`SchemeAndStackFoundations:SF.2/ample-serre-vanishing`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/relative-proj`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PINK-2012](#source-pink-2012), Lemma 5.1, p. 19; Theorem 5.3, Definition 5.4, Proposition 5.5 and Theorem 5.6, p. 20; Theorem 5.7, p. 21: The ample Lie-dual line defines algebraic forms, and coarse levels are handled by invariants.

**API.**

- **`DrinfeldModularForm`** (constructor): Global sections of ω^⊗k.
- **`DrinfeldModularForm.mul`** (structure): Weight-k and weight-l sections multiply to weight k+l.
- **`DrinfeldModularForm.cusp`** (characterisation): Kernel of restriction to the reduced boundary.
- **`DrinfeldModularForm.levelInvariants`** (compatibility): At a fine normal sublevel K′, M\_k(K)=M\_k(K′)^(K/K′).
- **`DrinfeldModularForm.ext`** (extensionality): Global modular-form sections are equal when their restrictions on an open cover agree. Evaluation at geometric points is not used as extensionality on a possibly nonreduced base.

**Checks.**

- **`modularForm_test_one`** (degenerate): The constant section 1 is a weight-zero form.
- **`modularForm_test_rank_two`** (computation): At A=F\[t\], level (t), rank two, ω has degree q and dim M\_k=qk+1; for k≥1 the q+1 cusp vanishing conditions give dim cusp forms qk−q.
- **`modularForm_test_boundary`** (non-example): A section on the open moduli scheme with a pole at a cusp is not a global section on the compactification.

**Acceptance.**

- Weight zero is the ring of global functions of the projective compactification.

**Uses.**

- DM.3: Hecke pullback, trace and graded ring.
- Function-field modular-form consumers: Algebraic form spaces with a precise line convention.

**Used by:** [3.8](#dm-3-hecke-correspondence).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-hecke-correspondence"></a>

### 3.8 Drinfeld Hecke correspondences and operators

**Target** `DrinfeldModulesAndTModules:DM.3/hecke-correspondence` (construction). **Planet:** Drinfeld Hecke correspondence.

For g∈GL\_r(A\_f) with entries in Â and compact open K, put K′=K∩g⁻¹Kg. The correspondence is M\_r(K)←J\_1 M\_r(K′)→J\_g M\_r(K), using quotient isogenies. Its maps extend finitely to the generic Satake compactifications. The induced operator on weight-k forms is T\_g=(J\_g)\_\*∘J\_1^\*, with pullback composed with the isogeny’s Lie-dual identification and pushforward defined by the finite coset trace. It depends only on KgK. For gK′g⁻¹⊂K, (J\_g)\_\*J\_g^\*=\[K:gK′g⁻¹\] id; the integer is viewed in characteristic p and may be zero.

**Hypotheses.**

- Generic-fiber moduli; g integral at every finite place for the specified line normalization; use fine sublevels and invariants if K is not fine.

**Proof route.**

- Construct quotient isogenies from ideal torsion, and identify the Lie line in generic characteristic.
- Extend the finite maps and isogenies by Satake uniqueness and generalized-family extension.
- Use a common normal fine level and sum translates to define trace; independence follows from subgroup transitivity.
- Double-coset convolution follows from the finite correspondence decomposition, without dividing by its degree.

**Needs:** [DM.3/modular-forms](#dm-3-modular-forms); [DM.3/satake-compactification](#dm-3-satake-compactification); [DM.1/ideal-torsion](#dm-1-ideal-torsion); [DM.0/isogeny-rank](#dm-0-isogeny-rank); [`SchemeAndStackFoundations:SF.1/finite-group-quotient`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/nagata-normalization-finite`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PINK-2012](#source-pink-2012), Propositions 2.6–2.7, pp. 6–7; Proposition 4.11, p. 18; Lemma 5.1, p. 19; §6 equations (6.1)–(6.9), pp. 21–23; Proposition 6.10, pp. 23–24: The normalization is pullback by J\_1 followed by trace along J\_g; degree is not inverted.

**API.**

- **`DrinfeldHecke`** (constructor): The pair J\_1,J\_g from K∩g⁻¹Kg.
- **`DrinfeldHecke.pullback`** (functoriality): The section map using the Lie-dual identification.
- **`DrinfeldHecke.trace`** (data): The coset sum pushforward.
- **`DrinfeldHecke.operator`** (data): T\_g=(J\_g)\_\*J\_1^\*.
- **`DrinfeldHecke.doubleCoset`** (characterisation): KgK=KhK implies T\_g=T\_h.

**Checks.**

- **`Hecke_test_identity`** (degenerate): For g=1 and K′=K, T\_1=id.
- **`Hecke_test_level_trace`** (compatibility): For a fine normal sublevel K′⊂K, trace∘pullback=\[K:K′\] id.
- **`Hecke_test_characteristic_index`** (non-example): If p divides \[K:K′\], that composite is zero on forms; a normalized trace dividing by the degree is undefined.

**Acceptance.**

- A change of level with g=1 has pullback followed by trace equal to its finite index.

**Uses.**

- DM.3: Computes modular-form change of level and Hecke actions.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="dm-3-integral-compactification"></a>

### 3.9 The arithmetic Satake compactification

**Target** `DrinfeldModulesAndTModules:DM.3/integral-compactification` (theorem).

For every fine compact open K⊂GL\_r(Â), with N\_K the largest ideal satisfying K(N\_K)⊂K, M\_r(K) over Spec A\[1/N\_K\] has a normal integral projective flat Satake compactification carrying a weakly separating generalized Drinfeld module extending the universal family. Both are unique up to unique compatible isomorphism, and the Lie-dual line is ample. For fine K′⊂K, the level map extends to a finite surjective open map after extending the base to A\[1/N\_K′\], and pulls back the family and Lie-dual line. No flatness of this finite level map or normality/Cohen–Macaulayness of every special fiber is asserted.

**Hypotheses.**

- r≥1; fine K; excellent Dedekind A; the indicated good open base, not Spec A with level primes retained.

**Proof route.**

- Use the explicit reciprocal model over F\[t,1/t\] as the seed.
- For coefficient restriction, normalize the closure of the fine moduli image in that seed; generalized action maps extend over a normal base.
- Take the finite quotient at a principal sublevel; fineness descends the line bundle, normality and weak separation.
- Dedekind-base torsion-freeness gives flatness; finite-surjective descent gives ampleness.
- Normalized diagonal uniqueness and common-level quotients prove level functoriality.

**Needs:** [DM.3/reciprocal-compactification](#dm-3-reciprocal-compactification); [DM.3/fine-moduli-scheme](#dm-3-fine-moduli-scheme); [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [`SchemeAndStackFoundations:SF.0/nagata-normalization-finite`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/excellent-examples`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/finite-group-quotient`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-YU-2025](#source-hartl-yu-2025), Definition 3.1, Theorem 3.2 and Lemmas 3.3, 3.6–3.8 with proofs, pp. 12–16; Proposition 3.11, pp. 18–19: This is the separately sourced integral extension; the source explicitly distinguishes finite level maps from flat maps.

**Acceptance.**

- For F\[t\], level (t), the model is Q\_r×Spec F\[t,1/t\].
- Its generic fiber is Pink’s compactification by the defining universal property.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM3`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-4"></a>

## Layer DM.4: Anderson modules and algebraic motives

Effective A-motives, abelian t-modules and dual motives retain their variance. The rational pre-t-motive category is algebraic: tensor products, duals, internal Hom and rationalization use coefficient Frobenius without Tate or entire-series inputs. Uniformizability is defined here; its rigid-analytic comparison belongs to DM.8.

<a id="dm-4-t-module"></a>

### 4.1 Anderson t-modules

**Target** `DrinfeldModulesAndTModules:DM.4/t-module` (definition). **Planet:** Anderson t-module.

For A=F\[t\] and an F-algebra field L with γ(t)=θ, a d-dimensional t-module is the F-algebra map Φ:F\[t\]→Mat\_d(L{τ}) acting on G\_a^d such that dΦ\_t=θI\_d+N with N nilpotent. More intrinsically, an Anderson A-module over R is fpqc-locally G\_a^d as an F-module scheme and satisfies (dΦ\_a−γ(a)I)^d=0 for every a∈A. Morphisms are matrices U with UΦ\_a=Ψ\_aU. Abelianness means that its contravariant motive is finite locally free over A⊗F R; it is an additional hypothesis.

**Hypotheses.**

- d≥1 for nontrivial examples; polynomial-ring field coordinate version and relative Anderson version distinguished.

**Proof route.**

- Use FF.4 entrywise to identify F-linear polynomial maps with matrices over the Ore ring.
- Use the polynomial algebra-map universal property; the nilpotent differential at t implies the required condition for every a.
- Define the matrix intertwiners and their category laws.
- Descend the coordinate description to fpqc forms, using SF.1 affine and quasicoherent fpqc descent.

**Needs:** [DM.0/drinfeld-module](#dm-0-drinfeld-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 1.2, p. 2; Definition 3.1, p. 7; Lemma 3.2 and Remark 3.3, p. 8: The relative definition records the nilpotent differential and abelianness; the coordinate motive is a row module.

**API.**

- **`TModule`** (constructor): The matrix Ore action with nilpotent differential at t.
- **`TModule.differential`** (projection): The constant-coefficient matrix dΦ\_t.
- **`TModule.Hom`** (constructor): Polynomial intertwiners UΦ\_t=Ψ\_tU.
- **`TModule.isAbelian`** (characterisation): M(Φ) is finite locally free over L\[t\].
- **`TModule.ofDrinfeld`** (compatibility): The dimension-one matrix action of a Drinfeld F\[t\]-module.
- **`TModule.ext`** (extensionality): In fixed affine coordinates over F\[t\], equality of the action of t determines the t-module.
- **`TModule.Hom.id`** (constructor): The identity intertwiner is the identity Ore matrix.
- **`TModule.Hom.comp`** (structure): Compose intertwiners by matrix multiplication; associativity and identity laws follow from the native matrix laws.

**Checks.**

- **`TModule_test_carlitz`** (compatibility): For d=1 and Φ\_t=θ+τ the differential is θ and the motive has rank one.
- **`TModule_test_nilpotent`** (computation): For Φ\_t=θI\_2+\[\[0,1\],\[0,0\]\], the nilpotent part squares to zero and is allowed.
- **`TModule_test_semisimple_differential`** (non-example): A diagonal differential diag(θ,θ+1) fails the nilpotence condition.
- **`TModule_test_nonabelian`** (non-example): The scalar action Φ\_t=θI\_d is a t-module but, for d&gt;0, its row motive is not finite over L\[t\].

**Acceptance.**

- Rank-one Drinfeld modules are dimension-one Anderson modules, while motive rank need not equal dimension.

**Uses.**

- DM.4: The motive functor and tensor-power examples.
- DM.8: Only abelian/A-finite, analytically trivial eligible objects enter period theorems.

**Used by:** [4.3](#dm-4-contravariant-motive), [4.6](#dm-4-uniformizability), [4.9](#dm-4-star-adapter).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-effective-a-motive"></a>

### 4.2 Effective A-motives

**Target** `DrinfeldModulesAndTModules:DM.4/effective-a-motive` (definition). **Planet:** Effective A-motive.

Put A\_R=A⊗F R, σ=id\_A⊗Frob\_q,R and J=ker(A\_R→R, a⊗b↦γ(a)b). An effective A-motive of rank r and dimension d is a finite projective A\_R-module M of rank r with an injective A\_R-linear map τ\_M:σ\* M→M whose cokernel is locally free of rank d over R and annihilated by J^d. Without specifying dimension, Hartl calls a motive effective when some J^n kills the cokernel; this weaker condition alone does not define dimension d over a nonreduced base. Here σ\*M=M⊗\_(A\_R,σ) A\_R. Morphisms are A\_R-linear maps commuting with this linearized Frobenius. For polynomial A over a field, coker dimension is d and (t−θ)^n kills it for some n; d also bounds a nilpotence exponent. No perfection of R is required.

**Hypotheses.**

- A as in DM.0; commutative F-algebra R and characteristic map γ; locally constant r,d.

**Proof route.**

- Define scalar extension along σ with native tensor products and its linearized map.
- Form the module cokernel and support at J.
- Over nonreduced or imperfect coefficients use linearization, not the raw semilinear image; scalar extension is essential.
- Retain J^d coker τ\_M=0 in the dimension-d structure. Over a field the dimension bound follows from nilpotence on a d-dimensional vector space; that argument does not extend to an arbitrary nonreduced R.

**Needs:** [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge); [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 1.1, p. 2; Definition 2.1, p. 4; Proposition 2.3, pp. 5–6; Proposition 2.4, p. 6: Finite projectivity, the linearized map and relative cokernel distinguish effective motives from arbitrary difference modules.

**API.**

- **`EffectiveAMotive`** (constructor): Finite projective M with τ\_M:σ\*M→M and the specified cokernel.
- **`EffectiveAMotive.rank`** (data): The A\_R-module rank.
- **`EffectiveAMotive.dimension`** (data): The R-rank of coker τ\_M.
- **`EffectiveAMotive.baseChange`** (functoriality): Coefficient extension carries the linearized Frobenius and its support ideal.
- **`EffectiveAMotive.matrix`** (compatibility): For free L\[t\]^r, a matrix Θ with det Θ=c(t−θ)^d, c∈L×, gives rank r and dimension d; the cokernel nilpotence must be checked.
- **`EffectiveAMotive.dimension_bound`** (characterisation): For dimension d the cokernel is locally free of R-rank d and J^d annihilates it. An unspecified annihilating power is a weaker effective condition.
- **`EffectiveAMotive.matrix_ext`** (extensionality): For free polynomial-ring motives in the same fixed basis, equality of Frobenius matrices determines the coordinate object; abstract projective motives use Frobenius-compatible isomorphisms.

**Checks.**

- **`EffectiveAMotive_test_carlitz`** (computation): For M=L\[t\], τ\_M is multiplication by t−θ after q-coefficient twist; rank=dimension=1.
- **`EffectiveAMotive_test_tensor`** (computation): Multiplication by (t−θ)^n on rank-one L\[t\] has dimension n.
- **`EffectiveAMotive_test_support`** (non-example): Multiplication by t−b with b≠θ has cokernel at the wrong characteristic point.
- **`EffectiveAMotive_test_linearization`** (non-example): Over an imperfect L, the set of values of the raw q-semilinear τ need not be an L-submodule and cannot be used directly as its module cokernel.
- **`EffectiveAMotive_test_nonreduced_bound`** (non-example): For R=F\[ε\]/(ε²), γ(t)=0 and τ\_M multiplication by t−ε on R\[t\], coker τ\_M≅R has rank one and is killed by t², but not by t. It is effective in the unspecified-dimension sense and fails Hartl’s dimension-one condition.

**Acceptance.**

- The Frobenius fixes A and raises only coefficient-ring elements to q-th powers.

**Uses.**

- DM.4: Contravariant anti-equivalence.
- DM.5: Rational motive category and Tate realizations.
- DM.1 and DM.7: Characteristic completion and torsion comparisons.

**Used by:** [1.2](#dm-1-finite-flat-torsion), [1.7](#dm-1-characteristic-local-realization), [4.3](#dm-4-contravariant-motive), [4.4](#dm-4-abelian-antiequivalence), [4.5](#dm-4-purity), [4.8](#dm-4-inverse-twist-dual-motive), [5.1](#dm-5-rational-motive-realization).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-contravariant-motive"></a>

### 4.3 The contravariant motive functor

**Target** `DrinfeldModulesAndTModules:DM.4/contravariant-motive` (construction).

For an Anderson A-module E/R, set M(E)=Hom\_(F-module schemes/R)(E,G\_a,R). A acts by precomposition with φ\_a and R acts by postcomposition with scalars; τ acts by postcomposition with q-Frobenius. When E is coordinate G\_a^d this is the row module R{τ}^{1×d}. For a morphism f:E→E′, M(f):M(E′)→M(E) is precomposition by f. If E is abelian of rank r and dimension d, this is an effective A-motive and coker τ\_M≅Hom\_R(Lie E,R).

**Hypotheses.**

- The relative abelianness condition for the effective-motive conclusion; coordinate description valid without it.

**Proof route.**

- Entrywise FF.4 gives the row representation.
- The A-action is right composition with φ\_a and commutes with left τ and R.
- Differentiation kills the linearized τ-image, producing the Lie-dual quotient.
- Finite projectivity and support at J follow from abelianness and the nilpotent differential.

**Needs:** [DM.4/t-module](#dm-4-t-module); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Remark 3.3, p. 8; Theorem 3.5 and proof, pp. 8–9: Precomposition makes the functor contravariant; the explicit proof fixes the source display’s reversed Hom convention.

**API.**

- **`TModule.motive`** (constructor): M(Φ)=L{τ}^{1×d} with right-composition t-action.
- **`TModule.motiveMap`** (functoriality): For U:Φ→Ψ, M(U):M(Ψ)→M(Φ), m↦mU.
- **`TModule.motiveMap_comp`** (structure): M(VU)=M(U)∘M(V).
- **`TModule.motiveLieDual`** (compatibility): coker τ\_M≅(Lie Φ)∨ in the abelian range.

**Checks.**

- **`motive_test_carlitz`** (computation): With generator 1, the Carlitz relation is τ·1=(t−θ)·1.
- **`motive_test_variance`** (non-example): A map Φ→Ψ produces a map M(Ψ)→M(Φ), not one in the original direction.
- **`motive_test_dimension_rank`** (computation): The n-th Carlitz tensor power has motive rank one and Lie-dual quotient dimension n.
- **`motive_test_scalar_not_finite`** (non-example): For Φ\_t=θ on G\_a, each τ^i is a t-eigenvector of eigenvalue θ^(q^i); the row motive is not finitely generated over L\[t\].

**Acceptance.**

- An intertwiner U is sent to right multiplication by U on row motives.

**Uses.**

- DM.4: Recovering the Anderson module.
- DM.5 and DM.7: Transports Hom and realization comparisons.

**Used by:** [1.4](#dm-1-geometric-torsion-basis), [4.4](#dm-4-abelian-antiequivalence), [4.7](#dm-4-carlitz-tensor-power), [5.1](#dm-5-rational-motive-realization), [5.8](#dm-5-tate-semisimplicity), [7.3](#dm-7-drinfeld-to-sheaf).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves); [TauCetiRoadmap AlgebraicVectorBundles l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-abelian-antiequivalence"></a>

### 4.4 The abelian Anderson anti-equivalence

**Target** `DrinfeldModulesAndTModules:DM.4/abelian-antiequivalence` (theorem). **Planet:** Anderson motive anti-equivalence.

The contravariant functor E↦M(E) is fully faithful from abelian Anderson A-modules over R to effective A-motives. Its essential image consists exactly of effective motives that become finite free left R′{τ}-modules after a faithfully flat coefficient extension R→R′. Rank over A\_R is the Anderson rank, and coker τ\_M has R-rank equal to the group dimension. For polynomial A over a field, the corresponding category is effective L\[t\]-motives finite free over L{τ}; this is not the category of all effective A-motives.

**Hypotheses.**

- Same coefficient algebra and characteristic; abelianness and fpqc-local Ore freeness; no generic-characteristic assumption in the relative theorem.

**Proof route.**

- Choose an Ore basis after faithfully flat extension.
- Right matrices for the A-action reconstruct φ; the cokernel condition gives its nilpotent differential.
- Intertwiner matrices identify Hom in the reversed direction.
- Use effective fpqc descent of affine groups and morphisms to descend the reconstructed object.

**Needs:** [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 3.5 and proof, pp. 8–9: The theorem gives full faithfulness and the precise fpqc-local Ore-free essential image.

**Acceptance.**

- The n-th Carlitz tensor motive reconstructs an n-dimensional t-module.
- A general effective motive without local Ore freeness is not assigned an Anderson module.

**Used by:** [4.5](#dm-4-purity), [4.7](#dm-4-carlitz-tensor-power), [5.7](#dm-5-tate-surjectivity), [7.4](#dm-7-elliptic-antiequivalence), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-purity"></a>

### 4.5 Purity of polynomial-ring motives

**Target** `DrinfeldModulesAndTModules:DM.4/purity` (definition). **Planet:** Pure t-motive.

For an abelian t-motive M of rank r over L\[t\], extend it to L((1/t)). It is pure if there are positive integers u,v and an L\[\[1/t\]\]-lattice H of rank r such that t^uH=τ^vH, interpreted via v-fold linearized coefficient Frobenius. The weight is u/v, independent of this choice, and equals d/r for a nonzero pure effective motive of dimension d. Purity is additional data/property, not part of the definition of every t-module or every effective motive.

**Hypotheses.**

- Polynomial A; pure effective finite-rank motive; the positive-dimension weight statement is in this range.
- The raw Frobenius-image lattice formulation in the Suggested coordinate model uses perfect L; over imperfect coefficients use the linearized scalar-pullback formulation, not an unlinearized image.

**Proof route.**

- Specify the infinity lattice and iterate of the linearized map.
- Compare determinants of τ^v on the lattice to identify u/v=d/r.
- A common iterate compares two choices and proves weight independence.

**Needs:** [DM.4/effective-a-motive](#dm-4-effective-a-motive); [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §4.1, p. 15: Purity uses a Frobenius-stable infinity lattice and fixes the rank/dimension weight convention.
- [MAURISCHAT-2026](#source-maurischat-2026), Definition 7.1, p. 35: Weight is d/r and agrees with u/v for every purity-lattice witness; raw Frobenius is used over perfect coefficients.

**API.**

- **`EffectiveTMotive.isPure`** (characterisation): Existence of an infinity lattice with t^uH=τ^vH.
- **`EffectiveTMotive.weight`** (data): Define weight as d/r; for a pure nonzero motive it equals u/v for every purity-lattice witness.
- **`EffectiveTMotive.weight_eq`** (compatibility): For every purity lattice with positive u,v, weight=u/v=d/r; therefore the witness does not change the weight.
- **`EffectiveTMotive.pureTensor`** (functoriality): Tensor products of pure motives are pure with weights added.
- **`EffectiveTMotive.PureLattice`** (characterisation): A specified pair of positive integers u,v and an infinity lattice H satisfy the spanning, rank and equality t^uH=τ^vH conditions.

**Checks.**

- **`purity_test_carlitz`** (computation): Carlitz has r=d=1 and weight one.
- **`purity_test_tensor_power`** (computation): The n-th Carlitz tensor power has r=1,d=n and weight n.
- **`purity_test_mixed`** (non-example): The direct sum of Carlitz and its second tensor power has different slopes one and two and is not pure.

**Acceptance.**

- Carlitz tensor power n has weight n, not 1/n.

**Uses.**

- DM.4: Distinguishes eligible analytic motives.
- DM.8: Purity hypotheses must be retained when a period theorem uses them.

**Used by:** [4.7](#dm-4-carlitz-tensor-power).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-uniformizability"></a>

### 4.6 Uniformizable t-modules

**Target** `DrinfeldModulesAndTModules:DM.4/uniformizability` (definition).

For an abelian t-module E over C\_∞ with differential θI+N, its unique normalized entire exponential exp\_E:C\_∞^d→E(C\_∞) intertwines dΦ\_t with Φ\_t. Uniformizable means this map is surjective. Its kernel Λ\_E is discrete and carries the differential A-action. Export this predicate and the exponential to DM.8, whose rigid-triviality comparison identifies it with analytic triviality under the abelian hypotheses. The rigid predicate and its comparison are owned by DM.8; they are not prerequisites for defining exp\_E or uniformizability here.

**Hypotheses.**

- C\_∞; abelian t-module, generic characteristic, exact analytic hypotheses of the selected theorem.
- In the normed coordinate prototype, 1&lt;‖θ‖ is an argument of the exponential and the predicates themselves; no arbitrary special-characteristic exponential is posited.

**Proof route.**

- Solve the matrix coefficient recurrence; the nilpotent differential gives unique coefficients and infinite radius.
- Form the kernel and the surjectivity predicate using the actual exponential map.
- Export the normalized exponential, its kernel and the surjectivity predicate to the DM.8 rigid-triviality comparison; its proof is the consumer’s responsibility. No circular prerequisite on that comparison is introduced.

**Needs:** [DM.2/c-infinity](#dm-2-c-infinity); [DM.4/t-module](#dm-4-t-module); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §3.1, pp. 8–10; Theorem 4.2, §4.1, p. 16: The source makes surjectivity a separate property and states the analytic triviality equivalence in the abelian setting.

**API.**

- **`TModule.exp`** (constructor): The normalized entire differential-intertwining exponential.
- **`TModule.exp_functionalEquation`** (relation): exp\_E(dΦ\_t z)=Φ\_t(exp\_E z).
- **`TModule.isUniformizable`** (characterisation): Function.Surjective exp\_E.
- **`TModule.periodLattice`** (data): ker exp\_E with the differential A-action.

**Checks.**

- **`uniformizable_test_drinfeld`** (compatibility): For d=1 and a Drinfeld module over C\_∞, the exponential and lattice agree with DM.2.
- **`uniformizable_test_tensor_power`** (computation): Every positive Carlitz tensor power is uniformizable.
- **`uniformizable_test_predicate`** (non-example): For an object whose exponential image is a proper subgroup, the surjectivity predicate is false even if its exponential is entire.

**Acceptance.**

- Every field Drinfeld module in DM.2 is uniformizable, but the definition for general t-modules retains surjectivity as a condition.

**Uses.**

- DM.4: Uniformization of Carlitz tensor powers.
- DM.8: Eligibility for period and logarithm statements.

**Used by:** [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-carlitz-tensor-power"></a>

### 4.7 Carlitz tensor powers

**Target** `DrinfeldModulesAndTModules:DM.4/carlitz-tensor-power` (construction). **Planet:** Carlitz tensor power.

For n≥1 define C^⊗n on G\_a^n by Φ\_t=θI\_n+N\_n+E\_(n,1)τ, where N\_n has ones on the superdiagonal. It is abelian and pure. Its contravariant motive is free of rank one over L\[t\], with τ m=(t−θ)^n m; its group dimension is n and motive rank is one. Under tensor products of motives, these rank-one motives multiply their exponents.

**Hypotheses.**

- n≥1; L is a perfect coefficient field of generic characteristic. Extension to C∞ and uniformizability are the outgoing comparison DM.8/anderson-comparison.

**Proof route.**

- Construct the nilpotent matrix and its bottom-left Frobenius term.
- Use the row-generator relations to compute the cyclic L\[t\]-motive and its cokernel.
- The infinity-lattice relation gives purity and weight n. Uniformizability over C∞ is a consequence of DM.8/anderson-comparison using Ω^n; it is not an incoming analytic dependency of this algebraic construction.

**Needs:** [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence); [DM.4/purity](#dm-4-purity).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §3.3, pp. 10–11; §4.3, pp. 16–17: The matrix has nilpotent superdiagonal and bottom-left τ, and the motive has rank one.

**API.**

- **`carlitzTensor`** (constructor): The n-dimensional matrix t-module.
- **`carlitzTensor_differential`** (simp): dΦ\_t=θI+N\_n, with N\_n^n=0.
- **`carlitzTensor_motive`** (compatibility): M(C^⊗n)≅L\[t\], τ m=(t−θ)^n m.
- **`carlitzTensor_rank_dimension`** (data): Motive rank one and dimension n.

**Checks.**

- **`carlitzTensor_test_one`** (compatibility): n=1 is the Carlitz module.
- **`carlitzTensor_test_two`** (computation): For n=2, t·(x,y)=(θx+y,θy+x^q).
- **`carlitzTensor_test_rank`** (non-example): For n=2 the motive rank is one, not two, while its τ-cokernel has L-dimension two.

**Acceptance.**

- At n=1 recover θ+τ.

**Uses.**

- DM.4: Checks motive and dual conventions.
- DM.8: Period matrix Ω^n and positive-characteristic special values.

**Used by:** [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-inverse-twist-dual-motive"></a>

### 4.8 Effective dual t-motives

**Target** `DrinfeldModulesAndTModules:DM.4/inverse-twist-dual-motive` (definition). **Planet:** Effective dual t-motive.

Over a perfect coefficient field L containing F, let L\[t,σ\] have σc=c^(1/q)σ and σt=tσ. An effective dual t-motive is a finite free L\[t\]-module H with inverse-q-semilinear σ and (t−θ)^ℓ(H/σH)=0 for some ℓ≥0; the image here is an L\[t\]-submodule because L is perfect. In the finite-dimensional t-module correspondence also require H finite free over L\[σ\], of rank d; call that condition A-finiteness on the dual side. These two versions are distinguished explicitly. The Ngo Dac source uses the first, broader effective definition.

**Hypotheses.**

- L perfect; generic θ in period applications; the L\[σ\]-freeness condition is not silently added to Ngo Dac Definition 4.1.

**Proof route.**

- Import inverse coefficient twisting from DM.8.
- Define the Ore module with variable t fixed by the twist.
- Use its σ-cokernel to express characteristic support; maintain the stronger Ore-freeness eligibility as a separate condition.
- Use inverse iterateFrobeniusEquiv on the perfect algebraic coefficient field, extended to polynomial coefficients. No Tate algebra, arithmetic entire ring or analytic coefficient twist is needed.

**Needs:** [DM.4/effective-a-motive](#dm-4-effective-a-motive); [`mathlib:iterateFrobeniusEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), Definition 4.1 and §4.1, pp. 16–17: The effective definition fixes σ-direction and characteristic support, without requiring L\[σ\]-freeness.

**API.**

- **`EffectiveDualTMotive`** (constructor): Finite free L\[t\]-module H with inverse-twist σ and characteristic-supported quotient.
- **`EffectiveDualTMotive.matrix`** (projection): In a basis, σh=Φh with inverse coefficient twist.
- **`EffectiveDualTMotive.isAFinite`** (characterisation): The corresponding row Ore module is finite free over L\[σ\].
- **`EffectiveDualTMotive.baseChange`** (functoriality): Perfect coefficient extension preserves the defining matrix and support condition.
- **`EffectiveDualTMotive.ext`** (extensionality): In a fixed polynomial basis and with fixed inverse Frobenius, equality of the Frobenius matrices determines the dual motive.

**Checks.**

- **`dualMotive_test_carlitz`** (computation): For H=L\[t\], σh=(t−θ)h, the quotient has dimension one.
- **`dualMotive_test_tensor`** (computation): σh=(t−θ)^n h gives rank one and quotient dimension n.
- **`dualMotive_test_twist`** (non-example): Using q-th coefficient powers instead of q-th roots changes σc=c^(1/q)σ and fails the inverse-twist relation.

**Acceptance.**

- A rank-one Carlitz dual motive has σh=(t−θ)^n h.

**Uses.**

- DM.4: The star adapter and point realization.
- DM.8 and characteristic-p multiple-zeta consumers: Difference equations with the Ngo Dac σ convention.

**Used by:** [4.9](#dm-4-star-adapter), [4.10](#dm-4-dual-realization), [8.17](#dm-8-rigid-triviality), [8.19](#dm-8-fundamental-betti-basis), [8.20](#dm-8-integral-trivialization), [8.21](#dm-8-betti-exact-tensor), [8.22](#dm-8-neutral-category), [8.34](#dm-8-tannakian-identification), [8.52](#dm-8-specialization-rank), [8.38](#dm-8-logarithm-matrices), [8.39](#dm-8-logarithm-motive-membership), [8.41](#dm-8-constant-denominator), [4.12](#dm-4-rationalization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-star-adapter"></a>

### 4.9 The star anti-isomorphism

**Target** `DrinfeldModulesAndTModules:DM.4/star-adapter` (construction).

For a scalar Ore polynomial f=Σ a\_iτ^i set f\*=Σ a\_i^(1/q^i)σ^i. Then (fg)\*=g\*f\*. For matrices also transpose: (U\*)\_(ij)=(U\_(ji))\* so that (UV)\*=V\*U\*. Given a coordinate t-module Φ, its row dual motive is L\[σ\]^{1×d} with t acting on the right by Φ\_t\*. An intertwiner U:Φ→Ψ induces h↦hU\* from the row module for Φ to that for Ψ, so this dual construction is covariant. Finite freeness over L\[t\] is a separate A-finiteness hypothesis.

**Hypotheses.**

- L perfect; fixed q; coordinate t-modules; matrix sizes match.

**Proof route.**

- Check σc=c^(1/q)σ on scalar monomials.
- Extend additively and reverse multiplication; transpose accounts for matrix order.
- Apply the operation to UΦ\_t=Ψ\_tU and derive the dual right-module intertwiner.
- Use inverse iterateFrobeniusEquiv on the perfect algebraic coefficient field, extended to polynomial coefficients. No Tate algebra, arithmetic entire ring or analytic coefficient twist is needed.

**Needs:** [DM.4/t-module](#dm-4-t-module); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [`mathlib:iterateFrobeniusEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean).

**Sources.**

- [BP-RAPID](#source-bp-rapid), §4.4, pp. 17–18: The star operation relates τ-polynomial t-modules and σ-polynomial dual motives; abelian and A-finite conditions are distinguished.

**API.**

- **`oreStar`** (constructor): Σ a\_iτ^i↦Σ a\_i^(1/q^i)σ^i.
- **`oreStar_mul`** (relation): oreStar(fg)=oreStar(g)oreStar(f).
- **`matrixOreStar`** (constructor): Entrywise star followed by transpose.
- **`TModule.dualMotive`** (constructor): The row L\[σ\]-module with t acting by Φ\_t\*.
- **`TModule.dualMotiveMap`** (functoriality): U induces right multiplication by U\*, in the same direction on t-modules.

**Checks.**

- **`oreStar_test_scalar`** (degenerate): (Cc)\*=Cc.
- **`oreStar_test_monomial`** (computation): (aτ²)\*=a^(1/q²)σ².
- **`oreStar_test_order`** (non-example): (τ·a)\*=aσ, whereas τ\* a\*=σa=a^(1/q)σ; multiplication order must reverse.
- **`oreStar_test_matrix`** (compatibility): A d′×d intertwiner becomes a d×d′ matrix after star-transpose.

**Acceptance.**

- The scalar polynomial θ+τ has star θ+σ.

**Uses.**

- DM.4: Covariant dual motive and point realization.
- DM.8: Reconciles σ- and τ-matrix equations without changing conventions.

**Used by:** [4.10](#dm-4-dual-realization), [8.17](#dm-8-rigid-triviality), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-dual-realization"></a>

### 4.10 Dual motives and t-module points

**Target** `DrinfeldModulesAndTModules:DM.4/dual-realization` (comparison).

For the row dual module H=L\[σ\]^{1×d} associated to Φ over a perfect field, define δ₁(Σ h\_iσ^i)=Σ h\_i^(q^i) coordinatewise. It induces an F-linear A-module isomorphism H/(σ−1)H≅E(L), with the t-action inherited from Φ\_t\*. The denominator means the F-linear image of σ−1, not an L-linear submodule. For an effective dual motive finite free over both L\[t\] and L\[σ\], this reconstructs its A-finite t-module; over perfect L this is abelian as well: Maurischat Theorem 6.6 proves abelian iff A-finite, and Corollary 8.1 extends this equivalence to Anderson A-modules by restriction along a finite extension A/F\[t\]. This theorem concerns finite generation of the motive of an actual Anderson module; it does not add Ore-finiteness to the broader effective dual-motive definition.

**Hypotheses.**

- Perfect L; finite Ore rank d; use A-finiteness for a finite L\[t\]-rank dual motive.

**Proof route.**

- Reduce σ-degree using (σ−1) and inverse coefficient twist.
- δ₁ is zero on this image and each row has a unique constant representative in the quotient.
- The star relation identifies the t-action with the original coordinate action.
- For a matrix D defining Φ\_t, use the left and right block-power rank criteria of Propositions 6.4 and 6.5. Theorem 4.1 identifies both criteria with positive slopes of the last invariant factor of tI−D over the complete valued skew field L({σ}); Proposition 6.1 turns either criterion into both finite-generation conclusions. This Laurent σ=τ⁻¹ convention is distinct from the literal star dual module.
- For general A choose a nonconstant t by Riemann–Roch; A is finite over F\[t\], so finite generation over A⊗F L is equivalent to finite generation over L\[t\]. Retain perfect coefficients; no relative nonperfect-base theorem is asserted.

**Needs:** [DM.4/star-adapter](#dm-4-star-adapter); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [BP-RAPID](#source-bp-rapid), Theorem 4.3, §4.4, p. 18; §4.5, pp. 18–19: The δ₁ quotient uses Frobenius-adjusted coefficients and only F-linearity.
- [MAURISCHAT-2026](#source-maurischat-2026), Theorem 6.6 and proof, pp. 34–35; Corollary 8.1 and proof, p. 43: Over a perfect field, finite generation of the motive and dual motive are equivalent, including general A by finite coefficient restriction.

**Acceptance.**

- For H=L\[t\], σh=(t−θ)h, the quotient realizes Carlitz points; using an L-linear quotient destroys the point action.

**Used by:** [8.22](#dm-8-neutral-category), [8.39](#dm-8-logarithm-motive-membership), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM4`, namespace `TauCeti.Drinfeld`.

<a id="dm-4-pre-t-motive"></a>

### 4.11 Rational pre-t-motives

**Target** `DrinfeldModulesAndTModules:DM.4/pre-t-motive` (definition).

A pre-t-motive is a finite-dimensional vector space P over k̄(t), where k̄ is the chosen algebraic closure of k=F\_q(θ), with a bijective additive σ\_P satisfying σ\_P(ap)=a^(−1)σ\_P(p); the coefficient twist is inverse q-Frobenius and fixes t. A morphism is a k̄(t)-linear map commuting with these operators. For basis columns p and q with σp=Φ\_Pp and σq=Φ\_Qq, a morphism p↦Bq satisfies B^(−1)Φ\_Q=Φ\_PB. The category is F\_q(t)-linear. Its tensor product has diagonal σ; its unit is k̄(t) with coefficient σ; internal Hom carries ρ↦σ\_Q∘ρ∘σ\_P^(−1). The dual has matrix (Φ\_P^(−1))^tr. For every integer n, C(n) is the rank-one object with matrix (t−θ)^n, with C(0) the unit and C(n)⊗C(m)≅C(n+m).

**Hypotheses.**

- q=p^m, m&gt;0, and θ is transcendental over F\_q. The inverse Frobenius is algebraic; no analytic field is required.

**Proof route.**

- Extend the pinned perfect-field Frobenius equivalence to the polynomial ring and then its fraction field, fixing t.
- Use finite-dimensional vector spaces with semilinear automorphisms, equivalently modules over k̄(t)\[σ,σ^(−1)\]; a separate implementation of a skew Laurent ring is not needed to state the category.
- Compute tensor and internal-Hom actions from semilinearity. Evaluation and coevaluation commute with σ; inverse transpose is forced by preserving their pairing.
- For the scalar fixed field, write a rational function in coprime numerator/monic-denominator form. Uniqueness makes both coefficient vectors Frobenius-fixed, so the fixed field is F\_q(t), without using analytic fixed-field theory.

**Needs:** [`mathlib:iterateFrobeniusEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean); [`mathlib:RatFunc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Defs.lean); [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean); [`mathlib:Module.Basis.baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §§3.1–3.2, pp.9–11; Theorem 3.2.13 p.11: Finite-dimensional difference modules, their matrix convention and rigid tensor operations.

**API.**

- **`PreTMotive.ofMatrix`** (constructor): Every invertible Φ∈GL\_r(k̄(t)) gives the semilinear action on row coefficients f↦f^(−1)Φ.
- **`PreTMotive.hom_matrix`** (characterisation): For B of shape r×s, B^(−1)Φ\_Q=Φ\_PB is exactly the intertwining condition.
- **`PreTMotive.tensor`** (constructor): Underlying tensor product over k̄(t), with Kronecker σ-matrix.
- **`PreTMotive.internalHom`** (constructor): Underlying Hom with σ\_Q∘ρ∘σ\_P^(−1); its fixed elements are the motive morphisms.
- **`PreTMotive.dual`** (constructor): Underlying linear dual with σ-matrix (Φ^(−1 matrix))^tr.
- **`PreTMotive.unit_end`** (compatibility): End(unit)=F\_q(t).
- **`PreTMotive.carlitzTwist`** (constructor): C(n) for n∈ℤ has matrix (t−θ)^n, and C(n) dual is C(−n).
- **`PreTMotive.extendScalars`** (functoriality): For a σ-compatible field extension k̄(t)→L, act diagonally on L⊗P; this is the analytic scalar extension consumed in DM.8.

**Checks.**

- **`preTMotive_test_unit`** (degenerate): The rank-zero vector space is a valid zero object; C(0) is rank one and is the tensor unit.
- **`preTMotive_test_negative`** (computation): C(1)⊗C(−1) has matrix 1; C(−1) is allowed rationally although (t−θ)^(−1) is not polynomial.
- **`preTMotive_test_inverse_transpose`** (non-example): For Φ=diag(t−θ,1), the dual matrix is diag((t−θ)^(−1),1), rather than Φ^tr.
- **`preTMotive_test_morphism`** (compatibility): For the unit, multiplication by 1/t is a motive endomorphism; multiplication by θ is not, since θ^(1/q)≠θ.

**Acceptance.**

- If p=Bq, verify Φ\_P=σ(B)Φ\_Q B\_inv, where B\_inv is the ordinary matrix inverse and σ(B) is coefficient twisting.
- Verify evaluation and coevaluation with the inverse-transpose matrix.

**Uses.**

- PAP §3.3, pp.12–16; DM.8 rigid-triviality and Betti theory: Provides the rational algebraic objects before extending scalars to the analytic fraction field.
- PAP §§3.4, 6; DM.8 logarithm-motive-membership: Gives rationalization and tensor/dual constructions with the correct variance.

**Used by:** [4.12](#dm-4-rationalization), [4.13](#dm-4-pre-t-motive-rigidity).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Motives/Rational`, namespace `TauCeti.Drinfeld.Motives`.

<a id="dm-4-rationalization"></a>

### 4.12 Rationalization of effective dual t-motives

**Target** `DrinfeldModulesAndTModules:DM.4/rationalization` (construction).

For a broad effective dual t-motive H finite free over k̄\[t\], with inverse-Frobenius semilinear σ and (t−θ)^s H contained in σH for some s≥0, put H\_rat=k̄(t)⊗\_(k̄\[t\])H and give it diagonal σ. This is a pre-t-motive: σ becomes bijective after localization. Polynomial intertwiners induce rational morphisms and composition is preserved. For an Anderson dual motive, which is in addition finite free over k̄\[σ\], rationalization agrees with Papanikolas’s functor. The statement does not infer this extra Ore freeness from the broad effective condition. Rationalization preserves tensor products whenever the corresponding effective tensor product is in the chosen category.

**Hypotheses.**

- H is finite free over k̄\[t\] and satisfies the effective characteristic-support condition; k̄ is perfect. The Anderson subcategory adds finite freeness over k̄\[σ\].

**Proof route.**

- The support condition makes the σ-linearization a square full-rank matrix with determinant c(t−θ)^s for some nonzero c and s≥0; localizing makes it invertible.
- Extend the semilinear operator and each morphism by the localization universal property. The tensor compatibility is the standard tensor/localization comparison.
- The Hom map after tensoring with F\_q(t) is fully faithful for Anderson objects by the outgoing constant-denominator theorem in DM.8; no such fullness is assumed in constructing rationalization.

**Needs:** [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive](#dm-4-pre-t-motive); [`mathlib:Module.Basis.baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §3.4.1–3.4.2 pp.17–18; Proposition 3.4.5 pp.18–19: Integral Anderson objects and their rationalization, with Hom fullness proved separately.
- [NGO-HAL](#source-ngo-hal), Definition 4.1, printed p.16 (PDF p.17): The broader effective definition retains finite polynomial freeness and the support condition, without imposing Anderson Ore freeness.

**API.**

- **`EffectiveDualTMotive.rationalize`** (constructor): H↦k̄(t)⊗H with the localized semilinear action.
- **`EffectiveDualTMotive.rationalize_map`** (functoriality): Localize polynomial intertwiners, preserving identities and composition.
- **`EffectiveDualTMotive.rationalize_matrix`** (simp): An integral basis keeps its σ-matrix after localization.
- **`EffectiveDualTMotive.rationalize_carlitz`** (compatibility): The effective dual Carlitz tensor power of positive degree n rationalizes to C(n).
- **`EffectiveDualTMotive.rationalize_hom`** (compatibility): For Anderson objects, Hom(H,J)⊗\_(F\_q\[t\])F\_q(t)→Hom(H\_rat,J\_rat) is an isomorphism once DM.8/constant-denominator is applied.

**Checks.**

- **`rationalization_test_carlitz`** (computation): k̄\[t\] with σh=(t−θ)σ\_coeff(h) rationalizes to C(1).
- **`rationalization_test_rank_zero`** (degenerate): The zero effective object rationalizes to the zero pre-t-motive.
- **`rationalization_test_broad_unit`** (non-example): k̄\[t\] with coefficient σ satisfies the broad effective condition with exponent zero, but is not finite free over k̄\[σ\]; rationalization is the unit.
- **`rationalization_test_inverse`** (compatibility): On the rationalized Carlitz object the inverse semilinear map exists, although the integral σ-image is the proper submodule (t−θ)k̄\[t\].

**Acceptance.**

- Do not identify polynomial morphisms with all rationalized morphisms: 1/t on the unit rational object requires a denominator.

**Uses.**

- PAP §3.4 and DM.8: Connects the algebraic objects of DM.4 to Betti, Galois and period theorems without imposing analytic hypotheses in DM.4.

**Used by:** [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Motives/Rational`, namespace `TauCeti.Drinfeld.Motives`.

<a id="dm-4-pre-t-motive-rigidity"></a>

### 4.13 Rigid abelian category of pre-t-motives

**Target** `DrinfeldModulesAndTModules:DM.4/pre-t-motive-rigidity` (theorem).

The category of pre-t-motives is a rigid abelian F\_q(t)-linear tensor category, with End(unit)=F\_q(t) and finite-dimensional Hom spaces. Kernels and cokernels are computed in k̄(t)-vector spaces with the induced bijective semilinear actions. This category is not asserted neutral Tannakian: a fibre functor is constructed only for its rigid analytically trivial subcategory in DM.8.

**Proof route.**

- Kernel and image stability follow from equivariance, and bijectivity descends to kernels and quotients; finite-dimensionality is preserved.
- The tensor and internal-Hom constructions give duals via the ordinary evaluation and coevaluation maps.
- A minimal dependence among fixed elements of internal Hom, normalized to have a coefficient 1, becomes a shorter dependence after applying σ and subtracting; hence its coefficients lie in F\_q(t). Thus a fixed-field independent family remains k̄(t)-independent, bounding Hom dimension by the dimension of internal Hom. This algebraic argument requires no analytic DM.8 target.

**Needs:** [DM.4/pre-t-motive](#dm-4-pre-t-motive); [`mathlib:LinearIndependent.finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finite.lean); [`mathlib:Module.Basis.finiteDimensional_of_finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §3.2.2 p.9; Theorem 3.2.13 p.11: Abelianness, finite Hom and rigid tensor structure over the exact rational constant field.

**Acceptance.**

- Check the zero object, C(n) duality and exact kernels in matrix coordinates.
- The full pre-t-motive category is not silently identified with Papanikolas’s generated category T.

**Used by:** [8.17](#dm-8-rigid-triviality), [8.19](#dm-8-fundamental-betti-basis), [8.20](#dm-8-integral-trivialization), [8.21](#dm-8-betti-exact-tensor), [8.22](#dm-8-neutral-category), [8.34](#dm-8-tannakian-identification), [8.38](#dm-8-logarithm-matrices), [8.39](#dm-8-logarithm-motive-membership).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Motives/Rational`, namespace `TauCeti.Drinfeld.Motives`.

<a id="layer-dm-5"></a>

## Layer DM.5: Isogenies and the Tate theorem

The rational and integral Hom comparisons are separated. Local algebraization, saturation and semisimplicity keep their actual hypotheses and the unresolved inputs recorded below.

<a id="dm-5-rational-motive-realization"></a>

### 5.1 Rational motives and their Tate realization

**Target** `DrinfeldModulesAndTModules:DM.5/rational-motive-realization` (construction).

Let K\_0=Frac(A) and L a coefficient field with fixed γ. Rationalize the effective A-motive category by Hom⁰(M,N)=K\_0⊗A Hom(M,N). For λ≠ker γ put L\_(λ)=the total quotient ring Frac((F\_λ⊗F L)\[\[z\]\]) after a residue-field splitting, where F\_λ=A/λ and z is a local parameter. Complete M to this coefficient ring and take τ-invariants after L→L^sep; this gives its rational Tate realization V\_λ(M) over K\_0,λ. For a Drinfeld module E, V\_λ(E) is canonically dual to V\_λ(M(E)); the dual changes the motive’s Hom direction back to the group’s direction. The precise finite-level pairing is supplied by the finite-shtuka realization.

**Hypotheses.**

- Effective finite-rank motives with characteristic λ avoided; splitting factors are retained, not discarded.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K\_0,λ,L=Frac(K\_0,λ⊗F L) is not replaced by the full Laurent-series completion.

**Proof route.**

- Localize Hom at nonzero elements of A and prove well-defined composition.
- Complete the module and its linearized Frobenius; it is invertible at λ.
- Use finite-shtuka pairing and passage to inverse limits for the dual identification.

**Needs:** [DM.4/effective-a-motive](#dm-4-effective-a-motive); [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.1/tate-module](#dm-1-tate-module); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Definitions 2.1–2.2, pp. 5–6; Definition 2.26, pp. 12–13; Proposition 2.28, pp. 13–14; Proposition 4.7, p. 24: The rational motive category and its completed Frobenius realization fix the coefficient rings. The Drinfeld point duality is read with Hartl §6.

**API.**

- **`AMotive.HomIsogeny`** (constructor): K\_0⊗A Hom(M,N).
- **`AMotive.rationalTate`** (constructor): The completed τ-fixed rational realization.
- **`AMotive.rationalTateMap`** (functoriality): A motive morphism acts covariantly on τ-invariants.
- **`DrinfeldModule.motiveTateDual`** (compatibility): V\_λ(E)≅V\_λ(M(E))∨ with equivariant finite-level pairing.

**Checks.**

- **`rationalMotive_test_identity`** (degenerate): The identity motive morphism realizes as the identity.
- **`rationalMotive_test_isogeny`** (compatibility): A nonzero Drinfeld isogeny becomes an isomorphism after rationalization.
- **`rationalMotive_test_carlitz_dual`** (non-example): The rank-one Carlitz motive realization has inverse character to the Carlitz point realization; identifying them without dualization reverses the Galois character.

**Acceptance.**

- Dualizing twice restores the Drinfeld Hom direction.

**Uses.**

- DM.5: The Tate comparison and semisimplicity proof route.

**Used by:** [5.4](#dm-5-local-algebraization), [5.3](#dm-5-period-ring), [5.7](#dm-5-tate-surjectivity), [5.8](#dm-5-tate-semisimplicity), [7.6](#dm-7-tate-realization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-hom-map"></a>

### 5.2 The Tate Hom map

**Target** `DrinfeldModulesAndTModules:DM.5/tate-hom-map` (construction). **Planet:** Tate Hom comparison.

For Drinfeld modules E,E′ over the same (L,γ) and λ≠ker γ, define α\_λ:A\_λ⊗A Hom\_L(E,E′)→Hom\_(A\_λ,G\_L)(T\_λE,T\_λE′) by b⊗u↦b·T\_λu. It is A\_λ-linear, commutes with composition and identities, and becomes the corresponding K\_0,λ-linear rational comparison after inverting λ. It is defined over any coefficient field, but the Tate isomorphism below requires finite generation over F.

**Hypotheses.**

- Same characteristic map and nonzero finite prime away from it; no finite-generation hypothesis needed just to define α.

**Proof route.**

- Use the torsion-induced maps of DM.1.
- Bilinearity gives the tensor-product lift.
- Equivariance and composition hold at every finite level and hence in the limit.

**Needs:** [DM.1/tate-module](#dm-1-tate-module); [DM.1/continuous-galois-action](#dm-1-continuous-galois-action); [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16, p. 34: The integral and rational Hom maps are the natural realization maps, under the selected fixed-characteristic hypotheses.

**API.**

- **`DrinfeldModule.tateHomMap`** (constructor): α\_λ(b⊗u)=b T\_λu.
- **`DrinfeldModule.tateHomMap_pure`** (simp): The image of 1⊗u is T\_λu.
- **`DrinfeldModule.tateHomMap_comp`** (functoriality): The comparison respects composition.
- **`DrinfeldModule.tateHomMap_rational`** (compatibility): Scalar extension to K\_0,λ is the rational comparison.

**Checks.**

- **`tateHom_test_identity`** (degenerate): α\_λ(1⊗id)=id.
- **`tateHom_test_scalar`** (computation): For a∈A, α\_λ(1⊗φ\_a)=a·id.
- **`tateHom_test_extra_endomorphisms`** (non-example): For φ\_t=τ² over F\_{q²}, λ=(t−1), both τ and F\_{q²} scalars are endomorphisms; the domain is not assumed cyclic over A.

**Acceptance.**

- For a scalar a∈A the induced action is multiplication by a.

**Uses.**

- DM.5: Injectivity, saturation and Tate surjectivity.

**Used by:** [5.6](#dm-5-tate-injectivity), [5.5](#dm-5-tate-image-saturation).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-period-ring"></a>

### 5.3 The Tate period ring

**Target** `DrinfeldModulesAndTModules:DM.5/period-ring` (construction).

For finitely generated L/F choose a projective normal F-model X of its function field and compatible extensions of each prime-divisor valuation to L^sep. Inside L\_(λ)^sep, let B⁺ be the Laurent series whose coefficients have valuation bounded below at every compatible prime divisor and are integral outside a finite set of divisors of X. Let S consist of invertible integral local series s with σ(s)/s∈K\_0,λ⊗F L. Set B=B⁺\[S⁻¹\]. It has B^σ=K\_0,λ and B^G\_L=K\_0,λ,L, contains every τ-fixed solution of a λ-restricted finite-rank system, and yields B⊗\_(K\_0,λ) V\_λ(M)≅B⊗\_(K\_0,λ,L)M. Full completion cannot replace B in the algebraization argument.

**Hypotheses.**

- L finitely generated over F; normal proper model; valuation extensions normalized by ramification; finite residue factors retained; σ is q-coefficient Frobenius fixing z.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K\_0,λ,L=Frac(K\_0,λ⊗F L) is not replaced by the full Laurent-series completion.
- Projective normal finite-type F-models exist by projective closure and finite normalization. Transcendence degree need not be one; bounded-pole section spaces use proper coherent finiteness in any dimension.

**Proof route.**

- Choose a projective normal F-model, of any transcendence degree. Cover the finitely many exceptional prime-divisor supports by an effective Cartier divisor using a nonzero homogeneous section of a projective embedding, and raise its power to bound the coefficient poles. The coefficients then lie in H^0(X,O\_X(nD)), finite-dimensional by proper coherent finiteness (SF.2/ample-serre-vanishing with a chosen ample line). A curve-only Riemann–Roch statement is not used for higher-dimensional models.
- Construct integral Frobenius units and invert them; the formal functional equations move all solutions into B.
- Prove the σ-fixed and Galois-fixed ring identities before applying invariant tensor arguments.
- The semilinear fixed-vector basis gives the comparison isomorphism. The construction and properties are proved in Stalder §6, not posited as fields in a structure.

**Needs:** [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components); [`SchemeAndStackFoundations:SF.0/nagata-normalization-finite`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/excellent-examples`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.2/ample-serre-vanishing`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Claim 5.2 and Lemma 5.3, p. 27; Theorem 5.4 and Definition 5.5, p. 28; Definition 6.6, p. 37; Definition 6.10, p. 38; Propositions 6.14 and 6.21, pp. 40 and 43; Theorem 6.23, p. 43: The valuation-defined subring provides both exact fixed rings and contains the Frobenius solutions.

**API.**

- **`TatePeriodRing`** (constructor): The valuation-bounded ring B⁺ localized at the specified Frobenius units.
- **`TatePeriodRing.sigmaFixed`** (characterisation): B^σ=K\_0,λ.
- **`TatePeriodRing.galoisFixed`** (characterisation): B^G\_L=K\_0,λ,L.
- **`TatePeriodRing.comparison`** (equivalence): B⊗V\_λ(M)≅B⊗M for λ-restricted systems.

**Checks.**

- **`TatePeriodRing_test_constants`** (compatibility): The scalar K\_0,λ embeds into B and is σ-fixed.
- **`TatePeriodRing_test_galois`** (non-example): The fixed ring is K\_0,λ,L, not all of L\_(λ), when L has positive transcendence degree.
- **`TatePeriodRing_test_solution`** (characterisation): Every coordinate of a τ-fixed basis vector for a λ-restricted system lies in B.

**Acceptance.**

- The Galois-fixed ring is the rational coefficient ring K\_0,λ,L, not the larger completed ring L\_(λ).

**Uses.**

- DM.5: The second local scalar extension and Tate surjectivity.

**Used by:** [5.4](#dm-5-local-algebraization).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-local-algebraization"></a>

### 5.4 Local algebraization of motive maps

**Target** `DrinfeldModulesAndTModules:DM.5/local-algebraization` (theorem).

Let L be finitely generated over F. Put K\_0,L=Frac(K\_0⊗F L), K\_0,λ,L=Frac(K\_0,λ⊗F L), and L\_(λ)=Frac((F\_λ⊗F L)\[\[z\]\]). A restricted module means a finite projective module with invertible Frobenius linearization; at λ it has a finite-projective integral lattice with invertible Frobenius. Extension K\_0,L→K\_0,λ,L is K\_0,λ/K\_0-fully faithful on such modules and preserves semisimple objects. Extension K\_0,λ,L→L\_(λ) is fully faithful on the λ-restricted objects and preserves semisimple objects. Thus completed Frobenius-equivariant maps are algebraized over the rational coefficient ring. The first ring is not the full completed Laurent-series ring unless L is finite.

**Hypotheses.**

- Finitely generated coefficient field L, hence finitely many roots of unity; K\_0,λ/K\_0 separable; the λ-restricted integral model condition is explicit.
- Frac for the split completed coefficient algebra denotes its total quotient ring, with every residue-field factor retained; it is generally a product of fields. The rational scalar extension K\_0,λ,L=Frac(K\_0,λ⊗F L) is not replaced by the full Laurent-series completion.

**Proof route.**

- For scalar extension, reduce to finite and one-variable transcendental extensions; Frobenius-fixed denominators descend to the constant field.
- Prove separability of the function-field completion by a separating local parameter.
- Use the period ring and its two fixed-ring identities to construct a full faithful left-adjoint realization functor.
- Every invariant subobject is quasigeometric; the descended lattice supplies the λ-restricted condition.

**Needs:** [DM.5/period-ring](#dm-5-period-ring); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Theorem 3.11 with proof, pp. 18–21; Theorem 4.8 and Proposition 4.9, pp. 25–26; Theorem 5.15, p. 33: The two scalar extensions separate constant completion from coefficient completion, and each has its own full-faithfulness argument.

**Acceptance.**

- When L is finite the two local coefficient rings agree; for positive transcendence degree they need not.

**Used by:** [5.7](#dm-5-tate-surjectivity), [5.8](#dm-5-tate-semisimplicity).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-image-saturation"></a>

### 5.5 Integral Hom division and saturation

**Target** `DrinfeldModulesAndTModules:DM.5/tate-image-saturation` (theorem).

For E,E′ over the same coefficient field and λ away from characteristic, the image of A\_λ⊗A Hom\_L(E,E′) in Hom\_(A\_λ,G\_L)(T\_λE,T\_λE′) is saturated. Equivalently, if z·h is in the image for a local uniformizer z and h is an integral equivariant Tate map, then h is in the image. Prove this by finite-level kernel factorization/divisibility of algebraic intertwiners, using descent of the quotient isogeny. Rational surjectivity alone does not prove this assertion.

**Hypotheses.**

- Same characteristic; prime-to-characteristic torsion; finite-projective Hom; local uniformizer chosen only in the completed DVR.

**Proof route.**

- If a morphism kills a finite ideal-torsion subgroup, factor it through the corresponding quotient Drinfeld module.
- Translate divisibility in the completed Hom lattice to the corresponding λ-adic torsion kernels, without assuming λ principal in A.
- Use inverse-limit completeness to identify the full integral lattice. The selected Tate source invokes saturation without proof; this exact input is a recorded gap.

**Needs:** [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom); [DM.1/ideal-torsion](#dm-1-ideal-torsion); [DM.1/etale-torsion](#dm-1-etale-torsion); [DM.5/tate-hom-map](#dm-5-tate-hom-map).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16(a) and proof, p. 34: The source passes from rational to integral Hom using a saturation statement it calls known but does not prove.

**Acceptance.**

- For a rank-one Carlitz module the completed endomorphism lattice is A\_λ, so division by λ is visible directly.

**Used by:** [5.6](#dm-5-tate-injectivity), [5.7](#dm-5-tate-surjectivity).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-injectivity"></a>

### 5.6 Injectivity of the Tate comparison

**Target** `DrinfeldModulesAndTModules:DM.5/tate-injectivity` (theorem).

The natural integral Tate comparison α\_λ is injective for field Drinfeld modules with λ away from characteristic. In particular a morphism acting as zero on every λ-power torsion scheme is zero. The tensor statement uses finite torsion-freeness of the Hom A-module, not only pointwise injectivity of u↦T\_λu.

**Hypotheses.**

- The field, characteristic and prime hypotheses of tate-hom-map.

**Proof route.**

- A nonzero q-polynomial cannot kill torsion of unbounded scheme order.
- Boundedness and lattice arguments make Hom a finite torsion-free A-module.
- If a completion-linear combination acts trivially, reduce modulo λ^n and use λ-divisibility of Hom: vanishing on E\[λ^n\] implies factorization through the ideal isogeny. This integral division input is recorded with tate-image-saturation.

**Needs:** [DM.5/tate-hom-map](#dm-5-tate-hom-map); [DM.0/kernel-scheme](#dm-0-kernel-scheme); [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [DM.5/tate-image-saturation](#dm-5-tate-image-saturation).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 2.28, pp. 12–14: Faithful integral and rational realizations and finite Hom bounds.
- [PAPIKIAN-2017](#source-papikian-2017), §3.1, pp. 10–12: The Drinfeld Tate map and its injectivity route in the public lecture notes.

**Acceptance.**

- Any nonzero scalar endomorphism induces a nonzero Tate map.

**Used by:** [5.7](#dm-5-tate-surjectivity).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-surjectivity"></a>

### 5.7 The Drinfeld Tate theorem

**Target** `DrinfeldModulesAndTModules:DM.5/tate-surjectivity` (theorem). **Planet:** Drinfeld Tate theorem.

Let L be finitely generated over F, let E,E′ be Drinfeld A-modules over the same (L,γ), and let λ≠ker γ. The comparison α\_λ:A\_λ⊗A Hom\_L(E,E′)→Hom\_(A\_λ,G\_L)(T\_λE,T\_λE′) is an isomorphism. Inverting λ yields the rational version. The theorem allows both generic and special characteristic; it does not permit different characteristic maps, an algebraically closed infinite coefficient field in place of a finitely generated one, or λ equal to the characteristic.

**Hypotheses.**

- Exact fixed-characteristic and finitely generated coefficient-field hypotheses.

**Proof route.**

- Pass contravariantly to effective motives and dualize their Tate realizations.
- Apply local-algebraization to the rational motive Hom category, whose embedding is fully faithful after coefficient localization.
- Combine rational bijectivity with integral injectivity and tate-image-saturation.
- The integral last step remains a named proof input; neither the rational theorem nor Tamagawa’s earlier sketch supplies it by itself.

**Needs:** [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.5/local-algebraization](#dm-5-local-algebraization); [DM.5/tate-injectivity](#dm-5-tate-injectivity); [DM.5/tate-image-saturation](#dm-5-tate-image-saturation); [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Proposition 5.16(a,b) and proof, p. 34; Proposition 4.2, p. 22; Theorem 5.15, p. 33: This public source treats finitely generated coefficient fields of arbitrary transcendence degree; its integral saturation step is kept explicit.

**Acceptance.**

- For a finite coefficient field, equivariant endomorphisms are the centralizer of arithmetic Frobenius on T\_λE.
- For φ\_t=τ² over F\_{q²}, the Tate centralizer must retain its extra endomorphisms, not be forced to dimension one.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="dm-5-tate-semisimplicity"></a>

### 5.8 Semisimplicity of rational Tate representations

**Target** `DrinfeldModulesAndTModules:DM.5/tate-semisimplicity` (theorem). **Planet:** Tate semisimplicity theorem.

For finitely generated L/F and λ away from characteristic, the rational Tate realization of a semisimple A-isomotive is a semisimple K\_0,λ-representation of G\_L. In particular the rational Tate representation of every Drinfeld module is semisimple. The latter uses the separate fact that a Drinfeld motive is simple in the rational motive category; a general effective Anderson motive is not assumed semisimple.

**Hypotheses.**

- Finitely generated L; fixed characteristic avoided by λ; motive semisimplicity for the general version.

**Proof route.**

- The rational motive category embeds faithfully in restricted Frobenius modules and preserves semisimplicity.
- Each of the two local scalar extensions preserves semisimple objects by local-algebraization.
- The local Frobenius/Galois equivalence transfers semisimplicity to the representation.
- The Drinfeld-motive simplicity proof, derived from its Ore-module rank-one presentation and degree, is a precise remaining source input. Duality preserves the semisimplicity of the Drinfeld point realization.

**Needs:** [DM.5/local-algebraization](#dm-5-local-algebraization); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.4/contravariant-motive](#dm-4-contravariant-motive).

**Sources.**

- [STALDER-2008](#source-stalder-2008), Theorem 1.1, pp. 2–3 and proof, pp. 33–34; Proposition 4.2, p. 22: The theorem assumes a semisimple A-isomotive; its Drinfeld consequence also needs simplicity of the associated motive.

**Acceptance.**

- A representation with a nonzero nilpotent Jordan extension is not semisimple merely because it is a Tate realization of some effective motive.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM5`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-6"></a>

## Layer DM.6: L-values, regulators and class modules

Monic finite-module cardinalities feed the Euler product and Taelman’s class formula. Generic Fitting ideals come from current Tau Ceti. Determinant and trace arguments lead to the regulator/class-module identity and its Carlitz examples.

<a id="dm-6-fitting-polynomial"></a>

### 6.1 Monic module cardinalities

**Target** `DrinfeldModulesAndTModules:DM.6/fitting-polynomial` (definition). **Planet:** Monic module cardinality.

For a finite-dimensional F-vector space M with A=F\[t\]-action, define |M|=det\_(F\[T\])(T−t\_M), equivalently the unique monic generator of Fitt\_0(M) after renaming t as T. This is a polynomial, not the integer cardinality. It is multiplicative in short exact sequences; |0|=1 and #M=q^(deg |M|). The variable T is kept distinct from the coefficient θ used in the integral model.

**Hypotheses.**

- F finite; M finite as a set, with an F\[t\]-module structure.

**Proof route.**

- Use the native determinant of the t-endomorphism and its characteristic polynomial.
- Import the current Tau Ceti fittingIdeal and its presentation/base-change API cited by the existing IntegralHeckeAndGaloisDeterminants roadmap, then use rational canonical decomposition over F\[t\] to compare its monic generator with the characteristic polynomial. Fitting ideals themselves are not planned here.
- Block-triangular determinants prove exact-sequence multiplicativity.

**Needs:** [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean); [TauCetiRoadmap StableReduction layer-0-relative-curves-and-extensions-of-dvrs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/StableReduction/README.md#layer-0-relative-curves-and-extensions-of-dvrs); [`mathlib:LinearMap.charpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Finite-module notation, p. 369 and §2, p. 376: The determinant is the monic module cardinality entering every local Euler factor and the class term.

**API.**

- **`finiteModuleCardinality`** (constructor): det(T−t\_M).
- **`finiteModuleCardinality_zero`** (simp): |0|=1.
- **`finiteModuleCardinality_exact`** (structure): For 0→M′→M→M″→0, |M|=|M′||M″|.
- **`finiteModuleCardinality_fitting`** (compatibility): The ideal generated by |M| is Fitt\_0(M), under t↦T.

**Checks.**

- **`cardinality_test_cyclic`** (computation): For M=F\[t\]/(t²+t+1), |M|=T²+T+1.
- **`cardinality_test_zero`** (degenerate): The zero module has |0|=1, not zero.
- **`cardinality_test_integer`** (non-example): For M=F\[t\]/(t), |M|=T whereas #M=q; these are different invariants.

**Acceptance.**

- F\[t\]/(a) has cardinality polynomial a(T) when a is monic.

**Uses.**

- DM.6: Local Euler factors, covolumes, determinants and the class formula.

**Used by:** [6.8](#dm-6-euler-l-value), [6.4](#dm-6-class-module), [6.5](#dm-6-lattice-covolume), [6.6](#dm-6-nuclear-determinant), [6.10](#dm-6-tangent-determinant).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-integral-model"></a>

### 6.2 Taelman integral Drinfeld models

**Target** `DrinfeldModulesAndTModules:DM.6/integral-model` (definition).

Fix A=F\[t\], a finite field extension K/F(θ), R the integral closure of F\[θ\] in K, and γ(t)=θ. An integral model is E\_t=θ+r\_1τ+⋯+r\_nτ^n with r\_i∈R and r\_n≠0. A positive n is the generic rank; the zero-rank scalar model is included as a determinant-theory test. No unit condition on r\_n is imposed. Put K\_∞=R⊗\_(F\[θ\])F((1/θ)), a product of the finite completed fields at infinity, with R discrete and cocompact. This model can have bad reduction, unlike the constant-rank relative family of DM.0.

**Hypotheses.**

- Finite K/F(θ), including inseparable finite extensions; full integral closure R; chosen integral coefficients.

**Proof route.**

- Use the polynomial action defined by E\_t on each R-algebra.
- Import normalization and completion from FunctionFieldArithmetic.
- Keep Lie(E)=R with scalar t-action θ separate from the E-action on the same additive set.

**Needs:** [DM.0/carlitz-module](#dm-0-carlitz-module); [`FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`](../packets/FiniteFieldsAndCharacterSums.json); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition 2 and Remarks 1–2, p. 371: The theorem’s definition explicitly permits a nonunit leading coefficient and the rank-zero case.

**API.**

- **`TaelmanModel`** (constructor): The integral Ore polynomial θ+Σ r\_iτ^i with the indicated generic rank.
- **`TaelmanModel.points`** (structure): The F\[t\]-module E(B) on the additive group of any R-algebra B.
- **`TaelmanModel.lie`** (compatibility): The tangent A-module has scalar t-action θ.
- **`TaelmanModel.reduce`** (functoriality): Coefficient reduction to R/m supplies the local finite A-module.
- **`TaelmanModel.ext`** (extensionality): The action polynomial of t determines the integral model, with fixed coefficient ring and θ.

**Checks.**

- **`TaelmanModel_test_carlitz`** (compatibility): r\_1=1 gives the everywhere-good Carlitz model.
- **`TaelmanModel_test_bad_reduction`** (computation): For q=2, E\_t=θ+θ³τ has rank one generically and scalar rank-zero reduction at (θ).
- **`TaelmanModel_test_zero_rank`** (degenerate): With n=0 the exponential is the identity and all local cardinality ratios are one.

**Acceptance.**

- At a bad prime, the reduction may have smaller rank, including rank zero.

**Uses.**

- DM.6: Defines the scope of every class-formula object.

**Used by:** [6.8](#dm-6-euler-l-value), [6.3](#dm-6-unit-lattice), [6.7](#dm-6-trace-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-unit-lattice"></a>

### 6.3 The exponential unit lattice

**Target** `DrinfeldModulesAndTModules:DM.6/unit-lattice` (construction). **Planet:** Exponential unit lattice.

For a Taelman model the coefficient recurrence gives an entire continuous open exponential exp\_E:K\_∞→E(K\_∞), A-linear from the scalar differential action to the E-action and derivative one. Define U(E/R)=exp\_E⁻¹(E(R)). It is a discrete cocompact A-lattice in K\_∞, free of rank \[K:F(θ)\]. This does not assert surjectivity of exp\_E on K\_∞; the coefficient field is not C\_∞. The periods in K\_∞ are contained in U.

**Hypotheses.**

- The integral-model setting, including its product of completions and scalar A-action on the source.

**Proof route.**

- Solve the recurrence on every infinity factor and prove uniform local inverse estimates.
- Openness and discreteness of R imply discreteness of its exponential preimage.
- Compact quotient and the near-identity local exponential give cocompactness.
- Use the PID lattice structure in the finite-dimensional local vector space for finite freeness and rank.

**Needs:** [DM.6/integral-model](#dm-6-integral-model); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Propositions 2–3 and proofs, pp. 371–372: The exponential is continuous and open; its preimage lattice is discrete and cocompact.

**API.**

- **`TaelmanModel.exp`** (constructor): The normalized entire functional-equation exponential on K\_∞.
- **`TaelmanModel.units`** (constructor): The scalar-action submodule exp\_E⁻¹(E(R)).
- **`TaelmanModel.units_mem`** (characterisation): x∈U iff exp\_E(x)∈E(R).
- **`TaelmanModel.units_rank`** (data): rank\_A U=\[K:F(θ)\].
- **`TaelmanModel.exp_linear`** (compatibility): exp\_E(θx)=E\_t(exp\_E(x)).

**Checks.**

- **`units_test_scalar`** (degenerate): For the scalar rank-zero model, U=R.
- **`units_test_carlitz`** (computation): For C/F\[θ\], U=A log\_C(1).
- **`units_test_scaled_carlitz`** (computation): For q=2 and E\_t=θ+θ³τ, U=(π/θ³)A, a rank-one lattice whose generator has norm 1/2.

**Acceptance.**

- The unit lattice rank is the field-extension degree, not the Drinfeld rank.

**Uses.**

- DM.6: The regulator/covolume factor and exact sequence for the determinant proof.

**Used by:** [6.4](#dm-6-class-module), [6.9](#dm-6-tangent-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-class-module"></a>

### 6.4 The Taelman class module

**Target** `DrinfeldModulesAndTModules:DM.6/class-module` (construction). **Planet:** Taelman class module.

For a Taelman model define H(E/R)=E(K\_∞)/(E(R)+exp\_E(K\_∞)), as an A-module. It is finite: quotienting by E(R) gives a compact group, and quotienting by the open exponential image gives a discrete one. The denominator is an additive A-submodule; it is generally not a K\_∞-linear subspace. Its monic cardinality |H| is the class factor.

**Hypotheses.**

- The integral-model and exponential setting above.

**Proof route.**

- Use the scalar/E-action linearity of exp\_E to form the A-submodule sum.
- Show the quotient is both compact and discrete, hence finite.
- Form its native finite-module cardinality polynomial.

**Needs:** [DM.6/unit-lattice](#dm-6-unit-lattice); [DM.6/fitting-polynomial](#dm-6-fitting-polynomial).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition preceding Proposition 5 and its proof, p. 373: The class module retains the failure of the integral points and exponential image to fill E(K\_∞).

**API.**

- **`TaelmanModel.classModule`** (constructor): E(K\_∞)/(E(R)+exp\_E(K\_∞)).
- **`TaelmanModel.classModule_finite`** (instance): The class module is finite.
- **`TaelmanModel.classCardinality`** (data): The monic Fitting polynomial of H.
- **`TaelmanModel.classModule_exact`** (structure): 0→K\_∞/U→E(K\_∞)/E(R)→H→0, with the first map induced by exp\_E.

**Checks.**

- **`classModule_test_scalar`** (degenerate): For the scalar rank-zero model H=0 and |H|=1.
- **`classModule_test_carlitz`** (compatibility): For C/F\[θ\], H=0.
- **`classModule_test_nonzero`** (computation): For q=2 and E\_t=θ+θ³τ over F₂\[θ\], H≅F₂\[t\]/(t), represented by the class of θ⁻¹, and |H|=T.

**Acceptance.**

- A nonzero class module must remain visible in the main formula.

**Uses.**

- DM.6: The class factor and the split exact sequence used in the tangent determinant identity.

**Used by:** [6.11](#dm-6-class-number-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-lattice-covolume"></a>

### 6.5 Normalized lattice covolumes

**Target** `DrinfeldModulesAndTModules:DM.6/lattice-covolume` (definition).

Let V be a finite-dimensional F((1/θ))-vector space and Λ₁,Λ₂ discrete cocompact F\[θ\]-lattices. Choose σ∈GL(V) with σΛ₁=Λ₂. Define \[Λ₁:Λ₂\] as the monic representative of F×·ι(det σ), where ι renames θ as T. This does not depend on σ. For lattices contained in a common over-lattice Λ, it equals |Λ/Λ₂|/|Λ/Λ₁|. It is continuous in both lattices and multiplicative in successive pairs. The class formula uses \[R:U\], in that orientation.

**Hypotheses.**

- Full-rank discrete cocompact lattices in the same local vector space; monic means leading Laurent coefficient one.

**Proof route.**

- Free lattice bases provide σ.
- Changing lattice bases changes its determinant by an F×-unit.
- Diagonal PID quotients prove the common-over-lattice formula, while continuity extends it to all pairs.

**Needs:** [DM.6/fitting-polynomial](#dm-6-fitting-polynomial); [TauCetiRoadmap AlgebraicCurves layer-5-consequences-of-riemannroch-and-local-components](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-5-consequences-of-riemannroch-and-local-components).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Proposition 4 and proof, pp. 372–373: The monic determinant orientation is \[Λ₁:Λ₂\]=|Λ/Λ₂|/|Λ/Λ₁|.

**API.**

- **`latticeCovolume`** (constructor): The normalized determinant \[Λ₁:Λ₂\].
- **`latticeCovolume_self`** (simp): \[Λ:Λ\]=1.
- **`latticeCovolume_trans`** (relation): \[Λ₁:Λ₃\]=\[Λ₁:Λ₂\]\[Λ₂:Λ₃\].
- **`latticeCovolume_index`** (compatibility): For a common over-lattice, the stated ratio of monic cardinalities.

**Checks.**

- **`covolume_test_one`** (degenerate): \[A:A\]=1.
- **`covolume_test_scalar`** (computation): \[A:θA\]=T, while \[θA:A\]=T⁻¹.
- **`covolume_test_scaled_period`** (computation): For q=2, \[A:(π/θ³)A\]=ι(π/θ³), with leading term T⁻¹.

**Acceptance.**

- For Λ₂=aΛ₁ with a monic, the ratio is a(T)^dim V.

**Uses.**

- DM.6: Regulator term and tangent determinant identity.

**Used by:** [6.9](#dm-6-tangent-comparison), [6.10](#dm-6-tangent-determinant), [6.11](#dm-6-class-number-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-nuclear-determinant"></a>

### 6.6 Finite-field nuclear determinants

**Target** `DrinfeldModulesAndTModules:DM.6/nuclear-determinant` (construction). **Planet:** Finite-field nuclear determinant.

Let V be a compact topological F-vector space. A continuous F-linear endomorphism is locally contracting if on some open invariant subspace U its norm decreases by a constant c&lt;1. For Φ=Σ\_(n≥1)φ\_nZ^n with locally contracting coefficients define det\_(F\[\[Z\]\])(1+Φ|V) modulo Z^N using a common contracting nucleus for φ₁,…,φ\_(N−1) and the determinant on the finite quotient V/U; the compatible residues define the series. It is independent of the common nuclei for the fixed norm. Exact-sequence multiplicativity holds. For continuous endomorphisms a,b, Taelman’s cyclic theorem gives det(1−abZ)=det(1−baZ) when a, ab and ba are all locally contracting; the plus-sign variant follows by replacing a by −a. No arbitrary-series cyclic theorem or unrestricted norm-invariance assertion is made. This finite-field compact-vector-space theory differs from the complex Banach nuclear-operator theory already owned by OperatorTheory.

**Hypotheses.**

- F finite; compact V; continuous endomorphisms; norm/topology chosen as in Taelman §2; each coefficient locally contracting and no constant coefficient.
- The compact F-vector space is normed, with its nonarchimedean norm inducing the topology and the trivial norm on F. Local contraction is measured in this norm.

**Proof route.**

- Every finite coefficient list admits a common nucleus.
- On a smaller common nucleus, the contracting piece contributes determinant one modulo the required power of Z.
- Finite-dimensional determinant identities descend to the inverse limit of truncations.
- Prove invariance under equivalent compact norms and functorial conjugation.
- For the cyclic law apply Taelman Theorem 2 with its three contraction assumptions. Its proof chooses common nuclei and bounds the intermediate images; nuclearity of the two products alone is not the cited hypothesis.

**Needs:** [DM.6/fitting-polynomial](#dm-6-fitting-polynomial).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definitions 3–5 and Propositions 6–10, pp. 377–379; Theorem 2, p. 380: Nuclearity is coefficientwise local contraction and the determinant is a compatible finite-quotient limit.

**API.**

- **`FiniteFieldNuclearDet`** (constructor): The finite-nucleus limit det(1+Φ|V).
- **`FiniteFieldNuclearDet_trunc`** (characterisation): Modulo Z^N it is the finite quotient determinant at any common nucleus.
- **`FiniteFieldNuclearDet_exact`** (structure): Multiplicativity for invariant short exact sequences in the nuclear range.
- **`FiniteFieldNuclearDet_cyclic`** (relation): For continuous a,b with a, ab and ba locally contracting, det(1+abZ)=det(1+baZ). This is Theorem 2 with a replaced by −a; the contraction hypothesis on a is retained.

**Checks.**

- **`nuclearDet_test_zero`** (degenerate): The zero operator series has determinant one.
- **`nuclearDet_test_finite`** (compatibility): For V=F and Φ=aZ, det(1+Φ)=1+aZ.
- **`nuclearDet_test_infinite_identity`** (non-example): The identity on F\[\[u\]\] is not locally contracting; it is not a nuclear coefficient under this definition.

**Acceptance.**

- For finite-dimensional V, recover the ordinary determinant.

**Uses.**

- DM.6: Trace formula and infinitely tangent comparison determinants.

**Used by:** [6.7](#dm-6-trace-formula), [6.10](#dm-6-tangent-determinant).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-trace-formula"></a>

### 6.7 The finite-field trace formula

**Target** `DrinfeldModulesAndTModules:DM.6/trace-formula` (theorem).

For R and K\_∞ in the integral-model setting, a finite projective R-module M with q-Frobenius-semilinear τ\_M, and Θ∈R{τ}\[\[Z\]\]·τZ acting through τ\_M, the product over maximal ideals satisfies ∏\_m det(1+Θ|M/mM)=det(1+Θ|(M⊗R K\_∞)/M)⁻¹. The right-hand coefficients are nuclear. Both sides converge in F\[\[Z\]\]. The Frobenius-divisibility condition on Θ is essential; scalar multiplication alone is not this trace formula.

**Hypotheses.**

- Finite projective M over R; τ\_M semilinear with respect to r↦r^q; Θ has no Z⁰ or τ⁰ term.

**Proof route.**

- Prove local contraction for positive-Frobenius operators on the compact quotient.
- Use localization exact sequences to isolate finite primes.
- Apply Anderson’s commutator factorization to reduce arbitrary nuclear Θ to finite local factors.
- Use determinant exactness/cyclic invariance to pass to the Euler product.

**Needs:** [DM.6/nuclear-determinant](#dm-6-nuclear-determinant); [DM.6/integral-model](#dm-6-integral-model).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), §3 setup, pp. 381–382; Theorem 3 and proof, pp. 382–384: The formula applies to positive-Frobenius series on finite projective modules, with the inverse on the compact quotient.

**Acceptance.**

- Specializing Θ=(1−E\_tT⁻¹)/(1−θT⁻¹)−1 gives the L-value determinant, after taking the inverse of each local factor.

**Used by:** [6.8](#dm-6-euler-l-value), [6.11](#dm-6-class-number-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-euler-l-value"></a>

### 6.8 The model-dependent L-value

**Target** `DrinfeldModulesAndTModules:DM.6/euler-l-value` (construction). **Planet:** Taelman L-value.

For the chosen Taelman integral model, define L(E/R)=∏\_(m maximal in R)|R/m|/|E(R/m)| in 1+T⁻¹F\[\[T⁻¹\]\], with θ renamed T in cardinality polynomials. The product converges. Include every maximal ideal, with the finite reduced t-action actually given by the model, even if the leading coefficient vanishes there. The value is characteristic-p valued and depends on the integral model; it is not automatically a complex Artin L-value or a canonical bad-reduction Goss factor of the generic module.

**Hypotheses.**

- The full integral-model hypotheses above; fixed coefficient/series variable convention.

**Proof route.**

- Compute each finite module determinant for multiplication by θ and the E\_t action.
- The difference is a q-Frobenius operator with the local degree bound; finite primes of bounded residue degree are finite in number.
- The nuclear trace formula proves convergence and identifies the product with one determinant.

**Needs:** [DM.6/integral-model](#dm-6-integral-model); [DM.6/fitting-polynomial](#dm-6-fitting-polynomial); [DM.6/trace-formula](#dm-6-trace-formula).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definition following Remark 2, p. 371; Remark 5, pp. 373–374; §5, pp. 388–389: The Euler product retains bad primes and records dependence on the chosen integral model.

**API.**

- **`TaelmanModel.localFactor`** (constructor): |R/m|/|E(R/m)|.
- **`TaelmanModel.lValue`** (constructor): The convergent product over all maximal ideals.
- **`TaelmanModel.lValue_constant`** (simp): Its T⁰ coefficient is one.
- **`TaelmanModel.lValue_carlitz`** (compatibility): For Carlitz, L(C/R)=ζ\_R(1).

**Checks.**

- **`lValue_test_scalar`** (degenerate): The scalar rank-zero model has L=1.
- **`lValue_test_carlitz_prime`** (computation): At R=F\[θ\], a degree-one prime (θ−b) gives factor (T−b)/(T−b−1).
- **`lValue_test_bad_prime`** (computation): For q=2, E\_t=θ+θ³τ, the factor at (θ) is one, not T/(T−1).

**Acceptance.**

- For Carlitz, the local denominator at a monic irreducible P is P(T)−1.

**Uses.**

- DM.6: The left side of the class formula.

**Used by:** [6.11](#dm-6-class-number-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-tangent-comparison"></a>

### 6.9 Infinitely tangent comparison maps

**Target** `DrinfeldModulesAndTModules:DM.6/tangent-comparison` (definition).

For lattices Λ\_i⊂V and finite A-modules H\_i put M\_i=(V/Λ\_i)×H\_i. A continuous F-linear map γ:M₁→M₂ is N-tangent to the identity on V if, on some open U⊂V avoiding both lattices, its V/Λ₂ component restricts to an isometry and its local lift obeys ‖γ(v)−v‖≤‖θ^(−N)‖‖v‖. It is infinitely tangent if this holds for every N≥1, with U allowed to vary. For a continuous F-linear isomorphism γ define Δ\_γ=Σ\_(n≥1)(θ−γ⁻¹tγ)θ^(n−1)T^(−n) on M₁, where θ denotes the source t-action in this operator formula.

**Hypotheses.**

- Finite-dimensional local V, full lattices, finite H\_i; local comparison in quotient charts; γ need not be A-linear.

**Proof route.**

- Define the local lifts after avoiding lattice translates and require the isometry explicitly.
- The differential-one entire exponential is infinitely tangent by shrinking its inverse-function neighborhood for each N.
- Transport t-actions across γ to obtain the operator series.

**Needs:** [DM.6/lattice-covolume](#dm-6-lattice-covolume); [DM.6/unit-lattice](#dm-6-unit-lattice).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Definitions 6–7, Proposition 12 and the definition of Δ\_γ, pp. 385–386: The norm estimate alone is not the whole condition: an isometry on a common open chart is required.

**API.**

- **`InfinitelyTangent`** (characterisation): For each positive N, the specified isometric local estimate holds.
- **`tangentDelta`** (constructor): Σ(t−γ⁻¹tγ)t^(n−1)T^(−n).
- **`InfinitelyTangent.exp`** (compatibility): A normalized everywhere-convergent q-linear exponential is infinitely tangent on admissible lattice quotients.
- **`tangentDelta_identity`** (simp): For identity comparison with equal t-action, Δ=0.

**Checks.**

- **`tangent_test_identity`** (degenerate): The identity is infinitely tangent and has Δ=0.
- **`tangent_test_additive_exponential`** (compatibility): A series x+Σ\_(i≥1)e\_ix^(q^i) of infinite radius obeys the N-tangent estimate on a sufficiently small disk for each N.
- **`tangent_test_wrong_derivative`** (non-example): For c≠1, scalar x↦cx is not infinitely tangent: its first-order error cannot satisfy all N-estimates.

**Acceptance.**

- Infinitely tangent maps can compare distinct t-actions and need not be module homomorphisms.

**Uses.**

- DM.6: The covolume/class determinant identity.

**Used by:** [6.10](#dm-6-tangent-determinant).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-tangent-determinant"></a>

### 6.10 The tangent determinant identity

**Target** `DrinfeldModulesAndTModules:DM.6/tangent-determinant` (theorem).

For a continuous F-linear isomorphism γ:(V/Λ₁)×H₁→(V/Λ₂)×H₂ infinitely tangent to the identity on V, the series Δ\_γ is nuclear and det(1+Δ\_γ|M₁)=\[Λ₁:Λ₂\]·|H₂|/|H₁|. This fixes the covolume orientation and the class numerator. No determinant of an arbitrary infinite-dimensional automorphism is used.

**Hypotheses.**

- The tangent-comparison hypotheses; γ an isomorphism; H\_i finite A-modules.

**Proof route.**

- Compute when Λ\_i have a common over-lattice and the comparison is an admissible local identity.
- Approximate an arbitrary lattice by one sharing such an over-lattice, modulo a prescribed T-adic precision.
- N-tangency makes the nuclear determinant unchanged to that precision; pass through all precisions.

**Needs:** [DM.6/tangent-comparison](#dm-6-tangent-comparison); [DM.6/nuclear-determinant](#dm-6-nuclear-determinant); [DM.6/lattice-covolume](#dm-6-lattice-covolume); [DM.6/fitting-polynomial](#dm-6-fitting-polynomial).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Theorem 4 and proof, pp. 386–388: The identity gives \[Λ₁:Λ₂\]|H₂|/|H₁|, with no hidden degree normalization.

**Acceptance.**

- An identity comparison with equal lattices and finite modules yields determinant one.

**Used by:** [6.11](#dm-6-class-number-formula).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-class-number-formula"></a>

### 6.11 Taelman’s class formula

**Target** `DrinfeldModulesAndTModules:DM.6/class-number-formula` (theorem). **Planet:** Taelman class formula.

For every Taelman integral model E/R, including nonunit leading coefficient and rank zero, L(E/R)=\[R:U(E/R)\]·|H(E/R)| in F((T⁻¹)). All local factors are those of the chosen integral model. The formula is not generalized here to arbitrary A, arbitrary higher-dimensional t-motives, or complex L-values.

**Hypotheses.**

- Exactly integral-model; exponential, lattice and monic-cardinality normalizations fixed above.

**Proof route.**

- The trace formula identifies L with det(1+Θ|K\_∞/R), Θ=(1−E\_tT⁻¹)/(1−θT⁻¹)−1.
- The exponential gives 0→K\_∞/U→E(K\_∞)/E(R)→H→0.
- Split the finite quotient continuously as an F-vector space; compare to (K\_∞/U)×H by an infinitely tangent isomorphism.
- Apply tangent-determinant with Λ₁=R, Λ₂=U, H₁=0, H₂=H.

**Needs:** [DM.6/euler-l-value](#dm-6-euler-l-value); [DM.6/class-module](#dm-6-class-module); [DM.6/lattice-covolume](#dm-6-lattice-covolume); [DM.6/trace-formula](#dm-6-trace-formula); [DM.6/tangent-determinant](#dm-6-tangent-determinant).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Theorem 1, p. 373; §5 proof, pp. 388–389: The theorem treats the chosen integral model and keeps its finite class module.

**Acceptance.**

- For Carlitz recover ζ\_A(1)=log\_C(1).
- For E\_t=θ+θ³τ over F₂\[θ\], retain |H|=T and recover L=ι(π/θ²).

**Used by:** [6.13](#dm-6-carlitz-class-examples).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-small-power-sum"></a>

### 6.12 Depth-one Carlitz power sums

**Target** `DrinfeldModulesAndTModules:DM.6/small-power-sum` (theorem).

For A=F\[θ\] let A\_(d,+) be its finite set of monic degree-d polynomials and S\_d(s)=Σ\_(a∈A\_(d,+))a^(−s). For d≥0 and 1≤s≤q, S\_d(s)=ℓ\_d^(−s) with ℓ\_d=∏\_(i=1)^d(θ−θ^(q^i)). Frobenius gives S\_d(ps)=S\_d(s)^p for p=char F. In particular ζ\_A(1)=Σ\_dℓ\_d⁻¹=log\_C(1). The formula ℓ\_d^(−s) is not asserted for every s.

**Hypotheses.**

- Integer s≥1; θ transcendental; the small-exponent formula requires s≤q.

**Proof route.**

- The Carlitz generating product/partial fraction identity computes the small-degree coefficient.
- Use the product denominators from DM.0, retaining their sign.
- Apply characteristic-p Frobenius to extend along p-power exponents, while keeping its exact range.
- The d-sum converges in K\_∞ and matches the Carlitz logarithm at one.

**Needs:** [DM.0/carlitz-products](#dm-0-carlitz-products); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential).

**Sources.**

- [THAKUR-2009](#source-thakur-2009), §§2.2–2.3, pp. 536–537: The depth-one generating identity gives the small-exponent specialization; its range is retained.

**Acceptance.**

- For q=2,d=1,s=3, S₁(3)=(θ²+θ+1)/(θ(θ+1))³ differs from ℓ₁⁻³.
- For d=0, the only monic constant is one, so S₀(s)=1.

**Used by:** [6.13](#dm-6-carlitz-class-examples).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="dm-6-carlitz-class-examples"></a>

### 6.13 Carlitz and a nonzero class module

**Target** `DrinfeldModulesAndTModules:DM.6/carlitz-class-examples` (theorem).

For Carlitz over F\[θ\], H=0, U=A log\_C(1), and L(C/A)=ζ\_A(1)=log\_C(1), after renaming θ as T. For q=2, define E\_t=θ+θ³τ over F₂\[θ\]. Then exp\_E(x)=θ⁻³exp\_C(θ³x), U\_E=(π/θ³)A, H\_E≅F₂\[t\]/(t), and L(E/A)=ι(π/θ²). The class is represented by θ⁻¹ and t annihilates it. Thus |H\_E|=T is indispensable.

**Hypotheses.**

- First example the Carlitz integral model; second q=2, K=F₂(θ), R=F₂\[θ\], π the DM.2 period lying in K\_∞ in this case.

**Proof route.**

- At q=2, ‖π‖=4 and π∈K\_∞. Reduce any x modulo πA to degree ≤1 by cancelling leading terms.
- On the degree-≤1 ball, exp\_C is an isometric bijection: higher terms are strictly smaller, and the complete-field contraction argument gives its inverse. Hence exp\_C(K\_∞)=θF₂\[\[θ⁻¹\]\].
- Scalar conjugation by θ³ yields exp\_E(K\_∞)=θ⁻²F₂\[\[θ⁻¹\]\]. Its intersection with A is zero, and the quotient modulo A has the single basis class θ⁻¹.
- E\_t(θ⁻¹)=1+θ lies in A, proving H\_E≅A/(t); the unit lattice is θ⁻³ker exp\_C.
- Away from (θ), the reduction is conjugate to Carlitz; at (θ), its local factor is one. Thus L(E/A)=ζ\_A(1)(T−1)/T=ι(π/θ²), also matching regulator times T. The period relation at q=2 is π=(θ²+θ)log\_C(1), obtained from the Carlitz torsion equation and the monic product normalization.

**Needs:** [DM.2/carlitz-period](#dm-2-carlitz-period); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [DM.6/class-number-formula](#dm-6-class-number-formula); [DM.6/small-power-sum](#dm-6-small-power-sum).

**Sources.**

- [TAELMAN-2012](#source-taelman-2012), Example 3, p. 373; Definition 2 and Remark 2, p. 371: The first case is stated in the paper. The scaled q=2 example is derived here from these definitions and the sourced Carlitz period, with every calculation shown; it is not attributed as a source example.

**Acceptance.**

- Dropping the class term in the second example gives a Laurent series with leading term T⁻¹ instead of the Euler product’s leading term one.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM6`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-7"></a>

## Layer DM.7: Elliptic sheaves and shtuka realizations

Normalized elliptic chains encode Drinfeld modules and export their two-leg shtukas. Away-from-characteristic and characteristic-place realization comparisons are kept distinct, including the infinity residue-degree conventions.

<a id="dm-7-elliptic-sheaf"></a>

### 7.1 Elliptic sheaves on the global curve

**Target** `DrinfeldModulesAndTModules:DM.7/elliptic-sheaf` (definition). **Planet:** Elliptic sheaf.

On C×F S put σ=id\_C×Frob\_q,S. A rank-r elliptic sheaf consists of vector bundles E\_i, i∈Z, and injections j\_i:E\_i→E\_(i+1), τ\_i:σ\*E\_i→E\_(i+1), satisfying j\_(i+1)τ\_i=τ\_(i+1)σ\*j\_i and a compatible periodicity E\_(i+rδ)≅E\_i(∞). Each j\_i cokernel is supported on ∞×S and its pushforward to S is a line bundle; each τ\_i cokernel is supported on the graph of the characteristic c:S→C−∞ and its pushforward is a line bundle. Maps are bounded-shift compatible chain maps E\_i→E′\_(i+n), with n≥0 independent of i, identified under further j-shifts. For the Drinfeld correspondence use the normalized/transverse subcategory below. These are bundles on the original global curve C.

**Hypotheses.**

- C smooth projective geometrically connected over F; ∞ closed of degree δ; r≥1; characteristic leg disjoint from ∞; coherent injections and finite-flat length-one cokernels as specified.

**Proof route.**

- Import native coherent locally free sheaves and effective divisor twists from the existing AlgebraicVectorBundles and AlgebraicCurves roadmaps via SF.0.
- Build the integer-indexed periodic diagram with the Frobenius pullback and its commutative squares.
- Define bounded-shift morphisms and compose by adding shifts; fixed-index maps alone miss nonconstant Drinfeld isogenies.

**Needs:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [TauCetiRoadmap JacobianChallenge layer-a-line-bundles-divisors-picard-group-degree](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree); [`mathlib:AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean); [`mathlib:AlgebraicGeometry.Scheme.Modules.pullback`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean); [`mathlib:SheafOfModules.IsLocallyFree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean); [`mathlib:SheafOfModules.IsFinitePresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.1, p. 72; Propositions 5.5 and Lemma 5.7, pp. 73–74; §5.4, pp. 80–84: The diagram, r·deg∞ periodicity and quotient line conditions are explicit; the normalized transversality identifies the characteristic support.

**API.**

- **`EllipticSheaf`** (constructor): The global vector-bundle chain with j, τ and rδ-periodicity.
- **`EllipticSheaf.periodic`** (data): E\_(i+rδ)≅E\_i(∞), respecting j and τ.
- **`EllipticSheaf.characteristic`** (projection): The finite characteristic leg c determined by the τ-cokernel.
- **`EllipticSheaf.Hom`** (constructor): Compatible chain morphisms with a uniform bounded index shift, modulo further inclusions.
- **`EllipticSheaf.baseChange`** (functoriality): Pullback preserves the chain, characteristic and quotient-line conditions.
- **`EllipticSheaf.Hom.ext`** (extensionality): Two bounded-shift morphisms agree if their component bundle maps agree after passage to a common index shift; use the quotient-by-further-inclusions convention of the target.

**Checks.**

- **`EllipticSheaf_test_rank_one`** (computation): For F\[t\], C=P¹ and Carlitz, E\_i=O(i), j is the infinity inclusion, and τ is multiplication by t−θ from σ\*O(i) to O(i+1).
- **`EllipticSheaf_test_rank_two`** (compatibility): At r=2, δ=1 the twist by ∞ advances two indices, not one.
- **`EllipticSheaf_test_curve`** (non-example): Bundles on a Fargues–Fontaine curve do not define this chain on C×S.
- **`EllipticSheaf_test_frobenius`** (non-example): Replacing σ=id\_C×Frob\_S by the absolute Frobenius of C×S changes the degree of every E\_i and fails periodicity compatibility.

**Acceptance.**

- For rational ∞ and rank one, E\_(i+1)=E\_i(∞); for rank two, E\_(i+2)=E\_i(∞).

**Uses.**

- DM.7: Normalized Drinfeld dictionary and Tate/local comparisons.
- GlobalShtukasAndFunctionFieldLanglands:GS.2: Consumes this special-case export, without owning this definition.

**Used by:** [7.2](#dm-7-normalized-elliptic-sheaf).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-normalized-elliptic-sheaf"></a>

### 7.2 Normalized elliptic sheaves

**Target** `DrinfeldModulesAndTModules:DM.7/normalized-elliptic-sheaf` (definition). **Planet:** Normalized elliptic sheaf.

The normalized Drinfeld subcategory consists of elliptic sheaves with χ(E\_(−1),s)=0 on every field fiber and with τ\_i inducing isomorphisms σ\*(E\_i/E\_(i−1))≅E\_(i+1)/E\_i. Equivalently, the images of E\_i and σ\*E\_i span E\_(i+1) and intersect in σ\*E\_(i−1). In this subcategory, H⁰(E\_(−1),s)=H¹(E\_(−1),s)=0; for i≥0, H¹(E\_i,s)=0 and dim H⁰(E\_i,s)=i+1. Thus pr\_S\*E\_0 is a line bundle and the normalized degree is deg E\_(−1)=r(g−1).

**Hypotheses.**

- Same disjoint characteristic leg; exact scalar-field/Frobenius pullback; fiberwise Euler characteristic and the transverse diagram condition.

**Proof route.**

- Use the exact transverse square to obtain 0→σ\*E\_(i−1)→E\_i⊕σ\*E\_i→E\_(i+1)→0.
- Apply fiberwise Riemann–Roch and the first nonzero section argument to locate index zero.
- Import cohomology and base change to produce the pushforward line and the finite-step sections.

**Needs:** [DM.7/elliptic-sheaf](#dm-7-elliptic-sheaf); [TauCetiRoadmap JacobianChallenge layer-a-line-bundles-divisors-picard-group-degree](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree); [TauCetiRoadmap JacobianChallenge layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality); [TauCetiRoadmap JacobianChallenge layer-c-relative-coherent-cohomology-and-base-change](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change); [`mathlib:AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean); [`mathlib:AlgebraicGeometry.Scheme.Modules.pullback`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean); [`mathlib:SheafOfModules.IsLocallyFree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean); [`mathlib:SheafOfModules.IsFinitePresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.9, Lemma 5.12, Corollary 5.13 and Proposition 5.14, pp. 75–77: Euler normalization and transverse quotients give the section dimensions used by the inverse functor.

**API.**

- **`NormalizedEllipticSheaf`** (constructor): An elliptic sheaf with χ(E\_(−1))=0 and transverse τ/j quotients.
- **`NormalizedEllipticSheaf.sections`** (data): The filtered family pr\_S\*E\_i.
- **`NormalizedEllipticSheaf.h0`** (characterisation): Fiber dimensions max(i+1,0).
- **`NormalizedEllipticSheaf.h1`** (characterisation): H¹ vanishes on fibers for i≥−1.
- **`NormalizedEllipticSheaf.line`** (compatibility): pr\_S\*E\_0 is invertible; its dual is the underlying Drinfeld line.

**Checks.**

- **`normalized_test_carlitz`** (computation): On P¹, E\_(−1)=O(−1) has H⁰=H¹=0, and E\_0=O has one section.
- **`normalized_test_shift`** (non-example): Shifting the Carlitz chain to E\_i=O(i+1) gives χ(E\_(−1))=1 and fails normalization.
- **`normalized_test_direction`** (compatibility): The inverse Drinfeld line is (pr\_S\*E\_0)∨ because the sections are the contravariant motive generator, not its point line.

**Acceptance.**

- Normalization fixes an index and cannot be dropped without changing the moduli category.

**Uses.**

- DM.7: Recovering the Drinfeld module and fixing the degree/index convention.

**Used by:** [7.3](#dm-7-drinfeld-to-sheaf), [7.4](#dm-7-elliptic-antiequivalence).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-drinfeld-to-sheaf"></a>

### 7.3 The elliptic sheaf of a Drinfeld module

**Target** `DrinfeldModulesAndTModules:DM.7/drinfeld-to-sheaf` (construction). **Planet:** Drinfeld elliptic-sheaf construction.

For a standard relative rank-r Drinfeld A-module E on S, its contravariant motive M is finite locally free of rank r over A⊗F O\_S and locally free of rank one over O\_S{τ}. Filter a local Ore presentation by τ-degree. On a local coefficient algebra R, inside M⊗A K define the infinity lattice E\_(i,∞) by deg\_τ(m⊗a)=deg\_τ(m)−rδ ord∞(a)≤i. Glue this with the motive on (C−∞)×S to obtain E\_i. Inclusion gives j\_i, left τ gives σ\*E\_i→E\_(i+1), and multiplication by a local inverse uniformizer gives E\_(i+rδ)=E\_i(∞). These bundles form a normalized elliptic sheaf.

**Hypotheses.**

- Relative standard rank r, general A and ∞; the gluing is on the original global curve, with fpqc/Zariski coordinate descent.

**Proof route.**

- Finite generators for the infinity-degree filtration and its successive quotient line prove finite presentation.
- Prove projectivity over R⊗O\_(C,∞), using field fibers, the nilpotent-base flatness argument and finite coefficient descent.
- Glue the finite projective modules across the punctured infinity neighborhood using the existing vector-bundle patching interface.
- Check the characteristic quotient and transverse squares; sections recover the τ-degree filtration and the normalized cohomology.
- Coordinate changes act contravariantly on the motive; a degree-n intertwiner shifts the filtration by at most n.

**Needs:** [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.0/relative-standardization](#dm-0-relative-standardization); [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [TauCetiRoadmap JacobianChallenge layer-a-line-bundles-divisors-picard-group-degree](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-a-line-bundles-divisors-picard-group-degree); [TauCetiRoadmap JacobianChallenge layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality); [TauCetiRoadmap JacobianChallenge layer-c-relative-coherent-cohomology-and-base-change](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-c-relative-coherent-cohomology-and-base-change); [TauCetiRoadmap AlgebraicCurves layer-3-divisors-ld-riemanns-theorem-and-the-genus](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-3-divisors-ld-riemanns-theorem-and-the-genus).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), §§3.4–3.6, Propositions 3.10 and Lemmas 3.11–3.17, pp. 40–48; §5.3.3, pp. 79–80; §5.4.1, pp. 81–82: The infinity filtration, projectivity, gluing and arbitrary-base line-bundle version are spelled out.

**API.**

- **`DrinfeldModule.ellipticSheaf`** (constructor): The glued chain from the Ore-degree filtration.
- **`DrinfeldModule.ellipticSheaf_affine`** (compatibility): Its restriction to C−∞ is M(E).
- **`DrinfeldModule.ellipticSheaf_periodic`** (compatibility): An rδ-index shift equals tensoring by O(∞).
- **`DrinfeldModule.ellipticSheafMap`** (functoriality): A degree-n u:E→E′ gives a bounded-shift chain map from the sheaf of E′ to that of E.

**Checks.**

- **`toSheaf_test_carlitz`** (computation): The Carlitz motive L\[t\] gives E\_i=O(i) and Frobenius factor t−θ.
- **`toSheaf_test_rank_two`** (characterisation): A rank-two Drinfeld module yields bundles of rank two, although its Ore module is rank one.
- **`toSheaf_test_isogeny_shift`** (non-example): A positive-degree isogeny cannot in general be represented by maps E\_i→E′\_i for every i; bounded shifts are required.

**Acceptance.**

- The construction’s affine restriction is M(E), not a new free rank-r τ-module.

**Uses.**

- DM.7: The anti-equivalence and special-case shtuka export.

**Used by:** [7.4](#dm-7-elliptic-antiequivalence), [7.5](#dm-7-shtuka-export).

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-elliptic-antiequivalence"></a>

### 7.4 The normalized elliptic-sheaf dictionary

**Target** `DrinfeldModulesAndTModules:DM.7/elliptic-antiequivalence` (comparison).

The contravariant filtered-motive construction gives an anti-equivalence between standard relative Drinfeld A-modules of rank r and normalized transverse elliptic sheaves of rank r with bounded-shift morphisms. The inverse uses the line (pr\_S\*E\_0)∨ and the Ore module Γ((C−∞)×S,E\_0), locally free of rank one over O\_S{τ}; right A-action reconstructs the Drinfeld map. Equivalently, this is a covariant equivalence with the opposite elliptic-sheaf category; no self-duality identification of that category is asserted. Characteristic and rank are preserved, and good-open level structures transport through the finite-shtuka pairing.

**Hypotheses.**

- The normalized/transverse/disjoint-leg conditions and morphism convention above; standard relative Drinfeld objects.

**Proof route.**

- Use the normalized cohomology to identify the generator line and its Frobenius iterates.
- The affine sections form the Ore module; multiplication by a∈A respects the filtration and has unit leading term.
- Construct the inverse action locally and descend the line-bundle maps.
- The two constructions recover the same filtered module; evaluate the morphism maps to verify reversed composition and natural inverse isomorphisms.

**Needs:** [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf); [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence); [`SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Theorem 5.10 and proof, pp. 75–84; Proposition 5.21, pp. 78–79; §5.4.2, pp. 82–84: The source calls the categories equivalent; the contravariant Hom-to-G\_a convention fixes the opposite category here. Bounded-shift morphism reconciliation is an explicit source gap.

**Acceptance.**

- The generator of sections is dual to the point-line generator, as in the motive functor.

**Used by:** [7.6](#dm-7-tate-realization), [7.7](#dm-7-characteristic-comparison).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-shtuka-export"></a>

### 7.5 The two-leg global shtuka export

**Target** `DrinfeldModulesAndTModules:DM.7/shtuka-export` (construction). **Planet:** Elliptic-sheaf shtuka realization.

From the elliptic chain take E\_0 and α=j\_0⁻¹τ\_0:σ\*E\_0|\_U≅E\_0|\_U, where U=(C×S)−((∞×S)∪Γ\_c). The τ- and j-cokernels provide the characteristic zero and infinity pole bounds of a GL\_r-modification. At rational ∞ they are length-one modifications; at general δ the pole support and residue factors are retained as the specified infinity chain rather than replaced by a rational leg. Export this datum to the independently defined global G-shtuka category in GS.2. The global category does not supply elliptic sheaves back to this construction.

**Hypotheses.**

- Normalized elliptic sheaf, characteristic disjoint from infinity; use its actual bound and coefficient ring.

**Proof route.**

- Restrict where both injections are isomorphisms and compose in the stated Frobenius direction.
- Pass from the rank-r vector bundle to its GL\_r frame torsor using existing vector-bundle APIs.
- Record the two modifications with their cokernels and preserve levels by restriction.
- GS.2 consumes the resulting datum; no dependency on its elliptic-sheaf-realisation node is introduced.

**Needs:** [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf).

**Sources.**

- [WIEDMANN-2005](#source-wiedmann-2005), Definition 5.1 and Remark 5.2, pp. 72–73; §5.4, pp. 80–84: The two injections and their disjoint quotient supports give the rational Frobenius modification.

**API.**

- **`EllipticSheaf.shtukaDatum`** (constructor): E\_0 with α=j\_0⁻¹τ\_0 away from its legs.
- **`EllipticSheaf.shtukaDatum_zero`** (data): The characteristic modification and its effective length-one cokernel.
- **`EllipticSheaf.shtukaDatum_pole`** (data): The infinity modification inherited from j\_0 and the periodic chain.
- **`EllipticSheaf.shtukaDatum_baseChange`** (functoriality): The construction commutes with coefficient-base pullback.

**Checks.**

- **`shtukaExport_test_carlitz`** (computation): For Carlitz on P¹, α is multiplication by t−θ on the affine trivialization.
- **`shtukaExport_test_legs`** (characterisation): The zero leg is t=θ and the pole is ∞.
- **`shtukaExport_test_direction`** (non-example): The inverse (t−θ)⁻¹ swaps zero and pole data and is not the selected Frobenius direction.

**Acceptance.**

- The Frobenius acts on S, leaving the global curve fixed.

**Uses.**

- GlobalShtukasAndFunctionFieldLanglands:GS.2/global-shtuka-stack: Embeds this GL\_r special case.
- GlobalShtukasAndFunctionFieldLanglands:GS.2/elliptic-sheaf-realisation: Imports the definition and dictionary from DM.7.

**Existing upstream inputs:** [TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves).

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-tate-realization"></a>

### 7.6 Prime-to-characteristic realization comparison

**Target** `DrinfeldModulesAndTModules:DM.7/tate-realization` (comparison).

For a normalized elliptic sheaf attached to E and λ away from the characteristic, complete its affine motive M at λ. Its τ-fixed completed realization is canonically dual to T\_λE, with the A\_λ-linear Galois pairing obtained at each λ^n level from the finite-shtuka functor. The pairing is compatible with all Drinfeld morphisms, bounded shifts of elliptic-chain maps, base extension and prime-to-characteristic level frames.

**Hypotheses.**

- Field coefficient L for Galois realization, λ away from ker γ; full completed residue factors; contravariant motive convention.

**Proof route.**

- Reduce M modulo λ^n and apply the strict finite-shtuka/group-scheme anti-equivalence.
- Identify the torsion points with the dual Frobenius-fixed module by the evaluation pairing.
- Pass through the chosen division coordinates to the Tate limit and duality.

**Needs:** [DM.7/elliptic-antiequivalence](#dm-7-elliptic-antiequivalence); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.1/tate-module](#dm-1-tate-module); [DM.1/continuous-galois-action](#dm-1-continuous-galois-action).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Definition 6.1, p. 23; Theorem 6.4, pp. 24–26; Proposition 6.5 and Theorem 6.6, p. 26: Finite-shtuka torsion realizes the motive reductions; inverse limits give the prime-to-characteristic comparison.

**Acceptance.**

- For Carlitz the point Tate character and the motive-fixed character are inverse, as required by the pairing.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="dm-7-characteristic-comparison"></a>

### 7.7 The effective characteristic local comparison

**Target** `DrinfeldModulesAndTModules:DM.7/characteristic-comparison` (comparison).

For characteristic p and an F\_p-algebra R with nilpotent uniformizer image γ(z), completing the affine motive of the elliptic sheaf and selecting the characteristic residue factor gives the same rank-r effective local shtuka as DM.1, with q^(deg p)-Frobenius and the dimension-one cokernel bound. Its finite reductions correspond to the full p-power strict finite group schemes. This is a comparison of completed motives and finite torsion, not a characteristic-place rank-r separable-point Tate representation or an unrestricted crystalline/étale comparison.

**Hypotheses.**

- Nilpotent characteristic parameter; residue coefficient algebra F\_p; all completion/splitting and effectiveness hypotheses of DM.1/characteristic-local-realization; the exact equal-characteristic category is a recorded input, with a locally free R\[\[z\]\]-module and a rank-one R-cokernel killed by z−γ(z).

**Proof route.**

- Identify affine motive restrictions through the elliptic dictionary.
- Complete and split coefficient factors; iterate τ by the residue degree.
- Apply the same strict finite-group correspondence used in DM.1, retaining connected torsion and its bound.

**Needs:** [DM.7/elliptic-antiequivalence](#dm-7-elliptic-antiequivalence); [DM.1/characteristic-local-realization](#dm-1-characteristic-local-realization).

**Sources.**

- [HARTL-2017](#source-hartl-2017), Theorem 6.4, pp. 24–26; Definition 7.1 and Example 7.2, p. 27; Theorems 7.4 and 7.6, p. 28: The finite realization and local completion need the specified characteristic factor and effective Frobenius bound.

**Acceptance.**

- For φ\_t=τ² over F, connected length q^(2n) at level t^n is preserved under this comparison.

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM7`, namespace `TauCeti.Drinfeld`.

<a id="layer-dm-8"></a>

## Layer DM.8: Periods, logarithms and algebraic independence

Coefficient twisting, the arithmetic entire ring E, Ω and analytic fixed fields supply the difference-equation setting. The algebraic pre-t-motive category of DM.4 acquires a Betti fibre functor on its rigid-trivial subcategory. Anderson’s comparison, the difference-Galois torsor, the ABP lifting argument with its arithmetic estimates, and Papanikolas’s period theorem lead to Carlitz logarithm independence.

<a id="dm-8-fixed-coefficients"></a>

### 8.1 Coefficients of a fixed linear combination

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-coefficients` (lemma).

For a finite index type I, let v\_i∈V be fixed by f and L-linearly independent. If c\_i∈L and the vector Σ\_i c\_i·v\_i is fixed by f, then σ(c\_i)=c\_i for every i. Equality of the constant field with F is not needed for this lemma.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.

**Proof route.**

- Apply f to the finite sum and use additivity, semilinearity and fixedness of each v\_i to get Σ\_i σ(c\_i)·v\_i=Σ\_i c\_i·v\_i.
- Subtract the two sums. Apply the finite-relation criterion for L-linear independence to the coefficients σ(c\_i)−c\_i.

**Needs:** [`mathlib:linearIndependent_iff'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The minimal-relation proof compares a relation between fixed vectors with its coefficient twist; independence forces each coefficient to be fixed. This isolated step works for an arbitrary field automorphism and semilinear map, beyond the analytic pre-t-motive setting of the lemma, and does not yet require identifying the constant field.

**Acceptance.**

- With the singleton vector 1 in C and conjugation, a fixed coefficient is real.
- The empty family gives a vacuous conclusion.
- Independence is necessary: with two copies of 1, the zero combination i·1+(−i)·1 is fixed although neither coefficient is fixed.

**Used by:** [8.2](#dm-8-fixed-span-descent), [8.9](#dm-8-fixed-basis-coordinates).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.fixed_coefficients`.

<a id="dm-8-fixed-span-descent"></a>

### 8.2 Descent of the span of an independent fixed family

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-span-descent` (lemma).

Assume exact constants. For a finite L-linearly independent family v\_i fixed by f and a fixed vector w, w lies in the L-span of the v\_i if and only if it lies in their F-span.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- For the forward implication use Submodule.mem\_span\_range\_iff\_exists\_fun to choose L-coefficients of w. The fixed-coefficients lemma makes each coefficient σ-fixed.
- Use exact constants to choose coefficients in F. Scalar-tower compatibility turns the same finite sum into an F-linear expression for w.
- For the reverse implication, map the F-coefficients into L and use scalar-tower compatibility.

**Needs:** [DM.8/fixed-coefficients](#dm-8-fixed-coefficients); [`mathlib:Submodule.mem_span_range_iff_exists_fun`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: In the same relation argument, fixed coefficients belong to the exact constant field F. This gives the intersection of an L-span with fixed vectors as the F-span. The packet abstracts the argument from pre-t-motives to arbitrary semilinear modules, retaining exact constants and independence of the family.

**Acceptance.**

- Conjugation on C with the singleton family 1 gives precisely the real axis.
- With the empty family, a fixed w belongs to either span exactly when w=0.
- For σ=id on C with F=R and v=1, w=i is fixed and in the C-span but outside the R-span, demonstrating the exact-constants requirement.

**Used by:** [8.3](#dm-8-finite-fixed-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.fixed_mem_span_iff`.

<a id="dm-8-finite-fixed-independence"></a>

### 8.3 Independence descent for finite fixed families

**Target** `DrinfeldModulesAndTModules:DM.8/finite-fixed-independence` (lemma).

Assume exact constants. If v:Fin(n)→V is F-linearly independent and each v\_i is fixed by f, then v is L-linearly independent, for every n≥0.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Induct on n. The empty family has no nonzero relation.
- Use linearIndependent\_finSucc over F to separate the tail and its first vector. By induction the fixed tail is L-linearly independent.
- If the first vector were in the L-span of the tail, fixed-span descent would put it in the F-span, contradicting the F-independence criterion. Apply linearIndependent\_finSucc over L.

**Needs:** [DM.8/fixed-span-descent](#dm-8-fixed-span-descent); [`mathlib:linearIndependent_finSucc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Lemmas.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The lemma proves that a finite F-independent family of fixed vectors remains L-independent by a shortest relation and coefficient descent. The packet isolates this finite step over arbitrary semilinear modules; it needs exact constants, but neither finite dimension nor invertibility of the module map.

**Acceptance.**

- n=0 and n=1 are included; in the singleton case independence means the vector is nonzero.
- The pair (1,1) over Q is rejected at the independence premise.
- The R-independent pair (1,i) is not a fixed family for conjugation, and must not pass as a C-independent family.

**Used by:** [8.4](#dm-8-fixed-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.linearIndependent_fin_of_fixed`.

<a id="dm-8-fixed-independence"></a>

### 8.4 Linear independence of fixed vectors

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-independence` (theorem).

Assume exact constants. For any index type I, an F-linearly independent family v:I→V whose members satisfy f(v\_i)=v\_i is L-linearly independent.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Use linearIndependent\_iff\_finset\_linearIndependent to reduce the conclusion to an arbitrary finite subfamily. Restrict F-independence and fixedness to it.
- Reindex that finite set by Fin(card) and apply finite-fixed-independence. Transport independence back along the bijection.

**Needs:** [DM.8/finite-fixed-independence](#dm-8-finite-fixed-independence); [`mathlib:linearIndependent_iff_finset_linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7, pp.12–13: The source establishes scalar-extension independence of Betti vectors in its analytic setting. The packet extends the finite-relation argument to an arbitrary index set by restricting to finite subfamilies, over arbitrary fields with the specified automorphism and exact constants.

**Acceptance.**

- The theorem has no finite-dimensional hypothesis on V and no finite-order hypothesis on σ.
- Exact constants and the fixed-vector premise are independently necessary: σ=id on C fails the former for F=R; conjugation fixes the latter field but not i.
- The theorem supplies independence of an arbitrary F-basis of the fixed submodule before its finiteness is known.

**Used by:** [8.5](#dm-8-betti-comparison-injective), [8.6](#dm-8-fixed-space-finite), [8.24](#dm-8-solution-space).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.linearIndependent_of_fixed`.

<a id="dm-8-betti-comparison-injective"></a>

### 8.5 Injectivity of the Betti comparison map

**Target** `DrinfeldModulesAndTModules:DM.8/betti-comparison-injective` (lemma).

Assume exact constants. Set W=f.fixedSubmodule, using the native F-submodule. The native L-linear map κ=(W.subtype).liftBaseChange L:L⊗\_F W→V, given by κ(a⊗w)=a·w, is injective. No finite-dimensional hypothesis is required.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.

**Proof route.**

- Choose an F-basis b of W using Module.Free.chooseBasis. Its image in V is F-linearly independent by the native injective inclusion and LinearIndependent.map'. Every image vector is fixed.
- Apply fixed-independence to conclude that the image family is L-linearly independent.
- Use the native scalar-extended basis b.baseChange L of L⊗\_F W. Its i-th vector is 1⊗b\_i, whose κ-image is the same image vector.
- Identify κ with the linear map prescribed on that basis and apply Module.Basis.injective\_constr\_of\_linearIndependent.

**Needs:** [DM.8/fixed-independence](#dm-8-fixed-independence); [`mathlib:LinearMap.fixedSubmodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean); [`mathlib:LinearMap.mem_fixedSubmodule_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean); [`mathlib:Submodule.subtype`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean); [`mathlib:Submodule.subtype_injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean); [`mathlib:LinearIndependent.map'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Basic.lean); [`mathlib:Module.Free.chooseBasis`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean); [`mathlib:Module.Basis.linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean); [`mathlib:Module.Basis.baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean); [`mathlib:Module.Basis.baseChange_apply`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean); [`mathlib:LinearMap.liftBaseChangeEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean); [`mathlib:LinearMap.liftBaseChange_tmul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean); [`mathlib:Module.Basis.injective_constr_of_linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.7 and Proposition 3.3.8, pp.12–13: The lemma supplies independence of fixed vectors after extending scalars, and the proposition uses it to inject the scalar-extended Betti space into the analytic motive. The packet expresses that comparison using the native tensor lift; the argument applies to any semilinear module satisfying the stated constant-field hypothesis.

**Acceptance.**

- For conjugation on C the map C⊗\_R R→C is bijective.
- For f=2·id on Q the fixed space is zero and κ is injective but not surjective.
- For the zero vector space κ is the map between zero spaces.

**Used by:** [8.7](#dm-8-fixed-dimension-bound), [8.8](#dm-8-betti-comparison-dimension), [8.21](#dm-8-betti-exact-tensor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.bettiComparison_injective`.

<a id="dm-8-fixed-space-finite"></a>

### 8.6 Finite dimensionality of the fixed submodule

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-space-finite` (lemma).

Assume exact constants and that V is finite-dimensional over L. Then the native fixed submodule W=f.fixedSubmodule is finite-dimensional over F; V itself is not assumed finite-dimensional over F.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Choose an F-basis b of W; include it into V as in betti-comparison-injective.
- Use fixed-independence to make it an L-independent family in the finite-dimensional L-space V. LinearIndependent.finite makes its index type finite.
- Apply Module.Basis.finiteDimensional\_of\_finite to the original F-basis of W. This establishes finiteness before any finrank equality criterion is used.

**Needs:** [DM.8/fixed-independence](#dm-8-fixed-independence); [`mathlib:LinearMap.fixedSubmodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean); [`mathlib:LinearMap.mem_fixedSubmodule_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean); [`mathlib:Submodule.subtype`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean); [`mathlib:Submodule.subtype_injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean); [`mathlib:LinearIndependent.map'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Basic.lean); [`mathlib:Module.Free.chooseBasis`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean); [`mathlib:Module.Basis.linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean); [`mathlib:LinearIndependent.finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finite.lean); [`mathlib:Module.Basis.finiteDimensional_of_finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The proposition bounds the Betti space by the rank of the analytic motive. A chosen F-basis remains L-independent by the preceding lemma, so finite L-dimension makes its index set finite. The packet abstracts this proof without assuming fixed-space finiteness in advance.

**Acceptance.**

- Conjugation on C has fixed space of real dimension 1.
- Multiplication by 2 on Q has zero-dimensional fixed space.
- Finite-dimensionality is proved, not inferred from the numerical value of finrank, which is zero for infinite-dimensional spaces.

**Used by:** [8.7](#dm-8-fixed-dimension-bound), [8.8](#dm-8-betti-comparison-dimension), [8.22](#dm-8-neutral-category).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.finite_fixedSubmodule`.

<a id="dm-8-fixed-dimension-bound"></a>

### 8.7 The dimension bound for fixed vectors

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-dimension-bound` (lemma).

Assume exact constants and finite-dimensionality of V over L. Then dim\_F(f.fixedSubmodule)≤dim\_L(V).

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Use betti-comparison-injective and the native dimension bound for an injective map into V.
- Rewrite the dimension of L⊗\_F W using Module.finrank\_baseChange. The fixed-space-finite lemma separately certifies that this is the dimension of a finite space.

**Needs:** [DM.8/betti-comparison-injective](#dm-8-betti-comparison-injective); [DM.8/fixed-space-finite](#dm-8-fixed-space-finite); [`mathlib:LinearMap.finrank_le_finrank_of_injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean); [`mathlib:Module.finrank_baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Constructions.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The proposition bounds the dimension of the Betti space by the motive rank. After proving that the fixed space is finite, native scalar-extension dimension and injectivity give the packet's corresponding inequality for arbitrary finite-dimensional semilinear modules.

**Acceptance.**

- Conjugation on C realizes equality 1≤1.
- The invertible operator 2·id on Q realizes the strict inequality 0&lt;1.
- For the zero space both sides are zero.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.finrank_fixedSubmodule_le`.

<a id="dm-8-betti-comparison-dimension"></a>

### 8.8 The dimension criterion for the Betti comparison

**Target** `DrinfeldModulesAndTModules:DM.8/betti-comparison-dimension` (theorem).

Assume exact constants and finite-dimensionality of V over L. The native comparison κ:L⊗\_F f.fixedSubmodule→V is bijective if and only if dim\_F(f.fixedSubmodule)=dim\_L(V). In the pre-t-motive application this is the numerical criterion for rigid analytic triviality, once the actual scalar field and operator are supplied.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- V is finite-dimensional over L.

**Proof route.**

- Establish finite-dimensionality of W by fixed-space-finite; a finite F-basis extends to a finite L-basis of L⊗\_F W.
- The forward implication packages κ as a linear equivalence and uses finrank invariance and Module.finrank\_baseChange.
- For the reverse implication, base-change dimension makes source and target have equal finite dimension. Use betti-comparison-injective and LinearMap.injective\_iff\_surjective\_of\_finrank\_eq\_finrank to prove surjectivity.

**Needs:** [DM.8/betti-comparison-injective](#dm-8-betti-comparison-injective); [DM.8/fixed-space-finite](#dm-8-fixed-space-finite); [`mathlib:Module.Basis.baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean); [`mathlib:Module.Basis.finiteDimensional_of_finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean); [`mathlib:Module.finrank_baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Constructions.lean); [`mathlib:LinearEquiv.finrank_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean); [`mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.8, pp.12–13: The source characterizes rigid triviality by achieving the full rank of the analytic motive. The comparison is already injective; equality of finite dimensions makes it surjective. This linear-algebra consequence is stated for the packet's more general semilinear setting.

**Acceptance.**

- Identity on Q and conjugation on C have bijective comparison maps.
- The zero-dimensional object is admitted.
- The invertible operator 2·id on Q has no nonzero fixed vector and fails surjectivity; invertibility alone does not imply triviality.
- The actual DM.8 applicability check still needs L^σ=F\_q(t) and the supplied analytic field; this generic criterion does not establish either.

**Used by:** [8.17](#dm-8-rigid-triviality).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.bettiComparison_bijective_iff`.

<a id="dm-8-fixed-basis-coordinates"></a>

### 8.9 Constant coordinates in a fixed basis

**Target** `DrinfeldModulesAndTModules:DM.8/fixed-basis-coordinates` (lemma).

Assume exact constants. Let b:I→V be an L-basis indexed by a finite type, with f(b\_i)=b\_i. For w∈V, f(w)=w if and only if there is a unique family c:I→F with Σ\_i algebraMap(c\_i)·b\_i=w.

**Hypotheses.**

- F and L are fields with a specified F-algebra structure on L; no perfection, characteristic-zero, finite-extension or finite-order assumption is made.
- V is an L-vector space, also an F-vector space by a compatible scalar tower.
- σ is an F-algebra automorphism of L; f is an F-linear endomorphism of V with f(a·v)=σ(a)·f(v). Neither bijectivity of f nor finite dimensionality is assumed unless stated.
- The image of F is exactly the fixed field of σ: σ(a)=a if and only if there is c∈F with algebraMap(c)=a.
- b is an L-basis indexed by a finite type; every basis vector is fixed.

**Proof route.**

- A basis spans V, so express w with L-coefficients. If w is fixed, fixed-coefficients and exact constants lift each coefficient uniquely to F, the latter uniqueness using injectivity of a field embedding.
- L-independence of b makes the lifted coefficient family unique by subtracting two expansions.
- Conversely, an F-coefficient combination of fixed vectors is fixed by F-linearity.

**Needs:** [DM.8/fixed-coefficients](#dm-8-fixed-coefficients); [`mathlib:Module.Basis.linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean); [`mathlib:Module.Basis.span_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean); [`mathlib:Submodule.mem_span_range_iff_exists_fun`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean); [`mathlib:linearIndependent_iff'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.1.6, p.22, with Lemma 3.3.7: The solution-coordinate argument shows that coefficients of a solution relative to a fundamental matrix are fixed by the coefficient automorphism. Together with the fixed-vector lemma, this supplies unique F-coordinates for a fixed L-basis. The packet states this basis consequence abstractly rather than attributing an arbitrary-module theorem to the source.

**Acceptance.**

- The singleton basis 1 of C with conjugation has exactly real fixed coordinates.
- For the empty basis and zero space the unique coefficient function is empty.
- This is the coordinate step in the fundamental-solution argument; no analytic matrix or general solution space is newly defined here.

**Used by:** [8.19](#dm-8-fundamental-betti-basis).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/FixedVectors`, namespace `TauCeti.Difference.FixedVectors`. Declaration `TauCeti.Difference.FixedVectors.fixed_iff_existsUnique_coordinates`.

<a id="dm-8-entire-series"></a>

### 8.10 Algebraic entire series

**Target** `DrinfeldModulesAndTModules:DM.8/entire-series` (construction).

Let C=C∞, k=F\_q(θ), and k∞=F\_q((1/θ)) with the specified embeddings. E is the subring of C\[\[t\]\] consisting of f=Σ a\_n t^n whose coefficients are algebraic over k, for which Σ converges at every finite radius, and for which k∞(a\_n:n≥0) is finite-dimensional over k∞. The convergence condition is equivalently: for every real r&gt;0, ||a\_n|| r^n tends to zero. Evaluation at z∈C is the sum Σ a\_n z^n. E embeds in the native radius-one restricted-series subring T.

**Proof route.**

- The finite coefficient-field condition is retained separately from entire convergence. A compositum of two finite coefficient fields controls sums and products.
- Use native restrictedness at each positive radius, and completeness plus the ultrametric summability criterion to obtain evaluation as a ring homomorphism.
- Algebraicity of each coefficient over k is required for ABP. The larger analytic entire ring in Papanikolas can be distinguished, but this plan uses the ABP subring throughout specialization.

**Needs:** [DM.2/c-infinity](#dm-2-c-infinity); [`mathlib:PowerSeries.IsRestricted.subring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Restricted.lean); [`mathlib:IntermediateField.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.3–2.2.4 p.7: Papanikolas distinguishes the analytic entire ring by convergence at every radius. The packet deliberately uses the narrower ABP arithmetic subring, adding algebraic-over-k coefficients and a finite coefficient field over k∞; those additional hypotheses come from ABP, not from this analytic definition alone.
- [ABP-v1](#source-abp-v1), §2.4 p.7: The arithmetic entire ring requires coefficients algebraic over k, convergence at every finite radius and finite degree of the coefficient field over k∞. The packet preserves all three conditions and uses evaluation on this ring in lifting.
- [ABP-published](#source-abp-published), §2.4 p.244: The published definition has the same arithmetic entire-series conditions: algebraic coefficients, all-radius convergence and a finite coefficient extension of k∞. These are the narrower conditions selected by the packet.

**API.**

- **`TauCeti.Difference.Periods.entire_mem`** (characterisation): Membership is exactly coefficient algebraicity, restrictedness at every positive radius, and finite dimension of the coefficient-generated field over k∞.
- **`TauCeti.Difference.Periods.entire_eval`** (projection): Evaluation E→C sends f to Σ a\_n z^n and is a ring homomorphism.
- **`TauCeti.Difference.Periods.entire_polynomial`** (constructor): Every polynomial with algebraic-over-k coefficients lies in E.
- **`TauCeti.Difference.Periods.entire_restricted`** (compatibility): The inclusion E→C\[\[t\]\] factors through the native restricted subring at radius one.
- **`TauCeti.Difference.Periods.entire_eval_polynomial`** (simp): Entire evaluation agrees with polynomial evaluation, including evaluation of t at z.

**Checks.**

- **`TauCeti.Difference.Periods.test_entire_series_1`** (computation): Zero is in E and evaluates to zero.
- **`TauCeti.Difference.Periods.test_entire_series_2`** (computation): Every constant with an algebraic-over-k coefficient is in E and evaluates to that coefficient.
- **`TauCeti.Difference.Periods.test_entire_series_3`** (non-example): The series Σ t^n over the chosen C is excluded: its coefficients do not tend to zero at radius one.

**Acceptance.**

- Zero is in E and evaluates to zero.
- Every constant with an algebraic-over-k coefficient is in E and evaluates to that coefficient.
- The series Σ t^n over the chosen C is excluded: its coefficients do not tend to zero at radius one.

**Uses.**

- ABP Theorem3.1.1 pp.7–8; PAP Theorem5.2.2 p.33: Ensures specialization is defined at θ outside the unit disk and that the arithmetic auxiliary-function estimates apply.

**Used by:** [8.12](#dm-2-omega), [8.11](#dm-8-coefficient-twist), [8.35](#dm-8-entire-from-equation), [8.51](#dm-8-abp-lifting), [8.37](#dm-8-carlitz-deformation), [8.49](#dm-8-abp-auxiliary).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.entireSubring`.

<a id="dm-8-coefficient-twist"></a>

### 8.11 Coefficient Frobenius twist

**Target** `DrinfeldModulesAndTModules:DM.8/coefficient-twist` (construction).

Over a perfect characteristic-p field C containing F\_q, q=p^m with m&gt;0, let σ be the inverse q-Frobenius automorphism. Extend σ coefficientwise to C\[t\], C\[\[t\]\], C((t)) and rational functions, fixing t; define f^(n) by the n-fold coefficient q-Frobenius for every integer n, so σf=f^(−1). Over C∞ with its multiplicative infinity norm, ||σa||=||a||^(1/q). The twist extends to the radius-one Tate algebra T, its fraction field L and the arithmetic entire ring E, and is an automorphism of each. For entire convergence, inverse twisting replaces the radius r by r^q before taking a q-th root; it is not substitution t↦t^q.

**Proof route.**

- Use the native iterated Frobenius equivalence and its inverse on coefficients.
- Apply the native power-series coefficient map and prove its inverse by coefficient extensionality. Restrictedness is preserved because coefficient norms are raised to the positive power 1/q; fraction-ring extension is by its universal property.

**Needs:** [`mathlib:iterateFrobeniusEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean); [`mathlib:PowerSeries.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean); [DM.2/c-infinity](#dm-2-c-infinity); [DM.8/entire-series](#dm-8-entire-series).

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.5 pp.7–8: Coefficient q-Frobenius and its integer iterates act on series while leaving the variable t fixed; the negative iterate is inverse coefficient Frobenius. This is the convention used in the difference equation and is represented by the native ring automorphism, not substitution t↦t^q.
- [ABP-v1](#source-abp-v1), §2.2 p.6: The source defines coefficient q-Frobenius on formal series and its integer twists, leaving t fixed; the (-1)-twist is its inverse. This supplies the operator used in the ABP equation.
- [IKLNP-v2](#source-iklnp-v2), §2.1 p.26: The consumer sets f^(n) by twisting coefficients through q^n while fixing t, and states its lifting equation with (-1). This independently checks the shared inverse-Frobenius convention, not a new twist construction.
- [ABP-published](#source-abp-published), §2.2 p.244: The published coefficient-twist definition agrees with the preprint: integer coefficient Frobenius fixes t, and (-1) denotes the inverse. Its normalization supports the same native automorphism here.

**API.**

- **`TauCeti.Difference.Periods.twist_coeff`** (simp): The n-th coefficient of σ(f) is σ\_C of the n-th coefficient of f.
- **`TauCeti.Difference.Periods.twist_X`** (simp): σ(t)=t.
- **`TauCeti.Difference.Periods.twist_C`** (simp): σ(C(a))=C(σ\_C(a)).
- **`TauCeti.Difference.Periods.twist_mul`** (compatibility): σ(fg)=σ(f)σ(g), and entrywise twist commutes with matrix multiplication.
- **`TauCeti.Difference.Periods.twist_inverse`** (equivalence): The coefficient map of σ\_C inverse is inverse to σ on series.

**Checks.**

- **`TauCeti.Difference.Periods.test_coefficient_twist_1`** (computation): The series t is fixed, including in positive characteristic.
- **`TauCeti.Difference.Periods.test_coefficient_twist_2`** (computation): For an element a not fixed by σ\_C, the constant series C(a) is not fixed.
- **`TauCeti.Difference.Periods.test_coefficient_twist_3`** (non-example): The coefficient twist of (t−a)(t−b) is (t−σ\_C(a))(t−σ\_C(b)); this distinguishes coefficient twist from substituting t^q.

**Acceptance.**

- The series t is fixed, including in positive characteristic.
- For an element a not fixed by σ\_C, the constant series C(a) is not fixed.
- The coefficient twist of (t−a)(t−b) is (t−σ\_C(a))(t−σ\_C(b)); this distinguishes coefficient twist from substituting t^q.

**Uses.**

- CCM §4.1 p.13; IKLNP §2.1 p.26: Provides one shared twist interface for every displayed difference equation.

**Used by:** [8.12](#dm-2-omega), [8.14](#dm-8-twisting-limit), [8.15](#dm-8-analytic-fixed-fields), [8.18](#dm-8-fundamental-matrix), [8.35](#dm-8-entire-from-equation), [8.51](#dm-8-abp-lifting), [8.37](#dm-8-carlitz-deformation), [8.41](#dm-8-constant-denominator), [8.43](#dm-8-abp-size), [8.49](#dm-8-abp-auxiliary).

**Convention:** \['The analytic extension belongs to DM.8. DM.4 uses only the pinned algebraic inverse-Frobenius equivalence, so it has no prerequisite in this layer. This changes the assembled ownership; sibling Part II imports keep the stable identifier and must reconcile their stage-level routes.'\]

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.twistSeries`.

<a id="dm-2-omega"></a>

### 8.12 The Anderson–Thakur Omega function

**Target** `DrinfeldModulesAndTModules:DM.2/omega` (construction).

For the chosen ρ, put Ω(t)=ρ^(−q)∏\_{i≥1}(1−t/θ^(q^i)). This product is in the arithmetic entire ring E and is a unit of the radius-one Tate algebra T. It satisfies Ω^(−1)=(t−θ)Ω. Its zeros in C∞ are exactly θ^(q^i), i≥1, each simple. In particular Ω(θ)≠0, Ω is not rational in t, and 1/Ω(θ)=π\_N=−π\_P, where π\_P=θρ∏\_{i≥1}(1−θ^(1−q^i))^(−1) is the independently defined numerical period of DM.2. Replacing a weight-w denominator π\_P^w by π\_N^w multiplies it by (−1)^w.

**Hypotheses.**

- C∞, k=F\_q(θ), k∞ and θ are the normalized embeddings of DM.2; θ is transcendental over F\_q, ||θ||=q; choose ρ with ρ^(q−1)=−θ.

**Proof route.**

- Uniform convergence on every disk gives the entire product.
- The zero locations lie outside the unit disk; the restricted-series criterion gives a Tate unit.
- Shift the product under the inverse coefficient twist and use ρ^(q−1)=−θ.
- Evaluate at θ and compare products, retaining the sign.
- For coefficient algebraicity and the finite coefficient field, write F(t)=∏(1−t/θ^(q^i)). Then F^(−1)=(1−t/θ)F. Its coefficients b\_n satisfy b\_n^(1/q)=b\_n−b\_(n−1)/θ, hence are algebraic over k. All b\_n already lie in the complete field k∞ by convergence of finite products; adjoining ρ suffices for Ω. This proves the arithmetic condition beyond entire convergence.
- Keep DM.2 free of an analytic Ω prerequisite: its numerical product defines π\_P and π\_N first; the displayed equality is a later comparison in this layer.

**Needs:** [DM.2/carlitz-period](#dm-2-carlitz-period); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras); [`mathlib:PowerSeries.IsRestricted.subring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Restricted.lean); [DM.8/entire-series](#dm-8-entire-series).

**Sources.**

- [NGODAC-2021](#source-ngodac-2021), §4.2, pp. 17–18: The product, inverse-twist equation and choice 1/Ω(θ)=π fix the normalization.

**API.**

- **`carlitzOmega`** (constructor): The entire product Ω(t).
- **`carlitzOmega_twist`** (relation): Ω^(−1)=(t−θ)Ω.
- **`carlitzOmega_at_theta`** (compatibility): Ω(θ)⁻¹=−π\_BP.
- **`carlitzOmega_zeros`** (characterisation): The zeros are exactly θ^(q^i), i≥1, each simple.
- **`carlitzOmega_mem_entire`** (compatibility): Ω belongs to the arithmetic entire subring E, including algebraic coefficients and a finite coefficient extension of k∞.

**Checks.**

- **`carlitzOmega_test_constant`** (computation): Ω(0)=ρ^(−q).
- **`carlitzOmega_test_theta`** (characterisation): Ω(θ)≠0 but Ω(θ^q)=0.
- **`carlitzOmega_test_tate_unit`** (non-example): Ω has no zeros on ‖t‖≤1; being a Tate unit does not mean being a zero-free entire function.

**Acceptance.**

- Twisting does not replace the variable t by t^q.

**Uses.**

- DM.8: Rigid trivialization of the Carlitz dual motive.
- Characteristic-p multiple-zeta consumers: They import Ω and its normalization from here.

**Used by:** [8.20](#dm-8-integral-trivialization), [8.38](#dm-8-logarithm-matrices), [8.54](#dm-8-carlitz-group), [8.56](#dm-8-logarithm-linear-relations), [8.42](#dm-8-anderson-comparison).

**Convention:** \['Stable identifier DM.2/omega is retained, but ownership is DM.8 in the whole packet. The revised source routes request this relocation; it is a proposal requiring maintainer alignment with sibling Part II, not a claim of earlier agreement.'\]

**Library home:** `TauCeti/NumberTheory/Drinfeld/DM2`, namespace `TauCeti.Drinfeld`.

<a id="dm-8-tate-analytic-interface"></a>

### 8.13 The one-variable analytic interface

**Target** `DrinfeldModulesAndTModules:DM.8/tate-analytic-interface` (comparison).

T is the existing radius-one restricted-series subring of C∞\[\[t\]\], equipped with its Gauss norm; L is its fraction field. The norm is complete, ultrametric and multiplicative. A nonzero f∈T has a finite zero divisor on |t|≤1, and f=λ·P·u with P the monic polynomial of those zeros, u=1+Σ\_{n≥1}b\_n t^n, sup||b\_n||&lt;1 and b\_n→0. The corresponding signed divisor gives the same factorization for a nonzero element of L. Thus T is a principal ideal domain, and its maximal ideals are (t−a) with ||a||≤1. These are adaptations of existing restricted-series and Weierstrass theory, not a new Tate-algebra definition.

**Proof route.**

- Reuse current TauCeti.PowerSeries.norm\_eq\_gaussNorm, norm\_coeff\_mul\_pow\_le and norm\_le\_iff on the native restricted-series subring. Import TauCeti.PowerSeries.IsDistinguished.exists\_isUnit\_isMonicOfDegree\_mul\_eq and existsUnique\_isUnit\_isMonicOfDegree\_mul\_eq (Weierstrass/Preparation.lean), isUnit\_iff\_isDistinguished\_zero, and TauCeti.PowerSeries.isPrincipalIdealRing\_isRestricted\_subring (Weierstrass/Ideal.lean). Their complete ultrametric normed-field hypotheses hold for C∞ and radius 1&gt;0. These exports postdate f790474; generic preparation, unit detection and the principal-ideal theorem are existing library results, not new DM.8 or AdicSpaces work.
- Over algebraically closed C∞, factor the distinguished polynomial into linear factors. Unit normalization isolates a constant and a strict-norm tail. Pass to fractions to obtain a finite signed zero/pole divisor.
- Check the pinned/current discrepancy recorded in the audit before implementation; generic restricted-series theory remains with its existing owner.

**Needs:** [`mathlib:PowerSeries.IsRestricted.subring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Restricted.lean); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras); [DM.2/c-infinity](#dm-2-c-infinity).

**Sources.**

- [PAP-v2](#source-pap-v2), §2.2.4 p.7: The source defines the radius-one Tate algebra and its fraction field and describes a nonzero element through its zeros and normalized unit. The packet translates that analytic description to the existing restricted-series carrier. Preparation, unit detection and the principal-ideal result are imported from current Tau Ceti; the C∞ zero/pole normalization is the comparison still to supply.

**Acceptance.**

- A factor t−a is a unit exactly when ||a||&gt;1.
- A nonzero determinant in L does not imply it is a unit in T.
- The constant 1 has no zero divisor and Gauss norm 1.

**Used by:** [8.14](#dm-8-twisting-limit), [8.15](#dm-8-analytic-fixed-fields), [8.20](#dm-8-integral-trivialization), [8.35](#dm-8-entire-from-equation), [8.50](#dm-8-abp-auxiliary-zero).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.tate_analytic_interface`.

<a id="dm-8-twisting-limit"></a>

### 8.14 Limits under positive Frobenius twists

**Target** `DrinfeldModulesAndTModules:DM.8/twisting-limit` (theorem).

For f∈T with Gauss norm at most 1 there exist s≥1 and a polynomial P with coefficients in the algebraic closure of F\_q inside C∞ such that f^(ns) tends to P in Gauss norm as n→∞. Moreover P≠0 exactly when ||f||=1. At coefficient level, a with ||a||&lt;1 tends to 0 under a↦a^(q^(ns)); if ||a||=1, an s can be chosen so its residue is fixed and the sequence tends to its unique constant residue representative. The limiting coefficients need not lie in F\_q itself.

**Proof route.**

- Use that the residue field is the algebraic closure of F\_q; choose a finite common Frobenius period for the finitely many residues in the normalized factorization.
- The strict-norm unit tail tends to 1 uniformly. Norm&lt;1 forces the constant factor to 0; norm 1 preserves a nonzero constant factor.

**Needs:** [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemmas 2.2.6–2.2.7 p.8: The coefficient lemma makes strictly small coefficients tend to zero and unit coefficients tend to constant residue representatives along a suitable Frobenius subsequence. The series lemma then gives a polynomial limit for norm at most one, nonzero precisely at norm one. Residues lie in the algebraic closure of F\_q, so the limit need not have coefficients in F\_q itself.

**Acceptance.**

- For a constant in F\_{q^2} not in F\_q the limit lies in F\_{q^2}, so s=2 can be needed.
- A strict-norm series tends to 0.
- A radius-one unit of norm 1 has a nonzero polynomial limit.

**Used by:** [8.20](#dm-8-integral-trivialization).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.twisting_limit`.

<a id="dm-8-analytic-fixed-fields"></a>

### 8.15 Exact analytic constant fields

**Target** `DrinfeldModulesAndTModules:DM.8/analytic-fixed-fields` (theorem).

For inverse coefficient q-Frobenius σ, T^σ=F\_q\[t\] and L^σ=F\_q(t), with the natural polynomial and rational-function embeddings. Also the σ-fixed elements of k̄(t) are F\_q(t), and F\_q(t)∩T=F\_q\[t\]. The same assertions for σ^n replace F\_q by F\_{q^n}. These assertions concern the actual C∞ Tate fraction field, not the full formal Laurent-series field, whose constants are F\_q((t)).

**Proof route.**

- A fixed restricted series has coefficients in finite F\_q and tending to 0; only finitely many are nonzero.
- For a fixed fraction the finite polar divisor is σ-stable. Its monic denominator has coefficients in F\_q. Multiplying clears poles and reduces to the restricted-series statement.
- For a rational function use its normalized numerator/denominator, or compare a monic minimal polynomial for the algebraic-constant extension. Repeat for σ^n.

**Needs:** [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [`mathlib:RatFunc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Defs.lean); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.3.2 p.12; §2.2.5 pp.7–8: The source computes exact constants of the Tate algebra and its fraction field as F\_q\[t\] and F\_q(t), using normalized zero/pole factorization; rational functions over bar(k) have the same fixed rational field. Replacing q by q^n gives the higher-power constant fields. Restrictedness excludes infinite constant-coefficient series.
- [CCM-v2](#source-ccm-v2), §4.1 p.13: The consumer uses coefficient twisting on the Tate algebra and its fraction field with exact rational constants, alongside its entire ring. This is a use of the shared analytic field interface; its multizeta objects are not additional DM.8 targets.

**Acceptance.**

- t and 1/(t−1) are fixed fractions.
- A fixed formal series with infinitely many nonzero finite-field coefficients is not in T.
- F\_q(t)∩T contains no element with a pole in the closed disk.

**Used by:** [8.16](#dm-8-analytic-separability), [8.17](#dm-8-rigid-triviality), [8.20](#dm-8-integral-trivialization), [8.22](#dm-8-neutral-category), [8.31](#dm-8-relative-algebraic-closure), [8.33](#dm-8-difference-invariants), [8.54](#dm-8-carlitz-group), [8.41](#dm-8-constant-denominator).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.analytic_fixed_fields`.

<a id="dm-8-analytic-separability"></a>

### 8.16 Separability of the analytic fraction field

**Target** `DrinfeldModulesAndTModules:DM.8/analytic-separability` (theorem).

The triple F\_q(t)⊂k̄(t)⊂L is σ-admissible: σ fixes F\_q(t), its restrictions to k̄(t) and L have exact constants F\_q(t), and L/k̄(t) is separable in the general field-extension sense. It is not asserted to be finite or algebraic.

**Proof route.**

- The constant-field claims come from analytic-fixed-fields.
- Use the characteristic-p separability criterion with the p-basis {t} of k̄(t): in the ambient Laurent series field no p-th root of t exists, since its order would be 1/p. This proves linear disjointness from k̄(t^(1/p)), hence separability. Record the exact criterion as an FA.0 request.

**Needs:** [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.2/c-infinity](#dm-2-c-infinity); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json); [`mathlib:Algebra.IsGeometricallyReduced`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.1 p.21: The source verifies that its analytic field tower is admissible, including separability of the possibly transcendental extension, by the characteristic-p structure of the function variable. The packet records the p-basis/geometric-reducedness route and requests its general field criterion; algebraic IsSeparable would impose an inappropriate extra hypothesis.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.31](#dm-8-relative-algebraic-closure).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.analytic_separability`.

<a id="dm-8-rigid-triviality"></a>

### 8.17 Rigid analytic triviality

**Target** `DrinfeldModulesAndTModules:DM.8/rigid-triviality` (definition). **Planet:** Rigid analytic triviality.

For a pre-t-motive M supplied by DM.4, let V=L⊗\_{k̄(t)}M with its induced semilinear σ operator f, viewed as an F\_q(t)-linear endomorphism. Set M^B=fixedSubmodule(f). M is rigid analytically trivial precisely when the native comparison L⊗\_{F\_q(t)}M^B→V, a⊗v↦av, is bijective. This condition includes surjectivity; an injective comparison is automatic and alone is insufficient.

**Proof route.**

- Reuse native fixedSubmodule and subtype scalar extension; introduce only the bijectivity predicate.
- DM.4 supplies the actual motive scalar extension and compatibility with its τ convention; this predicate is meaningful without a new copy of the motive type.

**Needs:** [DM.8/betti-comparison-dimension](#dm-8-betti-comparison-dimension); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/star-adapter](#dm-4-star-adapter); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields).

**Sources.**

- [PAP-v2](#source-pap-v2), §3.3.1 p.12; Proposition 3.3.8 p.13: Rigid analytic triviality means that scalar extension of the Betti space recovers the analytic motive. The proposition identifies this with the full-rank condition after proving comparison injectivity. The packet uses native comparison bijectivity as its definition, so its dimension characterization is a theorem rather than a substitute definition.

**API.**

- **`TauCeti.Difference.Periods.rigid_iff`** (characterisation): Rigid triviality is equivalent to bijectivity of the native lifted fixed-submodule inclusion.
- **`TauCeti.Difference.Periods.rigid_finrank`** (characterisation): For finite-dimensional V with exact constants, rigid triviality is equivalent to dim\_F V^f=dim\_L V.
- **`TauCeti.Difference.Periods.rigid_invariant`** (compatibility): An L-linear equivalence intertwining the semilinear operators preserves and reflects rigid triviality.

**Checks.**

- **`TauCeti.Difference.Periods.test_rigid_triviality_1`** (computation): The identity on Q has bijective comparison and is rigid trivial.
- **`TauCeti.Difference.Periods.test_rigid_triviality_2`** (computation): The zero-dimensional identity is rigid trivial.
- **`TauCeti.Difference.Periods.test_rigid_triviality_3`** (non-example): Multiplication by 2 on Q is invertible but is not rigid trivial, since its fixed space is zero.

**Acceptance.**

- The identity on Q has bijective comparison and is rigid trivial.
- The zero-dimensional identity is rigid trivial.
- Multiplication by 2 on Q is invertible but is not rigid trivial, since its fixed space is zero.

**Uses.**

- PAP Proposition 3.3.9 pp.13–15: The bijective comparison is equivalent to a fundamental matrix and supplies the integral trivialization criterion.
- PAP Propositions 3.3.11–3.3.14 pp.15–16: Closure under subquotients, tensor products and duals makes Betti realization an exact faithful tensor functor.

**Used by:** [8.19](#dm-8-fundamental-betti-basis), [8.21](#dm-8-betti-exact-tensor), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Analytic`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.IsRigidTrivial`.

<a id="dm-8-fundamental-matrix"></a>

### 8.18 Fundamental solution matrix

**Target** `DrinfeldModulesAndTModules:DM.8/fundamental-matrix` (definition).

For fields F⊂K⊂L with σ-admissible structure and Φ∈GL\_r(K), a fundamental matrix is Ψ∈GL\_r(L) satisfying σ(Ψ)=ΦΨ, after embedding Φ in L. A rigid analytic trivialization over T is such a matrix in GL\_r(T), with equation read in T. A matrix with determinant merely nonzero in L does not meet the integral condition.

**Proof route.**

- Use the native general linear group (matrix units) and an explicit entrywise equation.
- The generic definition applies to any coefficient automorphism; the analytic specialization uses inverse q-Frobenius.

**Needs:** [DM.8/coefficient-twist](#dm-8-coefficient-twist); [`mathlib:Matrix.GeneralLinearGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.6 p.22; Proposition 3.3.9 p.13: A fundamental matrix is invertible and satisfies σΨ=ΦΨ. The motive proposition and solution-coordinate lemma identify its columns with solutions and its inverse with fixed motive coordinates. A change of motive basis acts on the left, whereas a second fundamental matrix differs on the right by an invertible constant matrix.
- [NGO-HAL](#source-ngo-hal), §4.1 printedp.17; §5.2 printedpp.20–21: The consumer builds inverse-twist polynomial systems and explicit analytic matrices satisfying the fundamental equation, then applies the shared period and ABP machinery. Its specialized multizeta extensions consume this matrix interface and remain with their existing owner.

**API.**

- **`TauCeti.Difference.Periods.fundamental_equation`** (characterisation): Fundamentality is exactly the entrywise equation σ(Ψ)=ΦΨ.
- **`TauCeti.Difference.Periods.fundamental_change_basis`** (compatibility): Changing the motive basis by B sends Φ to σ(B)Φ B^−1 and Ψ to B Ψ.
- **`TauCeti.Difference.Periods.fundamental_right_constant`** (constructor): Right multiplication by C∈GL\_r(F) preserves fundamentality.
- **`TauCeti.Difference.Periods.fundamental_unique`** (characterisation): If X is any rectangular solution of σ(X)=Φ X, there is a unique constant matrix C over F with X=Ψ C; if X is square invertible then C is invertible.

**Checks.**

- **`TauCeti.Difference.Periods.test_fundamental_matrix_1`** (computation): For Φ=1 the identity matrix is fundamental.
- **`TauCeti.Difference.Periods.test_fundamental_matrix_2`** (computation): The empty identity matrix is fundamental for rank 0.
- **`TauCeti.Difference.Periods.test_fundamental_matrix_3`** (non-example): Under σ=id over Q, no invertible scalar matrix is fundamental for Φ=2.

**Acceptance.**

- For Φ=1 the identity matrix is fundamental.
- The empty identity matrix is fundamental for rank 0.
- Under σ=id over Q, no invertible scalar matrix is fundamental for Φ=2.

**Uses.**

- Ngo Dac §5.2 pp.20–21; CCM Lemma5.1.1 proof pp.23–24; IKLNP Theorem2.4 proof p.33: Turns a second block solution into a constant matrix, including rectangular solutions.

**Used by:** [8.19](#dm-8-fundamental-betti-basis), [8.24](#dm-8-solution-space), [8.25](#dm-8-solution-ring), [8.36](#dm-8-degree-span).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.IsFundamental`.

<a id="dm-8-fundamental-betti-basis"></a>

### 8.19 Fundamental matrices and Betti bases

**Target** `DrinfeldModulesAndTModules:DM.8/fundamental-betti-basis` (comparison).

For M of k̄(t)-dimension r with column basis m and σ(m)=Φ m, M is rigid trivial iff Φ has a fundamental matrix in GL\_r(L). If Ψ is one, the entries of Ψ^−1m form an F\_q(t)-basis of M^B. The columns of Ψ form an F\_q(t)-basis of the vector solution space σ(v)=Φ v; these are two different coordinate conventions.

**Proof route.**

- An inverse fundamental matrix turns the motive basis into fixed vectors. Conversely a fixed L-basis gives a matrix whose inverse solves the equation.
- Apply fixed-basis-coordinates for exact constants and uniqueness. Do not identify column solutions with the motive-basis rows without inversion.

**Needs:** [DM.8/fundamental-matrix](#dm-8-fundamental-matrix); [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/fixed-basis-coordinates](#dm-8-fixed-basis-coordinates); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.9(a, b) p.13; §4.1.6 p.22: The proposition proves that Ψ⁻¹ times the motive basis is a Betti basis and that rigid triviality is equivalent to existence of a fundamental matrix. This fixes the orientation: solution columns belong to Ψ, but fixed motive vectors use Ψ⁻¹.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.20](#dm-8-integral-trivialization), [8.21](#dm-8-betti-exact-tensor), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.fundamental_betti_basis`.

<a id="dm-8-integral-trivialization"></a>

### 8.20 Integral analytic trivializations

**Target** `DrinfeldModulesAndTModules:DM.8/integral-trivialization` (theorem).

If a rigid-trivial pre-t-motive has a polynomial σ matrix Φ∈Mat\_r(k̄\[t\]) with det Φ=c(t−θ)^s, c∈k̄^× and s≥0, it has a fundamental matrix Ψ∈GL\_r(T). For the corresponding integral DM.4 dual Anderson motive, its T-fixed module is free over F\_q\[t\] of rank r, its basis gives Ψ^−1m, and the integral and rational notions of rigid triviality agree.

**Proof route.**

- Clear denominators of fixed vectors by σ-fixed polynomials, giving an integral fixed lattice with rationalization M^B.
- The determinant of a lattice basis is a constant times Ω^s times a polynomial over F\_q. If that polynomial has positive degree, a normalized polynomial relation modulo it, its Frobenius limits and a finite-field trace give a smaller-degree fixed relation, contradicting the lattice basis.
- Hence the determinant is a T-unit. Use DM.2 Ω and DM.4 freeness/rationalization interfaces.

**Needs:** [DM.8/fundamental-betti-basis](#dm-8-fundamental-betti-basis); [DM.8/twisting-limit](#dm-8-twisting-limit); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity); [DM.2/omega](#dm-2-omega).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.3.9(c) pp.13–15; Proposition 3.4.7 p.19: For polynomial Φ with determinant supported at t=θ, the proposition clears analytic denominators and produces an invertible Tate-algebra trivialization. It also relates the free integral fixed module over F\_q\[t\] to its rationalization. The later proposition transfers this to the dual Anderson motive; polynomiality alone does not imply eligibility.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.53](#dm-8-period-transcendence), [8.42](#dm-8-anderson-comparison).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.integral_trivialization`.

<a id="dm-8-betti-exact-tensor"></a>

### 8.21 Exact tensor Betti comparison

**Target** `DrinfeldModulesAndTModules:DM.8/betti-exact-tensor` (theorem).

For an exact sequence 0→P→Q→R→0 of pre-t-motives, rigid triviality of Q implies rigid triviality of P and R. On rigid-trivial objects Betti realization is exact and faithful, and the canonical maps P^B⊗\_F Q^B→(P⊗\_K Q)^B and (P^B)^∨→(P^∨)^B are isomorphisms. Here F=F\_q(t), K=k̄(t); tensoring Betti spaces uses F and tensoring motives uses K.

**Proof route.**

- Use left exactness of fixed vectors and scalar-extension exactness. An isomorphism for Q forces the comparisons for the subobject and quotient to be isomorphisms, by injectivity and dimensions.
- For faithfulness, a morphism zero on a spanning Betti basis is zero on the scalar extension and therefore on the motive.
- Kronecker products of fundamental matrices supply tensor comparison; inverse transposes supply dual comparison. The natural maps, not just equal dimensions, must be identified.

**Needs:** [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/fundamental-betti-basis](#dm-8-fundamental-betti-basis); [DM.8/betti-comparison-injective](#dm-8-betti-comparison-injective); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity).

**Sources.**

- [PAP-v2](#source-pap-v2), Propositions 3.3.11–3.3.14 pp.15–16: The propositions prove exactness through subobjects and quotients and compatibility of the Betti functor with tensor products and duals. The packet retains these as combined target-level milestones and corrects the independent tensor-factor ranks in the displayed proof notation, without duplicating the motive constructions owned by DM.4.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.22](#dm-8-neutral-category).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.betti_exact_tensor`.

<a id="dm-8-neutral-category"></a>

### 8.22 The neutral category of rigid-trivial motives

**Target** `DrinfeldModulesAndTModules:DM.8/neutral-category` (theorem). **Planet:** Neutral Tannakian category.

The strictly full subcategory R of the DM.4 pre-t-motive category consisting of rigid-trivial objects is rigid, abelian and F\_q(t)-linear; its unit has endomorphism field F\_q(t), and ω(M)=M^B is an exact faithful F\_q(t)-linear tensor functor to finite-dimensional vector spaces. Thus R is neutral Tannakian over the imperfect field F\_q(t). Let T be the strictly full tensor subcategory generated by the rational images of rigid-trivial dual Anderson motives; it too has this fibre functor. T is this generated subcategory, not all effective dual motives and not an assumption that every t-module is trivial.

**Proof route.**

- Import the rigid abelian motive category, its unit, tensor and dual constructions from DM.4. Closure and exactness come from betti-exact-tensor.
- Identify End(1) using exact constants. The arbitrary-field neutral reconstruction is already planned as MC.6/neutral-tannaka-reconstruction; instantiate it over F\_q(t), with no characteristic-zero assumption.
- Define T by the generic tensor-generation construction supplied with MC.6; its chosen generating family is the DM.4 rational image. The effective Frobenius modules of IKLNP are supplied by DM.4 and are not automatically Anderson-free over k̄\[σ\].

**Needs:** [DM.8/betti-exact-tensor](#dm-8-betti-exact-tensor); [DM.8/fixed-space-finite](#dm-8-fixed-space-finite); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/dual-realization](#dm-4-dual-realization); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity); [`MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`](../packets/MotivesAndAlgebraicCycles.json); [`MotivesAndAlgebraicCycles:MC.6`](../packets/MotivesAndAlgebraicCycles.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 3.3.15 pp.16–17; Definition 3.4.10 p.19: The theorem establishes a neutral Tannakian category of rigid analytically trivial pre-t-motives with Betti fiber functor over F\_q(t); the definition takes the tensor subcategory generated by the dual Anderson image. The packet imports general arbitrary-field reconstruction from MC.6 and keeps formation of these particular motive categories here.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.34](#dm-8-tannakian-identification), [8.39](#dm-8-logarithm-motive-membership), [8.54](#dm-8-carlitz-group).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.neutral_category`.

<a id="dm-8-admissible-fields"></a>

### 8.23 Admissible difference fields

**Target** `DrinfeldModulesAndTModules:DM.8/admissible-fields` (definition).

A σ-admissible triple consists of field embeddings F⊂K⊂L, an F-algebra automorphism σ\_K of K and an F-algebra automorphism σ\_L of L compatible with K→L, exact fixed fields K^σ=L^σ=F, and a separable extension L/K. F is fixed pointwise. No algebraic closure of F, finite extension or characteristic-zero hypothesis is included.

**Proof route.**

- Package only the complete mathematical predicate on specified field and automorphism data.
- The embeddings and algebra towers are native. Compatibility is an equation, exact constants are the two explicit range equalities, and separability is expressed by the native geometric-reducedness property for the field extension. It is not Algebra.IsSeparable, which would incorrectly force algebraicity.

**Needs:** [`mathlib:Algebra.IsGeometricallyReduced`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean); [`mathlib:AlgEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Equiv.lean); [`mathlib:IsScalarTower`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.1 p.21: Admissibility consists of a compatible coefficient automorphism on F⊂K⊂L, exact constants F in both K and L, and separability of L/K. The packet records the full tower, using geometric reducedness for the general extension property rather than requiring an algebraic extension.

**API.**

- **`TauCeti.Difference.Periods.admissible_compat`** (projection): σ\_L(algebra Map K L a)=algebra Map K L(σ\_K a).
- **`TauCeti.Difference.Periods.admissible_constants`** (projection): σ\_L a=a iff a is in the image of F; the same holds in K.
- **`TauCeti.Difference.Periods.admissible_separable`** (projection): L/K is geometrically reduced, the native formulation of general separability here.

**Checks.**

- **`TauCeti.Difference.Periods.test_admissible_fields_1`** (computation): F=K=L=Q with identity automorphisms is admissible.
- **`TauCeti.Difference.Periods.test_admissible_fields_2`** (computation): F=K=R, L=C with identity on R and conjugation on C is admissible.
- **`TauCeti.Difference.Periods.test_admissible_fields_3`** (non-example): The same tower with identity on C is not admissible, because its fixed field is too large.

**Acceptance.**

- F=K=L=Q with identity automorphisms is admissible.
- F=K=R, L=C with identity on R and conjugation on C is admissible.
- The same tower with identity on C is not admissible, because its fixed field is too large.

**Uses.**

- PAP §§4.2–4.3 pp.22–27: Exact constants control invariant-ideal descent and uniqueness; general separability supplies geometric reducedness for the solution group.
- PAP §4.4 pp.27–28: The power-admissible algebraic-closure instances identify the geometric fixed field without assuming density of rational points over F.

**Used by:** [8.24](#dm-8-solution-space), [8.25](#dm-8-solution-ring), [8.27](#dm-8-invariant-ideal-descent).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.IsAdmissible`.

<a id="dm-8-solution-space"></a>

### 8.24 The solution space of a difference system

**Target** `DrinfeldModulesAndTModules:DM.8/solution-space` (construction).

For σ-admissible F⊂K⊂L and Φ∈Mat\_r(K), Sol(Φ) is the native F-submodule of L^r cut out by σ\_L(v)=Φ v. It has F-dimension at most r. If Φ is invertible and Ψ fundamental, every solution is uniquely Ψ c with c∈F^r. For rectangular solution matrices the same description holds columnwise.

**Proof route.**

- The coefficient twist and matrix multiplication are F-linear, so their equalizer is an F-submodule.
- For invertible Φ rewrite the equation as fixedness for Φ⁻¹σ and apply the existing fixed-vector chain. For singular Φ, let W be the L-span of solutions. Compatibility gives σ(W)=Φ(W); the coefficient automorphism preserves dim\_L W, so Φ restricts to an injection on W. Twisting a minimal relation and cancelling this restricted Φ gives coefficient fixedness, hence F-independence implies L-independence and the bound r. This extends the source's invertible-matrix statement without asserting that Φ is invertible on all L^r.

**Needs:** [DM.8/admissible-fields](#dm-8-admissible-fields); [DM.8/fundamental-matrix](#dm-8-fundamental-matrix); [DM.8/fixed-independence](#dm-8-fixed-independence); [`mathlib:Submodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.1.3–4.1.6 pp.21–22: The source defines solutions of σv=Φv for invertible Φ and obtains constant coordinates from a fundamental matrix. The packet additionally bounds solutions for singular square Φ: on their L-span W, σ(W)=Φ(W) and dim σ(W)=dim W, so Φ is injective on W and the same minimal-relation descent works. Rectangular solution arrays apply the vector equation columnwise.

**API.**

- **`TauCeti.Difference.Periods.solution_mem`** (characterisation): v lies in Sol(Φ) iff σ(v)=Φ v.
- **`TauCeti.Difference.Periods.solution_finrank`** (structure): Sol(Φ) is finite-dimensional over F and its dimension is at most r.
- **`TauCeti.Difference.Periods.solution_coordinates`** (universal-property): A fundamental Ψ identifies F^r linearly with Sol(Φ), c↦Ψ c.

**Checks.**

- **`TauCeti.Difference.Periods.test_solution_space_1`** (computation): With σ=id, Φ=1 over Q the solution submodule is the whole space.
- **`TauCeti.Difference.Periods.test_solution_space_2`** (computation): With σ=id, Φ=2 in rank 1 over Q the solution submodule is zero.
- **`TauCeti.Difference.Periods.test_solution_space_3`** (non-example): A repeated nonzero solution column is linearly dependent even though each column is a solution.

**Acceptance.**

- With σ=id, Φ=1 over Q the solution submodule is the whole space.
- With σ=id, Φ=2 in rank 1 over Q the solution submodule is zero.
- A repeated nonzero solution column is linearly dependent even though each column is a solution.

**Uses.**

- PAP §4.1.6 p.22: A fundamental matrix gives a constant-coordinate basis for all solutions, including rectangular solution matrices.
- CCM Lemma 5.1.1 proof pp.23–24: The same solution-coordinate statement turns an auxiliary block solution into a constant matrix before denominator descent.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.solutionSpace`.

<a id="dm-8-solution-ring"></a>

### 8.25 The solution ring and field

**Target** `DrinfeldModulesAndTModules:DM.8/solution-ring` (construction).

Fix an admissible triple, Φ∈GL\_r(K) and Ψ∈GL\_r(L) fundamental. Define Σ=K\[Ψ\_ij, det(Ψ)^−1\] as the native K-subalgebra of L generated by these elements, Λ=K(Ψ\_ij) as the native intermediate field, and Z=Spec Σ, a closed K-subscheme of GL\_r. The evaluation homomorphism K\[X\_ij, det(X)^−1\]→L has image Σ and kernel the defining ideal of Z. Λ is the fraction field of Σ.

**Proof route.**

- Use native adjoin, matrix determinant, localization and spectrum; include the inverse determinant among generators.
- The difference equation makes Σ stable under σ and σ inverse. The field generated by matrix entries already contains the inverse determinant.
- The generator evaluation gives the quotient/image dictionary and its fraction field.

**Needs:** [DM.8/fundamental-matrix](#dm-8-fundamental-matrix); [DM.8/admissible-fields](#dm-8-admissible-fields); [`mathlib:Algebra.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean); [`mathlib:IntermediateField.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean); [`mathlib:Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean); [`mathlib:AlgebraicGeometry.Spec`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean); [`mathlib:AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.2.1 p.22: The source constructs the K-algebra generated by entries of Ψ and det(Ψ)⁻¹, its fraction field and the associated affine subscheme of GL\_r. The determinant inverse is essential. The packet uses native algebra adjoin and Spec, with the closed immersion supplied by the surjective coordinate-ring map.

**API.**

- **`TauCeti.Difference.Periods.solutionRing_entry`** (constructor): Every entry Ψ\_ij and det(Ψ)^−1 belongs to Σ.
- **`TauCeti.Difference.Periods.solutionRing_le`** (universal-property): Σ≤A iff a K-subalgebra A contains all entries and the inverse determinant.
- **`TauCeti.Difference.Periods.solutionField_fraction`** (compatibility): Λ is the fraction field of the native generated subalgebra Σ.
- **`TauCeti.Difference.Periods.solutionRing_twist`** (structure): σ restricts to a semilinear ring automorphism of Σ.

**Checks.**

- **`TauCeti.Difference.Periods.test_solution_ring_1`** (computation): For Ψ=1 in rank 1, Σ=K and Λ=K.
- **`TauCeti.Difference.Periods.test_solution_ring_2`** (computation): For the empty identity matrix, Σ=K, with empty determinant 1.
- **`TauCeti.Difference.Periods.test_solution_ring_3`** (non-example): For a transcendental scalar z in rank 1, Σ=K\[z, z^−1\]; omitting det^−1 gives the wrong ring.

**Acceptance.**

- For Ψ=1 in rank 1, Σ=K and Λ=K.
- For the empty identity matrix, Σ=K, with empty determinant 1.
- For a transcendental scalar z in rank 1, Σ=K\[z, z^−1\]; omitting det^−1 gives the wrong ring.

**Uses.**

- PAP Theorem 4.2.11 p.26: The ring is the coordinate algebra of the particular solution torsor; its tensor-square is compared with the group coordinate ring.
- PAP Lemma 4.5.2 and Theorem 4.5.3 pp.28–29: It contains fundamental matrices for tensor subquotients of the chosen generator and makes their Betti comparisons available over every F-algebra.

**Used by:** [8.26](#dm-8-comparison-algebra), [8.28](#dm-8-solution-ring-simple), [8.31](#dm-8-relative-algebraic-closure).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.solutionRing`.

<a id="dm-8-comparison-algebra"></a>

### 8.26 The comparison coordinate algebra

**Target** `DrinfeldModulesAndTModules:DM.8/comparison-algebra` (construction).

In L⊗\_K L form Ψ\_1=(Ψ\_ij⊗1), Ψ\_2=(1⊗Ψ\_ij), and D=Ψ\_1^−1Ψ\_2. Define Δ=F\[D\_ij, det(D)^−1\], a native F-subalgebra of L⊗\_K L. Let Γ=Spec Δ. The diagonal σ action fixes D entrywise, but L⊗\_K L need not be a domain. Γ is initially a closed subscheme of GL\_r/F; its group structure is a theorem, not part of this definition.

**Proof route.**

- Map native matrix units along the two tensor-product algebra maps, invert the first and multiply by the second.
- The equation σΨ=ΦΨ cancels Φ in σ(D). Apply native F-algebra generation in the tensor ring; retain determinant inversion.

**Needs:** [DM.8/solution-ring](#dm-8-solution-ring); [`mathlib:Algebra.TensorProduct.includeLeft`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean); [`mathlib:Algebra.TensorProduct.includeRight`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean); [`mathlib:Algebra.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.2.1–4.2.2 p.22: Two tensor copies of Ψ give D=Ψ₁⁻¹Ψ₂, fixed by coefficient twist; its entries and inverse determinant generate the constant comparison algebra. The tensor ring need not be a domain. The source constructs the algebra before establishing its Hopf structure, matching the packet's dependency order.

**API.**

- **`TauCeti.Difference.Periods.comparisonMatrix_formula`** (data): D is Ψ\_1^−1Ψ\_2, in that order.
- **`TauCeti.Difference.Periods.comparisonAlgebra_le`** (universal-property): Δ is the least F-subalgebra containing the entries of D and det(D)^−1.
- **`TauCeti.Difference.Periods.comparisonMatrix_fixed`** (relation): The diagonal coefficient automorphism fixes D.
- **`TauCeti.Difference.Periods.comparisonMatrix_cocycle`** (relation): In the three-fold tensor product, D\_12 D\_23=D\_13.

**Checks.**

- **`TauCeti.Difference.Periods.test_comparison_algebra_1`** (computation): For Ψ=1, D=1 and Δ consists of scalar constants.
- **`TauCeti.Difference.Periods.test_comparison_algebra_2`** (computation): For the empty identity, D is the empty identity and Δ consists of constants.
- **`TauCeti.Difference.Periods.test_comparison_algebra_3`** (non-example): For a scalar z, D=z^−1⊗z; its order distinguishes right multiplication from the reversed torsor convention.

**Acceptance.**

- For Ψ=1, D=1 and Δ consists of scalar constants.
- For the empty identity, D is the empty identity and Δ consists of constants.
- For a scalar z, D=z^−1⊗z; its order distinguishes right multiplication from the reversed torsor convention.

**Uses.**

- PAP Propositions 4.2.8–4.2.10 pp.25–26: The three-factor comparison cocycle descends multiplication, inversion and the identity to its spectrum.
- PAP §6.2 pp.35–36: Computing the comparison matrix of the logarithm extension places its group in the scalar-action triangular subgroup.

**Used by:** [8.30](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.comparisonAlgebra`.

<a id="dm-8-invariant-ideal-descent"></a>

### 8.27 Invariant ideals descend to constants

**Target** `DrinfeldModulesAndTModules:DM.8/invariant-ideal-descent` (theorem).

In L\[X\_ij, det(X)^−1\] let σ\_0 act on coefficients and fix the variables. Extension and contraction give inverse bijections between ideals over F and σ\_0-stable ideals over L.

**Proof route.**

- Choose a finite-support expression in an F-basis and normalize one coefficient to 1. Subtract twists to reduce support; exact constants complete induction.

**Needs:** [DM.8/admissible-fields](#dm-8-admissible-fields); [`mathlib:Ideal.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean); [`mathlib:Ideal.comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.2.3 p.23: The lemma descends coefficient-twist-stable ideals in a localized polynomial ring from L to the exact constant field using finite-support coefficient relations. The packet expresses the same coefficient argument as a tensor-algebra interface. No solution-ring simplicity or later Σ-descent result is assumed here.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.28](#dm-8-solution-ring-simple), [8.29](#dm-8-solution-invariant-ideal-descent), [8.30](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.invariant_ideal_descent`.

<a id="dm-8-solution-ring-simple"></a>

### 8.28 Difference simplicity of the solution ring

**Target** `DrinfeldModulesAndTModules:DM.8/solution-ring-simple` (theorem).

The solution ring Σ has no proper nonzero ideal stable under σ; equivalently the kernel of generator evaluation is maximal among proper σ\_1-stable ideals, where σ\_1 applies coefficient σ and sends X to Φ X. Stability by inclusion suffices because the coordinate ring is noetherian.

**Proof route.**

- Translate by Ψ to turn σ\_1 into coefficient σ\_0. Extend a putative invariant ideal to a maximal ideal over constants, obtaining a finite field extension E/F and a second fundamental matrix.
- Its ratio to Ψ lies in GL\_r(E). Noetherian stabilization and faithful flatness of scalar extension force the old defining ideal and the larger one to coincide.
- Only the L-valued invariant-ideal clause is used here; the Σ clause is proved afterward, avoiding a logical cycle.

**Needs:** [DM.8/solution-ring](#dm-8-solution-ring); [DM.8/invariant-ideal-descent](#dm-8-invariant-ideal-descent); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Corollary 4.2.5 p.24: The corollary proves that the solution ring has no proper nonzero twist-stable ideal using the earlier L-coefficient descent and a constant maximal-ideal specialization. The packet makes the noetherian passage from inclusion stability to equality explicit and imports affine descent without using the later solution-ring ideal-descent theorem circularly.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.29](#dm-8-solution-invariant-ideal-descent), [8.30](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.solution_ring_simple`.

<a id="dm-8-solution-invariant-ideal-descent"></a>

### 8.29 Ideal descent over the solution ring

**Target** `DrinfeldModulesAndTModules:DM.8/solution-invariant-ideal-descent` (theorem).

Every coefficient-σ-stable ideal in Σ\[X\_ij, det(X)^−1\] is generated by its intersection with F\[X\_ij, det(X)^−1\]. Extension and contraction are inverse on these ideals. This is asserted for the σ-simple solution ring Σ, not for an arbitrary difference algebra.

**Proof route.**

- Use a minimal nonzero support modulo the contracted ideal. Its leading-coefficient ideal is σ-stable and nonzero, so simplicity supplies coefficient 1. Subtract twists and apply exact constants to contradict minimal support.

**Needs:** [DM.8/solution-ring-simple](#dm-8-solution-ring-simple); [DM.8/invariant-ideal-descent](#dm-8-invariant-ideal-descent); [`mathlib:Ideal.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean); [`mathlib:Ideal.comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.2.7 p.25: The lemma extends invariant-ideal descent from L-coefficients to solution-ring coefficients after σ-simplicity has been established. Finite-support relations and simplicity control the coefficient module. The tensor formulation retains coefficient-only twist and the base-field scalar actions.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.30](#dm-8-difference-torsor).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.solution_invariant_ideal_descent`.

<a id="dm-8-difference-torsor"></a>

### 8.30 The difference Galois group and its torsor

**Target** `DrinfeldModulesAndTModules:DM.8/difference-torsor` (theorem). **Planet:** Difference Galois torsor.

For every admissible triple and fundamental Ψ, Δ admits the Hopf structure inherited from GL\_r, with comultiplication D\_ij↦Σ\_k D\_ik⊗D\_kj, counit D\_ij↦δ\_ij and antipode D↦D^−1. Therefore Γ=Spec Δ is a closed F-subgroup scheme of GL\_r. Z=Spec Σ is a right Γ\_K-torsor: the map (u, v)↦(u, u^−1v) induces Z×\_K Z≅Z×\_K Γ\_K, equivalently an isomorphism Σ⊗\_K Σ≅Σ⊗\_F Δ. Also Z\_L≅Γ\_L via u↦Ψ^−1u. These are scheme and coordinate-ring isomorphisms, not just bijections on rational points.

**Proof route.**

- Conjugate defining ideals by the translation X↦Ψ^−1X and use invariant-ideal descent over L and Σ.
- The cocycle formula on three tensor factors gives multiplication; identity and factor swap give counit and inverse. Descend the resulting diagrams by faithful flatness.
- The field inclusions make Σ faithfully flat over K and F; use the supplier affine descent interface to prove the torsor statement.

**Needs:** [DM.8/comparison-algebra](#dm-8-comparison-algebra); [DM.8/invariant-ideal-descent](#dm-8-invariant-ideal-descent); [DM.8/solution-invariant-ideal-descent](#dm-8-solution-invariant-ideal-descent); [DM.8/solution-ring-simple](#dm-8-solution-ring-simple); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.1/torsor`](../packets/SchemeAndStackFoundations.json); [`mathlib:CommHopfAlgCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/CommHopfAlgCat.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Propositions 4.2.4 and 4.2.8 pp.23–25; Theorem 4.2.11 p.26: The propositions identify the comparison algebra after base change and construct coproduct, counit and antipode from matrix multiplication, identity and inversion. The theorem proves the solution scheme is a torsor under the resulting affine group scheme. The packet records coordinate-ring isomorphisms and fpqc descent, rather than relying only on rational-point identities.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.32](#dm-8-difference-smooth-dimension), [8.33](#dm-8-difference-invariants), [8.34](#dm-8-tannakian-identification).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.difference_torsor`.

<a id="dm-8-relative-algebraic-closure"></a>

### 8.31 Relative algebraic closure in the analytic solution field

**Target** `DrinfeldModulesAndTModules:DM.8/relative-algebraic-closure` (theorem).

For the actual analytic triple (F\_q(t), k̄(t), L), k̄(t) is algebraically closed in Λ=k̄(t)(Ψ). Namely every element of Λ algebraic over k̄(t) lies in k̄(t). This is a relative-algebraic-closure assertion, not that k̄(t) is an algebraically closed field.

**Proof route.**

- Adjoin all twists of a relatively algebraic element; the resulting intermediate field H is finite and separable over k̄(t), since Λ is finitely generated.
- Use the function-field/curve correspondence and a σ-invariant effective divisor above infinity. Riemann–Roch supplies a finite-dimensional stable space of functions generating H.
- Apply Lang to GL\_m over F\_q, base changed to k̄, to produce a σ-fixed basis. Exact constants put every basis function in F\_q(t), forcing H=k̄(t).

**Needs:** [DM.8/solution-ring](#dm-8-solution-ring); [DM.8/analytic-separability](#dm-8-analytic-separability); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json); [TauCetiRoadmap JacobianChallenge layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/JacobianChallenge/README.md#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality); [`SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.3`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 4.3.3 pp.26–27: For K=bar(k)(t), the proposition turns a finite twist-stable subextension of the solution field into a curve over perfect bar(k). A large divisor gives a finite-dimensional stable section space, Lang normalizes its semilinear action, and exact constants eliminate the extension. The packet separates the curve/Frobenius transport, Riemann–Roch bounds and Lang base extension needed for this proof.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.32](#dm-8-difference-smooth-dimension).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.relative_algebraic_closure`.

<a id="dm-8-difference-smooth-dimension"></a>

### 8.32 Smoothness and dimension of the difference group

**Target** `DrinfeldModulesAndTModules:DM.8/difference-smooth-dimension` (theorem).

If K is relatively algebraically closed in Λ for an admissible triple, Γ is geometrically integral and smooth over F, Z is geometrically integral and smooth over K, and dim\_F Γ=trdeg\_K Λ. In the analytic triple the extra hypothesis follows from relative-algebraic-closure. The proof of smoothness uses the finite-type group structure: geometric reducedness alone is not a smoothness criterion for arbitrary schemes.

**Proof route.**

- Separability and relative algebraic closure imply geometric integrality of Σ. Transfer geometric reducedness and irreducibility across the torsor after an algebraically closed extension.
- Apply the native finite-type Hopf-algebra smoothness criterion to Γ; smoothness of Z follows by the torsor local trivialization and descent.
- Use dimension invariance under field extension and the affine-domain dimension/transcendence theorem for Σ.

**Needs:** [DM.8/difference-torsor](#dm-8-difference-torsor); [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure); [`tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.lean); [`SchemeAndStackFoundations:SF.1/torsor`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 4.3.1 p.26; Corollary 4.3.4 p.27: The theorem identifies group dimension with the solution-field transcendence degree and proves smoothness/geometric connectedness in the analytic case; the corollary supplies relative closure there. The packet states the general admissible-field result with relative algebraic closure as an extra hypothesis and uses the native finite-type Hopf-algebra smoothness criterion, not an arbitrary-scheme reducedness shortcut.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.33](#dm-8-difference-invariants), [8.53](#dm-8-period-transcendence), [8.55](#dm-8-logarithm-group-linear).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.difference_smooth_dimension`.

<a id="dm-8-difference-invariants"></a>

### 8.33 The difference Galois action and its fixed field

**Target** `DrinfeldModulesAndTModules:DM.8/difference-invariants` (theorem).

Right multiplication gives Γ(F)≅Aut\_σ(Σ/K)≅Aut\_σ(Λ/K). For geometric fixed-field assertions choose an extension of σ to an algebraic closure of L, write F\_n for its σ^n-fixed field and assume (F\_n, K̄, L̄) is σ^n-admissible for every n and F̄=⋃F\_n. On the corresponding geometrically integral solution field Λ̃, the elements fixed by Γ(F̄) are precisely K̄, and Λ∩Λ̃^{Γ(F̄)}=K. The analytic triple has this property. No density of Γ(F) over the imperfect F is assumed.

**Proof route.**

- A σ-commuting automorphism sends Ψ to Ψγ; exact constants imply γ∈GL\_r(F), and preserving the solution ring gives γ∈Γ(F).
- For a geometric invariant rational function, use SF.0/jacobson-finite-type after extension to an algebraically closed field: closed points of this finite-type scheme are rational and dense. Reducedness and the torsor identity then equate its two pullbacks on their domain of definition, forcing it to be constant.
- Use relative algebraic closure to descend the intersection with Λ. Do not replace the union-of-fixed-fields hypotheses by a claim about rational points over F.

**Needs:** [DM.8/difference-torsor](#dm-8-difference-torsor); [DM.8/difference-smooth-dimension](#dm-8-difference-smooth-dimension); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [`SchemeAndStackFoundations:SF.1/affine-fpqc-descent`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0/jacobson-finite-type`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), §4.4.1–4.4.5 pp.27–28; Theorem 4.4.6 p.28: The source identifies algebra-valued group actions with difference automorphisms and computes invariant fields after passing to algebraically closed constants, including the higher-twist constant fields. The packet retains the geometric-point argument and subsequent descent to K; it does not assume that Γ(F) is Zariski dense over the imperfect constant field.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.34](#dm-8-tannakian-identification).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.difference_invariants`.

<a id="dm-8-tannakian-identification"></a>

### 8.34 Identification with the motivic Galois group

**Target** `DrinfeldModulesAndTModules:DM.8/tannakian-identification` (comparison).

For M∈T with chosen Φ and fundamental Ψ, Γ\_Ψ is isomorphic over F\_q(t) to Γ\_M=Aut^⊗(ω|⟨M⟩). Every N∈⟨M⟩ has a fundamental matrix over Σ; hence Σ\_R⊗\_F N^B→Σ\_R⊗\_K N is bijective for every F-algebra R. The induced tensor functor⟨M⟩→Rep\_F(Γ\_Ψ) is fully faithful, realizes every stable Betti subspace as a submotive, and tensor-generates the representation category. The induced homomorphism is faithfully flat and a closed immersion, hence an isomorphism of group schemes.

**Proof route.**

- Construct the action using Ψ→Ψγ on Σ and the Betti basis Ψ^−1m. Check functoriality on arbitrary F-algebras, not just geometric points.
- For fullness reduce Hom(P, N) to Hom(1, Hom(P, N)); invariant coefficient functions descend to K by difference-invariants.
- For stable subspaces row-reduce defining equations; uniqueness forces their coefficients to be invariant, hence in K. The block matrix gives a rigid-trivial submotive.
- The faithful generator M^B supplies all representations as tensor subquotients. Import MC.6 faithfully-flat and closed-immersion criteria.

**Needs:** [DM.8/neutral-category](#dm-8-neutral-category); [DM.8/difference-torsor](#dm-8-difference-torsor); [DM.8/difference-invariants](#dm-8-difference-invariants); [`MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`](../packets/MotivesAndAlgebraicCycles.json); [`MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`](../packets/MotivesAndAlgebraicCycles.json); [`MotivesAndAlgebraicCycles:MC.6`](../packets/MotivesAndAlgebraicCycles.json); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 4.5.2 and Theorem 4.5.3 pp.28–29; Propositions 4.5.6–4.5.9 pp.30–31; Theorem 4.5.10 p.32: The source lets the difference group act on Betti realizations over arbitrary constant algebras, proves fullness and realizes stable subspaces as motive subobjects, then identifies ΓΨ with ΓM. The packet imports neutral reconstruction from MC.6 and requests only the remaining tensor-generation/group-map criteria, with the source kernel matrix interpreted in its correct vertical shape.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.53](#dm-8-period-transcendence), [8.55](#dm-8-logarithm-group-linear).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.tannakian_identification`.

<a id="dm-8-entire-from-equation"></a>

### 8.35 Restricted solutions become entire

**Target** `DrinfeldModulesAndTModules:DM.8/entire-from-equation` (theorem).

If Φ∈Mat\_r(k̄\[t\]), det Φ(0)≠0, and ψ∈T^r satisfies σ(ψ)=Φψ, then every component of ψ lies in E, including coefficient algebraicity and the finite coefficient-field condition. This requires invertibility at 0; the determinant-only-at θ condition implies it because θ≠0.

**Proof route.**

- Use Lang on Φ(0) to normalize its constant term to 1. The coefficient recursion makes every coefficient algebraic over k.
- On the sufficiently small coefficient tail solve inverse-Frobenius differences by convergent sums of positive twists. The fixed difference is zero because it is strictly small. This bounds the coefficient field over k∞.
- The same recursion, multiplied by arbitrary C^n, bounds C^n||a\_n|| for every C&gt;1, giving infinite radius.

**Needs:** [DM.8/entire-series](#dm-8-entire-series); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [ABP-v1](#source-abp-v1), Proposition 3.1.3 pp.9–10: ABP proves that a restricted-series solution of a polynomial inverse-Frobenius equation belongs to its arithmetic entire ring when the matrix is invertible at zero. Its proof first gives algebraic coefficients in a finite extension over k∞, then improves convergence at every radius. The packet keeps these conclusions separate and records the Lang normalization input.
- [PAP-v2](#source-pap-v2), Proposition 5.1.3 p.32: The proposition invokes ABP Proposition 3.1.3: a Tate-algebra solution of a polynomial system invertible at zero is entire. The packet also retains ABP's arithmetic coefficient/finite-field conclusions required for the later lifting theorem.
- [ABP-published](#source-abp-published), Proposition3.1.3 pp.247–248: The published proposition proves the same polynomial-system result with invertibility at zero. Its coefficient recursion and convergence argument give both membership in the arithmetic entire ring and the finite coefficient extension used here.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.53](#dm-8-period-transcendence), [8.38](#dm-8-logarithm-matrices).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.entire_from_equation`.

<a id="dm-8-degree-span"></a>

### 8.36 Bounded monomial spans

**Target** `DrinfeldModulesAndTModules:DM.8/degree-span` (construction).

For a finite family x:I→A in an F-algebra and d≥0, define D\_d(x) as the native F-submodule spanned by products∏\_i x\_i^{e\_i} with e:I→N and Σ\_i e\_i≤d. This includes the constant monomial 1. It is the image of the degree-at-most-d multivariate-polynomial subspace under evaluation, is finite-dimensional, and D\_d⊆D\_{d+1}. For all entries of Ψ, the vector formed by 1 and all columns of tensor powers Ψ^{⊗n}, 1≤n≤d, spans exactly D\_d over K; its specialization spans D\_d(Ψ(θ)) over k̄.

**Proof route.**

- Use native polynomial evaluation and exponent functions; repetitions among tensor-entry monomials do not change the span.
- The block system is \[1\] plus Φ^{⊗n} repeated r^n times, with exactly 1+Σ\_{n=1}^d r^{2n} coordinates. This formula also works for r=1 and rank 0, avoiding the preprint geometric-series division.

**Needs:** [`mathlib:Submodule.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean); [`mathlib:MvPolynomial.aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean); [DM.8/fundamental-matrix](#dm-8-fundamental-matrix).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 5.2.2 proof p.33: The period proof places 1 and all bounded-degree tensor-entry monomials in one difference system. Their spans are the generator filtration used for transcendence degree. The packet uses 1+Σₙ₌₁ᵈr²ⁿ as its block length, valid also at rank one and rank zero, instead of the source's geometric quotient that is undefined at rank one.

**API.**

- **`TauCeti.Difference.Periods.degreeSpan_zero`** (simp): D\_0(x) is the F-span of 1.
- **`TauCeti.Difference.Periods.degreeSpan_mono`** (relation): d≤e implies D\_d(x)≤D\_e(x).
- **`TauCeti.Difference.Periods.degreeSpan_polynomial`** (compatibility): D\_d is the image of degree-at-most-d multivariate polynomials under evaluation.
- **`TauCeti.Difference.Periods.degreeSpan_finite`** (structure): For finite I, D\_d is finite-dimensional over F.

**Checks.**

- **`TauCeti.Difference.Periods.test_degree_span_1`** (computation): D\_0 contains 1 even for an empty family.
- **`TauCeti.Difference.Periods.test_degree_span_2`** (computation): For the singleton x=0, every D\_d is the span of 1.
- **`TauCeti.Difference.Periods.test_degree_span_3`** (non-example): For a transcendental singleton x, 1, x, x² have dimension 3 in D\_2; constants or repeated coordinates alone cannot give this dimension.

**Acceptance.**

- D\_0 contains 1 even for an empty family.
- For the singleton x=0, every D\_d is the span of 1.
- For a transcendental singleton x, 1, x, x² have dimension 3 in D\_2; constants or repeated coordinates alone cannot give this dimension.

**Uses.**

- PAP Theorem 5.2.2 proof p.33: ABP applies to the block system of all bounded tensor-entry monomials, so specialization preserves each filtered span dimension.
- DM.8/period-transcendence: The imported degree-growth criterion converts equality of these filtered dimensions into equality of function-field transcendence degrees.

**Used by:** [8.53](#dm-8-period-transcendence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.degreeSpan`.

<a id="dm-8-carlitz-deformation"></a>

### 8.37 Deformations of small Carlitz logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-deformation` (construction).

For α∈k̄ with ||α||&lt;q^(q/(q−1)), define L\_α(t)=Σ\_{i≥0} α^(q^i)/∏\_{j=1}^i(t−θ^(q^j)), the empty denominator being 1. It defines a restricted series and converges on ||t||&lt;q^q. It satisfies σ(L\_α)=σ(α)+L\_α/(t−θ) and L\_α(θ)=log\_C(α), where log\_C is the chosen local inverse supplied by DM.2. L\_α itself need not be entire; Ω L\_α is entire once its difference system is used.

**Proof route.**

- Each denominator factor has nonzero constant coefficient, so use native formal power-series inversion for its expansion. The norm bound gives coefficientwise and disk convergence of the sum.
- Shift the summation index after inverse twist to prove the functional equation; specialization gives the Carlitz logarithm series from DM.2.

**Needs:** [DM.8/entire-series](#dm-8-entire-series); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [PAP-v2](#source-pap-v2), §6.1.1 p.34: The source defines the deformed logarithm by its explicit denominator series for a small algebraic α, proves its inverse-twist recurrence and its value log\_C(α) at θ, and observes that ΩLα is entire. Lα itself need not be entire. The packet retains the strict convergence bound and the nonzero condition for the nonvanishing assertion.

**API.**

- **`TauCeti.Difference.Periods.carlitzDeformation_zero`** (simp): L\_0=0.
- **`TauCeti.Difference.Periods.carlitzDeformation_add`** (relation): L\_{α+β}=L\_α+L\_β whenever all arguments are in the small disk; it is F\_q-linear there.
- **`TauCeti.Difference.Periods.carlitzDeformation_twist`** (relation): σ(L\_α)=σ(α)+L\_α/(t−θ).
- **`TauCeti.Difference.Periods.carlitzDeformation_value`** (compatibility): At θ its convergent sum agrees with log\_C(α).

**Checks.**

- **`TauCeti.Difference.Periods.test_carlitz_deformation_1`** (computation): The zero argument produces the zero series.
- **`TauCeti.Difference.Periods.test_carlitz_deformation_2`** (computation): For β in the small disk, L\_{−β}=−L\_β.
- **`TauCeti.Difference.Periods.test_carlitz_deformation_3`** (non-example): For nonzero α in the small disk, L\_α has nonzero constant coefficient; the source excludes zero when using the logarithmic extension.

**Acceptance.**

- The zero argument produces the zero series.
- For β in the small disk, L\_{−β}=−L\_β.
- For nonzero α in the small disk, L\_α has nonzero constant coefficient; the source excludes zero when using the logarithmic extension.

**Uses.**

- PAP §6.1.2 and Proposition 6.1.3 pp.34–35: Its Frobenius equation gives the lower-left logarithm-system entries; multiplication by Omega produces entire entries.
- PAP Theorem 6.3.2 pp.36–37: Evaluation at theta turns the linear torsor equations into relations among the period and the small principal logarithms.

**Used by:** [8.38](#dm-8-logarithm-matrices), [8.56](#dm-8-logarithm-linear-relations).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.carlitzDeformation`.

<a id="dm-8-logarithm-matrices"></a>

### 8.38 The Carlitz logarithm extension matrices

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-matrices` (construction).

For r small algebraic arguments α\_i, use index {0}⊔Fin r and define Φ by Φ\_00=t−θ, Φ\_i0=σ(α\_i)(t−θ), Φ\_ii=1 for i&gt;0, with all remaining entries zero. Define Ψ by Ψ\_00=Ω, Ψ\_i0=Ω L\_{α\_i}, Ψ\_ii=1 for i&gt;0 and zeros elsewhere. Then det Φ=t−θ, det Ψ=Ω, σΨ=ΦΨ and Ψ∈GL\_{r+1}(T) has entire entries. The represented pre-t-motive X fits 0→C→X→1^r→0 in the column-basis convention.

**Proof route.**

- Construct the matrices by native block constructors and verify their entries, determinant and equation using the Ω and L equations.
- Use entire-from-equation to prove Ω L entries are entire, instead of asserting L itself entire. DM.4 realizes the invertible rational matrix as a pre-t-motive.

**Needs:** [DM.8/carlitz-deformation](#dm-8-carlitz-deformation); [DM.8/entire-from-equation](#dm-8-entire-from-equation); [DM.2/omega](#dm-2-omega); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity).

**Sources.**

- [PAP-v2](#source-pap-v2), §6.1.2–Proposition 6.1.3 pp.34–35: The matrices form a lower-triangular Carlitz extension with det Φ=t−θ and det Ψ=Ω; the recurrence proves σΨ=ΦΨ and ΩLα provides entire entries. The sequence is 0→C→X→1^r→0. The packet includes m₀ in the rank-(r+1) basis column, correcting the omitted coordinate in the source notation.

**API.**

- **`TauCeti.Difference.Periods.logPhi_entries`** (simp): Φ has the displayed first column and identity lower-right block.
- **`TauCeti.Difference.Periods.logPsi_entries`** (simp): Ψ has first column (Ω, Ω L\_i) and identity lower-right block.
- **`TauCeti.Difference.Periods.logMatrices_det`** (relation): det Φ=t−θ and det Ψ=Ω.
- **`TauCeti.Difference.Periods.logMatrices_equation`** (compatibility): The Ω and L equations imply σΨ=ΦΨ.

**Checks.**

- **`TauCeti.Difference.Periods.test_logarithm_matrices_1`** (computation): With r=0, Φ=t−θ and Ψ=Ω give the Carlitz object.
- **`TauCeti.Difference.Periods.test_logarithm_matrices_2`** (computation): With one zero argument the matrices split as Carlitz plus unit.
- **`TauCeti.Difference.Periods.test_logarithm_matrices_3`** (non-example): Two copies of the same argument give equal off-diagonal entries; this setup cannot certify their linear independence.

**Acceptance.**

- With r=0, Φ=t−θ and Ψ=Ω give the Carlitz object.
- With one zero argument the matrices split as Carlitz plus unit.
- Two copies of the same argument give equal off-diagonal entries; this setup cannot certify their linear independence.

**Uses.**

- PAP Proposition 6.1.3 pp.34–35: The explicit matrix realizes the Carlitz extension; tensoring with Carlitz supplies an effective lattice and proves membership in T.
- PAP §6.2 pp.35–36; Theorem 6.3.2 pp.36–37: The comparison matrix constrains the Galois group, whose linear equations determine the logarithm-span dimension.

**Used by:** [8.39](#dm-8-logarithm-motive-membership).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.logPhi`.

<a id="dm-8-logarithm-motive-membership"></a>

### 8.39 Membership of the logarithm extension in T

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-motive-membership` (theorem).

For the logarithm matrices, X is an object of the chosen category T, not merely of R. Indeed C⊗X is the rationalization of a rigid-trivial dual Anderson motive M over k̄\[t\], with σ matrix (t−θ)Φ. It lies in 0→C^{⊗2}→M→C^r→0; it is finite free over k̄\[t\] and k̄\[σ\], and (t−θ)^n M⊂σ M for n≥2. Since T contains C^∨ and is closed under tensor products, X∈T.

**Proof route.**

- The explicit σ matrix gives the exact sequence and the power-annihilation condition.
- Import DM.4 finite generation and freeness over k̄\[σ\] for this lattice, including ABP Proposition 4.3.2; do not manufacture freeness from the polynomial rank alone.
- The fundamental matrix and integral/rational criterion give rigid triviality; tensor with C^∨ yields X.

**Needs:** [DM.8/logarithm-matrices](#dm-8-logarithm-matrices); [DM.8/neutral-category](#dm-8-neutral-category); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/dual-realization](#dm-4-dual-realization); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 6.1.3 pp.34–35: The proposition proves that X belongs to the tensor category generated by dual Anderson motives by showing C⊗X is such a motive. It checks polynomial and σ-module finite freeness and the nilpotence condition using the ABP criterion. The packet requires this σ-generation argument; polynomial freeness of X alone would not suffice.
- [ABP-v1](#source-abp-v1), Proposition 4.3.2 p.21: The criterion gives finite freeness over the skew polynomial ring from the polynomial-module structure and the sufficiently strong (t−θ)-nilpotence condition. Papanikolas checks it for C⊗X, supplying the dual Anderson membership needed here.
- [ABP-published](#source-abp-published), Proposition4.3.2 pp.262–263: The published criterion has the same polynomial-module and nilpotence hypotheses and yields skew-polynomial finite freeness. It validates the σ-generation step for C⊗X rather than treating polynomial freeness as motive membership.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.55](#dm-8-logarithm-group-linear).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.logarithm_motive_membership`.

<a id="dm-8-logarithm-division"></a>

### 8.40 Reduction to small algebraic logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-division` (theorem).

For λ∈C∞ with exp\_C(λ)∈k̄^×, there exist n≥0, α∈k̄^× with ||α||&lt;q^(q/(q−1)), and f∈F\_q\[θ\] such that λ=θ^n log\_C(α)+f π̃. If exp\_C(λ)=0, λ itself lies in F\_q\[θ\]π̃. Thus any finite family of logarithms with algebraic exponentials is contained in the k-linear span of π̃ and finitely many small principal algebraic logarithms.

**Proof route.**

- If the exponential is already small, take it as α and n=0; otherwise solve θ x+x^q=β repeatedly in k̄. Newton polygon bounds shrink division points until the local inverse applies.
- Carlitz equivariance gives exp\_C(θ^n log\_C(α))=exp\_C(λ); the kernel period lattice gives f π̃.
- Handle exp\_C(λ)=0 separately; the printed nonzero-exponential lemma alone cannot cover such λ.

**Needs:** [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [DM.2/carlitz-period](#dm-2-carlitz-period); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 6.4.1 pp.37–38; §1.2 pp.3–4: For an arbitrary logarithm with nonzero algebraic exponential, the lemma divides by a large power of θ until the principal logarithm is small and expresses the remaining ambiguity as a k-multiple of the Carlitz period. The packet treats zero exponentials separately by the period kernel, because the division lemma does not cover them.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.57](#dm-8-carlitz-logarithm-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.logarithm_division`.

<a id="dm-8-constant-denominator"></a>

### 8.41 Frobenius-invariant common denominators

**Target** `DrinfeldModulesAndTModules:DM.8/constant-denominator` (theorem).

Let Φ\_i∈Mat\_{r\_i}(k̄\[t\]) have det Φ\_i=c\_i(t−θ)^{s\_i}, c\_i≠0, s\_i≥0, i=1, 2. If B∈Mat\_{r\_1×r\_2}(k̄(t)) satisfies σ(B)Φ\_2=Φ\_1B, its monic least common denominator belongs to F\_q\[t\]. Thus a nonzero polynomial over F\_q clears all entries. The matrix B is rational; the polynomial domain printed in CPY Proposition 2.2.1 is corrected in source issue E-DM8-8, reusing PAPER-NGODAC-21/E10.

**Proof route.**

- The denominator of σ(B) divides den(B)(t−θ)^{s\_2}. If it has a pole at θ, repeated Frobenius shifts force infinitely many distinct poles, using both determinant conditions.
- Therefore the monic denominator is σ-fixed and lies in F\_q\[t\]. This also proves rationalized Hom compatibility for DM.4 without redefining the motives.

**Needs:** [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [`mathlib:RatFunc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Defs.lean).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 3.4.5 pp.18–19: The proposition shows that the monic least common denominator of a rational motive morphism is fixed by inverse Frobenius and hence lies in F\_q\[t\], using both polynomial matrices with determinant supported at θ. The packet keeps rational matrix entries before clearing denominators; the result does not claim every rationalized morphism is polynomial.
- [CPY-v2](#source-cpy-v2), Proposition 2.2.1 p.6: The proof transports a morphism between rationalized motives to a constant matrix using their fundamental solutions, then uses determinant support to force its monic denominator into F\_q\[t\]. The printed polynomial type for the starting matrix is corrected to rational entries, as confirmed by the 1/t identity example.
- [CCM-v2](#source-ccm-v2), Lemma 5.1.1 proof p.24: In the auxiliary block argument, constant solution coordinates and a rational basis change lead to denominator descent over F\_q\[t\]. This is a concrete consumer of the shared rational-matrix lemma, not a claim that the starting morphism has polynomial entries.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.constant_denominator`.

<a id="dm-8-anderson-comparison"></a>

### 8.42 Anderson uniformization and analytic triviality

**Target** `DrinfeldModulesAndTModules:DM.8/anderson-comparison` (theorem).

Let E be an abelian t-module over C∞ in generic characteristic with normalized exponential exp\_E and associated contravariant τ-motive M(E). Then exp\_E is surjective if and only if M(E) is rigid analytically trivial: if τm=Θm, there is Υ∈GL\_r(T) satisfying Υ=Υ^(1)Θ. For E descending to k̄, through the τ-to-σ star dictionary and its associated Anderson dual motive H(E), this is equivalent to the rationalized dual pre-t-motive being rigid analytically trivial, with Ψ^(−1)=ΦΨ. For general C∞ coefficients the same dual criterion uses the analogous difference modules over C∞(t), rather than pretending that E descends to k̄. The rank-r A-period lattice and a Betti basis correspond under Anderson’s comparison. In particular the Carlitz tensor power C^⊗n is uniformizable for every n≥1: its dual fundamental solution is Ω^n, while its τ trivialization is ((t−θ)Ω)^n. The two matrices use different conventions.

**Hypotheses.**

- E is abelian and defined over C∞ with θ transcendental, ||θ||=q. The assertion is not made for arbitrary nonabelian t-modules or broad effective dual motives. The dual object is the one matched to E by DM.4, not an arbitrary transpose of a τ matrix.

**Proof route.**

- Apply Anderson’s analytic comparison between the exponential sequence and the τ-invariant basis of the Tate realization; identify the comparison map and its rank.
- Transport along the star anti-isomorphism and the abelian dual realization, retaining the variance and ordinary-matrix-inverse versus coefficient-twist distinction.
- For the Carlitz case, Ω^(−1)=(t−θ)Ω makes Ω^n a σ-solution; applying positive twist shows Υ=((t−θ)Ω)^n satisfies Υ=Υ^(1)(t−θ)^n. Integral and rational rigid triviality agree by the polynomial determinant-support theorem.

**Needs:** [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence); [DM.4/uniformizability](#dm-4-uniformizability); [DM.4/star-adapter](#dm-4-star-adapter); [DM.4/dual-realization](#dm-4-dual-realization); [DM.4/rationalization](#dm-4-rationalization); [DM.4/carlitz-tensor-power](#dm-4-carlitz-tensor-power); [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/fundamental-betti-basis](#dm-8-fundamental-betti-basis); [DM.8/integral-trivialization](#dm-8-integral-trivialization); [DM.2/omega](#dm-2-omega).

**Sources.**

- [BP-RAPID](#source-bp-rapid), Theorem 4.2 p.16; §4.4 pp.17–18: States Anderson’s abelian t-module comparison and distinguishes the τ and dual σ conventions.
- [PAP-v2](#source-pap-v2), §1.1.4 p.2; Proposition 3.4.7 p.19: Dual formulation and equivalence of integral and rational analytic triviality.

**Acceptance.**

- For the Carlitz rank-one τ motive use (t−θ)Ω, whereas for its dual σ motive use Ω.
- Check n=2, rank one and group dimension two.
- Keep the original analytic comparison proof as an explicit source gap until inspected; the survey statement alone does not close it.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Comparison`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-size"></a>

### 8.43 Conjugate size for the ABP arithmetic setting

**Target** `DrinfeldModulesAndTModules:DM.8/abp-size` (construction).

Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞. For x∈k̄ define S(x) as the maximum of |τx|∞ over its k-conjugates, with S(0)=0; define polynomial and finite-matrix size by the maximum coefficient size, using zero for an empty array. Size is ultrametric and submultiplicative and S(x^(n))=S(x)^(q^n) for every integer twist n. For 0≠x∈O, S(x)≥1 and |x|∞≥S(x)^(1−d). The exponent uses the separable degree d of K0, not the infinite degree of K/k.

**Proof route.**

- The finite set of distinct conjugates gives a maximum; pure inseparability contributes no new conjugates.
- For x∈O0, the product over conjugates is a nonzero polynomial in θ. At the chosen infinity norm it is at least 1, giving the lower bound on one factor.
- Raise any x∈O to a sufficiently large q-power in O0 and take roots of both inequalities. The coefficient and matrix bounds follow from the ultrametric triangle inequality.

**Needs:** [DM.2/c-infinity](#dm-2-c-infinity); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json); [TauCetiRoadmap AlgebraicCurves layer-2-affine-models--the-dedekind-bridge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicCurves/README.md#layer-2-affine-models--the-dedekind-bridge).

**Sources.**

- [ABP-published](#source-abp-published), §§3.2–3.3.2, pp.248–249: Conjugate size and the integral lower bound, including passage to the perfect closure.

**API.**

- **`abpSize`** (constructor): Maximum infinity norm of the finite k-conjugate set; extend coefficientwise to polynomials and matrices.
- **`abpSize_twist`** (compatibility): S(f^(n))=S(f)^(q^n) for every integer n.
- **`abpSize_add_mul`** (characterisation): S(f+g)≤max(S(f),S(g)) and S(FG)≤S(F)S(G) for conformable matrices.
- **`abpSize_integral_lower`** (characterisation): For nonzero x∈O, S(x)≥1 and |x|∞≥S(x)^(1−d).

**Checks.**

- **`abpSize_test_theta`** (computation): S(θ)=q and S(θ^(q^(−ν)))=q^(q^(−ν)).
- **`abpSize_test_zero`** (degenerate): The zero polynomial and zero matrix have size zero; the identity matrix of positive size has size one.
- **`abpSize_test_integral`** (compatibility): For K0=k and x∈A nonzero, the lower bound reads |x|∞≥1.
- **`abpSize_test_conjugates`** (non-example): For a root x of X²−θX+1, the two infinity roots have norms q and q^(−1); S(x)=q even when x is embedded as the small root. This polynomial is separable in every characteristic, since θ≠0.

**Acceptance.**

- Retain max over all conjugates, including extensions with different infinity embeddings.

**Uses.**

- ABP §§3.3–3.4 pp.249–256: Controls kernel solutions and leading-coefficient estimates without identifying size with one chosen norm.

**Used by:** [8.48](#dm-8-abp-estimates), [8.44](#dm-8-abp-liouville), [8.45](#dm-8-abp-count), [8.46](#dm-8-abp-siegel).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-liouville"></a>

### 8.44 ABP Liouville inequality

**Target** `DrinfeldModulesAndTModules:DM.8/abp-liouville` (theorem).

Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞. Let f(Z)=Σ a\_i Z^i∈O\[Z\] be nonzero, and let λ∈k̄ be a nonzero root of exact multiplicity ν≥1. Then |λ|∞^ν≥(max\_i S(a\_i))^(−d).

**Proof route.**

- If |λ|∞≥1, use max\_i S(a\_i)≥1. Otherwise remove the power of Z dividing f so that its constant coefficient is nonzero; this does not change the multiplicity at λ.
- Expand f(Z+λ), whose first ν coefficients vanish. Evaluate at Z=−λ and use the ultrametric bound on the remaining coefficients.
- Apply the integral lower bound to the nonzero constant coefficient and divide by the maximal coefficient size.

**Needs:** [DM.8/abp-size](#dm-8-abp-size).

**Sources.**

- [ABP-published](#source-abp-published), Lemma 3.3.3, pp.249–250: The multiplicity and separable degree occur exactly in this lower bound.

**Acceptance.**

- For f=Z−θ and K0=k, check q≥q^(−1).
- For f=(Z−1)^ν the bound is equality 1; λ=0 is explicitly excluded.

**Used by:** [8.48](#dm-8-abp-estimates), [8.50](#dm-8-abp-auxiliary-zero).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-count"></a>

### 8.45 ABP bounded-element count

**Target** `DrinfeldModulesAndTModules:DM.8/abp-count` (theorem).

Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞. For every real C&gt;1, the finite set B\_ν(C)={x∈O0^(q^(−ν)):S(x)≤C} satisfies lim\_(ν→∞) #B\_ν(C)^(1/(q^ν d))=C. If k0 is the full finite constant field of K0, f=\[k0:F\_q\], and D∞=Σ\_(v|∞)e\_v v on its smooth proper curve, then f·deg\_(k0)(D∞)=d. For all sufficiently large integral n, {x∈O0:S(x)≤q^n}=L(nD∞) and its cardinality is q^(dn+f(1−g)). No exact-constant-field assumption k0=F\_q is imposed.

**Proof route.**

- Use the finite-normalization/place dictionary to identify integrality away from infinity and S(x)≤q^n with ord\_v(x)≥−n e\_v for every place above infinity. Use the exact full constant field k0 when applying Riemann–Roch.
- The fundamental degree formula gives f deg\_(k0)D∞=d; pinned high-degree Riemann–Roch and finite-dimensional-space cardinality give the displayed exact large-n count.
- The q^ν-power map identifies B\_ν(q^δ) with the ball of radius q^(q^νδ) in O0 when q^νδ is integral. Take the normalized root and then squeeze arbitrary C&gt;1 between such radii.

**Needs:** [DM.8/abp-size](#dm-8-abp-size); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json); [`FunctionFieldArithmetic:FA.1`](../packets/FunctionFieldArithmetic.json); [`tauceti:TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean); [`tauceti:TauCeti.finiteDimensional_riemannRochSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean); [`tauceti:TauCeti.mem_riemannRochSpace_iff_neg_le_ord`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean); [`mathlib:Module.card_eq_pow_finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finiteness.lean).

**Sources.**

- [ABP-published](#source-abp-published), Lemma 3.3.4 p.250: Normalized cardinality limit from Riemann–Roch; the exact-constant-field factor is made explicit for the pinned interface.

**Acceptance.**

- For K0=k, B\_ν(q^δ) has q^(floor(q^νδ)+1) elements, so its normalized root tends to q^δ.
- For K0=F\_(q^f)(θ), d=f and g=0; the exponent is f(n+1), not fn+1.

**Used by:** [8.48](#dm-8-abp-estimates), [8.46](#dm-8-abp-siegel).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-siegel"></a>

### 8.46 ABP Thue–Siegel kernel bound

**Target** `DrinfeldModulesAndTModules:DM.8/abp-siegel` (theorem).

Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞. For C&gt;1 and integers 0&lt;r&lt;s, if M∈Mat\_(r×s)(O) has S(M)&lt;C, there is a nonzero x∈O^s with Mx=0 and S(x)&lt;C^(r/(s−r)).

**Proof route.**

- Choose C′ strictly between max(1,S(M)) and C and ε&gt;0 small enough that (1+ε)(C′)^(r/(s−r))&lt;C^(r/(s−r)).
- At a sufficiently deep common q-root level the matrix entries belong to O0^(q^(−ν)). The count theorem makes the source ball contain more vectors than its image ball.
- Subtract two vectors with the same image. The ultrametric bound gives the strict size estimate, with no extra factor 2.

**Needs:** [DM.8/abp-size](#dm-8-abp-size); [DM.8/abp-count](#dm-8-abp-count).

**Sources.**

- [ABP-published](#source-abp-published), Lemma 3.3.5, pp.250–251: Strict coefficient-size kernel bound over the perfect-closure integral ring.

**Acceptance.**

- For the zero 1×2 matrix, a coordinate vector has size 1&lt;C.
- The hypotheses r&lt;s and C&gt;1 are essential; no nonzero kernel is claimed for the identity square matrix.

**Used by:** [8.48](#dm-8-abp-estimates), [8.47](#dm-8-abp-polynomial-siegel), [8.49](#dm-8-abp-auxiliary).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-polynomial-siegel"></a>

### 8.47 ABP polynomial Thue–Siegel bound

**Target** `DrinfeldModulesAndTModules:DM.8/abp-polynomial-siegel` (theorem).

Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞. For C&gt;1 and integers 0&lt;r&lt;s, if M∈Mat\_(r×s)(O\[t\]) has S(M)&lt;C, there is a nonzero polynomial column x∈O\[t\]^s with Mx=0 and S(x)&lt;C^(r/(s−r)). There is no uniform degree bound in this statement. For any d0≥deg\_t M, choose e large enough that r′=r(d0+e+1)&lt;s′=s(e+1) and S(M)&lt;C′=C^((r/(s−r))/(r′/(s′−r′))); the construction then gives deg\_t x≤e.

**Proof route.**

- Encode multiplication by M from columns of degree≤e to columns of degree≤d0+e as a matrix over O of shape r′×s′, with the same coefficient-size bound.
- As e grows, r′/(s′−r′) tends to r/(s−r), so the strict hypothesis S(M)&lt;C permits the displayed choice of C′.
- Apply the scalar kernel bound at C′ and decode coefficients to obtain both the stated degree cutoff for this choice and the final size bound.

**Needs:** [DM.8/abp-siegel](#dm-8-abp-siegel).

**Sources.**

- [ABP-published](#source-abp-published), Lemma 3.3.6, pp.251–252: Polynomial coefficient expansion, retaining the strict bound without inventing a degree-uniform result.

**Acceptance.**

- For M=(1,t), x=(−t,1) gives the expected polynomial kernel.
- For a constant matrix, recover the scalar result.

**Used by:** [8.48](#dm-8-abp-estimates), [8.50](#dm-8-abp-auxiliary-zero).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-estimates"></a>

### 8.48 Arithmetic estimates for relation lifting

**Target** `DrinfeldModulesAndTModules:DM.8/abp-estimates` (theorem).

Let k⊂K\_0⊂K⊂k̄ with K\_0/k finite separable of degree d, K the perfect closure of K\_0 inside k̄, and O its integral closure of A=F\_q\[θ\]. Let size(x) be the maximum of the infinite-place norms of its k-conjugates; use coefficient maxima for matrices and polynomials. Nonzero x∈O satisfies ||x||∞≥size(x)^(1−d). For a nonzero f=Σ a\_i z^i∈O\[z\], any nonzero root λ of multiplicity ν satisfies ||λ||∞^ν≥(max\_i size(a\_i))^(−d). For C&gt;1 and 0&lt;r&lt;s, a matrix M∈Mat\_{r×s}(O), or M∈Mat\_{r×s}(O\[t\]), with size(M)&lt;C has a nonzero kernel vector x over the same ring with size(x)&lt;C^(r/(s−r)). The polynomial statement imposes no fixed degree bound on x.

**Proof route.**

- Collect the precise statements of the five arithmetic input targets; each records its own source and prerequisite chain. No bound on polynomial-kernel degree is added beyond the chosen coefficient cutoff.

**Needs:** [DM.8/abp-size](#dm-8-abp-size); [DM.8/abp-liouville](#dm-8-abp-liouville); [DM.8/abp-count](#dm-8-abp-count); [DM.8/abp-siegel](#dm-8-abp-siegel); [DM.8/abp-polynomial-siegel](#dm-8-abp-polynomial-siegel).

**Sources.**

- [ABP-v1](#source-abp-v1), ABP §§3.2–3.3 pp.10–13, especially Lemmas 3.3.3–3.3.6: The arithmetic lemmas bound nonzero integral elements using all conjugates over a finite separable coefficient field, bound nonzero polynomial roots, and find small kernel vectors for r&lt;s. These are norm/size estimates on the integral perfect closure, not degree bounds on a polynomial solution. They feed the auxiliary-function proof with the stated strict dimension and nonzero hypotheses.
- [ABP-published](#source-abp-published), §§3.2–3.3 pp.248–252, especially Lemmas3.3.3–3.3.6: The published arithmetic lemmas agree with the preprint's conjugate-size lower bound, nonzero-root norm bound and small-kernel-vector estimate for r&lt;s in the integral perfect closure. The packet retains the finite separable coefficient field and the strict size hypothesis.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.51](#dm-8-abp-lifting).

**Convention:** \['Retained aggregate identifier for accepted downstream references. The source-routed definition and four key estimates are now independently stated, so the aggregate is not a hidden proof leaf.'\]

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.abp_estimates`.

<a id="dm-8-abp-auxiliary"></a>

### 8.49 ABP auxiliary polynomial row

**Target** `DrinfeldModulesAndTModules:DM.8/abp-auxiliary` (theorem).

Under the normalized integral hypotheses below, choose B&gt;1 larger than |θ|∞^(a+2δ)·max(1,S(Θ))^(q/(q−1))·max(1,S(ϑ)), and put H=B^(2(ℓ−1)). For every positive integer N divisible by 2ℓ there exists h\_N∈O\[t\]^(1×ℓ), h\_N≠0, deg\_t h\_N&lt;aN and S(h\_N)&lt;H, such that E\_N=h\_Nψ vanishes at θ^(q^(−(N+j))) for 0≤j&lt;N. One may choose h\_N to satisfy h\_N Θ Θ^(−1)…Θ^(−(N+j−1)) ϑ^(−(N+j)), evaluated at t=θ^(q^(−(N+j))), equals zero for each such j. These are polynomial-row constraints, not evaluations of a formal series outside its convergence domain.

**Hypotheses.**

- Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞.
- Fix ℓ&gt;1, Φ∈Mat\_ℓ(O\[t\]) with detΦ=c(t−θ)^s, c∈O nonzero, s≥0; ψ∈E^ℓ satisfies ψ^(−1)=Φψ. Fix 0≠ρ∈O^(1×ℓ) with ρψ(θ)=0, and ϑ∈Mat\_(ℓ×(ℓ−1))(O) of rank ℓ−1 with ρϑ=0. Put Θ=adj(Φ), a=1−1/(2ℓ), and δ=deg\_t Θ≥0.

**Proof route.**

- The adjugate identity ΦΘ=c(t−θ)^sI iterated under σ expresses the constrained rows as a nonzero scalar polynomial times E\_N. At the specified point the scalar is nonzero and ρψ(θ)=0 supplies the annihilator condition.
- Encode the constraints as r=(ℓ−1)N equations in s0=(ℓ−1/2)N coefficients of h\_N. Their matrix has size at most |θ|∞^(q^(−N)(aN+2Nδ))·S(Θ)^(q/(q−1))·S(ϑ), bounded strictly by B since N/q^N≤1.
- The scalar Siegel theorem gives size &lt;B^(r/(s0−r))=H. This fixes a uniform constant independent of N and discharges the auxiliary constant-level planning obligation.

**Needs:** [DM.8/abp-siegel](#dm-8-abp-siegel); [DM.8/entire-series](#dm-8-entire-series); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [`mathlib:Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean).

**Sources.**

- [ABP-published](#source-abp-published), §§3.4.2–3.4.3, pp.252–254: Integral normalization, adjugate constraints and bounded coefficient systems; the displayed B is a coarse explicit bound on the source estimate.

**Acceptance.**

- Check the equation/unknown ratio r/(s0−r)=2(ℓ−1), independent of N.
- The case ℓ=1 is handled directly in lifting and is excluded here; N divisible by 2ℓ makes all degree cutoffs integral.

**Used by:** [8.50](#dm-8-abp-auxiliary-zero).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-auxiliary-zero"></a>

### 8.50 Vanishing of the ABP auxiliary entire function

**Target** `DrinfeldModulesAndTModules:DM.8/abp-auxiliary-zero` (theorem).

Under DM.8/abp-auxiliary, for every sufficiently large positive multiple N of 2ℓ, every chosen row h\_N satisfying the stated constraints and S(h\_N)≤H has h\_Nψ=0 identically. More explicitly, choose D&gt;max(1,H·max(1,S(Φ))^(q/(q−1))). If E\_N≠0 has first nonzero coefficient λ\_N, the polynomial Siegel relation gives |λ\_N|∞≥D^(−ℓ d q^ℓ), whereas Schwarz–Jensen gives |λ\_N|∞≤Mψ H |θ|∞^(−N/(2ℓ)+q/(q−1)), with Mψ=sup\_(|z|∞≤|θ|∞)max\_i|ψ\_i(z)|∞ finite. These inequalities contradict each other for all sufficiently large N.

**Hypotheses.**

- Write k=F\_q(θ), A=F\_q\[θ\], |θ|∞=q, fix a finite separable extension K0/k of degree d, and put K=∪\_(ν≥0)K0^(q^(−ν)), O the integral closure of A in K, and O0=O∩K0. All fields are embedded in the chosen k̄⊂C∞.
- Fix ℓ&gt;1, Φ∈Mat\_ℓ(O\[t\]) with detΦ=c(t−θ)^s, c∈O nonzero, s≥0; ψ∈E^ℓ satisfies ψ^(−1)=Φψ. Fix 0≠ρ∈O^(1×ℓ) with ρψ(θ)=0, and ϑ∈Mat\_(ℓ×(ℓ−1))(O) of rank ℓ−1 with ρϑ=0. Put Θ=adj(Φ), a=1−1/(2ℓ), and δ=deg\_t Θ≥0.

**Proof route.**

- The ℓ+1 row vectors h\_N, h\_N^(−1)Φ, …, h\_N^(−ℓ)Φ^(−(ℓ−1))…Φ have size &lt;D. Apply polynomial Siegel to obtain nonzero a\_0,…,a\_ℓ∈O\[t\] with Σ a\_i E\_N^(−i)=0 and max S(a\_i)&lt;D^ℓ. Remove their common power of t so at least one a\_i(0) is nonzero.
- If E\_N≠0, its first coefficient λ\_N satisfies Σ a\_i(0) λ\_N^(q^(−i))=0. Raising to q^ℓ gives a nonzero polynomial over O of coefficient size &lt;D^(ℓ q^ℓ). The Liouville inequality and root multiplicity at least one give the stated coarse lower bound.
- The N distinct zeros prescribed by the auxiliary constraints lie in |z|≤|θ|. The Schwarz–Jensen factor estimate gives |λ\_N||θ|^(N−q/(q−1))≤sup\_disk |E\_N|. The degree and size bounds on h\_N give the stated upper bound.
- Choose a multiple N large enough that the upper bound is below the fixed positive lower bound. The analytic zero/growth inequality is a precisely requested supplier input, not inferred from Weierstrass preparation alone.

**Needs:** [DM.8/abp-auxiliary](#dm-8-abp-auxiliary); [DM.8/abp-polynomial-siegel](#dm-8-abp-polynomial-siegel); [DM.8/abp-liouville](#dm-8-abp-liouville); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras).

**Sources.**

- [ABP-published](#source-abp-published), §§3.4.4–3.4.5, pp.254–255: Functional relation and the contradictory leading-coefficient bounds.

**Acceptance.**

- Retain finiteness of Mψ from entire restrictedness at radius |θ|.
- Do not replace the integral-coefficient Liouville bound by a lower bound for arbitrary algebraic numbers of unrestricted height.

**Used by:** [8.51](#dm-8-abp-lifting).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/ABP`, namespace `TauCeti.Difference.Periods`.

<a id="dm-8-abp-lifting"></a>

### 8.51 Anderson–Brownawell–Papanikolas lifting

**Target** `DrinfeldModulesAndTModules:DM.8/abp-lifting` (theorem). **Planet:** ABP lifting criterion.

Let Φ∈Mat\_r(k̄\[t\]) have determinant c(t−θ)^s with c∈k̄^×, s≥0. Let ψ∈E^r satisfy σ(ψ)=Φψ. For every row ρ∈k̄^r with ρψ(θ)=0, there exists a polynomial row P∈k̄\[t\]^r such that P ψ=0 as an entire function and P(θ)=ρ. The determinant is nonzero and has no roots apart from θ. The coefficients of P need not be constant or lie in F\_q\[t\].

**Proof route.**

- For rank 1 propagate a zero along the distinct inverse-Frobenius orbit of θ; bounded-disk analytic zero finiteness forces the entire function to vanish.
- For larger rank clear arithmetic denominators and use the small-kernel estimate to construct bounded-size polynomial rows with a long interval of prescribed orbit zeros. Obtain a bounded-size scalar difference equation for the auxiliary function.
- If the auxiliary function never vanishes identically, its leading coefficient has a uniform lower bound by Liouville; Schwarz–Jensen gives an exponentially decreasing upper bound. Contradiction.
- Twist a vanishing auxiliary row through adjugate matrices. Its nonzero value at θ lies on the specified ρ-line; rescale to make that value exactly ρ.
- For ℓ=1, a zero at θ propagates to θ^(q^(−n)); bounded-disk zero finiteness forces the entire function to vanish.
- For ℓ&gt;1 normalize integrally as in ABP §3.4.2 and use the auxiliary-zero target. Since deg h\_N&lt;N, at least one h\_N^(N+j)(θ) is nonzero for 0≤j&lt;N. Multiply by the positively twisted adjugates; at θ their determinants are nonzero. The resulting polynomial row annihilates ψ and specializes to a nonzero multiple of ρ, so rescale it to obtain exactly P(θ)=ρ.

**Needs:** [DM.8/entire-series](#dm-8-entire-series); [DM.8/abp-estimates](#dm-8-abp-estimates); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [TauCetiRoadmap AdicSpaces layer-0-topological-algebra-huber-rings-and-tate-algebras](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AdicSpaces/README.md#layer-0-topological-algebra-huber-rings-and-tate-algebras); [DM.8/abp-auxiliary-zero](#dm-8-abp-auxiliary-zero).

**Sources.**

- [ABP-v1](#source-abp-v1), Theorem 3.1.1 pp.7–8; proof §3.4 pp.13–16: For polynomial Φ with det Φ=c(t−θ)^s and an arithmetic entire solution vector ψ, the criterion lifts every algebraic row relation at θ to a polynomial row relation whose value at θ is prescribed. The full proof builds a small auxiliary relation, controls its zeros and forces it to vanish. The packet retains the special determinant, arithmetic coefficients and entire-vector hypotheses.
- [PAP-v2](#source-pap-v2), Theorem 5.1.1 p.32: This theorem recalls ABP lifting with a polynomial matrix whose determinant is a nonzero scalar times a power of t−θ and an entire solution vector. It supplies the specialization interface; the full proof and arithmetic entire conditions are supplied by ABP.
- [CCM-v2](#source-ccm-v2), Theorem 4.1.1 p.13: The consumer restates ABP lifting for an arithmetic entire solution vector of the special-determinant polynomial equation. This checks the shared criterion used by its later multizeta relation argument, without moving those specialized applications into DM.8.
- [IKLNP-v2](#source-iklnp-v2), Theorem 2.2 p.26: The consumer's Theorem 2.2 uses the same special determinant and arithmetic entire vector to lift a row relation at θ to a polynomial relation. It is another application of the shared lifting criterion, not a stronger universal specialization theorem.
- [ABP-published](#source-abp-published), Theorem3.1.1 pp.245–246; full proof §3.4 pp.252–256: The published criterion and complete auxiliary-function proof retain the preprint's polynomial matrix, special determinant, arithmetic entire vector and prescribed row specialization. The packet's lifting statement matches those hypotheses and conclusion.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.52](#dm-8-specialization-rank).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.abp_lifting`.

<a id="dm-8-specialization-rank"></a>

### 8.52 Specialization preserves relation rank

**Target** `DrinfeldModulesAndTModules:DM.8/specialization-rank` (theorem).

Under ABP hypotheses, the k̄\[t\]-rank of the submodule of E generated by the components of ψ equals the k̄-dimension of their specialized span at θ. Equivalently the k̄-dimension of the specialized relation space equals the k̄(t)-dimension of the rational-function relation space. Evaluation of polynomial relation rows is surjective onto all specialized relations.

**Proof route.**

- The polynomial relation kernel is saturated in a finite free module over k̄\[t\], because its quotient embeds in the domain E and is torsion-free. Thus it is a direct summand; its basis specializes to independent rows.
- ABP supplies all specialized relations, giving equality of kernel dimensions and then equality of generated-span dimensions.
- The statement is about finite free relation modules; arbitrary specialization of ranks is not claimed.

**Needs:** [DM.8/abp-lifting](#dm-8-abp-lifting); [`mathlib:Module.finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean); [`mathlib:Submodule.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive).

**Sources.**

- [PAP-v2](#source-pap-v2), Proposition 5.1.5 pp.32–33: The proposition turns ABP lifting into equality of specialized-span dimension and rational-function rank. Its polynomial relation module is saturated and hence a direct summand over the PID bar(k)\[t\], so a relation basis specializes independently; lifting supplies all specialized relations. It does not assert rank preservation for arbitrary polynomial matrices.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.53](#dm-8-period-transcendence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.specialization_rank`.

<a id="dm-8-period-transcendence"></a>

### 8.53 Period transcendence degree and Galois dimension

**Target** `DrinfeldModulesAndTModules:DM.8/period-transcendence` (theorem). **Planet:** Period transcendence degree.

Let M∈T have σ matrix Φ∈Mat\_r(k̄\[t\])∩GL\_r(k̄(t)) with det Φ=c(t−θ)^s, c≠0, s≥0. Let Ψ∈GL\_r(T) have entries in E and σΨ=ΦΨ. Then trdeg\_{k̄} k̄(Ψ\_ij(θ))=dim\_{F\_q(t)}Γ\_M. Equivalently this equals trdeg\_{k̄(t)}k̄(t)(Ψ\_ij). Polynomial determinant plus rigid triviality ensures an eligible Ψ exists by integral-trivialization and entire-from-equation. The theorem does not apply to a pre-t-motive lacking such a trivialization.

**Proof route.**

- Construct the bounded tensor-monomial block system. Its determinant remains a nonzero constant times a power of t−θ; its entries are entire.
- Specialization-rank equates dim\_K D\_d(Ψ) and dim\_k̄ D\_d(Ψ(θ)) for every d. Use the requested SF.0 bounded-generator filtration growth theorem to identify their transcendence degrees, and SF.0/algebraic-scheme-dimension for Krull dimension and field-extension invariance. The dimension theorem alone does not imply the growth comparison.
- Difference-smooth-dimension and tannakian-identification identify this dimension with Γ\_M. No algebraic-independence conclusion for arbitrary matrix entries is inferred merely from a dimension equality.

**Needs:** [DM.8/degree-span](#dm-8-degree-span); [DM.8/specialization-rank](#dm-8-specialization-rank); [DM.8/entire-from-equation](#dm-8-entire-from-equation); [DM.8/integral-trivialization](#dm-8-integral-trivialization); [DM.8/tannakian-identification](#dm-8-tannakian-identification); [DM.8/difference-smooth-dimension](#dm-8-difference-smooth-dimension); [`SchemeAndStackFoundations:SF.0/algebraic-scheme-dimension`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.0`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 5.2.2 p.33: The theorem identifies the transcendence degree of the specialized entire trivialization with the motivic Galois-group dimension. ABP preserves every bounded-monomial span, filtered growth compares transcendence degrees, and the difference/Tannakian comparison identifies the group. The packet retains Ψ∈GL\_r(T) and the special polynomial determinant; the suggested field equality now also requires determinant invertibility in T.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.54](#dm-8-carlitz-group), [8.56](#dm-8-logarithm-linear-relations), [8.57](#dm-8-carlitz-logarithm-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.period_transcendence`.

<a id="dm-8-carlitz-group"></a>

### 8.54 The Carlitz motivic Galois group

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-group` (theorem).

For the Carlitz object C with σ matrix t−θ and fundamental Ω, Hom\_T(C(m), C(n)) is F\_q(t) for m=n and zero otherwise, and Γ\_C≅G\_m over F\_q(t). The distinction between weights uses Ω∉C∞(t), which follows from its infinitely many zeros. In particular the Carlitz period π̃=−1/Ω(θ) is transcendental over k̄ by period-transcendence.

**Proof route.**

- The one-dimensional difference equation for Hom(C(m), C(n)) has solutions constant times Ω^{m−n}. A nontrivial power of Ω has infinitely many zeros or poles, so is not rational.
- The generated category is the integer-weight graded finite-dimensional category over F\_q(t). Instantiate MC.6/neutral-tannaka-reconstruction and the requested graded-category computation of its group as G\_m.
- Apply period-transcendence to the eligible rank-one Carlitz matrix.

**Needs:** [DM.8/neutral-category](#dm-8-neutral-category); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.2/omega](#dm-2-omega); [DM.2/carlitz-period](#dm-2-carlitz-period); [`MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`](../packets/MotivesAndAlgebraicCycles.json); [`MotivesAndAlgebraicCycles:MC.6`](../packets/MotivesAndAlgebraicCycles.json); [DM.8/period-transcendence](#dm-8-period-transcendence).

**Sources.**

- [PAP-v2](#source-pap-v2), Lemma 3.5.3 and Theorem 3.5.4 pp.20–21: The source computes morphisms between Carlitz tensor powers and identifies their generated category with integer-weight graded F\_q(t)-vector spaces, giving G\_m as the Carlitz group. Ω has infinitely many zeros, and period specialization gives Carlitz-period transcendence. The packet corrects the printed graded coefficient field and imports general reconstruction instead of rebuilding it.
- [ABP-v1](#source-abp-v1), §3.1.2 p.8: The rank-one application specializes the entire Carlitz function and derives transcendence of the Carlitz period from lifting and its infinitely many zeros. This supports the period normalization/transcendence input, not the separate Tannakian graded-category computation.
- [ABP-published](#source-abp-published), §3.1.2 p.246: The published rank-one application gives the same Carlitz-period transcendence argument and Ω specialization. Its role is the analytic transcendence input; the graded-category G\_m computation is in Papanikolas.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.55](#dm-8-logarithm-group-linear).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.carlitz_group`.

<a id="dm-8-logarithm-group-linear"></a>

### 8.55 The linear Carlitz logarithm kernel

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-group-linear` (theorem).

For the logarithm object X, Γ\_X is a smooth geometrically connected closed subgroup of G={\[\[a, 0\], \[v, I\_r\]\]:a invertible}. The projection a gives a faithfully flat homomorphism π:Γ\_X→G\_m. Its kernel V is a vector subspace of G\_a^r over F\_q(t), as a group scheme, and π is smooth. A proof must establish separability of this particular projection before claiming V is smooth. This does not follow for an arbitrary surjective morphism of smooth groups. Consequently if F\_1, …, F\_s are homogeneous linear forms defining V and γ=(b\_0, b)∈Γ\_X(F) with b\_0∉F\_q, the ideal of Γ\_X is generated by G\_i=(b\_0−1)F\_i(v)−F\_i(b)(a−1).

**Proof route.**

- The comparison matrix places Γ\_X in G; the subobject C makes π faithfully flat. Scalar conjugation preserves V.
- Over a perfect closure, verify the particular scalar-action projection is separable. Then V is smooth, its geometric points are stable under all scalars, and their closure is a linear space. Descend its linear ideal. The verification of separability is recorded as an explicit gap rather than treating all smooth group surjections as smooth.
- Once V is a vector group, its representable fpqc torsor over the field is fppf locally trivial because it is smooth of finite presentation. Apply SF.2/abelian-torsor-h1 and quasi-coherent-topology-comparison to O^r on Spec F: H¹\_fppf(F,G\_a^r)=0. Thus each fibre of π over an F-point has an F-point. Choose b\_0 outside F\_q, and use its cyclic closure and translation by V to obtain the displayed linear equations. This does not assert splitting for an arbitrary unipotent kernel.

**Needs:** [DM.8/logarithm-motive-membership](#dm-8-logarithm-motive-membership); [DM.8/carlitz-group](#dm-8-carlitz-group); [DM.8/tannakian-identification](#dm-8-tannakian-identification); [DM.8/difference-smooth-dimension](#dm-8-difference-smooth-dimension); [`SchemeAndStackFoundations:SF.1/torsor`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.2/abelian-torsor-h1`](../packets/SchemeAndStackFoundations.json); [`SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison`](../packets/SchemeAndStackFoundations.json).

**Sources.**

- [PAP-v2](#source-pap-v2), §6.2.1–6.2.4 and Propositions 6.2.3, 6.2.5 pp.35–36: The source analyzes the scalar-triangular group of the logarithm motive and proves its kernel is linear before constructing a rational lift and a dense cyclic subgroup. The packet limits this to that particular group: it retains the open separability/Lie-surjectivity verification and uses vector-group torsor splitting only after the kernel is proved vectorial.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.56](#dm-8-logarithm-linear-relations).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.logarithm_group_linear`.

<a id="dm-8-logarithm-linear-relations"></a>

### 8.56 Linear relations and logarithm group dimension

**Target** `DrinfeldModulesAndTModules:DM.8/logarithm-linear-relations` (theorem).

Let N be the k=F\_q(θ)-linear span of π̃, log\_C(α\_1), …, log\_C(α\_r) for small algebraic arguments. Then dim\_F Γ\_X=dim\_k N. More precisely each linear form F=Σ c\_i v\_i defining V and γ=(b\_0, b\_i) as above yields (b\_0(θ)−1)Σ c\_i(θ)log\_C(α\_i)−Σ c\_i(θ)b\_i(θ)π̃=0, and these span all k-linear relations. Evaluation F\_q(t)→F\_q(θ) is denominator-safe since θ is transcendental over F\_q; the auxiliary rational torsor coefficient is separately proved regular at θ.

**Proof route.**

- The linear G\_i equations translate to torsor equations H\_i=G\_i−f\_i a. A σ equation propagates any putative pole of f\_i at θ along an infinite twist orbit; hence f\_i and its twist are regular there.
- Divide the torsor equation by Ω and evaluate using π̃=−1/Ω(θ). Independent linear forms provide r+1−dim Γ\_X independent k-linear relations.
- Conversely trdeg≤linear-span dimension, while period-transcendence gives this trdeg=dim Γ\_X. Equality proves completeness of the relations.

**Needs:** [DM.8/logarithm-group-linear](#dm-8-logarithm-group-linear); [DM.8/period-transcendence](#dm-8-period-transcendence); [DM.8/carlitz-deformation](#dm-8-carlitz-deformation); [DM.2/omega](#dm-2-omega); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential).

**Sources.**

- [PAP-v2](#source-pap-v2), §6.3.1 and Theorem 6.3.2 pp.36–37: The theorem identifies the logarithm-group dimension with the k-linear span dimension of the Carlitz period and small logarithms. Constant rational-function relations are evaluated at θ after denominator descent, and pole propagation controls rational coefficients in the converse direction. The packet keeps k-linearity distinct from bar(k)-algebraic independence.

**Acceptance.**

- Check every field, scalar extension and twist convention in the statement.

**Used by:** [8.57](#dm-8-carlitz-logarithm-independence).

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.logarithm_linear_relations`.

<a id="dm-8-carlitz-logarithm-independence"></a>

### 8.57 Algebraic independence of Carlitz logarithms

**Target** `DrinfeldModulesAndTModules:DM.8/carlitz-logarithm-independence` (theorem). **Planet:** Carlitz logarithm independence.

Let λ\_1, …, λ\_r∈C∞ with exp\_C(λ\_i)∈k̄ for all i. If this family is linearly independent over k=F\_q(θ), it is algebraically independent over k̄. The linear field is k, not k̄. There is no fixed choice of principal branch for arbitrary λ\_i. A nonzero period with exponential zero is eligible. The result is only for Carlitz logarithms, not for all higher-rank Drinfeld modules.

**Proof route.**

- Reduce to a finite-dimensional k-space N generated by the period and small principal logarithms. The previous two theorems give trdeg\_{k̄}k̄(N)=dim\_k N.
- Choose a k-basis of N; its size equals the transcendence degree, so it is algebraically independent over k̄. Extend the given independent family to such a basis using an invertible k-linear change of coordinates.
- Discarding extra basis vectors preserves algebraic independence. This argument handles zero-exponential periods and avoids an incorrect nonzero-only reduction.

**Needs:** [DM.8/logarithm-division](#dm-8-logarithm-division); [DM.8/logarithm-linear-relations](#dm-8-logarithm-linear-relations); [DM.8/period-transcendence](#dm-8-period-transcendence); [`mathlib:AlgebraicIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Defs.lean); [`mathlib:Algebra.trdeg`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Basic.lean); [`FunctionFieldArithmetic:FA.0`](../packets/FunctionFieldArithmetic.json).

**Sources.**

- [PAP-v2](#source-pap-v2), Theorem 6.4.2 p.38; Theorem 1.2.6 p.4: The theorem deduces bar(k)-algebraic independence of k-independent Carlitz logarithms with algebraic exponentials by reducing to a basis of the span containing the period and principal logarithms. The packet explicitly supplies the zero-exponential period case missing from the cited division step and uses basis extension rather than assuming the chosen logarithms span the whole space.

**Acceptance.**

- A single nonzero Carlitz logarithm with algebraic exponential is transcendental, including π̃.
- The pair(λ, λ) fails the linearity hypothesis and has polynomial relation X\_1−X\_2.
- An invertible pre-t-motive with no analytic trivialization cannot be used to assert period independence.

**Library home:** `TauCeti/NumberTheory/DrinfeldModule/Periods/Galois`, namespace `TauCeti.Difference.Periods`. Declaration `TauCeti.Difference.Periods.carlitz_logarithm_independence`.

## Open inputs

A planned layer has every target and its prerequisite chain specified. A layer closes only when its listed proof inputs and supplier contracts have been discharged. Each target’s hypotheses above remain part of its contract.

### General rank integrality

Establish that a non-scalar field Drinfeld action has integral positive proportionality factor deg\_τ φ\_a/deg\_A(a). The displayed valuation proportionality alone gives a rational number. Use the finite projective A\_L-module route of Hartl Theorem 3.9, or inspect a full direct integrality proof, without assuming the rank definition as its proof.

**Needed by:** [DM.0/rank-general](#dm-0-rank-general); [DM.0/rank](#dm-0-rank).

### Nilpotent-base standardization

Hartl Lemma 3.8(a), p. 10, cites Drinfeld and Matignon for the unique normalized nonlinear Ore conjugation. Inspect that proof or give the finite nilpotent-induction argument. The current pass establishes the exact statement and its distinction from linear frame change.

**Needed by:** [DM.0/relative-standardization](#dm-0-relative-standardization).

### Analytic surjectivity and general-A kernel rank

The BP survey states Theorem 2.1 but does not provide the complete nonarchimedean zero/surjectivity and general-A projective kernel-rank proof. The requested AdicSpaces analytic input and a full uniformization proof must discharge these steps. Finite-subspace products, normalization and the exponential recurrence are specified.

**Needed by:** [DM.2/lattice-exponential](#dm-2-lattice-exponential); [DM.2/uniformization](#dm-2-uniformization).

### Reciprocal-ring normality proof input

Hartl–Yu Proposition 3.11 imports Pink–Schieder Theorems 1.9 and 1.11 for the normality of the reciprocal Proj seed. Inspect those proofs or establish the stated normality in the supplier. The arithmetic extension/gluing and finite-quotient route of Hartl–Yu Theorem 3.2 has been read.

**Needed by:** [DM.3/reciprocal-compactification](#dm-3-reciprocal-compactification); [DM.3/satake-compactification](#dm-3-satake-compactification); [DM.3/integral-compactification](#dm-3-integral-compactification).

### Integral Tate image saturation

Stalder Proposition 5.16(a), preprint p. 34 and published p. 588, asserts saturation as known. Supply the exact integral argument: λ-divisibility of a realized Hom map descends to divisibility in Hom\_A(E,F), using finite-shtuka torsion and the quotient isogeny; retain nonprincipal λ. Rational full faithfulness is proved by the inspected period-ring route.

**Needed by:** [DM.5/tate-injectivity](#dm-5-tate-injectivity); [DM.5/tate-image-saturation](#dm-5-tate-image-saturation); [DM.5/tate-surjectivity](#dm-5-tate-surjectivity).

### Drinfeld semisimple-motive input

Stalder Theorem 1.1 assumes a semisimple A-isomotive. Prove that the rational motive of a field Drinfeld module is simple, or inspect the precise reference supplying it, before deducing unconditional semisimplicity of its point Tate representation.

**Needed by:** [DM.5/tate-semisimplicity](#dm-5-tate-semisimplicity).

### Elliptic-chain morphism category

Wiedmann Theorem 5.10 and proof use an equivalence convention with affine-module morphisms. Reconcile it fully with the bounded-shift chain morphisms and the contravariant Hom(E,G\_a) convention stated here. The object construction, infinity projectivity/gluing, normalized cohomology and inverse line have been read. At a non-rational infinity point, verify the residue-factor/descent normalization of each length-one quotient in the degree filtration, including how Frobenius permutes the factors, before claiming the unrestricted relative correspondence. The period rδ and the pushforward-to-S line condition are explicit, rather than replacing infinity by a rational leg.

**Needed by:** [DM.7/elliptic-antiequivalence](#dm-7-elliptic-antiequivalence).

### Valued-skew-field proof inputs

Theorem 4.1 and §6 of Maurischat have been inspected, but the left/right invariant-factor and Newton-decomposition proofs in §3 remain to be read and implemented by the future shared valued-skew-algebra supplier (FiniteFieldsAndCharacterSums, Part II; no such stage is claimed to exist). The perfect-field abelian iff A-finite statement is planned using the exact positive-slope criterion, without treating the generic Ore adapter as its proof.

**Needed by:** [DM.4/dual-realization](#dm-4-dual-realization).

### Fine moduli chart and deformation proof

Hartl–Yu Theorem 2.3 states good-open affine smooth representability and cites Drinfeld §5 for the principal-level chart and infinitesimal deformation argument. The fine-subgroup extension in Proposition 2.8 has been read; a full chart/deformation proof remains an exact input to the Drinfeld-specific moduli target, using exact SF.1 descent/quotient inputs and the stated stack consequence.

**Needed by:** [DM.3/fine-moduli-scheme](#dm-3-fine-moduli-scheme); [DM.3/moduli-functor](#dm-3-moduli-functor).

### Strict finite F-module / finite-shtuka realization

SF.2 plans sites and cohomology, not this anti-equivalence. The missing shared input is the category of finite locally free shtukas (N,τ:σ\*N→N), strict finite F-module schemes with their deformation action, Dr\_q and its inverse, exactness, the étale criterion, co-Lie identification and the torsion evaluation pairing. Read Hartl Definitions 4.1–4.2, pp. 12–13, Definition 4.5, pp. 13–14 and Theorem 4.7, pp. 14–15. Route the shared theory to SchemeAndStackFoundations, Part II; until that owner is planned, this is a gap, not an SF.2 theorem.

**Needed by:** [DM.1/finite-flat-torsion](#dm-1-finite-flat-torsion); [DM.1/etale-torsion](#dm-1-etale-torsion); [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.7/tate-realization](#dm-7-tate-realization); [DM.1/characteristic-local-realization](#dm-1-characteristic-local-realization); [DM.7/characteristic-comparison](#dm-7-characteristic-comparison).

### Equal-characteristic effective local-shtuka input

HS2 uses the Fargues–Fontaine setting and does not supply Hartl’s equal-characteristic category. Needed are locally free R\[\[z\]\]-modules, σhat-linearization, inversion of z−γ(z), effective cokernel bounds and the finite-flat characteristic torsion comparison, with the compatible F\_p-algebra embedding and τ^deg(p) on the characteristic factor. See Hartl Definition 7.1 and Example 7.2, p. 27, Theorems 7.4 and 7.6, p. 28. Request an equal-characteristic Part II of HeckeStacksAndLocalShtukas or an explicit single-owner reassignment; no fabricated supplier stage is cited.

**Needed by:** [DM.1/characteristic-local-realization](#dm-1-characteristic-local-realization); [DM.7/characteristic-comparison](#dm-7-characteristic-comparison).

### Finite étale torsion bases and compatible limits

The abelian-sheaf/Galois comparison in SF.2 is not the strict-group theorem or a basis theorem. Supply the Frobenius/Lang solution argument for a finite étale shtuka over a separably closed field, with residue-field factors, A/a-module freeness of rank r, and compatible lifts for a nonprincipal prime-adic inverse system. Hartl Proposition 6.5 and Theorem 6.6, p. 26 give the exact torsion statements. The finite-shtuka realization and the nonprincipal inverse-limit argument must both be available.

**Needed by:** [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [DM.1/tate-module](#dm-1-tate-module); [DM.1/continuous-galois-action](#dm-1-continuous-galois-action).

### Projective finite quotients and section-ring comparison

The cited SF.0 normalization theorem requires a qcqs reduced Nagata base and finite generic algebra; A and finite-type A-schemes meet this through excellent-examples. SF.1/finite-group-quotient requires every orbit to lie in an affine open and supplies the scheme quotient, not all normal/projective descent claims. Supply the ample-line-bundle norm/descent argument for finite constant-group quotients and the normal integral graded section-ring/Proj comparison used by Pink Theorem 4.2, pp. 14–16 and Theorem 5.7, p. 21. SF.2/ample-serre-vanishing supplies finiteness and eventual vanishing under proper Noetherian ample hypotheses, not this entire comparison. These extensions belong to SchemeAndStackFoundations, Part II.

**Needed by:** [DM.3/satake-compactification](#dm-3-satake-compactification); [DM.3/modular-forms](#dm-3-modular-forms); [DM.3/integral-compactification](#dm-3-integral-compactification).

### Completed coefficient and analytic quotient interfaces

AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.

**Needed by:** [DM.1/tate-module](#dm-1-tate-module); [DM.1/continuous-galois-action](#dm-1-continuous-galois-action); [DM.2/c-infinity](#dm-2-c-infinity); [DM.2/uniformization](#dm-2-uniformization); [DM.4/purity](#dm-4-purity); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.5/local-algebraization](#dm-5-local-algebraization); [DM.5/period-ring](#dm-5-period-ring); [DM.6/integral-model](#dm-6-integral-model); [DM.6/unit-lattice](#dm-6-unit-lattice); [DM.6/lattice-covolume](#dm-6-lattice-covolume); [DM.6/class-number-formula](#dm-6-class-number-formula).

### Particular Carlitz kernel separability

PAP Proposition6.2.3 invokes a Lie-algebra surjectivity verification for the particular scalar-action logarithm group. A general smooth group surjection need not be separable. The plan states the exact scalar-action theorem and records this verification before inferring a smooth linear kernel; no generic smoothness inference is used.

**Needed by:** [DM.8/logarithm-group-linear](#dm-8-logarithm-group-linear); [DM.8/logarithm-linear-relations](#dm-8-logarithm-linear-relations); [DM.8/carlitz-logarithm-independence](#dm-8-carlitz-logarithm-independence).

### Analytic and dimension supplier matching

Instantiate the pinned restricted-series carrier at C∞; import current Tau Ceti Weierstrass preparation, unit detection and the principal-ideal result through AdicSpaces Layer 0. The C∞ normalized zero/pole comparison, entire-product zeros and bounded-disk Schwarz–Jensen estimate remain precise additional contracts. FA.0 general separability, curve transport and Lang base extension and the SF.0 filtered-growth export remain requested. RestrictedPowerSeries and NewtonPolygons are absent from the supplied current-main checkout, so no unverified roadmap import terminates these chains.

**Needed by:** [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [DM.8/analytic-separability](#dm-8-analytic-separability); [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure); [DM.8/difference-smooth-dimension](#dm-8-difference-smooth-dimension); [DM.8/period-transcendence](#dm-8-period-transcendence); [DM.8/abp-auxiliary-zero](#dm-8-abp-auxiliary-zero).

### Anderson analytic comparison proof

The statement of BP-RAPID Theorem 4.2 p.16 and the dual formulation PAP §1.1.4 p.2 were read. The original proof in Anderson, t-Motives, Duke Math. J. 53 (1986), Theorem 4, pp.457–502, has not been inspected. Supply its exponential-sequence/Betti comparison argument, including the precise lattice-to-invariant-basis map, before closing DM.8/anderson-comparison. This is a source-proof gap, not permission to infer uniformizability for all broad effective dual motives.

**Needed by:** [DM.8/anderson-comparison](#dm-8-anderson-comparison).

### Historical-contract promotion and sibling ownership alignment

The 123 reused targets remain owned by the two accepted part packets. importChecks gives their complete reconciled mathematical contracts, including removal of obsolete suggestedInterface claims. The reader uses those contracts together with the 11 new nodes. The automatic promoter does not rewrite the historical part packets from this metadata: the maintainer must apply dependencyReconciliation, parentReconciliation and the changed statement/proof/API/source contracts before treating the promoted whole-roadmap graph as reconciled. The Omega and analytic-twist ownership moves follow this issue and still require alignment with the sibling Part II routes; no prior maintainer agreement is claimed.

**Needed by:** [DM.2/omega](#dm-2-omega); [DM.4/carlitz-tensor-power](#dm-4-carlitz-tensor-power); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/star-adapter](#dm-4-star-adapter); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/fundamental-betti-basis](#dm-8-fundamental-betti-basis); [DM.8/integral-trivialization](#dm-8-integral-trivialization); [DM.8/betti-exact-tensor](#dm-8-betti-exact-tensor); [DM.8/neutral-category](#dm-8-neutral-category); [DM.8/tannakian-identification](#dm-8-tannakian-identification); [DM.8/abp-estimates](#dm-8-abp-estimates); [DM.8/abp-lifting](#dm-8-abp-lifting); [DM.8/logarithm-matrices](#dm-8-logarithm-matrices); [DM.8/logarithm-motive-membership](#dm-8-logarithm-motive-membership); [DM.8/logarithm-group-linear](#dm-8-logarithm-group-linear).

## Supplier contracts

### tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras

Import AdicSpaces Layer 0 §§0.4–0.5 restricted-series topology, evaluation and Weierstrass theory and the verified current Tau Ceti preparation/unit/principal-ideal results. The additional analytic contract is: on complete algebraically closed nonarchimedean C∞, convergent locally finite normalized products define entire functions with exactly their prescribed zeros; nonzero restricted series have finite disk zero divisors and normalized unit factors; for the ABP N prescribed zeros, Schwarz–Jensen yields |λ\_N||θ|^(N−q/(q−1))≤sup\_(|z|≤|θ|)|E\_N(z)|. General Tate algebras are already owned upstream; these extra entire-product and zero/growth exports extend that owner as AdicSpaces, Part II if beyond its current Layer 0.

**Needed by:** [DM.2/lattice-exponential](#dm-2-lattice-exponential); [DM.2/omega](#dm-2-omega); [DM.4/uniformizability](#dm-4-uniformizability); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [DM.8/abp-lifting](#dm-8-abp-lifting); [DM.8/abp-auxiliary-zero](#dm-8-abp-auxiliary-zero); [DM.8/anderson-comparison](#dm-8-anderson-comparison).

### tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs

Import the shared Fitting-ideal presentation and base-change theory already in current Tau Ceti (a91d3aaf), as used by StableReduction and IntegralHeckeAndGaloisDeterminants. At the older pinned build these declarations are absent. DM.6 adds only the characteristic-polynomial/monic-generator comparison for finite F\[t\]-modules, and must not re-plan the generic Fitting ideal.

**Needed by:** [DM.6/fitting-polynomial](#dm-6-fitting-polynomial).

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge

Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.

**Needed by:** [DM.0/rank-general](#dm-0-rank-general); [DM.1/finite-flat-torsion](#dm-1-finite-flat-torsion); [DM.2/a-lattice](#dm-2-a-lattice); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [DM.4/dual-realization](#dm-4-dual-realization); [DM.6/integral-model](#dm-6-integral-model).

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus

Consume divisors, L(D), divisor/fractional-ideal comparison and normalized residue-degree degree formulas. In particular deg\_A(a)=−deg(∞)ord\_∞(a).

**Needed by:** [DM.0/rank-general](#dm-0-rank-general); [DM.1/finite-flat-torsion](#dm-1-finite-flat-torsion); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf).

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components

Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

**Needed by:** [DM.0/rank-general](#dm-0-rank-general); [DM.1/tate-module](#dm-1-tate-module); [DM.2/c-infinity](#dm-2-c-infinity); [DM.2/uniformization](#dm-2-uniformization); [DM.4/purity](#dm-4-purity); [DM.4/dual-realization](#dm-4-dual-realization); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.5/local-algebraization](#dm-5-local-algebraization); [DM.5/period-ring](#dm-5-period-ring); [DM.6/integral-model](#dm-6-integral-model); [DM.6/unit-lattice](#dm-6-unit-lattice); [DM.6/lattice-covolume](#dm-6-lattice-covolume).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

Consume line bundles, divisor twists and their degree on smooth proper curves; use the current divisor-to-invertible-sheaf interface in the infinity chain.

**Needed by:** [DM.7/elliptic-sheaf](#dm-7-elliptic-sheaf); [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Consume curve Riemann–Roch, Serre duality and H^0=L(D) comparisons for smooth proper geometrically connected curves. The pinned library already supplies finite-dimensional divisor spaces and high-degree Riemann–Roch. Export the exact-constant-field and all-conjugate infinity-norm bridge for a finite separable K0/F\_q(θ): with full constants k0 of degree f and D∞=Σe\_v v, identify the integral size ball with L(nD∞), and prove f deg\_(k0)D∞=\[K0:k\]. This is a place/divisor normalization adapter to AlgebraicCurves/FA.1, not another Riemann–Roch theorem. Transport the curve and section spaces under coefficient Frobenius only for the relative-algebraic-closure use.

**Needed by:** [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf); [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure); [DM.8/abp-estimates](#dm-8-abp-estimates); [DM.8/abp-count](#dm-8-abp-count).

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change

Consume proper flat finitely presented coherent cohomology/base change and semicontinuity under their actual hypotheses, to prove the normalized elliptic-chain pushforward line and cohomology statements.

**Needed by:** [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf).

### MotivesAndAlgebraicCycles:MC.6

Reuse the existing arbitrary-field MC.6/neutral-tannaka-reconstruction and tannaka-finiteness-recognition nodes, and tensor-iso-torsor after transporting along reconstruction. The remaining exports are: formation of the strictly full tensor subcategory generated by a family; for a compatible exact tensor functor between neutral categories, full faithfulness plus closure of its image under subobjects iff the induced group map is faithfully flat, and tensor generation of the target iff it is a closed immersion; and the computation of the tensor-automorphism group of integer-weight graded finite-dimensional F-vector spaces as G\_m. State these over any field F, including imperfect F\_q(t). The existing diagram-specific pro-algebraic-approximation and characteristic-zero connectedness criterion are insufficient for these remaining uses. Do not reconstruct an already planned neutral group again.

**Needed by:** [DM.8/neutral-category](#dm-8-neutral-category); [DM.8/tannakian-identification](#dm-8-tannakian-identification); [DM.8/carlitz-group](#dm-8-carlitz-group).

### FunctionFieldArithmetic:FA.0

Supply the chosen rational function field F\_q(θ), exact constant field and its infinite-place normalization, and the smooth projective curve corresponding to a finite separable extension of the one-variable field over the perfect constant field bar(k). Export compatibility of the field/curve correspondence with the coefficient Frobenius automorphism, as needed in Papanikolas Proposition 4.3.3. Keep the analytic completion at DM.2 and the difference-field constant calculation at DM.8. For arbitrary field extensions, supply the equivalence of separability with native geometric reducedness and the characteristic-p p-basis/linear-disjointness criterion. Algebra.IsSeparable is algebraic separability and must not replace this general extension property. Import current TauCetiRoadmap ReductiveGroupsPartII RG2.3.7 Lang.lang\_surjective and export its semilinear GL\_r matrix specialization; the general Lang theorem is already owned upstream. The current Lang.lang\_surjective Lean signature is on AlgebraicClosure F for finite F. Before applying it to a matrix with entries in bar(k), export surjectivity of the Lang morphism after base extension to that larger algebraically closed field and derive the inverse-Frobenius GL\_r matrix normalization there. Its entries need not be algebraic over F\_q.

**Needed by:** [DM.8/twisting-limit](#dm-8-twisting-limit); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.8/analytic-separability](#dm-8-analytic-separability); [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure); [DM.8/entire-from-equation](#dm-8-entire-from-equation); [DM.8/abp-estimates](#dm-8-abp-estimates); [DM.8/carlitz-deformation](#dm-8-carlitz-deformation); [DM.8/logarithm-division](#dm-8-logarithm-division); [DM.8/carlitz-logarithm-independence](#dm-8-carlitz-logarithm-independence); [DM.8/abp-size](#dm-8-abp-size); [DM.8/abp-count](#dm-8-abp-count).

### SchemeAndStackFoundations:SF.3

Reuse SF.3/line-bundle-degree-bounds, which imports JacobianChallenge Riemann–Roch: on a smooth projective geometrically connected curve over bar(k), a sufficiently large effective divisor above infinity gives finite-dimensional L(D) containing any chosen finite set of field generators. The additional export is functorial transport of the curve, divisor and section space by the coefficient automorphism for Papanikolas Proposition 4.3.3. Generic Riemann–Roch remains with AlgebraicCurves/JacobianChallenge.

**Needed by:** [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure).

### SchemeAndStackFoundations:SF.0

Reuse SF.0/algebraic-scheme-dimension for finite-type domain dimension versus fraction-field transcendence degree and invariance under field extension. Supply the remaining filtered growth form: for a finitely generated domain A=k\[a\_1,...,a\_n\], with A\_≤d the k-span of generator monomials of total degree at most d, dim\_k A\_≤d is eventually a polynomial in d of degree trdeg\_k Frac(A), with positive leading coefficient; include A=k, whose polynomial is the constant 1. Thus equality of these dimensions for all d implies equality of transcendence degrees even when the coefficient fields differ. This generic commutative-algebra dimension interface belongs with SF.0, not the SF.1 descent layer. It does not require extending the motives or moduli roadmaps.

**Needed by:** [DM.8/period-transcendence](#dm-8-period-transcendence).

### FunctionFieldArithmetic:FA.1

For DM.8/abp-count, reuse the global-place theory and export the finite-separable-extension adapter: full finite constant field k0, infinity places with ramification indices e\_v and residue degrees, D∞=Σe\_v v and \[k0:F\_q\]deg\_(k0)D∞=\[K0:F\_q(θ)\], and the equivalence between all-conjugate size≤q^n and the corresponding infinity pole bounds. The finite normalization/Dedekind and divisor-space carriers are imported from AlgebraicCurves Layers 2–3 and pinned Tau Ceti.

**Needed by:** [DM.8/abp-count](#dm-8-abp-count).

## Source-route coverage

These are the exact extracted items routed to this roadmap. The specialized multizeta conclusions stay with Part II; these rows identify their foundational imports.

| Extracted item | Targets supplying its contract |
| --- | --- |
| `PAPER-NGODAC-21/carlitz-products` | [DM.0/carlitz-products](#dm-0-carlitz-products) |
| `PAPER-NGODAC-21/period-power` | [DM.2/period-power](#dm-2-period-power) |
| `PAPER-NGODAC-21/C-infinity` | [DM.2/c-infinity](#dm-2-c-infinity) |
| `PAPER-NGODAC-21/carlitz-period-product` | [DM.2/carlitz-period](#dm-2-carlitz-period) |
| `PAPER-NGODAC-21/dual-motive` | [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/rationalization](#dm-4-rationalization) |
| `PAPER-NGODAC-21/algebraic-twist` | [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive](#dm-4-pre-t-motive) |
| `PAPER-NGODAC-21/twist` | [DM.8/coefficient-twist](#dm-8-coefficient-twist) |
| `PAPER-NGODAC-21/rigid-trivialization` | [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/fundamental-matrix](#dm-8-fundamental-matrix); [DM.8/anderson-comparison](#dm-8-anderson-comparison) |
| `PAPER-NGODAC-21/entire-ring` | [DM.8/entire-series](#dm-8-entire-series) |
| `PAPER-NGODAC-21/entire-from-equation` | [DM.8/entire-from-equation](#dm-8-entire-from-equation) |
| `PAPER-NGODAC-21/ABP-size` | [DM.8/abp-size](#dm-8-abp-size) |
| `PAPER-NGODAC-21/ABP-liouville` | [DM.8/abp-liouville](#dm-8-abp-liouville) |
| `PAPER-NGODAC-21/ABP-count` | [DM.8/abp-count](#dm-8-abp-count) |
| `PAPER-NGODAC-21/ABP-siegel` | [DM.8/abp-siegel](#dm-8-abp-siegel) |
| `PAPER-NGODAC-21/ABP-polynomial-siegel` | [DM.8/abp-polynomial-siegel](#dm-8-abp-polynomial-siegel) |
| `PAPER-NGODAC-21/ABP-auxiliary` | [DM.8/abp-auxiliary](#dm-8-abp-auxiliary) |
| `PAPER-NGODAC-21/ABP-auxiliary-zero` | [DM.8/abp-auxiliary-zero](#dm-8-abp-auxiliary-zero) |
| `PAPER-NGODAC-21/ABP-lifting` | [DM.8/abp-lifting](#dm-8-abp-lifting) |
| `PAPER-NGODAC-21/constant-denominator` | [DM.8/constant-denominator](#dm-8-constant-denominator) |
| `PAPER-NGODAC-21/twist-fixed` | [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields) |
| `PAPER-NGODAC-21/trivialization-uniqueness` | [DM.8/fundamental-matrix](#dm-8-fundamental-matrix) |
| `PAPER-NGODAC-21/omega` | [DM.2/omega](#dm-2-omega) |
| `PAPER-NGODAC-21/rev-twist-fixed-field-of-the` | [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields) |
| `PAPER-IM-KIM-LE-ETAL-24/27` | [DM.8/abp-lifting](#dm-8-abp-lifting) |
| `PAPER-CHANG-CHEN-MISHIBA-23/30` | [DM.8/coefficient-twist](#dm-8-coefficient-twist) |
| `PAPER-CHANG-CHEN-MISHIBA-23/31` | [DM.8/entire-series](#dm-8-entire-series); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields) |
| `PAPER-CHANG-CHEN-MISHIBA-23/59` | [DM.8/abp-lifting](#dm-8-abp-lifting) |
| `PAPER-CHANG-CHEN-MISHIBA-23/60` | [DM.8/fundamental-matrix](#dm-8-fundamental-matrix) |
| `PAPER-CHANG-CHEN-MISHIBA-23/61` | [DM.8/constant-denominator](#dm-8-constant-denominator) |

## Source corrections and convention cautions

### DrinfeldModulesAndTModules/E1

**Source:** PAPIKIAN-2017.

**Location:** Public lecture notes, Theorem 2.3 proof, p. 7.

**Kind:** misprint.

**Issue:** The displayed finite product for φ\_a has initial X and factors (1−X/e\_Λ(λ)), with no initial scalar a, while the argument requires differential a..

**Corrected contract:** Use aX∏\_(0≠λ∈a⁻¹Λ/Λ)(1−X/e\_Λ(λ))..

**Reason:** The displayed product has derivative one at zero. The functional equation e\_Λ(az)=φ\_a(e\_Λ(z)) has derivatives a on the left and φ\_a′(0) on the right. The correction also gives φ\_c=cX for constants c..

**Published correction status:** new.

**Correction search:** \["The public lecture URL and author/seminar listing were checked on 2026-10-11; a search for Papikian Drinfeld Theorem 2.3 errata found no correction. The uncleared book was not used."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E2

**Source:** HARTL-2017.

**Location:** arXiv:1706.06807v1, proof of Theorem 3.5, display (3.5), p. 9; published display (3.5), p. 1440.

**Kind:** misprint.

**Issue:** The preprint display gives the target Hom(M,M′) while the map takes m′ to m′∘f for f:E→E′..

**Corrected contract:** The target is Hom(M(E′),M(E)); the published display gives this corrected target..

**Reason:** Composition m′∘f starts with a function on E′ and produces a function on E, reversing the objects. The surrounding preprint proof already uses this direction..

**Published correction status:** Corrected in the published Annali XIX (2019) display (3.5), p. 1440, inspected on 2026-10-11..

**Correction search:** \["arXiv:1706.06807 version listing; Hartl publications page; published journal PDF, pp. 1439–1441."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E3

**Source:** STALDER-PUBLISHED.

**Location:** Compositio 146 (2010), recap after Proposition 6.21, p. 595; arXiv:0809.0224v1, p. 43.

**Kind:** misprint.

**Issue:** The recap identifies B^G with the full completed coefficient ring F\_(K,λ), although Proposition 6.21 identifies it with the smaller rational coefficient extension F\_(λ,K)..

**Corrected contract:** Use B^G=F\_(λ,K)=Frac(F\_λ⊗F\_q K), retaining the distinction from Frac((F\_λ,res⊗F\_q K)\[\[z\]\])..

**Reason:** Proposition 6.21 proves the smaller equality, and Claim 5.2 requires exactly that equality for local algebraization. For infinite K the rational scalar extension and full coefficient completion differ..

**Published correction status:** new.

**Correction search:** \["The arXiv version listing; Cambridge Compositio article and erratum search; ETH deposited version of record, p. 595. No separate correction found on 2026-10-11."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E4

**Source:** HARTL-YU-2025.

**Location:** arXiv:2009.13934v2, Proposition 3.11 and proof, pp. 18–19.

**Kind:** misprint.

**Issue:** Three line-bundle subscripts use A\[1/r\] for the reciprocal compactification that the same proposition defines over A\[1/t\]..

**Corrected contract:** Use Q\_(r,A\[1/t\]) in the O(1) and O(−1) subscripts..

**Reason:** r is the rank integer, while the coefficient element inverted throughout the construction and its base is t. The surrounding line-bundle construction is over Q\_r⊗F\_q A\[1/t\]..

**Published correction status:** new.

**Correction search:** \["arXiv:2009.13934 version listing and v2; Hartl publications page; Wiley 2025 article/erratum search. This finding is scoped to v2; the journal text was not collated."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E5

**Source:** WIEDMANN-2005.

**Location:** Revised English thesis, proof of Proposition 5.15, p. 77.

**Kind:** misprint.

**Issue:** The proof attributes cohomology/section conclusions to Proposition 5.15 itself..

**Corrected contract:** Use Proposition 5.14 for the normalized cohomology and section dimensions..

**Reason:** Proposition 5.14, immediately preceding, proves the required vanishing and dimensions; Proposition 5.15 is the conclusion presently being proved..

**Published correction status:** new.

**Correction search:** \["The public revised English thesis and its Göttingen listing, checked on 2026-10-11; no separate erratum located."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E6

**Source:** HARTL-PUBLISHED.

**Location:** Published Lemma 3.8(b), proof, p. 1442; arXiv:1706.06807v1, p. 10.

**Kind:** misprint.

**Issue:** After choosing f∈1+I with fI=0 and I contained in every prime, the proof calls 1−f a unit..

**Corrected contract:** Use f itself as the unit; multiplying fI=0 by f⁻¹ gives I=0..

**Reason:** Here I lies in the nilradical, so f=1+i is invertible while 1−f=−i is nilpotent and is generally not invertible in a nonzero ring. The corrected argument gives exactly the stated conclusion..

**Published correction status:** new.

**Correction search:** \["arXiv:1706.06807 version listing; Hartl publications page and its author PDF; published Annali XIX (2019) PDF, p. 1442; targeted Lemma 3.8 erratum search on 2026-10-11. No correction located."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E7

**Source:** BP-RAPID.

**Location:** §2.4, immediately after equation (2.2), p. 6.

**Kind:** misprint.

**Issue:** The action is identified with the derivative-one sublattice polynomial evaluated at z, although the preceding functional equation evaluates it at az..

**Corrected contract:** Use φ\_Λ(a)(z)=P\_\[Λ:aΛ\](az)..

**Reason:** The normalized P has derivative one; the action must have derivative a. The preceding scalar-lattice formula and the next page’s ψ(c) formula both contain the scalar in the argument..

**Published correction status:** new.

**Correction search:** \["Public source/version listing and targeted author/title erratum search checked on 2026-10-11; no separate correction located. The finding is confined to the identified public artifact; no uninspected published edition is claimed to have this error."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E8

**Source:** HARTL-YU-2025.

**Location:** arXiv:2009.13934v2, equation (3.7), p. 18.

**Kind:** misprint.

**Issue:** The coefficient is indexed by ordered pairwise-distinct tuples, which counts each elementary-symmetric monomial (q^i−1)! times..

**Corrected contract:** Sum once over subsets S⊂V\_r∖{0} of cardinality q^i−1, with summand γ(t) times the product of λ(v)⁻¹ for v∈S..

**Reason:** Expand the finite product in (3.6). For q=2, r=2, i=2 the printed ordered sum has six identical terms and vanishes, while the leading coefficient is the nonzero product of the three reciprocals times γ(t). The sign is one in characteristic p..

**Published correction status:** new.

**Correction search:** \["Public source/version listing and targeted author/title erratum search checked on 2026-10-11; no separate correction located. The finding is confined to the identified public artifact; no uninspected published edition is claimed to have this error."\].

**Affects:** a stated result.

### DrinfeldModulesAndTModules/E9

**Source:** STALDER-2008.

**Location:** arXiv:0809.0224v1 artifact, Proposition 6.4 proof, p. 36.

**Kind:** misprint.

**Issue:** One branch of the induction changes the Frobenius exponent in the denominator from m to the unrelated residue-degree letter d..

**Corrected contract:** Keep the denominator q^m−1 in that branch..

**Reason:** The preceding inequality is q^m v\_x(f\_ir)≥q^m C/(q^m−1). Division by q^m gives C/(q^m−1), in agreement with the proposition and the other branch..

**Published correction status:** new.

**Correction search:** \["Public source/version listing and targeted author/title erratum search checked on 2026-10-11; no separate correction located. The finding is confined to the identified public artifact; no uninspected published edition is claimed to have this error."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E10

**Source:** STALDER-2008.

**Location:** arXiv:0809.0224v1 artifact, Theorem 5.4 proof, p. 28.

**Kind:** misprint.

**Issue:** The final Hom identification dualizes the source realization a second time..

**Corrected contract:** Identify (V\_λ(M)∨⊗V\_λ(N))^G with Hom\_G(V\_λ(M),V\_λ(N))..

**Reason:** The tensor-Hom correspondence for finite-dimensional representations places a single dual on M in the tensor product. The fully faithful functor has source M and target N, so the displayed Hom source must be V\_λ(M)..

**Published correction status:** new.

**Correction search:** \["Public source/version listing and targeted author/title erratum search checked on 2026-10-11; no separate correction located. The finding is confined to the identified public artifact; no uninspected published edition is claimed to have this error."\].

**Affects:** nothing.

### DrinfeldModulesAndTModules/E-DM8-1

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), Proposition 3.3.14 proof, p.16.

**Kind:** misprint.

**Issue:** The proof assigns both independently chosen trivializations Ψ\_P and Ψ\_Q to GL\_r(L), although P and Q have independent ranks..

**Corrected contract:** Use Ψ\_P∈GL\_r(L), Ψ\_Q∈GL\_s(L) for the independently chosen ranks r and s; their tensor matrix has size rs..

**Reason:** The proposition permits P and Q of different ranks; choosing ranks 1 and 2 makes the shared r annotation incorrect. The tensor/dual argument itself is unchanged..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-2

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), §3.4.1, p.17, and Proposition 3.4.7, p.19.

**Kind:** misprint.

**Issue:** The σ-representing matrix Φ is annotated as r×1 in the two indicated places..

**Corrected contract:** The representing matrix is r×r..

**Reason:** It multiplies the r×1 basis column, and its determinant is used immediately. For r=2 the printed matrix product and determinant have the wrong types..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-3

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), Theorem 3.5.4 proof, p.21.

**Kind:** misprint.

**Issue:** The graded-vector-space equivalence is assigned coefficient field bar(k)(t)..

**Corrected contract:** The coefficient field of the graded-vector-space category in this argument is F\_q(t)..

**Reason:** Lemma 3.5.3 gives endomorphisms of each Carlitz tensor power equal to F\_q(t), and the fibre functor in the same sentence takes values in Vec(F\_q(t)); a bar(k)(t)-linear equivalence would change that endomorphism field..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-4

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), Lemma 4.5.7 proof, p.30.

**Kind:** misprint.

**Issue:** The kernel basis-column matrix is annotated Mat\_{m×s}(Λ), and written using a transpose incompatible with the block widths..

**Corrected contract:** Use the vertical block column with −C above I\_(s−m), of size s×(s−m), as the kernel basis matrix; its product with \[I\_m,C\] is zero..

**Reason:** C has m rows and s−m columns. Stacking −C above I\_{s−m} gives s rows and s−m columns and makes its product with \[I\_m,C\] defined..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-5

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), Theorem 5.2.2 proof, p.33.

**Kind:** misprint.

**Issue:** The concatenated tensor-monomial vector length is given by (r^(2d+2)−1)/(r²−1) without excluding r=1..

**Corrected contract:** Use N=Σ\_{n=0}^d r^(2n); the quotient expression is only for r≠1, and N=d+1 for r=1..

**Reason:** The proof includes rank-one motives. At r=1 the printed quotient is 0/0, whereas the concatenated vector has d+1 entries. This changes no theorem hypothesis..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-6

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2 (29 June 2007), Proposition 6.1.3 proof, p.34.

**Kind:** misprint.

**Issue:** After choosing basis m\_0,...,m\_r, the column used in the σ equation starts with m\_1 and omits m\_0..

**Corrected contract:** Use m=\[m\_0,m\_1,…,m\_r\]^tr in the equation σm=(t−θ)Φm..

**Reason:** The module has rank r+1 and Φ is an (r+1)×(r+1) matrix; the printed vector omits its first coordinate. The subsequent submodule C tensor C is generated in that coordinate..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-09-27: arXiv https://arxiv.org/abs/math/0506078 lists v2 (29 June 2007) as latest; no correction entry seen.", "2026-09-27: publisher article https://link.springer.com/article/10.1007/s00222-007-0073-y had no Correction match; its PDF endpoint returned HTML, not the article PDF.", "2026-09-27: author page https://www.math.tamu.edu/~map/ redirected to https://sites.google.com/tamu.edu/papanikolas/; no correction link seen.", "2026-09-27: searches for the exact title with erratum, for Papanikolas with 0073-y correction, and for Proposition 6.2.3 found no correction addressing these slips.", "2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-7

**Source:** PAP-v2.

**Location:** arXiv math/0506078v2, Theorem6.4.2 proof p.38, invoking Lemma6.4.1 pp.37–38.

**Kind:** gap.

**Issue:** The proof applies Lemma6.4.1 to each λ\_i, while the theorem permits exp\_C(λ\_i)=0 and the lemma assumes a nonzero algebraic exponential..

**Corrected contract:** Separate exp\_C(λ)=0: the Carlitz kernel theorem gives λ in F\_q\[θ\]·π̃. Apply division only to the nonzero exponentials, then choose a k-basis of the span of π̃ and the resulting small logarithms..

**Reason:** The single-element family λ\_1=π̃ is linearly independent over k and satisfies the theorem, but does not satisfy the division lemma’s nonzero-exponential hypothesis. DM.8/logarithm-division and carlitz-logarithm-independence already state the separate period case, so no target theorem is weakened..

**Published correction status:** new (no correction located in the recorded searches; finding limited to PAP-v2).

**Correction search:** \["2026-10-11: https://arxiv.org/abs/math/0506078 still lists v2 (29June2007) as latest; no later correction version.", "2026-10-11: https://sites.google.com/tamu.edu/papanikolas/research and /publications list the article and arXiv; no linked correction for these findings was located.", "2026-10-11: https://link.springer.com/article/10.1007/s00222-007-0073-y metadata has no Correction match; published full text remains unavailable. Restricted primary-domain title/DOI correction searches found no relevant erratum.", "2026-10-14: https://arxiv.org/abs/math/0506078 lists v2 (29June2007) as latest. https://link.springer.com/article/10.1007/s00222-007-0073-y and https://sites.google.com/tamu.edu/papanikolas/research plus /publications link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"s00222-007-0073-y\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains PAP-v2 scoped."\].

**Affects:** the proof.

### DrinfeldModulesAndTModules/E-DM8-8

**Source:** CPY-v2.

**Location:** arXiv1411.0124v2, Proposition2.2.1 p.6 (rendered page checked).

**Kind:** misprint.

**Issue:** The matrix of the homomorphism between rationalized motives is placed in Mat\_(r1×r2)(bar(k)\[t\])..

**Corrected contract:** Place it in Mat\_(r1×r2)(bar(k)(t)); retain both determinant conditions and the conclusion that its monic common denominator lies in F\_q\[t\]..

**Reason:** On two trivial rank-one motives, multiplication by 1/t commutes with σ and is a rationalized-module homomorphism, although its matrix is not polynomial. The proof immediately treats rational denominators and proves the intended corrected statement..

**Published correction status:** Already recorded and independently confirmed as PAPER-NGODAC-21/E10 in research/blueprint/papers/PAPER-NGODAC-21.result.json; this is reuse, not a new claim..

**Correction search:** \["2026-10-11: arXiv https://arxiv.org/abs/1411.0124 lists v2 (2November2015) as latest.", "2026-10-11: https://ems.press/journals/jems/articles/15761 requires a subscription; its download returned HTML, so the published statement was not collated.", "2026-10-11: Papanikolas and Chang publication pages and restricted primary-domain erratum search inspected; no relevant linked correction located. The existing atlas E10 records the same issue in an author-hosted 2018 copy.", "2026-10-14: https://arxiv.org/abs/1411.0124 lists v2 (2Nov2015) as latest. https://ems.press/journals/jems/articles/15761 requires subscription; author research/publications pages link the article/preprint but no relevant correction. Exact-title erratum/correction and DOI \\"10.4171/JEMS/840\\" correction/erratum searches located no relevant correction. Published full text not read; finding remains CPY-v2 scoped."\].

**Affects:** nothing.

## Source register

Dates and reading histories distinguish the accepted parts’ evidence from the targeted source checks for this whole-roadmap reconciliation. Each result above is stated in this document’s own words with theorem, section and page locators.

<a id="source-bp-rapid"></a>

### BP-RAPID

W. Dale Brownawell and Matthew A. Papanikolas, [A rapid introduction to Drinfeld modules, t-modules, and t-motives](https://arxiv.org/pdf/1806.03919v1). arXiv:1806.03919v1, 11 June 2018.

**Recorded read:** 2026-10-11. **SHA-256:** `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d`.

**Recorded source scope.**

- §§1–2.5, pp. 1–8; §§3.1–3.5, pp. 8–13; §§4.1–4.6, pp. 13–20. Read for the definitions, analytic formulas and motive conventions used here.

- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: Theorem 4.2 and §§4.2–4.4, pp.16–18; abelian τ-motive and dual σ conventions. SHA-256 `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d`.

<a id="source-pink-2012"></a>

### PINK-2012

Richard Pink, [Compactification of Drinfeld modular varieties and Drinfeld modular forms of arbitrary rank](https://people.math.ethz.ch/~pink/ftp/Pink_DrinfeldModularForms_2012.pdf). Author copy of arXiv:1008.0013v4, 16 March 2012.

**Recorded read:** 2026-10-11. **SHA-256:** `408d485d17dbede3ae02b9b90f132a37947d567e8f2697bdcb6c6cb8c41c9639`.

**Recorded source scope.**

- §1, pp. 3–4; Propositions 2.6–2.7, pp. 6–7; §3, pp. 9–13; §4, pp. 13–18; §§5–6, pp. 19–24; §7, pp. 25–27.

<a id="source-hartl-2017"></a>

### HARTL-2017

Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://arxiv.org/pdf/1706.06807v1). arXiv:1706.06807v1, 22 June 2017.

**Recorded read:** 2026-10-11. **SHA-256:** `bca3f51ed9bf5f215a12bdf2390b4718cb3a951a3e71c01fb87541fefafcd31f`.

**Recorded source scope.**

- Lemma 1.4 and §2, pp. 3–6; §3, pp. 7–11; §4 definitions, pp. 11–13; Corollaries 5.11–5.19, pp. 19–23; §6, pp. 23–26; §7 definitions and local completion, pp. 27–28. The proof of the finite-shtuka equivalence is a supplier request, not asserted as read.

<a id="source-papikian-2017"></a>

### PAPIKIAN-2017

Mihran Papikian, [An overview of the theory of Drinfeld modules](https://websites.umich.edu/~asnowden/seminar/2017/drinfeld/ODM.pdf). Public lecture notes, last modified 9 October 2017.

**Recorded read:** 2026-10-11. **SHA-256:** `6c10dd09df294795f41228ee5ba8b24232c43d7ed1c6485ba0bdb6ad8da21c43`.

**Recorded source scope.**

- §2.2, pp. 6–7; §3.1, pp. 10–12; §3.2, pp. 12–14. These are lecture notes, not the uncleared book.

<a id="source-taelman-2012"></a>

### TAELMAN-2012

Lenny Taelman, [Special L-values of Drinfeld modules](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n1-p10-p.pdf). Annals of Mathematics 175 (2012), 369–391.

**Recorded read:** 2026-10-11. **SHA-256:** `46699398350f09a5e9baf53ae7b414102633fa86c0fc1abc11dee82ee6d0032d`.

**Recorded source scope.**

- §1 definitions and Theorem 1, pp. 369–374; §§2–5 determinant theory, trace formula and class-formula proof, pp. 375–389.

<a id="source-wiedmann-2005"></a>

### WIEDMANN-2005

Stefan Wiedmann, [Drinfeld modules and elliptic sheaves](https://www.uni-math.gwdg.de/wiedmann/Diss_Englisch/master.pdf). Revised English thesis, 26 August 2005.

**Recorded read:** 2026-10-11. **SHA-256:** `dfb9028260ce487088763691bf55b9644a9598976fa9db183b936c491fec828d`.

**Recorded source scope.**

- §§3.4–3.6, pp. 40–48; §4.6, pp. 69–71; §5, pp. 72–84; §6.1, p. 85. The infinity construction and normalized cohomology were read; bounded-shift variance and non-rational infinity residue-factor descent remain precise gaps.

<a id="source-tamagawa-1994"></a>

### TAMAGAWA-1994

Akio Tamagawa, [Generalization of Anderson’s t-motives and Tate conjecture](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0884-17.pdf). RIMS Kokyuroku 884 (1994), 154–159.

**Recorded read:** 2026-10-11. **SHA-256:** `f88b80a69f4fc13dec1db2a88081adeb9f8666283893ea232ed11076b6205aec`.

**Recorded source scope.**

- §§0–3, pp. 154–158, including the fixed characteristic requirement and local algebraization sketch.

<a id="source-stalder-2008"></a>

### STALDER-2008

Nicolas Stalder, [The Semisimplicity Conjecture for A-Motives](https://arxiv.org/pdf/0809.0224v1). arXiv:0809.0224v1; downloaded artifact carries the date 23 November 2018.

**Recorded read:** 2026-10-11. **SHA-256:** `ba000e658d82e781d46e5f550c221e100516c46ea881cd23c68bae5da063142a`.

**Recorded source scope.**

- Theorem 1.1, pp. 2–3; Definitions 2.1–2.2, pp. 5–6; Definitions 2.26 and Proposition 2.28, pp. 12–14; Theorem 3.11 and proof, pp. 18–21; §4 realization and coefficient-extension route, pp. 21–26; §§5–6, pp. 26–43. Proposition 5.16(a) is inspected and its integral saturation proof input remains recorded. Published Proposition 5.16, p. 588, and Proposition 6.21 and following recap, p. 595, were separately collated.

<a id="source-ngodac-2021"></a>

### NGODAC-2021

Tuan Ngo Dac, [On Zagier-Hoffman’s conjectures in positive characteristic](https://hal.science/hal-03298790/document). HAL hal-03298790v1, manuscript dated 29 March 2021; not collated against Annals 194 (2021), 361–392.

**Recorded read:** 2026-10-20. **SHA-256:** `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.

**Recorded source scope.**

- Notation and depth-one power sums in §2, pp. 5–7; Definition 4.1 and §4.2, pp. 16–18. Only items routed to DM.0, DM.2, DM.4 and DM.6 are developed here; DM.8 machinery is imported.
- Whole-roadmap pass also covers the DM.8 analytic and ABP routes; the earlier part-only scope above is historical.

- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: Same HAL artifact as NGO-HAL; Definition 4.1 and §§4.2–4.3, printed pp.16–18 (PDF pp.17–19). SHA-256 `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.

**Historical artifact:** `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`, 2026-10-11. Historical accepted-part download; retained for provenance. The re-fetched HAL PDF has a different wrapper/hash; no claim of byte identity.

<a id="source-thakur-2009"></a>

### THAKUR-2009

Dinesh S. Thakur, [Power sums with applications to multizeta and zeta zero distribution for F\_q\[t\]](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf). Finite Fields and Their Applications 15 (2009), 534–552.

**Recorded read:** 2026-10-11. **SHA-256:** `d31f4a4be1e6cb1aaf9bdc574070066b1057f043df3ec437cd71784c0933168f`.

**Recorded source scope.**

- §§2.2–2.3, pp. 536–537: depth-one sums, generating function, and its small-exponent specialization.

<a id="source-crew-2019"></a>

### CREW-2019

Richard Crew, [Local Class Field Theory](https://people.clas.ufl.edu/rcrew/files/LCFT.pdf). Public author notes, 6 April 2019.

**Recorded read:** 2026-10-11. **SHA-256:** `aa902052096f5d11095b0f57100d96f79cde4e560c9e2ffd51de1b3302545b42`.

**Recorded source scope.**

- Proposition 1.2.8.4 and Corollary 1.2.8.5, pp. 34–35; algebraic closedness of completion in positive characteristic.

<a id="source-hartl-yu-2025"></a>

### HARTL-YU-2025

Urs Hartl and Chia-Fu Yu, [Arithmetic Satake compactifications and algebraic Drinfeld modular forms](https://arxiv.org/pdf/2009.13934v2). arXiv:2009.13934v2, 8 January 2025; not collated against the 2025 journal version.

**Recorded read:** 2026-10-11. **SHA-256:** `7c4fe158c3503fc2e7096ea237c1e1932dfa074b3a62416e6040c92d773da2af`.

**Recorded source scope.**

- Definitions 2.1–2.6, Theorem 2.3 and Proposition 2.8, pp. 7–10; Definition 3.1, Theorem 3.2, Lemmas 3.3 and 3.6–3.8 with proofs, pp. 12–16; Lemma 3.10 and Proposition 3.11 with proof, pp. 17–19. General special-fiber Cohen–Macaulayness is a conjecture and is not a target here.

<a id="source-hartl-published"></a>

### HARTL-PUBLISHED

Urs Hartl, [Isogenies of abelian Anderson A-modules and A-motives](https://journals.sns.it/index.php/annaliscienze/article/download/668/654/886). Annali della Scuola Normale Superiore di Pisa XIX (2019), 1429–1470.

**Recorded read:** 2026-10-11. **SHA-256:** `a0f16971c626d020451f7d872399e15c06786c1ce3d0cab739639649d1dcc75f`.

**Recorded source scope.**

- Theorem 3.5 and proof, pp. 1439–1441, especially display (3.5), p. 1440; Lemma 3.8 and proof of (b), pp. 1441–1443. Part (a) cites earlier proofs; it is not claimed discharged. Targeted collation only.

<a id="source-stalder-published"></a>

### STALDER-PUBLISHED

Nicolas Stalder, [The semisimplicity conjecture for A-motives](https://www.research-collection.ethz.ch/bitstreams/47bc6b90-ad56-4a15-a6c8-46b7da8de09f/download). Compositio Mathematica 146 (2010), 561–598.

**Recorded read:** 2026-10-11. **SHA-256:** `d1e133a5465ec129bbfc6c6f8fe1df8e35bc23d1b9381f1c1a7a0f43ff48aacf`.

**Recorded source scope.**

- Proposition 5.16 and proof, p. 588; Proposition 6.21, its proof and following recap, p. 595. Targeted collation only.

<a id="source-maurischat-2026"></a>

### MAURISCHAT-2026

Andreas Maurischat, [Abelian equals A-finite for Anderson A-modules](https://aif.centre-mersenne.org/item/10.5802/aif.3754.pdf). Annales de l’Institut Fourier, online-first 26 January 2026, DOI 10.5802/aif.3754.

**Recorded read:** 2026-10-11. **SHA-256:** `4cf80d50c882ee43b71f9e6fbe9a50eb1e88d94efb8afae17dcd9ae51bb2201e`.

**Recorded source scope.**

- §4, Theorem 4.1 and proof, pp. 22–24; §5 conventions, pp. 25–27; §6, Propositions 6.1, 6.4, 6.5 and Theorem 6.6 with proofs, pp. 28–35; §8, Corollary 8.1 and proof, p. 43. The §3 skew-field normal-form/Newton inputs are a supplier contract.

<a id="source-pap-v2"></a>

### PAP-v2

Matthew A. Papanikolas, [Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms](https://arxiv.org/pdf/math/0506078v2). arXiv math/0506078v2, 29 June 2007; preprint of Invent. Math. 171 (2008), 123–174.

**Recorded read:** 2026-10-14. **SHA-256:** `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.

**Recorded source scope.**

- Revision-two independent review: entire preprint pp.1–39; all node locators and proof chains. Rendered pp.16,17,19,21,30,33,34,38 checked for matrix ranks, overbars, block dimensions and the zero-exponential case.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: entire preprint pp.1–39; all DM.8 source locators, hypotheses and proof chains checked. Rendered pp.21, 30 and 38 checked for overbars, matrix shapes and the zero-exponential case. SHA-256 `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §1.1.3–1.1.6 p.2; §§3.1–3.4 pp.9–19, including rational category, tensor/dual conventions, rationalization and the complete denominator and integral-trivialization proofs. SHA-256 `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.

<a id="source-abp-v1"></a>

### ABP-v1

G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, [Determination of the algebraic relations among special Γ-values in positive characteristic](https://arxiv.org/pdf/math/0207168v1). arXiv math/0207168v1; preprint of Annals160(2004),237–313.

**Recorded read:** 2026-10-14. **SHA-256:** `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2`.

**Recorded source scope.**

- Revision-two independent review: §§2.1–2.5 pp.6–7; §3 pp.7–16, including the complete lifting proof and Proposition3.1.3; Proposition4.3.2 and proof pp.21–22. Collated with the corresponding published sections.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: §§2.1–2.5 pp.6–7; §3 pp.7–16, including the full lifting proof and Proposition3.1.3; Proposition4.3.2 p.21. Compared with the corresponding published sections. SHA-256 `a22c328ea63a1d2d43309bc125b5f377c88d853ff0f1b21039fba14b924ff8c2`.

<a id="source-ngo-hal"></a>

### NGO-HAL

Tuan Ngo Dac, [On Zagier–Hoffman’s conjectures in positive characteristic](https://hal.science/hal-03298790/document). HAL hal-03298790v1, submitted 24 July 2021; cover/version and document bytes accessed 2026-10-14.

**Recorded read:** 2026-10-14. **SHA-256:** `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.

**Recorded source scope.**

- Revision-two independent review: §§4.1–4.3 printedpp.16–18 (PDFpp.17–19), and §5.2 printedpp.20–21 (PDFpp.21–22). These specialize and consume the shared interface; no specialized multizeta target is added.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: §§4.1–4.3 printedpp.16–18 (PDFpp.17–19), and §5.2 printedpp.20–21 (PDFpp.21–22). Specialized multizeta results are consumers, not new DM.8 targets. SHA-256 `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §4.1 Definition 4.1 printed p.16 (PDF p.17); §§4.2–4.3 printed pp.17–18 (PDF pp.18–19), analytic conventions and lifting statement. SHA-256 `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.

<a id="source-ccm-v2"></a>

### CCM-v2

Chieh-Yu Chang, Yen-Tsung Chen, Yoshinori Mishiba, [On Thakur’s basis conjecture for multiple zeta values in positive characteristic](https://arxiv.org/pdf/2205.09929v2). arXiv2205.09929v2.

**Recorded read:** 2026-10-14. **SHA-256:** `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b`.

**Recorded source scope.**

- Revision-two independent review: §4.1 p.13; Lemma5.1.1 and complete proof pp.22–24.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: §4.1 p.13; Lemma5.1.1 and its proof pp.22–24. SHA-256 `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §4.1/Theorem 4.1.1 p.13; Lemma 5.1.1 application of fundamental-matrix uniqueness and the common denominator, p.24. SHA-256 `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b`.

<a id="source-iklnp-v2"></a>

### IKLNP-v2

B.-H. Im, H. Kim, K. N. Le, T. Ngo Dac, L. H. Pham, [Zagier–Hoffman’s conjectures in positive characteristic](https://arxiv.org/pdf/2205.07165v2). arXiv2205.07165v2 (10June2024).

**Recorded read:** 2026-10-14. **SHA-256:** `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`.

**Recorded source scope.**

- Revision-two independent review: §2.1/Theorem2.2 p.26; §2.2.1 pp.27–28; uniqueness/denominator application p.33.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: §2.1 and Theorem2.2 p.26; §2.2.1 p.27; the uniqueness and denominator application p.33. SHA-256 `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §2.1, Definition 2.1 and Theorem 2.2, p.26. SHA-256 `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`.

<a id="source-cpy-v2"></a>

### CPY-v2

Chieh-Yu Chang, Matthew A. Papanikolas, Jing Yu, [An effective criterion for Eulerian multizeta values in positive characteristic](https://arxiv.org/pdf/1411.0124v2). arXiv1411.0124v2.

**Recorded read:** 2026-10-14. **SHA-256:** `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`.

**Recorded source scope.**

- Revision-two independent review: §§2.1–2.2 pp.4–6, Proposition2.2.1 and complete proof, and rendered p.6. Adjacent Ω/period sign compared with PAP; chosen normalizations need the DM.2 adapter.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: Independent review: Proposition2.2.1 and full proof p.6, including its rendered page; adjacent Ω/period normalization was compared with the DM.8 convention. SHA-256 `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §§2.1–2.2, pp.4–6, especially Proposition 2.2.1 p.6 and its complete proof. SHA-256 `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`.

<a id="source-abp-published"></a>

### ABP-published

G. W. Anderson, W. D. Brownawell, M. A. Papanikolas, [Determination of the algebraic relations among special Γ-values in positive characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p06.pdf). Annals of Mathematics 160 (2004), 237–313; version of record.

**Recorded read:** 2026-10-14. **SHA-256:** `5668a9496609eb02380d0038f0f67b200c4142eb01fadca48fef6d1f232f62ca`.

**Recorded source scope.**

- Revision-two independent review: §§2–3 printedpp.244–256, including the complete lifting proof, and Proposition4.3.2 with proof pp.262–263. Target hypotheses agree with ABP-v1.

- 2026-10-11, REV-DrinfeldModulesAndTModules--DM.8: §§2.1–2.5 and §3 pp.244–256, including the full lifting proof; Proposition4.3.2 pp.262–263. No change in the target hypotheses relative to ABP-v1. SHA-256 `5668a9496609eb02380d0038f0f67b200c4142eb01fadca48fef6d1f232f62ca`.
- 2026-10-20, Codex — codex-iUf6YW, BP-DrinfeldModulesAndTModules: §§2.2–3.4.5, pp.244–255; full arithmetic-estimate and lifting argument through p.256. SHA-256 `5668a9496609eb02380d0038f0f67b200c4142eb01fadca48fef6d1f232f62ca`.

**STALDER-PUBLISHED:** The public ETH download returned HTTP 500 during this pass. The accepted part’s dated reading receipt and published collation are retained; no fresh reading of that artifact is claimed.

**PAP-v2:** The newly specified algebraic and rationalization targets are checked against this exact preprint. The published full text has not been collated; source findings remain scoped to their recorded versions.

## Pinned libraries and current imports

The elaboration baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were checked at those pins. A current-library import is recorded separately and is not claimed available to the pinned Suggested file.

- [`mathlib:SkewPolynomial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/SkewPolynomial/Basic.lean): SkewPolynomial R := SkewMonoidAlgebra R (Multiplicative ℕ); the twist φ is read off a MulSemiringAction (Multiplicative ℕ) R, which the user must supply. Its docstring names the q-power Frobenius and Papikian's Drinfeld-module book as the motivating case. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:SkewPolynomial.monomial_mul_monomial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/SkewPolynomial/Basic.lean): monomial n r \* monomial m s = monomial (n + m) (r \* φ^\[n\] s): the twisted multiplication rule. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:FiniteField.frobeniusAlgHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean): For a finite field K of cardinality q and a commutative K-algebra R, the K-algebra endomorphism x ↦ x^q of R (coe\_frobeniusAlgHom). (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:FiniteField.coe_frobeniusAlgHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finite/Basic.lean): ⇑(frobeniusAlgHom K R) = (· ^ q). (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Polynomial.aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/AlgebraMap.lean): Evaluation R\[X\] →ₐ\[R\] A at an element of any R-algebra A, commutative or not: the universal property of R\[X\]. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Polynomial.algHom_ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/AlgebraMap.lean): R-algebra maps out of R\[X\] agreeing on X are equal. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Polynomial.Separable`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Separable.lean): p is separable: p and its derivative are coprime. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Polynomial.card_rootSet_eq_natDegree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Separable.lean): A separable polynomial that splits in K has exactly natDegree roots there. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.End`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LinearMap/End.lean): The ring of R-linear endomorphisms of a module. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:RingHom.ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean): The kernel ideal of a ring homomorphism. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Ideal.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Span.lean): The ideal generated by a set. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.CommHopfAlgCat.kernelSpec`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Scheme/Kernel.lean): For a Hopf-algebra map H→K, the affine group-scheme kernel is quotientSpec K by kernelHopfIdeal. The map is contravariant on spectra; this already constructs the general kernel. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.AdditiveGroup.gaPointsMulEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/AdditiveGroup/Basic.lean): The convolution group of algebra maps from SymmetricAlgebra R R is multiplicatively equivalent to the additive group of a commutative R-algebra. This supplies the additive-group functor of points. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:PowerSeries.IsRestricted.subring`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Restricted.lean): Native radius-c restricted power-series subring of a normed ring. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.charpoly`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean): For an endomorphism of a finite free module over a commutative ring, its characteristic polynomial is the matrix characteristic polynomial in a chosen basis. DM.6 specializes this native operation to finite-dimensional F-vector spaces. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:UniformSpace.Completion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/UniformSpace/Completion.lean): The separated quotient of Cauchy filters on a uniform space. The native completion field and normed-field instances in Mathlib/Analysis/Normed/Module/Completion.lean were also read and are reused; the extended norm on the algebraic closure remains an explicit input. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:NormedField.instCompletableTopField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Field/Instances.lean): Every normed field is a completable topological field; this supplies the completion-field instance in the C-infinity prototype. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): For a scheme X, X.Modules is the category SheafOfModules X.ringCatSheaf, with its native categorical morphisms. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgebraicGeometry.Scheme.Modules.pullback`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): For f:X→Y, pullback f is the functor Y.Modules→X.Modules, left adjoint to the native pushforward. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:SheafOfModules.IsLocallyFree`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): A module sheaf is locally free when it admits local generator data whose maps from the corresponding free sheaves are isomorphisms. Finite rank is a separate condition. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:SheafOfModules.IsFinitePresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean): A module sheaf is finitely presented when it admits local quasicoherent presentations with finitely many generators and relations. This is already Mathlib, also reused by Tau Ceti FinitelyPresentedSheaf. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.fixedSubmodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean): For an F-linear endomorphism f, the native F-submodule of vectors v satisfying f(v)=v. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.mem_fixedSubmodule_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean): Membership is exactly the equation f(v)=v. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.fixedSubmodule_eq_ker`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean): The fixed submodule is the kernel of f−id. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.fixedSubmodule_eq_top_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FixedSubmodule.lean): The fixed submodule is all of V exactly when f=id. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Submodule.subtype`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean): The native linear inclusion of a submodule. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Submodule.subtype_injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/LinearMap.lean): The inclusion of a submodule is injective. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.liftBaseChangeEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean): F-linear maps W→V correspond to L-linear maps L⊗\_F W→V when V is an L-module. The native abbreviation liftBaseChange applies this equivalence. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.liftBaseChange_tmul`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean): The scalar extension of j sends a⊗w to a·j(w). (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.range_liftBaseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean): The image of the lifted map is the L-linear span of the original image. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Submodule.mem_span_range_iff_exists_fun`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean): For a finite family, membership in its span is equivalent to a finite coefficient expansion. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:linearIndependent_iff'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean): Linear independence is equivalent to every finite relation having zero coefficients. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:linearIndependent_finSucc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Lemmas.lean): A Fin(n+1)-family is independent iff its tail is independent and its first vector is outside the tail span. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:linearIndependent_iff_finset_linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Defs.lean): An arbitrary family is independent iff all finite subfamilies are independent. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearIndependent.restrict_scalars'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Basic.lean): Independence descends from L to F under faithful scalar restriction, the reverse direction to the new fixed-vector theorem. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearIndependent.map'`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/LinearIndependent/Basic.lean): A linear map with zero kernel preserves linear independence. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Free.chooseBasis`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean): A basis indexed by ChooseBasisIndex for a free module; vector spaces are free. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean): The family supplied by a basis is linearly independent. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.span_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean): The range of a basis spans the whole module. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.injective_constr_of_linearIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean): The map prescribed on a basis is injective when the prescribed images are independent. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean): An F-basis gives the L-basis of L⊗\_F W by scalar extension. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.baseChange_apply`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean): The scalar-extended basis vector is 1⊗b\_i. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearIndependent.finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finite.lean): An independent family in a finite module has finite index type. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.Basis.finiteDimensional_of_finite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean): A basis indexed by a finite type proves finite dimensionality. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.finrank_baseChange`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Constructions.lean): The L-dimension of L⊗\_F W equals the F-dimension of W. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.finrank_le_finrank_of_injective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean): An injective linear map into a finite module bounds the domain finrank by the codomain finrank. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearMap.injective_iff_surjective_of_finrank_eq_finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean): For finite-dimensional spaces of equal dimension, a linear map is injective iff surjective. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:LinearEquiv.finrank_eq`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean): A linear equivalence preserves finrank. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Complex.conjAe`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Complex/Module.lean): Complex conjugation as an R-algebra automorphism, with its R-linear map for acceptance examples. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Complex.basisOneI`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Complex/Module.lean): The real basis 1,I of C; supplies a counterexample when exact constants or fixedness is omitted. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean): Audit boundary only: for an existing commutative Hopf algebra over a field, the point functor is naturally isomorphic to the tensor-automorphism functor of its finite comodules. It does not reconstruct a Hopf algebra from an arbitrary neutral category. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:iterateFrobeniusEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean): Iterated p-Frobenius equivalence on a perfect characteristic-p ring; its inverse supplies the inverse coefficient q-twist. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:PowerSeries.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean): Coefficientwise ring homomorphism on formal power series, leaving the variable unchanged. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:IntermediateField.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean): Native intermediate field generated by a set in an extension field. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:RatFunc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Defs.lean): Native rational-function type, equivalent to the fraction ring of a polynomial ring. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Algebra.IsGeometricallyReduced`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/GeometricallyReduced.lean): Native geometric-reducedness class; over a field it means reducedness after algebraic-closure scalar extension and expresses general field-extension separability. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Matrix.GeneralLinearGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): Native general linear group as units of the square matrix ring. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Equiv.lean): Native algebra equivalence with compatibility with the specified scalar map. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:IsScalarTower`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean): Compatibility of successive scalar actions, used for the field and tensor towers. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Submodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean): Native submodule of a module, used for solution and degree spans. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Algebra.adjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean): Least native subalgebra containing a specified generator set. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Matrix.det`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Determinant of a finite square matrix over a commutative ring. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Algebra.TensorProduct.includeLeft`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean): The left tensor-product algebra map sending a to a tensor 1. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Algebra.TensorProduct.includeRight`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean): The right tensor-product algebra map sending b to 1 tensor b. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Ideal.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean): Extension of an ideal along a ring homomorphism. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Ideal.comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean): Contraction of an ideal along a ring homomorphism. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:CommHopfAlgCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/CommHopfAlgCat.lean): Native category of commutative Hopf algebras, used only after the Hopf structure is proved. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.smoothCommHopfAlgProperty_of_geometricallyReduced`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Smooth/GeometricallyReduced.lean): Finite-type geometrically reduced commutative Hopf algebras over a field are smooth; this is a group criterion, not a general scheme criterion. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean): Natural-valued finite rank of a module, used only with explicit finite-dimensional hypotheses. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Submodule.span`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Span/Defs.lean): Native scalar span of a set. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:MvPolynomial.aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Eval.lean): Multivariate-polynomial algebra evaluation into a specified algebra. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgebraicIndependent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Defs.lean): Injectivity of multivariate-polynomial evaluation, the native notion of algebraic independence. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Algebra.trdeg`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Basic.lean): Cardinal-valued transcendence degree of an algebra. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:ringKrullDim`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean): Krull dimension of a commutative ring, valued in the extended natural numbers with bottom. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgebraicGeometry.Spec`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean): The native scheme spectrum of a commutative ring; supplies Z=Spec Σ without a new scheme definition. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:AlgebraicGeometry.IsClosedImmersion.spec_of_surjective`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean): For commutative rings and a surjective ring homomorphism, Spec.map is a closed immersion; apply to the generator-evaluation map with codomain its image Σ. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean): For IsFunctionField k F, IsIntegrallyClosedIn k F and deg D≥2g−1, the integer equality dim D=deg D+1−g. The exact-constant-field hypothesis is required. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.riemannRochSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean): The submodule of functions whose place valuations are bounded by the divisor; zero is included. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.finiteDimensional_riemannRochSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean): Every divisor space of an IsFunctionField is finite-dimensional, including when the displayed constant field is not full. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`tauceti:TauCeti.mem_riemannRochSpace_iff_neg_le_ord`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean): For f≠0, membership means −D(P)≤ord\_P(f) for every place. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)
- [`mathlib:Module.card_eq_pow_finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Finiteness.lean): The cardinality of a finite vector space equals the cardinality of its finite field raised to its finrank. (Actual statement at the recorded pinned checkout reread on 2026-10-20; the module and consuming hypotheses were checked.)

**[TauCetiRoadmap AlgebraicVectorBundles l0b--quasicoherent-and-finite-locally-free-sheaves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l0b--quasicoherent-and-finite-locally-free-sheaves)**, commit `0d144d044dacebca17b654695b6f1ad58f159b27`. Consume finite locally free sheaves, locally constant rank, rank-one invertible sheaves, tensor/dual/pullback and the affine finite-projective equivalence from current main; no duplicate sheaf foundations in SF.0.

**Needed by:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [DM.3/modular-forms](#dm-3-modular-forms); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.7/elliptic-sheaf](#dm-7-elliptic-sheaf); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf); [DM.7/shtuka-export](#dm-7-shtuka-export).

**[TauCetiRoadmap AlgebraicVectorBundles l2b--geometric-vector-bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md#l2b--geometric-vector-bundles)**, commit `0d144d044dacebca17b654695b6f1ad58f159b27`. Consume totalSpace(E)=linearSpec(E∨), its section-valued universal property and its vector-bundle/pullback compatibility. Retain the dual convention when identifying line-bundle sections with additive-group points.

**Needed by:** [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [DM.4/t-module](#dm-4-t-module); [DM.4/contravariant-motive](#dm-4-contravariant-motive).

**Current Tau Ceti**, commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Fitting ideals of finite modules over a commutative ring, independent of finite free presentation and commuting with arbitrary algebra base change. These postdate the pins; DM.6 adds only the monic generator/characteristic-polynomial comparison.

- [TauCeti/RingTheory/FittingIdeal/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/FittingIdeal/Basic.lean)
- [TauCeti/RingTheory/FittingIdeal/BaseChange.lean](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/FittingIdeal/BaseChange.lean)

**Declarations:** `TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, `TauCeti.fittingIdeal_baseChange`.

**Needed by:** [DM.6/fitting-polynomial](#dm-6-fitting-polynomial).

**Current Tau Ceti**, commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At a positive radius over a complete ultrametric normed field: unique Weierstrass preparation for a restricted distinguished series, the degree-zero unit criterion and the principal-ideal-ring theorem. The complete ring version additionally requires multiplicative norm and a unit distinguished coefficient. These postdate the pins; only C∞ analytic comparisons and zero/growth estimates are additional targets.

- [TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean)
- [TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean)

**Declarations:** `TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`, `TauCeti.PowerSeries.isUnit_iff_isDistinguished_zero_and_isUnit_coeff_zero`, `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`.

**Needed by:** [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface).

## Ownership and restructuring

**RT-AREA-finitefields/13.** FF.4 remains sole owner of q-linearized polynomials and the Frobenius Ore comparison; DM.0 imports its existing node identifiers and adds only Drinfeld structure. No duplicate additive-polynomial construction is added.

**Analytic twist and Ω.** DM.8 owns both, retaining stable ids DM.8/coefficient-twist and DM.2/omega. DM.4 uses algebraic inverseFrobeniusEquiv directly. Sibling Part II uses must preserve π\_N=−π\_P and the (−1)^w period-power adapter; relocation requires maintainer alignment.

**Current upstream verification.** Imports are verified at current roadmap commit 0d144d044dacebca17b654695b6f1ad58f159b27 and library a91d3aa. The two additional analytic roadmaps asserted by the older assembly are not present in the supplied current checkout and are not cited as verified owners.

The existing FF.4 Ore/composition theory is the single owner. Maurischat’s newly collated abelian/A-finite proof additionally requires generic valued-skew-field normal forms and Newton decomposition absent from its four reviewed nodes. FiniteFieldsAndCharacterSums, Part II extends FF.4 with the complete valued-skew-field invariant-factor, Newton-decomposition and block-rank criterion of Maurischat §§3–4. DM.4 imports that extension and retains only the Anderson-module comparison. No new Drinfeld owner of Ore theory is introduced.

The whole-roadmap contracts preserve the stable IDs of the accepted parts. Their changes to mathematical ownership and prerequisites require the promotion reconciliation recorded in the packet and handoff. The existing part files and sibling routes retain their historical text until the maintainer applies that reconciliation.

## Suggested file

The [Suggested file](../suggested/DrinfeldModulesAndTModules.lean) states six light definitions over existing native carriers, nine milestone theorems, and ten proved examples. Its definitions are the Carlitz bracket, D, ℓ, exponential, logarithm and coefficient-map twist. Its milestones cover the denominator recurrences, Carlitz convergence and functional identities, fixed-vector independence and dimension, fundamental-matrix uniqueness and the constant-denominator theorem. Heavy scheme, module, motive-category and specialized analytic-ring constructions are fully specified in this reader.

## Coverage and acceptance

### DM.0 — planned

**Targets:** [DM.0/carlitz-module](#dm-0-carlitz-module); [DM.0/carlitz-products](#dm-0-carlitz-products); [DM.0/drinfeld-module](#dm-0-drinfeld-module); [DM.0/drinfeld-module-hom](#dm-0-drinfeld-module-hom); [DM.0/isogeny-rank](#dm-0-isogeny-rank); [DM.0/kernel-scheme](#dm-0-kernel-scheme); [DM.0/rank](#dm-0-rank); [DM.0/rank-general](#dm-0-rank-general); [DM.0/rank-polynomial-ring](#dm-0-rank-polynomial-ring); [DM.0/relative-drinfeld-module](#dm-0-relative-drinfeld-module); [DM.0/relative-standardization](#dm-0-relative-standardization).

**Remaining closure work.**

- General rank integrality: Establish that a non-scalar field Drinfeld action has integral positive proportionality factor deg\_τ φ\_a/deg\_A(a). The displayed valuation proportionality alone gives a rational number. Use the finite projective A\_L-module route of Hartl Theorem 3.9, or inspect a full direct integrality proof, without assuming the rank definition as its proof.
- Nilpotent-base standardization: Hartl Lemma 3.8(a), p. 10, cites Drinfeld and Matignon for the unique normalized nonlinear Ore conjugation. Inspect that proof or give the finite nilpotent-induction argument. The current pass establishes the exact statement and its distinction from linear frame change.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge: Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus: Consume divisors, L(D), divisor/fractional-ideal comparison and normalized residue-degree degree formulas. In particular deg\_A(a)=−deg(∞)ord\_∞(a).
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

### DM.1 — planned

**Targets:** [DM.1/characteristic-local-realization](#dm-1-characteristic-local-realization); [DM.1/continuous-galois-action](#dm-1-continuous-galois-action); [DM.1/etale-torsion](#dm-1-etale-torsion); [DM.1/finite-flat-torsion](#dm-1-finite-flat-torsion); [DM.1/geometric-torsion-basis](#dm-1-geometric-torsion-basis); [DM.1/ideal-torsion](#dm-1-ideal-torsion); [DM.1/tate-module](#dm-1-tate-module).

**Remaining closure work.**

- Strict finite F-module / finite-shtuka realization: SF.2 plans sites and cohomology, not this anti-equivalence. The missing shared input is the category of finite locally free shtukas (N,τ:σ\*N→N), strict finite F-module schemes with their deformation action, Dr\_q and its inverse, exactness, the étale criterion, co-Lie identification and the torsion evaluation pairing. Read Hartl Definitions 4.1–4.2, pp. 12–13, Definition 4.5, pp. 13–14 and Theorem 4.7, pp. 14–15. Route the shared theory to SchemeAndStackFoundations, Part II; until that owner is planned, this is a gap, not an SF.2 theorem.
- Equal-characteristic effective local-shtuka input: HS2 uses the Fargues–Fontaine setting and does not supply Hartl’s equal-characteristic category. Needed are locally free R\[\[z\]\]-modules, σhat-linearization, inversion of z−γ(z), effective cokernel bounds and the finite-flat characteristic torsion comparison, with the compatible F\_p-algebra embedding and τ^deg(p) on the characteristic factor. See Hartl Definition 7.1 and Example 7.2, p. 27, Theorems 7.4 and 7.6, p. 28. Request an equal-characteristic Part II of HeckeStacksAndLocalShtukas or an explicit single-owner reassignment; no fabricated supplier stage is cited.
- Finite étale torsion bases and compatible limits: The abelian-sheaf/Galois comparison in SF.2 is not the strict-group theorem or a basis theorem. Supply the Frobenius/Lang solution argument for a finite étale shtuka over a separably closed field, with residue-field factors, A/a-module freeness of rank r, and compatible lifts for a nonprincipal prime-adic inverse system. Hartl Proposition 6.5 and Theorem 6.6, p. 26 give the exact torsion statements. The finite-shtuka realization and the nonprincipal inverse-limit argument must both be available.
- Completed coefficient and analytic quotient interfaces: AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge: Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus: Consume divisors, L(D), divisor/fractional-ideal comparison and normalized residue-degree degree formulas. In particular deg\_A(a)=−deg(∞)ord\_∞(a).
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

### DM.2 — planned

**Targets:** [DM.2/a-lattice](#dm-2-a-lattice); [DM.2/c-infinity](#dm-2-c-infinity); [DM.2/carlitz-exponential](#dm-2-carlitz-exponential); [DM.2/carlitz-period](#dm-2-carlitz-period); [DM.2/exponential-morphisms](#dm-2-exponential-morphisms); [DM.2/lattice-drinfeld-module](#dm-2-lattice-drinfeld-module); [DM.2/lattice-exponential](#dm-2-lattice-exponential); [DM.2/period-power](#dm-2-period-power); [DM.2/uniformization](#dm-2-uniformization).

**Remaining closure work.**

- Analytic surjectivity and general-A kernel rank: The BP survey states Theorem 2.1 but does not provide the complete nonarchimedean zero/surjectivity and general-A projective kernel-rank proof. The requested AdicSpaces analytic input and a full uniformization proof must discharge these steps. Finite-subspace products, normalization and the exponential recurrence are specified.
- Completed coefficient and analytic quotient interfaces: AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.
- tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras: Import AdicSpaces Layer 0 §§0.4–0.5 restricted-series topology, evaluation and Weierstrass theory and the verified current Tau Ceti preparation/unit/principal-ideal results. The additional analytic contract is: on complete algebraically closed nonarchimedean C∞, convergent locally finite normalized products define entire functions with exactly their prescribed zeros; nonzero restricted series have finite disk zero divisors and normalized unit factors; for the ABP N prescribed zeros, Schwarz–Jensen yields |λ\_N||θ|^(N−q/(q−1))≤sup\_(|z|≤|θ|)|E\_N(z)|. General Tate algebras are already owned upstream; these extra entire-product and zero/growth exports extend that owner as AdicSpaces, Part II if beyond its current Layer 0.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge: Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

### DM.3 — planned

**Targets:** [DM.3/fine-moduli-scheme](#dm-3-fine-moduli-scheme); [DM.3/generalized-drinfeld-module](#dm-3-generalized-drinfeld-module); [DM.3/hecke-correspondence](#dm-3-hecke-correspondence); [DM.3/integral-compactification](#dm-3-integral-compactification); [DM.3/level-structure](#dm-3-level-structure); [DM.3/modular-forms](#dm-3-modular-forms); [DM.3/moduli-functor](#dm-3-moduli-functor); [DM.3/reciprocal-compactification](#dm-3-reciprocal-compactification); [DM.3/satake-compactification](#dm-3-satake-compactification).

**Remaining closure work.**

- Reciprocal-ring normality proof input: Hartl–Yu Proposition 3.11 imports Pink–Schieder Theorems 1.9 and 1.11 for the normality of the reciprocal Proj seed. Inspect those proofs or establish the stated normality in the supplier. The arithmetic extension/gluing and finite-quotient route of Hartl–Yu Theorem 3.2 has been read.
- Fine moduli chart and deformation proof: Hartl–Yu Theorem 2.3 states good-open affine smooth representability and cites Drinfeld §5 for the principal-level chart and infinitesimal deformation argument. The fine-subgroup extension in Proposition 2.8 has been read; a full chart/deformation proof remains an exact input to the Drinfeld-specific moduli target, using exact SF.1 descent/quotient inputs and the stated stack consequence.
- Projective finite quotients and section-ring comparison: The cited SF.0 normalization theorem requires a qcqs reduced Nagata base and finite generic algebra; A and finite-type A-schemes meet this through excellent-examples. SF.1/finite-group-quotient requires every orbit to lie in an affine open and supplies the scheme quotient, not all normal/projective descent claims. Supply the ample-line-bundle norm/descent argument for finite constant-group quotients and the normal integral graded section-ring/Proj comparison used by Pink Theorem 4.2, pp. 14–16 and Theorem 5.7, p. 21. SF.2/ample-serre-vanishing supplies finiteness and eventual vanishing under proper Noetherian ample hypotheses, not this entire comparison. These extensions belong to SchemeAndStackFoundations, Part II.

### DM.4 — planned

**Targets:** [DM.4/abelian-antiequivalence](#dm-4-abelian-antiequivalence); [DM.4/carlitz-tensor-power](#dm-4-carlitz-tensor-power); [DM.4/contravariant-motive](#dm-4-contravariant-motive); [DM.4/dual-realization](#dm-4-dual-realization); [DM.4/effective-a-motive](#dm-4-effective-a-motive); [DM.4/inverse-twist-dual-motive](#dm-4-inverse-twist-dual-motive); [DM.4/pre-t-motive](#dm-4-pre-t-motive); [DM.4/pre-t-motive-rigidity](#dm-4-pre-t-motive-rigidity); [DM.4/purity](#dm-4-purity); [DM.4/rationalization](#dm-4-rationalization); [DM.4/star-adapter](#dm-4-star-adapter); [DM.4/t-module](#dm-4-t-module); [DM.4/uniformizability](#dm-4-uniformizability).

**Remaining closure work.**

- Valued-skew-field proof inputs: Theorem 4.1 and §6 of Maurischat have been inspected, but the left/right invariant-factor and Newton-decomposition proofs in §3 remain to be read and implemented by the future shared valued-skew-algebra supplier (FiniteFieldsAndCharacterSums, Part II; no such stage is claimed to exist). The perfect-field abelian iff A-finite statement is planned using the exact positive-slope criterion, without treating the generic Ore adapter as its proof.
- Completed coefficient and analytic quotient interfaces: AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.
- tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras: Import AdicSpaces Layer 0 §§0.4–0.5 restricted-series topology, evaluation and Weierstrass theory and the verified current Tau Ceti preparation/unit/principal-ideal results. The additional analytic contract is: on complete algebraically closed nonarchimedean C∞, convergent locally finite normalized products define entire functions with exactly their prescribed zeros; nonzero restricted series have finite disk zero divisors and normalized unit factors; for the ABP N prescribed zeros, Schwarz–Jensen yields |λ\_N||θ|^(N−q/(q−1))≤sup\_(|z|≤|θ|)|E\_N(z)|. General Tate algebras are already owned upstream; these extra entire-product and zero/growth exports extend that owner as AdicSpaces, Part II if beyond its current Layer 0.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge: Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.
- Historical-contract promotion and sibling ownership alignment: The 123 reused targets remain owned by the two accepted part packets. importChecks gives their complete reconciled mathematical contracts, including removal of obsolete suggestedInterface claims. The reader uses those contracts together with the 11 new nodes. The automatic promoter does not rewrite the historical part packets from this metadata: the maintainer must apply dependencyReconciliation, parentReconciliation and the changed statement/proof/API/source contracts before treating the promoted whole-roadmap graph as reconciled. The Omega and analytic-twist ownership moves follow this issue and still require alignment with the sibling Part II routes; no prior maintainer agreement is claimed.

### DM.5 — planned

**Targets:** [DM.5/local-algebraization](#dm-5-local-algebraization); [DM.5/period-ring](#dm-5-period-ring); [DM.5/rational-motive-realization](#dm-5-rational-motive-realization); [DM.5/tate-hom-map](#dm-5-tate-hom-map); [DM.5/tate-image-saturation](#dm-5-tate-image-saturation); [DM.5/tate-injectivity](#dm-5-tate-injectivity); [DM.5/tate-semisimplicity](#dm-5-tate-semisimplicity); [DM.5/tate-surjectivity](#dm-5-tate-surjectivity).

**Remaining closure work.**

- Integral Tate image saturation: Stalder Proposition 5.16(a), preprint p. 34 and published p. 588, asserts saturation as known. Supply the exact integral argument: λ-divisibility of a realized Hom map descends to divisibility in Hom\_A(E,F), using finite-shtuka torsion and the quotient isogeny; retain nonprincipal λ. Rational full faithfulness is proved by the inspected period-ring route.
- Drinfeld semisimple-motive input: Stalder Theorem 1.1 assumes a semisimple A-isomotive. Prove that the rational motive of a field Drinfeld module is simple, or inspect the precise reference supplying it, before deducing unconditional semisimplicity of its point Tate representation.
- Strict finite F-module / finite-shtuka realization: SF.2 plans sites and cohomology, not this anti-equivalence. The missing shared input is the category of finite locally free shtukas (N,τ:σ\*N→N), strict finite F-module schemes with their deformation action, Dr\_q and its inverse, exactness, the étale criterion, co-Lie identification and the torsion evaluation pairing. Read Hartl Definitions 4.1–4.2, pp. 12–13, Definition 4.5, pp. 13–14 and Theorem 4.7, pp. 14–15. Route the shared theory to SchemeAndStackFoundations, Part II; until that owner is planned, this is a gap, not an SF.2 theorem.
- Completed coefficient and analytic quotient interfaces: AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

### DM.6 — planned

**Targets:** [DM.6/carlitz-class-examples](#dm-6-carlitz-class-examples); [DM.6/class-module](#dm-6-class-module); [DM.6/class-number-formula](#dm-6-class-number-formula); [DM.6/euler-l-value](#dm-6-euler-l-value); [DM.6/fitting-polynomial](#dm-6-fitting-polynomial); [DM.6/integral-model](#dm-6-integral-model); [DM.6/lattice-covolume](#dm-6-lattice-covolume); [DM.6/nuclear-determinant](#dm-6-nuclear-determinant); [DM.6/small-power-sum](#dm-6-small-power-sum); [DM.6/tangent-comparison](#dm-6-tangent-comparison); [DM.6/tangent-determinant](#dm-6-tangent-determinant); [DM.6/trace-formula](#dm-6-trace-formula); [DM.6/unit-lattice](#dm-6-unit-lattice).

**Remaining closure work.**

- Completed coefficient and analytic quotient interfaces: AlgebraicCurves Layer 5 supplies normalized DVR completions and uniformizer/residue compatibility. The remaining integration includes finite-residue coefficient sections and Laurent coordinates, decomposition after tensoring with coefficient fields, the induced extending norm on an algebraic closure, nonprincipal A\_λ inverse-limit scalar actions, and compact quotients/lattice coordinates for the finite product of infinity completions. These are exact adapters to existing completion, finite-normalization and restricted-product theory, not a request to rebuild FA.1 or FA.2. Record any extension beyond the current owners as their Part II.
- tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs: Import the shared Fitting-ideal presentation and base-change theory already in current Tau Ceti (a91d3aaf), as used by StableReduction and IntegralHeckeAndGaloisDeterminants. At the older pinned build these declarations are absent. DM.6 adds only the characteristic-polynomial/monic-generator comparison for finite F\[t\]-modules, and must not re-plan the generic Fitting ideal.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge: Consume finite normalization over F\[t\], the Dedekind affine/holomorphy-ring bridge, and place/prime/residue equivalences. Apply the RR choice of a nonconstant function with only an infinity pole to identify A=Γ(C−∞,O\_C), finite quotients and finite integral extensions; do not re-plan these in FA.1.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components: Consume RR consequences and normalized completions of place DVRs, including the valuation ring, maximal ideal, residue field and chosen-uniformizer compatibility. Extra coefficient splittings, norm extensions and quotient-chart integration remain an explicit gap.

### DM.7 — planned

**Targets:** [DM.7/characteristic-comparison](#dm-7-characteristic-comparison); [DM.7/drinfeld-to-sheaf](#dm-7-drinfeld-to-sheaf); [DM.7/elliptic-antiequivalence](#dm-7-elliptic-antiequivalence); [DM.7/elliptic-sheaf](#dm-7-elliptic-sheaf); [DM.7/normalized-elliptic-sheaf](#dm-7-normalized-elliptic-sheaf); [DM.7/shtuka-export](#dm-7-shtuka-export); [DM.7/tate-realization](#dm-7-tate-realization).

**Remaining closure work.**

- Elliptic-chain morphism category: Wiedmann Theorem 5.10 and proof use an equivalence convention with affine-module morphisms. Reconcile it fully with the bounded-shift chain morphisms and the contravariant Hom(E,G\_a) convention stated here. The object construction, infinity projectivity/gluing, normalized cohomology and inverse line have been read. At a non-rational infinity point, verify the residue-factor/descent normalization of each length-one quotient in the degree filtration, including how Frobenius permutes the factors, before claiming the unrestricted relative correspondence. The period rδ and the pushforward-to-S line condition are explicit, rather than replacing infinity by a rational leg.
- Strict finite F-module / finite-shtuka realization: SF.2 plans sites and cohomology, not this anti-equivalence. The missing shared input is the category of finite locally free shtukas (N,τ:σ\*N→N), strict finite F-module schemes with their deformation action, Dr\_q and its inverse, exactness, the étale criterion, co-Lie identification and the torsion evaluation pairing. Read Hartl Definitions 4.1–4.2, pp. 12–13, Definition 4.5, pp. 13–14 and Theorem 4.7, pp. 14–15. Route the shared theory to SchemeAndStackFoundations, Part II; until that owner is planned, this is a gap, not an SF.2 theorem.
- Equal-characteristic effective local-shtuka input: HS2 uses the Fargues–Fontaine setting and does not supply Hartl’s equal-characteristic category. Needed are locally free R\[\[z\]\]-modules, σhat-linearization, inversion of z−γ(z), effective cokernel bounds and the finite-flat characteristic torsion comparison, with the compatible F\_p-algebra embedding and τ^deg(p) on the characteristic factor. See Hartl Definition 7.1 and Example 7.2, p. 27, Theorems 7.4 and 7.6, p. 28. Request an equal-characteristic Part II of HeckeStacksAndLocalShtukas or an explicit single-owner reassignment; no fabricated supplier stage is cited.
- tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus: Consume divisors, L(D), divisor/fractional-ideal comparison and normalized residue-degree degree formulas. In particular deg\_A(a)=−deg(∞)ord\_∞(a).
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree: Consume line bundles, divisor twists and their degree on smooth proper curves; use the current divisor-to-invertible-sheaf interface in the infinity chain.
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Consume curve Riemann–Roch, Serre duality and H^0=L(D) comparisons for smooth proper geometrically connected curves. The pinned library already supplies finite-dimensional divisor spaces and high-degree Riemann–Roch. Export the exact-constant-field and all-conjugate infinity-norm bridge for a finite separable K0/F\_q(θ): with full constants k0 of degree f and D∞=Σe\_v v, identify the integral size ball with L(nD∞), and prove f deg\_(k0)D∞=\[K0:k\]. This is a place/divisor normalization adapter to AlgebraicCurves/FA.1, not another Riemann–Roch theorem. Transport the curve and section spaces under coefficient Frobenius only for the relative-algebraic-closure use.
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change: Consume proper flat finitely presented coherent cohomology/base change and semicontinuity under their actual hypotheses, to prove the normalized elliptic-chain pushforward line and cohomology statements.

### DM.8 — planned

**Targets:** [DM.2/omega](#dm-2-omega); [DM.8/abp-auxiliary](#dm-8-abp-auxiliary); [DM.8/abp-auxiliary-zero](#dm-8-abp-auxiliary-zero); [DM.8/abp-count](#dm-8-abp-count); [DM.8/abp-estimates](#dm-8-abp-estimates); [DM.8/abp-lifting](#dm-8-abp-lifting); [DM.8/abp-liouville](#dm-8-abp-liouville); [DM.8/abp-polynomial-siegel](#dm-8-abp-polynomial-siegel); [DM.8/abp-siegel](#dm-8-abp-siegel); [DM.8/abp-size](#dm-8-abp-size); [DM.8/admissible-fields](#dm-8-admissible-fields); [DM.8/analytic-fixed-fields](#dm-8-analytic-fixed-fields); [DM.8/analytic-separability](#dm-8-analytic-separability); [DM.8/anderson-comparison](#dm-8-anderson-comparison); [DM.8/betti-comparison-dimension](#dm-8-betti-comparison-dimension); [DM.8/betti-comparison-injective](#dm-8-betti-comparison-injective); [DM.8/betti-exact-tensor](#dm-8-betti-exact-tensor); [DM.8/carlitz-deformation](#dm-8-carlitz-deformation); [DM.8/carlitz-group](#dm-8-carlitz-group); [DM.8/carlitz-logarithm-independence](#dm-8-carlitz-logarithm-independence); [DM.8/coefficient-twist](#dm-8-coefficient-twist); [DM.8/comparison-algebra](#dm-8-comparison-algebra); [DM.8/constant-denominator](#dm-8-constant-denominator); [DM.8/degree-span](#dm-8-degree-span); [DM.8/difference-invariants](#dm-8-difference-invariants); [DM.8/difference-smooth-dimension](#dm-8-difference-smooth-dimension); [DM.8/difference-torsor](#dm-8-difference-torsor); [DM.8/entire-from-equation](#dm-8-entire-from-equation); [DM.8/entire-series](#dm-8-entire-series); [DM.8/finite-fixed-independence](#dm-8-finite-fixed-independence); [DM.8/fixed-basis-coordinates](#dm-8-fixed-basis-coordinates); [DM.8/fixed-coefficients](#dm-8-fixed-coefficients); [DM.8/fixed-dimension-bound](#dm-8-fixed-dimension-bound); [DM.8/fixed-independence](#dm-8-fixed-independence); [DM.8/fixed-space-finite](#dm-8-fixed-space-finite); [DM.8/fixed-span-descent](#dm-8-fixed-span-descent); [DM.8/fundamental-betti-basis](#dm-8-fundamental-betti-basis); [DM.8/fundamental-matrix](#dm-8-fundamental-matrix); [DM.8/integral-trivialization](#dm-8-integral-trivialization); [DM.8/invariant-ideal-descent](#dm-8-invariant-ideal-descent); [DM.8/logarithm-division](#dm-8-logarithm-division); [DM.8/logarithm-group-linear](#dm-8-logarithm-group-linear); [DM.8/logarithm-linear-relations](#dm-8-logarithm-linear-relations); [DM.8/logarithm-matrices](#dm-8-logarithm-matrices); [DM.8/logarithm-motive-membership](#dm-8-logarithm-motive-membership); [DM.8/neutral-category](#dm-8-neutral-category); [DM.8/period-transcendence](#dm-8-period-transcendence); [DM.8/relative-algebraic-closure](#dm-8-relative-algebraic-closure); [DM.8/rigid-triviality](#dm-8-rigid-triviality); [DM.8/solution-invariant-ideal-descent](#dm-8-solution-invariant-ideal-descent); [DM.8/solution-ring](#dm-8-solution-ring); [DM.8/solution-ring-simple](#dm-8-solution-ring-simple); [DM.8/solution-space](#dm-8-solution-space); [DM.8/specialization-rank](#dm-8-specialization-rank); [DM.8/tannakian-identification](#dm-8-tannakian-identification); [DM.8/tate-analytic-interface](#dm-8-tate-analytic-interface); [DM.8/twisting-limit](#dm-8-twisting-limit).

**Remaining closure work.**

- Particular Carlitz kernel separability: PAP Proposition6.2.3 invokes a Lie-algebra surjectivity verification for the particular scalar-action logarithm group. A general smooth group surjection need not be separable. The plan states the exact scalar-action theorem and records this verification before inferring a smooth linear kernel; no generic smoothness inference is used.
- Analytic and dimension supplier matching: Instantiate the pinned restricted-series carrier at C∞; import current Tau Ceti Weierstrass preparation, unit detection and the principal-ideal result through AdicSpaces Layer 0. The C∞ normalized zero/pole comparison, entire-product zeros and bounded-disk Schwarz–Jensen estimate remain precise additional contracts. FA.0 general separability, curve transport and Lang base extension and the SF.0 filtered-growth export remain requested. RestrictedPowerSeries and NewtonPolygons are absent from the supplied current-main checkout, so no unverified roadmap import terminates these chains.
- Anderson analytic comparison proof: The statement of BP-RAPID Theorem 4.2 p.16 and the dual formulation PAP §1.1.4 p.2 were read. The original proof in Anderson, t-Motives, Duke Math. J. 53 (1986), Theorem 4, pp.457–502, has not been inspected. Supply its exponential-sequence/Betti comparison argument, including the precise lattice-to-invariant-basis map, before closing DM.8/anderson-comparison. This is a source-proof gap, not permission to infer uniformizability for all broad effective dual motives.
- tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras: Import AdicSpaces Layer 0 §§0.4–0.5 restricted-series topology, evaluation and Weierstrass theory and the verified current Tau Ceti preparation/unit/principal-ideal results. The additional analytic contract is: on complete algebraically closed nonarchimedean C∞, convergent locally finite normalized products define entire functions with exactly their prescribed zeros; nonzero restricted series have finite disk zero divisors and normalized unit factors; for the ABP N prescribed zeros, Schwarz–Jensen yields |λ\_N||θ|^(N−q/(q−1))≤sup\_(|z|≤|θ|)|E\_N(z)|. General Tate algebras are already owned upstream; these extra entire-product and zero/growth exports extend that owner as AdicSpaces, Part II if beyond its current Layer 0.
- tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality: Consume curve Riemann–Roch, Serre duality and H^0=L(D) comparisons for smooth proper geometrically connected curves. The pinned library already supplies finite-dimensional divisor spaces and high-degree Riemann–Roch. Export the exact-constant-field and all-conjugate infinity-norm bridge for a finite separable K0/F\_q(θ): with full constants k0 of degree f and D∞=Σe\_v v, identify the integral size ball with L(nD∞), and prove f deg\_(k0)D∞=\[K0:k\]. This is a place/divisor normalization adapter to AlgebraicCurves/FA.1, not another Riemann–Roch theorem. Transport the curve and section spaces under coefficient Frobenius only for the relative-algebraic-closure use.
- MotivesAndAlgebraicCycles:MC.6: Reuse the existing arbitrary-field MC.6/neutral-tannaka-reconstruction and tannaka-finiteness-recognition nodes, and tensor-iso-torsor after transporting along reconstruction. The remaining exports are: formation of the strictly full tensor subcategory generated by a family; for a compatible exact tensor functor between neutral categories, full faithfulness plus closure of its image under subobjects iff the induced group map is faithfully flat, and tensor generation of the target iff it is a closed immersion; and the computation of the tensor-automorphism group of integer-weight graded finite-dimensional F-vector spaces as G\_m. State these over any field F, including imperfect F\_q(t). The existing diagram-specific pro-algebraic-approximation and characteristic-zero connectedness criterion are insufficient for these remaining uses. Do not reconstruct an already planned neutral group again.
- FunctionFieldArithmetic:FA.0: Supply the chosen rational function field F\_q(θ), exact constant field and its infinite-place normalization, and the smooth projective curve corresponding to a finite separable extension of the one-variable field over the perfect constant field bar(k). Export compatibility of the field/curve correspondence with the coefficient Frobenius automorphism, as needed in Papanikolas Proposition 4.3.3. Keep the analytic completion at DM.2 and the difference-field constant calculation at DM.8. For arbitrary field extensions, supply the equivalence of separability with native geometric reducedness and the characteristic-p p-basis/linear-disjointness criterion. Algebra.IsSeparable is algebraic separability and must not replace this general extension property. Import current TauCetiRoadmap ReductiveGroupsPartII RG2.3.7 Lang.lang\_surjective and export its semilinear GL\_r matrix specialization; the general Lang theorem is already owned upstream. The current Lang.lang\_surjective Lean signature is on AlgebraicClosure F for finite F. Before applying it to a matrix with entries in bar(k), export surjectivity of the Lang morphism after base extension to that larger algebraically closed field and derive the inverse-Frobenius GL\_r matrix normalization there. Its entries need not be algebraic over F\_q.
- SchemeAndStackFoundations:SF.3: Reuse SF.3/line-bundle-degree-bounds, which imports JacobianChallenge Riemann–Roch: on a smooth projective geometrically connected curve over bar(k), a sufficiently large effective divisor above infinity gives finite-dimensional L(D) containing any chosen finite set of field generators. The additional export is functorial transport of the curve, divisor and section space by the coefficient automorphism for Papanikolas Proposition 4.3.3. Generic Riemann–Roch remains with AlgebraicCurves/JacobianChallenge.
- SchemeAndStackFoundations:SF.0: Reuse SF.0/algebraic-scheme-dimension for finite-type domain dimension versus fraction-field transcendence degree and invariance under field extension. Supply the remaining filtered growth form: for a finitely generated domain A=k\[a\_1,...,a\_n\], with A\_≤d the k-span of generator monomials of total degree at most d, dim\_k A\_≤d is eventually a polynomial in d of degree trdeg\_k Frac(A), with positive leading coefficient; include A=k, whose polynomial is the constant 1. Thus equality of these dimensions for all d implies equality of transcendence degrees even when the coefficient fields differ. This generic commutative-algebra dimension interface belongs with SF.0, not the SF.1 descent layer. It does not require extending the motives or moduli roadmaps.
- FunctionFieldArithmetic:FA.1: For DM.8/abp-count, reuse the global-place theory and export the finite-separable-extension adapter: full finite constant field k0, infinity places with ramification indices e\_v and residue degrees, D∞=Σe\_v v and \[k0:F\_q\]deg\_(k0)D∞=\[K0:F\_q(θ)\], and the equivalence between all-conjugate size≤q^n and the corresponding infinity pole bounds. The finite normalization/Dedekind and divisor-space carriers are imported from AlgebraicCurves Layers 2–3 and pinned Tau Ceti.
- Historical-contract promotion and sibling ownership alignment: The 123 reused targets remain owned by the two accepted part packets. importChecks gives their complete reconciled mathematical contracts, including removal of obsolete suggestedInterface claims. The reader uses those contracts together with the 11 new nodes. The automatic promoter does not rewrite the historical part packets from this metadata: the maintainer must apply dependencyReconciliation, parentReconciliation and the changed statement/proof/API/source contracts before treating the promoted whole-roadmap graph as reconciled. The Omega and analytic-twist ownership moves follow this issue and still require alignment with the sibling Part II routes; no prior maintainer agreement is claimed.
