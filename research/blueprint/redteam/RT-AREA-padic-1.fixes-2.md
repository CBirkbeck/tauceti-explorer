# RT-AREA-padic-1: fixes, round 2

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5150, job FIX-RT-AREA-padic-1~2).

**Scope.**
- **Findings:** `RT-AREA-padic-1.result.json`. **Verdicts:** `RT-AREA-padic-1.review.json`. This job covers the
  confirmed high and medium findings /1–/26.
- **Round 1:** `RT-AREA-padic-1.fixes.md` (Claude Code, cc-48533a). Its only deliverable was that report, so it wrote
  every fix as exact edits for the owner of each file.
- **This round:** it applies round 1's edits to the three finished blueprints the issue lists: PerfectoidSpaces P0–P7,
  AdicEtaleGeometry and AdicSpacesPartII. It also adds the P7 nodes that round 1 left to "the next P7 round" of the P0
  packet (/7). Where round 1 wrote an edit against a base decomposition in `data/`, it is applied to the packet's copy
  of the same node.

**Independence.** I did none of:
- the red team;
- its verification;
- round 1;
- the three blueprints and their reviews (PerfectoidSpaces--P0 last written by cc-e94dc5, reviewed by Codex
  codex-hjdg0j; AdicEtaleGeometry by cc-e94dc5, reviewed by cc-fb70e5; AdicSpacesPartII by cc-e94dc5, reviewed by
  cc-39fac3).

My earlier round-2 fix of RT-AREA-padic-2 (#5152, merged) also edited the P0 and AdicSpacesPartII packets. This round
builds on it.

**Files changed.**
- `packets/PerfectoidSpaces--P0.json`, `readmes/PerfectoidSpaces--P0.md` and `suggested/PerfectoidSpaces--P0.lean`
  (comments only).
- `packets/AdicEtaleGeometry.json`, `readmes/AdicEtaleGeometry.md` and `suggested/AdicEtaleGeometry.lean` (one comment).
- `packets/AdicSpacesPartII.json` and `readmes/AdicSpacesPartII.md`.

Each file was edited by a script that asserts each replaced string occurs once, and each keeps its own JSON format.
Nothing in `content/campaign/` or `data/` was touched.

## Where each finding went

The issue hands the findings on unwritten blueprints to the jobs that will write them. This round writes no packet for
them:

| Blueprint or design job | Findings |
|---|---|
| BP-AInfCohomology--AI.0 | /19 |
| BP-AlgebraicModularFormsAndSerreWeights | /26 |
| BP-CohomologyComparisons | /24 |
| BP-DiamondEtaleCohomology--C0 | /11 |
| BP-DiamondSixOperations | /11 |
| BP-DiamondsAndVStacks | /3, /10, /11, /12 |
| BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4 | /25 |
| BP-FarguesFontaineDiamonds | /8 |
| BP-GeometricSatakeAndFusion--GS0 | /3 |
| BP-HilbertModularVarietiesAndShimuraCurves--H0 | /26 |
| BP-HodgeTateAndCanonicalSubgroups--T0 | /22, /23, /25, /26 |
| BP-HodgeTateAndCanonicalSubgroups--T6 | /4, /23, /24 |
| BP-IgusaVarietiesAndTorsionConcentration | /24 |
| BP-PadicHodgeTheory--P7 | /20, /24 |
| BP-PerfectoidQuotients | /1, /6, /7 |
| BP-PerfectoidShimuraVarieties | /1, /4, /22 |
| BP-PerfectoidSpaces--P8 | /1 |
| BP-RelativeFarguesFontaine--RF0 | /3, /8, /16, /17, /18, /20 |
| BP-RelativeFarguesFontaine--RF4 | /19 |
| BP-ShimuraCompactifications--C6 | /26 |
| BP-TorsionCohomologyInfrastructure | /24 |
| BP-TropicalAndBerkovichArithmetic | /10 |
| BP-VectorBundlesAndIsocrystals--VB0 | /21 |
| BP-VectorBundlesAndIsocrystals--VB3 | /21 |
| DESIGN-DirectSummandsAndBigCohenMacaulay | /2 |

Round 1's edits to the three finished blueprints come from /5, /6, /7, /8 and /9, and the sections below apply them.
I searched round 1 for every other edit that names a node, stage text or file of these three roadmaps:
- **/14** edits the Zavyalov paper extraction.
- **/15** edits RS-05 and the DiamondsAndVStacks packet. It confirms that the AdicEtaleGeometry packet already has
  A0/analytic-locus-restriction.
- **/3, /10 and /24** name these roadmaps only as inputs of other stages.

None of these asks for a change to the three packets.

## /5: P1's tilting equivalence comes from the untilt classification

Round 1 wrote /5 against the PerfectoidSpaces decomposition in `data/`. The P0 packet has since rewritten P1, so each
edit was checked against the packet:
- **Edits 1 and 3 (the tilting-equivalence node and its links) are already in the packet.**
  - P1/tilting-equivalence-and-explicit-tilt has the hypothesis "No perfectoid base field".
  - Its first proof step derives the equivalence from P1/untilts-classified-by-primitive-ideals, and both
    P1/untilts-classified-by-primitive-ideals and P1/fontaine-theta-and-primitive-kernel are among its prerequisites.
  - The P1 coverage note says the "field-to-general-Tate proof gaps are closed through Kedlaya–Liu II §3.3 and
    Kedlaya AWS §§2.6–2.7".
  - Nothing more is needed here.
- **Edit 2 (the Scholze 2012 deformation route becomes optional) is applied, with one packet-specific change.**
  - In the packet the two nodes P1/cotangent-complex-vanishing-mod-varpi and
    P1/deformation-lifting-of-perfectoid-mod-varpi-algebras feed P1/perfectoid-mod-varpi-equivalence. Through that
    node, 166 nodes depend on them, P3's almost purity among them.
  - That node's proof does not need them. Steps 1–3 go through the tilting equivalence, and its step 4 says only that
    the inverse is "also" the deformation-theoretic lift. The packet's own gap already says "The general-base
    equivalence P1/perfectoid-mod-varpi-equivalence does not use deformation theory."
  - So the two nodes get round 1's "OPTIONAL ALTERNATIVE ROUTE" hypothesis, the step becomes an optional comparison,
    and the deformation node is dropped from that node's prerequisites.
  - Now no node needs the two, and their ids, statements, proofs and sources are kept, as the verifier asked.
- **Edit 4 (gaps and coverage).** The gap and coverage texts round 1 quotes are not in the packet. The packet's gap
  "Illusie–Gabber–Ramero almost deformation theory and the almost cotangent complex" receives the note instead.
- **Round 1's open question 5a/5f** (whether P0's own finite-étale lifting needs the almost cotangent complex) is
  answered by the packet: it does.
  - P0/finite-etale-lifting-along-complete-flat-almost-algebras uses P0/nilpotent-lifting-of-etale-almost-algebras,
    which uses P0/almost-deformation-theory and, through it, P0/almost-cotangent-complex and DD.0.
  - So P0 keeps the almost cotangent/deformation extension, and the RS-05 record should say so (see the maintainer
    notes).

## /6: AdicEtaleGeometry A3 does not rest on PerfectoidQuotients Q4

Round 1's /6 edits 3–5 are applied as written; every quoted string matched the packet:
- **A3/zariski-closed-immersion-ecd-comparison** gets the new title, keeps part (a), and replaces parts (b) and (c) with
  the boundary statement. Its hypothesis, second proof step, Q4 prerequisite and ECD Theorem 5.8 source record are
  removed.
- **The A3 coverage note** says Q4 is not imported.
- **The suggested file** loses its Q4 supplier comment.
- **The reader document's A3 text and index entry** follow.

The packet no longer has any Q4 prerequisite, so its blueprint edge Q4 → A3 disappears once the packet is promoted
again. The atlas edge and A3's Inputs line are the maintainer's (round 1, edits 1–2).

## /7: P7 plans Česnavičius's Lemmas 5.1–5.2

Round 1 left for "the next P7 round of the P0–P7 packet" the two lemmas that the accepted PAPER-CESNAVICIUS-19 route 16
sends to P7, and that round 1 marks as planned at P7 for PAPER-CESNAVICIUS-SCHOLZE-24/037. No P7 node planned them.

**Reading.** I read the lemmas, their proofs and Lemma 4.7 on the arXiv v4 PDF (`1711.06456v4`, pp. 8 and 11–12). Its
SHA-256 is the one the extraction records.

**The new nodes:**
- **P7/regular-finite-flat-residue-tower** (Lemma 5.1): a filtered system of finite flat regular R_i with regular local
  colimit and algebraically closed residue field, with p-power ranks when k is separably closed. It has the three
  Cohen cases as proof steps.
- **P7/regular-finite-flat-perfectoid-tower** (Lemma 5.2): the explicit towers in the unramified and ramified cases, and
  perfectoidness of R̂_∞. It includes the unit-multiple step of the ramified case (the extraction's ramified-unit-root
  item).

**Lemma 4.7.** Česnavičius's perfectoid criterion is routed by CESNAVICIUS-19 route 7 to PerfectoidQuotients
Q0:integral-algebra, which is not upstream of P7. So the second node proves the instance it needs; the proof is three
lines. It then uses P1/perfectoid-tate-ring-from-integral-perfectoid for the Tate ring.

**The Cohen structure theorem and regular local rings** are in neither pinned library, and no atlas stage plans them.
The packet records this as a new gap.

**Reader document and suggested file.** The P7 section gains the two nodes, the index gains their entries, and the
source lists gain Česnavičius. The suggested file gets comment-only entries.

## /8, edit 6: SW20's definitions on P1's untilt node

P1/untilts-classified-by-primitive-ideals gains two source records from the Berkeley Lectures PDF of 27 March 2020, the
copy the packet already cites (its SHA-256 matches):
- Definition 6.2.9 with Lemma 6.2.10 (p. 46);
- the two functors of Theorem 6.2.11 (p. 47).

The node already quoted Theorem 6.2.11's statement. The rest of /8 edits RelativeFarguesFontaine, FarguesFontaineDiamonds
and RS-20, which are not deliverables here.

## /9: the sousperfectoid prefix of R5

Round 1's edit 4 cannot be applied yet. It sets the parentStageId and realises of 19 R5 nodes to the new sub-stage
AdicSpacesPartII:R5:sousperfectoid, which is not in the atlas, and `check_blueprint.py` accepts only atlas stages.

**What is recorded instead.**
- **A `split` restructure entry** lists the 19 nodes and states the sub-stage's inputs and outputs from round 1's
  edits 1–3. It says to re-parent the nodes and add the coverage record once the sub-stage exists.
- **R5's coverage note** and **the reader document's R5 introduction** say the same.

**Checks.** I confirmed round 1's list:
- the 19 nodes exist;
- their prerequisite closure inside R5 is exactly these nodes;
- their external prerequisites are only R0, R3, AdicEtaleGeometry A1, PerfectoidSpaces P1–P3, Mathlib and the Tau Ceti
  Huber and ValuationSpectrum declarations.

**Not needed.** Neither packet file nor its reader document cites the "ClassicalAdicEtaleCohomology C0" that edit 5
sweeps, so nothing here needs changing.

## Not applied, and why

- **Edits to other owners' files.** All of round 1's other edits go to stage texts, `data/atlas.json`, paper
  extractions, other packets and the restructuring files, and they stay with the owners named there.
- **/9 edit 4** waits for the sub-stage (see /9).
- **/5 edit 4's gap and coverage texts** are not in the packet. Their content is added to the packet's existing gap.

## For the maintainer

- **RS-05 and /5.** P0's blueprint keeps the almost cotangent/deformation extension, for P0's own finite-étale lifting.
  So in round 1's /5 edit 5a, use the "build it" branch:
  - keep the link DD.0 → PerfectoidSpaces:P0 and its eight forwarding links (edit 5f);
  - when AdicSpacesPartII:R5:sousperfectoid and PadicHodgeTheory:P8:primitive exist, add DD.0 → R5:sousperfectoid and
    DD.0 → P8:primitive to that set (C2).

  Edit 5d (the eight DD.0 links that exist only for P1's narrowing) still applies, since P1's deformation nodes are
  now optional.
- **/6.** Delete the atlas edge Q4 → A3 and Q4 from A3's requires (round 1, edit 1). Replace A3's Inputs line (edit
  2). Promote this packet again: `data/blueprints/AdicEtaleGeometry.json` still has the Q4 prerequisite, and the build
  adds a stage edge for every cross-roadmap node prerequisite.
- **/9.** Create AdicSpacesPartII:R5:sousperfectoid (round 1, edits 1–3). Then re-parent the 19 nodes listed in the
  packet's new restructure entry and add its coverage record.
- **/7.** The Cohen structure theorem and regular local rings need an owner (new P0-packet gap). Česnavičius's Lemma
  4.7 is planned at Q0:integral-algebra and proved inline at P7. It could be moved to P1, where both could import it.

## Checks

- `python3 scripts/check_blueprint.py` on the three packets: 0 errors, 0 warnings.
  - PerfectoidSpaces--P0: 326 nodes (was 324), 17 gaps (was 16).
- `research/blueprint/intake.py check-files` on the deliverables: no problems.
