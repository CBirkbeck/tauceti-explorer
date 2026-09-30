# REV-RT-PAPER-SCHOLZE-12

**Complete: ten findings confirmed, two rejected.** Every confirmed finding has a corrected or refined fix. Finding 12's proposed replacement note would itself be a false library claim.

- **Job:** Refs #4603.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence.** Each piece of work was done by another session:
  - the extraction PAPER-SCHOLZE-12: `cc-39fac3`, PR #4556;
  - its review: `cc-fb70e5`, PR #4572;
  - the red team: `cc-f805bf`, PR #4774.
- **Disclosure.** Finding 3 cites PAPER-KEDLAYA-LIU-15, which this session worked on. The verifier for finding 3 was told not to use it. The verdict rests on the promoted AdicEtaleGeometry and AdicSpacesPartII blueprints, the Tau Ceti AdicSpaces Layer 5 text and the paper. No other finding touches this session's work.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-SCHOLZE-12.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources.** Both match the extraction's recorded hashes.
- Published: Publ. Math. IHÉS 116 (2012), 245–313, open access at centre-mersenne.
- arXiv 1111.4914v1, the only version.

**Division of the work.** Three verifiers worked in parallel:
- queue mechanics and ownership (1, 2, 7, 11);
- adic and perfectoid owners (3–6);
- stage citations and library notes (8–10, 12).

I re-checked both rejections myself, and the Tau Ceti declaration behind the finding 12 correction.

**Which plans are live.** Two files decide findings 5 and 6.
- **Not live:** the PerfectoidSpaces packet `research/blueprint/packets/PerfectoidSpaces--P0.json`. Its review is `needs_changes` and it is not in `data/promotions.json`.
- **Live:** for P0–P7, the stage texts plus the accepted decomposition `data/decompositions/PerfectoidSpaces.json`, reviewed by REVIEW-EXT-03, which the build merges into the atlas. The red team read the packet as if it were the plan.
- **Promoted:** the AdicEtaleGeometry and AdicSpacesPartII blueprints, both on 28 September.

## Verdicts

**/1 (high): confirmed; fix corrected.**
- `paper_designs` groups part-ii routes by parent and names the job `<base>PartII`. It switches to Part III only if that literal id exists.
- A read-only run gives `DESIGN-AnalyticToricGeometryPartII` and `DESIGN-DeligneWeightsAndPurityPartII`, each carrying only this paper's route. Both are open as #4583 and #4584.
- The accepted RS-32 and RS-17 already make ShimuraCompactifications and WeightsInEtaleCohomology the Part IIs of these parents.
- **Corrections to the fix:**
  - Do not make those roadmaps the first prerequisite. That would put Shimura or eigenform theory upstream of Theorem 9.6. Name them as existing Part IIs and import at stage level (C0's charts).
  - If the queue switches to Part III, its "already in the atlas" sentence must stop hard-coding `<base>PartII`.
  - The two stale design jobs must be marked superseded and their issues closed. Regeneration keeps old jobs.
- **Systemic.** Five more parents have the same miss: EllipticCurves, ModularForms, JacobianChallenge, ProfiniteCohomology and ArithmeticDirichletSeries.

**/2 (medium): confirmed; one sub-claim wrong.**
- The cross-referenced ids exist nowhere.
- The BKV coalescence does not happen, because BKV's verdict is `revise`.
- The rigid-analytic motives Part II *is* queued, through PAPER-SCHOLZE-26's accepted route, as `DESIGN-MotivesAndAlgebraicCyclesPartII`. Re-point that export instead of deleting it. Delete only the PadicWeightMonodromyPartII export.

**/3 (medium): rejected.**
- Item 23 is Huber's statement for morphisms *of adic spaces* into Spa(R, R⁺).
- The promoted node `AdicEtaleGeometry:A1/maps-from-adic-spaces-to-yoneda-affinoids` proves only the Yoneda-sheaf version. Its Huber 2.1(ii) sentence is an attribution that no proof step establishes.
- The same blueprint's request (A) asks the anchor's Layer 5 for exactly this statement, listing that node as a consumer. Layer 5 (§§5.1–5.4) does not state it. AdicSpacesPartII requests and imports it too.
- So "missing" is right.
- **Near miss.** Route 2 points into the AdicSpacesPartII blueprint, which was finished and promoted before the extraction. Item 23 is therefore planned nowhere, as in finding 4. The finding 4 fix job should add a Huber 2.1(ii) node to AdicSpacesPartII:R0 or refer the owner to the maintainer.

**/4 (high): confirmed; fix refined.**
- A source route only adds text to a blueprint prompt (`make_queue.py` 912–914, 1018), and a finished job never re-runs.
- BP-AdicEtaleGeometry finished on 26 September and was promoted on 28 September. The extraction merged on 29 September.
- Items 31 and 33 (Propositions 2.27 and 2.29) are therefore planned nowhere.
- AdicSpacesPartII:R0 is the right home. Its nodes R0/adic-valuation-rings-and-centres, R0/fibre-over-point and R0/maximal-point-closure-rational cite Huber (1.1.8)–(1.1.10) without any node stating them. The new nodes should become their prerequisites.

**/5 (medium): rejected.**
- The live decomposition node `P3/strongly-finite-etale-maps-are-affinoid-over-affinoids` states Proposition 7.7, so item 106 is planned at P3.
- `P3/finite-extensions-of-perfectoid-fields` records the Gabber–Ramero 6.6.2/6.6.6/6.3.6 inputs, as item 37's note says.
- "Deeply ramified" does occur in the packet, and Remark 3.3 is cited, not proved.
- **Risk:** if the packet is accepted as it stands, items 37 and 106 lose their owner, so its next review must reconcile them.
- Route 1's reason ("the packet replaced the decomposition") is a low-severity wording error.

**/6 (medium): confirmed against the live plan.**
- The decomposition node `PerfectoidSpaces:P2/approximation-lemma` already plans the Lemma 6.5 induction step by step.
- **Fix:** import it, and add a request that P2 state the lemma for Banach-completed perfected monoid algebras of rational cones, graded by a ℤ[1/p]-valued functional.
- The Gordan part of leaf (1) is already imported. Leaf (1) should also require agreement with AnalyticToricGeometry Layer 0 item 9.

**/7 (medium): confirmed; owner corrected.**
- No stage or node defines weight–monodromy purity of a Weil–Deligne representation. R24.5, R19.3, AG2.5/AG2.6 and R34.6 all use it.
- LPV.1 is the wrong owner: it proves the filtration "independently of any claim that these pieces have the corresponding Frobenius weights".
- Route item 140(a) to DeligneWeightsAndPurity:DWP.5 by a `source` route. Route 6 imports it from there.

**/8 (low): confirmed; fix adjusted.**
- Neither SF.4 nor DD.0 states Theorems 5.11–5.12. SF.4 cannot even state them, because it has no edge from DD.0.
- The accepted RS-05 gives the classical cotangent complex to DD.0 and the almost cotangent and deformation extension to P0.
- **Fix:** item 72 is planned at P0 per RS-05. Items 68 and 69 are planned at DD.0 only, with a note that DD.0's text does not yet state them and that the PerfectoidSpaces packet's request (f) asks for them. Drop SF.4.

**/9 (low): confirmed; two corrections.**
- For item 15, the AdicSpacesPartII and AdicEtaleGeometry requests are addressed to anchor Layer 0, not Layer 2.
- Item 29's sheafy case is stated by the unpromoted node P4/stalk-of-plus-sheaf-modulo-pseudouniformizer. Only the non-sheafy affinoid form that Corollary 6.7(ii) needs is stated nowhere.

**/10 (low): confirmed; caveat widened.**
- H3/berkovich-taut-comparison (a) is in the ClassicalAdicEtaleCohomology–H0 packet, which is not promoted; its BP and REV jobs are pending. H3's stage text never mentions Berkovich spaces.
- If (a) is narrowed to curves, TB.0 is the fallback owner for items 27 and 28.

**/11 (low): confirmed; supporting claims overstated.**
- BKV is not accepted work, and it proves a motivic *analogue* of Huber 1998 Theorem 3.6. H5 is in an externally claimed blueprint job, not "in review".
- Route 6 is the only consumer, so its brief should say "Prove here", with Huber's hypotheses.

**/12 (low): confirmed; replacement note for (a) corrected.**
- `IsTateRing.isModuleTopology` (Tau Ceti f790474, Huber/OpenMapping.lean:306) has no noetherian hypothesis and covers perfectoid rings.
- `TauCeti.completeSpace_moduleTopology` (Topology/Algebra/Module/Finite.lean:82) proves completeness of the module topology on every finite module over a complete first-countable ring. The proposed note "completeness … is not proved" is therefore false. Only Hausdorffness is noetherian-only.
- (b) `PreTilt.val` exists, with no valuation on `Tilt`. (c) `IsStrictlyTopologicallyFiniteType.isStronglyNoetherian` exists as described.

## For the maintainer

- **Finding 1 is systemic.** The make_queue fix should read the accepted `extend` restructurings and cover all seven parents whose extension has an id other than `<base>PartII`.
- **Unpromoted packets used as plans.** The accepted extraction review marked items 2, 5, 71 and 27 planned on the strength of unpromoted packets, the PerfectoidSpaces and ClassicalAdicEtaleCohomology–H0 packets. Route 1 still routes 2, 5 and 71. The fix job should record that item 27's owner is provisional.
- **Dead id.** PAPER-QIAN-23 (accepted) also names the id `AnalyticToricGeometryNonarchimedeanPartII`, so the id mapping from finding 2 should be recorded once.
