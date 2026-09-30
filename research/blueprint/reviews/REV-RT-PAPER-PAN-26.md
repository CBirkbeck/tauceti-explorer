# REV-RT-PAPER-PAN-26 — verification of the red-team findings on PAPER-PAN-26

**Verdict: all fourteen findings are confirmed, at the severities the red team gave: one high, eight medium and five low.**

Eleven fixes need adjusting. The fixes of /5, /7 and /14 stand. Each reason in `RT-PAPER-PAN-26.review.json` states the corrected fix.

Two adjustments recur:
- **New routes join accepted proposals.** Routes that move material to a proposed owner reuse that proposal's key, so that the designs merge:
  - locally analytic vectors go with Ding route 1 (/2);
  - Fontaine's almost de Rham theory goes with the PadicHodgeTheory Part II, which four accepted routes already feed (/3);
  - the Drinfeld-tower de Rham cohomology goes with Colmez–Dospinescu–Nizioł 2020-B (/5).
- **Statuses follow §16 exactly.** Where an item states more than a layer or declaration gives, it is split, or the layer or declaration is cited in its note (/4, /6, /8, /13).

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4319).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-PAN-26 (Claude Code, `cc-f805bf`, #4768);
  - the extraction (`cc-fb70e5`, #2223);
  - its review (`cc-7b31c4`, #2369).

  Nor did it take part in the other extractions the findings rely on (Ding, Dospinescu–Le Bras, Fargues–Fontaine, Colmez–Dospinescu–Nizioł, Breuil–Hellmann–Schraen, Gleason–Lim–Xu, Guo–Reinecke).
- **Disclosure.** This verifier wrote REV-PAPER-HEUER-25 (#4717). /3 names Heuer's PadicHodgeTheory Part II route only as one of the proposals a new route would merge with. No finding attacks it, and no verdict here depends on it.

**What was checked.**

- **The source.** arXiv:2209.06366v1 (`0873b61a…31b4`, the recorded hash); PDF page = printed page. The published Annals text is paywalled and was not read, so source-mistake verdicts are scoped to v1.
- **The records.**
  - The extraction and its review.
  - `make_queue.py` (PAN_BRIEF, `paper_designs`, the design list) and `queue.json`.
  - The design issues #950 and #3459.
  - The routes and items of the extractions named above.
- **The atlas.** Every stage, packet node and decomposition node a finding cites.
- **Libraries.** Mathlib `082e2d3`: the compact-operator, Fontaine θ and B_dR declarations.
- **Re-derived:**
  - the vanishing of W_k for B⁺_dR/(t^k)-modules (/10);
  - the non-unit [ε^{1/p}] − 1 in A_inf[1/p], and hence ker θ (/12(13));
  - the triviality of the leftover twist on GL₂(ℚ_p) (/12(12)).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The high finding

**/1: confirmed; the fix is the maintainer's.**
- `paper_designs` keys part-ii routes by parent alone. So Pan's 206 items feed the grouped #3459, while DESIGN-PAN (#950) plans the same paper without seeing the extraction. Both jobs are open and claimable, and the job-id dedup lets both through.
- The extraction and its review followed the maintainer's papers.json instruction. The defect is in the queue script.
- The fix job only adds a sentence to route 1's reason. Re-keying the route would create a third job.

## Owners and routes (/2–/8, /14)

- **/2: confirmed; the fix is adjusted.**
  - L0–L2 plan no locally analytic vectors. The owner is LocallyAnalyticRepresentationsOfLocalGroups, keyed like Ding route 1, and /357 goes with it.
  - The compact-operator and LB items have no owner, so the new brief must plan them; if a source route remains, it names L4, not L0.
  - Route 1's imports need the same correction.
- **/3: confirmed; the fix is adjusted.**
  - The new route joins DESIGN-PadicHodgeTheoryPartII, which four accepted routes feed.
  - Its brief must cover Pan's Banach and LB generalisations and cite P7/sen-module.
- **/4: confirmed; the fix is adjusted.** T6 plans the log period sheaves. /494's modular-curve Kodaira–Spencer clause is unplanned and must be split off.
- **/5: confirmed; the fix stands.**
  - Finiteness is RD.5. Log-rigid cohomology is unplanned.
  - The Drinfeld-tower cohomology goes with Colmez–Dospinescu–Nizioł 2020-B. /433's j_! presentation may stay with a citation.
- **/6: confirmed; the fix is adjusted.** /300 splits across A4 (D_dR and Gauss–Manin), B3 (the canonical extension) and R15.1 (Kodaira–Spencer, cited with its proof unowned). θ_{k+1} and /326 go to route 1.
- **/7 (low): confirmed; the fix stands.** ET.6 stays cited in /361's note for the finite-level spaces.
- **/8: confirmed; the fix is adjusted.**
  - Several Pan I results are already items; only four lack them.
  - Emerton's compatibility is planned at R31.4.
  - [Sch13, Prop. 7.9] is missing, not planned at P8.
- **/14 (low): confirmed; the fix stands.** Pan's Theorem 1.1.2 proves the classicality step that R31.6 records under stronger hypotheses. The cross-reference is the right remedy.

## Statements and source mistakes (/9–/13)

- **/9: confirmed; the fix is adjusted.**
  - /556 already has its hypotheses; the defect is its concluding equality.
  - Cite BB10 and Eme06a with LXZ12/Col14, not a "dual" conjecture.
  - Separate the two uses of DLB17 in /552.
- **/10: confirmed; the fix is adjusted.**
  - Only Corollary 6.1.21 is vacuous as printed.
  - The locator is pp. 91–92.
  - "Affects nothing" fits, as for this file's E2.
- **/11 (low): confirmed for (a) and (c)–(e).** (b) is faithful: the upgrade to GL₂(ℚ_p) is in Theorem 1.1.7 itself.
- **/12 (low): confirmed, all sixteen.**
  - (13) is re-derived.
  - (12)'s twist is trivial on GL₂(ℚ_p).
  - (15) occurs three times.
  - /216 already corrects half of (6).
- **/13 (low): confirmed; the fix is adjusted.** /106's definitional part becomes library. /450 stays planned, with the Mathlib declarations cited in its note.

## What becomes a fix job

Findings /1–/6 and /8–/10 are high or medium, so they will be queued as FIX-RT-PAPER-PAN-26, with the adjustments above. Under §17 only high and medium findings become a fix job. The five low findings are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- **The queue (/1):**
  - let hand-coded designs absorb part-ii routes that carry their roadmap id;
  - point PAN_BRIEF at the extraction;
  - regenerate #3459 without Pan, and keep it unclaimed until then.
- **Grouped Part II designs:** several now carry proposals from more papers than their briefs assume. That is:
  - the PadicHodgeTheory Part II (Fargues–Fontaine, Heuer, Gleason–Lim–Xu, Guo–Reinecke and now Pan, /3);
  - LocallyAnalyticRepresentationsOfLocalGroups (Ding, Dospinescu–Le Bras and now Pan, /2).

No Lean file is a deliverable, and no Lean was run.
