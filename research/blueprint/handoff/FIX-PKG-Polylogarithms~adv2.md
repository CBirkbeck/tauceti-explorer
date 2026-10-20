# FIX-PKG-Polylogarithms~adv2

Issue #11337. Worker: Claude (Opus 5.5), session `claude-dQ7LwN`, 2026-10-20. The claim bot
confirmed this session. This run takes no second job.

**Disposition: accepted.** The three findings of `REV-PKG-Polylogarithms~adv` (G1–G3) are
resolved. The maintainer's de-cycling decision of 2026-10-20 is applied. The fix also covers the
residue the checkpoint `FIX-PKG-Polylogarithms~adv` left open.

## Finding → change

| Finding | Change | Status |
| --- | --- | --- |
| G1, weight four: the package depended on the unplanned Part II | Polylogarithms, Part II (`ZagierConjecturePolylogarithms`) requires P.1–P.5 and PeriodsAndSpecialValues PS.9, so it lies downstream of this roadmap. A weight-four theorem proved here would be a cycle, so it is now owned downstream by Part II Layer 6. Removed from the README: the explicit weight-four complex, its ownership table, the extension asks, `weightFourRegulatorInput`, the `L₄*` cycle conversion, `zagier_four_exists`, `zagier_four_explicit_everyFamily`, `presentationChainMap_wellDefined` and `weightFourInductive_periodContainment`. Removed from Suggested.lean: `zagier_four_exists`, `weightFour_cycle_period` and the two `L₄*` coordinate examples. What stays here is what Part II imports. New §4.5 defines the explicit raw weight-four cycles (`explicitRawCycleFour`, equal to `IsCycle4`), with `explicitRawCycleFour_inductive` (inclusion in `A₄(F)`, same periods) and four Checks. | Resolved: no supplier remains |
| G1, geometry: ideal-boundary regions | §2.4's local upper-half-space construction, from the previous fix, was re-checked: the circumcenter formula, the `z=i` region test, the cusp tail `A/(2H²)`, the conformal Christoffel symbols and the `SL₂(ℂ)` action with `J=\|cw+d\|²+\|c\|²h²`. Milnor's locators are confirmed against the public chapter: L7.1.2–7.1.3 p.158, L7.1.4 p.159, Thm 7.2.1 p.160, L7.2.2 p.161 (height integral `1/(2(1-x²-y²))`). | Resolved |
| G2: top configuration normalization | The previous fix's choice is verified against the G95 scan: `r₆=18M₃∘ℙ`, `r₅=18f₁`, `r₄=18f₀`. Sources: `f₀` p.264; (3.5) p.266; Prop 3.8 pp.266–267; projectivization `f₂` p.268; diagram p.263 with `M₃`; Theorem A (5.20) p.293; Def 1.5 pp.211–212; `M₃` cases (a)–(e) pp.286–287; Lemma 7.5 and Cor 7.6 p.302; Thm 8.1 p.304. An exact rational recomputation on the fixture `(1,8,2),(7,3,11),(1,3,2),(9,4,3)` gives `r₄=18f₀=18u(5)∧u(67)∧u(197)`. The `Alt₄` grouping (`-6f₀`) and the pivot/second-index count for `r₅` were re-derived by hand. **New defect fixed:** the README copied G95's reduction of a generic tuple, "(-1)^i with `a` placed last" (p.287 (e)), with a wrong justification. The seven-term relation forces `-(-1)^i`, or `(-1)^i` with `a` placed first; the printed sign would give `2M₃=0`. §3.6 now states the correct sign and has a negative-control Check. Also recorded: G95 p.263 restates (R3) with an extra `+(1/3)η` that contradicts Def 1.5 and `M₃`(c) p.286; the README uses Def 1.5. | Resolved |
| G3: multiplicity-bearing incidence | §5.3's relative-cycle construction from the previous fix was re-checked against the SV manuscript, whose PDF page equals the printed page. Def 3.1.3 p.16; Prop 3.1.5 p.18; Thm 2.2.2 p.9; Thm 3.3.1 pp.23–27; Lemmas 3.3.9–3.3.10, **Corollary** 3.3.11 and Lemma 3.3.12, pp.30–32 (the README said "Lemmas 3.3.9–3.3.12, pp.23–32"; corrected); Lemma 4.2.1 and Thm 4.2.2 p.58; Thm 4.4.11 and Lemma 4.4.12 p.79; Cor 4.4.13 p.81. Thm 4.2.2 makes `z(X/S,r)⊗ℤ[1/p]` an h-sheaf, `p` the exponential characteristic. That is what makes the integral tautological cycle exist in characteristic zero; the README now says so. | Resolved |
| De-cycling (1): Layer P.1 → PolylogarithmFunctions | README Layer 1 (§§1.1–1.5, Examples, Dependencies) deleted; layers 2–6 keep their numbers. Scope has a PolylogarithmFunctions bullet. A new contract "From PolylogarithmFunctions" names `polylog`, `singleValued`, `blochWigner` and the theorems consumed: `PolylogarithmFunctions.singleValued_inversion`, `…singleValued_differential`, `…singleValued_two`, `…blochWigner_differential` and `…blochWigner_fiveTerm`. Every `§1.x` reference in Layers 2–6 is repointed (13 places). Suggested.lean drops `blochWigner_fiveTerm`, `polylog_hasSum`, `polylog_one`, `singleValued_two`, `singleValued_inversion`, `blochWigner_differential`, `blochWigner_pos`, `singleValued_three_one` and the four P.1 examples. It keeps `polylog`, `singleValued` and `blochWigner`, restated with their bodies and docstrings naming the owner (the EnhancedDerivedSheaves `IsReplete` precedent). | Done |
| De-cycling (2): PeriodsAndSpecialValues | Its only supplier use (old README line ~613, the extension asks) left with the weight-four material; no PeriodsAndSpecialValues citation remains. MotivesAndAlgebraicCycles/HodgeStructuresPartII asks went with it, since nothing here needs them now. | Done |
| De-cycling (3): K3BlochGroups V.3/V.4 | Kept unchanged. | Done |
| Supplier directions | "Downstream consumers" named K3BlochGroups and BorelRegulators, MotivicEtaleKTheory and ColemanIntegration as consumers; all four are suppliers here. Those sentences are corrected, and the Scope bullets for MotivicEtaleKTheory and ColemanIntegration no longer describe reverse uses. Part II, EllipticRegulators and HabiroNahmSeries are named as consumers. | Done |
| Duplicate of a supplier | `weightFour_totallyReal` restated BorelRegulators §7.1 (Borel 1977, Remark 6.3). It is replaced by `zagierExistence_totallyRealEven`, a corollary of that supplier for **all even n** over totally real fields, stated in Lean with its hypotheses. | Done |

Also added: the general-square criterion `cycleLift_of_injective` (README §4.6 and Lean), and its
weight-three application `weightThree_inductiveCycleLift`. The inductive and explicit `B₂` agree
(§4.2), so every inductive weight-three cycle lifts, and the weight-three theorems transfer to
inductive families.

## Moves to record for other jobs (maintainer note)

- **Part II (`ZagierConjecturePolylogarithms`) package job.** These P.4 targets of this roadmap's
  packet now belong to Part II, because each needs Part II's `B₄^comb` or its `κ`:
  `explicit-weight-four-complex`, `weight-four-regulator-input`, `weight-four-theorem`,
  `weight-four-determinant-lifting`, `presentation-chain-map` and `freeness-extension`.
  `weight-four-totally-real` is now BorelRegulators §7.1 plus `zagierExistence_totallyRealEven`
  (§4.7). Part II's readme cites these as parent nodes (Z.3 classical-subspace uses, Z.5
  cycle-period-calibration, Z.6 explicit-zagier-four and presentation-and-frontier); point them
  at Part II's own targets. The parent still supplies: `IsCycle4`/`explicitRawCycleFour` (§4.5),
  `zagier-determinant` and the assertions (§4.4), `cycle-obstruction` and `cycleLift_iff`/`_of_injective`
  (§4.6), and the inductive complexes (§§4.1–4.2). Part II should also carry the elementary tensor proof
  of the `5/16` conversion, which the previous version of README §4.5 had: apply `δ₃⊗id`, then
  `D∘σ⊗log|σ|⊗log|σ|`. It also inherits the configuration adapter note: §3.5 gives no quotient
  identity for a raw alternating triple symbol.
- **DESIGN-PolylogarithmFunctions (#11333, claimed by another worker).** The deleted Layer 1 text
  is at `git show 656c7f831:research/blueprint/packages/Polylogarithms/README.md`, lines 83–179,
  and in packet P.1. This package consumes the names listed under "From PolylogarithmFunctions";
  the new roadmap should keep them, or this contract needs a rename pass.
- The packets were not edited (outside this issue's deliverables). The packet `Polylogarithms.json` still
  carries P.1 nodes and the moved P.4 nodes.

## Adversarial pass on touched statements

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| Conventions `Lₙ`, `D` (restated) | `n=2` expansion; `L₃(1)`, `L₃(-1)`; even `n` at 1; `z→0` | `L₂=Im Li₂+arg(1-z)log\|z\|` from `c₁=-1`; `ζ(3)`, `-3ζ(3)/4`; `Lₙ(1)=0` for even `n`; limits 0. Unchanged bodies. |
| `explicitRawCycleFour`, `IsCycle4` | `[1]`; `[2]` over ℚ; `[2]+[1/2]`; zero sum | `[1]` is a cycle. `[2]` is not: `L₃(2)=7ζ(3)/8≠0`, checked numerically to 1e-11. `[2]+[1/2]` is a cycle: inversion in `B₃^exp`, a new proved Lean example that a weight-two-test predicate would fail. Zero is a cycle. |
| `explicitRawCycleFour_inductive` | `p₃` an isomorphism vs. only surjective | Inclusion holds for any linear `p₃`; the reverse inclusion is not asserted. |
| `cycleLift_of_injective` | all spaces zero; `p=a=id,b=q=0`; `p=0` | True; the negative control shows `hq` is needed (`ω(1)≠0`); `hp` is needed when `p=0`. |
| `weightThree_inductiveCycleLift` | `[1]₃`; weight-four analogue | Lifts with period `ζ(3)`. In weight four, `q=p₃⊗id` is injective only under the comparison conjecture, recorded as a Check. |
| `zagierExistence_totallyRealEven` | ℚ at `n=2,4`; `ℚ(√2)` at `n=2`; odd `n`; `n=0` | `q=6, 90, 24`; the `ℚ(√2)` value was checked numerically through `L(2,χ₈)=π²/(8√2)`. Odd `n` has `d₃≥1`, so it is excluded by `Even n`. `n=0` fails for `N>1` (`ζ_F(0)=0`), so `2≤n` is kept. |
| `M₃` generic reduction | 7-term relation for `(m₀,…,m₅,a)`, `a` last vs first | Coefficient `-(-1)^i` with `a` last; G95's printed `(-1)^i` would force `2M₃=0`. README fixed; Check added. |
| (R3) relation | Def 1.5 p.212 vs §3 p.263 vs `M₃`(c) p.286 | p.212 and p.286 agree; p.263 has an extra `(1/3)η`. Definition 1.5 is used. |
| `r₄=18f₀`, `r₅=18f₁` | exact fixture; hand regrouping | `18u(5)∧u(67)∧u(197)` on both sides. |
| SV locators | every cited number | One range corrected (Corollary 3.3.11; pp.30–32). |
| Downstream / scope directions | all four supplier roadmaps named as consumers | Corrected; no upward or cyclic citation remains. PeriodsAndSpecialValues is not cited. |

## Validation

- `lean-check research/blueprint/packages/Polylogarithms/Suggested.lean`: exit 0, 12
  declaration-uses-sorry warnings, no other warning or error. 401 lines, 12 theorem signatures,
  22 proved examples, at most two per kept definition, no sorry'd data.
- Gate `mech_check.py`: 0 README identifiers absent from Lean, 0 round-named labels, 0 empty
  sections, 0 bold targets without a name.
- All six `Polylogarithms*.json` packets: `check_blueprint.py` 0 errors, 0 warnings (unchanged).
- `intake.py check-files` on the four deliverables: 0 problems.

## Sources read (2026-10-20)

G95 author scan (SHA-256 `434fd909…5344`, PDF page = printed − 196); SV manuscript
(`4f2cfb71…3e34`, PDF page = printed); Milnor chapter 7 (`a42ef9fc…c5a683`). All three hashes match the previous
fix's. The BorelRegulators package README is §7.1. No uncleared library copy was used. No verbatim
passage entered the repository. No suspicious instruction was met in any fetched text or issue comment.
