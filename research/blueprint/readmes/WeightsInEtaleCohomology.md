# Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications

This roadmap supplies arithmetic comparison contracts for the objects used by Faltings finiteness and by the Galois representations of eigenforms. The fundamental weights library is [DeligneWeightsAndPurity](DeligneWeightsAndPurity.md), the first prerequisite under accepted RS-17. A user of this Part II starts with an actual arithmetic representation, good-reduction model, pencil or Hecke realization and obtains the precise weight statement that its arithmetic construction needs. Definitions of Weil numbers, mixed sheaves, nearby cycles, pencils and compatible systems are imported from their owners.

All six stages R34.1–R34.6 are planned at target level. The packet has 27 nodes: two definitions and 25 theorems, with nine definition API items, nine discriminating unit tests and 22 planets. All implementation statuses remain unchecked. The planning pass is complete; no stage is closed. Five explicit gaps and 23 supplier requests identify the proof interiors and geometric interfaces that independent review and the resulting follow-up jobs must resolve. Target coverage does not certify those proofs.

The six stages form two paths. R34.1's numerical representation conventions and R34.2's curve/abelian-variety comparisons provide an early export to FaltingsFinitenessAndIsogenyTheorems R28.4 and MordellLawrenceVenkatesh LV.1 using only DWP.0 and DWP.1. The sheaf and mixed-complex comparison nodes inside R34.1 are separate branches: that early export does not import Weil II, relative hard Lefschetz, the decomposition theorem or local weight–monodromy. R34.3–R34.6 supply the arithmetic degeneration, pencil, parabolic/projector and eigenform applications of the corresponding geometric theories.

## Conventions and ownership

Throughout, the geometric Frobenius is the inverse of the arithmetic field automorphism x↦x^q. For an unramified representation ρ at v, write P_v(ρ,X)=det(X−ρ(Frob_v^geom)). The cyclotomic representation Q_l(1) has geometric eigenvalue q_v^(−1) and weight −2. On the dual representation the geometric roots are inverted, so switching to the arithmetic convention negates the weight. The polynomial det(1−FT) appearing in the sources is related to this monic characteristic polynomial by T^d P(F,T^(−1)); the degree and convention must accompany every comparison.

Algebraicity, algebraic integrality, rational integer coefficients and purity are four separate assertions. All-embeddings purity requires eigenvalues algebraic over Q and every complex conjugate of norm q^(w/2). Chosen-embedding purity controls the image under one specified embedding and can hold even for a transcendental eigenvalue. A polynomial in Z[X] has algebraic-integer roots, but a factor over a coefficient field need not have rational coefficients. A monic factor in Q[X] of an integer polynomial is integral; divisibility in E[X] alone is insufficient. For example X²−2 factors as (X−√2)(X+√2), whose individual factors are not in Z[X].

For an abelian variety, H¹ is the Galois-equivariant dual of its rational Tate module. The arithmetic Frobenius on the Tate module is the Frobenius endomorphism π of the reduction; the geometric Frobenius on H¹ has π's characteristic polynomial. Consequently H¹ has geometric weight +1 and the Tate module has weight −1. Statements using the opposite convention must say so. Rank zero is pure of every weight and has polynomial 1, so both uniqueness of weight and nonintegrality of a negative-weight Tate module need a nonzero-rank hypothesis.

Weights for complexes use cohomological indexing. On smooth X and with lisse cohomology sheaves, a complex K of weight w has H^i(K) of weight w+i. Thus a sheaf F of weight r gives F[a](b) of weight r+a−2b; the shift contribution has a plus sign. The dualizing complex is Q_l(d)[2d]. Absolute hard Lefschetz over a finite field must restore the Tate twists that Weil II §4.1 suppresses after a choice over an algebraic closure.

Accepted RS-17 assigns finite-field weights and their linear algebra to DWP.0, curve/abelian estimates to DWP.1, Weil I induction to DWP.2–DWP.4, sheaf predicates and Weil II bounds to DWP.5–DWP.8, and hard Lefschetz/transport to DWP.9–DWP.10. LPV owns nearby cycles and Lefschetz pencils; EDC owns duality, classes and the geometric cohomology comparisons used by those pencils. This roadmap checks their arithmetic hypotheses on specified models.

RT-AREA-langlands-2/10 gives generic compatible systems and their operations to PotentialModularityAndCompatibleSystems R24.5:operations. R34.6 provides the common good-prime polynomial for one fixed eigenform, and R19.3 consumes its fixed-source purity/local exports. Two graph boundaries are essential: R34.5 imports only R19.1/parabolic-realisation-premotive, because R19.1's aggregate eigenform construction already needs R34.5; R34.3 imports CohomologyComparisons CP.4 and exports its model verification to PadicHodgeTheory R06.5, rather than importing that application in reverse.

The reviewed audit labels the old R34.3 and R34.4 import-only prose as process. It supplies no mathematical nodes for that prose. RS-17 expressly retains actual arithmetic trait/model and descended-pencil hypothesis comparisons, which are the targets below; the packet proposes removing the process portions while retaining those comparison contracts. Nothing in the pinned libraries supplies their advanced geometric interfaces. The existing finite ring-action Frobenius API and ordinary representation/characteristic-polynomial APIs are baseline citations, not newly planned results.

## Pinned baseline and prototype boundary

The checked commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read at the Mathlib pin. Tau Ceti's elliptic Hasse bound and cohomological trace are reached through DWP.1 and the SF.2 supplier contract; no missing advanced weight theorem is attributed to a similarly named library declaration.

| Existing declaration | What it provides |
| --- | --- |
| `mathlib:IsArithFrobAt` | For a monoid acting on an R-algebra S and fixing R, σ is arithmetic Frobenius at Q if σ•x≡x^q mod Q for every x, where q=#(R/(Q∩R)). The definition does not itself require a finite group. |
| `mathlib:IsArithFrobAt.mul_inv_mem_inertia` | Two arithmetic Frobenius elements at Q differ by an element of the inertia subgroup of Q. |
| `mathlib:IsArithFrobAt.conj` | If σ is a Frobenius at Q, then τστ⁻¹ is a Frobenius at τ • Q: conjugacy across the primes above v. |
| `mathlib:IsArithFrobAt.exists_of_isInvariant` | For a finite group G acting on S with invariant algebra R, a prime Q with finite S/Q has an arithmetic Frobenius element; integrality follows from invariant-ring finiteness rather than being a separate hypothesis. |
| `mathlib:Representation` | A representation is a monoid homomorphism G→*Module.End E V, with no unrequested continuity assumption. |
| `mathlib:Representation.dual` | The contragredient sends g to the transpose of ρ(g⁻¹). |
| `mathlib:Representation.ofDistribMulAction` | A compatible distributive group action produces a linear representation; the scalar units action gives the rank-one test instance. |
| `mathlib:LinearMap.charpoly` | Characteristic polynomial on finite free finite modules, using the chosen basis; applied to the Frobenius action. |
| `mathlib:Matrix.charpoly` | For a square matrix over a commutative ring with a finite decidable index, det(XI−M). Used in inverse-companion and induced-representation prototypes. |

The [suggested file](../suggested/WeightsInEtaleCohomology.lean) elaborates against the pinned Mathlib. It uses actual representation, polynomial and matrix carriers. Its inertia, Frobenius lift and residue cardinality are supplied parameters, so the definitions are usable root-level prototypes; the full continuous Galois/local-place interface still belongs to R01.1–R01.2. The rank-one tests use the scalar units action at q=3, the elliptic test uses the inverse companion matrix, and the rank-zero test has empty spectrum. They distinguish conventions and predicates without pretending to construct an arithmetic scheme. The full geometric signatures are omitted and enumerated in the signature gap, including actual Tate modules and their specialization. Numerical cores accompanying a theorem do not constitute a signature of its geometric statement.

## R34.1 Frobenius, algebraicity and representation weights

Start with the decomposition group at a finite place. The Frobenius polynomial is independent of a lift once inertia acts trivially, and independent of a place above v by conjugacy. This gives the representation predicates needed by the Faltings consumer. Their API must expose the convention switch, inverse roots, conjugacy and enlargement of the exceptional set. Weight uniqueness additionally needs a nonzero representation and a place outside the exceptional set.

The stability statements transport DWP.0's spectral algebra to unramified representations. Restriction raises both Frobenius and the residue cardinality to the residue degree. Induction uses the local cyclic-block polynomial, so its roots have the original weight over q_v, rather than that weight multiplied by the extension degree. Arbitrary continuous characters demonstrate why algebraicity is a hypothesis. The lisse-sheaf and mixed-complex nodes import DWP.5 and DWP.8 only for their own branches.

### Definition: Arithmetic and geometric Frobenius, and the Frobenius polynomial of a Galois representation

Node `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`.

For a finite field k = 𝔽_q with algebraic closure k̄, the arithmetic Frobenius φ ∈ Gal(k̄/k) is x ↦ x^q and the geometric Frobenius is F = φ⁻¹; either one topologically generates Gal(k̄/k). Let K be a number field, v a finite place with residue field of size q_v, and ρ : G_K → GL(V) a continuous representation on a finite-dimensional vector space over a field E of characteristic 0, unramified at v. Then ρ(Frob_v^geom) is well defined up to conjugacy, where Frob_v^geom is any element of a decomposition group at v mapping to F. So is its characteristic polynomial P_v(ρ, T) = det(T − ρ(Frob_v^geom)). The arithmetic polynomial det(T − ρ(Frob_v^arith)) has the inverse roots, and equals P_v(ρ^∨, T) for the contragredient ρ^∨.

**Hypotheses and conventions.**

- Weights in this roadmap and in DeligneWeightsAndPurity use the geometric Frobenius (Weil I (1.15)). With the arithmetic convention every weight changes sign; ℚ_ℓ(1) has geometric weight −2 and arithmetic weight +2.
- Unramified at v means that the inertia group at v acts trivially. Without it ρ(Frob_v) depends on the choice of Frobenius modulo inertia.
- Changing the place above v or the decomposition group conjugates ρ(Frob_v^geom), so only its conjugacy class and characteristic polynomial are defined.

**Proposed API.**

- `TauCeti.Weights.GaloisRep.frobCharpoly` (constructor): frobCharpoly ρ v (hv : ρ.IsUnramifiedAt v) : E[X] := charpoly (ρ (Frob_v^geom)), independent of the choices.
- `TauCeti.Weights.GaloisRep.frobCharpoly_arith` (compatibility): charpoly (ρ (Frob_v^arith)) = frobCharpoly ρ^∨ v.
- `TauCeti.Weights.GaloisRep.frobCharpoly_roots_inv` (characterisation): The roots of charpoly (ρ (Frob_v^arith)) are the inverses of those of frobCharpoly ρ v.
- `TauCeti.Weights.GaloisRep.frobCharpoly_conj` (simp): frobCharpoly (g • ρ) v = frobCharpoly ρ v for conjugate representations.

**Consumers.**

- `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`: purity and integrality are conditions on P_v(ρ, T).
- `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`: geometric Frobenius on H¹ against the Frobenius endomorphism.
- `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`: Frob_v^geom in the purity hypothesis.
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`: Frobenius polynomials of Tate modules at good primes.

**Definition unit tests.** Each is represented by a named example in the suggested file; arithmetic statements use the numerical instances described above.

- `TauCeti.Weights.frobCharpoly_cyclotomic` (computation): P_v(ℚ_ℓ(1), T) = T − q_v⁻¹ for v ∤ ℓ: the cyclotomic character sends Frob_v^arith to q_v.
- `TauCeti.Weights.frobCharpoly_trivial` (degenerate): For the trivial representation of rank d, P_v = (T − 1)^d at every v.
- `TauCeti.Weights.not_unramified_scalar_inertia` (non-example): In the scalar representation of C×, full inertia acts nontrivially. Taking geometric lift 3 and inertia element 2 changes X−3 to X−6. This is the local algebraic obstruction underlying cyclotomic ramification at the coefficient prime.
- `TauCeti.Weights.frobCharpoly_arith_elliptic` (computation): For E with good reduction at v ∤ ℓ, the arithmetic Frobenius on H¹ = V_ℓ(E)^∨ has characteristic polynomial T² − (a_v/q_v)T + 1/q_v, the inverse roots of T² − a_vT + q_v.

**Construction/proof contract.**

1. For a finite Galois extension through which a finite quotient of ρ factors, Frobenius elements exist (mathlib:IsArithFrobAt.exists_of_isInvariant). Two of them differ by inertia (mathlib:IsArithFrobAt.mul_inv_mem_inertia), and they are conjugate across the primes above v (mathlib:IsArithFrobAt.conj).
2. For the continuous ρ of G_K, the Frobenius class modulo inertia and the independence of choices come from ArithmeticGaloisRepresentations R01.1–R01.2 (continuous representations; decomposition and inertia groups).
3. Geometric Frobenius is the inverse of the arithmetic one, so the characteristic polynomials have inverse roots, and (ρ(g)⁻¹)^* on V^* computes the contragredient (DWP.0/spectra-of-tensor-products-and-duals).

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `mathlib:IsArithFrobAt`, `mathlib:IsArithFrobAt.mul_inv_mem_inertia`, `mathlib:IsArithFrobAt.conj`, `mathlib:IsArithFrobAt.exists_of_isInvariant`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `mathlib:Representation`, `mathlib:Representation.dual`, `mathlib:LinearMap.charpoly`.

**Acceptance.**

- The ℓ-adic cyclotomic character χ_ℓ satisfies χ_ℓ(Frob_v^arith) = q_v for v ∤ ℓ, so P_v(ℚ_ℓ(1), T) = T − q_v⁻¹.
- For an elliptic curve E/K with good reduction at v ∤ ℓ: P_v(H¹, T) = T² − a_vT + q_v on H¹ = V_ℓ(E)^∨, and P_v(V_ℓE, T) = T² − (a_v/q_v)T + 1/q_v.

**Planet:** Arithmetic and geometric Frobenius.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1, (1.15), p. 279. The geometric Frobenius is the inverse of the substitution x ↦ x^q.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1, (1.1.13), p. 152. The Frobenius at a point of degree d maps to the d-th power.

### Definition: Galois representations pure of weight w, and with integral Frobenius polynomials, outside T

Node `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`.

Let K be a number field, T a finite set of finite places, and ρ : G_K → GL(V) a continuous representation on a finite-dimensional ℚ_p-vector space (or over a finite extension E of ℚ_p). ρ is pure of weight w outside T if it is unramified at every finite v ∉ T and, for each such v, every root of P_v(ρ, T) is a Weil q_v-number of weight w. Equivalently, (V ⊗ Ē, ρ(Frob_v^geom)) is pure of weight w relative to q_v in the sense of DWP.0. ρ has integral Frobenius polynomials outside T if P_v(ρ, T) ∈ ℤ[T] for every v ∉ T. For a field embedding ι : Ē → ℂ, ρ is ι-pure of real weight w outside T if the eigenvalues of every ρ(Frob_v^geom), v ∉ T, have ι-weight w relative to q_v.

**Hypotheses and conventions.**

- The geometric Frobenius convention of the node arithmetic-and-geometric-frobenius is used; the arithmetic convention negates w.
- Integrality is a separate predicate. ℚ_p(1) is pure of weight −2 outside {v | p}, and its Frobenius polynomials T − q_v⁻¹ are not integral.
- Places above p are allowed outside T only if ρ is unramified there. For ℚ_p(n), n ≠ 0, T must contain the places above p.

**Proposed API.**

- `TauCeti.Weights.GaloisRep.IsPureOutside` (data): IsPureOutside ρ T w : Prop := ∀ v ∉ T, ρ.IsUnramifiedAt v ∧ IsPure (q_v : ℝ) w (ρ (Frob_v^geom)).
- `TauCeti.Weights.GaloisRep.HasIntegralFrobOutside` (data): HasIntegralFrobOutside ρ T : Prop := ∀ v ∉ T, ∃ P : ℤ[X], (P.map (Int.castRingHom E)) = frobCharpoly ρ v.
- `TauCeti.Weights.GaloisRep.IsIotaPureOutside` (data): IsIotaPureOutside ρ T ι w : Prop, the ι-weight version with w : ℝ.
- `TauCeti.Weights.GaloisRep.IsPureOutside.mono` (compatibility): T ⊆ T′ → IsPureOutside ρ T w → IsPureOutside ρ T′ w.
- `TauCeti.Weights.GaloisRep.IsPureOutside.weight_unique` (characterisation): If V is nonzero and there is a place v outside T (automatic for a number field and finite T), IsPureOutside ρ T w and IsPureOutside ρ T w′ imply w=w′. Zero representations are pure of every weight.

**Consumers.**

- `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`: stability of the predicates.
- `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`: change of field.
- `MordellLawrenceVenkatesh:LV.1/faltings-finiteness`: Faltings' finiteness for pure integral representations.
- `MordellLawrenceVenkatesh:LV.1/hodge-weight-pure-representation`: the purity hypothesis.
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`: pure integral Tate modules.

**Definition unit tests.** Each is represented by a named example in the suggested file; arithmetic statements use the numerical instances described above.

- `TauCeti.Weights.isPureOutside_tate` (computation): ℚ_p(n) is pure of weight −2n outside the places above p.
- `TauCeti.Weights.isPureOutside_trivial` (degenerate): The trivial representation is pure of weight 0 outside ∅, with integral Frobenius polynomials.
- `TauCeti.Weights.not_integral_tate_one` (non-example): ℚ_p(1) is pure of weight −2 but not integral: P_v = T − q_v⁻¹. Purity does not imply integrality.
- `TauCeti.Weights.not_isPureOutside_sum` (non-example): ℚ_p ⊕ ℚ_p(1) is pure of no weight: its eigenvalues have weights 0 and −2.
- `TauCeti.Weights.isPureOutside_zero` (degenerate): The rank-zero representation is pure of every integer weight and its Frobenius polynomial is 1.

**Construction/proof contract.**

1. Purity: apply DWP.0/endomorphism-weights to ρ(Frob_v^geom) at each v ∉ T with base q_v. It is well defined because the characteristic polynomial is (node arithmetic-and-geometric-frobenius).
2. Integrality: P_v(ρ, T) ∈ ℤ[T]. When P_v has rational coefficients, this holds exactly when every root is an algebraic integer, since P_v is monic.
3. ι-purity: DWP.0/iota-weight on each eigenvalue.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `mathlib:Representation.ofDistribMulAction`.

**Acceptance.**

- ℚ_p(n) is pure of weight −2n outside {v | p}. It has integral Frobenius polynomials exactly when n ≤ 0.
- For an elliptic curve over K with good reduction outside T, H¹ is pure of weight 1 and integral outside T together with the places above p; its Tate module has geometric weight −1.

**Planet:** Pure Galois representations.

**Source passages.**

- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.3, Lemma 2.3, p. 9. Pure of weight w: all roots of the Frobenius polynomial are algebraic of absolute value q_℘^{w/2}.
- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.3, Lemma 2.3, p. 9. Unramified outside a finite set.

### Theorem: Purity and integrality under subquotients, sums, duals, tensor products, determinants and Tate twists

Node `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`.

Let ρ and ρ′ be finite-dimensional continuous E-adic representations, unramified outside T and pure there of weights w and w′. A subrepresentation and its quotient are pure of weight w; conversely, in an exact sequence of representations already unramified outside T, purity of both endpoints of weight w implies purity of the middle. Direct sums of equal weight have that weight; the contragredient has weight −w, the tensor product weight w+w′, the determinant weight w dim V, and ρ(n) weight w−2n outside T together with the places above the coefficient prime. Integer Frobenius polynomials are preserved by direct sums, tensor products, determinants and nonpositive Tate twists. They pass to subquotients provided those subquotient Frobenius polynomials have rational coefficients. Without that rationality only algebraic integrality of the eigenvalues passes to a factor. Duals and positive twists need not preserve integrality.

**Hypotheses and conventions.**

- All representations in the exact-sequence converse are unramified outside T: unramified endpoints alone do not ensure an unramified extension.
- Integer polynomial means rational coefficients that lie in Z, distinct from coefficients integral over Z in a coefficient number field.
- The monic subquotient factors must belong to Q[X] before applying Gauss’s lemma; divisibility in E[X] is insufficient.

**Construction/proof contract.**

1. Purity is checked eigenvalue by eigenvalue at each v ∉ T: DWP.0/purity-under-subquotients-and-extensions for subquotients and sums, DWP.0/spectra-of-tensor-products-and-duals for ⊗, contragredient and det, and DWP.0/twisting-by-rank-one-characters for twists.
2. Integer polynomial implies algebraic-integer roots. Products and elementary symmetric functions give integral roots for tensor products and determinants. Subquotient roots form a submultiset; rational coefficients are an additional requirement for a polynomial in Z[X].
3. Gauss's lemma: a monic factor in ℚ[T] of a monic polynomial in ℤ[T] lies in ℤ[T].

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`.

**Acceptance.**

- H¹(E) ⊗ H¹(E) of an elliptic curve is pure of weight 2 and integral. Its dual is pure of weight −2 and is not integral.
- det H¹(E) = ℚ_p(−1): weight 2 = 1·2, integral.
- Over Q(√2), diag(√2,−√2) has integer polynomial X²−2, but either invariant line has polynomial X∓√2, which is not in Z[X].

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154. Weights add under tensor product.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154. The dual of a pure object of weight n has weight −n.
- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.4, p. 13. Purity passes to subrepresentations.

### Theorem: Purity and integrality under restriction to G_L and induction from G_L

Node `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`.

Let L/K be a finite extension of number fields and T a finite set of places of K. (i) If ρ is pure of weight w outside T, then ρ|G_L is pure of weight w outside the set T_L of places above T, with integral Frobenius polynomials if ρ has them. (ii) If ρ is a representation of G_L pure of weight w outside T_L, then Ind_{G_L}^{G_K} ρ is pure of weight w outside T ∪ {v ramified in L}, with integral Frobenius polynomials if ρ has them. Here P_v(Ind ρ, T) = ∏_{u | v} P_u(ρ, T^{f(u|v)}) for v unramified in L and outside T.

**Hypotheses and conventions.**

- Restriction: compatible Frobenius classes satisfy Frob_u^geom=(Frob_v^geom)^{f(u|v)} modulo inertia, hence after applying an unramified ρ, and q_u=q_v^{f(u|v)}.
- Induction needs v unramified in L, so that Ind ρ is unramified at v; the ramified places are added to T.

**Construction/proof contract.**

1. Restriction: ρ(Frob_u^geom) = ρ(Frob_v^geom)^{f}, and pure of weight w relative to q_v implies pure of weight w relative to q_v^f (DWP.0/finite-field-base-extension-of-weights). Integral polynomials stay integral, since the roots are powers of algebraic integers.
2. Induction, Frobenius formula: by Mackey's formula over the double cosets D_v \ G_K / G_L, which correspond to the places u | v, the restriction of Ind ρ to D_v is ⊕_u Ind_{D_u}^{D_v} ρ|D_u. On each summand Frob_v acts as a cyclic block whose f-th power is Frob_u, so the characteristic polynomial is P_u(ρ, T^{f}) (ArithmeticGaloisRepresentations R01.2 for decomposition groups).
3. Weights: the roots of P_u(ρ, T^f) are the f-th roots β of the roots α of P_u. From |β|^f = |α| = q_u^{w/2} = q_v^{fw/2} one gets |β| = q_v^{w/2} for every complex conjugate (DWP.0/weil-number-base-extension). β is algebraic, and integral if α is.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `ArithmeticGaloisRepresentations:R01.2`.

**Acceptance.**

- K = ℚ, L = ℚ(i), ρ the trivial character of G_L: Ind ρ = 1 ⊕ χ_{−4}, pure of weight 0 outside {2}. At p ≡ 3 mod 4, P_p = T² − 1 = P_u(1, T²), with one place u of degree 2.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(i), p. 154. Stability under inverse image and finite direct image: restriction and induction.
- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.5, proof of Lemma 2.10, p. 14. Purity used for an induced representation.

### Theorem: Finite dimensionality implies neither algebraicity nor purity

Node `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`.

Let k = 𝔽_q and ℓ ∤ q. For every u ∈ ℤ_ℓ^× there is a unique continuous character χ_u : Gal(k̄/k) → ℤ_ℓ^× with χ_u(F) = u. ℤ_ℓ^× contains elements transcendental over ℚ. For such u, (ℚ_ℓ, χ_u) is a continuous one-dimensional representation whose Frobenius eigenvalue is not algebraic, so it is pure of no weight, although it is ι-pure of the real weight 2 log_q |ι(u)| for each ι. For ℓ odd, u = 2 and q an odd prime, χ_u is algebraic but pure of no integer weight.

**Hypotheses and conventions.**

- This is R34.1's acceptance statement: purity and algebraicity are theorems about particular representations (DWP), not consequences of continuity and finite dimension.
- u must be an ℓ-adic unit for continuity on the compact group Gal(k̄/k). A Weil-group representation (Weil II (1.1.10)) allows any u ∈ ℚ̄_ℓ^×.

**Construction/proof contract.**

1. Gal(k̄/k) ≅ Ẑ, topologically generated by F. n ↦ u^n extends continuously to Ẑ because ℤ_ℓ^× is profinite: u^{(ℓ−1)ℓ^m} → 1 as m → ∞, and ℤ_ℓ^× ≅ μ_{ℓ−1} × (1 + ℓℤ_ℓ) for ℓ odd.
2. ℤ_ℓ^× is uncountable and the algebraic numbers are countable, so transcendental units exist; for instance 1 + ℓt with t ∈ ℤ_ℓ transcendental.
3. A Weil q-number is algebraic (DWP.0/weil-q-number), so χ_u is pure of no weight. Its ι-weight is defined for every ι (DWP.0/iota-weight).
4. u = 2: if |2| = q^{w/2} with q an odd prime, then 4 = q^w, impossible for integer w.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/iota-weight`.

**Acceptance.**

- u = 1 + ℓ is algebraic (rational) and has ι-weight 2 log_q(1 + ℓ) for every ι; it is pure of no weight unless 1 + ℓ is a power of √q.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154. Algebraicity is a consequence of purity at every ι, and fails without it.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Variante (1.2.3), p. 154. The weight terminology for representations of Gal(k̄/k).

### Theorem: Purity against a chosen embedding versus all embeddings

Node `WeightsInEtaleCohomology:R34.1/purity-at-every-embedding-versus-a-chosen-embedding`.

Let ρ be as in pure-and-integral-galois-representations, with coefficients in ℚ̄_p. (i) ρ is pure of weight w outside T iff it is ι-pure of weight w outside T for every field isomorphism ι : ℚ̄_p ≅ ℂ. (ii) If every P_v(ρ, T), v ∉ T, has coefficients in a number field E ⊂ ℚ̄_p, then ρ is pure of weight w outside T iff, for every embedding σ : E → ℂ, all roots of σ(P_v(ρ, T)) have absolute value q_v^{w/2}. (iii) ι-purity for one ι implies neither: it constrains only the embedding ι|_E.

**Hypotheses and conventions.**

- (i) needs #ℚ̄_p = 𝔠, which DWP.0/embeddings-into-the-complex-numbers proves.
- (ii) is the form in which purity is checked for compatible systems with coefficients in a number field.

**Construction/proof contract.**

1. (i): apply DWP.0/weil-number-iff-iota-pure-for-every-iota to each eigenvalue at each v ∉ T.
2. (ii): the roots of P_v lie in a finite extension of E. Their complex conjugates are the roots of σ(P_v) for the embeddings σ, so this is the definition of a Weil q_v-number (DWP.0/weil-q-number).
3. (iii): take P_v = T − (1 + √2) with E = ℚ(√2). An ι with ι(√2) = √2 gives ι-weight 2 log_{q_v}(1 + √2); one with ι(√2) = −√2 gives the negative. 1 + √2 is not a Weil number, so no single ι decides purity. When P_v has rational coefficients, a single ι already sees every conjugate.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`.

**Acceptance.**

- For H¹ of an elliptic curve with CM by E = ℚ(i), P_v has coefficients in ℚ ⊂ E, and the check over the two embeddings of E reduces to one.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154. Purity for every ι gives algebraicity and all-embeddings purity.

### Theorem: The representation–sheaf weight comparison

Node `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`.

For a normal connected model U over Z[1/p] of a number field K, let a continuous E-adic representation ρ of π₁(U) correspond to a lisse sheaf F. At a closed point v, the geometric Frobenius characteristic polynomial of F_v is P_v(ρ). Thus F is pointwise pure of weight w exactly when ρ has weight w at all these points; the analogous equivalence holds for a chosen embedding and for algebraic-integral eigenvalues. On a finite-field fibre, a point of degree d uses F^d and q^d, leaving w unchanged.

**Hypotheses and conventions.**

- The model and its π₁ factorisation are part of the input; unramified outside T is not silently identified with a lisse extension over an arbitrary singular model.
- The sheaf weights are DWP.5’s existing definitions; the rational integer-polynomial condition is stronger than sheaf integrality.

**Construction/proof contract.**

1. Use the lisse-sheaf/continuous-representation equivalence at the geometric generic point, and identify the stalk action of its decomposition group.
2. Apply the Frobenius inverse convention and DWP.0 finite-field-base-extension-of-weights point by point.
3. Translate DWP.5’s predicates using equality of the characteristic polynomials; no semisimplicity is used.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.5`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- The constant rank-one sheaf has weight 0; Q_p(1) has weight −2 on its prime-to-p model; neither convention is reversed at degree-d points.

**Planet:** Representation and sheaf weights.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.1 (1.1.13), p. 152; §1.2 (1.2.2)–(1.2.3), pp. 153–154. The representation and sheaf weight terminology agrees under Frobenius stalks.

### Theorem: Cohomological shifts and arithmetic weights

Node `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`.

Let X₀ be smooth of dimension d over F_q and K a bounded constructible adic complex whose cohomology sheaves are lisse. With D_XK=RHom(K,Q_l(d)[2d]), K is pure of complex weight w if and only if H^i(K) is pointwise pure of weight w+i for every i. In particular F[a](b) has weight r+a−2b when F is lisse pointwise pure of weight r; F(d)[d] has weight r−d, and F(N)[2N] has weight r. Upper weight bounds shift by the same formula; lower bounds use Verdier duality.

**Hypotheses and conventions.**

- This is the lisse-on-smooth comparison in Weil II (6.2.5)(b), not an assertion about arbitrary singular supports or pointwise lower bounds of all constructible complexes.
- DWP.8 owns the complex predicates; this extension is absent from the early R34.1/R34.2 prerequisite path.

**Construction/proof contract.**

1. Import DWP.8’s definition: upper weight w bounds H^i by w+i; lower weight w is upper weight −w on D_XK.
2. On a smooth d-fold identify the dualizing complex through EDC.2; for lisse sheaves use dual weight −r and twist weight −2d.
3. Compute H^i(K[a](b))=H^{i+a}(K)(b), which gives the displayed shift r+a−2b.

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.8`, `EtaleDualityAndPerverseSheaves:EDC.2`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`.

**Acceptance.**

- A weight-0 constant sheaf on a smooth curve, shifted by [1], has complex weight 1; adding (1) changes it to −1.
- The normalization F(N)[2N] keeps its complex weight.

**Planet:** Shifted cohomological weights.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §6.2 (6.2.1)–(6.2.5)(b), p. 247. On smooth X, complexes with lisse cohomology are pure iff their H^i have pointwise weight w+i.

## R34.2 Curves, abelian varieties and the early Faltings export

The main comparison identifies geometric Frobenius on H¹ with the Frobenius endomorphism of the good reduction, by combining smooth proper base change and Tate-module duality. DWP.1 supplies the Weil estimate and integer, coefficient-independent endomorphism polynomial. Higher cohomology uses the actual exterior-power comparison. This route does not depend on the geometric comparison and local monodromy stages R34.3–R34.6.

For an abelian variety, counts over every residue extension are products of 1−α_i^m. For a curve they are the alternating trace 1+q^m−Σα_i^m; the Jacobian comparison relates these two H¹ spectra. The genus-one recurrence supplies a convention-sensitive check: y²=x³−x over F_5 has eight points, trace −2, second-power trace −6 and 32 points over F_25. The rank-zero Tate module has polynomial 1 and must survive the integrality tests.

### Theorem: Frobenius on V_ℓA and on H¹: the conventions for abelian varieties over 𝔽_q

Node `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`.

Let A be an abelian variety of dimension g over 𝔽_q, π_A its q-Frobenius endomorphism, and ℓ ∤ q. (i) The arithmetic Frobenius φ acts on A(𝔽̄_q) as π_A, hence on V_ℓA as V_ℓ(π_A); the geometric Frobenius acts by V_ℓ(π_A)⁻¹. (ii) Under the Galois-equivariant isomorphism H¹(A_{𝔽̄_q}, ℚ_ℓ) ≅ Hom(V_ℓA, ℚ_ℓ), the geometric Frobenius on H¹ has characteristic polynomial P_{π_A}, the characteristic polynomial of the endomorphism π_A. (iii) So H¹ is pure of weight w iff V_ℓA, with the geometric Frobenius, is pure of weight −w; DWP.1 supplies w = 1. (iv) For an elliptic curve, P_{π}(T) = T² − aT + q with a = q + 1 − #E(𝔽_q), in agreement with Tau Ceti EllipticCurves Layer 3.

**Hypotheses and conventions.**

- The Frobenius endomorphism π_A is a morphism of 𝔽_q-varieties. The arithmetic Frobenius φ is an automorphism of the coefficient field. They agree on 𝔽̄_q-points, and this is the only place the two are identified.
- H¹ versus the Tate module: H¹ is the ℚ_ℓ-dual of V_ℓA, and the contragredient of the geometric Frobenius on V_ℓA is π_A's transpose. This is where sign conventions for weights are most often lost.
- The weight 1 of H¹ is DeligneWeightsAndPurity DWP.1's theorem, requested here, not reproved.

**Construction/proof contract.**

1. π_A is the identity on the topological space and f ↦ f^q on functions, so on points (x_i) ↦ (x_i^q), which is φ.
2. V_ℓ(π_A) has characteristic polynomial P_{π_A} (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module).
3. The geometric Frobenius on V_ℓA is V_ℓ(π_A)⁻¹. On the dual H¹ = Hom(V_ℓA, ℚ_ℓ), the contragredient of V_ℓ(π_A)⁻¹ is V_ℓ(π_A)^T (DWP.0/spectra-of-tensor-products-and-duals), with characteristic polynomial P_{π_A}. The isomorphism H¹ ≅ Hom(V_ℓA, ℚ_ℓ) is AbelianSchemesAndArithmeticModuli A4's (Milne 12.1, 12.5).
4. Weights: the eigenvalues on V_ℓA are the inverses of those on H¹.
5. Elliptic curves: P_π(1) = deg(1 − π) = #E(𝔽_q) and P_π(0) = deg π = q.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `AbelianSchemesAndArithmeticModuli:A4`, `ArithmeticGaloisRepresentations:R01.6`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`.

**Acceptance.**

- E: y² = x³ − x over 𝔽_3: #E(𝔽_3) = 4, a = 0, P_π = T² + 3; on H¹ the geometric Frobenius has eigenvalues ±i√3, weight 1, and on V_ℓE ∓i/√3, weight −1.

**Planet:** Tate module versus H¹.

**Source passages.**

- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, proof of Theorem 1.1, p. 76. The Frobenius map of a variety over 𝔽_q is the identity on the space and f ↦ f^q on functions.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, proof of Theorem 1.1, p. 76. The roots of P_π are the eigenvalues of π on T_ℓA.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I, Remark 12.5, p. 56. The comparison with H¹ is Galois-equivariant.

### Theorem: Tate modules and H^i of abelian varieties and curves with good reduction are pure and integral

Node `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

Let A be an abelian variety of dimension g over a number field K with good reduction outside a finite set T of finite places, and p a prime. Then ρ = H¹(A_K̄, ℚ_p) = (V_pA)^∨ is pure of weight 1 outside T ∪ {v | p} with integral Frobenius polynomials. At v ∉ T ∪ {v | p}, P_v(ρ, X) = P_{π_{A_v}}(X), the characteristic polynomial of the Frobenius endomorphism of the reduction A_v, independently of p. V_pA itself is pure of weight −1 there; if g>0 its geometric Frobenius polynomial is not integral, since its constant coefficient has absolute rational denominator q_v^g. For g=0 the polynomial is 1 and is integral. For 0 ≤ i ≤ 2g, H^i(A_K̄, ℚ_p) = ∧^i H¹ is pure of weight i and integral, with P_v the characteristic polynomial of π_{A_v} on ∧^i. The same holds for H¹ of a smooth projective geometrically connected curve over K with good reduction outside T, through its Jacobian.

**Hypotheses and conventions.**

- Good reduction at v∤p means an abelian scheme model over O_v. Néron–Ogg–Shafarevich at R11.5 supplies unramifiedness; SF.2 smooth proper base change and A4 Tate-module/cohomology duality supply specialization.
- Geometric convention (R34.1). The dual V_pA has weight −1 and Frobenius polynomials with denominators q_v, which is the H¹-versus-Tate-dual distinction that RS-17 asks R34.2 to keep.
- This is the export to FaltingsFinitenessAndIsogenyTheorems R28.4 that RS-17 names, with no Weil II input and no decomposition theorem.
- Nonintegrality of V_pA requires g>0. H^i=∧^iH¹ and smooth proper base change are imported comparison results, not consequences of purity alone.

**Construction/proof contract.**

1. Unramifiedness: at v ∉ T with v ∤ p, A has good reduction, so V_pA is unramified at v (Néron–Ogg–Shafarevich, NeronModelsAndSemistableAbelianVarieties R11.5).
2. Specialization: SF.2 smooth proper base change on the abelian scheme model, followed by A4 Tate-module/cohomology duality, gives the D_v-equivariant reduction comparison; arithmetic Frobenius on the special Tate module is π_{A_v} by the finite-field node.
3. So the geometric Frobenius on H¹ has characteristic polynomial P_{π_{A_v}} ∈ ℤ[X] (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-of-an-endomorphism), whose roots are Weil q_v-numbers of weight 1 (DeligneWeightsAndPurity DWP.1/weil-estimate-for-abelian-varieties). It is independent of p, since P_{π_{A_v}} is defined without p.
4. V_pA=(H¹)∨ has weight −1. For g>0 its geometric characteristic polynomial has constant coefficient q_v^(−g), which is not an integer. For g=0 the polynomial is 1.
5. A4 cup-product gives H^i(A)=∧^iH¹, pure of weight i by tensor/subquotient weight arithmetic. Its characteristic polynomial is an integer symmetric polynomial expression in the integer characteristic polynomial of H¹, so rationality and integrality both hold.
6. Curves: H¹(C) = H¹(J) Galois-equivariantly, and J has good reduction outside T when C does (DeligneWeightsAndPurity DWP.1/weights-of-the-cohomology-of-curves).

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `AbelianSchemesAndArithmeticModuli:A4`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- E/ℚ: y² = x³ − x has good reduction outside {2}. At ℓ = 3, P_3(H¹, X) = X² + 3: weight 1, integral. On V_pE the polynomial is X² + 1/3.
- det H¹(A) = ∧^{2g}H¹ = ℚ_p(−g): weight 2g, with P_v = X − q_v^g.

**Planet:** Purity of Tate modules.

**Source passages.**

- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §3.1, (3.2), p. 16. The Galois representation on the étale cohomology of a fibre.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I, Remark 17.2, p. 70. The characteristic polynomials of π on ∧^r T_ℓA.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I, Remark 17.2, p. 70. Good reduction through the Néron model.

### Theorem: Point counts and traces of Frobenius at good places, and the genus-one agreement

Node `WeightsInEtaleCohomology:R34.2/good-reduction-point-counts-and-traces`.

Let A/K and T be as in purity-of-tate-modules-with-good-reduction, v ∉ T ∪ {v | p} with residue field of size q_v, and α_1, …, α_{2g} the roots of P_v(H¹, X). Then #A_v(𝔽_{q_v^m}) = ∏_i(1 − α_i^m) for all m ≥ 1, and |#A_v(𝔽_{q_v^m}) − q_v^{mg}| ≤ 2g·q_v^{m(g−1/2)} + (2^{2g} − 2g − 1)q_v^{m(g−1)}. For an elliptic curve E/K, Tr(Frob_v^geom | H¹) = a_v := q_v + 1 − #E_v(k_v), and |a_v| ≤ 2√q_v, in agreement with the Hasse bound of Tau Ceti EllipticCurves Layer 3.

**Hypotheses and conventions.**

- The point counts are those of the reduction A_v over k_v. They are imported from DeligneWeightsAndPurity DWP.1 (point-counts-of-abelian-varieties, compatibility-with-the-hasse-bound), not reproved.
- The trace a_v is of the geometric Frobenius on H¹. On V_pE the trace is a_v/q_v.

**Construction/proof contract.**

1. P_v(H¹, X) = P_{π_{A_v}}(X) (node purity-of-tate-modules-with-good-reduction).
2. DWP.1/point-counts-of-abelian-varieties applied to A_v over k_v gives the counts and the bound.
3. For g = 1: P_{π}(X) = X² − a_vX + q_v with a_v = q_v + 1 − #E_v(k_v) (DWP.1/compatibility-with-the-hasse-bound), and the trace of the geometric Frobenius on H¹ is a_v.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/compatibility-with-the-hasse-bound`.

**Acceptance.**

- E/ℚ: y² = x³ − x at ℓ = 5: #E(𝔽_5) = 8, so a_5 = −2 and |−2| ≤ 2√5.

**Source passages.**

- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76. The bound on #A(𝔽_{q^m}).

### Theorem: Curve traces over all residue extensions

Node `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`.

Let C/K be smooth projective geometrically connected of genus g with smooth proper reduction C_v over F_q, v not above l. If α₁,…,α₂g are the roots of P_v(H¹(C),X), then for every m≥1, #C_v(F_{q^m})=1+q^m−Σα_i^m and |#C_v(F_{q^m})−(q^m+1)|≤2g q^{m/2}. H⁰ has eigenvalue 1 and H² has eigenvalue q; the Abel–Jacobi pullback H¹(Jac C)→H¹(C) identifies the Frobenius actions. Genus zero gives q^m+1 and genus one agrees with the elliptic trace recurrence t₀=2, t₁=a_v, t_m=a_v t_{m−1}−q t_{m−2}.

**Hypotheses and conventions.**

- Smooth proper reduction and geometric connectedness are required; singular fibres do not have this pure H¹ statement.
- The fixed-point formula and Jacobian comparison are supplier theorems, not new trace or positivity proofs here.

**Construction/proof contract.**

1. Apply smooth proper base change to C and its Jacobian, importing H¹ comparison from DWP.1’s Jacobian suppliers.
2. Apply the imported fixed-point trace formula to F^m; the top-degree Tate line has eigenvalue q^m.
3. Use the Weil estimate for curves for each α_i, and Cayley–Hamilton in rank two for the recurrence.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- For y²=x³−x over F₅ there are eight points, a₅=−2, t₂=−6 and #E(F₂₅)=32.
- P¹ gives q^m+1 with zero H¹.

**Planet:** Curve traces.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1 (1.5.1), p. 275; (1.13)–(1.15), pp. 278–279. The fixed-point formula and the q-power Frobenius yield point counts over every finite extension.

## R34.3 Arithmetic specialization and the actual comparison models

The trait is arithmetic: l must be invertible in its mixed-characteristic valuation ring, the family must be proper, and the finite-level comparison must be equivariant for its decomposition group. Passing to adic coefficients requires compatible transition maps and a derived inverse limit. A geometric trait with algebraically closed residue field alone does not give this arithmetic comparison.

The semistable-curve formulas apply only after an actual modular or Shimura model has the required nodal special fibre over a named finite extension. Carayol's general level models instead use his normalization sequence, coefficient extension and residual term A; that term is discarded only on the appropriate cuspidal eigensummand. Saito constructs a specific higher-dimensional model smooth over a semistable curve with an extending projector. CP.4 provides its geometric p-adic comparison, and R06.5 receives the verified model. The mixed-characteristic Picard–Lefschetz proof interior and integral-to-adic comparison remain explicit gaps.

### Theorem: Specialization over an arithmetic trait

Node `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

Let S=Spec O_L be a henselian trait with mixed-characteristic fraction field L and finite residue field k, l invertible in O_L, and f:X→S proper of finite type. For a constructible compatible system Λ_n=Z/l^n and its adic realization, RΓ(X_sbar,RΨΛ_n) identifies with RΓ(X_etabar,Λ_n), equivariantly for decomposition-group action. The specialization map RΓ(X_sbar,Λ_n)→RΓ(X_etabar,Λ_n) and the nearby/vanishing triangle yield the exact specialization sequence. These comparisons must commute with transition maps before deriving inverse limits, and only then tensoring with Q_l.

**Hypotheses and conventions.**

- Neither generic smoothness alone nor replacing the arithmetic trait by a trait over an algebraically closed field gives the required mixed-characteristic comparison.
- Adic passage uses R lim, not an unchecked equality H^i(lim Λ_n)=lim H^i(Λ_n); finiteness/Mittag–Leffler input is requested.
- For Carayol’s application the finite-level lisse coefficient sheaf is extended by §4.1’s étale level covers.

**Construction/proof contract.**

1. Apply LPV.0 derived-nearby-cycles and proper base change for each Λ_n on the actual trait.
2. Identify the Galois action through the geometric generic point and form the LPV specialization sequence.
3. Transport finite-level comparisons functorially; use the requested adic completion comparison to control derived inverse limits.

**Direct prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- At good reduction with a lisse extension RΦ=0, specialization is an isomorphism and inertia acts trivially.
- A nonproper affine degeneration cannot use the proper comparison without a compact-support replacement.

**Planet:** Arithmetic specialization.

**Source passages.**

- [Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §4.1–§4.3, pp. 423–424. The actual arithmetic-model vanishing-cycle sequence is Weil equivariant; §4.1 constructs compatible finite-level sheaves.

### Theorem: Normalization and nodes on modular and Shimura models

Node `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

For a proper semistable curve C/O_L with geometrically reduced nodal special fibre Y, normalization ν:Ỹ→Y, dual graph Γ, and l≠char k, the imported node calculation yields 0→H¹(Γ,Q_l)→H¹(Y,Q_l)→H¹(Ỹ,Q_l)→0 and 0→H¹(Y,Q_l)→H¹(C_Lbar,Q_l)→H₁(Γ,Q_l)(−1)→0. Frobenius permutes the components and branches; the sequences are equivariant. Apply these formulas to a ModularCurves R13.6 or R18.2 model only after its semistability is proved over a named finite extension. For Carayol’s general level models, use his actual specialization sequence and normalization filtration, not an assertion that all Drinfeld-level models are nodal.

**Hypotheses and conventions.**

- Λ_n torsion calculations, lisse coefficient extensions and inverse-limit comparison come from the preceding node.
- The displayed graph formulas are for constant coefficients on an actual semistable curve. Carayol’s coefficient sheaves use his §4.5 normalization sequence and residual term A; A is removed only on the cuspidal eigensummand by §4.4.

**Construction/proof contract.**

1. Request the semistable model and branch data from the modular/Shimura geometry owner.
2. Import LPV.7:semistable-curves normalization and node calculations, and identify graph cohomology and the Tate twist in vanishing cycles.
3. In Carayol’s coefficient application import the existing R19.2 filtration and verify its residual term disappears on the cuspidal summand; generic nearby cycles suffice, with no weight theorem.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`, `ModularCurvesPartII:R13.6`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration`.

**Acceptance.**

- A good fibre has Γ with no cycles, so graph terms vanish.
- A split nodal genus-one fibre has one graph cycle and the vanishing quotient Q_l(−1); it does not have pure weight-one good reduction.

**Planet:** Nodal arithmetic fibres.

**Source passages.**

- [Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §4.2–§4.5, pp. 423–425. The cuspidal residual term is absent; the normalized special fibre supplies the second filtration.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §8 Claim 5, pp. 37–38. Normalization and intersections of the semistable curve give the graph incidence calculation; Claim 5 identifies its kernel and cokernel.

### Theorem: Picard–Lefschetz at a mixed-characteristic quadratic point

Node `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`.

Let a proper flat family over a henselian arithmetic trait have exactly one ordinary quadratic singularity of odd relative dimension n=2m+1, with regular total space locally Q−b=0 and b a uniformizer. For l≠char k, the LPV.2 vanishing cycle δ in H^n(X_etabar,Q_l(m)) satisfies σx=x+(−1)^{m+1} ε_b(σ)(x,δ)δ, where ε_b:I→Z_l(1) is the Kummer tame character of b. Untwisted the pairing targets Q_l(−n); δ defines the corresponding rank-one variation. For even n use LPV.2’s quadratic-character reflection formula, with its residue-characteristic restrictions; do not substitute the odd transvection formula.

**Hypotheses and conventions.**

- The proper-flat, regular-total-space, isolated nondegenerate quadratic-point and smoothing-parameter hypotheses are each required.
- The odd mixed-characteristic proof and cup-product compatibility remain explicit supplier obligations in the inspected LPV node; their presence is not treated as a completed proof.
- Residue characteristic 2 requires the source’s Clifford-centre branch in even dimension, rather than the prime-to-2 discriminant shortcut.

**Construction/proof contract.**

1. Match the actual model to LPV.2’s ordinary quadratic-point definition; smooth a general node only when the model verifies that definition.
2. Import the odd or even variation formula in the appropriate branch; keep ε_b with root of b, not −b.
3. Unwind the Tate twist and geometric Frobenius action on Q_l(1) to fix the monodromy scaling FNF⁻¹=q⁻¹N.

**Direct prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3`, `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Acceptance.**

- For n=1 the twist m is zero and the rank-one tame transvection has N²=0.
- For even n and residue characteristic not 2, quadratic reflection need not be unipotent.

**Planet:** Arithmetic Picard–Lefschetz.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4 (4.2)–(4.3), pp. 288–289. The source replaces the complex disk by a henselian trait and treats the odd and even formulas separately.

### Theorem: Saito’s semistable comparison model

Node `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

For the Hilbert modular realization in Saito §6 Lemma 3, take a finite extension V/E_q over which the Shimura curve has its minimal semistable model. Under the prime-to-p level/isogeny conditions of §7 Lemma 4, its universal abelian scheme extends over that model and the algebraic projector e extends as a combination of permutations and prime-to-p endomorphisms. The resulting proper X/O_V is smooth over a semistable curve and has smooth projective strata Y^(0),Y^(1), with higher intersections empty. Its l-adic and log-crystalline weight spectral sequences carry the corresponding projector and Hecke action; the comparison is made on this X, not on a hypothetical semistable model of every arithmetic variety.

**Hypotheses and conventions.**

- The existence of V and the minimal semistable curve, the good integral universal abelian scheme, and the prime-to-p correspondence conditions are separate model inputs.
- The p-adic semistable/log-crystalline geometric comparison theorem is CohomologyComparisons CP.4’s. R34.3 verifies its model inputs and exports them to PadicHodgeTheory R06.5; importing that application back here would create a cycle.

**Construction/proof contract.**

1. Use Saito Lemma 4 to extend the curve-level covers and abelian schemes over the specified finite extension.
2. Use §6 Lemma 3’s correspondence formula to extend e and preserve its cohomological projector action.
3. Apply the requested semistable comparison and the two weight spectral sequences to the same strata; compare correspondence traces via intersection numbers as in Claim 4(1).

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `CohomologyComparisons:CP.4`, `GeneralizedHeegnerCycles:GH.0`.

**Acceptance.**

- A change of level with altered p-component does not satisfy the finite étale extension claim.
- Agreement of alternating traces is separated from equality of N and the local purity conclusion of R34.6.

**Planet:** Semistable comparison model.

**Source passages.**

- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §7 Lemma 4, pp. 32–34; §8 Claim 4(1), pp. 35–36. The abelian scheme and prime-to-p maps extend to the actual minimal semistable model; trace comparison uses its strata.

## R34.4 Descended pencils and original-coefficient monodromy hypotheses

A geometric parameter open need not have an F_q-rational point. A closed point gives a finite extension over which the chosen pencil, its axis and its incidence blowup exist together. Its degree-e Frobenius is F^e over the enlarged residue field. The resulting weight comparison uses the power criterion; it cannot keep q fixed while raising Frobenius.

For vanishing cycles, the restriction of the ambient perfect pairing can have a radical. The arithmetic quotient is E/(E∩E⊥), with Frobenius-stable E and radical verified from the descended family. Odd degree gives the alternating pairing required by the fundamental estimate, even degree a symmetric pairing. Openness must hold in the original Q_l symplectic group. Base extension preserves the pairing but does not turn that image into an open subgroup of the enlarged coefficient group's points. Zero quotient is a separate vacuous-weight case, with its own cohomology-sheaf branch. These are applications of LPV/EDC/DWP, not another proof of the Weil I induction.

### Theorem: Pencils over a finite extension

Node `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

Let X₀/F_q be smooth projective geometrically connected of dimension n+1 with a chosen projective embedding. After a Veronese reembedding of degree at least 2, the LPV.3 open locus of Lefschetz pencils has a point over some finite extension F_{q^d}. Choose such a point and descend its axis, incidence blowup, critical points and smooth locus U₀ to a common finite extension. At a closed point of degree e the imported stalk comparison uses F^e and q^{de}; it preserves all weight exponents. A purity result for a descended cohomological realization under F^d descends to F by DWP.0’s power criterion, but a particular pencil is not asserted defined over F_q.

**Hypotheses and conventions.**

- A geometrically nonempty parameter open need not contain an F_q-point; its closed point supplies the finite extension.
- The blown-up incidence family must be the family of the chosen pencil, not an unrelated smooth fibration.
- Purely inseparable field extensions are handled by étale invariance; the finite-field extension here is separable.

**Construction/proof contract.**

1. Import existence and Veronese transversality from LPV.3, then spread the finitely many equations and maps to one finite field.
2. Apply proper base change and the blowup comparison of EDC.4 to that family.
3. Use DWP.0/weil-number-base-extension and its converse to compare F^d with F; rational local factors are a separate DWP.3 input.

**Direct prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.4`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- When the parameter open has no F_q-point, choosing a closed point still supplies the pencil.
- F^d-purity cannot be transported by keeping q fixed; the base becomes q^d.

**Planet:** Finite-field pencils.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5 (5.6)–(5.7), pp. 291–292; §6 (6.1), pp. 294–295. The Veronese reembedding gives a geometric Lefschetz pencil; §6.1 works with a finite-field-defined pencil. A closed point in the parameter open and finite presentation supply the extension used here.

### Theorem: The arithmetic vanishing quotient

Node `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`.

For the descended pencil f:X̃₀→P¹₀ with smooth locus U₀, put H=H^n(X_ubar,Q_l), E the span of vanishing cycles, R=E∩E⊥ and V=E/R. The arithmetic Frobenius normalizes geometric monodromy and preserves E and R, so V is the stalk of an arithmetic lisse quotient sheaf. Its pairing V⊗V→Q_l(−n) is nondegenerate, alternating for odd n and symmetric for even n. LPV’s tame and transvection assertions are used only outside the excluded characteristic-2/even-n branch. If E=0, then V=0; no positive rank or irreducibility assertion is manufactured.

**Hypotheses and conventions.**

- H’s perfect Poincaré pairing does not imply the restriction to E is nondegenerate.
- Arithmetic Frobenius permutes the critical points and their transported vanishing cycles; E and R must be invariant before descent.
- The zero-cycle branch has LPV.4’s extra skyscraper term in R^{n+1}f_*, not the nonzero branch’s j_* formula.

**Construction/proof contract.**

1. Import LPV.4 cohomology sheaves and vanishing-quotient-and-its-pairing.
2. Use the descended family and Frobenius functoriality to show the critical-point span and its radical are arithmetic stable.
3. Transport the pairing and the appropriate local formula, keeping the coefficient twist Q_l(−n) and parity.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- A nonzero radical is removed; it cannot be treated as an absolutely irreducible summand.
- For odd n in residue characteristic 2 the source’s odd branch is retained; the excluded even branch is not silently included.

**Planet:** Vanishing quotient.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5 (5.8)–(5.9), pp. 292–293. The symplectic or symmetric representation is on the quotient by the radical, with a separate zero-cycle branch.

### Theorem: The symplectic monodromy hypothesis

Node `WeightsInEtaleCohomology:R34.4/original-coefficient-monodromy-hypotheses`.

For odd n and the Q_l-model V=E/(E∩E⊥) of the preceding node, geometric monodromy has open image in Sp(V,ψ)(Q_l) by LPV.5. Together with rational local Frobenius factors supplied by DWP.3, this verifies the hypotheses of DWP.2’s fundamental estimate with pairing twist β=n. If V=0, purity is vacuous and any estimate dividing by rank treats this case separately. Extension to E′/Q_l preserves the algebraic pairing but does not assert that the original image is open in Sp(V⊗E′)(E′).

**Hypotheses and conventions.**

- The input is openness in the original Q_l-group, stronger than Zariski density and different from openness after enlarging coefficients.
- Even n gives a symmetric pairing and does not fit the symplectic theorem.
- Rationality concerns the actual local factors of V; purity alone cannot be used to supply it.

**Construction/proof contract.**

1. Import LPV.5 absolute irreducibility and kazhdan-margulis-open-image on the radical quotient.
2. Apply DWP.3 rationality-of-pencil-local-factors to this descended quotient, including any hypotheses recorded there.
3. Match DWP.2/fundamental-estimate-theorem-3-2 clause by clause; record only this match here, with the dimension/tensor-power induction owned by DWP.4.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient`, `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image`, `DeligneWeightsAndPurity:DWP.3/rationality-of-pencil-local-factors`, `DeligneWeightsAndPurity:DWP.2/fundamental-estimate-theorem-3-2`.

**Acceptance.**

- V=0 has trivial open Sp(0)-image and vacuous purity, rather than a nonzero estimate.
- A Q_l-subgroup need not be open in a larger E′-analytic symplectic group.

**Planet:** Symplectic monodromy.

**Source passages.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3 (3.2), p. 283; §5 (5.10), p. 293. The estimate requires an open symplectic image and rational local factors; the pencil’s original Q_l-model supplies the open image.

## R34.5 Parabolic realizations, projectors and arithmetic hard Lefschetz

The source construction is the image of H_c¹ in H¹ for Sym^{k−2}R¹ of the universal elliptic scheme. Coefficient weight k−2 and cohomological degree 1 give weight k−1. The upper compact-support bound and lower smooth-lisse bound together make the image pure. The full H¹ of an open curve can include other boundary weights and is not substituted for this image.

An independent smooth-projective Kuga–Sato comparison imports an actual algebraic projector and its equivariant étale realization. A formal idempotent on a vector space is insufficient. GH.0's available CM-product projector has degree 2r+1 and imports the classical W_r; it does not supply the degree-r+1 classical projector or Saito's different Hilbert degree shift. Those precise extensions are requested from GH.0/R14.3/R18.2. In weight two the modular abelian quotient supplies a separate H¹ route. Hard Lefschetz here is the absolute arithmetic cup-product comparison with an arithmetic ample class and restored twists, restricted only to a commuting projector.

### Theorem: Purity of parabolic cohomology

Node `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`.

Let S₀/F_q be a smooth curve, h:A₀→S₀ an elliptic scheme, l∤q and r=k−2≥0. The lisse sheaf F_r=Sym^r R¹h_*Q_l is pointwise pure of weight r. Its parabolic realization W_r=im(H_c¹(S,F_r)→H¹(S,F_r)) is pure of weight r+1=k−1 for geometric Frobenius. The statement also holds on a smooth arithmetic model at each good residue fibre, and on a coefficient/nebentypus summand cut out by a Frobenius-commuting algebraic projector. This is the purity export to the imported R19.1 parabolic premotive, not a reconstruction of that premotive.

**Hypotheses and conventions.**

- Smoothness of S₀ and the coefficient sheaf’s lissity are essential for the lower weight bound.
- The geometric fibre image H_c¹→H¹ is used; H¹ of the open curve itself may have boundary weights.
- Finite character summands have weight zero; nonzero coefficient embeddings and the rational algebraic projector are specified.

**Construction/proof contract.**

1. Use R34.2 and DWP.0 tensor/subquotient weights to give F_r weight r.
2. Import DWP.7’s H_c¹ upper bound r+1 and H¹ lower bound r+1; their image has both bounds.
3. Identify this image with the geometry-only AutomorphicGaloisRepresentations R19.1/parabolic-realisation-premotive; apply the Frobenius-commuting projector without assuming the aggregate construction’s purity conclusion.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.7`, `AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive`.

**Acceptance.**

- k=2 gives weight 1; k=12 gives weight 11, not 12 or −11.
- The boundary part of H¹ is not automatically pure of this weight.

**Planet:** Parabolic purity.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3 (3.3.6), p. 206; (3.7.1), p. 215. The parabolic image for Sym^k R¹ of an elliptic family is pure of weight k+1.
- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Theorem (5.1) and Lemma (5.3), pp. 168–169. The modular parabolic realization has total degree r+1, conditional on the usual Weil conjecture in this 1969 reduction; Weil II (3.7.1) supplies the unconditional theorem.

### Theorem: Kuga–Sato degree and projector comparison

Node `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

For a fine modular curve Y(M) with M≥3 and universal elliptic curve A→Y(M), r=k−2, let A^r/Y(M) have a smooth projective compactification X over the chosen good-prime base. Import from GH.0 the algebraic symmetric/degree-one projector identifying the parabolic Sym^r R¹ summand with a subquotient of H^{r+1}(X,Q_l) (equivalently its designated interior projector image), equivariantly for Hecke and Galois actions. At a prime p of smooth projective reduction with p∤Ml, that image has geometric weight r+1. With a Tate twist (b) its weight is r+1−2b. For the Hilbert analogue use Saito’s degree q₀=(2g−1)(w−2): eH^q(X)≅H^{q−q₀}(M,F(k))⊗H⁰(N,F(χ₀^{(g−1)(w−2)})), retaining the auxiliary character and its weight.

**Hypotheses and conventions.**

- The compactification, correspondence and comparison isomorphism are supplied by GH.0; existence of a vector-space idempotent is not a geometric correspondence.
- Good primes require the actual model and correspondence to extend and commute with Frobenius; no integral statement follows merely from a rational projector.
- The Hilbert degree and character formula is not replaced by the classical r+1 formula.
- GH.0’s inspected nodes concern W_r×A^r with a CM factor and import the classical W_r from R14.3; they do not by themselves supply the missing classical projector comparison or the Hilbert model. These exact extensions are requested from their owners.

**Construction/proof contract.**

1. Use Deligne Lemmas 5.2–5.4: Leray for the abelian scheme splits its R^j terms by multiplication-by-m eigenvalues, identifying the degree r+1 subquotient.
2. Import GH.0’s actual compactification and symmetric projector, then DWP.4 smooth-projective RH for H^{r+1}.
3. Apply purity under subquotients and the Tate normalization; in the Hilbert case use Saito Lemma 3 with its exact q−q₀ degree and auxiliary character.

**Direct prerequisites.** `GeneralizedHeegnerCycles:GH.0`, `DeligneWeightsAndPurity:DWP.4`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `ModularCurvesPartII:R14.3`.

**Acceptance.**

- The classical k=12 summand lies in degree 11 of an eleven-dimensional compactification; weight 11 follows with twist zero.
- A correspondence that is merely idempotent on Betti cohomology supplies no unverified integral l-adic projector.

**Planet:** Kuga–Sato weights.

**Source passages.**

- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Lemmas (5.2)–(5.4), pp. 168–170. The fibre product and its compactification realize the parabolic local-system image in total degree r+1.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §6 Lemma 3, p. 30. The Hilbert Kuga–Sato projector has the stated total-degree shift and Hecke/Galois-compatible isomorphism.

### Theorem: Weight two and modular Jacobians

Node `WeightsInEtaleCohomology:R34.5/weight-two-jacobian-weight-comparison`.

For a modular Jacobian J and the abelian quotient A_f attached to a weight-two newform f, import the Hecke action and K_f⊗Q_l idempotents from ModularCurvesPartII R14.5. At p of good reduction, p∤Nl, H¹(A_f) is pure of weight 1 and has the integer Frobenius polynomial of the abelian variety. Its K_{f,λ} summand M_{f,λ} is geometrically pure of weight 1; the dual Tate-module representation has geometric weight −1, hence arithmetic weight +1. Its characteristic polynomial has coefficients in K_f, generally not in Q or Z.

**Hypotheses and conventions.**

- Only weight two has this abelian-variety realization; higher weights use Kuga–Sato/parabolic cohomology.
- The summand’s eigenvalues remain algebraic integers, but its K_f-polynomial need not be in Z[X].
- The geometry of A_f and its Hecke idempotents is imported from R14.5 before the R19 aggregate eigenform representation theorem, preventing circular use of purity.

**Construction/proof contract.**

1. Import the modular quotient and its coefficient-field action and pass to the λ-idempotent after rational coefficients.
2. Apply R34.2 to H¹(A_f), then purity of a subquotient from R34.1.
3. Use the Galois-equivariant Tate-module duality to translate the geometric/arithmetic convention; keep coefficient integrality distinct from rationality.

**Direct prerequisites.** `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`.

**Acceptance.**

- A rational weight-two newform gives an elliptic Tate module; a degree-d coefficient field gives an abelian variety of dimension d.
- A coefficient-field factor of an integer polynomial is not assumed rational.

**Planet:** Modular Jacobian weights.

**Source passages.**

- [The adjoint motive of a modular form and the Tamagawa number conjecture](https://arxiv.org/pdf/2512.02348v2), §5.4 Lemma 5.7, pp. 58–59. The rank-two eigensummand is over its coefficient field, rather than automatically over Q.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I Remark 12.5, p. 56. H¹ is the Galois-equivariant dual of the Tate module.

### Theorem: Hard Lefschetz with arithmetic twists

Node `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`.

Let X₀/F_q be smooth projective pure of dimension d, L ample and defined over F_q, and η=c₁(L)∈H²(X,Q_l(1)). For 0≤a≤d, cup product η^a:H^{d−a}(X,Q_l)→H^{d+a}(X,Q_l(a)) is an arithmetic-Frobenius-equivariant isomorphism, obtained from DWP.9 absolute hard Lefschetz with twists restored. Both sides have geometric weight d−a by DWP.4. A Hecke/projector summand inherits this isomorphism only when its projector commutes with cup product by η^a.

**Hypotheses and conventions.**

- The ample class must be arithmetic-defined for Frobenius equivariance; the absolute theorem over an algebraically closed field alone does not specify this datum.
- An arbitrary projector need not commute with η^a. No arithmetic semisimplicity or relative hard Lefschetz follows.
- EDC.7 pure IC/decomposition is not a prerequisite of this absolute comparison.

**Construction/proof contract.**

1. Import the cycle class and Tate twist from EDC.3 and the absolute isomorphism from DWP.9.
2. Restore the source’s suppressed Tate twists; arithmetic naturality of c₁ gives equivariance.
3. Compute target weight (d+a)−2a=d−a and restrict only along a commuting idempotent.

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.9`, `DeligneWeightsAndPurity:DWP.4`, `EtaleDualityAndPerverseSheaves:EDC.3`, `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`.

**Acceptance.**

- For a=d, H⁰→H^{2d}(d) has weight zero on both sides.
- A projector not commuting with cup product is outside the restriction statement.

**Planet:** Arithmetic hard Lefschetz.

**Source passages.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4.1 Theorem (4.1.1), p. 217. The source suppresses twists after choosing Z_l≅Z_l(1) over the algebraic closure; the arithmetic map restores them.

## R34.6 Eigenform purity, good-prime compatibility and the restricted local export

For a fixed newform, the imported rank-two construction and its Hecke polynomial identify the eigensummand already made pure in R34.5. The Ramanujan bound follows from the triangle inequality for its two roots at every coefficient embedding. The cohomological realization has geometric weight k−1; its dual has the standard arithmetic eigenform polynomial and geometric weight 1−k. The common good-prime polynomial follows from the fixed Hecke eigenvalues and nebentypus, independently of the equal root norms. R24.5:operations owns the generic compatibility contract.

The local theorem is imported from PadicHodgeTheory R06.6/hilbert-modular-form-compatibility-at-p, in Saito's Hilbert rank-two range. R34.6 verifies the actual coefficient, model, projector degree and auxiliary Tate twist against that theorem, retaining w≥k_i and its discrete-series hypothesis. It asserts the weights of the monodromy graded pieces and identifies Frobenius-semisimplified WD representations. Alternating trace agreement alone does not identify N: in rank two the purity statement also detects whether N vanishes. This is not a general mixed-characteristic weight–monodromy theorem. The crystalline coefficient-vanishing proof interior is a named gap; the l-adic proof and the projected spectral-sequence argument have been read.

### Theorem: Eigenform purity and the Ramanujan bound

Node `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`.

Let f be a normalized cuspidal newform of integer weight k≥2, level N and nebentypus ψ, with coefficient field K_f. At p∤Nl and any λ|l, the cohomological eigensummand M_{f,λ} supplied by the existing parabolic/Kuga–Sato realization is pure of geometric weight k−1. Its geometric polynomial, or equivalently the arithmetic polynomial on ρ_{f,λ}=M_{f,λ}∨, is P_{f,p}(X)=X²−a_p(f)X+ψ(p)p^{k−1}. For every σ:K_f→C both roots have norm p^{(k−1)/2}, hence |σ(a_p)|≤2p^{(k−1)/2}. With geometric convention ρ has weight 1−k; a twist M(b) has weight k−1−2b.

**Hypotheses and conventions.**

- Good primes p∤Nl, all coefficient embeddings, cuspidality, k≥2 and the source’s Hecke normalization are explicit.
- Rank two and the polynomial are imported from the eigenform owner after R34.5’s purity export; R34.5 does not depend on that owner’s purity-dependent aggregate theorem.
- No weight-one or noncuspidal extension is asserted.
- The DFG integral premotive supplies λ∉S_N only. For λ|Nk!, use the requested characteristic-zero parabolic eigensummand/comparison from R19.1; do not extend its integral-lattice statement by changing coefficients.

**Construction/proof contract.**

1. Apply R34.5 parabolic-cohomology-weight-comparison to the existing eigensummand, with k−2 coefficient weight.
2. Import the rank-two realization and Eichler congruence polynomial from AutomorphicGaloisRepresentations R19.1; DWP.10 transports the specified Frobenius-equivariant realization.
3. Apply all-embeddings purity and the triangle inequality to the two roots; dualizing changes geometric to arithmetic Frobenius.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `DeligneWeightsAndPurity:DWP.10`, `WeightsInEtaleCohomology:R34.1/purity-at-every-embedding-versus-a-chosen-embedding`, `AutomorphicGaloisRepresentations:R19.1`.

**Acceptance.**

- For Δ, k=12, P₂=X²+24X+2048; |−24|≤2·2^{11/2}.
- The dual cohomological convention gives geometric weight −11 on ρ_Δ, not +11.

**Planet:** Eigenform purity.

**Source passages.**

- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Theorems (5.1) and (5.6), pp. 168, 170–171. The geometric realization’s weight and congruence relation give the Fourier-coefficient bound.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3 (3.7.1), p. 215. Weil II supplies the unconditional parabolic purity used in this export.

### Theorem: Good-prime compatibility of a fixed eigenform

Node `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

For the same f and a fixed good prime p∤N, P_{f,p}∈K_f[X] is independent of λ for all λ∤p, after mapping K_f into K_{f,λ}. The coefficient-independent root bound comes from the preceding node for every embedding of K_f. The generic notion of a weakly/strictly compatible system, its tensor/dual/restriction operations and its bad-place WD conditions are imported from PotentialModularityAndCompatibleSystems R24.5:operations; this node establishes only the fixed-source good-prime polynomials. It does not derive λ-independence from equal weights.

**Hypotheses and conventions.**

- The common coefficient field and polynomial are proved by the same Hecke eigenvalues and nebentypus, before invoking a generic compatible-system contract.
- Exclude λ|p and bad primes dividing N from this good-prime claim; bad-place monodromy data require a separate theorem.
- The global exceptional set can be enlarged by source model denominators; integral structure at primes dividing Nk! is not asserted by DFG’s integral premotive.
- The DFG integral premotive supplies λ∉S_N only. For λ|Nk!, use the requested characteristic-zero parabolic eigensummand/comparison from R19.1; do not extend its integral-lattice statement by changing coefficients.

**Construction/proof contract.**

1. Use the imported Eichler congruence polynomial for each λ and the same coefficient embedding K_f→K_{f,λ}.
2. Identify a_p(f),ψ(p) algebraically in K_f; this supplies coefficient independence without comparing only absolute values.
3. Hand the proven data and all-embeddings bound to R24.5:operations; request R19.3 narrow its fixed-source strict/local realization to this interface as in RT-AREA-langlands-2/10.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, `AutomorphicGaloisRepresentations:R19.1`.

**Acceptance.**

- Two rank-two polynomials with roots of identical norms need not coincide: weight alone proves no compatibility.
- One fixed P_{f,p} is supplied at every λ∤p; different eigenforms do not share it.

**Planet:** Eigenform compatibility.

**Source passages.**

- [The adjoint motive of a modular form and the Tamagawa number conjecture](https://arxiv.org/pdf/2512.02348v2), §5.4 Lemma 5.7 and §5.5, pp. 58–60. The fixed coefficient field and its realizations give the good Euler polynomials; stronger local admissibility is separately attributed.

### Theorem: Transport through arithmetic realization comparisons

Node `WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport`.

Suppose two finite-dimensional realizations at a good residue place are identified by a coefficient-linear arithmetic-Frobenius-equivariant isomorphism, or one is the image of an algebraic idempotent commuting with Frobenius. Then the isomorphism preserves characteristic polynomials and weights, and the idempotent image inherits purity. If the comparison identifies F^d over a finite residue extension, use q^d and DWP.0’s power descent to conclude the same weight over q. Integrality of eigenvalues passes to the image, but an integer polynomial requires rational coefficients. These contracts apply to the fixed elliptic/Jacobian and Kuga–Sato comparisons already constructed here; they supply the Faltings input without importing local mixed-complex theory into R34.2.

**Hypotheses and conventions.**

- An abstract vector-space isomorphism or Betti projector is insufficient; Frobenius equivariance and actual coefficient maps are required.
- Semisimplicity of a representation is an independent Faltings hypothesis and does not follow from equality of weights.
- DWP.10 owns general weight transport; the target here verifies these particular arithmetic comparison inputs.

**Construction/proof contract.**

1. Import DWP.10 transport through equivariant isomorphisms/projector images.
2. Apply R34.1’s rationality-qualified integrality statement and finite-field power criterion.
3. Use R34.2’s good-reduction comparisons for the early Faltings export and R34.5’s geometric projector comparisons for the modular export.

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.10`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

**Acceptance.**

- A pure nonsemisimple representation is not automatically an input to the cited finiteness theorem.
- A pure coefficient-field projector factor is not automatically a rational integer polynomial.

**Planet:** Arithmetic weight transport.

**Source passages.**

- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.3 Lemma 2.3, pp. 9–10. Faltings’ finiteness separately requires semisimplicity, purity and integer Frobenius coefficients.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2 (1.2.5)(i), p. 154. Purity passes to subobjects and quotients under the specified comparison.

### Theorem: Hilbert eigensummand local weight normalization

Node `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`.

Let F be totally real of degree g>1 and f a cuspidal Hilbert eigen-newform of multiweight (k_i,w), w≥k_i≥2 and k_i≡w mod 2, with coefficient field L(f). If g is even, assume a finite discrete-series place as in Saito Theorem 0; the source quadratic base change is retained when its auxiliary place must differ from p. On the actual R34.3 model, Saito Lemma 3 and its auxiliary projector e° identify e°eH^(q₀+1)(X)((g−1)(w−2)) with H¹(M,F(k)), where q₀=(2g−1)(w−2). Verify this comparison is compatible with the coefficient embeddings, geometric Frobenius and N, then pass to the f eigensummand. The imported PadicHodgeTheory R06.6/hilbert-modular-form-compatibility-at-p theorem applies: for λ∤p and μ|p, the rank-two l-adic and potentially semistable p-adic WD realizations have N²=0, Gr_i of monodromy weight w−1+i, and N:Gr₁(1)≅Gr₋₁. Thus N=0 gives weight w−1; N≠0 gives weights w−2 on ker N and w on coker N. Their Frobenius-semisimplified WD representations agree and correspond to σ̌_h(π_{f,p}) in the source Hecke normalization. The arithmetic degree/twist adapter and this fixed-source export do not construct another Saito theorem or assert general mixed-characteristic weight–monodromy.

**Hypotheses and conventions.**

- The model, correspondence, auxiliary character and eigensummand are the actual ones of R34.3 and Saito Lemma 3. The generic existence of an idempotent or a vector-space comparison does not verify them.
- The imported local theorem has degree g>1 and w≥k_i≥2, with Carayol’s discrete-series hypothesis when g is even. No extension outside that source range is asserted.
- The potential semistability, WD comparison and local graded purity are imported from the inspected R06.6 fine node. Its proof interior remains unclosed; the crystalline coefficient-vanishing gap below records the same prerequisite obligation, rather than a second proof here.
- The projector/auxiliary comparison must commute with N and Frobenius after the specified coefficient embeddings; alternating trace equality alone does not determine N.
- Normalize FNF⁻¹=q^(−1)N for geometric Frobenius. Saito v2 p. 12 prints the opposite exponent and φN=pNφ; sourceIssue WeightsInEtaleCohomology/E1 imports the correction already noted by PadicHodgeTheory/E50.

**Construction/proof contract.**

1. Use R34.3’s actual semistable comparison model and Saito Lemma 3 with e° (pp. 30–31) to identify the projected degree-q₀+1 realization and its auxiliary character, retaining Galois and Hecke equivariance.
2. The twist b=(g−1)(w−2) changes the centre weight q₀+1 to q₀+1−2b=w−1. Verify the coefficient/projector comparison with the local WD carrier from the imported R06.6 fine theorem, including N.
3. Apply that source-qualified theorem to the identified rank-two f eigensummand; transport its Gr_i weights and N:Gr₁(1)≅Gr₋₁ through the actual comparison. The constant/nonconstant coefficient spectral-sequence and crystalline vanishing arguments remain the supplier’s proof, with the recorded gap.
4. Export the resulting normalized local weights and σ̌_h parameter to the fixed-source R19.3 consumer. Its generic compatible-system carrier and operations are R24.5:operations’s; use the eigenform-specific comparison instead of inferring it from root norms.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction`, `PotentialModularityAndCompatibleSystems:R24.5:operations`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.

**Acceptance.**

- For N≠0 and w=2 the graded weights are 0 and 2; FNF⁻¹=q⁻¹N matches the twist.
- No arbitrary smooth projective mixed-characteristic variety is claimed to satisfy weight–monodromy.

**Planet:** Local monodromy weights.

**Source passages.**

- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §1 Theorem 1, Claim 1 and Theorem 2, pp. 12–13. The rank-two l-adic and p-adic WD graded pieces have weights w−1+i; the proof needs trace comparison and N agreement separately.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §8 Claims 4–5 and §9 Proposition 1′, pp. 35–39. The projected spectral sequence and constant/nonconstant coefficient calculations establish this restricted local theorem.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §6 Lemma 3 and auxiliary projector comparison, pp. 30–31. The actual degree q₀ and the auxiliary (g−1)(w−2) Tate twist give the local eigensummand centre weight w−1.

## Source normalization correction

Saito v2 §2, p. 12 prints σN=q^{n(σ)}Nσ and φN=pNφ while assigning n=1 to geometric Frobenius. With the source's own N:Gr₁(1)≅Gr₋₁ on p. 13, the correct normalization is FNF⁻¹=q^(−1)N and Nφ=pφN. The packet records this as WeightsInEtaleCohomology/E1, already known as PadicHodgeTheory/E50. It is independently checked here on the preprint page image; no claim is made about the unexamined journal version. The local theorem and matrix acceptance check use the corrected sign.

## Supplier contracts and graph boundaries

A stage reference below is a requested interface, not evidence that an existing fine node already proves it. Where a sufficient fine node was inspected, the direct prerequisite names that node instead. In particular NOS and the DWP.1 estimates are imported at node level; A4/SF.2 geometric comparisons and the classical/Hilbert projector extensions need the following precise contracts. No other packet is changed by this plan.

### `ArithmeticGaloisRepresentations:R01.1`

Continuous finite-dimensional E-adic representations, lattices and contragredients; finite quotients and representations of Gal(F_qbar/F_q) through its procyclic completion. The χ_u construction uses compactness of Z_l×, not finite image of every continuous representation.

Used by: `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`.

### `ArithmeticGaloisRepresentations:R01.2`

Decomposition/inertia groups, Frobenius classes, unramified extensions, residue-degree powers and Mackey’s local induction formula P_v(Indρ,X)=∏_{u|v}P_u(ρ,X^{f_u}).

Used by: `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`.

### `ArithmeticGaloisRepresentations:R01.6`

Integral and rational Tate modules with Galois action, the cyclotomic character and arithmetic Frobenius action on roots of unity and on a reduced abelian variety.

Used by: `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`.

### `AbelianSchemesAndArithmeticModuli:A4`

The Galois-equivariant H¹(A,Z_l)=Hom(T_lA,Z_l) and cup-product ∧^iH¹=H^i comparisons (Milne I.12.1 and Remark 12.5), including base-change naturality. These are absent from the inspected A6 nodes, which only provide endomorphism polynomials.

Used by: `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

### `SchemeAndStackFoundations:SF.2`

Actual lisse-adic sheaf/continuous π₁-representation equivalence, proper and smooth base change prime to the residue characteristic, cohomological fixed-point trace including the PR196/TraceFormula Layer 8 curve–Jacobian comparison, and arithmetic descent of finite-type equations/maps to a common finite residue extension. No inspected SF.2 node supplies these exact étale results: its coherent-duality nodes are not substitutes.

Used by: `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`, `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

### `DeligneWeightsAndPurity:DWP.5`

Pointwise pure, chosen-embedding pure, mixed and integral sheaf predicates with Frobenius-stalk semantics. R34.1 only translates the representation predicate.

Used by: `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`.

### `DeligneWeightsAndPurity:DWP.8`

Constructible complex upper/lower/pure predicates; on smooth X with lisse H^i, purity weight w iff H^i weight w+i, including shifts/twists and Verdier duality as in Weil II 6.2.1–6.2.5.

Used by: `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`.

### `DeligneWeightsAndPurity:DWP.7`

Weil II 3.3.4–3.3.6: H_c^i upper bound n+i, smooth-lisse H^i lower bound n+i, and pure parabolic image. The inspected aggregate integrated node states this, but is moved by RS-17 and needs the narrowed sheaf/mixed proof prerequisites.

Used by: `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`.

### `DeligneWeightsAndPurity:DWP.4`

Smooth-projective RH at every complex embedding, transported to the specified smooth projective Kuga–Sato reduction. Generic integral/ell-independent whole-cohomology factor descent belongs to WeilConjectures WC.3, not this RH input; no such factor claim is required for the projector purity statement.

Used by: `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`.

### `DeligneWeightsAndPurity:DWP.9`

Absolute hard Lefschetz for smooth projective X with ample η, cup η^a:H^{d−a}→H^{d+a}(a), with functoriality; relative/perverse decomposition is not imported.

Used by: `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`.

### `DeligneWeightsAndPurity:DWP.10`

Weight transport through specified Frobenius-equivariant arithmetic realizations and commuting projector images; preserve all-embeddings rather than single-embedding purity. No compatibility or semisimplicity conclusion from weights alone.

Used by: `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport`.

### `EtaleDualityAndPerverseSheaves:EDC.2`

Smooth trace and arithmetic Poincaré pairing, dualizing complex Q_l(d)[2d], twist-compatible cup products for the lisse complex normalization and descended pencil.

Used by: `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`, `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`.

### `EtaleDualityAndPerverseSheaves:EDC.3`

Arithmetic-defined first Chern class η∈H²(X,Q_l(1)) and cup-product naturality under Frobenius and correspondences; sufficient to restore the absolute hard Lefschetz twists.

Used by: `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`.

### `EtaleDualityAndPerverseSheaves:EDC.4`

Weak Lefschetz and blowup cohomology of the actual pencil’s incidence blowup, compatible with the descended finite field and Tate summands.

Used by: `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

### `LefschetzPencilsAndVanishingCycles:LPV.1`

Integral finite-level nearby cycles/vanishing triangle for l-invertible coefficients; compatible transition maps and a derived inverse-limit comparison with the adic realization, including finiteness/Mittag–Leffler hypotheses.

Used by: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

### `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`

Normalization, branch incidence, nearby cycles and Tate-twisted graph kernel/cokernel for proper semistable arithmetic curves; Frobenius action on components/branches and compatible integral-to-adic passage. Do not import the invariant-cycle suffix.

Used by: `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

### `ModularCurvesPartII:R13.6`

Name the actual bad-prime modular curve model, its semistable extension, node thicknesses and coefficient extension; provide the hypotheses needed for the LPV node formulas instead of asserting every level model semistable.

Used by: `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

### `HilbertModularVarietiesAndShimuraCurves:R18.2`

Carayol’s named M_{n,H} integral model with its extended coefficient sheaf and special-fibre normalization; Saito Lemma 4’s finite-extension minimal semistable model, universal abelian scheme and prime-to-p level/isogeny extensions. Distinguish these two models.

Used by: `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

### `GeneralizedHeegnerCycles:GH.0`

Classical W_r and the symmetric degree-one algebraic projector with Hecke/Galois-compatible étale parabolic comparison; denominator ledger and good-prime extension. For Saito’s Hilbert analogue supply Lemma 3’s algebraic projector e, q₀=(2g−1)(w−2), auxiliary character and compatible realization. Existing W_r×A^r CM nodes have different degree and do not supply this alone.

Used by: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

### `ModularCurvesPartII:R14.3`

Classical Kuga–Sato W_r compactification, algebraic symmetric projector, local system Sym^r R¹ of the universal elliptic scheme and parabolic H¹ comparison. The inspected R14.3 nodes supply weight-two Betti cohomology only; request this scope extension through GH.0, retaining R14.3 ownership of modular geometry.

Used by: `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

### `CohomologyComparisons:CP.4`

Geometric semistable/log-crystalline-to-p-adic étale comparison on the actual proper Saito model over O_V, with Galois, Frobenius, N, twists and algebraic-correspondence compatibility. This is the independent geometric input to R34.3, which exports to R06.5.

Used by: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

### `PotentialModularityAndCompatibleSystems:R24.5:operations`

Own generic weak/strict compatible systems, common coefficient embeddings, good-prime polynomials and bad-place WD conditions, with restriction/dual/tensor operations. R34.6 supplies the fixed eigenform’s proof of common P_{f,p}; R19.3 consumes the fixed-source local interface. This is the RT-AREA-langlands-2/10 boundary.

Used by: `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`, `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`.

### `AutomorphicGaloisRepresentations:R19.1`

For the fixed cuspidal newform, identify its characteristic-zero λ-adic eigensummand with the parabolic/Kuga–Sato realization and the arithmetic Hecke polynomial at every p∤Nℓ, including ℓ|k!. The inspected DFG premotive fine node restricts integral λ-realizations to λ∉S_N={ℓ|Nk!}; its rank-two node alone does not justify the larger all-λ claim. Supply the rational étale geometric construction for the additional λ and auxiliary levels chosen prime to p, without asserting an integral lattice at those λ. This comparison is consumed only after R34.5, so the owner’s purity-dependent aggregate is not imported into R34.5.

Used by: `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

## Coverage, gaps and review obligations

| Stage | Coverage | Precise remaining work |
| --- | --- | --- |
| `WeightsInEtaleCohomology:R34.1` | planned | Resolve continuous Galois/sheaf and mixed-complex supplier requests; type their geometric carrier signatures. |
| `WeightsInEtaleCohomology:R34.2` | planned | Resolve the Galois-equivariant H¹/exterior-power and smooth proper base-change suppliers; independently check the early Faltings integer-polynomial contract. |
| `WeightsInEtaleCohomology:R34.3` | planned | Prove compatible integral-to-adic specialization, mixed-characteristic Picard–Lefschetz interior and the named modular/Shimura model inputs. |
| `WeightsInEtaleCohomology:R34.4` | planned | Resolve EDC pairing/blowup supplier requests and confirm finite-extension descent on the actual chosen pencil. |
| `WeightsInEtaleCohomology:R34.5` | planned | Supply the actual classical/Hilbert compactification and algebraic projector comparisons, together with DWP.4/.7/.9 theorem imports. |
| `WeightsInEtaleCohomology:R34.6` | planned | Resolve actual all-λ/newform and Hilbert projector comparisons, including degree q₀ and the auxiliary twist; the imported R06.6 theorem still needs Saito §9 crystalline vanishing. Confirm R24.5:operations and R19.3 fixed-source consumer boundaries. |

The pass stops at target coverage under PROTOCOL §0. Independent review must check the arithmetic hypotheses and source normalization of each node before finer proof decomposition. The following gaps prevent any claim of closure.

### Arithmetic integral-to-adic specialization comparison

Carayol §4.1 constructs a compatible finite-level extension, but a proof of the R lim comparison with nearby cycles and its torsion/finiteness hypotheses was not established here. LPV.1 and SF.2 requests name the missing input. The public SGA7 II scan at the IAS URL returned HTTP 403 in this session; no read of its proof is claimed.

Affected nodes: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

### Mixed-characteristic Picard–Lefschetz proof interior

The inspected LPV.2 odd-relative-dimension node leaves its mixed-characteristic specialization step and transcendental cup-product/trace compatibility unverified. Using its target-level statement does not close that proof; confirm SGA7 XV 3.3.5–3.3.6 with XIII/XIV compatibilities.

Affected nodes: `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`.

### Classical and Hilbert geometric projector comparison

GH.0’s available CM-product projector has total degree 2r+1 and imports W_r; it does not supply the classical degree-r+1 étale projector or Saito’s different q₀-shifted Hilbert projector. GH.0/R14.3/R18.2 requests require those actual comparison morphisms, denominators and good-prime models. Deligne Lemma 5.4’s toric compactification argument is not a replacement for the owner’s verified global algebraic construction. In addition, R19.1’s DFG integral premotive restricts λ outside Nk!; the requested characteristic-zero all-λ parabolic comparison, including λ|k!, was not established by that fine node. This is a precise extra comparison obligation for the stated all-λ eigenform export.

Affected nodes: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

### Saito crystalline coefficient vanishing proof

Saito’s Theorems 1–2, Lemmas 3–4, Claims 4–5 and Proposition 1′ with its l-adic proof were read. The p-adic half still needs §9, pp. 40–43: the nonconstant coefficient isocrystal has no geometrically constant subobject/quotient, using the p-divisible-group monodromy calculation. This is an inherited proof-interior obligation of the imported PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p theorem, whose packet also leaves this proof unverified. R34.6 transports that theorem through its actual degree/twist/projector comparison rather than re-planning the proof.

Affected nodes: `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`.

### Suggested signatures for unavailable geometric carriers

The suggested file gives actual Mathlib representation/root-level definitions, all nine definition tests, and numerical/algebraic theorem signatures. Its supplied group, inertia, lift and residue-cardinality data are prototypes, not the full continuous Galois/local-place carrier. Actual Tate modules, schemes, adic nearby cycles, parabolic cohomology, geometric projectors and mixed complexes are absent from the pinned imports, so full geometric and continuous-arithmetic signatures are omitted with their node names and exact supplier inputs. No opaque Prop conditions or mock cohomology objects replace them; numerical cores do not claim to state the full comparison theorems.

Affected nodes: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`, `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`, `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`, `WeightsInEtaleCohomology:R34.4/original-coefficient-monodromy-hypotheses`, `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.5/weight-two-jacobian-weight-comparison`, `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`, `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`, `WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport`, `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`, `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`, `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`, `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`, `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.2/good-reduction-point-counts-and-traces`, `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`.

## Source and library audit ledger

The eight public PDFs below were downloaded and the cited statements compared with their page text. SHA256 values identify the actual editions used; short literal source excerpts are kept in the packet. OCR mathematical glyphs are not treated as errors in the original papers. The independently image-checked Saito preprint sign correction is recorded as E1, importing the existing PadicHodgeTheory/E50 finding; the journal version was not compared. The IAS SGA7 II scan was inaccessible (HTTP 403); its proof is not counted as read.

### Pierre Deligne: La conjecture de Weil. I

[Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR (printed page = PDF page + 271)](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf)

SHA256: `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`. Accessed 2026-10-06.

- codex-8vDn9u, 2026-10-06: §1 (1.13)–(1.15), §3 (3.2), §4 (4.2)–(4.3), §5 (5.6)–(5.10), §6 (6.1)–(6.3), pp. 278–279, 283, 287–289, 291–297; (1.5.1), p. 275.

### Pierre Deligne: La conjecture de Weil. II

[Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135)](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf)

SHA256: `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`. Accessed 2026-10-06.

- codex-8vDn9u, 2026-10-06: §1.2 (1.2.1)–(1.2.8); §3.3 (3.3.1)–(3.3.11); (3.7.1); §4.1 (4.1.1)–(4.1.2); §6.2 (6.2.1)–(6.2.5), pp. 153–155, 204–207, 215, 217–218, 247–248.

### Brian Lawrence and Akshay Venkatesh: Diophantine problems and p-adic period mappings

[arXiv:1807.02721v3 (25 Oct 2019; published in Invent. Math. 221 (2020)); printed page = PDF page](https://arxiv.org/abs/1807.02721)

SHA256: `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`. Accessed 2026-10-06.

- codex-8vDn9u, 2026-10-06: §2.1–§2.5 and §3.1–§3.2; Frobenius convention translated explicitly, pp. 9–16.

### J. S. Milne: Abelian Varieties

[Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6](https://www.jmilne.org/math/CourseNotes/AV.pdf)

SHA256: `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`. Accessed 2026-10-06.

- codex-8vDn9u, 2026-10-06: Chapter I §12 pp. 54–56, §17 pp. 69–71; Chapter II §1 pp. 75–78; Chapter III §11 pp. 117–118. Fresh public PDF hash matches the inherited SHA256.

### Pierre Deligne: Formes modulaires et représentations l-adiques

[Séminaire Bourbaki, exposé 355 (1968/69), pp. 139–172; Numdam scan; printed page = PDF page +137.](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf)

SHA256: `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c`. Accessed 2026-10-06.

- §3.19–§3.20 and §5 (5.1)–(5.6), pp. 158–159, 168–171.

### Takeshi Saito: Hilbert modular forms and p-adic Hodge theory

[arXiv:math/0612077v2 (2009); manuscript page = PDF page.](https://arxiv.org/pdf/math/0612077v2)

SHA256: `fb5b69b76d2257ce20f47366c4bd165ccdb571333e7f25a4ed6e92dbb4b55df7`. Accessed 2026-10-06.

- §1 Theorems 0–2 and Claim 1, pp. 10–13; §6.3 Lemma 3 and Claim 3, pp. 29–31; §7 Lemma 4, pp. 32–34; §8 Claim 4, weight spectral sequence and Claim 5, pp. 35–38; §9 Proposition 1′ and its l-adic proof, pp. 38–39. The crystalline vanishing proof on pp. 40–43 is not claimed read. The §2 p. 12 sign was additionally verified on the page image; E1 imports the recorded E50 correction.

### Fred Diamond, Matthias Flach and Li Guo: The adjoint motive of a modular form and the Tamagawa number conjecture

[arXiv:2512.02348v2 (December 2025 revision); manuscript page = PDF page.](https://arxiv.org/pdf/2512.02348v2)

SHA256: `0f4984acdabd2efd542aae932850da83c36ec023185a47f40c8ef5813bd21898`. Accessed 2026-10-06.

- §4.5, pp. 50–51; §5.1–§5.4, pp. 52–59; §5.5, pp. 59–60.

### Henri Carayol: Sur les représentations l-adiques associées aux formes modulaires de Hilbert

[Ann. Sci. ENS (4) 19 (1986), 409–468; Numdam scan; printed page = PDF page +407.](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)

SHA256: `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`. Accessed 2026-10-06.

- Conventions, pp. 409–410; §4.1–§4.7, pp. 423–425; §5.6, p. 429.

The reviewed audit was checked for every R34 stage at the recorded pins. The supplier packets and integrated stage statements were read for DWP.0/.1/.2/.3, LPV.0–.5 and the semistable-curve suffix, EDC.2–.4, A4/A6, SF.2, NOS R11.5, the modular/Hecke R13/R14 interfaces, R18.2, R19.1–.3, GH.0, CP.4, R06.5/.6 and R24.5:operations. Their names alone were not used as proof of availability. Specific deficiencies appear in the requests and gaps above. Upstream AdicSpaces and HodgeStructures reader documents supplied the model for explicit objects, hypotheses, API and acceptance contracts.
