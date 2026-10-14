# PKG-ModularSymbolsPadicLFunctions — handoff

Refs [#9181](https://github.com/CBirkbeck/tauceti-explorer/issues/9181). Claude (Opus 5.5), session
`claude-1LrPx6`, 14 October 2026. Claim confirmed by the bot on the issue (claim comment 6160030238).
Base: `9ef586c33992381f7d36d9581d11a20f4318d583`. Branch: `claude-1LrPx6-pkg-modular-symbols`.

**Status: complete.** The package is written in full and goes to its independent review
(REV-PKG-ModularSymbolsPadicLFunctions).

## What was written

`research/blueprint/packages/ModularSymbolsPadicLFunctions/`:

- `README.md` (about 1,720 lines): summary, scope and ownership, fifteen conventions with witnesses,
  exact supplier contracts (Mathlib, pinned and current Tau Ceti, ModularForms, LocallyAnalyticDistributions,
  PadicMeasuresIwasawaAlgebras, PadicFamilies, ModularCurvesPartII), five layers with numbered
  subsections, examples and dependencies per layer, worked examples, source corrections, downstream
  consumers and references. All 63 targets of the accepted plan are present; each of the 23
  definitions and constructions has at least three Checks (77 plan tests kept, some sharpened).
- `Suggested.lean` (567 lines): light real-bodied definitions over carriers at the pins and the
  milestone statements that can be typed there; no sorry'd data. Layer 0: `P1Q`, `Delta0` and `delta0Rep`
  (Tau Ceti's augmentation subrepresentation, definitionally the current library's `degreeZero ℤ`),
  `divisor`, `symbols` (real proofs of the subgroup axioms), `Vk`, `slashPoly`, `Sigma0`, `intMatrixToGL`,
  `slashSymbol`, `heckeT`, `heckeU`, `IsSigma0Action`, `iotaMatrix`, `boundarySymbols`,
  `restrictBoundary`, `eisSymbols`, `symbolCocycle`, `cuspStabilizer`, `IsCoboundaryOn`, `IsParabolic`, the
  three exact-sequence milestones in explicit-cocycle form, and the Bézout projector of the
  Drinfeld–Manin splitting; Layer 1: `periodScalar`, `mellin_period_eq_L` (the m = 1 Mellin formula
  against Mathlib's `ModularForm.L`), `stabilisedCoeff` with the `U_p`-eigen identity; Layer 2:
  `IsGoodRefinementRoot`, `IsBadRefinement`, `boundedMoments`, `daggerMoments`, `Sigma0p`,
  `specialiseMoments`, `eulerFactorAtP`; Layer 4: `pPowerCyclotomic`, `depletedCoeff`,
  `eulerDeletionFactor`. Fourteen proved `example`s and theorems pin conventions (the T- and ι-actions
  on X, Y, Σ₀(N) membership, ι² = 1, det ι = −1, non-injectivity of restriction, the MTT factor, the
  weight-two depletion factor, Φ_n(1) = p, the Hecke-root product).
- `metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check research/blueprint/packages/ModularSymbolsPadicLFunctions/Suggested.lean`: **exit 0, 32
  warnings, all "declaration uses `sorry`", no errors and no other warnings**, in the shared build at
  Mathlib `082e2d37e8` and Tau Ceti `f790474`; 110 GB of memory available; nothing left running.
- `python3 scripts/check_sorry_data.py` on `Suggested.lean`: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note:
  0 problems.
- A scan of the README for process language (packet, job, review, node, gap, stand-in, page image):
  none.

## Sources spot-checked

The open-access PDFs of Pollack–Stevens (Numdam), Pollack's supersingular paper (author's copy of the
Duke article), Wiese (arXiv:1809.04645v1) and Bellaïche (arXiv:0912.2925v1) were downloaded to the
scratch directory and 53 labelled results located in them (22, 13, 14 and 4 respectively). All
README locators for them agree, after two corrections made here: Pollack, Proposition 2.11 is on
printed p. 531 (the plan has p. 532) and Lemma 4.6 on printed p. 538 (the plan's source issue on it
has p. 539). The located statements of Pollack–Stevens Corollary 5.4 (surjectivity of ρ*_k on
D_k-valued symbols at level Γ ∩ Γ₀(p)) and of Bellaïche's display (5) (α in the denominators of the
factors of f_β) match the README's account. No source text is reproduced in the package.

## Degenerate cases and conventions checked while writing

| Statement | Instance tried | Outcome |
| --- | --- | --- |
| Hecke operators on Symb_{Γ₀(11)}(ℤ) | T₂, T₃: boundary eigenvalue 1 + ℓ, a₂ = −2, a₃ = −1 | (x − 3)(x + 2)², (x − 4)(x + 1)² as stated |
| Dimension of H¹ and H¹_par, torsion-free Γ | free rank 1 + μ/6; Γ₁(11) k = 0; Γ₁(5) k = 0, 2; Γ₁(4) k = 1 | 2, 0, 2, 0; counting the irregular cusp gives −1 |
| Pairing V_k × Sym^k | k = 1 (⟨X, Y⟩ = 1, ⟨Y, X⟩ = −1), k = 2 (⟨XY, XY⟩ = −1/2) | matches the monomial formula |
| Period symbol normalisation | j = 0: 2πi∫_{i∞}^0 f = 2π∫_0^∞ f(iy)dy = L(f, 1) | as stated |
| Mellin, m = 1, and the Lean `mellin_period_eq_L` | Mathlib's L = Λ·2/Γ_ℂ, Λ = mellin(t ↦ f(it)) | both sides equal 2π·i^j·Λ(j + 1) |
| Interpolation sign and n = 0 factor | ±-part of formula (2); distribution relation at a = 0 | ± = (−1)^jχ(−1); factor 1 − p^j/α; k = 0 gives (1 − 1/α)² |
| Half-logarithms | constant terms 1/p; linear terms against p²T·log⁺·log⁻ = log(1 + T) and against inversion | −1/(2(p + 1)), −1/(2p(p + 1)) consistent |
| Euler deletion | [u] on χ(z)z^j multiplies by χ(u)u^j | factor 1 − a_ℓχ(ℓ)⁻¹ℓ^{−j−1} + ε(ℓ)χ(ℓ)⁻²ℓ^{k−2j−1} |
| Supersingular level 11 | p = 2: roots −1 ± i, ratio −i; p = 19: v₁₉(−19) odd | as stated |
| Drinfeld–Manin | N = 3, k = 0 (dim H¹ = 3, H¹_par = 0); ℚ² model; ℤ² obstruction | as stated |
| Diamonds | ⟨−1⟩ on V_k | (−1)^k |
| Bad-prime slope | p ‖ N, ε of conductor prime to p | a_p² = ε(p)p^k, slope k/2 |
| Lean coefficient identities | `stabilisedCoeff_eigen`, `depletedCoeff_eq` | follow from the recurrence with α + β = a_p, αβ = e |

## Decisions a reviewer should know

- **p-stabilisation moved to Layer 1, §1.3.** The plan put it in L2, but L1's lemma on L-functions of
  p-stabilised forms uses f_α; placing the construction first removes a forward reference.
- **Pollack–Stevens' lattice decomposition is planned here (§2.4).** The plan requested the
  field/lattice ordinary–nilpotent decomposition (PS Lemma 5.5, Proposition 5.6) from
  LocallyAnalyticDistributions L4. The LocallyAnalyticDistributions package (TauCetiRoadmap PR #854)
  has complete continuity, Riesz projectors, finite projective slope summands and uniqueness of slope
  decompositions, but not that lattice statement; it is now part of the §2.4 target, with its agreement
  with the slope-zero summand stated.
- **PS radius stages are built here (§2.2).** A[r], A†(ℤ_p, r), D[r], D† at real radius r (PS
  normalisation) are defined from LocallyAnalyticDistributions L0 `discAnalytic`, `LAh` and its limits;
  that package indexes stages by valuation and integer level, not by PS's radius.
- **Renamed API items** (to match the Lean prototypes): `toGLQ'` → `intMatrixToGL`,
  `iota`/`iota_mul_self` → `iotaMatrix`/`iotaMatrix_mul_self`, `bsymbols` → `boundarySymbols`,
  `bsymbolsEquivCusps` → `boundarySymbolsEquivCusps`, `res` → `restrictBoundary`, `slash` → `slashSymbol`.
- **Parabolic cohomology in the Lean** is the cocycle-level predicate `IsParabolic`, so the boundary exact
  sequence is stated without choosing a model of H¹; the README's `H1par` API is unchanged.
- **Current Tau Ceti and TauCetiRoadmap checked** (TauCeti `a91d3aaf`, TauCetiRoadmap `0d144d0`): no
  target duplicates them. The homological Layer-8 material (`degreeZero`, `divisorRep`,
  `degreeZeroGLRep`, `ModularSymbols`, `maninSymbol`, `span_maninSymbol_eq_top`, `heckeSymbol`,
  `heckeTSymbol`, `rawPairing`, `periodMap`, `periodMap_injective`, `binaryFormRep`,
  `binaryFormAdjugateRep`, `binaryFormDual`, `linearFormPow`, `cuspIntegral`, level-one
  `periodPolynomial`) is cited in Scope and ownership and in the targets that consume it. ModularForms
  Layer 8 states that it keeps group cohomology out and that the comparison 𝕄 ⊗ ℂ ≅ S ⊕ S̄ is not its
  milestone, so the cohomological Eichler–Shimura isomorphism stays here.

## Points for the maintainer (plan or supplier issues; no packet was changed)

1. **ModularCurvesPartII R14.3** (tier 11) is cited for the Ash–Stevens comparison
   Symb_Γ(V) ≅ H¹_c(Y_Γ, Ṽ) and for the full-level, higher-weight Betti and Betti–étale dictionary used to
   transport the rational Drinfeld–Manin splitting to all geometric components with complex
   conjugation and the Galois action. Its packet plans Γ₁(N) weight-two Betti inputs and relative
   coefficient systems; its package must state these two contracts, or they move into this roadmap.
2. **Move down to AutomorphicLFunctionsAndLocalFactors** (tier 12): `upstream/CaraianiNewton.md`
   lists four upward citations from it to this roadmap (AL.5 cites L1's critical-value period
   interface and L2's p-stabilisation with its twisted L-series comparison). When that roadmap is
   packaged it plans those notions, and this roadmap should then cite them there; this package keeps
   them as targets, since that roadmap has no package yet.
3. **PadicFamilies** (bundled, plan 0/1 accepted): Layer 3 is cited by its node names
   (`critical-eigenspace-dimension`, `critical-p-adic-l-function`, `refinement-criticality`,
   `decent-refinement`, `theta-exact-sequence`, `theta-critical-vanishing`, `secondary-l-functions`,
   `two-variable-l-function`); align the citations with its package's layer headings when it is written.
4. The plan's two recorded gaps appear honestly: the full-level dictionary as the R14.3 contract above,
   and the numerical examples of level 11 (PS Examples 8.6–8.7, the p = 11 power series) as
   computational certification targets in §3.4 and §4.4.

## Where to resume

Nothing remains for this job. The independent package review checks the README against
PACKAGE_REVIEW.md and re-runs `lean-check`.
