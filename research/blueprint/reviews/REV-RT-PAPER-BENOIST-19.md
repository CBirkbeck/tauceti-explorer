# REV-RT-PAPER-BENOIST-19

**Complete: 55 of 60 findings confirmed and 5 rejected.** For many of the confirmed findings the fix is narrowed or corrected; the fixer follows the reasons in the verdict file, not the red team's fix text.

- **Job:** Refs #4301.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** the extraction PAPER-BENOIST-19 (cc-442dc5, with Codex checkpoints), its review REV-PAPER-BENOIST-19 (cc-d67081), the errata record and its review, and the red team RT-PAPER-BENOIST-19 (cc-48533a) were all done by other sessions. The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-BENOIST-19.review.json`](../redteam/RT-PAPER-BENOIST-19.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Severity | Findings | Confirmed | Rejected |
| --- | ---: | ---: | ---: |
| high | 6 | 6 | 0 |
| medium | 27 | 23 | 4 (/18, /19, /21, /22) |
| low | 27 | 26 | 1 (/38) |
| **total** | **60** | **55** | **5** |

## Evidence and scope

**Texts read.**
- The published paper, Publ. Math. IHÉS 130 (2019) 63–110, [from Numdam](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), fetched 30 September 2026. It has 48 pages, and printed page p is PDF page p − 62. Its SHA-256 `8dfc0f22…98d3b` matches the extraction's record.
- [arXiv 1804.03642v2](https://arxiv.org/abs/1804.03642v2), SHA-256 `5dc12ae7…9cc3cda`, which matches, together with its LaTeX source for formulas.
- Page images at 300 dpi for pages where the text layer drops symbols (Θ, ≠, ∤).

**How the verification was done.** Six verifiers worked in parallel, each on ten findings. I reconciled their verdicts, re-checked the rejections and high findings myself, and resolved conflicts between fixes (see /2 and /24 below). Each finding was checked against:
- the paper at its locator;
- the extraction's items, routes, sourceIssues and review;
- the errata record [`errata/PAPER-BENOIST-19.json`](../errata/PAPER-BENOIST-19.json) and its review;
- `data/atlas.json` stage texts and `stageEdges`, and the promoted blueprints in `data/blueprints/`;
- packets, campaign READMEs, and other extractions with their review verdicts;
- `research/blueprint/make_queue.py`, whose grouping logic was re-run read-only;
- the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474) through `declarations.tsv` and the source trees;
- bibliography DOIs, through Crossref.

No Lean was compiled; no finding requires it.

## High findings (all confirmed)

- **/1, Part II merging.** `paper_designs` keys accepted part-ii routes by parent only, and tells the merged job to "plan the first" if the proposals diverge. For AlgebraicTopology the first proposal is Browning–Sawin's configuration spaces; for QuadraticFormInvariants it is Dittmann–Pop's. Either job can lawfully defer the Benoist/BW20 tranche, which RealSurfacePeriodIndex needs.
  - Fixer: add a "required supplier, do not defer" sentence to the briefs of routes 6–8.
  - Maintainer: the `make_queue.py` change is a note.
- **/2, cycles from route 1 (narrowed).** Two cycles are real:
  - SF.2 ↔ MC.2, because items 34 and 56 use the cycle class map that MC.2 owns;
  - SF.2 ↔ topology Part II, because BW20's route 6 brief imports SF.

  The claimed SF.3 cycle is not forced: Pic = H¹_et(G_m) and the étale Kummer sequence are SF.2 content. Keep the étale forms in SF.2. Move the Betti and equivariant-Betti forms, and the Scheiderer comparison, to SF.6 or a late SF.2 suffix.
- **/3, item 141 is circular.** Item 141 assumes unramifiedness, which is exactly what Proposition 4.2 proves at x. The fix restates Witt as injectivity of Br(ℝ(C)) into the product over orderings, applied to the normalisation of Γ′.
- **/4, items 75 and 78 drop a hypothesis.** They drop H¹(R, A|_R) = 0. Counterexample, re-derived: a smooth plane quartic R ⊂ ℙ² with A = O(1). Then K_R = O_R(1), so h¹ = 1.
  - Correction to the red team: Proposition 6.6's very ample A is a *different* bundle from Proposition 5.5's, and the two must be kept apart.
- **/5, gap in Proposition 6.6.** The transported lift is never shown to lift α on the nearby fibre. The repair normalises β by cl(φ̄) and needs a trivialisation of the pair (T_y, p_y⁻¹(R)), for example by Thom's isotopy lemma, stated as a cited input and not as plain Ehresmann. Record it as a new source issue.
- **/6, stalks of item 107.** For n = 2 the stalk is Z/4 and the extension does not split, as the paper remarks on p. 100. The double cover is unaffected. The clause is not used downstream, so medium severity would also be defensible.

## Rejections

- **/18.** ShimuraData:D3 already plans the VHS carrier in the atlas, so under §16 item 151 must be `planned: D3`. The red team's fix would record an atlas-planned item as missing. The ownership conflict between D3 and HodgeStructuresPartII predates this paper (Bakker–Klingler–Tsimerman routes 3 and 8). It belongs to the merged design job or a restructure.
- **/19.** The overlap in content with Landesman–Litt and Esnault–Groechenig is real. But `make_queue.py` merges every HodgeStructures Part II into one design job, told to merge what overlaps, which is exactly the red team's alternative fix. The residual naming problem is /1.
- **/21.** The dependency runs the other way. AdicSpacesPartII's F0 proof uses "Serre vanishing … (supplier R09.1)", and its requests ask R09.1 for Serre's theorems. Deleting route 4 would leave Serre vanishing without an owner. Witaszek-22's SF.2 placement is not applied, because that paper's verdict is `revise`.
- **/22.** There is no duplication. BW20's Lefschetz items are all equivariant, and its affine vanishing uses étale Artin vanishing. Neither the integral weak Lefschetz theorem nor Andreotti–Frankel is planned anywhere else, and their consumers lie on route 9 only, so there is no cycle.
- **/38.** The mathematics is right: p. 108 excludes only poles, twice. But the errata record's E13, confirmed on review, already requires avoiding both zeros and poles at both points. The residue (the extraction's E13 `printed` field and an inaccurate review sentence) is folded into /8.

## Notable scope corrections among the confirmed findings

- **/2 with /24.** The topology Part II may import SF.2's equivariant sheaf cohomology and Hochschild–Serre spectral sequences (Kings–Sprang route 3). It must not import the SF *comparison*. The order SF.2 → topology Part II → SF.6 or late suffix → MC.2 is acyclic.
- **/7 and /8.** Θ is the *non-vanishing* locus of α. The extraction's E3 and E4 reasons, and REV-PAPER's quotation of p. 79, invert it. The two E1–E19 records conflict, and REGISTER.md lists each mistake twice. The errata record is right on E7 and E8. The fixer aligns the extraction side only. Review verdicts (E3, E13, E19) need a review job. De-duplicating the register is a tooling note.
- **/9 and /10: new source issues.**
  - Lemma 6.4 (p. 92): t vanishes doubly along R, so its real zero locus contains R(ℝ). Two repairs are checked.
  - Proposition 4.2 (p. 80): the ℙ¹ fibres over R ∩ D are missed by the case split. The same argument covers them.
- **/15.** The Artin comparison is already owned by Landesman–Litt item 116 (accepted route 3, IG.0/IG.1). Point to that owner, not SF.2.
- **/16.** Tsen is planned twice (Schröer route 2 and Benoist route 8). Plan it once, in the general form, in the quadratic-form Part II.
- **/30.** At the pin, Mathlib has `RingPreordering.IsOrdering`, `IsFormallyReal`, `IsSemireal` and `IsRealClosed`, but no Harrison topology. Real-closure existence is Tau Ceti RealAlgebraicGeometry Layer 1, which is not yet in the atlas.
- **/31 and /33.** The BW1 inputs are already BW20 items (free-descent, equivariant-gysin, wu-pushforward, top-norm-sequence), and Zariski–Nagata is CS24/050. Cite these instead of re-adding them.
  - Mangolte–van Hamel is used on p. 106, not p. 107.
  - Lieblich 2008 is context only.
- **/34.** E19 is not a mistake: the pairing (1, rg) is valid as printed. Record it as rejected, consistent with the errata review.
- **/35.** Neither file has `sourceVersions`, and the errata file fails `check_errata.py` because E1 affects a stated result.
- **/53.** The vanishing lemma is the root-namespace `isZero_groupCohomology_succ_of_subsingleton`, and `Rep.indCoindIso` supplies the Ind ≅ Coind step. Statuses stay missing.
- **/55.** The analytic carrier is the upstream Cohomological Point Counting / Complex Comparison (PR196; atlas external `UPSTREAM:CohomologicalPointCounting/ComplexComparison (PR196)`). It is not ComplexComparisonPartII:C0, which itself imports that carrier.

## For the maintainer

- `make_queue.py` groups Part IIs by parent and plans only the first direction (/1). Route 9's design job has no `after` ordering (/17).
- REGISTER.md double-lists Benoist's mistakes (/8).
- BW20's route 6 brief imports SF, which conflicts with the acyclic order above (/2). BW20 route 6 also re-plans the Hochschild–Serre spectral sequence (/24).
- The D3 versus HodgeStructuresPartII ownership of the VHS carrier (/18) needs a decision.
- The SF.4 versus R09.7 split for resolution (/51) needs a decision.
- The review verdicts of E3, E13 and E19 need a review job.

## For the fix job

Apply every confirmed finding, high, medium and low, in the scope stated in its verdict reason. Where several findings touch the same brief or record, make the edit once:
- routes 6–9 briefs: /1, /17, /56, /59;
- the E1–E19 reconciliation: /7, /8, /34, /38 residue;
- item 118: /11, /48;
- item 141: /3, /50;
- Proposition 5.5 labels: /4, /39.
