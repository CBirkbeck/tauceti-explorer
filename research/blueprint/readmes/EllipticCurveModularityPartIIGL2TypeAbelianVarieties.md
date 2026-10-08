# Modularity and modular parametrisations of elliptic curves over Q, Part II: abelian varieties of GL₂-type

Starting where the modularity of elliptic curves over ℚ stops, this Part II proves that every abelian variety over ℚ of GL₂-type is a quotient of a modular Jacobian J₁(N) (Ribet's reduction, made unconditional by Khare–Wintenberger, Corollary 10.2(i)), with the exact level cond(A)^{1/dim A} given by Carayol's conductor theorem. It develops the endomorphism algebra and the two-dimensional λ-adic system of such a variety, the equivalent forms of modularity, the L-function, and Ribet's theory of ℚ-curves: a non-CM elliptic curve isogenous to all its Galois conjugates is a factor of a GL₂-type variety, hence modular over ℚ̄ and, over a solvable Galois field of definition, automorphic of parallel weight two.

R29 of EllipticCurveModularity supplies the elliptic case. GT.1–GT.4 generalize its endomorphism, residual-witness, newform and isogeny steps. GT.5–GT.6 construct and apply the Q-curve bridge. The GL₂-type definition and Tate components stay with R25.5 and R01.6; general abelian-variety, modular-curve, CM, cohomology and automorphic theory stay with their suppliers.

## Conventions and native interfaces

An abelian variety means the pinned TauCeti.AlgebraicGeometry.AbelianVariety over its stated field. End⁰ is the rational tensor product of its native End ring. Its hom-sets carry a multiplicatively written pointwise commutative group law; the native category is not assumed preadditive. Powers are native finite categorical products. Native dimension is in WithBot ℕ∞; the bridge identifies it with the natural-number rank of the native tangent space. E-equivariance of an actual isogeny can be expressed by clearing a common integer denominator in both rational actions and requiring the resulting integral endomorphisms to commute with that isogeny.

The GL₂(E)-type input is an E-action with [E:ℚ]=dim A. “Simple” means positive-dimensional and having no proper positive-dimensional abelian subvariety over the stated field. Unless a result explicitly discusses powers, the modularity argument assumes ℚ-simplicity. Frobenius is arithmetic; χ_ℓ has Hodge–Tate weight 1. The conjugation bar on E is its canonical CM involution, or the identity in the totally real case. Levels are positive; an ambient modular level need not be the least level or a newform’s level.

A Q-curve is a nonsingular Weierstrass curve over ℚ̄, geometrically isogenous to every coefficientwise Galois conjugate. The pinned isogeny map laws give identity and composition coherence. Connecting this elliptic carrier to dimension-one abelian varieties is an A1 supplier interface. For cocycles use canonical continuous cohomology on the trivial discrete modules Additive ℚˣ and Additive ℚ̄ˣ. In particular the second action is trivial, not the natural Galois action. Explicit continuous cocycles and inflation already exist; their comparison with canonical cohomology in degree two remains a supplier export.

All six stages have complete target-level plans and status planned. All implementation statuses are unchecked. The suggested file distinguishes native signatures, partial signatures and omitted signatures item by item. Unavailable supplier exports are genuine gaps, described at the end; no private geometric or cohomological carrier fills them.

## GT.1 — Abelian varieties of GL₂-type and their endomorphism algebras

### The degree of an acting division algebra divides the dimension

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/lie-algebra-divisibility` (lemma).

Let A be an abelian variety over ℚ and D a division ℚ-algebra with a unital ℚ-algebra map D → End⁰_ℚ(A). Then dim_ℚ D divides dim A. In particular, if A is of GL₂(E)-type (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety) and B ⊆ A is a nonzero abelian subvariety over ℚ on which E acts up to isogeny, then B = A.

Conventions: the map D → End⁰_ℚ(A) sends 1 to the identity; B is stable under E up to isogeny: every e ∈ E has a multiple n·e ∈ End_ℚ(A) mapping B into B

Construction or proof:

1. End⁰_ℚ(A) acts ℚ-linearly on the tangent space Lie(A/ℚ) = T₀A (Tau Ceti AbelianVariety.TangentSpace), of ℚ-dimension dim A; an isogeny induces an isomorphism on tangent spaces in characteristic 0, so endomorphisms up to isogeny act.
2. A unital module over a division algebra is free, so dim_ℚ D divides dim_ℚ Lie(A/ℚ) = dim A.
3. For B: E acts on Lie(B/ℚ), of dimension dim B, so [E : ℚ] = dim A divides dim B ≤ dim A, whence B = A.

Acceptance:

- For E × E with E an elliptic curve over ℚ, every quadratic field acting has degree 2 = dim; no cubic field acts.
- Over 𝔽_p the tangent-space argument fails: the Frobenius endomorphism acts by zero on Lie.

Direct prerequisites: `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`.

Source: Ribet92, §2, p. 2 — Ribet's Lie-algebra argument over ℚ, used again in the proof of Theorem 2.1 for the division algebra D and for subvarieties.

Suggested coverage: signature-fragment. The divisor conclusion is stated for the actual tangent module and its actual finrank. Omitted: constructing the D-action from the native End0 action, and the E-stable-subvariety consequence; requires AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. finiteDim_eq_dim explicitly states the native dimension bridge owned by A1.

### Primitive abelian varieties of GL₂-type and the power construction

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/primitive` (definition).

For B of GL₂(F)-type over ℚ (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety) and a finite extension E/F of degree n with a chosen F-basis, the power construction E ⊗_F B is Bⁿ with E acting through the regular representation E ↪ M_n(F) followed by M_n(F) ↪ M_n(End⁰_ℚ(B)) = End⁰_ℚ(Bⁿ); it is of GL₂(E)-type. An abelian variety A of GL₂(E)-type over ℚ is primitive if it is not ℚ-isogenous, compatibly with the E-actions, to a power construction E ⊗_F B with [E : F] > 1.

Conventions: the isogeny class of E ⊗_F B with its E-action does not depend on the chosen F-basis of E

Construction or proof:

1. Embed E into M_n(F) by its action on the chosen basis and let M_n(F) act on Bⁿ by matrices with entries in the image of F (A6: End⁰(Bⁿ) = M_n(End⁰(B))).
2. Then [E : ℚ] = n[F : ℚ] = n dim B = dim Bⁿ, so the construction is of GL₂(E)-type; a change of basis conjugates the embedding by an element of GL_n(F) ⊆ GL_n(End⁰_ℚ(B)), which is an E-equivariant isogeny of Bⁿ.

API:

- `GL2Type.power` (constructor): E ⊗_F B for B of GL₂(F)-type over ℚ and a finite extension E/F with a chosen F-basis.
- `GL2Type.power_dim` (simp): dim (E ⊗_F B) = [E : F] · dim B.
- `GL2Type.power_basis_indep` (characterisation): The power constructions for two F-bases of E are E-equivariantly ℚ-isogenous (the change of basis has entries in F, acting through End⁰).
- `GL2Type.IsPrimitive` (data): The predicate on (A, E): not E-equivariantly ℚ-isogenous to a power construction with [E : F] > 1.
- `GL2Type.IsPrimitive.of_isogeny` (functoriality): Primitivity is invariant under E-equivariant ℚ-isogeny.
- `GL2Type.isPrimitive_iff_isSimple` (equivalence): A is primitive if and only if A is ℚ-simple (GT.1/ribet-theorem-2-1).

Unit tests:

- `GL2Type.power_degree_one` (degenerate): For E = F the power construction is B itself with its structure, and B is primitive exactly when it is ℚ-simple.
- `GL2Type.power_not_primitive` (non-example): For an elliptic curve B over ℚ and E = ℚ(√2), E ⊗_ℚ B = B × B is of GL₂(E)-type but not primitive.
- `GL2Type.J0_23_primitive` (computation): J₀(23), of dimension two with E = ℚ(√5) acting through the Hecke algebra, is primitive.
- `GL2Type.power_compat_R25_5` (compatibility): The power construction satisfies the definition of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety: [E : ℚ] = dim (E ⊗_F B).

Acceptance:

- For n > 1, E ⊗_F B = Bⁿ is not ℚ-simple.
- Every elliptic curve over ℚ is primitive (E = ℚ).

Direct prerequisites: `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`.

Source: Ribet92, §2, p. 3 — Ribet's definition of primitive, after the matrix construction A = E ⊗_F B.

Suggested coverage: signature-fragment. Native finite product, regular E-action, denominator-cleared E-equivariance and primitivity are stated, with action-compatible degree-one and concrete ℚ(√2) power tests. Omitted: the canonical R25.5 bundle comparison and the actual Hecke-J₀(23) specialization. The action construction imports A6 native matrix-End0; the Jacobian test needs R14.2/R14.5 actual Hecke action.

| Item | Suggested status |
| --- | --- |
| `GL2Type.power` | signature-fragment |
| `GL2Type.power_dim` | signature |
| `GL2Type.power_basis_indep` | signature |
| `GL2Type.IsPrimitive` | signature |
| `GL2Type.IsPrimitive.of_isogeny` | signature |
| `GL2Type.isPrimitive_iff_isSimple` | signature |
| `GL2Type.power_degree_one` | example |
| `GL2Type.power_not_primitive` | example |
| `GL2Type.J0_23_primitive` | omitted |
| `GL2Type.power_compat_R25_5` | example-fragment |

### Ribet's Theorem 2.1: primitive, simple and maximal endomorphism field

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/ribet-theorem-2-1` (theorem).

Let A be of GL₂(E)-type over ℚ and X = End⁰_ℚ(A). The commutant of E in X is E. The centre F of X is a subfield of E, X ≅ M_n(F) with n = [E : F], and A is E-equivariantly ℚ-isogenous to E ⊗_F B for a ℚ-simple B of GL₂(F)-type with End⁰_ℚ(B) = F. Consequently the following are equivalent: (i) A is primitive; (ii) A is ℚ-simple; (iii) X is a number field of degree dim A; and then X = E.

Construction or proof:

1. The commutant D of E in X is a division algebra: a nonzero endomorphism commuting with E has image B ⊆ A on which E acts, so B = A by GT.1/lie-algebra-divisibility, and the endomorphism is an isogeny (A6).
2. Lie(A/ℚ) is a D-module, so dim_ℚ D divides dim A = [E : ℚ] (GT.1/lie-algebra-divisibility); as E ⊆ D, D = E. Hence E is a maximal commutative subalgebra of the semisimple algebra X (A6) and the centre F of X lies in E.
3. X is simple (its centre F is a field), so X ≅ M_n(Q) with Q a division algebra of dimension t² over F, and maximality of E gives nt = [E : F]. A is isogenous to Bⁿ with End⁰(B) = Q (A6, Poincaré reducibility), and the Lie argument gives n t² [F : ℚ] | [E : ℚ] = nt[F : ℚ], so t = 1, Q = F and n = [E : F].
4. Each of (i)–(iii) is equivalent to n = 1.

Acceptance:

- For A = B × B with B an elliptic curve over ℚ without CM and E = ℚ(i): X = M₂(ℚ), F = ℚ, n = 2.
- For J₀(23): X = ℚ(√5), n = 1.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/lie-algebra-divisibility`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/primitive`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

Source: Ribet92, Theorem 2.1, p. 3 — The statement; Ribet92, proof of Theorem 2.1, p. 3 — The commutant step; the rest of the proof gives X ≈ M(n, F).

Suggested coverage: signature-fragment. The simple⇒E≃End0 implication is stated on native varieties and the exact R25.5 degree equation. Omitted: the full matrix decomposition and bundled three-way field/primitive equivalence; AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action must export the native matrix decomposition and coherent field structure. isPrimitive_iff_isSimple separately states the primitive/simple equivalence.

Atlas planet: Ribet's endomorphism theorem.

### The endomorphism field of a ℚ-simple GL₂-type variety

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/endomorphism-field` (construction).

For a ℚ-simple abelian variety A over ℚ admitting a GL₂(E)-type structure, the endomorphism field is E_A := End⁰_ℚ(A), a number field of degree dim A (GT.1/ribet-theorem-2-1), with its tautological GL₂(E_A)-type structure. Every GL₂(E)-type structure ι : E → End⁰_ℚ(A) is an isomorphism E ≅ E_A, so the λ-adic representations of R25.5 for (A, E) and (A, E_A) correspond under ι.

Conventions: A is ℚ-simple and of GL₂(E)-type for some E (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety)

Construction or proof:

1. By GT.1/ribet-theorem-2-1, X = End⁰_ℚ(A) is a number field of degree dim A containing ι(E), hence equal to ι(E).
2. Transport of structure along ι identifies the λ-adic representations V_λ(A) for E and for E_A.

API:

- `GL2Type.endField` (data): E_A = End⁰_ℚ(A) as a field, for ℚ-simple A of GL₂-type.
- `GL2Type.endField_numberField` (instance): E_A is a number field.
- `GL2Type.endField_finrank` (projection): [E_A : ℚ] = dim A.
- `GL2Type.endField_isGL2Type` (constructor): The tautological GL₂(E_A)-type structure in the sense of R25.5.
- `GL2Type.endField_equiv` (characterisation): Every GL₂(E)-type structure ι on A is a field isomorphism E ≃ E_A.
- `GL2Type.endField_isogeny` (functoriality): A ℚ-isogeny φ : A → A′ induces E_A ≃ E_{A′}, α ↦ φ ∘ α ∘ φ⁻¹, compatibly with the λ-adic representations.
- `GL2Type.endField_involution` (other): The canonical involution of E_A (GT.1/totally-real-or-cm) is the Rosati involution of every ℚ-polarization.

Unit tests:

- `GL2Type.endField_elliptic` (degenerate): For an elliptic curve E₀ over ℚ, E_{E₀} = ℚ (End_ℚ(E₀) = ℤ, EllipticCurveModularity:R29.1).
- `GL2Type.endField_J0_23` (computation): E_{J₀(23)} = ℚ(√5), generated by the Hecke operator T₂ with T₂² + T₂ − 1 = 0.
- `GL2Type.endField_J1_13` (computation): E_{J₁(13)} = ℚ(√−3), a CM field, matching the order-6 character of the newform of level 13.
- `GL2Type.endField_not_simple` (non-example): For B × B with B an elliptic curve over ℚ, End⁰_ℚ = M₂(ℚ) is not a field: simplicity is needed.

Acceptance:

- For an elliptic curve over ℚ, E_A = ℚ.
- For J₀(23), E_A = ℚ(√5); for J₁(13), E_A = ℚ(√−3).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/ribet-theorem-2-1`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

Source: Ribet92, §3, p. 4 — Ribet's normalisation E = End⁰_ℚ(A) for the varieties of §3.

Suggested coverage: signature-fragment. Canonical native End0, the E-algebra equivalence, compatible Field/NumberField existence, degree and isogeny conjugation on integral endomorphisms are stated. Field existence explicitly preserves the original Ring operations. Omitted: a canonical global field-instance API/R25.5 bundle, Rosati restriction and λ-adic transport law, requiring A6/A2 and R01.6. Actual J₀(23) must retain Hecke T₂, T₂²+T₂−1=0 and End0=ℚ[T₂]; R14.2/R14.5 supplies those native objects.

| Item | Suggested status |
| --- | --- |
| `GL2Type.endField` | signature-fragment |
| `GL2Type.endField_numberField` | signature |
| `GL2Type.endField_finrank` | signature |
| `GL2Type.endField_isGL2Type` | omitted |
| `GL2Type.endField_equiv` | signature |
| `GL2Type.endField_isogeny` | signature-fragment |
| `GL2Type.endField_involution` | omitted |
| `GL2Type.endField_elliptic` | example-fragment |
| `GL2Type.endField_J0_23` | omitted |
| `GL2Type.endField_J1_13` | omitted |
| `GL2Type.endField_not_simple` | example |

Atlas planet: Endomorphism field.

### The endomorphism field is totally real or CM, with the Rosati involution as canonical involution

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/totally-real-or-cm` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A). Then E is a totally real field or a CM field, and for every polarization of A defined over ℚ the Rosati involution preserves E and restricts to its canonical involution e ↦ ē (the identity if E is totally real, complex conjugation if E is CM). In particular the involution does not depend on the polarization.

Construction or proof:

1. A ℚ-polarization λ defines the Rosati involution † on End⁰_ℚ(A) = E (A2), a positive involution: Tr(x x†) > 0 for x ≠ 0 (A6/rosati-positivity).
2. A number field with a positive involution is totally real with trivial involution, or CM with the involution equal to complex conjugation under every complex embedding: this is the commutative case of the Albert classification (PELModuli:M0/albert-types with B = E: types C and A of degree one).
3. The complex conjugation of a CM field is unique, so † is independent of λ.

Acceptance:

- For J₀(23), E = ℚ(√5) is totally real and every Rosati involution is the identity on E.
- For J₁(13), E = ℚ(√−3) and the Rosati involution is complex conjugation.

Direct prerequisites: `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `PELModuli:M0/albert-types`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/endomorphism-field`, `mathlib:NumberField.IsCMField`, `mathlib:NumberField.IsTotallyReal`.

Source: Ribet92, §3, p. 4 — The statement and the reason; Ribet92, §3, p. 6 — The Rosati involution is the canonical involution.

Suggested coverage: signature-fragment. The totally-real/CM alternative is stated on the actual native End0 action and native dimension equation, using Mathlib’s NumberField predicates. The Rosati restriction on every native polarization is omitted pending the A2/A6 polarization, duality and positive-involution export.

### The modular quotient A_f is ℚ-simple of GL₂-type with endomorphism field K_f

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type` (theorem).

Let f be a normalised newform of weight two on Γ₁(N) with character ε_f and coefficient field K_f, and A_f = J₁(N)/p_f J₁(N) the quotient of ModularCurvesPartII:R14.5/modular-quotient. Then the Hecke action K_f → End⁰_ℚ(A_f) is a GL₂(K_f)-type structure, A_f is ℚ-simple, and End⁰_ℚ(A_f) = K_f. Moreover J₁(N) is ℚ-isogenous to ∏_{M | N} ∏_{[g]} A_g^{d(N/M)}, the product over the Galois orbits [g] of newforms of weight two and level M | N, with d(N/M) the number of divisors of N/M.

Conventions: f is a newform: an eigenform for all T_n and diamond operators, new at level N, with a₁(f) = 1

Construction or proof:

1. dim A_f = [K_f : ℚ] and the K_f-action are ModularCurvesPartII:R14.5/modular-quotient-dimension; so A_f is of GL₂(K_f)-type.
2. V_ℓ(A_f) ≅ ⊕_{λ|ℓ} ρ_{f,λ} (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition), with the ρ_{f,λ} ⊗ ℚ̄_ℓ for the different embeddings σ : K_f → ℚ̄_ℓ absolutely irreducible (R19.1) and pairwise non-isomorphic: their traces σ(a_p(f)) at Frob_p differ for distinct σ because K_f is generated by the a_p(f), p ∤ N (ModularCurvesPartII:R14.5/newform-hecke-prime). Faltings (R28.4/semisimplicity-and-the-tate-homomorphism-comparison) gives End⁰_ℚ(A_f) ⊗ ℚ_ℓ = End_{G_ℚ} V_ℓ(A_f) = K_f ⊗ ℚ_ℓ, so End⁰_ℚ(A_f) = K_f (Ribet 1980, Cor. 4.2, by a different argument).
3. A field endomorphism algebra forces ℚ-simplicity (GT.1/ribet-theorem-2-1). The isogeny decomposition of J₁(N) follows from the old/new decomposition of S₂(Γ₁(N)) (Tau Ceti ModularForms layer 3) and the Hecke-equivariant identification of the cotangent space of J₁(N) with S₂(Γ₁(N)).

Acceptance:

- N = 11: A_f = J₀(11) = X₀(11), K_f = ℚ.
- N = 23: A_f = J₀(23), K_f = ℚ(√5).
- N = 13 on Γ₁: J₁(13) is A_f for the newform with character of order 6; K_f = ℚ(√−3) is CM.

Direct prerequisites: `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/ribet-theorem-2-1`, `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

Source: Ribet92, §3, p. 4 — A_f is of GL₂-type with End⁰ = K_f; Ribet92, §3, p. 4 — The isogeny decomposition of J₁(N).

Suggested coverage: omitted. The native A_f with its Hecke coefficient-field action requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the R25.5 bundle, together with ModularForms Layer 3 old/new decomposition.

Atlas planet: Shimura's quotient A_f.

Stage obligations: Resolve the imports from AbelianSchemesAndArithmeticModuli A2/A6 (Rosati, Poincaré, endomorphism algebras), which are planned in a packet not yet reviewed. Implement and check the native A1/A6/R25.5 signatures, coherent field/Rosati actions, and actual Hecke-J₀(23) tests recorded in suggestedCoverage.

## GT.2 — The λ-adic system of a GL₂-type abelian variety

### The integral model with endomorphism ring 𝒪_E

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/integral-model` (construction).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. There is an abelian variety A′ over ℚ with End_ℚ(A′) = 𝒪_E and an E-equivariant ℚ-isogeny A → A′. For such A′ and every maximal ideal λ of 𝒪_E, the λ-torsion A′[λ] of ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients (d) is a two-dimensional 𝔽_λ-vector space with continuous action ρ̄_λ of G_ℚ, and its semisimplification ρ̄_λ^{ss} is the semisimplified reduction of ρ_λ; it does not depend on the choice of A′.

Conventions: the residual representation of R01.6 (d) requires 𝒪_E ⊆ End_ℚ(A′); this node supplies such an A′

Construction or proof:

1. For each ℓ put L_ℓ = 𝒪_E·T_ℓ(A) ⊆ V_ℓ(A): a G_ℚ-stable, 𝒪_E-stable lattice containing T_ℓ(A), equal to it for ℓ ∤ [𝒪_E : End_ℚ(A) ∩ E]. Then K = ⊕_ℓ L_ℓ/T_ℓ(A) is a finite Galois-stable subgroup of A(ℚ̄), A′ = A/K (A3, quotients by finite subgroup schemes) has T_ℓ(A′) = L_ℓ, and every element of 𝒪_E preserves every T_ℓ(A′), hence lies in End_ℚ(A′) (A6/hom-to-tate-module-homs-is-injective, saturation of End in End ⊗ ℤ_ℓ); so End_ℚ(A′) = 𝒪_E.
2. T_ℓ(A′) is free of rank two over 𝒪_E ⊗ ℤ_ℓ (A6/trace-and-degree-on-a-subfield with R01.6 (d)), so A′[λ] = T_λ(A′)/λT_λ(A′) is two-dimensional over 𝔽_λ, and Brauer–Nesbitt gives the independence of the semisimplification from the lattice, hence from A′.

API:

- `GL2Type.integralModel` (constructor): An E-equivariantly isogenous A′ with End_ℚ(A′) = 𝒪_E.
- `GL2Type.integralModel_end` (projection): End_ℚ(integralModel A) = 𝒪_E as subrings of E.
- `GL2Type.residualRep` (data): ρ̄_λ : G_ℚ → GL(A′[λ]) ≅ GL₂(𝔽_λ), from R01.6 lambdaTorsion.
- `GL2Type.residualRep_finrank` (simp): dim_{𝔽_λ} A′[λ] = 2.
- `GL2Type.residualRep_charpoly` (characterisation): For p ∉ S, p ∉ λ: the characteristic polynomial of ρ̄_λ(Frob_p) is X² − ā_p X + ε̄(p)p, the reduction of GT.2/frobenius-polynomial.
- `GL2Type.residualRep_ss_indep` (other): ρ̄_λ^{ss} is independent of the integral model and of the lattice.

Unit tests:

- `GL2Type.residualRep_elliptic` (compatibility): For an elliptic curve E₀ over ℚ, ρ̄_ℓ is the action on E₀[ℓ] of ArithmeticGaloisRepresentations R01.6.
- `GL2Type.residualRep_det` (computation): det ρ̄_λ = ε̄ · χ̄_ℓ, the reduction of GT.2/determinant-character.
- `GL2Type.integralModel_trivial` (degenerate): If End_ℚ(A) = 𝒪_E already (for example A_f with 𝒪_{K_f} acting), A′ = A is an integral model.
- `GL2Type.residualRep_not_A_l` (non-example): A′[ℓ] is not A′[λ] unless λ = ℓ𝒪_E: A′[ℓ] = ⊕_{λ|ℓ} A′[λ^{e_λ}] has 𝔽_ℓ-dimension 2[E : ℚ].

Acceptance:

- For an elliptic curve over ℚ, A′ = A and A′[ℓ] = A[ℓ].
- Two integral models are related by an 𝒪_E-equivariant isogeny; the semisimplified residual representations agree.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/endomorphism-field`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`.

Source: Ribet92, §3, p. 7 — The integral model; Ribet92, §3, p. 7 — The residual representation.

Suggested coverage: signature-fragment. IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.

| Item | Suggested status |
| --- | --- |
| `GL2Type.integralModel` | signature |
| `GL2Type.integralModel_end` | signature |
| `GL2Type.residualRep` | omitted |
| `GL2Type.residualRep_finrank` | omitted |
| `GL2Type.residualRep_charpoly` | omitted |
| `GL2Type.residualRep_ss_indep` | omitted |
| `GL2Type.residualRep_elliptic` | omitted |
| `GL2Type.residualRep_det` | omitted |
| `GL2Type.integralModel_trivial` | example |
| `GL2Type.residualRep_not_A_l` | omitted |

### E-rationality of the Frobenius polynomials

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/frobenius-polynomial` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime p ∉ S there are algebraic integers a_p, d_p ∈ 𝒪_E such that for every prime λ of E with λ ∤ p, ρ_λ is unramified at p and the characteristic polynomial of ρ_λ(Frob_p) (arithmetic Frobenius) is X² − a_p X + d_p, read in E_λ. Thus (ρ_λ) is an E-rational strictly compatible system in Serre's sense, with exceptional set S.

Construction or proof:

1. Néron–Ogg–Shafarevich: ρ_λ is unramified at p ∉ S, p ≠ ℓ, and ρ_λ(Frob_p) is induced by the Frobenius endomorphism π_p of the reduction A_p, which commutes with E acting by reduction (R01.6 (f), R01.6/good-reduction-frobenius-polynomial).
2. For α in the commutant of E in End⁰(A_p), the E ⊗ ℚ_ℓ-linear trace t_ℓ(α) of α on the free module V_ℓ(A_p) (A6/trace-and-degree-on-a-subfield) satisfies Tr_{E⊗ℚ_ℓ/ℚ_ℓ}(e·t_ℓ(α)) = Tr(eα | V_ℓ) for all e ∈ E; the right side is the rational trace of eα ∈ End⁰(A_p), independent of ℓ (A6/characteristic-polynomial-on-tate-module). Nondegeneracy of the trace form of E (mathlib:traceForm_nondegenerate) gives t_ℓ(α) ∈ E, independent of ℓ.
3. Take a_p = t(π_p) and d_p = (t(π_p)² − t(π_p²))/2; integrality because π_p is integral over ℤ.

Acceptance:

- For E = ℚ: a_p = p + 1 − #A_p(𝔽_p) and d_p = p.
- For J₀(23), p = 2: X² − a₂X + 2 with a₂ = (−1 + √5)/2.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `mathlib:traceForm_nondegenerate`.

Source: Ribet92, §3, p. 4 — The statement, which Ribet quotes from Shimura and from Ribet 1976.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Ribet's Lemma 3.1: the determinant is ε·χ_ℓ

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. There is a character of finite order ε : G_ℚ → E^×, unramified at every p ∉ S, with det ρ_λ = ε · χ_ℓ for every prime λ of E (λ | ℓ). Equivalently d_p = ε(p)·p for p ∉ S (GT.2/frobenius-polynomial), where ε is regarded as an E-valued Dirichlet character whose conductor is divisible only by primes of S; and N_{E/ℚ}(ε) = 1.

Construction or proof:

1. Choose ℓ₀ ∉ S split completely in E (Chebotarev) and λ₀ | ℓ₀, so δ = det ρ_{λ₀} : G_ℚ → ℤ_{ℓ₀}^×. By FaltingsFinitenessAndIsogenyTheorems:R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order, δ = ⟨χ⟩^a·ε₀ with ε₀ of finite order.
2. δ is Hodge–Tate of weight 1 at ℓ₀ (GT.2/crystalline-at-good-primes), so a = 1; ε = δχ_{ℓ₀}⁻¹ is crystalline of weight 0 at ℓ₀, hence unramified there (PadicHodgeTheory:R06.2/potentially-unramified-and-characters), and unramified at p ∉ S ∪ {ℓ₀} by Néron–Ogg–Shafarevich.
3. ε(Frob_p) = d_p/p ∈ E for p ∉ S ∪ {ℓ₀}, so ε is E-valued; for every λ, det ρ_λ and εχ_ℓ agree on Frob_p for almost all p, hence are equal (Chebotarev). Comparing det_{ℚ_ℓ} V_ℓ(A) = χ_ℓ^{dim A} (R01.6/determinant-and-oddness) with ∏_λ N_{E_λ/ℚ_ℓ}(εχ_ℓ) gives N_{E/ℚ}(ε) = 1. (Ribet argues instead through locally algebraic characters and Grössencharacters of type A₀.)

Acceptance:

- For E totally real, ε = 1 and det ρ_λ = χ_ℓ, as in R01.6 (e).
- For J₁(13), ε is the character of order 6 of the newform of level 13, with values in ℚ(√−3).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/frobenius-polynomial`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/crystalline-at-good-primes`, `FaltingsFinitenessAndIsogenyTheorems:R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order`, `PadicHodgeTheory:R06.2/potentially-unramified-and-characters`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `mathlib:DirichletCharacter`, `mathlib:cyclotomicCharacter`.

Source: Ribet92, Lemma 3.1, p. 4 — The statement (the text layer renders ε as a control character); Ribet92, proof of Lemma 3.1, p. 5 — The determinant comparison.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

Atlas planet: Nebentypus character ε.

### Ribet's Lemma 3.2: the system is odd

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/odd` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. The character ε of GT.2/determinant-character is even, ε(c) = 1 for every complex conjugation c ∈ G_ℚ; equivalently det ρ_λ(c) = −1 for every λ, so every ρ_λ is odd (ArithmeticGaloisRepresentations:R01.4/odd-representation).

Construction or proof:

1. Fix ℚ̄ ⊂ ℂ. The comparison V_ℓ(A) ≅ H₁(A(ℂ), ℚ) ⊗ ℚ_ℓ is E-equivariant and identifies complex conjugation c with F_∞ ⊗ 1, F_∞ the real Frobenius on H₁(A(ℂ), ℚ), an E-linear involution of a two-dimensional E-vector space; hence V_λ ≅ H₁(A(ℂ), ℚ) ⊗_E E_λ with c acting as F_∞ ⊗ 1.
2. det_E F_∞ = +1 would force F_∞ = ±1, but F_∞ ⊗ 1 interchanges H^{-1,0} and H^{0,-1} in H₁(A(ℂ), ℚ) ⊗ ℂ, so F_∞ is not a scalar. Hence det ρ_λ(c) = −1 and ε(c) = 1 since χ_ℓ(c) = −1.
3. For E totally real this is also R01.6/determinant-and-oddness (c) with R01.6 (e); the CM case needs the Hodge decomposition.

Acceptance:

- For an elliptic curve over ℚ, det ρ_ℓ(c) = −1.
- Consequence: the newform attached in GT.3 has even character ε(−1) = 1, as weight-two forms must.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`, `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `ArithmeticGaloisRepresentations:R01.4/odd-representation`, `mathlib:Field.absoluteGaloisGroup`.

Source: Ribet92, Lemma 3.2, p. 5 — The statement; Ribet92, proof of Lemma 3.2, p. 5 — The Hodge-theoretic step.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Ribet's Proposition 3.3: absolute irreducibility

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/absolute-irreducibility` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime λ of E, ρ_λ is absolutely irreducible and End_{ℚ_ℓ[G_ℚ]} V_λ(A) = E_λ. More generally, for an open subgroup H = G_K ⊆ G_ℚ, End_{ℚ_ℓ[H]} V_ℓ(A) = End⁰_K(A) ⊗ ℚ_ℓ.

Construction or proof:

1. Faltings: V_ℓ(A) is a semisimple ℚ_ℓ[G_ℚ]-module and End_{ℚ_ℓ[G_ℚ]} V_ℓ(A) = End⁰_ℚ(A) ⊗ ℚ_ℓ = E ⊗ ℚ_ℓ (FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison; the version over K is the same theorem over K).
2. V_ℓ = ⊕_λ V_λ with E ⊗ ℚ_ℓ = ∏ E_λ acting factorwise, so each V_λ is semisimple with commutant E_λ; a semisimple module whose commutant is a field is simple, and End_{E_λ[G]} V_λ = E_λ persists after extension of scalars in characteristic 0, which is absolute irreducibility.

Acceptance:

- For E = ℚ: V_ℓ of an elliptic curve over ℚ is absolutely irreducible (EllipticCurveModularity:R29.6/absolute-irreducibility-of-the-rational-tate-module).
- Fails over a field of definition of extra endomorphisms: for a CM elliptic curve over ℚ, V_ℓ restricted to the Galois group of the CM field is reducible over ℚ̄_ℓ.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/endomorphism-field`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison`, `mathlib:IsSemisimpleModule`.

Source: Ribet92, Proposition 3.3, p. 5 — The statement; the proof cites Faltings [5].

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

Atlas planet: Ribet's irreducibility theorem.

### Ribet's Proposition 3.4: a_p = ε(p)·ā_p

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficient-conjugation` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and e ↦ ē the canonical involution of E (GT.1/totally-real-or-cm). For every p ∉ S, a_p = ε(p)·ā_p. Equivalently, for every embedding σ : E → ℚ̄_ℓ, V_σ ≅ V_{σ̄} ⊗ σ(ε), where V_σ = V_ℓ ⊗_{E⊗ℚ_ℓ, σ} ℚ̄_ℓ and σ̄ = σ ∘ (bar).

Construction or proof:

1. A polarization over ℚ gives a G_ℚ-equivariant Weil pairing ⟨ , ⟩ : V_ℓ × V_ℓ → ℚ_ℓ(1) with ⟨e x, y⟩ = ⟨x, ē y⟩ (R01.6/weil-pairing-on-tate-modules; the Rosati involution is the canonical involution by GT.1/totally-real-or-cm and A2/rosati-involution).
2. After extension of scalars this gives V_{σ̄} ≅ Hom(V_σ, ℚ̄_ℓ(1)); as V_σ is two-dimensional with determinant σ(ε)χ_ℓ, Hom(V_σ, ℚ̄_ℓ(σ(ε)χ_ℓ)) ≅ V_σ, so V_σ ≅ V_{σ̄} ⊗ σ(ε).
3. Take traces of Frob_p for p ∉ S ∪ {ℓ}: σ(a_p) = σ(ε(p))·σ(ā_p).

Acceptance:

- For E totally real, consistent with ε = 1.
- For a newform with character ε: ā_p = ε(p)⁻¹a_p, the classical relation.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/totally-real-or-cm`, `ArithmeticGaloisRepresentations:R01.6/weil-pairing-on-tate-modules`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

Source: Ribet92, Proposition 3.4, p. 6 — The conclusion a_p = ε(p)ā_p (the text layer drops the bar over the second a_p).

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Ribet's Proposition 3.5: the traces generate E

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and S′ ⊇ S a finite set of primes. Then E = ℚ(a_p : p ∉ S′).

Construction or proof:

1. Fix ℓ and let V_σ (σ : E → ℚ̄_ℓ) be the components of V_ℓ ⊗ ℚ̄_ℓ. By Faltings (GT.2/absolute-irreducibility) the commutant of G_ℚ is E ⊗ ℚ̄_ℓ = ∏_σ ℚ̄_ℓ, so the V_σ are simple and pairwise non-isomorphic.
2. Semisimple representations in characteristic 0 with equal traces are isomorphic (R01.1/brauer-nesbitt-traces), so the trace functions of the V_σ are distinct; by Chebotarev they are distinguished by their values σ(a_p) at Frob_p, p ∉ S′ ∪ {ℓ}. So distinct embeddings differ on ℚ(a_p : p ∉ S′), which is therefore E.

Acceptance:

- For J₀(23): a₂ = (−1 + √5)/2 generates E.
- Removing finitely many primes does not change the field.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/absolute-irreducibility`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/frobenius-polynomial`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`.

Source: Ribet92, Proposition 3.5, p. 6 — The statement.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Ribet's Proposition 3.6: F = ℚ(a_p²/ε(p)) is totally real and E/F is abelian

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/inner-twist-field` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and F ⊆ E the subfield generated by the a_p²/ε(p) for p ∉ S. Then F is totally real and E/F is an abelian extension.

Construction or proof:

1. By GT.2/coefficient-conjugation, the conjugate of a_p²/ε(p) is ā_p²/ε̄(p) = ε(p)⁻²a_p² · ε(p) = a_p²/ε(p), so F is fixed by the canonical involution and is totally real (GT.1/totally-real-or-cm).
2. Adjoin all roots of unity and the square roots of t_p = a_p²/ε(p) to F. This is an abelian extension of F (a compositum of cyclotomic and quadratic extensions). Since ε(p) is a root of unity, its square roots lie in this extension too; a_p = ±√t_p·√ε(p) lies there, including a_p = 0. GT.2/coefficients-generate then places E inside this abelian extension, so E/F is abelian. This is Ribet’s argument, not the claim that √t_p and ε(p) alone generate E.

Acceptance:

- For J₀(23), F = E = ℚ(√5).
- For the newform of level 169 with E = ℚ(√3) in Ribet §7, F = ℚ (an extra twist).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficient-conjugation`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/totally-real-or-cm`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`.

Source: Ribet92, Proposition 3.6, p. 7 — The statement.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Ribet's Lemma 3.7: residual absolute irreducibility for almost all λ

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/residual-irreducibility` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and A′ an integral model (GT.2/integral-model). For all but finitely many maximal ideals λ of 𝒪_E, ρ̄_λ on A′[λ] is absolutely irreducible. For dim A = 1 this is the irreducibility of E[p] for almost all p of EllipticCurveModularity:R29.1.

Construction or proof:

1. For almost all ℓ, the ℤ_ℓ-algebra generated by G_ℚ in End(T_ℓ(A′)) is the full commutant of End_ℚ(A′) ⊗ ℤ_ℓ = 𝒪_E ⊗ ℤ_ℓ (FaltingsFinitenessAndIsogenyTheorems:R28.6/commutant-statement-for-almost-all-primes), that is ∏_{λ|ℓ} M₂(𝒪_λ) for ℓ unramified in E, T_ℓ(A′) being free of rank two over 𝒪_E ⊗ ℤ_ℓ.
2. Reducing modulo ℓ, the 𝔽_ℓ-span of ρ̄(G_ℚ) on A′[ℓ] = ⊕_λ A′[λ] is ∏_λ M₂(𝔽_λ), so each A′[λ] is absolutely irreducible. Ribet deduces the same from Faltings' mod-ℓ theorem ([6, Theorem 1, p. 204]).

Acceptance:

- Compatible with the parent: for an elliptic curve over ℚ, E[p] is irreducible for all but finitely many p.
- Exceptions occur: X₀(11) has reducible X₀(11)[5] (a rational 5-torsion point).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/integral-model`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/commutant-statement-for-almost-all-primes`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.

Source: Ribet92, Lemma 3.7, p. 7 — The statement; the proof cites Faltings [6, Theorem 1, page 204].

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Bounded conductors of the λ-adic and residual representations

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/conductor-bound` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and cond(A) = ∏_p p^{f_p(A)} the conductor of A, f_p(A) the Artin conductor exponent of V_ℓ(A) at p for any ℓ ≠ p. For every prime λ of degree one over ℓ, the prime-to-ℓ Artin conductor N(ρ_λ) divides cond(A), and the prime-to-ℓ Artin conductor N(ρ̄_λ) of the residual representation divides N(ρ_λ).

Construction or proof:

1. f_p(A) is independent of ℓ ≠ p: the H^i(A) form a ℚ-rational strictly compatible system (NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export), and cond(A) is defined from it (R11.5/conductor-import).
2. For p ≠ ℓ and E_λ = ℚ_ℓ, V_λ is a direct summand of V_ℓ(A) as a ℚ_ℓ[G_{ℚ_p}]-module, so f_p(ρ_λ) ≤ f_p(V_ℓ(A)) by additivity and nonnegativity of the Artin conductor (R01.3/conductor-of-a-weil-deligne-representation).
3. Reduction does not increase the conductor (ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor).

Acceptance:

- For an elliptic curve E₀ over ℚ, N(ρ̄_{E₀,p}) | N_{E₀} (EllipticCurveModularity:R29.1/residual-conductor-divides).
- f_p(A) = 0 for p ∉ S.

Direct prerequisites: `NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import`, `NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/global-conductor-and-prime-to-p-conductor`, `ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

Source: Ribet92, proof of Lemma 4.1, p. 8 — The bound and the independence of ℓ.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

### Crystalline with Hodge–Tate weights {0, 1} at good primes; finite flat residual representations

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/crystalline-at-good-primes` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For ℓ ∉ S and λ | ℓ, ρ_λ|_{G_{ℚ_ℓ}} is crystalline, and for every embedding τ : E_λ → ℚ̄_ℓ the Hodge–Tate weights of ρ_λ ⊗_{E_λ,τ} ℚ̄_ℓ are 0 and 1, each once (convention: χ_ℓ has weight 1, that of Khare–Wintenberger §5); and for an integral model A′, A′[λ] extends to a finite flat group scheme over ℤ_ℓ. In particular the system has weights (a, b) = (1, 0) and is regular.

Construction or proof:

1. A has good reduction at ℓ ∉ S, so V_ℓ(A)|_{G_{ℚ_ℓ}} is crystalline with Hodge–Tate weights 0 and 1, each of multiplicity dim A (PadicHodgeTheory:R06.6/good-reduction-iff-crystalline, R06.5/abelian-variety-hodge-tate-weights).
2. The Hodge–Tate decomposition ℂ_ℓ ⊗ V_ℓ ≅ (ℂ_ℓ(1) ⊗ Lie A) ⊕ (ℂ_ℓ ⊗ H¹(A, 𝒪_A)^∨) is E-equivariant, and Lie(A/ℚ) is a one-dimensional E-vector space (dimension count, GT.1/lie-algebra-divisibility), so every embedding τ sees each weight exactly once.
3. A′[λ] ⊆ A′[ℓ], and A′[ℓ] is the generic fibre of the finite flat ℓ-torsion of the Néron model (an abelian scheme over ℤ_ℓ); take the scheme-theoretic closure.

Acceptance:

- For E = ℚ: an elliptic curve with good reduction at ℓ has crystalline V_ℓ with weights {0, 1}.
- The weights give Serre weight k = 2 for ρ̄_λ (GT.3/serre-witnesses).

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/lie-algebra-divisibility`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/integral-model`, `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`.

Source: Ribet92, proof of Lemma 4.2, p. 8 — Finite flatness at a good prime; KW-I, §5, p. 8 — The condition at ℓ in Khare–Wintenberger's definition of a compatible system.

Suggested coverage: omitted. This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.

Stage obligations: Resolve the request to AbelianSchemesAndArithmeticModuli A6 for the complex uniformization and the comparison V_ℓ(A) ≅ H₁(A(ℂ), ℚ) ⊗ ℚ_ℓ used by GT.2/odd. Implement the native A3/A6 integral model and R01.6/R25.5 Tate/residual exports; instantiate all residual tests on the actual modules.

## GT.3 — Modular abelian varieties and the modularity theorem

### Modular abelian varieties over ℚ

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-abelian-variety` (definition).

An abelian variety A over ℚ is modular of level N (N ≥ 1) if there is a surjective homomorphism of abelian varieties J₁(N) → A over ℚ, where J₁(N) is the Jacobian of X₁(N)_ℚ (ModularCurvesPartII:R14.2/jacobian-and-functoriality); it is modular if it is modular of some level. It is modular of level N for Γ₀ if there is a surjective homomorphism J₀(N) → A over ℚ.

Conventions: homomorphisms of abelian varieties over ℚ in the sense of Tau Ceti JacobianChallenge layer E; surjective means faithfully flat (equivalently the image is all of A); X₁(N) has genus 0 exactly for N ≤ 10 and N = 12, so J₁(N) = 0 and only A = 0 is modular of such a level

Construction or proof:

1. The definition only names the property. Its basic properties: modular of level N implies modular of every level M with N | M, because the degeneracy map X₁(M) → X₁(N) induces a surjection J₁(M) → J₁(N) (Albanese functoriality, R14.2); a quotient of a modular variety is modular; a variety ℚ-isogenous to a modular one is modular, since a composite of surjections is surjective.

API:

- `AbelianVariety.IsModularOfLevel` (data): A is modular of level N: ∃ surjective J₁(N) → A over ℚ.
- `AbelianVariety.IsModular` (data): ∃ N ≥ 1 with IsModularOfLevel A N.
- `AbelianVariety.IsModularOfLevel.mono` (relation): IsModularOfLevel A N → N ∣ M → 0 < M → IsModularOfLevel A M (levels are positive).
- `AbelianVariety.IsModular.of_isogeny` (functoriality): A ℚ-isogeny A → A′ (or any surjection) transports modularity of A to A′.
- `AbelianVariety.IsModular.quotient` (functoriality): A quotient of a modular abelian variety is modular.
- `AbelianVariety.isModular_iff` (equivalence): For ℚ-simple A of GL₂-type: modular ⇔ isogenous to some A_f ⇔ some V_λ(A) ≅ ρ_{f,λ′} (GT.3/modularity-equivalences).
- `AbelianVariety.IsModularOfLevel.gamma0` (compatibility): Modular of level N for Γ₀ implies modular of level N: pushforward along the finite surjection X₁(N) → X₀(N) gives a surjection J₁(N) → J₀(N) (R14.2).
- `AbelianVariety.IsModular.elliptic` (compatibility): For an elliptic curve over ℚ, being modular for Γ₀ at level N is the formulation (ii) of EllipticCurveModularity:R29.6/modularity-theorem.

Unit tests:

- `IsModular.X0_11` (computation): X₀(11) is modular of level 11 for Γ₀.
- `IsModular.zero` (degenerate): The zero abelian variety is modular of every positive level; J₁(N) = 0 for 1 ≤ N ≤ 10 and N = 12.
- `IsModular.J1_13_not_gamma0` (non-example): J₁(13) is modular of level 13 but not modular of level 13 for Γ₀, since J₀(13) = 0.
- `IsModular.level_not_minimal` (non-example): X₀(11) is modular of level 22 as well as 11: the level in the definition is not the conductor.

Acceptance:

- X₀(11) = J₀(11) is modular of level 11 (for Γ₀ and for Γ₁, via J₁(11) → J₀(11)).
- J₁(13), of dimension 2, is modular of level 13 but not for Γ₀ at level 13 (J₀(13) = 0).

Direct prerequisites: `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.5/trivial-character-J0`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.baseChange`.

Source: KW-I, §10.2, p. 21 — The definition; Ribet92, §1, p. 2 — Ribet's formulation for elliptic curves.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

| Item | Suggested status |
| --- | --- |
| `AbelianVariety.IsModularOfLevel` | omitted |
| `AbelianVariety.IsModular` | omitted |
| `AbelianVariety.IsModularOfLevel.mono` | omitted |
| `AbelianVariety.IsModular.of_isogeny` | omitted |
| `AbelianVariety.IsModular.quotient` | omitted |
| `AbelianVariety.isModular_iff` | omitted |
| `AbelianVariety.IsModularOfLevel.gamma0` | omitted |
| `AbelianVariety.IsModular.elliptic` | omitted |
| `IsModular.X0_11` | omitted |
| `IsModular.zero` | omitted |
| `IsModular.J1_13_not_gamma0` | omitted |
| `IsModular.level_not_minimal` | omitted |

Atlas planet: Modular abelian variety.

### Residual Serre witnesses of weight two at bounded level

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/serre-witnesses` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E (GT.1/endomorphism-field), S its set of primes of bad reduction, cond(A) its conductor, ρ_λ its λ-adic representations with Frobenius traces a_p ∈ E (GT.2/frobenius-polynomial) and character ε (GT.2/determinant-character) and A′ an integral model (GT.2/integral-model). Let Λ be the set of maximal ideals λ of 𝒪_E of degree one over odd primes ℓ ∉ S, unramified in E, with ρ̄_λ absolutely irreducible; Λ is infinite. For every λ ∈ Λ there are a normalised newform g_λ of weight two, level N_λ dividing cond(A) and some character, and a prime λ′ of its coefficient field above ℓ, with ρ̄_{g_λ,λ′} ⊗ 𝔽̄_ℓ ≅ ρ̄_λ ⊗ 𝔽̄_ℓ through fixed embeddings of both residue fields; in particular a_p(g_λ) ≡ a_p(A) mod (λ′, λ) for every p ∉ S ∪ {ℓ}. This generalises EllipticCurveModularity:R29.2/weight-two-and-level-N-from-the-weight-recipe.

Construction or proof:

1. Λ is infinite: infinitely many primes split completely in E (Chebotarev), and only finitely many λ are excluded by GT.2/residual-irreducibility.
2. For λ ∈ Λ, ρ̄_λ : G_ℚ → GL₂(𝔽_ℓ) is odd (GT.2/odd), absolutely irreducible, finite at ℓ with det ρ̄_λ|_{I_ℓ} = χ̄_ℓ (GT.2/crystalline-at-good-primes; ε is unramified at ℓ ∉ S), so Serre's weight is k(ρ̄_λ) = 2 (AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p) and its level N(ρ̄_λ) divides cond(A) (GT.2/conductor-bound).
3. The strong form of Serre's conjecture (ClassicalSerreModularity:R27.6/full-classical-serre-theorem) gives g_λ of weight k(ρ̄_λ) = 2 and level N(ρ̄_λ); compare traces of Frobenius (R01.6 (f), R19.1). The comparison is over a common algebraic closure 𝔽̄_ℓ; Serre does not assert that the newform’s residue field is already 𝔽_ℓ.

Acceptance:

- For dim A = 1 the witnesses have trivial character, as in the parent (ε = 1).
- For J₀(23) and λ above ℓ ≡ ±1 mod 5, g_λ can be taken to be the newform of level 23.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/residual-irreducibility`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/odd`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/crystalline-at-good-primes`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/conductor-bound`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/frobenius-polynomial`, `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/integral-model`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`.

Source: Ribet92, Lemma 4.1 and Lemma 4.2, p. 8 — Weight two at the primes of Λ (Lemma 4.2); Lemma 4.1 bounds the levels; Ribet92, proof of Theorem 4.4, p. 8 — Serre's conjecture applied on Λ; it is now the strong form proved by Khare–Wintenberger.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### One newform for infinitely many λ

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/fixed-newform` (theorem).

In the situation of GT.3/serre-witnesses there are a normalised newform f of weight two and level N_f dividing cond(A), with coefficient field K_f, and an infinite subset Λ_f ⊆ Λ such that for every λ ∈ Λ_f there is a ring homomorphism φ_λ : 𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ with φ_λ(a_p(f)) = a_p(A) mod λ for all p ∉ S ∪ {ℓ}. This generalises the pigeonhole step of EllipticCurveModularity:R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients.

Construction or proof:

1. The newforms of weight two and level dividing cond(A), with any character, form a finite set: they are eigenvectors in the finite-dimensional spaces S₂(Γ₁(M)), M | cond(A) (Tau Ceti ModularForms layers 0 and 4).
2. λ ↦ g_λ maps the infinite set Λ to this finite set, so some fibre is infinite (EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber). At this point reduction lands in 𝔽_{λ′}, with the good Hecke values in its embedded subfield 𝔽_λ.
3. Choose finitely many good-prime a_p(f) generating K_f: use GT.1/modular-quotient-is-gl2-type, the Frobenius comparison of ModularCurvesPartII:R14.5/newform-hecke-prime, and GT.2/coefficients-generate applied to A_f. The order they generate has finite index in 𝒪_{K_f}. Delete the finitely many λ whose residue characteristic divides this index or is one of the chosen primes. The remaining Λ_f is infinite, and reduction of every element of 𝒪_{K_f} lies in the embedded 𝔽_λ. Thus φ_λ has the stated codomain 𝔽_λ = 𝔽_ℓ.

Acceptance:

- For dim A = 1 this is the parent's pigeonhole step.
- The level of f divides cond(A); its exact value is GT.4/exact-level.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/serre-witnesses`, `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:HeckeRing.GL2.Newform`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:cuspFormCharSpace`, `mathlib:CongruenceSubgroup.Gamma1`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

Source: Ribet92, proof of Theorem 4.4, pp. 8–9 — The finiteness and the choice of a fixed f.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### Exact coefficients: K_f ≅ E with a_p(f) ↦ a_p(A)

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/coefficient-identification` (theorem).

In the situation of GT.3/fixed-newform there is a field isomorphism j : K_f → E with j(a_p(f)) = a_p(A) for every prime p ∉ S with p ∤ N_f, and j(ε_f(p)) = ε(p) for those p. This generalises the exact-coefficient step of EllipticCurveModularity:R29.3 and R29.3/rational-coefficient-field.

Construction or proof:

1. For λ ∈ Λ_f the pair (φ_λ, 𝒪_E → 𝔽_λ) is a ring map 𝒪_{K_f} ⊗_ℤ 𝒪_E → 𝔽_ℓ; its kernel m_λ lies over a prime of exactly one factor L_i of the étale algebra K_f ⊗_ℚ E = ∏ L_i, so infinitely many m_λ lie over one factor L with embeddings u : K_f → L, v : E → L (EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber).
2. For p ∉ S, p ∤ N_f, the element u(a_p(f)) − v(a_p(A)) ∈ 𝒪_L lies in primes above infinitely many ℓ, hence vanishes (EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing).
3. K_f is generated by these a_p(f) (ModularCurvesPartII:R14.5/newform-hecke-prime with GT.2/coefficients-generate applied to A_f, GT.1/modular-quotient-is-gl2-type) and E by these a_p(A) (GT.2/coefficients-generate), so u(K_f) = v(E) and j = v⁻¹ ∘ u. To identify characters, first use the resulting equality of good traces and Chebotarev–Brauer–Nesbitt (R01.5) to identify the characteristic-zero representations. Their determinants then identify j(ε_f) with ε. Trace congruences alone do not give determinant congruences.

Acceptance:

- For dim A = 1, K_f = ℚ and a_p(f) = a_p(A): the parent's exact equality.
- For J₀(23) and its newform f, j is the identity of ℚ(√5) once E is identified with the Hecke field through the Hecke action; j is unique, as the a_p generate.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/fixed-newform`, `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`, `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

Source: Ribet92, proof of Theorem 4.4, p. 8 — The congruences that are upgraded to equalities. Ribet passes instead from the congruences to Hom_{𝔽_ℓ[G]}(A_f[ℓ], A[ℓ]) ≠ 0 and Faltings' mod-ℓ theorem; this node follows the parent's route, which needs only Faltings' ℓ-adic theorem.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### Comparison of λ-adic representations with those of the newform

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison` (theorem).

In the situation of GT.3/coefficient-identification, for every prime λ of E, ρ_λ ≅ ρ_{f, j⁻¹(λ)} ⊗_{K_{f,j⁻¹(λ)}} E_λ as E_λ[G_ℚ]-modules (identifying K_{f,j⁻¹λ} with E_λ through j), and V_ℓ(A) ≅ V_ℓ(A_f) as ℚ_ℓ[G_ℚ]-modules, compatibly with j. This generalises EllipticCurveModularity:R29.4/tate-module-comparison.

Construction or proof:

1. Both ρ_λ and ρ_{f,j⁻¹λ} ⊗ E_λ are semisimple (GT.2/absolute-irreducibility; R19.1/newform-rank-two-realisation) and unramified outside a finite set with traces of Frob_p equal to a_p(A) = j(a_p(f)) for almost all p; Chebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, R01.1/brauer-nesbitt-traces) make them isomorphic.
2. Sum over λ | ℓ, using V_ℓ(A) = ⊕ V_λ (R01.6) and V_ℓ(A_f) ≅ ⊕ ρ_{f,λ} (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition).

Acceptance:

- For dim A = 1: V_r(E) ≅ V_r(f), as in R29.4.
- The isomorphism need not respect a chosen integral structure; only rational Tate modules are compared.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/coefficient-identification`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/absolute-irreducibility`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

Source: Ribet92, proof of Theorem 4.4, p. 8 — Ribet's residual comparison; here the comparison is made in characteristic zero after GT.3/coefficient-identification.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### Modularity of abelian varieties of GL₂-type (Ribet's Theorem 4.4, Khare–Wintenberger Corollary 10.2(i))

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem` (theorem).

Every abelian variety A over ℚ of GL₂-type which is ℚ-simple is ℚ-isogenous to A_f for a normalised newform f of weight two on Γ₁(N_f), with an isomorphism K_f ≅ End⁰_ℚ(A) intertwining the Hecke action and the endomorphisms; consequently A is a quotient of J₁(N_f) over ℚ, i.e. A is modular of level N_f. Every abelian variety over ℚ of GL₂-type, simple or not, is modular. This generalises EllipticCurveModularity:R29.5/isogeny-to-E.

Construction or proof:

1. GT.3/tate-module-comparison gives V_ℓ(A) ≅ V_ℓ(A_f) as ℚ_ℓ[G_ℚ]-modules; Faltings' isogeny criterion (FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors) gives a ℚ-isogeny φ : A_f → A. It intertwines K_f and E through j: x ↦ φxφ⁻¹ is a field isomorphism K_f → E carrying the E-linear trace a_p(f) of Frobenius on V_ℓ(A_f) to that on V_ℓ(A), which is a_p(A) = j(a_p(f)), and the a_p(f) generate K_f.
2. Compose the quotient J₁(N_f) → A_f (ModularCurvesPartII:R14.5/modular-quotient) with φ to obtain a surjection J₁(N_f) → A.
3. For non-simple A of GL₂(E)-type, A is isogenous to Bⁿ with B ℚ-simple of GL₂-type (GT.1/ribet-theorem-2-1), and B ~ A_f with f of level N. In J₁(N·2^{n−1}) the factor A_f occurs with multiplicity d(2^{n−1}) = n (GT.1/modular-quotient-is-gl2-type), so A_fⁿ, hence A, is a quotient of J₁(N·2^{n−1}).

Acceptance:

- J₀(23) is isogenous to A_f for the newform of level 23 with K_f = ℚ(√5).
- Dimension one: every elliptic curve over ℚ is modular (EllipticCurveModularity:R29.6/modularity-theorem).
- Ribet's example of level 81: A_f with E = ℚ(√3) is its own instance.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `ModularCurvesPartII:R14.5/modular-quotient`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-abelian-variety`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/ribet-theorem-2-1`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`.

Source: KW-I, Corollary 10.2, p. 21 — The theorem; Ribet92, Theorem 4.4, p. 8 — Ribet's theorem, conditional on Serre's conjecture, which Khare–Wintenberger proved (ClassicalSerreModularity R27.6).

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

Atlas planet: Modularity of GL₂-type abelian varieties.

### Equivalent forms of modularity

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-equivalences` (theorem).

For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E, the following are equivalent, and (by GT.3/modularity-theorem) all hold: (a) A is modular; (b) A is ℚ-isogenous to A_f for a weight-two newform f; (c) for some prime λ of E there are a weight-two newform f and a prime λ′ of K_f with ρ_λ ≅ ρ_{f,λ′} ⊗ ℚ̄_ℓ after extension of scalars; (d) the same for every λ; (e) A is isomorphic to a ℚ-simple quotient of J₁(N) for some N. The equivalences do not use Serre's conjecture. This generalises the equivalences of EllipticCurveModularity:R29.6/modularity-theorem.

Construction or proof:

1. (a) ⇒ (b): a surjection J₁(N) → A and the isogeny decomposition of J₁(N) (GT.1/modular-quotient-is-gl2-type) give a nonzero map A_g → A for some newform g of level dividing N (A6: Hom between non-isogenous simple varieties vanishes), hence A ~ A_g as both are simple (A6/endomorphisms-of-simple-abelian-varieties).
2. (b) ⇒ (d): V_ℓ(A) ≅ V_ℓ(A_f) decomposes compatibly with the endomorphism fields (R19.6). (d) ⇒ (c) is trivial. For (c) ⇒ (b), fix the embeddings τ : E → ℚ̄_ℓ and τ′ : K_f → ℚ̄_ℓ of the given isomorphism. Their good Frobenius traces agree. E and K_f are each generated by these traces off a common finite exceptional set (GT.2/coefficients-generate, applied also to A_f using GT.1/modular-quotient-is-gl2-type and R14.5/newform-hecke-prime). Thus τ(E) = τ′(K_f), giving j = τ⁻¹τ′ with exact good coefficients. GT.3/tate-module-comparison, followed by Faltings, gives A ~ A_f. This argument needs no infinite residual congruences and no Serre theorem.
3. (b) ⇒ (e) ⇒ (a): compose J₁(N) → A_f with the isogeny; an isogeny image of a quotient is a quotient.

Acceptance:

- For dim A = 1 these are formulations (i)–(ii) of R29.6.
- (c) for a single λ of degree one already suffices.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-abelian-variety`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate`, `ModularCurvesPartII:R14.5/newform-hecke-prime`.

Source: KW-I, §10.2, p. 21 — The characterisation that the equivalences make precise.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### The ℚ-simple quotients of the J₁(N) are the GL₂-type varieties (generalised Shimura–Taniyama–Weil)

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/simple-quotients-characterisation` (theorem).

An abelian variety B over ℚ is isomorphic to a ℚ-simple quotient of J₁(N) for some N ≥ 1 if and only if B is ℚ-simple and of GL₂-type. The isogeny classes of such B correspond bijectively to the Galois orbits of normalised newforms of weight two (of all levels and characters), by [f] ↦ [A_f].

Construction or proof:

1. ⇒: a ℚ-simple quotient of J₁(N) is isogenous to some A_f (proof of GT.3/modularity-equivalences (a) ⇒ (b)), which is of GL₂(K_f)-type (GT.1/modular-quotient-is-gl2-type); GL₂-type is an isogeny invariant (R25.5).
2. ⇐: GT.3/modularity-theorem.
3. Bijection: A_f ~ A_g iff V_ℓ(A_f) ≅ V_ℓ(A_g) (Faltings) iff the eigenvalue systems of f and g are Galois-conjugate (Chebotarev, Brauer–Nesbitt), iff g ∈ [f] by strong multiplicity one (Tau Ceti ModularForms layer 5).
4. Use the pinned fixed-level/nebentypus strong multiplicity-one theorem where its good-index hypotheses apply; comparison across levels from agreement at almost all primes uses the explicit ModularForms Layer 5 request.

Acceptance:

- Level 11: the only simple quotient up to isogeny of J₁(11) is X₀(11).
- Non-example: E₁ × E₂ for non-isogenous elliptic curves is a quotient of some J₁(N) but not a simple one.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-equivalences`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

Source: KW-I, §10.2, p. 21 — The direction ⇒; Corollary 10.2(i) gives ⇐; Ribet92, §1, p. 2 — Ribet's version of ⇒.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

Atlas planet: Generalised Shimura–Taniyama–Weil.

### Totally real endomorphism field, trivial character and quotients of J₀(N)

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/trivial-character` (theorem).

For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E and character ε, the following are equivalent: (a) E is totally real; (b) ε = 1; (c) A is modular for Γ₀, i.e. a quotient of J₀(N) over ℚ for some N. In that case the level can be taken to be N_f = cond(A)^{1/dim A} (GT.4/exact-level). This is Serre's Théorème 5, recorded by EllipticCurveModularity:R29.6/what-theoreme-4-asserts-and-its-scope as an inherited target, and for dim A = 1 the quotient J₀(N_E) → E of the parent.

Construction or proof:

1. (a) ⇒ (b): with Rosati trivial on E the Weil pairing makes ∧²_{E_λ} V_λ ≅ E_λ(1) (R01.6 (e)), so det ρ_λ = χ_ℓ.
2. (b) ⇒ (a): ε = 1 gives a_p = ā_p (GT.2/coefficient-conjugation), so the canonical involution fixes E = ℚ(a_p) (GT.2/coefficients-generate) and E is totally real (GT.1/totally-real-or-cm).
3. (b) ⇔ (c): A ~ A_f with ε_f = ε via j (GT.3/coefficient-identification); for trivial ε_f, A_f is isogenous to the quotient of J₀(N_f) (ModularCurvesPartII:R14.5/trivial-character-J0); conversely a simple quotient of J₀(N) is isogenous to some A_g with g of trivial character.

Acceptance:

- J₀(23): E = ℚ(√5) totally real, ε = 1, a quotient of J₀(23).
- J₁(13): E = ℚ(√−3), ε of order 6, not a quotient of any J₀(N).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/coefficient-identification`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficient-conjugation`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficients-generate`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/totally-real-or-cm`, `ModularCurvesPartII:R14.5/trivial-character-J0`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

Source: Ribet92, §3, p. 4 — Totally real E gives trivial character; Ribet92, §7, p. 16 — Trivial character gives a totally real field.

Suggested coverage: omitted. This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.

### Modular parametrisation of a GL₂-type variety

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-parametrisation` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type, modular of level N. There is a nonconstant morphism φ : X₁(N) → A over ℚ with φ(c) = 0 for the rational cusp c of ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi, whose image generates A as an algebraic group; φ is the composite of the Abel–Jacobi map, a quotient J₁(N) → J₁(M) → A_f with the newform level M dividing N and an isogeny A_f → A. If ε = 1, φ can be taken on X₀(N) with φ(∞) = 0. This generalises EllipticCurveModularity:R29.5/modular-parametrisation.

Construction or proof:

1. From the surjection J₁(N) → A and the newform decomposition of J₁(N), choose a newform f of level M | N with A_f ~ A (GT.3/modularity-equivalences and GT.1/modular-quotient-is-gl2-type). Compose AJ_c : X₁(N) → J₁(N), a surjective degeneracy map J₁(N) → J₁(M) (R14.2/jacobian-and-functoriality), J₁(M) → A_f and an isogeny A_f → A. Nonconstancy follows from R14.5/abel-jacobi-composite-nonzero. The ambient modular level N need not be the newform level M.
2. The image of X₁(N) generates J₁(N) (the Jacobian is generated by the curve, Tau Ceti JacobianChallenge layer F), hence its image generates A.
3. For ε = 1 the chosen f has trivial character, so use J₀(N) → J₀(M) → A_f, with AJ_∞ and the trivial-character quotient (R14.5/trivial-character-J0). This gives the Γ₀ parametrisation at the specified ambient level N, not merely at some other level.

Acceptance:

- For dim A = 1 and ε = 1 this is the parametrisation X₀(N) → E of R29.5.
- For J₁(13) the parametrisation is the Abel–Jacobi embedding of X₁(13), a curve of genus 2.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/trivial-character`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`, `ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-equivalences`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/modular-quotient-is-gl2-type`, `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.5/trivial-character-J0`.

Source: Ribet92, §1, p. 1 — The parametrisation formulation for elliptic curves, generalised here.

Suggested coverage: omitted. The full pointed curve-morphism signature is omitted until ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and JacobianChallenge Layer F supply native AJ_c and image generation. Required clauses are X₁(N)→A, rational cusp c, φ(c)=0, nonconstancy and generating image, with degeneracy from N to newform level M|N; the Γ₀ branch uses ∞. A nonzero Jacobian Hom is not this signature.

Stage obligations: Export R14 modular curves/Jacobians/A_f and R19 representations, then state all omitted modularity and pointed-parametrisation signatures and tests.

## GT.4 — Conductors, exact level and L-functions

### Carayol's conductor formula for GL₂-type varieties

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/conductor-of-gl2-type` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p and every prime λ of E with λ ∤ p, f_p(A) = n·f_p(ρ_λ), where f_p(ρ_λ) is the Artin conductor exponent of the E_λ-representation ρ_λ at p, and f_p(ρ_λ) = ord_p(N_f) for all such λ. Hence cond(A) = N_f^{n}; in particular cond(A_f) = N^{dim A_f} for every weight-two newform of level N (Carayol, Corollaire 0.8 for dim A_f = 1).

Construction or proof:

1. V_ℓ(A) = ⊕_{λ|ℓ} V_λ as ℚ_ℓ[G_{ℚ_p}]-modules, and the Artin conductor is additive; for an E_λ-representation W viewed over ℚ_ℓ, every term of a(W) (Swan conductor and codimension of inertia invariants, ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation) is multiplied by [E_λ : ℚ_ℓ]. So f_p(A) = Σ_{λ|ℓ} [E_λ : ℚ_ℓ]·f_p(ρ_λ).
2. ρ_λ ≅ ρ_{f,j⁻¹λ} ⊗ E_λ (GT.3/tate-module-comparison) and the Artin conductor of ρ_{f,λ′} away from ℓ is the prime-to-ℓ part of N_f (Carayol; AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical (a)); so f_p(ρ_λ) = ord_p(N_f) for every λ ∤ p, and Σ_{λ|ℓ}[E_λ : ℚ_ℓ] = n.
3. Apply this at each p with an auxiliary ℓ ≠ p.

Acceptance:

- J₀(23): cond = 23² = 529 and n = 2, so N(A) = 23.
- J₁(13): cond(J₁(13)) = 13², level 13.
- Elliptic curves: cond(E) = N_f, Carayol's Corollaire 0.8 and EllipticCurveModularity:R29.4/exact-conductor.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import`, `ArithmeticGaloisRepresentations:R01.3/global-conductor-and-prime-to-p-conductor`.

Source: Carayol86, Corollaire (0.8), p. 411 — The case K_f = ℚ: the conductor of E_f is the level (the text layer prints f as '/'); Carayol86, Théorème (A), pp. 410–411 — Local-global compatibility at every p ∤ ℓ, from which the conductor of ρ_{f,λ} is the level (text layer garbles σ_λ and π_p).

Suggested coverage: omitted. Native conductor/Artin-exponent and coefficient-restriction interfaces are required from NeronModelsAndSemistableAbelianVarieties:R11.5, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. No arbitrary natural-valued conductor function is introduced.

Atlas planet: Carayol's conductor formula.

### The exact level of a GL₂-type variety

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/exact-level` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type of dimension n. Then cond(A) is an n-th power, N(A) := cond(A)^{1/n} equals the level N_f of every newform f with A ~ A_f, and for M ≥ 1: A is modular of level M if and only if N(A) divides M. In particular the least level of a modular parametrisation is N(A). The level M = cond(A)^{n} offered in Khare–Wintenberger §10.2 is valid, since N(A) divides it; it equals N(A) when n = 1 and is N(A)^{n²} ≠ N(A) when n ≥ 2, as N(A) > 1 (no nonzero abelian variety over ℚ has good reduction everywhere). This generalises EllipticCurveModularity:R29.4/exact-conductor.

Construction or proof:

1. cond(A) = N_f^n by GT.4/conductor-of-gl2-type, so N(A) = N_f; two newforms f, g with A ~ A_f ~ A_g are Galois conjugate (GT.3/simple-quotients-characterisation) and have the same level.
2. If N(A) | M, the degeneracy map makes J₁(M) → J₁(N_f) → A surjective (GT.3/modular-abelian-variety).
3. If J₁(M) → A is surjective, A ~ A_g for a newform g of level dividing M (GT.3/modularity-equivalences); g ∈ [f] by strong multiplicity one, so N_f = N_g divides M.
4. Use the pinned fixed-level/nebentypus strong multiplicity-one theorem where its good-index hypotheses apply; comparison across levels from agreement at almost all primes uses the explicit ModularForms Layer 5 request.

Acceptance:

- J₀(23): N(A) = 23 and A is modular of level 23 but not of level 1, …, 22.
- For an elliptic curve E₀ of conductor 11: N(E₀) = 11; KW's level 11¹ coincides.
- For J₀(23): KW's level is 529² while the exact level is 23.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/conductor-of-gl2-type`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-abelian-variety`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-equivalences`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/simple-quotients-characterisation`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `SmallRamificationAndAbelianVarietyBaseCases:R25.3/fontaine-theorem`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`.

Source: KW-I, §10.2, p. 21 — Khare–Wintenberger's level; with Carayol's formula M = N_f^n, so M^n is a multiple of the exact level N_f = M^{1/n}; Carayol86, Corollaire (0.8), p. 411 — The dimension-one case of the exact level.

Suggested coverage: omitted. The level/conductor signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the preceding native conductor interface. No placeholder modularity predicate is introduced.

Atlas planet: Exact level cond(A)^{1/dim A}.

### The λ-adic system is strictly compatible in the sense of Khare–Wintenberger

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/strict-compatibility` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E. Its good-prime Frobenius polynomials are E-rational (GT.2/frobenius-polynomial). There is a finite number-field extension i : E ↪ E′ for which the reindexed family ρ_{τ′∘i}, for τ′ : E′ → ℚ̄_ℓ, is an E′-rational, two-dimensional strictly compatible system of geometric representations of G_ℚ with Hodge–Tate weights (1, 0) (R24.5/compatible-system). For every prime q there is a Frobenius-semisimple Weil–Deligne representation r_q over E′, unramified for q ∉ S, with WD(ρ_{τ′∘i}|_{D_q})^{F-ss} ≅ τ′r_q for every τ′, including q = ℓ. It is regular, irreducible and odd. The full local compatibility is obtained after modularity. Realisation of every r_q over the original endomorphism field E is not asserted: Carayol §0.6 and Théorème (A) allow a finite coefficient extension.

Construction or proof:

1. Choose f and j : K_f ≅ E by GT.3/modularity-theorem. R19.3/fixed-eigenform-compatible-family supplies a full strictly compatible family over a sufficiently large number field containing K_f; its statement does not require that field to be K_f. Transport K_f through j, obtaining a finite extension E′/E, and reindex the members by τ′ : E′ → ℚ̄_ℓ using R24.5’s coefficient-extension API and GT.3/tate-module-comparison. Carayol §0.6 distinguishes being defined over a rationality field from being realised there; full comparison at q = ℓ is supplied by R19.3’s coefficient-prime theorem, not by Carayol 1986 alone.
2. Regular, odd and irreducible: GT.2/crystalline-at-good-primes, GT.2/odd, GT.2/absolute-irreducibility.

Acceptance:

- For an elliptic curve over ℚ the good-prime polynomials lie in ℚ; the theorem permits enlarging ℚ to realise all local WD parameters. This is stronger local data than the good-prime strict compatibility of R11.6, whose convention must be compared explicitly.
- At p ∥ cond(A)^{1/n} with p not dividing the conductor of ε, r_p has nonzero monodromy (Steinberg type, R19.4 (b)).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/coefficient-identification`, `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/crystalline-at-good-primes`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/odd`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/absolute-irreducibility`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`.

Source: KW-I, §5, pp. 7–8 — The notion of strict compatibility, which requires Weil–Deligne comparison at all primes; Ribet92, §3, p. 4 — Ribet's strict compatibility, in Serre's sense, concerns only the primes of good reduction (GT.2/frobenius-polynomial); Carayol86, §0.6 and Théorème (A) (§0.7), p. 410 — Both the simultaneous realisation of the local parameters and the theorem allow a finite extension of the rationality field; they do not promise realisation over K_f.

Suggested coverage: omitted. The full KW strictly-compatible-system signature is omitted until PotentialModularityAndCompatibleSystems:R24.5 and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition provide native local WD parameters, reindexing over finite E′/E and coefficient-prime comparison. Good-prime E-rationality is distinct from the E′-rational all-place realization.

### The L-function of a GL₂-type variety

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/l-function` (theorem).

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p the local factor of L(A, s) (from H¹(A_ℚ̄, ℚ_ℓ)^{I_p}, ℓ ≠ p, NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial) equals ∏_{σ : K_f → ℂ} L_p(f^σ, s), the product over the embeddings of K_f of the Euler factors (1 − a_p(f^σ)p^{−s} + ε_f^σ(p)p^{1−2s})⁻¹ for p ∤ N_f and (1 − a_p(f^σ)p^{−s})⁻¹ for p | N_f. Hence L(A, s) = ∏_σ L(f^σ, s) extends to an entire function, and Λ(A, s) = cond(A)^{s/2}((2π)^{−s}Γ(s))^n L(A, s) satisfies Λ(A, s) = w_A Λ(A, 2 − s) with w_A = ±1. This generalises EllipticCurveModularity:R29.4/bad-euler-factors and R29.6/l-function-continuation.

Construction or proof:

1. H¹ ⊗ ℚ̄_ℓ = ⊕_ι ρ_ι^∨ and ρ_ι ≅ ρ_{f,ι∘j} (GT.3/tate-module-comparison); the local factor of ρ_{f,λ}^∨ at p ≠ ℓ is that of f at p (AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical (c)).
2. The pinned CuspForm.hasEntireExtension_qExpansion_coeff gives entire continuation of each native cusp-form Dirichlet series. ModularForms Layer 7 identifies that series with the normalized newform Euler product; the finite product over coefficient embeddings is therefore entire.
3. Use the normalised Fricke companion 𝒲_{N_f} of ModularForms layers 6–7. At weight two its functional equation carries i² = −1; after absorbing the Fricke pseudo-eigenvalue into w_σ it reads Λ(f^σ, s) = w_σ Λ(f^{σ̄}, 2 − s). The embeddings are closed under complex conjugation, so the product is self-dual, and cond(A) = N_f^n gives the displayed completion. Apply this product equation twice to obtain Λ(A, s) = w_A²Λ(A, s). The normalised Euler product is nonzero in its half-plane of absolute convergence, so its continuation is not identically zero and w_A² = 1. Thus w_A = ±1; realness on the real line alone would not prove this.

Acceptance:

- For J₀(23): L(J₀(23), s) = L(f, s)L(f^σ, s) for the two embeddings of ℚ(√5).
- For dim A = 1 this is R29.6/l-function-continuation.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/tate-module-comparison`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/conductor-of-gl2-type`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`, `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff`.

Source: Carayol86, Corollaire (0.8), p. 411 — The dimension-one case, with all local factors (the text layer prints f as '/').

Suggested coverage: omitted. The equality of all local factors, completed L-functions and the functional equation are omitted until R11.5 and ModularForms Layers 6–7 export native Euler/L-series and normalized Fricke data, plus AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The mathematical convention keeps i²=−1 at weight two.

### Compatibility with the parent in dimension one

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/parent-compatibility` (application).

For an elliptic curve E₀ over ℚ of conductor N_{E₀} (a ℚ-simple abelian variety of GL₂(ℚ)-type), GT.3–GT.4 specialise to the parent's theorem EllipticCurveModularity:R29.6/modularity-theorem: E = ℚ, ε = 1, K_f = ℚ, f is the newform F_{E₀} of level N_f = N_{E₀} (GT.4/exact-level), the isogeny A_f → E₀ and the pointed parametrisation can be chosen to agree with R29.5/isogeny-to-E, and the parametrisation of GT.3/modular-parametrisation factors through X₀(N_{E₀}) as in R29.5/modular-parametrisation. The Part II statements are proved compatible with these, not used to reprove them. Compatibility means equality for choices induced by the same quotient q : J₀(N_{E₀}) → E₀ and the same Abel–Jacobi map: φ = q ∘ AJ_∞; it does not assert uniqueness of arbitrary isogenies or parametrisations.

Construction or proof:

1. E = End⁰_ℚ(E₀) = ℚ (R29.1), so ε = 1 (GT.2/determinant-character, E totally real) and the newform of GT.3/modularity-theorem has trivial character and rational coefficients.
2. By GT.4/exact-level its level is cond(E₀) = N_{E₀}; by strong multiplicity one it is F_{E₀} of R29.3/newform-of-E, and GT.3/trivial-character gives the quotient of J₀(N_{E₀}).
3. Choose the R29.5 isogeny and quotient q when specializing the Part II construction. Both curve maps are q ∘ AJ_∞ on X₀(N_{E₀}), so their equality and value 0 at ∞ follow from this common construction. Precompose with X₁(N_{E₀}) → X₀(N_{E₀}) for the Γ₁ comparison; this supplies the curve-morphism comparison, not merely equality of newforms.

Acceptance:

- X₀(11): the Part II statements return J₀(11) → X₀(11), the identity.
- The Part II route uses the strong Serre theorem with nontrivial characters only when E is CM, never in dimension one.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/trivial-character`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modular-parametrisation`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.4/exact-level`, `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.5/isogeny-to-E`, `EllipticCurveModularity:R29.5/modular-parametrisation`.

Source: KW-I, §10.2, p. 21 — Corollary 10.2(i) generalises the modularity of elliptic curves over ℚ.

Suggested coverage: omitted. The full curve-level comparison is omitted until ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and EllipticCurveModularity:R29.5 export native pointed quotient/parametrisation data. The mathematical statement compares compatible choices through the same quotient, rather than identifying arbitrary isogenies or parametrisations.

Stage obligations: Export native conductors, local WD systems and L-series, then check coefficient extension, normalized Fricke sign and the parent’s pointed curve-map comparison.

## GT.5 — ℚ-curves as factors of abelian varieties of GL₂-type

### ℚ-curves

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/q-curve` (definition).

Fix an algebraic closure ℚ̄. An elliptic curve C over ℚ̄ is a ℚ-curve if for every g ∈ G_ℚ = Aut(ℚ̄/ℚ) the conjugate curve ᵍC is isogenous to C over ℚ̄. An elliptic curve C₀ over a number field K ⊆ ℚ̄ is a ℚ-curve if C₀ ×_K ℚ̄ is one, i.e. ᵍC₀ and C₀ are ℚ̄-isogenous for every g ∈ G_ℚ (ᵍC₀ being defined over gK). C is non-CM if End_ℚ̄(C) = ℤ.

Conventions: elliptic curves are those of Mathlib (WeierstrassCurve with IsElliptic) or, equivalently, one-dimensional abelian varieties (AbelianSchemesAndArithmeticModuli A1); isogenies over ℚ̄ are nonzero homomorphisms; ᵍC is the base change of C along g : ℚ̄ → ℚ̄

Construction or proof:

1. The definition only names the property. Its basic properties: it depends only on the ℚ̄-isogeny class of C; conjugates of a ℚ-curve are ℚ-curves; a curve with a model over ℚ is a ℚ-curve; every CM curve is a ℚ-curve, because ᵍC has CM by an order in the same imaginary quadratic field and all such curves are isogenous. The CM assertion uses the ideal-lattice classification and ideal-isogeny API of ComplexMultiplicationAndExplicitReciprocity CM.1; the fixed embedded CM type is adjusted by conjugation before forgetting the action. For rational j, each conjugate has the same j-invariant; use the pinned WeierstrassCurve.exists_variableChange_of_j_eq, then the induced pointed coordinate pullback to obtain an actual isogeny.
2. Because ℚ̄-isogenies are defined over a finite extension, a ℚ-curve with a model over K has, after enlarging K to a finite Galois extension of ℚ, isogenies μ_g : ᵍC₀ → C₀ defined over K for all g ∈ Gal(K/ℚ) (Ribet §6).

API:

- `EllipticCurve.IsQCurve` (data): C over ℚ̄ (or over K ⊆ ℚ̄) with ᵍC ~ C over ℚ̄ for all g ∈ G_ℚ.
- `EllipticCurve.IsQCurve.of_isogeny` (functoriality): If C ~ C′ over ℚ̄ and C is a ℚ-curve then so is C′.
- `EllipticCurve.IsQCurve.conj` (functoriality): ᵍC is a ℚ-curve whenever C is.
- `EllipticCurve.IsQCurve.of_rat` (constructor): A curve with a model over ℚ (more generally with j(C) ∈ ℚ) is a ℚ-curve.
- `EllipticCurve.IsQCurve.of_cm` (constructor): Every CM elliptic curve over ℚ̄ is a ℚ-curve.
- `EllipticCurve.IsQCurve.isogenies_over_galois` (other): For a ℚ-curve with a model over K there are a finite Galois K′ ⊇ K over ℚ and K′-isogenies μ_g : ᵍC₀ → C₀ for all g ∈ Gal(K′/ℚ).

Unit tests:

- `IsQCurve.rational` (degenerate): The base change to ℚ̄ of X₀(11) is a ℚ-curve, with μ_g the identity.
- `IsQCurve.cm` (computation): The curve y² = x³ − x with CM by ℤ[i] is a ℚ-curve; so are all curves with CM by an order of ℚ(i).
- `IsQCurve.twist` (characterisation): A quadratic twist over K of a curve defined over ℚ is a ℚ-curve with μ_g isomorphisms over ℚ̄. In particular, over K = ℚ(√2), the twist of y² = x³ − x + 1 by d = √2 has traces 4 and −4 at the two primes above 7 (d reduces to 3 and 4), and is still a non-CM ℚ-curve: its j-invariant is −6912/23, which is not an algebraic integer.
- `IsQCurve.not_of_squared_traces` (non-example): Let C₀ be non-CM over a quadratic field K and let p = 𝔭·σ𝔭 split, with good reduction at both primes. If a_𝔭(C₀)² ≠ a_{σ𝔭}(C₀)² then C₀ is not a ℚ-curve. For a geometric isogeny to σC₀, the one-dimensional space Hom⁰_ℚ̄(σC₀,C₀) is a G_K-line with finite action in ℚ^×, hence action by {±1}; the two Tate representations differ by this quadratic character, so their good traces agree up to sign. Unequal unsquared traces are not an obstruction to a geometric isogeny.

Acceptance:

- Every elliptic curve over ℚ is a ℚ-curve.
- Caraiani–Newton Corollary 7.2.5: a curve E over a quadratic field F with E and σE 5-isogenous is a ℚ-curve.

Direct prerequisites: `mathlib:WeierstrassCurve.IsElliptic`, `AbelianSchemesAndArithmeticModuli:A1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/ideal-lattice-curve`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/picard-classification`, `ComplexMultiplicationAndExplicitReciprocity:CM.1/ideal-isogeny-degree`, `tauceti:TauCeti.Isogeny`, `tauceti:TauCeti.Isogeny.map`, `tauceti:WeierstrassCurve.quadraticTwistOf`, `mathlib:WeierstrassCurve.exists_variableChange_of_j_eq`.

Source: Ribet92, §1, p. 2 — Ribet's ℚ-curves: the defining property; FLHS15, §12, p. 18 — The same definition (the text layer drops the bar over ℚ); CN23, §1, p. 7 — The consumer's use of the notion.

Suggested coverage: signature-fragment. The definition, geometric-isogeny invariance, conjugation, rational-model/rational-j constructors and finite-Galois model/isogeny descent use WeierstrassCurve.IsElliptic and TauCeti.Isogeny with their native map coherence. Concrete rational/CM models, actual quadraticTwistOf and point counts are stated. Omitted: general CM-order constructor and the squared-trace non-example; these require A1/CM.1 geometric endomorphism interfaces and R01.6/R11.5 reduction/Tate comparison. The descent conclusion fixes the coefficients by equality of actual base change. Finite-Galois descent contains any prescribed finite coefficient field. Rational j uses the pinned native classification, not a new supplier theorem.

| Item | Suggested status |
| --- | --- |
| `EllipticCurve.IsQCurve` | signature |
| `EllipticCurve.IsQCurve.of_isogeny` | signature |
| `EllipticCurve.IsQCurve.conj` | signature |
| `EllipticCurve.IsQCurve.of_rat` | signature |
| `EllipticCurve.IsQCurve.of_cm` | omitted |
| `EllipticCurve.IsQCurve.isogenies_over_galois` | signature |
| `IsQCurve.rational` | example |
| `IsQCurve.cm` | example-fragment |
| `IsQCurve.twist` | example-fragment |
| `IsQCurve.not_of_squared_traces` | omitted |

Atlas planet: ℚ-curve.

### The cocycle of a non-CM ℚ-curve

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-cocycle` (construction).

Let C₀ be a non-CM ℚ-curve over a finite Galois extension K/ℚ with K-isogenies μ_g : ᵍC₀ → C₀ for g ∈ Gal(K/ℚ). Then c(g, h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹, an element of (End⁰_K C₀)^× = ℚ^×, is a 2-cocycle of Gal(K/ℚ) with values in ℚ^× (trivial action); its class [c_C] ∈ H²(G_ℚ, ℚ^×), inflated along G_ℚ → Gal(K/ℚ), is independent of K, of the model and of the μ_g, and c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}.

Conventions: C₀ non-CM, so End⁰_K(C₀) = ℚ and every element of Hom⁰_K(ᵍC₀, C₀) is a rational multiple of μ_g; μ_{gh}⁻¹ is the inverse in Hom⁰ (isogenies are invertible up to isogeny)

Construction or proof:

1. μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ ∈ End⁰_K(C₀) = ℚ, nonzero; the cocycle identity follows from associativity of composition and ᵍ(μ_h ∘ ʰμ_k) = ᵍμ_h ∘ ᵍʰμ_k.
2. Changing μ_g to r_gμ_g changes c by the coboundary of r. Enlarging K inflates. To compare models in the same ℚ̄-isogeny class, first enlarge to a common finite Galois field where the comparison quasi-isogeny φ is defined, then conjugate μ_g by φ and ᵍφ; the cocycle values are unchanged because the scalars are rational. Any remaining choices differ by a rational coboundary. Degrees are multiplicative and deg r = r² on ℚ^× ⊆ End⁰.

API:

- `QCurve.cocycle` (data): c : Gal(K/ℚ) × Gal(K/ℚ) → ℚ^× from the chosen μ_g.
- `QCurve.cocycle_isCocycle` (characterisation): c is a 2-cocycle for the trivial action.
- `QCurve.cocycleClass` (data): [c_C] ∈ H²(G_ℚ, ℚ^×), by inflation.
- `QCurve.cocycleClass_indep` (extensionality): [c_C] depends only on the ℚ̄-isogeny class of the non-CM elliptic curve; it is independent of K, the model C₀ and the μ_g after inflation.
- `QCurve.cocycle_sq` (relation): c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}.
- `QCurve.cocycleClass_of_rat` (simp): If C has a model over ℚ, [c_C] = 0.

Unit tests:

- `QCurve.cocycle_rational` (degenerate): For a curve over ℚ with μ_g = id, c ≡ 1.
- `QCurve.cocycle_quadratic` (computation): For K quadratic and μ ∘ σμ = [m]: c(σ, σ) = m, c(1, ·) = c(·, 1) = 1.
- `QCurve.cocycle_twist_after_extension` (characterisation): For a non-CM quadratic twist C₀/K of an elliptic curve E₀/ℚ, enlarge K to a finite Galois L/ℚ where a twisting isomorphism φ : C₀,L ≅ E₀,L is defined. Taking μ_g = φ⁻¹ ∘ ᵍφ gives an L-defined family of isomorphisms with c ≡ 1 and [c_C] = 0. The geometric twist hypothesis does not supply K-defined conjugate isogenies.
- `QCurve.cocycle_cm_excluded` (non-example): For a CM curve, End⁰ is an imaginary quadratic field, the values μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ need not be rational, and the construction does not apply.

Acceptance:

- For C₀ defined over ℚ take μ_g = id: c = 1.
- For K quadratic and μ = μ_σ with μ ∘ σμ = [m], c(σ, σ) = m and c = 1 elsewhere (GT.5/quadratic-q-curves).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/q-curve`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `mathlib:continuousCohomology`, `tauceti:TauCeti.ofDiscreteModule`, `tauceti:TauCeti.ContCohomology.Z2`, `tauceti:TauCeti.ContCohomology.explicitInfl2`.

Source: Ribet92, proof of Theorem 6.1, p. 13 — The construction; Ribet92, proof of Theorem 6.1, p. 13 — The degree relation c(g, h)² = deg μ_g deg μ_h / deg μ_{gh}, displayed just before.

Suggested coverage: omitted. Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.

| Item | Suggested status |
| --- | --- |
| `QCurve.cocycle` | omitted |
| `QCurve.cocycle_isCocycle` | omitted |
| `QCurve.cocycleClass` | omitted |
| `QCurve.cocycleClass_indep` | omitted |
| `QCurve.cocycle_sq` | omitted |
| `QCurve.cocycleClass_of_rat` | omitted |
| `QCurve.cocycle_rational` | omitted |
| `QCurve.cocycle_quadratic` | omitted |
| `QCurve.cocycle_twist_after_extension` | omitted |
| `QCurve.cocycle_cm_excluded` | omitted |

### Tate's theorem: H²(G_ℚ, ℚ̄^×) = 0 for the trivial action, and the splitting map α

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/tate-vanishing-qbar` (lemma).

Let M = ℚ̄^× with trivial action of G_ℚ (discrete). Then H²(G_ℚ, M) = 0 (continuous cohomology). Consequently, for a non-CM ℚ-curve with cocycle c (GT.5/ribet-cocycle) there is a locally constant α : G_ℚ → ℚ̄^× with c(g, h) = α(g)α(h)/α(gh), factoring through Gal(K′/ℚ) for a finite Galois K′ ⊇ K; ε_C(g) = α(g)²/deg μ_g is a Dirichlet character with values in E_α = ℚ(α(g) : g ∈ G_ℚ), and E_α is an abelian extension of ℚ.

Construction or proof:

1. The torsion of M is μ_∞ ≅ ℚ/ℤ with trivial action and M/μ_∞ is uniquely divisible, so H^i(G_ℚ, M/μ_∞) = 0 for i ≥ 1 (cohomology of a profinite group is torsion); hence H²(G_ℚ, M) = H²(G_ℚ, ℚ/ℤ) = 0 (GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing).
2. The image of [c_C] in H²(G_ℚ, ℚ̄^×) vanishes, giving α; a locally constant α factors through a finite quotient.
3. α(g)²/deg μ_g is multiplicative by GT.5/ribet-cocycle (c² = ∂(deg μ)), so it is a character of finite order, a Dirichlet character; α² ≡ ε_C mod ℚ^× makes E_α abelian over ℚ.

Acceptance:

- For K quadratic and μ ∘ σμ = [m], α(σ) = √m and ε_C is trivial or the character of K/ℚ according to the sign of m (GT.5/quadratic-q-curves).
- The statement fails for nontrivial action: H²(G_ℚ, ℚ̄^×) with the Galois action is not zero (it contains the Brauer group of ℚ).

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-cocycle`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `mathlib:DirichletCharacter`, `mathlib:cyclotomicCharacter`, `mathlib:continuousCohomology`, `tauceti:TauCeti.ofDiscreteModule`.

Source: Ribet92, Theorem 6.3, p. 13 — Tate's theorem as Ribet states it (the text layer drops the bar and ×); Ribet92, proof of Theorem 6.3, p. 13 — The reduction to ℚ/ℤ.

Suggested coverage: signature-fragment. Vanishing is stated on canonical continuousCohomology 2 of ofDiscreteModule with trivial G_ℚ-action on discrete Additive ℚ̄ˣ. Omitted: extracting α from the geometric cocycle, finite quotient and ε_C/E_α conclusions; requires the cocycle construction and ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation.

### Ribet's Lemma 6.4: the endomorphism algebra of Res_{K/ℚ} C₀ is a twisted group algebra

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/restriction-of-scalars-endomorphisms` (theorem).

Let C₀ be a non-CM ℚ-curve over a finite Galois K/ℚ with K-isogenies μ_g and cocycle c (GT.5/ribet-cocycle), and B = Res_{K/ℚ} C₀, an abelian variety over ℚ of dimension [K : ℚ], where K is enlarged (Ribet: 'after again enlarging K') so that the splitting α of GT.5/tate-vanishing-qbar factors through Gal(K/ℚ). Then End⁰_ℚ(B) = ⊕_{σ ∈ Gal(K/ℚ)} Hom⁰_K(σC₀, C₀) has a ℚ-basis λ_σ corresponding to μ_σ with λ_σλ_τ = c(σ, τ)λ_{στ}: it is the twisted group algebra R = ℚ^c[Gal(K/ℚ)]. For a splitting α of c (GT.5/tate-vanishing-qbar), ω : R → E_α, λ_σ ↦ α(σ), is a surjective homomorphism of ℚ-algebras, and R is semisimple.

Construction or proof:

1. B is an abelian variety over ℚ representing S ↦ C₀(S_K) (AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes), so Hom_ℚ(X, B) = Hom_K(X_K, C₀) for abelian X/ℚ; with B_K ≅ ∏_σ σC₀ (A6/weil-restriction-over-a-separable-extension-splits) this gives End⁰_ℚ(B) = ⊕_σ Hom⁰_K(σC₀, C₀) = ⊕_σ ℚ·μ_σ.
2. λ_σ acts on B_K = ∏_g ᵍC₀ by the matrix sending the factor ᵍσC₀ to ᵍC₀ through ᵍμ_σ; the identity μ_σ ∘ σμ_τ = c(σ, τ)μ_{στ} gives the multiplication table.
3. ω is multiplicative because c = ∂α; it is onto E_α by definition. R is semisimple as End⁰ of an abelian variety (A6).

Acceptance:

- For C₀ over ℚ and K = ℚ, R = ℚ and B = C₀.
- For K quadratic, R = ℚ[X]/(X² − m) (GT.5/quadratic-q-curves).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-cocycle`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/tate-vanishing-qbar`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

Source: Ribet92, Lemma 6.4, p. 14 — The multiplication table; Ribet92, §6, p. 14 — The map ω.

Suggested coverage: omitted. The concrete restriction-of-scalars object, twisted group algebra and its End0 identification require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny and the typed geometric cocycle. They are not represented by unconstrained functors or actions.

### Ribet's Proposition 6.5 and Corollary 6.6: B_K ~ R ⊗ C₀ and Lie(B) is free of rank one

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/lie-free-rank-one` (theorem).

In the situation of GT.5/restriction-of-scalars-endomorphisms, let T = ∏_{σ} C_σ (copies of C₀ over K) with R acting by λ_g : C_σ → C_{gσ} through multiplication by c(g, σ). The isomorphism up to isogeny ι : T → B_K = ∏_σ σC₀, taking C_σ to the σ⁻¹C₀ factor by ᵟμ_σ with δ = σ⁻¹ (the conjugate of μ_σ, not its inverse), is R-equivariant. Consequently Lie(B/ℚ) is a free R-module of rank one.

Construction or proof:

1. On the C_σ factor put h = (gσ)⁻¹. The structural λ_g sends the σ⁻¹C₀ factor to hC₀ through ʰμ_g. Thus λ_gι has component ʰμ_g ∘ ᵟμ_σ with δ = σ⁻¹, equal to ʰ(μ_g ∘ ᵍμ_σ) = c(g,σ)ʰμ_{gσ}. This is the component of ιλ_g from C_σ to hC₀, proving equivariance with the source’s inverse-index convention.
2. Lie(B_K/K) = Lie(B/ℚ) ⊗ K, and through ι it is R ⊗_ℚ Lie(C₀/K) with R acting on the first factor; Lie(C₀/K) is one-dimensional, so Lie(B_K/K) is free of rank one over R ⊗ K, and freeness descends to Lie(B/ℚ) over R. Here R is finite-dimensional semisimple: descent of this module isomorphism follows by comparing simple-module multiplicities in its Wedderburn decomposition, not from a general assertion that free modules descend over every ring.

Acceptance:

- For K = ℚ: Lie(C₀) is free of rank one over ℚ.
- For K quadratic, Lie(B) is a free ℚ[X]/(X² − m)-module of rank one, two-dimensional over ℚ.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/restriction-of-scalars-endomorphisms`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`, `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

Source: Ribet92, Proposition 6.5, p. 15 — The equivariance (proof omitted in the source); Ribet92, Corollary 6.6, p. 15 — The freeness.

Suggested coverage: omitted. Both the R-equivariant isogeny of concrete products and Lie(B/ℚ)≃R are omitted until AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny. The mathematical proof below specifies source R-action, target structural action and the inverse-index component computation; no arbitrary product map is offered as a substitute.

### Ribet's Theorem 6.1: non-CM ℚ-curves are factors of GL₂-type varieties

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-theorem-6-1` (theorem).

Let C be a non-CM ℚ-curve. There is a primitive (ℚ-simple) abelian variety A over ℚ of GL₂(E_α)-type such that C is a ℚ̄-simple factor of A: A is the image of a positive multiple of the projector π ∈ R onto the factor E_α (GT.5/restriction-of-scalars-endomorphisms) acting on B = Res_{K/ℚ} C₀, End⁰_ℚ(A) = E_α, dim A = [E_α : ℚ], and A_K is K-isogenous to C₀^{dim A}.

Construction or proof:

1. R = E_α × ker ω as semisimple algebras; let π be the idempotent of E_α and A ⊆ B the image of mπ for m with mπ ∈ End_ℚ(B); A is nonzero, defined over ℚ, and E_α = πRπ acts on A.
2. E_α acts without multiplicity on Lie(B) (GT.5/lie-free-rank-one), hence on Lie(A), so dim A = [E_α : ℚ] and A is of GL₂(E_α)-type (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety).
3. B_K is isogenous to a power of C₀ (A6/weil-restriction-over-a-separable-extension-splits with σC₀ ~ C₀), so A_K is too, and C₀ is a quotient of A_K. A is primitive: End⁰_ℚ(A) = πRπ = E_α is a field (GT.1/ribet-theorem-2-1).

Acceptance:

- For C defined over ℚ: A = C, E_α = ℚ.
- For the ℚ(√13)-curve of Ribet §7 (from the level-169 newform with E = ℚ(√3)), A = A_f of dimension two.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/lie-free-rank-one`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/restriction-of-scalars-endomorphisms`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/tate-vanishing-qbar`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.1/ribet-theorem-2-1`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

Source: Ribet92, Theorem 6.1, p. 12 — The statement (the second ℚ carries a bar in print); Ribet92, proof of Theorem 6.1, p. 15 — The construction of A as an image of a projector.

Suggested coverage: omitted. Projector-image and geometric-factor signatures require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, A3 image/quotient interfaces and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, together with the native R25.5 bundle. The exact construction and degree/rank proof remain in the mathematical plan.

Atlas planet: Ribet's ℚ-curve theorem.

### Ribet's Corollary 6.2, unconditional: ℚ-curves are quotients of J₁(N) over ℚ̄

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/q-curves-geometrically-modular` (theorem).

Every non-CM ℚ-curve C is a quotient over ℚ̄ of J₁(N)_ℚ̄ for some N ≥ 1; more precisely there are a weight-two newform f of level N and a finite Galois extension K′/ℚ over which C has a model C₀ with (A_f)_{K′} K′-isogenous to C₀^{[K_f : ℚ]}. Ribet §5 proves the converse (a non-CM ℚ̄-simple factor of a GL₂-type variety over ℚ is a ℚ-curve); this roadmap plans the direction stated.

Construction or proof:

1. GT.5/ribet-theorem-6-1 gives A over ℚ of GL₂-type with A_{K′} ~ C₀^{dim A}; GT.3/modularity-theorem gives A ~ A_f and a surjection J₁(N) → A over ℚ; compose over K′ with a projection A_{K′} → C₀.
2. CM curves are excluded: they are quotients of J₁(N)_ℚ̄ by Shimura's theorem ([26, Th. 1] in Ribet), which is not planned here, and Caraiani–Newton count CM curves as modular by definition.

Acceptance:

- A curve over ℚ: f its newform, K′ = ℚ.
- The 5-isogenous family of Caraiani–Newton Corollary 7.2.5 consists of such curves.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-theorem-6-1`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/modularity-theorem`, `ModularCurvesPartII:R14.5/modular-quotient`.

Source: Ribet92, Corollary 6.2, p. 12 — The corollary, conditional on Serre's conjecture, now unconditional (ClassicalSerreModularity R27.6); FLHS15, §12, p. 18 — The unconditional form as used by Freitas–Le Hung–Siksek.

Suggested coverage: omitted. The quotient J₁(N)_ℚ̄→C requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality so the elliptic curve, abelian variety and geometric quotient have compatible native types.

### ℚ-curves over quadratic fields (Ribet §7)

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/quadratic-q-curves` (theorem).

Let K be a quadratic field with Gal(K/ℚ) = {1, σ} and C₀ a non-CM elliptic curve over K with a K-isogeny μ : σC₀ → C₀; then μ ∘ σμ = [m] for a nonzero integer m, R = End⁰_ℚ(Res_{K/ℚ} C₀) = ℚ[X]/(X² − m), and θ : Gal(K/ℚ) → {±1}, θ(σ) = sign(m), is the character α²/deg μ. (a) If m is a square, C₀ is K-isogenous to the base change of an elliptic curve over ℚ. (b) If m is not a square, B = Res_{K/ℚ} C₀ is a primitive abelian surface of GL₂(ℚ(√m))-type, its character ε (GT.2/determinant-character) equals θ (Lemma 7.1), and E = ℚ(√m) is real if and only if θ is trivial. (c) If K is imaginary then m > 0. In the nonsquare case (b), Serre’s Proposition 7.2 says that at least one of the two quadratic fields E and K is real; thus imaginary K gives real quadratic E, ε = 1 and B a quotient of J₀(N). In the square case R ≅ ℚ × ℚ and there is no quadratic endomorphism field E of B; instead its rational elliptic factors are modular Γ₀ quotients.

Construction or proof:

1. c takes the value m on (σ, σ) and 1 elsewhere (GT.5/ribet-cocycle); R = ℚ[X]/(X² − m) by GT.5/restriction-of-scalars-endomorphisms, split by α(σ) = √m.
2. (a) m a square: R ≅ ℚ × ℚ, E_α = ℚ, and GT.5/ribet-theorem-6-1 gives an elliptic curve A over ℚ with A_K ~ C₀. (b) R = E is a field and B = A is primitive; B_K ~ C₀ × C₀ with E acting through its regular representation, so det ρ_λ|_{G_K} = χ_ℓ, ε is a character of Gal(K/ℚ), nontrivial exactly when E is imaginary (GT.2/coefficient-conjugation, GT.3/trivial-character), hence ε = θ.
3. (c) If K is imaginary, σ is complex conjugation, C₀(ℂ) = ℂ/L and σC₀(ℂ) = ℂ/L̄, μ is multiplication by some γ ∈ ℂ^×, and m = γγ̄ > 0. Alternatively: if E is imaginary, ε = θ is nontrivial and even (GT.2/odd), so K is real.

Acceptance:

- Caraiani–Newton’s imaginary quadratic ℚ-curves with K-defined conjugate isogenies fall under (c): the nonsquare case has E real and ε = 1, while the square case descends to rational elliptic factors.
- Koike's example: E = ℚ(√3) real, K = ℚ(√−3) imaginary (Ribet §7, level 81).
- Shimura's examples with E imaginary and K real (Ribet §7).

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-cocycle`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/restriction-of-scalars-endomorphisms`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-theorem-6-1`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/determinant-character`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/odd`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.2/coefficient-conjugation`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.3/trivial-character`, `AbelianSchemesAndArithmeticModuli:A6`.

Source: Ribet92, §7, p. 15 — The quadratic case; Ribet92, Lemma 7.1, p. 16 — ε = θ; Ribet92, Proposition 7.2, p. 16 — Serre's proposition.

Suggested coverage: omitted. The actual Weil restriction, endomorphism algebra ℚ[X]/(X²−m), character and descent signature require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings. Both square/split and nonsquare/field branches are retained in the mathematical plan.

Stage obligations: Resolve the request to AbelianSchemesAndArithmeticModuli A3 (quotients by finite subgroups), not yet in a packet. Export A1/A6 rational geometric maps and Weil-restriction action; obtain the canonical degree-two cohomology comparison; fill the explicit cocycle/CM/descent omissions.

## GT.6 — Modularity of ℚ-curves over their fields of definition

### Representations agreeing on an open normal subgroup differ by a character

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/twisting-lemma` (lemma).

Let G be a profinite group, H ⊆ G an open normal subgroup, L an algebraically closed field of characteristic 0 with its ℓ-adic or discrete topology, and ρ₁, ρ₂ : G → GL₂(L) continuous with ρ₁|_H ≅ ρ₂|_H absolutely irreducible. Then there is a character ψ : G/H → L^× with ρ₂ ≅ ρ₁ ⊗ ψ.

Construction or proof:

1. Hom_H(ρ₁, ρ₂) is one-dimensional by Schur's lemma; G acts on it by (g·φ) = ρ₂(g) ∘ φ ∘ ρ₁(g)⁻¹, H trivially since φ is H-equivariant, so G/H acts through a character ψ.
2. A nonzero φ is injective and surjective (ρ₁|_H, ρ₂|_H irreducible of the same dimension) and satisfies ρ₂(g) ∘ φ = ψ(g) · φ ∘ ρ₁(g) for the character ψ of G/H by which G acts on the line Hom_H(ρ₁, ρ₂); so φ : ρ₁ ⊗ ψ ≅ ρ₂. ψ is continuous as it factors through the finite group G/H.

Acceptance:

- ρ₂ = ρ₁ ⊗ η for a character η of G/H recovers ψ = η.
- Fails without absolute irreducibility on H: for ρ₁|_H reducible, Hom_H can be two-dimensional and no character need exist.

Direct prerequisites: `mathlib:IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`, `mathlib:LinearMap.bijective_or_eq_zero`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

Source: Ribet92, proof of Theorem 5.3, p. 10 — Ribet's use of the lemma for representations isomorphic on an open subgroup.

Suggested coverage: signature. The complete two-dimensional continuous matrix representation signature is independent of geometric suppliers and was separately elaborated at the Mathlib pin.

### The Tate module of a ℚ-curve is a twist of the restriction of a newform's representation

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/q-curve-galois-modularity` (theorem).

Let K be a number field, C an elliptic curve over K without CM (End_K̄(C) = ℤ) that is a ℚ-curve (GT.5/q-curve), and ℓ a prime. There are a weight-two newform f, an embedding ι : K_f → ℚ̄_ℓ and a character of finite order ψ : G_K → ℚ̄_ℓ^× such that V_ℓ(C) ⊗_{ℚ_ℓ} ℚ̄_ℓ ≅ (ρ_{f,ι}|_{G_K}) ⊗ ψ as representations of G_K. Moreover ρ_{f,ι}|_{G_{K″}} is absolutely irreducible for every finite extension K″ of K.

Construction or proof:

1. By GT.5/ribet-theorem-6-1 and GT.5/q-curves-geometrically-modular there are A_f over ℚ and a finite Galois K′/ℚ containing K with (A_f)_{K′} ~ C_{K′}^{n}, n = [K_f : ℚ]; so V_ℓ(A_f)|_{G_{K′}} ≅ V_ℓ(C)^{n}, compatibly with K_f ⊗ ℚ_ℓ acting on Hom⁰_{K′}(C, A_f) ⊗ ℚ_ℓ, a free module of rank one.
2. Hence ρ_{f,ι}|_{G_{K′}} ≅ V_ℓ(C) ⊗ ℚ̄_ℓ restricted to G_{K′} for every ι (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition and Jordan–Hölder).
3. V_ℓ(C) is absolutely irreducible on every open subgroup: Faltings over K″ gives End_{G_{K″}} V_ℓ(C) = End_{K″}(C) ⊗ ℚ_ℓ = ℚ_ℓ with V_ℓ(C) semisimple (FaltingsFinitenessAndIsogenyTheorems:R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve, R28.6/tate-hom-comparison-for-elliptic-curves). Apply GT.6/twisting-lemma to G_K ⊇ G_{K′}.

Acceptance:

- C with a model over ℚ: f is the newform of the model, ψ the quadratic character of a twist.
- For K quadratic and m a non-square (GT.5/quadratic-q-curves), f has K_f = ℚ(√m) and B = Res_{K/ℚ}C ~ A_f.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/ribet-theorem-6-1`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/q-curves-geometrically-modular`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/twisting-lemma`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/tate-hom-comparison-for-elliptic-curves`, `ArithmeticGaloisRepresentations:R01.6/tate-module-of-an-abelian-variety`.

Source: Ribet92, Lemma 7.1 proof, p. 16 — Over the field of definition of the isogenies the representations of A and C agree; the twist ψ accounts for descending to K.

Suggested coverage: omitted. The native C Tate module, newform coefficient embedding and finite-order twisting character/family require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. No mirrored representation carrier is used.

### Modularity of ℚ-curves over solvable Galois fields

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/q-curve-automorphy` (theorem).

Let K be a finite Galois extension of ℚ with solvable Galois group, C a non-CM ℚ-curve over K, and (f, ι, ψ) as in GT.6/q-curve-galois-modularity. Then Π = BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K) (base change along a prime-cyclic tower, twisted by the finite-order Hecke character ψ ∘ Art_K of ψ) is a cuspidal automorphic representation of GL₂(𝔸_K) of parallel weight two, and for every finite place v of K the local factor of L(Π, s − 1/2) equals the local factor of L(C, s); hence L(Π, s − 1/2) = L(C, s), and in the classical normalisation the Hecke eigenvalue of T_v on Π at unramified v is the integer a_v(C) = Nv + 1 − #C̃_v(k_v). So C is modular in the sense of Caraiani–Newton §1 (and, for K totally real, of Freitas–Le Hung–Siksek §1).

Construction or proof:

1. Base change: K/ℚ is Galois solvable, so BC_{K/ℚ} is defined along a prime-cyclic tower (GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change); at each step the image stays cuspidal because ρ_f restricted to every open subgroup is absolutely irreducible (GT.6/q-curve-galois-modularity), so π_f is never dihedral relative to a step.
2. Fix the one-ℓ isomorphism (f,ι,ψ) from GT.6/q-curve-galois-modularity. The finite image of ψ consists of roots of unity; choose their algebraic lifts compatibly with ι in a finite number field containing K_f, and use global Artin reciprocity to form its finite-order Hecke character. At good v the one-ℓ isomorphism identifies the algebraic trace and determinant of the twisted restricted newform with the rational polynomial of C. Injectivity of the coefficient embedding makes these identities algebraic, so they transport to every auxiliary coefficient prime. R17.6/compatible-base-change then matches the twisted base change Π with this family at good v; R01.5 recognition identifies it with V_ℓ′(C) for every auxiliary ℓ′, using continuity, semisimplicity and the corresponding embeddings and twists.
3. For any finite v over p, now choose an auxiliary ℓ′ ≠ p using the preceding transport, rather than changing the original fixed ℓ without justification. R17.4/local-compatibility identifies rec(Π_v) with the restriction of rec(π_{f,p}) to W_{K_v} twisted by the algebraic character at v; Carayol (R19.4) compares this with the WD parameter of the corresponding ℓ′-adic member. Its identification with V_ℓ′(C) gives equality of the local factors even at bad v (R11.5/local-euler-polynomial).
4. At archimedean places the base change of the weight-two discrete series is cohomological of parallel weight two.

Acceptance:

- K = ℚ: Π = π_f ⊗ ψ, recovering the modularity of twists of curves over ℚ.
- K = ℚ(√−11) and the ℚ-curves with x(P) ∈ ℚ of Caraiani–Newton Corollary 7.3.4: Π is a twisted base change from ℚ of a weight-two newform.
- Non-example: for K/ℚ not solvable the base-change step is unavailable and the theorem makes no claim.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/q-curve-galois-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Source: FLHS15, §12, p. 18 — The statement for the real quadratic curves of Freitas–Le Hung–Siksek; CN23, §1, p. 2 — The notion of modularity over F that the conclusion meets; FLHS15, §1, pp. 2–3 — The totally real notion.

Suggested coverage: omitted. The native cuspidal representation, algebraic finite-order twist, all-place Euler equality and auxiliary-prime transport require GL2AutomorphicRepresentationsAndTransfer:R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties:R11.5 local factors and ClassFieldTheory Layer 11 Artin reciprocity. Caraiani–Newton modularity retains its separate CM branch.

Atlas planet: Modularity of ℚ-curves.

### ℚ-curves over quadratic fields are modular

Node: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/quadratic-q-curves-modular` (theorem).

Let K be a quadratic field (real or imaginary) and C an elliptic curve over K that is a ℚ-curve. Then C is modular in the sense of Caraiani–Newton §1: either C has CM, or there is a cuspidal automorphic representation Π of GL₂(𝔸_K) of parallel weight two with L(Π, s − 1/2) = L(C, s). This is the input of Caraiani–Newton Corollaries 7.2.5 and 7.3.4 (for imaginary K) and of Freitas–Le Hung–Siksek §12 (for real K).

Construction or proof:

1. CM curves are modular by definition in Caraiani–Newton's sense.
2. Otherwise K/ℚ is cyclic of degree two, hence solvable Galois, and GT.6/q-curve-automorphy applies.
3. For imaginary K and a K-defined isogeny σC → C, GT.5/quadratic-q-curves gives m > 0. If m is nonsquare, Res_{K/ℚ} C has a real quadratic endomorphism field and is a quotient of J₀(N). If m is square, its endomorphism algebra is ℚ × ℚ: the rational elliptic factors are Γ₀-modular, so their product is a quotient of J₀(N) at a common multiple of their levels. This last conclusion does not turn the split endomorphism algebra into a field.

Acceptance:

- Caraiani–Newton Corollary 7.2.5: E and σE 5-isogenous over a quadratic F, so E is modular.
- Freitas–Le Hung–Siksek Lemma 12.1: the real quadratic points of X₀(35) that are ℚ-curves give modular curves.
- Non-example: a quadratic-field curve that is not a ℚ-curve gets no conclusion here.

Direct prerequisites: `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/q-curve-automorphy`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/quadratic-q-curves`, `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.5/q-curve`.

Source: CN23, Corollary 7.2.5, p. 97 — The consumer step; CN23, Corollary 7.3.4, p. 98 — The second consumer step; FLHS15, §11, p. 17 — The real quadratic use.

Suggested coverage: omitted. The quadratic-field modularity signature requires the geometric and automorphic interfaces of Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and GL2AutomorphicRepresentationsAndTransfer:R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties:R11.5 local factors. The mathematical plan distinguishes square/nonsquare m and the CM alternative.

Atlas planet: Quadratic ℚ-curves are modular.

Stage obligations: Export native automorphic base change and compatible algebraic finite twists; fill the all-place modularity signatures, retaining the separate CM and split/nonsplit branches.

## Supplier requests and remaining gaps

- `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`: The old/new decomposition of S₂(Γ₁(N)) with the multiplicity d(N/M) of a newform of level M, giving the isogeny decomposition of J₁(N) into the A_f.
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`: Chebotarev density for finite Galois extensions of ℚ and of number fields: the Frobenius elements at unramified primes of a density-one set are dense, so continuous semisimple representations are determined by Frobenius traces off a finite set, and infinitely many primes split completely in a number field.
- `AbelianSchemesAndArithmeticModuli:A3`: Quotient of an abelian variety over a field by a finite subgroup scheme stable under Galois (here a finite étale subgroup of A(ℚ̄)), with the isogeny A → A/K and T_ℓ(A/K) the lattice generated by T_ℓ(A) and the ℓ-part of K; used to build the integral model with End = 𝒪_E (GT.2/integral-model).
- `AbelianSchemesAndArithmeticModuli:A6`: Complex uniformization and comparison for an abelian variety A over ℚ with ℚ̄ ⊂ ℂ fixed: A(ℂ) ≅ Lie(A_ℂ)/H₁(A(ℂ), ℤ); the Hodge decomposition H₁(A(ℂ), ℚ) ⊗ ℂ = H^{-1,0} ⊕ H^{0,-1}; and the isomorphism T_ℓ(A) ≅ H₁(A(ℂ), ℤ) ⊗ ℤ_ℓ, equivariant for End_ℚ(A) and identifying complex conjugation in G_ℚ with the real Frobenius F_∞ (induced by complex conjugation on A(ℂ)), which interchanges H^{-1,0} and H^{0,-1}. Used for Ribet's oddness Lemma 3.2 (GT.2/odd) and Serre's Proposition 7.2 (GT.5/quadratic-q-curves). No layer of the atlas plans this comparison; A6 extends the field-level API of abelian varieties and is its natural owner.
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`: On the existing HeckeRing.GL2.Newform carrier, export finiteness of normalized weight-two newforms of positive level dividing a fixed integer, using the character-space decomposition. Import coefficient fields from ModularForms Layer 8. The bundled newform itself is pinned baseline, not new work.
- `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`: Character-space decomposition of S₂(Γ₁(N)) over diamond characters, with comparison to the existing cuspFormCharSpace joint eigenspace. The eigenspace definition already exists; the decomposition is the missing input.
- `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`: Cross-level strong multiplicity one from agreement at almost all primes: two normalized newforms with these agreements have the same least level and coincide after identifying their native cusp-form spaces. The pinned fixed-level, fixed-nebentypus theorem on almost all good indices is baseline; this request extends its interface rather than replanning it. Apply also to coefficient-field conjugates.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`: The Abel–Jacobi morphism of a curve with a rational point and the fact that its image generates the Jacobian, used for the modular parametrisation X₁(N) → A.
- `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`: On the existing native cusp-form L-series, export the normalized newform Euler product (including bad primes) and the functional equation for the normalized Fricke companion, with weight-two factor i²=−1 and its pseudo-eigenvalue. After absorbing these constants, Λ(f,s)=w_f Λ(f̄,2−s), where Λ(f,s)=N^{s/2}(2π)^{−s}Γ(s)L(f,s). Entire continuation of the q-expansion L-series is already pinned baseline and is imported.
- `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`: The normalised Fricke companion 𝒲_N on a newform f of level N, its pseudo-eigenvalue relating it to the complex-conjugate newform, and its compatibility with the functional equation of ModularForms Layer 7. At weight two record the sign i² = −1 before absorbing the constants into w_f.
- `AbelianSchemesAndArithmeticModuli:A1`: Export the native finite-dimension bridge (finrank_K A.TangentSpace : WithBot ℕ∞) = A.dim, and the equivalence between native dimension-one abelian varieties and nonsingular Weierstrass curves. Require compatibility with homomorphisms/isogenies, identity and composition, field embeddings and coefficientwise conjugation. The native variety, tangent space, products, base change, nonsingular curve and elliptic isogeny carriers already exist.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`: Export a degree-two equivalence from the existing explicit continuous ContCohomology.DiscreteH2/Z2 cocycle quotient to canonical continuousCohomology 2 (ofDiscreteModule ℤ G M), natural for coefficient maps and finite-quotient inflation. Import the already pinned explicitInfl2 rather than replanning inflation or Z2. The pinned ContinuousCohomologyIso module compares degree zero only; GroupCohomologyIso degree two is for discrete G, not G_ℚ. Also export positive-degree vanishing for uniquely divisible discrete modules. For this consumer use trivial action and discrete topology on Additive ℚˣ/ℚ̄ˣ; the algebraic-unit action is not the natural Galois action.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`: Global Artin reciprocity for a number field K, to turn a finite-order character ψ of G_K into the finite-order Hecke character ψ ∘ Art_K used to twist the base change.
- `AbelianSchemesAndArithmeticModuli:A6`: AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. Include End0=ℚ⊗_ℤ native End, common-denominator equivariance, inverse of a native isogeny in Hom0, conjugation/Tate transport, faithful base-change injection, and compatibility of these maps with native Weierstrass isogenies via A1. For Weil restriction export AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny. These are signatures of the existing A6 targets, not a second endomorphism/isogeny theory.
- `ArithmeticGaloisRepresentations:R01.6`: ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings. Export the actual V_ℓ and λ-torsion carriers, continuous representations, integral-order action, isogeny intertwining, λ-component decomposition and scalar extension, coherently with the R25.5 GL₂-type bundle. Consumers must be stated on these modules.
- `ModularCurvesPartII:R14.5`: ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps. Export the actual Hecke T₂ action on J₀(23), T₂²+T₂−1=0 and End0=ℚ[T₂]≃ℚ(√5); retain this generator in the primitive/endField tests. The low-positive-level Jacobians in these tests require the R14.2 extension to N=1,…,4. Elliptic modularity must use a native nonconstant curve morphism X₁(N) or X₀(N)→E, equivalent to a surjective Jacobian quotient, with rational cusp, zero value, generating image and R29.5 pointed comparison.
- `GL2AutomorphicRepresentationsAndTransfer:R17.4`: GL2AutomorphicRepresentationsAndTransfer:R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties:R11.5 local factors. Require the same algebraic finite-order character to define the Hecke twist and all coefficient-prime members; specify the parallel-weight-two archimedean component. This is an export of the owner’s solvable base change and compatible-family targets.
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`: Export the owner’s CoefficientField on native weight-two Newform, its NumberField instance, integral Fourier coefficients, and coefficient-embedding/Galois-conjugation interfaces. These are the stated Layer 8 migration targets, imported by the R14.5 quotient and this roadmap; no private coefficient-field carrier is introduced.

### Native rational-endomorphism and Tate export interfaces

The native carriers and finite dimension bridge are now explicit. Remaining omitted signatures are the A6 compatible field/Rosati/action interfaces and the R01.6/R25.5 Tate/residual/bundle exports. Item-level suggestedCoverage states which parts are present; existing pinned products/base change are not gaps.

### Native modular-geometry and local-system export interfaces

R14.2/R14.5/R14.6 must export the native modular curves/Jacobians/A_f/Hecke actions and pointed parametrisations. R19.3/R19.4, R24.5, R11.5 and ModularForms Layers 6–7 supply representations, local WD/conductors and analytic objects. No replacement objects or Prop-valued placeholder predicates appear in the suggested file.

### Geometric Q-curve cocycle and canonical cohomology comparison

A1/A6 must connect native Weierstrass isogenies to rational End0 with faithful base change, rational inverses, the non-CM ℚ-identification and the concrete Weil-restriction action. ProfiniteCohomology must export the canonical degree-two comparison and its naturality. Canonical H² and typed scalar extraction are present; geometric cocycle/class construction is explicitly omitted. Explicit continuous cocycles and inflation are already baseline.

### Native automorphic finite-twist and all-place comparison exports

R17.4/R17.6, R19.4, R01.6, R11.5 and Artin reciprocity must supply the native automorphic/Tate carriers and coherent algebraic finite twist. Those signatures are omitted; the independent pure matrix twisting lemma is stated and checked.

## Pinned baseline

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were checked in the source at those commits; they provide only the stated inputs.

| Declaration | Provides |
| --- | --- |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | Abelian variety over a field K: a group object in Over (Spec K), proper and geometrically integral (bundled); smoothness, connectedness and commutativity derived |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` | The tangent space at 0 (Zariski tangent space at the zero point), the Lie algebra Lie(A/K) used in the Lie-algebra divisibility argument |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | Isogenies of abelian varieties over a field (finite surjective homomorphisms) |
| `tauceti:HeckeRing.GL2.Newform` | Bundled newforms of level N and weight k: Hecke eigenform away from the level, new, normalised a₁ = 1 |
| `tauceti:cuspFormCharSpace` | S_k(N, χ) as the joint diamond-operator eigenspace in S_k(Γ₁(N)), χ : (ℤ/N)ˣ →* ℂˣ |
| `mathlib:CongruenceSubgroup.Gamma1` | The congruence subgroup Γ₁(N) of SL₂(ℤ) |
| `mathlib:cyclotomicCharacter` | The ℓ-adic cyclotomic character (L ≃+* L) →* ℤ_ℓˣ |
| `mathlib:DirichletCharacter` | Dirichlet characters as multiplicative characters of ℤ/n, the form of the nebentypus ε |
| `mathlib:NumberField.IsCMField` | CM fields: totally complex quadratic extensions of their maximal real subfield |
| `mathlib:NumberField.IsTotallyReal` | Totally real number fields: every infinite place is real |
| `mathlib:Field.absoluteGaloisGroup` | The absolute Galois group G_K = Aut(K̄/K) with its Krull topology |
| `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` | Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras |
| `mathlib:IsSemisimpleModule` | Semisimple modules (complemented submodule lattice), the form of Faltings' semisimplicity |
| `mathlib:IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` | Schur's lemma over an algebraically closed field: the commutant of a finite-dimensional simple module is the scalars |
| `mathlib:LinearMap.bijective_or_eq_zero` | Schur's lemma: a linear map between simple modules is bijective or zero |
| `mathlib:traceForm_nondegenerate` | The trace form of a finite separable field extension is nondegenerate |
| `mathlib:WeierstrassCurve.IsElliptic` | Elliptic Weierstrass curves (unit discriminant), the elliptic curves of GT.5 |
| `mathlib:continuousCohomology` | Continuous cohomology in degree n of a TopRep, as the homology of homogeneous cochains in TopModuleCat; the canonical H² carrier, not its inflation/comparison API. |
| `tauceti:TauCeti.ofDiscreteModule` | A discrete module with a G-action as a TopRep; joint continuity/smoothness is a separate hypothesis, automatic for the trivial action used here. Use Additive ℚˣ or Additive ℚ̄ˣ with discrete topology for the multiplicative coefficients. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End` | Native End A = Additive (A ⟶ A), with Ring operations induced by the pointwise group law and composition; not a Preadditive hom-set assumption. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod` | Native categorical product of two abelian varieties; the module provides finite products used for piObj powers. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.baseChange` | Actual pullback base change of an abelian variety along a field algebra map; not a substitute for rational Hom0 functoriality. |
| `tauceti:TauCeti.Isogeny` | Native Weierstrass isogeny via a coordinate-ring pullback into the source function field and the maps-infinity condition. This consumer additionally requires IsElliptic on both curves. |
| `tauceti:TauCeti.Isogeny.map` | Coefficientwise base change of an actual isogeny along a field ring homomorphism, with identity, composition and iterated-map coherence in the same module. |
| `tauceti:WeierstrassCurve.quadraticTwistOf` | Explicit twist by trace/norm parameters (t,n); nonsingularity requires t²−4n nonzero over a field. For t=0,n=−d/4 its discriminant parameter is d. |
| `tauceti:TauCeti.ContCohomology.Z2` | Existing continuous inhomogeneous degree-two cocycles for a continuous action, as continuous cochains intersected with ker d2. Not canonical continuousCohomology without the requested comparison. |
| `tauceti:TauCeti.ContCohomology.explicitInfl2` | Existing explicit degree-two inflation from a normal-subgroup quotient with fixed-point coefficients to the full group. It still needs natural comparison with canonical continuousCohomology for this application. |
| `mathlib:WeierstrassCurve.exists_variableChange_of_j_eq` | Two nonsingular Weierstrass curves over a separably closed field with equal j-invariant differ by a native VariableChange. Includes the exceptional j=0 and j=1728 cases. |
| `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff` | For a positive-weight cusp form on the native finite-index subgroup, the Dirichlet series of its q-expansion coefficients has an entire extension. This does not supply the normalized newform Euler product or the Fricke pseudo-eigenvalue comparison. |
| `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | At fixed positive level, weight and nebentypus, normalized newforms agree if their eigenvalues agree at every index coprime to the level outside a finite set. Cross-level comparison and agreement only at almost all primes need the requested extension. |

## Sources

- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Chandrashekhar Khare and Jean-Pierre Wintenberger. Inventiones mathematicae 178 (2009), no. 3, 485–504; authors' copy results.pdf (23 pp., PDF of 31 May 2009), cited by its own page numbers. Rechecked 2026-10-08. The theorem/section/page locators appear with their targets above.
- [Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), Kenneth A. Ribet. Algebra and Topology 1992 (Taejŏn), Korea Adv. Inst. Sci. Tech. (1992), 53–79; reprinted in Modular Curves and Abelian Varieties, Progress in Mathematics 224 (2004), 241–261; author's AMS-TeX manuscript korea.pdf (19 pp., PDF of 6 September 2003), cited by its own page numbers. Rechecked 2026-10-08. The theorem/section/page locators appear with their targets above.
- [Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/item/ASENS_1986_4_19_3_409_0.pdf), Henri Carayol. Annales scientifiques de l'École normale supérieure (4) 19 (1986), no. 3, 409–468; Numdam scan with text layer (published pagination; PDF page = printed page − 407). Rechecked 2026-10-08. The theorem/section/page locators appear with their targets above.
- [Elliptic curves over real quadratic fields are modular](https://arxiv.org/pdf/1310.7088v4), Nuno Freitas, Bao V. Le Hung and Samir Siksek. Inventiones mathematicae 201 (2015), 159–206; arXiv:1310.7088v4 (18 July 2014) read. Rechecked 2026-10-08. The theorem/section/page locators appear with their targets above.
- [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), Ana Caraiani and James Newton. arXiv:2301.10509v3 (27 March 2025). Rechecked 2026-10-08. The theorem/section/page locators appear with their targets above.

The source record retains a grammatical correction confined to the Khare–Wintenberger author copy (§10.2, p.21). Its earlier compatibility-gap allegation is rejected: a difference between Ribet’s good-prime convention and KW’s local WD convention does not establish an error in the corollary. This plan uses the direct residual Serre/Ribet argument, then obtains all-place compatibility after modularity, allowing finite coefficient extension. No published/author-copy collation is claimed.
