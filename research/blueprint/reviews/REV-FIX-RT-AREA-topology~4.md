# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex (GPT-6), session
`codex-adGaRg`, 10 October 2026. Atlas base
`fc29fda2f2c6120221f6e8beea78e7e9436c8fca`.

This continues [PR #8436](https://github.com/CBirkbeck/tauceti-explorer/pull/8436),
after checkpoints #8425, #8414, #8353 and #6944. The reviewed fix was
`FIX-RT-AREA-topology~4`, Codex `codex-BLPWxk`,
[PR #6873](https://github.com/CBirkbeck/tauceti-explorer/pull/6873), merge
`c1b39075`. I did none of that fix, its predecessors, the red team,
verification, or the blueprints/assemblies examined here.

The three supplier reviews named in the issue are complete. All 27 assigned
findings are accounted for below. A `needs_changes` verdict completes the
review; it identifies a correction rather than promising an unfinished audit.
The local queue also demands two packet reviews outside the issue's writable
scope. That conflict, described at the end, prevents completion of the queue job.

| Packet | Bounded fix-review verdict | Reason |
|---|---|---|
| Polylogarithms | **accepted** | Correct single owner for tetrahedron volume and geometric prerequisites; ideal-region supplier gap remains explicit. |
| HabiroNahmSeries | **accepted** | Formal and analytic exports retain distinct hypotheses; corrected public equation/page locators. |
| QSeriesPartitionsAndMockModularForms | **needs_changes** | Correct scalar owner and matrix-extension route; reader still disagrees at the four locations below. Broader blueprint rejections remain binding. |

Each new top-level review names this job and session. The overwritten reviews
from PR #8436 are preserved in `reviewHistory`, alongside the earlier full
blueprint and fix reviews. No stage is promoted to closed, no gap/request is
removed, and no suggested declaration changes.

## /7: tetrahedron volume

Rechecked `P.2/hyperbolic-volume`: it imports GeometricTopology layers 7 and 8
and has matching requests for their metric/model interfaces. Its ordered
cross-ratio is `r(∞,0,1,z)=z`; positive imaginary part gives positive ordered
volume. Goncharov, introduction item 5, p. 7 and §6, p. 53, and Zagier,
Dilogarithm I.4, pp. 13–14, equations (7)–(9), support the sign and supplier
boundary. P.2 proves the tetrahedron identity; QT.5 assembles the manifold sum.
There is no reverse QT.5 prerequisite.

The accepted P.2 part contains the Milnor/Lobachevsky proof route, separate
from the early ideal-boundary/measurable-region gap. Existing volume and
Mostow interfaces alone do not construct that region or its orientation.
The current library's Riemannian measure and isometry invariance are existing
work to import, not new atlas targets. No mathematical edit was needed here.
The P.2 part was inspected read-only; its full independent acceptance was not
replaced. The AMS Milnor PDF returned HTTP 403 in this session, so I do not
claim a fresh reading of its Appendix. Its earlier source reading remains the
evidence for that citation.

## /11: formal Gaussian data and Habiro exports

Rechecked the six exact exports: Euler–Maclaurin, formal Gaussian integration,
radial asymptotics, HB.8's Gaussian collection, its qualified identification,
and HB.9 module membership. QT.5 supplies the geometric example, QT.6 owns
NZ comparisons/topological invariance/state-integral choices, and QT.7 owns
knot modularity. The base Habiro machinery does not take QT.6/QT.7 as premises.

The figure-eight matrix kills `(1,-1)` and cannot satisfy analytic positive
definiteness. GZ Theorem 3.1, pp. 5–6, uses positive-definite rational data,
a distinguished positive real solution, and an odd root order coprime to a
quadratic denominator. GSWZ §1.8, pp. 15–17, makes the formal NZ comparison
under its separate integral/unimodular conditions. The formal Gaussian
operator instead uses a symmetric invertible Hessian over a Q-algebra with
the completed domain controlling coefficientwise finiteness. Neither a
probability measure nor a formal bracket supplies the other's analytic theorem.

HB.8/HB.9's controlling refinements retain G1 prefactor reconciliation, G2
uniform regularity, the correct jet and auxiliary coprime order, coefficientwise
Kummer descent, signed Kummer orientation, excluded primes, coefficient
transfer and all-order integral gluing. The full quadratic finite étale
`B=R[T]/(δT²−1)`, including split components and HB.7 descent, is retained.
The knot consumer's G6 imports these obligations. Membership is not an
unconditional scalar-ring or topological-invariance consequence.

The preceding checkpoint's small source/numerical/comment corrections are
retained. The material reader export omissions were already resolved; its
controlling refinements and comparison maps remain explicit. A later authorized
reader synchronization should carry the updated locators below.

Corrections made **in this session**, all in the base Habiro packet:

- `HB.4/formal-gaussian-integration`: replace the internal TeX bracket label by
  GSWZ §2.5, equations (110)–(111), printed p. 28; the equation spans PDF pages
  28 and 31 because of inserted figure pages. Replace the GZ TeX labels by
  §3, equations (13)–(14), p. 4. The statement now also names (110).
- `HB.4/radial-asymptotic-expansion`: use GZ Theorem 3.1, equations (18)–(21),
  pp. 5–6, rather than internal labels. Describe the supporting hypotheses in
  our own words instead of claiming a verbatim transcription.
- `HB.4/kummer-invariance-of-the-expansion`: correct the location of (21) from
  p. 5 to p. 6. Likewise extend the GZ locator of
  `HB.4/simplified-form-and-the-unit` to pp. 5–6.

These are provenance corrections; no theorem hypothesis or mathematical API
changes. The source's unresolved coefficient-descent issue remains recorded.

## /13: scalar periods and matrix cocycles

Rechecked all nine QM.5 scalar export contracts, including the additive period
cocycle. Its factor is nonzero and normalized by `ε(1)=1`, ruling out the zero
factor counterexample. Half-integral weights retain the lower-boundary branch.
The Kontsevich function uses the inverse eta multiplier for that convention;
the explicit generator values agree. These clarifications were made in
PR #8436, not in this session.

Zagier, Quantum modular forms p. 2 and Examples 3–5, pp. 10–13, distinguish
scalar periods from the knot matrix construction. Lawrence–Zagier Theorems
1–2, p. 98, compare the rescaled WRT invariant with its analytic radial function
and formal expansion; §4, pp. 102–104 has the vector transformation law.
The packet retains the subgroup/multiplier qualifications and the separate
QT.3/QT.4 and HC.3/HC.4 comparison inputs. Algebraic evaluation is not an
unqualified analytic limit.

The missing general matrix-valued multiplicative cocycle interface is explicitly
routed to `QSeriesPartitionsAndMockModularForms, Part II where this general
interface is absent`. QT.7 owns its knot matrices and their comparisons.
Common pole-free domains, branch-aware weights and analytic extension criteria
remain obligations. The supplier direction QM.5 → QT.7 is acyclic with
QT.4 → QM.5. A conditional knot composition law does not close the generic gap.

The reader still needs four concrete corrections (it is outside this job):

1. In the export table beginning near line 2964, add the ninth scalar additive
   cocycle contract. The eight existing rows do not include it.
2. At line 2972, specify the inverse eta multiplier with the lower-boundary
   convention, rather than the eta multiplier.
3. At the value-formula account near line 2818 and acceptance test at line
   2987, distinguish Glaisher's scaled `c_n` from the Taylor coefficient
   `c_n/(24^n n!)`. The unscaled integers are not the coefficients of
   `e^{-t/24}F(e^{-t})`.
4. At lines 4166–4168, remove the assertions that QT.7 has no nodes and is a
   prospective consumer. Its current accepted packet has 106 nodes; use its
   existing owner split and the QM.5 → QT.7 direction.

The trefoil row already requires the color, orientation and normalization
comparison. The older report's objection to that row remains withdrawn.
The native-form, fifth-order coordinate and proof/supplier objections of the
broader independent blueprint/automorphic reviews remain binding; this bounded
review does not overwrite them with a whole-packet acceptance.

Exact independent arithmetic reconfirms the first four normalized strange
coefficients as `1, 23/24, 1681/1152, 257543/82944`. Expand each product through
degree three and multiply by `exp(-t/24)` using rational arithmetic; products
with index above three have higher t-adic order and do not contribute.
Multiplication by `24^n n!` recovers `1,23,1681,257543`. A separate computation
in `Q[z]/(z²-z+1)` gives `(1-2z)z=2-z` and `(1-2z)²=-3`, reconfirming the
figure-eight formal datum without asserting a manifold-volume theorem.

## All 27 assigned findings

For consumer/upstream files outside the issue, **handoff accepted** means the
correction has the right owner/hypotheses. It does not mean the missing proof
has been implemented or that this session replaced the owner's full review.
QT's current accepted packet, its requests and eight gaps were inspected
read-only. The prior full blueprint acceptance remains in force.

| Finding | Verdict and reason |
|---|---|
| /1 | **Handoff accepted.** GeometricTopology supplies realized framed links and surgery; QT consumes those and pinned diagram data. G1 retains realization/linking/surgery gaps. |
| /2 | **Handoff accepted.** Hoste/refined calculus and admissible presentations precede twisting and JM independence. Ordinary Kirby moves are distinguished from admissible moves. |
| /3 | **Handoff accepted.** The h-adic ribbon/even integral form, bottom-tangle invariant, cyclotomic completion and twist are named. Ordinary Hopf/monoidal tools are imported; quantum completion stays G2. |
| /4 | **Handoff accepted.** General Drinfeld–Jimbo/core, parity, colors and WRT interfaces are named; G2 retains generic universal-invariant/highest-weight needs. Rank one does not supply every Lie type. |
| /5 | **Handoff accepted.** The Jones comparison and G3 retain variable/mirror/framing/root conventions. A Temperley–Lieb representation alone supplies no Markov trace. |
| /6 | **Handoff accepted.** P.1/P.2 supply dilogarithm/regulator identities; V.3/V.4/V.6 supply groups, comparisons and certified elements. V.5 computations are not a regulator supplier. |
| /7 | **Supplier fix accepted.** P.2 is the single tetrahedron-volume owner, importing metric/model geometry; QT.5 owns manifold sums. The early region gap remains. |
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

## Evidence and validation

Read WORKERS, PROTOCOL, expansion protocol and UPSTREAM_GUIDE; the fix report
and all assigned claims/verification dispositions; the preceding checkpoint;
the relevant supplier nodes/refinements/readers and current consumer requests.
Reviewed the relevant AUDIT-30, AUDIT-14 and AUDIT-15 records before deciding
ownership. This is a bounded review of the assigned fixes, not an assertion
that all unrelated declarations in the three large packets were audited anew.

Confirmed shared Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; read
`AnalyticOnNhd`, `Matrix.PosDef`, `Matrix.PosDef.det_pos` and `TopPair` there.
At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, independently checked
`FramedOrientedPDCode` (Basic.lean:129), `TauCeti.covMatrix_multivariateGaussian`
(Multivariate.lean:55; positive-semidefinite covariance),
`TauCeti.multivariateGaussianPDFReal_def` (Density.lean:83) and
`TauCeti.multivariateGaussian_eq_withDensity` (Density.lean:166;
positive-definite covariance). Their three shared files match the pinned raw
files byte for byte. The density formula alone does not give a density law at
a singular covariance or an algebraic formal Gaussian theorem.

Read current TauCetiRoadmap at `670582c502e1d4497d9ccd492b36c67028ef6666`:
complete AlgebraicTopology and Completed/UniversalCovers READMEs and relevant
GeometricTopology/DifferentialGeometry layers/signatures. In particular, checked
arbitrary-pair relative homotopy, connected-manifold homogeneity and
`integralTopForm_mextDeriv`'s actual hypotheses. Current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` implements `riemannianVolume` and
`RiemannianIsometry.measurePreserving_riemannianVolume`; its latter interface
requires Lindelöf spaces and continuous Riemannian metrics. No Lake command
was run in that read-only environment.

Public sources were freshly read on 10 October. The source table records the
exact versions/locators checked, in our own words. No source passage or
restricted book was copied into the repository.

| Source | Results checked | PDF SHA-256 |
|---|---|---|
| [Goncharov, math/0207036v3](https://arxiv.org/pdf/math/0207036v3) | Introduction item 5, p. 7; §6 normalization, p. 53. | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| [Garoufalidis–Zagier, 1812.07690v1](https://arxiv.org/pdf/1812.07690v1) | §1 positive-definite setup, pp. 2–4; §3 Theorem 3.1, pp. 5–6. | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [GSWZ, 2412.04241v2](https://arxiv.org/pdf/2412.04241v2) | Theorem 5, p. 14; §1.8, pp. 15–17; §2.5, (110)–(111), p. 28; Remark 4.2, (233), p. 48; §4.5, pp. 54–55. | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | Definition/cocycle, p. 2; Example 4, (28)–(30), pp. 11–12; Example 5 boundary, pp. 12–13. | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [Zagier, strange identity](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | §6 Theorem, (37)–(39), pp. 958–959. | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| [Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | §3 Theorems 1–2, p. 98; §4, (15)–(18), pp. 102–104. | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |
| [Habiro, math/0605314v1](https://arxiv.org/pdf/math/0605314v1) | §9 Theorem 9.4, p. 34; §10 Theorems 10.1–10.2, p. 35; §11 Lemma 11.2, p. 38. | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| [Habiro, refined Kirby calculus, math/0509039v2](https://arxiv.org/pdf/math/0509039v2) | §5 Corollary 5.1 and proof, pp. 1309–1310. | `d30d9c69b652aa58539d2398f1a8424c968188d94cc2098ee462dd4e53a13416` |
| [Zagier, Dilogarithm](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | I.4, pp. 13–14, equations (7)–(9), ordered tetrahedron/manifold volume. | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |

All three edited packets pass `python3 scripts/check_blueprint.py` with
**zero errors/warnings** (75, 109 and 537 nodes). Their gaps remain 19, 22
and 22. No `excerpt` field is present. No link-map/restructuring-result file is
a deliverable here. Intake file checks and `git diff --check` pass.

Fresh sequential `lean-check` runs in the prescribed shared build all returned
exit 0. Available memory exceeded 100 GB. No language server/build/cache/update
command was started. The only warnings were admitted proofs:

| Suggested file | Warnings, all `sorry` |
|---|---|
| Polylogarithms.lean | 462 |
| HabiroNahmSeries.lean | 441 |
| QSeriesPartitionsAndMockModularForms.lean | 1,469 |
| Polylogarithms--P.2.lean (read-only) | 52 |
| ArithmeticQuantumTopology.lean (read-only) | 65 |

The two additional read-only packet validators also report zero errors/warnings
(14 and 106 nodes). Their compilation validates signatures, not the admitted
proofs or gap closure. Those checks do not authorize changing their reviews.

## Completion blocker and concrete continuation

The GitHub issue names the three base supplier packets, their three suggested
files and this report. Its full instructions repeat that file scope.
[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus
your own scratch space.” The queue's eleven outputs additionally include:

- `research/blueprint/packets/ArithmeticQuantumTopology.json`
- `research/blueprint/suggested/ArithmeticQuantumTopology.lean`
- `research/blueprint/packets/Polylogarithms--P.2.json`
- `research/blueprint/suggested/Polylogarithms--P.2.lean`

Their prompt file is absent. `issues.py:deliverables_complete` requires this
job's reviewer identity on every packet output. The extra packets still carry
the accepted full reviews `REV-ArithmeticQuantumTopology~2` and
`REV-Polylogarithms--P.2`. Thus the issue's seven-output completion predicate
passes, while the queue's eleven-output predicate fails. Do not modify queue
or intake logic to hide that mismatch.

This session requested explicit authorization for the four extra paths and
prepared their read-only contract/validator/Lean checks. Authorization has not
arrived. The submission therefore remains a checkpoint blocked on scope,
not a run-time limit or an incomplete review of the authorized suppliers.
The existing full blueprint reviews were not silently replaced.

Once authorization is explicit, independently review the current QT /1–/16
corrected contracts and P.2's /7 Milnor-angle route, preserve their full
acceptances in history, and record bounded fix-review verdicts naming this job.
Their eight/nineteen and two/three gap/request counts must survive; no stage
should become closed. The read-only checks above already establish that the
current signatures elaborate. The AMS access limitation should be resolved
before claiming a fresh reading of Milnor's Appendix. Reader synchronization
remains a separate authorized job and does not prevent a completed review
verdict of `needs_changes`.
