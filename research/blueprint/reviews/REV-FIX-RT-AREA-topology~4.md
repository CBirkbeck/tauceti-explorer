# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Codex (GPT-6), session
`codex-a0vqCi`, 10 October 2026. [Claim comment 6102817195](https://github.com/CBirkbeck/tauceti-explorer/issues/6521#issuecomment-6102817195)
was confirmed by bot comment 6102818284. This worker did none of the fixes or
original plans under review and claimed one job only. Continues merged
checkpoint [PR #8621](https://github.com/CBirkbeck/tauceti-explorer/pull/8621).

**Blocked checkpoint: every issue-listed supplier has a bounded verdict;
two queue-required packet review updates remain outside the live issue's
permitted file list.** The concrete updates are specified below. Authorization
was requested and has not arrived. The blocker is file scope, not run time.

| Issue-listed packet | Verdict | Scope of this verdict |
|---|---|---|
| Polylogarithms | accepted | /7's single tetrahedron-volume owner and explicit geometric imports, with its gaps preserved. |
| HabiroNahmSeries | accepted | /11's six export contracts distinguish formal, analytic and arithmetic hypotheses. |
| QSeriesPartitionsAndMockModularForms | needs_changes | /13's scalar ownership is correct. Preserve the newer full review's negative verdict and its remaining mathematical contracts; the reader still lacks the packet's full multiplier correction. |

Replaced those three review objects with this session's independent findings
and preserved their predecessor objects in `reviewHistory`. Updated the predecessor report
and handoff with this run’s evidence. Preserved the complete newer q-series
review rather than allowing a bounded acceptance to supersede it. Confirmed current
Tau Ceti inputs in the /5 and /7 handoffs, independently elaborated all three
suggested files, and rechecked the non-real convention test for /7. Mathematical nodes, APIs, tests,
prerequisites, gaps, requests, suggested declarations and upstream files were
not changed. These verdicts assess the assigned fixes, not the whole blueprints.
The predecessor full-review qualifications remain in history.

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
rational quadruple `(2,3,5,7)`, these values are `6/5`, `5/6`, `5/6`,
but both Bloch–Wigner values vanish there, so that example cannot detect a
wrong sign. A stronger exact test uses `T=(0,1,-i,2)`: `rP(T)=(1+i)/4`,
`rQ(T)=2-2i`, and `rP(swapFirstTwo(T))=2-2i`. Neither ratio is 0 or 1.
Zagier I.3 equations (3), (5) give `D(1/z)=-D(z)` and positivity in the
upper half-plane, so the first value has positive D and its reciprocal has
negative D. This supplies a sign-sensitive test for the proposed carrier
comparison. Thus the consumer must state
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

The scalar cocycle node excludes the vacuous zero multiplier by requiring
epsilon(1)=1; the deliberately weak quantum-modular predicate alone imposes
no cocycle condition. Kontsevich's theorem uses inverse eta values at S and T
for the lower boundary slash, with a further negative-real-cut correction
when c=0,d<0. The export `uses` fields retain the analytic,
multiplier and finite-Weil-image gaps. The trefoil comparison explicitly
requires the color, orientation and normalization comparison. WRT/false-theta
comparisons retain the QT.4 normalized invariant input.

The input packet now includes the completed full review
`independent-review-REV-QSeriesPartitionsAndMockModularForms~2`, by session
codex-jnfi6H, issue #6469. Its verdict is needs_changes, with 24 gaps and 27
requests. That review corrected the multiplier and other contracts after the
earlier topology checkpoint. Fresh reader inspection distinguishes the
earlier resolved objections from the new synchronization requirement:

1. The scalar additive-cocycle node is present at lines 8539–8557, with
   `epsilon(1)=1` and the factor cocycle hypothesis. The QM.5 overview at
   lines 8303–8304 distinguishes this contract from QT.7's knot matrices.
2. The Kontsevich theorem at lines 9069–9071 specifies the correct generator
   values `epsilon(T)=exp(-2 pi i/24)` and `epsilon(S)=exp(2 pi i/8)`, but
   still describes the multiplier as inverse eta for all matrices. The packet
   now requires epsilon(gamma)=v_eta(gamma)^(-1) when c is nonzero or d>0,
   and its negative when c=0,d<0. Thus epsilon(-I)=-i. For the pinned boundary
   factor, j_(3/2)(-I,x)=i, so the corrected product is 1. Naive inverse eta
   gives i*i=-1. This calculation independently confirms the newer review's
   correction; generator values alone do not specify the central action.
3. The expansions at lines 9037 and 9049 distinguish scaled Glaisher numbers
   c_n from ordinary Taylor coefficients `c_n/(24^n n!)`. Exact division gives
   `1, 23/24, 1681/1152, 257543/82944`.
4. The introduction at line 11 and QM.5 overview now recognize QT.7's existing
   knot-specific nodes and the QM.5 → QT.7 supplier direction.

The /13 ownership disposition is accepted. The packet's top-level verdict
remains needs_changes: this limited review does not resolve the full review's
no-ghost, arbitrary-ring alternation, invariant-form, general Serre/radical,
quantitative Stirling and exact supplier contracts. The multiplier/character
and finite-Weil comparisons also remain open. The complete predecessor
review object is preserved in `reviewHistory`, including its per-node ledger.
The reader is outside the permitted files and was not edited. Its new
multiplier synchronization requirement must be carried into an authorized
reader update; the old report's claim of complete synchronization no longer
describes the current packet.

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
| /5 | Handoff accepted with current-library update: G3 retains variable, mirror, framing and root conventions. Current Tau Ceti supplies the Markov trace, writhe normalization and Markov invariance described below; the pinned braid representation alone did not. Import these current declarations rather than planning them again. |
| /6 | Handoff accepted: P.1–P.2 supply the analytic regulator; V.3/V.4/V.6 supply groups, Suslin comparison and certified classes. V.5 is not substituted for those suppliers. |
| /7 | Supplier accepted. Read-only consumer check still requires the exact P.2 volume prerequisite and the carrier/order/orientation comparison above. |
| /8 | Handoff accepted: cusped completeness, finite volume, face-pairings, refinements and rigidity are explicit extension contracts under G4, beyond closed Mostow. |
| /9 | Handoff accepted: extended Bloch/cut-cover/flattening/Rogers data retain G5 transfer and torsion obligations. Ordinary Suslin descent gives no canonical extended lift. |
| /10 | Handoff accepted: NZ and root-refined series, their invariance and the integral/parity bridge have separate inputs; G6 retains normalization and coefficient obligations. |
| /11 | Supplier accepted: all six exports preserve formal, analytic and arithmetic restrictions as checked above. |
| /12 | Handoff accepted: root/color Kashaev evaluation, cyclotomic lift, general conjectures and separately proved cases remain distinguished. |
| /13 | Ownership fix accepted: scalar and matrix owners are separate. Packet needs_changes retains the newer full review; the reader still needs the full multiplier's cut sign, as checked above. Analytic and normalization gaps remain. |
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

## Pinned baseline and current owners

Read reviewed audit entries AUDIT-30 P.2, AUDIT-14 HB.4/HB.8/HB.10 and
AUDIT-15 QM.5. Their absence claims describe their audit baseline, not today's
library. This review introduces no new pinned-baseline claim. Fresh reads at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` covered `AnalyticOnNhd`
and `Matrix.PosDef`; the former requires analyticity in a neighborhood of each
point of the set, and the latter strict positivity on every nonzero vector.
Fresh Tau Ceti reads at `f790474821cf4256814db967cb154e7af3d0c369` covered
`FramedOrientedPDCode`, `TemperleyLieb.jones` and
`TauCeti.multivariateGaussian_eq_withDensity`. The Gaussian density
comparison requires PosDef and supplies no formal Gaussian operator or density
law at singular covariance. These checks concern the assigned interfaces,
not every unchanged declaration in the three blueprints.

The three inspected Tau Ceti files in the shared build were compared byte for
byte with Git objects at that pinned commit. All three match:

| Pinned module | SHA-256 |
|---|---|
| `TauCeti/KnotTheory/PDCode/Basic.lean` | `7edf13fc20675b037376d618868a34b45196004278a86128c510091bd7335293` |
| `TauCeti/KnotTheory/TemperleyLieb.lean` | `4c382e028224bce7029878c70f66defb89e8fbb2cc3f483b41ad902a7b25f775` |
| `TauCeti/Probability/Distributions/Gaussian/Density.lean` | `be6d918b1053cce31fcc66339c114323ee1bb71165232ef9fa3b3f6d26ab5c05` |

The build's Mathlib checkout also reports the pinned Mathlib commit above.

Read current TauCetiRoadmap GeometricTopology layers 7–8, its Suggested.lean,
and DifferentialGeometry layers 3.3 and 5, with relevant target signatures,
read-only at `070dc2becd74419e76303ede84b465ed4a69461f`.
DifferentialGeometry 0–2 owns manifold forms, exterior derivative, pullback and
orientation; 3.3 owns homogeneity for connected, boundaryless finite-dimensional
manifolds via compactly supported smooth fields. Its 5.3 Stokes contract uses
an oriented smooth half-space manifold, a compactly supported C1 form and the
outward-first boundary orientation. Its 5.5 owns the face-indexed abstract
boundary at corners. GeometricTopology owns handles, gluing and rounding.
These are existing owners, not new plans for this review.

Current Tau Ceti was inspected read-only at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Two updates to the inherited
consumer handoff are material:

- For /5, `TauCeti.MarkovBraid.jonesTrace` in
  `TauCeti/KnotTheory/TemperleyLieb.lean` already combines
  `TauCeti.TemperleyLieb.markovTrace` with the writhe correction at a unit a.
  The loop value is `-(a^2+a^-2)` and the one-strand value is that loop value.
  `jonesTrace_conj`, `jonesTrace_stabilize`, `jonesTrace_stabilizeInv` and
  `TauCeti.MarkovEquiv.jonesTrace_eq` prove invariance under the Markov moves.
  `jonesTrace_sigma_pow_three` computes the two-strand trefoil. The consumer
  must import these declarations and establish its own variable, mirror,
  framing, color and root normalization dictionary. A statement that today's
  library has only the braid representation would be stale. Geometric
  realization and general colored quantum invariants are separate inputs.
- For /7, `TauCeti.UpperHalfSpace`, its `riemannianMetric` and
  `isPretransitive_isom` in
  `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace.lean` already
  provide the analytic upper half-space metric and transitive isometry action.
  That module expressly leaves completeness and curvature -1 unproved.
  `TauCeti.riemannianVolume` in
  `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean` already glues
  chart volumes for a finite-dimensional C1 manifold with Borel structure,
  LindelofSpace and continuous Riemannian metric, including boundary/corners.
  These declarations supply part of the imported foundation; they do not
  identify the ideal boundary with P1(C), construct the canonical tetrahedral
  region or prove its signed integral equals D. No declaration for that ideal
  interface was found in the current geometry tree. Keep the narrower gap.

The consumer packet is outside scope, so these corrections are recorded here
and in the handoff for its authorized next edit. No Lake command ran in the
read-only environment.

## Fresh validation and evidence provenance

All five fresh `scripts/check_blueprint.py` runs pass with 0 errors and
0 warnings:

| Packet | Nodes | Gaps | Requests |
|---|---:|---:|---:|
| Polylogarithms | 75 | 19 | 21 |
| HabiroNahmSeries | 109 | 22 | 9 |
| QSeriesPartitionsAndMockModularForms | 537 | 24 | 27 |
| ArithmeticQuantumTopology | 106 | 8 | 19 |
| Polylogarithms--P.2 | 14 | 2 | 3 |

After the review updates, all five checks still pass. `intake.py check-files`
reports five changed files and zero problems; `git diff --check` passes.
Parsed comparisons against the review base confirm that only the three
top-level reviews and their history changed in the packets. Each full
predecessor object is retained exactly; both queue-only packets are unchanged.

Freshly checked the relevant packet statements, prerequisites, APIs/tests and suggested
interfaces: P.2's geometric theorem remains unstated until its carrier exists;
HB.4's polynomial bracket is explicitly narrower than HB.8's required formal
completed-ring bracket; QM.5's cocycle predicate includes epsilon(1)=1 and its
Kontsevich theorem specifies the lower-branch multiplier including its cut
sign at c=0,d<0. Exact
rational calculations verify both real and non-real cross-ratios, the four scaled Taylor
coefficients and the figure-eight matrix's null vector reported above.

Fresh serial `lean-check` runs in this session exit 0 for all three issue-listed
suggested files. Polylogarithms produces 462 sorry warnings, HabiroNahmSeries
441, and QSeriesPartitionsAndMockModularForms 1491; no other warnings or
errors occur. Available memory was checked before elaboration. No suggested
file changed. These results supersede the inherited compile evidence for
these unchanged files, and do not prove their admitted statements. There are no
assigned link maps or restructuring proposals requiring their checkers.

| Unchanged suggested file | SHA-256 checked in this session |
|---|---|
| `Polylogarithms.lean` | `bd1ce87ec38e2bf3d9f83ed1dfb09c3b7c6850167a8737bb303a2bf430125aad` |
| `HabiroNahmSeries.lean` | `e8e75371bea31ad9ac787aafd2c2fc195c2d25dee6f2aa14d5b069065394d04b` |
| `QSeriesPartitionsAndMockModularForms.lean` | `27f0445d4c487dcf3eda3753c342129ef89abd40a428f6f3b6f3518a744b19bf` |

The public source portions cited in /7, /11, /13 and /2 above were freshly read
in this session. For Zagier's Topology paper, also read equation (24) and
Theorem 3, printed p. 952, and section 6 equations (37)–(39), printed p. 958,
from rendered pages to avoid the broken text extraction. Equation (24) gives
c_n/(24^n n!), corroborating the corrected reader. The Kontsevich S-law and
translation law fix the stated multiplier convention.

| Public source/version | SHA-256 of retrieved PDF |
|---|---|
| [Zagier, The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Zagier, Quantum modular forms](https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf) | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` |
| [Garoufalidis–Zagier v1](https://arxiv.org/pdf/1812.07690v1) | `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66` |
| [GSWZ v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Habiro v1](https://arxiv.org/pdf/math/0605314v1) | `5fb8b89b432401ea28d10e34d348c5cdebe43cf3ddb95c0475aaee869fa276fc` |
| [Neumann v2](https://arxiv.org/pdf/math/0307092v2) | `de2f7ddec49b2ce6ccafd5a9a0be350972ffcf2014a6a3601a6d650df0018650` |
| [Zagier, Vassiliev invariants and a strange identity related to the Dedekind eta-function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf) | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` |
| [Lawrence–Zagier, Modular forms and quantum invariants of 3-manifolds](https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf) | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` |

All eight receipts above concern retrieval on 10 October 2026. Freshly read
Lawrence–Zagier §3, Theorems 1–2 and the periodic mean-zero proposition,
printed pp. 98–99, and §4's Eichler boundary comparison, pp. 103–104. Those
contracts distinguish root evaluation, radial expansion and the lower boundary
law; §4 supplies a sketch, not the missing general multiplier/finite-Weil
comparison. Its printed normalization is qualified by the newer q-series
review's E626/E627. The full Lawrence–Zagier proof audit and earlier
Milnor/Goncharov readings remain inherited evidence. This session does not
claim to have repeated them or proved the supplier results. Documents contain
our mathematical conclusions and source locators, with no source passages or
page-by-page summaries.

## Concrete remaining scope repair

The live issue and its full instructions permit the three base packets, their
suggested files and this report. [WORKERS.md](../WORKERS.md) says:
“Edit only the files the issue names, plus your own scratch space.” The queue
additionally names two packets and their existing suggested files. Its prompt
path is absent. Only the two packet review objects need updates to finish:

| Additional packet path | Bounded review to record after authorization |
|---|---|
| `research/blueprint/packets/Polylogarithms--P.2.json` | accepted for /7's single owner and explicit GeometricTopology 7/8 imports. Preserve the existing full review in reviewHistory, both gaps, all three requests and normalization/carrier qualifications. |
| `research/blueprint/packets/ArithmeticQuantumTopology.json` | needs_changes for /7's missing exact `Polylogarithms:P.2/hyperbolic-volume` prerequisite and geometric carrier/order/orientation comparison. Preserve its prior full review, all eight gaps and nineteen requests, particularly G4/G5. Include the current-library handoff above in its eventual consumer corrections. |

Use reviewer `independent-review-REV-FIX-RT-AREA-topology~4`, the actual review
date, and notes identifying this bounded scope and the predecessor full review.
The negative QT verdict is sufficient to finish the review; it need not wait
for a proof or edits to its mathematics. No additional Lean or reader edit is
needed for queue completion.

Fresh evaluation of the unmodified `issues.py:deliverables_complete` returns
False for the actual queue entry. Supplying just those two review updates
through an in-memory path reader makes the same function return True. All
other output files already exist; the QSeries verdict is needs_changes,
preserving the newer full review.
No queue, completion code or out-of-scope review object was changed in that
experiment. The exact check and required fields are sufficient to reproduce
it; no scratch file is needed.

This session reproduced that experiment using a temporary in-memory override
of `Path.read_text` only for the two packet review objects. The real files
remain unchanged. The completion checker accepts `needs_changes`, so the
consumer's missing mathematics does not block finishing this independent
review once its metadata path is authorized.

Authorization for these two paths remains unanswered. Reconcile the live issue
and queue or authorize those two review updates before assigning another
continuation. Repeating only the three supplier checks cannot complete this
job. The newer q-series reader synchronization requires its own authorized
path; it is not needed for the review completion test, which accepts a
negative verdict. The handoff contains every remaining action.
