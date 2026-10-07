# Independent review of topology fix round 4

Job `REV-FIX-RT-AREA-topology~4`, issue #6521. Claude, session `claude-I6EWxn`, 7 October 2026.
Review base `c39fcfff`. Reviewed: `FIX-RT-AREA-topology~4` (issue #6520), [PR #6873](https://github.com/CBirkbeck/tauceti-explorer/pull/6873),
merge commit `c1b39075`, by Codex session `codex-BLPWxk`. The bot confirmed this review's claim (comment 6038973657).

**Verdicts.**

| File | Verdict |
|---|---|
| `research/blueprint/packets/Polylogarithms.json` | **accepted** |
| `research/blueprint/packets/HabiroNahmSeries.json` | **needs_changes** |
| `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json` | **needs_changes** |

- **Polylogarithms (/7).** The round's one packet change is right. It adds GeometricTopology layers 7 and 8 as stage
  prerequisites of `P.2/hyperbolic-volume`, the change round three could only describe. The checker passes, the
  matching requests exist, and the atlas gains two edges with no cycle. The reader and the Lean comment agree with it.
- **HabiroNahmSeries (/11).** The formal-only knot boundary is right in the base packet and in the accepted HB.10 part.
  Two things are wrong:
  - The round's new reader sentence says "HB.3 is `source_decomposed`". The packet has HB.3 `partial`, and HB.5a is the
    only `source_decomposed` layer.
  - The six-export contract the report calls "checked and preserved" lags the accepted HB.4, HB.8 and HB.9 parts. In
    those parts, `HB.8/identification-theorem` holds only through `HB.8/refinement-gaussian-identification`, under that
    part's gaps G1 and G2. The consumer imports that refinement.

  I corrected the export node in place. The reader still lacks that node and 43 others.
- **QSeries (/13).** The owner split the round records is the right one, and Zagier's text supports its Example 5
  boundary. Two things still need changes:
  - The export contract leaves out the node the consumer actually imports, `QM.5/quantum-modular-cocycle`. It also does
    not answer the consumer's request for matrix-valued cocycles.
  - The packet's own blueprint review (`REV-QSeriesPartitionsAndMockModularForms`, needs_changes, 5 October 2026) is
    unresolved, and `BP-QSeriesPartitionsAndMockModularForms~2` is pending. Accepting here would promote the whole
    537-node packet past that review.

  In place, I added the missing export and made seven contracts precise. I also brought the restructure entry up
  to date with the written consumer and recorded the open request as a coverage item.

**Independence.** I did none of `FIX-RT-AREA-topology~4`, and none of its earlier rounds or their reviews:

- the red team (#2758) and its verification (#2764);
- fix rounds one to three (#4647, #5232, #5574);
- the reviews of rounds two and three (#5298, #5647).

I also did none of the work on the files involved:

- the Polylogarithms, HabiroNahmSeries or QSeries blueprints, their part packets or their reviews;
- the Polylogarithms assembly (#6772);
- the ArithmeticQuantumTopology blueprint (#6658) or its review (#6666).

## What the round changed

I read the merge diff `c1b39075`. No commit since then touches any of the nine files.

- **`Polylogarithms.json`.** `P.2/hyperbolic-volume` gains two prerequisites,
  `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume` and
  `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`.
  The reader's Depends-on line for that node and one Lean comment line follow suit.
- **`QSeriesPartitionsAndMockModularForms.json`.**
  - Eight QM.5 nodes now carry a `uses` entry for `ArithmeticQuantumTopology:QT.7`: one existing entry is rewritten
    and seven are new.
  - The restructure proposal on the QT.7/QM.5 owner split is rewritten.
  - The reader gains an export table, and the Lean file gains a section comment.
- **`HabiroNahmSeries.json`.** The packet and its Lean file are unchanged. The reader's opening paragraph is rewritten.

## Checks I ran

- **`check_blueprint.py`** on all three packets, with the pinned declaration index: **0 errors, 0 warnings** each. Since
  `ffbaacd9` the checker resolves a `tauceti:TauCetiRoadmap/…#layer-…` prerequisite as an atlas stage rather than a
  declaration. That was the limitation that stopped round three from making this change. Both stage ids are in
  `data/atlas.json`. Each has a request whose `neededBy` includes `P.2/hyperbolic-volume`, so the checker's
  foreign-stage rule is met.
- **Promotion and cycles.** I read `scripts/blueprints.py`. A prerequisite on another roadmap's stage adds the edge
  supplier → consumer layer, unless the consumer already reaches the supplier, in which case the edge is skipped. In the
  live `data/atlas.json`:
  - GeometricTopology layers 7 and 8 have no stage edges at all;
  - `Polylogarithms:P.2` reaches neither layer.

  Accepting the packet therefore adds layer 7 → P.2 and layer 8 → P.2, with no cycle. The live
  `data/blueprints/Polylogarithms.json` differs from the current packet only in these two prerequisites, so that is
  exactly what goes live, together with the already-merged assembled reader (#6772). No packet anywhere has a
  QT.5 → P.2 edge.
- **Readers.**
  - **Polylogarithms.** The reader is the assembled document of #6772. Its `P.2/hyperbolic-volume` section reproduces
    the packet's statement, hypotheses, proof and acceptance, and the new Depends-on line. Elsewhere it differs from
    packet text only by its notation conversion (≥, ∞, π, ⊗).
  - **QSeries.** All eight export rows equal the packet's `uses.how` strings, and the restructure detail and proposal
    appear verbatim.
  - **Habiro.** See /11.
- **Suggested Lean files.** I compiled all three with `lean-check`, one after another, with 111 GB of memory free. All
  three elaborate with 0 errors and no warning other than `declaration uses 'sorry'`:

  | File | `sorry` warnings | Time |
  |---|---|---|
  | Polylogarithms | 462 | 12 s |
  | HabiroNahmSeries | 273 | 5 s |
  | QSeries (before and after my comment edit) | 1,467 | 20 s |

  The shared build has the pinned Mathlib. The files import Mathlib only.
- **Parts and consumer.** I read the accepted part packets that the fix issue named as carriers of /7 and /11:
  `Polylogarithms--P.2`, `HabiroNahmSeries--HB.4`, `--HB.8`, `--HB.9` and `--HB.10`. I also read the consumer
  `ArithmeticQuantumTopology.json`.
- **Sources.** Read on 7 October 2026 from public copies (listed under Sources): Zagier's *Quantum modular forms*,
  Zagier's strange-identity paper and Lawrence–Zagier.

## Findings handled in the three supplier packets

### RT-AREA-topology/7: confirmed fix, accepted (Polylogarithms)

The change is the one round three described and could not make. Both stage prerequisites are layers that exist, with
matching structured requests:

- **Layer 7:** "the curvature -1 Riemannian metric and volume-measure foundations";
- **Layer 8:** "the model hyperbolic 3-geometry and its isometry action".

Neither request claims the ideal boundary, oriented ideal tetrahedra or Milnor's formula. Those remain the packet's
early-geometry gap and P.2's own proof.

The accepted P.2 part agrees on every point:

- P.2 is the sole owner of vol I(z₁,…,z₄) = D(r(z₁,…,z₄)). QT.5 appears only as a consumer.
- `P.2/milnor-angle-volume` lists both layers as prerequisites, and the part's own requests to both layers name it.
- Its ideal-boundary gap matches the base gap.
- Its Lobachevsky function, its normalisation r(∞,0,1,z) = z, its positive orientation (Im z > 0) and its angle triple
  are the base node's and QT.5's.

The reader and the Lean comment agree with the packet. This finding needs nothing more on the supplier side.

Observations for the maintainer and the next assembly; none of them is a defect of this round:

- (a) The base node's step 2 and its gap still call Milnor's formula a gap. The P.2 part now supplies the proof route,
  and the assembled reader's Assembly note says so. A structured edge `P.2/milnor-angle-volume` →
  `P.2/hyperbolic-volume` would record it.
- (b) The early geometric extension has two working titles. The base gap places it in "GeometricTopology, Part II:
  cusped hyperbolic 3-manifolds and ideal triangulations", as its early prefix. The P.2 part proposes "GeometricTopology,
  Part II: Ideal boundary and finite-volume geodesic regions". They are one proposal and should be filed as one.
- (c) On the consumer side, QT.5 still imports the identity through a request to the stage `Polylogarithms:P.2` and the
  node `P.2/bloch-wigner-descent`, not the node `P.2/hyperbolic-volume`. That is ArithmeticQuantumTopology's revision to
  make.

### RT-AREA-topology/11: boundary right; export contract and reader not yet right (HabiroNahmSeries)

**Right.** `HB.10/knot-matrices-and-the-topological-boundary` records the matrices of GSWZ Remark 4.2 as formal Nahm data
only:

- A₄₁ = (1 1; 1 1), A₅₂ and A₍₋₂,₃,₇₎;
- it states no topological invariance, triangulation independence, Chern–Simons identification or quantum modularity;
- it has no QT.6 or QT.7 prerequisite.

Its one ArithmeticQuantumTopology input is the stage QT.5, with a request. That is acyclic: QT.5's nodes have no Habiro
input.

The accepted parts agree:

- The HB.10 part imports the two knot nodes with "No topological identification is stated here, so no QT.6-to-HB.10
  prerequisite edge is added".
- The HB.4 part keeps the formal/analytic split. The analytic nodes state positive-definite data, odd root order prime to
  the denominator and positive branches, and "no … arbitrary knot-matrix conclusion". `HB.4/formal-gaussian-integration`
  is only used, never restricted.
- The figure-eight matrix has kernel vector (1, −1), so the analytic radial theorem does not apply to it.

**Not right: the export contract.** The fix report calls the six exports of
`HB.10/export-interfaces-and-non-consequences` "checked and preserved". The parts the issue names as carriers of /11 had
been accepted the day before, and they qualify four of those exports:

| Export | What the accepted part says |
|---|---|
| `HB.8/fgi-collection` | Its regularised factors are corrected by `HB.8/refinement-gaussian-normalization` and `HB.9/followup-regularisation-jet` ("This corrects inherited HB.8/fgi-collection"). |
| `HB.8/identification-theorem` | It holds only as `HB.8/refinement-gaussian-identification`, which "still requires G1 and G2". G1 reconciles the corrected local Gaussian remainder with the global prefactors ((114) is inconsistent with (59)); G2 is uniform t-regularity. |
| `HB.9/module-membership` | It is in the `neededBy` of the HB.9 part's gaps G-kummer-orientation and G-all-order-gluing. |
| `HB.4/radial-asymptotic-expansion` | Its field-of-definition clause, S^m ∈ F_m[[ε]], is conditional on coefficientwise Kummer invariance. That is an open gap in the base packet and in the HB.4 part (`HB.4/coefficientwise-kummer-descent-interface`). |

The consumer `ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison` imports
`HB.8/refinement-gaussian-identification` and cites G1 and G2. It does not import `HB.8/identification-theorem`. The fix
report's table gives none of these conditions.

- **Corrected in place.** I appended to the export node's statement one sentence naming the four qualifications above.
  I also added `HabiroNahmSeries:HB.8/refinement-gaussian-identification` to its prerequisites. The checker stays at 0
  errors and 0 warnings, and the graph stays acyclic.

**Not right: the reader.** This round rewrote the opening of the reader. The new counts are correct: 109 nodes (10, 17,
31, 33, 6, 12), 177 API items, 125 unit tests, 22 planets, 94 declarations, 22 gaps and 9 requests. But two things are
wrong:

- It says "HB.3 is `source_decomposed`". In the packet HB.3 is `partial`, and HB.5a is the only `source_decomposed`
  layer.
- The report says "the reader gives the same boundary". That holds for the knot-matrix node. The reader body, however,
  still describes the first pass:
  - its seven layer headers say `source_decomposed` with 8, 13, 7, 8, 17, 12 and 9 nodes (74 in all);
  - the packet has 12, 20, 8, 11, 30, 17 and 11 (109);
  - 44 packet node ids never occur in the reader, among them `HB.10/export-interfaces-and-non-consequences` (this
    finding's export contract) and `HB.10/figure-eight-example`.

  The reader is not a deliverable of this review, and the round's reader edit made it contradict itself: the opening
  now says 109 nodes and the body describes 74.
- **Verdict: needs_changes.**

Minor points for the same round:

- The HB.4 part's `radial-analytic-remainder-comparison` uses entry and the HB.10 part's HB10-R2 say "HB.8 formal
  Gaussian integration". The bracket is `HB.4/formal-gaussian-integration`, and HB.8 owns the collection.
- `HB.10/figure-eight-example` writes "2D(ζ₆) = … = vol(4₁)". "Numerically equal to vol(4₁); the identification is
  QT.5's" would match the sibling knot node.

### RT-AREA-topology/13: split right; contract written against an unplanned consumer (QSeries)

**Right.**

- **The owner split.** QM.5 owns:
  - Zagier's definition, `QM.5/quantum-modular-form`;
  - the Kontsevich–Zagier strange identity and its scalar transformation theorem;
  - the Lawrence–Zagier Poincaré-sphere examples.

  QT.7 owns the knot statements.
- **No duplication.** The consumer packet re-plans none of QM.5's material. None of its 106 nodes defines a quantum
  modular form or mentions Kontsevich's F, the strange identity, the Lawrence–Zagier series, radial limits or Eichler
  integrals.
- **The source claim.** Zagier, *Quantum modular forms*, p. 2, calls the general notion "purposely a little vague" and
  fixes as canonical definition that h_γ "extends to a real-analytic function on P¹(ℝ) ∖ S_γ". Example 5 (pp. 12–16, as
  the report says) "is not a quantum modular form in the strict sense of the definition we gave in the introduction …
  because the associated cocycle is no longer analytic or even continuous". Examples 1–4 do have real-analytic cocycles.
  The report's statement therefore holds. Two precisions are worth keeping:
  - Example 5 lies outside the canonical definition, not outside Zagier's informal notion;
  - its law, eq. (36) on p. 14, is a conjecture found experimentally, multiplicative and asymptotic.
- **Locators.** Topology 40, §6 is pp. 958–960, and the theorem with its indicated proof is pp. 958–959. Lawrence–Zagier
  Theorems 1–2 are on p. 98. Their §4 runs pp. 101–105: the matrices (15) are on p. 102, and (16)–(18) on pp. 103–104.
- **Fit with the nodes.** Each contract's prerequisite and gap claims hold:
  - the QT.4 prerequisites and requests behind the radial-limit and Ohtsuki contracts;
  - the QT.3/QT.4 and HC.3/HC.4 inputs behind the unified-invariant contract;
  - both gaps the Poincaré-sphere contract names;
  - the lower boundary branch of the definition.

**Not right.** The round treats QT.7 as unplanned:

- the report calls the consumer "unfinished" and "partial material";
- the proposal says to record the direction "when written";
- the restructure detail it kept says "QT.7 has no nodes (its packet coverage is not_read)".

The consumer was complete at the round's base, with 16 QT.7 nodes. What it actually does:

- `QT.7/denominator-volume-cocycle` and `QT.7/knot-matrix-cocycle` import `QM.5/quantum-modular-cocycle`, a node the
  contract left out.
- `QT.7/cocycle-analytic-extension` imports the stage QM.5.
- Its request to QM.5 asks to "Extend the scalar period-cocycle interface to matrix-valued multiplicative cocycles on
  common pole-free domains …". No QM.5 node, gap or coverage item answered it.
- It imports none of the eight listed nodes by id. So "QT.7 imports the exact QM.5 nodes listed in their uses" was
  false.

Several contract strings were also imprecise:

- **Kontsevich's φ.** The node's multiplier is "the inverse of the η-multiplier", not "its eta multiplier". The proof
  gap is source issue E604 together with the multiplier-adaptation gap.
- **Trefoil.** The trefoil–Kashaev sentence assigns QT.2/QT.7 an obligation the consumer does not record. Neither the
  node nor the three sources mention the trefoil.
- **Poincaré-sphere subgroup.** Γ_ρ = {γ : M_γ scalar} and its multiplier are the node's own derivation (its fifth proof
  step). Lawrence–Zagier state only the vector law.
- **Coefficients and normalisations.** "Taylor coefficients" means the normalised coefficients of e^{−t/24}F(ξe^{−t}).
  The WRT values are the rescaled W(ξ) = ξ(ξ − 1)Z(ξ). The definition is Zagier's canonical one as adapted in the node
  (ℝ for P¹(ℝ), with a multiplier).

**Corrected in place.** The packet's other fields are unchanged:

- a `uses` entry for QT.7 on `QM.5/quantum-modular-cocycle`, stating that it supplies only the scalar additive cocycle
  relation and the generator reduction;
- the seven contract strings above, reworded to what their nodes and sources say. The `poincare-sphere-unified-
  invariant-radial-limit` contract was right and is unchanged;
- one sentence appended to the restructure detail, recording the written consumer and its import;
- the restructure proposal rewritten. It keeps the round's split, its Example 5 boundary and its acyclicity argument,
  and replaces "imports the exact nodes" and "when written" with what the consumer does;
- a QM.5 coverage `remaining` item for the unanswered matrix-valued request;
- the suggested file's section comment, which now names the cocycle lemma's Lean declarations
  (`quantumPeriodFunction_mul`, `isQuantumModularForm_iff_generators`) and the open matrix-valued request, and says
  that Example 5's cocycle "is not analytic or even continuous".

**Verdict: needs_changes.** Two items remain:

- Someone must decide who plans the generic matrix-valued multiplicative cocycle interface: QM.5, the "QSeries Part II"
  the consumer's request names, or QT.7 with its knot matrices. That is a design decision, not a wording fix.
- The reader is out of step with the packet:
  - its export table needs the corrected strings and the ninth row (table below);
  - its restructure paragraph needs the new detail sentence and proposal;
  - its older bullet (lines 2969–2971) still says the definition "is the one ArithmeticQuantumTopology:QT.7 uses for
    knot-invariant quantum modularity", which contradicts the boundary.

Independently of this finding, the file's own blueprint review is unresolved, and its revision
`BP-QSeriesPartitionsAndMockModularForms~2` is pending. Acceptance here would promote all 537 nodes past it, which a
review of one finding cannot do.

## Consumer handoffs /1–/6, /8–/10, /12, /14–/16

**The handoffs themselves are appropriate.** The fix issue assigns these findings to BP-ArithmeticQuantumTopology and
forbids writing its packet. None of them names a change in the three supplier files.

**One factual statement in the fix report is wrong.** It says ArithmeticQuantumTopology's "current partial material does
not replace a completed consumer plan". At the fix's base `c42baa36`, however, the packet was already complete:

- it has 106 nodes and status `complete` (#6658);
- `REV-ArithmeticQuantumTopology` (#6666, 6 October, needs_changes) had already checked every handed finding, /1 to /16,
  against it;
- that review's "Handed red-team findings" table records the corrections it made and what remains.

So the consumer work of these findings is in a finished blueprint whose own revision round carries what remains.
By `make_queue.py`'s rule for finished blueprints (`route_to_blueprints`), that blueprint's files join the next fix
round. In the table below, the node ids are ones I found in the packet; the dispositions are
REV-ArithmeticQuantumTopology's.

| Finding | Where the consumer packet carries it (`ArithmeticQuantumTopology:` omitted) |
|---|---|
| /1 | `QT.0/framed-link-and-linking-matrix` imports GeometricTopology layer 4 and Tau Ceti's framed braid and Gauss-code declarations; its remaining geometric contracts are gap G1. |
| /2 | `QT.0/admissible-framed-link`, `hoste-move`, `refined-kirby-calculus` and `admissible-band-slide-calculus`; `QT.3/JM-well-defined`. |
| /3 | `QT.1/quantized-enveloping-algebra`, `bottom-tangle` and `universal-sl2-invariant`; `QT.2/algebra-P-and-completion`; `QT.3/twist-element` and `twisting-theorem`. |
| /4 | `QT.1/general-drinfeld-jimbo-algebra` and `general-integral-core`; the `QT.4/general-*` nodes; gap G2. |
| /5 | `QT.2/jones-normalization-comparison`; gap G3. |
| /6 | The QT.5 nodes import Polylogarithms P.1/P.2, K3BlochGroups V.3/V.4/V.6 and GeometricTopology layers, with no QT.0 or V.5 input. |
| /8 | `QT.5/gluing-and-completeness-equations`; gap G4. |
| /9 | `QT.5/extended-pre-bloch`, `extended-bloch-kernel`, `strong-flattening` and `extended-rogers-regulator`; gap G5. |
| /10 | `QT.6/neumann-zagier-datum`, `nz-to-integral-nahm`, `root-nz-data` and `topological-habiro-module-comparison`; gap G6. |
| /12 | `QT.2/unified-kashaev-invariant`; `QT.7/kashaev-volume-conjecture` and `bettin-drappeau-proved-cases`. |
| /14 | `QT.6/faddeev-quantum-dilogarithm`, `faddeev-operator-pentagon` and the `QT.6/ak-*` nodes; gap G7. |
| /15 | No resurgence node; `QT.7/coefficient-asymptotics` is labelled experimental, with gap G8. |
| /16 | A restructure entry proposes "ArithmeticQuantumTopology, Part II", with Wheeler's relative-Habiro theorem after QT.2; Bouis–Gazda is out of scope. |

Each is an appropriate home for the finding. What the consumer review still asks of these nodes belongs to that
packet's next round, not to the supplier files reviewed here.

For /7, /11 and /13 the consumer's actual imports differ from the supplier contracts. See the sections above: QT.5 uses
a stage request rather than `P.2/hyperbolic-volume`; QT.6 imports `HB.8/refinement-gaussian-identification`; QT.7 imports
`QM.5/quantum-modular-cocycle`.

## Upstream findings /23, /24, /26, /29, /33, /81, /82, /87, /91, /103, /105

**All eleven routings are appropriate.** Each finding concerns a Tau Ceti roadmap: AlgebraicTopology, GeometricTopology
or HeegaardFloer. PROTOCOL sections 10 and 17 keep their repair upstream, and no supplier file here depends on them.

For each one I compared the report's maintainer action with the finding's `fix` and the verifier's reason. Each action
restates the confirmed fix faithfully, and the atlas-side consumers are named correctly:

| Finding | Atlas-side consumer named in the report |
|---|---|
| /23 | StableHomotopyKTheory H.2 |
| /24 | H.6, S.4 and D0 |
| /26 | H.1 and K3BlochGroups V.1 |
| /29 | IG.3, marked inferred |
| /33 | none |
| /81 | ALS.2 and ALS.5 |
| /82 | LV.5 and LV.9 |
| /87 | the surface and mapping-class owner |
| /91 | ALS and LV |
| /103 | ALS.5 and AF.1a |
| /105 | QT.0 as a candidate supplier only |

The generated extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_AlgebraicTopology.json` is not edited.

None of the eleven is yet in `research/blueprint/UPSTREAM_NOTES.md`. That is the maintainer action round three already
asked for. No acceptance of their upstream mathematics is implied.

## Corrections to the fix report

These statements in `RT-AREA-topology.fixes-4.md` and the round's handoff are inaccurate. The report is not a
deliverable of this review, so I record the corrections here.

- **The consumer was written.** "Its current partial material does not replace a completed consumer plan" and "the
  unfinished consumer packet" are wrong. At the base `c42baa36`, ArithmeticQuantumTopology was complete, with 106 nodes
  (#6658), and had been reviewed (#6666). Its QT.7 already records QM.5 → QT.7 at node level. So "BP-ArithmeticQuantumTopology
  must encode it as a consumer prerequisite" is already done.
- **The parts exist.** "No part packet was written" (HB.4, HB.10) and "checked and preserved" (the six exports) pass over
  the accepted HB.4, HB.8, HB.9 and HB.10 parts. Those parts qualify four exports (see /11).
- **QT.7's imports.** "QT.7 imports the exact nodes listed in the reader's export table" is wrong: QT.7 imports
  `QM.5/quantum-modular-cocycle`.
- **The Habiro reader.** "HB.3 is `source_decomposed`" is wrong: the `source_decomposed` layer is HB.5a. The reader does
  not "give the same boundary" for the export contract, which it never mentions.
- **Lean comment.** "Zagier's Example 5 explicitly allows a discontinuous knot cocycle" is better read as "has a cocycle
  that is not analytic or even continuous", Zagier's own words. I made that change in the suggested file.
- **The rest checks out.** The source table's locators, the Lean compile counts (462 / 273 / 1467) and the
  checker results are reproduced above.

## What the next round must do

Sending any file back queues `FIX-RT-AREA-topology~5`, which edits these files and the readers. That round is also
where `make_queue.py` puts the now-finished ArithmeticQuantumTopology blueprint.

1. **Habiro reader** (`research/blueprint/readmes/HabiroNahmSeries.md`):
   - in the opening, replace "HB.3 is `source_decomposed`" by "HB.5a is `source_decomposed`";
   - bring the seven layer coverage lines to the packet's statuses and node counts (HB.3 partial 12, HB.4 partial 20,
     HB.5a source_decomposed 8, HB.5 partial 11, HB.8 partial 30, HB.9 partial 17, HB.10 partial 11);
   - add the 44 missing nodes, at least `HB.10/export-interfaces-and-non-consequences`, with the sentence this review
     appended.

   `ASM-HabiroNahmSeries` (state "external") also writes this reader. Whichever job lands second should regenerate it
   from the packets.
2. **QSeries reader** (`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md`):

   | Reader place | Packet field to copy verbatim |
   |---|---|
   | Export table, seven rows (all but `poincare-sphere-unified-invariant-radial-limit`) | the QT.7 `uses.how` of each node |
   | Export table, new row `QM.5/quantum-modular-cocycle` | its new QT.7 `uses.how` |
   | Export table preamble "QT.7 imports these exact nodes" | reword as the restructure proposal now does |
   | Restructure section, the QT.7 owner entry | `detail` (one sentence appended) and `proposal` |
   | QM.5 remaining items | the new last `remaining` item |
   | Bullet at lines 2969–2971 | replace it: QT.7 imports `QM.5/quantum-modular-cocycle`, and its knot laws are not instances of `QM.5/quantum-modular-form` |
3. **The matrix-valued request** (QSeries and ArithmeticQuantumTopology): choose who plans the generic matrix-valued
   multiplicative cocycle interface. If QM.5 or a QSeries Part II plans it, it needs a sourced node or a recorded Part II
   proposal. Otherwise QT.7's request must be withdrawn and QT.7 must own the interface. Either way, close the new
   coverage item.
4. **Consumer side**, for the ArithmeticQuantumTopology revision:
   - cite `Polylogarithms:P.2/hyperbolic-volume` in `QT.5/volume-and-chern-simons`, as /7 asks;
   - remove `QT.7/the-example-ledger`'s `uses` entry naming QM.5, which states the reverse direction;
   - align QT.6's Habiro imports with the qualified export node.

## Notes for the maintainer

- The eleven upstream findings are not yet in `research/blueprint/UPSTREAM_NOTES.md`.
- Two titles name one proposal for early ideal geometry: the base packet's prefix of "GeometricTopology, Part II: cusped
  hyperbolic 3-manifolds and ideal triangulations", and the P.2 part's "Part II: Ideal boundary and finite-volume
  geodesic regions".
- Accepting Polylogarithms also takes the assembled reader of #6772 live. Its node text is generated from the reviewed
  packets.
- `REV-FIX-RT-AREA-ktheory-2~2` (#5159) and `REV-FIX-RT-AREA-automorphic-1~2` (state "external") are still to record
  their own verdicts in Polylogarithms and QSeries.

## Sources (public copies, read 7 October 2026)

| Source | URL | SHA-256 | Passages |
|---|---|---|---|
| Zagier, *Quantum modular forms* (Clay Math. Proc. 12, 2010; printed = PDF page) | <https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf> | `2ee0a69a2ffdd0f7611178fb79a15b5c130f324623640ed7557920435284f0bf` | p. 2 (definition); Examples 0–5, pp. 3–16; Example 5, pp. 12–16, eq. (36) p. 14 |
| Zagier, *Vassiliev invariants and a strange identity related to the Dedekind eta-function*, Topology 40 (2001) 945–960 (printed = PDF + 944) | <https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383%2800%2900005-7/fulltext.pdf> | `b95519fb3cb8cd36097988af2ec37549a8b7bdef03f6909dcad6c50a2b06815e` | §6, pp. 958–960; eq. (37)–(39), read from rendered pages |
| Lawrence–Zagier, *Modular forms and quantum invariants of 3-manifolds*, Asian J. Math. 3 (1999) 93–108 (printed = PDF + 92) | <https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf> | `10bbd2821a7f0897230687fde5e16322be58e8a6c3ea5f47d6de4cad180fd543` | §2 p. 95 (normalisation of W); Theorems 1–2 p. 98; §4 pp. 101–105 |

The pins stay Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No baseline declaration was added or removed. Implementation status stays
`unchecked` throughout.

## Summary

Round four's one packet repair is right. P.2's ideal-tetrahedron volume node now lists GeometricTopology layers 7 and 8
as prerequisites, with matching requests, a passing checker and no cycle, so **Polylogarithms is accepted**.

**HabiroNahmSeries needs changes.** Its formal-only knot boundary holds in the base packet and in the accepted parts.
Its six-export contract, however, lagged the accepted HB.4, HB.8 and HB.9 parts: identification is conditional on the
HB.8 part's gaps G1/G2, and the consumer imports the refinement. I corrected the export node. The reader this round
edited misstates the source-decomposed layer and still omits 44 nodes, including that export node.

**QSeries needs changes.** The QM.5/QT.7 owner split and the Example 5 boundary are right and sourced. The round,
however, wrote its export contract as if QT.7 were unplanned, while the complete consumer imports the scalar cocycle
lemma and requests a matrix-valued extension. I added the missing export, made seven contracts precise, and recorded
the open request. The reader sync and the matrix-cocycle owner decision remain. QSeries's own blueprint review is
still open, so acceptance here would have promoted the whole packet past it.

The consumer handoffs (/1–/16) are carried by the finished ArithmeticQuantumTopology packet. The eleven upstream
findings are routed correctly. All three suggested files compile.
