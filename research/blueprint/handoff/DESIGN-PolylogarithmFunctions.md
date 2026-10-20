# DESIGN-PolylogarithmFunctions

Issue: #11333. Worker: Codex, session `codex-5bZtDD`. Claim confirmed by the bot on 2026-10-20 at 10:34:26 UTC. Branch: `codex-5bZtDD-polylogarithm-functions`.

## Completed design

The roadmap definition, blueprint packet, definitive reader document and compact suggested file cover all seven layers. The packet is `closed`; PF.1, PF.2, PF.3, PF.4, PF.5, PF.6 and PF.7 each have closed coverage and empty remaining lists. There are no gaps or supplier requests. All implementation statuses remain `unchecked`: elaborating proposed statements does not prove them.

The packet contains 45 target nodes: 4 definitions, 1 construction, 3 lemmas, 36 theorems and 1 comparison. The definitions and construction carry 31 API items and 22 discriminating tests. There are 27 planets, with at most six in a layer, and 21 exact baseline declaration references.

The analytic construction depends only on pinned Mathlib and Tau Ceti and its own earlier targets. It supports every integer classical weight, every continuation branch of the fixed principal germ, and all single-valued weights at least two. Evaluating under a complex embedding imposes no restriction on the number field. Algebraic symbols, configuration complexes, Bloch groups, K-theory, regulator descent, period conventions and arithmetic certificate types remain with their owners.

## Full P.1 transfer

The maintainer explicitly authorized moving the analytic layer out of Polylogarithms. The following map accounts for every target and Check in the source package's P.1, in new wording.

| Former P.1 material | New owner and preserved checks |
| --- | --- |
| §1.1 principal family | PF.1: every integer index, actual radial integral, endpoint and interior-singularity integrability, rational negative weights, disc series, recursion, derivative at zero, slit analyticity, conjugation and closed-disc continuity. Checks include the weight-one Taylor series, zero in every weight, Li₀(1/2)=1, Li₋₁=z/(1−z)² and exclusion of the pole at one. |
| §1.1 constants and jump | PF.3 dilog-values: the values at 1/2, −1 and 1. PF.1 analytic-recursion: z·Li₃′=Li₂. PF.2 jump: the +2πi jump at x=3, excluding a global continuous principal branch. |
| §1.2 functional equations | PF.3: all-integer distribution, principal star-domain continuation, rational continuation and Bernoulli inversion with the off-axis restriction. Retains the m=2, z=1/2 duplication check and n=2, z=−1 inversion check. PF.2 fixes the positive discontinuity and negative counterclockwise monodromy. |
| §1.2 Bernoulli cancellation | PF.4 bernoulli-parity and branch-independence: B₁=−1/2, the scaled generating series, its even transform and cancellation for arbitrary loop words. No classification of all coefficient systems is claimed. |
| §1.3 single-valued family | PF.4: the Bernoulli formula, real/imaginary parity, real analyticity, continuity, inversion, conjugation, distribution, sphere endpoints and the full all-weight real derivative on coherent branches. The second derivative sum starts at one. The weight-one expression is distinguished from the unit logarithm; Zagier's Pₙ normalization is distinguished from Dₙ and D̃ₙ. |
| §1.3 diagnostics | PF.4 and PF.5: L₂=D, L₃(1)=ζ(3)>0, L₃(−1)=−3ζ(3)/4, circle parity, different conjugation/inversion signs, and the zero real derivative of L₃ at one. |
| §1.4 Bloch–Wigner | PF.5: actual argument-corrected function, sixfold symmetry, real-axis zeros, D(i)>0 and D(−i)=−D(i), actual derivative including the cut, and Laplacian. The directional checks at i and the transverse derivative at 2 are explicit. The generic minimum principles are existing Tau Ceti results; their half-disc application and exhaustion are the new target. |
| §1.4 endpoint behavior | PF.7: D(it)=t(1−log|t|)+O(|t|³(1+|log|t||)), ruling out a finite real derivative at zero. This is not extended to all weights. |
| §1.5 five-term | PF.5: the exact alternating affine relation, projective alternating deletion and cyclic bracket form. The cyclic identity 1−xᵢ=−xᵢ/(xᵢ₊₂xᵢ₊₃), differential cancellation, connectedness and degeneration supply an analytic proof before algebraic descent. Both worked complex pairs and the collision restriction are retained. |

PF.2 additionally gives the coherent path-based tower, fixed-endpoint homotopy invariance, generation by the two puncture loops and arbitrary-word monodromy. PF.3 includes principal reflection, Abel and their common-path continuation. PF.6 supplies interval Rogers normalization, derivative, reflection, pentagon and golden-ratio values. PF.7 provides quantitative disc/circle tails, branch-sector growth, endpoint moduli, compact bounds for every real derivative and bounds on finite analytic sums.

## Ownership and integration actions

The packet's `restructure` records the authorized split. Insert **PolylogarithmFunctions before K3BlochGroups** in the dependency order. These are maintainer integration actions, not changes made to other jobs in this PR.

- Replace the old Polylogarithms P.1 analytic owner by PF.1–PF.7. Polylogarithms P.2 consumes PF.4–PF.5 and PF.7; its higher analytic uses consume PF.4's all-weight differential and endpoint conventions. P.2 onward retains its arithmetic constructions.
- Redirect the analytic part of `KU-polyloganalysis`, the HabiroNahmSeries HB.3 complex-evaluation input and the PeriodsAndSpecialValues PS.9 classical-function input from the old aggregate P.1 edge to PF.1–PF.4/PF.7 as appropriate. Do not transfer multiple-zeta or motivic objects. HB.8's formal product calculations take their formal-series input from ColemanIntegration rather than acquiring complex-analysis prerequisites from the old aggregate edge.
- K3BlochGroups V.3/V.4/V.6 retains algebraic cross-ratio configurations, exact torsion and algebraic maps. Where it needs an analytic comparison, import PF.5's analytic five-term theorem; do not use the comparison to prove that theorem.
- HabiroNumberFields HB.2 retains the cyclic quantum dilogarithm in a Kummer extension. It can consume analytic identities here for its complex comparison without moving that algebraic object here.
- BorelRegulators R.1/R.2 retains regulators and normalization. Its analytic evaluation input is PF.4–PF.5/PF.7. ArithmeticQuantumTopology QT.5/QT.7 is the present concrete quantum-modularity consumer. There was no separate `QuantumModularity` roadmap id in the inspected atlas; the brief's name is not fabricated as a supplier.

No existing link packet mentions the new stage ids or the old P.1 stage as a matching entry. The existing stage edges and consumer descriptions were inspected. No other packet, order file, application file or atlas data was edited.

## Baseline and design audit

The accepted Polylogarithms:P.1 library audit was read. Its logarithm and Bernoulli Fourier substrate is cited, not re-planned. Actual source statements were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 21 exact references include the logarithm/Taylor API, Bochner interval integral, FTC, logarithmic integrability, Bernoulli numbers and polynomials, Fourier/zeta APIs, analytic uniqueness, connected finite complements, zero-derivative constancy, path homotopy, local continuous logarithms and weak/strong minimum principles.

The current TauCetiRoadmap and current Tau Ceti source trees were also searched, including the roadmaps absent from the atlas snapshot and Completed/ContourIntegration and Completed/EffectiveBounds. Their generic analytic infrastructure is not duplicated. No current analytic polylogarithm or Bloch–Wigner implementation was found.

[Mathlib PR 44531](https://github.com/leanprover-community/mathlib4/pull/44531), open at inspection, proposes `Complex.polylog s z` for complex order and the same lower-boundary convention. Its inspected head was `b4a0d9535bbc449a7605af66613985770ac26bf8`. The reader adopts its production API shape and integer restriction. The compact pinned prototype stays in a roadmap namespace with an equivalent radial-integral realization; it does not assert that the PR is in the baseline. Public Zulip/archive searches found no additional settled design. The external [LeanPolyLog catalogue entry](https://reservoir.lean-lang.org/@rainrzk/LeanPolyLog) is credited as an overlapping formalization lead, not used as a supplier. No external PR code was copied or executed; code integration is not a deliverable.

## Sources and conventions

The reader and packet record URLs, access date 2026-10-20, exact sections/pages, source versions and hashes. Read for this job:

- Zagier, *The dilogarithm function*: Part I §§1–3, pp. 3–12; Part II §1.A, pp. 23–24; Part II §4, p. 59.
- Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*: §7, equations (33)–(36), Proposition 3, pp. 413–414.
- Oesterlé, *Polylogarithmes*: §§1.1–1.4, pp. 50–51; §§2.1–2.2, pp. 52–53; §3, equations (18)–(28), pp. 57–58; §4.1, equations (29)–(32), p. 59.
- Goncharov, *Geometry of configurations, polylogarithms, and motivic cohomology*: §1.0, p. 201, for the classical recursion and Bloch–Wigner definition only.
- Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*, arXiv:math/0003086v1: §4.1, Proposition 4.1 and Lemma 4.2, equations (28)–(32), pp. 17–20, for analytic differential formulas only.
- Goncharov–Rudenko, arXiv:1803.08585v5: §1.1, equations (1)–(4), pp. 2–4, for analytic normalization and the cyclic five-term formula only.

Lewin's book was neither freely available nor listed as a cleared local reference. It was not read or used to support a target; it appears only as historical bibliography. Freely readable sources and explicitly derived proof steps support every target, so there is no source gap. No source error is alleged, and `sourceIssues` is empty. All source descriptions and mathematical statements are in the worker's own words; no source excerpts or source files are committed.

Conventions needing careful independent review are fixed explicitly: lower principal values versus upper-minus-lower jumps; left-prefix monodromy and its noncommuting composition; coherent continuation of every weight; B₁=−1/2; parity-sensitive endpoints; and r versus the GR bracket, which is 1−r, and the reciprocal Suslin ordering. The all-weight derivative is proved on local branches before extending across the cut. Positivity uses the existing analytic principles, not a volume interpretation.

Sources, fetched pages and other authors' PR content were treated as data. No suspicious executable instruction was encountered or followed. No credentials or commands from those texts were used.

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/PolylogarithmFunctions.json`: zero errors and zero warnings; all 21 baseline names verified against the declaration index.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PolylogarithmFunctions.lean`: passed.
- `lean-check` on the suggested file: elaborated successfully against the shared pinned build, with only the expected unproved-theorem warnings. Memory was checked first. The file has 337 lines, five light real-bodied definitions and nine proved examples; heavy branch-cover objects remain fully specified reader targets. No Lean server, build or dependency update was run.
- Final deliverable-path, JSON and whitespace checks are recorded in the PR description.

Nothing remains to finish this design pass. The next job is independent mathematical review, especially of the listed conventions and the complete old-P.1 transfer, followed by the ordinary package/integration pipeline after acceptance. There is no implementation claim and no second job was claimed. The handoff is self-contained; no scratch file is needed to resume.
