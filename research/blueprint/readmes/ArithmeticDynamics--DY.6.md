# Arithmetic dynamics — DY.6: families and intersections, follow-up

This supplement completes the target-level planning pass for DY.6. It builds on the accepted [ArithmeticDynamics packet](../packets/ArithmeticDynamics.json), its [reader document](ArithmeticDynamics.md), and its [suggested statements](../suggested/ArithmeticDynamics.lean). Those supply the inherited objects, APIs, tests and endpoints. The import manifest below retains every one of their 93 DY.6 nodes by its original id. This document supplies the outstanding primitive-presentation and transport contracts, specialization over a general curve, and the key proof inputs needed by the recorded frontier targets.

The stage is **planned**, with explicit supplier requests and proof gaps, and is not closed. Every declaration has implementation status **unchecked**. The companion [Lean file](../suggested/ArithmeticDynamics--DY.6.lean) gives end statements readily expressed using existing carriers; the reader gives the complete contracts, including the heavy objects whose formalization remains roadmap work.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current upstream TauCetiRoadmap main and its Tau Ceti library were also screened. Existing abelian and elliptic height APIs are imported. The upstream Completed EffectiveBounds and Multiquadratic documents supply style examples; the relevant LocalFieldsRamification and PolynomialGaloisGroups contracts were inspected for overlap. The nine post-snapshot roadmap areas were screened. No existing implementation of the new family, embedding or classification targets was found.

## Conventions and assembly

A finite marked family need not generate its field and may include zero. In the Lech presentation, A=ℤ[T₁,…,Tₙ], F=Frac(A), and H,U are polynomials in the separate primitive variable Y. Parameter denominators V belong to A. H is generically irreducible and separable, and need not be monic over A. The independent parameter evaluation identifies F with ℚ(t₁,…,tₙ).

Arithmetic heights are absolute under finite extensions. Generic heights on a curve use the geometric degree normalization, with constants of height zero. On the inherited elliptic API, the absolute Néron–Tate height is the Tau Ceti relative height divided by the field degree; its normalization is half the limiting x-coordinate height. Keep the factor two in the inherited Lattès comparison. Iterates below mean composition.

The supplemental nodes all belong to `ArithmeticDynamics:DY.6` and have ids beginning `ArithmeticDynamics:DY.6/followup-`. Assemble their union with the accepted base; do not replace the base packet or reallocate its six planets. Only the two Lech gap leaves are discharged at planning level. New targets ending in a supplier request or recorded gap remain conditional on that supplier or gap.

| Inherited target or gap | Follow-up route |
| --- | --- |
| Lech integral and unit embeddings; localized coefficient model | Integral primitive presentation → primitive-root transport → accepted independent Hensel specialization → integral assembly. |
| Completed local p-adic coordinates and étale DML | Relative unramified Cohen adapter; import SF.0 spreading-out-models for the pointed integral model. |
| Canonical-height specialization; GTZ nonpreperiodic specialization | General-curve/global-height-field specialization, with the exact RP.0 uniform-height and intersection contracts. |
| Polynomial variation, including generic height zero | Benedetto zero-height criterion and the local open-disc covering input. |
| Constant torsion images and torsion specialization sets | Rational-mark degree growth gives the four persistent moving marks; its constant consequence gives three. Distinct torsion-parameter infinitude additionally needs the activity/Montel bridge. |
| Cusp measures and normalized potentials | Separate uniform hybrid potential and weak measure-limit targets, with a precise TB.0 model-function/measure request. |
| Critical height as a moduli height | Finite multiplier spectrum, affine-torus Lattès classification, rigid finiteness, bounded representatives, whole-locus height comparison, quantitative attracting branch values. |
| Polynomial orbits on lines | Equal-degree Bilu–Tichy input, Ritt equal-iterate input, Benedetto/general-curve specialization, and the separately imported DT.2 linear-case input. |
| Tate bounded variation | Retain its O(1) parameter-divisor contract and proof-access gap; the specialization limit does not replace it. |

## Retained frontier endpoints

The six existing planets remain attached to their accepted nodes. Their complete contracts, APIs and tests remain in the base reader and packet:

### Lattès map

**Imported id:** `ArithmeticDynamics:DY.6/lattes-map`.

Let F be a field, E a Weierstrass curve over F (Mathlib WeierstrassCurve) with discriminant Δ(E) ≠ 0, and n ∈ ℤ with n ≠ 0. The Lattès map f_{E,n} : ℙ¹_F → ℙ¹_F is the rational map (DY.0/rational-map-of-the-projective-line) given by the forms (Φ_n^h(X, Z), ΨSq_n^h(X, Z)), the homogenisations in degree n² (Mathlib Polynomial.homogenize) of Mathlib's division polynomials WeierstrassCurve.Φ n and WeierstrassCurve.ΨSq n. In the affine coordinate x it is x ↦ Φ_n(x)/ΨSq_n(x), with f_{E,n}(x) = ∞ when ΨSq_n(x) = 0 and f_{E,n}(∞) = ∞. It is the descent of [n] : E → E through the x-coordinate x : E → ℙ¹ (the quotient by P ↦ −P, with x(O) = ∞): f_{E,n} ∘ x = x ∘ [n] (DY.6/lattes-map-semiconjugacy). For \|n\| ≥ 2 it has degree n².

### Call–Silverman specialization theorem

**Imported id:** `ArithmeticDynamics:DY.6/specialization-of-canonical-heights`.

Let K be a number field, f a rational map of degree d ≥ 2 over K(t) with good set T⁰(f) (DY.6/specialization-of-rational-maps), and P ∈ ℙ¹(K(t)). Let ĥ^{K(t)}_f be the canonical height of f over K(t) (DY.1/canonical-height-over-a-global-height-field with the degree height of DY.6/rational-function-field-heights) and ĥ_{f_{t₀}} the absolute canonical height of the specialisation (DY.1/canonical-height-on-the-projective-line). Then ĥ_{f_{t₀}}(P_{t₀})/h(t₀) → ĥ^{K(t)}_f(P) as h(t₀) → ∞ with t₀ ∈ T⁰(f) ∩ ℚ̄: for every ε > 0 there is H such that \|ĥ_{f_{t₀}}(P_{t₀})/h(t₀) − ĥ^{K(t)}_f(P)\| ≤ ε for all t₀ ∈ T⁰(f) ∩ ℚ̄ with h(t₀) ≥ H.

### Critical height

**Imported id:** `ArithmeticDynamics:DY.6/critical-height`.

Let f be a rational map of ℙ¹ of degree d ≥ 2 defined over ℚ̄ (over a number field). The critical height is ĥ_crit(f) := Σ_{c} m_c · ĥ_f(c), summing over the critical points c of f (DY.0/critical-points-of-a-rational-map) with their multiplicities m_c, where ĥ_f is the absolute canonical height of DY.1/canonical-height-on-the-projective-line. It is a nonnegative real number, invariant under conjugation (DY.6/critical-height-conjugation-invariant), so it defines a function ĥ_crit : M_d(ℚ̄) → [0, ∞) on the moduli space of DY.0/moduli-space-of-rational-maps.

### Critical height is a moduli height

**Imported id:** `ArithmeticDynamics:DY.6/critical-height-is-a-moduli-height`.

Let d ≥ 2 and let h_{M_d} be an ample Weil height on M_d: the Weil height (HeightsRationalPointsAndObstructions:RP.0) attached to an ample line bundle on a projective compactification of the moduli space M_d (DY.0/moduli-space-of-rational-maps), restricted to M_d(ℚ̄). There are constants c₁, c₃ > 0 and c₂, c₄ ≥ 0 such that c₁ h_{M_d}([f]) − c₂ ≤ ĥ_crit([f]) ≤ c₃ h_{M_d}([f]) + c₄ for all [f] ∈ M_d(ℚ̄) outside the flexible Lattès locus L_d (DY.6/flexible-lattes-map). In particular the non-Lattès PCF classes form a set of bounded height, finite in each bounded degree.

### Uniform common torsion images for Legendre pairs

**Imported id:** `ArithmeticDynamics:DY.6/legendre-uniform-common-torsion-images`.

There is a uniform constant B such that \|π(E_{t₁}^tors) ∩ π(E_{t₂}^tors)\| ≤ B for all t₁ ≠ t₂ in ℂ ∖ {0, 1}, where E_t : y² = x(x − 1)(x − t) and π(x, y) = x (with π(O) = ∞).

### Étale dynamical Mordell–Lang

**Imported id:** `ArithmeticDynamics:DY.6/etale-dynamical-mordell-lang`.

Let X be a quasi-projective variety over ℂ, Φ : X → X an étale endomorphism (Mathlib AlgebraicGeometry.Etale), V ⊆ X a closed subvariety and α ∈ X(ℂ). Then V(ℂ) ∩ O_Φ(α) is a union of finitely many orbits O_{Φ^N}(Φ^ℓ(α)) (N, ℓ ∈ ℕ); equivalently {n ∈ ℕ : Φⁿ(α) ∈ V(ℂ)} is a finite union of arithmetic progressions. That is, DML(X, Φ) holds (DY.6/dynamical-mordell-lang-conjecture).

## Integral presentations and p-adic models

The primitive presentation and the root transport isolate the algebraic obligations before the accepted residue/Hensel contract. They neither assume that marked elements generate the field nor repeat that contract’s discharged prime-selection and root obligations.

<a id="integral-primitive-presentation"></a>

### Integral primitive presentation with marked elements

**Construction target:** `ArithmeticDynamics:DY.6/followup-integral-primitive-presentation`.

For every field L of characteristic zero, finitely generated over Q, and finite marked family s:I→L, there exist n≥0, a transcendence basis t:Fin n→L, a primitive element y, an injective evaluation j: A=Z[T₁,…,Tₙ]→L, its extension ĵ:F=Frac(A)→L, and H∈A[Y], with L=ĵ(F)(y), H(y,t)=0, deg_Y H>0, and H_F a nonzero scalar multiple of the monic minimal polynomial of y over F. Thus H_F is irreducible and separable. There are U_i∈A[Y] and V_i∈A ∖ {0} with s_i=U_i(y,t)/V_i(t). One may choose deg_Y U_i<deg_Y H and a single common V for all i. A marked zero has numerator zero; the marked family is independent of any generating family.

**Hypotheses and checks.**

- Algebra.EssFiniteType Q L; I finite, possibly empty. Neither a presentation nor an embedding is assumed.
- A has integer coefficients; the denominators V have no primitive-element variable. The equation H need not be monic.

**Proof route.**

1. Choose the finite transcendence basis and identify Q(t) with Frac(Q[T]) by aevalEquivField. Frac(Z[T]) and Frac(Q[T]) identify by their fraction-field universal properties: each rational coefficient is an integer divided by a nonzero integer. This identifies ĵ(F) with Q(t).
2. L is algebraic over Q(t) by the transcendence-basis property. A finite field-generating set for L over Q also generates over Q(t), so this algebraic extension is finite (finite_of_essFiniteType_of_isAlgebraic). Characteristic zero gives separability; choose y by the primitive-element theorem.
3. Use its power basis to write each s_i as a polynomial of degree below [L:F] in y. Clear the finite set of coefficients in F simultaneously by exist_integer_multiples. The denominator is in A, not in A[Y].
4. Integer-normalize the monic minimal polynomial to H. Its image is c times that polynomial with c≠0. Multiplication by c does not change degree, roots, irreducibility or separability over F. Transport the power-basis equalities through ĵ to obtain the marked identities.

**Direct prerequisites:** [`exists_finset_isTranscendenceBasis`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/FinTrdeg.lean), [`IntermediateField.fg_top_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean), [`Algebra.finite_of_essFiniteType_of_isAlgebraic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean), [`Field.exists_primitive_element`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PrimitiveElement.lean), [`AlgebraicIndependent.aevalEquivField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Adjoin.lean), [`PowerBasis.ofAdjoinSimpleEqTop`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean), [`PowerBasis.exists_eq_aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerBasis.lean), [`IsLocalization.integerNormalization_spec`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Integral.lean), [`IsLocalization.exist_integer_multiples`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Integer.lean), [`IsFractionRing.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean), [`IsFractionRing.lift_unique`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean).

**Source:** [J. W. S. Cassels, An embedding theorem for fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5D685D8FAFAC403B5CAE3170656D23B2/S000497270002503Xa.pdf/an-embedding-theorem-for-fields.pdf), Proof of Theorem I, (2), printed p.195. The proof chooses independent parameters and a primitive element, then represents the finitely many marked elements using integral polynomials with parameter denominators.

**Source:** [Jason P. Bell, A generalised Skolem–Mahler–Lech theorem for affine varieties](https://arxiv.org/pdf/math/0501309v2), §3 proof of Lemma 3.1, pp.5–6. The field is a finite simple extension of a rational function field; denominator clearing precedes specialization.

**Consumers.**

- [`ArithmeticDynamics:DY.6/lech-embedding-lemma`](../packets/ArithmeticDynamics.json): Supplies exactly the arbitrary-field input to the accepted independent Hensel specialization.
- [`ArithmeticDynamics:DY.6/lech-embedding-units`](../packets/ArithmeticDynamics.json): Apply the same integral presentation to nonzero marks and their inverses.
- [`ArithmeticDynamics:DY.6/p-adic-model-of-unramified-endomorphism`](../packets/ArithmeticDynamics.json): Includes all coefficients and an inverted nonzero element among the marks.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `integralPrimitivePresentation` | constructor | Existence of the full presentation above from EssFiniteType Q L and a finite marked family. |
| `parameterEvaluation_injective` | structure | j and its fraction-field extension ĵ are injective, and ĵ(F)=Q(t). |
| `primitiveEquation_map` | relation | H_F=C(c)·minpoly_F(y) with c≠0; its positive degree equals [L:F]. |
| `markedExpression_eq` | characterisation | s_i=U_i(y,t)/V_i(t), V_i≠0, deg_Y U_i<deg_Y H. |
| `markedExpression_commonDenominator` | relation | A single nonzero V serves any finite marked family. |
| `markedExpression_zero` | simp | A zero mark has an admissible representation U=0,V=1. |
| `presentation_transport` | functoriality | A Q-field isomorphism transports t,y and the marked identities with unchanged integral polynomial data. |
| `presentation_renameParameters` | functoriality | A permutation of Fin n transports H,U,V by variable renaming and preserves every equation. |

**Discriminating unit tests.**

| Test | Kind | Expected result |
| --- | --- | --- |
| `presentation_Q_one_sixth` | degenerate | n=0,y=0,H=Y,U=1,V=6 represents 1/6 in Q; no field generator is marked. |
| `presentation_quadratic_denominator` | computation | In Q(t)[y]/(y²−t), the mark 1/(y+t) has U=t−Y,V=t²−t, and V≠0. |
| `presentation_zero_mark` | degenerate | Zero is represented with U=0,V=1; the construction never requires nonzero marks. |
| `presentation_degree_one` | compatibility | For L=Q(t), choose y=0,H=Y; degree one is permitted although the algebraic extension is trivial. |
| `presentation_denominator_nonexample` | non-example | The pair U=1,V=0 cannot represent a mark; a zero specialized denominator is never an admissible evaluation. |

**Acceptance.**

- L=Q permits n=0 and H=Y, y=0; s=1/6 has U=1,V=6.
- For L=Q(t)[y]/(y²−t), 1/(y+t)=(t−y)/(t²−t), illustrating why the denominator can be moved into A.
- No claim that an arbitrary finite set of marks generates L.

<a id="primitive-root-transport"></a>

### Transport through a primitive root

**Theorem target:** `ArithmeticDynamics:DY.6/followup-primitive-root-transport`.

Let A be a domain with F=Frac(A), let L/F be a finite simple extension generated by y, and let j:A→L be its scalar map. Suppose H∈A[Y] maps to C(c)·minpoly_F(y), c≠0. For any field E, injective e:A→E, and η∈E with H_e(η)=0, there is a unique ring homomorphism σ:L→E extending e on A and sending y to η. It is injective. Every marked identity x=U_j(y)/j(V) with V≠0 transports to σ(x)=U_e(η)/e(V).

**Hypotheses and checks.**

- The F-algebra structure on L is compatible with A; y is integral over F and F(y)=L.
- E need not be algebraically closed. Irreducibility is over the embedded parameter field ê(F), not over E.

**Proof route.**

1. Extend e uniquely to ê:F→E by IsFractionRing.lift; the map is injective. Give E the F-algebra structure through ê.
2. Map H_F=C(c) minpoly to E. Since ê(c)≠0, the root equation implies minpoly_F(y) evaluated at η is zero.
3. Use algHomAdjoinIntegralEquiv (equivalently adjoinRootEquivAdjoin followed by root evaluation), then identify F(y) with L. The generator-value lemma gives σ(y)=η.
4. A field homomorphism is injective. Any other extension agrees on F by fraction-field uniqueness and on y; PowerBasis.algHom_ext proves uniqueness. Apply the homomorphism to every marked equality, using preservation of polynomial evaluation and division.

**Direct prerequisites:** [`IsFractionRing.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean), [`IsFractionRing.lift_unique`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean), [`IntermediateField.adjoinRootEquivAdjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean), [`IntermediateField.algHomAdjoinIntegralEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean), [`IntermediateField.algHomAdjoinIntegralEquiv_symm_apply_gen`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean), [`PowerBasis.ofAdjoinSimpleEqTop`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean), [`PowerBasis.algHom_ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerBasis.lean), [`ArithmeticDynamics:DY.6/followup-integral-primitive-presentation`](#integral-primitive-presentation).

**Source:** [J. W. S. Cassels, An embedding theorem for fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5D685D8FAFAC403B5CAE3170656D23B2/S000497270002503Xa.pdf/an-embedding-theorem-for-fields.pdf), Theorem I proof, (10) and following paragraph, printed p.197. Independent specialized parameters and a root of the primitive equation determine the whole-field embedding; the proof then transports the marked fractions.

**Acceptance.**

- A root need not make H irreducible over E: for L=Q(√2) and E=Q₇ the selected root gives an embedding although H splits in E.
- Without injectivity of e, the conclusion fails: sending a transcendence parameter to 0 does not extend to Q(t).
- For a fixed root the extension is unique; different roots can give different embeddings.

<a id="lech-integral-assembly"></a>

### Closure of the Lech integral embedding contract

**Theorem target:** `ArithmeticDynamics:DY.6/followup-lech-integral-assembly`.

For L/Q finitely generated and every finite s⊂L, for each N there exist prime p>N and σ:L→Q_p with σ(s)⊂Z_p. This discharges the two presentation/transport obligations in the inherited lech-embedding-lemma; its endpoint and unit/localization corollaries retain their original ids.

**Hypotheses and checks.**

- The finite marked set may contain zero and may be empty.
- No demand is made for every prime; the target is Q_p itself.

**Proof route.**

1. Apply integral-primitive-presentation to all marks and collect the finitely many nonzero parameter denominators.
2. Use the accepted lech-independent-hensel-specialization without changing its statement: it supplies ξ∈Z_pⁿ independent over Q, η∈Z_p satisfying H, and denominator units for arbitrarily large p.
3. The independent tuple makes parameter evaluation injective. Apply primitive-root-transport and its marked identity. Integral polynomial evaluation makes U(η,ξ) integral and each unit denominator has integral inverse.
4. For nonzero prescribed units, mark their inverses too; for the localized-adjoin corollary use the inherited ring-adjoin induction.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/followup-integral-primitive-presentation`](#integral-primitive-presentation), [`ArithmeticDynamics:DY.6/followup-primitive-root-transport`](#primitive-root-transport), [`ArithmeticDynamics:DY.6/lech-independent-hensel-specialization`](../packets/ArithmeticDynamics.json).

**Source:** [J. W. S. Cassels, An embedding theorem for fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5D685D8FAFAC403B5CAE3170656D23B2/S000497270002503Xa.pdf/an-embedding-theorem-for-fields.pdf), Theorem I, pp.193 and 195–197. Its integral intermediate conclusion is obtained before marking inverses yields units.

**Source:** [J. W. S. Cassels, An embedding theorem for fields: Addendum](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/448105F250CB98358EC731D0FEB4A61A/S0004972700025442a.pdf/an_embedding_theorem_for_fields_addendum.pdf), pp.479–480. The prime-selection step has an elementary replacement; no Chebotarev input is needed.

**Acceptance.**

- Q and the mark 1/6 require primes away from 2 and 3.
- Q(√2) admits the example p=7, η≡3 mod7; p=3 does not work.
- Zero has integral image and is not a unit.

<a id="unramified-cohen-adapter"></a>

### Unramified Cohen coordinates with the coefficient map fixed

**Theorem target:** `ArithmeticDynamics:DY.6/followup-unramified-cohen-adapter`.

Let R be a complete Noetherian regular local ring, char R=0, residue field F_p, with p∈m ∖ m², dim R=g+1, and a fixed continuous local map Z_p→R inducing the identity on F_p. There is a continuous Z_p-algebra isomorphism R≃Z_p[[T₁,…,T_g]] carrying a chosen regular system (p,t₁,…,t_g) to (p,T₁,…,T_g). For a smooth relative-g-dimensional Z_p-scheme at an F_p-point this applies to its completed local ring.

**Hypotheses and checks.**

- The coefficient map is included and must be preserved; p∉m² is the unramified hypothesis.
- g=0 is allowed; no such formula is asserted for ramified regular local rings.

**Proof route.**

1. Import the coefficient-ring existence and power-series surjection from SF.0/cohen-structure. Over F_p the unramified Cohen ring is Z_p.
2. A regular system extending p gives a surjection from the (p,T)-adically complete power-series ring. Both rings have dimension g+1; regularity makes the source a domain and forces the kernel to be zero.
3. Check compatibility with the specified Z_p map by continuity and density of Z. Smoothness supplies regularity, unramifiedness and the dimension of the completed local ring. This compatibility and completion adapter is requested explicitly from SF.0, not assumed to be part of its absolute statement.

**Direct prerequisites:** [`SchemeAndStackFoundations:SF.0/cohen-structure`](../packets/SchemeAndStackFoundations.json), [`SchemeAndStackFoundations:SF.0/cohen-ring`](../packets/SchemeAndStackFoundations.json), [`SchemeAndStackFoundations:SF.0`](../packets/SchemeAndStackFoundations.json).

**Source:** [Jason P. Bell, Dragos Ghioca and Thomas J. Tucker, The dynamical Mordell-Lang problem for étale maps](https://arxiv.org/abs/0808.3266v1), Proposition 2.1 proof, pp.4–5. Uses an unramified complete regular local ring and a regular parameter system to obtain Z_p power-series coordinates.

**Acceptance.**

- g=0 gives R≃Z_p.
- Z_p[[T]] has dimension 2.
- Z_p[π]/(π²−p), completed, is ramified and fails p∉m².

## Specialization and zero-height points

The specialization limit uses a global height structure specified as part of the input. The zero-height case over a geometric function field needs nonisotriviality, rather than a number-field Northcott argument.

<a id="global-curve-specialization"></a>

### Call–Silverman specialization over a global height field and a curve

**Theorem target:** `ArithmeticDynamics:DY.6/followup-global-curve-specialization`.

Let K be a global height field with its chosen product-formula height structure, T/K a smooth projective geometrically integral curve, and h_T a Weil height for a divisor of degree 1. Let π:V→T be a projective family with smooth geometrically integral generic fibre, P a rational section, φ a rational self-map over T that is a morphism on the generic fibre, and η∈Pic(V)⊗R with φ*η=αη on the generic fibre, α>1. On a nonempty good open U where the fibres, φ_t and the eigenclass specialize as in Call–Silverman §3, one has lim_{h_T(t)→∞, t∈U(K̄)} ĥ_{V_t,η_t,φ_t}(P_t)/h_T(t)=ĥ_{V_η,η_η,φ_η}(P_η). The right side uses the degree-normalized geometric height on K(T). The statement does not assert an O(1) error.

**Hypotheses and checks.**

- Use compatible height normalizations under finite extensions. The section is evaluated where defined. A projective model lets rational sections extend over the smooth curve.
- A specified global height field is required; finite generation of K alone does not specify a height. Ampleness of η is not needed for the eigenclass limit.

**Proof route.**

1. The relative canonical/Weil-height difference is ≤C₁h_T(t)+C₂ by the general-curve version of Theorem 3.1; its constants are uniform in the point on the fibre.
2. For each fixed section Q=φⁿP, functoriality gives h_{V,η}(Q_t)=h_{T,Q*η}(t)+O_Q(1). Generic intersection degree equals the geometric Weil height of Q_η.
3. Use curve-height quasi-equivalence h_{T,D}(t)/h_T(t)→deg D, including real divisor classes; the height and intersection contracts are requested from RP.0. Combining with the generic canonical/Weil bound gives a limsup error bounded independently of Q after section-dependent O(1) terms vanish.
4. Replace P by φⁿP. Both canonical heights multiply by αⁿ. Divide the uniform limsup bound by αⁿ and let n tend to infinity. This generalizes the inherited t-line endpoint without requiring Northcott over K.

**Direct prerequisites:** [`ArithmeticDynamics:DY.1/canonical-height-for-a-divisorial-eigenclass`](../packets/ArithmeticDynamics.json), [`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`](../packets/HeightsRationalPointsAndObstructions.json), [`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`](../packets/HeightsRationalPointsAndObstructions.json), [`SchemeAndStackFoundations:SF.0/spreading-out-models`](../packets/SchemeAndStackFoundations.json), [`HeightsRationalPointsAndObstructions:RP.0`](../packets/HeightsRationalPointsAndObstructions.json).

**Source:** [Gregory S. Call and Joseph H. Silverman, Canonical heights on varieties with morphisms](https://www.numdam.org/item/CM_1993__89_2_163_0.pdf), §3 Theorem 3.1 pp.177–182; §4 Theorem 4.1 and proof pp.183–186. The proof compares fibre and generic heights along a section and amplifies by iteration on a smooth projective base curve.

**Source:** [Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2), §6.2 Lemma 6.5, p.17. The polynomial specialization proof needs this limit on a general base curve.

**Acceptance.**

- T=P¹, K a number field and η=O(1) recover the inherited specialization theorem.
- A constant family gives ratio 0 and generic geometric canonical height 0, even if fibre arithmetic heights are positive.
- A degree-e base change multiplies generic degrees and changes the degree-one base-height normalization accordingly.

<a id="benedetto-zero-height"></a>

### Benedetto zero-height criterion for nonisotrivial polynomials

**Theorem target:** `ArithmeticDynamics:DY.6/followup-benedetto-zero-height`.

Let F be any field, K/F a finite extension of F(T), and f∈K[z] a polynomial of degree d≥2 which is not affine-conjugate over a finite extension of K to a polynomial over the algebraic constant field. For every x∈P¹(K̄), its geometric canonical height is zero if and only if x is preperiodic.

**Hypotheses and checks.**

- The height uses geometric places trivial on F; this is not the number-field Northcott argument.
- Isotriviality allows a finite extension and an affine change of coordinates.

**Proof route.**

1. Over any fixed finite extension containing x, zero local escape rates place its forward orbit in every local filled Julia set.
2. If there are at least three rational zero-height points and all places have potentially good reduction, normalize two finite ones to 0 and 1; the product formula forces the leading coefficient to have norm 1 everywhere and then forces all coefficients to be constants (Benedetto Proposition 6.1). Nonisotriviality therefore supplies a bad place.
3. At a bad place the filled Julia set is covered by at most d² open discs of radius \|a_d\|^{-1/(d−1)}; at good places it lies in a closed disc of that radius. Two rational points in the same choices of bad-place discs violate the product formula. Thus the rational zero-height set is finite and forward-invariant.
4. Apply this argument in a finite extension containing any algebraic x. Nonisotriviality persists under that extension.

**Direct prerequisites:** [`ArithmeticDynamics:DY.1/canonical-height-over-a-global-height-field`](../packets/ArithmeticDynamics.json), [`ArithmeticDynamics:DY.2/escape-rate`](../packets/ArithmeticDynamics.json), [`ArithmeticDynamics:DY.6/followup-filled-julia-disc-cover`](#filled-julia-disc-cover).

**Source:** [Robert L. Benedetto, Heights and preperiodic points of polynomials over function fields](https://rlbenedetto.people.amherst.edu/papers/ffheights.pdf), Theorems A–B p.2; Proposition 6.1 and proof of Theorem A pp.7–8. Finiteness comes from local disc choices and a product-formula contradiction, with a separate constant-coefficient case.

**Source:** [Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2), Lemma 6.7, p.18. The nonisotrivial branch of polynomial specialization uses this criterion.

**Acceptance.**

- For f=z² over Q(T), x=2 has geometric height zero but is wandering: the exclusion is necessary.
- f=z²+T and x=0 have positive geometric height.
- Infinity is preperiodic for every polynomial and has height zero.

<a id="filled-julia-disc-cover"></a>

### Disc covering at a place of bad polynomial reduction

**Theorem target:** `ArithmeticDynamics:DY.6/followup-filled-julia-disc-cover`.

Over a complete algebraically closed nonarchimedean field, a polynomial f of degree d≥2 and leading coefficient a_d has filled Julia set contained in a unique smallest closed disc of radius r≥ρ=\|a_d\|^{-1/(d−1)}. Potential good reduction is equivalent to r=ρ. If r>ρ and z₀ is in the filled Julia set, that set is contained in the union of open discs D(x,ρ) for x∈f^{-2}(z₀), at most d² discs.

**Hypotheses and checks.**

- The absolute value is nonarchimedean and the field is complete and algebraically closed.
- At potentially good places the containing disc is closed; at bad places the final covering discs are open.

**Proof route.**

1. The smallest-disc and inverse-disc theorems are the precise local input of Benedetto Lemmas 5.1–5.2. Their proofs are referenced there to the earlier local filled-Julia paper and remain a recorded gap.
2. For the covering conclusion, two inverse-image discs at distance r force in each fibre at least one second preimage at distance ≥r from a point outside all open radius-ρ discs.
3. Factor f(z)−y and then f²(z)−z₀. The product bounds imply \|f²(z)−z₀\|>r for such a point, excluding it from the filled Julia set (Lemma 5.3).

**Direct prerequisites:** [`ArithmeticDynamics:DY.2/escape-rate`](../packets/ArithmeticDynamics.json).

**Source:** [Robert L. Benedetto, Heights and preperiodic points of polynomials over function fields](https://rlbenedetto.people.amherst.edu/papers/ffheights.pdf), Lemmas 5.1–5.3 pp.6–7. The first two statements are cited local results; the last is proved by factoring the two inverse-image levels.

**Acceptance.**

- For z^d, the filled Julia set is the closed unit disc and r=ρ=1.
- Replacing open discs by closed ones at a bad place destroys the strict product-formula inequality.

**Open proof leaf — Local smallest-disc and inverse-disc theorems.** Audit and decompose Benedetto Lemmas 5.1–5.2, whose proofs are referred to his earlier preperiodic-points paper (Lemmas 2.5 and 2.7). Lemma 5.3 and the global product-formula step are explicit here; a general nonarchimedean root-disc theory is still missing from the chain.

## Legendre marks and hybrid degeneration

Persistent moving marks, infinitely many torsion parameters, uniform potentials and weak measure convergence are distinct contracts. Keeping them separate prevents the wrong implication from a degree calculation or a weak limit.

<a id="legendre-marked-degree-growth"></a>

### Legendre marked-point degree growth

**Theorem target:** `ArithmeticDynamics:DY.6/followup-legendre-marked-degree-growth`.

For c∈C(t)∪{∞} other than 0,1,t,∞, write its primitive homogeneous lift C and put F₁=F(C)/gcd(F(C)), d=deg F₁. Then d≥2; if F₁=(P₁,Q₁), P₁(0,1)P₁(1,0)≠0, Q₁(1,0)=0 and P₁(1,1)≠Q₁(1,1). Recursively F_{n+1}=F(F_n)/t₂² has nonzero resultant and degree 4ⁿd. Consequently c is not preperiodic over C(t), and the only persistently preperiodic rational marks are 0,1,t,∞.

**Hypotheses and checks.**

- F=( (t₁w²−t₂z²)², 4t₂zw(w−z)(t₁w−t₂z) ); n≥1.
- Degree is degree in the parameter after removal of the common homogeneous factor.

**Proof route.**

1. Separate constant marks, the scaled c=t times a constant case, and general lifts A=t₁^l A′, B=t₂^k B′. The only possible common factors arise at t₁,t₂,t₁−t₂ because noncusp fibres define morphisms. Compute their orders.
2. After the first cancellation the boundary values above hold; at t₁=t₂ with A=B use the first-order expansion to see P₁−Q₁ does not vanish after cancellation.
3. These conditions force exactly t₂² cancellation in the next step, preserve the boundary values, and make its degree quadruple. Unbounded parameter degree excludes equality of two iterates.
4. For the four excluded marks the explicit formula gives eventual arrival at infinity. Restricting to constant marks removes the moving mark t, yielding the inherited common-to-all torsion-image target.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/legendre-lattes-map`](../packets/ArithmeticDynamics.json), [`ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion`](../packets/ArithmeticDynamics.json).

**Source:** [Laura DeMarco, Xiaoguang Wang and Hexi Ye, Torsion points and the Lattès family](https://arxiv.org/pdf/1311.1792v3), Proposition 3.1 and proof pp.9–10; §3.2 p.10; Proposition 1.4 p.3. The degree calculation includes rational moving marks; the common constant torsion images are its constant-mark consequence.

**Acceptance.**

- c=2 gives initial degree 2.
- c=t is a persistent torsion mark but is not a constant common image.
- The exclusions include infinity, not just the finite branch coordinates.

<a id="legendre-marked-escape-convergence"></a>

### Continuous marked escape potential across the three Legendre cusps

**Theorem target:** `ArithmeticDynamics:DY.6/followup-legendre-marked-escape-convergence`.

For c∈C(t) other than 0,1,t, choose the primitive homogeneous lift C, the cancelled F₁ and F_{n+1} of legendre-marked-degree-growth, with d=deg F₁. The functions (d·4^{n−1})^{-1} log max(\|P_n\|,\|Q_n\|) converge locally uniformly on C² minus the origin to a continuous plurisubharmonic function G_C. It satisfies G_C(λt)=G_C(t)+log\|λ\|. Its projective curvature defines a probability bifurcation measure μ_c; continuity at the cusp parameters 0,1,infinity prevents this probability from being supported only at those cusps.

**Hypotheses and checks.**

- A finite rational mark, including nonconstant marks, is allowed. Use the primitive cancellation and degree normalization from the preceding target.
- Local uniform convergence includes nonzero homogeneous parameter vectors representing the three singular fibres.

**Proof route.**

1. Away from the cusps, nonvanishing of the resultant gives the usual summable successive escape-rate estimate.
2. DWY §4 separates the estimates at infinity, zero, and one; its Proposition 4.1 identifies the boundary limits through the nonzero boundary values from degree growth. These cusp-uniform estimates remain a named proof leaf, rather than being inferred from the nondegenerate estimate.
3. Each normalized function is plurisubharmonic and logarithmically homogeneous of degree one. Local uniform convergence preserves continuity, plurisubharmonicity and the logarithmic scaling relation.
4. The projective curvature has total mass one. A continuous local potential has no point atoms, so the measure has nonzero mass on the nonsingular parameter domain. This supplies the nontrivial activity measure used in §6.5.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/followup-legendre-marked-degree-growth`](#legendre-marked-degree-growth).

**Source:** [Laura DeMarco, Xiaoguang Wang and Hexi Ye, Torsion points and the Lattès family](https://arxiv.org/pdf/1311.1792v3), Theorem 1.5 p.3; §4 pp.12–19, Proposition 4.1 p.13. The convergence extends across all three cusps, not just the good parameter domain.

**Acceptance.**

- The logarithmic scaling coefficient is 1 after degree normalization, not d.
- The good-parameter resultant estimate alone does not prove uniform convergence at a cusp.

**Open proof leaf — Activity to infinitely many preperiodic parameters.** The exact marked-potential convergence contract is DWY Theorem 1.5, including the cusp-uniform estimates in §4. Those estimates, the complex curvature/potential adapter, the normality/activity equivalence and the Montel moving-target argument cited in DWY §6.5 (DeMarco Theorem 9.1; Baker–DeMarco Lemma 2.4; Dujardin–Favre Lemma 2.3) need a proof audit and supplier interfaces. Here degree-growth and algebraicity are explicit; no claim that degree growth alone proves distinct torsion parameters is made.

<a id="legendre-torsion-infinitude"></a>

### Infinitely many torsion specializations of a constant Legendre mark

**Theorem target:** `ArithmeticDynamics:DY.6/followup-legendre-torsion-infinitude`.

For a∈Q̄ ∖ {0,1}, there are infinitely many distinct t∈Q̄ ∖ {0,1} for which a is preperiodic for f_t, equivalently either point of E_t over x=a is torsion.

**Hypotheses and checks.**

- Infinity is handled separately as a persistent mark. The choice of sign of the point does not affect torsion.

**Proof route.**

1. The marked degree growth implies a nonzero activity/bifurcation measure, by the convergence of normalized marked escape rates in DWY Theorem 1.5.
2. DWY §6.5 invokes the normal-family criterion and a Montel argument: an active mark in the Legendre family has infinitely many preperiodic parameters. This analytic bridge, rather than the entire equivalence in Theorem 1.2, is the remaining gap recorded here.
3. Each preperiodic relation is an algebraic equation over Q̄ in t. It is not identically zero by marked degree growth; its roots are algebraic. The inherited semiconjugacy identifies them with torsion parameters.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/followup-legendre-marked-degree-growth`](#legendre-marked-degree-growth), [`ArithmeticDynamics:DY.6/followup-legendre-marked-escape-convergence`](#legendre-marked-escape-convergence), [`ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion`](../packets/ArithmeticDynamics.json).

**Source:** [Laura DeMarco, Xiaoguang Wang and Hexi Ye, Torsion points and the Lattès family](https://arxiv.org/pdf/1311.1792v3), Theorem 1.2 p.2 and §6.5 pp.28–29. The proof establishes infinitude of Tor(c) by non-normality before using equidistribution for the equivalence theorem.

**Acceptance.**

- Do not infer infinitude just by writing more division polynomials: distinct roots still need proof.
- The mark a=0 is torsion for every good parameter and belongs to the separate persistent case.

**Open proof leaf — Activity to infinitely many preperiodic parameters.** The exact marked-potential convergence contract is DWY Theorem 1.5, including the cusp-uniform estimates in §4. Those estimates, the complex curvature/potential adapter, the normality/activity equivalence and the Montel moving-target argument cited in DWY §6.5 (DeMarco Theorem 9.1; Baker–DeMarco Lemma 2.4; Dujardin–Favre Lemma 2.3) need a proof audit and supplier interfaces. Here degree-growth and algebraicity are explicit; no claim that degree growth alone proves distinct torsion parameters is made.

<a id="hybrid-uniform-potential"></a>

### Uniform hybrid escape potentials for meromorphic families

**Theorem target:** `ArithmeticDynamics:DY.6/followup-hybrid-uniform-potential`.

For a degree-d≥2 meromorphic family f_t of morphisms of P¹ on a punctured disc, choose a meromorphic homogeneous lift with no common zero for t≠0 and the hybrid parameter \|T\|=r∈(0,1). The normalized degree-dⁿ model potentials from the iterated lift converge uniformly after multiplication by log(r)/log\|t\| to a continuous potential on the hybrid projective line, whose central restriction is the nonarchimedean escape potential. Changes of lift add the corresponding scalar logarithmic normalization.

**Hypotheses and checks.**

- The resultant may vanish at t=0 but not for t≠0; the family is meromorphic across 0.
- Specify the reference metric and normalization; continuity of this potential is stronger information than weak convergence of measures.

**Proof route.**

1. Coefficient meromorphy gives an upper bound by a power of \|t\|; a Nullstellensatz/resultant identity gives the lower bound by another power. This yields \|d^{-n-1}ϕ_{n+1}−d^{-n}ϕ_n\|≤C d^{-n}log\|t\|^{-1} (Favre Proposition 4.4).
2. The hybrid scaling converts the estimate to a summable bound independent of the parameter. Finite-level model potentials extend continuously to the central fibre by Theorem 2.10.
3. Uniform convergence proves continuity and identifies the central escape potential by evaluation of the same iterated homogeneous polynomials. The hybrid model-function extension is requested from TB.0.

**Direct prerequisites:** [`ArithmeticDynamics:DY.2/escape-rate`](../packets/ArithmeticDynamics.json), [`TropicalAndBerkovichArithmetic:TB.0`](../packets/TropicalAndBerkovichArithmetic.json).

**Source:** [Charles Favre, Degeneration of endomorphisms of the complex projective space in the hybrid space](https://arxiv.org/pdf/1611.08490v2), Theorem 2.10; §4.3 Proposition 4.4 pp.29–30. A meromorphic growth estimate for successive normalized potentials produces the uniform potential in the hybrid setting.

**Acceptance.**

- A constant good-reduction family has the constant nonarchimedean limit.
- Unscaled complex potentials are not asserted continuous at t=0.

**Open proof leaf — Hybrid analytic comparison proofs.** The TB.0 request specifies the actual model-function and measure comparison contracts. Their proofs in Favre §§2–4 are not yet decomposed to a library/roadmap API; the carrier, density, and measure continuity must all be supplied before the inherited degeneration gap is closed.

<a id="hybrid-equilibrium-limit"></a>

### Hybrid limit of equilibrium measures

**Theorem target:** `ArithmeticDynamics:DY.6/followup-hybrid-equilibrium-limit`.

For the family and normalization of hybrid-uniform-potential, the complex equilibrium probabilities μ_t, embedded in their hybrid fibres, converge weakly as t→0 to the nonarchimedean equilibrium probability μ_f on the central fibre: every continuous hybrid test function has convergent integral.

**Hypotheses and checks.**

- Weak convergence is in the hybrid space, not ordinary weak convergence on a fixed complex sphere.

**Proof route.**

1. The finite-level model-function measures have convergent test integrals across the hybrid fibres.
2. Use the uniform potential convergence and the continuity of the Monge–Ampère/Laplacian measure operation under uniform admissible-potential approximation (Favre Theorem 4.2). The model-function density of Theorem 2.12 extends convergence to all continuous test functions.
3. Identify the complex measure as maximal entropy and the central measure as the nonarchimedean equilibrium measure. For the Legendre family use the inherited explicit central measure and its cusp segment to obtain annular masses.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/followup-hybrid-uniform-potential`](#hybrid-uniform-potential), [`TropicalAndBerkovichArithmetic:TB.0`](../packets/TropicalAndBerkovichArithmetic.json), [`ArithmeticDynamics:DY.2/canonical-measure`](../packets/ArithmeticDynamics.json).

**Source:** [Charles Favre, Degeneration of endomorphisms of the complex projective space in the hybrid space](https://arxiv.org/pdf/1611.08490v2), Theorem B p.3; Theorems 2.12 and 4.2; §4.3 proof pp.30–31. The dynamical conclusion comes from continuous potentials and hybrid measure convergence.

**Acceptance.**

- Test function 1 has integral 1 in every fibre.
- This statement alone does not imply uniform continuity of normalized potentials; that uses the preceding target.

**Open proof leaf — Hybrid analytic comparison proofs.** The TB.0 request specifies the actual model-function and measure comparison contracts. Their proofs in Favre §§2–4 are not yet decomposed to a library/roadmap API; the carrier, density, and measure continuity must all be supplied before the inherited degeneration gap is closed.

## Critical height and the exceptional moduli locus

The full affine-torus exceptional locus is broader than multiplication-only examples. Its rigid classes can be counted in fixed degree; flexible families cannot. The height proof then uses an actual finite-fibre map and a bounded representative in every conjugacy class.

<a id="finite-multiplier-spectrum"></a>

### Finite multiplier spectra off the Lattès locus

**Theorem target:** `ArithmeticDynamics:DY.6/followup-finite-multiplier-spectrum`.

For each degree d≥2, finitely many iterated fixed-point multiplier multisets jointly define a morphism on M_d with finite fibres on the non-Lattès locus. Equivalently one may take a sufficiently divisible single iterate N, depending only on d, whose fixed-point multiplier spectrum has finite fibres there.

**Hypotheses and checks.**

- Exclude all affine-torus Lattès maps for this finiteness input. Flexible-only exclusion is obtained using the separate rigid finiteness target.
- Multipliers at fixed points of an iterate include multiplicity.

**Proof route.**

1. McMullen Corollary 2.3 says the full sequence of multiplier spectra determines a nonaffine conjugacy class up to finitely many choices. Its proof rests on stable-family rigidity, Theorem 2.2.
2. Noetherianity of the algebraic equal-spectrum loci gives a finite set of spectra sufficient to have zero-dimensional fibres outside the Lattès locus. A sufficiently divisible iterate packages them; check the finite ambiguity of taking roots and accounting for exact periods.
3. The stable-family rigidity and the finite truncation/iterate adapter are recorded as gaps; Ingram Lemma 14 is the verified downstream use.

**Direct prerequisites:** [`ArithmeticDynamics:DY.0/moduli-space-of-rational-maps`](../packets/ArithmeticDynamics.json), [`ArithmeticDynamics:DY.6/followup-affine-lattes-map`](#affine-lattes-map).

**Source:** [Curt McMullen, Families of rational maps and iterative root-finding algorithms](https://doi.org/10.2307/1971408), Corollary 2.3 and Theorem 2.2, printed pp.472–473. The multiplier spectrum detects nonaffine algebraic deformations.

**Source:** [Patrick Ingram, The critical height is a moduli height](https://arxiv.org/abs/1610.07904v3), Lemma 14 and its proof, pp.14–15. Uses a finite-fibre iterated spectrum to compare an ample moduli height.

**Acceptance.**

- Flexible Lattès families have constant spectra and positive-dimensional moduli, so their removal is necessary.
- The number of iterates depends on d; no universal single period is claimed.

**Open proof leaf — Affine quotient classification and rigidity.** Supply complex elliptic uniformization, classification of finite torus quotients and Milnor Theorem 5.1. For the multiplier theorem supply McMullen stable-family rigidity (including its Thurston and holomorphic-motion inputs) and the Noetherian finite-spectrum adapter. The fixed-degree lattice/counting argument is explicit here, but is conditional on the classification; no imaginary-quadratic class-number theorem is needed for that elementary bound.

<a id="affine-lattes-map"></a>

### Affine-torus Lattès maps

**Definition target:** `ArithmeticDynamics:DY.6/followup-affine-lattes-map`.

A complex rational map f of degree ≥2 is an affine-torus Lattès map if there exist a rank-two lattice Λ⊂C, the torus T=C/Λ, an affine endomorphism L(z)=az+b with aΛ⊂Λ and \|a\|²>1, and a finite holomorphic quotient Θ:T→P¹ such that f∘Θ=Θ∘L. The classification normalizes Θ to T/G_n for n∈{2,3,4,6}, with ω_nΛ=Λ and (1−ω_n)b∈Λ. Flexibility is equivalent to n=2 and a an integer.

**Hypotheses and checks.**

- Λ has rank two; cylinder quotients give power/Chebyshev maps and are excluded.
- Finite quotient is essential. The translation b is allowed; the inherited multiplication-only Lattès map is a special case.

**Proof route.**

1. Use the quotient-of-affine-map notion of Milnor Definition 2.1 restricted to a torus. The semiconjugacy determines degree \|a\|².
2. Milnor Lemma 3.5 and Theorem 5.1 give the cyclic quotient normal form; Theorem 5.1 fixes the conjugacy invariants.
3. Lemma 5.5 identifies flexibility. Elliptic uniformization and the cyclic-quotient classification remain a precise recorded gap; do not identify the whole notion with inherited multiplication-only maps.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/lattes-map`](../packets/ArithmeticDynamics.json), [`ArithmeticDynamics:DY.6/flexible-lattes-map`](../packets/ArithmeticDynamics.json).

**Source:** [John Milnor, On Lattès maps](https://arxiv.org/abs/math/0402147v2), Definition 2.1 pp.2–3; Theorem 5.1 pp.15–16; Lemma 5.5 p.18. The affine torus quotient includes rigid maps and translations as well as the flexible multiplication cases.

**Consumers.**

- [`ArithmeticDynamics:DY.6/followup-finite-multiplier-spectrum`](#finite-multiplier-spectrum): Defines the entire exceptional locus.
- [`ArithmeticDynamics:DY.6/followup-rigid-lattes-finiteness`](#rigid-lattes-finiteness): Separates the finitely many rigid classes from flexible families.
- [`ArithmeticDynamics:DY.6/critical-height-is-a-moduli-height`](../packets/ArithmeticDynamics.json): Justifies replacement of the full exceptional locus by the flexible locus.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `isAffineLattes` | characterisation | Existence of the rank-two torus affine quotient data above. |
| `affineLattes_conjugation` | functoriality | Möbius conjugation preserves the predicate. |
| `affineLattes_degree` | structure | The degree is \|a\|² for any quotient presentation. |
| `multiplication_isAffineLattes` | compatibility | An inherited multiplication Lattès map over C satisfies this predicate. |
| `affineLattes_normalForm` | relation | Every such map has cyclic quotient normal form n=2,3,4 or6. |
| `affineLattes_flexible_iff` | characterisation | In the normal form the map is flexible iff n=2 and a∈Z. |

**Discriminating unit tests.**

| Test | Kind | Expected result |
| --- | --- | --- |
| `affineLattes_degree_four` | compatibility | Multiplication by 2 on any complex elliptic torus gives a flexible map of degree 4. |
| `affineLattes_degree_two` | computation | Multiplication by 1+i on C/Z[i], modulo ±1, gives a rigid affine Lattès map of degree 2. |
| `affineLattes_power_nonexample` | non-example | z^d has exceptional points 0 and infinity and is not an affine-torus Lattès map, which has none. |
| `affineLattes_translation` | characterisation | For odd integer a, the nonzero admissible 2-torsion translation can give a flexible map with no postcritical fixed point; multiplication-only data miss it. |

**Acceptance.**

- All inherited multiplication-by-m examples are included.
- z↦z^d is a cylinder quotient and is not a torus quotient.

**Open proof leaf — Affine quotient classification and rigidity.** Supply complex elliptic uniformization, classification of finite torus quotients and Milnor Theorem 5.1. For the multiplier theorem supply McMullen stable-family rigidity (including its Thurston and holomorphic-motion inputs) and the Noetherian finite-spectrum adapter. The fixed-degree lattice/counting argument is explicit here, but is conditional on the classification; no imaginary-quadratic class-number theorem is needed for that elementary bound.

<a id="rigid-lattes-finiteness"></a>

### Finiteness of rigid Lattès classes in fixed degree

**Theorem target:** `ArithmeticDynamics:DY.6/followup-rigid-lattes-finiteness`.

For each d≥2, there are finitely many complex affine-torus Lattès conjugacy classes of degree d which are not flexible. The classes defined over Q̄ therefore have bounded ample moduli height.

**Hypotheses and checks.**

- Conjugacy classes are counted, not presentations or rational maps with chosen coordinates.
- The bounded-height assertion is only on algebraic classes.

**Proof route.**

1. If n≥3, normalize Λ to the Gaussian or Eisenstein lattice and use \|a\|²=d; only finitely many a and translation quotient invariants occur.
2. For n=2, nonflexibility forces a∉Z. Its equation is a²−qa+d=0 with q²<4d, leaving finitely many a. Milnor Lemma 5.4 bounds the normalized lattice shapes for each a by writing a=r+sγ and Im γ≥√3/2.
3. Theorem 5.1 leaves only a finite translation quotient for each fixed lattice and a. Thus only finitely many rigid classes occur, and any height is bounded on the finite algebraic subset.

**Direct prerequisites:** [`ArithmeticDynamics:DY.6/followup-affine-lattes-map`](#affine-lattes-map).

**Source:** [John Milnor, On Lattès maps](https://arxiv.org/abs/math/0402147v2), Theorem 5.1, Corollary 5.2, Lemmas 5.4–5.5, pp.15–18. The invariants and the lattice bound yield fixed-degree finiteness of the rigid classes.

**Acceptance.**

- Degree 2 has rigid examples.
- Degree 4 also has a flexible family, so finiteness of all Lattès classes is false.

**Open proof leaf — Affine quotient classification and rigidity.** Supply complex elliptic uniformization, classification of finite torus quotients and Milnor Theorem 5.1. For the multiplier theorem supply McMullen stable-family rigidity (including its Thurston and holomorphic-motion inputs) and the Noetherian finite-spectrum adapter. The fixed-degree lattice/counting argument is explicit here, but is conditional on the classification; no imaginary-quadratic class-number theorem is needed for that elementary bound.

<a id="minimum-conjugate-height"></a>

### Minimum conjugate coefficient height versus moduli height

**Theorem target:** `ArithmeticDynamics:DY.6/followup-minimum-conjugate-height`.

For each d≥2 and a fixed ample height h_M on a projective compactification of M_d/Q̄, there are c₁,c₂>0 and C₁,C₂ with c₁h_M([f])−C₁≤inf_{g conjugate to f}h_Hom(g)≤c₂h_M([f])+C₂. A representative attaining the bound up to a fixed additive constant suffices; no attainment of the infimum is required for subsequent inequalities.

**Hypotheses and checks.**

- Absolute coefficient heights and algebraic Möbius conjugacy; constants depend on d and the height choices, not f.

**Proof route.**

1. The quotient morphism and the height machine give the direction bounding h_M by coefficient height.
2. The reverse direction requires a bounded-height choice of representative in every conjugacy class. Ingram Lemma 13 cites Silverman, Moduli Spaces and Arithmetic Dynamics (2012), p.103; its proof was not located in a public or cleared source and remains the recorded gap.
3. Use the infimum form, or choose a representative within 1 of it, in the critical-height argument. This avoids relying on attainment of an absolute-height minimum over all of Q̄.

**Direct prerequisites:** [`ArithmeticDynamics:DY.0/moduli-space-of-rational-maps`](../packets/ArithmeticDynamics.json), [`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`](../packets/HeightsRationalPointsAndObstructions.json).

**Source:** [Patrick Ingram, The critical height is a moduli height](https://arxiv.org/abs/1610.07904v3), Lemma 13 and its use, pp.14–15. The coefficient-height error is replaced by a bound depending on the moduli class.

**Acceptance.**

- Conjugating a fixed map by large-height Möbius maps can make its raw coefficient height arbitrarily large.
- A single arbitrary representative cannot replace the infimum.

**Open proof leaf — Bounded-height conjugacy representatives.** Ingram Lemma 13 gives the statement and its bibliography [21] identifies Silverman, Moduli Spaces and Arithmetic Dynamics (2012), p.103. The public sample of the different book The Arithmetic of Dynamical Systems is not a proof of this bound. The cited book is absent from the cleared index, and no public proof of this precise representative-height bound was located on the author or publisher sites. A public or cleared proof is still required; no other book copy was used.

<a id="quasifinite-height-comparison"></a>

### Height comparison on the whole finite-fibre locus

**Theorem target:** `ArithmeticDynamics:DY.6/followup-quasifinite-height-comparison`.

Let X,Y be irreducible projective varieties over Q̄ with ample line bundles A,B, U⊂X open, and F:U→Y a morphism with finite fibres. There exist C>0,D with h_A(u)≤C h_B(F(u))+D for every algebraic u∈U.

**Hypotheses and checks.**

- The map is defined on U only; the inequality includes every point of U.

**Proof route.**

1. Replace Y by the closure of F(U); the map is generically finite. RP.0/silverman-dominant-map-inequality supplies the bound away from a proper closed subset Z of X.
2. On each irreducible component of Z meeting U, restrict the ample bundles and the finite-fibre map. Induct on dimension, using its image closure as the new target.
3. There are finitely many components. After lower-bounding the ample target height, adjust constants and take maxima to obtain one bound on all of U.

**Direct prerequisites:** [`HeightsRationalPointsAndObstructions:RP.0/silverman-dominant-map-inequality`](../packets/HeightsRationalPointsAndObstructions.json), [`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`](../packets/HeightsRationalPointsAndObstructions.json).

**Source:** [Patrick Ingram, The critical height is a moduli height](https://arxiv.org/abs/1610.07904v3), Lemma 15 and proof pp.14–15. Induction extends a generically finite height comparison from a dense open to the entire finite-fibre locus.

**Acceptance.**

- A constant morphism from a positive-dimensional U has infinite fibres and fails the hypothesis.
- The proof must treat the exceptional closed subset; the dense-open supplier alone does not give the conclusion.

<a id="quantitative-attracting-branch"></a>

### Quantitative branch point near a small attracting multiplier

**Theorem target:** `ArithmeticDynamics:DY.6/followup-quantitative-attracting-branch`.

Let f(z)=λz·∏_{i=1}^{d−1}(1−α_i z)/∏_{j=1}^{d−1}(1−β_j z) have degree d≥2, fixing 0 and infinity, and M=max{\|α_i\|,\|β_j\|}>0. Over C set C_v=3^{d−1}, ε_v=min(1/8,1/C_v); over a complete algebraically closed nonarchimedean field set C_v=1, ε_v=min_{1≤m≤d}\|m\|^d. If 0<\|λ\|<ε_v, there is a nonzero branch value β with 0<\|f^k(β)\|M≤(C_v\|λ\|)^k for all k≥1.

**Hypotheses and checks.**

- The archimedean absolute value is the usual complex modulus; the nonarchimedean version includes small residue characteristic.
- A branch value is the image of a critical point, not necessarily the critical point itself.

**Proof route.**

1. Rescale so M=1. On the half-unit disc over C, or the open unit disc nonarchimedean, the displayed factorization bounds iterates by a geometric power and excludes hitting 0.
2. Over C, if the relevant disc has no branch value, the inverse component maps unbranched to it. Koebe quarter bounds its conformal radius by 4 because a pole or nonzero root lies on the unit circle, whereas the multiplier gives radius 1/(2\|λ\|), a contradiction.
3. Nonarchimedean: the Benedetto–Ingram–Jones–Levy theorem used in Ingram Lemma 8 yields a branch value in the unit disc if \|λ\| is below every directional multiplicity to the dth power. Those multiplicities lie between 1 and d, giving the stated ε_v. These two analytic suppliers remain explicit gaps.

**Direct prerequisites:** [`ArithmeticDynamics:DY.2/escape-rate`](../packets/ArithmeticDynamics.json), [`TropicalAndBerkovichArithmetic:TB.0`](../packets/TropicalAndBerkovichArithmetic.json).

**Source:** [Patrick Ingram, The critical height is a moduli height](https://arxiv.org/abs/1610.07904v3), Lemma 8 and proofs, pp.7–8. Uses Koebe quarter in the complex case and the small-residue-prime directional-multiplicity bound in the nonarchimedean case.

**Acceptance.**

- For residue characteristic p>d, ε_v=1.
- For small p the threshold cannot be replaced by 1.
- The result does not cover a superattracting multiplier λ=0.

**Open proof leaf — Quantitative attracting-cycle analytic suppliers.** Need Koebe quarter and the unbranched inverse-component argument over C, and Benedetto–Ingram–Jones–Levy [4, Theorem 4.1] as used in Ingram Lemma 8 over nonarchimedean fields. Read the latter original proof and its directional-multiplicity constants before closing this gap; the present source audit verifies the exact consumer statement and its two proof routes, not those supplier proofs.

## Polynomial orbit intersections

The nonlinear classification and the synchronized linear case have different inputs. This part imports the existing Siegel and unit-equation owners rather than attributing polynomial classification to either arithmetic theorem.

<a id="bilu-tichy-equal-degree"></a>

### Equal-degree Bilu–Tichy classification input

**Theorem target:** `ArithmeticDynamics:DY.6/followup-bilu-tichy-equal-degree`.

If K is a number field, S a finite set of nonarchimedean places, F,G∈K[X] have equal degree >1 and F(x)=G(y) has infinitely many S-integral solutions, then F=E∘F₁∘a and G=E∘G₁∘b for E∈K[X] and affine a,b∈K[X], where, up to interchanging F₁,G₁, the pair is (X,X), (X²,c∘X²) with affine c, (D₂(X,α)/α,D₂(X,β)/β) with nonzero α,β∈K, or (D_n(X,α),−D_n(X cos(π/n),α)) with α∈K and cos(2π/n)∈K. D_n is the Dickson polynomial characterized by D_n(U+V,UV)=Uⁿ+Vⁿ.

**Hypotheses and checks.**

- n is a positive integer, parameters are interpreted in a chosen algebraic closure in the fourth case. Only the equal-degree necessity is needed.

**Proof route.**

1. Siegel bounds the genus and number of points at infinity of a component with infinitely many S-integral points.
2. Bilu–Tichy classify the resulting genus-zero polynomial pairs through polynomial decomposition. This classification proof is not given in GTZ and is retained as a precise gap.
3. For the downstream shape corollary, normalize nonzero Dickson parameters by a square root over K̄. Up to affine composition, a common H is Xⁿ or D_n(X,1); the cyclotomic degree bound makes the admissible n finite for fixed K.

**Direct prerequisites:** [`HeightsRationalPointsAndObstructions:RP.4/siegel-theorem`](../packets/HeightsRationalPointsAndObstructions.json), [`HeightsRationalPointsAndObstructions:RP.4`](../packets/HeightsRationalPointsAndObstructions.json).

**Source:** [Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2), Theorem 2.1 and Corollary 2.2 pp.5–6. States the equal-degree classification and proves the affine-normalized finite list of shared shapes.

**Acceptance.**

- For F=G take E=F and (F₁,G₁)=(X,X).
- Infinitely many complex solutions alone give no arithmetic classification.

**Open proof leaf — Bilu–Tichy and Ritt classification proofs.** The exact equal-degree Bilu–Tichy and equal-common-iterate Ritt contracts are named here, with their elementary consequences separated from the missing classification proofs. Audit Bilu–Tichy Theorem 10.5 and Ritt p.356, or public proofs of those exact cases; Siegel alone is insufficient. Dickson-polynomial existence and its functional identities must be imported from a polynomial-decomposition supplier rather than presumed supplied by the integral-point theorem.

<a id="ritt-common-iterate"></a>

### Ritt classification for equal common iterates

**Theorem target:** `ArithmeticDynamics:DY.6/followup-ritt-common-iterate`.

For F,G∈C[X], deg F=d>1 and a positive integer n, F^{∘n}=G^{∘n} iff there exist β∈C, γ∈C× and H∈X^r C[X^s] (r,s≥0) such that F(X)=−β+γH(X+β), G(X)=−β+H(X+β), γ^s=1 and γ^{1+d+⋯+d^{n−1}}=1. If s=0 then X^r C[X^s] consists of scalar multiples of X^r.

**Hypotheses and checks.**

- n≥1. Iterate composition is distinct from ordinary polynomial powers.

**Proof route.**

1. The backward implication is a direct composition calculation using H(γX)=γ^rH(X) and d≡r modulo s when s>0; for a monomial use d=r.
2. The forward implication is the Ritt classification cited as GTZ Proposition 6.3; its proof remains a gap.
3. For coefficients in a characteristic-zero field K, γ is the ratio of leading coefficients and belongs to K. Its order m is coprime to d. Prime-power multiplicative orders give a common-iterate exponent ≤m, yielding the bounded-root-of-unity corollary used in GTZ Proposition 6.1.

**Direct prerequisites:** .

**Source:** [Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2), Proposition 6.3 and Corollary 6.4 with proof, p.17. Records the equal-iterate classification and proves the uniform exponent consequence.

**Acceptance.**

- n=1 forces γ=1.
- F=−X²,G=X² have no equal positive iterate: d=2 and γ=−1 violate the geometric-sum condition.
- F=−X³,G=X³ agree at the second iterate.

**Open proof leaf — Bilu–Tichy and Ritt classification proofs.** The exact equal-degree Bilu–Tichy and equal-common-iterate Ritt contracts are named here, with their elementary consequences separated from the missing classification proofs. Audit Bilu–Tichy Theorem 10.5 and Ritt p.356, or public proofs of those exact cases; Siegel alone is insufficient. Dickson-polynomial existence and its functional identities must be imported from a polynomial-decomposition supplier rather than presumed supplied by the integral-point theorem.

<a id="linear-synchronized-intersection"></a>

### Common iterates from synchronized affine intersections

**Theorem target:** `ArithmeticDynamics:DY.6/followup-linear-synchronized-intersection`.

Let K have characteristic zero, f(X)=aX+b and g(X)=cX+e with a,c nonzero. If the set of common values fⁿ(x₀)=gⁿ(y₀), with the same n≥0, is infinite, then f^{∘m}=g^{∘m} for some m≥1. Together with conjugating a nonvertical line to the diagonal, this supplies the linear case of the inherited polynomial-lines DML target.

**Hypotheses and checks.**

- Infinitude concerns distinct common values, not merely infinitely many time indices. Both slopes are nonzero; constant maps have finite synchronized image.

**Proof route.**

1. Reduce to the finitely generated characteristic-zero subfield containing the coefficients and initial points, embed it in C, and shift to a first common value. A nontrivial root-of-unity slope has a finite orbit and is excluded by distinct-value infinitude.
2. If both slopes differ from 1, write the two iterates using their fixed-point translations. If the translated starting values differ, their equality becomes A aⁿ+B cⁿ=1 with A,B nonzero. The finitely generated multiplicative subgroup generated by a,c meets the exact DT.2 two-variable unit-equation contract; distinct n give distinct solutions because a is not a root of unity. Thus the translated starting values coincide, forcing equal fixed points and aⁿ=cⁿ at a return, hence equality of the corresponding affine iterates.
3. If both slopes are 1, equality after shifting to a common start forces the two translation increments to coincide. If exactly one slope is 1, the nontrivial translation grows linearly along the common-return subsequence. A slope of complex modulus at most 1 gives a bounded other orbit; one of modulus greater than 1 grows exponentially. Either contradicts infinitely many returns (GTZ Proposition 5.3).
4. GTZ Lemma 5.1 handles nonvertical lines by affine conjugation; a vertical or horizontal line with infinitely many distinct orbit points is periodic because the relevant coordinate is periodic. Use the inherited finite-union-of-progressions contract for time sets.

**Direct prerequisites:** [`DiophantineApproximationAndTranscendence:DT.2/s-unit-equation-finiteness`](../packets/DiophantineApproximationAndTranscendence.json), [`ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions`](../packets/ArithmeticDynamics.json).

**Source:** [Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve, Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2), §5 Lemma 5.1 and Proposition 5.3 with proof, pp.12–13. The synchronized linear case is proved separately; the two-variable unit equation supplies the arithmetic finiteness input.

**Acceptance.**

- f=g=X+1 has infinitely many synchronized common values from a common initial point.
- Two identity maps can meet at every time but at only one value; the theorem does not infer line periodicity from that finite image.
- Independent-time intersections differ: X+1 and X² can have infinite orbit intersection without a common iterate.

## Supplier contracts and open proof leaves

Each request below supplements an existing owner. It does not transfer ownership of the requested mathematics. Imported exact node contracts already suffice for SF.0 spreading out and the RP.0 dense-open dominant-map inequality; the whole-locus comparison above explains its extra induction. The inherited requests not replaced by those exact node citations remain in force.

### SchemeAndStackFoundations:SF.0

Supply the relative unramified form of the accepted Cohen structure node: complete regular local R with residue F_p, p∉m² and fixed continuous Z_p coefficient map has a coefficient-preserving power-series isomorphism; supply completed-local regularity and dimension for a smooth Z_p model. Absolute coefficient-ring existence alone does not include this map compatibility.

**Used by:** [`ArithmeticDynamics:DY.6/followup-unramified-cohen-adapter`](#unramified-cohen-adapter).

### HeightsRationalPointsAndObstructions:RP.0

Extend the supplied height machine by h_{T,D}(t)/h_{T,A}(t)→deg D for every real divisor class D on a smooth projective curve and deg A=1, as h_{T,A}→∞, with compatible algebraic-extension normalization. Supply the generic intersection-degree identity and the uniform relative height bound used by Call–Silverman Theorems 3.1 and 4.1 for global height fields, not only number fields.

**Used by:** [`ArithmeticDynamics:DY.6/followup-global-curve-specialization`](#global-curve-specialization).

### TropicalAndBerkovichArithmetic:TB.0

Hybrid projective-line carrier and topology, finite-level model functions and their central values, density in continuous functions (Favre Theorems 2.10 and 2.12), and continuity of fibre Laplacian/Monge–Ampère measures under uniform admissible-potential limits (Theorem 4.2). The inherited request for the topological hybrid space alone does not supply these measure/potential comparison theorems.

**Used by:** [`ArithmeticDynamics:DY.6/followup-hybrid-uniform-potential`](#hybrid-uniform-potential), [`ArithmeticDynamics:DY.6/followup-hybrid-equilibrium-limit`](#hybrid-equilibrium-limit).

### HeightsRationalPointsAndObstructions:RP.4

Confirm the Siegel node applies to the normalizations of the components of F(X)=G(Y), with the integral model and boundary points tracked. The Bilu–Tichy classification is recorded separately and is not attributed to Siegel.

**Used by:** [`ArithmeticDynamics:DY.6/followup-bilu-tichy-equal-degree`](#bilu-tichy-equal-degree).

### Local smallest-disc and inverse-disc theorems

Audit and decompose Benedetto Lemmas 5.1–5.2, whose proofs are referred to his earlier preperiodic-points paper (Lemmas 2.5 and 2.7). Lemma 5.3 and the global product-formula step are explicit here; a general nonarchimedean root-disc theory is still missing from the chain.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-filled-julia-disc-cover`](#filled-julia-disc-cover).

### Activity to infinitely many preperiodic parameters

The exact marked-potential convergence contract is DWY Theorem 1.5, including the cusp-uniform estimates in §4. Those estimates, the complex curvature/potential adapter, the normality/activity equivalence and the Montel moving-target argument cited in DWY §6.5 (DeMarco Theorem 9.1; Baker–DeMarco Lemma 2.4; Dujardin–Favre Lemma 2.3) need a proof audit and supplier interfaces. Here degree-growth and algebraicity are explicit; no claim that degree growth alone proves distinct torsion parameters is made.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-legendre-marked-escape-convergence`](#legendre-marked-escape-convergence), [`ArithmeticDynamics:DY.6/followup-legendre-torsion-infinitude`](#legendre-torsion-infinitude).

### Hybrid analytic comparison proofs

The TB.0 request specifies the actual model-function and measure comparison contracts. Their proofs in Favre §§2–4 are not yet decomposed to a library/roadmap API; the carrier, density, and measure continuity must all be supplied before the inherited degeneration gap is closed.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-hybrid-uniform-potential`](#hybrid-uniform-potential), [`ArithmeticDynamics:DY.6/followup-hybrid-equilibrium-limit`](#hybrid-equilibrium-limit).

### Affine quotient classification and rigidity

Supply complex elliptic uniformization, classification of finite torus quotients and Milnor Theorem 5.1. For the multiplier theorem supply McMullen stable-family rigidity (including its Thurston and holomorphic-motion inputs) and the Noetherian finite-spectrum adapter. The fixed-degree lattice/counting argument is explicit here, but is conditional on the classification; no imaginary-quadratic class-number theorem is needed for that elementary bound.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-affine-lattes-map`](#affine-lattes-map), [`ArithmeticDynamics:DY.6/followup-rigid-lattes-finiteness`](#rigid-lattes-finiteness), [`ArithmeticDynamics:DY.6/followup-finite-multiplier-spectrum`](#finite-multiplier-spectrum).

### Bounded-height conjugacy representatives

Ingram Lemma 13 gives the statement and its bibliography [21] identifies Silverman, Moduli Spaces and Arithmetic Dynamics (2012), p.103. The public sample of the different book The Arithmetic of Dynamical Systems is not a proof of this bound. The cited book is absent from the cleared index, and no public proof of this precise representative-height bound was located on the author or publisher sites. A public or cleared proof is still required; no other book copy was used.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-minimum-conjugate-height`](#minimum-conjugate-height).

### Quantitative attracting-cycle analytic suppliers

Need Koebe quarter and the unbranched inverse-component argument over C, and Benedetto–Ingram–Jones–Levy [4, Theorem 4.1] as used in Ingram Lemma 8 over nonarchimedean fields. Read the latter original proof and its directional-multiplicity constants before closing this gap; the present source audit verifies the exact consumer statement and its two proof routes, not those supplier proofs.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-quantitative-attracting-branch`](#quantitative-attracting-branch).

### Bilu–Tichy and Ritt classification proofs

The exact equal-degree Bilu–Tichy and equal-common-iterate Ritt contracts are named here, with their elementary consequences separated from the missing classification proofs. Audit Bilu–Tichy Theorem 10.5 and Ritt p.356, or public proofs of those exact cases; Siegel alone is insufficient. Dickson-polynomial existence and its functional identities must be imported from a polynomial-decomposition supplier rather than presumed supplied by the integral-point theorem.

**Needed by:** [`ArithmeticDynamics:DY.6/followup-bilu-tichy-equal-degree`](#bilu-tichy-equal-degree), [`ArithmeticDynamics:DY.6/followup-ritt-common-iterate`](#ritt-common-iterate).

### Tate bounded variation proof access

The accepted tate-variation-of-canonical-height endpoint is retained with its statement from Call–Silverman §4 remark, pp.183–184. The proof of Tate (1983) was not available in the cleared library or a public version in this pass. The remaining contract is construction of the parameter divisor of degree the generic Néron–Tate height, with fibrewise local-height comparisons whose adelic error sums to O(1). Do not replace it by the weaker specialization limit.

**Needed by:** [`ArithmeticDynamics:DY.6/tate-variation-of-canonical-height`](../packets/ArithmeticDynamics.json).

## Pinned algebraic baseline

These declarations were read at the pins. Routine polynomial-evaluation identities stay in the proof routes; the baseline below records the substantive library interfaces.

| Declaration | Module | Sufficient contract |
| --- | --- | --- |
| [`exists_finset_isTranscendenceBasis`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/FinTrdeg.lean) | `Mathlib/FieldTheory/FinTrdeg.lean` | A FinTrdeg field extension has a finite transcendence basis; EssFiniteType supplies FinTrdeg. |
| [`IntermediateField.fg_top_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean` | Finite field generation is equivalent to Algebra.EssFiniteType. |
| [`Algebra.finite_of_essFiniteType_of_isAlgebraic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean` | An algebraic essentially finite type field extension is module finite. |
| [`Field.exists_primitive_element`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PrimitiveElement.lean) | `Mathlib/FieldTheory/PrimitiveElement.lean` | A finite-dimensional separable extension has a single intermediate-field generator. |
| [`AlgebraicIndependent.aevalEquivField`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/Adjoin.lean) | `Mathlib/RingTheory/AlgebraicIndependent/Adjoin.lean` | Identifies the fraction field of a multivariate polynomial ring over a field with the intermediate field generated by an independent family. |
| [`PowerBasis.ofAdjoinSimpleEqTop`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` | An integral generator of the entire field gives a power basis. |
| [`PowerBasis.exists_eq_aeval`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerBasis.lean) | `Mathlib/RingTheory/PowerBasis.lean` | Every element is a polynomial in the power-basis generator of degree below its dimension. |
| [`IsLocalization.integerNormalization_spec`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Integral.lean) | `Mathlib/RingTheory/Localization/Integral.lean` | An integral polynomial normalization maps to a nonzero-denominator scalar multiple of the original polynomial. |
| [`IsLocalization.exist_integer_multiples`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Integer.lean) | `Mathlib/RingTheory/Localization/Integer.lean` | A finite family of fractions has a common denominator in the localization submonoid. |
| [`IsFractionRing.lift`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean) | `Mathlib/RingTheory/Localization/FractionRing.lean` | An injective ring map into a field extends to its fraction field. |
| [`IsFractionRing.lift_unique`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/FractionRing.lean) | `Mathlib/RingTheory/Localization/FractionRing.lean` | The fraction-field extension is unique once its values on the ring are fixed. |
| [`IntermediateField.adjoinRootEquivAdjoin`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` | AdjoinRoot of the minimal polynomial of an integral element is algebra-equivalent to its simple intermediate field. |
| [`IntermediateField.algHomAdjoinIntegralEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` | Algebra homomorphisms from a simple algebraic intermediate field correspond to roots of its minimal polynomial. |
| [`IntermediateField.algHomAdjoinIntegralEquiv_symm_apply_gen`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean) | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean` | The homomorphism associated to a root sends the simple generator to that root. |
| [`PowerBasis.algHom_ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerBasis.lean) | `Mathlib/RingTheory/PowerBasis.lean` | Two algebra homomorphisms agree if their values on the power-basis generator agree. |

## Source record

Read date: 14 October 2026. All source statements and proof routes above are written in our own words. No source passage, PDF or extracted text is part of the deliverable. The packet records public URLs, versions and PDF hashes. A consumer statement read here does not certify an unread cited supplier proof.

- **J. W. S. Cassels.** [An embedding theorem for fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5D685D8FAFAC403B5CAE3170656D23B2/S000497270002503Xa.pdf/an-embedding-theorem-for-fields.pdf). Bull. Austral. Math. Soc. 14 (1976), 193–198; publisher scan read 2026-10-14. Read: Theorem I, p.193; full proof pp.195–198, particularly the integral presentation (2), p.195 and transport (10), p.197.
- **J. W. S. Cassels.** [An embedding theorem for fields: Addendum](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/448105F250CB98358EC731D0FEB4A61A/S0004972700025442a.pdf/an_embedding_theorem_for_fields_addendum.pdf). Bull. Austral. Math. Soc. 14 (1976), 479–480; publisher scan read 2026-10-14. Read: Both pp.479–480; elementary replacement for Lemma 2.
- **Jason P. Bell.** [A generalised Skolem–Mahler–Lech theorem for affine varieties](https://arxiv.org/pdf/math/0501309v2). arXiv:math/0501309v2; §3 read 2026-10-14. Read: §3, Lemma 3.1 and proof, pp.5–6.
- **Gregory S. Call and Joseph H. Silverman.** [Canonical heights on varieties with morphisms](https://www.numdam.org/item/CM_1993__89_2_163_0.pdf). Compositio Math. 89 (1993), 163–205; Numdam scan read 2026-10-14. Read: §1 setting p.166; §3 setting and Theorem 3.1 pp.177–182; §4 Theorem 4.1, remark and proof pp.183–186.
- **Dragos Ghioca, Thomas J. Tucker and Michael E. Zieve.** [Intersections of polynomial orbits, and a dynamical Mordell-Lang conjecture](https://arxiv.org/abs/0705.1954v2). arXiv:0705.1954v2; read 2026-10-14; published pagination is not used. Read: §2.1 Theorem 2.1 and Corollary 2.2, pp.5–6; §5 linear-case argument; §6.1 Proposition 6.3 and Corollary 6.4, p.17; §6.2 pp.17–18.
- **Patrick Ingram.** [The critical height is a moduli height](https://arxiv.org/abs/1610.07904v3). arXiv:1610.07904v3; read 2026-10-14. Read: Lemma 8 and its two proofs pp.7–8; Lemmas 13–15 and proof of Theorem 1 pp.14–16.
- **John Milnor.** [On Lattès maps](https://arxiv.org/abs/math/0402147v2). arXiv:math/0402147v2; read 2026-10-14. Read: §2 Definition 2.1, pp.2–3; §5 Theorem 5.1, Corollary 5.2, Lemmas 5.3–5.5 and proofs pp.15–18.
- **Jason P. Bell, Dragos Ghioca and Thomas J. Tucker.** [The dynamical Mordell-Lang problem for étale maps](https://arxiv.org/abs/0808.3266v1). arXiv:0808.3266v1; read 2026-10-14. Read: §2 Propositions 2.1–2.2 pp.4–6; §4 coefficient embedding and models pp.12–15.
- **Laura DeMarco, Xiaoguang Wang and Hexi Ye.** [Torsion points and the Lattès family](https://arxiv.org/pdf/1311.1792v3). arXiv:1311.1792v3; read 2026-10-14. Read: Proposition 1.4 and Theorem 1.5 statements p.3; Proposition 3.1 and proof pp.9–10; §4 setting and conclusion pp.12–19 inspected (cusp estimates not fully audited); §6.5 infinitude argument pp.28–29.
- **Robert L. Benedetto.** [Heights and preperiodic points of polynomials over function fields](https://rlbenedetto.people.amherst.edu/papers/ffheights.pdf). Author copy revised December 12, 2005; read 2026-10-14. Read: Theorems A and B p.2; Lemmas 5.1–5.3 pp.6–7; Proposition 6.1 and proof of Theorem A pp.7–8.
- **Charles Favre.** [Degeneration of endomorphisms of the complex projective space in the hybrid space](https://arxiv.org/pdf/1611.08490v2). arXiv:1611.08490v2; read 2026-10-14. Read: Theorem B pp.2–3; model-function statements Theorems 2.10 and 2.12; §4.1 Definition 4.1 and Theorem 4.2; §4.3 Proposition 4.4 and proof of Theorem B pp.29–31.
- **Curt McMullen.** [Families of rational maps and iterative root-finding algorithms](https://doi.org/10.2307/1971408). Ann. of Math. 125 (1987), 467–493; author-hosted scan read 2026-10-14, publisher DOI used as stable citation link. Read: Rendered printed pp.472–473: Lemma 2.1, Theorem 2.2, Corollary 2.3. The rigidity proofs in §§4–6 have not been audited.

The DeMarco–Faber I and II statements were also screened to choose the degeneration route. Theorem D of Part II concerns analytic stabilization, rather than the hybrid weak limit. Favre supplies the latter and the separate potential estimate. This corrects the inherited gap locator, and is not an allegation of a published source error. Ingram’s reference [21] is Silverman’s *Moduli Spaces and Arithmetic Dynamics* (2012), not *The Arithmetic of Dynamical Systems*. The public sample of the latter was screened and does not supply the needed representative-height proof. Neither that cited book nor Tate’s article was available in the cleared library.

## Accepted-node import manifest

Every row imports the exact statement, conventions, direct prerequisites, acceptance checks and (for definitions/constructions) APIs and tests from [ArithmeticDynamics.json](../packets/ArithmeticDynamics.json). The corresponding prose is in the [accepted DY.6 reader](ArithmeticDynamics.md#dy6-families-unlikely-intersections-and-frontiers). The supplemental routes above replace only the named open proof leaves when assembling the union. This explicit manifest prevents dropping inherited endpoints or silently redeclaring them with new ids.

| Imported node id | Target |
| --- | --- |
| `ArithmeticDynamics:DY.6/power-map` | The power map z ↦ z^d on the projective line |
| `ArithmeticDynamics:DY.6/power-map-preperiodic-points` | Preperiodic and periodic points of the power map |
| `ArithmeticDynamics:DY.6/power-map-escape-rate` | Escape rate, local canonical heights and canonical measure of the power map |
| `ArithmeticDynamics:DY.6/power-map-dynatomic-polynomials` | Dynatomic polynomials of the power map are products of cyclotomic polynomials |
| `ArithmeticDynamics:DY.6/power-map-preimage-tree` | The preimage tree of the power map and its Kummer Galois action |
| `ArithmeticDynamics:DY.6/lattes-map` | The Lattès map of multiplication by n on a Weierstrass curve |
| `ArithmeticDynamics:DY.6/lattes-map-semiconjugacy` | The Lattès map semiconjugates multiplication by n |
| `ArithmeticDynamics:DY.6/lattes-map-comp` | Composition of Lattès maps: f_{E,m} ∘ f_{E,n} = f_{E,mn} |
| `ArithmeticDynamics:DY.6/lattes-map-preperiodic-iff-torsion` | Preperiodic points of a Lattès map are the torsion images |
| `ArithmeticDynamics:DY.6/lattes-map-canonical-height` | The canonical height of a Lattès map is twice the Néron–Tate height |
| `ArithmeticDynamics:DY.6/two-torsion-translation` | Translation by a 2-torsion point acts on the x-line by a Möbius involution |
| `ArithmeticDynamics:DY.6/flexible-lattes-map` | Flexible Lattès maps and the flexible Lattès locus |
| `ArithmeticDynamics:DY.6/lattes-map-postcritically-finite` | Flexible Lattès maps are postcritically finite |
| `ArithmeticDynamics:DY.6/legendre-lattes-map` | The Legendre curve E_t and its Lattès map f_t |
| `ArithmeticDynamics:DY.6/legendre-lattes-symmetries` | The symmetries t ↦ 1 − t and t ↦ 1/t of the Legendre Lattès family |
| `ArithmeticDynamics:DY.6/uniform-torsion-bound-of-uniform-boundedness` | Uniform boundedness for maps of ℙ¹ bounds torsion on elliptic curves (conditional) |
| `ArithmeticDynamics:DY.6/rational-function-field-heights` | Admissible absolute values and heights on a rational function field |
| `ArithmeticDynamics:DY.6/function-field-height-bound` | The height bound for a rational map over k(t) |
| `ArithmeticDynamics:DY.6/specialization-of-rational-maps` | Specialisation of a one-parameter family of rational maps and of its points |
| `ArithmeticDynamics:DY.6/specialization-commutes-with-evaluation` | Specialisation commutes with evaluation and iteration |
| `ArithmeticDynamics:DY.6/mul-height-bound-base-change` | The constant of Mathlib's height bound under extension of number fields |
| `ArithmeticDynamics:DY.6/absolute-height-bounds-for-forms` | Height bounds for forms in absolute normalisation, uniform in the field |
| `ArithmeticDynamics:DY.6/height-of-specialized-points` | The height of a specialised point grows like its degree |
| `ArithmeticDynamics:DY.6/uniform-canonical-height-bound-in-families` | Call–Silverman Theorem 3.1 for one-parameter families of maps of ℙ¹ |
| `ArithmeticDynamics:DY.6/specialization-of-canonical-heights` | Call–Silverman specialisation theorem for families of maps of ℙ¹ |
| `ArithmeticDynamics:DY.6/specialization-of-non-preperiodic-points` | Non-preperiodic points stay non-preperiodic in specialisations of large height |
| `ArithmeticDynamics:DY.6/elliptic-specialization-of-canonical-heights` | Silverman's specialisation theorem for elliptic surfaces over the t-line |
| `ArithmeticDynamics:DY.6/tate-variation-of-canonical-height` | Tate's theorem: the canonical height varies like a Weil height on the base |
| `ArithmeticDynamics:DY.6/polynomial-variation-of-canonical-height` | Ingram's theorem: bounded variation for families of polynomials over the t-line |
| `ArithmeticDynamics:DY.6/postcritically-finite-map` | Postcritically finite rational maps |
| `ArithmeticDynamics:DY.6/critical-height` | The critical height of a rational map |
| `ArithmeticDynamics:DY.6/critical-height-conjugation-invariant` | The critical height is invariant under conjugation |
| `ArithmeticDynamics:DY.6/critical-height-eq-zero-iff-postcritically-finite` | Zero critical height characterises postcritically finite maps |
| `ArithmeticDynamics:DY.6/critical-height-of-iterate` | The critical height of an iterate |
| `ArithmeticDynamics:DY.6/critical-height-is-a-moduli-height` | Ingram's theorem: the critical height is a moduli height |
| `ArithmeticDynamics:DY.6/legendre-escape-rate-symmetries` | Symmetries of the Legendre escape rates (DeMarco–Krieger–Ye Proposition 2.1) |
| `ArithmeticDynamics:DY.6/legendre-local-energy-symmetries` | Symmetries of the local energy (DeMarco–Krieger–Ye Proposition 2.3) |
| `ArithmeticDynamics:DY.6/legendre-canonical-measure-away-from-two` | Good reduction and canonical measures of f_t at places not above 2 (DeMarco–Krieger–Ye Proposition 3.2) |
| `ArithmeticDynamics:DY.6/legendre-escape-rate-away-from-two` | Explicit escape rates of f_t at places not above 2 (DeMarco–Krieger–Ye Propositions 3.3–3.4) |
| `ArithmeticDynamics:DY.6/legendre-canonical-measure-above-two` | Canonical measures of f_t at places above 2 (DeMarco–Krieger–Ye Proposition 3.5) |
| `ArithmeticDynamics:DY.6/legendre-escape-rate-above-two` | Explicit escape rates of f_t at places above 2 (DeMarco–Krieger–Ye Proposition 3.6) |
| `ArithmeticDynamics:DY.6/nonarchimedean-legendre-energy-lower-bound` | Lower bound for the nonarchimedean local energy (DeMarco–Krieger–Ye Theorem 3.1) |
| `ArithmeticDynamics:DY.6/legendre-measure-degeneration` | Degeneration of the maximal-entropy measures of f_t at a cusp (DeMarco–Faber, Favre) |
| `ArithmeticDynamics:DY.6/legendre-measure-on-annuli-near-cusp` | Equidistribution of μ_t on annuli near a cusp (DeMarco–Krieger–Ye Lemma 4.1 and (4.4)) |
| `ArithmeticDynamics:DY.6/legendre-potential-continuity-near-cusp` | Uniform continuity of the normalised potentials near a cusp (DeMarco–Krieger–Ye Propositions 4.2–4.3) |
| `ArithmeticDynamics:DY.6/legendre-regularization-estimate` | Regularising finite sets against μ_t (DeMarco–Krieger–Ye Proposition 4.4) |
| `ArithmeticDynamics:DY.6/archimedean-energy-one-escaping-parameter` | Archimedean energy with one parameter at a cusp (DeMarco–Krieger–Ye Theorem 5.1) |
| `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp-bounded-ratio` | Archimedean energy with both parameters at the same cusp, bounded ratio (DeMarco–Krieger–Ye Proposition 5.3) |
| `ArithmeticDynamics:DY.6/archimedean-energy-same-cusp` | Archimedean energy with both parameters at the same cusp (DeMarco–Krieger–Ye Theorems 5.2 and 5.4) |
| `ArithmeticDynamics:DY.6/archimedean-energy-opposite-cusps` | Archimedean energy with parameters at the cusps 0 and ∞ (DeMarco–Krieger–Ye Theorem 5.5) |
| `ArithmeticDynamics:DY.6/archimedean-good-places-energy-bound` | Energy at archimedean good places (DeMarco–Krieger–Ye Lemma 6.1) |
| `ArithmeticDynamics:DY.6/good-places-energy-sum-bound` | Sum of energies over good places (DeMarco–Krieger–Ye Lemma 6.2) |
| `ArithmeticDynamics:DY.6/birational-height-comparison` | A birational height comparison (DeMarco–Krieger–Ye Lemma 6.3) |
| `ArithmeticDynamics:DY.6/legendre-pairing-height-lower-bound` | The Arakelov–Zhang pairing of Legendre heights grows with the parameter height (DeMarco–Krieger–Ye Theorem 1.6; published Theorem 1.7) |
| `ArithmeticDynamics:DY.6/legendre-pairing-uniform-positivity` | Uniform positivity of the Arakelov–Zhang pairing (DeMarco–Krieger–Ye Theorem 1.5; published Theorem 1.6) |
| `ArithmeticDynamics:DY.6/legendre-joint-small-points-finite` | Finiteness of joint small points (DeMarco–Krieger–Ye Proposition 1.8; published Proposition 1.9) |
| `ArithmeticDynamics:DY.6/legendre-pairing-upper-bound-regularized` | Upper bound for the pairing against a regularised finite set (DeMarco–Krieger–Ye Proposition 7.3) |
| `ArithmeticDynamics:DY.6/legendre-pairing-upper-bound-small-points` | The pairing is small when there are many common small points (DeMarco–Krieger–Ye Theorem 7.1 and Theorem 1.7; published Theorem 7.1 and Theorem 1.8) |
| `ArithmeticDynamics:DY.6/legendre-uniform-joint-small-points` | Uniform bound on joint small points over ℚ̄ (DeMarco–Krieger–Ye Theorem 8.1) |
| `ArithmeticDynamics:DY.6/torsion-images-common-to-all-legendre-curves` | The only torsion images common to all Legendre curves are 0, 1, ∞ (DeMarco–Wang–Ye Proposition 1.4) |
| `ArithmeticDynamics:DY.6/algebraic-specialization-of-finitely-generated-algebras` | Specialising a finitely generated domain to ℚ̄ while keeping finitely many elements nonzero |
| `ArithmeticDynamics:DY.6/legendre-uniform-common-torsion-images` | Uniform common torsion images for pairs of Legendre curves (DeMarco–Krieger–Ye Theorem 1.4; published Theorem 1.5) |
| `ArithmeticDynamics:DY.6/standard-projection` | Standard projections of an elliptic curve |
| `ArithmeticDynamics:DY.6/common-torsion-images-three-common-branch-values` | The Bogomolov–Fu–Tschinkel bound with three common branch values (DeMarco–Krieger–Ye Corollary 8.2) |
| `ArithmeticDynamics:DY.6/common-torsion-image-orders-unbounded` | No uniform bound on the order of common torsion images (DeMarco–Krieger–Ye Proposition 8.3, published version) |
| `ArithmeticDynamics:DY.6/finite-union-of-arithmetic-progressions` | Finite unions of arithmetic progressions in ℕ |
| `ArithmeticDynamics:DY.6/dynamical-mordell-lang-conjecture` | The dynamical Mordell–Lang conjecture (statement) |
| `ArithmeticDynamics:DY.6/strassmann-theorem` | Strassmann's theorem: a nonzero p-adic power series convergent on ℤ_p has finitely many zeros there |
| `ArithmeticDynamics:DY.6/p-adic-power-series-coordinates` | Power-series coordinates on a residue disc (Bell–Ghioca–Tucker Propositions 2.1–2.2, Remark 2.3) |
| `ArithmeticDynamics:DY.6/p-adic-residue-class-returns` | An unramified map returns to the residue class to first order (Bell–Ghioca–Tucker Propositions 2.4 and 2.6) |
| `ArithmeticDynamics:DY.6/p-adic-analytic-interpolation-of-orbits` | p-adic analytic interpolation of orbits (Bell–Ghioca–Tucker Theorem 3.3) |
| `ArithmeticDynamics:DY.6/schur-prime-avoiding` | Prime divisors of polynomial values avoiding prescribed primes |
| `ArithmeticDynamics:DY.6/lech-integral-specialization-certificate` | Integral specialization preserving separability and marked denominators |
| `ArithmeticDynamics:DY.6/lech-specialized-simple-prime` | Simple-root primes for a family with prescribed denominator exclusions |
| `ArithmeticDynamics:DY.6/simple-root-prime-avoiding` | Simple roots modulo primes from an integral Bézout certificate |
| `ArithmeticDynamics:DY.6/hensel-root-of-simple-reduction` | Hensel lifting from a simple residue-field root |
| `ArithmeticDynamics:DY.6/lech-padic-independent-family` | Algebraically independent finite families in a p-adic field |
| `ArithmeticDynamics:DY.6/lech-affine-independent-family` | Rational affine changes of algebraically independent coordinates |
| `ArithmeticDynamics:DY.6/lech-independent-residue-tuple` | Independent p-adic parameters in prescribed residue classes |
| `ArithmeticDynamics:DY.6/lech-residue-hensel-lift` | Hensel specialization preserving degree and denominator units |
| `ArithmeticDynamics:DY.6/lech-independent-hensel-specialization` | Algebraically independent integral specialization with a simple root |
| `ArithmeticDynamics:DY.6/lech-embedding-lemma` | Embedding a finitely generated field into ℚ_p with prescribed integral elements (Lech–Cassels) |
| `ArithmeticDynamics:DY.6/lech-embedding-units` | Cassels embedding with prescribed p-adic units |
| `ArithmeticDynamics:DY.6/lech-embedding-localized-adjoin` | Integral images of a localized coefficient ring |
| `ArithmeticDynamics:DY.6/etale-dynamical-mordell-lang` | The dynamical Mordell–Lang theorem for étale maps (Bell–Ghioca–Tucker) |
| `ArithmeticDynamics:DY.6/etale-model-over-finitely-generated-ring` | Spreading out an unramified endomorphism (Bell–Ghioca–Tucker Proposition 4.3) |
| `ArithmeticDynamics:DY.6/p-adic-model-of-unramified-endomorphism` | A p-adic model of an unramified endomorphism (Bell–Ghioca–Tucker Proposition 4.4) |
| `ArithmeticDynamics:DY.6/polynomial-orbits-on-lines-equal-degree` | Orbits of polynomials of equal degree meeting a line (Ghioca–Tucker–Zieve Theorems 1.5 and 1.1) |
| `ArithmeticDynamics:DY.6/polynomial-lines-dynamical-mordell-lang` | The dynamical Mordell–Lang theorem for lines under split polynomial maps (Ghioca–Tucker–Zieve Theorem 1.4) |
| `ArithmeticDynamics:DY.6/dml-fails-in-positive-characteristic` | The dynamical Mordell–Lang statement fails in positive characteristic (Ghioca Example 1.4) |
| `ArithmeticDynamics:DY.6/dynamical-lehmer-conjecture` | The dynamical Lehmer conjecture for maps of ℙ¹ (statement) |
| `ArithmeticDynamics:DY.6/dynamically-related-points` | Dynamically related points of a map over a function field |
| `ArithmeticDynamics:DY.6/dynamical-andre-oort-conjecture` | The dynamical André–Oort conjecture for one-parameter families (statement) |

## Acceptance of the assembled plan

- Keep all 93 imported nodes and the six existing planets. Add the 21 supplemental nodes without duplicate ids. Every new construction/definition has its complete planning API and at least three discriminating tests.
- For the Lech endpoint, check n=0, degree-one extensions, zero marks, a common parameter-only denominator, a selected root in a non-algebraically-closed target, uniqueness of the whole-field map, and transported marked evaluation. No extra residue/Hensel gap is introduced.
- For specialization, check a degree-one normalized curve height, the generic intersection degree, real eigenclasses with eigenvalue greater than one, and uniformity of the relative canonical-height estimate. Require the RP.0 requests before declaring this chain closed.
- For all analytic/classification conclusions, retain the named proof leaves above. Require both hybrid potential and measure contracts; all affine Lattès classes in multiplier finiteness; branch values rather than critical points in the quantitative local input; distinct orbit values in the linear case.
- Check the packet and its references with the repository blueprint checker. Elaborate the compact companion suggested file at the pins, allowing only placeholder-proof warnings. Its heavy-carrier omissions are explicit reader targets, not missing roadmap statements.
