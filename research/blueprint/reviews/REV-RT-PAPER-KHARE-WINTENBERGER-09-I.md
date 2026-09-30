# REV-RT-PAPER-KHARE-WINTENBERGER-09-I — verification of the red-team findings on PAPER-KHARE-WINTENBERGER-09-I

**Verdict: all eight findings are confirmed, at the severities the red team gave: four medium and four low.**

Six fixes need adjusting. The fixes of /2 and /7 stand. Each reason in `RT-PAPER-KHARE-WINTENBERGER-09-I.review.json` states the corrected fix. Three adjustments change a status or an owner:
- **/1:** Theorem 10.1(ii) moves to ML.1 with the same status as its corollary /65. It is planned only if /7 is applied too.
- **/3:** /33 stays missing and goes by a new source route to LocalGaloisDeformationRings R08.6. At R24.3 it is only an unproved hypothesis note, so it cannot count as planned there.
- **/4:** the qualitative-to-refined item is owned at R27.6, not R20.5–R20.6. Every R20 stage is upstream of R27.4, which supplies the dyadic scalar case.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4599).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-KHARE-WINTENBERGER-09-I (Claude Code, `cc-f805bf`, #4744);
  - the extraction (`cc-48533a`, #4553);
  - its review (`cc-fb70e5`, #4558).

  Nor did it take part in any extraction the findings cite: Khare–Wintenberger II, Calegari–Geraghty (2020) or Boxer–Calegari–Gee–Pilloni.

**What was checked.**

- **The source.** Khare–Wintenberger, Serre's modularity conjecture (I), the authors' copy (`3c389dc3…ad82`, the recorded hash), read in a text extraction. Its PDF pages equal its printed pages.
- **The records.**
  - The extraction, its report and its review.
  - The items the findings compare: PAPER-KHARE-WINTENBERGER-09-II/110, PAPER-CALEGARI-GERAGHTY-20/ext-artin-conjecture-odd-2dim and PAPER-BOXER-CALEGARI-GEE-PILLONI-21/200.
- **The packet nodes each finding turns on:**
  - R27.4/strong-form-by-minimal-lifts and R27.6/scope-of-the-final-statement-and-the-compatible-system-export;
  - R24.3/required-lift-types and R24.3/kw-annals-minimal-lifts;
  - R08.6/kw-local-conditions and R08.6/export-away-from-p;
  - R24.6/residual-members, R15.4/dyadic-weight-two-or-four and R27.1/dickson-and-the-dyadic-solvable-refinement;
  - R22.6/hypothesis-h and R22.5/kisin-potentially-bt-lifting.
- **The atlas.** Every stage a finding cites: R20.3, R20.5, R20.6, R27.4, R27.6, R15.4, R17.5, R17.6 and ML.1. Reachability was checked on the atlas `scripts/build.py` assembles, including every R20 → R27 pair.
- **Re-derived:**
  - the Serre-weight example of /2: 1 ⊕ χ̄_p has weight 2, and its twist by χ̄_p has weight p + 3;
  - the p ∤ q − 1 remark of /3, in the unipotent case too;
  - the dyadic weight argument of /5;
  - the reason (H) follows from Theorem 4.1(2)(ii) for odd p (/8).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The routing (/1, /3, /7)

**/1: confirmed; the fix is adjusted.**
- /56 is planned at R27.6, but it needs /59, which is routed to ML.1. Meanwhile route 3 has ML.1 import Theorem 10.1 from R27.6. The cycle is in the recorded plan; no atlas edge joins the two stages yet.
- The R27.6 node's proof steps stop before the descent to one weight-one form.
- Adjustments:
  - /56 takes the same status as /65.
  - Remove /56 from route 1.
  - Route 3 imports the strong Serre theorem rather than "Theorem 10.1", together with residual irreducibility (R24.6), Sen–Fontaine (R06.2) and the R20.3 weight-one nodes.
  - The R27.6 node is in a packet file that /2 names, so the fix job can restrict it to part (i).

**/3: confirmed; the fix is adjusted.**
- The owner of the minimal-lift definition is R08.6, as KW II /110 and R24.3's own proof step say. R24.3/kw-annals-minimal-lifts is a different theorem.
- The /33 remark predates the extraction in the R24.3 packet, but only as a hypothesis note. So /33 stays missing and goes to R08.6 by a source route: an extraction cannot file requests.

**/7 (low): confirmed; the fix stands.** Calegari–Geraghty and Boxer–Calegari–Gee–Pilloni read ML.1 as planning weight-one modularity over ℚ. The KW I review was split on the point rather than silent. Because /7 is coupled to /1, the fixer of /1 should apply it.

## The statements (/2, /4, /5, /6, /8)

- **/2: confirmed; the fix stands.**
  - Theorems 4.1(2)(i) and 5.1 need 2 ≤ k(ρ̄) ≤ p + 1 for odd p, whereas Serre's weight reaches p² − 1.
  - So E3's correction proves Theorem 1.2(1) only after a twist. Returning to ρ̄ at weight exactly k(ρ̄) needs R20.3, the Edixhoven weight theorem with its twisting rule.
  - The R27.4 node concludes only "after the twist", so /8's note overstates it.
- **/4: confirmed; the fix is adjusted.**
  - No item states the strong form for every ρ̄, although §10.1 applies it in every residue characteristic. Nor does any item state the qualitative-to-refined implication.
  - Both are planned, but the implication needs Theorem 1.2(2) (R27.4) for the dyadic scalar case, so it is owned at R27.6.
- **/5 (low): confirmed.** The ℓ = 2 case is already planned by composition, through R07.4 and R15.4/dyadic-weight-two-or-four, so no request is needed.
- **/6 (low): confirmed.** R20.5 is not p = 2 only; its general weak-to-strong list is the odd-p supplier. Add R17.5 for the dihedral modularity.
- **/8 (low): confirmed, with one locator corrected.**
  - The "2-adic" description is in the report, not the result.json summary.
  - For odd p, cite /21 (Theorem 4.1(2)(ii)) rather than the R22.5 node alone, whose hypothesis is stronger than (H)'s.

## What becomes a fix job

Findings /1–/4 are medium, so they will be queued as FIX-RT-PAPER-KHARE-WINTENBERGER-09-I, with the adjustments above. Under §17 only high and medium findings become a fix job. The four low findings, /5–/8, are confirmed here, with their fixes, for whoever next edits the extraction. /7 should be applied with /1.

For the maintainer:
- R27.1/dickson-and-the-dyadic-solvable-refinement needs a proof step and prerequisites for Lemma 6.2(i): R17.5 and R20.5 for p > 2, and R17.6 and R20.5 for p = 2 (/6).
- R27.2/theorem-3-2-weight-reduction uses k(ρ̄₂) = 2, but lists neither R24.6/residual-members nor R07.4 nor R15.4 among its prerequisites (/5).
- The ClassicalSerreModularity packet's E9 carries the same incomplete correction as E3. The fix job may amend it, since /2 names that file (/2).

No Lean file is a deliverable, and no Lean was run.
