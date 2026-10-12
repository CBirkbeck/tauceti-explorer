# REV-PKG-ComplexComparisonPartII — fixing review

Reviewer: `independent-review-REV-PKG-ComplexComparisonPartII` (Claude, session `claude-PKnYVi`),
12 October 2026, issue #8895. The package was written by session `claude-AxboDs`
(`research/blueprint/handoff/PKG-ComplexComparisonPartII.md`, PR #9236); this reviewer did none of
that job. Method: `research/blueprint/PACKAGE_REVIEW.md` (one fixing review). Everything fixable was
fixed in place in `README.md` and `Suggested.lean`; the remaining points are listed at the end.

Verdict: **accepted** (`review.json`). With the fixes below the package is ready for the draft PR.

## What was checked

1. **Upstream form.** Compared with `TauCetiRoadmap/AdicSpaces` and `LocalGaloisGroups` and with
   `UPSTREAM_GUIDE.md`. The README has the upstream shape: opening `**Summary.**`, *Scope and
   ownership*, *Conventions*, *Exact supplier contracts*, *How to read the build*, layers C0–C5 in
   build order with `### k.n` prose subsections, `**Checks.**` lists, per-layer *Examples* and
   *Dependencies*, then *Worked examples*, *Downstream consumers*, *References*. No target tables,
   no field lists, no process vocabulary (grep for packet/job/review/atlas/handoff/PR ids: none).
   `metadata.toml` is the single line `topic = "math.AG"`, which fits.
2. **Fidelity to the plan.** All 97 nodes of `packets/ComplexComparisonPartII.json` were traced
   through the packager's node map: every mapped README name exists (98 map rows, 0 missing), and
   all 71 `Define`/`Prove` targets of the README appear in `Suggested.lean`, either as declarations
   or in its closing list. Spot comparison of statements and hypotheses for the fibre-dimension
   loci, Cartan B, Cartan–Serre finiteness, Remmert and Remmert–Stein, base change, relative Hodge
   bundles, proper pure Hodge, the nonproper regular-singular comparison and Kato's chart criterion
   found them faithful. Two deliberate generalisations by the packager were checked and accepted:
   `gagaBaseChange` and `projectiveGeometricDictionaries` are stated for proper rather than
   projective morphisms (the comparison maps are defined for all morphisms and the proper GAGA they
   rest on is the cited AlgebraicModuli statement); `remmertSteinExtension` is stated on complex
   spaces (as in Demailly II.8.7).
3. **Own words.** A 9-word-shingle comparison of the README against the text of every source
   (Kato's scan has no text layer) found only titles and two stock phrases. No passage and no
   section-by-section summary.
4. **Process residue.** None.
5. **Suggested.lean.** `lean-check` before the review: exit 0, 33 `declaration uses sorry`
   warnings, nothing else. After the review: exit 0, **34** `sorry` warnings (one new negative
   control), nothing else; 496 lines; sha256 `bddc516a…a2f5`. Shape: real-bodied light definitions
   only (`ringSheaf`, `CoherentAnalyticModule`, `dbar`, `cauchyGreen`, `commutatorWith`,
   `IsDifferentialOperator`, `AlgebraicConnection`, `IsLogStructure`, `standardLogPoint`,
   `IsFineMonoid`, `IsSaturatedSubmonoid`, `logDifferentialRelations`, `LogDifferentials`,
   `residueStripRep`, `localMonodromy`, `hodgeLaplacianFun`), theorems with carriers at the pins,
   `example`s and `#check` pins only; no sorry'd data, no `True`, no `Prop := sorry`.
   Signatures spot-checked against the README (more than 10): `CoherentAnalyticModule`, `dbar` and
   both `∂̄` examples (computed by hand: `∂̄z = 0`, `∂̄z̄ = 1`), `cauchyGreen` (the fundamental
   solution `1/(πz)`), `localDolbeault_oneVariable` (smoothness written as `((⊤ : ℕ∞) : WithTop ℕ∞)`,
   not the analytic `⊤`), `montelTheorem`, `schwartzFiniteness_banach` and its negative control,
   `nagataCompactification` (Conrad's exact hypotheses: qcqs base, separated finite type),
   `puncturedRiemannSurfaceConnected`, `IsDifferentialOperator` with its three examples,
   `AlgebraicConnection.exists_trivial`, `IsLogStructure` (bijection `α⁻¹(Aˣ) → Aˣ`),
   `LogDifferentials` with the two finrank examples (computed by hand: 1 and 0),
   `residueStripRep`/`localMonodromy` examples, `hodgeLaplacianFun` (`−Δ(x₁²) = −2`),
   `det_le_det_of_posSemidef`, `fubiniStudy_integral_eq_one` (`∫ (1+r²)⁻² r dr dθ = π`).
6. **Library names.** A scratch file `#check`ed every Mathlib declaration the supplier contracts
   name (38 names, including `LocallyContractibleSpace`, `ContDiffAt.to_localInverse`,
   `Filter.Germ.valueRingHom`, `JacobsonSpace`, `Algebra.GrothendieckGroup`): all exist at the pin.
7. `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems,
   before and after.

## Tiers and suppliers

ComplexComparisonPartII is tier 5. It cites AlgebraicModuliForArithmeticGeometry (tier 4),
SchemeAndStackFoundations (tier 2), DiamondsAndVStacks (tier 3), Tau Ceti and TauCetiRoadmap
roadmaps. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id. Every AlgebraicModuli
declaration consumed (`HolomorphicStructureSheaf`, `ConvergentGerm`, the Weierstrass and Noetherian
results, `ComplexAnalyticSpace` and its API, `complexSchemeAnalytification` and its API,
`complexSpaceAnalytification`, `completedAnalyticStalkComparison` with `localHom`, `completionIso`,
`flat`, `coherentPullbackExact`, the three proper GAGA statements, `sncCompactification`,
`analyticPolydisc`, `coherentDevissage`, `devissageViaChow`) exists in that package's README
§§7.10.1, 7.10.3, 9.5, 2.3. Every `SF.2/…` id cited exists in the SchemeAndStackFoundations package.
The TauCetiRoadmap layers named (AlgebraicVectorBundles L0A–L0C, DifferentialGeometry Layers 0–3,
5, 6, 8, 9, 12, AlgebraicTopology Stages 6 and 8, PDE Lanes A, D, E, JacobianChallenge Layers B–C,
StableReduction Layer 2, AlgebraicCurves Layers 6 and 12B–12C, Completed/HodgeStructures) exist on
current TauCetiRoadmap main and say what the README attributes to them.

Fixed in the supplier contracts:

- **CohomologicalPointCounting/ComplexComparison is not a Tau Ceti roadmap.** It is the open
  TauCetiRoadmap pull request #196, not on main. Nothing in the package used it as a prerequisite;
  it was listed as a supplier in *Scope*, *Exact supplier contracts* and *References*. It is now
  mentioned only in the summary, as a proposal whose direction this roadmap continues without
  depending on it.
- `D0/cech-to-derived-comparison` is not a name in the DiamondsAndVStacks package; the target there
  is **D0.19** (Čech-to-derived spectral sequence and acyclic-basis comparison). Renamed in all five
  places.
- **Hypercohomology.** `AlgebraicDeRham` and `boundedOperatorHyperGaga` cited
  "SchemeAndStackFoundations SF.2 (hypercohomology …)"; SF.2 has no hypercohomology target. They now
  cite Mathlib `DerivedCategory`, and the proof of `boundedOperatorHyperGaga` is an induction over the
  brutal truncation triangles with the five lemma (no spectral-sequence supplier needed).
- The global Ext comparison is a consequence recorded under AlgebraicModuli's
  `properSchemeGagaPushforward`, not `properSchemeGagaEquivalence`; the contract now says so.
- Worked example 4 used ModularCurvesPartII (tier 11) as if supplying a normalisation; it now states
  only `dq/q = 2πi dτ` and names ModularCurvesPartII as a downstream consumer.

## Duplication against current Tau Ceti and TauCetiRoadmap

Searched TauCetiRoadmap main (all roadmaps, including the nine newer than the atlas snapshot and
`Completed/`) and the Tau Ceti library at a91d3aaf by object: GAGA, analytification, Dolbeault,
Cauchy–Green/Pompeiu, Wirtinger, Hodge star, Kähler, Chern connection, Fubini–Study, Stein and
plurisubharmonic, Montel and normal families, Schwartz/compact perturbation/Fredholm, Nagata,
Ehresmann, log structures and saturated monoids, sheaf–singular comparison, small simplices,
singular cohomology, de Rham, Riemann–Hilbert, Gauss–Manin, connectedness of punctured surfaces,
determinant monotonicity. No target is removed; four library results are now cited, with the
one-clause difference the form rule asks for:

| Tau Ceti item | Package target | Relation recorded |
| --- | --- | --- |
| `TauCeti.montel` (ConformalMapping L1; at the pin and at a91d3aaf), open `Ω ⊆ ℂ` | `montelTheorem` (C1.6) | kept as the several-variable form; Lean now also concludes holomorphy of the limit, matching `TauCeti.montel`; `#check @TauCeti.montel` pinned |
| `TopCat.singularCohomology`, `TopCat.singularCup` (a91d3aaf, not at the pin) | suppliers of C5.1 | cited in *Scope* and *From Tau Ceti* |
| `TopCat.smallSingularSubcomplex`, `TauCeti.smallSingularSubdivisionHomotopy` (a91d3aaf) | `SmallSingularCochains` (C5.1) | kept: Sella's smallness is by nestings at barycentres, not one open cover |
| `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (a91d3aaf) | `schwartzFiniteness` (C1.6) | kept: a surjection with possibly infinite-dimensional kernel is not Fredholm |

## Sources

Every citation of every source was checked against a public copy (Demailly, Serre GAGA and exposés
18–19, SGA 1 XII, Grothendieck 1966, Deligne 1968, Deligne 1970 and the 1971 erratum, Katz–Oda,
Kato 1989 (scan, read page by page), Hall, Sella, Conrad, tom Dieck, Peterzil–Starchenko,
Dimitrov–Gao–Habegger, Caraiani–Scholze, Bakker–Klingler–Tsimerman, both Qian papers,
Mok–Pila–Tsimerman): about 110 locators, including all those the packager flagged as not
re-verified. The Demailly, Serre GAGA and SGA 1 copies have the plan's recorded sha256. Downloads
stayed in scratch.

Corrected (wrong item, wrong claim or page off by more than one):

| Target | Was | Now |
| --- | --- | --- |
| `coherentOperations` | Demailly II.9.12 (it defines inverse images) | II.3.13–3.16, pp. 87–88; II §9.4, p. 124; Exercise II.11.3 c), p. 127 for Hom; tensor products by the cokernel argument now written out |
| `coherentAnalytification_faithful` | SGA 1 XII §1.3 for non-fullness (it proves faithfulness) | Prop. 1.3.1 for faithfulness; non-fullness by `exp(z)` and Serre GAGA n° 12, Remarque 1, p. 20 |
| `HigherImageComparison` | SGA 1 XII 4.1–4.2 for the derived map and composition | degreewise `θ^q` (4.1.1) and Thm 4.2 only; derived form marked as constructed here |
| `localDolbeault` | Demailly I.3.29 "and its proof" (Bochner–Martinelli, not Cauchy–Green) | I.3.29 for the statement; I.3.2–3.4, p. 21, and Exercise I.8.5, p. 61, for the one-variable route |
| `HodgeLaplacian` | Demailly VI.1.1–1.2 (differential operators, not adjoints) | VI.1.5, p. 288; VI.3.9–3.14, pp. 292–294 |
| `compactEllipticHodge` | Demailly VI.1.6 (adjoint formula); "refers out for all proofs" | VI.1.5–1.8; VI.2.1–2.4, pp. 289–290, with 2.4 proved there |
| `kaehlerHodgeDecomposition` | attributed "degeneration and graded pieces only" to Demailly VI.11.3 (which calls the isomorphism canonical) | reworded; strong Hodge decomposition VI.12.5, p. 326 |
| `remmertSteinExtension` | "strict inequality necessary" attributed to Demailly | statement cited; the necessity is the README's own example |
| `analyticSerreGeneration` | proof sketch with a hyperplane avoiding associated points | Serre's actual argument: hyperplane through `x`, kernel and cokernel of `z₀`, joint induction with vanishing; Needs gains `analyticSerreVanishing` on `P^{r−1}` |
| exposé 19 labels | "§8", "§9", "§10" | §3 nos. 8–9, §4 no. 10 (pages unchanged) |
| `gagaBaseChange` | SGA 1 XII §4.2 for projection and base change | 4.1–4.2 only for `θ`; the compatibilities marked as proved here |
| `properSupportAlgebraization` | SGA 1 XII §4.4–4.5 "with the compactification reduction" | Thm 4.4 applied on `Ȳ`; Serre GAGA n° 19, Prop. 14; reduction marked as the argument given |
| `properSourceMorphismAlgebraicity` | Serre GAGA §19 "reduced projective case" | SGA 1 Cor. 4.5 (both proper); GAGA n° 19, Props 14–15 (complete source, any target) |
| `algebraicGraphRegular` | "Zariski's main theorem in Serre's form" | Serre's Prop. 7 (closures of images), generic degree count, flatness |
| `analyticEtaleDescent` | Hall Thm 9.1 (a GAGA theorem) | Hall Example 9.8, pp. 23–24; SGA 1 XII §3; descent marked as proved here |
| `derivedGagaProperSpace` | "Hall's reconstruction theorem" | Hall's Tor-independent GAGA theorem 9.1; Examples 7.1–7.2 added; Oka coherence named |
| `SmallSingularCochains` | smallness via vertices; "homotopy equivalent"; degree-0 cocycles always locally constant; Example 0.3 overstated | Sella's barycentre condition; quasi-isomorphism in the colimit (homotopy equivalence per nesting); semilocal contractibility added; Example 0.3 stated as Sella shows it |
| `sheafSingularComparison` | "holds for analytic spaces" (unsourced) | restricted to manifolds, the only spaces used; equals Mathlib `LocallyContractibleSpace` |
| `multiplicativePeriodInterface` | Grothendieck Thms 1–2 and DGH Prop. 4.2 for the `2πi` normalisation (neither says it) | Grothendieck Thm 1, p. 95, for the comparison; `2πi` is Mathlib's `circleIntegral.integral_sub_inv_of_mem_ball` |
| `dghIntegrationApplication` | a compact cutoff on the component and a limit (not DGH's argument) | cutoff from the base and Lelong's theorem, as in DGH; pp. 16–19, (4.9) |
| `deligneRiemannHilbert` | Caraiani–Scholze "for the proper case" | used on a Hodge-type Shimura variety; v1 pinned |
| `AlgebraicDeRham` | Deligne 1970 II.6.2 (the comparison theorem) | I.2.20.3–2.21, pp. 13–14 |
| `relativeBettiLocalSystem`, `relativeDeRhamBetti` | Deligne I.2.23 and II.7 | I.2.24–2.25, p. 19; I.2.27–2.29, pp. 19–21, and II.7.7, p. 117 |
| `RegularSingular` | II.4.1 under pp. 91–98 (it is on pp. 85–89) | II.4.1–4.6, pp. 85–91, and II.5.1–5.9 |
| `curveResidueLocalization` | Deligne II.6.9–6.10 for the residue sequence; source inside the Needs line | Poincaré residue II.3.5–3.7, pp. 75–78; source moved before Needs |
| `CurveLogComplex` | compact-support identification attributed to Grothendieck/Deligne (neither has it) | the two-line local computation is now written out |
| `FineLogChart` | saturation attributed to Kato (he does not use it) | stated as a convention recorded so that nothing assumes it |

Smaller corrections (one page, item numbers, additions): Demailly II.3.11–3.16 and II.9.10–9.13,
IX.1.8–1.9, II.8.7–8.8 (to p. 121), VI.2.4, VI.8.1–8.6; Serre GAGA n° 14 Lemma 6 (p. 22), nos. 16–17
Lemma 8 (from p. 24), n° 16 for analytified twists, exposé 18 Remark 2 for the Laurent-series method;
SGA 1 XII 1.1 a) for open immersions; Grothendieck Theorem 2 on p. 97 (twice), Theorem 1′ placed
before the smoothness remark; Deligne I.2.10–2.15 (holomorphic de Rham), I.2.19/2.23 (Poincaré
lemma), I.2.22–2.23 pp. 14–19, I.2.20.3–2.21 added for algebraic connections, II.5.1–5.6 with
Corollary 5.6 for monodromy (and the misprinted "4.3"), II.5.7–5.9 from p. 96, II.6.2 and
II.3.13–3.15 for the nonproper comparison, II.6.5–6.6 for the absolute operator comparison with the
relative case marked as proved here; Deligne 1968 pages for Theorem 5.5 and the coherent trace of
Proposition 4.3; Katz–Oda §3 sequence (13), pp. 204–205; Kato §1.2–1.5(2), §1.3 p. 193, Proposition
3.8 and (2.8) for `LogSmooth`, Theorem 3.5 on p. 202 with Remark 3.6, (1.8) for the SNC log complex;
Qian's two citations marked as applications; Qian 2023 given its journal range (Invent. Math. 231,
1239–1275) so that p. 1266 is meaningful; Hall pseudo-conservativity examples.

Confirmed as cited (sample of the many): Conrad Theorem 4.1 and Remark 4.2 (exact hypotheses);
tom Dieck 2.2.1, 2.2.3, 2.2.4; SGA 1 XII Proposition 2.4 and Lemma 2.5; Hall Theorem 3.8,
Proposition 4.1, §4 and Lemma 4.3, Theorem 9.1 (conditions (a)–(e) match C3.3); Peterzil–Starchenko
Theorem 7.2 and Lemma 8.2; BKT Theorem 4.12 (p. 933); Demailly IX.4.1, IX.4.6–4.8, IX.4.10–4.13,
IX.4.15 (vanishing above the dimension holds on any analytic scheme), IX.2.1–2.7, I.6.13–6.18,
VII.1.1–1.3, V.10.3, V.12.1–12.2, V.12.10, VI.6.1–6.9, III.1.7–1.12, III.2.1–2.7, V.13.2–13.9,
V.15.8–15.12, and the misprint in the proof of VIII.2.4 (decreasing cutoff, derivative said to lie in
`[0, 2]`); Deligne's erratum (II.1.23–1.24 withdrawn, II.4.1 reproved); Deligne's sign
`exp(−2πi Res)` (II.1.17, II.3.11, Corollary 5.6), matching the README; the condition "no residue
eigenvalue a positive integer" (II.3.13, Lemma 6.9, Corollary 6.10); Kato 1.7, 3.10, 3.12 and
Theorem 3.5 (condition (b) is étale); Deligne 1968 Theorem 5.5 (any characteristic-zero base) and
Proposition 5.3.

## Unit tests

Every `**Checks.**` list was read for discriminating power. Fixed:

- `AnalyticTwist.dual` claimed to fix the direction of the transition factor. It does not: the
  reversed convention also satisfies `O(k)^∨ ≅ O(−k)`, and so does a definition ignoring `k`.
  Replaced by `AnalyticTwist.degreeOneSections` (`h⁰(P¹, O(1)) = 2`; the reversed factor gives
  `O(−1)` with no sections, ignoring `k` gives dimension 1).
- `AnalyticCycleIntegration.line` used a test form `χ(|z₁|²)…` that is not compactly supported on
  `ℂ²`; now `χ(|z₁|² + |z₂|²)` with `χ(0) > 0`, and the conclusion is strict positivity.
- Lean: `IsSaturatedSubmonoid` quantified over the whole ambient group, so `2ℕ ⊆ ℤ` (a copy of
  `ℕ`, saturated) came out unsaturated. It now quantifies over `AddSubgroup.closure Q`, i.e.
  `Q^gp`, as the README defines it, and a new `example` records that `2ℕ ⊆ ℤ` is saturated.
  The existing control (`⟨2, 3⟩` fine, not saturated) still holds.

All other definitions have at least three checks, each failing a plausible wrong definition.

## Adversarial mathematics pass

| Statement or convention | Instances computed | Result |
| --- | --- | --- |
| `dbar = ½(∂ₓ + i∂_y)` | `z`, `z̄` | 0 and 1; `∂ₓ + i∂_y` gives 2, `∂/∂z` gives 0 |
| Cauchy–Green `π⁻¹∫ g(w)/(z−w)` | fundamental solution of `∂/∂z̄` | `1/(πz)`; correct sign and constant |
| Hodge star on `ℝ²` | `*dx`, `*dy`, `*1` with `α ∧ *α = vol` | `dy`, `−dx`, `dx ∧ dy` |
| `δ = (−1)^{m(r+1)+1} * d *` | `m = 2`, `r = 1` | `−*d*` |
| Hodge Laplacian sign | `x₁²` in `ℝ³` | `−2` (DifferentialGeometry's `div ∘ grad` gives `+2`) |
| Chern curvature of `e^{−φ}` | `φ = |z|²` | `Θ = dz ∧ dz̄`, `iΘ = 2 dx ∧ dy > 0` |
| Fubini–Study normalisation | `∫_ℂ π⁻¹(1+|z|²)⁻²` | 1; `(i/2π)∂∂̄ log(1+|z|²) = π⁻¹(1+|z|²)⁻² dx∧dy` |
| Lelong–Poincaré | `(i/π)∂∂̄ log|f| = [Z_f]` | matches `dd^c` with `d^c = (i/4π)(∂̄ − ∂)` |
| complex orientation | `(i/2) dz ∧ dz̄` | `dx ∧ dy` |
| strongly 1-complete checks | polydisc, `ℂᵃ × (ℂ*)ᵇ`, `P¹` | exhaustions are strictly psh (`(log|w|)²` subharmonic); `P¹` fails |
| twist cohomology | `r = 1`, `k = 2, −2, −1`; `r = 0` | `3, 1, 0`; binomials `binom(k+r,r)`, `binom(−k−1,r)` recomputed |
| Laurent-monomial `H^r` basis | count of `aᵢ ≤ −1`, `Σaᵢ = k` | `binom(−k−1, r)` |
| residue/monodromy | `d + a dz/z`, horizontal `z^{−a}` | monodromy `exp(−2πia)`; `a = 1/4` gives `−i`; Deligne's sign agrees |
| lattice condition | rank one, residue `a`, stalk at `0` | log complex = `Rj_*` iff `a` is not a positive integer; `z⁻¹` (residue −1) good, `z` (residue 1) bad |
| canonical extension strip | `3/4 + 3/4` | strip representative `1/2` |
| irregular singularity | `d + dz` at `∞` | `d − dw/w²`, double pole |
| log differentials | standard log point over trivial base / over itself | `ℂ · dlog t` / `0` |
| log smoothness | `xy = t` with `ℕ → ℕ²`, `1 ↦ (1,1)` | kernel 0, cokernel `ℤ` torsion-free, `X ≅ Y ×_{ℤ[ℕ]} ℤ[ℕ²]` |
| fine/saturated | `⟨2,3⟩ ⊆ ℤ`, `2ℕ ⊆ ℤ`, `ℕ ∪ {∞}` | fine unsaturated; saturated (Lean fixed); not integral |
| compact-support curve complex | stalk at `p ∈ D` | `zℂ{z} → ℂ{z}dz` bijective, so acyclic = `(j_!ℂ)_p` |
| curve examples | `P¹ ∖ {∞}`, `P¹ ∖ {0,∞}` | `H¹ = 0`, `H²_c = ℂ`; `H¹ = ℂ dz/z`, parabolic part 0 |
| Remmert image example | `(x, y) ↦ (x, xy)` | image `{x ≠ 0} ∪ {0}`, not closed |
| fibre-dimension loci | `zw`, blow-up of `ℂ²` | `A₁ = ℂ²`, `A₂ = ∅`; exceptional curve, whole source |
| extension by zero (`DQCohSpace`) | DVR, open generic point | global sections 0, stalk `K`: not quasi-coherent |
| semipositive wedge | `α = tω`, `β = sω` | `sᵈ ≤ tᵈ`; pointwise `det B ≤ det A` |
| Lean `schwartzFiniteness_banach` control | `h = −g = −id`, infinite-dimensional `E` | quotient `E`, not finite-dimensional |
| Lean `LogDifferentials` | relations over `⊥` and `⊤` | finrank 1 and 0, by hand |

No statement needed a new hypothesis. Generality of README and Lean agree (the Lean `montelTheorem`
was weaker than the README, which concludes holomorphy of the limit; now equal).

## What remains (not fixable inside this package)

1. **AlgebraicModuliForArithmeticGeometry's proper GAGA rests on analysis planned here.** Its
   §7.10.3 proof of `properSchemeGagaPushforward` starts from "projective GAGA over a polydisc",
   whose analytic inputs (Cartan B on polydiscs, twist cohomology, Cartan–Serre finiteness, Serre's
   analytic theorems) are this roadmap's C1, one tier higher. As the packager noted, either bundle
   the two roadmaps or move C0.1, C0.5 and C1 down into AlgebraicModuli. This package itself cites
   only lower tiers.
2. **`fibreDimensionLoci` analyticity** is stated from Peterzil–Starchenko, who quote Whitney,
   *Complex Analytic Varieties*, Theorem 9F; Whitney is not freely available or cleared and was not
   read, and Demailly proves only closedness. Only the `B_k` statement of C4.1 uses the analyticity;
   the README now says so.
3. Consumers that cite `ComplexComparisonPartII:C2` or `C3` for GAGA itself (AutomorphicBundles,
   AlgebraicModularFormsAndSerreWeights, HodgeStructuresPartII, InverseGalois, ShimuraVarieties)
   should point at AlgebraicModuli §7.10.3, as the packager recorded.
4. CohomologicalPointCounting/ComplexComparison (TauCetiRoadmap PR #196) is still open; if it
   merges, the summary sentence can call it a Tau Ceti roadmap.
