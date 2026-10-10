# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex (GPT-6), session
`codex-YXWpoE`, 10 October 2026. The bot confirmed claim comment 6100896895.
This reviewer did none of `FIX-RT-AREA-topology~4` or the work it reviews.
Only this job was claimed. This continuation follows checkpoint
[PR #8542](https://github.com/CBirkbeck/tauceti-explorer/pull/8542).

**Checkpoint: the three issue-listed supplier reviews are complete, but the
queue requires two additional packet reviews outside the live issue's file
scope.** Authorization for their four paths was requested during this run
and has not arrived. No unauthorized review object or mathematical file
was changed. This report supersedes the preceding report; earlier packet
verdicts remain in `reviewHistory`, and previous reports remain in Git history.

| Issue-listed packet | Bounded verdict | What this run established |
|---|---|---|
| Polylogarithms | accepted | P.2 is the single tetrahedron-volume owner; both geometric inputs are explicit and the missing ideal-region carrier stays a gap. |
| HabiroNahmSeries | accepted | All six QT.6 export contracts distinguish formal, analytic and arithmetic inputs. |
| QSeriesPartitionsAndMockModularForms | needs_changes | Scalar ownership is correct; four reader discrepancies remain outside the permitted files. |

These are verdicts on the assigned fixes. They do not certify the whole
blueprints, discharge inherited gaps or assert implementation. The changes
in this continuation are review metadata, this report and the handoff. All
statements, hypotheses, prerequisites, proof outlines, APIs, unit tests,
planets, coverage, gaps, requests and suggested declarations are unchanged.

## Finding /7: volume owner and ordered conventions

Freshly read Zagier, *The Dilogarithm Function*, I.3 equations (3), (5),
printed p. 11, and I.4 equations (7)–(9), printed pp. 13–14. The ordered
cross-ratio is normalized by `(infinity,0,1,z) ↦ z`; odd permutations negate
its Bloch–Wigner value. The tetrahedron formula is an input to the manifold
sum, so P.2 owns that formula and QT.5 owns its manifold application. The two
GeometricTopology layer prerequisites introduced by the fix are correct
imports. They do not construct the ideal-boundary/region interface or prove
Milnor's integral formula. Those obligations remain explicit in the supplier.

Read-only inspection of the queue-only P.2 follow-up confirms that its
`milnor-angle-volume` target imports GeometricTopology layers 7–8 and retains
its canonical ideal-region gap. Its two gaps and three requests are intact.
No verdict was written to this out-of-scope packet.

Read-only inspection of `ArithmeticQuantumTopology:QT.5/volume-and-chern-simons`
confirms that its statement imports P.2's tetrahedron formula but its
prerequisites omit `Polylogarithms:P.2/hyperbolic-volume`. That exact existing
node must be added when the consumer path is authorized. Keep the open P.2
geometric comparison request and QT G4/G5: the existing node reference alone
does not resolve its geometric or extended-Bloch comparisons.

Freshly read Neumann, *Extended Bloch group and the Cheeger–Chern–Simons
class*, v2, §3, printed pp. 420–421. Its coordinate normalizes
`(0,infinity,1,z) ↦ z`. For a fixed ordered finite quadruple define

- `rP(a,b,c,d) = (a-c)(b-d)/((a-d)(b-c))`;
- `rQ(a,b,c,d) = (c-b)(d-a)/((c-a)(d-b))`.

Cancellation gives `rQ(T) = 1/rP(T) = rP(swapFirstTwo(T))`. At the exact
rational quadruple `(2,3,5,7)`, these values are `6/5`, `5/6`, `5/6`.
Zagier I.3 equation (3) gives `D(1/z) = -D(z)`. Thus the consumer must state
the geometric carrier comparison, transport vertex order and orientation
together, and carry that transport into the manifold incidence signs.
Transposing the first two vertices already reverses oriented volume; a second
unjustified sign would undo the conversion. These are different source
conventions, not evidence that either source's convention is erroneous.
No such consumer change was made here.

## Finding /11: six separate export contracts

Freshly read Garoufalidis–Zagier, *Asymptotics of Nahm sums at roots of unity*,
v1, §3 equations (13)–(21) and Theorem 3.1, printed pp. 4–6; and GSWZ,
*The Habiro ring of a number field*, v2, Theorem 5, printed p. 14,
§1.8, pp. 16–17, equations (110)–(111), p. 28, and Theorem 8,
pp. 35–36. Checked the six named HB.10 exports in the packet against those
supplier contracts:

| Export in HabiroNahmSeries | Hypotheses retained |
|---|---|
| `HB.4/euler-maclaurin-with-remainder` | Derivative integrability, decay, shift handling and the actual remainder estimate. |
| `HB.4/formal-gaussian-integration` | Symmetric invertible Hessian over a rational algebra and the filtered completion giving finite fixed-order sums. |
| `HB.4/radial-asymptotic-expansion` | Positive-definite rational Nahm datum, its positive solution, radial approach, odd root order coprime to a denominator and specified branches. |
| `HB.8/fgi-collection` | Symmetric integral Nahm matrix, deformed solution, regularization and residue-class periodicity. |
| `HB.8/identification-theorem` | The specified Laurent/power-series coefficient ring and auxiliary-order restrictions in the supplier plan. |
| `HB.9/module-membership` | Nondegenerate solution, Bloch index, discriminant extension and root orders prime to the excluded integer. |

The formal bracket has no positive-definiteness hypothesis; it also proves no
analytic remainder. The figure-eight matrix with both rows `(1,1)` annihilates
`(1,-1)`, independently checked in exact arithmetic. It cannot instantiate the
positive-definite analytic theorem. A non-real formal solution with invertible
Hessian has a different contract.

HB.10 remains formal-only. Topological identification/invariance belongs to
QT.6, knot modularity to QT.7. Module membership does not imply scalar
Habiro-ring membership without the additional torsion/zero-index or
symmetrization argument. HB.8 G1/G2 and HB.9 coefficient-transfer,
signed-Kummer, full quadratic finite-etale descent and all-order integral
gluing obligations remain explicit. The NZ dictionary needs unimodular B and
the parity compatibility; invertibility over a field is insufficient.
No supplier correction beyond review metadata was necessary.

## Finding /13: scalar quantum modularity and reader synchronization

Freshly read Zagier, *Quantum modular forms*, introductory definition and
cocycle law, printed p. 2, Examples 3–4, pp. 10–11, and Example 5, p. 12.
QM.5 owns the scalar real-analytic discrepancy and additive cocycle. QT.7's
knot matrices and asymptotic laws have a separate contract; the discontinuous
knot example does not instantiate the scalar analytic predicate.

The packet's normalized automorphy factor and scalar cocycle node exclude the
vacuous zero multiplier. Kontsevich's theorem uses the inverse eta multiplier
for the lower boundary slash. The export `uses` fields retain the analytic,
multiplier and finite-Weil-image gaps. The trefoil comparison explicitly
requires the color, orientation and normalization comparison. WRT/false-theta
comparisons retain the QT.4 normalized invariant input.

Independently checked the four discrepancies previously identified in
`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md`:

1. Near line 2964, the export table omits the ninth packet export,
   `QM.5/quantum-modular-cocycle`. Add its scalar additive-cocycle contract;
   it does not provide a knot matrix theorem.
2. Near line 2972, replace the unspecified eta multiplier description by the
   inverse eta multiplier on the lower branch, with
   `epsilon(T)=exp(-2 pi i/24)` and `epsilon(S)=exp(2 pi i/8)`.
3. Near lines 2818 and 2987, distinguish scaled Glaisher numbers c_n from the
   ordinary Taylor coefficients `c_n/(24^n n!)` of the stated series. Exact
   rational division gives `1, 23/24, 1681/1152, 257543/82944`.
4. Near lines 4166–4168, replace the obsolete assertion that QT.7 has no
   nodes with its existing knot-specific plan and the QM.5 → QT.7 direction.

The reader is outside both the live issue and queue outputs. It was not
edited. The `needs_changes` verdict completes this bounded supplier review;
it does not block the queue predicate by itself. Earlier broader blueprint
objections remain in history and are not discharged by this fix review.

## All 27 assigned findings

Read the assigned claims, verifier verdicts and round-four fix dispositions.
The original fix expressly uses consumer handoffs and upstream notes rather
than editing those owners. Acceptance below concerns that bounded disposition,
not proof of the handed-off mathematics. The current QT/P.2 packet inspections
remain read-only because those additional paths are not authorized.

| Finding | Verdict and reason |
|---|---|
| /1 | Handoff accepted: GeometricTopology owns links, surgery and realization. QT imports them; G1 retains missing exact contracts. |
| /2 | Handoff accepted: admissible presentations and refined Hoste calculus precede JM independence. Fresh Habiro §§10.1–10.2, Theorems 10.1–10.2, pp. 34–35 confirms the chosen route through the twisting theorem. |
| /3 | Handoff accepted: h-adic ribbon algebra, even integral form/completions, bottom tangles, completed colors and twists are named; ordinary Hopf/monoidal APIs remain imports. G2 is retained. |
| /4 | Handoff accepted: general Drinfeld–Jimbo/core/finite-color inputs are distinct from rank one; missing general quantum inputs remain G2. |
| /5 | Handoff accepted: G3 retains variable, mirror, framing and root conventions; the Jones braid representation alone is not a Markov trace. |
| /6 | Handoff accepted: P.1–P.2 supply the analytic regulator; V.3/V.4/V.6 supply groups, Suslin comparison and certified classes. V.5 is not substituted for those suppliers. |
| /7 | Supplier accepted. Read-only consumer check still requires the exact P.2 volume prerequisite and the carrier/order/orientation comparison above. |
| /8 | Handoff accepted: cusped completeness, finite volume, face-pairings, refinements and rigidity are explicit extension contracts under G4, beyond closed Mostow. |
| /9 | Handoff accepted: extended Bloch/cut-cover/flattening/Rogers data retain G5 transfer and torsion obligations. Ordinary Suslin descent gives no canonical extended lift. |
| /10 | Handoff accepted: NZ and root-refined series, their invariance and the integral/parity bridge have separate inputs; G6 retains normalization and coefficient obligations. |
| /11 | Supplier accepted: all six exports preserve formal, analytic and arithmetic restrictions as checked above. |
| /12 | Handoff accepted: root/color Kashaev evaluation, cyclotomic lift, general conjectures and separately proved cases remain distinguished. |
| /13 | Needs changes: the four reader corrections above remain. Scalar and matrix owners are correctly separated in the packet. |
| /14 | Handoff accepted: Faddeev/AK data keep contours, domains, distribution contraction and tails under G7; the generic formal pentagon has a separate owner request. |
| /15 | Handoff accepted: general resurgence is excluded; knot coefficient asymptotics retain conjectural status and G8's phase issue. |
| /16 | Handoff accepted: the Wheeler/MMR/relative-Habiro extension is a named QT follow-up with Alexander and HabiroRings inputs; Bouis–Gazda is excluded. |
| /23 | Upstream note accepted: arbitrary based pairs define relative groups; NDR/CW hypotheses belong to comparison results. |
| /24 | Upstream note accepted: a spectral object alone does not supply convergent filtered-chain spectral sequences, edge maps and naturality. |
| /26 | Upstream note accepted: CW approximation/compression, weak-equivalence homology invariance and Hurewicz need precise supplier contracts. |
| /29 | Upstream note accepted: topology internal and external dependency records require maintainer coordination. |
| /33 | Upstream note accepted: UniversalCovers and current library own absolute higher-homotopy APIs; relative comparisons belong to AlgebraicTopology. |
| /81 | Upstream note accepted with current owner correction: DifferentialGeometry 5.5 already owns abstract corner boundary and face orientation; GeometricTopology owns handles/gluing/rounding. |
| /82 | Upstream note accepted with current owner correction: DifferentialGeometry 3.3 already owns connected-manifold homogeneity; support-sensitive isotopy extension and gluing are separate. |
| /87 | Upstream note accepted: surface classification/mapping classes and an actual triangulation or Morse existence route must supply Heegaard splittings. |
| /91 | Upstream note accepted: internal dependencies and misplaced unlocks need upstream correction; layer 7 already imports Riemannian volume and HopfRinow. |
| /103 | Upstream note accepted with current owner correction: DifferentialGeometry 0–2 and 5 already own forms, d, pullback, orientation and Stokes; their regularity/support/outward-first conventions are retained. |
| /105 | Upstream note accepted: HF needs 4D Spin-c/handles/cobordism/grading contracts; correction terms retain rational-homology-sphere hypotheses. |

No upstream roadmap, generated atlas data, link map or restructuring proposal
was edited. No link maps or restructuring proposals are among the assigned
outputs, so their checkers are inapplicable here.

## Baseline, current owners and validation

Read the reviewed library-audit entries AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10
and AUDIT-15 QM.5 before assessing ownership. The fix introduced no baseline
declaration claim. Fresh statement reads at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` covered `AnalyticOnNhd` and
`Matrix.PosDef`. Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` reads covered
`FramedOrientedPDCode`, `TemperleyLieb.jones` and
`Probability.multivariateGaussian_eq_withDensity`. The last requires PosDef;
it does not provide formal Gaussian integration or a density law at singular
covariance. These are bounded baseline checks, not a new audit of every
unchanged declaration of the three blueprints.

Read current upstream GeometricTopology and DifferentialGeometry owner sections
and relevant signatures, read-only at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`. Checked the current Tau Ceti tree
read-only and used its Git object at the audit pin for the pinned statements.
The newer manifold-forms, abstract-boundary and homogeneity work is imported,
never planned again. No Lake command ran in the read-only environment.

Fresh sequential checks:

| Packet | Nodes | Gaps | Requests | Checker result | Suggested-file result |
|---|---:|---:|---:|---|---|
| Polylogarithms | 75 | 19 | 21 | 0 errors, 0 warnings | exit 0; 462 sorry warnings |
| HabiroNahmSeries | 109 | 22 | 9 | 0 errors, 0 warnings | exit 0; 441 sorry warnings |
| QSeriesPartitionsAndMockModularForms | 537 | 22 | 25 | 0 errors, 0 warnings | exit 0; 1469 sorry warnings |

The three suggested files import Mathlib only and were checked by `lean-check`
at the exact Mathlib pin. Available memory was 102 GB before compiling.
Checks ran one at a time; no non-sorry warning or error occurred. No language
server, library build/update or cache command ran. This verifies elaboration,
not proofs. No suggested file changed.

All sources below were fetched publicly and the specified portions freshly
read on 10 October 2026. No source text is placed in the deliverables.

| Source/version | SHA-256 |
|---|---|
| [Zagier, Dilogarithm](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [GZ v1](https://arxiv.org/pdf/1812.07690v1) | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [GSWZ v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Habiro v1](https://arxiv.org/pdf/math/0605314v1) | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| [Neumann v2](https://arxiv.org/pdf/math/0307092v2) | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |

Lawrence–Zagier was also retrieved, but the earlier detailed audit of its
proofs remains inherited evidence; this run does not claim a fresh full
Lawrence–Zagier proof review. Earlier Milnor/Goncharov readings likewise remain
attributed to their earlier independent reviews.

## Exact scope blocker

The live issue names this report, the three base supplier packets and their
suggested files. [WORKERS.md](../WORKERS.md) requires: “Edit only the files the
issue names, plus your own scratch space.” The queue additionally requires:

- `research/blueprint/packets/ArithmeticQuantumTopology.json`;
- `research/blueprint/suggested/ArithmeticQuantumTopology.lean`;
- `research/blueprint/packets/Polylogarithms--P.2.json`;
- `research/blueprint/suggested/Polylogarithms--P.2.lean`.

Read-only evaluation of `issues.py:deliverables_complete` returns False for
the actual queue entry and True for an otherwise identical entry restricted
to the live issue outputs. The two extra packet reviewer identities cause
the False result. The predicate permits `needs_changes`; QSeries' negative
verdict therefore completes its bounded review. The referenced queue prompt
is absent. Neither queue, completion logic nor the extra packet reviews were
modified.

Required authorization was requested and remains pending. This is a scope
blocker, not a time or mathematical-quality limit. Before assigning another
continuation, reconcile the live issue and queue file lists or explicitly
authorize these four paths. The extra packets can receive bounded negative
verdicts if a correction remains; another three-supplier re-audit cannot
complete the actual queue. The handoff specifies the outstanding actions.

## Continuation: scope gate verified again on 10 October 2026

Codex (GPT-6), session `codex-UWo6fC`, claimed issue #6521 in comment
6101120522; github-actions confirmed this claim in comment 6101121725.
This session did none of the fixes under review. The checkout includes merged
checkpoint [PR #8563](https://github.com/CBirkbeck/tauceti-explorer/pull/8563).
The preceding source review and Lean results belong to `codex-YXWpoE`; this
continuation does not present them as newly performed checks.

Read the entire live issue, the round-four fix report, this review and its
handoff, the queue entry, and the actual `deliverables_complete` implementation.
The live issue still authorizes only the three base supplier packets and their
suggested files, plus this report. The queue still additionally requires the
ArithmeticQuantumTopology and Polylogarithms--P.2 packets and suggested files.
The referenced review prompt remains absent. No scope amendment was found.

Fresh read-only evaluation of `deliverables_complete` gives **False** for the
actual queue entry and **True** for a copy restricted to the live issue outputs.
The two additional packets retain their separate earlier reviewer identities.
Thus the missing queue verdicts, rather than the QSeries negative verdict,
prevent completion. No queue or completion-code edit was made.

Fresh `check_blueprint.py` runs on the three authorized packets each report
**0 errors and 0 warnings**. Their node/gap/request counts remain respectively
75/19/21, 109/22/9 and 537/22/25. Read-only packet/reader comparison reconfirms
the four QSeries discrepancies listed above. Exact rational calculations again
give Taylor coefficients 1, 23/24, 1681/1152, 257543/82944, and ordered
cross-ratios 6/5 and 5/6 at (2,3,5,7). Read-only inspection also reconfirms
that QT.5/volume-and-chern-simons imports the tetrahedron identity in its
statement but omits the exact P.2/hyperbolic-volume prerequisite. No new
source or baseline audit was attempted. Suggested files are unchanged; Lean
was not rerun in this continuation. The earlier elaboration results remain
attributed above.

Explicit authorization for the four extra queue-listed paths was requested
during this session and has not arrived. WORKERS.md's issue-file restriction
therefore still prevents the remaining queue reviews. This is a blocked
checkpoint, not another completed review or a time-budget stop. Only this
report and the job handoff change; all packet verdicts and mathematical
deliverables remain as received. Resume with the exact actions in the handoff
once the issue scope and queue scope agree.
