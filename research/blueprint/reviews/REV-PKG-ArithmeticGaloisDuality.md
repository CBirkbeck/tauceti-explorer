# REV-PKG-ArithmeticGaloisDuality — fixing review

Reviewer: `independent-review-REV-PKG-ArithmeticGaloisDuality` (Claude, session `claude-2nfoIZ`),
12 October 2026, issue #8894. The package was written by session `claude-cEOcoh`
(`research/blueprint/handoff/PKG-ArithmeticGaloisDuality.md`, PR #9333); this reviewer did none of
that job. Method: `research/blueprint/PACKAGE_REVIEW.md` (one fixing review). Everything found was
fixed in place in `README.md` and `Suggested.lean`; nothing blocking remains.

Verdict: **accepted** (`review.json`). With the fixes below the package is ready for the draft PR.

## What was checked

1. **Upstream form.** The README has the TauCetiRoadmap shape (compared with the current
   `ProfiniteCohomology`, `LocalGaloisGroups` and `ProfiniteArithmetic` READMEs): opening
   `**Summary.**` with the layer table, *Scope and ownership*, *Conventions*, *Exact supplier
   contracts*, *How to read the build*, Layers R02.1, R02.2, R02.3, R02.4, D7, R02.5, D8, R02.6 with
   `###` prose subsections, `**Checks.**` lists, per-layer *Examples* and *Dependencies*, then
   *Worked examples*, *Downstream consumers* and *References*. No target tables or field lists.
   `metadata.toml` is `topic = "math.NT"`, which fits.
2. **Fidelity to the plan.** All 125 node titles of `packets/ArithmeticGaloisDuality.json` were
   matched verbatim to README targets by script. After the review the README has 129 targets: the
   plan's 125, less one plan target now cited from a lower-tier package (below), plus the four
   function-field class-field targets and *Grothendieck local duality for a complete Noetherian local
   ring* that the packager added under the tier rule. Every definition and construction has at least
   three Checks. The packager's documented plan corrections (handoff) were re-derived and agree.
3. **Own words.** A 10-word-shingle comparison of the README with the texts of Milne (*ADT*), NSW
   2.3, Nekovář, Rubin, DDT, Khare–Wintenberger II, Conrad, Jannsen, Nakamura and BCGNT found only
   titles, bibliographic strings, section-number runs and stock phrases. No passage, no
   section-by-section summary.
4. **Process residue.** None (grep for packet, plan, review, job, checkpoint, coverage, handoff,
   swarm, atlas, tier, catalogue, stand-in, lean-check).
5. **Suggested.lean.** `lean-check` before the review: exit 0, 35 `declaration uses sorry` warnings,
   nothing else. After the review: exit 0, 35 `sorry` warnings, nothing else; 637 lines, sha256
   `df4f407b14b62150…`. Shape: real-bodied light definitions only (towers, `lim`, `lim¹`, the
   Mittag-Leffler predicate as Mathlib's, morphisms of towers and `limOneMap`, `HomPt` with its
   product topology, `Sections`, `IsUnramifiedOutside`, `maxUnramifiedOutside`, `galoisGroupS`,
   `exponentTwoField`, `absoluteSha`, the restricted product `Pʳ_S`, `beta`, `sha`, `eulerChar`,
   `archFactor`, `actionSpan`, `IsAdmissible`, `IsIndAdmissible`, the compact-support fibre,
   `traceZero`, `firstOrderLift`); no `sorry` inside any definition (checked by script). Every
   declaration was checked against its README statement (degenerate cases and hypotheses below);
   every Lean declaration is now named in the README.
6. **intake.** `python3 research/blueprint/intake.py check-files` on the three package files: 0
   problems.
7. **Duplication.** Against current TauCetiRoadmap main (all roadmaps, including the nine newer than
   the atlas snapshot and `Completed/`) and current Tau Ceti a91d3aaf, by object as well as by name
   (Poitou–Tate, `lim¹`, Hochschild–Serre, restricted ramification, Greenberg–Wiles, trace pairing,
   first-order lifts, factor sets, class formations, inner conjugation, Sylow detection, restricted
   products and their duality); and against the lower-tier atlas packages it cites
   (ArithmeticGaloisRepresentations t7, InverseGalois t6, AbelianSchemesAndArithmeticModuli t6,
   AlgebraicModuli t4, SchemeAndStackFoundations t2, IntegralHecke t3). Results and removals below.
8. **Supplier layers.** Every TauCetiRoadmap layer citation was checked against the current
   roadmaps, and every atlas citation against the lower packages (a Sonnet helper produced the
   inventory; each mismatch was confirmed by reading the cited section).

## Fixes made

**Mathematics (adversarial pass).**

- *Rationalisation of lattice cohomology* claimed that `Hⁱ(G, T)` has no nonzero divisible
  elements for every profinite `G`. False: for `G = ∏_{j≥1} ℤ/pʲ`, `T = ℤ_p`, `i = 2`, the elements
  divisible by every `pⁿ` form `lim¹ Hom_cts(G, ℤ/pⁿ)`, nonzero (countable, non-Mittag-Leffler
  tower). Restated: rationalisation in general; no nonzero divisible *subgroup* in general
  (Jannsen, Corollary 4.9 and Remark 4.14(b)); no nonzero divisible elements when the
  `H^{i−1}(G, T/pⁿT)` are finite. The counterexample is a new negative-control Check.
- *Poitou–Tate duality*: the explicit cochain formula `(α_v ∪ β′_v) − ε_v` is not a cocycle under
  the Leibniz rule ProfiniteCohomology fixes (`d(α_v ∪ β′_v) = −α_v ∪ α′_v`). Corrected to
  `(β_v ∪ α′_v) − ε_v`, with the sign computation and a note that Milne (p. 65) uses another
  convention.
- *Roots after prescribed totally real base change*: the statement asserts `m`-th roots for every
  `m`, but the sketch killed the obstruction only for `m = 2` and left `Ш²(FM, ℤ/m)` open. Replaced
  by BCGNT's argument (Lemma 5.3.3, p. 56): induction on the prime factors of `m`; for `m` prime,
  restriction to `F(μ_m)` (degree dividing `m − 1`) is injective on `H²(·, ℤ/m)` and lands in
  `Br[m]`. *Character roots and local Brauer obstructions* now states that `Ш²(F, ℤ/m) = 0` for `m`
  prime, with a new Check that composite `m` can carry a global obstruction (`16` over `ℚ(√7)`,
  `m = 8`, computed at every place).
- *Nakamura cochain tensor comparisons*: claimed a perfect model of `C_cts(G_{ℚ,Σ}, ρ)` in general;
  for `p = 2` the real place makes it unbounded. Perfectness is now stated where it holds (`G_{ℚ_ℓ}`;
  `G_{ℚ,Σ}` for `p` odd) and is otherwise a hypothesis, as in Nakamura's Lemma B.31.
- *Inflation–restriction for compact and rational coefficients* (the packager's flagged point): the
  towers `((T/pᵐT)^H)_m` need not have surjective transitions; the sketch now passes to stable images
  before applying Tate's theorem.
- `isIndAdmissible_of_isAdmissible` (Lean) assumed `Module.Finite R M`, narrower than the README's
  "admissible modules are ind-admissible", which is true in general (the cyclic submodule
  `A_M · m`); the hypothesis was dropped.
- Wording: function-field restricted ramification ("every `n` prime to `ℓ` lies in `P`" → every
  prime, `ℓ` included); all-place Sha duality now states both transfer adjunctions, matching its
  Check.

**Duplication and suppliers.**

- *Chebotarev density for global function fields* (a target the packager added from
  FunctionFieldArithmetic FA.5) duplicated ArithmeticGaloisRepresentations Layer 5
  `functionField_chebotarev` (tier 7, moved down from the same FA.5). Removed; every use cites AGR.
- *H¹(SL₂(F), End⁰) vanishes* (plan node `R02.6/sl2-adjoint-h1-vanishing`) is contained in
  ArithmeticGaloisRepresentations Layer 7, §7.7 `ResidualImage.h1_SL2_adZero` (which also records the
  `𝔽₅` exception). Removed; *The group-theoretic input to Taylor–Wiles primes* cites AGR.
- *Tate vanishing for trivial Q/Z coefficients*: the number-field case is AGR Layer 7
  `tate_h2_qz_eq_zero`, now cited; the target is kept for global function fields and the finite form,
  saying so in one clause.
- *Trace-zero adjoint duality without division by n*: the adjoint, `ad⁰`, `ad/k·1` and the perfect
  trace pairing are AGR Layer 7, §7.2; now cited, the target keeping the restricted-pairing criterion
  and the boundary `δ`.
- *Continuous topology on factor-set extensions*: its four API items duplicated current Tau Ceti
  (`FactorSet.Extension.homeomorphProd`, `isTopologicalGroup`, `continuous_canonicalSection`,
  `continuous_rescaleEquiv`, `ProfiniteGroupExtension.ofFactorSet`); these are cited and the target
  is now the class of the factor set in `continuousCohomology 2`, with a computed `ℤ/4` Check.
- *Localisation maps*: triviality of inner conjugation in every degree was attributed to
  ProfiniteCohomology Layer 6, which does not contain it (Layer 2 has degrees `≤ 2`); it is current
  Tau Ceti `TauCeti.ContinuousCohomology.map_eq_id_of_inner`, now cited.
- Stale supplier ids: AlgebraicModuli "R09.4 *Relative dual abelian scheme*" is not in that package;
  the dual abelian scheme is AbelianSchemesAndArithmeticModuli Layer A2, §A2.2 (`AbelianScheme.dual`),
  and the gerbe classification is AlgebraicModuli Layer 4, §4.20 (`gerbeClass`). AGR "R01.2"/"R01.4"
  became its Layer 2, §2.1 (`decompositionGroup`, `localEmbeddingMap`, `localRestriction`), Layer 4,
  §4.4 (`dickson_classification`) and §4.7 (`charTwo_residual_image`, which contains the
  characteristic-two vanishing `H¹(SL₂(F₀), M₂(F)) = 0` that the dyadic target needs).
- ProfiniteCohomology layer numbers: the all-degree long exact sequence is Layer 10 (Layer 5 stops
  at degree two), all-degree cup products Layer 12 (Layer 8 is `p + q ≤ 2`), conjugation Layers 2, 6
  and 10; corrected in the scope, the supplier contracts and seven *Needs* lines.
  ClassFieldTheory Layer 5 is now cited only for finite residue fields in the Witt sequence.
- *Downstream consumers* listed two lower-tier roadmaps (ArithmeticGaloisRepresentations,
  EnhancedDerivedSheaves) that this roadmap builds on; removed.
- Current Tau Ceti's `TauCeti.ClassFieldTheory.ClassFormation` is named as the structure *P-class
  formations* builds on.

**Locators.** NSW: nine "(PDF p. N)" parentheticals were wrong (the offset drifts from 14 to 17 in
Chapters I–II); corrected from the page headers of the electronic edition 2.3. Milne: Lemma 4.12
starts on p. 58, so two citations became pp. 58–59. All Lean declarations are now named in their
targets.

## Adversarial mathematics pass

Every theorem, definition and Check was read. The table lists the instances computed; "ok" means the
statement and its Checks survive the instance.

| Statement | Instances tried | Result |
| --- | --- | --- |
| `lim`, `lim¹`, Mittag-Leffler | `ℤ/p^{n+1} ↠ ℤ/pⁿ`; `×p` tower (`lim¹ = ℤ_p/ℤ`); zero transitions; `pⁿℤ_p` inclusions (`lim¹ = 0`, not ML) | ok |
| Milnor sequence | `K_n = [ℤ → ℤ/pⁿ]` | ok |
| Rationalisation | `G = ∏ ℤ/pʲ`, `T = ℤ_p`, `i = 2` | **false as stated; fixed** |
| Lifting / lattice / torsion of `H¹(T)` | `ℝ → ℝ/ℤ`; `n ↦ p^{−n}` on `ℕ`; `ℤ_p` acting via `1 + p` | ok |
| Pointwise Hom, splitting torsor, connecting map | `⊕_ℕ 𝔽₂`; `𝔽₂^ℕ` acting on `𝔽₂ ⊕ ⊕𝔽₂`; `ℤ/2` on `𝔽₂²` (computed `γ`, `∂`) | ok |
| Factor sets, Schreier | `ℤ/4` class; discontinuous `φ(g)φ(h)`; automorphisms of `ℤ/4` | ok (target rescoped) |
| Unbalanced products | sign at `i = 3`; sum over `Θ` vs `Δ` | ok |
| Double-complex SS | one row / one column / acyclic square, filtration | ok |
| Hochschild–Serre, degeneration, `d₂ = −u∪` | `ℤ/4 ⊃ 2ℤ/4`, `𝔽₂`; `C₂ × C₂` (dim `n + 1`); `Ẑ`, `H = 1`, `A = ℤ` (torsion needed) | ok |
| Transgression and norm | `2 + √2` over `ℚ(√2)` (cuts out `ℚ(ζ₁₆)⁺`) | ok |
| Laurent residues, Witt | `K^×/K^{×m}`; algebraically closed / finite `k`; Artin–Schreier | ok |
| `G_{K,S}`, Hermite, `H¹` finiteness | `S = {∞}` (Minkowski), `{2, ∞}` (fields of disc. `−4, 8, −8`); `ℚ₂/ℤ₂` coefficients | ok |
| Localisation maps | `Ĥ⁰(ℤ/2, ℤ/3) = 0`; `ℚ₂(√5) = ℚ₂(√−3)` unramified | ok |
| Function-field inputs | `𝔽_q(t)`, `S = {∞}`; Artin–Schreier `y^p − y = t` vs `1/t`; `(t, c)` quaternion; `#H¹ = n²` | ok |
| `S`-ideles, reciprocity, Kummer | `ℚ(√−5)` (`𝔭` dies in `ℚ(√−5, i)`); `ℚ(√−21)`, `S = {𝔭₂, ∞}` (order 8); `S = {p, ∞}` | ok |
| `P`-class formations | `(ℤ_p, ℤ)` from `(Ẑ, ℤ)`: `H² = ℚ_p/ℤ_p` | ok |
| Cyclotomic power kernel | all subgroups of `(ℤ/2ʳ)^×` (`H¹` is `ℤ/2` iff `−1` in the image); `ℚ(ζ₈)` | ok |
| Exponent-two fields, one new prime | `ℚ({2, 3})` degree 8; `ℚ(√3)` narrow class; `(41/17) = (17/41) = −1` | ok |
| Antiunit rank, no `ℤ_p`-extension | imaginary quadratic `α/ᾱ`; `ℓ ≡ 1 mod p` | ok |
| Ext of discrete modules, Tate's theorem | `Ext¹(ℤ/m, ℤ)`; `M = ℤ`, `r = 1, 2, 3` | ok |
| Archimedean duality, unramified annihilators | `ℤ/3` real (`3 = |3|_∞`); orders `m · #μ_m` | ok |
| `Pʳ_S`, `β¹` proper, Poitou–Tate | `ℚ`, `S = {3, ∞}`, `ℤ/3` (`H²(G_S, μ₃) = 0`); topological types; `S = {2, ∞}`, `r = 3` | ok; **pairing formula sign fixed** |
| `cd`, `H²` surjectivity, `H³(K, K^{s×})` | `(−1, −1)`; `S = T = {p, ∞}` | ok |
| Euler characteristic | footnote 13 `2^{−s}`; `ℤ/3` over `ℚ` both forms; `μ₄`/`μ₂` multiplicativity | ok |
| Function-field Poitou–Tate / Euler | `𝔽_q(t)`, `S = {∞}`, `ℤ/m`; `S = ∅` excluded; `cd_p = 3` for `S = ∅` | ok |
| Finite compact support | `H⁰_c = Ĥ^{−1}(ℝ, ℤ/2)` for `ℚ`, `{2, ∞}` | ok |
| Grunwald–Wang | `ℚ`, `n = 8`, `χ₂(16) = −1`; unramified twists | ok (Conrad A.3 p. 32) |
| Character roots, roots after base change | `ℚ(√5)`, `ℚ(i)`; `16` over `ℚ(√7)`, `m = 8` | **general `m` fixed** |
| Avoidance construction | `ℚ(√3)` vs `ℚ(√10)`, `T = {13}`; `S_n` and transposition at `q₀` | ok |
| Torus duality | `G_m`; `R¹_{L/F}G_m` (Hasse) | ok |
| Derived tensor, Matlis, local duality | `ℤ/2 ⊗^L ℤ/2`; `⊕_ℕ k`; `ℤ_p` with `ω = ℤ_p[1]`, `K = ℤ/p` | ok |
| Composite SS, flatness, Hilbert–Samuel | `Hom(ℤ/2, −)` twice; `x ↦ T^{v_p(x)}`; `k[[x, y]]`, `R/(x)` | ok |
| Universal coefficients, Künneth | `C_m`, `C₂`; `A₅ × A₅`; `∏ C₂` | ok |
| Admissible, `RΓ_cts`, perfectness | `∏ ℤ/2` with discontinuous `φ`; `⊕ ℤ_p` over `ℤ_p`; `G_{ℚ_p}`, `ℤ_p`; `p = 2`, `ℚ`, `{2, ∞}` | ok; **Nakamura hypothesis fixed** |
| Derived local duality | `H^•(ℚ_p, ℤ_p(1))` ranks `0, 2, 1`; real place excluded; Hilbert-symbol skew symmetry | ok |
| Compact support, cups, `H³_c`, derived PT | both Leibniz rules verified; `ℚ`, `{p, ∞}`, `𝔽_p` dims `0, 0, 1, 0`; `ℚ(√−21)` Pic in `H²` | ok |
| `p = 2` with real places, `χ_c` | `Ĥ_c^{i<0}`; `e_R` over `ℤ_p` vs `𝔽_p`; totally imaginary `r₂` | ok |
| Lattice PT, abelian varieties, isogenies | `ℤ_p(1)` over `ℤ[1/p]`; `E(ℚ_ℓ)`; `[n]` with `ℓ ∤ n` vs `n = ℓ`; `E[2]` | ok |
| Greenberg–Wiles, one condition, Selmer complex | `ℚ`, `𝔽_p`, real factor `1/p`; `ℤ/2` with dyadic `L₂^⊥`; `q ≡ 1 mod p`; strict vs `T^{G_v}` conditions | ok |
| Rank one, function-field GW | `ℚ(√2)` (`1 + √2`), `ℚ(ζ₃)`; `𝔽_q(t)` constant field | ok |
| D8 adjoint, first-order, determinant, coefficient change | `𝔽₂`, `n = 2`; dual numbers (Lean proof); `ℤ_p → 𝔽_p` (`H²[p]` term) | ok |
| Taylor–Wiles count, archimedean dimensions | eigenvalues `x, 1, x^{−1}` and twist; `(3, 2)` vs `(0, 5)` in char 3; `l₀` for both parities of `n` | ok |
| KW bounds, dyadic primes, determinant twists | `g = h¹_{L⊥} + |S| − 1` (KW p. 43); `(ℤ/2ⁿ)^×`; `ζ = (ψ′/ψ)^{(pᵐ+1)/2}` | ok |

## Locators checked

Against the public sources in the reviewer's scratch copy (sha256 recorded in the handoff): all 41
Milne *ADT* citations (label and printed page; one page fixed); NSW 2.1.1, 2.2.4, 2.4.1, 2.4.3,
2.4.4, 2.4.5, 2.4.6, 1.5.7, 1.6.3, 2.7.2, 2.7.7, I §1 Ex. 4, 7.1.8, 7.2.6, 7.2.9, 7.2.15, 7.3.1,
8.1.1, 8.1.17, 8.1.21, 8.1.23, 8.1.24, 8.1.26, 8.3.2–8.3.5, 8.3.9, 8.3.10, 8.3.15, 8.3.17, 8.3.20,
8.6.7, 8.6.10, 8.6.13, 8.7.4, 8.7.8, 8.7.9, 9.1.3, 9.1.5, 9.1.6 (printed pages all correct; nine PDF
pages fixed); Rubin B.2.3–2.5 (pp. 151–152); DDT 2.18, 2.19, 2.39, 2.46, 2.48, 2.49; Khare–Wintenberger
II Lemma 4.3 (p. 40) and Proposition 4.5 (pp. 42–43); Conrad Proposition A.3 (p. 32); BCGNT Lemma
5.3.3 (p. 56); Nakamura Lemmas B.29–B.31, Corollary B.32 (pp. 104–106); Jannsen Corollary 4.9
(p. 227). The packager's flagged points (NSW function-field pages, the inflation–restriction limit
step, the `𝔽₅` exception, now cited from AGR) are resolved. Maire's Proposition 19 (antiunit lower
bound) remains attributed through Newton–Thorne, as the packager recorded; it was not read.

## For the TauCetiRoadmap PR

- Several citations are to the **current** Tau Ceti library (newer than the pin f790474):
  `map_eq_id_of_inner`, `isZero_of_isZero_sylow`, the factor-set topology and
  `ProfiniteGroupExtension.ofFactorSet`/`contCohomologyClassEquiv`, and
  `TauCeti.ClassFieldTheory.ClassFormation`. Against the pinned library they stay citations.
- ArithmeticGaloisRepresentations (tier 7) now supplies five items to this roadmap (Layer 2 §2.1,
  Layer 4 §§4.4 and 4.7, Layer 5, Layer 7 §§7.2 and 7.7). Its package review is still open; if its
  layers are renumbered, these citations follow.
- InverseGaloisAndArithmeticFundamentalGroups IG.4.2 (tier 6) states finite Poitou–Tate consequences
  and the order-two Grunwald–Wang alternative over `G_K`; the targets here are kept as the `G_{K,S}`,
  both-characteristic and exact-dyadic variants, as the packager recorded.
