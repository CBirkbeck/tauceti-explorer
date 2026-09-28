# Overconvergent Hilbert modular forms — part O0: Hilbert weights

Part O0 of the blueprint for `OverconvergentAutomorphicForms` covers stages O0–O7. This first checkpoint plans the
weight-space part of **O0** from Birkbeck–Heuer–Williams (BHW), *Overconvergent Hilbert modular forms via perfectoid
modular varieties*, Ann. Inst. Fourier 73 (2023) 1709–1794, §6.1 and §9. Stages O1–O7 are not yet read.

## Purpose

Overconvergent Hilbert modular forms of weight κ are sections of sheaves built from a character κ of the torus
T(ℤ_p) = (𝒪_F ⊗ ℤ_p)^×, analytically continued to a neighbourhood of 𝒪_p^× so that the factor κ(cz + d) makes sense on
the anticanonical tower. O0 supplies:
- the weights for G* = Res_{F/ℚ} GL_2 restricted to rational determinant, and for G;
- the map ρ between them;
- the radius parameter;
- analytic continuation.

## Prerequisites and boundaries

- **PadicMeasuresIwasawaAlgebras L0a** constructs the rigid character spaces. O0 requests them for G = 𝒪_p^× and
  G = 𝒪_p^× × ℤ_p^×, with bounded families and pullback along ι.
- **LocallyAnalyticDistributions L0** supplies Banach spaces of functions analytic on residue balls. O0 requests a
  radius of analyticity for characters, uniform over an affinoid family.
- Neither supplier stage is decomposed yet. O0 plans the Hilbert-specific content at the level of points, where
  the pinned Mathlib suffices, and cites the two stages for the rest.
- O0 does not construct the sheaves (O1), the automorphy factors (O2) or the Hodge–Tate period map (PerfectoidShimuraVarieties).

## Pinned conventions

- 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F with the ℤ_p-module topology, and T(ℤ_p) := 𝒪_p^×. p may be ramified or inert in F.
- A weight is a continuous character, never assumed algebraic or analytic.
- **The weight map** is pullback along ι(x) = (x², N(x)^{-1}), so that ρ(w, t) = w²·(t^{-1} ∘ N) as BHW display it. The
  printed group map x ↦ (x², N(x)) lacks the inversion (source issue E1); the displayed formula is the one BHW use
  later, in (9.1).
- **The radius parameter** |T_κ| is a supremum over the pro-p subgroup 1 + p^{r₀}𝒪_p (r₀ = 1 for p odd, 3 for p = 2).
  BHW's supremum over all of 𝒪_p^× equals 1 for every weight nontrivial on the prime-to-p torsion (source issue E2).

## What Mathlib supplies

`TensorProduct`, `NumberField.RingOfIntegers`, `PadicInt` (compact), base change of finite free modules,
`moduleTopology` with `IsModuleTopology.isTopologicalRing`, `Algebra.norm` with `LinearMap.det_baseChange`,
`ContinuousMonoidHom` with its projections and composition, and the norm facts `NumberField.isUnit_iff_norm` and
`Algebra.norm_eq_prod_embeddings`.

## What is missing

Everything below is new. The pinned libraries have no 𝒪_F ⊗ ℤ_p, no Hilbert weights and no radius parameter.

## Milestones

Library module: `TauCeti/NumberTheory/HilbertModularForms/Weights`, namespace `TauCeti.HilbertWeight`.

### Milestone 1: units at p

**Object: units at p** (`Op`, a definition; node `units-at-p`). 𝒪_p := ℤ_p ⊗_ℤ 𝒪_F. It is:
- a finite free ℤ_p-algebra of rank [F:ℚ];
- a compact topological ring for the module topology.

Its units are T(ℤ_p).

*API.* `compactSpace_Op`, `finrank_Op`, and `unitsToOp : 𝒪_F^× → 𝒪_p^×`.

*Unit tests.*
- 𝒪_p ≅ ℤ_p for F = ℚ.
- 𝒪_p is not discrete.
- For F = ℚ(i) and p = 5, 𝒪_p ≅ ℤ_5 × ℤ_5.

**Construction: the norm at p** (`normUnits`; node `norm-at-p`). N := Algebra.norm ℤ_p on units: a continuous
homomorphism 𝒪_p^× → ℤ_p^× with N(1 ⊗ a) = N_{F/ℚ}(a) (`LinearMap.det_baseChange`).

*API.* `continuous_normUnits`, `norm_tmul_one` and `normUnits_unitsToOp`.

*Unit tests.*
- N is the identity for F = ℚ.
- N(−1) = (−1)^{[F:ℚ]}.
- N is nontrivial when [F:ℚ] is odd.

**Construction: principal units** (`principalUnits`; node `principal-units`). H_r := 1 + p^r𝒪_p is an open subgroup of
finite index, pro-p for r ≥ 1, and H_0 = 𝒪_p^×.

*API.* `isOpen_principalUnits`, `finiteIndex_principalUnits` and `principalUnits_antitone`.

*Unit tests.*
- H_0 = 𝒪_p^×.
- For F = ℚ and p odd, H_1 = 1 + pℤ_p has index p − 1.
- A nontrivial (p−1)-st root of unity is not in H_1.

### Milestone 2: weights and the weight map

**Object: geometric Hilbert weights** (`GeomWeight`, a definition; node `geometric-weight-characters`; planet "Hilbert
weight space for G*"). For a topological commutative ring R, GeomWeight F p R := ContinuousMonoidHom 𝒪_p^× R^×. These
are the R-points of BHW's 𝒲* = Spf(ℤ_p⟦T(ℤ_p)⟧)^an_η × L (Definition 6.1(ii)); the space itself is L0a's.

*API.* The pointwise group structure, functoriality in R, and the map ρ below.

*Unit tests.*
- The trivial character.
- The norm character x ↦ N(x).
- For F = ℚ, the continuous characters of ℤ_p^×.

A discontinuous homomorphism is not a weight.

**Object: arithmetic Hilbert weights** (`ArithWeight`, a definition; node `arithmetic-weight-characters`; planet "Hilbert
weight space for G"). These are the continuous characters of 𝒪_p^× × ℤ_p^×. Each is uniquely a pair (w, t), via
`ArithWeight.mk`, with (mk w t)(x, y) = w(x)t(y) (BHW Definition 6.1(i)).

*API.* `ArithWeight.mk`, `ArithWeight.bijective_mk` and `ArithWeight.mk_apply`.

*Unit tests.*
- mk 1 1 = 1.
- For F = ℚ, pairs of characters of ℤ_p^×.
- Injectivity of mk.

**Construction: the dual group map** (`weightDualMap`; node `weight-dual-group-map`). ι(x) = (x², N(x)^{-1}), a continuous
homomorphism.

*API.* `weightDualMap_apply` and `weightDualMap_unitsToOp`: on a totally positive unit of a totally real F,
ι(η) = (η², 1).

*Unit tests.*
- ι(x) = (x², x^{-1}) for F = ℚ.
- ι(1) = (1, 1).
- ι differs from BHW's printed x ↦ (x², N(x)), e.g. for F = ℚ, p = 5.

**Construction: the weight map** (`weightMap`; node `weight-comparison`; planet "Weight map ρ"). ρ(κ) := κ ∘ ι. It is
natural in R and a group homomorphism (`weightMap_mul`).

*Unit tests.*
- ρ(w, 1) = w².
- ρ(1, t) = t^{-1} ∘ N.
- For F = ℚ, ρ(w, t)(x) = w(x)²t(x)^{-1}.

**Lemma: the formula for ρ** (`weightMap_mk_apply`; node `weight-comparison-formula`). ρ(mk w t)(x) = w(x)²·t(N(x))^{-1}.
This is BHW's displayed κ = w²·(t^{-1} ∘ N_{F/ℚ}).

**Lemma: the norm factor** (`weightMap_mk_mul_inv_sq`; node `weight-comparison-norm-factor`).
κ(x)·w(x)^{-2} = t(N(x))^{-1}: "κ(x)·w(x^{-2}) factors through some power of the norm".

**Lemma: totally positive units** (`weightMap_mk_totallyPositive`; node `weight-comparison-totally-positive-units`). For F
totally real and η ∈ 𝒪_F^{×,+}, κ^{-1}(η)w(η²) = t(N_{F/ℚ}(η)) = 1. This is BHW (9.1).

*Proof.* A totally positive unit has N_{F/ℚ}(η) = ±1 (`NumberField.isUnit_iff_norm`), and N_{F/ℚ}(η) = ∏σ(η) > 0
(`Algebra.norm_eq_prod_embeddings`). Total positivity is needed: η = −1 with [F:ℚ] odd gives t(−1).

### Milestone 3: boundedness and analytic continuation

**Construction: the radius parameter** (`radiusParameter`; node `weight-radius-parameter`). For a normed ring A,
|T_κ| := sup over H_{r₀} of ‖κ(x) − 1‖.

*API.* `radiusParameter_one`, `radiusParameter_nonneg` and `radiusParameter_lt_one`.

*Unit tests.*
- |T_1| = 0.
- For F = ℚ, p odd and the Teichmüller character ω, |T_ω| = 0; BHW's printed supremum gives 1.
- For F = ℚ, p odd, |T_{x^k}| = |pk|_p.

**Lemma: continuous characters into uniform Banach algebras are bounded** (`radiusParameter_lt_one`; node
`continuous-character-bounded`). If A is a complete, ultrametric normed ℚ_p-algebra with power-multiplicative norm,
then every continuous character has |T_κ| < 1.

*Proof.* If ‖κ(x) − 1‖ ≥ 1, the binomial expansion gives ‖κ(x)^{p^n} − 1‖ ≥ 1 for all n, contradicting continuity at
x^{p^n} → 1. Compactness of H_{r₀} then bounds the supremum below 1. At the level of coefficients, this is "an affinoid
image is bounded"; unbounded families need non-affinoid bases U.

**Theorem: analytic continuation of bounded weights** (node `analytic-continuation-of-bounded-weights`; planet "Analytic
continuation of weights"; BHW Proposition 6.3). A bounded smooth weight κ : U → 𝒲* extends uniquely to
κ^an : B_r(𝒪_p^× : 1) × U → Ĝ_m for 0 < r ≤ r_κ, with r_κ > 0 depending only on p and |T_κ|. Equivalently, κ is analytic
on residue balls of radius r with values in O^+(U).

*Proof.*
1. Reduce to affinoid U.
2. Over a finite Galois extension splitting F, apply the elliptic continuation (Buzzard, Proposition 8.3) coordinatewise,
   with L0's uniform radius.
3. Descend by Galois.
4. Uniqueness follows from the identity theorem on each residue ball.

BHW print r_κ = |p|^{r₀}|T_κ|, citing AIP Proposition 2.8, which was not read. That value vanishes at the trivial
weight, so it is recorded, not used. There is no Lean signature until L0 supplies its Banach spaces.

## Mistakes in the source

- **E1 (misprint).** In Definition 6.1, the group map defining ρ should be x ↦ (x², N(x)^{-1}).
- **E2 (error, a stated result).** The criterion "bounded iff |T_κ| < 1", with the supremum over all of 𝒪_p^× (p. 1757),
  fails for the Teichmüller character. The same |T_κ| gives ε_κ = 0 in Definitions 4.5(3) and 7.7.
  - Correction: take the supremum over a pro-p subgroup, as AIP's T = κ(q) − 1 does.

## Remaining work in O0 and beyond

- **O0:**
  - finite-rank analytic coefficient modules and locally analytic induced modules on compact opens of Levi and
    parabolic groups, with tensor products, duals and specialisation to algebraic representations;
  - bounded families over non-affinoid bases, once L0a exists;
  - a verified radius.
- **O1–O7:** not yet read.

## Sources

- C. Birkbeck, B. Heuer, C. Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Ann. Inst.
  Fourier 73 (2023) 1709–1794, DOI 10.5802/aif.3560 (open access). Read: §3.2, §4 Definition 4.5, §5.3 Definition 5.17,
  §6.1, §7 Definition 7.7 and §9 Lemma 9.2, with formulas checked on page images.
- arXiv:1902.03985v4, whose TeX source was compared with the journal text.
