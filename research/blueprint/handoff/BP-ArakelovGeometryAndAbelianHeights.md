# Handoff: BP-ArakelovGeometryAndAbelianHeights

Issue #674. Worker: Claude (session claude-fy0qlK), 2026-10-14. First plan of the roadmap (no earlier
packet existed). Packet status `complete`: all six stages R35.1–R35.6 are `planned` at target level
(PROTOCOL.md §2), 55 nodes (9 definitions, 11 constructions, 32 theorems, 2 comparisons,
1 application), 150 API items, 80 unit tests, 21 planets, 23 baseline declarations, 5 requests,
4 gaps. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings with the declaration index.

## Structure followed

RS-06 (accepted) is binding and was followed: R35.1 narrowed to hermitian bundles, the Arakelov
degree with real/complex multiplicities, base change, the comparison with the general height
normalisation and the arithmetic intersection statements its consumers use; R35.2 narrowed to the
metric on the supplied differential lattice, with the semi-abelian e^*Ω^g versus p_*Ω^g distinction;
R35.5 narrowed to the comparison on supplied moduli objects (C4/C5, PELModuli M2/M6). The product
formula is Mathlib's (`NumberField.prod_abs_eq_one`). "ArithmeticHeights PR287" is the open
TauCetiRoadmap pull request #287 (not an atlas roadmap, so not citable as a prerequisite); its
Layer 0 owns the ℓ² tuple height, noted in `upstreamNotes`.

Tier: this roadmap is tier 16 (upstream/CaraianiNewton.md). Every cited supplier is of a lower tier
(AbelianSchemesAndArithmeticModuli 6, NeronModels 8, FiniteFlat 10, PELModuli 13,
ShimuraCompactifications 15, HeightsRationalPoints 9, SchemeAndStackFoundations 2,
AlgebraicModuli 4, ComplexComparisonPartII 5) or a Tau Ceti roadmap (EllipticCurves).

## Paper routes covered

- PAPER-YUAN-26/77, /132 → R35.2/hodge-line-of-group-scheme, faltings-hermitian-form, metrized-hodge-line, R35.3/stable-faltings-height.
- PAPER-YUAN-26/170 → R35.5/theta-height, theta-faltings-comparison; R35.6/moduli-point-finiteness (ℚ̄-classes over fields of bounded degree; the passage to curves by Torelli stays with the consumer).
- PAPER-ZHANG-21/73, /76 → R35.1/arithmetic-divisors-green (regular flat, possibly non-proper, S-localized ĈH¹) and arithmetic-degree-pairing (ℝ_S-valued pairing with proper 1-cycles). This is the explicit extension of R35.1 the paper review asked for; the GSpin and unitary cycle Part II designs import it.
- PAPER-TSIMERMAN-18 (hodge-line, stable-faltings-height, height-section-independence, height-field-independence, bost-lower-bound, cm-height-metric-normalization) → R35.2/metrized-hodge-line, normalization-adapter; R35.3; R35.6/faltings-height-lower-bound.
- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/arithmetic-cm-degree → R35.1/stack-weighted-degree; /faltings-height → R35.2/R35.3 with the unscaled-metric adapter.
- PAPER-YUAN-ZHANG-18 (faltings-height, component-line, pairing-metric, hodge-polynomial-sequence, hodge-polynomial-quotient, selfdual-height) → R35.2/pairing-metric, R35.4/component-line-height, component-isogeny-formula (generic O_E-isogeny formula under local freeness), cm-hodge-filtration-local. rev-kernel-of-the-dual-isogeny is AbelianSchemes A3/dual-isogeny-and-cartier-kernel. The ramified-prime determinant convention of the erratum's Proposition 6 (τ-quotients with torsion) is not settled here; the CM Part II design owns it.

## Consumer requests answered

- FaltingsFinitenessAndIsogenyTheorems R35.1–R35.4 requests: arithmetic-degree, degree-base-change, sup-metric-height-comparison; hodge-line-of-group-scheme, faltings-hermitian-form, relative-faltings-metric, isogeny-pullback-norm; faltings-height, field-extension-comparison, model-and-polarization-independence; isogeny-height-formula. Correction for R28: its R35.1 request compares deg ρ_x^*O(1) with `[K:ℚ]·Projectivization.logHeight x`, but Mathlib's height over K is already relative; the identity (sup metric) is deg = `Height.logHeight x` with no factor.
- GrossZagierAndArithmeticHeights GZ.0/GZ.2 (hermitian ℚ-lines, Green arithmetic divisors, finite/infinite degrees, product formula): arakelov-divisors-of-number-field, norm-and-rational-lines, arithmetic-divisors-green, arithmetic-degree-pairing.
- HilbertModularVarietiesAndShimuraCurves R18.2 (hermitian rational lines, degree, norm descent): norm-and-rational-lines.
- AbelianVarietiesIsogenousToNoJacobian (R35.3 stable height laws; R35.4 inequality): stable-faltings-height, stable-height-properties, isogeny-height-bounds.
- EllipticModularityEffectiveComparisons EC.5 (|h_F(E) − h_F(E_1)| ≤ ½ log p; h_F(E) ≤ h(j)/12 + 3): isogeny-height-bounds (iv), elliptic-j-height-bound.

## Moves down (record for the R28 plan)

RS-06 makes R35 the owner of material the accepted R28 packet still plans. R35 now plans it; the
R28 nodes should be re-pointed (also in this packet's `restructure`):
R28.1/semiabelian-scheme-and-its-hodge-line-bundle → R35.2/hodge-line-of-group-scheme + faltings-hermitian-form;
R28.1/faltings-modular-height-of-a-semiabelian-model → R35.3/faltings-height;
R28.1/metric-with-logarithmic-singularities-along-a-closed-subvariety → R35.5/log-singular-metric;
R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary → R35.5/hodge-metric-log-singularities;
R28.1/northcott-property-for-heights-from-log-singular-metrics → R35.5/log-singular-heights;
R28.1/commensurability-of-the-modular-and-hodge-line-bundles → R35.5/modular-height-equals-faltings-height (with e = 1 on the integral minimal compactification);
R28.2/height-change-under-an-isogeny-of-semiabelian-models → R35.4/isogeny-height-formula;
R28.2/bounded-denominators-of-height-differences-under-isogeny → R35.4/isogeny-height-bounds.
Zarhin's trick (no atlas owner found) is planned here as R35.6/zarhin-trick, with Moret-Bailly's free proof.

## Requests made

- ShimuraCompactifications C5: the level-one Siegel instance over ℤ (toroidal compactifications of 𝔄_g with universal semi-abelian scheme, coarse minimal compactification, ample L with π^*L = ω̄^{⊗m}).
- AbelianSchemesAndArithmeticModuli A3: Mumford's symmetric theta structures and theta embeddings.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1: length ω_𝒢 + length ω_{𝒢^D} = v(#𝒢) without e ≤ p − 1.
- NeronModelsAndSemistableAbelianVarieties R11.3: non-isomorphism on Lie algebras of the base-change map at non-semistable primes.
- Tau Ceti EllipticCurves Layer 4.5a: minimal discriminant ideals and the transformation rule of Δ.

## Gaps

G1 Bost's sharp lower bound (source not free; existence and an effective bound are planned).
G2 Silverman's elliptic formulas (not free; the Faltings-height formula is derived independently and
checked numerically against LMFDB for 11.a2: −0.3080098; the Faisant–Philibert input to
Gaudron–Rémond's constant is quoted). G3 Raynaud's duality of differents without semistability
(Bégueri/Greenberg machinery, planned nowhere; stable-height consumers only need the semistable
case). G4 freeness of H¹_dR of a CM abelian scheme over O_σ ⊗ O_E (Colmez, Lemme II.1.2; owner: the
CM Part II design).

## Suggested Lean file

`research/blueprint/suggested/ArakelovGeometryAndAbelianHeights.lean` (Mathlib imports only)
elaborates with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: 0 errors, the only warnings are
`declaration uses 'sorry'`. `scripts/check_sorry_data.py` passes (no sorry'd data). It types Arakelov
divisors of a number field (an `abbrev` over Mathlib's fractional ideals and infinite places), their
degree, principal divisors, Pic^, the divisor of a point of ℙⁿ with the sup metric and the theorem
that its degree is `Height.logHeight`, the Faltings norm of `dz` on ℂ/Λ as a covolume, the elliptic
archimedean term |Δ(τ)|(Im τ)^6 with `ModularForm.discriminant`, and the one-variable model of a
logarithmic singularity. Everything else is listed in the closing comment as README targets (their
carriers — abelian schemes over 𝓞 K, Néron models, complex points of schemes, compactified moduli —
are not at the pins).

## Sources read

Deligne (Bourbaki 616, numdam), Faltings 1983 ×2 (GDZ), Faltings–Chai Ch. I §5–6 and Ch. V §§3–4
(maintainer-cleared copy), Raynaud (Astérisque 127 VII, numdam), Szpiro (Astérisque 127 I, numdam),
Gillet–Soulé (numdam), Bost Bourbaki 795 (numdam), Moret-Bailly Pinceaux Ch. IX (numdam),
Gaudron–Rémond 2014 (arXiv 1105.1230v1) and Duke 2014 (author copy), Pazuki (arXiv 0907.1458v2),
Bilu–Parent–Rebolledo (AIF), Yuan–Zhang (arXiv v3 with the 2021 erratum), Tsimerman (arXiv v5),
AGHMP (arXiv v3), Zhang AFL (arXiv v3), Yuan (arXiv v4). URLs and SHA-256 are in the packet.
Missing (not free): Bost's Duke 1996 paper, Bost–Gillet–Soulé (JAMS 1994), Silverman's "Heights and
elliptic curves", the December 2022 revision of the Yuan–Zhang erratum.

## What a follow-up should do

At lemma level (when the roadmap nears formalisation): split the hermitian linear algebra of R35.1,
the moving lemma for the pairing with one-cycles, and Pazuki's proof of the theta comparison; settle
the requests above; and decide with the CM Part II design the ramified-prime determinant convention
for τ-quotients.
