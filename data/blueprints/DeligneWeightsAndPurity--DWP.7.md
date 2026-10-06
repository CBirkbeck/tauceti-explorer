# Deligne weights, purity and the Weil bounds — DWP.7–DWP.9: the direct-image theorem, mixed complexes and hard Lefschetz

This document is part DWP.7 of the roadmap *Deligne weights, purity and the Weil bounds*
(`DeligneWeightsAndPurity`). It plans the three late stages of the roadmap:

- **DWP.7 — The fundamental direct-image theorem and sharp cohomological bounds** (Weil II §3.3);
- **DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity** (Weil II §3.4, §6.1–6.2);
- **DWP.9 — Absolute hard Lefschetz after weights** (Weil II §4.1, the corollaries of §4.3, and 6.2.13).

Part DWP.0 of the same roadmap plans DWP.0–DWP.6 and DWP.10: Weil numbers and ι-weights of
endomorphisms (DWP.0), the curve and abelian-variety estimate (DWP.1), Weil I (DWP.2–DWP.4), the
sheaf-level weight predicates, local weights and the analytic preparation of Weil II §§1–2 (DWP.5),
and purity for lisse sheaves on curves, Weil II 3.2.3 (DWP.6). This part starts where DWP.6 stops:
it assumes the curve theorem and the local weight theorem and builds from them Deligne's
fundamental theorem on R^i f_!, the formalism of mixed and pure complexes, the weight filtration
and semisimplicity theorems, and the hard Lefschetz theorem over every algebraically closed field.

The structure follows the accepted restructuring proposal RS-17. DWP.7 is narrowed to the direct-image
theorem and its consequences (the sheaf definitions and the local and curve weight theorems are
DWP.5's and DWP.6's); DWP.8 is kept whole; DWP.9 is narrowed to absolute hard Lefschetz, the primitive
decomposition and pairings, odd Betti parity, arithmetic models and the 6.2.13 extension, importing
the invariant-cycle theorems 6.2.8–6.2.12 from `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`.
The perverse and relative theory (pure intersection complexes, the decomposition theorem, relative
hard Lefschetz) is `EtaleDualityAndPerverseSheaves:EDC.7`, which consumes this part; nothing here
uses it.

## Scope in one paragraph

Given the étale six-operation formalism with ℚ̄_ℓ coefficients (EDC.0–EDC.4, SF.2), DWP.5's weight
predicates and local weights and DWP.6's purity for curves, this part proves: Rf_! of a mixed sheaf
of weights ≤ n has R^i of weights ≤ n + i over any base of finite type over ℤ[1/ℓ]; the bounds and
purity statements for H^i_c and H^i over a finite field, including smooth proper nonprojective
varieties and rational homology manifolds; the integral refinements and p-adic triangles (resting on
SGA 7 XXI, whose proof is a recorded gap); the stability of mixed complexes under the six operations
and nearby cycles, the weight estimates of each operation, purity of proper direct images; the
decomposition modulo ℤ, the weight filtration and the geometric semisimplicity of pure lisse sheaves,
over finite fields and, through arithmetic models, over any algebraically closed field; the weight
spectral sequence of a normal crossings compactification; and the hard Lefschetz theorem for
smooth projective varieties and for potentially pure complexes, with its primitive decomposition,
Lefschetz pairings and the evenness of odd Betti numbers.

## Conventions

- **Fields and Frobenius.** p is a prime different from ℓ, q a power of p, 𝔽_q a finite field and
  𝔽̄_q a fixed algebraic closure. Objects over 𝔽_q carry an index 0; dropping it means base change to
  𝔽̄_q (Weil II (0.7)). F denotes the **geometric** Frobenius, the inverse of x ↦ x^q in
  Gal(𝔽̄_q/𝔽_q); for a closed point x, F_x is the geometric Frobenius of k(x) acting on the stalk at a
  geometric point over x, and N(x) = #k(x).
- **Sheaves.** A sheaf is a constructible ℚ̄_ℓ-sheaf (Weil II 1.1); over 𝔽_q a Weil sheaf is allowed
  where the source allows it. Schemes are of finite type over 𝔽_q, over an algebraically closed field,
  or over ℤ[1/ℓ], as each statement says; ℓ is always invertible.
- **Weights.** A Weil q-number of weight n ∈ ℤ is an algebraic number all of whose complex conjugates
  have absolute value q^{n/2} (DWP.0). For a field isomorphism ι : ℚ̄_ℓ ≅ ℂ the ι-weight of α is
  2 log_q |ια| ∈ ℝ. 'Pure', 'mixed', 'punctually pure' always refer to integer weights in the
  all-embeddings sense; the prefix ι- marks the fixed-ι, real-weight notions. Weights read eigenvalues,
  never Jordan blocks: [[q, 1], [0, q]] is pure of weight 2.
- **Tate twists.** ℚ_ℓ(1) is pure of weight −2: F acts on it by q⁻¹. Weil II §4 trivialises ℤ_ℓ(1)
  over k; this plan restores every twist, so hard Lefschetz reads η^r : H^{n−r}(X, ℚ_ℓ) ≅
  H^{n+r}(X, ℚ_ℓ(r)) with η ∈ H²(X, ℚ_ℓ(1)).
- **Complexes.** D^b_c(X) is EDC.0's bounded constructible derived category with cohomology sheaves ℋ^i.
  K has weights ≤ w when ℋ^iK has punctual weights ≤ w + i (Weil II 6.2.2). D = RHom(−, K_X),
  K_X = Ra^!ℚ̄_ℓ for a : X → Spec(base). Ordinary cohomological indexing is used throughout; the perverse
  normalisation of EDC.5–EDC.7 is a shift of it, and the two are kept distinct (on a smooth curve a
  pure lisse sheaf of weight w in degree −1 has weight w + 1).
- **Semisimplicity.** 'Geometrically semisimple' means semisimple after pullback to 𝔽̄_q, i.e. as a
  representation of the geometric fundamental group. Purity never implies that the arithmetic
  Frobenius acts semisimply.

## Sources

- P. Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252 (Numdam scan,
  SHA-256 b06eea61…cc71). Read: Introduction; (0.7)–(0.11); 1.1.14–1.2.10; 1.8.7–1.8.12; 1.11.4–1.11.5;
  3.2.14–3.4.14; §4.1–§4.3; §6.1–§6.2. Page 206 (3.3.4–3.3.8 with the diagrams) and pages 249–250
  (6.2.10–6.2.13) were read from the page images.
- P. Deligne, *Théorème de Lefschetz et critères de dégénérescence de suites spectrales*, Publ. Math.
  IHÉS 35 (1968), 107–126 (Numdam), §1 (1.1)–(1.9): the primitive decomposition (1.5)–(1.6).
- J. Bergström, C. Faber, S. Payne, *Polynomial point counts and odd cohomology vanishing on moduli
  spaces of stable curves*, arXiv:2206.07759v2 (Annals 199 (2024)), Proposition 4.2 and its proof: the
  weight spectral sequence of M_{g,n} ⊂ M̄_{g,n}, with the orientation twist recorded as
  PAPER-BERGSTROM-FABER-PAYNE-24/E7.
- H. Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, arXiv:1807.04659v5 (Annals 197
  (2023)), Proposition 6.1.1 and its proof: a consumer of purity for pure lisse coefficients on a smooth
  proper curve.
- SGA 7 XXI (Deligne, *Le théorème d'intégralité*) is cited by Weil II (3.3.3); it was not available to
  this plan, and its proof is the recorded gap of DWP.7.
- Statements quoted from Weil II use the corrections recorded in its extraction PAPER-DELIGNE-80
  (E2, E45, E46, E47, E70), which this part does not re-record.

## Dependencies

| Supplier | What this part imports |
|---|---|
| `DeligneWeightsAndPurity:DWP.0` (nodes) | Weil q-numbers and ι-weights, eigenvalue weights of endomorphisms, base extension, tensor spectra, reciprocal pairings, disjoint spectra, the Frobenius-module weight decomposition |
| `DeligneWeightsAndPurity:DWP.5` | the sheaf predicates (1.2.2)–(1.2.7) on schemes of finite type over ℤ[1/ℓ], local weights (1.8.4) with (1.8.6)–(1.8.11), the specialisation theorem (1.11.1), (1.11.5) |
| `DeligneWeightsAndPurity:DWP.6` | Weil II 3.2.3, purity of H^i(C, j_*ℱ) on a curve, for every ι |
| `EtaleDualityAndPerverseSheaves:EDC.0` | D^b_c, Rf_*, Rf_!, f*, ⊗, RHom, Leray spectral sequences, lisse sheaves as representations, generic base change, tame base change of j_* |
| `EtaleDualityAndPerverseSheaves:EDC.1` | f^!, K_X, D, biduality, exchange formulas, Verdier duality (also over ℤ[1/ℓ]) |
| `EtaleDualityAndPerverseSheaves:EDC.2` | Poincaré duality, relative trace, the smooth dualizing complex |
| `EtaleDualityAndPerverseSheaves:EDC.3` | c₁, cycle class of a smooth divisor, Gysin map and projection formula |
| `EtaleDualityAndPerverseSheaves:EDC.4` | weak Lefschetz |
| `SchemeAndStackFoundations:SF.2` | proper and smooth base change, topological invariance, excision, the trace formula |
| `SchemeAndStackFoundations:SF.1` | étale cohomology of Deligne–Mumford stacks (stacky weight spectral sequence) |
| `AdicCoefficientsAndComparisons:L2` | noetherian approximation and spreading out |
| `ArithmeticGaloisDuality:R02.2` | continuous Hochschild–Serre for the Weil-group extension |
| `WeilConjectures:WC.3` | the algebraic factor lemma of Weil I (1.7) ⇒ (1.6) |
| `LefschetzPencilsAndVanishingCycles:LPV.1`, LPV.0, LPV.3–LPV.5 nodes | quasi-unipotence and the monodromy filtration; nearby cycles; dual varieties, Lefschetz pencils, Bertini, E^⊥ = invariants |
| `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles` | Weil II 6.2.8–6.2.12 for potentially pure complexes, including 4.1.3 and its §4.3 proof |
| `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks` | purity for smooth proper Deligne–Mumford stacks |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `IG.1` | surjectivity of π₁ of a dense open of a normal scheme; the arithmetic–geometric exact sequence |
| Tau Ceti `ModularCurves` 0E, `AlgebraicCurves` layer 12, `LocalFieldsRamification` layers 3–4 | spreading out of polarised relative curves; smooth projective models of curves; wild inertia is pro-p |
| Mathlib | `Representation`, `Representation.invariants`, `IsSemisimpleModule`, bilinear forms (`Nondegenerate`, `IsAlt`, `restrict`, `restrict_nondegenerate_iff_isCompl_orthogonal`), `DirectSum.IsInternal`, `Module.finrank` |

The consumers of this part are listed in the `uses` fields of its definitions: WeilConjectures WC.6–WC.7,
FiniteFieldsAndCharacterSums FF.2 and FF.4, WeightsInEtaleCohomology R34.1 and R34.5–R34.6,
EtaleDualityAndPerverseSheaves EDC.7, LefschetzPencilsAndVanishingCycles LPV.7:invariant-cycles,
GlobalShtukasAndFunctionFieldLanglands GS.6, ExcursionOperatorsAndSpectralAction ES7, ArithmeticStatistics
ST.5, PadicDifferentialEquationsAndRigidCohomology RD.7 and MotivesAndAlgebraicCycles MC.7.

## Layer DWP.7 — The fundamental direct-image theorem and sharp cohomological bounds

**Milestone.** For a separated morphism f : X → Y of schemes of finite type over ℤ[1/ℓ] and a sheaf ℱ
mixed of weights ≤ n, every R^i f_!ℱ is mixed of weights ≤ n + i (Weil II 3.3.1), with its fixed-ι,
real-weight form (3.3.10) and its consequences over 𝔽_q: H^i_c has weights ≤ n + i, H^i of a lisse sheaf
on a smooth scheme has weights ≥ n + i, the image H^i_c → H^i is pure, and H^i of a proper smooth
variety (with pure lisse coefficients, or on a rational homology manifold) is pure, with integral
ℓ-independent factors for constant coefficients (3.3.9). The integral refinements 3.3.2–3.3.3 and the
p-adic triangles 3.3.7–3.3.8 rest on SGA 7 XXI (5.2.2).

**Proof architecture.** The six dévissages (a)–(f) reduce 3.3.1 to relative dimension one and to a
lisse punctually pure ℱ; the curve facts (α), (β) — generic smoothness and a tame finite étale cover
with ℱ a direct summand of u_*u*ℱ — spread out over a dense open of the base, so that the remaining
case is a smooth projective relative curve with a finite étale divisor at infinity and a tame lisse
sheaf. There the fibrewise H^i(X̄_ȳ, j_*ℱ) are pure by DWP.6 (3.2.3) and the boundary terms are bounded
by DWP.5 (1.8.4), applied at every ι. Note what is not available: 3.3.1 gives no lower bound; lower
bounds come from integrality (3.3.2, needs SGA 7 XXI) or from Poincaré duality (3.3.5, needs a smooth
X₀ and a lisse ℱ₀). A pure stalk condition on a singular scheme does not give the lower bound: the
nodal cubic has H¹ of weight 0.

### `DWP.7/weights-mixed-sheaves-definitions` — Weil II §1.2 weight conventions for DWP.7–DWP.9, imported from DWP.5

*Comparison* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let ℓ be a prime, X a scheme of finite type over ℤ[1/ℓ], and |X| its set of closed points; each x ∈ |X| has a finite residue field k(x) with N(x) = #k(x) prime to ℓ. A sheaf on X is a constructible ℚ̄_ℓ-sheaf (Weil II 1.1.1–1.1.3); when X is of finite type over 𝔽_q it may also be a Weil sheaf (Weil II 1.1.10). For x ∈ |X|, F_x is the geometric Frobenius of k(x) acting on the stalk ℱ_x̄ at a geometric point over x; its characteristic polynomial does not depend on the geometric point. DWP.7–DWP.9 use, with exactly this scope, the predicates that DWP.5 constructs: (a) ℱ is punctually pure of weight n ∈ ℤ when, for every x ∈ |X|, every eigenvalue of F_x on ℱ_x̄ is a Weil N(x)-number of weight n (DWP.0); (b) ℱ is mixed when it has a finite filtration by subsheaves whose successive quotients are punctually pure; the weights of the nonzero quotients are the punctual weights of ℱ, and 'mixed of weights ≤ n' (resp. '≥ n') means that all punctual weights are ≤ n (resp. ≥ n); (c) for a field isomorphism ι : ℚ̄_ℓ ≅ ℂ and β ∈ ℝ, ℱ is punctually ι-pure of weight β when every eigenvalue α of every F_x has ι-weight 2 log_{N(x)} |ια| = β, and ℱ is ι-mixed when it has a finite filtration with punctually ι-pure successive quotients, its punctual ι-weights being those of the nonzero quotients. The zero sheaf is punctually pure of every weight and mixed with empty set of weights. The stabilities of Weil II (1.2.5) hold for (a)–(c): subsheaves, quotients, extensions, inverse images along any morphism of schemes of finite type over ℤ[1/ℓ], direct images along finite morphisms and tensor products (weights add); the dual of a lisse punctually pure sheaf of weight n has weight −n; ℚ̄_ℓ(1) is punctually pure of weight −2, so a Tate twist ℱ(r) shifts weights by −2r. For a morphism Y → S and a closed point s ∈ |S|, the closed points of the fibre Y_s are closed points of Y with the same residue fields, so restriction to Y_s preserves (a)–(c). A mixed sheaf is ι-mixed for every ι, with ι-weights its integer weights.

**Hypotheses.** ℓ invertible on every scheme considered; all schemes of finite type over ℤ[1/ℓ], so that closed points have finite residue fields; integer weights in (a)–(b), real ι-weights in (c); 'mixed' always means the integer-weight, all-embeddings notion.

**Proof outline.**

1. The predicates and the stabilities (1.2.5) are DWP.5's constructions on the sheaves of EDC.0; this node pins the scope (schemes of finite type over ℤ[1/ℓ], not only over 𝔽_q) that Weil II 3.3.1 needs, so that DWP.5 plans them in that scope.
2. Restriction to fibres over closed points: a closed point of Y_s is closed in Y because Y_s → Y is a closed immersion and s is closed; residue fields agree, so the Frobenius elements agree and each predicate passes to the fibre.
3. Mixed implies ι-mixed: a Weil N(x)-number of weight n has ι-weight n for every ι (DWP.0/iota-weight).

**Depends on.** `DWP.5`, `DWP.0/weil-q-number`, `DWP.0/iota-weight`, `DWP.0/weil-number-iff-iota-pure-for-every-iota`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Acceptance.**

- Acceptance: the constant sheaf ℚ̄_ℓ on Spec 𝔽_q is punctually pure of weight 0, ℚ̄_ℓ(1) of weight −2 and ℚ̄_ℓ(−1) of weight 2.
- Acceptance: the rank-two Weil sheaf on Spec 𝔽_q on which F acts by the Jordan block [[q, 1], [0, q]] is punctually pure of weight 2: weights read eigenvalues, not Jordan blocks.
- Acceptance: on Spec 𝔽_q the rank-one Weil sheaf on which F acts by a transcendental b ∈ ℚ̄_ℓ with |ιb| = q for one ι is ι-pure of weight 2 for that ι but not mixed: ι-purity at one ι does not give algebraicity.

**Source.** deligne-weil-ii, §1.2, Définition (1.2.2), p. 153; deligne-weil-ii, §1.2, Stabilités (1.2.5), p. 154; deligne-weil-ii, §1.2, (1.2.6), p. 154.

### `DWP.7/integral-sheaf` — Integral sheaves

*Definition* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let X be a scheme of finite type over ℤ[1/ℓ]. A sheaf ℱ on X is integral (entier) when, for every closed point x ∈ |X|, every eigenvalue of the geometric Frobenius F_x on the stalk ℱ_x̄ is integral over ℤ. For a finite-dimensional ℚ̄_ℓ-space V with an endomorphism F the analogous predicate is: (V, F) is integral when every root of det(T − F) in ℚ̄_ℓ is integral over ℤ; a sheaf on Spec 𝔽_q is integral exactly when its geometric-Frobenius module is. Integrality is a condition separate from purity: ℚ̄_ℓ(1) is pure of weight −2 and not integral.

**Hypotheses.** X of finite type over ℤ[1/ℓ]; ℚ̄_ℓ coefficients; integral over ℤ, not over ℤ_ℓ: ℓ-adic integrality of the eigenvalues is automatic for étale sheaves and is not what is meant.

**Proof outline.**

1. Define the stalkwise predicate on Frobenius modules first, through the eigenvalue multiset of DWP.0/endomorphism-weights, and the sheaf predicate as its conjunction over |X|.
2. Stability under subsheaves, quotients and extensions: the eigenvalue multiset of an extension is the union of those of sub and quotient (DWP.0/characteristic-polynomial-in-short-exact-sequences via DWP.0/purity-under-subquotients-and-extensions).
3. Pullback along g : Y → X: for y ∈ |Y| over x, F_y acts on (g*ℱ)_ȳ = ℱ_x̄ as F_x^{[k(y):k(x)]}; powers of algebraic integers are algebraic integers. Finite direct image: the stalk of f_*ℱ at y is the sum of the induced modules of the stalks at the points over y, whose Frobenius eigenvalues are roots of the eigenvalues at those points (DWP.0/spectra-of-polynomials-in-an-endomorphism), and roots of algebraic integers are algebraic integers.
4. Tensor products: eigenvalues multiply (DWP.0/spectra-of-tensor-products-and-duals). Twist ℱ(−m), m ≥ 0: eigenvalues multiply by N(x)^m.

**Depends on.** `DWP.0/endomorphism-weights`, `DWP.0/purity-under-subquotients-and-extensions`, `DWP.0/spectra-of-polynomials-in-an-endomorphism`, `DWP.0/spectra-of-tensor-products-and-duals`, `DWP.0/weil-number-arithmetic`, `DWP.7/weights-mixed-sheaves-definitions`.

**Used by.**

- Weil II Corollaire (3.3.3), p. 205: the integral refinement of the direct-image theorem: weights of R^i f_!ℱ lie between 0 and n+i, and between 2(i−d) and n+i above the fibre dimension.
- Weil II Corollaire (3.3.4), p. 206: the lower bounds w ≥ 0 and w ≥ 2(i−d) for H^i_c of an integral sheaf over 𝔽_q.
- Weil II (3.3.7)–(3.3.8), p. 206: the p-adic couples (r, s) of an integral eigenvalue are ≥ 0, which places them in the triangles.
- DeligneWeightsAndPurity:DWP.7/deligne-integrality-theorem-sga7-xxi: the integrality theorem is a statement about this predicate on R^i f_!ℱ and on R^i f_!ℱ(i−d).
- FiniteFieldsAndCharacterSums:FF.2/deligne-estimate-for-character-sums: character sheaves L_ψ(f) ⊗ L_χ(g) are integral (their Frobenius traces are sums of roots of unity), so their H^i_c have weights ≥ 0.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.IsIntegralEnd` | data | IsIntegralEnd (F : V →ₗ[E] V) : Prop := ∀ α ∈ eigenvalues F, IsIntegral ℤ α, for E a field of characteristic 0 and V finite-dimensional, with eigenvalues F the DWP.0 multiset of roots of the characteristic polynomial in an algebraic closure. |
| `TauCeti.Weights.IsIntegralSheaf` | data | IsIntegralSheaf ℱ : Prop := ∀ x ∈ ∣X∣, IsIntegralEnd (F_x acting on ℱ_x̄). |
| `TauCeti.Weights.isIntegralEnd_iff_charpoly` | characterisation | IsIntegralEnd F ↔ every root of det(T − F) in an algebraic closure is integral over ℤ; when det(T − F) has rational coefficients this holds iff it has integer coefficients. |
| `TauCeti.Weights.IsIntegralEnd.of_extension` | other | For an F-stable subspace W ⊆ V: IsIntegralEnd F ↔ IsIntegralEnd (F∣W) ∧ IsIntegralEnd (F on V/W). |
| `TauCeti.Weights.IsIntegralEnd.pow` | other | IsIntegralEnd F → IsIntegralEnd (F ^ r) for r ≥ 1, and conversely: an algebraic number with an integral power is integral. |
| `TauCeti.Weights.IsIntegralEnd.tensor` | other | IsIntegralEnd F → IsIntegralEnd G → IsIntegralEnd (F ⊗ G). |
| `TauCeti.Weights.IsIntegralSheaf.comap` | functoriality | Pullback along any morphism of schemes of finite type over ℤ[1/ℓ] preserves integrality. |
| `TauCeti.Weights.IsIntegralSheaf.finite_pushforward` | functoriality | Direct image along a finite morphism preserves integrality. |
| `TauCeti.Weights.IsIntegralSheaf.twist_neg` | simp | ℱ integral and m ≥ 0 ⇒ ℱ(−m) integral; the converse fails for m > 0. |
| `TauCeti.Weights.IsIntegralSheaf.weights_nonneg` | relation | An integral mixed sheaf has all punctual weights ≥ 0 (Weil II 3.3.2): the norm of an integral Weil q-number of weight n and degree d is a nonzero integer of absolute value q^{nd/2} (DWP.0/weil-number-arithmetic (iv)). |
| `TauCeti.Weights.IsIntegralSheaf.constant` | example | The constant sheaf ℚ̄_ℓ is integral; so is every sheaf ℱ whose Frobenius traces at all closed points of all finite extensions are algebraic integers. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.isIntegralEnd_tate_neg_one` | computation | On Spec 𝔽_q, ℚ̄_ℓ(−1) (F acts by q) is integral: q is an algebraic integer. |
| `TauCeti.Weights.not_isIntegralEnd_tate_one` | non-example | On Spec 𝔽_q, ℚ̄_ℓ(1) (F acts by q⁻¹) is not integral although it is punctually pure of weight −2: purity does not imply integrality. |
| `TauCeti.Weights.not_isIntegralEnd_weight_zero` | non-example | For ℓ ≠ 5, the rank-one Weil sheaf on Spec 𝔽_q on which F acts by b = (3 + 4i)/5 is punctually pure of weight 0 (every complex conjugate of b has absolute value 1) but not integral: b is not an algebraic integer. A definition 'integral = weights ≥ 0' fails this test. |
| `TauCeti.Weights.isIntegralEnd_zero` | degenerate | The zero sheaf, and the zero Frobenius module, are integral. |
| `TauCeti.Weights.isIntegralEnd_jordan` | computation | The Frobenius module (ℚ̄_ℓ², [[q, 1], [0, q]]) is integral: integrality reads the characteristic polynomial (T − q)², not a diagonal form. |

**Acceptance.**

- The predicate depends only on the eigenvalue multisets at closed points, hence is invariant under change of the geometric points and of the algebraic closure.
- Weil II 3.3.2: an integral mixed sheaf has all punctual weights ≥ 0 (api IsIntegralSheaf.weights_nonneg).

**Source.** deligne-weil-ii, §3.3, (3.3.2), p. 205.

### `DWP.7/devissage-in-the-sheaf-and-the-source` — Dévissages (a), (b), (f) of the direct-image theorem

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and n ∈ ℤ. Say that a sheaf ℱ on X satisfies P_n(f) when R^i f_!ℱ is mixed of weights ≤ n + i for every i. (a) For an exact sequence 0 → ℱ′ → ℱ → ℱ″ → 0: P_n(f) for ℱ′ and ℱ″ implies P_n(f) for ℱ; P_n(f) for ℱ and ℱ″ implies P_n(f) for ℱ′; if the sequence splits, P_n(f) for ℱ implies P_n(f) for ℱ′. (b) If j : U → X is open with closed complement i : S → X, then P_n(f∘j) for j*ℱ and P_n(f∘i) for i*ℱ imply P_n(f) for ℱ. (f) If f is quasi-finite and ℱ is punctually pure of weight m, then f_!ℱ = R⁰f_!ℱ is punctually pure of weight m and R^i f_!ℱ = 0 for i ≠ 0; hence, by (a), every mixed ℱ of weights ≤ n satisfies P_n(f) when f is quasi-finite. The same statements hold with 'mixed of weights ≤ n + i' replaced by 'ι-mixed of ι-weights ≤ β + i' (β ∈ ℝ) and, for X over 𝔽_q, for Weil sheaves.

**Hypotheses.** f separated of finite type, so that Rf_! = Rf̄_* ∘ j_! for a compactification (EDC.0); (f) needs quasi-finiteness of f, not only finite fibres over closed points.

**Proof outline.**

1. (a) Apply the long exact sequence of R^•f_!. For the second clause, R^i f_!ℱ′ is an extension of a subsheaf of R^i f_!ℱ by a quotient of R^{i−1}f_!ℱ″, which is mixed of weights ≤ n + i − 1 ≤ n + i; conclude by the stabilities of DWP.7/weights-mixed-sheaves-definitions. In the split case R^i f_!ℱ′ is a direct summand of R^i f_!ℱ.
2. (b) Apply (a) to 0 → j_!j*ℱ → ℱ → i_*i*ℱ → 0 with Rf_!j_! = R(fj)_! and Rf_!i_* = R(fi)_! (EDC.0).
3. (f) For f quasi-finite and separated, R^i f_! = 0 for i ≠ 0 and the stalk of f_!ℱ at a geometric point ȳ over y ∈ |Y| is ⊕_{x ↦ y} Ind(ℱ_x̄), the sum over the closed points x of the fibre of the modules induced from ⟨F_x⟩ = ⟨F_y^{d_x}⟩, d_x = [k(x) : k(y)] (proper base change, SF.2). The eigenvalues of F_y on an induced module are the d_x-th roots of the eigenvalues of F_x, and α^{d} is a Weil N(y)^{d}-number of weight m iff α is a Weil N(y)-number of weight m (DWP.0/weil-number-base-extension); N(x) = N(y)^{d_x}.
4. The ι-variant uses the same steps with DWP.0/iota-weight, which satisfies w_{q^r}(α^r) = w_q(α).

**Depends on.** `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `DWP.0/weil-number-base-extension`, `DWP.0/iota-weight`.

**Acceptance.**

- Acceptance: for f = id the class P_n contains exactly the sheaves mixed of weights ≤ n.
- Acceptance: for the finite étale double cover Spec 𝔽_{q²} → Spec 𝔽_q and ℱ = ℚ̄_ℓ, f_*ℚ̄_ℓ has F-eigenvalues ±1 (weight 0), not 1 with multiplicity 2: (f) computes induced modules, not sums of copies.
- Non-example: (a) does not give P_n for ℱ″ from P_n for ℱ and ℱ′ (the connecting map R^i f_!ℱ″ → R^{i+1}f_!ℱ′ raises degree, so it only gives the weaker bound n + i + 1): this direction is not claimed.

**Source.** deligne-weil-ii, §3, (3.3.1) a), b), f), p. 204; deligne-weil-ii, §3, (3.3.1) f), p. 204.

### `DWP.7/devissage-in-the-target` — Dévissages (c), (d), (e) of the direct-image theorem

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Keep the notation P_n(f) of DWP.7/devissage-in-the-sheaf-and-the-source. (c) Let j : V → Y be open with closed complement i : T → Y, and f_V, f_T the base changes of f. Then ℱ satisfies P_n(f) iff ℱ|X_V satisfies P_n(f_V) and ℱ|X_T satisfies P_n(f_T). More generally, a sheaf 𝒢 on Y is mixed of weights ≤ m iff 𝒢|V and 𝒢|T are. (d) If f = g ∘ h with h : X → Z and g : Z → Y separated of finite type, and R^p g_! R^q h_!ℱ is mixed of weights ≤ n + p + q for all p, q, then ℱ satisfies P_n(f); in particular P_n(h) for ℱ together with P_{n+q}(g) for every R^q h_!ℱ implies P_n(f). (e) If g : Y′ → Y is a universal homeomorphism (integral, radicial, surjective), f′ : X′ → Y′ the base change and ℱ′ the pullback of ℱ, then ℱ satisfies P_n(f) iff ℱ′ satisfies P_n(f′); examples: Y′ = Y_red, and for Y normal integral, the normalisation of Y in a purely inseparable extension of its function field. The same statements hold for ι-mixed sheaves with real weights.

**Hypotheses.** Separated finite-type morphisms over ℤ[1/ℓ]; (e): a universal homeomorphism induces an equivalence of étale sites and isomorphisms of residue fields at closed points (finite fields are perfect).

**Proof outline.**

1. (c) Proper base change for Rf_! (SF.2, EDC.0) identifies (R^i f_!ℱ)|V = R^i f_{V!}(ℱ|X_V) and (R^i f_!ℱ)|T = R^i f_{T!}(ℱ|X_T). For a sheaf 𝒢, 0 → j_!j*𝒢 → 𝒢 → i_*i*𝒢 → 0 is exact and j_!, i_* preserve mixedness and weights (extension by zero and closed pushforward do not change the nonzero stalks), so 𝒢 is an extension of mixed sheaves of weights ≤ m.
2. (d) The Leray spectral sequence E_2^{pq} = R^p g_! R^q h_!ℱ ⇒ R^{p+q} f_!ℱ (EDC.0) has finitely many nonzero terms; E_∞^{pq} is a subquotient of E_2^{pq}, hence mixed of weights ≤ n + p + q, and R^k f_!ℱ has a finite filtration with quotients E_∞^{p,k−p}.
3. (e) Topological invariance of the étale site (SF.2) gives Rf′_!ℱ′ = g*Rf_!ℱ; g is a bijection on closed points with equal finite residue fields, so a sheaf 𝒢 on Y is mixed of weights ≤ m iff g*𝒢 is.

**Depends on.** `DWP.7/devissage-in-the-sheaf-and-the-source`, `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: for Y = Spec ℤ[1/ℓ], (c) reduces P_n(f) to its restrictions over dense opens and finitely many closed points 𝔽_p.
- Acceptance: the Frobenius twist Y′ = Y over 𝔽_p (absolute Frobenius) is a universal homeomorphism, and (e) is compatible with it.
- Non-example: (c) is false with an arbitrary open cover replaced by a single dense open: weights over T are not controlled by those over V.

**Source.** deligne-weil-ii, §3, (3.3.1) c), d), e), p. 204; deligne-weil-ii, §3, (3.3.1) e), p. 204.

### `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve` — Generic smoothness and tame covers of a lisse sheaf on a curve (Weil II (α), (β))

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let K be a field in which ℓ is invertible, C a separated K-scheme of finite type of dimension ≤ 1, and ℱ a lisse ℚ̄_ℓ-sheaf on C. After replacing K by a finite purely inseparable extension (none is needed if K is perfect): (α) there is a finite set Σ of closed points of C_red such that C′ = C_red − Σ is smooth over K; (β) there are a smooth projective curve D̄ over K, a reduced divisor E ⊂ D̄ étale over K, and a finite étale surjective morphism u : D = D̄ − E → C′ such that u*ℱ is tamely ramified along E, and ℱ|C′ is a direct summand of u_*u*ℱ = Ru_*u*ℱ.

**Hypotheses.** ℓ invertible in K; ℱ lisse on C; C of dimension ≤ 1; the direct-summand statement uses ℚ̄_ℓ coefficients: the trace u_*u* → id composed with the adjunction is multiplication by the degree on each component, invertible in ℚ̄_ℓ.

**Proof outline.**

1. (α) Over a perfect field the smooth locus of a reduced scheme of finite type is dense open; for a curve its complement is finite. In general pass to the perfect closure, and descend the finitely many data to a finite purely inseparable extension.
2. (β) ℱ comes from a continuous representation ρ : π₁(C′, c̄) → GL_r(O_E) for a finite extension E/ℚ_ℓ with ring of integers O_E (EDC.0). The subgroup Γ = ker(GL_r(O_E) → GL_r(O_E/ℓ²)) is open and pro-ℓ, so ρ⁻¹(Γ) defines a connected finite étale Galois cover on each component, u : D → C′.
3. Let D̄ be the smooth projective model of D over the (perfect) field K, i.e. the normal compactification given by the function field (tauceti AlgebraicCurves layer 12), and E = D̄ − D with its reduced structure; over a perfect field a reduced finite K-scheme is étale.
4. At each point e of E the inertia group I_e of the henselian local field acts on (u*ℱ) through Γ, a pro-ℓ group; the wild inertia subgroup is pro-p (p the residue characteristic, or trivial in characteristic 0) (tauceti LocalFieldsRamification layers 3–4), so its image in Γ is trivial and u*ℱ is tamely ramified along E.
5. Since u is finite étale, u_* = u_! = Ru_* and there are adjunction and trace maps ℱ → u_*u*ℱ → ℱ whose composite is multiplication by deg u on each connected component of C′, invertible in ℚ̄_ℓ.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.0`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: for K = 𝔽_q, C = 𝔾_m and ℱ the Kummer sheaf of a character of order prime to p, u can be taken to be the identity: ℱ is already tame at 0 and ∞.
- Acceptance: for the Artin–Schreier sheaf L_ψ on 𝔸¹_{𝔽_p}, which is wildly ramified at ∞, u is a nontrivial cover (its pullback to the Artin–Schreier cover y^p − y = x becomes trivial, hence tame).
- Non-example: over an imperfect K, a regular nonsmooth curve (for example y² = x^p − t over 𝔽_p(t), p odd) needs the purely inseparable extension before (α) holds.

**Source.** deligne-weil-ii, §3, proof of (3.3.1), p. 205.

### `DWP.7/spreading-out-to-a-tame-relative-curve` — Reduction of the direct-image theorem to a tame smooth projective relative curve

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Assume Theorem 3.3.1 holds for every quadruple (f̄, D, ℱ, Y) of the following kind: Y is an integral regular scheme of finite type over ℤ[1/ℓ] (the source's 'Y_red lisse'); f̄ : X̄ → Y is projective and smooth of pure relative dimension 1; D ⊂ X̄ is a divisor finite étale over Y; X = X̄ − D with f = f̄|X; and ℱ is a lisse sheaf on X, punctually pure of weight n and tamely ramified along D. Then Theorem 3.3.1 holds for every separated morphism of schemes of finite type over ℤ[1/ℓ] and every sheaf mixed of weights ≤ n. The same reduction holds for ι-mixed sheaves with real weights.

**Hypotheses.** Separated finite-type morphisms over ℤ[1/ℓ]; noetherian induction on Y and induction on the relative dimension of f.

**Proof outline.**

1. Dévissages (b), (c), (d) reduce to f of relative dimension ≤ 1: factor f locally on X through an affine space over Y, decompose by coordinate projections into morphisms of relative dimension ≤ 1, and use (d); (f) disposes of relative dimension 0. Dévissages (a), (b) reduce to ℱ lisse and punctually pure of weight n on X, by the defining filtration of a mixed sheaf and a stratification of X on whose strata ℱ is lisse.
2. By (c) and noetherian induction on Y it suffices to prove the conclusion over a dense open of each irreducible component of Y. Let η be a generic point of Y and apply DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve to the generic fibre X_η and ℱ|X_η, after a finite purely inseparable extension of k(η).
3. Spread out C′, D̄, E, u and the direct-summand splitting to a dense open of the normalisation of Y_red in that purely inseparable extension, by finite-presentation limit arguments for polarised relative curves (tauceti ModularCurves 0E, AdicCoefficientsAndComparisons L2); shrink so that the open is regular (the regular locus of an excellent integral scheme is a dense open) and D̄ → Y is projective and smooth, E finite étale, u finite étale and u*ℱ tamely ramified along E (tameness spreads out from the generic points of E because the ramification is controlled by the pro-ℓ monodromy group Γ of the previous node).
4. By (e) the purely inseparable base change is harmless; by (b), (f), (a) the finitely many points removed in (α) do not matter and ℱ|C′ may be replaced by its summand-carrier u_*u*ℱ, i.e. by u*ℱ on D, since Rf_!u_* = R(fu)_!.

**Depends on.** `DWP.7/devissage-in-the-sheaf-and-the-source`, `DWP.7/devissage-in-the-target`, `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`, `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: for f : 𝔸² → 𝔸¹ a coordinate projection over 𝔽_q and ℱ = ℚ̄_ℓ, the reduced situation is X̄ = ℙ¹_{𝔸¹}, D = ∞ × 𝔸¹, ℱ = ℚ̄_ℓ.
- Acceptance: the reduction keeps Y of finite type over ℤ[1/ℓ], so it applies to schemes over ℤ[1/ℓ] with characteristic-zero generic points, where tameness is automatic.
- Non-example: the reduction does not assume f̄ proper from the start; a nonproper X is compactified only after the reduction to a relative curve.

**Source.** deligne-weil-ii, §3, proof of (3.3.1), p. 205; deligne-weil-ii, §3, proof of (3.3.1), p. 205.

### `DWP.7/purity-of-the-relative-curve-case` — The direct-image theorem for a tame smooth projective relative curve

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

In the reduced situation of DWP.7/spreading-out-to-a-tame-relative-curve (f̄ : X̄ → Y projective and smooth of pure relative dimension 1 over an integral regular Y of finite type over ℤ[1/ℓ], j : X = X̄ − D → X̄ with i : D → X̄ the inclusion of a divisor finite étale over Y, and ℱ lisse on X, punctually pure of weight n and tamely ramified along D), R^i f_!ℱ is mixed of weights ≤ n + i for every i. More precisely Rf_!ℱ = Rf̄_*(j_!ℱ); R^i f̄_*(j_*ℱ) is punctually pure of weight n + i; and i*j_*ℱ carries the filtration induced by the local monodromy filtration M along D, with Gr^M_k(i*j_*ℱ) zero for k > 0 and punctually pure of weight n + k on D for k ≤ 0. The ι-version holds with n replaced by β ∈ ℝ.

**Hypotheses.** f̄ projective smooth of relative dimension 1; D finite étale over Y; ℱ tamely ramified along D; used for every isomorphism ι : ℚ̄_ℓ ≅ ℂ to obtain integer weights.

**Proof outline.**

1. Proper base change and tameness: because D is finite étale over Y and ℱ is tame along D, the formation of j_*ℱ, i*j_*ℱ and the local monodromy filtration M commutes with passage to the fibres X̄_y, y ∈ |Y| (Weil II 1.8.6–1.8.8, imported from DWP.5; base change of j_* for tame sheaves along a relative divisor with normal crossings, EDC.0/SF.2). So R^i f̄_*(j_*ℱ) and i*j_*ℱ may be computed fibrewise.
2. On each fibre, a smooth projective curve over the finite field k(y) with a lisse sheaf punctually ι-pure of weight n on the complement of D_y: DWP.6's theorem (Weil II 3.2.3), applied for every ι, gives that H^i(X̄_ȳ, j_*ℱ) is punctually pure of weight n + i.
3. DWP.5's local weight theorem (Weil II 1.8.4 with 1.8.8, for every ι) gives that Gr^M_k(i*j_*ℱ) vanishes for k > 0 and is punctually pure of weight n + k ≤ n on D.
4. Apply R f̄_* to 0 → j_!ℱ → j_*ℱ → i_*i*j_*ℱ → 0. Since f̄∘i : D → Y is finite, dévissage (f) shows R^q(f̄ i)_*(i*j_*ℱ) vanishes for q ≠ 0 and R⁰ is mixed of weights ≤ n. The long exact sequence then gives R^q f̄_*(j_!ℱ) as an extension of a subsheaf of R^q f̄_*(j_*ℱ) (weight n + q) by a quotient of R^{q−1}(f̄ i)_*(...) (weights ≤ n ≤ n + q), which is mixed of weights ≤ n + q by dévissage (a).

**Depends on.** `DWP.7/spreading-out-to-a-tame-relative-curve`, `DWP.7/devissage-in-the-sheaf-and-the-source`, `DWP.6`, `DWP.5`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: for Y = Spec 𝔽_q, X̄ = ℙ¹, D = {0, ∞} and ℱ = ℚ̄_ℓ: H¹_c(𝔾_m) = ℚ̄_ℓ (weight 0 ≤ 1), H²_c(𝔾_m) = ℚ̄_ℓ(−1) (weight 2): the bound is an upper bound, attained only in degree 2.
- Acceptance: for an elliptic curve E over 𝔽_q minus its origin and ℱ = ℚ̄_ℓ: H¹_c = H¹(E) is pure of weight 1.
- Non-example: without tameness along D the formation of j_*ℱ need not commute with base change to the fibres, and the fibrewise computation is not available.

**Source.** deligne-weil-ii, §3, proof of (3.3.1), p. 205; deligne-weil-ii, §3, proof of (3.3.1), p. 205.

### `DWP.7/fundamental-direct-image-theorem-3-3-1` — Deligne's fundamental theorem: R^i f_! of a mixed sheaf of weights ≤ n has weights ≤ n + i

*Theorem* · planet: **Fundamental theorem of Weil II** · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and ℱ a sheaf on X, mixed of weights ≤ n. Then for every i the sheaf R^i f_!ℱ on Y is mixed of weights ≤ n + i. In particular, for X₀ of finite type over 𝔽_q, Y₀ = Spec 𝔽_q and ℱ₀ mixed of weights ≤ n (a Weil sheaf being allowed), every eigenvalue α of the geometric Frobenius F on H^i_c(X, ℱ) is an algebraic number for which there is an integer w ≤ n + i with |σ(α)| = q^{w/2} for every field embedding σ : ℚ(α) → ℂ.

**Hypotheses.** f separated of finite type over ℤ[1/ℓ] (both characteristic p and mixed characteristic bases); ℱ mixed: integer weights in the all-embeddings sense; only an upper bound: no lower bound and no purity is asserted.

**Proof outline.**

1. By DWP.7/spreading-out-to-a-tame-relative-curve it suffices to treat the tame smooth projective relative curve, which is DWP.7/purity-of-the-relative-curve-case.
2. The finite-field case is the case Y = Spec 𝔽_q; H^i_c(X, ℱ) is the geometric stalk of R^i f_!ℱ, with F acting as the geometric Frobenius of the closed point (Weil-sheaf variant: Weil II 1.1.10–1.1.14, DWP.5).
3. A sheaf on Spec 𝔽_q mixed of weights ≤ n + i is a Frobenius module whose eigenvalues are Weil q-numbers of integer weights ≤ n + i (DWP.0/weil-q-number).

**Depends on.** `DWP.7/spreading-out-to-a-tame-relative-curve`, `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/weights-mixed-sheaves-definitions`, `DWP.0/weil-q-number`, `DWP.5`.

**Acceptance.**

- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ: weights 0 on H¹_c and 2 on H²_c, both ≤ i.
- Acceptance: X₀ = Spec 𝔽_q ⊔ Spec 𝔽_q, ℱ₀ = ℚ̄_ℓ(1): H⁰_c = ℚ̄_ℓ(1)² has weight −2 ≤ −2 + 0.
- Acceptance (relative, mixed characteristic): for f : 𝔸¹_{ℤ[1/ℓ]} → Spec ℤ[1/ℓ] and ℱ = ℚ̄_ℓ, R²f_!ℚ̄_ℓ = ℚ̄_ℓ(−1) is pure of weight 2 at every closed point 𝔽_p, p ≠ ℓ.
- Non-example: the theorem gives no lower bound: H¹_c(𝔾_m) has weight 0 < 1.

**Source.** deligne-weil-ii, §3, Théorème (3.3.1), p. 204; deligne-weil-ii, Introduction, Théorème 1, p. 138.

### `DWP.7/iota-mixed-direct-image-3-3-10` — The direct-image theorem for ι-mixed sheaves with real weights

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Fix a field isomorphism ι : ℚ̄_ℓ ≅ ℂ and β ∈ ℝ. Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] and ℱ an ι-mixed sheaf on X with punctual ι-weights ≤ β. Then for every i, R^i f_!ℱ is ι-mixed, and every punctual ι-weight of R^i f_!ℱ is ≤ β + i and congruent modulo ℤ to one of the punctual ι-weights of ℱ. Over 𝔽_q (Weil sheaves allowed), every eigenvalue of F on H^i_c(X, ℱ) has ι-weight ≤ β + i in such a class. No algebraicity, no integrality and no bound at another embedding follows from this statement.

**Hypotheses.** One fixed ι; real weights; the integrality argument of Weil II 3.3.2 does not apply to ι-mixed sheaves.

**Proof outline.**

1. Rerun DWP.7/spreading-out-to-a-tame-relative-curve and DWP.7/purity-of-the-relative-curve-case with ι-weights: the dévissages hold verbatim for ι-mixed sheaves, and DWP.6 and DWP.5 supply the fixed-ι curve and local statements.
2. Weights mod ℤ: in the reduced situation the weights of R^q f̄_*(j_*ℱ) are β + q and those of Gr^M_k are β + k, all in β + ℤ; the dévissages only take extensions and subquotients, so every weight produced lies in the class mod ℤ of a weight of the input.

**Depends on.** `DWP.7/spreading-out-to-a-tame-relative-curve`, `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/weights-mixed-sheaves-definitions`, `DWP.5`, `DWP.6`, `DWP.0/iota-weight`.

**Acceptance.**

- Acceptance: on Spec 𝔽_q the rank-one Weil sheaf ℚ̄_ℓ^{(b)} with b = q^{1/3} (a chosen cube root) is ι-pure of weight 2/3 for every ι; for X₀ = 𝔾_m and ℱ₀ the pullback, H¹_c and H²_c have ι-weights 2/3 and 8/3, both ≡ 2/3 mod ℤ.
- Non-example: the conclusion does not say that eigenvalues are algebraic: a transcendental b with |ιb| = 1 gives an ι-pure sheaf of weight 0 whose H⁰ has a transcendental eigenvalue.

**Source.** deligne-weil-ii, §3, (3.3.10), p. 207.

### `DWP.7/deligne-integrality-theorem-sga7-xxi` — Deligne's integrality theorem (SGA 7 XXI 5.2.2)

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X (DWP.7/integral-sheaf). Then for every i the sheaf R^i f_!ℱ is integral, and for i ≥ d the twist R^i f_!ℱ(i − d) is integral: at every closed point y of Y, every eigenvalue α of F_y on (R^i f_!ℱ)_ȳ is an algebraic integer, and for i ≥ d the number α/N(y)^{i−d} is an algebraic integer.

**Hypotheses.** ℱ integral; fibre dimension ≤ d; constant coefficients ℚ̄_ℓ are integral, so the theorem applies to H^i_c(X, ℚ̄_ℓ).

**Proof outline.**

1. By proper base change (SF.2) the stalk of R^i f_!ℱ at a geometric point over y ∈ |Y| is H^i_c of the fibre, so the statement reduces to Y = Spec 𝔽_q and X₀ of dimension ≤ d over 𝔽_q.
2. Over 𝔽_q the statement is SGA 7 XXI (5.2.2). Its proof was not available to this plan (SGA 7 II is not openly readable) and is recorded as a gap: a planner with the text must decompose it into its reductions and their prerequisites before this node can be closed.
3. This node is the single owner of the statement for its consumers DWP.7/integral-weight-bounds-3-3-3 and DWP.7/valuation-triangles-3-3-8; they use only the displayed conclusion.

**Depends on.** `DWP.7/integral-sheaf`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `DWP.5`.

**Acceptance.**

- Acceptance: X₀ = ℙ¹, ℱ₀ = ℚ̄_ℓ, d = 1: the eigenvalue q on H² satisfies q/q^{2−1} = 1 integral.
- Acceptance: X₀ = 𝔾_m (d = 1), H²_c = ℚ̄_ℓ(−1): q/q = 1; H¹_c: eigenvalue 1, integral.
- Non-example: for ℱ₀ = ℚ̄_ℓ(1), which is not integral, H⁰_c(Spec 𝔽_q, ℱ₀) has eigenvalue q⁻¹: the hypothesis on ℱ cannot be dropped.

**Source.** deligne-weil-ii, §3, proof of Corollaire (3.3.3), p. 205.

### `DWP.7/integral-weight-bounds-3-3-3` — Weights of R^i f_! of an integral mixed sheaf lie between 0 (or 2(i − d)) and n + i

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let f : X → Y be a separated morphism of schemes of finite type over ℤ[1/ℓ] whose fibres have dimension ≤ d, and ℱ an integral sheaf on X, mixed of weights ≤ n. Then for every i, R^i f_!ℱ is mixed with all punctual weights in [0, n + i]; if i > d, all punctual weights lie in [2(i − d), n + i].

**Hypotheses.** ℱ integral and mixed (integer weights); d bounds the dimension of every fibre of f.

**Proof outline.**

1. Upper bound: DWP.7/fundamental-direct-image-theorem-3-3-1.
2. Lower bound 0: R^i f_!ℱ is integral (DWP.7/deligne-integrality-theorem-sga7-xxi) and mixed, so its weights are ≥ 0 (api IsIntegralSheaf.weights_nonneg).
3. Lower bound 2(i − d) for i > d: R^i f_!ℱ(i − d) is integral and mixed with weights shifted by −2(i − d), hence ≥ 0.

**Depends on.** `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.7/integral-sheaf`.

**Acceptance.**

- Acceptance: X₀ = ℙ¹ (d = 1), i = 2: the weight 2 lies in [2(2 − 1), 0 + 2] = {2}.
- Acceptance: X₀ = 𝔾_m (d = 1), i = 1: weight 0 ∈ [0, 1].
- Non-example: for the non-integral sheaf ℚ̄_ℓ(1) on Spec 𝔽_q the weight −2 is negative.

**Source.** deligne-weil-ii, §3, Corollaire (3.3.3), p. 205.

### `DWP.7/cohomological-bounds-3-3-2-3-3-6` — Weight bounds for H^i_c and H^i over a finite field, and purity of the image H^i_c → H^i

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let X₀ be a scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q. (i) (Weil II 3.3.4) If ℱ₀ is mixed of weights ≤ n (a Weil sheaf being allowed), then H^i_c(X, ℱ) is mixed of weights ≤ n + i: every eigenvalue α of F is algebraic, with an integer w ≤ n + i such that every complex conjugate of α has absolute value q^{w/2}. If ℱ₀ is integral then w ≥ 0, and if moreover i > d = dim X₀ then w ≥ 2(i − d). (ii) (3.3.5) If X₀ is smooth and ℱ₀ is lisse and mixed of weights ≥ n, then H^i(X, ℱ) is mixed of weights ≥ n + i. (iii) (3.3.6) If X₀ is smooth and ℱ₀ is lisse and punctually pure of weight n, then the image of H^i_c(X, ℱ) → H^i(X, ℱ) is pure of weight n + i. (iv) (3.3.10) For a fixed ι, (i) without its integral clauses, (ii) and (iii) hold with 'mixed' replaced by 'ι-mixed', n by β ∈ ℝ and weights read as ι-weights.

**Hypotheses.** (ii) and (iii) need X₀ smooth and ℱ₀ lisse: they rest on Poincaré duality; the integral clauses of (i) need ℱ₀ integral; (iv) is a statement at one ι; it does not give integer weights.

**Proof outline.**

1. (i) is the case Y = Spec 𝔽_q of DWP.7/fundamental-direct-image-theorem-3-3-1 and DWP.7/integral-weight-bounds-3-3-3.
2. (ii) Reduce to X₀ of pure dimension N (components). The dual ℱ₀^∨ is lisse and mixed of weights ≤ −n. By (i), H^{2N−i}_c(X, ℱ^∨)(N) is mixed of weights ≤ −n + (2N − i) − 2N = −n − i (reading ℱ^∨ in the printed proof, PAPER-DELIGNE-80/E45). Poincaré duality (EDC.2) gives a Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}_c(X, ℱ^∨)(N) → ℚ̄_ℓ, so the eigenvalues on H^i(X, ℱ) are the inverses of those on H^{2N−i}_c(X, ℱ^∨)(N) (DWP.0/reciprocal-pairing-of-eigenvalues) and have weights ≥ n + i.
3. (iii) The image is a quotient of H^i_c (weights ≤ n + i by (i)) and a subspace of H^i (weights ≥ n + i by (ii)), hence pure of weight n + i (DWP.0/purity-under-subquotients-and-extensions).
4. (iv) Use DWP.7/iota-mixed-direct-image-3-3-10 in place of 3.3.1; the duality step is unchanged.

**Depends on.** `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/integral-weight-bounds-3-3-3`, `DWP.7/iota-mixed-direct-image-3-3-10`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DWP.0/reciprocal-pairing-of-eigenvalues`, `DWP.0/purity-under-subquotients-and-extensions`, `DWP.0/spectra-of-tensor-products-and-duals`.

**Acceptance.**

- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ: H¹_c has weight 0 ≤ 1, H¹ = ℚ̄_ℓ(−1) has weight 2 ≥ 1, and the image H¹_c → H¹ is 0 (pure of weight 1 vacuously).
- Acceptance: X₀ = 𝔸¹ minus the two points of a quadratic extension of 𝔽_q (a closed point of degree 2), ℱ₀ = ℚ̄_ℓ: H¹ has weight 2 with F-eigenvalues q and −q.
- Non-example (smoothness): for the nodal cubic X₀ (projective, singular) and ℱ₀ = ℚ̄_ℓ, H¹(X) = H¹_c(X) = ℚ̄_ℓ has weight 0 < 1: the lower bound (ii) fails without smoothness, although every stalk of ℱ₀ is pure of weight 0.
- Non-example (lissity): on the smooth proper ℙ¹ with ℱ₀ = j_!ℚ̄_ℓ for j : 𝔾_m → ℙ¹ (every stalk is of weight 0 or zero), H¹(ℙ¹, ℱ) = H¹_c(𝔾_m) = ℚ̄_ℓ has weight 0 < 0 + 1: (ii) needs ℱ₀ lisse.

**Source.** deligne-weil-ii, §3, Corollaire (3.3.4), p. 206; deligne-weil-ii, §3, Corollaires (3.3.5) et (3.3.6), p. 206; deligne-weil-ii, §3, (3.3.10), p. 207.

### `DWP.7/newton-couples-3-3-7` — The p-adic couple of a pure algebraic number

*Definition* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let q = p^f, n ∈ ℤ, and α an algebraic number which is a Weil q-number of weight n (DWP.0). Let K be a number field containing α and v a valuation of K above p, normalised by v(q) = 1, extended to v : K → ℚ ∪ {∞}. The couple of α at v is (r, s) = (v(α), v(q^n α⁻¹)). Here q^n α⁻¹ ∈ K, and under every embedding σ : K → ℂ it maps to the complex conjugate of σ(α) (DWP.0/weil-number-arithmetic (iii)); so q^n α⁻¹ has the same minimal polynomial over ℚ as α, i.e. it is a Galois conjugate of α. Always r + s = n; if α is integral over ℤ then r ≥ 0 and s ≥ 0.

**Hypotheses.** α a Weil q-number of integer weight n; v normalised by v(q) = 1, not by v(p) = 1.

**Proof outline.**

1. r + s = v(q^n) = n·v(q) = n because v is a valuation.
2. q^n α⁻¹ is a root of the minimal polynomial of α: for one embedding σ, σ(q^n α⁻¹) = conj(σ α), a root of the minimal polynomial; so the minimal polynomials agree. If α is integral, so is every Galois conjugate, hence r, s ≥ 0.

**Depends on.** `DWP.0/weil-q-number`, `DWP.0/weil-number-arithmetic`.

**Used by.**

- Weil II Corollaire (3.3.8), p. 206: locates the couples of Frobenius eigenvalues of H^i_c and of H^i (X smooth) in triangles.
- DeligneWeightsAndPurity:DWP.7/valuation-triangles-3-3-8: the triangle inequalities are statements about r and s.
- Weil II (3.3.7): Newton-polygon slopes of Frobenius: r is the slope of α at v, s that of its complex conjugate.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.newtonCouple` | data | newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) : WithTop ℚ × WithTop ℚ := (v α, v (q ^ n * α⁻¹)). |
| `TauCeti.Weights.newtonCouple_fst_add_snd` | characterisation | v q = 1 → α ≠ 0 → (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = n. |
| `TauCeti.Weights.newtonCouple_nonneg` | other | If α and q^n α⁻¹ are integral over ℤ (in particular if α is integral and a Weil q-number of weight n) and v is nonnegative on the integers of K, both coordinates are ≥ 0. |
| `TauCeti.Weights.newtonCouple_swap_conj` | relation | For a Weil q-number α of weight n, the couple of q^n α⁻¹ is the couple of α with its coordinates swapped. |
| `TauCeti.Weights.newtonCouple_galois` | functoriality | For τ ∈ Aut(K), newtonCouple (v ∘ τ) q n α = newtonCouple v q n (τ α). |
| `TauCeti.Weights.newtonCouple_mul` | simp | Couples add under multiplication: the couple of αβ (weight n + m) is the sum of the couples. |
| `TauCeti.Weights.newtonCouple_div_pow` | simp | The couple of α/q^m (weight n − 2m) is (r − m, s − m). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.newtonCouple_fst_add_snd` | characterisation | r + s = n for every valuation v with v(q) = 1 and every nonzero α. |
| `TauCeti.Weights.newtonCouple_supersingular` | computation | q = p, α = √−p (weight 1, a root of T² + p): at the unique place above p of ℚ(√−p), (r, s) = (1/2, 1/2). |
| `TauCeti.Weights.newtonCouple_ordinary` | computation | q = 5, α = 1 + 2i (weight 1, ∣α∣² = 5): at the place v of ℚ(i) with v(1 + 2i) = 1 (normalised v(5) = 1), (r, s) = (1, 0); at the conjugate place (r, s) = (0, 1). |
| `TauCeti.Weights.newtonCouple_tate` | degenerate | α = q^m (weight 2m): (r, s) = (m, m) at every place above p. |
| `TauCeti.Weights.newtonCouple_nonintegral` | non-example | α = q⁻¹ (weight −2): (r, s) = (−1, −1); the nonnegativity of r and s genuinely needs integrality. |

**Acceptance.**

- The couple depends on v only through the place of ℚ(α) below it, and is permuted by Gal(ℚ̄/ℚ) acting on the places above p.

**Source.** deligne-weil-ii, §3, (3.3.7), p. 206.

### `DWP.7/valuation-triangles-3-3-8` — The p-adic couples of Frobenius eigenvalues lie in triangles

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let X₀ be a scheme of finite type over 𝔽_q, q = p^f, of dimension ≤ d, and i ≥ 0. Let α be an eigenvalue of F on H^i_c(X, ℚ̄_ℓ), or on H^i(X, ℚ̄_ℓ) when X₀ is proper, of weight w, and (r, s) its couple at a place v above p (DWP.7/newton-couples-3-3-7). Then r + s = w ≤ i and r, s ≥ max(0, i − d): (r, s) lies in the lower triangle {r + s ≤ i, r ≥ max(0, i − d), s ≥ max(0, i − d)}. If X₀ is smooth of pure dimension d and α is an eigenvalue of F on H^i(X, ℚ̄_ℓ), then r + s = w ≥ i and r, s ≤ min(i, d): (r, s) lies in the upper triangle {r + s ≥ i, r ≤ min(i, d), s ≤ min(i, d)}.

**Hypotheses.** Constant coefficients ℚ̄_ℓ; proper X₀ for ordinary cohomology in the first part; smooth X₀ of pure dimension d in the second; rests on the integrality theorem DWP.7/deligne-integrality-theorem-sga7-xxi.

**Proof outline.**

1. Compact support: w ≤ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (i). The eigenvalue α is integral and, for i ≥ d, α/q^{i−d} is integral (DWP.7/deligne-integrality-theorem-sga7-xxi with ℱ = ℚ̄_ℓ). So r ≥ max(0, i − d). The number q^w α⁻¹ is a Galois conjugate of α (DWP.7/newton-couples-3-3-7), so it is also integral and divisible by q^{i−d}: s ≥ max(0, i − d).
2. Proper X₀: H^i = H^i_c.
3. Smooth X₀ of pure dimension d: Poincaré duality (EDC.2) pairs H^i(X) with H^{2d−i}_c(X)(d), so α = q^d/β for an eigenvalue β of F on H^{2d−i}_c(X) of weight 2d − w. Then r = d − v(β) and s = d − v(q^{2d−w}β⁻¹). By the first part applied in degree 2d − i, v(β) and v(q^{2d−w}β⁻¹) are ≥ max(0, d − i); hence r, s ≤ min(d, i). And w ≥ i by DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii).

**Depends on.** `DWP.7/newton-couples-3-3-7`, `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.7/cohomological-bounds-3-3-2-3-3-6`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: X₀ = ℙ^d, i = 2k: α = q^k, (r, s) = (k, k) lies in both triangles (on the antidiagonal).
- Acceptance: an ordinary elliptic curve over 𝔽_p, i = 1, d = 1: the unit root has (r, s) = (0, 1) and the other (1, 0), the two corners of the antidiagonal; a supersingular one gives (1/2, 1/2).
- Acceptance: X₀ = 𝔾_m (d = 1): on H²_c the eigenvalue q has (1, 1), with r, s ≥ 2 − 1 = 1; on H¹ (smooth) the eigenvalue q has (1, 1) ≤ (min(1, 1), min(1, 1)).
- Non-example: the source's remark that in ordinary cohomology (r, s) always lies in the union square of the two triangles is stated there without proof and is not part of this node.

**Source.** deligne-weil-ii, §3, Corollaire (3.3.8), p. 206; deligne-weil-ii, §3, after (3.3.8), p. 207.

### `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11` — Purity for proper smooth varieties and rational homology manifolds over a finite field

*Theorem* · planet: **Purity of proper smooth cohomology** · module `TauCeti/AlgebraicGeometry/Weights/DirectImage`, namespace `TauCeti.Weights`

Let X₀ be a scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, a : X₀ → Spec 𝔽_q. (i) If X₀ is proper and smooth and ℱ₀ is lisse and punctually pure of weight n, then H^i(X, ℱ) is pure of weight n + i for every i; the same holds for ι-purity with n ∈ ℝ. (ii) (Weil II 3.3.9) If X₀ is proper and smooth, then for every i the polynomial det(1 − F t, H^i(X, ℚ_ℓ)) has integer coefficients independent of ℓ ≠ p, and its reciprocal roots, the eigenvalues of F, are Weil q-numbers of weight i. (iii) (3.3.11) In (i) and (ii) and in DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii), 'smooth of pure dimension N' may be replaced by the condition that X₀ is of pure dimension N and Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] Frobenius-equivariantly (EDC.1's exceptional inverse image), for instance when X₀ is étale-locally the quotient of a smooth scheme of dimension N by a finite group; then the lower bound and purity statements hold with ℱ₀ = ℚ̄_ℓ.

**Hypotheses.** (i), (ii): X₀ proper AND smooth; projectivity is not assumed; (iii): the exact dualizing-object hypothesis Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N], not a weaker 'rationally smooth' slogan; coefficients constant; (ii)'s integrality and ℓ-independence use WC.3's algebraic factor lemma.

**Proof outline.**

1. (i) For X₀ proper, H^i_c = H^i, so DWP.7/cohomological-bounds-3-3-2-3-3-6 (iii) gives purity of weight n + i; the ι-version uses (iv) of that node.
2. (ii) Purity of weight i is (i) with ℱ₀ = ℚ_ℓ (n = 0). The zeta function Z(X₀, t) = ∏_i det(1 − F t, H^i)^{(−1)^{i+1}} is in ℚ(t) with integral power-series expansion and does not depend on ℓ (trace formula, SF.2). Since the factors of different degrees have reciprocal roots of different absolute values, no cancellation occurs, and WC.3's algebraic factor lemma (the argument of Weil I, proof of (1.7) ⇒ (1.6)) extracts each det(1 − F t, H^i) as a polynomial with integer coefficients determined by Z(X₀, t), hence independent of ℓ.
3. (iii) In the proofs of DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii)–(iii) and of (i), smoothness enters only through Poincaré duality H^i(X, ℚ̄_ℓ) ≅ H^{2N−i}_c(X, ℚ̄_ℓ(N))^∨, which follows from Ra^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] and Verdier duality RΓ(X, Ra^!ℚ_ℓ) = RHom(RΓ_c(X, ℚ_ℓ), ℚ_ℓ) (EDC.1).
4. For a quotient Y/G of a smooth Y of dimension N by a finite group, ℚ_ℓ on Y/G is a direct summand of π_*ℚ_ℓ (trace, ℚ_ℓ coefficients), whence the condition by EDC.1–EDC.2.

**Depends on.** `DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DWP.7/weights-mixed-sheaves-definitions`, `WeilConjectures:WC.3`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DWP.0/weil-q-number`.

**Acceptance.**

- Acceptance: a smooth proper nonprojective threefold over 𝔽_q (Hironaka's construction, which can be carried out over a finite field) has pure cohomology by (ii) although DWP.4's projective theorem does not apply.
- Acceptance (lisse coefficients): for a smooth proper curve C₀ and an elliptic curve E₀ over 𝔽_q, the geometrically constant sheaf ℱ₀ = a*V with V = H¹(E, ℚ_ℓ) is punctually pure of weight 1, and H^i(C, ℱ) = H^i(C, ℚ_ℓ) ⊗ V is pure of weight i + 1.
- Acceptance: the weighted projective plane ℙ(1, 1, 2) (étale-locally a quotient of 𝔸² by μ₂, p ≠ 2) satisfies (iii) and its H² = ℚ_ℓ(−1) is pure of weight 2.
- Non-example: the nodal cubic (proper, singular) has H¹ = ℚ_ℓ of weight 0: properness alone does not give purity, and Ra^!ℚ_ℓ ≠ ℚ_ℓ(1)[2] there.
- Non-example: 𝔾_m (smooth, not proper) has H¹ of weight 2 ≠ 1.

**Source.** deligne-weil-ii, §3, Corollaire (3.3.9), p. 207; deligne-weil-ii, §3, (3.3.11), p. 207; deligne-weil-ii, Introduction, p. 138; yu-23, Proposition 6.1.1, proof, pp. 42–43.

## Layer DWP.8 — Mixed complexes, weight filtrations and geometric semisimplicity

**Milestone.** The weight formalism for complexes (Weil II §6): D^b_m, weights ≤ w (6.2.2), weights ≥ w
through D, purity (6.2.4); stability of mixedness under Rf_* (6.1.2), under the four operations, ⊗,
RHom and D (6.1.11) and under nearby cycles (6.1.13); the estimates f*, Rf_! ≤; Rf_*, Rf^! ≥;
D exchanges; ⊗ adds upper bounds; RHom(≤ a, ≥ b) ≥ b − a; purity of proper direct images (6.2.6) and
its ℤ[1/ℓ] form (6.2.7). The structure of lisse mixed sheaves (Weil II 3.4): the Ext¹ sequence (3.4.2)
and Lemmas 3.4.3–3.4.4, the decomposition by weights modulo ℤ, the weight filtration and the
semisimplicity theorem (3.4.1), potential properties (3.4.10) and the semisimplicity of R^i f_*ℚ_ℓ for
proper smooth f over any algebraically closed field (3.4.11–3.4.13). The weight spectral sequence of a
normal crossings compactification is the geometric instance of the weight filtration (Bergström–Faber–Payne).

**What is not claimed.** Each functor preserves one bound: Rf_* and Rf^! need not preserve upper bounds,
f* and Rf_! need not preserve lower bounds. A pure complex is not asserted to split into its cohomology
sheaves; the decomposition theorem is EDC.7's. Geometric semisimplicity holds after base change to 𝔽̄_q;
the unipotent Weil sheaf [[1, 1], [0, 1]] on Spec 𝔽_q is pure of weight 0 and not arithmetically semisimple.

### `DWP.8/mixed-complexes` — Mixed complexes and complexes of weights ≤ w

*Definition* · planet: **Mixed complexes** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be a scheme of finite type over 𝔽_q (Weil II (6.1.1) a): sheaves are ℚ̄_ℓ-Weil sheaves) and D^b_c(X₀) the bounded derived category of constructible ℚ̄_ℓ-sheaves on X₀ of EDC.0, with cohomology sheaves ℋ^i. A complex K ∈ D^b_c(X₀) is mixed when every ℋ^iK is mixed (DWP.7/weights-mixed-sheaves-definitions); D^b_m(X₀) ⊂ D^b_c(X₀) is the full subcategory of mixed complexes. For w ∈ ℤ, K is mixed of weights ≤ w when, for every i, ℋ^iK is mixed of punctual weights ≤ w + i (Weil II 6.2.2); D^b_{≤w}(X₀) denotes the full subcategory of such K. For a fixed field isomorphism ι : ℚ̄_ℓ ≅ ℂ and w ∈ ℝ, 'ι-mixed of ι-weights ≤ w' is defined in the same way from DWP.5's ι-mixed sheaves. For X of finite type over ℤ[1/ℓ] (context (6.1.1) b), and Weil II 6.2.7) the same definitions apply to constructible ℚ̄_ℓ-sheaves.

**Hypotheses.** X₀ of finite type over 𝔽_q; ℚ̄_ℓ coefficients, ℓ ∤ q; the shift convention: ℋ^iK is allowed weights up to w + i, not w.

**Proof outline.**

1. D^b_m(X₀) is a strictly full triangulated subcategory: it is closed under isomorphism and shifts, and if K′ → K → K″ → K′[1] is distinguished with two of the three terms mixed, the long exact sequence of cohomology sheaves exhibits each ℋ^i of the third as an extension of a subsheaf by a quotient of mixed sheaves (stabilities, DWP.7/weights-mixed-sheaves-definitions).
2. The same argument shows that if K′ and K″ have weights ≤ w then so has K; direct summands of objects of weights ≤ w have weights ≤ w.
3. For a mixed sheaf the punctual weights are ≤ m iff every eigenvalue of every F_x on the stalks has weight ≤ m: a nonzero constructible sheaf has a nonzero stalk at a closed point.

**Depends on.** `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`, `DWP.0/endomorphism-weights`, `DWP.0/purity-under-subquotients-and-extensions`, `DWP.0/finite-field-base-extension-of-weights`.

**Used by.**

- Weil II Variante (6.2.3), p. 247: Rf_! preserves complexes of weights ≤ n; the definition is designed so that 3.3.1 gives this through the spectral sequence R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K.
- Weil II Définition (6.2.4), p. 247: a pure complex is one of weights ≤ n whose dual has weights ≤ −n.
- EtaleDualityAndPerverseSheaves:EDC.7: purity of IC_X(L) of weight w + d and of perverse direct images is stated with this weight convention.
- WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization: imports the complex weight formalism and the normalisation F[a](b) of weight r + a − 2b.
- PAPER-YUN-ZHANG-17/58 (Lemma 7.13(1)): bounded-weight terms in long exact sequences of complexes.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.IsMixedComplex` | data | IsMixedComplex K : Prop := ∀ i, IsMixed (ℋ^i K), for K in the bounded constructible derived category of EDC.0. |
| `TauCeti.Weights.HasWeightsLE` | data | HasWeightsLE (w : ℤ) K : Prop := ∀ i, IsMixed (ℋ^i K) ∧ ∀ weight m of ℋ^i K, m ≤ w + i. |
| `TauCeti.Weights.HasIotaWeightsLE` | data | The ι-variant with w : ℝ and DWP.5's ι-mixed sheaves. |
| `TauCeti.Weights.isMixedComplex_triangle` | structure | D^b_m is a triangulated subcategory: two out of three terms of a distinguished triangle mixed ⇒ the third is; closed under shifts and direct summands. |
| `TauCeti.Weights.HasWeightsLE.of_triangle` | structure | For a distinguished triangle K′ → K → K″ →: K′, K″ of weights ≤ w ⇒ K of weights ≤ w. |
| `TauCeti.Weights.hasWeightsLE_shift` | simp | HasWeightsLE (w + 1) (K[1]) ↔ HasWeightsLE w K: ℋ^i(K[1]) = ℋ^{i+1}K. |
| `TauCeti.Weights.hasWeightsLE_twist` | simp | K(r) has weights ≤ w − 2r iff K has weights ≤ w; in particular K(N)[2N] has weights ≤ w iff K has (Weil II 6.2.5 a). |
| `TauCeti.Weights.HasWeightsLE.mono` | other | w ≤ w′ → HasWeightsLE w K → HasWeightsLE w′ K. |
| `TauCeti.Weights.hasWeightsLE_sheaf_iff` | characterisation | A sheaf ℱ placed in degree 0 has weights ≤ w iff ℱ is mixed of punctual weights ≤ w. |
| `TauCeti.Weights.hasWeightsLE_iff_eigenvalues` | characterisation | For mixed K: K has weights ≤ w iff for all i and x ∈ ∣X₀∣ every eigenvalue of F_x on ℋ^i(K)_x̄ has weight ≤ w + i relative to N(x). |
| `TauCeti.Weights.hasWeightsLE_baseExtension` | compatibility | Weights are unchanged by the base extension 𝔽_q → 𝔽_{q^r} (DWP.0/finite-field-base-extension-of-weights). |
| `TauCeti.Weights.HasWeightsLE.isIotaWeightsLE` | coercion | A complex of weights ≤ w has ι-weights ≤ w for every ι. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.hasWeightsLE_const_shift_neg` | computation | On Spec 𝔽_q, ℚ̄_ℓ[−1] (ℋ¹ = ℚ̄_ℓ of weight 0) has weights ≤ −1 and not ≤ −2; a definition without the shift by i would give ≤ 0. |
| `TauCeti.Weights.hasWeightsLE_const_shift_pos` | computation | On Spec 𝔽_q, ℚ̄_ℓ[1] has weights ≤ 1 and not ≤ 0. |
| `TauCeti.Weights.hasWeightsLE_tate_shift` | computation | ℚ̄_ℓ(1)[2] has weights ≤ 0 (Weil II 6.2.5 a with N = 1): ℋ^{−2} = ℚ̄_ℓ(1) has weight −2 = 0 + (−2). |
| `TauCeti.Weights.hasWeightsLE_zero` | degenerate | The zero complex is mixed and has weights ≤ w for every w. |
| `TauCeti.Weights.not_isMixedComplex_transcendental` | non-example | On Spec 𝔽_q, the rank-one Weil sheaf on which F acts by a transcendental b ∈ ℚ̄_ℓ^× is not mixed (its eigenvalue is not a Weil number), although it is ι-mixed for every ι. |
| `TauCeti.Weights.hasWeightsLE_point_iff` | compatibility | On Spec 𝔽_q, K has weights ≤ w iff every eigenvalue of F on every H^i(K) is a Weil q-number of weight ≤ w + i, i.e. iff each Frobenius module H^i(K) has DWP.0 weights ≤ w + i. |

**Acceptance.**

- On Spec 𝔽_q, K has weights ≤ w iff for every i the Frobenius module H^i(K) has all weights ≤ w + i (DWP.0/endomorphism-weights).

**Source.** deligne-weil-ii, §6, Définition (6.2.2), p. 247; deligne-weil-ii, §6, (6.1.1), p. 243.

### `DWP.8/pure-complexes` — Complexes of weights ≥ w and pure complexes

*Definition* · planet: **Pure complexes** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be of finite type over 𝔽_q, a : X₀ → Spec 𝔽_q, K_{X₀} = Ra^!ℚ̄_ℓ the dualizing complex and D = RHom(−, K_{X₀}) the duality functor of EDC.1, which is involutive on D^b_c(X₀), exchanges f* with Rf^! and Rf_* with Rf_!, and satisfies D(K ⊗ L) = RHom(K, DL). A complex K is mixed of weights ≥ w when DK is mixed of weights ≤ −w (DWP.8/mixed-complexes). K is pure of weight w when it is mixed of weights ≤ w and of weights ≥ w (Weil II 6.2.4). A sheaf ℱ is pure of weight w when the complex ℱ[0] is. The ι-variants (w ∈ ℝ) are defined in the same way. On X₀ smooth of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] (EDC.2), so K has weights ≥ w iff RHom(K, ℚ̄_ℓ) has weights ≤ −w.

**Hypotheses.** D is Verdier duality relative to Spec 𝔽_q (EDC.1), not absolute Galois duality; purity of a complex is a condition on K and on DK; on a singular X₀ it is not a stalkwise condition.

**Proof outline.**

1. Well-definedness only uses the existence of D (EDC.1); DK is mixed when K is (DWP.8/six-operations-preserve-mixedness-6-1-11), so 'weights ≥ w' is a condition on mixed complexes.
2. Closure properties: since D is a triangulated anti-equivalence, the class of complexes of weights ≥ w is closed under extensions, shifts K ≥ w ⇔ K[1] ≥ w + 1 and twists K ≥ w ⇔ K(r) ≥ w − 2r, as for ≤ w.
3. By biduality D² ≅ id (EDC.1), K is pure of weight w iff DK is pure of weight −w.

**Depends on.** `DWP.8/mixed-complexes`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Used by.**

- Weil II Proposition (6.2.6), p. 248: proper direct image preserves purity: apply 6.2.3 to K and DK.
- Weil II Théorème (6.2.13), p. 250: hard Lefschetz for potentially pure complexes.
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the local and global invariant cycle theorems 6.2.9 and 6.2.12 for pure complexes.
- EtaleDualityAndPerverseSheaves:EDC.7: IC_X(L) is pure of weight w + d; purity of perverse direct images.
- WeightsInEtaleCohomology:R34.1/arithmetic-complex-weight-normalization: on smooth X with lisse cohomology, purity of weight w iff H^i pointwise pure of weight w + i.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.HasWeightsGE` | data | HasWeightsGE (w : ℤ) K : Prop := HasWeightsLE (−w) (D K). |
| `TauCeti.Weights.IsPureComplex` | data | IsPureComplex (w : ℤ) K : Prop := HasWeightsLE w K ∧ HasWeightsGE w K. |
| `TauCeti.Weights.hasWeightsGE_dual` | characterisation | HasWeightsGE w (D K) ↔ HasWeightsLE (−w) K, by biduality. |
| `TauCeti.Weights.IsPureComplex.dual` | relation | IsPureComplex w K ↔ IsPureComplex (−w) (D K). |
| `TauCeti.Weights.HasWeightsGE.of_triangle` | structure | Extensions of complexes of weights ≥ w have weights ≥ w; so do direct summands. |
| `TauCeti.Weights.IsPureComplex.of_triangle` | structure | Extensions and direct summands of pure complexes of weight w are pure of weight w. |
| `TauCeti.Weights.hasWeightsGE_shift_twist` | simp | K[1] ≥ w + 1 ↔ K ≥ w; K(r) ≥ w − 2r ↔ K ≥ w. |
| `TauCeti.Weights.hasWeightsGE_iff_rhom_smooth` | characterisation | On X₀ smooth of pure dimension: HasWeightsGE w K ↔ HasWeightsLE (−w) (RHom(K, ℚ̄_ℓ)) (Weil II 6.2.5 b). |
| `TauCeti.Weights.isPureComplex_iff_lisse` | characterisation | On X₀ smooth with all ℋ^iK lisse: IsPureComplex w K ↔ ∀ i, ℋ^iK is punctually pure of weight w + i (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5). |
| `TauCeti.Weights.IsPureComplex.directSum` | other | A finite direct sum of pure complexes of weight w is pure of weight w; a direct sum of pure complexes of different weights is not pure. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.isPureComplex_const_smooth` | computation | On X₀ smooth of pure dimension d, ℚ̄_ℓ[0] is pure of weight 0 and ℚ̄_ℓ[d] is pure of weight d. |
| `TauCeti.Weights.isPureComplex_point_iff` | compatibility | On Spec 𝔽_q, K is pure of weight w iff every Frobenius module H^i(K) is pure of weight w + i in the sense of DWP.0/endomorphism-weights. |
| `TauCeti.Weights.not_isPureComplex_nodal` | non-example | On the nodal cubic X₀ ⊂ ℙ², ℚ̄_ℓ[0] is mixed of weights ≤ 0 and every stalk is pure of weight 0, but it is not pure: if it were, H¹(X, ℚ̄_ℓ) would be pure of weight 1 (proper direct image, 6.2.6), whereas it is ℚ̄_ℓ of weight 0. |
| `TauCeti.Weights.not_isPureComplex_extensionByZero` | non-example | For j : 𝔾_m → ℙ¹, j_!ℚ̄_ℓ is mixed of weights ≤ 0 but not pure: RΓ(ℙ¹, j_!ℚ̄_ℓ) = RΓ_c(𝔾_m) has H¹ of weight 0 ≠ 1. |
| `TauCeti.Weights.isPureComplex_zero` | degenerate | The zero complex is pure of every weight. |

**Acceptance.**

- On Spec 𝔽_q, D is the linear dual (K_X = ℚ̄_ℓ), and K is pure of weight w iff each H^i(K) is pure of weight w + i.

**Source.** deligne-weil-ii, §6, Définition (6.2.4), p. 247; deligne-weil-ii, §6, (6.2.1), p. 247.

### `DWP.8/generic-mixedness-of-direct-images-6-1-3` — Generic mixedness of R^i f_* over a base of finite type over ℤ[1/ℓ]

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let S be a scheme of finite type over ℤ[1/ℓ], f : X → Y a morphism of S-schemes of finite type, and ℱ a mixed sheaf on X. Then there is a dense open U ⊂ S over which all the sheaves R^i f_*ℱ are mixed.

**Hypotheses.** S of finite type over ℤ[1/ℓ]; f of finite type; ℱ mixed; only a dense open of S: no claim over all of S.

**Proof outline.**

1. (6.1.4) If X is smooth over Y = S, ℱ lisse and all R^i f_!ℱ^∨ lisse, then R^i f_*ℱ is obtained from R^{2N−i} f_!(ℱ^∨)(N) by relative Poincaré duality (EDC.2, componentwise of relative dimension N), and the latter is mixed by DWP.7/fundamental-direct-image-theorem-3-3-1.
2. (6.1.5) If X is smooth over Y = S and ℱ lisse, shrink S so that the R^i f_!ℱ^∨ are lisse (generic constructibility and local constancy, EDC.0) and apply (6.1.4).
3. (6.1.6)–(6.1.9) Induction on n = dim X_η for the statement (∗)_n: the conclusion holds for S integral with generic point η and f an open immersion with dense image. Lemma 6.1.7 handles the complement of a finite part by the induction hypothesis applied to coordinate projections; (6.1.8) treats X smooth over S and ℱ lisse by compactifying Y in projective space and using the triangle j_!j*Rf_*ℱ → Rf_*ℱ → i_*i*Rf_*ℱ, with Rb_* of the first mixed by 3.3.1 (b proper) and the second by (6.1.5); (6.1.9) reduces the general case to (6.1.8) after a finite radicial surjective base change S′ → S (harmless for the étale topology, SF.2) giving a dense open V of X smooth over S with ℱ|V lisse, and applies the induction hypothesis to the cone A of j_!j*ℱ → ℱ, supported on X − V of smaller dimension.
4. The derived-category arguments are justified at finite level: write ℱ through a projective system of locally free ℤ/ℓ^n-sheaves as in Weil II (1.1.1) and apply the same triangles levelwise (EDC.0's adic formalism).
5. General f: the problem is local on Y and, by the Leray spectral sequence of an affine cover of X, on X; factor an affine f as an open immersion followed by a proper morphism (Nagata, EDC.0) and combine (∗)_n with 3.3.1.

**Depends on.** `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: S = Spec ℤ[1/ℓ], f : 𝔾_m → 𝔸¹ the inclusion over S, ℱ = ℚ̄_ℓ: R¹f_*ℚ̄_ℓ = ℚ̄_ℓ(−1) at 0, mixed of weight 2 over every closed point of S.
- Non-example: the conclusion is generic on S; it does not assert that a constructible sheaf on X_ℚ comes from a mixed sheaf on some X[1/n] (Weil II (6.1.1) b) records that this is unknown).

**Source.** deligne-weil-ii, §6, Lemme (6.1.3), p. 244.

### `DWP.8/direct-image-preserves-mixedness-6-1-2` — R^i f_* of a mixed sheaf is mixed

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let f : X → Y be a morphism of schemes of finite type over 𝔽_p (Weil sheaves), or of finite type over ℤ[1/ℓ] in the context of Weil II (6.1.1) b) (after inverting finitely many primes), and ℱ a mixed sheaf on X. Then every R^i f_*ℱ is mixed.

**Hypotheses.** Contexts (6.1.1) a) and b) only; no weight bound is asserted for Rf_*: only mixedness.

**Proof outline.**

1. By the generic base change theorem (SGA 4½ [Th. finitude] 1.9, supplied by EDC.0), applied with S = Y, the formation of R^i f_*ℱ commutes with base change over a dense open of Y; by noetherian induction on Y and dévissage (c) of DWP.7/devissage-in-the-target (localisation on the base preserves mixedness of a sheaf) it suffices to know mixedness over a dense open of each stratum.
2. Over a dense open this is DWP.8/generic-mixedness-of-direct-images-6-1-3 applied to S = Y (or to the stratum), with f viewed as a morphism of S-schemes.
3. (6.1.10) Locally on Y and, through the Leray spectral sequence of an affine cover, on X: factor f = g∘j with j an open immersion and g proper; Rg_* = Rg_! preserves mixedness by DWP.7/fundamental-direct-image-theorem-3-3-1 and Rj_* by the case (∗)_n of the lemma.

**Depends on.** `DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/devissage-in-the-target`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Acceptance.**

- Acceptance: j : 𝔾_m → 𝔸¹ over 𝔽_q, ℱ = ℚ̄_ℓ: j_*ℚ̄_ℓ = ℚ̄_ℓ (weight 0) and R¹j_*ℚ̄_ℓ = ℚ̄_ℓ(−1)_0 (weight 2): mixed, with weights above those of ℱ + i allowed.
- Non-example: Rf_* does not preserve the upper weight bound: R¹j_*ℚ̄_ℓ has weight 2 > 0 + 1.

**Source.** deligne-weil-ii, §6, Théorème (6.1.2), p. 243; deligne-weil-ii, §6, after (6.1.2), p. 243.

### `DWP.8/six-operations-preserve-mixedness-6-1-11` — Stability of mixed complexes under the six operations and duality

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let f : X → Y be a morphism of schemes of finite type over 𝔽_p (Weil sheaves), or in context (6.1.1) b). Then Rf_*, Rf_!, f* and Rf^! carry D^b_m to D^b_m; so do ⊗, the local RHom (and the local ℰxt^i), and the duality functor D. In particular the dualizing complex K_X = Ra^!ℚ̄_ℓ is mixed, and D^b_m(X) is stable under all the operations of EDC.0–EDC.1.

**Hypotheses.** Contexts (6.1.1) a) and b); mixedness only: the weight estimates are DWP.8/directional-weight-estimates.

**Proof outline.**

1. Rf_*: DWP.8/direct-image-preserves-mixedness-6-1-2 and the spectral sequence R^pf_*ℋ^qK ⇒ ℋ^{p+q}Rf_*K. Rf_!: 3.3.1 and the same spectral sequence. f* and ⊗: stalks and the stabilities (1.2.5) (DWP.7/weights-mixed-sheaves-definitions); the Tor terms vanish over a field.
2. RHom (formal consequence of 6.1.2, as in SGA 4½ [Th. finitude] 1.5): by dévissage of K along a stratification into pieces j_!ℱ with j : U → X locally closed and ℱ lisse on U, it suffices to treat RHom(j_!ℱ, L) = Rj_*RHom(ℱ, j*L) = Rj_*(ℱ^∨ ⊗ j*L), which is mixed by the cases of ⊗, f* and Rf_* (Rj_* = Rī_* ∘ Rj′_* for j = ī ∘ j′ open then closed); the local ℰxt^i are its cohomology sheaves.
3. Rf^!: the question is local on X; factor f locally as a closed immersion i followed by a smooth morphism g of relative dimension N, with Rg^! = g*(N)[2N] (EDC.2) and i^!L given by the triangle i_*i^!L → L → Rj_*j*L for the complementary open j (EDC.1), so i^!L = i*(cone of L → Rj_*j*L)[−1] is mixed. D = RHom(−, K_X) with K_X = Ra^!ℚ̄_ℓ mixed by the previous case.

**Depends on.** `DWP.8/direct-image-preserves-mixedness-6-1-2`, `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: on a smooth X₀ of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] is mixed, indeed pure of weight 0: ℋ^{−2d} = ℚ̄_ℓ(d) has weight −2d = 0 + (−2d).
- Acceptance: for a closed point i : x → 𝔸¹ over 𝔽_q, i^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2] is mixed.

**Source.** deligne-weil-ii, §6, Corollaire (6.1.11), p. 246.

### `DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre` — Mixed sheaves on the special fibre with an action of the generic Galois group

*Definition* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let S be a smooth curve over 𝔽_q (resp. in context (6.1.1) b)), s a closed point, S_(s) the henselisation (a henselian trait) with generic point η, s̄ and η̄ geometric points, I ⊂ Gal(η̄/η) the inertia group, and X an S-scheme of finite type with special fibre X_s. A Galois sheaf on X_s̄ is a sheaf 𝒢 on X_s̄ with a continuous action ρ of Gal(η̄/η) over its action on X_s̄ through Gal(s̄/s) (SGA 7 XIII 1.1, LPV.0). Define (𝒢, ρ) to be mixed as follows. (a) If ρ factors through Gal(s̄/s), (𝒢, ρ) is a sheaf on X_s (SGA 7 XIII (1.1.3)), and it is mixed when that sheaf is. (b) If (𝒢, ρ) has a finite filtration F by Galois subsheaves such that ρ on Gr_F factors through Gal(s̄/s) (unipotent case), it is mixed when Gr_F(𝒢) is mixed in the sense (a). (c) In general the action of I is quasi-unipotent (LPV.1), so (b) applies after replacing Gal(η̄/η) by an open subgroup, i.e. after a finite extension of the trait; (𝒢, ρ) is mixed when it becomes mixed in the sense (b) after such a change of trait. The notion does not depend on the filtration or on the finite extension.

**Hypotheses.** Henselian trait from a smooth curve over 𝔽_q (equal characteristic); continuous Galois action; quasi-unipotence of inertia from LPV.1.

**Proof outline.**

1. Independence of the filtration in (b): two such filtrations have a common refinement (Schreier/Zassenhaus) whose graded pieces are subquotients of both, and mixedness is stable under subquotients and extensions (DWP.7/weights-mixed-sheaves-definitions).
2. Independence of the finite extension in (c): mixedness of a sheaf on X_s is unchanged by the finite base extension k(s) ⊂ k(s′) (Frobenius powers, DWP.0/finite-field-base-extension-of-weights), and any two finite extensions are dominated by a third.
3. Quasi-unipotence (SGA 7 I, LPV.1) guarantees that (c) is always applicable.

**Depends on.** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `DWP.7/weights-mixed-sheaves-definitions`, `DWP.0/finite-field-base-extension-of-weights`.

**Used by.**

- Weil II Théorème (6.1.13), p. 246: nearby cycles of a mixed sheaf are mixed in this sense.
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the weight-filtered specialisation argument of the local invariant cycle theorem applies weights to inertia invariants of nearby cycles.
- PAPER-SCHOLZE-12/142 (Deligne's weight–monodromy theorem in equal characteristic): weights of the special-fibre Galois module H^i(X_k̄) with its inertia action.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.IsMixedGalois` | data | IsMixedGalois (𝒢, ρ) : Prop, defined by (a)–(c). |
| `TauCeti.Weights.isMixedGalois_of_unramified` | compatibility | If ρ factors through Gal(s̄/s), IsMixedGalois (𝒢, ρ) ↔ IsMixed of the corresponding sheaf on X_s. |
| `TauCeti.Weights.isMixedGalois_iff_filtration` | characterisation | In the unipotent case, mixedness may be tested on any filtration F with unramified graded pieces. |
| `TauCeti.Weights.isMixedGalois_changeOfTrait` | functoriality | Invariant under finite extension of the trait. |
| `TauCeti.Weights.IsMixedGalois.subquotient` | other | Stable under Galois subsheaves, quotients and extensions. |
| `TauCeti.Weights.IsMixedGalois.tensor` | other | Stable under tensor products. |
| `TauCeti.Weights.IsMixedGalois.invariants` | other | If (𝒢, ρ) is mixed then so is its subsheaf of I-invariants, a sheaf on X_s. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.isMixedGalois_trivial` | computation | For X = S and 𝒢 = ℚ̄_ℓ with trivial inertia action, (𝒢, ρ) is mixed of weight 0 (case (a)). |
| `TauCeti.Weights.isMixedGalois_tate_curve` | computation | For the Tate elliptic curve over 𝔽_q((t)) (split multiplicative reduction), H¹(E_η̄, ℚ̄_ℓ) with its unipotent inertia action has the filtration ℚ̄_ℓ ⊂ H¹ with graded pieces ℚ̄_ℓ (weight 0) and ℚ̄_ℓ(−1) (weight 2): mixed, case (b). |
| `TauCeti.Weights.isMixedGalois_quadratic_twist` | computation | A quadratic character of I (tamely ramified, p ≠ 2) becomes trivial after a degree-2 extension of the trait: case (c) applies. |
| `TauCeti.Weights.isMixedGalois_zero` | degenerate | The zero Galois sheaf is mixed. |
| `TauCeti.Weights.not_isMixedGalois_transcendental` | non-example | If a lift of Frobenius acts on the inertia invariants of a rank-one Galois sheaf on X_s̄ = Spec s̄ by a transcendental number, the sheaf is not mixed. |

**Acceptance.**

- The sheaves of nearby cycles R^iΨ(ℱ) of LPV.0 are Galois sheaves on X_s̄; for ℱ mixed they are mixed in this sense (DWP.8/nearby-cycles-preserve-mixedness-6-1-13).

**Source.** deligne-weil-ii, §6, (6.1.12), p. 246.

### `DWP.8/nearby-cycles-preserve-mixedness-6-1-13` — Nearby cycles of a mixed sheaf are mixed

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

In the setting of DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre, let ℱ be a mixed sheaf on X (X of finite type over S). Then the sheaves of nearby cycles R^iΨ(ℱ) on X_s̄, with their action of Gal(η̄/η), are mixed for every i.

**Hypotheses.** S a smooth curve over 𝔽_q (or context (6.1.1) b)); X of finite type over S; no weight bound is asserted, only mixedness; the weight–monodromy statements are LPV.7's.

**Proof outline.**

1. By the monodromy theorem (LPV.1) replace the trait by a finite extension so that I acts unipotently, through its quotient ℤ_ℓ(1).
2. The monodromy filtration constructions of Weil II (1.6.1), (1.6.14) (LPV.1 for the linear algebra, DWP.5 for its weight interpretation) reduce mixedness of R^iΨ(ℱ) to mixedness of the inertia invariants (R^iΨ(ℱ))^I.
3. As in the proof of Weil II (3.6.1), these invariants are quotients of u*R^iv_*(ℱ|X_η), where u : X_s → X and v : X_η → X are the inclusions (specialisation sequence of LPV.0); they are mixed by DWP.8/six-operations-preserve-mixedness-6-1-11.

**Depends on.** `DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`, `DWP.8/six-operations-preserve-mixedness-6-1-11`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`, `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`, `LefschetzPencilsAndVanishingCycles:LPV.1`, `DWP.5`.

**Acceptance.**

- Acceptance: for a smooth proper X over S, R⁰Ψ(ℚ̄_ℓ) = ℚ̄_ℓ and R^iΨ(ℚ̄_ℓ) = 0 for i > 0; the conclusion is that ℚ̄_ℓ on X_s is mixed, indeed pure of weight 0
- Acceptance: for the Tate curve family over the trait (a node with local equation xy = π in relative dimension 1), R¹Ψ(ℚ̄_ℓ) is supported at the node with stalk R¹Φ = ℚ̄_ℓ(−1), on which inertia acts trivially (pure of weight 2); the rank-two unipotent action with graded weights 0 and 2 is on H¹(X_η̄) = H¹(X_s̄, RΨℚ̄_ℓ), whose weight-0 piece is H¹ of the nodal fibre and whose weight-2 piece is H⁰(X_s̄, R¹Ψ)

**Source.** deligne-weil-ii, §6, Théorème (6.1.13), p. 246.

### `DWP.8/compact-support-direct-image-upper-weights-6-2-3` — Rf_! preserves complexes of weights ≤ w

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let f : X₀ → Y₀ be a morphism of schemes of finite type over 𝔽_q. If K ∈ D^b_c(X₀) is mixed of weights ≤ w, then Rf_!K is mixed of weights ≤ w. The ι-variant holds with w ∈ ℝ.

**Hypotheses.** f separated of finite type (Rf_! as in EDC.0).

**Proof outline.**

1. Use the spectral sequence E₂^{pq} = R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K (printed E₁, PAPER-DELIGNE-80/E70).
2. By DWP.7/fundamental-direct-image-theorem-3-3-1, E₂^{pq} is mixed of punctual weights ≤ p + (q + w); the abutment ℋ^{p+q}Rf_!K has a finite filtration with subquotients of the E₂^{pq}, hence is mixed of punctual weights ≤ (p + q) + w.
3. The ι-variant uses DWP.7/iota-mixed-direct-image-3-3-10.

**Depends on.** `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/iota-mixed-direct-image-3-3-10`, `DWP.8/mixed-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Acceptance.**

- Acceptance: for f : 𝔸¹ → Spec 𝔽_q and K = ℚ̄_ℓ[1] (pure of weight 1), RΓ_c(𝔸¹, ℚ̄_ℓ)[1] has H¹ = ℚ̄_ℓ(−1) of weight 2 ≤ 1 + 1.

**Source.** deligne-weil-ii, §6, Variante (6.2.3), p. 247.

### `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5` — Purity on a smooth scheme is pointwise purity of lisse cohomology sheaves

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be of finite type over 𝔽_q. (a) For every N ∈ ℤ, K is mixed of weights ≤ w iff K(N)[2N] is; hence in the definition of purity the dualizing complex may be replaced by any complex locally isomorphic to K_{X₀}(N)[2N]. (b) If X₀ is smooth, K has weights ≥ w iff RHom(K, ℚ̄_ℓ) has weights ≤ −w. If moreover every ℋ^iK is lisse, K is pure of weight w iff every ℋ^iK is punctually pure of weight w + i. (c) Consequently, for X₀ smooth and ℱ₀ lisse and punctually pure of weight w, the complex ℱ₀[m](r) is pure of weight w + m − 2r. The ι-variants hold.

**Hypotheses.** (b), (c): X₀ smooth; lisse cohomology sheaves; A stalkwise pure sheaf on a singular X₀ need not be pure (DWP.8/pure-complexes, test not_isPureComplex_nodal).

**Proof outline.**

1. (a) ℋ^i(K(N)[2N]) = ℋ^{i+2N}(K)(N), whose weights are those of ℋ^{i+2N}K minus 2N; so the bound w + (i + 2N) becomes w + i.
2. (b) On smooth X₀ of pure dimension d, K_{X₀} = ℚ̄_ℓ(d)[2d] (EDC.2), so DK = RHom(K, ℚ̄_ℓ)(d)[2d] and (a) applies. If the ℋ^iK are lisse, the local ℰxt^p(ℋ^iK, ℚ̄_ℓ) vanish for p > 0, so ℋ^{−i}RHom(K, ℚ̄_ℓ) = (ℋ^iK)^∨, mixed with the negatives of the weights of ℋ^iK (DWP.0/spectra-of-tensor-products-and-duals). Thus K ≥ w iff every ℋ^iK has weights ≥ w + i, and together with K ≤ w iff every ℋ^iK has all weights equal to w + i, i.e. is punctually pure of weight w + i (a mixed sheaf all of whose weights equal m is an iterated extension of punctually pure sheaves of weight m, hence punctually pure).
3. (c) ℋ^{−m}(ℱ₀[m](r)) = ℱ₀(r), punctually pure of weight w − 2r = (w + m − 2r) + (−m); apply (b).

**Depends on.** `DWP.8/pure-complexes`, `DWP.8/mixed-complexes`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DWP.0/spectra-of-tensor-products-and-duals`, `DWP.7/weights-mixed-sheaves-definitions`.

**Acceptance.**

- Acceptance: on 𝔸^d over 𝔽_q, ℚ̄_ℓ[d] is pure of weight d and ℚ̄_ℓ(1)[2] is pure of weight 0; a half-integral twist needs a chosen square root of q (DWP.0/twisting-by-rank-one-characters), and then ℚ̄_ℓ[d](d/2) is pure of weight 0.
- Acceptance: on a smooth curve, a lisse sheaf punctually pure of weight w placed in degree −1 is pure of weight w + 1 (the perverse normalisation of EDC.7).

**Source.** deligne-weil-ii, §6, Exemples (6.2.5) a), b), p. 247.

### `DWP.8/intermediate-direct-image-purity-6-2-5cd` — j_* of a pure lisse sheaf across a smooth divisor is pure

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

(c) Let X₀ be a smooth curve over 𝔽_q, j : U₀ → X₀ a dense open and ℱ₀ a lisse sheaf on U₀, punctually pure of weight w (equivalently, by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5, ℱ₀ is pure of weight w as a sheaf). Then j_*ℱ₀ is pure of weight w. (d) Let X₀ be smooth, D₀ ⊂ X₀ a smooth divisor, j : U₀ = X₀ − D₀ → X₀, and ℱ₀ lisse on U₀, punctually pure of weight w and tamely ramified along D₀. Then j_*ℱ₀ is pure of weight w. The ι-variants hold.

**Hypotheses.** (c): smooth curve; (d): smooth divisor and tame ramification; ℱ₀ lisse: the source states (c) for a pure sheaf on U₀ and proves it through (1.8.8.1), which concerns lisse sheaves; the lisse case is the one used; j_* is the underived direct image, placed in degree 0.

**Proof outline.**

1. Upper bound: j_*ℱ₀ is mixed (1.8.9, DWP.5) and its stalks at points of D₀ (or of X₀ − U₀) are the inertia invariants of ℱ, contained in Ker N ⊂ M₀ (Weil II (1.8.8) 1) and 2)), of weights ≤ w (DWP.5's local weight theorem). So j_*ℱ₀ has weights ≤ w.
2. Lower bound: D(j_*ℱ₀) = j_*(Dℱ₀) up to the shift and twist of the smooth dualizing complex, by the formula RHom(j_*ℱ, ℚ̄_ℓ) = j_*ℋom(ℱ, ℚ̄_ℓ) (Weil II's argument; local duality on a smooth curve or along a smooth divisor for tame ℱ, EDC.1–EDC.2). Since ℱ₀^∨ is lisse and punctually pure of weight −w, the first step gives weights ≤ −w for D(j_*ℱ₀) after renormalising by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (a).

**Depends on.** `DWP.8/pure-complexes`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.5`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: j : 𝔾_m → ℙ¹, ℱ₀ = ℚ̄_ℓ: j_*ℚ̄_ℓ = ℚ̄_ℓ on ℙ¹ is pure of weight 0.
- Acceptance: for the Legendre family h over ℙ¹ − {0, 1, ∞}, j_*R¹h_*ℚ̄_ℓ is pure of weight 1: its stalks at the multiplicative points 0 and 1 are the one-dimensional inertia invariants, of weight 0 ≤ 1, its stalk at ∞ (monodromy minus a unipotent) is 0, and its dual is again of this form. Here H¹(ℙ¹, j_*R¹h_*ℚ̄_ℓ) = 0 (Euler characteristic; there are no cusp forms of weight 3 for Γ(2)), so a global test needs Sym^k with nonzero parabolic cohomology
- Non-example: Rj_*ℚ̄_ℓ for j : 𝔾_m → ℙ¹ is not pure of weight 0: R¹j_*ℚ̄_ℓ has weight 2 at 0 and ∞.

**Source.** deligne-weil-ii, §6, Exemples (6.2.5) c), p. 248.

### `DWP.8/directional-weight-estimates` — Weight estimates for the six operations

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let f : X₀ → Y₀ be a morphism of schemes of finite type over 𝔽_q, and a, b, w ∈ ℤ. (i) f* and Rf_! carry complexes of weights ≤ w to complexes of weights ≤ w. (ii) Rf_* and Rf^! carry complexes of weights ≥ w to complexes of weights ≥ w. (iii) D exchanges 'weights ≤ w' and 'weights ≥ −w'. (iv) If K has weights ≤ a and L has weights ≤ b, then K ⊗ L has weights ≤ a + b. (v) If K has weights ≤ a and L has weights ≥ b, then RHom(K, L) has weights ≥ b − a. The ι-variants hold with real weights. No other preservation is asserted: Rf_* and Rf^! need not preserve upper bounds, f* and Rf_! need not preserve lower bounds, and a pure complex need not split into its cohomology sheaves.

**Hypotheses.** Finite type over 𝔽_q; mixed complexes; each functor preserves one bound only.

**Proof outline.**

1. (i) f*: for y ∈ |X₀| over x = f(y), F_y acts on (f*ℋ^iK)_ȳ = ℋ^i(K)_x̄ as F_x^{[k(y):k(x)]} and N(y) = N(x)^{[k(y):k(x)]}, so weights are unchanged (DWP.0/weil-number-base-extension); mixedness passes by (1.2.5). Rf_!: DWP.8/compact-support-direct-image-upper-weights-6-2-3.
2. (iii) is the definition of weights ≥ (DWP.8/pure-complexes) together with biduality (EDC.1). (ii) Rf_* = D Rf_! D and Rf^! = D f* D (EDC.1 exchange isomorphisms), then (i) and (iii).
3. (iv) The spectral sequence of the canonical filtrations gives ℋ^n(K ⊗ L) a finite filtration with subquotients of ⊕_{i+j=n} ℋ^iK ⊗ ℋ^jL (no Tor terms over a field, EDC.0); tensor products of mixed sheaves are mixed with weights adding (1.2.5), so ℋ^n has weights ≤ (a + i) + (b + j) = a + b + n.
4. (v) RHom(K, L) = D(K ⊗ DL) by D(K ⊗ M) = RHom(K, DM) with M = DL and biduality; K ⊗ DL has weights ≤ a − b by (iii), (iv), so its dual has weights ≥ b − a.

**Depends on.** `DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DWP.8/pure-complexes`, `DWP.8/six-operations-preserve-mixedness-6-1-11`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`, `DWP.0/weil-number-base-extension`, `DWP.7/weights-mixed-sheaves-definitions`.

**Acceptance.**

- Non-example: for j : 𝔾_m → ℙ¹ and ℚ̄_ℓ (pure of weight 0 on 𝔾_m), Rj_*ℚ̄_ℓ is not of weights ≤ 0 (R¹j_* has weight 2 > 0 + 1), and j_!ℚ̄_ℓ is not of weights ≥ 0 (its dual Rj_*ℚ̄_ℓ(1)[2] has ℋ^{−1} of weight 0 > −0 − 1).
- Acceptance: for X₀ smooth proper and K pure of weight w, (i) and (ii) together give purity of Rf_*K = Rf_!K (DWP.8/proper-direct-image-preserves-purity-6-2-6).
- Acceptance: for L lisse pure of weight b on smooth X₀ and K = ℚ̄_ℓ (pure of weight 0), RHom(ℚ̄_ℓ, L) = L has weights ≥ b.

**Source.** deligne-weil-ii, §6, (6.2.1), p. 247.

### `DWP.8/proper-direct-image-preserves-purity-6-2-6` — Proper direct images of pure complexes are pure

*Theorem* · planet: **Purity of proper direct images** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let f : X₀ → Y₀ be a proper morphism of schemes of finite type over 𝔽_q and K ∈ D^b_c(X₀) pure of weight w. Then Rf_*K is pure of weight w. In particular, for X₀ proper over 𝔽_q and K pure of weight w, H^i(X, K) is pure of weight w + i for every i. The ι-variant holds.

**Hypotheses.** f proper.

**Proof outline.**

1. Rf_* = Rf_! for f proper; Rf_!K has weights ≤ w by DWP.8/compact-support-direct-image-upper-weights-6-2-3.
2. D Rf_*K = Rf_! DK (EDC.1, f proper), and DK has weights ≤ −w, so DRf_*K has weights ≤ −w.
3. For Y₀ = Spec 𝔽_q, a complex is pure of weight w iff each H^i is pure of weight w + i (DWP.8/pure-complexes test isPureComplex_point_iff).

**Depends on.** `DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DWP.8/pure-complexes`, `EtaleDualityAndPerverseSheaves:EDC.1`.

**Acceptance.**

- Acceptance: X₀ smooth proper, K = ℚ̄_ℓ: H^i pure of weight i, agreeing with DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11.
- Acceptance: X₀ = ℙ¹, K = j_*ℱ for a pure lisse ℱ on an open curve (DWP.8/intermediate-direct-image-purity-6-2-5cd): H¹(ℙ¹, j_*ℱ) is pure, which is DWP.6's theorem.
- Non-example: for f non-proper, e.g. 𝔾_m → Spec 𝔽_q and K = ℚ̄_ℓ, Rf_*ℚ̄_ℓ is not pure (H¹ = ℚ̄_ℓ(−1) has weight 2 ≠ 1).

**Source.** deligne-weil-ii, §6, Proposition (6.2.6), p. 248.

### `DWP.8/variant-over-z-one-over-ell-6-2-7` — Pure complexes over ℤ[1/ℓ]

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

For X of finite type over ℤ[1/ℓ] with structure map a : X → Spec ℤ[1/ℓ], put K′_X = Ra^!ℚ̄_ℓ and D′ = RHom(−, K′_X). Call K ∈ D^b_c(X) pure of weight w when K is mixed of weights ≤ w (DWP.8/mixed-complexes, read on schemes of finite type over ℤ[1/ℓ]) and D′K is mixed of weights ≤ −w. If X is of finite type over 𝔽_p then K′_X = K_X(−1)[−2], so D′ = D(−1)[−2] and this notion agrees with that of DWP.8/pure-complexes. Proper direct images preserve this purity: for f : X → Y proper over ℤ[1/ℓ] and K pure of weight w, Rf_*K is pure of weight w.

**Hypotheses.** Schemes of finite type over ℤ[1/ℓ]; exceptional inverse image and biduality over the regular one-dimensional base ℤ[1/ℓ] from EDC.1.

**Proof outline.**

1. For i : Spec 𝔽_p → Spec ℤ[1/ℓ], i^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2]: this is the local cohomology of the henselisation of ℤ_(p), a discrete valuation ring with ℓ invertible, computed by Kummer theory (requested from EDC.1, which identifies i_*i^! with local cohomology; it is the dimension-one case, not Gabber's general absolute purity). So K′_X = Ra_p^! i^!ℚ̄_ℓ = K_X(−1)[−2] and D′K = DK(−1)[−2]; by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (a) with N = −1 the two bounds agree.
2. Rf_! preserves weights ≤ w over ℤ[1/ℓ] by DWP.7/fundamental-direct-image-theorem-3-3-1 and the spectral sequence of DWP.8/compact-support-direct-image-upper-weights-6-2-3; for f proper D′Rf_* = Rf_*D′ (EDC.1 over ℤ[1/ℓ]); conclude as in DWP.8/proper-direct-image-preserves-purity-6-2-6.

**Depends on.** `DWP.8/pure-complexes`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DWP.7/fundamental-direct-image-theorem-3-3-1`, `EtaleDualityAndPerverseSheaves:EDC.1`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: X = Spec ℤ[1/ℓ], K = ℚ̄_ℓ: a is the identity, so K′_X = ℚ̄_ℓ, D′ℚ̄_ℓ = ℚ̄_ℓ and ℚ̄_ℓ is pure of weight 0 in this sense; for X over 𝔽_p the formula K′_X = K_X(−1)[−2] applies

**Source.** deligne-weil-ii, §6, Variante (6.2.7), p. 248.

### `DWP.8/geometric-semisimplicity` — Geometric monodromy and geometrically semisimple lisse sheaves

*Definition* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be a connected normal scheme of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, x̄ a geometric point of X. The arithmetic and geometric fundamental groups π₁(X₀, x̄) ⊃ π₁(X, x̄) fit into 1 → π₁(X, x̄) → π₁(X₀, x̄) → Gal(𝔽̄_q/𝔽_q) → 1 (for X₀ geometrically connected; IG.1), and the Weil group W(X₀, x̄) is the preimage of the subgroup generated by the geometric Frobenius F. A lisse ℚ̄_ℓ-(Weil) sheaf ℱ₀ is a continuous representation ρ of W(X₀, x̄) on V = ℱ_x̄ (EDC.0). Its geometric monodromy group is ρ(π₁(X, x̄)) ⊂ GL(V) (Weil II 1.1.15). ℱ₀ is geometrically semisimple when the pullback ℱ on X is semisimple, i.e. ρ|π₁(X, x̄) is a semisimple representation (V is a direct sum of irreducible π₁(X, x̄)-subrepresentations); it is arithmetically semisimple when ρ is semisimple. For X₀ not geometrically connected, apply the definitions on each connected component of X.

**Hypotheses.** X₀ normal, so that π₁ of a dense open surjects onto π₁(X₀) and lisse sheaves are representations; semisimplicity of the restriction to the geometric fundamental group, not of the arithmetic representation.

**Proof outline.**

1. Lisse sheaves on the normal connected X₀ (resp. X) correspond to continuous representations of W(X₀, x̄) (resp. π₁(X, x̄)) on finite-dimensional ℚ̄_ℓ-spaces with a stable lattice over the ring of integers of a finite extension of ℚ_ℓ (EDC.0, IG.0).
2. The socle (sum of irreducible subrepresentations) of ρ|π₁(X, x̄) is stable under W(X₀, x̄) because π₁(X, x̄) is normal in it; so geometric semisimplicity is a property of ℱ₀, and the maximal geometrically semisimple lisse subsheaf descends to X₀.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `mathlib:Representation`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.asModule`.

**Used by.**

- Weil II Théorème (3.4.1) (iii), p. 207: the conclusion of the semisimplicity theorem.
- Weil II (4.1.3)–(4.1.4), p. 218: complete reducibility of the monodromy representation on H^{n−1}(Y) makes the cup-product form nondegenerate on invariants.
- PAPER-ABDURRAHMAN-VENKATESH-25/8 (Lemma 6.5.2): geometric monodromy of a pure lisse sheaf is semisimple, so its Zariski closure has reductive identity component.
- PAPER-CADORET-HUI-TAMAGAWA-17/23 (Fact 3.2): geometric semisimplicity from the pure-lisse theorem on a normal base, not arithmetic semisimplicity.
- EtaleDualityAndPerverseSheaves:EDC.7: geometric semisimplicity of perverse direct images.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.IsGeometricallySemisimple` | data | For ρ : Representation E W V and a subgroup G ≤ W: IsGeometricallySemisimple ρ G : Prop := IsSemisimpleModule (MonoidAlgebra E G) (ρ.comp G.subtype).asModule; for a lisse sheaf, W = W(X₀, x̄) and G = π₁(X, x̄). |
| `TauCeti.Weights.geometricMonodromyGroup` | data | The image ρ(π₁(X, x̄)) ⊂ GL(V). |
| `TauCeti.Weights.IsGeometricallySemisimple.of_isSemisimple` | relation | ρ semisimple and G normal in W ⇒ ρ∣G semisimple. |
| `TauCeti.Weights.isGeometricallySemisimple_iff_restrict_open` | characterisation | For X₀ normal and U₀ ⊂ X₀ a dense open: ℱ₀ is geometrically semisimple iff ℱ₀∣U₀ is (π₁(U) → π₁(X) is surjective, IG.0). |
| `TauCeti.Weights.isGeometricallySemisimple_baseExtension` | compatibility | Unchanged by the base extension 𝔽_q → 𝔽_{q^r} (same geometric fundamental group). |
| `TauCeti.Weights.IsGeometricallySemisimple.subquotient` | other | Lisse subsheaves, quotients and direct summands of a geometrically semisimple sheaf are geometrically semisimple; finite direct sums of geometrically semisimple sheaves are. |
| `TauCeti.Weights.IsGeometricallySemisimple.dual` | other | The dual of a geometrically semisimple lisse sheaf is geometrically semisimple. |
| `TauCeti.Weights.maximalGeometricallySemisimpleSubsheaf` | constructor | The largest geometrically semisimple lisse subsheaf (sum of the irreducible lisse subsheaves of ℱ), stable under Frobenius and hence defined over X₀. |
| `TauCeti.Weights.isGeometricallySemisimple_iff_reductive` | relation | In characteristic 0 coefficients: ℱ₀ is geometrically semisimple iff the Zariski closure of its geometric monodromy group has reductive identity component and acts semisimply (a linear algebraic group over a field of characteristic 0 acting faithfully and semisimply is reductive). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.isGeometricallySemisimple_jordan` | non-example | On Spec 𝔽_q the rank-two Weil sheaf on which F acts by [[1, 1], [0, 1]] is geometrically semisimple (the geometric group is trivial) but not arithmetically semisimple: purity of weight 0 does not give semisimple Frobenius. |
| `TauCeti.Weights.not_isGeometricallySemisimple_kummer` | non-example | On 𝔾_m over 𝔽_q, the Kummer extension 0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0 classified by the Kummer class of the coordinate in H¹(𝔾_m, ℚ̄_ℓ(1)) is not geometrically semisimple: its geometric class in H¹(𝔾_{m,𝔽̄_q}, ℚ̄_ℓ(1)) ≅ ℚ̄_ℓ is nonzero. |
| `TauCeti.Weights.isGeometricallySemisimple_point` | degenerate | Every lisse sheaf on Spec 𝔽_q is geometrically semisimple; so is the zero sheaf on any X₀. |
| `TauCeti.Weights.isGeometricallySemisimple_of_semisimple` | compatibility | For a representation ρ of a group W and a normal subgroup G, if ρ is semisimple then ρ∣G is semisimple (Clifford), so arithmetic semisimplicity implies geometric semisimplicity. |

**Acceptance.**

- Over Spec 𝔽_q every lisse sheaf is geometrically semisimple (π₁ of Spec 𝔽̄_q is trivial).
- Arithmetic semisimplicity implies geometric semisimplicity (Clifford's argument for the normal subgroup π₁(X, x̄)).

**Source.** deligne-weil-ii, §1, (1.1.15), p. 153; deligne-weil-ii, §3, Théorème (3.4.1) (iii), p. 207.

### `DWP.8/ext-one-of-lisse-sheaves-3-4-2` — The Ext¹ sequence of lisse sheaves over a finite field

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be of finite type over 𝔽_q and ℱ₀, 𝒢₀ lisse sheaves on X₀ (Weil sheaves allowed). (i) There is an exact sequence 0 → H⁰(X, ℋom(ℱ, 𝒢))_F → Ext¹(ℱ₀, 𝒢₀) → H¹(X, ℋom(ℱ, 𝒢))^F, where Ext¹ is the group of extension classes in the abelian category of sheaves on X₀, the right arrow is pullback to X followed by Ext¹(ℱ, 𝒢) = H¹(X, ℋom(ℱ, 𝒢)), and the subscript (resp. superscript) F denotes coinvariants (resp. invariants) of the Weil group W(𝔽̄_q/𝔽_q) = F^ℤ. (ii) For X₀ normal and connected this is the five-term sequence of Hochschild–Serre for 1 → π₁(X, x̄) → W(X₀, x̄) → ℤ → 1 with coefficients M = Hom(ℱ_x̄, 𝒢_x̄), using H¹(ℤ, N) = N_F and H²(ℤ, N) = 0.

**Hypotheses.** ℱ₀, 𝒢₀ lisse; extensions in the category of all (Weil) sheaves on X₀; for lisse ℱ₀, 𝒢₀ an extension is lisse.

**Proof outline.**

1. (i) (Weil II's argument.) A geometrically trivial extension ℰ₀ of ℱ₀ by 𝒢₀ has a splitting φ : ℱ → ℰ over X; the other splittings are φ − f with f ∈ Hom(ℱ, 𝒢). The extension is trivial over X₀ iff φ − f can be chosen F-invariant, i.e. Fφ − φ ∈ Hom(ℱ, 𝒢) is of the form Ff − f, i.e. has zero image in Hom(ℱ, 𝒢)_F. The map ℰ₀ ↦ class of Fφ − φ is a bijection between geometrically trivial extension classes and Hom(ℱ, 𝒢)_F = H⁰(X, ℋom(ℱ, 𝒢))_F.
2. The image of Ext¹(ℱ₀, 𝒢₀) → Ext¹(ℱ, 𝒢) lies in the F-invariants by transport of structure; Ext¹ of lisse sheaves on X is H¹(X, ℋom(ℱ, 𝒢)) (local ℰxt of lisse sheaves vanish, EDC.0).
3. (ii) Identify extensions of lisse sheaves with extensions of continuous representations (EDC.0, IG.0–IG.1) and apply the continuous Hochschild–Serre spectral sequence (R02.2) to the closed normal subgroup π₁(X, x̄) with discrete quotient ℤ, whose cohomological dimension is 1.

**Depends on.** `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Acceptance.**

- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = 𝒢₀ = ℚ̄_ℓ: Ext¹(ℚ̄_ℓ, ℚ̄_ℓ) = ℚ̄_ℓ_F = ℚ̄_ℓ (the unipotent Jordan block), and H¹(X, ·) = 0.
- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = ℚ̄_ℓ, 𝒢₀ = ℚ̄_ℓ(1): Ext¹ = ℚ̄_ℓ(1)_F = 0 since F − 1 = q⁻¹ − 1 is invertible.

**Source.** deligne-weil-ii, §3, Lemme (3.4.2), p. 208.

### `DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4` — Extensions between pure lisse sheaves on a smooth scheme

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be smooth of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀, 𝒢₀ lisse sheaves on X₀ punctually ι-pure of weights β and γ. (Lemma 3.4.3) A geometrically nontrivial extension 0 → 𝒢₀ → ℰ₀ → ℱ₀ → 0 can exist only if β ≡ γ (mod ℤ) and β > γ. (Lemma 3.4.4) Ext¹(ℱ₀, 𝒢₀) ≠ 0 only if β ≡ γ (mod ℤ) and β ≥ γ.

**Hypotheses.** X₀ smooth (for the H¹ lower bound); punctual ι-purity at one fixed ι.

**Proof outline.**

1. ℋom(ℱ, 𝒢) is lisse and punctually ι-pure of weight γ − β (DWP.0/spectra-of-tensor-products-and-duals).
2. By DWP.7/cohomological-bounds-3-3-2-3-3-6 (ii) in its ι-form (iv), H¹(X, ℋom(ℱ, 𝒢)) has ι-weights ≥ γ − β + 1, and by DWP.7/iota-mixed-direct-image-3-3-10 they lie in γ − β + ℤ. F has a nonzero invariant only if it has eigenvalue 1, of weight 0; so H¹(X, ℋom)^F ≠ 0 forces 0 ∈ (γ − β + ℤ) and 0 ≥ γ − β + 1, i.e. β ≡ γ mod ℤ and β > γ. By DWP.8/ext-one-of-lisse-sheaves-3-4-2 a geometrically nontrivial extension has nonzero image in H¹(X, ℋom)^F.
3. (3.4.4) The H⁰ term H⁰(X, ℋom(ℱ, 𝒢)) ⊂ ℋom(ℱ, 𝒢)_x̄ has ι-weight γ − β; its F-coinvariants are nonzero only if F has eigenvalue 1, forcing γ = β. Combine with the previous step through the exact sequence.

**Depends on.** `DWP.8/ext-one-of-lisse-sheaves-3-4-2`, `DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DWP.7/iota-mixed-direct-image-3-3-10`, `DWP.0/spectra-of-tensor-products-and-duals`.

**Acceptance.**

- Acceptance: X₀ = Spec 𝔽_q, ℱ₀ = 𝒢₀ = ℚ̄_ℓ (β = γ = 0): Ext¹ ≠ 0 (the Jordan block), consistent with β ≥ γ; all extensions are geometrically trivial.
- Acceptance: X₀ = 𝔾_m, ℱ₀ = ℚ̄_ℓ (β = 0), 𝒢₀ = ℚ̄_ℓ(1) (γ = −2): the Kummer extension is geometrically nontrivial, consistent with β > γ.
- Non-example: for β < γ, e.g. ℱ₀ = ℚ̄_ℓ(1), 𝒢₀ = ℚ̄_ℓ on Spec 𝔽_q, Ext¹ = 0.

**Source.** deligne-weil-ii, §3, Lemmes (3.4.3)–(3.4.4), p. 208.

### `DWP.8/weight-decomposition-modulo-z-3-4-1-i` — The decomposition of an ι-mixed sheaf by weights modulo ℤ

*Construction* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ an ι-mixed sheaf on X₀ (Weil sheaves allowed). There is a unique decomposition ℱ₀ = ⊕_{b ∈ ℝ/ℤ} ℱ₀(b), almost all summands zero, such that the punctual ι-weights of ℱ₀(b) lie in b. It is functorial: every morphism ℱ₀ → 𝒢₀ of ι-mixed sheaves maps ℱ₀(b) to 𝒢₀(b). Each ℱ₀(b) is a twist ℋ₀^{(c)} (Weil II 1.2.7) of an ι-mixed sheaf ℋ₀ with integer punctual weights, for any c ∈ ℚ̄_ℓ^× with ι-weight in b. Stalkwise, for x ∈ |X₀|: ℱ₀(b)_x̄ = ⊕_{β ∈ b} ℱ_x̄(β), where ℱ_x̄(β) is the sum of the generalised eigenspaces of F_x for the eigenvalues of ι-weight β relative to N(x).

**Hypotheses.** One fixed ι; ι-mixed sheaves (real weights).

**Proof outline.**

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced, since a summand whose weights lie in b must contain the generalised eigenspaces of weights in b and no others (DWP.0/weight-decomposition (ii), DWP.0/disjoint-spectra-no-intertwiner).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: induction on the length; if ℱ₀ is an extension of ℱ″₀ (decomposed) by ℱ′₀ pure of weight β with class b, then for b′ ≠ b the preimage of ℱ″₀(b′) is a trivial extension by DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (Ext¹ = 0 when the weights are not congruent mod ℤ); take ℱ₀(b) the preimage of ℱ″₀(b) and ℱ₀(b′) a lifting of ℱ″₀(b′).
3. (3.4.8) General case by induction on dim X₀: replacing X₀ by X₀,red, choose a dense open j : U₀ → X₀ where (3.4.7) applies (generic lissity and smoothness; 1.8.11 of DWP.5 on a normal U₀); the induction hypothesis applies on the complement i : F₀ → X₀. Glue through the equivalence ℱ₀ ↦ (j*ℱ₀, i*ℱ₀, specialisation s : i*ℱ₀ → i*j_*j*ℱ₀); s maps (i*ℱ₀)(b) into i*j_*((j*ℱ₀)(b)) because, by Weil II (1.8.9) (DWP.5) and twisting, the punctual weights of i*j_*((j*ℱ₀)(b)) lie in b.
4. Twist: if c has ι-weight β₀ ∈ b, then ℱ₀(b)^{(c⁻¹)} has integer ι-weights (Weil II 1.2.7, DWP.0/twisting-by-rank-one-characters).

**Depends on.** `DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`, `DWP.0/weight-decomposition`, `DWP.0/disjoint-spectra-no-intertwiner`, `DWP.0/twisting-by-rank-one-characters`, `DWP.5`, `DWP.7/weights-mixed-sheaves-definitions`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Used by.**

- Weil II Théorème (3.4.1) (i) and Remarque (1.2.8): reduces real ι-weights to integer weights up to twist.
- PAPER-CIUBOTARU-HARRIS-26 (equation (5.5)): decomposition of semisimple local systems into constant-field character twists of systems with integral weights.
- DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii: the weight filtration is constructed on each integer-weight piece.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.weightClass` | data | weightClass ℱ₀ (b : ℝ/ℤ) : the summand ℱ₀(b), a subsheaf of ℱ₀. |
| `TauCeti.Weights.weightClass_isInternal` | structure | ℱ₀ is the internal direct sum of the ℱ₀(b), with finitely many nonzero. |
| `TauCeti.Weights.weightClass_stalk` | characterisation | (ℱ₀(b))_x̄ = ⊕_{β ∈ b} ℱ_x̄(β), generalised eigenspaces of F_x. |
| `TauCeti.Weights.weightClass_map` | functoriality | φ : ℱ₀ → 𝒢₀ maps ℱ₀(b) into 𝒢₀(b); weightClass is an exact functor; map_id and map_comp hold. |
| `TauCeti.Weights.weightClass_unique` | characterisation | Any decomposition ℱ₀ = ⊕ 𝒜(b) with the weights of 𝒜(b) in b equals the weight-class decomposition. |
| `TauCeti.Weights.weightClass_eq_twist` | relation | ℱ₀(b) ≅ ℋ₀^{(c)} with ℋ₀ of integer ι-weights, for any c of ι-weight in b. |
| `TauCeti.Weights.weightClass_of_integer` | simp | If all punctual ι-weights of ℱ₀ are integers then ℱ₀(0) = ℱ₀. |
| `TauCeti.Weights.weightClass_tensor` | relation | (ℱ₀ ⊗ 𝒢₀)(b) = ⊕_{b′ + b″ = b} ℱ₀(b′) ⊗ 𝒢₀(b″). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.weightClass_fractional` | computation | On Spec 𝔽_q with ι fixed and a chosen fourth root q^{1/4}, ℚ̄_ℓ ⊕ ℚ̄_ℓ^{(q^{1/4})} has nonzero classes exactly 0 and 1/2 mod ℤ. |
| `TauCeti.Weights.weightClass_integral` | non-example | ℚ̄_ℓ ⊕ ℚ̄_ℓ(1) on Spec 𝔽_q has all of its weight in the class 0: the decomposition is by weight modulo ℤ, not by weight. |
| `TauCeti.Weights.weightClass_depends_on_iota` | non-example | For b = 1 + √2 (an ℓ-adic unit, of norm −1), ℚ̄_ℓ^{(b)} on Spec 𝔽_q has ι-weight 2 log_q(1 + √2) or −2 log_q(1 + √2) according to ι(√2) = ±√2: the class depends on ι. |
| `TauCeti.Weights.weightClass_zero` | degenerate | The zero sheaf has all classes zero. |
| `TauCeti.Weights.weightClass_point` | compatibility | On Spec 𝔽_q, ℱ₀(b) is the sum of the generalised eigenspaces of F whose ι-weights lie in b, i.e. DWP.0's decomposition (ii) regrouped modulo ℤ. |

**Acceptance.**

- The decomposition does not separate integer weights: ℚ̄_ℓ ⊕ ℚ̄_ℓ(1) lies entirely in the class 0.
- Remark (1.2.8) of Weil II: a posteriori real ι-weights reduce to integer weights up to twist.

**Source.** deligne-weil-ii, §3, Théorème (3.4.1) (i), p. 207; deligne-weil-ii, §3, (3.4.6), p. 209.

### `DWP.8/punctual-weight-filtration-3-4-1-ii` — The weight filtration of a lisse mixed sheaf

*Construction* · planet: **Weight filtration of a lisse mixed sheaf** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ a lisse ι-mixed sheaf on X₀ whose punctual ι-weights are integers. There is a unique finite increasing filtration W of ℱ₀ by lisse subsheaves W_iℱ₀ (the filtration by punctual weight) such that Gr^W_i ℱ₀ is punctually ι-pure of weight i for every i. It is functorial, and every morphism between lisse ι-mixed sheaves with integer punctual weights is strictly compatible with the weight filtrations. Stalkwise (W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β). For a lisse mixed sheaf (integer weights at every ι) the filtration does not depend on ι (Weil II 3.4.9).

**Hypotheses.** ℱ₀ lisse with integer punctual ι-weights; A filtration, not a splitting: ℱ₀ need not be the direct sum of its graded pieces.

**Proof outline.**

1. (3.4.6) Uniqueness and functoriality: the stalk formula is forced (DWP.0/weight-decomposition (ii)); a morphism preserves generalised eigenspaces, so f(W_i) ⊆ W_i, and strictness f(W_iℱ₀) = f(ℱ₀) ∩ W_i𝒢₀ holds stalkwise because both sides are the sum of the generalised eigenspaces of weight ≤ i of f(ℱ_x̄).
2. (3.4.7) Existence for X₀ smooth and ℱ₀ a successive extension of lisse punctually ι-pure sheaves: if ℱ₀ is an extension of ℱ″₀ (filtered) by ℱ′₀ pure of integer weight β, then the preimage of W_{β−1}ℱ″₀ is a trivial extension of W_{β−1}ℱ″₀ by ℱ′₀ (DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4: Ext¹(pure of weight < β, pure of weight β) = 0); for i < β take W_iℱ₀ a lifting of W_iℱ″₀, for i ≥ β the preimage of W_iℱ″₀.
3. (3.4.8) General X₀: uniqueness allows descent, so assume X₀ normal; then ℱ₀ = j_*j*ℱ₀ for a dense open j : U₀ → X₀ where (3.4.7) applies (1.8.11 of DWP.5), and W_iℱ₀ := j_*W_ij*ℱ₀ gives Gr^W_i ℱ₀ = j_*Gr^W_i j*ℱ₀, which is lisse and punctually ι-pure of weight i by Weil II (1.8.10) (DWP.5).
4. Independence of ι for mixed sheaves: the eigenvalues are Weil numbers whose weight does not depend on ι (DWP.0/weil-number-iff-iota-pure-for-every-iota), so the stalk formula does not either.

**Depends on.** `DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`, `DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DWP.0/weight-decomposition`, `DWP.0/weil-number-iff-iota-pure-for-every-iota`, `DWP.5`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Used by.**

- PAPER-CIUBOTARU-HARRIS-26 (Proposition 2.7(2)): the unique functorial strict weight filtration with pure graded pieces of a lisse mixed rational ℓ-adic sheaf.
- PAPER-YUN-ZHANG-17/58 (Lemma 7.13(1)): strictness of the weight filtration in long exact sequences to stabilise bounded-weight terms.
- WeightsInEtaleCohomology:R34.1: the strict mixed-sheaf filtration exported through RS-17's one-owner handoff.
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the weight-filtered exact-sequence argument of the local invariant cycle theorem.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.weightFiltration` | data | weightFiltration ℱ₀ : ℤ → lisse subsheaves of ℱ₀, i ↦ W_iℱ₀, monotone, W_i = 0 for i ≪ 0 and = ℱ₀ for i ≫ 0. |
| `TauCeti.Weights.weightFiltration_gr_pure` | characterisation | Gr^W_i ℱ₀ is lisse and punctually ι-pure of weight i. |
| `TauCeti.Weights.weightFiltration_unique` | characterisation | Any finite increasing filtration by lisse subsheaves with Gr_i punctually ι-pure of weight i equals W. |
| `TauCeti.Weights.weightFiltration_stalk` | characterisation | (W_iℱ₀)_x̄ = ⊕_{β ≤ i} ℱ_x̄(β). |
| `TauCeti.Weights.weightFiltration_map` | functoriality | φ(W_iℱ₀) ⊆ W_i𝒢₀, with map_id and map_comp for the induced maps on Gr^W. |
| `TauCeti.Weights.weightFiltration_strict` | other | φ(W_iℱ₀) = φ(ℱ₀) ∩ W_i𝒢₀; hence Gr^W is an exact functor. |
| `TauCeti.Weights.weightFiltration_tensor` | relation | W_k(ℱ₀ ⊗ 𝒢₀) = Σ_{i+j=k} W_iℱ₀ ⊗ W_j𝒢₀. |
| `TauCeti.Weights.weightFiltration_dual` | relation | W_i(ℱ₀^∨) = (ℱ₀ / W_{−i−1}ℱ₀)^∨. |
| `TauCeti.Weights.weightFiltration_pullback` | functoriality | g*W_iℱ₀ = W_i(g*ℱ₀) for g : Y₀ → X₀. |
| `TauCeti.Weights.weightFiltration_twist` | simp | W_i(ℱ₀(r)) = (W_{i+2r}ℱ₀)(r). |
| `TauCeti.Weights.weightFiltration_indep_iota` | other | For lisse mixed ℱ₀ (integer weights for every ι), W does not depend on ι. |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.weightFiltration_kummer` | computation | For the Kummer extension 0 → ℚ̄_ℓ(1) → ℒ → ℚ̄_ℓ → 0 on 𝔾_m over 𝔽_q: W_{−3} = 0, W_{−2} = W_{−1} = ℚ̄_ℓ(1), W_0 = ℒ. |
| `TauCeti.Weights.weightFiltration_pure` | degenerate | For ℱ₀ punctually pure of weight n: W_{n−1} = 0 and W_n = ℱ₀. |
| `TauCeti.Weights.weightFiltration_not_split` | non-example | The Kummer extension ℒ is not isomorphic to Gr^W ℒ = ℚ̄_ℓ(1) ⊕ ℚ̄_ℓ: the weight filtration is not a grading on the sheaf. |
| `TauCeti.Weights.weightFiltration_point` | compatibility | On Spec 𝔽_q, W_iV is the sum of the generalised eigenspaces of F of weight ≤ i; for the Jordan block [[q, 1], [0, q]], W_1 = 0 and W_2 = V. |
| `TauCeti.Weights.weightFiltration_strict_example` | characterisation | The inclusion ℚ̄_ℓ(1) → ℒ is strict: its image meets W_{−2}ℒ in the whole image, and W_{−1} of the cokernel ℚ̄_ℓ is 0. |

**Acceptance.**

- Over Spec 𝔽_q the filtration is W_iV = ⊕_{n ≤ i} V_n, DWP.0's weight decomposition read as a filtration.

**Source.** deligne-weil-ii, §3, Théorème (3.4.1) (ii), p. 207; deligne-weil-ii, §3, Théorème (3.4.1) (ii), p. 207; deligne-weil-ii, §3, Variante (3.4.9), p. 210.

### `DWP.8/geometric-semisimplicity-theorem-3-4-1-iii` — Deligne's semisimplicity theorem: pure lisse sheaves are geometrically semisimple

*Theorem* · planet: **Geometric semisimplicity theorem** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be a normal scheme of finite type over 𝔽_q, ι : ℚ̄_ℓ ≅ ℂ, and ℱ₀ a lisse sheaf on X₀ which is punctually ι-pure (of some weight β ∈ ℝ). Then the pullback ℱ of ℱ₀ to X = X₀ ⊗ 𝔽̄_q is semisimple: ℱ₀ is geometrically semisimple. In particular every lisse punctually pure sheaf on a normal X₀ is geometrically semisimple (Weil II 3.4.9, corrected as in PAPER-DELIGNE-80/E47). Arithmetic semisimplicity is not asserted.

**Hypotheses.** X₀ normal; ℱ₀ lisse and punctually ι-pure at one ι; conclusion after base change to 𝔽̄_q only.

**Proof outline.**

1. (3.4.5) For U₀ ⊂ X₀ a dense open and ū a geometric point of U₀, π₁(U, ū) → π₁(X, ū) is surjective (X normal, IG.0); so geometric semisimplicity may be checked on U₀ (DWP.8/geometric-semisimplicity, api isGeometricallySemisimple_iff_restrict_open), and one may assume X₀ smooth.
2. Let ℱ′ be the largest semisimple lisse subsheaf of ℱ (sum of its irreducible lisse subsheaves). It is Frobenius-stable by transport of structure, hence comes from ℱ′₀ ⊂ ℱ₀; put ℱ″₀ = ℱ₀/ℱ′₀. Both are punctually ι-pure of weight β.
3. By DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4 (equal weights, so β > γ fails), the extension of ℱ″₀ by ℱ′₀ is geometrically trivial. If ℱ″ ≠ 0, a simple lisse subsheaf of ℱ″ lifts to ℱ through the geometric splitting, contradicting the maximality of ℱ′. Hence ℱ″ = 0 and ℱ = ℱ′ is semisimple.

**Depends on.** `DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`, `DWP.8/geometric-semisimplicity`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Acceptance.**

- Acceptance: for an elliptic curve family h : E₀ → S₀ over a smooth curve with nonconstant j-invariant, R¹h_*ℚ̄_ℓ (pure of weight 1) is geometrically irreducible, in particular semisimple.
- Non-example: the Kummer extension ℒ on 𝔾_m (mixed of weights −2 and 0, not pure) is not geometrically semisimple: purity cannot be weakened to mixedness.
- Non-example: the unipotent Weil sheaf [[1, 1], [0, 1]] on Spec 𝔽_q is pure of weight 0 and geometrically semisimple but not arithmetically semisimple; purity of a Weil sheaf does not imply that Frobenius acts semisimply.

**Source.** deligne-weil-ii, §3, Théorème (3.4.1) (iii), p. 207; deligne-weil-ii, §3, (3.4.5), p. 208.

### `DWP.8/potentially-property-p-3-4-10` — Sheaves and complexes potentially having a property P

*Definition* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let P be a property of sheaves (or of complexes) on schemes of finite type over finite fields, for example 'mixed', 'punctually ι-pure of weight β', or 'pure of weight w' in the sense of DWP.8/pure-complexes. Let k be an algebraically closed field with ℓ invertible in k and X a scheme of finite type over k. A sheaf ℱ (resp. a complex K ∈ D^b_c(X)) has potentially the property P when there is a model: an integral scheme S of finite type over ℤ[1/ℓ], a morphism x̄ : Spec k → S, a scheme X_S of finite type over S, a sheaf ℱ_S (resp. complex K_S) on X_S, and an isomorphism of (X_S, ℱ_S) ×_S Spec k (base change along x̄) with (X, ℱ), such that for every closed point s ∈ |S| the restriction of ℱ_S (resp. K_S) to the fibre X_s, a scheme of finite type over the finite field k(s), has the property P. A model is part of the data of a proof that ℱ is potentially P; it is not an existence label.

**Hypotheses.** k algebraically closed, ℓ invertible; S of finite type over ℤ[1/ℓ]; the condition is at all closed points of S; for complexes and P = pure, duality on the fibres is relative to k(s).

**Proof outline.**

1. Definition. Shrinking S to a dense open neighbourhood of the image of x̄ preserves the property (closed points of an open of S are closed in S), so models can always be refined.
2. Spreading out of finite-type schemes, morphisms and constructible sheaves along the limit Spec k = lim of finite-type ℤ[1/ℓ]-schemes is AdicCoefficientsAndComparisons L2's noetherian approximation.

**Depends on.** `DWP.8/pure-complexes`, `DWP.8/mixed-complexes`, `DWP.7/weights-mixed-sheaves-definitions`, `AdicCoefficientsAndComparisons:L2`.

**Used by.**

- Weil II Corollaire (3.4.12), p. 210: potentially punctually ι-pure lisse sheaves on normal X over k algebraically closed are semisimple.
- Weil II Théorème (6.2.13), p. 250: hard Lefschetz for potentially pure complexes.
- LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles: the potentially pure complexes of 6.2.8–6.2.12, with their arithmetic model over a finite-type ℤ[1/ℓ]-base.
- DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1: ℚ̄_ℓ on a smooth projective variety over any algebraically closed field is potentially pure, through an arithmetic model.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.Weights.ArithmeticModel` | structure | The data (S, x̄, X_S, ℱ_S or K_S, iso) of a model of (X, ℱ) over an integral S of finite type over ℤ[1/ℓ]. |
| `TauCeti.Weights.PotentiallyHas` | data | PotentiallyHas P ℱ : Prop := ∃ M : ArithmeticModel X ℱ, ∀ s ∈ ∣M.S∣, P (M.ℱ_S∣X_s). |
| `TauCeti.Weights.PotentiallyHas.mono` | other | (∀ ℱ, P ℱ → Q ℱ) → PotentiallyHas P ℱ → PotentiallyHas Q ℱ. |
| `TauCeti.Weights.ArithmeticModel.restrict` | constructor | Restrict a model to a dense open of S containing the image of x̄; the fibrewise property is inherited. |
| `TauCeti.Weights.PotentiallyHas.pullback` | functoriality | If g : Y → X spreads out over a model, then g*ℱ is potentially P whenever ℱ is and P is stable under pullback. |
| `TauCeti.Weights.PotentiallyHas.directSum` | other | Stable under finite direct sums when P is. |
| `TauCeti.Weights.potentially_baseChange_algClosed` | compatibility | For an extension k ⊂ k′ of algebraically closed fields, ℱ is potentially P iff ℱ_{k′} is (compose x̄ with Spec k′ → Spec k; conversely descend the model). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.Weights.potentiallyPure_const_smooth` | computation | For X smooth over k algebraically closed, ℚ̄_ℓ[0] is potentially pure of weight 0: spread X out to X_S smooth over S, and ℚ̄_ℓ on each smooth fibre is pure (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5). |
| `TauCeti.Weights.potentially_of_finite_field` | compatibility | Over k = 𝔽̄_q, a sheaf ℱ₀ on X₀/𝔽_q with property P is potentially P with model S = Spec 𝔽_q. |
| `TauCeti.Weights.not_potentiallyPure_kummer` | non-example | The Kummer extension ℒ on 𝔾_m over ℂ (a nonsplit unipotent local system of rank two) is potentially mixed but not potentially punctually ι-pure: otherwise it would be semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12. |
| `TauCeti.Weights.potentially_zero` | degenerate | The zero sheaf is potentially P for every P satisfied by zero sheaves, with any model. |

**Acceptance.**

- Over k = 𝔽̄_q, a sheaf defined over a finite subfield 𝔽_{q^r} with property P is potentially P (take S = Spec 𝔽_{q^r}).

**Source.** deligne-weil-ii, §3, (3.4.10), p. 210.

### `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11` — R^i f_*ℚ_ℓ of a proper smooth morphism is potentially punctually pure

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let k be algebraically closed with ℓ invertible, X of finite type over k, and f : Y → X proper and smooth. Then for every i the lisse sheaf R^i f_*ℚ_ℓ is potentially punctually pure of weight i: there is a model f_S : Y_S → X_S over an integral S of finite type over ℤ[1/ℓ], with f_S proper and smooth, and for every closed point s of S the sheaf R^i f_{s*}ℚ_ℓ on X_s is lisse and punctually pure of weight i.

**Hypotheses.** f proper and smooth; constant coefficients ℚ_ℓ.

**Proof outline.**

1. Spread out f to a proper smooth f_S : Y_S → X_S over an integral S of finite type over ℤ[1/ℓ] by the standard limit argument (AdicCoefficientsAndComparisons L2: finite presentation of Y, X and f, and eventual properness and smoothness).
2. By proper and smooth base change (SF.2), R^i f_{S*}ℚ_ℓ is lisse and its formation commutes with every base change; so its restriction to X_s is R^i f_{s*}ℚ_ℓ and its base change to k is R^i f_*ℚ_ℓ.
3. For x ∈ |X_s| the stalk at a geometric point over x is H^i of the geometric fibre of the proper smooth Y_x over the finite field k(x); by DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii) it is pure of weight i relative to N(x).

**Depends on.** `DWP.8/potentially-property-p-3-4-10`, `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance: for the Legendre family y² = x(x − 1)(x − λ) over X = ℙ¹ − {0, 1, ∞} over k, R¹f_*ℚ_ℓ is potentially pure of weight 1 with model over ℤ[1/2ℓ].
- Non-example: for f proper but not smooth (a nodal degeneration), R^i f_*ℚ_ℓ need not be lisse, and its stalks at the singular fibre are not pure.

**Source.** deligne-weil-ii, §3, Exemple (3.4.11), p. 210.

### `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12` — Potentially pure lisse sheaves on a normal variety are semisimple

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let k be algebraically closed with ℓ invertible, X a normal scheme of finite type over k, and ℱ a lisse sheaf on X which is potentially punctually ι-pure (DWP.8/potentially-property-p-3-4-10). Then ℱ is semisimple.

**Hypotheses.** X normal of finite type over an algebraically closed field of any characteristic ≠ ℓ; A model witnessing potential ι-purity is given.

**Proof outline.**

1. Choose a model (S, x̄, X_S, ℱ_S) and shrink S so that X_S → S has normal geometric fibres and ℱ_S is lisse (generic normality and lissity, L2).
2. By the specialisation theorem for monodromy groups (Weil II (1.11.1) with (1.11.5), DWP.5), after shrinking S the image of π₁ of the geometric generic fibre in GL(ℱ_x̄) is conjugate to the image of π₁ of the geometric fibre X_s̄ at closed points s, i.e. the geometric monodromy groups of ℱ and of ℱ_S|X_s̄ agree.
3. ℱ_S|X_s is lisse and punctually ι-pure on the normal X_s over the finite field k(s), so it is geometrically semisimple by DWP.8/geometric-semisimplicity-theorem-3-4-1-iii; semisimplicity is a property of the monodromy group, so ℱ is semisimple.

**Depends on.** `DWP.8/potentially-property-p-3-4-10`, `DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`, `DWP.8/geometric-semisimplicity`, `DWP.5`, `AdicCoefficientsAndComparisons:L2`.

**Acceptance.**

- Acceptance: for X over 𝔽̄_q and ℱ defined over 𝔽_q this is DWP.8/geometric-semisimplicity-theorem-3-4-1-iii.
- Non-example: the Kummer extension on 𝔾_m over ℂ is not semisimple, hence not potentially pure.

**Source.** deligne-weil-ii, §3, Corollaire (3.4.12), p. 210.

### `DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13` — Semisimplicity of R^i f_*ℚ_ℓ for a proper smooth family

*Theorem* · planet: **Semisimplicity of proper smooth monodromy** · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let k be algebraically closed with ℓ invertible, S a normal connected scheme of finite type over k, and f : X → S proper and smooth. Then for every i the lisse sheaf R^i f_*ℚ_ℓ on S is semisimple, i.e. H^i(X_s̄, ℚ_ℓ) is a semisimple representation of π₁(S, s̄).

**Hypotheses.** f proper and smooth; S normal connected of finite type over an algebraically closed field.

**Proof outline.**

1. R^i f_*ℚ_ℓ is lisse (proper smooth base change, SF.2) and potentially punctually pure of weight i (DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12.

**Depends on.** `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.**

- Acceptance (the case used by hard Lefschetz): for X ⊂ ℙ^N smooth projective over k and the family of smooth hyperplane sections Y_u, u ∈ U = ℙ̌^N − X̌, the representation of π₁(U, u) on H^j(Y_u, ℚ_ℓ) is semisimple for every j.
- Acceptance: for a nonisotrivial elliptic family the monodromy representation on H¹ is irreducible.
- Non-example: for f proper and smooth, R^i f_*ℤ/ℓ need not be semisimple: the statement is for ℚ_ℓ coefficients.

**Source.** deligne-weil-ii, §3, Corollaire (3.4.13), p. 210; deligne-weil-ii, §3, Remarque (3.4.14), p. 210.

### `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification` — The weight spectral sequence of a normal crossings compactification

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/MixedComplexes`, namespace `TauCeti.Weights`

Let X₀ be a smooth proper scheme of pure dimension d over 𝔽_q, D₀ ⊂ X₀ a divisor with normal crossings, U₀ = X₀ − D₀ and j : U₀ → X₀. For m ≥ 1 let ν_m : D^{(m)}₀ → X₀ be the normalisation of the locus of points lying on at least m local branches of D₀ (étale locally the disjoint union of the m-fold intersections of the branches), D^{(0)}₀ = X₀, and ε_m the rank-one orientation sheaf on D^{(m)}₀, the determinant of the permutation representation on the m local branches. Then there is a spectral sequence of Frobenius modules E₁^{m,k} = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}_c(U, ℚ_ℓ), whose d₁ is the alternating sum of the restriction maps; E₁^{m,k} is pure of weight k, the sequence degenerates at E₂, and E₂^{m,k} = Gr^W_k H^{m+k}_c(U, ℚ_ℓ) for the weight filtration of the Frobenius module H^{m+k}_c(U). The same holds for X₀ a smooth proper Deligne–Mumford stack over 𝔽_q with a normal crossings divisor, the D^{(m)} being smooth proper Deligne–Mumford stacks; for the boundary of M̄_{g,n} it reads E₁^{j,k} = ⊕_{|E(G)| = j} (H^k(∏_v M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)}.

**Hypotheses.** X₀ smooth proper; D₀ normal crossings (not necessarily strict: the orientation sheaf ε_m records the monodromy of the branches); compact-support form; the ordinary-cohomology form for H^*(U) is its Poincaré dual; the orientation twist det E(G) cannot be omitted (PAPER-BERGSTROM-FABER-PAYNE-24/E7).

**Proof outline.**

1. Exactness of 0 → j_!ℚ_ℓ → ℚ_ℓ → ν_{1*}ε_1 → ν_{2*}ε_2 → ⋯ → ν_{d*}ε_d → 0 on X₀: étale locally D₀ is a union of coordinate hyperplanes and the complex is the augmented Čech (Mayer–Vietoris) resolution of the extension by zero, with the signs organised by the orientation sheaves (EDC.0, SF.2).
2. Applying RΓ(X, −) and filtering by the stupid filtration gives E₁^{m,k} = H^k(X, ν_{m*}ε_m) = H^k(D^{(m)}, ε_m) ⇒ H^{m+k}(X, j_!ℚ_ℓ) = H^{m+k}_c(U); the differential d₁ is induced by the maps of the resolution, the signed restriction maps.
3. Each D^{(m)}₀ is smooth proper of dimension d − m and ε_m is a lisse sheaf of finite order, punctually pure of weight 0, so E₁^{m,k} is pure of weight k (DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (i); for stacks, WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks).
4. d_r : E_r^{m,k} → E_r^{m+r,k−r+1} is a Frobenius-equivariant map between pure modules of weights k and k − r + 1, hence zero for r ≥ 2 (DWP.0/disjoint-spectra-no-intertwiner); so E₂ = E_∞ and the abutment filtration has pure graded pieces E₂^{m,k} of weight k, which identifies it with the weight filtration (DWP.0/weight-decomposition).

**Depends on.** `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`, `DWP.0/disjoint-spectra-no-intertwiner`, `DWP.0/weight-decomposition`, `EtaleDualityAndPerverseSheaves:EDC.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.**

- Acceptance: X₀ = ℙ¹, D₀ = {0, ∞}: E₁^{0,0} = ℚ_ℓ, E₁^{0,2} = ℚ_ℓ(−1), E₁^{1,0} = ℚ_ℓ², d₁ : ℚ_ℓ → ℚ_ℓ² the diagonal; H¹_c(𝔾_m) = coker d₁ = ℚ_ℓ of weight 0 and H²_c = ℚ_ℓ(−1).
- Acceptance (orientation): for M_{1,2} ⊂ M̄_{1,2}, the twisted E₁ page gives e_c = 𝕃², χ_c = 1, matching #M_{1,2}(𝔽_q) = q²; the untwisted page printed in Bergström–Faber–Payne (3) would give χ_c = 2.
- Non-example: the spectral sequence does not degenerate at E₁: for ℙ¹ ⊃ {0, ∞}, d₁ ≠ 0.

**Source.** bergstrom-faber-payne-24, proof of Proposition 4.2, p. 7; bergstrom-faber-payne-24, proof of Proposition 4.2, p. 7.

## Layer DWP.9 — Absolute hard Lefschetz after weights

**Milestone.** For X smooth projective of pure dimension n over an algebraically closed field of
characteristic ≠ ℓ and η = c₁(L) of an ample L, η^r : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)) is an
isomorphism (Weil II 4.1.1, twists restored); the primitive decomposition and nondegenerate Lefschetz
pairings; odd Betti numbers are even (4.1.5); the orthogonal decomposition H^n(Y) = H^n(X) ⊕ Ev(Y) of a
hyperplane section (4.3.9) with Lefschetz's fundamental lemma over ℚ_ℓ; and hard Lefschetz for a
projective X and a potentially pure complex K under the two support inequalities of 6.2.13, in
particular for pure lisse coefficients.

**Proof architecture.** Induction on n through a smooth hyperplane section Y: weak Lefschetz and the
Gysin factorisation reduce everything to the nondegeneracy of the cup-product form of Y on the image
of H^{n−1}(X) (4.1.2). That image is the subspace of π₁(U, u)-invariants for the family of smooth
hyperplane sections over U = ℙ̌ − X̌ (4.1.3, imported from LPV.7's global invariant cycle theorem
6.2.12 with K = ℚ̄_ℓ); the monodromy representation is semisimple (DWP.8, 3.4.13, through arithmetic
models); and an invariant nondegenerate form on a semisimple representation is nondegenerate on its
invariants (4.1.4). No Lefschetz pencil is needed for 4.1.1 itself: the universal family of smooth
hyperplane sections is used, and Bertini identifies its monodromy with that of a general pencil.
Arbitrary algebraically closed fields are handled by arithmetic models over finitely generated
ℤ[1/ℓ]-algebras and cospecialisation (smooth proper base change), never by assuming a model over a
finite field. This is hard Lefschetz, not the Hodge standard conjecture: no positivity is asserted
and no algebraic inverse of η^r is constructed. The invariant-cycle theorems are LPV.7's; EDC.7's
relative theory consumes this layer and is not used by it.

### `DWP.9/lefschetz-operator` — The Lefschetz operator of a line bundle

*Construction* · planet: **Lefschetz operator** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, and L a line bundle on X with first Chern class η = c₁(L) ∈ H²(X, ℚ_ℓ(1)) (EDC.3). The Lefschetz operator is L_η = η ∪ − : H^j(X, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1)), and its r-th iterate is cup product with η^r ∈ H^{2r}(X, ℚ_ℓ(r)). For 0 ≤ r ≤ n: the hard Lefschetz map is η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)); the primitive part is P^{n−r}(X) = ker(η^{r+1} ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r+2}(X, ℚ_ℓ(r + 1))); the Lefschetz pairing is ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) ∈ ℚ_ℓ(r − n) for x, y ∈ H^{n−r}(X, ℚ_ℓ), where Tr_X : H^{2n}(X, ℚ_ℓ(n)) → ℚ_ℓ is the trace of EDC.2. Tate twists are kept: the source's identification ℤ_ℓ ≅ ℤ_ℓ(1) over k is not used.

**Hypotheses.** X smooth projective of pure dimension n over an algebraically closed field with ℓ invertible; L arbitrary in the construction; ampleness is a hypothesis of the theorems.

**Proof outline.**

1. η is EDC.3's Chern class; cup product and the trace are EDC.0 and EDC.2. Graded commutativity x ∪ y = (−1)^{ab} y ∪ x for x ∈ H^a, y ∈ H^b and η of even degree give L_η(x) ∪ y = x ∪ L_η(y).
2. c₁(L ⊗ M) = c₁(L) + c₁(M) (EDC.3), so η(L^{⊗m}) = m·η(L) and L_{mη} = m·L_η; for m ≠ 0 this is invertible in ℚ_ℓ, which allows replacing an ample L by a very ample power.
3. For L very ample and Y ⊂ X a smooth hyperplane section in the embedding defined by L, with i : Y → X, η = cl(Y) and L_η = i_* ∘ i* (projection formula for the Gysin map of EDC.3).

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`.

**Used by.**

- Weil II Théorème (4.1.1), p. 217: hard Lefschetz is the bijectivity of the iterates of this operator.
- Weil II Corollaire (4.1.5), p. 218: the form Tr(η^i x y) on H^{n−i}(X) is the Lefschetz pairing.
- Weil II Théorème (6.2.13), p. 250: the same operator on H^*(X, K) for a complex K.
- WeightsInEtaleCohomology:R34.5/arithmetic-hard-lefschetz-comparison: the arithmetic Frobenius-equivariant isomorphism η^a : H^{d−a} → H^{d+a}(a) with twists restored.
- MotivesAndAlgebraicCycles:MC.7/lefschetz-and-hodge-standard-conjectures: the class inverting η^r, whose algebraicity is the Lefschetz standard conjecture, is defined through this operator and hard Lefschetz.
- EtaleDualityAndPerverseSheaves:EDC.7: relative hard Lefschetz for a projective morphism specialises to this operator over a point.

**API.**

| Name | Role | Statement |
|---|---|---|
| `TauCeti.HardLefschetz.lefschetzOperator` | data | lefschetzOperator η : H^j(X, ℚ_ℓ(m)) →ₗ H^{j+2}(X, ℚ_ℓ(m + 1)), x ↦ η ∪ x. |
| `TauCeti.HardLefschetz.lefschetzOperator_pow` | simp | (lefschetzOperator η)^r = cup product with η^r ∈ H^{2r}(X, ℚ_ℓ(r)). |
| `TauCeti.HardLefschetz.lefschetzOperator_smul` | simp | lefschetzOperator (m • η) = m • lefschetzOperator η, and η(L^{⊗m}) = m • η(L). |
| `TauCeti.HardLefschetz.lefschetzOperator_comm_pullback` | functoriality | For g : X′ → X, g* ∘ L_{η(L)} = L_{η(g*L)} ∘ g*. |
| `TauCeti.HardLefschetz.lefschetzOperator_galois` | functoriality | For (X, L) defined over k₀ ⊂ k, L_η commutes with the action of Gal(k/k₀). |
| `TauCeti.HardLefschetz.lefschetzOperator_eq_gysin_restrict` | characterisation | For L very ample and a smooth hyperplane section i : Y → X, L_η = i_* ∘ i*. |
| `TauCeti.HardLefschetz.lefschetzOperator_selfAdjoint` | relation | Tr_X(L_η x ∪ y) = Tr_X(x ∪ L_η y). |
| `TauCeti.HardLefschetz.lefschetzOperator_pow_top` | relation | η^{n+1} = 0 and, for L ample, Tr_X(η^n) = deg_L(X) > 0. |
| `TauCeti.HardLefschetz.primitivePart` | data | P^{n−r}(X) = ker(η^{r+1} ∪ − on H^{n−r}(X, ℚ_ℓ)). |
| `TauCeti.HardLefschetz.lefschetzPairing` | data | ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ_ℓ), with values in ℚ_ℓ(r − n). |
| `TauCeti.HardLefschetz.lefschetzPairing_symm` | relation | ψ_r(y, x) = (−1)^{n−r} ψ_r(x, y). |

**Unit tests.**

| Name | Kind | Statement |
|---|---|---|
| `TauCeti.HardLefschetz.lefschetzOperator_projectiveSpace` | computation | For X = ℙ^n and L = 𝒪(1): H^{2j}(ℙ^n, ℚ_ℓ(j)) = ℚ_ℓ·η^j, L_η(η^j) = η^{j+1} for j < n, η^{n+1} = 0, and Tr(η^n) = 1. |
| `TauCeti.HardLefschetz.lefschetzOperator_trivial_bundle` | non-example | For L = 𝒪_X, η = 0 and L_η = 0; on X = ℙ¹, η : H⁰ → H²(1) is the zero map, so ampleness cannot be dropped from hard Lefschetz. |
| `TauCeti.HardLefschetz.lefschetzOperator_degree_zero` | non-example | For an elliptic curve E and a line bundle L of degree 0, c₁(L) = 0 in H²(E, ℚ_ℓ(1)) ≅ ℚ_ℓ (the degree), so L_η = 0 although L may be nontrivial. |
| `TauCeti.HardLefschetz.lefschetzOperator_point` | degenerate | For n = 0 (X a finite set of points) L_η = 0 on H⁰ and P⁰(X) = H⁰(X); the hard Lefschetz map for r = 0 is the identity. |
| `TauCeti.HardLefschetz.lefschetzPairing_curve` | computation | For a smooth projective curve of genus g and L of degree e > 0: ψ₀ on H¹ is Tr(x ∪ y), alternating and nondegenerate on a space of dimension 2g; ψ₁ on H⁰ is x·y·e. |

**Acceptance.**

- Over a finite field, or for (X, L) defined over a subfield k₀ with k an algebraic closure of k₀, L_η commutes with Gal(k/k₀): η is fixed and cup product is Galois-equivariant.

**Source.** deligne-weil-ii, §4, Théorème (4.1.1), p. 217; deligne-weil-ii, §4, (4.1), p. 217; deligne-lefschetz-1968, (1.5), p. 108.

### `DWP.9/invariant-form-on-invariants-4-1-4` — An invariant nondegenerate form stays nondegenerate on the invariants of a completely reducible representation

*Lemma* · module `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` · suggested declaration `TauCeti.HardLefschetz.restrict_invariants_nondegenerate`

Let π be a group, K a field, V a finite-dimensional K-vector space with a completely reducible (semisimple) representation of π, and Φ a π-invariant bilinear form on V (Φ(gx, gy) = Φ(x, y) for g ∈ π) which is nondegenerate. Then the restriction of Φ to the invariant subspace V^π is nondegenerate.

**Hypotheses.** V semisimple as a representation of π; Φ need not be symmetric or alternating.

**Proof outline.**

1. By complete reducibility V = V^π ⊕ W with W a subrepresentation. W has no nonzero π-invariant linear form: the kernel of such a form would have a π-stable complement, a trivial one-dimensional subrepresentation of W, contained in V^π ∩ W = 0.
2. For v ∈ V^π the linear forms w ↦ Φ(v, w) and w ↦ Φ(w, v) on W are π-invariant (Φ(v, gw) = Φ(gv, gw) = Φ(v, w)), hence zero. So Φ = Φ|V^π ⊕ Φ|W and nondegeneracy of Φ gives nondegeneracy of Φ|V^π.

**Depends on.** `mathlib:Representation`, `mathlib:Representation.invariants`, `mathlib:IsSemisimpleModule`, `mathlib:Representation.asModule`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict`.

**Acceptance.**

- Acceptance: V = K² with the swap action of π = ℤ/2 and Φ = the standard dot product (char K ≠ 2): V^π = K·(1, 1), and Φ((1, 1), (1, 1)) = 2 ≠ 0.
- Non-example: for π = ℤ acting on K² by the unipotent matrix [[1, 1], [0, 1]] (not semisimple) and the invariant alternating form Φ = det, V^π = K·e₁ and Φ(e₁, e₁) = 0: complete reducibility cannot be dropped.

**Source.** deligne-weil-ii, §4, Lemme (4.1.4), p. 218.

### `DWP.9/hyperplane-factorisation-4-1-2` — Reduction of hard Lefschetz to the middle intersection form on a hyperplane section

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1, L a very ample line bundle, η = c₁(L), i : Y → X the inclusion of a smooth hyperplane section in the embedding defined by L, and η_Y = i*η. (a) The Gysin map i_* : H^j(Y, ℚ_ℓ(m)) → H^{j+2}(X, ℚ_ℓ(m + 1)) is the transpose of i* under Poincaré duality on Y and X, and i_* ∘ i* = L_η. (b) For r ≥ 1 and x ∈ H^{n−r}(X, ℚ_ℓ): η^r ∪ x = i_*(η_Y^{r−1} ∪ i*x). (c) (Weak Lefschetz) i* : H^j(X) → H^j(Y) is an isomorphism for j < n − 1 and injective for j = n − 1; dually i_* : H^j(Y) → H^{j+2}(X)(1) is an isomorphism for j > n − 1 and surjective for j = n − 1. (d) Suppose hard Lefschetz holds for (Y, L|_Y). Then η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)) is an isomorphism for every r ≠ 1, and it is an isomorphism for r = 1 iff the form ⟨y, y′⟩ = Tr_Y(y ∪ y′) on H^{n−1}(Y, ℚ_ℓ) is nondegenerate on the image of i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ) (Weil II 4.1.2).

**Hypotheses.** Y a smooth hyperplane section for a very ample L; X smooth projective of pure dimension n ≥ 1; hard Lefschetz for Y is an assumption of (d) (the induction hypothesis), not a conclusion.

**Proof outline.**

1. (a) EDC.3 (Gysin map, projection formula, cl(Y) = η) and EDC.2 (Poincaré duality: Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i*x)).
2. (b) η^r ∪ x = η ∪ (η^{r−1} ∪ x) = i_* i*(η^{r−1} ∪ x) = i_*(η_Y^{r−1} ∪ i*x).
3. (c) EDC.4's weak Lefschetz theorem for a smooth hyperplane section of a smooth projective variety, and its Poincaré-dual Gysin form.
4. (d) r = 0 is the identity. For r ≥ 2, in (b) the outer maps i* on H^{n−r} and i_* on H^{(n−1)+(r−1)} are isomorphisms by (c), and the middle map is hard Lefschetz for Y in degree (n − 1) − (r − 1). For r = 1, η = i_* ∘ i* with i* injective onto V = i*H^{n−1}(X) and ker(i_*|H^{n−1}(Y)) = V^⊥ by (a); since dim H^{n−1}(X) = dim H^{n+1}(X) (Poincaré duality), η is bijective iff V ∩ V^⊥ = 0, i.e. iff ⟨ , ⟩ is nondegenerate on V.

**Depends on.** `DWP.9/lefschetz-operator`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`.

**Acceptance.**

- Acceptance: X = ℙ², Y a line: H¹ = 0 and the r = 1 condition is vacuous; η² : H⁰ → H⁴(2) is i_* ∘ η_Y ∘ i*, an isomorphism.
- Acceptance: for a smooth projective surface X ⊂ ℙ^N (n = 2) and a smooth hyperplane section Y, the case r = 1 says that η : H¹(X) → H³(X)(1) is bijective iff Tr_Y(y ∪ y′) is nondegenerate on the image of H¹(X) in H¹(Y).
- Non-example: for r = 1 the weak Lefschetz theorem alone gives only injectivity of i* and surjectivity of i_*; bijectivity of η on H^{n−1} is the nondegeneracy statement, which needs monodromy.

**Source.** deligne-weil-ii, §4, proof of (4.1.1) and Lemme (4.1.2), p. 217; deligne-weil-ii, §4, proof of (4.1.1), p. 217.

### `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety` — Arithmetic models of a polarised smooth projective variety and cospecialisation

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible in k, X a smooth projective k-scheme of pure dimension n and L a very ample line bundle, with X ⊂ P = ℙ^N_k the embedding it defines. There are an integral scheme S of finite type over ℤ[1/ℓ], a morphism x̄ : Spec k → S, a smooth projective morphism f_S : X_S → S of pure relative dimension n with a closed embedding X_S ⊂ ℙ^N_S (L_S = 𝒪(1)|X_S), and an isomorphism (X_S ⊂ ℙ^N_S) ×_S k ≅ (X ⊂ P). For such a model: (i) R^jf_{S*}ℚ_ℓ is lisse and its formation commutes with base change; for every geometric point s̄ of S the cospecialisation isomorphisms H^*(X_s̄, ℚ_ℓ) ≅ H^*(X, ℚ_ℓ) are ring isomorphisms compatible with the traces and carry c₁(L_s̄) to c₁(L); in particular hard Lefschetz holds for (X, L) iff it holds for (X_s̄, L_s̄) for one (equivalently every) closed point s of S. (ii) ℚ̄_ℓ[0] on X is potentially pure of weight 0, with this model (DWP.8/potentially-property-p-3-4-10). (iii) If U_S ⊂ ℙ̌^N_S is the open subscheme of hyperplanes whose section of X_S is smooth over S and g_S : Z_S → U_S the family of these sections, then g_S is smooth projective, its fibre over k is the family g : Z → U of smooth hyperplane sections of X, and R^jg_*ℚ_ℓ is potentially punctually pure of weight j.

**Hypotheses.** k algebraically closed of any characteristic ≠ ℓ; the model is part of the data; S may be shrunk to any dense open containing the image of x̄.

**Proof outline.**

1. Noetherian approximation (AdicCoefficientsAndComparisons L2): write k as the filtered union of its finitely generated ℤ[1/ℓ]-subalgebras A; X ⊂ ℙ^N_k is defined by finitely many equations, so descends to X_A ⊂ ℙ^N_A for some A; smoothness, properness, flatness and pure relative dimension n descend after enlarging A and inverting an element. Take S = Spec A.
2. (i) Proper and smooth base change (SF.2): R^jf_{S*}ℚ_ℓ is lisse and commutes with base change; S is connected, so the stalks at any two geometric points are identified along étale paths. Cup product R^a ⊗ R^b → R^{a+b}, the relative trace R^{2n}f_{S*}ℚ_ℓ(n) → ℚ_ℓ (EDC.2) and c₁(L_S) ∈ H⁰(S, R²f_{S*}ℚ_ℓ(1)) (EDC.3, compatible with base change) are morphisms or sections of lisse sheaves, so the identifications respect them.
3. (ii) On each closed fibre X_s, smooth over the finite field k(s), ℚ̄_ℓ[0] is pure of weight 0 (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
4. (iii) The incidence family is smooth over the open of hyperplanes giving smooth sections (LPV.3/dual-variety, which is the fibre over k; openness over S by the Jacobian criterion), and DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11 applies to g_S over each closed point of S.

**Depends on.** `DWP.8/potentially-property-p-3-4-10`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `AdicCoefficientsAndComparisons:L2`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`.

**Acceptance.**

- Acceptance: for X = ℙ^n_k, the model S = Spec ℤ[1/ℓ], X_S = ℙ^n_S works, with cospecialisation sending η^j to η^j.
- Acceptance: for k = ℂ and a smooth projective curve of genus g, a model over a finitely generated ℤ[1/ℓ]-algebra exists, and the cospecialisation carries the symplectic cup-product form on H¹ to the one on a reduction modulo p.
- Non-example: a variety over k = ℂ, or a nonisotrivial elliptic curve over an algebraic closure of 𝔽_p(t), is not defined over any finite field; the model is over a finitely generated ℤ[1/ℓ]-algebra, and only its closed fibres are over finite fields.

**Source.** deligne-weil-ii, Introduction, p. 142; deligne-weil-ii, §3, Exemple (3.4.11), p. 210.

### `DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3` — The image of H^{n−1}(X) in H^{n−1}(Y) is the monodromy invariants

*Lemma* · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n ≥ 1 embedded by a very ample L in P = ℙ^N, U = P̌ − X̌ the open of hyperplanes H with X ∩ H smooth, g : Z → U the family of smooth hyperplane sections, u ∈ U(k), Y = Z_u and i : Y → X. Then the image of i* : H^{n−1}(X, ℚ_ℓ) → H^{n−1}(Y, ℚ_ℓ) is the subspace H^{n−1}(Y, ℚ_ℓ)^{π₁(U, u)} of monodromy invariants. If D ⊂ P̌ is a sufficiently general line through u (a Lefschetz pencil when one exists), the image of π₁(D ∩ U, u) in GL(H^{n−1}(Y)) equals that of π₁(U, u), so the image of i* is also H^{n−1}(Y)^{π₁(D ∩ U, u)} (Weil II 4.1.3).

**Hypotheses.** X smooth projective over an algebraically closed field of characteristic ≠ ℓ; no hard Lefschetz for X is used; the statement is LPV.7's global invariant cycle theorem in the constant-coefficient case.

**Proof outline.**

1. Apply LPV.7:invariant-cycles' global invariant cycle theorem (Weil II 6.2.12, with 6.2.11) to K = ℚ̄_ℓ[0] on X with the integer n − 1 in place of the source's n. Its support hypothesis holds: DK = ℚ̄_ℓ(n)[2n], so DK[−2(n − 1) − 2] = ℚ̄_ℓ(n)[0] has support of dimension n ≤ (n − 1) + 1 − 0 in degree 0 and no other cohomology.
2. K is potentially pure with the model of DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (ii). For K = ℚ̄_ℓ the open where the R^jg_*q*K are lisse contains U, since g is smooth and projective there (LPV.3/dual-variety); every u ∈ U gives a general section.
3. The identification of H^{n−1}(X, K) with the invariants is through restriction, which is injective by weak Lefschetz (EDC.4).
4. For the pencil form, Bertini surjectivity (LPV.5/bertini-surjectivity-on-fundamental-groups; Weil II 6.2.10.2) identifies the monodromy images of π₁(D ∩ U, u) and π₁(U, u).

**Depends on.** `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups`, `EtaleDualityAndPerverseSheaves:EDC.4`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`.

**Acceptance.**

- Acceptance: for X = ℙ² (n = 2) and Y a line, H¹(Y) = 0 = H¹(X). For X a smooth cubic surface in ℙ³ and Y a smooth plane section (an elliptic curve), H¹(X) = 0, so the monodromy of the family of smooth plane sections has no nonzero invariants on H¹(Y) ≅ ℚ_ℓ².
- Acceptance: for X = C × C′ a product of curves with L of bidegree (a, b), H¹(X) = H¹(C) ⊕ H¹(C′) injects into H¹(Y) as the invariant part.
- Non-example: the invariant-cycle statement is about invariants of the geometric monodromy group; over a finite field the arithmetic Frobenius is not part of the group π₁(U, u) here.

**Source.** deligne-weil-ii, §4, (4.1.3), p. 218; deligne-weil-ii, §6, Corollaire (6.2.12), p. 250.

### `DWP.9/hard-lefschetz-4-1-1` — The hard Lefschetz theorem

*Theorem* · planet: **Hard Lefschetz theorem** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be an algebraically closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n, L an ample line bundle on X and η = c₁(L) ∈ H²(X, ℚ_ℓ(1)). Then for every r ≥ 0 the map η^r ∪ − : H^{n−r}(X, ℚ_ℓ) → H^{n+r}(X, ℚ_ℓ(r)) is an isomorphism. If (X, L) = (X₀, L₀) ⊗_{k₀} k for a subfield k₀ of which k is an algebraic closure, the isomorphism is Gal(k/k₀)-equivariant.

**Hypotheses.** X smooth projective of pure dimension n; L ample; k algebraically closed of any characteristic ≠ ℓ; ℚ_ℓ coefficients (the statement fails integrally in general).

**Proof outline.**

1. Reduce to X connected. Since η(L^{⊗m}) = m·η(L) and m is invertible in ℚ_ℓ (DWP.9/lefschetz-operator), assume L very ample, defining X ⊂ P.
2. Induction on n; for n = 0 the case r = 0 is the identity and both sides vanish for r ≥ 1. For n ≥ 1 choose u ∈ U = P̌ − X̌ (nonempty, LPV.3/dual-variety) and Y = X ∩ H_u, smooth projective of pure dimension n − 1 with L|Y very ample; by induction hard Lefschetz holds for Y.
3. By DWP.9/hyperplane-factorisation-4-1-2 (d) it remains to show that ⟨y, y′⟩ = Tr_Y(y ∪ y′) is nondegenerate on V = i*H^{n−1}(X) ⊂ H^{n−1}(Y).
4. V = H^{n−1}(Y)^{π₁(U, u)} by DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3. The representation of π₁(U, u) on H^{n−1}(Y, ℚ_ℓ) is semisimple by DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13 applied to the smooth projective family g : Z → U over the smooth connected U. The form ⟨ , ⟩ is nondegenerate (Poincaré duality on Y, EDC.2) and π₁(U, u)-invariant, being the fibre of the relative pairing R^{n−1}g_*ℚ_ℓ ⊗ R^{n−1}g_*ℚ_ℓ → R^{2n−2}g_*ℚ_ℓ → ℚ_ℓ(1 − n) of lisse sheaves (EDC.2 relative trace).
5. DWP.9/invariant-form-on-invariants-4-1-4 gives nondegeneracy on V.
6. Equivariance: η^r is fixed by Gal(k/k₀) when L is defined over k₀, and cup product is Galois-equivariant (DWP.9/lefschetz-operator api lefschetzOperator_galois).

**Depends on.** `DWP.9/lefschetz-operator`, `DWP.9/hyperplane-factorisation-4-1-2`, `DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`, `DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13`, `DWP.9/invariant-form-on-invariants-4-1-4`, `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: X = ℙ^n, L = 𝒪(1): η^r : H^{n−r} → H^{n+r}(r) is ℚ_ℓ·η^{(n−r)/2} ↦ ℚ_ℓ·η^{(n+r)/2} for n − r even and 0 → 0 otherwise.
- Acceptance: a smooth projective curve (n = 1): r = 1 is the isomorphism H⁰ → H²(1) given by multiplication by deg L > 0.
- Acceptance: an abelian surface A over 𝔽̄_p with an ample L: η² : H⁰ → H⁴(2) is multiplication by (L·L) = 2χ(L) > 0, and η : H¹ → H³(1) is an isomorphism between 4-dimensional spaces.
- Acceptance (specialisation): by DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety (i), the theorem for k = ℂ and for k = 𝔽̄_p are equivalent for (X, L) with a model over a finitely generated ℤ[1/ℓ]-algebra.
- Non-example: this is hard Lefschetz, not the Hodge standard conjecture: no sign or positivity condition of Hodge–Riemann type on ψ_r restricted to primitive classes is asserted in characteristic p, and no algebraic correspondence inverting η^r is constructed.
- Non-example: for L not ample (e.g. pulled back from a curve along a fibration X → C with dim X ≥ 2), η^n = 0 on H⁰ and the statement fails.

**Source.** deligne-weil-ii, §4, Théorème (4.1.1), p. 217; deligne-weil-ii, §4, proof of (4.1.1), p. 218.

### `DWP.9/lefschetz-decomposition-of-a-graded-operator` — Primitive decomposition for a graded operator satisfying hard Lefschetz

*Lemma* · module `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` · suggested declaration `TauCeti.HardLefschetz.iSupIndep_lefschetzDecomposition`

Let K be a field, n ∈ ℕ, V a finite-dimensional K-vector space which is the internal direct sum of subspaces V^j (0 ≤ j ≤ 2n; V^j = 0 otherwise), and λ ∈ End(V) with λ(V^j) ⊆ V^{j+2}, such that λ^r : V^{n−r} → V^{n+r} is bijective for 0 ≤ r ≤ n. Put P^{n−r} = V^{n−r} ∩ ker λ^{r+1} for 0 ≤ r ≤ n. Then: (i) for 0 ≤ r ≤ n, the maps ⊕_{k ≥ 0} λ^k : ⊕_{k≥0} P^{n−r−2k} → V^{n−r} and ⊕_{k ≥ 0} λ^{r+k} : ⊕_{k≥0} P^{n−r−2k} → V^{n+r} are isomorphisms; (ii) dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}; (iii) if B is a nondegenerate bilinear form on V with B(V^a, V^b) = 0 unless a + b = 2n and B(λx, y) = B(x, λy), then for 0 ≤ r ≤ n the form ψ_r(x, y) = B(λ^r x, y) on V^{n−r} is nondegenerate, the decomposition (i) of V^{n−r} is ψ_r-orthogonal, and ψ_r restricts to a nondegenerate form on P^{n−r}; if moreover B(y, x) = (−1)^a B(x, y) for x ∈ V^a, then ψ_r is (−1)^{n−r}-symmetric.

**Hypotheses.** Hard Lefschetz bijectivity in every degree is the hypothesis; any field K.

**Proof outline.**

1. (i) Induction on r downward from r = n, as in Deligne (1968) (1.5)–(1.6): for x ∈ V^{n−r}, λ^{r+1}x ∈ V^{n+r+2} = λ^{r+2}V^{n−r−2}, so x − λx′ ∈ P^{n−r} for the unique x′ ∈ V^{n−r−2} with λ^{r+2}x′ = λ^{r+1}x; injectivity follows from the bijectivity of the λ^{r+k} on the summands.
2. (ii) is the dimension count of (i).
3. (iii) ψ_r(x, y) = B(λ^r x, y) is nondegenerate because λ^r : V^{n−r} → V^{n+r} is bijective and B pairs V^{n+r} perfectly with V^{n−r}. For x = λ^a x₀ and y = λ^b y₀ with x₀ ∈ P^{n−r−2a}, y₀ ∈ P^{n−r−2b} and a < b: ψ_r(x, y) = B(λ^{r+a+b}x₀, y₀) = 0, because x₀ is killed by λ^{r+2a+1} and r + a + b ≥ r + 2a + 1; for a > b move the powers of λ onto y₀ instead. So (i) is ψ_r-orthogonal, and ψ_r is nondegenerate on each summand, in particular on P^{n−r}. Symmetry: B(λ^r y, x) = B(y, λ^r x) = (−1)^{n−r}B(λ^r x, y).

**Depends on.** `mathlib:DirectSum.IsInternal`, `mathlib:LinearMap.ker`, `mathlib:Module.finrank`, `mathlib:LinearMap.BilinForm.Nondegenerate`.

**Acceptance.**

- Acceptance: V = H^*(ℙ²) (n = 2): P⁰ = V⁰, P² = 0, V² = λP⁰, V⁴ = λ²P⁰.
- Acceptance: V = H^*(E) of an elliptic curve (n = 1): P⁰ = V⁰, P¹ = V¹ and V² = λP⁰.
- Non-example: if λ^r fails to be bijective for one r (e.g. λ = 0 on H^*(ℙ¹)), (i) fails: V² is not covered.

**Source.** deligne-lefschetz-1968, Théorème (1.5) and (1.6), p. 108.

### `DWP.9/primitive-decomposition-and-lefschetz-pairings` — Primitive Lefschetz decomposition and nondegenerate Lefschetz pairings

*Theorem* · planet: **Primitive Lefschetz decomposition** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n, L ample, η = c₁(L). (i) For 0 ≤ r ≤ n, H^{n−r}(X, ℚ_ℓ) = ⊕_{k≥0} η^k ∪ P^{n−r−2k}(X)(−k) and H^{n+r}(X, ℚ_ℓ(r)) = ⊕_{k≥0} η^{r+k} ∪ P^{n−r−2k}(X)(−k), where P^{n−r}(X) = ker(η^{r+1} on H^{n−r}(X, ℚ_ℓ)) is the primitive part (DWP.9/lefschetz-operator) and η^k ∪ P(−k) denotes the image of P under η^k ∪ − composed with the inverse twist; dim P^{n−r} = b_{n−r} − b_{n−r−2}. (ii) The Lefschetz pairing ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) on H^{n−r}(X, ℚ_ℓ) is nondegenerate and (−1)^{n−r}-symmetric, the decomposition (i) of H^{n−r} is ψ_r-orthogonal, and ψ_r is nondegenerate on P^{n−r}(X). All these are Gal(k/k₀)-equivariant when (X, L) is defined over k₀.

**Hypotheses.** X smooth projective of pure dimension n, L ample; no sign (Hodge–Riemann) positivity of ψ_r on primitive classes is asserted.

**Proof outline.**

1. Apply DWP.9/lefschetz-decomposition-of-a-graded-operator to V = ⊕_j H^j(X, ℚ_ℓ(⌊j/2⌋)) after choosing, for the linear algebra only, a generator of ℚ_ℓ(1) over the algebraically closed k, so that λ = L_η is a degree-2 endomorphism; the hypothesis is DWP.9/hard-lefschetz-4-1-1, and B is Poincaré duality Tr_X(x ∪ y) (EDC.2), nondegenerate and graded-symmetric, with B(λx, y) = B(x, λy) (DWP.9/lefschetz-operator).
2. The resulting decompositions and pairings are independent of the chosen generator up to the corresponding twists, so they are stated with twists restored; Galois equivariance follows from that of η and of cup product.

**Depends on.** `DWP.9/lefschetz-decomposition-of-a-graded-operator`, `DWP.9/hard-lefschetz-4-1-1`, `DWP.9/lefschetz-operator`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: X a smooth projective surface (n = 2): H² = η·H⁰(−1) ⊕ P²(X), P² = ker(η ∪ − : H² → H⁴(1)), the orthogonal of η for Tr(x ∪ y), and Tr(x ∪ y) is nondegenerate on P².
- Acceptance: X = ℙ^n: P⁰ = H⁰ and every other primitive part is 0.
- Non-example: integrally the decomposition can fail (Weil II 4.3.10: in ℤ_ℓ-cohomology ker(η) on H^n of a hyperplane-section pair can be the whole torsion subgroup); the statement is for ℚ_ℓ.

**Source.** deligne-lefschetz-1968, (1.5)–(1.6), p. 108; deligne-weil-ii, §4, Corollaire (4.1.5), proof, p. 218.

### `DWP.9/alternating-forms-have-even-rank` — A space with a nondegenerate alternating form has even dimension

*Lemma* · module `TauCeti/LinearAlgebra/Lefschetz`, namespace `TauCeti.HardLefschetz` · suggested declaration `TauCeti.HardLefschetz.even_finrank_of_isAlt_of_nondegenerate`

Let K be a field and V a finite-dimensional K-vector space carrying a nondegenerate alternating bilinear form B (B(x, x) = 0 for all x). Then dim_K V is even.

**Hypotheses.** Any field K, including characteristic 2 (alternating, not merely skew-symmetric).

**Proof outline.**

1. Induction on dim V. If V ≠ 0 pick x ≠ 0 and, by nondegeneracy, y with B(x, y) = 1; W = span(x, y) has Gram matrix [[0, 1], [−1, 0]], so B|W is nondegenerate and V = W ⊕ W^⊥ (B is reflexive since alternating; Mathlib's LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal). B|W^⊥ is alternating and nondegenerate, and dim W = 2.

**Depends on.** `mathlib:LinearMap.BilinForm.IsAlt`, `mathlib:LinearMap.BilinForm.Nondegenerate`, `mathlib:LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal`, `mathlib:Module.finrank`.

**Acceptance.**

- Acceptance: K² with B = det is nondegenerate alternating, of dimension 2.
- Non-example: in characteristic 2 the form x₁y₁ on K¹ is symmetric (= skew-symmetric) and nondegenerate but not alternating, on an odd-dimensional space: alternating cannot be weakened to skew-symmetric.

**Source.** deligne-weil-ii, §4, Corollaire (4.1.5), proof, p. 218.

### `DWP.9/odd-betti-numbers-are-even-4-1-5` — Odd Betti numbers of smooth projective varieties are even

*Theorem* · planet: **Evenness of odd Betti numbers** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible and X a smooth projective k-scheme. Then b_j(X) = dim_{ℚ_ℓ} H^j(X, ℚ_ℓ) is even for every odd j.

**Hypotheses.** X smooth projective; the statement for smooth proper nonprojective X is not asserted (the source records that it is not known to it in positive characteristic).

**Proof outline.**

1. Reduce to X connected of pure dimension n and choose an ample L, η = c₁(L).
2. For odd j ≤ n write j = n − r; ψ_r(x, y) = Tr_X(η^r ∪ x ∪ y) is nondegenerate on H^{n−r}(X, ℚ_ℓ) (DWP.9/primitive-decomposition-and-lefschetz-pairings (ii)) and, n − r being odd, alternating: x ∪ x = −x ∪ x by graded commutativity, so x ∪ x = 0 in characteristic 0 coefficients. After trivialising the one-dimensional target ℚ_ℓ(r − n), DWP.9/alternating-forms-have-even-rank gives b_j even.
3. For odd j > n, b_j = b_{2n−j} by Poincaré duality (EDC.2) and 2n − j < n is odd.

**Depends on.** `DWP.9/primitive-decomposition-and-lefschetz-pairings`, `DWP.9/alternating-forms-have-even-rank`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: a smooth projective curve of genus g has b₁ = 2g.
- Acceptance: an abelian variety of dimension g has b_j = C(2g, j), which is even for odd j.
- Non-example: a non-algebraic compact complex manifold (a Hopf surface, b₁ = 1) shows that some algebraic or Kähler input is needed; this node proves only the projective case

**Source.** deligne-weil-ii, §4, Corollaire (4.1.5), p. 218.

### `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13` — Hard Lefschetz for potentially pure complexes

*Theorem* · planet: **Hard Lefschetz for pure complexes** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X ⊂ P = ℙ^N_k a projective k-scheme, η = c₁(𝒪_X(1)) ∈ H²(X, ℚ_ℓ(1)), and K ∈ D^b_c(X, ℚ̄_ℓ) a potentially pure complex, with a model (S, x̄, X_S ⊂ ℙ^N_S, K_S) witnessing potential purity (DWP.8/potentially-property-p-3-4-10). Let n ∈ ℤ be such that for every i, dim Supp ℋ^i(K) ≤ n − i and dim Supp ℋ^i(DK[−2n]) ≤ n − i (dim ∅ = −∞), where D is duality relative to k. Then for every r ≥ 0 the cup product η^r ∪ − : H^{n−r}(X, K) → H^{n+r}(X, K(r)) is an isomorphism.

**Hypotheses.** X projective with the given embedding; η the class of 𝒪(1) of that embedding; K potentially pure with an explicit model; both support inequalities, for K and for DK[−2n]; the integer n is part of the statement and need not be dim X.

**Proof outline.**

1. Induction on dim X (Weil II 6.2.13, parallel to 4.1.1). If dim X = 0 and ℋ^iK ≠ 0, the hypotheses give 0 ≤ n − i and 0 ≤ n − (−i + 2n) = i − n, so i = n: H^iK = 0 for i ≠ n and the assertion is trivial.
2. For Y = X ∩ H_u a sufficiently general hyperplane section (u in the dense open U where the R^jg_*q*K are lisse), K|Y satisfies the hypotheses with n − 1, and D(K|Y) = (DK)|Y(−1)[−2] (generic transversality; LPV.7:invariant-cycles' proof of 6.2.11, SGA 4½ [Th. finitude] generic acyclicity through EDC.0). As in DWP.9/hyperplane-factorisation-4-1-2, using LPV.7's support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK, the induction reduces to r = 1, i.e. to the bijectivity of H^{n−1}(X, K) → H^{n−1}(Y, K) → H^{n+1}(X, K)(1), the second map being the transpose of restriction H^{n−1}(X, DK[−2n]) → H^{n−1}(Y, DK[−2n]).
3. It therefore suffices that the perfect duality (EDC.1, Verdier duality on the projective Y over the algebraically closed k) between H^{n−1}(Y, K) and H^{n−1}(Y, DK[−2n]) induces a perfect duality between the images of H^{n−1}(X, K) and H^{n−1}(X, DK[−2n]). By LPV.7's global invariant cycle theorem 6.2.12, applied to K and to DK[−2n] (both potentially pure, D preserving purity, DWP.8/pure-complexes), these images are the π₁(U, u)-invariants.
4. The representation of π₁(U, u) on H^*(Y_u, K) is semisimple: R^jg_*(q*K)|U is lisse and potentially punctually ι-pure (proper direct image preserves purity on the model, DWP.8/proper-direct-image-preserves-purity-6-2-6 and DWP.8/variant-over-z-one-over-ell-6-2-7, and lisse cohomology sheaves of a pure complex on a smooth base are punctually pure, DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5), hence semisimple by DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12. Conclude by DWP.9/invariant-form-on-invariants-4-1-4.
5. The source identifies ℤ_ℓ with ℤ_ℓ(1) to view η in H²(X, ℤ_ℓ); with the twist restored the target is H^{n+r}(X, K(r)).

**Depends on.** `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`, `DWP.8/potentially-property-p-3-4-10`, `DWP.8/pure-complexes`, `DWP.8/proper-direct-image-preserves-purity-6-2-6`, `DWP.8/variant-over-z-one-over-ell-6-2-7`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`, `DWP.9/invariant-form-on-invariants-4-1-4`, `DWP.9/lefschetz-operator`, `EtaleDualityAndPerverseSheaves:EDC.0`, `EtaleDualityAndPerverseSheaves:EDC.1`.

**Acceptance.**

- Acceptance: for X smooth projective of pure dimension n and K = ℚ̄_ℓ[0], DK[−2n] = ℚ̄_ℓ(n)[0], both supports have dimension n ≤ n − 0, and the theorem is DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for K = IC_X(L) of a pure lisse L on a smooth dense open of a projective X of dimension d, placed in the normalisation K = IC[−d] with n = d, the support conditions are the IC support conditions, and the conclusion is hard Lefschetz for intersection cohomology (consumed by EDC.7).
- Non-example (purity): for j : 𝔾_m → ℙ¹, K = j_!ℚ̄_ℓ and n = 1 the support conditions hold (ℋ⁰K has support ℙ¹ of dimension 1 ≤ 1; DK[−2] = Rj_*ℚ̄_ℓ(1) has ℋ⁰ of support dimension 1 ≤ 1 and ℋ¹ supported on {0, ∞}, of dimension 0 ≤ 0), but η : H⁰(ℙ¹, j_!ℚ̄_ℓ) = 0 → H²(ℙ¹, j_!ℚ̄_ℓ)(1) = ℚ̄_ℓ is not an isomorphism: j_!ℚ̄_ℓ is mixed but not potentially pure.
- Non-example (supports): K = ℚ̄_ℓ on ℙ¹ with n = 0 violates dim Supp ℋ⁰K ≤ 0, and η² : H^{−2} = 0 → H²(ℙ¹, ℚ̄_ℓ(2)) ≠ 0 is not an isomorphism: n is dictated by the support conditions.

**Source.** deligne-weil-ii, §6, Théorème (6.2.13), p. 250; deligne-weil-ii, §6, proof of (6.2.13), p. 251.

### `DWP.9/hard-lefschetz-for-pure-lisse-sheaves` — Hard Lefschetz with coefficients in a potentially pure lisse sheaf

*Theorem* · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n embedded by a very ample L, η = c₁(L), and ℱ a lisse ℚ̄_ℓ-sheaf on X which is potentially punctually pure of some weight w, with a model witnessing it. Then for every r ≥ 0, η^r ∪ − : H^{n−r}(X, ℱ) → H^{n+r}(X, ℱ(r)) is an isomorphism. In particular this holds for ℱ = R^jh_*ℚ_ℓ of a smooth projective morphism h : Y → X.

**Hypotheses.** X smooth projective; ℱ lisse and potentially punctually pure (integer weight); for a very ample L; an ample L reduces to a power.

**Proof outline.**

1. K = ℱ[0] is potentially pure of weight w as a complex: on the smooth closed fibres of a model, a lisse punctually pure sheaf is pure (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (b)).
2. Support conditions with the integer n: ℋ⁰K = ℱ has support of dimension n ≤ n − 0; DK[−2n] = ℱ^∨(n)[0] (X smooth of pure dimension n) likewise. Apply DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13.
3. For ℱ = R^jh_*ℚ_ℓ, potential purity is DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11.

**Depends on.** `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DWP.8/potentially-property-p-3-4-10`.

**Acceptance.**

- Acceptance: ℱ = ℚ_ℓ recovers DWP.9/hard-lefschetz-4-1-1.
- Acceptance: for h : E × X → X the constant elliptic family, ℱ = R¹h_*ℚ_ℓ = H¹(E) ⊗ ℚ_ℓ and the statement is hard Lefschetz for X tensored with H¹(E).
- Non-example: no claim is made for lisse sheaves that are not potentially pure, such as a nonsplit unipotent local system on an elliptic curve over ℂ (an extension of ℚ_ℓ by ℚ_ℓ with nonzero class in H¹(E, ℚ_ℓ)), which, being nonsemisimple, is not potentially pure (DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12)

**Source.** deligne-weil-ii, Introduction, p. 142.

### `DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9` — Invariant and vanishing cohomology of a hyperplane section are orthogonal complements

*Theorem* · planet: **Invariant and vanishing cohomology** · module `TauCeti/AlgebraicGeometry/Weights/HardLefschetz`, namespace `TauCeti.HardLefschetz`

Let k be algebraically closed with ℓ invertible, X a smooth projective k-scheme of pure dimension n + 1, L very ample, (X_t)_{t∈D} a Lefschetz pencil of hyperplane sections (LPV.3) with singular set S, u ∈ D − S, Y = X_u, i : Y → X, and E = Ev(Y) ⊂ H^n(Y, ℚ_ℓ) the vanishing subspace (LPV.4). Then H^n(Y, ℚ_ℓ) = i*H^n(X, ℚ_ℓ) ⊕ E, an orthogonal direct sum for the intersection form Tr_Y(x ∪ y), which is nondegenerate on each summand. Consequently E ∩ E^⊥ = 0 (the radical quotient E/(E ∩ E^⊥) of LPV.4 is E itself), and a class that is both invariant under π₁(D − S, u) and vanishing is zero ('Lefschetz's fundamental lemma' over ℚ_ℓ).

**Hypotheses.** ℚ_ℓ coefficients: the ℤ_ℓ statement is false (Weil II 4.3.10); A Lefschetz pencil (which may require a Veronese re-embedding, LPV.3).

**Proof outline.**

1. i*H^n(X) = H^n(Y)^{π₁(D − S, u)} by DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3 (pencil form, applied to X of dimension n + 1), and H^n(Y)^{π₁(D − S, u)} = E^⊥ by LPV.5/monodromy-generated-by-local-transvections.
2. By DWP.9/hard-lefschetz-4-1-1 for X and DWP.9/hyperplane-factorisation-4-1-2 (d) (with n + 1 for n), the form is nondegenerate on i*H^n(X) = E^⊥.
3. The form on H^n(Y) is nondegenerate (Poincaré duality, EDC.2), so (E^⊥)^⊥ = E and H^n(Y) = E^⊥ ⊕ (E^⊥)^⊥ = i*H^n(X) ⊕ E, orthogonally, with the form nondegenerate on both summands.

**Depends on.** `DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`, `DWP.9/hard-lefschetz-4-1-1`, `DWP.9/hyperplane-factorisation-4-1-2`, `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections`, `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace`, `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.**

- Acceptance: X = ℙ² with the pencil of conics through four points after the Veronese re-embedding: n = 1, Y a conic, H¹(Y) = 0 = E.
- Acceptance: X a smooth surface in ℙ³ of degree d, Y a plane curve of degree d and genus g = (d − 1)(d − 2)/2: H¹(X) = 0, so E = H¹(Y) of dimension 2g with nondegenerate form.
- Non-example (ℤ_ℓ): in ℤ_ℓ-cohomology the intersection of E and the fixed part is ker(η : H^n(X, ℤ_ℓ) → H^{n+2}(X, ℤ_ℓ)(1)), which can be the whole torsion subgroup after changing the projective embedding (Weil II 4.3.10, after J. Morgan).

**Source.** deligne-weil-ii, §4, Corollaire (4.3.9), p. 226; deligne-weil-ii, §4, (4.3.10), p. 226.

## Planets

| Layer | Planet | Node |
|---|---|---|
| DWP.7 | Fundamental theorem of Weil II | `DWP.7/fundamental-direct-image-theorem-3-3-1` |
| DWP.7 | Purity of proper smooth cohomology | `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11` |
| DWP.8 | Mixed complexes | `DWP.8/mixed-complexes` |
| DWP.8 | Pure complexes | `DWP.8/pure-complexes` |
| DWP.8 | Purity of proper direct images | `DWP.8/proper-direct-image-preserves-purity-6-2-6` |
| DWP.8 | Weight filtration of a lisse mixed sheaf | `DWP.8/punctual-weight-filtration-3-4-1-ii` |
| DWP.8 | Geometric semisimplicity theorem | `DWP.8/geometric-semisimplicity-theorem-3-4-1-iii` |
| DWP.8 | Semisimplicity of proper smooth monodromy | `DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13` |
| DWP.9 | Lefschetz operator | `DWP.9/lefschetz-operator` |
| DWP.9 | Hard Lefschetz theorem | `DWP.9/hard-lefschetz-4-1-1` |
| DWP.9 | Primitive Lefschetz decomposition | `DWP.9/primitive-decomposition-and-lefschetz-pairings` |
| DWP.9 | Evenness of odd Betti numbers | `DWP.9/odd-betti-numbers-are-even-4-1-5` |
| DWP.9 | Hard Lefschetz for pure complexes | `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13` |
| DWP.9 | Invariant and vanishing cohomology | `DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9` |

## Requests to other roadmaps

- **`EtaleDualityAndPerverseSheaves:EDC.0`.** The bounded derived category D^b_c(X, ℚ̄_ℓ) of constructible ℚ̄_ℓ-sheaves (and of ℚ̄_ℓ-Weil sheaves over 𝔽_q), on schemes of finite type over 𝔽_q and over ℤ[1/ℓ], with cohomology sheaves ℋ^i; Rf_* and Rf_! for separated finite-type f (through a compactification), f*, ⊗ and RHom, with their long exact sequences, the Leray spectral sequences R^pg_!R^qh_! ⇒ R^{p+q}(gh)_! and R^pf_!ℋ^qK ⇒ ℋ^{p+q}Rf_!K, and stalkwise Künneth with field coefficients; lisse sheaves on a normal connected scheme as continuous representations of π₁ (resp. of the Weil group) with a stable lattice over the integers of a finite extension of ℚ_ℓ, local ℰxt of lisse sheaves vanishing in positive degree; generic constructibility and generic base change (SGA 4½ [Th. finitude] 1.9, 2.16), and the commutation with base change of j_* (and of the local monodromy filtration) for a lisse sheaf tamely ramified along a divisor finite étale over the base. Needed by `DWP.7/weights-mixed-sheaves-definitions`, `DWP.7/devissage-in-the-sheaf-and-the-source`, `DWP.7/devissage-in-the-target`, `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`, `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.8/mixed-complexes`, `DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DWP.8/direct-image-preserves-mixedness-6-1-2`, `DWP.8/six-operations-preserve-mixedness-6-1-11`, `DWP.8/compact-support-direct-image-upper-weights-6-2-3`, `DWP.8/directional-weight-estimates`, `DWP.8/geometric-semisimplicity`, `DWP.8/ext-one-of-lisse-sheaves-3-4-2`, `DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DWP.8/punctual-weight-filtration-3-4-1-ii`, `DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`, `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `DWP.9/lefschetz-operator`, `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.
- **`EtaleDualityAndPerverseSheaves:EDC.1`.** f^! right adjoint to Rf_! for separated finite-type morphisms of schemes of finite type over 𝔽_q, over an algebraically closed field, and over the regular one-dimensional base ℤ[1/ℓ] (SGA 4½ [Th. finitude] 4.3 for biduality there); K_X = Ra^!ℚ̄_ℓ and D = RHom(−, K_X) with biduality D² ≅ id on D^b_c, the exchange isomorphisms D Rf_! ≅ Rf_* D and D f* ≅ Rf^! D, the formula D(K ⊗ L) ≅ RHom(K, DL), and Verdier duality RΓ(X, DK) ≅ RHom(RΓ_c(X, K), ℚ̄_ℓ) with its perfect pairings over an algebraically closed field; and, through the identification of i_*i^! with local cohomology, i^!ℚ_ℓ ≅ ℚ_ℓ(−1)[−2] for a closed point i of Spec ℤ[1/ℓ] (local cohomology of a henselian discrete valuation ring with ℓ invertible, by Kummer theory). Needed by `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DWP.8/pure-complexes`, `DWP.8/six-operations-preserve-mixedness-6-1-11`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/intermediate-direct-image-purity-6-2-5cd`, `DWP.8/directional-weight-estimates`, `DWP.8/proper-direct-image-preserves-purity-6-2-6`, `DWP.8/variant-over-z-one-over-ell-6-2-7`, `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.
- **`EtaleDualityAndPerverseSheaves:EDC.2`.** Poincaré duality on a smooth X of pure dimension N over 𝔽_q or over an algebraically closed field: a^!ℚ_ℓ ≅ ℚ_ℓ(N)[2N] and the Frobenius-equivariant perfect pairing H^i(X, ℱ) × H^{2N−i}_c(X, ℱ^∨(N)) → ℚ̄_ℓ for lisse ℱ; the relative trace R^{2N}f_!ℚ_ℓ(N) → ℚ_ℓ for smooth f of relative dimension N, compatible with base change, giving for smooth proper f the fibrewise cup-product pairings R^jf_*ℚ_ℓ ⊗ R^{2N−j}f_*ℚ_ℓ → ℚ_ℓ(−N) as morphisms of lisse sheaves. Needed by `DWP.7/cohomological-bounds-3-3-2-3-3-6`, `DWP.7/valuation-triangles-3-3-8`, `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DWP.8/pure-complexes`, `DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DWP.8/six-operations-preserve-mixedness-6-1-11`, `DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`, `DWP.8/intermediate-direct-image-purity-6-2-5cd`, `DWP.8/variant-over-z-one-over-ell-6-2-7`, `DWP.9/lefschetz-operator`, `DWP.9/hyperplane-factorisation-4-1-2`, `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`, `DWP.9/hard-lefschetz-4-1-1`, `DWP.9/primitive-decomposition-and-lefschetz-pairings`, `DWP.9/odd-betti-numbers-are-even-4-1-5`, `DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9`.
- **`EtaleDualityAndPerverseSheaves:EDC.3`.** The first Chern class c₁ : Pic(X) → H²(X, ℚ_ℓ(1)), additive, compatible with pullback and with base change in smooth projective families; the cycle class cl(Y) = c₁(𝒪(Y)) of a smooth divisor; the Gysin map i_* of a smooth hyperplane section i : Y → X with the projection formula i_*(i*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i*x); and Tr_X(c₁(L)^n) = deg_L(X). Needed by `DWP.9/lefschetz-operator`, `DWP.9/hyperplane-factorisation-4-1-2`, `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.
- **`EtaleDualityAndPerverseSheaves:EDC.4`.** Weak Lefschetz for a smooth hyperplane section Y of a smooth projective X of pure dimension n over an algebraically closed field with ℓ invertible: i* : H^j(X, ℚ_ℓ) → H^j(Y, ℚ_ℓ) is an isomorphism for j < n − 1 and injective for j = n − 1, and the dual statement for the Gysin map. Needed by `DWP.9/hyperplane-factorisation-4-1-2`, `DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`.
- **`SchemeAndStackFoundations:SF.2`.** Proper base change for Rf_!; smooth and proper base change (R^jf_*ℚ_ℓ lisse with formation commuting with base change, for f proper smooth); topological invariance of the étale site under universal homeomorphisms; the excision sequence 0 → j_!j* → id → i_*i* → 0; the Grothendieck–Lefschetz trace formula Z(X₀, t) = ∏ det(1 − Ft, H^i_c)^{(−1)^{i+1}} with Z independent of ℓ. Needed by `DWP.7/devissage-in-the-sheaf-and-the-source`, `DWP.7/devissage-in-the-target`, `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`, `DWP.7/spreading-out-to-a-tame-relative-curve`, `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DWP.8/generic-mixedness-of-direct-images-6-1-3`, `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DWP.8/semisimplicity-of-proper-smooth-direct-images-3-4-13`, `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`, `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.
- **`AdicCoefficientsAndComparisons:L2`.** Noetherian approximation: descent of schemes of finite type, closed embeddings into ℙ^N, morphisms, smoothness, properness, flatness, pure relative dimension, normality of fibres and constructible ℚ̄_ℓ-sheaves from an algebraically closed field (or a function field) to a finitely generated ℤ[1/ℓ]-algebra, after shrinking; dense regular locus of an integral scheme of finite type over ℤ[1/ℓ]. Needed by `DWP.7/spreading-out-to-a-tame-relative-curve`, `DWP.8/potentially-property-p-3-4-10`, `DWP.8/proper-smooth-direct-images-are-potentially-pure-3-4-11`, `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`, `DWP.9/arithmetic-model-of-a-polarised-smooth-projective-variety`.
- **`ArithmeticGaloisDuality:R02.2`.** The continuous ℓ-adic Hochschild–Serre sequence for a closed normal subgroup with quotient ℤ̂, and its Weil-group variant with discrete quotient ℤ, for finite-dimensional continuous ℚ̄_ℓ-representations, with H¹(ℤ, N) = N_F, H²(ℤ, N) = 0; the five-term exact sequence 0 → H¹(ℤ, M^{π₁(X)}) → H¹(W, M) → H¹(π₁(X), M)^F. Needed by `DWP.8/ext-one-of-lisse-sheaves-3-4-2`.
- **`WeilConjectures:WC.3`.** The algebraic factor lemma of Weil I (proof of (1.7) ⇒ (1.6)) for an arbitrary degreewise pure realisation: if Z(X₀, t) ∈ ℚ(t) has integral power-series expansion and equals ∏_i det(1 − Ft, H^i)^{(−1)^{i+1}} with H^i pure of weight i, then each det(1 − Ft, H^i) has integer coefficients determined by Z(X₀, t), hence independent of ℓ; stated for smooth proper (not only projective) X₀ over 𝔽_q. Needed by `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`.
- **`LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`.** Weil II 6.2.8–6.2.12 over any algebraically closed field k with ℓ invertible, for potentially pure complexes with an explicit arithmetic model (DWP.8/potentially-property-p-3-4-10): the local invariant cycle theorem 6.2.9; the support-bound weak Lefschetz theorem 6.2.11 (i) for K and for DK; for a general hyperplane section Y, D(K|Y) = (DK)|Y(−1)[−2] and K|Y satisfies the support hypothesis with n − 1; 6.2.11 (ii); and the global invariant cycle theorem 6.2.12, including its constant-coefficient case K = ℚ̄_ℓ on a smooth projective X (Weil II 4.1.3). The direct proof of 4.1.3 in Weil II §4.3 ((4.3.2)–(4.3.8), relative cohomology and the injectivity (4.3.6)) is the argument 6.2.11 (ii) refers to and belongs with it. Needed by `DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3`, `DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.
- **`LefschetzPencilsAndVanishingCycles:LPV.1`.** Quasi-unipotence of the inertia action on nearby cycles and on ℓ-adic sheaves over a henselian trait (SGA 7 I), the tame character, the nilpotent logarithm N and the monodromy filtration constructions of Weil II (1.6.1), (1.6.14). Needed by `DWP.8/mixed-sheaves-with-galois-action-on-the-special-fibre`, `DWP.8/nearby-cycles-preserve-mixedness-6-1-13`.
- **`tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.** Spreading out of a polarised projective relative curve over a finitely presented base, together with sections, divisors and finite étale covers, as finite-presentation models over a dense open of the base. Needed by `DWP.7/spreading-out-to-a-tame-relative-curve`.
- **`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.** The smooth projective model of a smooth curve over a perfect field (its normal compactification), with the finite reduced set of points at infinity, which is étale over the perfect base field. Needed by `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.** The wild inertia subgroup of the absolute Galois group of a henselian discretely valued field with residue characteristic p > 0 is a pro-p group (trivial in residue characteristic 0). Needed by `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.** The tame quotient of the inertia group, through which every representation trivial on wild inertia factors. Needed by `DWP.7/tame-cover-of-a-lisse-sheaf-on-a-curve`.
- **`InverseGaloisAndArithmeticFundamentalGroups:IG.0`.** For X normal connected and U ⊂ X a dense open, π₁(U, ū) → π₁(X, ū) is surjective (SGA 1 V 8.2); lisse sheaves as continuous representations of π₁. Needed by `DWP.8/geometric-semisimplicity`, `DWP.8/ext-one-of-lisse-sheaves-3-4-2`, `DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`.
- **`InverseGaloisAndArithmeticFundamentalGroups:IG.1`.** The exact sequence 1 → π₁(X, x̄) → π₁(X₀, x̄) → Gal(𝔽̄_q/𝔽_q) → 1 for X₀ geometrically connected of finite type over 𝔽_q, and the Weil group W(X₀, x̄) as the preimage of F^ℤ. Needed by `DWP.8/geometric-semisimplicity`, `DWP.8/ext-one-of-lisse-sheaves-3-4-2`.
- **`SchemeAndStackFoundations:SF.1`.** Étale cohomology of Deligne–Mumford stacks of finite type over 𝔽_q, with the resolution of j_!ℚ_ℓ by normalised strata of a normal crossings divisor, for the stacky weight spectral sequence. Needed by `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification`.
- **`DeligneWeightsAndPurity:DWP.5`.** The sheaf-level predicates of Weil II (1.2.2)–(1.2.7) (punctually pure, mixed, punctually ι-pure, ι-mixed, twists) on schemes of finite type over ℤ[1/ℓ] (not only over 𝔽_q), with the stabilities (1.2.5) and the Weil-sheaf variants; the local weight theorem (1.8.4) with (1.8.6)–(1.8.8) along a divisor finite étale over a base; the corollaries (1.8.9) (j_* preserves ι-mixedness with weights ≤ β), (1.8.10) and (1.8.11); and the specialisation theorem for monodromy groups (1.11.1), (1.11.5). Needed by `DWP.7/weights-mixed-sheaves-definitions`, `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/fundamental-direct-image-theorem-3-3-1`, `DWP.7/iota-mixed-direct-image-3-3-10`, `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.8/nearby-cycles-preserve-mixedness-6-1-13`, `DWP.8/intermediate-direct-image-purity-6-2-5cd`, `DWP.8/weight-decomposition-modulo-z-3-4-1-i`, `DWP.8/punctual-weight-filtration-3-4-1-ii`, `DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12`.
- **`DeligneWeightsAndPurity:DWP.6`.** Weil II (3.2.3): for a smooth projective curve over a finite field, j : U → C dense open and ℱ lisse on U punctually ι-pure of weight β, H^i(C, j_*ℱ) is ι-pure of weight β + i, for every ι (so that integer weights follow). Needed by `DWP.7/purity-of-the-relative-curve-case`, `DWP.7/iota-mixed-direct-image-3-3-10`.

## Gaps

- **Proof of Deligne's integrality theorem (SGA 7 XXI 5.2.2) not read.** Weil II (3.3.3) imports SGA 7 XXI (5.2.2): for f with fibres of dimension ≤ d and ℱ integral, R^if_!ℱ and R^if_!ℱ(i − d) are integral. SGA 7 II (Lecture Notes in Mathematics 340) is not openly available, so the statement is planned from Weil II's citation and its proof is not decomposed. The integral clauses of 3.3.3–3.3.4 and the triangles of 3.3.8 rest on it; the non-integral weight bounds, purity and all of DWP.8–DWP.9 do not. Needed by `DWP.7/deligne-integrality-theorem-sga7-xxi`, `DWP.7/integral-weight-bounds-3-3-3`, `DWP.7/valuation-triangles-3-3-8`.

## Structural notes

- **rescope** (DeligneWeightsAndPurity, WeilConjectures). Accepted RS-17 gives DWP.7 the integral, ℓ-independent factor statement of Weil II 3.3.9 (importing WC.3's algebraic lemma), and this packet plans it in DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii). The accepted node WeilConjectures:WC.6/purity-for-proper-smooth-varieties derives the same integral factors again from DWP.7's purity and WC.3. Proposal: Narrow WC.6/purity-for-proper-smooth-varieties to an adapter that imports DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (ii) for the integral ℓ-independent factors and keeps only its zeta-facing assembly (degree-zero and empty-scheme conventions, uniqueness of P_i, charpolyRev normalisation).
- **rescope** (DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles). The extraction of Weil II routes §4.3 ((4.3.2)–(4.3.8), the relative-cohomology proof that Ev(Y)^⊥ is the image of Hⁿ(X), i.e. 4.1.3) to DWP.9. Accepted RS-17 makes LPV.7:invariant-cycles the owner of 6.2.8–6.2.12, and the proof of 6.2.11 (ii) applies exactly (4.3.7)–(4.3.8). Planning §4.3 in DWP.9 would duplicate it. Proposal: LPV.7:invariant-cycles owns Weil II (4.3.2)–(4.3.8) together with 6.2.11–6.2.12, including the constant-coefficient case 4.1.3; DWP.9 imports 4.1.3 from it (DWP.9/global-invariant-cycles-for-smooth-hyperplane-sections-4-1-3) and keeps the hard-Lefschetz corollaries (4.3.9)–(4.3.10) (DWP.9/orthogonal-decomposition-of-a-hyperplane-section-4-3-9).
- **rescope** (DeligneWeightsAndPurity). The integrated decomposition's node DWP.7/weights-mixed-sheaves-definitions is DWP.5 material by accepted RS-17 ('its source scope must survive relocation'), but WeilConjectures:WC.6 cites its id. This packet keeps the id as a comparison node that pins the scope (schemes of finite type over ℤ[1/ℓ]) and imports the definitions from DWP.5. Proposal: The DWP.5 blueprint (part DWP.0) plans the predicates (1.2.2)–(1.2.7) with the stabilities (1.2.5) on schemes of finite type over ℤ[1/ℓ]; once its nodes exist, DWP.7/weights-mixed-sheaves-definitions cites them, and WC.6 may cite them directly.

## Coverage

All three stages are planned: every target each stage states is a node whose prerequisite chains end
in the pinned libraries, in nodes of other packets, in requested stages of other roadmaps, in the
stages DWP.5 and DWP.6 of part DWP.0, or in the recorded gap. The remaining refinements are listed in
the packet's coverage records: the SGA 7 XXI proof (DWP.7), the finite-level justification of the
derived-category steps of 6.1.8–6.1.9 and the stacky weight spectral sequence (DWP.8), and the
replacement of the LPV.7 stage prerequisite by its node ids once LPV.7 is planned (DWP.9).

## Non-goals and boundaries

- Weil I and the projective Riemann hypothesis are DWP.2–DWP.4; this part uses only Weil II's route
  (3.3.9 covers smooth proper varieties without DWP.4).
- The local and curve weight theorems are DWP.5 and DWP.6, imported.
- Equidistribution (Weil II §3.5) and the arithmetic interfaces are DWP.10, in part DWP.0.
- The invariant-cycle theorems (Weil II 3.6, 6.2.8–6.2.12, and the §4.3 proof of 4.1.3) are LPV.7's.
- Perverse sheaves, intersection complexes, the decomposition theorem and relative hard Lefschetz
  are EDC.7's, which consumes this part.
- ℓ-adic homotopy types and weights on them (Weil II §5) form the new roadmap EllAdicHomotopyTypesAndWeights.
- The Hodge standard conjecture, the Lefschetz standard conjecture and ℓ-independence beyond the
  factors of 3.3.9 are not claimed.

## Suggested Lean file

`research/blueprint/suggested/DeligneWeightsAndPurity--DWP.7.lean` types the parts whose carriers exist
in Mathlib at the pin: `IsIntegralEnd` and its API and tests (the Frobenius-module form of integral
sheaves), `newtonCouple` on additive valuations with its API and tests, `IsGeometricallySemisimple` and
`geometricMonodromyGroup` for a representation restricted to a subgroup with their tests, Lemma 4.1.4
(`restrict_invariants_nondegenerate`), `even_finrank_of_isAlt_of_nondegenerate`, and the primitive
decomposition of a graded operator (`primitivePiece`, `iSupIndep_lefschetzDecomposition`,
`finrank_primitivePiece`, `lefschetzPairing_nondegenerate`). The declarations that need ℓ-adic sheaves,
complexes or étale cohomology are listed by name in its header. It elaborates against the pinned
Mathlib with `sorry` as its only warning.
