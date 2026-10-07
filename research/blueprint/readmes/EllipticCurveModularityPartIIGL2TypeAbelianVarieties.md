# Modularity and modular parametrisations of elliptic curves over ℚ, Part II

## Abelian varieties of GL₂-type

This roadmap starts where *Modularity and modular parametrisations of elliptic curves over ℚ* (`EllipticCurveModularity`) stops. That roadmap proves, in its layers R29.1–R29.6, that every elliptic curve E over ℚ is modular: the residual representations E[p] are irreducible for almost all p, the strong Serre theorem gives weight-two newforms of level N_E for infinitely many p, one newform recurs, its coefficients equal those of E, the Tate modules agree, Faltings' isogeny criterion gives an isogeny A_f → E, and a modular parametrisation X₀(N_E) → E follows. Here every step is generalised to an abelian variety A over ℚ of dimension n with a number field E of degree n acting on it up to isogeny — an abelian variety *of GL₂-type* — and the conclusion is the theorem of Ribet and Khare–Wintenberger: **every abelian variety over ℚ of GL₂-type is a quotient of J₁(N) for some N** (Khare–Wintenberger, Corollary 10.2(i); Ribet, Theorem 4.4). The dimension-one case is the parent's theorem, and the Part II proves compatibility with it (GT.4/parent-compatibility) rather than rebuilding it.

The development follows Ribet's *Abelian varieties over Q and modular forms* (1992). GT.1 is its §2: the endomorphism algebra of a GL₂-type variety, Ribet's Theorem 2.1 (primitive ⇔ ℚ-simple ⇔ End⁰ a field of degree dim A), the endomorphism field E, which is totally real or CM, and the modular quotients A_f as the basic examples. GT.2 is its §3: the λ-adic representations ρ_λ have E-rational Frobenius polynomials X² − a_pX + ε(p)p, determinant ε·χ_ℓ for one finite-order character ε (Lemma 3.1), are odd (Lemma 3.2) and absolutely irreducible (Proposition 3.3), satisfy a_p = ε(p)ā_p (Proposition 3.4), generate E (Proposition 3.5), and are residually irreducible for almost all λ (Lemma 3.7). GT.3 is its §4 made unconditional: the strong Serre theorem of ClassicalSerreModularity R27.6 replaces Serre's conjecture. GT.4 adds Carayol's conductor theorem: cond(A) = N_f^{dim A}, so the exact level is cond(A)^{1/dim A}, and the L-function of A is the product of those of the conjugates of f.

GT.5 and GT.6 develop Ribet's ℚ-curves (§§6–7): an elliptic curve over ℚ̄ isogenous to all its Galois conjugates is, if it has no CM, a ℚ̄-factor of a GL₂-type variety over ℚ (Ribet's Theorem 6.1, via Tate's theorem H²(G_ℚ, ℚ̄^×) = 0 and Weil restriction), hence a quotient of J₁(N) over ℚ̄; over a solvable Galois field of definition K its Tate module is a twist of the restriction of a newform's representation, and the twisted base change of the newform is a cuspidal automorphic representation of GL₂(𝔸_K) of parallel weight two with the same L-function. This is the ℚ-curve step that `EllipticCurveModularityImaginaryQuadratic` imports for the quadratic points of Caraiani–Newton (Corollaries 7.2.5 and 7.3.4), and that Freitas–Le Hung–Siksek use over real quadratic fields (§12).

**Route of the main theorem.** Khare–Wintenberger deduce Corollary 10.2(i) from their Theorem 10.1(i), which concerns *compatible systems* in the sense of their §5, with Weil–Deligne comparison at every prime q not above ℓ. For a GL₂-type variety the E-rationality of the Weil–Deligne representations at the primes of bad reduction is not proved in either source before modularity (recorded as the source issue E2). GT.3 therefore follows Ribet's proof of Theorem 4.4, which is also the shape of the parent's R29.2–R29.5: it needs only the strong Serre theorem at the primes of an infinite set Λ, the boundedness of the conductors (Grothendieck's independence of ℓ, imported from NeronModelsAndSemistableAbelianVarieties R11.6), the finiteness of newforms of bounded level, and Faltings' ℓ-adic isogeny criterion. The full Khare–Wintenberger strict compatibility of the λ-adic system is then a corollary (GT.4/strict-compatibility), obtained from modularity and Carayol's local–global compatibility.

## Conventions and imported objects

- **Abelian varieties** are those of Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety` (JacobianChallenge layer E): proper, geometrically integral group schemes over a field, with homomorphisms, isogenies (finite surjective homomorphisms) and base change. End⁰_K(A) = End_K(A) ⊗ ℚ is the semisimple algebra of AbelianSchemesAndArithmeticModuli A6; ℚ-simple means simple over ℚ in the sense of A6/endomorphisms-of-simple-abelian-varieties. dim A is the dimension of A, equal to dim_ℚ Lie(A/ℚ) for the tangent space `AbelianVariety.TangentSpace`.
- **GL₂-type.** An abelian variety A over a number field F is of GL₂(K)-type when given a ring homomorphism K → End⁰_F(A) from a number field K with [K : ℚ] = dim A; this definition, the λ-adic representations V_λ(A) = V_p(A) ⊗_{K⊗ℚ_p} K_λ and their basic API belong to `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety` and are imported. Following Khare–Wintenberger, the unqualified hypothesis "A over ℚ of GL₂-type" of the modularity theorem includes ℚ-simplicity; then E = End⁰_ℚ(A) is the *endomorphism field* (GT.1/endomorphism-field).
- **Tate modules and λ-components.** V_ℓ(A) = T_ℓ(A) ⊗ ℚ_ℓ with its G_ℚ-action, the decomposition V_ℓ(A) = ⊕_{λ|ℓ} V_λ(A) and the λ-torsion A[λ] are those of `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`; freeness of V_ℓ(A) over E ⊗ ℚ_ℓ is `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.
- **Frobenius and characters.** Frob_p is an arithmetic Frobenius; χ_ℓ is Mathlib's `cyclotomicCharacter`; Dirichlet characters are Mathlib's `DirichletCharacter`, identified with finite-order characters of G_ℚ by the value at arithmetic Frobenius. Hodge–Tate weights follow the convention in which χ_ℓ has weight 1 (Khare–Wintenberger §5, PadicHodgeTheory R06.5), so V_λ(A) has weights {0, 1}, i.e. (a, b) = (1, 0).
- **Newforms.** A newform is a normalised weight-two Hecke eigenform on Γ₁(N) with character, new at level N (Tau Ceti `HeckeRing.GL2.Newform`, ModularForms layers 0–5); K_f = ℚ(a_n(f)); A_f = J₁(N)/p_f J₁(N) is the quotient of `ModularCurvesPartII:R14.5/modular-quotient`, with V_ℓ(A_f) ≅ ⊕_λ ρ_{f,λ} (`AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`) in the normalisation tr ρ_{f,λ}(Frob_p) = a_p(f), det ρ_{f,λ} = ε_f χ_ℓ.
- **Conductors.** Artin conductors of Weil–Deligne representations are those of ArithmeticGaloisRepresentations R01.3; cond(A) is the conductor of NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import, independent of ℓ by R11.6/strict-compatible-system-export.
- **Embeddings.** An algebraic closure ℚ̄ and an embedding ℚ̄ ⊂ ℂ are fixed (complex conjugation c ∈ G_ℚ, Hodge decomposition); embeddings ι : E → ℚ̄_ℓ index the members ρ_ι = V_λ(A) ⊗_{E_λ,ι} ℚ̄_ℓ of the system, as in Khare–Wintenberger §5.
- **Base change.** BC_{K/ℚ} for a solvable Galois K/ℚ is the composite of prime-cyclic base changes of `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`; L(Π, s) is in the unitary normalisation, so L(Π, s − 1/2) is compared with L(C, s).

## Baseline and ownership

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were read at these commits; everything else the roadmap uses is a node of another roadmap or one of its layers, listed under each node and in the supplier contracts at the end.

| Declaration | Kind | Module | Provides |
|---|---|---|---|
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | structure | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` | Abelian variety over a field K: a group object in Over (Spec K), proper and geometrically integral (bundled); smoothness, connectedness and commutativity derived |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` | def | `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean` | The tangent space at 0 (Zariski tangent space at the zero point), the Lie algebra Lie(A/K) used in the Lie-algebra divisibility argument |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | abbrev | `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean` | Isogenies of abelian varieties over a field (finite surjective homomorphisms) |
| `tauceti:HeckeRing.GL2.Newform` | structure | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | Bundled newforms of level N and weight k: Hecke eigenform away from the level, new, normalised a₁ = 1 |
| `tauceti:cuspFormCharSpace` | def | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean` | S_k(N, χ) as the joint diamond-operator eigenspace in S_k(Γ₁(N)), χ : (ℤ/N)ˣ →* ℂˣ |
| `mathlib:CongruenceSubgroup.Gamma1` | def | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | The congruence subgroup Γ₁(N) of SL₂(ℤ) |
| `mathlib:cyclotomicCharacter` | def | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The ℓ-adic cyclotomic character (L ≃+* L) →* ℤ_ℓˣ |
| `mathlib:DirichletCharacter` | abbrev | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | Dirichlet characters as multiplicative characters of ℤ/n, the form of the nebentypus ε |
| `mathlib:NumberField.IsCMField` | class | `Mathlib/NumberTheory/NumberField/CMField.lean` | CM fields: totally complex quadratic extensions of their maximal real subfield |
| `mathlib:NumberField.IsTotallyReal` | class | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | Totally real number fields: every infinite place is real |
| `mathlib:Field.absoluteGaloisGroup` | def | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` | The absolute Galois group G_K = Aut(K̄/K) with its Krull topology |
| `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` | theorem | `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean` | Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras |
| `mathlib:IsSemisimpleModule` | class | `Mathlib/RingTheory/SimpleModule/Basic.lean` | Semisimple modules (complemented submodule lattice), the form of Faltings' semisimplicity |
| `mathlib:IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed` | theorem | `Mathlib/RepresentationTheory/AlgebraRepresentation/Basic.lean` | Schur's lemma over an algebraically closed field: the commutant of a finite-dimensional simple module is the scalars |
| `mathlib:LinearMap.bijective_or_eq_zero` | theorem | `Mathlib/RingTheory/SimpleModule/Basic.lean` | Schur's lemma: a linear map between simple modules is bijective or zero |
| `mathlib:traceForm_nondegenerate` | theorem | `Mathlib/RingTheory/Trace/Basic.lean` | The trace form of a finite separable field extension is nondegenerate |
| `mathlib:WeierstrassCurve.IsElliptic` | class | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | Elliptic Weierstrass curves (unit discriminant), the elliptic curves of GT.5 |

## GT.1. Abelian varieties of GL₂-type and their endomorphism algebras

This layer fixes the objects. The definition of GL₂(K)-type is imported from R25.5; what is new here is Ribet's analysis of the endomorphism algebra. The key tool is the Lie-algebra divisibility: any division algebra acting on A up to isogeny over ℚ has ℚ-dimension dividing dim A, because it acts on the ℚ-vector space Lie(A/ℚ). It shows that the commutant of E is E itself, forces End⁰_ℚ(A) ≅ M_n(F) with n = [E : F], and gives the equivalence of primitivity, ℚ-simplicity and End⁰ being a field. The canonical involution of the endomorphism field is the Rosati involution of every polarization, so E is totally real or CM. The quotients A_f of J₁(N) are the examples, and J₁(N) is isogenous to a product of them.

**Layer targets.**

**Objects.** An *abelian variety of GL₂-type over ℚ* is a pair (A, ι) of an abelian variety A over ℚ and an injective ℚ-algebra map ι : E → End⁰_ℚ(A) = ℚ ⊗ End_ℚ(A) from a number field E with [E : ℚ] = dim A. It is *primitive* if A is not ℚ-isogenous to a power construction E ⊗_F B with [E : F] > 1.

**Targets.**
- The Lie-algebra divisibility: for every number field E acting on A up to isogeny over ℚ, [E : ℚ] divides dim A (Ribet §2).
- Ribet's Theorem 2.1: for (A, ι) of GL₂-type the conditions (i) A is primitive, (ii) A is ℚ-simple, (iii) End⁰_ℚ(A) is a number field of degree dim A are equivalent; in that case End⁰_ℚ(A) = ι(E).
- The power construction E ⊗_F B: for B of GL₂-type with field F and a finite extension E/F of degree n, Bⁿ is of GL₂-type with field E; it is not ℚ-simple when n > 1.
- For ℚ-simple A of GL₂-type, the field E = End⁰_ℚ(A) is totally real or a CM field, and the Rosati involution of every polarization over ℚ restricts to its canonical involution (identity, resp. complex conjugation).
- The modular quotient A_f of J₁(N) attached to a weight-two newform f is ℚ-simple of GL₂-type with End⁰_ℚ(A_f) = K_f, the coefficient field of f.

Elliptic curves over ℚ are exactly the one-dimensional case (E = ℚ), which recovers the parent's setting `EllipticCurveModularity:R29.1`.

**Layer dependencies.** `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A6`, `AutomorphicGaloisRepresentations:R19.1`, `AutomorphicGaloisRepresentations:R19.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ModularCurvesPartII:R14.5`, `PELModuli:M0`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`.

**Coverage.** planned. Remaining: Resolve the imports from AbelianSchemesAndArithmeticModuli A2/A6 (Rosati, Poincaré, endomorphism algebras), which are planned in a packet not yet reviewed. Lemma-level refinement when the roadmap comes near the front of the line: split Ribet's Theorem 2.1 into the commutant lemma, the matrix-algebra structure and the three equivalences.

### `GT.1/lie-algebra-divisibility` — The degree of an acting division algebra divides the dimension

*Lemma* · Lean namespace `TauCeti.GL2Type`

Let A be an abelian variety over ℚ and D a division ℚ-algebra with a unital ℚ-algebra map D → End⁰_ℚ(A). Then dim_ℚ D divides dim A. In particular, if A is of GL₂(E)-type (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety) and B ⊆ A is a nonzero abelian subvariety over ℚ on which E acts up to isogeny, then B = A.

**Hypotheses.**

- the map D → End⁰_ℚ(A) sends 1 to the identity
- B is stable under E up to isogeny: every e ∈ E has a multiple n·e ∈ End_ℚ(A) mapping B into B

**Construction and proof.**

1. End⁰_ℚ(A) acts ℚ-linearly on the tangent space Lie(A/ℚ) = T₀A (Tau Ceti AbelianVariety.TangentSpace), of ℚ-dimension dim A; an isogeny induces an isomorphism on tangent spaces in characteristic 0, so endomorphisms up to isogeny act.
2. A unital module over a division algebra is free, so dim_ℚ D divides dim_ℚ Lie(A/ℚ) = dim A.
3. For B: E acts on Lie(B/ℚ), of dimension dim B, so [E : ℚ] = dim A divides dim B ≤ dim A, whence B = A.

**Acceptance.**

- For E × E with E an elliptic curve over ℚ, every quadratic field acting has degree 2 = dim; no cubic field acts.
- Over 𝔽_p the tangent-space argument fails: the Frobenius endomorphism acts by zero on Lie.

**Depends on.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`.

**Source.**

- Kenneth A. Ribet, §2, p. 2: “The dimension of this vector space is therefore a multiple of [E : Q], so that we have [E : Q] | dim A.” — Ribet's Lie-algebra argument over ℚ, used again in the proof of Theorem 2.1 for the division algebra D and for subvarieties.

### `GT.1/primitive` — Primitive abelian varieties of GL₂-type and the power construction

*Definition* · Lean namespace `TauCeti.GL2Type`

For B of GL₂(F)-type over ℚ (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety) and a finite extension E/F of degree n with a chosen F-basis, the power construction E ⊗_F B is Bⁿ with E acting through the regular representation E ↪ M_n(F) followed by M_n(F) ↪ M_n(End⁰_ℚ(B)) = End⁰_ℚ(Bⁿ); it is of GL₂(E)-type. An abelian variety A of GL₂(E)-type over ℚ is primitive if it is not ℚ-isogenous, compatibly with the E-actions, to a power construction E ⊗_F B with [E : F] > 1.

**Hypotheses.**

- the isogeny class of E ⊗_F B with its E-action does not depend on the chosen F-basis of E

**Construction and proof.**

1. Embed E into M_n(F) by its action on the chosen basis and let M_n(F) act on Bⁿ by matrices with entries in the image of F (A6: End⁰(Bⁿ) = M_n(End⁰(B))).
2. Then [E : ℚ] = n[F : ℚ] = n dim B = dim Bⁿ, so the construction is of GL₂(E)-type; a change of basis conjugates the embedding by an element of GL_n(F) ⊆ GL_n(End⁰_ℚ(B)), which is an E-equivariant isogeny of Bⁿ.

**API.**

| Name | Role | Statement |
|---|---|---|
| `GL2Type.power` | constructor | E ⊗_F B for B of GL₂(F)-type over ℚ and a finite extension E/F with a chosen F-basis. |
| `GL2Type.power_dim` | simp | dim (E ⊗_F B) = [E : F] · dim B. |
| `GL2Type.power_basis_indep` | characterisation | The power constructions for two F-bases of E are E-equivariantly ℚ-isogenous (the change of basis has entries in F, acting through End⁰). |
| `GL2Type.IsPrimitive` | data | The predicate on (A, E): not E-equivariantly ℚ-isogenous to a power construction with [E : F] > 1. |
| `GL2Type.IsPrimitive.of_isogeny` | functoriality | Primitivity is invariant under E-equivariant ℚ-isogeny. |
| `GL2Type.isPrimitive_iff_isSimple` | equivalence | A is primitive if and only if A is ℚ-simple (GT.1/ribet-theorem-2-1). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `GL2Type.power_degree_one` | degenerate | For E = F the power construction is B itself with its structure, and B is primitive exactly when it is ℚ-simple. |
| `GL2Type.power_not_primitive` | non-example | For an elliptic curve B over ℚ and E = ℚ(√2), E ⊗_ℚ B = B × B is of GL₂(E)-type but not primitive. |
| `GL2Type.J0_23_primitive` | computation | J₀(23), of dimension two with E = ℚ(√5) acting through the Hecke algebra, is primitive. |
| `GL2Type.power_compat_R25_5` | compatibility | The power construction satisfies the definition of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety: [E : ℚ] = dim (E ⊗_F B). |

**Used by.**

- Ribet, Theorem 2.1: condition (i) of the equivalence
- Ribet, §3: the varieties studied are the primitive ones; the word is then dropped
- Khare–Wintenberger §10.2: their 'of GL₂-type' includes ℚ-simplicity, which is Ribet's 'primitive'

**Acceptance.**

- For n > 1, E ⊗_F B = Bⁿ is not ℚ-simple.
- Every elliptic curve over ℚ is primitive (E = ℚ).

**Depends on.** `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`.

**Source.**

- Kenneth A. Ribet, §2, p. 3: “We say that an abelian variety A/Q of GL2 -type is primitive if it is not isogenous over Q to an abelian variety obtained by this matrix construction” — Ribet's definition of primitive, after the matrix construction A = E ⊗_F B.

### `GT.1/ribet-theorem-2-1` — Ribet's Theorem 2.1: primitive, simple and maximal endomorphism field ★

*Theorem* · planet: Ribet's endomorphism theorem · Lean namespace `TauCeti.GL2Type`

Let A be of GL₂(E)-type over ℚ and X = End⁰_ℚ(A). The commutant of E in X is E. The centre F of X is a subfield of E, X ≅ M_n(F) with n = [E : F], and A is E-equivariantly ℚ-isogenous to E ⊗_F B for a ℚ-simple B of GL₂(F)-type with End⁰_ℚ(B) = F. Consequently the following are equivalent: (i) A is primitive; (ii) A is ℚ-simple; (iii) X is a number field of degree dim A; and then X = E.

**Construction and proof.**

1. The commutant D of E in X is a division algebra: a nonzero endomorphism commuting with E has image B ⊆ A on which E acts, so B = A by GT.1/lie-algebra-divisibility, and the endomorphism is an isogeny (A6).
2. Lie(A/ℚ) is a D-module, so dim_ℚ D divides dim A = [E : ℚ] (GT.1/lie-algebra-divisibility); as E ⊆ D, D = E. Hence E is a maximal commutative subalgebra of the semisimple algebra X (A6) and the centre F of X lies in E.
3. X is simple (its centre F is a field), so X ≅ M_n(Q) with Q a division algebra of dimension t² over F, and maximality of E gives nt = [E : F]. A is isogenous to Bⁿ with End⁰(B) = Q (A6, Poincaré reducibility), and the Lie argument gives n t² [F : ℚ] | [E : ℚ] = nt[F : ℚ], so t = 1, Q = F and n = [E : F].
4. Each of (i)–(iii) is equivalent to n = 1.

**Acceptance.**

- For A = B × B with B an elliptic curve over ℚ without CM and E = ℚ(i): X = M₂(ℚ), F = ℚ, n = 2.
- For J₀(23): X = ℚ(√5), n = 1.

**Depends on.** `GT.1/lie-algebra-divisibility`, `GT.1/primitive`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

**Source.**

- Kenneth A. Ribet, Theorem 2.1, p. 3: “Then the fol- lowing conditions are equivalent: (i) A is primitive; (ii) A/Q is simple; (iii) the endomorphism algebra of A/Q is a number field whose degree coincides with the dimension of A.” — The statement.
- Kenneth A. Ribet, proof of Theorem 2.1, p. 3: “This gives the equality D = E; i.e., it shows that E is its own commutant in X .” — The commutant step; the rest of the proof gives X ≈ M(n, F).

### `GT.1/endomorphism-field` — The endomorphism field of a ℚ-simple GL₂-type variety ★

*Construction* · planet: Endomorphism field · Lean namespace `TauCeti.GL2Type`

For a ℚ-simple abelian variety A over ℚ admitting a GL₂(E)-type structure, the endomorphism field is E_A := End⁰_ℚ(A), a number field of degree dim A (GT.1/ribet-theorem-2-1), with its tautological GL₂(E_A)-type structure. Every GL₂(E)-type structure ι : E → End⁰_ℚ(A) is an isomorphism E ≅ E_A, so the λ-adic representations of R25.5 for (A, E) and (A, E_A) correspond under ι.

**Hypotheses.**

- A is ℚ-simple and of GL₂(E)-type for some E (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety)

**Construction and proof.**

1. By GT.1/ribet-theorem-2-1, X = End⁰_ℚ(A) is a number field of degree dim A containing ι(E), hence equal to ι(E).
2. Transport of structure along ι identifies the λ-adic representations V_λ(A) for E and for E_A.

**API.**

| Name | Role | Statement |
|---|---|---|
| `GL2Type.endField` | data | E_A = End⁰_ℚ(A) as a field, for ℚ-simple A of GL₂-type. |
| `GL2Type.endField_numberField` | instance | E_A is a number field. |
| `GL2Type.endField_finrank` | projection | [E_A : ℚ] = dim A. |
| `GL2Type.endField_isGL2Type` | constructor | The tautological GL₂(E_A)-type structure in the sense of R25.5. |
| `GL2Type.endField_equiv` | characterisation | Every GL₂(E)-type structure ι on A is a field isomorphism E ≃ E_A. |
| `GL2Type.endField_isogeny` | functoriality | A ℚ-isogeny φ : A → A′ induces E_A ≃ E_{A′}, α ↦ φ ∘ α ∘ φ⁻¹, compatibly with the λ-adic representations. |
| `GL2Type.endField_involution` | other | The canonical involution of E_A (GT.1/totally-real-or-cm) is the Rosati involution of every ℚ-polarization. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `GL2Type.endField_elliptic` | degenerate | For an elliptic curve E₀ over ℚ, E_{E₀} = ℚ (End_ℚ(E₀) = ℤ, EllipticCurveModularity:R29.1). |
| `GL2Type.endField_J0_23` | computation | E_{J₀(23)} = ℚ(√5), generated by the Hecke operator T₂ with T₂² + T₂ − 1 = 0. |
| `GL2Type.endField_J1_13` | computation | E_{J₁(13)} = ℚ(√−3), a CM field, matching the order-6 character of the newform of level 13. |
| `GL2Type.endField_not_simple` | non-example | For B × B with B an elliptic curve over ℚ, End⁰_ℚ = M₂(ℚ) is not a field: simplicity is needed. |

**Used by.**

- Ribet §3: all statements about ρ_λ are made with E = End⁰_ℚ(A)
- GT.2 and GT.3: the field E in the λ-adic system and in the identification K_f ≅ E
- GT.5/ribet-theorem-6-1: the field E_α generated by the splitting map is the endomorphism field of the constructed variety

**Acceptance.**

- For an elliptic curve over ℚ, E_A = ℚ.
- For J₀(23), E_A = ℚ(√5); for J₁(13), E_A = ℚ(√−3).

**Depends on.** `GT.1/ribet-theorem-2-1`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

**Source.**

- Kenneth A. Ribet, §3, p. 4: “Let E be the en- domorphism algebra of A/Q. Then E is a number field which is either a totally real number field or a “CM field,”” — Ribet's normalisation E = End⁰_ℚ(A) for the varieties of §3.

### `GT.1/totally-real-or-cm` — The endomorphism field is totally real or CM, with the Rosati involution as canonical involution

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A). Then E is a totally real field or a CM field, and for every polarization of A defined over ℚ the Rosati involution preserves E and restricts to its canonical involution e ↦ ē (the identity if E is totally real, complex conjugation if E is CM). In particular the involution does not depend on the polarization.

**Construction and proof.**

1. A ℚ-polarization λ defines the Rosati involution † on End⁰_ℚ(A) = E (A2), a positive involution: Tr(x x†) > 0 for x ≠ 0 (A6/rosati-positivity).
2. A number field with a positive involution is totally real with trivial involution, or CM with the involution equal to complex conjugation under every complex embedding: this is the commutative case of the Albert classification (PELModuli:M0/albert-types with B = E: types C and A of degree one).
3. The complex conjugation of a CM field is unique, so † is independent of λ.

**Acceptance.**

- For J₀(23), E = ℚ(√5) is totally real and every Rosati involution is the identity on E.
- For J₁(13), E = ℚ(√−3) and the Rosati involution is complex conjugation.

**Depends on.** `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `PELModuli:M0/albert-types`, `GT.1/endomorphism-field`, `mathlib:NumberField.IsCMField`, `mathlib:NumberField.IsTotallyReal`.

**Source.**

- Kenneth A. Ribet, §3, p. 4: “Then E is a number field which is either a totally real number field or a “CM field,” since each Q-polarization of A defines a positive involution on E.” — The statement and the reason.
- Kenneth A. Ribet, §3, p. 6: “The involution is the Rosati involution on E induced by every polarization of A/Q.” — The Rosati involution is the canonical involution.

### `GT.1/modular-quotient-is-gl2-type` — The modular quotient A_f is ℚ-simple of GL₂-type with endomorphism field K_f ★

*Theorem* · planet: Shimura's quotient A_f · Lean namespace `TauCeti.GL2Type`

Let f be a normalised newform of weight two on Γ₁(N) with character ε_f and coefficient field K_f, and A_f = J₁(N)/p_f J₁(N) the quotient of ModularCurvesPartII:R14.5/modular-quotient. Then the Hecke action K_f → End⁰_ℚ(A_f) is a GL₂(K_f)-type structure, A_f is ℚ-simple, and End⁰_ℚ(A_f) = K_f. Moreover J₁(N) is ℚ-isogenous to ∏_{M | N} ∏_{[g]} A_g^{d(N/M)}, the product over the Galois orbits [g] of newforms of weight two and level M | N, with d(N/M) the number of divisors of N/M.

**Hypotheses.**

- f is a newform: an eigenform for all T_n and diamond operators, new at level N, with a₁(f) = 1

**Construction and proof.**

1. dim A_f = [K_f : ℚ] and the K_f-action are ModularCurvesPartII:R14.5/modular-quotient-dimension; so A_f is of GL₂(K_f)-type.
2. V_ℓ(A_f) ≅ ⊕_{λ|ℓ} ρ_{f,λ} (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition), with the ρ_{f,λ} ⊗ ℚ̄_ℓ for the different embeddings σ : K_f → ℚ̄_ℓ absolutely irreducible (R19.1) and pairwise non-isomorphic: their traces σ(a_p(f)) at Frob_p differ for distinct σ because K_f is generated by the a_p(f), p ∤ N (ModularCurvesPartII:R14.5/newform-hecke-prime). Faltings (R28.4/semisimplicity-and-the-tate-homomorphism-comparison) gives End⁰_ℚ(A_f) ⊗ ℚ_ℓ = End_{G_ℚ} V_ℓ(A_f) = K_f ⊗ ℚ_ℓ, so End⁰_ℚ(A_f) = K_f (Ribet 1980, Cor. 4.2, by a different argument).
3. A field endomorphism algebra forces ℚ-simplicity (GT.1/ribet-theorem-2-1). The isogeny decomposition of J₁(N) follows from the old/new decomposition of S₂(Γ₁(N)) (Tau Ceti ModularForms layer 3) and the Hecke-equivariant identification of the cotangent space of J₁(N) with S₂(Γ₁(N)).

**Acceptance.**

- N = 11: A_f = J₀(11) = X₀(11), K_f = ℚ.
- N = 23: A_f = J₀(23), K_f = ℚ(√5).
- N = 13 on Γ₁: J₁(13) is A_f for the newform with character of order 6; K_f = ℚ(√−3) is CM.

**Depends on.** `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison`, `GT.1/ribet-theorem-2-1`, `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source.**

- Kenneth A. Ribet, §3, p. 4: “It is well known (and easy to show) that E is the full algebra of endomorphisms of A which are defined over Q [19, Cor. 4.2]. Thus, A is of GL2 -type over Q.” — A_f is of GL₂-type with End⁰ = K_f.
- Kenneth A. Ribet, §3, p. 4: “For each N ≥ 1, the Jacobian J1 (N ) is isogenous to a product of abelian varieties of the form Af [19, Prop. 2.3].” — The isogeny decomposition of J₁(N).

## GT.2. The λ-adic system of a GL₂-type abelian variety

The λ-adic system of a ℚ-simple GL₂-type variety, with all of Ribet's §3. The representations themselves are imported (R25.5, R01.6); this layer proves their properties: E-rationality of the Frobenius polynomials (the E ⊗ ℚ_ℓ-linear trace of the Frobenius endomorphism is pinned down by the rational traces of its multiples by E and the nondegeneracy of the trace form), the determinant ε·χ_ℓ, oddness through the Hodge decomposition, absolute irreducibility and the generation of E by the a_p through Faltings' theorem, the relation a_p = ε(p)ā_p from the Weil pairing, residual irreducibility through Faltings' commutant theorem, and the local properties needed by Serre's conjecture: conductors bounded by cond(A) and crystalline restriction with weights {0, 1} at the primes of good reduction.

**Layer targets.**

Let A be a ℚ-simple abelian variety of GL₂-type with E = End⁰_ℚ(A), and S the set of primes of bad reduction.

**Targets.**
- V_ℓ(A) is free of rank two over E ⊗_ℚ ℚ_ℓ; for a prime λ | ℓ of E, V_λ(A) = V_ℓ(A) ⊗_{E⊗ℚ_ℓ} E_λ is a two-dimensional E_λ-representation ρ_λ of G_ℚ, and V_ℓ(A) = ⊕_{λ|ℓ} V_λ(A).
- E-rationality: for p ∉ S and λ ∤ p the characteristic polynomial of ρ_λ(Frob_p) is X² − a_p X + ε(p)p with a_p ∈ E independent of λ.
- Ribet's Lemma 3.1: det ρ_λ = ε·χ_ℓ for one finite-order character ε : G_ℚ → E^× unramified outside S.
- Ribet's Lemma 3.2: ε is even, so every ρ_λ is odd.
- Ribet's Proposition 3.3: every ρ_λ is absolutely irreducible and End_{ℚ_ℓ[G_ℚ]} V_λ = E_λ.
- Ribet's Propositions 3.4–3.6: a_p = ε(p)·ā_p for p ∉ S; E = ℚ(a_p : p ∉ S′) for every finite S′ ⊇ S; F = ℚ(a_p²/ε(p)) is totally real and E/F is abelian.
- Ribet's Lemma 3.7: the residual representation on A[λ] (for a model with End_ℚ(A) = 𝒪_E) is absolutely irreducible for all but finitely many λ; this generalises `EllipticCurveModularity:R29.1`.
- Bounded conductors: for λ of degree one, N(ρ̄_λ) | N(ρ_λ) | cond(A), with cond(A) independent of ℓ.
- Local behaviour at good primes: for ℓ ∉ S, ρ_λ is crystalline at ℓ with Hodge–Tate weights {0, 1} at every embedding of E_λ (weights (1, 0), regular), and A′[λ] is finite flat over ℤ_ℓ.
- The integral model: A is E-equivariantly isogenous to A′ with End_ℚ(A′) = 𝒪_E, giving the residual representations on A′[λ].

**Layer dependencies.** `GT.1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.2`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `FaltingsFinitenessAndIsogenyTheorems:R28.6`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `NeronModelsAndSemistableAbelianVarieties:R11.6`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`, `PadicHodgeTheory:R06.6`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Coverage.** planned. Remaining: Resolve the request to AbelianSchemesAndArithmeticModuli A6 for the complex uniformization and the comparison V_ℓ(A) ≅ H₁(A(ℂ), ℚ) ⊗ ℚ_ℓ used by GT.2/odd. Lemma-level refinement when the roadmap comes near the front of the line: the Hodge–Tate argument for Lemma 3.1 (weight of ⟨χ⟩^a), and the reduction step from the commutant theorem in Lemma 3.7.

### `GT.2/integral-model` — The integral model with endomorphism ring 𝒪_E

*Construction* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. There is an abelian variety A′ over ℚ with End_ℚ(A′) = 𝒪_E and an E-equivariant ℚ-isogeny A → A′. For such A′ and every maximal ideal λ of 𝒪_E, the λ-torsion A′[λ] of ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients (d) is a two-dimensional 𝔽_λ-vector space with continuous action ρ̄_λ of G_ℚ, and its semisimplification ρ̄_λ^{ss} is the semisimplified reduction of ρ_λ; it does not depend on the choice of A′.

**Hypotheses.**

- the residual representation of R01.6 (d) requires 𝒪_E ⊆ End_ℚ(A′); this node supplies such an A′

**Construction and proof.**

1. For each ℓ put L_ℓ = 𝒪_E·T_ℓ(A) ⊆ V_ℓ(A): a G_ℚ-stable, 𝒪_E-stable lattice containing T_ℓ(A), equal to it for ℓ ∤ [𝒪_E : End_ℚ(A) ∩ E]. Then K = ⊕_ℓ L_ℓ/T_ℓ(A) is a finite Galois-stable subgroup of A(ℚ̄), A′ = A/K (A3, quotients by finite subgroup schemes) has T_ℓ(A′) = L_ℓ, and every element of 𝒪_E preserves every T_ℓ(A′), hence lies in End_ℚ(A′) (A6/hom-to-tate-module-homs-is-injective, saturation of End in End ⊗ ℤ_ℓ); so End_ℚ(A′) = 𝒪_E.
2. T_ℓ(A′) is free of rank two over 𝒪_E ⊗ ℤ_ℓ (A6/trace-and-degree-on-a-subfield with R01.6 (d)), so A′[λ] = T_λ(A′)/λT_λ(A′) is two-dimensional over 𝔽_λ, and Brauer–Nesbitt gives the independence of the semisimplification from the lattice, hence from A′.

**API.**

| Name | Role | Statement |
|---|---|---|
| `GL2Type.integralModel` | constructor | An E-equivariantly isogenous A′ with End_ℚ(A′) = 𝒪_E. |
| `GL2Type.integralModel_end` | projection | End_ℚ(integralModel A) = 𝒪_E as subrings of E. |
| `GL2Type.residualRep` | data | ρ̄_λ : G_ℚ → GL(A′[λ]) ≅ GL₂(𝔽_λ), from R01.6 lambdaTorsion. |
| `GL2Type.residualRep_finrank` | simp | dim_{𝔽_λ} A′[λ] = 2. |
| `GL2Type.residualRep_charpoly` | characterisation | For p ∉ S, p ∉ λ: the characteristic polynomial of ρ̄_λ(Frob_p) is X² − ā_p X + ε̄(p)p, the reduction of GT.2/frobenius-polynomial. |
| `GL2Type.residualRep_ss_indep` | other | ρ̄_λ^{ss} is independent of the integral model and of the lattice. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `GL2Type.residualRep_elliptic` | compatibility | For an elliptic curve E₀ over ℚ, ρ̄_ℓ is the action on E₀[ℓ] of ArithmeticGaloisRepresentations R01.6. |
| `GL2Type.residualRep_det` | computation | det ρ̄_λ = ε̄ · χ̄_ℓ, the reduction of GT.2/determinant-character. |
| `GL2Type.integralModel_trivial` | degenerate | If End_ℚ(A) = 𝒪_E already (for example A_f with 𝒪_{K_f} acting), A′ = A is an integral model. |
| `GL2Type.residualRep_not_A_l` | non-example | A′[ℓ] is not A′[λ] unless λ = ℓ𝒪_E: A′[ℓ] = ⊕_{λ\|ℓ} A′[λ^{e_λ}] has 𝔽_ℓ-dimension 2[E : ℚ]. |

**Used by.**

- Ribet, Lemma 3.7: absolute irreducibility of ρ̄_λ for almost all λ
- Ribet, Theorem 4.4: Serre's conjecture is applied to ρ̄_λ for λ in an infinite set Λ
- GT.3/serre-witnesses: the residual Serre witnesses at bounded level and weight two

**Acceptance.**

- For an elliptic curve over ℚ, A′ = A and A′[ℓ] = A[ℓ].
- Two integral models are related by an 𝒪_E-equivariant isogeny; the semisimplified residual representations agree.

**Depends on.** `GT.1/endomorphism-field`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`.

**Source.**

- Kenneth A. Ribet, §3, p. 7: “replace A by an abelian variety which is Q-isogenous to A and which has the property that its ring of Q-endomorphisms is the ring of integers O of E.” — The integral model.
- Kenneth A. Ribet, §3, p. 7: “The action of O on A[λ] makes A[λ] into a two-dimensional vector space over the residue field Fλ of λ.” — The residual representation.

### `GT.2/frobenius-polynomial` — E-rationality of the Frobenius polynomials

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime p ∉ S there are algebraic integers a_p, d_p ∈ 𝒪_E such that for every prime λ of E with λ ∤ p, ρ_λ is unramified at p and the characteristic polynomial of ρ_λ(Frob_p) (arithmetic Frobenius) is X² − a_p X + d_p, read in E_λ. Thus (ρ_λ) is an E-rational strictly compatible system in Serre's sense, with exceptional set S.

**Construction and proof.**

1. Néron–Ogg–Shafarevich: ρ_λ is unramified at p ∉ S, p ≠ ℓ, and ρ_λ(Frob_p) is induced by the Frobenius endomorphism π_p of the reduction A_p, which commutes with E acting by reduction (R01.6 (f), R01.6/good-reduction-frobenius-polynomial).
2. For α in the commutant of E in End⁰(A_p), the E ⊗ ℚ_ℓ-linear trace t_ℓ(α) of α on the free module V_ℓ(A_p) (A6/trace-and-degree-on-a-subfield) satisfies Tr_{E⊗ℚ_ℓ/ℚ_ℓ}(e·t_ℓ(α)) = Tr(eα | V_ℓ) for all e ∈ E; the right side is the rational trace of eα ∈ End⁰(A_p), independent of ℓ (A6/characteristic-polynomial-on-tate-module). Nondegeneracy of the trace form of E (mathlib:traceForm_nondegenerate) gives t_ℓ(α) ∈ E, independent of ℓ.
3. Take a_p = t(π_p) and d_p = (t(π_p)² − t(π_p²))/2; integrality because π_p is integral over ℤ.

**Acceptance.**

- For E = ℚ: a_p = p + 1 − #A_p(𝔽_p) and d_p = p.
- For J₀(23), p = 2: X² − a₂X + 2 with a₂ = (−1 + √5)/2.

**Depends on.** `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `mathlib:traceForm_nondegenerate`.

**Source.**

- Kenneth A. Ribet, §3, p. 4: “One knows that the collection (ρλ ) (as λ ranges over the set of finite primes of E) forms a strictly compatible system of E-rational representations whose exceptional set is the set of prime numbers at which A has bad reduction.” — The statement, which Ribet quotes from Shimura and from Ribet 1976.

### `GT.2/determinant-character` — Ribet's Lemma 3.1: the determinant is ε·χ_ℓ ★

*Theorem* · planet: Nebentypus character ε · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. There is a character of finite order ε : G_ℚ → E^×, unramified at every p ∉ S, with det ρ_λ = ε · χ_ℓ for every prime λ of E (λ | ℓ). Equivalently d_p = ε(p)·p for p ∉ S (GT.2/frobenius-polynomial), where ε is regarded as an E-valued Dirichlet character whose conductor is divisible only by primes of S; and N_{E/ℚ}(ε) = 1.

**Construction and proof.**

1. Choose ℓ₀ ∉ S split completely in E (Chebotarev) and λ₀ | ℓ₀, so δ = det ρ_{λ₀} : G_ℚ → ℤ_{ℓ₀}^×. By FaltingsFinitenessAndIsogenyTheorems:R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order, δ = ⟨χ⟩^a·ε₀ with ε₀ of finite order.
2. δ is Hodge–Tate of weight 1 at ℓ₀ (GT.2/crystalline-at-good-primes), so a = 1; ε = δχ_{ℓ₀}⁻¹ is crystalline of weight 0 at ℓ₀, hence unramified there (PadicHodgeTheory:R06.2/potentially-unramified-and-characters), and unramified at p ∉ S ∪ {ℓ₀} by Néron–Ogg–Shafarevich.
3. ε(Frob_p) = d_p/p ∈ E for p ∉ S ∪ {ℓ₀}, so ε is E-valued; for every λ, det ρ_λ and εχ_ℓ agree on Frob_p for almost all p, hence are equal (Chebotarev). Comparing det_{ℚ_ℓ} V_ℓ(A) = χ_ℓ^{dim A} (R01.6/determinant-and-oddness) with ∏_λ N_{E_λ/ℚ_ℓ}(εχ_ℓ) gives N_{E/ℚ}(ε) = 1. (Ribet argues instead through locally algebraic characters and Grössencharacters of type A₀.)

**Acceptance.**

- For E totally real, ε = 1 and det ρ_λ = χ_ℓ, as in R01.6 (e).
- For J₁(13), ε is the character of order 6 of the newform of level 13, with values in ℚ(√−3).

**Depends on.** `GT.2/frobenius-polynomial`, `GT.2/crystalline-at-good-primes`, `FaltingsFinitenessAndIsogenyTheorems:R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order`, `PadicHodgeTheory:R06.2/potentially-unramified-and-characters`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `mathlib:DirichletCharacter`, `mathlib:cyclotomicCharacter`.

**Source.**

- Kenneth A. Ribet, Lemma 3.1, p. 4: “There is a character of finite order ε : Gal(Q/Q) → E ∗ such that δλ = εχ` for each finite prime λ of E. This character is unramified at each prime which is a prime of good reduction for A.” — The statement (the text layer renders ε as a control character).
- Kenneth A. Ribet, proof of Lemma 3.1, p. 5: “Since χ` has infinite order, we deduce that N(ε) = 1 and that n = 1.” — The determinant comparison.

### `GT.2/odd` — Ribet's Lemma 3.2: the system is odd

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. The character ε of GT.2/determinant-character is even, ε(c) = 1 for every complex conjugation c ∈ G_ℚ; equivalently det ρ_λ(c) = −1 for every λ, so every ρ_λ is odd (ArithmeticGaloisRepresentations:R01.4/odd-representation).

**Construction and proof.**

1. Fix ℚ̄ ⊂ ℂ. The comparison V_ℓ(A) ≅ H₁(A(ℂ), ℚ) ⊗ ℚ_ℓ is E-equivariant and identifies complex conjugation c with F_∞ ⊗ 1, F_∞ the real Frobenius on H₁(A(ℂ), ℚ), an E-linear involution of a two-dimensional E-vector space; hence V_λ ≅ H₁(A(ℂ), ℚ) ⊗_E E_λ with c acting as F_∞ ⊗ 1.
2. det_E F_∞ = +1 would force F_∞ = ±1, but F_∞ ⊗ 1 interchanges H^{-1,0} and H^{0,-1} in H₁(A(ℂ), ℚ) ⊗ ℂ, so F_∞ is not a scalar. Hence det ρ_λ(c) = −1 and ε(c) = 1 since χ_ℓ(c) = −1.
3. For E totally real this is also R01.6/determinant-and-oddness (c) with R01.6 (e); the CM case needs the Hodge decomposition.

**Acceptance.**

- For an elliptic curve over ℚ, det ρ_ℓ(c) = −1.
- Consequence: the newform attached in GT.3 has even character ε(−1) = 1, as weight-two forms must.

**Depends on.** `GT.2/determinant-character`, `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `ArithmeticGaloisRepresentations:R01.4/odd-representation`, `mathlib:Field.absoluteGaloisGroup`.

**Source.**

- Kenneth A. Ribet, Lemma 3.2, p. 5: “Each character δλ is odd in the sense that it takes the value −1 on complex conjugations in Gal(Q/Q).” — The statement.
- Kenneth A. Ribet, proof of Lemma 3.2, p. 5: “To prove that F∞ does not act as a scalar, we recall that F∞ ⊗ 1 permutes the two subspaces H0,1 and H1,0” — The Hodge-theoretic step.

### `GT.2/absolute-irreducibility` — Ribet's Proposition 3.3: absolute irreducibility ★

*Theorem* · planet: Ribet's irreducibility theorem · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime λ of E, ρ_λ is absolutely irreducible and End_{ℚ_ℓ[G_ℚ]} V_λ(A) = E_λ. More generally, for an open subgroup H = G_K ⊆ G_ℚ, End_{ℚ_ℓ[H]} V_ℓ(A) = End⁰_K(A) ⊗ ℚ_ℓ.

**Construction and proof.**

1. Faltings: V_ℓ(A) is a semisimple ℚ_ℓ[G_ℚ]-module and End_{ℚ_ℓ[G_ℚ]} V_ℓ(A) = End⁰_ℚ(A) ⊗ ℚ_ℓ = E ⊗ ℚ_ℓ (FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison; the version over K is the same theorem over K).
2. V_ℓ = ⊕_λ V_λ with E ⊗ ℚ_ℓ = ∏ E_λ acting factorwise, so each V_λ is semisimple with commutant E_λ; a semisimple module whose commutant is a field is simple, and End_{E_λ[G]} V_λ = E_λ persists after extension of scalars in characteristic 0, which is absolute irreducibility.

**Acceptance.**

- For E = ℚ: V_ℓ of an elliptic curve over ℚ is absolutely irreducible (EllipticCurveModularity:R29.6/absolute-irreducibility-of-the-rational-tate-module).
- Fails over a field of definition of extra endomorphisms: for a CM elliptic curve over ℚ, V_ℓ restricted to the Galois group of the CM field is reducible over ℚ̄_ℓ.

**Depends on.** `GT.1/endomorphism-field`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/semisimplicity-and-the-tate-homomorphism-comparison`, `mathlib:IsSemisimpleModule`.

**Source.**

- Kenneth A. Ribet, Proposition 3.3, p. 5: “For each λ, ρλ is an absolutely irreducible two dimensional representation of Gal(Q/Q) over Eλ . We have EndQ` [Gal(Q/Q)] Vλ = Eλ .” — The statement; the proof cites Faltings [5].

### `GT.2/coefficient-conjugation` — Ribet's Proposition 3.4: a_p = ε(p)·ā_p

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and e ↦ ē the canonical involution of E (GT.1/totally-real-or-cm). For every p ∉ S, a_p = ε(p)·ā_p. Equivalently, for every embedding σ : E → ℚ̄_ℓ, V_σ ≅ V_{σ̄} ⊗ σ(ε), where V_σ = V_ℓ ⊗_{E⊗ℚ_ℓ, σ} ℚ̄_ℓ and σ̄ = σ ∘ (bar).

**Construction and proof.**

1. A polarization over ℚ gives a G_ℚ-equivariant Weil pairing ⟨ , ⟩ : V_ℓ × V_ℓ → ℚ_ℓ(1) with ⟨e x, y⟩ = ⟨x, ē y⟩ (R01.6/weil-pairing-on-tate-modules; the Rosati involution is the canonical involution by GT.1/totally-real-or-cm and A2/rosati-involution).
2. After extension of scalars this gives V_{σ̄} ≅ Hom(V_σ, ℚ̄_ℓ(1)); as V_σ is two-dimensional with determinant σ(ε)χ_ℓ, Hom(V_σ, ℚ̄_ℓ(σ(ε)χ_ℓ)) ≅ V_σ, so V_σ ≅ V_{σ̄} ⊗ σ(ε).
3. Take traces of Frob_p for p ∉ S ∪ {ℓ}: σ(a_p) = σ(ε(p))·σ(ā_p).

**Acceptance.**

- For E totally real, consistent with ε = 1.
- For a newform with character ε: ā_p = ε(p)⁻¹a_p, the classical relation.

**Depends on.** `GT.2/determinant-character`, `GT.1/totally-real-or-cm`, `ArithmeticGaloisRepresentations:R01.6/weil-pairing-on-tate-modules`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**Source.**

- Kenneth A. Ribet, Proposition 3.4, p. 6: “This gives ap = ε(p)ap , as required.” — The conclusion a_p = ε(p)ā_p (the text layer drops the bar over the second a_p).

### `GT.2/coefficients-generate` — Ribet's Proposition 3.5: the traces generate E

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and S′ ⊇ S a finite set of primes. Then E = ℚ(a_p : p ∉ S′).

**Construction and proof.**

1. Fix ℓ and let V_σ (σ : E → ℚ̄_ℓ) be the components of V_ℓ ⊗ ℚ̄_ℓ. By Faltings (GT.2/absolute-irreducibility) the commutant of G_ℚ is E ⊗ ℚ̄_ℓ = ∏_σ ℚ̄_ℓ, so the V_σ are simple and pairwise non-isomorphic.
2. Semisimple representations in characteristic 0 with equal traces are isomorphic (R01.1/brauer-nesbitt-traces), so the trace functions of the V_σ are distinct; by Chebotarev they are distinguished by their values σ(a_p) at Frob_p, p ∉ S′ ∪ {ℓ}. So distinct embeddings differ on ℚ(a_p : p ∉ S′), which is therefore E.

**Acceptance.**

- For J₀(23): a₂ = (−1 + √5)/2 generates E.
- Removing finitely many primes does not change the field.

**Depends on.** `GT.2/absolute-irreducibility`, `GT.2/frobenius-polynomial`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`.

**Source.**

- Kenneth A. Ribet, Proposition 3.5, p. 6: “Then the field E is generated over Q by the ap with p 6∈ S.” — The statement.

### `GT.2/inner-twist-field` — Ribet's Proposition 3.6: F = ℚ(a_p²/ε(p)) is totally real and E/F is abelian

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and F ⊆ E the subfield generated by the a_p²/ε(p) for p ∉ S. Then F is totally real and E/F is an abelian extension.

**Construction and proof.**

1. By GT.2/coefficient-conjugation, the conjugate of a_p²/ε(p) is ā_p²/ε̄(p) = ε(p)⁻²a_p² · ε(p) = a_p²/ε(p), so F is fixed by the canonical involution and is totally real (GT.1/totally-real-or-cm).
2. E is generated over F by the square roots of the t_p = a_p²/ε(p) and the values of ε (GT.2/coefficients-generate), all contained in an abelian extension of F.

**Acceptance.**

- For J₀(23), F = E = ℚ(√5).
- For the newform of level 169 with E = ℚ(√3) in Ribet §7, F = ℚ (an extra twist).

**Depends on.** `GT.2/coefficient-conjugation`, `GT.2/coefficients-generate`, `GT.1/totally-real-or-cm`.

**Source.**

- Kenneth A. Ribet, Proposition 3.6, p. 7: “The field F is totally real. The extension E/F is abelian.” — The statement.

### `GT.2/residual-irreducibility` — Ribet's Lemma 3.7: residual absolute irreducibility for almost all λ

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and A′ an integral model (GT.2/integral-model). For all but finitely many maximal ideals λ of 𝒪_E, ρ̄_λ on A′[λ] is absolutely irreducible. For dim A = 1 this is the irreducibility of E[p] for almost all p of EllipticCurveModularity:R29.1.

**Construction and proof.**

1. For almost all ℓ, the ℤ_ℓ-algebra generated by G_ℚ in End(T_ℓ(A′)) is the full commutant of End_ℚ(A′) ⊗ ℤ_ℓ = 𝒪_E ⊗ ℤ_ℓ (FaltingsFinitenessAndIsogenyTheorems:R28.6/commutant-statement-for-almost-all-primes), that is ∏_{λ|ℓ} M₂(𝒪_λ) for ℓ unramified in E, T_ℓ(A′) being free of rank two over 𝒪_E ⊗ ℤ_ℓ.
2. Reducing modulo ℓ, the 𝔽_ℓ-span of ρ̄(G_ℚ) on A′[ℓ] = ⊕_λ A′[λ] is ∏_λ M₂(𝔽_λ), so each A′[λ] is absolutely irreducible. Ribet deduces the same from Faltings' mod-ℓ theorem ([6, Theorem 1, p. 204]).

**Acceptance.**

- Compatible with the parent: for an elliptic curve over ℚ, E[p] is irreducible for all but finitely many p.
- Exceptions occur: X₀(11) has reducible X₀(11)[5] (a rational 5-torsion point).

**Depends on.** `GT.2/integral-model`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/commutant-statement-for-almost-all-primes`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.

**Source.**

- Kenneth A. Ribet, Lemma 3.7, p. 7: “For all but finitely many λ, the representation ρλ is absolutely irreducible.” — The statement; the proof cites Faltings [6, Theorem 1, page 204].

### `GT.2/conductor-bound` — Bounded conductors of the λ-adic and residual representations

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and cond(A) = ∏_p p^{f_p(A)} the conductor of A, f_p(A) the Artin conductor exponent of V_ℓ(A) at p for any ℓ ≠ p. For every prime λ of degree one over ℓ, the prime-to-ℓ Artin conductor N(ρ_λ) divides cond(A), and the prime-to-ℓ Artin conductor N(ρ̄_λ) of the residual representation divides N(ρ_λ).

**Construction and proof.**

1. f_p(A) is independent of ℓ ≠ p: the H^i(A) form a ℚ-rational strictly compatible system (NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export), and cond(A) is defined from it (R11.5/conductor-import).
2. For p ≠ ℓ and E_λ = ℚ_ℓ, V_λ is a direct summand of V_ℓ(A) as a ℚ_ℓ[G_{ℚ_p}]-module, so f_p(ρ_λ) ≤ f_p(V_ℓ(A)) by additivity and nonnegativity of the Artin conductor (R01.3/conductor-of-a-weil-deligne-representation).
3. Reduction does not increase the conductor (ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor).

**Acceptance.**

- For an elliptic curve E₀ over ℚ, N(ρ̄_{E₀,p}) | N_{E₀} (EllipticCurveModularity:R29.1/residual-conductor-divides).
- f_p(A) = 0 for p ∉ S.

**Depends on.** `NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import`, `NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.3/global-conductor-and-prime-to-p-conductor`, `ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

**Source.**

- Kenneth A. Ribet, proof of Lemma 4.1, p. 8: “The conductor of ρλ divides the conductor of the full `-adic representation V` (A). According to results of A. Grothendieck [8, Cor. 4.6], this latter conductor is independent of `.” — The bound and the independence of ℓ.

### `GT.2/crystalline-at-good-primes` — Crystalline with Hodge–Tate weights {0, 1} at good primes; finite flat residual representations

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For ℓ ∉ S and λ | ℓ, ρ_λ|_{G_{ℚ_ℓ}} is crystalline, and for every embedding τ : E_λ → ℚ̄_ℓ the Hodge–Tate weights of ρ_λ ⊗_{E_λ,τ} ℚ̄_ℓ are 0 and 1, each once (convention: χ_ℓ has weight 1, that of Khare–Wintenberger §5); and for an integral model A′, A′[λ] extends to a finite flat group scheme over ℤ_ℓ. In particular the system has weights (a, b) = (1, 0) and is regular.

**Construction and proof.**

1. A has good reduction at ℓ ∉ S, so V_ℓ(A)|_{G_{ℚ_ℓ}} is crystalline with Hodge–Tate weights 0 and 1, each of multiplicity dim A (PadicHodgeTheory:R06.6/good-reduction-iff-crystalline, R06.5/abelian-variety-hodge-tate-weights).
2. The Hodge–Tate decomposition ℂ_ℓ ⊗ V_ℓ ≅ (ℂ_ℓ(1) ⊗ Lie A) ⊕ (ℂ_ℓ ⊗ H¹(A, 𝒪_A)^∨) is E-equivariant, and Lie(A/ℚ) is a one-dimensional E-vector space (dimension count, GT.1/lie-algebra-divisibility), so every embedding τ sees each weight exactly once.
3. A′[λ] ⊆ A′[ℓ], and A′[ℓ] is the generic fibre of the finite flat ℓ-torsion of the Néron model (an abelian scheme over ℤ_ℓ); take the scheme-theoretic closure.

**Acceptance.**

- For E = ℚ: an elliptic curve with good reduction at ℓ has crystalline V_ℓ with weights {0, 1}.
- The weights give Serre weight k = 2 for ρ̄_λ (GT.3/serre-witnesses).

**Depends on.** `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `GT.1/lie-algebra-divisibility`, `GT.2/integral-model`, `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`.

**Source.**

- Kenneth A. Ribet, proof of Lemma 4.2, p. 8: “the kernel of multiplication by ` on AQ` extends to a finite flat group scheme G over Z` because of this good reduction [8, Cor. 2.2.9].” — Finite flatness at a good prime.
- Chandrashekhar Khare and Jean-Pierre Wintenberger, §5, p. 8: “for `  0, ι : E ,→ Q` , q above `, the restriction of ρι to Dq is crystalline of Hodge-Tate weights a, b as in (iii).” — The condition at ℓ in Khare–Wintenberger's definition of a compatible system.

## GT.3. Modular abelian varieties and the modularity theorem

The modularity theorem, proved as the parent proves dimension one. Serre's strong form, applied to ρ̄_λ for λ in the infinite set Λ of odd degree-one primes of good reduction with irreducible residual representation, gives newforms of weight two and level dividing cond(A) (R29.2). Finitely many such newforms exist, so one, f, recurs for infinitely many λ (R29.3). Its coefficients then equal those of A under an isomorphism K_f ≅ E: the congruences hold in infinitely many residue fields of the étale algebra K_f ⊗ E, and an algebraic integer in infinitely many primes vanishes (R29.3). Chebotarev and Brauer–Nesbitt identify the λ-adic representations (R29.4), and Faltings' isogeny criterion gives A ~ A_f (R29.5). The equivalent forms of modularity, the characterisation of the simple quotients of the J₁(N), the Γ₀ case and the modular parametrisation complete the layer.

**Layer targets.**

**Objects.** An abelian variety A over ℚ is *modular of level N* if there is a surjective homomorphism J₁(N) → A over ℚ; it is *modular* if it is modular of some level N ≥ 1.

**Targets.**
- Residual Serre witnesses (generalising R29.2): for the infinite set Λ of odd degree-one primes λ of good reduction with ρ̄_λ absolutely irreducible, ρ̄_λ arises from a newform of weight two and level dividing cond(A) (strong Serre theorem, ClassicalSerreModularity R27.6).
- One newform and exact coefficients (generalising R29.3): a single newform f recurs for infinitely many λ, and there is an isomorphism j : K_f ≅ E with j(a_p(f)) = a_p(A) for all p ∉ S, p ∤ N_f.
- Tate-module comparison (generalising R29.4): ρ_λ ≅ ρ_{f, j⁻¹λ} ⊗ E_λ for every λ, and V_ℓ(A) ≅ V_ℓ(A_f).
- Equivalent forms of modularity for a ℚ-simple A of GL₂-type: (a) A is modular; (b) A is ℚ-isogenous to A_f for a weight-two newform f; (c) for one λ there is a newform f with ρ_λ ≅ ρ_{f,λ′} after extension of scalars; (d) the same for every λ; (e) A is isomorphic to a ℚ-simple quotient of J₁(N) for some N.
- Ribet's Theorem 4.4 and Khare–Wintenberger Corollary 10.2(i) (generalising R29.5): every abelian variety over ℚ of GL₂-type is modular; a ℚ-simple one is ℚ-isogenous to A_f, by Faltings' isogeny criterion.
- Characterisation (generalised Shimura–Taniyama–Weil): the ℚ-simple quotients of the J₁(N), N ≥ 1, are exactly the ℚ-simple abelian varieties of GL₂-type over ℚ, up to isomorphism.
- Trivial character: E is totally real ⇔ ε = 1 ⇔ A is a quotient of J₀(N) for some N; for dim A = 1 this is the parent's quotient of J₀(N_E) (`EllipticCurveModularity:R29.5`).
- Modular parametrisation: for A modular of level N there is a nonconstant morphism X₁(N) → A over ℚ sending a rational cusp to 0 whose image generates A, generalising the parametrisation of `EllipticCurveModularity:R29.5`.

**Layer dependencies.** `GT.1`, `GT.2`, `AbelianSchemesAndArithmeticModuli:A6`, `AlgebraicModularFormsAndSerreWeights:R15.4`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.6`, `AutomorphicGaloisRepresentations:R19.1`, `AutomorphicGaloisRepresentations:R19.6`, `ClassicalSerreModularity:R27.6`, `EllipticCurveModularity:R29.3`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.5`, `ModularCurvesPartII:R14.6`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`.

**Coverage.** planned. Remaining: Lemma-level refinement when the roadmap comes near the front of the line: the étale-algebra pigeonhole of GT.3/coefficient-identification and the finiteness of newforms of bounded level as separate lemmas.

### `GT.3/modular-abelian-variety` — Modular abelian varieties over ℚ ★

*Definition* · planet: Modular abelian variety · Lean namespace `TauCeti.GL2Type`

An abelian variety A over ℚ is modular of level N (N ≥ 1) if there is a surjective homomorphism of abelian varieties J₁(N) → A over ℚ, where J₁(N) is the Jacobian of X₁(N)_ℚ (ModularCurvesPartII:R14.2/jacobian-and-functoriality); it is modular if it is modular of some level. It is modular of level N for Γ₀ if there is a surjective homomorphism J₀(N) → A over ℚ.

**Hypotheses.**

- homomorphisms of abelian varieties over ℚ in the sense of Tau Ceti JacobianChallenge layer E; surjective means faithfully flat (equivalently the image is all of A)
- X₁(N) has genus 0 exactly for N ≤ 10 and N = 12, so J₁(N) = 0 and only A = 0 is modular of such a level

**Construction and proof.**

1. The definition only names the property. Its basic properties: modular of level N implies modular of every level M with N | M, because the degeneracy map X₁(M) → X₁(N) induces a surjection J₁(M) → J₁(N) (Albanese functoriality, R14.2); a quotient of a modular variety is modular; a variety ℚ-isogenous to a modular one is modular, since a composite of surjections is surjective.

**API.**

| Name | Role | Statement |
|---|---|---|
| `AbelianVariety.IsModularOfLevel` | data | A is modular of level N: ∃ surjective J₁(N) → A over ℚ. |
| `AbelianVariety.IsModular` | data | ∃ N ≥ 1 with IsModularOfLevel A N. |
| `AbelianVariety.IsModularOfLevel.mono` | relation | IsModularOfLevel A N → N ∣ M → 0 < M → IsModularOfLevel A M (levels are positive). |
| `AbelianVariety.IsModular.of_isogeny` | functoriality | A ℚ-isogeny A → A′ (or any surjection) transports modularity of A to A′. |
| `AbelianVariety.IsModular.quotient` | functoriality | A quotient of a modular abelian variety is modular. |
| `AbelianVariety.isModular_iff` | equivalence | For ℚ-simple A of GL₂-type: modular ⇔ isogenous to some A_f ⇔ some V_λ(A) ≅ ρ_{f,λ′} (GT.3/modularity-equivalences). |
| `AbelianVariety.IsModularOfLevel.gamma0` | compatibility | Modular of level N for Γ₀ implies modular of level N: pushforward along the finite surjection X₁(N) → X₀(N) gives a surjection J₁(N) → J₀(N) (R14.2). |
| `AbelianVariety.IsModular.elliptic` | compatibility | For an elliptic curve over ℚ, being modular for Γ₀ at level N is the formulation (ii) of EllipticCurveModularity:R29.6/modularity-theorem. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `IsModular.X0_11` | computation | X₀(11) is modular of level 11 for Γ₀. |
| `IsModular.zero` | degenerate | The zero abelian variety is modular of every level; J₁(N) = 0 for N ≤ 10 and N = 12. |
| `IsModular.J1_13_not_gamma0` | non-example | J₁(13) is modular of level 13 but not modular of level 13 for Γ₀, since J₀(13) = 0. |
| `IsModular.level_not_minimal` | non-example | X₀(11) is modular of level 22 as well as 11: the level in the definition is not the conductor. |

**Used by.**

- Khare–Wintenberger, Corollary 10.2(i): the conclusion of the modularity theorem
- Ribet, Theorem 4.4: the conclusion 'isogenous to a ℚ-simple factor of J₁(N)'
- GT.5/q-curves-geometrically-modular: the ℚ̄-version for ℚ-curves
- EllipticCurveModularity:R29.6/modularity-theorem: the dimension-one case, formulation (ii)

**Acceptance.**

- X₀(11) = J₀(11) is modular of level 11 (for Γ₀ and for Γ₁, via J₁(11) → J₀(11)).
- J₁(13), of dimension 2, is modular of level 13 but not for Γ₀ at level 13 (J₀(13) = 0).

**Depends on.** `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.5/trivial-character-J0`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21: “An abelian variety A over Q of GL2 -type is said to be modular if it is isomorphic to a quotient of J1 (N ) for some positive integer N .” — The definition.
- Kenneth A. Ribet, §1, p. 2: “Equivalently, one wishes to study the set of elliptic curves which are quotients of the Jacobian J1 (N )Q of X1 (N )Q , for some N ≥ 1.” — Ribet's formulation for elliptic curves.

### `GT.3/serre-witnesses` — Residual Serre witnesses of weight two at bounded level

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E (GT.1/endomorphism-field), S its set of primes of bad reduction, cond(A) its conductor, ρ_λ its λ-adic representations with Frobenius traces a_p ∈ E (GT.2/frobenius-polynomial) and character ε (GT.2/determinant-character) and A′ an integral model (GT.2/integral-model). Let Λ be the set of maximal ideals λ of 𝒪_E of degree one over odd primes ℓ ∉ S, unramified in E, with ρ̄_λ absolutely irreducible; Λ is infinite. For every λ ∈ Λ there are a normalised newform g_λ of weight two, level N_λ dividing cond(A) and some character, and a prime λ′ of its coefficient field above ℓ, with ρ̄_{g_λ,λ′} ≅ ρ̄_λ; in particular a_p(g_λ) ≡ a_p(A) mod (λ′, λ) for every p ∉ S ∪ {ℓ}. This generalises EllipticCurveModularity:R29.2/weight-two-and-level-N-from-the-weight-recipe.

**Construction and proof.**

1. Λ is infinite: infinitely many primes split completely in E (Chebotarev), and only finitely many λ are excluded by GT.2/residual-irreducibility.
2. For λ ∈ Λ, ρ̄_λ : G_ℚ → GL₂(𝔽_ℓ) is odd (GT.2/odd), absolutely irreducible, finite at ℓ with det ρ̄_λ|_{I_ℓ} = χ̄_ℓ (GT.2/crystalline-at-good-primes; ε is unramified at ℓ ∉ S), so Serre's weight is k(ρ̄_λ) = 2 (AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p) and its level N(ρ̄_λ) divides cond(A) (GT.2/conductor-bound).
3. The strong form of Serre's conjecture (ClassicalSerreModularity:R27.6/full-classical-serre-theorem) gives g_λ of weight k(ρ̄_λ) = 2 and level N(ρ̄_λ); compare traces of Frobenius (R01.6 (f), R19.1).

**Acceptance.**

- For dim A = 1 the witnesses have trivial character, as in the parent (ε = 1).
- For J₀(23) and λ above ℓ ≡ ±1 mod 5, g_λ can be taken to be the newform of level 23.

**Depends on.** `GT.2/residual-irreducibility`, `GT.2/odd`, `GT.2/crystalline-at-good-primes`, `GT.2/conductor-bound`, `GT.2/frobenius-polynomial`, `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

**Source.**

- Kenneth A. Ribet, Lemma 4.1 and Lemma 4.2, p. 8: “For all λ ∈ Λ, we have kλ = 2.” — Weight two at the primes of Λ (Lemma 4.2); Lemma 4.1 bounds the levels.
- Kenneth A. Ribet, proof of Theorem 4.4, p. 8: “Applying [24, (3.2.4? )] to the representations ρλ with λ ∈ Λ, we find that each ρλ arises from a newform of weight kλ = 2 and level dividing Nλ .” — Serre's conjecture applied on Λ; it is now the strong form proved by Khare–Wintenberger.

### `GT.3/fixed-newform` — One newform for infinitely many λ

*Theorem* · Lean namespace `TauCeti.GL2Type`

In the situation of GT.3/serre-witnesses there are a normalised newform f of weight two and level N_f dividing cond(A), with coefficient field K_f, and an infinite subset Λ_f ⊆ Λ such that for every λ ∈ Λ_f there is a ring homomorphism φ_λ : 𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ with φ_λ(a_p(f)) = a_p(A) mod λ for all p ∉ S ∪ {ℓ}. This generalises the pigeonhole step of EllipticCurveModularity:R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients.

**Construction and proof.**

1. The newforms of weight two and level dividing cond(A), with any character, form a finite set: they are eigenvectors in the finite-dimensional spaces S₂(Γ₁(M)), M | cond(A) (Tau Ceti ModularForms layers 0 and 4).
2. λ ↦ g_λ maps the infinite set Λ to this finite set, so some fibre Λ_f is infinite (EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber); φ_λ is reduction modulo λ′.

**Acceptance.**

- For dim A = 1 this is the parent's pigeonhole step.
- The level of f divides cond(A); its exact value is GT.4/exact-level.

**Depends on.** `GT.3/serre-witnesses`, `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:HeckeRing.GL2.Newform`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`, `tauceti:cuspFormCharSpace`, `mathlib:CongruenceSubgroup.Gamma1`.

**Source.**

- Kenneth A. Ribet, proof of Theorem 4.4, pp. 8–9: “Since the Nλ ’s are bounded (Lemma 4.1), there are only a finite number of such newforms.” — The finiteness and the choice of a fixed f.

### `GT.3/coefficient-identification` — Exact coefficients: K_f ≅ E with a_p(f) ↦ a_p(A)

*Theorem* · Lean namespace `TauCeti.GL2Type`

In the situation of GT.3/fixed-newform there is a field isomorphism j : K_f → E with j(a_p(f)) = a_p(A) for every prime p ∉ S with p ∤ N_f, and j(ε_f(p)) = ε(p) for those p. This generalises the exact-coefficient step of EllipticCurveModularity:R29.3 and R29.3/rational-coefficient-field.

**Construction and proof.**

1. For λ ∈ Λ_f the pair (φ_λ, 𝒪_E → 𝔽_λ) is a ring map 𝒪_{K_f} ⊗_ℤ 𝒪_E → 𝔽_ℓ; its kernel m_λ lies over a prime of exactly one factor L_i of the étale algebra K_f ⊗_ℚ E = ∏ L_i, so infinitely many m_λ lie over one factor L with embeddings u : K_f → L, v : E → L (EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber).
2. For p ∉ S, p ∤ N_f, the element u(a_p(f)) − v(a_p(A)) ∈ 𝒪_L lies in primes above infinitely many ℓ, hence vanishes (EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing).
3. K_f is generated by these a_p(f) (ModularCurvesPartII:R14.5/newform-hecke-prime with GT.2/coefficients-generate applied to A_f, GT.1/modular-quotient-is-gl2-type) and E by these a_p(A) (GT.2/coefficients-generate), so u(K_f) = v(E) and j = v⁻¹ ∘ u. The determinants agree by the same argument applied to d_p = ε(p)p.

**Acceptance.**

- For dim A = 1, K_f = ℚ and a_p(f) = a_p(A): the parent's exact equality.
- For J₀(23) and its newform f, j is the identity of ℚ(√5) once E is identified with the Hecke field through the Hecke action; j is unique, as the a_p generate.

**Depends on.** `GT.3/fixed-newform`, `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`, `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`, `GT.2/coefficients-generate`, `GT.1/modular-quotient-is-gl2-type`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `GT.2/determinant-character`.

**Source.**

- Kenneth A. Ribet, proof of Theorem 4.4, p. 8: “For an infinite number of λ ∈ Λ, there is a ring homomorphism ϕλ : R → Fλ mapping ap to tr(ρλ (Frobp )) for all but finitely many primes p.” — The congruences that are upgraded to equalities. Ribet passes instead from the congruences to Hom_{𝔽_ℓ[G]}(A_f[ℓ], A[ℓ]) ≠ 0 and Faltings' mod-ℓ theorem; this node follows the parent's route, which needs only Faltings' ℓ-adic theorem.

### `GT.3/tate-module-comparison` — Comparison of λ-adic representations with those of the newform

*Theorem* · Lean namespace `TauCeti.GL2Type`

In the situation of GT.3/coefficient-identification, for every prime λ of E, ρ_λ ≅ ρ_{f, j⁻¹(λ)} ⊗_{K_{f,j⁻¹(λ)}} E_λ as E_λ[G_ℚ]-modules (identifying K_{f,j⁻¹λ} with E_λ through j), and V_ℓ(A) ≅ V_ℓ(A_f) as ℚ_ℓ[G_ℚ]-modules, compatibly with j. This generalises EllipticCurveModularity:R29.4/tate-module-comparison.

**Construction and proof.**

1. Both ρ_λ and ρ_{f,j⁻¹λ} ⊗ E_λ are semisimple (GT.2/absolute-irreducibility; R19.1/newform-rank-two-realisation) and unramified outside a finite set with traces of Frob_p equal to a_p(A) = j(a_p(f)) for almost all p; Chebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, R01.1/brauer-nesbitt-traces) make them isomorphic.
2. Sum over λ | ℓ, using V_ℓ(A) = ⊕ V_λ (R01.6) and V_ℓ(A_f) ≅ ⊕ ρ_{f,λ} (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition).

**Acceptance.**

- For dim A = 1: V_r(E) ≅ V_r(f), as in R29.4.
- The isomorphism need not respect a chosen integral structure; only rational Tate modules are compared.

**Depends on.** `GT.3/coefficient-identification`, `GT.2/absolute-irreducibility`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

**Source.**

- Kenneth A. Ribet, proof of Theorem 4.4, p. 8: “By the Cebotarev Density Theorem, we have Af [`] ⊗R/`R Fλ ≈ A[λ] ⊗Fλ Fλ ,” — Ribet's residual comparison; here the comparison is made in characteristic zero after GT.3/coefficient-identification.

### `GT.3/modularity-theorem` — Modularity of abelian varieties of GL₂-type (Ribet's Theorem 4.4, Khare–Wintenberger Corollary 10.2(i)) ★

*Theorem* · planet: Modularity of GL₂-type abelian varieties · Lean namespace `TauCeti.GL2Type`

Every abelian variety A over ℚ of GL₂-type which is ℚ-simple is ℚ-isogenous to A_f for a normalised newform f of weight two on Γ₁(N_f), with an isomorphism K_f ≅ End⁰_ℚ(A) intertwining the Hecke action and the endomorphisms; consequently A is a quotient of J₁(N_f) over ℚ, i.e. A is modular of level N_f. Every abelian variety over ℚ of GL₂-type, simple or not, is modular. This generalises EllipticCurveModularity:R29.5/isogeny-to-E.

**Construction and proof.**

1. GT.3/tate-module-comparison gives V_ℓ(A) ≅ V_ℓ(A_f) as ℚ_ℓ[G_ℚ]-modules; Faltings' isogeny criterion (FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors) gives a ℚ-isogeny φ : A_f → A. It intertwines K_f and E through j: x ↦ φxφ⁻¹ is a field isomorphism K_f → E carrying the E-linear trace a_p(f) of Frobenius on V_ℓ(A_f) to that on V_ℓ(A), which is a_p(A) = j(a_p(f)), and the a_p(f) generate K_f.
2. Compose the quotient J₁(N_f) → A_f (ModularCurvesPartII:R14.5/modular-quotient) with φ to obtain a surjection J₁(N_f) → A.
3. For non-simple A of GL₂(E)-type, A is isogenous to Bⁿ with B ℚ-simple of GL₂-type (GT.1/ribet-theorem-2-1), and B ~ A_f with f of level N. In J₁(N·2^{n−1}) the factor A_f occurs with multiplicity d(2^{n−1}) = n (GT.1/modular-quotient-is-gl2-type), so A_fⁿ, hence A, is a quotient of J₁(N·2^{n−1}).

**Acceptance.**

- J₀(23) is isogenous to A_f for the newform of level 23 with K_f = ℚ(√5).
- Dimension one: every elliptic curve over ℚ is modular (EllipticCurveModularity:R29.6/modularity-theorem).
- Ribet's example of level 81: A_f with E = ℚ(√3) is its own instance.

**Depends on.** `GT.3/tate-module-comparison`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `ModularCurvesPartII:R14.5/modular-quotient`, `GT.3/modular-abelian-variety`, `GT.1/ribet-theorem-2-1`, `GT.1/modular-quotient-is-gl2-type`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, Corollary 10.2, p. 21: “Corollary 10.2. (i) An abelian variety A over Q of GL2 -type is modular.” — The theorem.
- Kenneth A. Ribet, Theorem 4.4, p. 8: “Then A is isogenous to a Q-simple factor of J1 (N ), for some N ≥ 1.” — Ribet's theorem, conditional on Serre's conjecture, which Khare–Wintenberger proved (ClassicalSerreModularity R27.6).

### `GT.3/modularity-equivalences` — Equivalent forms of modularity

*Theorem* · Lean namespace `TauCeti.GL2Type`

For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E, the following are equivalent, and (by GT.3/modularity-theorem) all hold: (a) A is modular; (b) A is ℚ-isogenous to A_f for a weight-two newform f; (c) for some prime λ of E there are a weight-two newform f and a prime λ′ of K_f with ρ_λ ≅ ρ_{f,λ′} ⊗ ℚ̄_ℓ after extension of scalars; (d) the same for every λ; (e) A is isomorphic to a ℚ-simple quotient of J₁(N) for some N. The equivalences do not use Serre's conjecture. This generalises the equivalences of EllipticCurveModularity:R29.6/modularity-theorem.

**Construction and proof.**

1. (a) ⇒ (b): a surjection J₁(N) → A and the isogeny decomposition of J₁(N) (GT.1/modular-quotient-is-gl2-type) give a nonzero map A_g → A for some newform g of level dividing N (A6: Hom between non-isogenous simple varieties vanishes), hence A ~ A_g as both are simple (A6/endomorphisms-of-simple-abelian-varieties).
2. (b) ⇒ (d): V_ℓ(A) ≅ V_ℓ(A_f) decomposes compatibly with the endomorphism fields (R19.6). (d) ⇒ (c) is trivial. (c) ⇒ (b): traces give an embedding of fields as in GT.3/coefficient-identification, then GT.3/tate-module-comparison and Faltings' isogeny criterion.
3. (b) ⇒ (e) ⇒ (a): compose J₁(N) → A_f with the isogeny; an isogeny image of a quotient is a quotient.

**Acceptance.**

- For dim A = 1 these are formulations (i)–(ii) of R29.6.
- (c) for a single λ of degree one already suffices.

**Depends on.** `GT.3/modular-abelian-variety`, `GT.3/modularity-theorem`, `GT.3/tate-module-comparison`, `GT.3/coefficient-identification`, `GT.1/modular-quotient-is-gl2-type`, `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21: “This is sometimes referred to in the literature as the generalised Shimura–Taniyama–Weil conjecture, and characterises the simple quotients of the Jacobian J1 (N ) of the modular curve X1 (N ) over Q.” — The characterisation that the equivalences make precise.

### `GT.3/simple-quotients-characterisation` — The ℚ-simple quotients of the J₁(N) are the GL₂-type varieties (generalised Shimura–Taniyama–Weil) ★

*Theorem* · planet: Generalised Shimura–Taniyama–Weil · Lean namespace `TauCeti.GL2Type`

An abelian variety B over ℚ is isomorphic to a ℚ-simple quotient of J₁(N) for some N ≥ 1 if and only if B is ℚ-simple and of GL₂-type. The isogeny classes of such B correspond bijectively to the Galois orbits of normalised newforms of weight two (of all levels and characters), by [f] ↦ [A_f].

**Construction and proof.**

1. ⇒: a ℚ-simple quotient of J₁(N) is isogenous to some A_f (proof of GT.3/modularity-equivalences (a) ⇒ (b)), which is of GL₂(K_f)-type (GT.1/modular-quotient-is-gl2-type); GL₂-type is an isogeny invariant (R25.5).
2. ⇐: GT.3/modularity-theorem.
3. Bijection: A_f ~ A_g iff V_ℓ(A_f) ≅ V_ℓ(A_g) (Faltings) iff the eigenvalue systems of f and g are Galois-conjugate (Chebotarev, Brauer–Nesbitt), iff g ∈ [f] by strong multiplicity one (Tau Ceti ModularForms layer 5).

**Acceptance.**

- Level 11: the only simple quotient up to isogeny of J₁(11) is X₀(11).
- Non-example: E₁ × E₂ for non-isogenous elliptic curves is a quotient of some J₁(N) but not a simple one.

**Depends on.** `GT.3/modularity-theorem`, `GT.3/modularity-equivalences`, `GT.1/modular-quotient-is-gl2-type`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `FaltingsFinitenessAndIsogenyTheorems:R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21: “The simple quotients of J1 (N ) over Q are abelian varieties over Q of GL2 -type.” — The direction ⇒; Corollary 10.2(i) gives ⇐.
- Kenneth A. Ribet, §1, p. 2: “It is easy to see that J1 (N ) decomposes up to isogeny over Q as a product of such abelian varieties.” — Ribet's version of ⇒.

### `GT.3/trivial-character` — Totally real endomorphism field, trivial character and quotients of J₀(N)

*Theorem* · Lean namespace `TauCeti.GL2Type`

For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E and character ε, the following are equivalent: (a) E is totally real; (b) ε = 1; (c) A is modular for Γ₀, i.e. a quotient of J₀(N) over ℚ for some N. In that case the level can be taken to be N_f = cond(A)^{1/dim A} (GT.4/exact-level). This is Serre's Théorème 5, recorded by EllipticCurveModularity:R29.6/what-theoreme-4-asserts-and-its-scope as an inherited target, and for dim A = 1 the quotient J₀(N_E) → E of the parent.

**Construction and proof.**

1. (a) ⇒ (b): with Rosati trivial on E the Weil pairing makes ∧²_{E_λ} V_λ ≅ E_λ(1) (R01.6 (e)), so det ρ_λ = χ_ℓ.
2. (b) ⇒ (a): ε = 1 gives a_p = ā_p (GT.2/coefficient-conjugation), so the canonical involution fixes E = ℚ(a_p) (GT.2/coefficients-generate) and E is totally real (GT.1/totally-real-or-cm).
3. (b) ⇔ (c): A ~ A_f with ε_f = ε via j (GT.3/coefficient-identification); for trivial ε_f, A_f is isogenous to the quotient of J₀(N_f) (ModularCurvesPartII:R14.5/trivial-character-J0); conversely a simple quotient of J₀(N) is isogenous to some A_g with g of trivial character.

**Acceptance.**

- J₀(23): E = ℚ(√5) totally real, ε = 1, a quotient of J₀(23).
- J₁(13): E = ℚ(√−3), ε of order 6, not a quotient of any J₀(N).

**Depends on.** `GT.3/modularity-theorem`, `GT.3/coefficient-identification`, `GT.2/coefficient-conjugation`, `GT.2/coefficients-generate`, `GT.1/totally-real-or-cm`, `ModularCurvesPartII:R14.5/trivial-character-J0`, `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`.

**Source.**

- Kenneth A. Ribet, §3, p. 4: “In the case where E is totally real, we have det ρλ = χ` , where” — Totally real E gives trivial character.
- Kenneth A. Ribet, §7, p. 16: “Since f is a form with trivial “Nebentypus” character, E is a priori a real quadratic field.” — Trivial character gives a totally real field.

### `GT.3/modular-parametrisation` — Modular parametrisation of a GL₂-type variety

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type, modular of level N. There is a nonconstant morphism φ : X₁(N) → A over ℚ with φ(c) = 0 for the rational cusp c of ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi, whose image generates A as an algebraic group; φ is the composite of the Abel–Jacobi map, a quotient J₁(N) → A_f and an isogeny A_f → A. If ε = 1, φ can be taken on X₀(N) with φ(∞) = 0. This generalises EllipticCurveModularity:R29.5/modular-parametrisation.

**Construction and proof.**

1. Compose AJ_c : X₁(N) → J₁(N), the quotient J₁(N) → A_f and the isogeny A_f → A of GT.3/modularity-theorem; nonconstancy is ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero.
2. The image of X₁(N) generates J₁(N) (the Jacobian is generated by the curve, Tau Ceti JacobianChallenge layer F), hence its image generates A.
3. For ε = 1 use J₀(N) and AJ_∞ (GT.3/trivial-character).

**Acceptance.**

- For dim A = 1 and ε = 1 this is the parametrisation X₀(N) → E of R29.5.
- For J₁(13) the parametrisation is the Abel–Jacobi embedding of X₁(13), a curve of genus 2.

**Depends on.** `GT.3/modularity-theorem`, `GT.3/trivial-character`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`, `ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

**Source.**

- Kenneth A. Ribet, §1, p. 1: “One knows that if there is a non- constant map X1 (M ) → C over Q for some M ≥ 1, then there is a non-constant map Xo (N ) → C.” — The parametrisation formulation for elliptic curves, generalised here.

## GT.4. Conductors, exact level and L-functions

Carayol's theorem identifies the conductor of ρ_{f,λ} with the level of f at every prime away from ℓ. Since V_ℓ(A) is the sum of the V_λ, each a two-dimensional E_λ-representation counted [E_λ : ℚ_ℓ] times over ℚ_ℓ, the conductor of A is N_f^{dim A}. This gives the exact level cond(A)^{1/dim A} and shows that the level cond(A)^{dim A} named by Khare–Wintenberger, while valid, is not the least one in dimension at least two. The same comparison gives the full L-function and, as a corollary of modularity, the strict compatibility of the system in Khare–Wintenberger's sense.

**Layer targets.**

**Targets.**
- The conductor exponent of a GL₂-type variety: for every prime p and every λ ∤ p, f_p(A) = [E : ℚ]·f_p(ρ_λ), where f_p(A) is the Artin conductor exponent of V_ℓ(A) and f_p(ρ_λ) that of the E_λ-representation; f_p(ρ_λ) is independent of λ ∤ p. Hence cond(A) = N(A)^{dim A} for the integer N(A) = ∏ p^{f_p(ρ_λ)}.
- Carayol's conductor theorem for A_f: for a weight-two newform f of level N, cond(A_f) = N^{dim A_f} and N(A_f) = N.
- Exact level: for A of GL₂-type, A is modular of level M if and only if N(A) divides M; the optimal level is N(A) = cond(A)^{1/dim A}. The level M = cond(A)^{dim A} named in Khare–Wintenberger §10.2 is valid but not optimal.
- Strict compatibility, after modularity: the λ-adic system of A is an E-rational strictly compatible system in the sense of Khare–Wintenberger §5 (PotentialModularityAndCompatibleSystems R24.5), with E-rational Weil–Deligne representations at every prime, transported from the system of f.
- L-functions: for A of GL₂-type, L(A, s) = ∏_{σ : K_f → ℂ} L(f^σ, s) with equality of every local factor, including the bad ones; hence L(A, s) has analytic continuation and a functional equation with conductor cond(A). For dim A = 1 this is the parent's `EllipticCurveModularity:R29.6`.
- Compatibility with the parent: for an elliptic curve over ℚ, GT.3–GT.4 return the parent's newform of level N_E, isogeny and parametrisation X₀(N_E) → E.

**Layer dependencies.** `GT.2`, `GT.3`, `ArithmeticGaloisRepresentations:R01.3`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.4`, `EllipticCurveModularity:R29.3`, `EllipticCurveModularity:R29.5`, `EllipticCurveModularity:R29.6`, `ModularCurvesPartII:R14.2`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, `SmallRamificationAndAbelianVarietyBaseCases:R25.3`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

**Coverage.** planned. Remaining: Lemma-level refinement when the roadmap comes near the front of the line: additivity of Artin conductors under restriction of scalars as its own lemma; the sign w_A of the functional equation.

### `GT.4/conductor-of-gl2-type` — Carayol's conductor formula for GL₂-type varieties ★

*Theorem* · planet: Carayol's conductor formula · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p and every prime λ of E with λ ∤ p, f_p(A) = n·f_p(ρ_λ), where f_p(ρ_λ) is the Artin conductor exponent of the E_λ-representation ρ_λ at p, and f_p(ρ_λ) = ord_p(N_f) for all such λ. Hence cond(A) = N_f^{n}; in particular cond(A_f) = N^{dim A_f} for every weight-two newform of level N (Carayol, Corollaire 0.8 for dim A_f = 1).

**Construction and proof.**

1. V_ℓ(A) = ⊕_{λ|ℓ} V_λ as ℚ_ℓ[G_{ℚ_p}]-modules, and the Artin conductor is additive; for an E_λ-representation W viewed over ℚ_ℓ, every term of a(W) (Swan conductor and codimension of inertia invariants, ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation) is multiplied by [E_λ : ℚ_ℓ]. So f_p(A) = Σ_{λ|ℓ} [E_λ : ℚ_ℓ]·f_p(ρ_λ).
2. ρ_λ ≅ ρ_{f,j⁻¹λ} ⊗ E_λ (GT.3/tate-module-comparison) and the Artin conductor of ρ_{f,λ′} away from ℓ is the prime-to-ℓ part of N_f (Carayol; AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical (a)); so f_p(ρ_λ) = ord_p(N_f) for every λ ∤ p, and Σ_{λ|ℓ}[E_λ : ℚ_ℓ] = n.
3. Apply this at each p with an auxiliary ℓ ≠ p.

**Acceptance.**

- J₀(23): cond = 23² = 529 and n = 2, so N(A) = 23.
- J₁(13): cond(J₁(13)) = 13², level 13.
- Elliptic curves: cond(E) = N_f, Carayol's Corollaire 0.8 and EllipticCurveModularity:R29.4/exact-conductor.

**Depends on.** `GT.3/tate-module-comparison`, `GT.3/modularity-theorem`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import`, `ArithmeticGaloisRepresentations:R01.3/global-conductor-and-prime-to-p-conductor`.

**Source.**

- Henri Carayol, Corollaire (0.8), p. 411: “Alors la fonction L de Ey est égale à L(/, s), et le conducteur géométrique de Ey est égal à N.” — The case K_f = ℚ: the conductor of E_f is the level (the text layer prints f as '/').
- Henri Carayol, Théorème (A), pp. 410–411: “la restriction a^ de o^ au groupe de Weil local Wp est équivalente à c^(TTp).” — Local-global compatibility at every p ∤ ℓ, from which the conductor of ρ_{f,λ} is the level (text layer garbles σ_λ and π_p).

### `GT.4/exact-level` — The exact level of a GL₂-type variety ★

*Theorem* · planet: Exact level cond(A)^{1/dim A} · Lean namespace `TauCeti.GL2Type`

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type of dimension n. Then cond(A) is an n-th power, N(A) := cond(A)^{1/n} equals the level N_f of every newform f with A ~ A_f, and for M ≥ 1: A is modular of level M if and only if N(A) divides M. In particular the least level of a modular parametrisation is N(A). The level M = cond(A)^{n} offered in Khare–Wintenberger §10.2 is valid, since N(A) divides it; it equals N(A) when n = 1 and is N(A)^{n²} ≠ N(A) when n ≥ 2, as N(A) > 1 (no nonzero abelian variety over ℚ has good reduction everywhere). This generalises EllipticCurveModularity:R29.4/exact-conductor.

**Construction and proof.**

1. cond(A) = N_f^n by GT.4/conductor-of-gl2-type, so N(A) = N_f; two newforms f, g with A ~ A_f ~ A_g are Galois conjugate (GT.3/simple-quotients-characterisation) and have the same level.
2. If N(A) | M, the degeneracy map makes J₁(M) → J₁(N_f) → A surjective (GT.3/modular-abelian-variety).
3. If J₁(M) → A is surjective, A ~ A_g for a newform g of level dividing M (GT.3/modularity-equivalences); g ∈ [f] by strong multiplicity one, so N_f = N_g divides M.

**Acceptance.**

- J₀(23): N(A) = 23 and A is modular of level 23 but not of level 1, …, 22.
- For an elliptic curve E₀ of conductor 11: N(E₀) = 11; KW's level 11¹ coincides.
- For J₀(23): KW's level is 529² while the exact level is 23.

**Depends on.** `GT.4/conductor-of-gl2-type`, `GT.3/modular-abelian-variety`, `GT.3/modularity-equivalences`, `GT.3/simple-quotients-characterisation`, `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`, `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `SmallRamificationAndAbelianVarietyBaseCases:R25.3/fontaine-theorem`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21: “We may take N to be M n where M is the conductor of A, and n its dimension.” — Khare–Wintenberger's level; with Carayol's formula M = N_f^n, so M^n is a multiple of the exact level N_f = M^{1/n}.
- Henri Carayol, Corollaire (0.8), p. 411: “le conducteur géométrique de Ey est égal à N.” — The dimension-one case of the exact level.

### `GT.4/strict-compatibility` — The λ-adic system is strictly compatible in the sense of Khare–Wintenberger

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E. The family (ρ_ι)_ι, ρ_ι = V_λ(A) ⊗_{E_λ, ι} ℚ̄_ℓ for embeddings ι : E → ℚ̄_ℓ, is an E-rational, two-dimensional, strictly compatible system of geometric representations of G_ℚ with Hodge–Tate weights (1, 0) (PotentialModularityAndCompatibleSystems:R24.5/compatible-system): for every prime q there is a Frobenius-semisimple Weil–Deligne representation r_q over E, unramified for q ∉ S, with WD(ρ_ι|_{D_q})^{F-ss} ≅ ι r_q for all ι, including q = ℓ. It is regular, irreducible and odd. The compatibility at the primes of bad reduction is obtained here from modularity; it is not used to prove it.

**Construction and proof.**

1. Transport the strictly compatible family of the newform f (AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, which supplies a Frobenius-semisimple WD parameter over K_f at every finite place, including those above λ) through j : K_f ≅ E and the isomorphisms of GT.3/tate-module-comparison.
2. Regular, odd and irreducible: GT.2/crystalline-at-good-primes, GT.2/odd, GT.2/absolute-irreducibility.

**Acceptance.**

- For an elliptic curve over ℚ this is the ℚ-rational system of NeronModelsAndSemistableAbelianVarieties:R11.6/strict-compatible-system-export at i = 1 (dualised).
- At p ∥ cond(A)^{1/n} with p not dividing the conductor of ε, r_p has nonzero monodromy (Steinberg type, R19.4 (b)).

**Depends on.** `GT.3/tate-module-comparison`, `GT.3/coefficient-identification`, `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`, `GT.2/crystalline-at-good-primes`, `GT.2/odd`, `GT.2/absolute-irreducibility`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §5, pp. 7–8: “For a number field E, we call an E-rational, 2-dimensional strictly com- patible system of geometric representations (ρι ) of GF the data of:” — The notion of strict compatibility, which requires Weil–Deligne comparison at all primes.
- Kenneth A. Ribet, §3, p. 4: “One knows that the collection (ρλ ) (as λ ranges over the set of finite primes of E) forms a strictly compatible system of E-rational representations whose exceptional set is the set of prime numbers at which A has bad reduction.” — Ribet's strict compatibility, in Serre's sense, concerns only the primes of good reduction (GT.2/frobenius-polynomial).

### `GT.4/l-function` — The L-function of a GL₂-type variety

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let A is a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p the local factor of L(A, s) (from H¹(A_ℚ̄, ℚ_ℓ)^{I_p}, ℓ ≠ p, NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial) equals ∏_{σ : K_f → ℂ} L_p(f^σ, s), the product over the embeddings of K_f of the Euler factors (1 − a_p(f^σ)p^{−s} + ε_f^σ(p)p^{1−2s})⁻¹ for p ∤ N_f and (1 − a_p(f^σ)p^{−s})⁻¹ for p | N_f. Hence L(A, s) = ∏_σ L(f^σ, s) extends to an entire function, and Λ(A, s) = cond(A)^{s/2}((2π)^{−s}Γ(s))^n L(A, s) satisfies Λ(A, s) = w_A Λ(A, 2 − s) with w_A = ±1. This generalises EllipticCurveModularity:R29.4/bad-euler-factors and R29.6/l-function-continuation.

**Construction and proof.**

1. H¹ ⊗ ℚ̄_ℓ = ⊕_ι ρ_ι^∨ and ρ_ι ≅ ρ_{f,ι∘j} (GT.3/tate-module-comparison); the local factor of ρ_{f,λ}^∨ at p ≠ ℓ is that of f at p (AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical (c)).
2. Each L(f^σ, s) is entire with Λ(f^σ, s) = N_f^{s/2}(2π)^{−s}Γ(s)L(f^σ, s) = w_σ Λ(f^{σ}|W_{N_f}, 2 − s), and f^σ|W_{N_f} is a multiple of the conjugate form f^{σ̄} (Tau Ceti ModularForms layers 6–7). The set of σ is closed under complex conjugation, so the product is self-dual; cond(A) = N_f^n (GT.4/conductor-of-gl2-type) gives the conductor, and w_A = ∏ w_σ is ±1 because Λ(A, s) is real on the real line.

**Acceptance.**

- For J₀(23): L(J₀(23), s) = L(f, s)L(f^σ, s) for the two embeddings of ℚ(√5).
- For dim A = 1 this is R29.6/l-function-continuation.

**Depends on.** `GT.3/tate-module-comparison`, `GT.4/conductor-of-gl2-type`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`.

**Source.**

- Henri Carayol, Corollaire (0.8), p. 411: “Alors la fonction L de Ey est égale à L(/, s)” — The dimension-one case, with all local factors (the text layer prints f as '/').

### `GT.4/parent-compatibility` — Compatibility with the parent in dimension one

*Application* · Lean namespace `TauCeti.GL2Type`

For an elliptic curve E₀ over ℚ of conductor N_{E₀} (a ℚ-simple abelian variety of GL₂(ℚ)-type), GT.3–GT.4 specialise to the parent's theorem EllipticCurveModularity:R29.6/modularity-theorem: E = ℚ, ε = 1, K_f = ℚ, f is the newform F_{E₀} of level N_f = N_{E₀} (GT.4/exact-level), the isogeny A_f → E₀ is that of R29.5/isogeny-to-E, and the parametrisation of GT.3/modular-parametrisation factors through X₀(N_{E₀}) as in R29.5/modular-parametrisation. The Part II statements are proved compatible with these, not used to reprove them.

**Construction and proof.**

1. E = End⁰_ℚ(E₀) = ℚ (R29.1), so ε = 1 (GT.2/determinant-character, E totally real) and the newform of GT.3/modularity-theorem has trivial character and rational coefficients.
2. By GT.4/exact-level its level is cond(E₀) = N_{E₀}; by strong multiplicity one it is F_{E₀} of R29.3/newform-of-E, and GT.3/trivial-character gives the quotient of J₀(N_{E₀}).

**Acceptance.**

- X₀(11): the Part II statements return J₀(11) → X₀(11), the identity.
- The Part II route uses the strong Serre theorem with nontrivial characters only when E is CM, never in dimension one.

**Depends on.** `GT.3/modularity-theorem`, `GT.3/trivial-character`, `GT.3/modular-parametrisation`, `GT.4/exact-level`, `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularity:R29.3/newform-of-E`, `EllipticCurveModularity:R29.5/isogeny-to-E`, `EllipticCurveModularity:R29.5/modular-parametrisation`.

**Source.**

- Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21: “Part (i) of Theorem 10.1 combined with Faltings’ isogeny theorem yields modularity of abelian varieties of GL2 -type over Q (see Theorem 4.4 of [33]).” — Corollary 10.2(i) generalises the modularity of elliptic curves over ℚ.

## GT.5. ℚ-curves as factors of abelian varieties of GL₂-type

Ribet's ℚ-curves. For a non-CM ℚ-curve with a model over a Galois field K and isogenies μ_g between its conjugates, the composites μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ are rational numbers and form a 2-cocycle. Tate's theorem kills its class in H²(G_ℚ, ℚ̄^×), giving a splitting α and a field E_α. The Weil restriction B of the curve has endomorphism algebra the twisted group algebra of Gal(K/ℚ) and a Lie algebra free of rank one over it; the factor of B cut out by α is a GL₂-type variety containing the curve as a ℚ̄-factor. With GT.3, every non-CM ℚ-curve is a quotient of some J₁(N) over ℚ̄. The quadratic case is explicit: R = ℚ[X]/(X² − m), ε = θ, and Serre's observation that E and K cannot both be imaginary.

**Layer targets.**

**Objects.** A *ℚ-curve* is an elliptic curve C over ℚ̄ such that ᵍC is isogenous to C over ℚ̄ for every g ∈ G_ℚ. For a non-CM ℚ-curve with a model C₀ over a finite Galois extension K/ℚ over which isogenies μ_g : ᵍC₀ → C₀ are defined, the *Ribet cocycle* c(g, h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ ∈ ℚ^× has a class [c_C] ∈ H²(G_ℚ, ℚ^×) independent of the choices.

**Targets.**
- Tate's theorem (Ribet 6.3): H²(G_ℚ, ℚ̄^×) = 0 for the trivial action; hence c_C = ∂α for a locally constant α : G_ℚ → ℚ̄^×, and ε_C(g) = α(g)²/deg μ_g is a Dirichlet character.
- Ribet's Lemma 6.4: for B = Res_{K/ℚ} C₀, End⁰_ℚ(B) is the twisted group algebra ℚ^c[Gal(K/ℚ)] with basis λ_σ and λ_σλ_τ = c(σ, τ)λ_{στ}; α induces a surjection ω : End⁰_ℚ(B) → E_α = ℚ(α(g) : g).
- Ribet's Proposition 6.5 and Corollary 6.6: B_K is isogenous to End⁰_ℚ(B) ⊗ C₀ compatibly with the action, and Lie(B/ℚ) is free of rank one over End⁰_ℚ(B).
- Ribet's Theorem 6.1: every non-CM ℚ-curve C is a ℚ̄-simple factor of a primitive abelian variety A of GL₂-type over ℚ, namely the image of the projector of End⁰_ℚ(B) onto E_α.
- Ribet's Corollary 6.2, unconditional: every non-CM ℚ-curve is a quotient over ℚ̄ of J₁(N)_ℚ̄ for some N.
- Quadratic fields (Ribet §7): for K quadratic with a K-isogeny μ : σC₀ → C₀ and μ ∘ σμ = [m], Res_{K/ℚ} C₀ is of GL₂-type with E = ℚ(√m) when m is not a square, and C₀ is K-isogenous to the base change of a curve over ℚ when m is a square; ε equals the character θ of K/ℚ cut out by the sign of m (Lemma 7.1), and at least one of E, K is real (Proposition 7.2).

**Layer dependencies.** `GT.1`, `GT.2`, `GT.3`, `GT.4`, `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A6`, `ArithmeticGaloisRepresentations:R01.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `ModularCurvesPartII:R14.5`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Coverage.** planned. Remaining: Resolve the request to AbelianSchemesAndArithmeticModuli A3 (quotients by finite subgroups), not yet in a packet. Lemma-level refinement when the roadmap comes near the front of the line: write out the omitted computation of Ribet's Proposition 6.5 and the projector construction of Theorem 6.1.

### `GT.5/q-curve` — ℚ-curves ★

*Definition* · planet: ℚ-curve · Lean namespace `TauCeti.GL2Type`

Fix an algebraic closure ℚ̄. An elliptic curve C over ℚ̄ is a ℚ-curve if for every g ∈ G_ℚ = Aut(ℚ̄/ℚ) the conjugate curve ᵍC is isogenous to C over ℚ̄. An elliptic curve C₀ over a number field K ⊆ ℚ̄ is a ℚ-curve if C₀ ×_K ℚ̄ is one, i.e. ᵍC₀ and C₀ are ℚ̄-isogenous for every g ∈ G_ℚ (ᵍC₀ being defined over gK). C is non-CM if End_ℚ̄(C) = ℤ.

**Hypotheses.**

- elliptic curves are those of Mathlib (WeierstrassCurve with IsElliptic) or, equivalently, one-dimensional abelian varieties (AbelianSchemesAndArithmeticModuli A1)
- isogenies over ℚ̄ are nonzero homomorphisms; ᵍC is the base change of C along g : ℚ̄ → ℚ̄

**Construction and proof.**

1. The definition only names the property. Its basic properties: it depends only on the ℚ̄-isogeny class of C; conjugates of a ℚ-curve are ℚ-curves; a curve with a model over ℚ is a ℚ-curve; every CM curve is a ℚ-curve, because ᵍC has CM by an order in the same imaginary quadratic field and all such curves are isogenous.
2. Because ℚ̄-isogenies are defined over a finite extension, a ℚ-curve with a model over K has, after enlarging K to a finite Galois extension of ℚ, isogenies μ_g : ᵍC₀ → C₀ defined over K for all g ∈ Gal(K/ℚ) (Ribet §6).

**API.**

| Name | Role | Statement |
|---|---|---|
| `EllipticCurve.IsQCurve` | data | C over ℚ̄ (or over K ⊆ ℚ̄) with ᵍC ~ C over ℚ̄ for all g ∈ G_ℚ. |
| `EllipticCurve.IsQCurve.of_isogeny` | functoriality | If C ~ C′ over ℚ̄ and C is a ℚ-curve then so is C′. |
| `EllipticCurve.IsQCurve.conj` | functoriality | ᵍC is a ℚ-curve whenever C is. |
| `EllipticCurve.IsQCurve.of_rat` | constructor | A curve with a model over ℚ (more generally with j(C) ∈ ℚ) is a ℚ-curve. |
| `EllipticCurve.IsQCurve.of_cm` | constructor | Every CM elliptic curve over ℚ̄ is a ℚ-curve. |
| `EllipticCurve.IsQCurve.isogenies_over_galois` | other | For a ℚ-curve with a model over K there are a finite Galois K′ ⊇ K over ℚ and K′-isogenies μ_g : ᵍC₀ → C₀ for all g ∈ Gal(K′/ℚ). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `IsQCurve.rational` | degenerate | The base change to ℚ̄ of X₀(11) is a ℚ-curve, with μ_g the identity. |
| `IsQCurve.cm` | computation | The curve y² = x³ − x with CM by ℤ[i] is a ℚ-curve; so are all curves with CM by an order of ℚ(i). |
| `IsQCurve.twist` | characterisation | A quadratic twist over K of a curve defined over ℚ is a ℚ-curve with μ_g isomorphisms over ℚ̄. |
| `IsQCurve.not_of_traces` | non-example | If K is quadratic, p = 𝔭·σ𝔭 splits in K, C₀ has good reduction at 𝔭 and σ𝔭, and a_𝔭(C₀) ≠ a_{σ𝔭}(C₀), then C₀ is not a ℚ-curve: σC₀ has trace a_{σ𝔭}(C₀) at 𝔭, and isogenous curves have equal traces. |

**Used by.**

- Ribet, §§5–7: the elliptic curves that are factors of GL₂-type varieties over ℚ̄
- Caraiani–Newton, Corollaries 7.2.5 and 7.3.4: the quadratic points whose curves are ℚ-curves are modular
- Freitas–Le Hung–Siksek, §12: real quadratic points on X₀(35) giving ℚ-curves
- GT.6/q-curve-automorphy: the hypothesis of modularity over the field of definition

**Acceptance.**

- Every elliptic curve over ℚ is a ℚ-curve.
- Caraiani–Newton Corollary 7.2.5: a curve E over a quadratic field F with E and σE 5-isogenous is a ℚ-curve.

**Depends on.** `mathlib:WeierstrassCurve.IsElliptic`, `AbelianSchemesAndArithmeticModuli:A1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`.

**Source.**

- Kenneth A. Ribet, §1, p. 2: “Then C is a quotient of an abelian variety of GL2 -type over Q if and only if C is isogenous to each of its Galois conjugates σC with σ ∈ Gal(Q/Q).” — Ribet's ℚ-curves: the defining property.
- Nuno Freitas, Bao V. Le Hung and Samir Siksek, §12, p. 18: “By a Q-curve, we mean an elliptic curve defined over Q that is isogenous to all its Galois conjugates.” — The same definition (the text layer drops the bar over ℚ).
- Ana Caraiani and James Newton, §1, p. 7: “The elliptic curves in the second family turn out to all be Q-curves (isogenous to their conjugates over Q).” — The consumer's use of the notion.

### `GT.5/ribet-cocycle` — The cocycle of a non-CM ℚ-curve

*Construction* · Lean namespace `TauCeti.GL2Type`

Let C₀ be a non-CM ℚ-curve over a finite Galois extension K/ℚ with K-isogenies μ_g : ᵍC₀ → C₀ for g ∈ Gal(K/ℚ). Then c(g, h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹, an element of (End⁰_K C₀)^× = ℚ^×, is a 2-cocycle of Gal(K/ℚ) with values in ℚ^× (trivial action); its class [c_C] ∈ H²(G_ℚ, ℚ^×), inflated along G_ℚ → Gal(K/ℚ), is independent of K, of the model and of the μ_g, and c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}.

**Hypotheses.**

- C₀ non-CM, so End⁰_K(C₀) = ℚ and every element of Hom⁰_K(ᵍC₀, C₀) is a rational multiple of μ_g
- μ_{gh}⁻¹ is the inverse in Hom⁰ (isogenies are invertible up to isogeny)

**Construction and proof.**

1. μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ ∈ End⁰_K(C₀) = ℚ, nonzero; the cocycle identity follows from associativity of composition and ᵍ(μ_h ∘ ʰμ_k) = ᵍμ_h ∘ ᵍʰμ_k.
2. Changing μ_g to r_g μ_g (r_g ∈ ℚ^×) changes c by the coboundary of r; enlarging K inflates; a K-isomorphic model changes μ_g by conjugation. Degrees are multiplicative and deg r = r² on ℚ^× ⊆ End⁰.

**API.**

| Name | Role | Statement |
|---|---|---|
| `QCurve.cocycle` | data | c : Gal(K/ℚ) × Gal(K/ℚ) → ℚ^× from the chosen μ_g. |
| `QCurve.cocycle_isCocycle` | characterisation | c is a 2-cocycle for the trivial action. |
| `QCurve.cocycleClass` | data | [c_C] ∈ H²(G_ℚ, ℚ^×), by inflation. |
| `QCurve.cocycleClass_indep` | extensionality | [c_C] is independent of K, the model C₀ and the μ_g. |
| `QCurve.cocycle_sq` | relation | c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}. |
| `QCurve.cocycleClass_of_rat` | simp | If C has a model over ℚ, [c_C] = 0. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `QCurve.cocycle_rational` | degenerate | For a curve over ℚ with μ_g = id, c ≡ 1. |
| `QCurve.cocycle_quadratic` | computation | For K quadratic and μ ∘ σμ = [m]: c(σ, σ) = m, c(1, ·) = c(·, 1) = 1. |
| `QCurve.cocycle_twist_trivial` | characterisation | For a quadratic twist of a curve over ℚ by K = ℚ(√d), the μ_g can be chosen as isomorphisms over ℚ̄ with c = ±1-valued and [c] of order dividing 2. |
| `QCurve.cocycle_cm_excluded` | non-example | For a CM curve, End⁰ is an imaginary quadratic field, the values μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ need not be rational, and the construction does not apply. |

**Used by.**

- Ribet, proof of Theorem 6.1: split by Tate's theorem to produce α and the field E_α
- Ribet, Lemma 6.4: the multiplication table of End⁰_ℚ(Res_{K/ℚ} C₀)
- GT.5/quadratic-q-curves: the integer m for quadratic K

**Acceptance.**

- For C₀ defined over ℚ take μ_g = id: c = 1.
- For K quadratic and μ = μ_σ with μ ∘ σμ = [m], c(σ, σ) = m and c = 1 elsewhere (GT.5/quadratic-q-curves).

**Depends on.** `GT.5/q-curve`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.

**Source.**

- Kenneth A. Ribet, proof of Theorem 6.1, p. 13: “A short computation shows that c is a two-cocycle on Gal(K/Q) with values in Q∗ . The class of c in H 2 (Gal(K/Q), Q∗ ) is independent of the choices of the µg .” — The construction.
- Kenneth A. Ribet, proof of Theorem 6.1, p. 13: “where “deg” denotes the degree of an isogeny between elliptic curves” — The degree relation c(g, h)² = deg μ_g deg μ_h / deg μ_{gh}, displayed just before.

### `GT.5/tate-vanishing-qbar` — Tate's theorem: H²(G_ℚ, ℚ̄^×) = 0 for the trivial action, and the splitting map α

*Lemma* · Lean namespace `TauCeti.GL2Type`

Let M = ℚ̄^× with trivial action of G_ℚ (discrete). Then H²(G_ℚ, M) = 0 (continuous cohomology). Consequently, for a non-CM ℚ-curve with cocycle c (GT.5/ribet-cocycle) there is a locally constant α : G_ℚ → ℚ̄^× with c(g, h) = α(g)α(h)/α(gh), factoring through Gal(K′/ℚ) for a finite Galois K′ ⊇ K; ε_C(g) = α(g)²/deg μ_g is a Dirichlet character with values in E_α = ℚ(α(g) : g ∈ G_ℚ), and E_α is an abelian extension of ℚ.

**Construction and proof.**

1. The torsion of M is μ_∞ ≅ ℚ/ℤ with trivial action and M/μ_∞ is uniquely divisible, so H^i(G_ℚ, M/μ_∞) = 0 for i ≥ 1 (cohomology of a profinite group is torsion); hence H²(G_ℚ, M) = H²(G_ℚ, ℚ/ℤ) = 0 (GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing).
2. The image of [c_C] in H²(G_ℚ, ℚ̄^×) vanishes, giving α; a locally constant α factors through a finite quotient.
3. α(g)²/deg μ_g is multiplicative by GT.5/ribet-cocycle (c² = ∂(deg μ)), so it is a character of finite order, a Dirichlet character; α² ≡ ε_C mod ℚ^× makes E_α abelian over ℚ.

**Acceptance.**

- For K quadratic and μ ∘ σμ = [m], α(σ) = √m and ε_C is trivial or the character of K/ℚ according to the sign of m (GT.5/quadratic-q-curves).
- The statement fails for nontrivial action: H²(G_ℚ, ℚ̄^×) with the Galois action is not zero (it contains the Brauer group of ℚ).

**Depends on.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `GT.5/ribet-cocycle`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `mathlib:DirichletCharacter`, `mathlib:cyclotomicCharacter`.

**Source.**

- Kenneth A. Ribet, Theorem 6.3, p. 13: “Let M be the discrete Gal(Q/Q)-module Q with trivial action. Then H 2 (Gal(Q/Q), M ) = 0.” — Tate's theorem as Ribet states it (the text layer drops the bar and ×).
- Kenneth A. Ribet, proof of Theorem 6.3, p. 13: “Since the quotient of M by its torsion subgroup is uniquely divisible, and since the torsion subgroup of M is isomorphic to Q/Z, we obtain H 2 (Gal(Q/Q), M ) = H 2 (Gal(Q/Q), Q/Z) = 0.” — The reduction to ℚ/ℤ.

### `GT.5/restriction-of-scalars-endomorphisms` — Ribet's Lemma 6.4: the endomorphism algebra of Res_{K/ℚ} C₀ is a twisted group algebra

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let C₀ be a non-CM ℚ-curve over a finite Galois K/ℚ with K-isogenies μ_g and cocycle c (GT.5/ribet-cocycle), and B = Res_{K/ℚ} C₀, an abelian variety over ℚ of dimension [K : ℚ], where K is enlarged (Ribet: 'after again enlarging K') so that the splitting α of GT.5/tate-vanishing-qbar factors through Gal(K/ℚ). Then End⁰_ℚ(B) = ⊕_{σ ∈ Gal(K/ℚ)} Hom⁰_K(σC₀, C₀) has a ℚ-basis λ_σ corresponding to μ_σ with λ_σλ_τ = c(σ, τ)λ_{στ}: it is the twisted group algebra R = ℚ^c[Gal(K/ℚ)]. For a splitting α of c (GT.5/tate-vanishing-qbar), ω : R → E_α, λ_σ ↦ α(σ), is a surjective homomorphism of ℚ-algebras, and R is semisimple.

**Construction and proof.**

1. B is an abelian variety over ℚ representing S ↦ C₀(S_K) (AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes), so Hom_ℚ(X, B) = Hom_K(X_K, C₀) for abelian X/ℚ; with B_K ≅ ∏_σ σC₀ (A6/weil-restriction-over-a-separable-extension-splits) this gives End⁰_ℚ(B) = ⊕_σ Hom⁰_K(σC₀, C₀) = ⊕_σ ℚ·μ_σ.
2. λ_σ acts on B_K = ∏_g ᵍC₀ by the matrix sending the factor ᵍσC₀ to ᵍC₀ through ᵍμ_σ; the identity μ_σ ∘ σμ_τ = c(σ, τ)μ_{στ} gives the multiplication table.
3. ω is multiplicative because c = ∂α; it is onto E_α by definition. R is semisimple as End⁰ of an abelian variety (A6).

**Acceptance.**

- For C₀ over ℚ and K = ℚ, R = ℚ and B = C₀.
- For K quadratic, R = ℚ[X]/(X² − m) (GT.5/quadratic-q-curves).

**Depends on.** `GT.5/ribet-cocycle`, `GT.5/tate-vanishing-qbar`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

**Source.**

- Kenneth A. Ribet, Lemma 6.4, p. 14: “We have λσ λτ = c(σ, τ )λστ in R for σ, τ ∈ Gal(K/Q).” — The multiplication table.
- Kenneth A. Ribet, §6, p. 14: “The obvious map of Q-vector spaces ω : R → E, λσ 7→ α(σ) is in fact a surjective homomorphism of Q-algebras because of (6.4).” — The map ω.

### `GT.5/lie-free-rank-one` — Ribet's Proposition 6.5 and Corollary 6.6: B_K ~ R ⊗ C₀ and Lie(B) is free of rank one

*Theorem* · Lean namespace `TauCeti.GL2Type`

In the situation of GT.5/restriction-of-scalars-endomorphisms, let T = ∏_{σ} C_σ (copies of C₀ over K) with R acting by λ_g : C_σ → C_{gσ} through multiplication by c(g, σ). The isomorphism up to isogeny ι : T → B_K = ∏_σ σC₀, taking C_σ to σC₀ by σμ_σ⁻¹, is R-equivariant. Consequently Lie(B/ℚ) is a free R-module of rank one.

**Construction and proof.**

1. Check λ_g ∘ ι = ι ∘ λ_g on each factor using μ_g ∘ ᵍμ_σ = c(g, σ)μ_{gσ} (Ribet calls the computation routine and omits it; it is a finite check over the factors).
2. Lie(B_K/K) = Lie(B/ℚ) ⊗ K, and through ι it is R ⊗_ℚ Lie(C₀/K) with R acting on the first factor; Lie(C₀/K) is one-dimensional, so Lie(B_K/K) is free of rank one over R ⊗ K, and freeness descends to Lie(B/ℚ) over R.

**Acceptance.**

- For K = ℚ: Lie(C₀) is free of rank one over ℚ.
- For K quadratic, Lie(B) is a free ℚ[X]/(X² − m)-module of rank one, two-dimensional over ℚ.

**Depends on.** `GT.5/restriction-of-scalars-endomorphisms`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`.

**Source.**

- Kenneth A. Ribet, Proposition 6.5, p. 15: “The map ι is R-equivariant, for the action of R on T just defined and for the structural action of R on B.” — The equivariance (proof omitted in the source).
- Kenneth A. Ribet, Corollary 6.6, p. 15: “The Lie algebra Lie(B/Q) is a free R-module of rank one.” — The freeness.

### `GT.5/ribet-theorem-6-1` — Ribet's Theorem 6.1: non-CM ℚ-curves are factors of GL₂-type varieties ★

*Theorem* · planet: Ribet's ℚ-curve theorem · Lean namespace `TauCeti.GL2Type`

Let C be a non-CM ℚ-curve. There is a primitive (ℚ-simple) abelian variety A over ℚ of GL₂(E_α)-type such that C is a ℚ̄-simple factor of A: A is the image of a positive multiple of the projector π ∈ R onto the factor E_α (GT.5/restriction-of-scalars-endomorphisms) acting on B = Res_{K/ℚ} C₀, End⁰_ℚ(A) = E_α, dim A = [E_α : ℚ], and A_K is K-isogenous to C₀^{dim A}.

**Construction and proof.**

1. R = E_α × ker ω as semisimple algebras; let π be the idempotent of E_α and A ⊆ B the image of mπ for m with mπ ∈ End_ℚ(B); A is nonzero, defined over ℚ, and E_α = πRπ acts on A.
2. E_α acts without multiplicity on Lie(B) (GT.5/lie-free-rank-one), hence on Lie(A), so dim A = [E_α : ℚ] and A is of GL₂(E_α)-type (SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety).
3. B_K is isogenous to a power of C₀ (A6/weil-restriction-over-a-separable-extension-splits with σC₀ ~ C₀), so A_K is too, and C₀ is a quotient of A_K. A is primitive: End⁰_ℚ(A) = πRπ = E_α is a field (GT.1/ribet-theorem-2-1).

**Acceptance.**

- For C defined over ℚ: A = C, E_α = ℚ.
- For the ℚ(√13)-curve of Ribet §7 (from the level-169 newform with E = ℚ(√3)), A = A_f of dimension two.

**Depends on.** `GT.5/lie-free-rank-one`, `GT.5/restriction-of-scalars-endomorphisms`, `GT.5/tate-vanishing-qbar`, `GT.1/ribet-theorem-2-1`, `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

**Source.**

- Kenneth A. Ribet, Theorem 6.1, p. 12: “Then there is a primitive abelian variety A of GL2 -type over Q such that C is a simple factor of A over Q.” — The statement (the second ℚ carries a bar in print).
- Kenneth A. Ribet, proof of Theorem 6.1, p. 15: “Then A is an abelian subvariety of B, defined over Q, whose algebra of Q-endomorphisms is E.” — The construction of A as an image of a projector.

### `GT.5/q-curves-geometrically-modular` — Ribet's Corollary 6.2, unconditional: ℚ-curves are quotients of J₁(N) over ℚ̄

*Theorem* · Lean namespace `TauCeti.GL2Type`

Every non-CM ℚ-curve C is a quotient over ℚ̄ of J₁(N)_ℚ̄ for some N ≥ 1; more precisely there are a weight-two newform f of level N and a finite Galois extension K′/ℚ over which C has a model C₀ with (A_f)_{K′} K′-isogenous to C₀^{[K_f : ℚ]}. Ribet §5 proves the converse (a non-CM ℚ̄-simple factor of a GL₂-type variety over ℚ is a ℚ-curve); this roadmap plans the direction stated.

**Construction and proof.**

1. GT.5/ribet-theorem-6-1 gives A over ℚ of GL₂-type with A_{K′} ~ C₀^{dim A}; GT.3/modularity-theorem gives A ~ A_f and a surjection J₁(N) → A over ℚ; compose over K′ with a projection A_{K′} → C₀.
2. CM curves are excluded: they are quotients of J₁(N)_ℚ̄ by Shimura's theorem ([26, Th. 1] in Ribet), which is not planned here, and Caraiani–Newton count CM curves as modular by definition.

**Acceptance.**

- A curve over ℚ: f its newform, K′ = ℚ.
- The 5-isogenous family of Caraiani–Newton Corollary 7.2.5 consists of such curves.

**Depends on.** `GT.5/ribet-theorem-6-1`, `GT.3/modularity-theorem`, `ModularCurvesPartII:R14.5/modular-quotient`.

**Source.**

- Kenneth A. Ribet, Corollary 6.2, p. 12: “Assume Serre’s conjecture [24, (3.2.4? )] on representations of Gal(Q/Q). Then C is a simple factor, over Q, of J1 (N ) for some N ≥ 1.” — The corollary, conditional on Serre's conjecture, now unconditional (ClassicalSerreModularity R27.6).
- Nuno Freitas, Bao V. Le Hung and Samir Siksek, §12, p. 18: “Indeed, Ribet [60, Corollary 6.2] had shown that modular- ity of Q-curves is a consequence of Serre’s modularity conjecture, which is now a theorem of Khare and Wintenberger [43], [44].” — The unconditional form as used by Freitas–Le Hung–Siksek.

### `GT.5/quadratic-q-curves` — ℚ-curves over quadratic fields (Ribet §7)

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let K be a quadratic field with Gal(K/ℚ) = {1, σ} and C₀ a non-CM elliptic curve over K with a K-isogeny μ : σC₀ → C₀; then μ ∘ σμ = [m] for a nonzero integer m, R = End⁰_ℚ(Res_{K/ℚ} C₀) = ℚ[X]/(X² − m), and θ : Gal(K/ℚ) → {±1}, θ(σ) = sign(m), is the character α²/deg μ. (a) If m is a square, C₀ is K-isogenous to the base change of an elliptic curve over ℚ. (b) If m is not a square, B = Res_{K/ℚ} C₀ is a primitive abelian surface of GL₂(ℚ(√m))-type, its character ε (GT.2/determinant-character) equals θ (Lemma 7.1), and E = ℚ(√m) is real if and only if θ is trivial. (c) (Serre, Proposition 7.2) At least one of E and K is real; in particular, if K is imaginary then m > 0, E is real quadratic and ε = 1, so B is a quotient of J₀(N).

**Construction and proof.**

1. c takes the value m on (σ, σ) and 1 elsewhere (GT.5/ribet-cocycle); R = ℚ[X]/(X² − m) by GT.5/restriction-of-scalars-endomorphisms, split by α(σ) = √m.
2. (a) m a square: R ≅ ℚ × ℚ, E_α = ℚ, and GT.5/ribet-theorem-6-1 gives an elliptic curve A over ℚ with A_K ~ C₀. (b) R = E is a field and B = A is primitive; B_K ~ C₀ × C₀ with E acting through its regular representation, so det ρ_λ|_{G_K} = χ_ℓ, ε is a character of Gal(K/ℚ), nontrivial exactly when E is imaginary (GT.2/coefficient-conjugation, GT.3/trivial-character), hence ε = θ.
3. (c) If K is imaginary, σ is complex conjugation, C₀(ℂ) = ℂ/L and σC₀(ℂ) = ℂ/L̄, μ is multiplication by some γ ∈ ℂ^×, and m = γγ̄ > 0. Alternatively: if E is imaginary, ε = θ is nontrivial and even (GT.2/odd), so K is real.

**Acceptance.**

- Caraiani–Newton's imaginary quadratic ℚ-curves fall under (c): E real, ε = 1.
- Koike's example: E = ℚ(√3) real, K = ℚ(√−3) imaginary (Ribet §7, level 81).
- Shimura's examples with E imaginary and K real (Ribet §7).

**Depends on.** `GT.5/ribet-cocycle`, `GT.5/restriction-of-scalars-endomorphisms`, `GT.5/ribet-theorem-6-1`, `GT.2/determinant-character`, `GT.2/odd`, `GT.2/coefficient-conjugation`, `GT.3/trivial-character`, `AbelianSchemesAndArithmeticModuli:A6`.

**Source.**

- Kenneth A. Ribet, §7, p. 15: “The algebra R may be written Q[X]/(X 2 − m), where X corresponds to the element of R we have been calling [σ].” — The quadratic case.
- Kenneth A. Ribet, Lemma 7.1, p. 16: “The characters ε and θ are equal.” — ε = θ.
- Kenneth A. Ribet, Proposition 7.2, p. 16: “At least one of the two quadratic fields E, K is a real quadratic field.” — Serre's proposition.

## GT.6. Modularity of ℚ-curves over their fields of definition

The modularity of a ℚ-curve over its own field of definition, in the automorphic sense of Caraiani–Newton and Freitas–Le Hung–Siksek. The twisting lemma compares the Tate module of the curve with the restriction of the newform's representation, which agree over the field where the isogenies are defined; the difference over K is a finite-order character. For K Galois with solvable group, base change of π_f twisted by that character is cuspidal (the restriction of ρ_f to every open subgroup is irreducible) and has the right local factors at every place, by local–global compatibility of base change and Carayol's theorem. Quadratic fields are the case the consumers need.

**Layer targets.**

**Targets.**
- The twisting lemma: if ρ₁, ρ₂ : G_K → GL₂(ℚ̄_ℓ) are continuous and ρ₁|_H ≅ ρ₂|_H is absolutely irreducible for an open normal subgroup H, then ρ₂ ≅ ρ₁ ⊗ ψ for a character ψ of G_K/H.
- Galois form: for a number field K and a non-CM elliptic curve C over K that is a ℚ-curve, there are a weight-two newform f, an embedding ι : K_f → ℚ̄_ℓ and a finite-order character ψ : G_K → ℚ̄_ℓ^× with V_ℓ(C) ⊗ ℚ̄_ℓ ≅ (ρ_{f,ι}|_{G_K}) ⊗ ψ.
- Automorphic form: if moreover K/ℚ is Galois with solvable Galois group, then Π = BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K) is a cuspidal automorphic representation of GL₂(𝔸_K) of parallel weight two with L(Π, s − 1/2) = L(C, s), local factor by local factor; so C is modular over K in the sense of Caraiani–Newton and of Freitas–Le Hung–Siksek.
- Quadratic fields: every ℚ-curve over a real or imaginary quadratic field is modular in that sense (the input of Caraiani–Newton Corollaries 7.2.5 and 7.3.4 and of Freitas–Le Hung–Siksek §12).

**Layer dependencies.** `GT.5`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.6`, `AutomorphicGaloisRepresentations:R19.1`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.6`, `FaltingsFinitenessAndIsogenyTheorems:R28.6`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.6`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Coverage.** planned. Remaining: Lemma-level refinement when the roadmap comes near the front of the line: the archimedean component of the base change (cohomological of parallel weight two) as its own statement.

### `GT.6/twisting-lemma` — Representations agreeing on an open normal subgroup differ by a character

*Lemma* · Lean namespace `TauCeti.GL2Type`

Let G be a profinite group, H ⊆ G an open normal subgroup, L an algebraically closed field of characteristic 0 with its ℓ-adic or discrete topology, and ρ₁, ρ₂ : G → GL₂(L) continuous with ρ₁|_H ≅ ρ₂|_H absolutely irreducible. Then there is a character ψ : G/H → L^× with ρ₂ ≅ ρ₁ ⊗ ψ.

**Construction and proof.**

1. Hom_H(ρ₁, ρ₂) is one-dimensional by Schur's lemma; G acts on it by (g·φ) = ρ₂(g) ∘ φ ∘ ρ₁(g)⁻¹, H trivially since φ is H-equivariant, so G/H acts through a character ψ⁻¹.
2. A nonzero φ is injective and surjective (ρ₁|_H, ρ₂|_H irreducible of the same dimension) and satisfies ρ₂(g) ∘ φ = ψ(g) · φ ∘ ρ₁(g) for the character ψ of G/H by which G acts on the line Hom_H(ρ₁, ρ₂); so φ : ρ₁ ⊗ ψ ≅ ρ₂. ψ is continuous as it factors through the finite group G/H.

**Acceptance.**

- ρ₂ = ρ₁ ⊗ η for a character η of G/H recovers ψ = η.
- Fails without absolute irreducibility on H: for ρ₁|_H reducible, Hom_H can be two-dimensional and no character need exist.

**Depends on.** `mathlib:IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`, `mathlib:LinearMap.bijective_or_eq_zero`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`.

**Source.**

- Kenneth A. Ribet, proof of Theorem 5.3, p. 10: “A simple argument shows that there is a character ϕ : Gal(Q/Q) → Q∗` such that Vσ ≈ Vτ ⊗ ϕ as Q` [Gal(Q/Q)]-modules.” — Ribet's use of the lemma for representations isomorphic on an open subgroup.

### `GT.6/q-curve-galois-modularity` — The Tate module of a ℚ-curve is a twist of the restriction of a newform's representation

*Theorem* · Lean namespace `TauCeti.GL2Type`

Let K be a number field, C an elliptic curve over K without CM (End_K̄(C) = ℤ) that is a ℚ-curve (GT.5/q-curve), and ℓ a prime. There are a weight-two newform f, an embedding ι : K_f → ℚ̄_ℓ and a character of finite order ψ : G_K → ℚ̄_ℓ^× such that V_ℓ(C) ⊗_{ℚ_ℓ} ℚ̄_ℓ ≅ (ρ_{f,ι}|_{G_K}) ⊗ ψ as representations of G_K. Moreover ρ_{f,ι}|_{G_{K″}} is absolutely irreducible for every finite extension K″ of K.

**Construction and proof.**

1. By GT.5/ribet-theorem-6-1 and GT.5/q-curves-geometrically-modular there are A_f over ℚ and a finite Galois K′/ℚ containing K with (A_f)_{K′} ~ C_{K′}^{n}, n = [K_f : ℚ]; so V_ℓ(A_f)|_{G_{K′}} ≅ V_ℓ(C)^{n}, compatibly with K_f ⊗ ℚ_ℓ acting on Hom⁰_{K′}(C, A_f) ⊗ ℚ_ℓ, a free module of rank one.
2. Hence ρ_{f,ι}|_{G_{K′}} ≅ V_ℓ(C) ⊗ ℚ̄_ℓ restricted to G_{K′} for every ι (AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition and Jordan–Hölder).
3. V_ℓ(C) is absolutely irreducible on every open subgroup: Faltings over K″ gives End_{G_{K″}} V_ℓ(C) = End_{K″}(C) ⊗ ℚ_ℓ = ℚ_ℓ with V_ℓ(C) semisimple (FaltingsFinitenessAndIsogenyTheorems:R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve, R28.6/tate-hom-comparison-for-elliptic-curves). Apply GT.6/twisting-lemma to G_K ⊇ G_{K′}.

**Acceptance.**

- C with a model over ℚ: f is the newform of the model, ψ the quadratic character of a twist.
- For K quadratic and m a non-square (GT.5/quadratic-q-curves), f has K_f = ℚ(√m) and B = Res_{K/ℚ}C ~ A_f.

**Depends on.** `GT.5/ribet-theorem-6-1`, `GT.5/q-curves-geometrically-modular`, `GT.6/twisting-lemma`, `AutomorphicGaloisRepresentations:R19.6/weight-two-tate-module-decomposition`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve`, `FaltingsFinitenessAndIsogenyTheorems:R28.6/tate-hom-comparison-for-elliptic-curves`, `ArithmeticGaloisRepresentations:R01.6/tate-module-of-an-abelian-variety`.

**Source.**

- Kenneth A. Ribet, Lemma 7.1 proof, p. 16: “In particular, the λ-adic representations of AK are just the `-adic representations of C, viewed as taking values in GL(2, Eλ ) rather than in GL(2, Q` ).” — Over the field of definition of the isogenies the representations of A and C agree; the twist ψ accounts for descending to K.

### `GT.6/q-curve-automorphy` — Modularity of ℚ-curves over solvable Galois fields ★

*Theorem* · planet: Modularity of ℚ-curves · Lean namespace `TauCeti.GL2Type`

Let K be a finite Galois extension of ℚ with solvable Galois group, C a non-CM ℚ-curve over K, and (f, ι, ψ) as in GT.6/q-curve-galois-modularity. Then Π = BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K) (base change along a prime-cyclic tower, twisted by the finite-order Hecke character ψ ∘ Art_K of ψ) is a cuspidal automorphic representation of GL₂(𝔸_K) of parallel weight two, and for every finite place v of K the local factor of L(Π, s − 1/2) equals the local factor of L(C, s); hence L(Π, s − 1/2) = L(C, s), and in the classical normalisation the Hecke eigenvalue of T_v on Π at unramified v is the integer a_v(C) = Nv + 1 − #C̃_v(k_v). So C is modular in the sense of Caraiani–Newton §1 (and, for K totally real, of Freitas–Le Hung–Siksek §1).

**Construction and proof.**

1. Base change: K/ℚ is Galois solvable, so BC_{K/ℚ} is defined along a prime-cyclic tower (GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change); at each step the image stays cuspidal because ρ_f restricted to every open subgroup is absolutely irreducible (GT.6/q-curve-galois-modularity), so π_f is never dihedral relative to a step.
2. At unramified places R17.6/compatible-base-change matches BC(π_f) with ρ_f|_{G_K}; twisting by the Hecke character ψ ∘ Art_K (Tau Ceti ClassFieldTheory, global Artin reciprocity) matches Π with the family V_ℓ(C) ⊗ ℚ̄_ℓ in the arithmetic normalisation of R17.6.
3. At every finite v, rec(Π_v) is the restriction of rec(π_{f,p}) to W_{K_v} (R17.4/local-compatibility) twisted by ψ_v, and rec(π_{f,p}) ↔ WD(ρ_{f,ι}|_{G_{ℚ_p}}) by Carayol (R19.4); choose ℓ ≠ p. So WD(Π_v) = WD(V_ℓ(C)|_{G_{K_v}}) and the local factors agree, including at bad v (R11.5/local-euler-polynomial).
4. At archimedean places the base change of the weight-two discrete series is cohomological of parallel weight two.

**Acceptance.**

- K = ℚ: Π = π_f ⊗ ψ, recovering the modularity of twists of curves over ℚ.
- K = ℚ(√−11) and the ℚ-curves with x(P) ∈ ℚ of Caraiani–Newton Corollary 7.3.4: Π is a twisted base change from ℚ of a weight-two newform.
- Non-example: for K/ℚ not solvable the base-change step is unavailable and the theorem makes no claim.

**Depends on.** `GT.6/q-curve-galois-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

**Source.**

- Nuno Freitas, Bao V. Le Hung and Samir Siksek, §12, p. 18: “It is known that Q-curves are modular.” — The statement for the real quadratic curves of Freitas–Le Hung–Siksek.
- Ana Caraiani and James Newton, §1, p. 2: “We say that an elliptic curve E/F is modular if either E has complex multiplication or if there exists a cuspidal automorphic representation π of GL2 (AF ) of parallel weight 2 whose associated L-function is the same as the L-function of E” — The notion of modularity over F that the conclusion meets.
- Nuno Freitas, Bao V. Le Hung and Samir Siksek, §1, pp. 2–3: “Recall that E is modular if there exists a Hilbert cuspidal eigenform f over K of parallel weight 2, with rational Hecke eigenvalues, such that the Hasse–Weil L-function of E is equal to the L-function of f.” — The totally real notion.

### `GT.6/quadratic-q-curves-modular` — ℚ-curves over quadratic fields are modular ★

*Theorem* · planet: Quadratic ℚ-curves are modular · Lean namespace `TauCeti.GL2Type`

Let K be a quadratic field (real or imaginary) and C an elliptic curve over K that is a ℚ-curve. Then C is modular in the sense of Caraiani–Newton §1: either C has CM, or there is a cuspidal automorphic representation Π of GL₂(𝔸_K) of parallel weight two with L(Π, s − 1/2) = L(C, s). This is the input of Caraiani–Newton Corollaries 7.2.5 and 7.3.4 (for imaginary K) and of Freitas–Le Hung–Siksek §12 (for real K).

**Construction and proof.**

1. CM curves are modular by definition in Caraiani–Newton's sense.
2. Otherwise K/ℚ is cyclic of degree two, hence solvable Galois, and GT.6/q-curve-automorphy applies.
3. For imaginary K, GT.5/quadratic-q-curves (c) shows moreover that when the isogeny σC → C is defined over K the variety Res_{K/ℚ} C has totally real endomorphism field and is a quotient of J₀(N).

**Acceptance.**

- Caraiani–Newton Corollary 7.2.5: E and σE 5-isogenous over a quadratic F, so E is modular.
- Freitas–Le Hung–Siksek Lemma 12.1: the real quadratic points of X₀(35) that are ℚ-curves give modular curves.
- Non-example: a quadratic-field curve that is not a ℚ-curve gets no conclusion here.

**Depends on.** `GT.6/q-curve-automorphy`, `GT.5/quadratic-q-curves`, `GT.5/q-curve`.

**Source.**

- Ana Caraiani and James Newton, Corollary 7.2.5, p. 97: “In particular, E is a Q-curve, and is therefore modular (cf. [FLHS15, §12]).” — The consumer step.
- Ana Caraiani and James Newton, Corollary 7.3.4, p. 98: “So in this case, E is a Q-curve.” — The second consumer step.
- Nuno Freitas, Bao V. Le Hung and Samir Siksek, §11, p. 17: “If these points correspond to CM elliptic curves or Q-curves then they are modular (see the remark at the beginning of Section 12 for more on the latter).” — The real quadratic use.

## Supplier contracts

Each layer of another roadmap that this roadmap cites as a whole, with the precise statement needed. Nodes of other packets cited directly are listed under each node.

### `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`

The old/new decomposition of S₂(Γ₁(N)) with the multiplicity d(N/M) of a newform of level M, giving the isogeny decomposition of J₁(N) into the A_f.

Needed by: `GT.1/modular-quotient-is-gl2-type`.

### `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Chebotarev density for finite Galois extensions of ℚ and of number fields: the Frobenius elements at unramified primes of a density-one set are dense, so continuous semisimple representations are determined by Frobenius traces off a finite set, and infinitely many primes split completely in a number field.

Needed by: `GT.1/modular-quotient-is-gl2-type`, `GT.2/determinant-character`, `GT.2/coefficients-generate`, `GT.3/serre-witnesses`, `GT.3/tate-module-comparison`.

### `AbelianSchemesAndArithmeticModuli:A3`

Quotient of an abelian variety over a field by a finite subgroup scheme stable under Galois (here a finite étale subgroup of A(ℚ̄)), with the isogeny A → A/K and T_ℓ(A/K) the lattice generated by T_ℓ(A) and the ℓ-part of K; used to build the integral model with End = 𝒪_E (GT.2/integral-model).

Needed by: `GT.2/integral-model`.

### `AbelianSchemesAndArithmeticModuli:A6`

Complex uniformization and comparison for an abelian variety A over ℚ with ℚ̄ ⊂ ℂ fixed: A(ℂ) ≅ Lie(A_ℂ)/H₁(A(ℂ), ℤ); the Hodge decomposition H₁(A(ℂ), ℚ) ⊗ ℂ = H^{-1,0} ⊕ H^{0,-1}; and the isomorphism T_ℓ(A) ≅ H₁(A(ℂ), ℤ) ⊗ ℤ_ℓ, equivariant for End_ℚ(A) and identifying complex conjugation in G_ℚ with the real Frobenius F_∞ (induced by complex conjugation on A(ℂ)), which interchanges H^{-1,0} and H^{0,-1}. Used for Ribet's oddness Lemma 3.2 (GT.2/odd) and Serre's Proposition 7.2 (GT.5/quadratic-q-curves). No layer of the atlas plans this comparison; A6 extends the field-level API of abelian varieties and is its natural owner.

Needed by: `GT.2/odd`, `GT.5/quadratic-q-curves`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`

Abelian varieties over ℚ and over number fields with their homomorphisms, isogenies, products and base change, as bundled in TauCeti.AlgebraicGeometry.AbelianVariety.

Needed by: `GT.3/modular-abelian-variety`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Normalised newforms of weight two on Γ₁(N) with character, their finiteness for bounded level (finite-dimensional S₂(Γ₁(M)), M dividing a fixed integer), and the bundled HeckeRing.GL2.Newform.

Needed by: `GT.3/fixed-newform`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`

S₂(N, χ) as the χ-eigenspace of the diamond operators in S₂(Γ₁(N)) and the decomposition of S₂(Γ₁(N)) over characters, so that newforms with nontrivial character are available.

Needed by: `GT.3/fixed-newform`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`

Strong multiplicity one: two newforms whose Hecke eigenvalues agree at almost all primes coincide (in particular have the same level); applied to Galois conjugates of newforms.

Needed by: `GT.3/simple-quotients-characterisation`, `GT.4/exact-level`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

The Abel–Jacobi morphism of a curve with a rational point and the fact that its image generates the Jacobian, used for the modular parametrisation X₁(N) → A.

Needed by: `GT.3/modular-parametrisation`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Analytic continuation of L(f, s) for a weight-two newform with character and the functional equation Λ(f, s) = w Λ(f|W_N, 2 − s), with Λ(f, s) = N^{s/2}(2π)^{−s}Γ(s)L(f, s).

Needed by: `GT.4/l-function`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`

The Fricke/Atkin–Lehner involution W_N on a newform f of level N: f|W_N is a multiple of the complex-conjugate newform, which gives the functional equation relating f and its conjugate.

Needed by: `GT.4/l-function`.

### `AbelianSchemesAndArithmeticModuli:A1`

One-dimensional abelian varieties over a field coincide with Mathlib's elliptic curves (WeierstrassCurve with IsElliptic), compatibly with the group law, so that the ℚ-curves of GT.5 can be stated for either and fed to the abelian-variety results of A6 and Faltings.

Needed by: `GT.5/q-curve`.

### `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

Continuous cochain cohomology H²(G, M) of a profinite group with discrete coefficients, inflation from finite quotients, and vanishing of H^i (i ≥ 1) for uniquely divisible discrete modules.

Needed by: `GT.5/ribet-cocycle`, `GT.5/tate-vanishing-qbar`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Global Artin reciprocity for a number field K, to turn a finite-order character ψ of G_K into the finite-order Hecke character ψ ∘ Art_K used to twist the base change.

Needed by: `GT.6/q-curve-automorphy`.

## Mistakes in the sources

### EllipticCurveModularityPartIIGL2TypeAbelianVarieties/E1 (misprint, affects nothing)

*Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21 of the authors' copy results.pdf (Invent. Math. 178 (2009) not compared).* Printed: “We recall than an abelian variety A over Q is said to be of GL2 -type if it is simple and EndQ (A) ⊗ Q contains a number field E with [E : Q] = dim(A).”

Correction: We recall that an abelian variety A over ℚ is said to be of GL₂-type if …

Reason: 'than' is a slip for 'that'; the sentence introduces a definition.

### EllipticCurveModularityPartIIGL2TypeAbelianVarieties/E2 (gap, affects the proof)

*Chandrashekhar Khare and Jean-Pierre Wintenberger, §10.2, p. 21 (deduction of Corollary 10.2(i)), with the definition of compatible systems in §5, pp. 7–8, of the authors' copy results.pdf (Invent. Math. 178 (2009) not compared).* Printed: “Part (i) of Theorem 10.1 combined with Faltings’ isogeny theorem yields modularity of abelian varieties of GL2 -type over Q (see Theorem 4.4 of [33]).”

Correction: To apply Theorem 10.1(i), the λ-adic system of A must be a compatible system in the sense of §5, which includes (ii) b): for every prime q not above ℓ, the Frobenius-semisimple Weil–Deligne representation of ρ_ι|_{D_q} is conjugate to an E-rational r_q independent of ι. At the primes of bad reduction this is not verified, and neither KW nor Ribet's Theorem 4.4 (whose 'strictly compatible', p. 4, is Serre's notion at the primes of good reduction) proves it. The corollary follows without it by Ribet's own argument, which uses only the strong Serre theorem, the boundedness of conductors (Grothendieck) and Faltings' theorem; the comparison at bad primes then follows from modularity and Carayol's theorem.

Reason: Khare–Wintenberger define 'compatible' on pp. 7–8 with (ii) b) imposed for q not above ℓ; Ribet, §3 p. 4, asserts strict compatibility 'whose exceptional set is the set of prime numbers at which A has bad reduction', i.e. no statement at those primes. The E-rationality of the Weil–Deligne representations of V_λ(A) at a prime of bad reduction requires an argument (through Néron models and the E-action on the semi-abelian reduction) that neither text gives.

## Boundaries

- The definition of GL₂(K)-type and its λ-adic representations belong to SmallRamificationAndAbelianVarietyBaseCases R25.5; Tate modules, their λ-components, Weil pairings and residual λ-torsion to ArithmeticGaloisRepresentations R01.6; endomorphism algebras, Rosati involutions, Poincaré reducibility and Weil restriction to AbelianSchemesAndArithmeticModuli A2–A6; Faltings' theorems to FaltingsFinitenessAndIsogenyTheorems R28.2–R28.6; the strong Serre theorem to ClassicalSerreModularity R27.6; J₁(N), J₀(N) and A_f to ModularCurvesPartII R14.2–R14.6; the representations of newforms and Carayol's theorem to AutomorphicGaloisRepresentations R19.1–R19.6; base change to GL2AutomorphicRepresentationsAndTransfer R17.4–R17.6. They are imported, not re-planned.
- Khare–Wintenberger's Theorem 10.1(i) is owned by ClassicalSerreModularity R27.6; this roadmap does not use it (see the route above) and does not restate it.
- Inner twists, the building-block theory over ℚ̄ and the converse direction of Ribet §5 (that the ℚ̄-simple factors of a non-CM GL₂-type variety are ℚ-curves, with Ribet's Theorems 5.3–5.6 on the centre F, the class of End⁰_ℚ̄ in Br(F) and the map α) are not part of this roadmap; nor is Ribet §8 (descent up to isogeny).
- CM elliptic curves and CM abelian varieties are excluded from GT.5–GT.6; Caraiani–Newton count CM curves as modular by definition, and Shimura's theorem for them is not planned here.
- The modularity of elliptic curves over imaginary quadratic fields (Caraiani–Newton) belongs to EllipticCurveModularityImaginaryQuadratic, which imports GT.6.

## Sources

- **KW-I** — Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)*, Inventiones mathematicae 178 (2009), no. 3, 485–504; authors' copy results.pdf (23 pp., PDF of 31 May 2009), cited by its own page numbers. <https://www.math.ucla.edu/~shekhar/papers/results.pdf> (SHA-256 `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82`, read 2026-10-07). Sections read: §1 Introduction (Theorem 1.2), pp. 1–3; §5 Compatible systems of geometric representations, pp. 7–9; §10 Modularity of compatible systems (Theorem 10.1, §10.2, Corollary 10.2), pp. 19–21.
- **Ribet92** — Kenneth A. Ribet, *Abelian varieties over Q and modular forms*, Algebra and Topology 1992 (Taejŏn), Korea Adv. Inst. Sci. Tech. (1992), 53–79; reprinted in Modular Curves and Abelian Varieties, Progress in Mathematics 224 (2004), 241–261; author's AMS-TeX manuscript korea.pdf (19 pp., PDF of 6 September 2003), cited by its own page numbers. <https://math.berkeley.edu/~ribet/Articles/korea.pdf> (SHA-256 `4c491a5294d1f4ec1b62855560aaea95cb64802d8fdd80fdd51ae2d2432f66ed`, read 2026-10-07). Sections read: §1 Introduction, pp. 1–2; §2 Abelian varieties over Q of GL2-type (Theorem 2.1), pp. 2–3; §3 ℓ-adic representations (Lemmas 3.1, 3.2, 3.7; Propositions 3.3–3.6), pp. 3–7; §4 Conjectural connection with modular forms (Lemmas 4.1–4.3, Theorem 4.4), pp. 7–9; §5 Decomposition over Q̄ (5.1–5.6), pp. 9–12; §6 Q-curves as factors (6.1–6.6), pp. 12–15; §7 Q-curves over quadratic fields (7.1, 7.2), pp. 15–17; §8 Descent up to isogeny (8.2), pp. 17–18; References, pp. 18–19.
- **Carayol86** — Henri Carayol, *Sur les représentations ℓ-adiques associées aux formes modulaires de Hilbert*, Annales scientifiques de l'École normale supérieure (4) 19 (1986), no. 3, 409–468; Numdam scan with text layer (published pagination; PDF page = printed page − 407). <https://www.numdam.org/item/ASENS_1986_4_19_3_409_0.pdf> (SHA-256 `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`, read 2026-10-07). Sections read: §0 Introduction: 0.4–0.8 (normalisations, Hecke correspondence, Théorème (A), Corollaire 0.8), pp. 409–411.
- **FLHS15** — Nuno Freitas, Bao V. Le Hung and Samir Siksek, *Elliptic curves over real quadratic fields are modular*, Inventiones mathematicae 201 (2015), 159–206; arXiv:1310.7088v4 (18 July 2014) read. <https://arxiv.org/pdf/1310.7088v4> (SHA-256 `aea71f7698edac25fedaf03627b7703c0ed6138e4e9c012b06b41822819d0403`, read 2026-10-07). Sections read: §1 Summary of results (definition of modularity), pp. 2–3; §11 remarks before Lemma 11.1, pp. 17–18; §12 opening paragraph on Q-curves, p. 18.
- **CN23** — Ana Caraiani and James Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3 (27 March 2025). <https://arxiv.org/pdf/2301.10509v3> (SHA-256 `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`, read 2026-10-07). Sections read: §1 Introduction (definition of modular elliptic curves, the modular curves of §7), pp. 2–7; §7.2 Corollary 7.2.5, p. 97; §7.3 Corollary 7.3.4, p. 98.
