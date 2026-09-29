# Weights and purity in étale cohomology

## Purpose

This roadmap applies Deligne's weights to the arithmetic objects that its consumers use: Galois representations of number fields, Tate modules of abelian varieties, degenerations, pencils, and the cohomology of Kuga–Sato varieties and modular Jacobians (R34.1–R34.6).

Checkpoint 1 plans R34.1, the representation-convention adapter. Checkpoint 2 completes R34.2, the curve and abelian-variety adapter over DeligneWeightsAndPurity DWP.1. It shows that H^i of abelian varieties and curves with good reduction is pure and integral, and it records point counts and traces at good places, with the genus-one agreement: the export that FaltingsFinitenessAndIsogenyTheorems R28.4 requests.

## Scope and boundaries

RS-17 is accepted. It makes this roadmap Part II of DeligneWeightsAndPurity and narrows every stage to an adapter.

- Weil numbers, ι-weights and their linear algebra are DWP.0's, and R34.1 imports them unchanged.
- The Weil estimate for abelian varieties and curves is DWP.1's, and R34.2 transports it.
- Néron–Ogg–Shafarevich is NeronModelsAndSemistableAbelianVarieties R11.5's.
- The sheaf predicates are DWP.5's, the mixed complexes DWP.8's, and the Weil II theorems DWP.7–DWP.8's.

## Conventions

- Weights are geometric: P_v(ρ, T) = det(T − ρ(Frob_v^geom)), and ℚ_p(1) has weight −2. The arithmetic convention negates every weight.
- Pure of weight w outside T: unramified at every finite v ∉ T, with every root of P_v(ρ, T) a Weil q_v-number of weight w. Integral outside T: P_v(ρ, T) ∈ ℤ[T].
- For an abelian variety over 𝔽_q, π_A is the Frobenius endomorphism, H¹ = Hom(V_ℓA, ℚ_ℓ), and the geometric Frobenius on H¹ has characteristic polynomial P_{π_A}.

## R34.1 Frobenius, algebraicity and weights

### Objects

#### Definition. Arithmetic and geometric Frobenius, and the Frobenius polynomial of a Galois representation

*Module* `TauCeti/Weights/Galois/Frobenius.lean`. *Node* `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`.

For a finite field k = 𝔽_q with algebraic closure k̄, the arithmetic Frobenius φ ∈ Gal(k̄/k) is x ↦ x^q and the geometric Frobenius is F = φ⁻¹; either one topologically generates Gal(k̄/k). Let K be a number field, v a finite place with residue field of size q_v, and ρ : G_K → GL(V) a continuous representation on a finite-dimensional vector space over a field E of characteristic 0, unramified at v. Then ρ(Frob_v^geom) is well defined up to conjugacy, where Frob_v^geom is any element of a decomposition group at v mapping to F. So is its characteristic polynomial P_v(ρ, T) = det(T − ρ(Frob_v^geom)). The arithmetic polynomial det(T − ρ(Frob_v^arith)) has the inverse roots, and equals P_v(ρ^∨, T) for the contragredient ρ^∨.

*Hypotheses.*

- Weights in this roadmap and in DeligneWeightsAndPurity use the geometric Frobenius (Weil I (1.15)). With the arithmetic convention every weight changes sign; ℚ_ℓ(1) has geometric weight −2 and arithmetic weight +2.
- Unramified at v means that the inertia group at v acts trivially. Without it ρ(Frob_v) depends on the choice of Frobenius modulo inertia.
- Changing the place above v or the decomposition group conjugates ρ(Frob_v^geom), so only its conjugacy class and characteristic polynomial are defined.

*API.*

- `GaloisRep.frobCharpoly` (*constructor*) — frobCharpoly ρ v (hv : ρ.IsUnramifiedAt v) : E[X] := charpoly (ρ (Frob_v^geom)), independent of the choices.
- `GaloisRep.frobCharpoly_arith` (*compatibility*) — charpoly (ρ (Frob_v^arith)) = frobCharpoly ρ^∨ v.
- `GaloisRep.frobCharpoly_roots_inv` (*characterisation*) — The roots of charpoly (ρ (Frob_v^arith)) are the inverses of those of frobCharpoly ρ v.
- `GaloisRep.frobCharpoly_conj` (*simp*) — frobCharpoly (g • ρ) v = frobCharpoly ρ v for conjugate representations.

*Used by.*

- `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations` — purity and integrality are conditions on P_v(ρ, T)
- `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology` — geometric Frobenius on H¹ against the Frobenius endomorphism
- `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation` — Frob_v^geom in the purity hypothesis
- `FaltingsFinitenessAndIsogenyTheorems:R28.4` — Frobenius polynomials of Tate modules at good primes

*Unit tests.* A wrong definition fails one of these.

- `frobCharpoly_cyclotomic` (value) — P_v(ℚ_ℓ(1), T) = T − q_v⁻¹ for v ∤ ℓ: the cyclotomic character sends Frob_v^arith to q_v.
- `frobCharpoly_trivial` (degenerate) — For the trivial representation of rank d, P_v = (T − 1)^d at every v.
- `not_unramified_cyclotomic_at_l` (non-example) — At v | ℓ the cyclotomic character is ramified, so ρ(Frob_v) is not defined on ℚ_ℓ(1).
- `frobCharpoly_arith_elliptic` (value) — For E with good reduction at v ∤ ℓ, the arithmetic Frobenius on H¹ = V_ℓ(E)^∨ has characteristic polynomial T² − (a_v/q_v)T + 1/q_v, the inverse roots of T² − a_vT + q_v.

*Construction.*

1. For a finite Galois extension through which a finite quotient of ρ factors, Frobenius elements exist (mathlib:IsArithFrobAt.exists_of_isInvariant). Two of them differ by inertia (mathlib:IsArithFrobAt.mul_inv_mem_inertia), and they are conjugate across the primes above v (mathlib:IsArithFrobAt.conj).
2. For the continuous ρ of G_K, the Frobenius class modulo inertia and the independence of choices come from ArithmeticGaloisRepresentations R01.1–R01.2 (continuous representations; decomposition and inertia groups).
3. Geometric Frobenius is the inverse of the arithmetic one, so the characteristic polynomials have inverse roots, and (ρ(g)⁻¹)^* on V^* computes the contragredient (DWP.0/spectra-of-tensor-products-and-duals).

*Acceptance.*

- The ℓ-adic cyclotomic character χ_ℓ satisfies χ_ℓ(Frob_v^arith) = q_v for v ∤ ℓ, so P_v(ℚ_ℓ(1), T) = T − q_v⁻¹.
- For an elliptic curve E/K with good reduction at v ∤ ℓ: P_v(H¹, T) = T² − a_vT + q_v on H¹ = V_ℓ(E)^∨, and P_v(V_ℓE, T) = T² − (a_v/q_v)T + 1/q_v.

*Uses.* `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `mathlib:IsArithFrobAt`, `mathlib:IsArithFrobAt.mul_inv_mem_inertia`, `mathlib:IsArithFrobAt.conj`.

*Planet:* Arithmetic and geometric Frobenius.

*Sources.*

- La conjecture de Weil. I, §1, (1.15), p. 279: “Ceci amène à définir le Frobenius géométrique” The geometric Frobenius is the inverse of the substitution x ↦ x^q.
- La conjecture de Weil. II, §1.1, (1.1.13), p. 152: “étant la puissance entière” The Frobenius at a point of degree d maps to the d-th power.

#### Definition. Galois representations pure of weight w, and with integral Frobenius polynomials, outside T

*Module* `TauCeti/Weights/Galois/Pure.lean`. *Node* `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`.

Let K be a number field, T a finite set of finite places, and ρ : G_K → GL(V) a continuous representation on a finite-dimensional ℚ_p-vector space (or over a finite extension E of ℚ_p). ρ is pure of weight w outside T if it is unramified at every finite v ∉ T and, for each such v, every root of P_v(ρ, T) is a Weil q_v-number of weight w. Equivalently, (V ⊗ Ē, ρ(Frob_v^geom)) is pure of weight w relative to q_v in the sense of DWP.0. ρ has integral Frobenius polynomials outside T if P_v(ρ, T) ∈ ℤ[T] for every v ∉ T. For a field embedding ι : Ē → ℂ, ρ is ι-pure of real weight w outside T if the eigenvalues of every ρ(Frob_v^geom), v ∉ T, have ι-weight w relative to q_v.

*Hypotheses.*

- The geometric Frobenius convention of the node arithmetic-and-geometric-frobenius is used; the arithmetic convention negates w.
- Integrality is a separate predicate. ℚ_p(1) is pure of weight −2 outside {v | p}, and its Frobenius polynomials T − q_v⁻¹ are not integral.
- Places above p are allowed outside T only if ρ is unramified there. For ℚ_p(n), n ≠ 0, T must contain the places above p.

*API.*

- `GaloisRep.IsPureOutside` (*data*) — IsPureOutside ρ T w : Prop := ∀ v ∉ T, ρ.IsUnramifiedAt v ∧ IsPure (q_v : ℝ) w (ρ (Frob_v^geom)).
- `GaloisRep.HasIntegralFrobOutside` (*data*) — HasIntegralFrobOutside ρ T : Prop := ∀ v ∉ T, ∃ P : ℤ[X], (P.map (Int.castRingHom E)) = frobCharpoly ρ v.
- `GaloisRep.IsIotaPureOutside` (*data*) — IsIotaPureOutside ρ T ι w : Prop, the ι-weight version with w : ℝ.
- `GaloisRep.IsPureOutside.mono` (*compatibility*) — T ⊆ T′ → IsPureOutside ρ T w → IsPureOutside ρ T′ w.
- `GaloisRep.IsPureOutside.weight_unique` (*characterisation*) — V ≠ 0 → IsPureOutside ρ T w → IsPureOutside ρ T w′ → w = w′.

*Used by.*

- `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations` — stability of the predicates
- `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction` — change of field
- `MordellLawrenceVenkatesh:LV.1/faltings-finiteness` — Faltings' finiteness for pure integral representations
- `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation` — the purity hypothesis
- `FaltingsFinitenessAndIsogenyTheorems:R28.4` — pure integral Tate modules

*Unit tests.* A wrong definition fails one of these.

- `isPureOutside_tate` (value) — ℚ_p(n) is pure of weight −2n outside the places above p.
- `isPureOutside_trivial` (degenerate) — The trivial representation is pure of weight 0 outside ∅, with integral Frobenius polynomials.
- `not_integral_tate_one` (non-example) — ℚ_p(1) is pure of weight −2 but not integral: P_v = T − q_v⁻¹. Purity does not imply integrality.
- `not_isPureOutside_sum` (non-example) — ℚ_p ⊕ ℚ_p(1) is pure of no weight: its eigenvalues have weights 0 and −2.

*Construction.*

1. Purity: apply DWP.0/endomorphism-weights to ρ(Frob_v^geom) at each v ∉ T with base q_v. It is well defined because the characteristic polynomial is (node arithmetic-and-geometric-frobenius).
2. Integrality: P_v(ρ, T) ∈ ℤ[T]. When P_v has rational coefficients, this holds exactly when every root is an algebraic integer, since P_v is monic.
3. ι-purity: DWP.0/iota-weight on each eigenvalue.

*Acceptance.*

- ℚ_p(n) is pure of weight −2n outside {v | p}. It has integral Frobenius polynomials exactly when n ≤ 0.
- For an elliptic curve E over K with good reduction outside T ∌ v | p: H¹ = V_p(E)^∨ is pure of weight 1 outside T ∪ {v | p} and integral (R34.2, DWP.1).

*Uses.* `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`.

*Planet:* Pure Galois representations.

*Sources.*

- Diophantine problems and p-adic period mappings, §2.3, Lemma 2.3, p. 9: “ρ is pure of weight w, i.e. for every prime” Pure of weight w: all roots of the Frobenius polynomial are algebraic of absolute value q_℘^{w/2}.
- Diophantine problems and p-adic period mappings, §2.3, Lemma 2.3, p. 9: “is unramiﬁed outside S, and” Unramified outside a finite set.

### Theorems

#### Theorem. Purity and integrality under subquotients, sums, duals, tensor products, determinants and Tate twists

*Module* `TauCeti/Weights/Galois/Pure.lean`. *Node* `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`.

Let ρ and ρ′ be pure of weights w and w′ outside T. Then: subrepresentations and quotients of ρ are pure of weight w outside T, and ρ is pure iff a subrepresentation and its quotient are; ρ ⊕ ρ″ is pure of weight w if ρ″ is; the contragredient ρ^∨ is pure of weight −w; ρ ⊗ ρ′ is pure of weight w + w′; det ρ is pure of weight w·dim V; and the twist ρ(n) = ρ ⊗ ℚ_p(n) is pure of weight w − 2n outside T ∪ {v | p}. Integral Frobenius polynomials are preserved by subquotients, direct sums, tensor products, determinants and twists ρ(n) with n ≤ 0. They are not preserved by duals or by twists ρ(n) with n > 0.

*Hypotheses.*

- Dual means contragredient.
- The twist enlarges T by the places above p, where ℚ_p(n) is ramified for n ≠ 0.
- For integrality of subquotients, the Frobenius polynomial of a subquotient divides that of ρ in ℚ[T]. A monic divisor in ℚ[T] of a monic integer polynomial has integer coefficients (Gauss).

*Proof.*

1. Purity is checked eigenvalue by eigenvalue at each v ∉ T: DWP.0/purity-under-subquotients-and-extensions for subquotients and sums, DWP.0/spectra-of-tensor-products-and-duals for ⊗, contragredient and det, and DWP.0/twisting-by-rank-one-characters for twists.
2. Integrality: the roots of P_v are algebraic integers. Products of algebraic integers are algebraic integers, which handles ⊗ and det. Roots of subquotients are among those of ρ. For duals, inverses of algebraic integers need not be integral (q_v⁻¹).
3. Gauss's lemma: a monic factor in ℚ[T] of a monic polynomial in ℤ[T] lies in ℤ[T].

*Acceptance.*

- H¹(E) ⊗ H¹(E) of an elliptic curve is pure of weight 2 and integral. Its dual is pure of weight −2 and is not integral.
- det H¹(E) = ℚ_p(−1): weight 2 = 1·2, integral.

*Uses.* `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

*Sources.*

- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(ii), p. 154: “Le produit tensoriel de deux faisceaux ponctuellement purs de poids n et m est ponctuel-” Weights add under tensor product.
- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(ii), p. 154: “faisceau lisse ponctuellement pur de poids n est ponctuellement” The dual of a pure object of weight n has weight −n.
- Diophantine problems and p-adic period mappings, §2.4, p. 13: “purity passes to subrepresentations” Purity passes to subrepresentations.

#### Theorem. Purity and integrality under restriction to G_L and induction from G_L

*Module* `TauCeti/Weights/Galois/Induction.lean`. *Node* `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`.

Let L/K be a finite extension of number fields and T a finite set of places of K. (i) If ρ is pure of weight w outside T, then ρ|G_L is pure of weight w outside the set T_L of places above T, with integral Frobenius polynomials if ρ has them. (ii) If ρ is a representation of G_L pure of weight w outside T_L, then Ind_{G_L}^{G_K} ρ is pure of weight w outside T ∪ {v ramified in L}, with integral Frobenius polynomials if ρ has them. Here P_v(Ind ρ, T) = ∏_{u | v} P_u(ρ, T^{f(u|v)}) for v unramified in L and outside T.

*Hypotheses.*

- Restriction: Frob_u^geom = (Frob_v^geom)^{f(u|v)} in a decomposition group at u, and q_u = q_v^{f(u|v)}.
- Induction needs v unramified in L, so that Ind ρ is unramified at v; the ramified places are added to T.

*Proof.*

1. Restriction: ρ(Frob_u^geom) = ρ(Frob_v^geom)^{f}, and pure of weight w relative to q_v implies pure of weight w relative to q_v^f (DWP.0/finite-field-base-extension-of-weights). Integral polynomials stay integral, since the roots are powers of algebraic integers.
2. Induction, Frobenius formula: by Mackey's formula over the double cosets D_v \ G_K / G_L, which correspond to the places u | v, the restriction of Ind ρ to D_v is ⊕_u Ind_{D_u}^{D_v} ρ|D_u. On each summand Frob_v acts as a cyclic block whose f-th power is Frob_u, so the characteristic polynomial is P_u(ρ, T^{f}) (ArithmeticGaloisRepresentations R01.2 for decomposition groups).
3. Weights: the roots of P_u(ρ, T^f) are the f-th roots β of the roots α of P_u. From |β|^f = |α| = q_u^{w/2} = q_v^{fw/2} one gets |β| = q_v^{w/2} for every complex conjugate (DWP.0/weil-number-base-extension). β is algebraic, and integral if α is.

*Acceptance.*

- K = ℚ, L = ℚ(i), ρ the trivial character of G_L: Ind ρ = 1 ⊕ χ_{−4}, pure of weight 0 outside {2}. At p ≡ 3 mod 4, P_p = T² − 1 = P_u(1, T²), with one place u of degree 2.

*Uses.* `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `ArithmeticGaloisRepresentations:R01.2`.

*Sources.*

- La conjecture de Weil. II, §1.2, Stabilités (1.2.5)(i), p. 154: “image directe par un morphisme fini.” Stability under inverse image and finite direct image: restriction and induction.
- Diophantine problems and p-adic period mappings, §2.5, proof of Lemma 2.10, p. 14: “We apply Lemma 2.9 to” Purity used for an induced representation.

#### Theorem. Finite dimensionality implies neither algebraicity nor purity

*Module* `TauCeti/Weights/Galois/NonExamples.lean`. *Node* `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`.

Let k = 𝔽_q and ℓ ∤ q. For every u ∈ ℤ_ℓ^× there is a unique continuous character χ_u : Gal(k̄/k) → ℤ_ℓ^× with χ_u(F) = u. ℤ_ℓ^× contains elements transcendental over ℚ. For such u, (ℚ_ℓ, χ_u) is a continuous one-dimensional representation whose Frobenius eigenvalue is not algebraic, so it is pure of no weight, although it is ι-pure of the real weight 2 log_q |ι(u)| for each ι. For ℓ odd, u = 2 and q an odd prime, χ_u is algebraic but pure of no integer weight.

*Hypotheses.*

- This is R34.1's acceptance statement: purity and algebraicity are theorems about particular representations (DWP), not consequences of continuity and finite dimension.
- u must be an ℓ-adic unit for continuity on the compact group Gal(k̄/k). A Weil-group representation (Weil II (1.1.10)) allows any u ∈ ℚ̄_ℓ^×.

*Proof.*

1. Gal(k̄/k) ≅ Ẑ, topologically generated by F. n ↦ u^n extends continuously to Ẑ because ℤ_ℓ^× is profinite: u^{(ℓ−1)ℓ^m} → 1 as m → ∞, and ℤ_ℓ^× ≅ μ_{ℓ−1} × (1 + ℓℤ_ℓ) for ℓ odd.
2. ℤ_ℓ^× is uncountable and the algebraic numbers are countable, so transcendental units exist; for instance 1 + ℓt with t ∈ ℤ_ℓ transcendental.
3. A Weil q-number is algebraic (DWP.0/weil-q-number), so χ_u is pure of no weight. Its ι-weight is defined for every ι (DWP.0/iota-weight).
4. u = 2: if |2| = q^{w/2} with q an odd prime, then 4 = q^w, impossible for integer w.

*Acceptance.*

- u = 1 + ℓ is algebraic (rational) and has ι-weight 2 log_q(1 + ℓ) for every ι; it is pure of no weight unless 1 + ℓ is a power of √q.

*Uses.* `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/iota-weight`.

*Sources.*

- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “est alors automatiquement algébrique, sans quoi” Algebraicity is a consequence of purity at every ι, and fails without it.
- La conjecture de Weil. II, §1.2, Variante (1.2.3), p. 154: “On leur transporte la terminologie (1.2.2).” The weight terminology for representations of Gal(k̄/k).

#### Theorem. Purity against a chosen embedding versus all embeddings

*Module* `TauCeti/Weights/Galois/Pure.lean`. *Node* `WeightsInEtaleCohomology:R34.1/purity-at-every-embedding-versus-a-chosen-embedding`.

Let ρ be as in pure-and-integral-galois-representations, with coefficients in ℚ̄_p. (i) ρ is pure of weight w outside T iff it is ι-pure of weight w outside T for every field isomorphism ι : ℚ̄_p ≅ ℂ. (ii) If every P_v(ρ, T), v ∉ T, has coefficients in a number field E ⊂ ℚ̄_p, then ρ is pure of weight w outside T iff, for every embedding σ : E → ℂ, all roots of σ(P_v(ρ, T)) have absolute value q_v^{w/2}. (iii) ι-purity for one ι implies neither: it constrains only the embedding ι|_E.

*Hypotheses.*

- (i) needs #ℚ̄_p = 𝔠, which DWP.0/embeddings-into-the-complex-numbers proves.
- (ii) is the form in which purity is checked for compatible systems with coefficients in a number field.

*Proof.*

1. (i): apply DWP.0/weil-number-iff-iota-pure-for-every-iota to each eigenvalue at each v ∉ T.
2. (ii): the roots of P_v lie in a finite extension of E. Their complex conjugates are the roots of σ(P_v) for the embeddings σ, so this is the definition of a Weil q_v-number (DWP.0/weil-q-number).
3. (iii): take P_v = T − (1 + √2) with E = ℚ(√2). An ι with ι(√2) = √2 gives ι-weight 2 log_{q_v}(1 + √2); one with ι(√2) = −√2 gives the negative. 1 + √2 is not a Weil number, so no single ι decides purity. When P_v has rational coefficients, a single ι already sees every conjugate.

*Acceptance.*

- For H¹ of an elliptic curve with CM by E = ℚ(i), P_v has coefficients in ℚ ⊂ E, and the check over the two embeddings of E reduces to one.

*Uses.* `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

*Sources.*

- La conjecture de Weil. II, §1.2, (1.2.6), p. 154: “est alors automatiquement algébrique, sans quoi” Purity for every ι gives algebraicity and all-embeddings purity.

## R34.2 Curves and abelian varieties

### Theorems

#### Theorem. Frobenius on V_ℓA and on H¹: the conventions for abelian varieties over 𝔽_q

*Module* `TauCeti/Weights/AbelianVariety/Frobenius.lean`. *Node* `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`.

Let A be an abelian variety of dimension g over 𝔽_q, π_A its q-Frobenius endomorphism, and ℓ ∤ q. (i) The arithmetic Frobenius φ acts on A(𝔽̄_q) as π_A, hence on V_ℓA as V_ℓ(π_A); the geometric Frobenius acts by V_ℓ(π_A)⁻¹. (ii) Under the Galois-equivariant isomorphism H¹(A_{𝔽̄_q}, ℚ_ℓ) ≅ Hom(V_ℓA, ℚ_ℓ), the geometric Frobenius on H¹ has characteristic polynomial P_{π_A}, the characteristic polynomial of the endomorphism π_A. (iii) So H¹ is pure of weight w iff V_ℓA, with the geometric Frobenius, is pure of weight −w; DWP.1 supplies w = 1. (iv) For an elliptic curve, P_{π}(T) = T² − aT + q with a = q + 1 − #E(𝔽_q), in agreement with Tau Ceti EllipticCurves Layer 3.

*Hypotheses.*

- The Frobenius endomorphism π_A is a morphism of 𝔽_q-varieties. The arithmetic Frobenius φ is an automorphism of the coefficient field. They agree on 𝔽̄_q-points, and this is the only place the two are identified.
- H¹ versus the Tate module: H¹ is the ℚ_ℓ-dual of V_ℓA, and the contragredient of the geometric Frobenius on V_ℓA is π_A's transpose. This is where sign conventions for weights are most often lost.
- The weight 1 of H¹ is DeligneWeightsAndPurity DWP.1's theorem, requested here, not reproved.

*Proof.*

1. π_A is the identity on the topological space and f ↦ f^q on functions, so on points (x_i) ↦ (x_i^q), which is φ.
2. V_ℓ(π_A) has characteristic polynomial P_{π_A} (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module).
3. The geometric Frobenius on V_ℓA is V_ℓ(π_A)⁻¹. On the dual H¹ = Hom(V_ℓA, ℚ_ℓ), the contragredient of V_ℓ(π_A)⁻¹ is V_ℓ(π_A)^T (DWP.0/spectra-of-tensor-products-and-duals), with characteristic polynomial P_{π_A}. The isomorphism H¹ ≅ Hom(V_ℓA, ℚ_ℓ) is AbelianSchemesAndArithmeticModuli A4's (Milne 12.1, 12.5).
4. Weights: the eigenvalues on V_ℓA are the inverses of those on H¹.
5. Elliptic curves: P_π(1) = deg(1 − π) = #E(𝔽_q) and P_π(0) = deg π = q.

*Acceptance.*

- E: y² = x³ − x over 𝔽_3: #E(𝔽_3) = 4, a = 0, P_π = T² + 3; on H¹ the geometric Frobenius has eigenvalues ±i√3, weight 1, and on V_ℓE ∓i/√3, weight −1.

*Uses.* `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `AbelianSchemesAndArithmeticModuli:A4`, `ArithmeticGaloisRepresentations:R01.6`, `DeligneWeightsAndPurity:DWP.1`.

*Planet:* Tate module versus H¹.

*Sources.*

- Abelian Varieties, Chapter II, §1, p. 75: “is deﬁned to be the identity” The Frobenius map of a variety over 𝔽_q is the identity on the space and f ↦ f^q on functions.
- Abelian Varieties, Chapter II, §1, proof of Theorem 1.1, p. 76: “Recall (10.20) that a1; :::; a2g can be interpreted as the eigenvalues of” The roots of P_π are the eigenvalues of π on T_ℓA.
- Abelian Varieties, Chapter I, Remark 12.5, p. 56: “is compatible with the natural actions of Gal” The comparison with H¹ is Galois-equivariant.

#### Theorem. Tate modules and H^i of abelian varieties and curves with good reduction are pure and integral

*Module* `TauCeti/Weights/AbelianVariety/GoodReduction.lean`. *Node* `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

Let A be an abelian variety of dimension g over a number field K with good reduction outside a finite set T of finite places, and p a prime. Then ρ = H¹(A_K̄, ℚ_p) = (V_pA)^∨ is pure of weight 1 outside T ∪ {v | p} with integral Frobenius polynomials. At v ∉ T ∪ {v | p}, P_v(ρ, X) = P_{π_{A_v}}(X), the characteristic polynomial of the Frobenius endomorphism of the reduction A_v, independently of p. V_pA itself is pure of weight −1 there and not integral. For 0 ≤ i ≤ 2g, H^i(A_K̄, ℚ_p) = ∧^i H¹ is pure of weight i and integral, with P_v the characteristic polynomial of π_{A_v} on ∧^i. The same holds for H¹ of a smooth projective geometrically connected curve over K with good reduction outside T, through its Jacobian.

*Hypotheses.*

- Good reduction at v ∤ p means that A has an abelian scheme model over O_v (the Néron model, Milne I.17). Néron–Ogg–Shafarevich then makes V_pA unramified at v; the criterion and the specialization isomorphism are NeronModelsAndSemistableAbelianVarieties R11.5's.
- Geometric convention (R34.1). The dual V_pA has weight −1 and Frobenius polynomials with denominators q_v, which is the H¹-versus-Tate-dual distinction that RS-17 asks R34.2 to keep.
- This is the export to FaltingsFinitenessAndIsogenyTheorems R28.4 that RS-17 names, with no Weil II input and no decomposition theorem.

*Proof.*

1. Unramifiedness: at v ∉ T with v ∤ p, A has good reduction, so V_pA is unramified at v (Néron–Ogg–Shafarevich, NeronModelsAndSemistableAbelianVarieties R11.5).
2. Specialization: the reduction map gives a D_v-equivariant isomorphism V_pA ≅ V_p(A_v), under which Frob_v^arith acts as π_{A_v} (R11.5, with the finite-field conventions of the node frobenius-on-tate-modules-and-first-cohomology).
3. So the geometric Frobenius on H¹ has characteristic polynomial P_{π_{A_v}} ∈ ℤ[X] (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-of-an-endomorphism), whose roots are Weil q_v-numbers of weight 1 (DeligneWeightsAndPurity DWP.1/weil-estimate-for-abelian-varieties). It is independent of p, since P_{π_{A_v}} is defined without p.
4. V_pA = (H¹)^∨: weight −1 (R34.1 purity-under-linear-algebra-operations, duals); the roots q_v^{−1/2}·(unit) are not algebraic integers.
5. ∧^i H¹ = H^i(A) (Milne I.12.1): a subquotient of the tensor power H¹^{⊗i}, pure of weight i and integral (R34.1).
6. Curves: H¹(C) = H¹(J) Galois-equivariantly, and J has good reduction outside T when C does (DeligneWeightsAndPurity DWP.1/weights-of-the-cohomology-of-curves).

*Acceptance.*

- E/ℚ: y² = x³ − x has good reduction outside {2}. At ℓ = 3, P_3(H¹, X) = X² + 3: weight 1, integral. On V_pE the polynomial is X² + 1/3.
- det H¹(A) = ∧^{2g}H¹ = ℚ_p(−g): weight 2g, with P_v = X − q_v^g.

*Uses.* `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `NeronModelsAndSemistableAbelianVarieties:R11.5`.

*Planet:* Purity of Tate modules.

*Sources.*

- Diophantine problems and p-adic period mappings, §3.1, (3.2), p. 16: “we denote by ρy the representation of the” The Galois representation on the étale cohomology of a fibre.
- Abelian Varieties, Chapter II, Remark 1.6(a), p. 78: “We have actually proved the following” The characteristic polynomials of π on ∧^r T_ℓA.
- Abelian Varieties, Chapter I, Remark 17.2, p. 70: “is called the N´eron model of A” Good reduction through the Néron model.

#### Theorem. Point counts and traces of Frobenius at good places, and the genus-one agreement

*Module* `TauCeti/Weights/AbelianVariety/GoodReduction.lean`. *Node* `WeightsInEtaleCohomology:R34.2/good-reduction-point-counts-and-traces`.

Let A/K and T be as in purity-of-tate-modules-with-good-reduction, v ∉ T ∪ {v | p} with residue field of size q_v, and α_1, …, α_{2g} the roots of P_v(H¹, X). Then #A_v(𝔽_{q_v^m}) = ∏_i(1 − α_i^m) for all m ≥ 1, and |#A_v(𝔽_{q_v^m}) − q_v^{mg}| ≤ 2g·q_v^{m(g−1/2)} + (2^{2g} − 2g − 1)q_v^{m(g−1)}. For an elliptic curve E/K, Tr(Frob_v^geom | H¹) = a_v := q_v + 1 − #E_v(k_v), and |a_v| ≤ 2√q_v, in agreement with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

*Hypotheses.*

- The point counts are those of the reduction A_v over k_v. They are imported from DeligneWeightsAndPurity DWP.1 (point-counts-of-abelian-varieties, compatibility-with-the-hasse-bound), not reproved.
- The trace a_v is of the geometric Frobenius on H¹. On V_pE the trace is a_v/q_v.

*Proof.*

1. P_v(H¹, X) = P_{π_{A_v}}(X) (node purity-of-tate-modules-with-good-reduction).
2. DWP.1/point-counts-of-abelian-varieties applied to A_v over k_v gives the counts and the bound.
3. For g = 1: P_{π}(X) = X² − a_vX + q_v with a_v = q_v + 1 − #E_v(k_v) (DWP.1/compatibility-with-the-hasse-bound), and the trace of the geometric Frobenius on H¹ is a_v.

*Acceptance.*

- E/ℚ: y² = x³ − x at ℓ = 5: #E(𝔽_5) = 8, so a_5 = −2 and |−2| ≤ 2√5.

*Uses.* `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

*Sources.*

- Abelian Varieties, Chapter II, proof of Theorem 1.1, p. 76: “The Riemann hypothesis shows that each term” The bound on #A(𝔽_{q^m}).

## R34.3 Nearby and vanishing cycles

No nodes yet.

### What is missing

- Not planned in checkpoint 1: the arithmetic degeneration adapter over LefschetzPencilsAndVanishingCycles LPV.0–LPV.2 and LPV.7 (RS-17 keeps).

## R34.4 Geometric reduction and monodromy

No nodes yet.

### What is missing

- Not planned in checkpoint 1: the pencil hypothesis adapter over LPV.3–LPV.5 and EDC.4.

## R34.5 Weil I and the required Weil II results

No nodes yet.

### What is missing

- Not planned in checkpoint 1. RS-17 moves the Weil II theorems of the integrated decomposition's R34.5 nodes (3.3.1, 3.3.3–3.3.6, 3.4.1) to DeligneWeightsAndPurity DWP.7–DWP.8. R34.5 keeps the arithmetic realization: Kuga–Sato and weight-two Jacobian cohomology, projectors, and Hecke and Galois actions.

## R34.6 Purity applications and comparison

No nodes yet.

### What is missing

- Not planned in checkpoint 1: the eigenform and local–global export over DWP.10 and R34.5.

## Requests to other roadmaps

- `ArithmeticGaloisRepresentations:R01.1` — Continuous representations of the absolute Galois group of a number field on finite-dimensional ℚ_p- (and E-) vector spaces, with finite Galois factorization and invariant lattices. Needed by `arithmetic-and-geometric-frobenius`.
- `ArithmeticGaloisRepresentations:R01.2` — Decomposition and inertia groups at a finite place for G_K (independent of the choice of place above), unramified representations, the Frobenius class modulo inertia, and the relation Frob_u = Frob_v^{f(u|v)} for a finite extension, with Mackey's formula for induced representations at a decomposition group. Needed by `arithmetic-and-geometric-frobenius`, `purity-under-restriction-and-induction`.
- `ArithmeticGaloisRepresentations:R01.6` — The ℓ-adic Tate module T_ℓA of an abelian variety over a finite field, with its Galois action, and the Frobenius endomorphism π_A acting on it. Needed by `frobenius-on-tate-modules-and-first-cohomology`.
- `AbelianSchemesAndArithmeticModuli:A4` — For an abelian variety A over a field k and ℓ ≠ char k: the Galois-equivariant isomorphism H¹_ét(A_{k^sep}, ℤ_ℓ) ≅ Hom(T_ℓA, ℤ_ℓ) (Milne, Abelian Varieties, 12.1 and 12.5). Needed by `frobenius-on-tate-modules-and-first-cohomology`.
- `DeligneWeightsAndPurity:DWP.1` — The Weil estimate for abelian varieties over 𝔽_q: every root of P_{π_A} has absolute value q^{1/2} at every complex embedding (H¹ pure of weight 1). Needed by `frobenius-on-tate-modules-and-first-cohomology`.
- `NeronModelsAndSemistableAbelianVarieties:R11.5` — The Néron–Ogg–Shafarevich criterion (an abelian variety over a number field with good reduction at v ∤ p has V_pA unramified at v), and the D_v-equivariant specialization isomorphism V_pA ≅ V_p(A_v), under which the arithmetic Frobenius acts as the Frobenius endomorphism of A_v. Needed by `purity-of-tate-modules-with-good-reduction`.

## Library baseline

- `IsArithFrobAt` (Mathlib/RingTheory/Frobenius.lean) — σ ∈ G is an arithmetic Frobenius at a prime Q of S (G finite acting on S with fixed ring R) if σx ≡ x^{#(R/Q∩R)} mod Q.
- `IsArithFrobAt.mul_inv_mem_inertia` (Mathlib/RingTheory/Frobenius.lean) — Two arithmetic Frobenius elements at Q differ by an element of the inertia subgroup of Q.
- `IsArithFrobAt.conj` (Mathlib/RingTheory/Frobenius.lean) — If σ is a Frobenius at Q, then τστ⁻¹ is a Frobenius at τ • Q: conjugacy across the primes above v.

## Sources

- Pierre Deligne, *La conjecture de Weil. I*. Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR (printed page = PDF page + 271). https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf (SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`). Read: cc-fb70e5, 2026-09-29: §1 (1.13)–(1.15), pp. 278–279.
- Pierre Deligne, *La conjecture de Weil. II*. Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135). https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf (SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`). Read: cc-fb70e5, 2026-09-29: (1.1.10)–(1.1.15), pp. 151–153; §1.2 (1.2.1)–(1.2.8), pp. 153–155.
- Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period mappings*. arXiv:1807.02721v3 (25 Oct 2019; published in Invent. Math. 221 (2020)); printed page = PDF page. https://arxiv.org/abs/1807.02721 (SHA-256 `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`). Read: cc-fb70e5, 2026-09-29: §2.3–§2.5, pp. 9–14 (Lemmas 2.3–2.10); cc-fb70e5, 2026-09-29 (checkpoint 2): §3.1–§3.2, pp. 15–16.
- J. S. Milne, *Abelian Varieties*. Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6. https://www.jmilne.org/math/CourseNotes/AV.pdf (SHA-256 `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`). Read: cc-fb70e5, 2026-09-29: Chapter I §12, pp. 54–56; Chapter II §1, pp. 75–78; cc-fb70e5, 2026-09-29 (checkpoint 2): Chapter I §17, pp. 69–71.

## Non-goals

- A second Weil-number, ι-weight or mixed-sheaf carrier: these are DeligneWeightsAndPurity's.
- Any purity theorem: this roadmap transports supplied purity to arithmetic objects and checks conventions.
