# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex (GPT-6), session
`codex-In9gJI`, 10 October 2026; atlas base `0d2178b78`.
The bot confirmed claim comment 6099886919 in comment 6099888178.

This continues [PR #8494](https://github.com/CBirkbeck/tauceti-explorer/pull/8494).
The reviewed fix is `FIX-RT-AREA-topology~4`, session `codex-BLPWxk`,
[PR #6873](https://github.com/CBirkbeck/tauceti-explorer/pull/6873).
This worker did none of that fix, its predecessors, the original blueprints,
red team or finding verification. Only this review was claimed.

**Checkpoint: blocked on issue/queue file scope.** The three issue-listed
supplier reviews are complete. The queue requires two additional packet
reviews whose files the issue does not authorize. Scope clarification was
requested during this run and has not arrived. A negative bounded verdict
completes a review; it is the missing authorization, rather than the QSeries
verdict, that prevents completion of this queue job.

| Listed packet | Bounded verdict | Reason |
|---|---|---|
| Polylogarithms | accepted | P.2 owns the ordered ideal-tetrahedron identity and retains its geometric-carrier gap. Added direct numbered source support. |
| HabiroNahmSeries | accepted | The six exports retain their formal, analytic and arithmetic restrictions; the previous locator corrections are confirmed. |
| QSeriesPartitionsAndMockModularForms | needs_changes | Scalar ownership is correct; four concrete discrepancies remain in its reader. |

These verdicts concern the assigned fixes, not unrelated declarations or a new
acceptance of the whole blueprints. Previous reviews remain in `reviewHistory`.
Statements, hypotheses, proof outlines, APIs, tests, planets, gaps, requests,
coverage and suggested declarations were not changed. Nothing is claimed
formalised.

## Fresh checks and correction

### Tetrahedron identity: finding /7

Read Zagier, *The Dilogarithm Function*, I.3 equation (5), printed p. 11,
and I.4 equations (7)–(9), printed pp. 13–14. The cross-ratio on the ordered
vertices (infinity, 0, 1, z) is z. The ideal-tetrahedron volume formula uses that
order, with odd vertex permutations reversing the sign. P.2 is the supplier;
QT.5 owns manifold sums. A model of hyperbolic space and its metric volume
alone does not supply the ideal-boundary oriented-region interface. That
explicit gap remains. Earlier Milnor/Goncharov readings remain attributed
prior evidence; this run did not retrieve or freshly read those sources.

Added one author-hosted Zagier source record to Polylogarithms and one support
entry on `Polylogarithms:P.2/hyperbolic-volume`, with those equation/page
locators and our own description of the vertex order and sign. No mathematical
contract changed.

Read-only inspection confirms that
`ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` imports the tetrahedron
identity in its statement but omits `Polylogarithms:P.2/hyperbolic-volume` from
its prerequisites. An open geometric request does not replace this existing
exact supplier. After scope authorization, add that prerequisite, retaining
G4/G5 and the geometric comparison request.

The consumer also needs an explicit ordered-sign conversion. P.2 normalizes
(infinity, 0, 1, z) to z; QT normalizes (0, infinity, 1, z) to z. On the same
ordered quadruple their raw cross-ratios are reciprocal, and D(1/z) = -D(z).
Switching the first two vertices changes the ordered-volume sign. Specify the
vertex-order/orientation conversion when importing the equality. This does
not establish that either independently chosen convention is wrong.

### Gaussian and arithmetic exports: finding /11

Freshly read Garoufalidis–Zagier, *Asymptotics of Nahm sums at roots of unity*,
§§1–3, printed pp. 1–6, especially equations (13)–(14) and Theorem 3.1.
The analytic radial theorem requires positive-definite rational A, its positive
real solution, the stated restrictions on root order and denominator, and
specified branches. The formal Gaussian bracket instead uses an invertible
symmetric Hessian over a rational algebra and coefficientwise finite completed
expressions. The figure-eight matrix with both rows (1,1) annihilates (1,-1);
it cannot instantiate the positive-definite analytic theorem. An algebraic
formal expansion at an isolated solution has a different contract.

Read GSWZ, *The Habiro ring of a number field*, v2: Theorem 5, p. 14;
§1.8, pp. 16–17; equations (110)–(111), p. 28; (114), p. 29;
Definition 2.11 and (117)–(119), pp. 29–30; (126)–(127), p. 31;
Theorem 8 and (163)–(164), pp. 35–36; Remark 4.2, p. 48.
The preceding review correctly replaced internal labels by the numbered
HB.8 locators and placed both HB.4 equations (110)–(111) on p. 28.
No further Habiro correction was needed here.

Checked all six HB.10 exports against their suppliers: HB.4's
Euler–Maclaurin remainder, formal Gaussian bracket and radial asymptotics;
HB.8's Gaussian collection and qualified identification; HB.9's module
membership. The NZ dictionary retains B's integral/unimodular restrictions.
HB.8 G1/G2 and HB.9's signed Kummer, coprimality, coefficient-transfer,
finite-etale/HB.7 descent and integral-gluing obligations survive. A formal
bracket does not supply knot invariance, analytic remainder bounds or a scalar
integrality theorem. This bounded check does not replace the inherited audit
of all source errata.

### Scalar quantum modularity: finding /13

Read Zagier, *Quantum modular forms*, p. 2 and Examples 3–5, pp. 10–13,
and Lawrence–Zagier, §3 Theorems 1–2, p. 98, and §4's theta transformation
setup, pp. 101–102. QM.5 owns the scalar real-analytic discrepancy and its
additive cocycle. Nonzero normalized factors exclude a vacuous zero multiplier;
the lower-branch Kontsevich example retains the inverse eta multiplier.
QT.7's knot matrices and conjectural asymptotic laws require their separate
extension contract. A discontinuous knot cocycle supplies no proof of the
scalar analytic predicate. WRT/false-theta comparisons retain their
normalization and analytic comparison inputs.

The QSeries reader needs four corrections, outside both issue and queue paths:

1. Near line 2964, add the ninth export, `QM.5/quantum-modular-cocycle`.
2. Near line 2972, specify the inverse eta multiplier on the lower branch.
3. Near lines 2818 and 2987, distinguish Glaisher's scaled c_n from the
   Taylor coefficients c_n/(24^n n!). The first four are 1, 23/24,
   1681/1152 and 257543/82944. The packet and suggested file already use
   the scaling; exact rational arithmetic confirms these values.
4. Near lines 4166–4168, replace the obsolete no-nodes QT.7 account with
   the current consumer plan and QM.5 → QT.7 direction.

The trefoil comparison is already qualified. Prior broader blueprint
objections remain in review history and are not discharged here.

## Disposition of all 27 assigned findings

Read all assigned claims, verifier verdicts and the round-four fix report.
The following owner/handoff dispositions retain the preceding independent
audit, supplemented by the fresh checks above and current upstream inspection.
They do not replace independent reviews of out-of-scope packets or assert
implemented results.

| Finding | Disposition |
|---|---|
| /1 | Handoff accepted: realized links/surgery belong to GeometricTopology; QT consumes pinned framed diagrams. G1 retains realization and surgery gaps. |
| /2 | Handoff accepted: admissible presentations and Hoste moves precede JM independence; ordinary Kirby moves are insufficient. Fresh Habiro §10.1–10.2, Theorems 10.1–10.2, pp. 34–35, confirms that route through Theorem 9.4. |
| /3 | Handoff accepted: h-adic ribbon/even integral forms, bottom tangles, cyclotomic completion and twists are named. Import ordinary Hopf/monoidal tools; retain G2 for quantum completions. |
| /4 | Handoff accepted: general Drinfeld–Jimbo/core, colors and WRT contracts are named. Rank-one material does not supply every Lie type; G2 remains. |
| /5 | Handoff accepted: G3 keeps Jones variable, mirror, framing and root conventions. The pinned Temperley–Lieb braid representation alone supplies no Markov trace. |
| /6 | Handoff accepted: P.1/P.2 supply regulator identities; K3 V.3/V.4/V.6 supply groups/comparisons/certified elements. V.5 computation is not a regulator supplier. |
| /7 | Supplier accepted; consumer needs the exact P.2 volume prerequisite and ordered-sign conversion above. Retain the geometric-carrier gap. |
| /8 | Handoff accepted: cusped face-pairing, completeness, finite volume and rigidity contracts remain requested under G4; closed Mostow material is insufficient. |
| /9 | Handoff accepted: extended Bloch/flattening/Rogers contracts retain G5's cut-cover, transfer and torsion conditions. Ordinary descent supplies no canonical extended lift. |
| /10 | Handoff accepted: NZ/root-refined data, formal series and integral Nahm comparison retain G6's coefficients, parity, unimodularity and normalization restrictions. |
| /11 | Supplier accepted: six exports retain separate formal, analytic and arithmetic hypotheses; numbered source locators confirmed. |
| /12 | Handoff accepted: fixed-color/root Kashaev evaluation, Habiro lift, conjectures and specifically proved cases remain distinguished; G3 survives. |
| /13 | Needs changes in reader: synchronize the four locations above; scalar and matrix ownership remains separate. |
| /14 | Handoff accepted: Faddeev/AK constructions retain G7's contours, operator domains, distribution products and tails. Generic formal pentagon stays an imported request. |
| /15 | Handoff accepted: general resurgence is excluded; knot coefficient asymptotics stays conjectural with G8's phase issue. |
| /16 | Handoff accepted: QT Part II names Wheeler/MMR and Habiro §7/Alexander inputs; Bouis–Gazda remains excluded. |
| /23 | Upstream note accepted: define relative groups on arbitrary based pairs; NDR/CW belongs on comparisons. Current AlgebraicTopology Stage 8.1 prose still restricts the definition, while its suggested signature accepts an arbitrary pair. |
| /24 | Upstream note accepted: a spectral object is not a convergent filtered-chain package; the owner must supply boundedness, convergence, edge maps and naturality. |
| /26 | Upstream note accepted: CW approximation/compression, weak-equivalence homology invariance and degree-one Hurewicz need exact supplier contracts. |
| /29 | Upstream note accepted: internal topology order and external suppliers/consumers require maintainer coordination. |
| /33 | Upstream note accepted: UniversalCovers/current library owns absolute higher-homotopy maps and transport; AlgebraicTopology owns relative comparisons. |
| /81 | Upstream note accepted: GeometricTopology retains handles/gluing/rounding; current DifferentialGeometry 5.5 already owns abstract corner boundaries and face orientations. |
| /82 | Upstream note accepted: support-sensitive isotopy extension/gluing remains separate; DifferentialGeometry 3.3 already owns connected-manifold homogeneity under its precise hypotheses. |
| /87 | Upstream note accepted: GeometricTopology layer 9 still misattributes surface mapping classes to layer 3; cite surface classification and an actual Morse/triangulation existence route. |
| /91 | Upstream note accepted: internal dependency/unlock corrections need coordination; current layer 7 already imports Riemannian volume and HopfRinow. |
| /103 | Upstream note accepted: DifferentialGeometry 0–2 and 5 already owns manifold forms, pullback/derivative, orientation and Stokes; preserve regularity, compact support and outward-first orientation. |
| /105 | Upstream note accepted: HF needs actual 4D Spin-c/handle/cobordism/grading contracts. Correction terms keep rational-homology-sphere hypotheses; 3D surgery and algebraic spin groups do not suffice. |

No upstream roadmap, live atlas data, extract, link map or restructuring file
was edited.

## Baseline and validation

Read reviewed AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10 and AUDIT-15 QM.5
entries before assessing owners. Fresh raw-source reads at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` covered `AnalyticOnNhd`,
`Matrix.PosDef`, braided/rigid monoidal classes and `HopfAlgebra`.
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` reads covered
`FramedOrientedPDCode`, the Temperley–Lieb Jones representation and the Gaussian
density formula/law. A density formula alone does not prove a density law for
singular covariance; `multivariateGaussian_eq_withDensity` requires PosDef.
These ordinary analytic primitives do not implement algebraic formal integration.

Read current upstream main
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, including relevant
GeometricTopology, AlgebraicTopology and DifferentialGeometry documents and
signatures. Existing forms/Stokes, corner and homogeneity owners are imported,
never re-planned. No Lake command ran in the read-only environment.

Public PDFs retrieved on 10 October 2026 for this run's bounded reads:

| Source | SHA-256 |
|---|---|
| [Zagier, Dilogarithm](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [GSWZ, v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Garoufalidis–Zagier, v1](https://arxiv.org/pdf/1812.07690v1) | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [Lawrence–Zagier](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |
| [Habiro, v1](https://arxiv.org/pdf/math/0605314v1) | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |

Fresh packet checks of the three listed suppliers report zero errors and
warnings: 75/109/537 nodes, 19/22/22 gaps and 21/9/25 requests. Read-only
checks of the extra P.2/QT packets also pass (14/106 nodes, 2/8 gaps,
3/19 requests). No source-excerpt field is present in the edited packets.

Fresh sequential `lean-check` runs of all three issue-listed suggested files
completed with only `sorry` warnings: Polylogarithms 462, HabiroNahmSeries 441,
QSeries 1469. No Lean file changed; these checks establish elaboration, not
proof. No language server, library build/update or cache command was run.
Final intake path/content and whitespace checks are recorded in the PR.

## Scope blocker and continuation

The issue names this report, three base packets and their suggested files.
[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus
your own scratch space.” The queue additionally requires the packets and
suggested files for ArithmeticQuantumTopology and Polylogarithms--P.2.
The queue prompt is absent. `issues.py:deliverables_complete` requires this
reviewer's identity on all five packet outputs: the issue's seven-output
predicate passes, while the queue's eleven-output predicate fails.

Authorization for the four extra paths was requested but has not arrived.
The extra packets retain their original independent reviews. Neither queue
nor completion logic was changed. Resolve issue/queue scope before another
worker repeats the supplier audit. Once authorized, finish the bounded QT
and P.2 reviews, preserve prior full reviews, add the QT volume prerequisite
and document its ordered-sign conversion. Keep all their gaps and requests.
The QSeries reader synchronization requires separate authorization and can
remain a `needs_changes` disposition. The handoff contains everything needed;
no continuation depends on scratch files.
