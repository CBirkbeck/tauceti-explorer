# PKG-PolylogarithmFunctions~codex

Issue #11357. Worker: Claude (Opus 5.5), session `claude-Q4iaEF`; the claim was confirmed by the bot on 2026-10-20. Branch `claude-Q4iaEF-pkg-polylogarithmfunctions`.

## What was delivered

- `research/blueprint/packages/PolylogarithmFunctions/README.md` (about 113 KB): the full roadmap in TauCetiRoadmap form. It has Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, BelyiMaps Layer 5, ConformalMapping L4), How to read the build, and seven layers with `### k.n` subsections, each ending with Examples and Dependencies. These are followed by Downstream consumers and References. All 45 targets of the accepted plan appear (one is now a citation, see below), and every definition has an API list and at least three Checks.
- `research/blueprint/packages/PolylogarithmFunctions/Suggested.lean` (557 lines): `import Mathlib` plus seven Tau Ceti modules. It has one module docstring, `namespace TauCetiRoadmap.PolylogarithmFunctions` and eight real-bodied light definitions: `polylog`, `polylogTower` (the Layer 2 vector germ), `bernoulliCoeff`, `singleValued`, `singleValuedSphere`, `blochWigner`, `crossRatio` and `rogers`. It states 65 milestones, each `sorry`, and 14 proved `example`s, at most two per definition. It ends with one closing comment naming the README targets that are not stated in it.
- `research/blueprint/packages/PolylogarithmFunctions/metadata.toml`: `topic = "math.CV"`.

## Checks run

- `lean-check` on the package `Suggested.lean`: exit 0. The only warnings are `declaration uses 'sorry'` (65 of them); there are no errors and no other warnings. It was run on the shared pinned build (Mathlib 082e2d3, Tau Ceti f790474) with memory checked first. No Lean server was started and no lake build was run.
- A separate `#check` file listing all 62 Mathlib and Tau Ceti declarations named in the README elaborated with exit 0, so every cited name exists at the pins.
- `python3 scripts/check_sorry_data.py` on the Lean file passed (no sorry'd data).
- `python3 research/blueprint/intake.py check-files` on the three package files reported 0 problems.
- Every identity the package states was checked numerically in pure Python, using my own implementation of the radial integral with Mathlib's branch conventions (174 checks, all passing). This covered:
  - the Abel, reflection and inversion identities;
  - distribution, including n = 0 and n = −1;
  - the jump and the lower boundary value;
  - the sixfold symmetry, all five-term forms and the projective and cyclic cross-ratio forms;
  - the differentials of D, L₃ and Lₙ for n ≤ 5, and the Laplacian;
  - Lₙ inversion, conjugation and distribution, including at points of the cut;
  - L₃(−1), the vanishing derivative of L₃ at 1, the Rogers pentagon and its values, and the tail bounds.
  The scripts are not in the repository.

## Sources

All six sources were fetched (into scratch only). Their SHA-256 hashes match the packet: O93, Z07, Z90, G95, G00 and GR v5. Locators were checked against the PDFs, rendering the scanned pages (Z90 pp. 410–414, G95 p. 201, O93 pp. 50–60). Page offsets: for O93 the journal page is the PDF page + 47; for Z07 it is the PDF page + 2; for Z90 the PDF page is the journal page − 390.

Corrections to the design reader's locators:
- Zagier's duplication and distribution formulas are in [Z07] Part I §2, p. 9, not §1 p. 8. The weight-two inversion is in Part I §2, p. 8, and the special values are in Part I §1, pp. 6–7.
- The sixfold symmetry is [Z07] (3), p. 11, not "(1)".
- [Z07] (4), p. 11, is the **cyclic** five-term form D(x) + D(y) + D((1−x)/(1−xy)) + D(1−xy) + D((1−y)/(1−xy)) = 0, not the alternating form. The alternating form D(x) − D(y) + D(y/x) − D((1−x⁻¹)/(1−y⁻¹)) + D((1−x)/(1−y)) is [O93] §4.1, (34), p. 60, up to D(1/w) = −D(w). The README cites both accordingly and states both.
- The disc series is in [Z07] Part I, introduction, p. 5, not "pp. 3–6".
- [Z90] §7 begins on p. 410. The coefficient discussion is pp. 413–414.

Lewin's book was not used.

## Duplication found and removed (cited instead)

- **TauCetiRoadmap BelyiMaps, Layer 5** owns the following, so the plan's loop-generator target ("the two puncture loops", generation of π₁ by c₀, c₁) is removed and cited:
  - U = ℂ∖{0,1} with basepoint 1/2 and its semilocal simple connectivity (§5.1);
  - the counterclockwise peripheral loops γ₀(t) = e^{2πit}/2 and γ₁(t) = 1 − e^{2πit}/2 with their classes `periph0` and `periph1` (§5.2);
  - π₁(U, 1/2) ≅ FreeGroup (Fin 2) (§5.6).
- **TauCetiRoadmap ConformalMapping, L4**, implemented in the Tau Ceti library at the pin, owns analytic continuation along paths, its uniqueness and concatenation, the monodromy theorem and the global branch on a simply connected domain. The library declarations are `TauCeti.IsAnalyticContinuationAlong`, `ContinuesInside`, `monodromy_theorem` and `ContinuesInside.exists_analyticOnNhd`. The design's general homotopy-invariance argument for the continuation is not re-planned. The continuation construction is now specific: one vector-valued germ (`polylogTower`) continued with that API.
- The Tau Ceti library at the pin also has `TauCeti.UniversalCover` with its covering map and fundamental-group action, which is the carrier of the branch function `polylogBranch` (README §2.2). Note its convention: the action prepends the **inverse** loop class. The README fixes Oesterlé's Tⱼ = periphⱼ⁻¹ • ·.
- The weak and strong minimum principles (Tau Ceti) and the Mathlib items listed under Scope are cited, as the design already did.
- A search of current TauCetiRoadmap main and of the current Tau Ceti library (a91d3aaf) for polylogarithms, dilogarithms, Bloch–Wigner and Rogers found nothing.

## Moved-down notions and de-cycling

None moved. The package cites only Mathlib, Tau Ceti and two Tau Ceti roadmaps (BelyiMaps, ConformalMapping). Polylogarithms, K3BlochGroups, HabiroNumberFields and the other analytic consumers appear only under Downstream consumers, and none is a supplier. The roadmap is not in the CaraianiNewton order file.

## Changes of generality relative to the design (all verified)

- **Euler reflection** holds for **every** z ∈ ℂ under Mathlib's conventions. On (−∞,0) and (1,∞) every term is a limit from one and the same half-plane, and at 0 and 1 both sides are π²/6. The hypotheses were dropped.
- **Bernoulli inversion** holds for z ∉ [0,1], and so also on (1,∞) with lower values. It fails on (0,1), and at z = 1 it fails for n = 1 but holds for n ≥ 2. The added `polylog_inversion_of_nonpos` gives −1 in weight 0 and 0 below, so every integer weight is covered.
- **Alternating five-term**: under Lean's 0⁻¹ = 0 the only hypotheses needed are x ≠ 0 and y ≠ 0. The design's x ≠ y and x, y ≠ 1 were dropped; at x = 0 the identity really fails, with left side D(y).
- The **Abel form of the D five-term relation** ([O93] (32)) holds for all x, y ∈ ℂ under Lean's conventions, and was added. The **cyclic form** ([Z07] (4)) was added with the single hypothesis xy ≠ 1.
- **Distribution** is stated in Lean on the star domain Ω_m, which contains the disc, for every integer weight, with the n ≤ 0 extension to z^m ≠ 1.
- **Layer 2 and branch independence are typed** on Tau Ceti's continuation carriers: `continuesInside_polylogTower`, `polylogTower_monodromy_zero` and `polylogTower_monodromy_one` on germs, and `singleValued_eq_of_isAnalyticContinuationAlong` (Zagier's combination of any continued tower is Lₙ at the endpoint).
- The design's check "a path from 1/2 to −1 within Ω∩X" with the straight segment was wrong: the segment passes through 0. It was replaced by the upper half of |z + 1/4| = 3/4, with the lower half as a contrast, Log = −πi.

## What the README does not do

- Weights are integers, as in the accepted design. Mathlib PR 44531 (open, head b4a0d95) defines a complex-order `Complex.polylog`. The names of Layer 1 follow it, and the README states that Liₙ agrees with it at order n off z = 1, so adopting it replaces the definition. No complex-order theory is planned.
- The maximum D(e^{iπ/3}) = 1.0149… ([Z07] p. 10) appears only as a Check, not as a target.
- Zagier's extension of the Rogers function to ℝ and ℙ¹(ℝ) modulo π²/2 is stated in Scope as not constructed, following the design's restriction to [0,1].
- The function on the universal cover, the action of arbitrary words, the continued functional equations, the sphere cross-ratio, branchwise sector growth, the moduli at 1 and ∞, and compact derivative bounds are README targets only. They are listed in the closing comment of `Suggested.lean`.

## Adversarial pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `polylog` definition | n = 0 at 1/2; n = −1; n = 1 at 3; z = 0 for n = −3…3; n ≤ 1 at z = 1 | values 1, z/(1−z)², −log 2 − πi, 0; pole only totalised | `not_continuousAt_one_polylog_neg` and the rational form with A_r(1) = r! added |
| disc series | n = 1 against Mathlib; n = 0, −1 at 1/2 | 1 and 2 | none |
| derivative recursion | z = 0; n ≤ 0 | product form holds at 0, quotient form not stated there | stated as `mul_deriv_polylog_add_one` (PR name) |
| conjugation | x = 3 on the cut | false for the total function | hypothesis z ∈ Ω kept |
| closed disc | n = 1 | divergent at 1 | n ≥ 2 kept |
| jump / lower value | n = 1, 2, 3 at x = 3 | +2πi, lower value is the total value | lower-value theorem for all n ∈ ℤ |
| distribution | n = 0, −1, 2, 3; m = 1, 2, 3; z = 1.5i, −1.3 + 0.4i | holds on Ω_m; factor 1/m at n = 0 | Lean statement on Ω_m |
| inversion | n = 1…4 at z = −1, 3, 1/2, 1, −2; n = 0, −1 | see above | domain z ∉ [0,1]; nonpositive weights added |
| reflection | z = −2, −1/2, 0, 0.3, 1, 3 | holds everywhere | hypotheses removed |
| Abel | x = 0; x = y = 1/4; random | holds; fails by log²(3/4) without the product term | Check |
| `bernoulliCoeff` | B₁ = +1/2 | c₀ + c₁ = 2 ≠ 0 | Check; examples c₁ = −1, c₂ = 1/3 |
| Lₙ inversion / conjugation / distribution | n = 2…5; z on the cut at 2.5; z = 1; m = 2, 3 | all hold; at real x > 1 even weights vanish | statements for all z (conjugation, distribution) and z ≠ 0 (inversion) |
| Lₙ differential | n = 2…5 at three points, against difference quotients | agree | none |
| L₃ at 1 | difference quotients in four directions | tend to 0 | none |
| D symmetries | z = 0, 1 with Lean's 0⁻¹ = 0 | hold for every z | stated without hypotheses |
| D one-form / Laplacian | z = i, 2, 2.5, 0.3 + 0.7i | log 2/2, 0, log 2·Im v; ΔD(i) = −1, 0 on the axis | none |
| positivity | Im z = 0 | strict inequality false there | Im z > 0 kept |
| alternating five-term | x = y, x = 1, y = 1, x = 0, y = 0 | only x = 0 or y = 0 fail | hypotheses x ≠ 0, y ≠ 0 only |
| Abel form of D | x = 1, y = 1, x = 0, x = y, random | holds | no hypotheses |
| cyclic form | random; x = 0; x = 1 | holds | hypothesis xy ≠ 1 |
| projective form | five random points, with and without signs | 0 with signs, −0.770 without | Check |
| Rogers pentagon | x = y = ρ; x = y = 1/2; Li₂ in place of R | holds; Li₂ fails by log²(3/2) | Checks |
| disc tails | n = 2, z = 1/2, N = 1; n = −1 | 0.0822 ≤ 1/8; the positive-weight bound is invalid at n = −1 | separate n ≤ 0 bound |
| continuation to −1 | straight segment | passes through 0 | replaced by a half-circle |

Sign and normalisation witnesses, each a README Check:
- Li₁(3) = −log 2 − πi, the lower value;
- c₁ = −1;
- T₁(base) gives Li₁ = log 2 − 2πi;
- Li₂(T₁T₀p) − Li₂(T₀T₁p) = 4π²;
- r(∞,0,1,z) = z, while the GR bracket gives 1 − z;
- Tau Ceti's universal-cover action prepends g⁻¹.

## Untrusted text

No issue comment other than the bot's, and no fetched page, contained instructions. Nothing suspicious was encountered.

## Next step

The independent package review (REV-PKG-PolylogarithmFunctions). These points deserve a reviewer's attention:
- the locator corrections listed above;
- the hypothesis changes of the reflection, inversion and five-term statements, which numerics support but which are not proved;
- the Layer 2 conventions against Tau Ceti's left action.
