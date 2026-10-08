# Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications

This roadmap supplies arithmetic comparison contracts for the objects used by Faltings finiteness and by the Galois representations of eigenforms. The fundamental weights library is [DeligneWeightsAndPurity](DeligneWeightsAndPurity.md), the first prerequisite under accepted RS-17. A user of this Part II starts with an actual arithmetic representation, good-reduction model, pencil or Hecke realization and obtains the precise weight statement that its arithmetic construction needs. Definitions of Weil numbers, mixed sheaves, nearby cycles, pencils and compatible systems are imported from their owners.

All six stages R34.1–R34.6 are planned at target level. The packet has 27 nodes: two definitions and 25 theorems, with 17 definition API items, nine discriminating unit tests and 22 planets. All implementation statuses remain unchecked. The planning pass is complete; no stage is closed. Six explicit gaps and 9 supplier requests identify the proof interiors and geometric interfaces that implementation and the supplier follow-up jobs must resolve. Target coverage does not certify those proofs.

The six stages form two paths. R34.1's numerical representation conventions and R34.2's curve/abelian-variety comparisons provide an early export to FaltingsFinitenessAndIsogenyTheorems R28.4 and MordellLawrenceVenkatesh LV.1 using only DWP.0 and DWP.1. The sheaf and mixed-complex comparison nodes inside R34.1 are separate branches: that early export does not import Weil II, relative hard Lefschetz, the decomposition theorem or local weight–monodromy. R34.3–R34.6 supply the arithmetic degeneration, pencil, parabolic/projector and eigenform applications of the corresponding geometric theories.

## Conventions and ownership

Throughout, the geometric Frobenius is the inverse of the arithmetic field automorphism x↦x^q. For an unramified representation ρ at v, write P_v(ρ,X)=det(X−ρ(Frob_v^geom)). The cyclotomic representation Q_l(1) has geometric eigenvalue q_v^(−1) and weight −2. On the dual representation the geometric roots are inverted, so switching to the arithmetic convention negates the weight. The polynomial det(1−FT) appearing in the sources is related to this monic characteristic polynomial by T^d P(F,T^(−1)); the degree and convention must accompany every comparison.

Algebraicity, algebraic integrality, rational integer coefficients and purity are four separate assertions. All-embeddings purity requires eigenvalues algebraic over Q and every complex conjugate of norm q^(w/2). Chosen-embedding purity controls the image under one specified embedding and can hold even for a transcendental eigenvalue. A polynomial in Z[X] has algebraic-integer roots, but a factor over a coefficient field need not have rational coefficients. A monic factor in Q[X] of an integer polynomial is integral; divisibility in E[X] alone is insufficient. For example X²−2 factors as (X−√2)(X+√2), whose individual factors are not in Z[X].

For an abelian variety, H¹ is the Galois-equivariant dual of its rational Tate module. The arithmetic Frobenius on the Tate module is the Frobenius endomorphism π of the reduction; the geometric Frobenius on H¹ has π's characteristic polynomial. Consequently H¹ has geometric weight +1 and the Tate module has weight −1. Statements using the opposite convention must say so. Rank zero is pure of every weight and has polynomial 1, so both uniqueness of weight and nonintegrality of a negative-weight Tate module need a nonzero-rank hypothesis.

Weights for complexes use cohomological indexing. On smooth X and with lisse cohomology sheaves, a complex K of weight w has H^i(K) of weight w+i. Thus a sheaf F of weight r gives F[a](b) of weight r+a−2b; the shift contribution has a plus sign. The dualizing complex is Q_l(d)[2d]. Absolute hard Lefschetz over a finite field must restore the Tate twists that Weil II §4.1 suppresses after a choice over an algebraic closure.

Accepted RS-17 assigns finite-field weights and their linear algebra to DWP.0, curve/abelian estimates to DWP.1, Weil I induction to DWP.2–DWP.4, sheaf predicates and Weil II bounds to DWP.5–DWP.8, and hard Lefschetz/transport to DWP.9–DWP.10. LPV owns nearby cycles and Lefschetz pencils; EDC owns duality, classes and the geometric cohomology comparisons used by those pencils. This roadmap checks their arithmetic hypotheses on specified models.

RT-AREA-langlands-2/10 gives generic compatible systems and their operations to PotentialModularityAndCompatibleSystems R24.5:operations; the direct imports below name its existing fine carrier and predicate nodes. R34.6 provides the common good-prime polynomial for one fixed eigenform, and R19.3 consumes its fixed-source purity/local exports. R34.5 uses R19.1’s parabolic and Scholl-projector fine targets. R34.6 uses its newform-projector-and-coefficient-descent target and separately requests a geometric Eichler-congruence comparison independent of purity: the current rank-two/Eichler aggregate returns through R34.6. R34.3 imports the generic CP.4 semistable-period comparison with a request for its actual Saito model/descent hypotheses, and exports that verification to PadicHodgeTheory R06.5.

The reviewed audit labels the old R34.3 and R34.4 import-only prose as process. It supplies no mathematical nodes for that prose. RS-17 expressly retains actual arithmetic trait/model and descended-pencil hypothesis comparisons, which are the targets below; the packet proposes removing the process portions while retaining those comparison contracts. Nothing in the pinned libraries supplies their advanced geometric interfaces. The existing finite ring-action Frobenius API and ordinary representation/characteristic-polynomial APIs are baseline citations, not newly planned results.

## Pinned baseline and prototype boundary

The prescribed baseline commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read at the Mathlib pin. Tau Ceti's elliptic Hasse bound and cohomological trace are reached through DWP.1 and the SF.2 supplier contract; no missing advanced weight theorem is attributed to a similarly named library declaration.

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

The [suggested file](../suggested/WeightsInEtaleCohomology.lean) uses actual Mathlib representation, polynomial and matrix carriers. The second independent review successfully elaborated the unchanged declarations, including all 17 definition API items and nine named tests, at the Mathlib pin on 2026-10-08; its only warnings are admitted proofs using `sorry`. Inertia, a Frobenius lift and residue cardinality are supplied parameters, so the definitions are root-level prototypes; the full continuous Galois/local-place carrier belongs to R01.1–R01.2. The rank-one tests use the scalar units action at q=3, the elliptic test uses the inverse companion matrix, and the zero-rank test includes every weight and polynomial 1 with integrality. The 24 omitted full geometric or continuous-arithmetic signatures are enumerated in the signature gap and suggested-file comments. Numerical cores accompanying a theorem do not constitute a signature of its geometric statement.

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

- `TauCeti.Weights.GaloisRep.frobCharpoly` (constructor): For a finite-dimensional representation ρ and a supplied group element g, frobCharpoly(ρ,g) is the characteristic polynomial of ρ(g). The arithmetic place adapter evaluates it at a geometric Frobenius lift; inertia invariance and conjugacy prove independence of that lift and of the place above v.
- `TauCeti.Weights.GaloisRep.frobCharpoly_arith` (compatibility): For g in the group, frobCharpoly(ρ,g⁻¹) equals frobCharpoly(ρ∨,g). Taking g to be geometric Frobenius gives the arithmetic polynomial.
- `TauCeti.Weights.GaloisRep.frobCharpoly_roots_inv` (characterisation): Over an algebraically closed coefficient field, the root multiset of frobCharpoly(ρ,g⁻¹) is the inverse of the root multiset of frobCharpoly(ρ,g), with multiplicities.
- `TauCeti.Weights.GaloisRep.frobCharpoly_conj` (simp): For group elements g,h, frobCharpoly(ρ,hgh⁻¹) equals frobCharpoly(ρ,g); this handles conjugate decomposition groups.
- `TauCeti.Weights.GaloisRep.frobCharpoly_inertia` (simp): If inertia I(v) acts trivially under ρ and t belongs to I(v), then frobCharpoly(ρ,tg) equals frobCharpoly(ρ,g). This is the lift-independence interface.
- `TauCeti.Weights.GaloisRep.frobCharpoly_equiv` (functoriality): If an E-linear equivalence e intertwines ρ and σ at every group element, then frobCharpoly(ρ,g) equals frobCharpoly(σ,g) for every g.

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

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients`, `ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices`, `ArithmeticGaloisRepresentations:R01.2/decomposition-group-at-a-place`, `ArithmeticGaloisRepresentations:R01.2/frobenius-characteristic-polynomial`, `mathlib:IsArithFrobAt`, `mathlib:IsArithFrobAt.mul_inv_mem_inertia`, `mathlib:IsArithFrobAt.conj`, `mathlib:IsArithFrobAt.exists_of_isInvariant`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `mathlib:Representation`, `mathlib:Representation.dual`, `mathlib:LinearMap.charpoly`.

**Acceptance.**

- The ℓ-adic cyclotomic character χ_ℓ satisfies χ_ℓ(Frob_v^arith) = q_v for v ∤ ℓ, so P_v(ℚ_ℓ(1), T) = T − q_v⁻¹.
- For an elliptic curve E/K with good reduction at v ∤ ℓ: P_v(H¹, T) = T² − a_vT + q_v on H¹ = V_ℓ(E)^∨, and P_v(V_ℓE, T) = T² − (a_v/q_v)T + 1/q_v.

**Planet:** Arithmetic and geometric Frobenius.

**Sources and locators.**

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

- `TauCeti.Weights.GaloisRep.IsPureOutside` (data): With supplied inertia groups I(v), geometric lifts F(v) and residue cardinalities q(v), IsPureOutside(ρ,I,F,q,T,w) means: at each v outside T, inertia acts trivially and every Frobenius root is algebraic over ℚ and has absolute value q(v)^(w/2) under every complex coefficient embedding. Here w is an integer. The continuous local-place carrier is a requested arithmetic adapter.
- `TauCeti.Weights.GaloisRep.HasIntegralFrobOutside` (data): HasIntegralFrobOutside(ρ,I,F,T) means: at every v outside T inertia acts trivially and the characteristic polynomial of ρ(F(v)) is the image of a polynomial in ℤ[X]. Algebraic-integral roots alone do not give rational integer coefficients.
- `TauCeti.Weights.GaloisRep.IsIotaPureOutside` (data): IsIotaPureOutside(ρ,I,F,q,T,ι,w) means: at every v outside T inertia acts trivially and each Frobenius root has absolute value q(v)^(w/2) under the chosen field embedding ι. Here w is real and no algebraicity is asserted.
- `TauCeti.Weights.GaloisRep.IsPureOutside.mono` (compatibility): For fixed I,F,q,w, enlarging T to T′ preserves IsPureOutside whenever T is contained in T′.
- `TauCeti.Weights.GaloisRep.IsPureOutside.weight_unique` (characterisation): For nonzero V, a place v outside T with q(v)>1, and a complex coefficient embedding, two integer weights witnessing IsPureOutside are equal. Genuine finite residue fields satisfy q(v)>1; the prototype retains it as a hypothesis. The zero representation is pure of every weight.
- `TauCeti.Weights.GaloisRep.isPureOutside_iff` (characterisation): IsPureOutside is equivalent to the displayed pointwise inertia-triviality and algebraic/all-embeddings root condition; the reverse implication constructs the predicate without unfolding it.
- `TauCeti.Weights.GaloisRep.hasIntegralFrobOutside_iff` (characterisation): HasIntegralFrobOutside is equivalent to pointwise inertia-triviality and existence of an integer polynomial mapping to the Frobenius characteristic polynomial.
- `TauCeti.Weights.GaloisRep.isIotaPureOutside_iff` (characterisation): IsIotaPureOutside is equivalent to pointwise inertia-triviality and the chosen-embedding root norm condition.
- `TauCeti.Weights.GaloisRep.HasIntegralFrobOutside.mono` (functoriality): For fixed I,F, enlarging T to T′ preserves HasIntegralFrobOutside whenever T is contained in T′.
- `TauCeti.Weights.GaloisRep.IsIotaPureOutside.mono` (functoriality): For fixed I,F,q,ι,w, enlarging T to T′ preserves IsIotaPureOutside whenever T is contained in T′.
- `TauCeti.Weights.GaloisRep.IsPureOutside.iota` (compatibility): Integer-weight IsPureOutside implies IsIotaPureOutside for each chosen complex coefficient embedding, with the same weight regarded as real.

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
- `TauCeti.Weights.isPureOutside_zero` (degenerate): The rank-zero representation is pure of every integer weight, its Frobenius polynomial is 1, and it has integral Frobenius polynomials.

**Construction/proof contract.**

1. Purity: apply DWP.0/endomorphism-weights to ρ(Frob_v^geom) at each v ∉ T with base q_v. It is well defined because the characteristic polynomial is (node arithmetic-and-geometric-frobenius).
2. Integrality: P_v(ρ, T) ∈ ℤ[T]. When P_v has rational coefficients, this holds exactly when every root is an algebraic integer, since P_v is monic.
3. ι-purity: DWP.0/iota-weight on each eigenvalue.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `DeligneWeightsAndPurity:DWP.0/endomorphism-weights`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `mathlib:Representation.ofDistribMulAction`.

**Acceptance.**

- ℚ_p(n) is pure of weight −2n outside {v | p}. It has integral Frobenius polynomials exactly when n ≤ 0.
- For an elliptic curve over K with good reduction outside T, H¹ is pure of weight 1 and integral outside T together with the places above p; its Tate module has geometric weight −1.

**Planet:** Pure Galois representations.

**Sources and locators.**

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

**Sources and locators.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154. Weights add under tensor product.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(ii), p. 154. The dual of a pure object of weight n has weight −n.
- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.5, p. 13. Purity passes to subrepresentations.

### Theorem: Purity and integrality under restriction to G_L and induction from G_L

Node `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`.

Let L/K be a finite extension of number fields and T a finite set of places of K. (i) If ρ is pure of weight w outside T, then ρ|G_L is pure of weight w outside the set T_L of places above T, with integral Frobenius polynomials if ρ has them. (ii) If ρ is a representation of G_L pure of weight w outside T_L, then Ind_{G_L}^{G_K} ρ is pure of weight w outside T ∪ {v ramified in L}, with integral Frobenius polynomials if ρ has them. Here P_v(Ind ρ, T) = ∏_{u | v} P_u(ρ, T^{f(u|v)}) for v unramified in L and outside T.

**Hypotheses and conventions.**

- Restriction: compatible Frobenius classes satisfy Frob_u^geom=(Frob_v^geom)^{f(u|v)} modulo inertia, hence after applying an unramified ρ, and q_u=q_v^{f(u|v)}.
- Induction needs v unramified in L, so that Ind ρ is unramified at v; the ramified places are added to T.

**Construction/proof contract.**

1. Restriction: ρ(Frob_u^geom) = ρ(Frob_v^geom)^{f}, and pure of weight w relative to q_v implies pure of weight w relative to q_v^f (DWP.0/finite-field-base-extension-of-weights). Integral polynomials stay integral, since the roots are powers of algebraic integers.
2. Induction, Frobenius formula: use R01.2/local-restriction's Mackey decomposition over the places u | v, together with R01.1/continuous-induction. Because L/K and ρ are unramified at these places, inertia acts trivially. In the geometric-Frobenius coset basis each summand has the cyclic block action built from Frob_u; R01.2/determinant-of-a-cyclic-block-endomorphism gives P_u(ρ, T^f). This unramified block argument does not import a Weil–Deligne local-factor aggregate.
3. Weights: the roots of P_u(ρ, T^f) are the f-th roots β of the roots α of P_u. From |β|^f = |α| = q_u^{w/2} = q_v^{fw/2} one gets |β| = q_v^{w/2} for every complex conjugate (DWP.0/weil-number-base-extension). β is algebraic, and integral if α is.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `ArithmeticGaloisRepresentations:R01.2/decomposition-group-at-a-place`, `ArithmeticGaloisRepresentations:R01.2/local-restriction`, `ArithmeticGaloisRepresentations:R01.1/continuous-induction`, `ArithmeticGaloisRepresentations:R01.2/determinant-of-a-cyclic-block-endomorphism`.

**Acceptance.**

- K = ℚ, L = ℚ(i), ρ the trivial character of G_L: Ind ρ = 1 ⊕ χ_{−4}, pure of weight 0 outside {2}. At p ≡ 3 mod 4, P_p = T² − 1 = P_u(1, T²), with one place u of degree 2.

**Sources and locators.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Stabilités (1.2.5)(i), p. 154. Stability under inverse image and finite direct image: restriction and induction.
- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §2.5, proof of Lemma 2.10, p. 14. Purity used for an induced representation.

### Theorem: Finite dimensionality implies neither algebraicity nor purity

Node `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`.

Let k = 𝔽_q and ℓ ∤ q. For every u ∈ ℤ_ℓ^× there is a unique continuous character χ_u : Gal(k̄/k) → ℤ_ℓ^× with χ_u(F) = u. ℤ_ℓ^× contains elements transcendental over ℚ. For such u, (ℚ_ℓ, χ_u) is a continuous one-dimensional representation whose Frobenius eigenvalue is not algebraic, so it is pure of no weight, although it is ι-pure of the real weight 2 log_q |ι(u)| for each ι. For ℓ odd, u = 2 and q an odd prime, χ_u is algebraic but pure of no integer weight.

**Hypotheses and conventions.**

- This is R34.1's acceptance statement: purity and algebraicity are theorems about particular representations (DWP), not consequences of continuity and finite dimension.
- u must be an ℓ-adic unit for continuity on the compact group Gal(k̄/k). A Weil-group representation (Weil II (1.1.10)) allows any u ∈ ℚ̄_ℓ^×.

**Construction/proof contract.**

1. Gal(k̄/k) ≅ Ẑ, topologically generated by F. For each finite quotient of the profinite group ℤ_ℓ×, the image of u has finite order, so n ↦ u^n factors through a finite cyclic quotient of ℤ. These compatible maps extend uniquely to Ẑ and their inverse limit is a continuous character. This covers ℓ=2 as well as odd ℓ; it does not assume ℤ_ℓ× is procyclic.
2. ℤ_ℓ^× is uncountable and the algebraic numbers are countable, so transcendental units exist; for instance 1 + ℓt with t ∈ ℤ_ℓ transcendental.
3. A Weil q-number is algebraic (DWP.0/weil-q-number), so χ_u is pure of no weight. Its ι-weight is defined for every ι (DWP.0/iota-weight).
4. u = 2: if |2| = q^{w/2} with q an odd prime, then 4 = q^w, impossible for integer w.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/iota-weight`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.2/unramified-character-lambda`.

**Acceptance.**

- u = 1 + ℓ is algebraic (rational) and has ι-weight 2 log_q(1 + ℓ) for every ι; it is pure of no weight unless 1 + ℓ is a power of √q.

**Sources and locators.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, (1.2.6), p. 154. Algebraicity is a consequence of purity at every ι, and fails without it.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §1.2, Variante (1.2.3), p. 154. The weight terminology for representations of Gal(k̄/k).

### Theorem: Purity against a chosen embedding versus all embeddings

Node `WeightsInEtaleCohomology:R34.1/purity-at-every-embedding-versus-a-chosen-embedding`.

Let ρ be as in pure-and-integral-galois-representations, with coefficients in ℚ̄_p. (i) ρ is pure of weight w outside T iff it is ι-pure of weight w outside T for every field isomorphism ι : ℚ̄_p ≅ ℂ. (ii) If every P_v(ρ, T), v ∉ T, has coefficients in a number field E ⊂ ℚ̄_p, then ρ is pure of weight w outside T iff, for every embedding σ : E → ℂ, all roots of σ(P_v(ρ, T)) have absolute value q_v^{w/2}. (iii) At a given Frobenius polynomial with coefficients in E, the condition for one chosen ι checks only ι|_E and need not imply either all-embeddings criterion, even at integer weight zero. If the polynomial has rational coefficients, its full root multiset at one embedding already contains every algebraic conjugate. The counterexample below is over a finite field, not a construction of a globally ι-pure number-field representation.

**Hypotheses and conventions.**

- (i) needs #ℚ̄_p = 𝔠, which DWP.0/embeddings-into-the-complex-numbers proves.
- (ii) is the form in which purity is checked for compatible systems with coefficients in a number field.

**Construction/proof contract.**

1. (i): apply DWP.0/weil-number-iff-iota-pure-for-every-iota to each eigenvalue at each v ∉ T.
2. (ii): the roots of P_v lie in a finite extension of E. Their complex conjugates are the roots of σ(P_v) for the embeddings σ, so this is the definition of a Weil q_v-number (DWP.0/weil-q-number).
3. (iii): use the irreducible reciprocal polynomial f(X)=X⁴−X³−X²−X+1 over ℚ. Its reduction mod 2 is irreducible (no linear factor and no factor X²+X+1). Setting t=X+X⁻¹ gives t²−t−3=0. The root t=(1−√13)/2 lies in (−2,2), giving two roots of absolute value 1, while t=(1+√13)/2>2 gives a positive real reciprocal pair, one root larger than 1. A root α is an algebraic unit. In a finite extension of ℚ_ℓ containing α, the profinite-unit construction of the preceding node gives a continuous rank-one representation of Gal(F_qbar/F_q) with geometric Frobenius α. Choose a complex embedding taking α to a unit-circle root: it is ι-pure of integer weight 0, but is not pure for all embeddings. This is a pointwise finite-field counterexample; the proof asserts no global number-field example.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`.

**Acceptance.**

- For H¹ of an elliptic curve with CM by E = ℚ(i), P_v has coefficients in ℚ ⊂ E, and the check over the two embeddings of E reduces to one.
- The irreducible polynomial X⁴−X³−X²−X+1 has both a unit-circle root and a root of norm greater than 1. A single chosen embedding can therefore give weight zero while all-embeddings purity fails.

**Sources and locators.**

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

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `DeligneWeightsAndPurity:DWP.0/finite-field-base-extension-of-weights`, `DeligneWeightsAndPurity:DWP.5/punctual-purity-and-mixedness`, `DeligneWeightsAndPurity:DWP.7/integral-sheaf`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- The constant rank-one sheaf has weight 0; Q_p(1) has weight −2 on its prime-to-p model; neither convention is reversed at degree-d points.

**Planet:** Representation and sheaf weights.

**Sources and locators.**

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

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.8/mixed-complexes`, `DeligneWeightsAndPurity:DWP.8/pure-complexes`, `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`.

**Acceptance.**

- A weight-0 constant sheaf on a smooth curve, shifted by [1], has complex weight 1; adding (1) changes it to −1.
- The normalization F(N)[2N] keeps its complex weight.

**Planet:** Shifted cohomological weights.

**Sources and locators.**

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
- The weight 1 of H¹ is imported from the existing DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties target.

**Construction/proof contract.**

1. DWP.1/frobenius-endomorphism-over-a-finite-field supplies π_A and its q-power action on geometric points. R01.6/tate-module-of-an-abelian-variety gives the coordinatewise Galois action, and R01.6/functoriality-products-and-isogenies sends π_A to the levelwise maps x_n↦π_A(x_n). These agree with arithmetic Frobenius at every torsion level, hence on the inverse limit and its rationalization. This finite-field comparison does not import the broader number-field good-reduction aggregate.
2. V_ℓ(π_A) has characteristic polynomial P_{π_A} (AbelianSchemesAndArithmeticModuli A6/characteristic-polynomial-on-tate-module).
3. The geometric Frobenius on V_ℓA is V_ℓ(π_A)⁻¹. On the dual H¹ = Hom(V_ℓA, ℚ_ℓ), the contragredient of V_ℓ(π_A)⁻¹ is V_ℓ(π_A)^T (DWP.0/spectra-of-tensor-products-and-duals), with characteristic polynomial P_{π_A}. The isomorphism H¹ ≅ Hom(V_ℓA, ℚ_ℓ) is AbelianSchemesAndArithmeticModuli A4's (Milne 12.1, 12.5).
4. Weights: the eigenvalues on V_ℓA are the inverses of those on H¹.
5. Elliptic curves: P_π(1) = deg(1 − π) = #E(𝔽_q) and P_π(0) = deg π = q.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.1/arithmetic-and-geometric-frobenius`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `AbelianSchemesAndArithmeticModuli:A4`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `ArithmeticGaloisRepresentations:R01.6/tate-module-of-an-abelian-variety`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies`.

**Acceptance.**

- E: y² = x³ − x over 𝔽_3: #E(𝔽_3) = 4, a = 0, P_π = T² + 3; on H¹ the geometric Frobenius has eigenvalues ±i√3, weight 1, and on V_ℓE ∓i/√3, weight −1.

**Planet:** Tate module versus H¹.

**Sources and locators.**

- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, p. 75. The source defines the q-power Frobenius morphism: identity on the space and q-th power on functions; on geometric points it is arithmetic Frobenius.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, §1, proof of Theorem 1.1, p. 76. The roots of P_π are the eigenvalues of π on T_ℓA.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I, Remark 12.5, p. 56. The comparison with H¹ is Galois-equivariant.

### Theorem: Tate modules and H^i of abelian varieties and curves with good reduction are pure and integral

Node `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

Let A be an abelian variety of dimension g over a number field K with good reduction outside a finite set T of finite places, and p a prime. Then ρ = H¹(A_K̄, ℚ_p) = (V_pA)^∨ is pure of weight 1 outside T ∪ {v | p} with integral Frobenius polynomials. At v ∉ T ∪ {v | p}, P_v(ρ, X) = P_{π_{A_v}}(X), the characteristic polynomial of the Frobenius endomorphism of the reduction A_v, independently of p. V_pA itself is pure of weight −1 there; if g>0 its geometric Frobenius polynomial is not integral, since its constant coefficient has absolute rational denominator q_v^g. For g=0 the polynomial is 1 and is integral. For 0 ≤ i ≤ 2g, H^i(A_K̄, ℚ_p) = ∧^i H¹ is pure of weight i and integral, with P_v the characteristic polynomial of π_{A_v} on ∧^i. The same holds for H¹ of a smooth projective geometrically connected curve over K with good reduction outside T, through the Jacobian of its residue curve after smooth proper base change.

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
6. Curves: apply SF.2 smooth proper base change directly to the smooth proper model of C, identifying H¹(C_K̄) with H¹(C_v over the algebraic closure of k_v). DWP.1/weights-of-the-cohomology-of-curves compares the latter Frobenius action with H¹ of the Jacobian of C_v and supplies its weight-one integer polynomial. No good-reduction theorem for the generic Jacobian is needed in this route.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.1/pure-and-integral-galois-representations`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `AbelianSchemesAndArithmeticModuli:A4`, `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisRepresentations:R01.6/specialisation-of-torsion-at-good-reduction`.

**Acceptance.**

- E/ℚ: y² = x³ − x has good reduction outside {2}. At ℓ = 3, P_3(H¹, X) = X² + 3: weight 1, integral. On V_pE the polynomial is X² + 1/3.
- det H¹(A) = ∧^{2g}H¹ = ℚ_p(−g): weight 2g, with P_v = X − q_v^g.

**Planet:** Purity of Tate modules.

**Sources and locators.**

- [Diophantine problems and p-adic period mappings](https://arxiv.org/abs/1807.02721), §3.1, (3.2), p. 16. The Galois representation on the étale cohomology of a fibre.
- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter I, Theorem 12.1(b), p. 55; Remark 12.5, p. 56; Chapter II, Corollary 1.5 and Remark 1.6(a), p. 78. The Galois-equivariant exterior-power description of H^i and the product eigenvalues of Frobenius supply the higher-degree weight calculation. The polynomial P_r(t) on p. 78 uses the reciprocal Euler-factor variable; distinguish it from det(X−F).
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

**Sources and locators.**

- [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter II, proof of Theorem 1.1, p. 76. The bound on #A(𝔽_{q^m}).

### Theorem: Curve traces over all residue extensions

Node `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`.

Let C/K be smooth projective geometrically connected of genus g with smooth proper reduction C_v over F_q, v not above l. If α₁,…,α₂g are the roots of P_v(H¹(C),X), then for every m≥1, #C_v(F_{q^m})=1+q^m−Σα_i^m and |#C_v(F_{q^m})−(q^m+1)|≤2g q^{m/2}. H⁰ has eigenvalue 1 and H² has eigenvalue q; the Abel–Jacobi pullback H¹(Jac C)→H¹(C) identifies the Frobenius actions. Genus zero gives q^m+1 and genus one agrees with the elliptic trace recurrence t₀=2, t₁=a_v, t_m=a_v t_{m−1}−q t_{m−2}.

**Hypotheses and conventions.**

- Smooth proper reduction and geometric connectedness are required; singular fibres do not have this pure H¹ statement.
- The fixed-point formula and Jacobian comparison are supplier theorems, not new trace or positivity proofs here.

**Construction/proof contract.**

1. Apply SF.2 smooth proper base change directly to C. Then use DWP.1/weights-of-the-cohomology-of-curves to identify the Frobenius action on H¹ of the residue curve with H¹ of its Jacobian; no smooth proper model of the generic Jacobian is needed.
2. Apply the imported fixed-point trace formula to F^m; the top-degree Tate line has eigenvalue q^m.
3. Use the Weil estimate for curves for each α_i, and Cayley–Hamilton in rank two for the recurrence.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- For y²=x³−x over F₅ there are eight points, a₅=−2, t₂=−6 and #E(F₂₅)=32.
- P¹ gives q^m+1 with zero H¹.

**Planet:** Curve traces.

**Sources and locators.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §1 (1.5.1), p. 275; (1.13)–(1.15), pp. 278–279. The fixed-point formula and the q-power Frobenius yield point counts over every finite extension.

## R34.3 Arithmetic specialization and the actual comparison models

The specialization trait is excellent and henselian, with finite residue field and l invertible in its mixed-characteristic valuation ring. The family is proper. Its comparison uses the actual compatible constructible coefficient sheaves or complexes, with constant coefficients as one case, and is equivariant for the decomposition group. The existing LPV.0 adic-realization target requires uniform constructibility/amplitude and derived-completeness; applying it to Carayol’s nonconstant system additionally requires the recorded transition-map and Mittag–Leffler checks.

The curve formulas use the geometric special fibre, its normalization and geometric dual graph, with the descended action on components and branches. They apply after an actual modular or Shimura model has the required nodal reduction over a named finite extension. Carayol’s general level models use his normalization sequence, coefficient extension and residual term A; that term is removed only on the cuspidal eigensummand. Saito’s higher-dimensional model is instead over V finite over the completed maximal unramified extension of E_q. Its residue field is algebraically closed; a finite-field weight or finite-local comparison requires the separate compatible descent input. CP.4 supplies the generic geometric comparison, and R06.5 receives the actual model verification. The algebraic Picard–Lefschetz proof interior and actual-system adic comparison remain gaps.

### Theorem: Specialization over an arithmetic trait

Node `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

Let S=Spec O_L be an excellent henselian trait with mixed-characteristic fraction field L and finite residue field k, l invertible in O_L, and f:X→S proper of finite type. Put Λ_n=Z/l^n, and let ℱ_n be a compatible system of bounded constructible Λ_n-complexes on X with finite Tor-amplitude. Write ℱ_{n,s} and ℱ_{n,η} for its special and generic restrictions. Proper base change identifies RΓ(X_sbar,RΨℱ_{n,η}) with RΓ(X_etabar,ℱ_{n,η}), equivariantly for decomposition-group action. The specialization map RΓ(X_sbar,ℱ_{n,s})→RΓ(X_etabar,ℱ_{n,η}) and the nearby/vanishing triangle yield the exact specialization sequence. The constant case is ℱ_n=Λ_n. For adic realization, require uniform constructibility/amplitude and derived-completeness; the comparisons must commute with transition maps before deriving inverse limits, and only then tensoring with Q_l.

**Hypotheses and conventions.**

- Neither generic smoothness alone nor replacing the arithmetic trait by a trait over an algebraically closed field gives the required mixed-characteristic comparison.
- Adic passage uses R lim of the actual coefficient system, not an unchecked equality H^i(lim ℱ_n)=lim H^i(ℱ_n); verify the uniform finiteness, derived-completeness and Mittag–Leffler inputs named by the LPV.0/SF.2 requests.
- For Carayol’s application ℱ_n is the nonconstant finite-level lisse coefficient sheaf extended by §4.1’s étale level covers. The constant-coefficient example alone is insufficient; check the stated compatibility and adic hypotheses for that system.

**Construction/proof contract.**

1. Apply LPV.0 derived-nearby-cycles and proper base change to each ℱ_{n,η} on the actual trait, with specialization from ℱ_{n,s}.
2. Identify the Galois action through the geometric generic point and form the LPV specialization sequence.
3. Transport finite-level comparisons functorially; use the requested adic completion comparison to control derived inverse limits.

**Direct prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude`, `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change`, `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization`.

**Acceptance.**

- At good reduction with a lisse extension RΦ=0, specialization is an isomorphism and inertia acts trivially.
- A nonproper affine degeneration cannot use the proper comparison without a compact-support replacement.

**Planet:** Arithmetic specialization.

**Sources and locators.**

- [Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §4.1–§4.3, pp. 423–424. The actual arithmetic-model vanishing-cycle sequence is Weil equivariant; §4.1 constructs compatible finite-level sheaves.

### Theorem: Normalization and nodes on modular and Shimura models

Node `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

For a proper semistable curve C/O_L with geometrically reduced nodal special fibre, put Y=C_s×_k k̄, let ν:Ỹ→Y be its normalization and Γ its geometric dual graph, and take l≠char k. Then the imported node calculation yields 0→H¹(Γ,Q_l)→H¹(Y,Q_l)→H¹(Ỹ,Q_l)→0 and 0→H¹(Y,Q_l)→H¹(C_Lbar,Q_l)→H₁(Γ,Q_l)(−1)→0. Frobenius permutes the components and branches; the sequences are equivariant. Apply these formulas to a ModularCurvesPartII R13.5 or R18.2 model only after its semistability is proved over a named finite extension. For Carayol’s general level models, use his actual specialization sequence and normalization filtration, not an assertion that all Drinfeld-level models are nodal.

**Hypotheses and conventions.**

- Λ_n torsion calculations, lisse coefficient extensions and inverse-limit comparison come from the preceding node.
- The displayed graph formulas are for constant coefficients on an actual semistable curve. Carayol’s coefficient sheaves use his §4.5 normalization sequence and residual term A; A is removed only on the cuspidal eigensummand by §4.4.
- Use the geometry-only R13.5 bad-fibre/regular-model supplier. R13.6 is a downstream boundary/degeneration export requiring R34.3, so it cannot be imported as this node’s model-construction prerequisite.
- All special-fibre, normalization and graph cohomology in the displayed sequences is geometric; the residue Galois/Frobenius action is the descended action, which can permute geometric components and branches.

**Construction/proof contract.**

1. Request the semistable model and branch data from the modular/Shimura geometry owner.
2. Import LPV.7:semistable-curves normalization and node calculations, and identify graph cohomology and the Tate twist in vanishing cycles.
3. In Carayol’s coefficient application import the existing R19.2 filtration and verify its residual term disappears on the cuspidal summand; generic nearby cycles suffice, with no weight theorem.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-choice-basechange-compatibility`, `ModularCurvesPartII:R13.5`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AutomorphicGaloisRepresentations:R19.2/carayol-vanishing-cycle-filtration`.

**Acceptance.**

- A good fibre has Γ with no cycles, so graph terms vanish.
- A split nodal genus-one fibre has one graph cycle and the vanishing quotient Q_l(−1); it does not have pure weight-one good reduction.

**Planet:** Nodal arithmetic fibres.

**Sources and locators.**

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

**Sources and locators.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §4 (4.2)–(4.3), pp. 288–289. The source replaces the complex disk by a henselian trait and treats the odd and even formulas separately.

### Theorem: Saito’s semistable comparison model

Node `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

In Saito §6 Lemma 3’s Hilbert modular realization, choose sufficiently small K,H with every geometric component of M_K of genus greater than 1, and the auxiliary imaginary quadratic field E₀ split at p, so E_q≅F_p. As in §7, take a sufficiently large finite extension V of the completed maximal unramified extension of E_q, and the minimal semistable model over O_V. V is not asserted finite over E_q itself. Under Lemma 4’s unchanged p-components of levels and lattices (the H-level has unchanged q-component), the curve covers extend uniquely as finite étale maps, the universal abelian scheme extends, and the prime-to-p isogenies extend as étale isogenies. Lemma 3’s correspondence e, a linear combination of permutations and prime-to-p endomorphisms, acts on this model. The resulting proper X/O_V is an abelian scheme over the semistable curve, with smooth projective strata Y^(0),Y^(1) over the algebraically closed residue field and no higher intersections. Its l-adic and log-crystalline weight spectral sequences carry the extended projector and Hecke actions. Section 8 takes V as the completion of a Galois extension so that the descent Galois/Weil action extends to the model. Finite-field models of the strata and their Frobenius action, or descent to a finite local extension when required by a comparison carrier, are separate requested inputs.

**Hypotheses and conventions.**

- K,H and their comparison levels satisfy the sufficiently-small hypotheses of Lemmas 3–4; every geometric component of M_K has genus greater than 1. The auxiliary E₀ splits at p, identifying E_q with F_p.
- Lemma 4(1) keeps K_p=(g⁻¹K₁g)_p and H_q=H₁,q; Lemma 4(3) keeps the p-components of both lattice pairs. Merely saying prime-to-p level is insufficient without these equalities.
- The extension in §7 is finite over the completed maximal unramified base, whose residue field is algebraically closed. Section 8 specifies the Galois descent action. Do not use #k(V) or a finite-local-field comparison theorem directly on this base.
- The semistable/log-crystalline geometric comparison belongs to CP.4. Its finite-local-extension and finite-residue-field descent hypotheses are requested explicitly below; R34.3 exports the actual model verification to R06.5, avoiding the reverse dependency.

**Construction/proof contract.**

1. Apply §7 Lemma 4 over its actual completed-unramified base, retaining the genus, splitting and unchanged-component hypotheses to extend the curve covers, abelian schemes and isogenies.
2. Use §6 Lemma 3’s actual correspondence and §8 functoriality to extend e and the Hecke action; the unique minimal model carries the Galois descent action specified on p. 34.
3. Apply the requested semistable comparison and the l-adic/log-crystalline spectral sequences to the same strata, comparing correspondence traces as in Claim 4(1). For finite-field weights or a finite-local-field carrier, first supply the additional descent/comparison input recorded as a gap, preserving Frobenius, N and the correspondence action.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-weight-spectral-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`, `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-monodromy-and-curve-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `CohomologyComparisons:CP.4`, `CohomologyComparisons:CP.4/semistable-period-comparison`.

**Acceptance.**

- A change of level with altered p-component does not satisfy the finite étale extension claim.
- Agreement of alternating traces is separated from equality of N and the local purity conclusion of R34.6.
- V in the cited construction is finite over the completed maximal unramified extension, not finite over E_q. Its algebraically closed residue field cannot be assigned a finite cardinality for a weight calculation.

**Planet:** Semistable comparison model.

**Sources and locators.**

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

**Direct prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`, `EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- When the parameter open has no F_q-point, choosing a closed point still supplies the pencil.
- F^d-purity cannot be transported by keeping q fixed; the base becomes q^d.

**Planet:** Finite-field pencils.

**Sources and locators.**

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

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`, `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

**Acceptance.**

- A nonzero radical is removed; it cannot be treated as an absolutely irreducible summand.
- For odd n in residue characteristic 2 the source’s odd branch is retained; the excluded even branch is not silently included.

**Planet:** Vanishing quotient.

**Sources and locators.**

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

**Sources and locators.**

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §3 (3.1)–(3.2), pp. 283–284; §5 (5.10), p. 293. The estimate requires an open symplectic image and rational local factors; the pencil’s original Q_l-model supplies the open image.

## R34.5 Parabolic realizations, projectors and arithmetic hard Lefschetz

The source construction is the image of H_c¹ in H¹ for Sym^{k−2}R¹ of the universal elliptic scheme. Coefficient weight k−2 and cohomological degree 1 give weight k−1. The upper compact-support bound and lower smooth-lisse bound together make the image pure. The full H¹ of an open curve can include other boundary weights and is not substituted for this image.

The classical smooth-projective comparison uses the existing R19.1/scholl-projector target for k≥3, instantiated with actual GH.0/R14.3 compactification, boundary/resolution and good-prime correspondence data. A vector-space idempotent alone cannot provide those data. GH.0’s CM-product projector has degree 2r+1; the classical Scholl realization has degree r+1. Saito’s Hilbert model and q₀-shifted projector are requested from R18.2. The modular abelian quotient supplies the separate k=2 comparison: its cohomological summand M has geometric weight +1, while ρ=M∨ has geometric weight −1 and arithmetic weight +1. Algebraic-integral roots belong to M’s geometric polynomial, equivalently ρ’s arithmetic polynomial; neither coefficient-field factor automatically lies in Z[X]. Hard Lefschetz is the absolute arithmetic cup-product comparison with an ample class and restored twists, restricted only to a commuting projector.

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

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions`, `DeligneWeightsAndPurity:DWP.0/spectra-of-tensor-products-and-duals`, `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive`.

**Acceptance.**

- k=2 gives weight 1; k=12 gives weight 11, not 12 or −11.
- The boundary part of H¹ is not automatically pure of this weight.

**Planet:** Parabolic purity.

**Sources and locators.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3 (3.3.6), p. 206; (3.7.1), p. 215. The parabolic image for Sym^k R¹ of an elliptic family is pure of weight k+1.
- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Theorem (5.1) and Lemma (5.3), pp. 168–169. The modular parabolic realization has total degree r+1, conditional on the usual Weil conjecture in this 1969 reduction; Weil II (3.7.1) supplies the unconditional theorem.

### Theorem: Kuga–Sato degree and projector comparison

Node `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

For a fine modular curve Y(M) with M≥3 and universal elliptic curve A→Y(M), r=k−2≥1, let A^r/Y(M) have a smooth projective compactification X over the chosen good-prime base. Use the existing R19.1/scholl-projector contract, with its actual classical compactification and good-prime extension data supplied by GH.0/R14.3, for the algebraic symmetric/degree-one projector identifying the parabolic Sym^r R¹ summand with a subquotient of H^{r+1}(X,Q_l) (equivalently its designated interior projector image), equivariantly for Hecke and Galois actions. At a prime p of smooth projective reduction with p∤Ml, that image has geometric weight r+1. With a Tate twist (b) its weight is r+1−2b. For the Hilbert analogue import the actual model and projector from R18.2, and use Saito’s degree q₀=(2g−1)(w−2): eH^q(X)≅H^{q−q₀}(M,F(k))⊗H⁰(N,F(χ₀^{(g−1)(w−2)})), retaining the auxiliary character and its weight.

**Hypotheses and conventions.**

- The classical branch has k≥3 and r≥1. R19.1/scholl-projector specifies the rational algebraic projector and its parabolic realization; GH.0/R14.3 must supply the compactification, boundary/resolution and good-prime correspondence data that instantiate it. The k=2 branch is the separate weight-two-jacobian-weight-comparison. The Hilbert analogue is requested from R18.2. A vector-space idempotent alone is not a geometric correspondence.
- Good primes require the actual model and correspondence to extend and commute with Frobenius; no integral statement follows merely from a rational projector.
- The Hilbert degree and character formula is not replaced by the classical r+1 formula.
- GH.0's CM-product nodes have total degree 2r+1 and import classical W_r from R14.3. They do not replace the degree-r+1 Scholl comparison or Saito's q₀-shifted Hilbert comparison. The existing rational Scholl target does not imply unrestricted integral freeness, saturation or projector extension at excluded denominator primes.

**Construction/proof contract.**

1. Use Deligne Lemmas 5.2–5.4: Leray for the abelian scheme splits its R^j terms by multiplication-by-m eigenvalues, identifying the degree r+1 subquotient.
2. Instantiate R19.1/scholl-projector using the actual GH.0/R14.3 compactification, boundary/resolution and good-prime correspondence data, then apply DWP.4/smooth-projective-purity to H^{r+1}. The retained model/projector gap records these construction obligations.
3. Apply purity under subquotients and the Tate normalization; in the Hilbert case use Saito Lemma 3 with its exact q−q₀ degree and auxiliary character. R18.2 supplies the Hilbert geometric construction; this is not an extension of GH.0’s CM-product projector.

**Direct prerequisites.** `GeneralizedHeegnerCycles:GH.0`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `ModularCurvesPartII:R14.3`, `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AutomorphicGaloisRepresentations:R19.1/scholl-projector`.

**Acceptance.**

- The classical k=12 summand lies in degree 11 of an eleven-dimensional compactification; weight 11 follows with twist zero.
- A correspondence that is merely idempotent on Betti cohomology supplies no unverified integral l-adic projector.

**Planet:** Kuga–Sato weights.

**Sources and locators.**

- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Lemmas (5.2)–(5.4), pp. 168–170. The fibre product and its compactification realize the parabolic local-system image in total degree r+1.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §6 Lemma 3, p. 30. The Hilbert Kuga–Sato projector has the stated total-degree shift and Hecke/Galois-compatible isomorphism.

### Theorem: Weight two and modular Jacobians

Node `WeightsInEtaleCohomology:R34.5/weight-two-jacobian-weight-comparison`.

For a modular Jacobian J and the abelian quotient A_f attached to a weight-two newform f, import the Hecke action and K_f⊗Q_l idempotents from ModularCurvesPartII R14.5. At p of good reduction, p∤Nl, H¹(A_f) is pure of weight 1 and has the integer Frobenius polynomial of the abelian variety. Its K_{f,λ} summand M_{f,λ} is geometrically pure of weight 1; the Tate-module eigensummand ρ_{f,λ}=M_{f,λ}∨ has geometric weight −1, hence arithmetic weight +1. Its characteristic polynomial has coefficients in K_f, generally not in Q or Z.

**Hypotheses and conventions.**

- Only weight two has this abelian-variety realization; higher weights use Kuga–Sato/parabolic cohomology.
- The geometric eigenvalues on the cohomological summand M, equivalently the arithmetic eigenvalues on ρ=M∨, remain algebraic integers. The geometric eigenvalues on ρ are their inverses and need not be integral. Neither coefficient-field factor is automatically a polynomial in Z[X].
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

**Sources and locators.**

- [Adjoint motives of modular forms and the Tamagawa number conjecture](https://arxiv.org/pdf/2512.02348v2), §5.4 Lemma 5.7, pp. 58–59. The rank-two eigensummand is over its coefficient field, rather than automatically over Q.
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

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.9/lefschetz-operator`, `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`, `DeligneWeightsAndPurity:DWP.4/smooth-projective-purity`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`, `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`, `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`.

**Acceptance.**

- For a=d, H⁰→H^{2d}(d) has weight zero on both sides.
- A projector not commuting with cup product is outside the restriction statement.

**Planet:** Arithmetic hard Lefschetz.

**Sources and locators.**

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4.1 Theorem (4.1.1), p. 217. The source suppresses twists after choosing Z_l≅Z_l(1) over the algebraic closure; the arithmetic map restores them.

## R34.6 Eigenform purity, good-prime compatibility and the restricted local export

For a fixed newform, the safe coefficient-descent target supplies rank two over K_{f,λ}; the independently requested geometric Hecke/Frobenius comparison identifies the normalized eigensummand made pure in R34.5. In DFG’s notation the normalized cohomological realization is M_g⊗M_{ψ_g^{-1}}; untwisted M_g has a different character normalization. The finite-character twist preserves weights but must be connected to the actual Hecke polynomial. DFG supplies integral étale modules at every λ, while its integral crystalline/comparison package is restricted outside S_N. The Ramanujan bound follows from the two roots at every coefficient embedding. The normalized cohomological realization has geometric weight k−1; its dual has the same arithmetic eigenform polynomial and geometric weight 1−k. The common good-prime polynomial follows from fixed Hecke eigenvalues and nebentypus, independently of equal root norms. The R24.5 fine carrier requires additional de Rham/crystalline and Hodge–Tate data; this polynomial theorem alone does not construct that full system.

The local theorem is imported from PadicHodgeTheory R06.6/hilbert-modular-form-compatibility-at-p, in Saito's Hilbert rank-two range. R34.6 verifies the actual coefficient, model, projector degree and auxiliary Tate twist against that theorem, retaining w≥k_i and its discrete-series hypothesis. It asserts the weights of the monodromy graded pieces and identifies Frobenius-semisimplified WD representations. Alternating trace agreement alone does not identify N: in rank two the purity statement also detects whether N vanishes. This is not a general mixed-characteristic weight–monodromy theorem. The crystalline coefficient-vanishing proof interior is a named gap; the l-adic proof and the projected spectral-sequence argument have been read.

### Theorem: Eigenform purity and the Ramanujan bound

Node `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`.

Let f be a normalized cuspidal newform of integer weight k≥2, level N and nebentypus ψ, with coefficient field K_f. At p∤Nl and any λ|l, the cohomological eigensummand M_{f,λ} supplied by the existing parabolic/Kuga–Sato realization is pure of geometric weight k−1. Its geometric polynomial, or equivalently the arithmetic polynomial on ρ_{f,λ}=M_{f,λ}∨, is P_{f,p}(X)=X²−a_p(f)X+ψ(p)p^{k−1}. For every σ:K_f→C both roots have norm p^{(k−1)/2}, hence |σ(a_p)|≤2p^{(k−1)/2}. With geometric convention ρ has weight 1−k; a twist M(b) has weight k−1−2b.

**Hypotheses and conventions.**

- Good primes p∤Nl, all coefficient embeddings, cuspidality, k≥2 and the source’s Hecke normalization are explicit.
- Rank two is over K_{f,λ} and comes from the existing newform-projector-and-coefficient-descent target. The Eichler-congruence polynomial is a separately requested geometric comparison independent of R34.6 purity. The current rank-two/Eichler aggregate returns to R34.6 and cannot serve as this prerequisite.
- No weight-one or noncuspidal extension is asserted.
- DFG supplies étale lattices at every coefficient prime; its integral crystalline data and comparison package are required only for λ∉S_N, where S_N consists of primes dividing Nk!. This export uses the specified characteristic-zero parabolic eigensummand and Hecke/Frobenius comparison at every λ. Excluded-prime crystalline comparison is not obtained by changing coefficients.
- M_{f,λ} denotes the normalized cohomological realization: when using DFG, supply the actual Hecke/Frobenius identification with (M_g⊗M_{ψ_g^{-1}})_λ. Untwisted M_g has geometric determinant ψ(p)^{-1}p^{k−1} in DFG's conventions and is not this normalized M_{f,λ}. The finite-character twist preserves weights and algebraic-integral eigenvalues; it does not imply rational coefficients.

**Consumers.**

- `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`: Consume the fixed eigenform good-prime polynomial and all-embeddings purity; import generic systems/operations from R24.5:operations.

**Construction/proof contract.**

1. Apply the R34.5 parabolic comparison to the specified eigensummand of coefficient weight k−2; use the Scholl/projector branch for k≥3 and the weight-two Jacobian comparison for k=2. The finite-character normalization does not change the weight.
2. Use the R19.1 newform-projector-and-coefficient-descent fine target for rank two and request its independent geometric Eichler-congruence polynomial and DFG character/Frobenius identification. DWP.10/weight-transport-to-stable-subquotients transports the specified normalized realization; the purity-dependent aggregate is not evidence for this producer's input.
3. Apply all-embeddings purity and the triangle inequality to the two roots; dualizing changes geometric to arithmetic Frobenius.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent`, `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`, `WeightsInEtaleCohomology:R34.1/purity-at-every-embedding-versus-a-chosen-embedding`, `AutomorphicGaloisRepresentations:R19.1`, `WeightsInEtaleCohomology:R34.5/weight-two-jacobian-weight-comparison`.

**Acceptance.**

- For Δ, k=12, P₂=X²+24X+2048; |−24|≤2·2^{11/2}.
- The dual cohomological convention gives geometric weight −11 on ρ_Δ, not +11.

**Planet:** Eigenform purity.

**Sources and locators.**

- [Formes modulaires et représentations l-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), §5 Theorems (5.1) and (5.6), pp. 168, 170–171. The geometric realization’s weight and congruence relation give the Fourier-coefficient bound.
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §3 (3.7.1), p. 215. Weil II supplies the unconditional parabolic purity used in this export.

### Theorem: Good-prime compatibility of a fixed eigenform

Node `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

For the same f and a fixed good prime p∤N, P_{f,p}∈K_f[X] is independent of λ for all λ∤p, after mapping K_f into K_{f,λ}. The coefficient-independent root bound comes from the preceding node for every embedding of K_f. The generic notion of a weakly/strictly compatible system, its tensor/dual/restriction operations and its bad-place WD conditions are imported from PotentialModularityAndCompatibleSystems R24.5:operations; this node establishes only the fixed-source good-prime polynomials. It does not derive λ-independence from equal weights.

**Hypotheses and conventions.**

- The common coefficient field and polynomial are proved by the same Hecke eigenvalues and nebentypus, before invoking a generic compatible-system contract.
- Exclude λ|p and bad primes dividing N from this good-prime claim; bad-place monodromy data require a separate theorem.
- The global exceptional set can be enlarged by source model denominators; integral crystalline comparison at primes dividing Nk! is not asserted by DFG’s integral premotive.
- DFG supplies étale lattices at every coefficient prime; its integral crystalline data and comparison package are required only for λ∉S_N, where S_N consists of primes dividing Nk!. This export uses the specified characteristic-zero parabolic eigensummand and Hecke/Frobenius comparison at every λ. Excluded-prime crystalline comparison is not obtained by changing coefficients.
- The R24.5 fine carrier also requires de Rham/crystalline and Hodge–Tate data. This good-prime polynomial theorem alone does not construct that full carrier or establish its local predicates; those obligations remain with R19/R06 and the R24.5 owner.

**Consumers.**

- `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`: Consume the fixed eigenform good-prime polynomial and all-embeddings purity; import generic systems/operations from R24.5:operations.

**Construction/proof contract.**

1. Use the imported Eichler congruence polynomial for each λ and the same coefficient embedding K_f→K_{f,λ}.
2. Identify a_p(f),ψ(p) algebraically in K_f; this supplies coefficient independence without comparing only absolute values.
3. Hand the proven data and all-embeddings bound to R24.5:operations; request R19.3 narrow its fixed-source strict/local realization to this interface as in RT-AREA-langlands-2/10.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `AutomorphicGaloisRepresentations:R19.1/newform-projector-and-coefficient-descent`, `AutomorphicGaloisRepresentations:R19.1`, `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

**Acceptance.**

- Two rank-two polynomials with roots of identical norms need not coincide: weight alone proves no compatibility.
- One fixed P_{f,p} is supplied at every λ∤p; different eigenforms do not share it.

**Planet:** Eigenform compatibility.

**Sources and locators.**

- [Adjoint motives of modular forms and the Tamagawa number conjecture](https://arxiv.org/pdf/2512.02348v2), §1.1–§1.3, pp. 6–13; §5.4 Lemma 5.7 and §5.5, pp. 58–60. Rank-two parabolic realization and the character-twisted Hecke/Frobenius comparison; all-λ étale modules are distinguished from restricted integral crystalline data. The actual independent geometric comparison and coefficient descent remain required.

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

**Direct prerequisites.** `DeligneWeightsAndPurity:DWP.10/weight-transport-to-stable-subquotients`, `DeligneWeightsAndPurity:DWP.0/weil-number-base-extension`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

**Acceptance.**

- A pure nonsemisimple representation is not automatically an input to the cited finiteness theorem.
- A pure coefficient-field projector factor is not automatically a rational integer polynomial.

**Planet:** Arithmetic weight transport.

**Sources and locators.**

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

**Consumers.**

- `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`: Consume Saito’s restricted rank-two local graded weights and Frobenius-semisimplified WD agreement with the actual source hypotheses.

**Construction/proof contract.**

1. Use R34.3’s actual semistable comparison model and Saito Lemma 3 with e° (pp. 30–31) to identify the projected degree-q₀+1 realization and its auxiliary character, retaining Galois and Hecke equivariance.
2. The twist b=(g−1)(w−2) changes the centre weight q₀+1 to q₀+1−2b=w−1. Verify the coefficient/projector comparison with the local WD carrier from the imported R06.6 fine theorem, including N.
3. Apply that source-qualified theorem to the identified rank-two f eigensummand; transport its Gr_i weights and N:Gr₁(1)≅Gr₋₁ through the actual comparison. The constant/nonconstant coefficient spectral-sequence and crystalline vanishing arguments remain the supplier’s proof, with the recorded gap.
4. Export the resulting normalized local weights and σ̌_h parameter to the fixed-source R19.3 consumer. Its generic compatible-system carrier and operations are R24.5:operations’s; use the eigenform-specific comparison instead of inferring it from root norms.

**Direct prerequisites.** `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`, `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

**Acceptance.**

- For N≠0 and w=2 the graded weights are 0 and 2; FNF⁻¹=q⁻¹N matches the twist.
- No arbitrary smooth projective mixed-characteristic variety is claimed to satisfy weight–monodromy.

**Planet:** Local monodromy weights.

**Sources and locators.**

- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §2 Theorem 1, Claim 1 and Theorem 2, pp. 12–13. The rank-two l-adic and p-adic WD graded pieces have weights w−1+i; the proof needs trace comparison and N agreement separately.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §8 Claims 4–5 and §9 Proposition 1′, pp. 35–39. The projected spectral sequence and constant/nonconstant coefficient calculations establish this restricted local theorem.
- [Hilbert modular forms and p-adic Hodge theory](https://arxiv.org/pdf/math/0612077v2), §6 Lemma 3 and auxiliary projector comparison, pp. 30–31. The actual degree q₀ and the auxiliary (g−1)(w−2) Tate twist give the local eigensummand centre weight w−1.

## Source normalization correction

Saito v2 §2, p. 12 prints σN=q^{n(σ)}Nσ and φN=pNφ while assigning n=1 to geometric Frobenius. With the source's own N:Gr₁(1)≅Gr₋₁ on p. 13, the correct normalization is FNF⁻¹=q^(−1)N and Nφ=pφN. The packet records this as WeightsInEtaleCohomology/E1, already known as PadicHodgeTheory/E50. The preprint page image was checked again in this authoring revision; the existing independent verdict is preserved, and the journal version remains unexamined. The local theorem and matrix acceptance check use the corrected sign.

## Supplier contracts and graph boundaries

A stage reference below is a requested interface. Sufficient current fine targets are imported by their exact node ids, including the continuous representation/Frobenius, DWP weight, EDC pairing/class/blowup, LPV curve/SNC and AGR Scholl/coefficient-descent targets. Their existence in a plan does not discharge their recorded proof or signature gaps. The nine requests below concern stronger actual-model, arithmetic comparison and descent inputs. No other packet is changed by this plan.

The R19.1 stage reference is specifically an independent geometric Eichler-congruence and normalization request. The existing path newform-rank-two-realisation → geometric-construction-and-the-eichler-congruence-relation → R34.6 cannot prove the input to R34.6 itself. The direct imports therefore use the parabolic, Scholl and newform-projector-and-coefficient-descent fine nodes. A fine-node graph check treats requested stages as terminal contracts and cannot certify acyclicity after arbitrary expansion of those stages.

### `AbelianSchemesAndArithmeticModuli:A4`

The Galois-equivariant H¹(A,Z_l)=Hom(T_lA,Z_l) and cup-product ∧^iH¹=H^i comparisons (Milne I.12.1 and Remark 12.5), including base-change naturality. These are absent from the inspected A6 nodes, which only provide endomorphism polynomials.

Used by: `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

### `SchemeAndStackFoundations:SF.2`

Actual lisse-adic sheaf/continuous π₁-representation equivalence, proper and smooth base change prime to the residue characteristic, cohomological fixed-point trace including the PR196/TraceFormula Layer 8 curve–Jacobian comparison, and arithmetic descent of finite-type equations/maps to a common finite residue extension. No inspected SF.2 node supplies these exact étale results: its coherent-duality nodes are not substitutes.

Used by: `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`, `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`.

### `LefschetzPencilsAndVanishingCycles:LPV.0`

Use LPV.0's existing finite-level functorialities, coefficient/trait change, constructibility and adic-nearby-cycle-realization targets. Verify their uniform constructibility/amplitude, finite-Tor, derived-completeness and Mittag–Leffler hypotheses on Carayol's specified compatible coefficient extensions, so that the R lim specialization comparison and rational inertia-equivariant triangle apply to this actual system. The existence of the generic adic target does not establish these arithmetic hypotheses. LPV.1 supplies inertia/variation/N rather than a second nearby-cycle realization.

Used by: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

### `ModularCurvesPartII:R13.5`

Construct the actual bad-prime modular curve model and its regular/semistable extension, node thicknesses, level-cover maps and geometric coefficient-extension inputs needed by the LPV formulas. Restrict to R13.5 geometry before applying R34.3; R13.6’s downstream degeneration outputs already depend on R34.3 and must not supply this model. Do not assert that every level model is semistable.

Used by: `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

### `HilbertModularVarietiesAndShimuraCurves:R18.2`

Carayol’s named M_{n,H} integral model with its coefficient extension and special-fibre normalization; separately, Saito §7 Lemma 4’s model over a finite extension of the completed maximal unramified base, with genus>1 components, sufficiently small levels, E₀ split at p, unchanged p/q-components, abelian scheme and prime-to-p isogeny extensions. Supply §6 Lemma 3’s actual Hilbert algebraic projector e, its degree q₀=(2g−1)(w−2), auxiliary character and equivariant comparison. Specify descent of strata and correspondence data to finite residue fields with the original Weil action, and descent to a finite local extension when the chosen comparison carrier requires it.

Used by: `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

### `GeneralizedHeegnerCycles:GH.0`

Supply the actual classical W_r compactification and the denominator/good-prime extension data needed to instantiate the existing R19.1/scholl-projector target, preserving its Hecke/Galois-compatible parabolic étale comparison and boundary/resolution hypotheses. Do not request a second abstract Scholl projector theorem. The available W_r×A^r CM nodes have total degree 2r+1 and do not by themselves supply these degree-r+1 model data. R14.3 retains the classical modular geometry; Saito's Hilbert model/projector belongs to R18.2.

Used by: `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

### `ModularCurvesPartII:R14.3`

Supply the actual classical Kuga–Sato compactification W_r and its modular good-prime/base-change geometry, with the universal elliptic local system and boundary/resolution data needed by the existing R19.1/scholl-projector comparison. The inspected R14.3 nodes give weight-two Betti/cohomological structures; they do not construct this higher-weight algebraic model. Coordinate those model inputs through GH.0 without duplicating the existing Scholl projector target. The k=2 modular-Jacobian branch remains separate.

Used by: `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`.

### `CohomologyComparisons:CP.4`

Instantiate the existing semistable-period-comparison fine theorem on the actual proper Saito model over O_V, verifying its base and chart hypotheses and Galois, Frobenius, N, twist and algebraic-correspondence compatibility. This is the independent geometric input to R34.3, which exports to R06.5. Saito's model is over a finite extension of the completed maximal unramified local field, not a finite extension of E_q. Supply descent to a finite local extension when required by the chosen comparison carrier, together with compatibility with the original Weil action. A generic semistable-period theorem alone does not verify this model/descent input.

Used by: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`.

### `AutomorphicGaloisRepresentations:R19.1`

Use the existing parabolic-realisation-premotive, scholl-projector and newform-projector-and-coefficient-descent fine nodes for characteristic-zero realizations at every finite λ. Supply the fixed cuspidal newform's geometric rank-two/Eichler-congruence polynomial comparison independently of Weights R34.6 purity, using auxiliary good-prime models. The current geometric-construction-and-the-eichler-congruence-relation returns to R34.6, so its independent geometric contract must be exposed without that edge before use here. Identify the normalized cohomological M_{f,λ}, its arithmetic dual, and X²−a_p(f)X+ψ(p)p^{k−1}. In DFG's convention compare M_g⊗M_{ψ_g^{-1}} with this normalized realization rather than identifying untwisted M_g by notation. Retain the actual projector, boundary/resolution and coefficient-descent obligations. No unrestricted integral freeness or Fontaine–Laffaille comparison at excluded λ is asserted.

Used by: `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

## Coverage, gaps and review obligations

| Stage | Coverage | Precise remaining work |
| --- | --- | --- |
| `WeightsInEtaleCohomology:R34.1` | planned | Instantiate the existing continuous-representation, sheaf-weight and mixed-complex fine targets on actual arithmetic carriers; resolve the SF.2 sheaf comparison and omitted full signatures. |
| `WeightsInEtaleCohomology:R34.2` | planned | Resolve the Galois-equivariant H¹/exterior-power and smooth proper base-change comparisons; instantiate the existing finite-field q-Frobenius/Tate functoriality and good-reduction specialisation targets, retaining the early Faltings rational-integer-polynomial qualification. |
| `WeightsInEtaleCohomology:R34.3` | planned | Verify the actual coefficient system for the existing adic realization, the retained mixed-characteristic algebraic Picard–Lefschetz proof interior and the named modular/Shimura model inputs. Supply model/stratum descent from Saito’s actual completed-unramified base, with the original Weil action and comparison compatibility. |
| `WeightsInEtaleCohomology:R34.4` | planned | Instantiate the existing EDC pairing/blowup and LPV pencil targets on the actual finite-field-descended pencil; retain their recorded proof/signature gaps and the original-Q_l monodromy hypotheses. |
| `WeightsInEtaleCohomology:R34.5` | planned | Supply the actual classical/Hilbert compactification and correspondence data needed by the existing Scholl/DWP fine targets, including good-prime extension and the separate k=2 Jacobian comparison. |
| `WeightsInEtaleCohomology:R34.6` | planned | Supply the independent geometric Eichler-congruence and DFG character-normalization comparison without the AGR return through R34.6; retain coefficient-descent and actual Hilbert projector obligations, including q₀ and the auxiliary twist. The imported R06.6 theorem still needs Saito §9 crystalline vanishing. Resolve Saito model descent and retain the R24.5 fine carrier/predicate and R19.3 fixed-source consumer boundaries. |

The pass stops at target coverage under PROTOCOL §0. The second independent review accepts all 27 targets after checking the prior reader synchronization and correcting two curve proof routes to use base change on the curve directly. Acceptance is of the planning contracts; the following gaps prevent any claim of closure.

### Arithmetic integral-to-adic specialization comparison

Carayol §4.1 constructs compatible finite-level extensions, and current LPV.0 fine nodes explicitly target adic nearby-cycle realization. This pass does not verify their uniform constructibility/amplitude, finite-Tor, derived-completeness and Mittag–Leffler hypotheses on Carayol's actual system or prove its R lim comparison. The narrowed LPV.0 and SF.2 requests name those inputs. The original pass recorded HTTP 403 for the public SGA7 II scan at the IAS URL; no fresh reading of that proof is claimed here.

Affected nodes: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`.

### Mixed-characteristic Picard–Lefschetz proof interior

The current LPV.2 odd-dimensional target retains G-algebraic-PL: Illusie's original algebraic Picard–Lefschetz blowup/base-change proof (2002, pp. 249–268) and its sign calculation remain unread there, despite the supplier's later exposition and correction checks. The prior Weights review described the unresolved specialization/cup-product compatibility through SGA7; that historical observation does not close the current algebraic route. This revision imports the target with its retained proof gap and claims no fresh reading of the missing Illusie or SGA7 proof.

Affected nodes: `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`.

### Classical and Hilbert geometric projector comparison

Current AGR fine nodes specify rational parabolic, Scholl-projector and newform coefficient-descent targets at every finite λ. GH.0/R14.3 still owe the actual classical compactification, boundary/resolution and good-prime correspondence data needed to instantiate them; GH.0's CM-product degree 2r+1 is not the classical degree r+1. R18.2 owes Saito's different q₀-shifted Hilbert model/projector. Deligne Lemma 5.4's toric argument does not replace the owner's verified global construction. Retain the supplier's geometric-projector and minimal-coefficient-descent obligations and the requested independent Eichler-congruence/DFG character normalization: the current AGR rank-two/Eichler route returns to R34.6. Primes λ dividing Nk! do not create a separate rational-representation-existence gap. DFG supplies finitely generated integral étale modules at every λ; its restricted crystalline/Fontaine–Laffaille and associated integral de Rham comparisons do not imply freeness at excluded primes.

Affected nodes: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`.

### Saito crystalline coefficient vanishing proof

Saito’s Theorems 1–2, Lemmas 3–4, Claims 4–5 and Proposition 1′ with its l-adic proof were read. The p-adic half still needs §9, pp. 40–43: the nonconstant coefficient isocrystal has no geometrically constant subobject/quotient, using the p-divisible-group monodromy calculation. This is an inherited proof-interior obligation of the imported PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p theorem, whose packet also leaves this proof unverified. R34.6 transports that theorem through its actual degree/twist/projector comparison rather than re-planning the proof.

Affected nodes: `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`.

### Suggested signatures for unavailable geometric carriers

The suggested file gives actual Mathlib representation/root-level definitions, all nine definition tests, and numerical/algebraic theorem signatures. Its supplied group, inertia, lift and residue-cardinality data are prototypes, not the full continuous Galois/local-place carrier. Actual Tate modules, schemes, adic nearby cycles, parabolic cohomology, geometric projectors and mixed complexes are absent from the pinned imports, so full geometric and continuous-arithmetic signatures are omitted with their node names and exact supplier inputs. No opaque Prop conditions or mock cohomology objects replace them; numerical cores do not claim to state the full comparison theorems.

Affected nodes: `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`, `WeightsInEtaleCohomology:R34.3/nodal-modular-curve-comparison`, `WeightsInEtaleCohomology:R34.3/arithmetic-picard-lefschetz-normalization`, `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent`, `WeightsInEtaleCohomology:R34.4/vanishing-quotient-parity-comparison`, `WeightsInEtaleCohomology:R34.4/original-coefficient-monodromy-hypotheses`, `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.5/weight-two-jacobian-weight-comparison`, `WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison`, `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`, `WeightsInEtaleCohomology:R34.6/fixed-eigenform-good-prime-compatibility`, `WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport`, `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`, `WeightsInEtaleCohomology:R34.1/representation-sheaf-weight-comparison`, `WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization`, `WeightsInEtaleCohomology:R34.1/purity-under-restriction-and-induction`, `WeightsInEtaleCohomology:R34.1/frobenius-eigenvalues-need-not-be-algebraic`, `WeightsInEtaleCohomology:R34.2/frobenius-on-tate-modules-and-first-cohomology`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`, `WeightsInEtaleCohomology:R34.2/good-reduction-point-counts-and-traces`, `WeightsInEtaleCohomology:R34.2/curve-traces-over-all-residue-extensions`, `WeightsInEtaleCohomology:R34.1/purity-under-linear-algebra-operations`.

### Descent from Saito’s completed-unramified comparison base

Saito §7 p. 32 constructs the minimal semistable model over V finite over the completed maximal unramified extension of E_q. Section 8 p. 34 extends the Galois action. This pass does not establish an effective descent of all model/correspondence data to a finite extension of E_q or of strata with the specified Weil action to a common finite residue field. R18.2 and CP.4 requests name exactly those descent/compatibility inputs. Finite-field weights and any comparison carrier restricted to finite local fields require them; one cannot treat the algebraically closed residue field as finite.

Affected nodes: `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`, `WeightsInEtaleCohomology:R34.5/kuga-sato-projector-weight-comparison`, `WeightsInEtaleCohomology:R34.6/hilbert-local-monodromy-weight-export`.

## Source and library audit ledger

The second independent review re-fetched all eight public PDFs on 2026-10-08 and confirmed their recorded hashes. Its fresh reading scopes are recorded separately in the packet, including Weil I §4 pp. 288–289, Carayol pp. 409–410 and 423–425, and the source locators of all 27 nodes. The page images of Saito p. 12 and DFG p. 24 were independently checked. Saito E1 is confirmed for the preprint. DFG Theorem 2.4 reverses the divisibility sign in S_N: §2 p. 13 and §1.2 pp. 9–10 require the primes dividing Nk!, where crystalline data are not required. This independently confirms the p. 24 part of the already recorded AGR/E3 finding; no duplicate source issue is added, and no claim about the differently numbered 2004 journal text follows. The inspected 2025 long preprint has the title used below. All nine baseline declarations and 83 distinct direct fine supplier statements were inspected; nine exact requests and six gaps remain.

The authoring revision’s earlier audit follows. All eight public PDFs were downloaded again on 2026-10-07, and their complete SHA-256 hashes match the recorded editions. The fresh reading scope is listed below; the packet separately retains the earlier author and independent-review read records. These are passage checks, not claims to have audited every proof in each paper. Mathematical OCR glyphs are checked against page images where needed.

The Saito preprint sign is the existing confirmed E1/E50 finding; its journal version and crystalline argument on pp. 40–43 remain unverified. DFG’s exceptional-set typo on p. 24 is already recorded as AutomorphicGaloisRepresentations/E3, so this revision does not duplicate that finding or assign a verdict. The Scholl primary PDF could not be freshly retrieved (timeout/HTTP 502); only the current supplier’s reviewed target and retained construction gaps are used here. No fresh reading of the missing SGA7 or Illusie algebraic Picard–Lefschetz proof is claimed.

### Pierre Deligne: La conjecture de Weil. I

[Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR (printed page = PDF page + 271)](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf)

SHA-256: `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`. Accessed 2026-10-07.

**Fresh reading.** §1 (1.5.1), (1.13)–(1.15), pp. 275, 278–279; §3 (3.1)–(3.2), pp. 283–284; §5 (5.6)–(5.10) and §6 (6.1)–(6.3), pp. 291–295. Theorem (3.2) is on p. 284 (page image checked), with its setup on p. 283.

### Pierre Deligne: La conjecture de Weil. II

[Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR (printed page = PDF page + 135)](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf)

SHA-256: `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`. Accessed 2026-10-07.

**Fresh reading.** §1.1 (1.1.11)–(1.1.15), §1.2 (1.2.1)–(1.2.7), pp. 152–154; §3.3 (3.3.4)–(3.3.6), p. 206; (3.7.1), p. 215; §4.1 (4.1.1), p. 217; §6.2 (6.2.1)–(6.2.7), pp. 247–248.

### Brian Lawrence and Akshay Venkatesh: Diophantine problems and p-adic period mappings

[arXiv:1807.02721v3 (25 Oct 2019; published in Invent. Math. 221 (2020)); printed page = PDF page](https://arxiv.org/abs/1807.02721)

SHA-256: `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b`. Accessed 2026-10-07.

**Fresh reading.** §2.3 Lemma 2.3, pp. 9–10; §2.5 and Lemma 2.10, pp. 13–14 (section heading image checked); §3.1 (3.2), p. 16. The finite-quotient character construction and reciprocal-quartic distinction were checked as arithmetic applications, not attributed as verbatim source theorems.

### J. S. Milne: Abelian Varieties

[Course notes, version 2.00 (March 16, 2008); printed page = PDF page − 6](https://www.jmilne.org/math/CourseNotes/AV.pdf)

SHA-256: `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`. Accessed 2026-10-07.

**Fresh reading.** I Theorem 12.1 and Remark 12.5, pp. 55–56; I Remark 17.2, p. 70; II §1 and Theorem 1.1 proof, pp. 75–76; Corollary 1.5/Remark 1.6(a), p. 78. Page images checked for H¹/exterior powers, Galois equivariance and q-Frobenius.

### Pierre Deligne: Formes modulaires et représentations l-adiques

[Séminaire Bourbaki, exposé 355 (1968/69), pp. 139–172; Numdam scan; printed page = PDF page +137.](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf)

SHA-256: `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c`. Accessed 2026-10-07.

**Fresh reading.** §3.18–§3.20, pp. 158–159; §5 (5.1)–(5.6), pp. 168–171. The 1969 theorem is conditional on Weil; the smooth compactification and projector realization remain actual geometric inputs.

### Takeshi Saito: Hilbert modular forms and p-adic Hodge theory

[arXiv:math/0612077v2 (11 December 2006; journal publication 2009); manuscript page = PDF page.](https://arxiv.org/pdf/math/0612077v2)

SHA-256: `fb5b69b76d2257ce20f47366c4bd165ccdb571333e7f25a4ed6e92dbb4b55df7`. Accessed 2026-10-07.

**Fresh reading.** First-page version stamp and pp. 1–2, 10–13; splitting discussion p. 19; §6 Lemma 3, §7 Lemma 4 and §8–§9 l-adic argument, pp. 30–39. Images of pp. 12 and 32 checked for the recorded sign and completed-unramified base. Crystalline proof pp. 40–43 and the journal version were not read.

### Fred Diamond, Matthias Flach and Li Guo: Adjoint motives of modular forms and the Tamagawa number conjecture

[arXiv:2512.02348v2 (December 2025 revision); manuscript page = PDF page.](https://arxiv.org/pdf/2512.02348v2)

SHA-256: `0f4984acdabd2efd542aae932850da83c36ec023185a47f40c8ef5813bd21898`. Accessed 2026-10-07.

**Fresh reading.** Selected definitions and comparisons on pp. 1, 6–10, 12–13, 24, 50–52 and 58–62, especially §1.2 all-λ étale modules versus restricted crystalline data, §1.3 Dirichlet normalization, §5.4 Lemma 5.7 and §5.5 twisted realization. The p. 24 exceptional-set typo is already recorded by AutomorphicGaloisRepresentations/E3; no duplicate finding or new verdict is added. The cited Scholl proof was not freshly accessible.

### Henri Carayol: Sur les représentations l-adiques associées aux formes modulaires de Hilbert

[Ann. Sci. ENS (4) 19 (1986), 409–468; Numdam scan; printed page = PDF page +407.](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf)

SHA-256: `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`. Accessed 2026-10-07.

**Fresh reading.** Conventions pp. 409–410, selected model statements pp. 414–416, and §4.1–§4.8 pp. 423–425: finite-level extensions, Weil-equivariant specialization, cuspidal residual-term exclusion and normalization filtration.

The accepted RS-17 ownership decision and reviewed AUDIT-19 coverage were checked for every R34 stage. All nine baseline declaration statements were read at their exact Mathlib pin. The official structural checker has no declaration index in this workspace, so its baseline-form check is supplemented by those direct source reads; its success does not certify unavailable geometric implementations.

The current supplier pass replaces thirteen redundant broad requests by existing fine targets, leaving the nine exact contracts above. The EDC trace/adic and cycle-class proofs, LPV adic and algebraic Picard–Lefschetz proofs, actual modular/Hilbert models, coefficient descent and Saito comparison obligations retain their supplier gaps. Accepted or corrected planning targets are not treated as compiled mathematics. The two upstream reader exemplars are AdicSpaces and ProfiniteCohomology; their explicit objects, hypotheses, API, boundary and acceptance structure informs this document.
