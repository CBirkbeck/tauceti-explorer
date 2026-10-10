# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex (GPT-6), session
`codex-DfXYPy`, 10 October 2026; atlas base `334197e7d`.
Claim confirmed by the bot for comment 6099600179.

This continues [PR #8487](https://github.com/CBirkbeck/tauceti-explorer/pull/8487).
The reviewed fix is `FIX-RT-AREA-topology~4`, Codex `codex-BLPWxk`,
[PR #6873](https://github.com/CBirkbeck/tauceti-explorer/pull/6873).
This session did none of that fix, its predecessors, the original blueprints,
red team or finding verification. It claimed only this review.

The three reviews named in the issue are complete. The queue additionally
requires two packet reviews outside the issue's writable scope; that unresolved
scope conflict makes this submission a **checkpoint**, rather than a completed
queue job. A `needs_changes` verdict itself completes a bounded review.

| Listed packet | Bounded verdict | Reason |
|---|---|---|
| Polylogarithms | accepted | P.2 owns the ideal-tetrahedron formula and explicitly requests its missing geometric carrier. |
| HabiroNahmSeries | accepted | The six exports retain their separate formal/analytic and arithmetic hypotheses; numbered source locators corrected below. |
| QSeriesPartitionsAndMockModularForms | needs_changes | Scalar ownership is correct, but the reader still has four concrete discrepancies. |

These are verdicts on the assigned fixes, not new acceptances of all unrelated
blueprint declarations. Prior reviews are preserved in `reviewHistory`.
All statements, hypotheses, APIs, tests, planets, coverage, gaps and requests
are retained. No suggested declaration changed and nothing is claimed formalised.

## Fresh source and contract checks

**Finding /7.** Read Zagier, *The Dilogarithm*, I.4, equations (7)–(9), printed
pp. 13–14, alongside Goncharov's introduction item 5, p. 7, and §6, p. 53.
P.2 owns the ordered tetrahedron identity and QT.5 assembles manifold sums.
GeometricTopology supplies the model and metric foundations; its volume API
does not provide the ideal-boundary/oriented-region carrier. The latter remains
an explicit gap. The reviewed P.2 part's Milnor-angle proof route remains
independent of that missing geometric interface. Its earlier Milnor source
reading is retained evidence; this session did not retrieve Milnor's Appendix
and makes no fresh reading claim for it.

The exact missing QT edge is still present as a defect: the current
`ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` statement imports the
P.2 tetrahedron identity, but its prerequisites omit
`Polylogarithms:P.2/hyperbolic-volume`. Its open P.2 request is not a substitute
for the exact existing supplier under PROTOCOL §3. After scope authorization,
add that node id, retaining G4/G5 and the geometric comparison request.

Also document the ordered-sign conversion. P.2 normalizes `(∞,0,1,z)` to z;
QT normalizes `(0,∞,1,z)` to z. On the same ordered quadruple the two raw
cross-ratios are reciprocal, so `D(1/z) = -D(z)`. Exchanging the first two
vertices changes the ordered-volume sign. The imported equality must therefore
specify the corresponding vertex-order/orientation conversion. This observation
does not by itself prove that either independently chosen convention is wrong.
The consumer files were inspected read-only.

**Finding /11.** Read GZ §1's analytic setup and §3, equations (13)–(21),
printed pp. 4–6, and GSWZ §1.8 and §2.5, equations (110)–(127), pp. 28–31.
The analytic radial theorem requires positive-definite rational A, its positive
real solution, an odd root order prime to a quadratic denominator, and specified
branches. The formal Gaussian bracket instead uses an invertible symmetric
Hessian over a rational algebra and a completion that makes each coefficient
finite. The figure-eight matrix has kernel `(1,-1)`; it is not an analytic
positive-definite example. The NZ-to-Nahm dictionary retains the integral and
unimodular conditions on B. No formal bracket proves knot invariance or an
analytic remainder estimate.

Checked all six HB.10 exports against their actual supplier nodes: HB.4's
Euler–Maclaurin remainder, formal bracket and radial expansion; HB.8's Gaussian
collection and qualified identification; HB.9's coefficient-module membership.
HB.8 G1/G2 and the HB.9 signed Kummer, auxiliary coprimality, coefficient
transfer, full finite étale algebra/HB.7 descent and integral-gluing obligations
remain. The numerical figure-eight and module-membership assertions are not
promoted to topological or scalar-ring statements.

Corrections made in the base Habiro packet:

- In `HB.8/fgi-collection`, replace the proof-outline label `Psikdef` by
  equation (114), printed p. 29, and `FGIcong` by equation (126), printed
  p. 31. Identify the stated m=1 specialization with equation (127).
- Add the source-support entry for (114), (126)–(127), using our own words.
- In `HB.4/formal-gaussian-integration`, remove the incorrect claim that
  (110)–(111) cross PDF pages 28 and 31; both are on printed p. 28.

These are locator corrections. No mathematical assertion or Lean signature changes.

**Finding /13.** Read Zagier, *Quantum modular forms*, p. 2 and Examples 3–5,
pp. 10–13, and Lawrence–Zagier §3, Theorems 1–2, p. 98, and §4's multiplier
comparison. QM.5 supplies the scalar real-analytic discrepancy and additive
cocycle. Nonzero normalized factors exclude the identically-zero factor; the
Kontsevich example retains the inverse eta multiplier for its lower-boundary
branch. QT.7's knot matrices and conjectural asymptotic laws are separate from
that scalar predicate. The requested general matrix extension remains open;
calling a discontinuous knot cocycle quantum modular supplies no analytic proof.
The WRT/false-theta comparisons retain QT.3/QT.4 and HC.3/HC.4 normalization
inputs and their analytic comparison obligations.

Four reader corrections remain outside this issue's listed deliverables:

1. At the export table near line 2964, add the ninth scalar additive-cocycle
   contract (`QM.5/quantum-modular-cocycle`).
2. Near line 2972, specify the inverse eta multiplier on the lower branch.
3. Near lines 2818 and 2987, distinguish Glaisher's scaled c_n from the Taylor
   coefficients c_n/(24^n n!). The first four Taylor coefficients are
   1, 23/24, 1681/1152, 257543/82944, not the four unscaled integers.
4. Near lines 4166–4168, replace the unwritten/no-nodes QT.7 account with the
   current consumer plan and its QM.5 → QT.7 direction.

The trefoil comparison is already qualified. Broader native-form, fifth-order
and proof/supplier objections from earlier independent reviews remain in
history; this bounded verdict does not discharge them.

## All 27 assigned findings

Read all assigned claims, verification verdicts and the round-four fix report.
The following dispositions retain the preceding independent audit, supplemented
by the fresh /7, /11 and /13 checks above. “Handoff accepted” assesses the
owner/contract disposition; it is not an implementation claim or replacement
of an out-of-scope packet's independent review.

| Finding | Verdict and reason |
|---|---|
| /1 | **Handoff accepted.** GeometricTopology supplies realized framed links and surgery; QT consumes those and pinned diagram data. G1 retains realization/linking/surgery gaps. |
| /2 | **Handoff accepted.** Hoste/refined calculus and admissible presentations precede twisting and JM independence. Ordinary Kirby moves are distinguished from admissible moves. |
| /3 | **Handoff accepted.** The h-adic ribbon/even integral form, bottom-tangle invariant, cyclotomic completion and twist are named. Ordinary Hopf/monoidal tools are imported; quantum completion stays G2. |
| /4 | **Handoff accepted.** General Drinfeld–Jimbo/core, parity, colors and WRT interfaces are named; G2 retains generic universal-invariant/highest-weight needs. Rank one does not supply every Lie type. |
| /5 | **Handoff accepted.** The Jones comparison and G3 retain variable/mirror/framing/root conventions. A Temperley–Lieb representation alone supplies no Markov trace. |
| /6 | **Handoff accepted.** P.1/P.2 supply dilogarithm/regulator identities; V.3/V.4/V.6 supply groups, comparisons and certified elements. V.5 computations are not a regulator supplier. |
| /7 | **Supplier fix accepted; consumer edge needs correction.** P.2 is the single tetrahedron-volume owner, importing metric/model geometry; QT.5 owns manifold sums. The early region gap remains. The current QT volume node omits the exact P.2 theorem from its prerequisites; see the read-only observation below. |
| /8 | **Handoff accepted.** Cusped face-pairing/completeness/finite-volume geometry is requested. G4 keeps connectivity/rigidity/trace-field conditions; closed Mostow material is insufficient. |
| /9 | **Handoff accepted.** Extended pre-Bloch/kernel, flattenings and Rogers comparison are specified. G5 retains cut-cover, transfer and torsion conditions; no canonical lift follows from ordinary descent. |
| /10 | **Handoff accepted.** NZ/root-refined data, formal series, invariance and integral-Nahm comparison are named. G6 preserves unimodularity, coefficients, parity, normalization and actual HB refinements. |
| /11 | **Supplier fix accepted.** Six exports keep formal and analytic restrictions separate. Corrected numbered locators/pages; earlier numerical/topological boundaries remain. |
| /12 | **Handoff accepted.** Kashaev evaluation/lift, volume conjecture and sourced proved cases are distinguished. G3 normalization survives. |
| /13 | **Reader needs changes.** Nine scalar contracts and the matrix-extension route are correct; synchronize the four reader locations above and retain broader blueprint objections. |
| /14 | **Handoff accepted.** Faddeev operator/functional identities, selected analytic and charged/leveled AK constructions are named. G7 preserves contours, operator closure, microlocal products and tails. Generic formal pentagon remains an imported toolkit request. |
| /15 | **Handoff accepted.** General resurgence/Borel summation is out of scope. Knot coefficient asymptotics remains a named conjecture with G8's phase discrepancy. |
| /16 | **Handoff accepted.** QT Part II records the Wheeler knot lift/relative-Habiro direction and Habiro §7/MMR inputs; Bouis–Gazda remains excluded. |
| /23 | **Upstream handoff accepted.** Relative groups take every based pair. NDR/CW belongs on comparisons/excision. Current Stage 8.1 prose still restricts the definition; Suggested.lean lines 341–343 takes arbitrary BasedTopPair. Its proof is admitted. |
| /24 | **Upstream handoff accepted.** Spectral objects are not a convergent filtered-chain package. The inventory still lists exact couples; one owner must supply boundedness, convergence, edge maps and naturality. |
| /26 | **Upstream handoff accepted.** CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz are prerequisite contracts for the topology owner. |
| /29 | **Upstream handoff accepted.** Internal topology order and exact external suppliers/consumers require maintainer coordination; upstream link data is outside the writable scope. |
| /33 | **Upstream handoff accepted.** UniversalCovers/current library owns absolute higher-homotopy maps and basepoint transport; AlgebraicTopology supplies relative groups/comparisons. |
| /81 | **Upstream handoff accepted, current owner updated.** GeometricTopology keeps ball/handle/gluing/rounding interfaces. DifferentialGeometry 5.5 already owns abstract corner boundaries and face orientations. |
| /82 | **Upstream handoff accepted, current owner updated.** Ambient/support-sensitive isotopy extension and gluing remain separate. DifferentialGeometry 3.3 already owns connected-manifold homogeneity. |
| /87 | **Upstream handoff accepted.** Layer 9 still misattributes mapping classes to diffeomorphism-group topology. Surface classification, boundary sum and a specific Morse/triangulation route need exact suppliers. |
| /91 | **Upstream handoff accepted.** Geometric internal order and misplaced unlocks need coordination. Current layer 7 already imports HopfRinow and implemented Riemannian volume. |
| /103 | **Upstream handoff accepted, old proposed supplier superseded.** DifferentialGeometry 0–2 and 5 already owns forms, pullback/derivative, orientation and Stokes. Import its actual regularity/compact-support/outward-first contract. |
| /105 | **Upstream handoff accepted.** HF needs actual 4D triple-manifold, Spin-c, handle/cobordism and absolute-grading contracts. Neither 3D Kirby calculus nor an algebraic spin group supplies them. Correction terms retain rational-homology-sphere hypotheses. |

The eleven upstream dispositions remain maintainer notes. No upstream roadmap,
live atlas data, extract, link map or restructuring-result file was edited.

## Baseline, existing owners and validation

Read the reviewed AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10 and AUDIT-15 QM.5
entries in `data/library-coverage.json` before assessing ownership.

Fresh pinned-source checks confirmed the shared Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`; read `AnalyticOnNhd` and
`Matrix.PosDef` in their source files. Fetched the raw Tau Ceti files at
`f790474821cf4256814db967cb154e7af3d0c369` and compared them byte for byte
with the shared sources before reading `FramedOrientedPDCode`,
`TauCeti.covMatrix_multivariateGaussian`, `TauCeti.multivariateGaussianPDFReal_def`
and `TauCeti.multivariateGaussian_eq_withDensity`. The covariance theorem
requires positive semidefiniteness; the density law requires positive
definiteness. The density's defining formula is not a density-law theorem
for a singular covariance, and none supplies algebraic formal integration.

Read current TauCetiRoadmap at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`: relevant GeometricTopology,
AlgebraicTopology and DifferentialGeometry documents/signatures. Current Tau
Ceti's Riemannian volume and isometry-invariance source was also read.
Manifold forms/Stokes, abstract corner boundaries and connected-manifold
homogeneity already have upstream owners. No library or upstream roadmap was
edited, and no Lake command was run in the read-only environment.

Public sources retrieved on 10 October 2026 and inspected for the bounded
checks above:

| Source | PDF SHA-256 |
|---|---|
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [GSWZ, The Habiro ring of a number field, v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Garoufalidis–Zagier, Nahm asymptotics, v1](https://arxiv.org/pdf/1812.07690v1) | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [Lawrence–Zagier, Modular forms and quantum invariants](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |
| [Zagier, The Dilogarithm](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Goncharov, Arakelov motivic complexes, v3](https://arxiv.org/pdf/math/0207036) | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |

Fresh `python3 scripts/check_blueprint.py` checks of the three listed packets
report **zero errors and warnings**, with 75/109/537 nodes, 19/22/22 gaps and
21/9/25 requests. All implementation statuses remain unchecked; no source
excerpt field is present. Intake path/content checks and `git diff --check`
pass. Semantic comparison confirms only the two cited Habiro source/proof-outline
records and review metadata changed; previous reviews are retained.

No Lean file changed in this session. The preceding #8487 reviewer recorded
successful sequential `lean-check` runs with only `sorry` warnings:
Polylogarithms 462, HabiroNahmSeries 441, QSeries 1,469. Earlier retained
read-only evidence records P.2 part 52 and QT 65. These are prior compilation
results, not fresh runs or proofs. Recompilation is unnecessary for JSON source
locators and review metadata; no language server, build, update or cache was run.

## Blocking scope mismatch and next action

The GitHub issue and full instructions allow only this report, three base
supplier packets and their three suggested files.
[WORKERS.md](../WORKERS.md) explicitly says: “Edit only the files the issue
names, plus your own scratch space.” The queue additionally lists four paths:

- `research/blueprint/packets/ArithmeticQuantumTopology.json`
- `research/blueprint/suggested/ArithmeticQuantumTopology.lean`
- `research/blueprint/packets/Polylogarithms--P.2.json`
- `research/blueprint/suggested/Polylogarithms--P.2.lean`

The queue prompt is absent. `issues.py:deliverables_complete` requires this
job's reviewer identity on all five packet outputs, so the seven-output
issue predicate passes while the eleven-output queue predicate fails.
The extra packets retain their accepted full independent reviews; this worker
did not alter them or the completion logic.

Explicit authorization for the four extra paths was requested in this session
and has not arrived. Further listed-file rechecks cannot remove this blocker.
Resolve the file scope before continuing: either authorize the queue outputs,
or align the queue with the actual issue deliverables. Once authorized, finish
the bounded QT /1–/16 and P.2 /7 reviews, preserving prior full reviews in
history; add the exact QT volume prerequisite and document its ordered-sign
conversion. Preserve QT's eight gaps/nineteen requests and P.2's two gaps/three
requests. Reader synchronization remains a separate job and does not invalidate
a completed `needs_changes` review. No next worker needs scratch files.
