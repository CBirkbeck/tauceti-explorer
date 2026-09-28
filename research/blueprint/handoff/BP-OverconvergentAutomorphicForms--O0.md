# BP-OverconvergentAutomorphicForms--O0: Hilbert weights (first checkpoint)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #1016. **Status: partial checkpoint.** Scope O0–O7. O0 is `partial`; O1–O7 are `not_read`.

## What this checkpoint contains

13 nodes, all in O0. Four are planets: the two weight spaces, the weight map ρ, and analytic continuation.

| Node | Kind | Content |
| --- | --- | --- |
| `units-at-p` | definition | 𝒪_p = ℤ_p ⊗ 𝒪_F with module topology |
| `norm-at-p` | construction | N : 𝒪_p^× → ℤ_p^× |
| `principal-units` | construction | H_r = 1 + p^r𝒪_p |
| `geometric-weight-characters` | definition | continuous characters of 𝒪_p^× (points of 𝒲*) |
| `arithmetic-weight-characters` | definition | continuous characters of 𝒪_p^× × ℤ_p^× (points of 𝒲) |
| `weight-dual-group-map` | construction | ι(x) = (x², N(x)^{-1}) |
| `weight-comparison` | construction | ρ = pullback along ι |
| `weight-comparison-formula` | lemma | ρ(w, t) = w²·(t^{-1} ∘ N) |
| `weight-comparison-norm-factor` | lemma | κ·w^{-2} = t^{-1} ∘ N |
| `weight-comparison-totally-positive-units` | lemma | BHW (9.1) |
| `weight-radius-parameter` | construction | |T_κ| over the pro-p subgroup H_{r₀} |
| `continuous-character-bounded` | lemma | |T_κ| < 1 over uniform ultrametric Banach ℚ_p-algebras |
| `analytic-continuation-of-bounded-weights` | theorem | BHW Proposition 6.3, with an existential radius |

**Requests** (neither supplier stage is decomposed yet):
- **PadicMeasuresIwasawaAlgebras L0a:** the rigid character spaces for 𝒪_p^× and 𝒪_p^× × ℤ_p^×, bounded families, and pullback along ι.
- **LocallyAnalyticDistributions L0:** the radius of analyticity.

**Ownership check for a later restructure.** No existing roadmap or library defines 𝒪_F ⊗ ℤ_p or its norm. O0 defines them as the most foundational consumer found. HilbertModularVarieties H4 or AutomorphicBundles might also need them.

## Source mistakes (BHW, Ann. Inst. Fourier 73 (2023))

- **E1 (misprint, affects nothing).** Definition 6.1 defines ρ through x ↦ (x², N(x)), whose pullback is w²·(t∘N). The displayed κ = w²·(t^{-1}∘N), used again after Definition 6.2 and in (9.1), needs x ↦ (x², N(x)^{-1}).
- **E2 (error, a stated result).** |T_κ| := sup over 𝒪_p^× × U of |κ − 1| (p. 1757; likewise Definition 4.5(3), p. 1737, and Definition 7.7, p. 1761) equals 1 for every weight nontrivial on the prime-to-p torsion. For example, take the Teichmüller character for F = ℚ and p odd.
  - So "bounded iff |T_κ| < 1" is false, and ε_κ = 0, contradicting "0 < ε_κ".
  - Correction: take the supremum over a pro-p subgroup, as AIP's coordinate T = κ(q) − 1 in Definition 4.5(1) is.

Both were checked on page images of the journal PDF; the arXiv v4 source has the same text. The Centre Mersenne article page lists no erratum.

**Not recorded as an error:** the printed radius r_κ = |p|^{r₀}|T_κ| of Proposition 6.3 vanishes at the trivial weight. That weakens the statement but does not falsify it. It must be compared with AIP Proposition 2.8, which was not read, before ε^def_κ is fixed from it.

## Prototype

`suggested/OverconvergentAutomorphicForms--O0.lean` contains:
- the signatures of the eleven expressible nodes, with their API and unit-test examples;
- no signature for the analytic continuation theorem, which needs L0's Banach spaces and the adic thickenings.

Compiled at the pins with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans (one compile at a time, at least 20 GB free, no lake): **0 errors**, 27 `sorry` warnings and no other warnings.

## Checks

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files`: no problems.

## Next steps

1. **O0:**
   - finite-rank analytic coefficient modules and locally analytic induced modules on compact opens of Levi and parabolic groups (tensor, dual, algebraic specialisation);
   - bounded families over non-affinoid U, once L0a exists;
   - the radius, checked against AIP Proposition 2.8 and L0.
2. **O1:** the equivariant sheaf from a torsor and an analytic cocycle. It needs AutomorphicBundles B0 and PerfectoidSpaces P9.
3. **O2–O7** in order. The unreviewed EXT-12 draft (`research/expansion/external/EXT-12/OverconvergentAutomorphicForms.json`) has leads for all of them.
