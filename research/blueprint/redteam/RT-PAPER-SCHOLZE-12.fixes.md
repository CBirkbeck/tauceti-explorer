# RT-PAPER-SCHOLZE-12: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5029, job FIX-RT-PAPER-SCHOLZE-12).

- **Findings:** `RT-PAPER-SCHOLZE-12.result.json`.
- **Verdicts:** `RT-PAPER-SCHOLZE-12.review.json` and `reviews/REV-RT-PAPER-SCHOLZE-12.md` (verifier `cc-48533a`).
  - Ten findings are confirmed: /1 and /4 high; /2, /6 and /7 medium; /8–/12 low.
  - /3 and /5 are rejected.
- **What this job fixes:** the five confirmed high and medium findings, /1, /2, /4, /6 and /7, as the issue lists them. Where the verifier's reason differs from the red team's fix text, I followed the reason. The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-SCHOLZE-12 (PR #4774).
  - It also wrote the extraction PAPER-SCHOLZE-13, and reviewed PAPER-KEDLAYA-LIU-15 and PAPER-SCHOLZE-17.
  - It did not write this extraction, its review or the verification.
  - The fix stays within the scope that the independent verifier authorised, and uses its corrected fixes. Where the verifier narrowed or changed my own red-team fix (/1, /2, /4, /6, /7), its version was applied.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-SCHOLZE-12.result.json`;
  - `papers/PAPER-SCHOLZE-12.md`: counts, routes 2 and 4–6, and a closing section "Fixes after the red team";
  - this report.

  No packet, queue file or other paper is a deliverable. Every change a finding asks of them is listed under "For the maintainer".
- **Result.** 154 items (13 library, 112 planned, 29 missing), 7 routes.
  - Route 4 keeps its items, 31 and 33. Its target changes from AdicEtaleGeometry:A1 to AdicSpacesPartII:R0. This is the verifier-authorised owner correction (/4) of the same items that the review's route-4 verdict accepted.
  - Route 2 is unchanged.
  - Routes 5 and 6 keep their positions.
  - The source route to DeligneWeightsAndPurity DWP.5 that the verifier prescribed for /7 is a new last route, **route 7**. The extraction's review (`PAPER-SCHOLZE-12.review.json`, a dated record left unchanged) has no verdict for route 7. The queue applies only routes whose position the review accepted (`accepted_routes` in make_queue.py), so route 7 is not applied until the next review of the extraction accepts it. Route 7's reason says so.
  - This keeps any route from inheriting a verdict it never received.

## /1 (high, duplicate): both Part II routes ignored the accepted extensions RS-32 and RS-17: fixed in the extraction; the queue side goes to the maintainer

I followed the verifier's version.

- **No Shimura or eigenform theory upstream.** Each route keeps its parent as first prerequisite. Neither ShimuraCompactifications nor WeightsInEtaleCohomology becomes a roadmap-level prerequisite; the red team's fix would have put ShimuraData, PELModuli and each automorphic realisation upstream of Theorem 9.6.
- **Titles and ids are unchanged.** The verifier left "Part III" against a sibling "Part II" to the maintainer, so neither title is renumbered.
- **Route 5's brief** now opens by naming the existing Part II: RS-32 makes ShimuraCompactifications "Analytic toric geometry, Part II: arithmetic toroidal compactifications".
  - The route builds beside it and imports C0's toric charts over base rings at stage level.
  - It plans only what C0 lacks: fan gluing over a nonarchimedean field and its valuation ring, formal completion, and adic and perfectoid toric spaces.
  - Leaf (1) imports the glued general-base X(Σ) from C0 as well, if RT-AREA-algebraicgeometry/34 settles that owner there; otherwise it glues here.
  - These sentences come first, so the design job's 500-character excerpt of the brief carries the RS-32 sentence.
- **Route 6's brief** now opens by naming WeightsInEtaleCohomology as the existing Part II (RS-17: "Deligne weights, purity and the Weil bounds, Part II: Arithmetic cohomology and eigenform applications").
  - The route builds beside it, with no dependence on it.
  - It says where R34.6 stops: R34.6 states the exact local monodromy-weight theorem its applications need and assumes no general weight–monodromy. R34.6 may consume Theorem 9.6.
- **Both reasons** cite the accepted extension and this finding.
- **Checked.** Both RS extensions are in `data/restructure/RS-32.result.json` and `RS-17.result.json`, with action `extend` and the titles quoted. C0's stage text keeps "Extend affine toric charts from complex coefficients to the base rings used in integral models". The packet nodes C0/relative-torus-embedding and C0/relative-face-open exist (`packets/ShimuraCompactifications--C0.json`).
- **Cycle test.** R34.6 reaches none of route 6's imports on the assembled atlas (below), so R34.6 consuming Theorem 9.6 closes no cycle.

## /2 (medium, error): cross-references to ids the queue never creates, and a coalescence that does not happen: fixed

I followed the verifier's version, which keeps the motives export.

- **Cross-references.** Routes 5 and 6 now name each other by title and by the ids that `paper_designs` generates today: `AnalyticToricGeometryPartII` and `DeligneWeightsAndPurityPartII`, with their design jobs.
  - This replaces route 6's two uses of `AnalyticToricGeometryNonarchimedeanPartII` and route 5's export to `DeligneWeightsPartIIWeightMonodromy`.
  - The routes' own `roadmap` fields are unchanged. The queue uses them only to point at "the route to …" in this file.
- **The coalescence.** The sentence "This route coalesces with …" is replaced.
  - The new text says that PAPER-BINDA-KATO-VEZZANI-25's toric route (its route 14, same title) is in an extraction under revision (review verdict "revise"), that none of its routes is queued, and that its resubmission should import this roadmap.
  - Route 5's reason says the same.
- **BKV content stated in the brief.**
  - Gap G12: "the generic-base divisor, formal-model and approximation construction leaves", with the paths of BKV's review file and result file.
  - The tests: the divisor of type (2, 0) on ℙ¹ × ℙ¹ (two disjoint fibres, so not connected: it refutes an unconditional connectedness shortcut, and ampleness is kept wherever SGA 2 connectedness is used); rescaling a section; and a nonreduced equation. These are the tests of BKV's route-14 brief. I checked that a section of 𝒪(2, 0) is a binary quadratic form in the first factor's coordinates, so its zero locus is two fibres {a} × ℙ¹, or a double fibre.
- **Exports.**
  - The export to `MotivesRigidAnalyticPartII` is re-pointed to "Algebraic cycles, pure and mixed motives, Part II: rigid analytic and logarithmic motives". This is queued as `DESIGN-MotivesAndAlgebraicCyclesPartII` from PAPER-SCHOLZE-26 route 1, which keeps BKV's route-13 brief with "the toric extension's geometric tube".
  - The export to `PadicWeightMonodromyPartII` is deleted. The brief says BKV's p-adic Part II is held with the rest of that extraction.
  - Route 6's reason no longer names `PadicWeightMonodromyPartII` or the dead toric id.
- **Checked.** `DESIGN-AnalyticToricGeometryPartII`, `DESIGN-DeligneWeightsAndPurityPartII` and `DESIGN-MotivesAndAlgebraicCyclesPartII` are pending in `queue.json`. `paper_designs` (make_queue.py) names a Part II job `<base>PartII` and ignores the route's own id.

## /4 (high, missing): Propositions 2.27 and 2.29 were routed into a finished blueprint: fixed in the extraction; the node amendment goes to the maintainer

- **Route 4** keeps items 31 and 33 and is retargeted from AdicEtaleGeometry:A1 to AdicSpacesPartII (stage R0). Its reason is rewritten.
- **Their notes** name the owner, AdicSpacesPartII:R0, beside R0/fibre-over-point and its κ(y), which it requests from the anchor's Layer 5.
  - They say that the nodes must come by a packet amendment. The blueprint is finished and promoted, and a source route only adds text to a blueprint prompt.
  - The new nodes should be prerequisites of R0/adic-valuation-rings-and-centres, R0/fibre-over-point and R0/maximal-point-closure-rational, in place of those nodes' bare Huber (1.1.8)–(1.1.10) citations.
  - The items become planned once the amendment lands.
  - Item 33's note adds that AdicEtaleGeometry's Layer-1 request for the chain description of Spa(K, K⁺) (needed by A2/dimension-of-adic-spaces) should point at the Proposition 2.29 node.
- **Why keep a route.** The verifier said to drop route 4 and to mark the items planned once the amendment lands. It also said that a source route into the finished AdicSpacesPartII blueprint would be inert.
  - Until the amendment lands, the items are missing. PROTOCOL §16 and `check_paper.py` require every missing item of a complete extraction to be routed exactly once.
  - So route 4 records the owner. Its reason says the blueprint is finished and that the items become planned only after an R0 packet amendment.
- **Item 23 (verifier's note on the rejected /3).** Route 2, unchanged here, is equally inert for item 23 (Huber 1994 Proposition 2.1(ii), maps into an affinoid adic space). The owner question goes to the maintainer.
- **Checked.** In `data/blueprints/AdicSpacesPartII.json`:
  - R0/adic-valuation-rings-and-centres cites Huber (1.1.8) and 1.1.10(iii) in its proof steps;
  - R0/fibre-over-point cites (1.1.8) and (1.1.9);
  - R0/maximal-point-closure-rational cites 1.1.10(i);
  - no node states them.

  AdicEtaleGeometry's request to the anchor's Layer 1, with `neededBy` A2/dimension-of-adic-spaces, asks for "the description of Spa(K, K⁺) … as a chain of specialisations".
- **Cycle test.** The implied edge AdicSpacesPartII:R0 → AdicEtaleGeometry:A2 already exists on the atlas and is acyclic.

## /6 (medium, duplicate): the approximation induction of Lemma 6.5 was planned twice: fixed in the extraction; the P2 request goes to the maintainer

I followed the verifier's version.

- **Leaf (5) of route 5** no longer writes out the induction. It now asks for three things:
  - the identification of R_D, for D = Σ a_i D_i, with the Banach-completed perfected monoid algebra K⟨C_D ∩ (M[p^{-1}] × ℤ[p^{-1}])⟩ of the rational polyhedral cone C_D = {(u, j) : ⟨u, v_i⟩ ≥ −j a_i for all i}, graded by (u, j) ↦ j, and of its tilt with the same construction over K♭;
  - the import of the approximation lemma from P2: PerfectoidSpaces:P2/approximation-lemma of the reviewed decomposition, and P2/approximation-on-perfectoid-polydisc once the PerfectoidSpaces packet is promoted;
  - a request that P2 state that lemma for Banach-completed perfected monoid algebras of a rational polyhedral cone C in L_ℝ, graded by a ℤ[p^{-1}]-valued linear functional, with degree-0 part K.
- **Leaf (1)** takes the dual semigroup and its finite generation from Analytic toric geometry Layer 0 item 6. It requires X_{Σ,ℂ} to agree with the fan scheme of Layer 0 item 9 (PROTOCOL §15, last bullet). As the verifier found, Gordan was already imported, so nothing had to be removed.
- **The imports list** adds Layer 0 items 6 and 9 and the P2 approximation lemma.
- **Item 133's note** no longer says the Part II "must write the induction out". It gives the identification and the import.
- **The mathematics, checked.**
  - By the item's own statement, the degree-j piece of R_D is spanned by the χ^u with u ∈ M[p^{-1}] and ⟨u, v_i⟩ ≥ −j a_i for all i. These are exactly the lattice points (u, j) of C_D.
  - C_D is cut out by finitely many linear inequalities with integer coefficients, so it is a rational polyhedral cone in M_ℝ × ℝ.
  - Proposition 8.7 assumes X_{Σ,K} proper, so Σ is complete. Then u with ⟨u, v_i⟩ ≥ 0 for all rays is 0, so the degree-0 part is K, as for the polydisc.
  - The polydisc K⟨T_0^{1/p^∞}, …, T_n^{1/p^∞}⟩ is the case of the positive orthant graded by total degree.
- **Checked.** Both P2 node ids occur in `packets/PerfectoidSpaces--P0.json`, and P2/approximation-lemma is in `data/decompositions/PerfectoidSpaces.json`, with the proof steps of Lemma 6.5 that route 5 used to repeat. Analytic toric geometry Layer 0 items 6 and 9 were read in the anchor document.

## /7 (medium, duplicate): the weight–monodromy predicate would be owned by a leaf roadmap: fixed

I followed the verifier's owner, DWP.5 by a `source` route, rather than the red team's LPV.1.

- **Item 140 is split.**
  - The new **item 154** (definition, missing) states weight–monodromy purity of weight i for a Frobenius-semisimple Weil–Deligne representation (Taylor–Yoshida purity), with the monodromy filtration of N pinned. For a representation of G_k, it goes through the Frobenius semisimplification of its Weil–Deligne representation (R01.2).
  - Item 154's note lists the consumers that should import it: R24.5/compatible-system-predicates, R19.3/strict-compatibility-and-the-monodromy-weight-purity, AG2.5, AG2.6/polarized-compatible-system-strictly-pure, R34.6, and route 6.
  - **Item 140** keeps Conjecture 9.3 for a proper smooth variety. Its statement now refers to item 154, and its note records the split.
- **The new route 7** (source, DeligneWeightsAndPurity, stage DWP.5, item 154), appended as the last route. It has no review verdict, and its reason says it is not applied until the next review of the extraction accepts it. Its reason gives the grounds:
  - DWP.5 imports LPV.1's N and filtration and proves "the weights of the monodromy graded pieces";
  - LPV.1 proves the filtration "independently of any claim that these pieces have the corresponding Frobenius weights" and says "DWP.5 owns the later local weight estimates".
  - Both quotations were read in the atlas stage texts.
- **Route 6's brief** no longer says "Define first …". It imports the predicate from DWP.5 and states only Conjecture 9.3 for varieties. It keeps the stability statements (item 141) and the theorems.
- **Placement.** BP-DeligneWeightsAndPurity--DWP.0 is still pending, so a source route to DWP.5 reaches a blueprint that has not been written. The DWP.0 packet's coverage says DWP.5 is not planned in checkpoint 1.
- **Cycle test.** DWP.5 → R24.5, R19.3, AG2.5, AG2.6 and R34.6 are acyclic on the assembled atlas; each target is already downstream of DWP.5, and DWP.5 → R34.6 is an existing edge. R01.2 → DWP.5 and LPV.1 → DWP.5 are existing edges.

## /8 (low, error): not applied

Theorems 5.11–5.12 (items 68, 69, 72) cite SF.4, which cannot state them. This is a low finding, recorded only. The verifier's fix:
- items 68 and 69 planned at DerivedDeRhamCohomology:DD.0 only, with a note that DD.0's text does not yet state them and that the PerfectoidSpaces packet's request (f) asks for them;
- item 72 planned at PerfectoidSpaces:P0, per RS-05;
- SF.4 dropped.

## /9 (low, error): not applied

Items 15 and 29 have the wrong owners and requests. This is a low finding, recorded only. The verifier's fix:
- item 15's note names anchor Layer 3.1 as the consumer, and the three open requests (the PerfectoidSpaces packet to Layer 2; AdicSpacesPartII R0a (b) and AdicEtaleGeometry (A) to Layer 0);
- item 29 becomes missing for the general Tate-affinoid statement, with a note that P4/stalk-of-plus-sheaf-modulo-pseudouniformizer plans the perfectoid case.

## /10 (low, error): not applied

Items 27 and 28 rest on H3/berkovich-taut-comparison (a) in the unpromoted ClassicalAdicEtaleCohomology–H0 packet. This is a low finding, recorded only. The verifier's widened caveat: their owner depends on that packet being accepted and promoted with (a) in full generality. If (a) is narrowed to curves, TB.0 is the fallback owner.

## /11 (low, other): not applied

Route 6's brief says "Prove or import" Huber's Theorem 3.6(a) without an owner. This is a low finding, recorded only. The verifier's fix: route 6 says "Prove here Huber's theorem … with the hypotheses of Hub98a Theorem 3.6(a)". H5 is not "in review", and BKV proves only a motivic analogue.

## /12 (low, library-claim): not applied

Item 80's library note is wrong. Items 39 and 20 need library citations. This is a low finding, recorded only.
- The verifier's replacement note for item 80 cites three declarations:
  - `TauCeti.completeSpace_moduleTopology` (Topology/Algebra/Module/Finite.lean:82): completeness on finite modules over a complete first-countable ring;
  - `IsTateRing.isModuleTopology` (Huber/OpenMapping.lean:306): no noetherian hypothesis;
  - `IsTateRing.t2Space_moduleTopology`: noetherian only.
- The red team's own replacement note ("completeness … is not proved") was itself false, and must not be used.
- Items 39 (`PreTilt.val`) and 20 (`IsStrictlyTopologicallyFiniteType.isStronglyNoetherian`): as the red team proposed.

## /3 and /5: rejected

- **/3.** Not applied. The verifier's side remark on item 23 is handled under /4.
- **/5.** Not applied. The verifier notes that route 1's reason ("the packet replaced the 33-node decomposition") is a low-severity wording error. It is not in this job's scope and is left as it stands.

## For the maintainer

These changes lie outside this job's deliverables.

- **make_queue (/1).**
  - In `paper_designs`, treat a parent as already having a Part II when an accepted restructuring extends it (`roadmaps[*].action == "extend"` and `extends == parent` in `data/restructure/*.result.json`). Do not rely only on `<base>PartII` being in the atlas. Put the extension's id and title in the design brief.
  - If the job switches to Part III, the "built" sentence must stop hard-coding `{base}PartII`. The verifier's simulation shows it would otherwise name an id that does not exist.
  - The same miss affects EllipticCurves, ModularForms, JacobianChallenge, ProfiniteCohomology and ArithmeticDirichletSeries.
- **Stale design jobs (/1).**
  - `DESIGN-AnalyticToricGeometryPartII` (#4583) and `DESIGN-DeligneWeightsAndPurityPartII` (#4584) were generated from the old briefs.
  - Regeneration keeps old jobs (the `extra_old` merge), so holding them is not enough. Mark them and their reviews superseded, and close or relabel the issues.
  - Regenerate them from the fixed briefs.
  - Decide whether the two new roadmaps are numbered Part III or stay subtitled sibling Part IIs.
- **Dead id (/2).** PAPER-QIAN-23 (accepted) also names `AnalyticToricGeometryNonarchimedeanPartII`. Record once that the queue designs it as `AnalyticToricGeometryPartII`.
- **AdicSpacesPartII:R0 amendment (/4, and the verifier's note on /3).** Open a targeted amendment of the promoted AdicSpacesPartII packet with two R0 nodes:
  - points of Spa(R, R⁺) as maps to complete affinoid fields with dense image (Sch12 Proposition 2.27);
  - specialisation x ≻ y as K ≅ L with L⁺ ⊂ K⁺, and the generalisations of y as a chain of length its rank (Sch12 Proposition 2.29, citing Huber 1996 (1.1.6)–(1.1.10)).

  Make them prerequisites of R0/adic-valuation-rings-and-centres, R0/fibre-over-point and R0/maximal-point-closure-rational, in place of their bare Huber citations.
  - Consider a third node, or an owner decision, for Huber 1994 Proposition 2.1(ii) (item 23). R0 imports it, and both AdicSpacesPartII (request (b)) and AdicEtaleGeometry (request (A)) ask the anchor's Layer 5 for it, but Layer 5 does not state it.
  - Re-point AdicEtaleGeometry's Layer-1 request (neededBy A2/dimension-of-adic-spaces) at the Proposition 2.29 node.
  - Once the amendment lands, mark items 23, 31 and 33 planned at AdicSpacesPartII:R0.
- **Source routes into finished blueprints (/4).** Until make_queue can apply a source route to a finished blueprint, reviewers should reject source routes of missing items into layers whose blueprint job is done.
- **PerfectoidSpaces:P2 request (/6).** The PerfectoidSpaces packet (unpromoted, review `needs_changes`) should receive a request, or its next round a node: the approximation lemma for Banach-completed perfected monoid algebras K⟨C ∩ (L ⊗ ℤ[p^{-1}])⟩ of a rational polyhedral cone, graded by a ℤ[p^{-1}]-valued functional, with degree-0 part K. The polydisc node is the case of the positive orthant graded by total degree.
- **Weight–monodromy consumers (/7).** When DWP.5 plans item 154, R24.5/compatible-system-predicates, R19.3/strict-compatibility-and-the-monodromy-weight-purity, AG2.5, AG2.6/polarized-compatible-system-strictly-pure and R34.6 should import it rather than restate it. Every such edge from DWP.5 is acyclic.
- **Route 7 needs a review verdict.** The verifier of /7 prescribed route 7 (DWP.5), but the extraction's review has no verdict for it, so the queue will not apply it. The next review of PAPER-SCHOLZE-12 should give route 7 a verdict. Only then does the paper become a source of the DWP blueprint.
- **Low findings.** /8–/12 are recorded above with the verifier's fixes, for a later round or the next review of the extraction.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHOLZE-12.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: no problems.
- **Formatting and edits.** The JSON keeps its formatting: indent 1, non-ASCII characters written literally, final newline. I checked before editing that re-serialising the file gives it back unchanged. One script applied every JSON edit. It asserted that each replaced text occurred exactly once in its field, and that whole-value replacements (item 140's note, route 4, route 2's restoration from HEAD) matched the old value or route. A second pass, after the coordinator's instruction, moved the DWP.5 route to position 7, retargeted route 4 and restored route 2 byte-identically. A second script edited the report under the same assertion.
- **Cycle test.** Read-only, on the atlas that `scripts/build.py` assembles in memory (`assemble()`: 2,840 stages, 8,258 stage edges). Every edge named above is acyclic.
- **No new library declaration is cited.** Every stage and node id cited was checked against `data/atlas.json`, `data/blueprints/`, `data/decompositions/` or `research/blueprint/packets/`.
- No Lean was run.
