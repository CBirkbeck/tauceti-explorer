# REV-RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 — verification of the red-team findings on PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19

**Verdict: all nine findings are confirmed, at the severities the red team gave: six medium and three low.**

Seven fixes need adjusting. The fixes of /6 and /8 stand, with one addition to /8's locator. Each reason in `RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.review.json` states the corrected fix. Three adjustments change where the mathematics goes:
- **/1:** the height items cannot be marked planned, because the Part II they belong to has no layers yet. They stay missing and move to it by a part-ii route, and /25 and /30 move with them.
- **/3:** only (40), the formal iterated integrals on a residue disk, stays planned at ColemanIntegration L1. Transport (41) moves to route 2, together with Besser's theorem.
- **/5:** Tuitman's algorithm goes to RD.7, beside the planned Kedlaya node, not to ED.6.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4323).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 (Claude Code, `cc-f805bf`, #4742);
  - the extraction (`cc-442dc5`, #2202);
  - its review (`cc-7b31c4`, #2328).

  Nor did it take part in any extraction the findings cite: Disegni–Liu, Disegni, Gross–Zagier, Kolyvagin, Skinner, Caraiani–Newton or Betts–Stix.

**What was checked.**

- **The sources.**
  - Balakrishnan–Dogra–Müller–Tuitman–Vonk, Annals 189 (2019) 885–944, the Annals PDF (`e1aa5f96…ff1f8`, the recorded hash). Read in a text extraction with page markers.
  - arXiv v1 (`77c57b03…c917`), at Theorem 1.2, §5.1, Definitions A.1–A.2 and the references.
  - Crossref, for the printed [Nek93] DOI, Nekovář's chapter and Agashe–Stein.
- **The records.**
  - The extraction, its report and its review.
  - PAPER-DISEGNI-LIU-24, PAPER-DISEGNI-22, PAPER-GROSS-ZAGIER-86, PAPER-KOLYVAGIN-90, PAPER-SKINNER-20 and PAPER-CARAIANI-NEWTON-23, with their reviews.
  - `queue.json` and `research/errata/REGISTER.md`.
  - The ColemanIntegration and PadicDifferentialEquationsAndRigidCohomology packets.
- **The atlas.** Every stage a finding cites, with reachability on the atlas `scripts/build.py` assembles:
  - NC.2, NC.5 and ColemanIntegration L0–L3;
  - Tau Ceti ModularCurves layers 9 and 10, and ModularCurvesPartII R13.2, R13.4a and R13.5;
  - GZ.8, HE.7 and BSD.3;
  - ED.0, ED.2, ED.6, CN.3, CN.4, RD.4 and RD.7.
- **Scripts.** `check_errata.versions_checked` on the target (read-only), and `check_paper.py`.
- **Re-derived:**
  - the counterexample to Definition A.2 (/6);
  - the conjugation giving X_0^+(ℓ²) ≅ X_s(ℓ) (/2);
  - genus 0 for X_0^+(ℓ²) at ℓ ≤ 7, including the four fixed points of w_49 (/7).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## Nekovář's heights (/1)

**/1: confirmed; the fix is adjusted.** Two records plan the general pairing, and each assumes the other owns it:
- this extraction's route 1 (NC.5), for /24–/27, /30 and /31;
- PAPER-DISEGNI-LIU-24's accepted route 2, the Part II SelmerComplexesAndPadicHeights.

NC.5 plans only the height equations and bad-place terms.

Corrections to the claim:
- The Part II was proposed on 22 September, the day before this extraction; only its acceptance came later.
- PAPER-DISEGNI-22's reuse of the route was rejected.
- The Part II's brief plans the pairing only under the Panchishkin condition (V3). /24 needs it for an arbitrary splitting of the Hodge filtration.

Adjusted fix:
- The items stay missing: the Part II has no layers, and its design (#3430) is pending.
- They move to a part-ii route keyed exactly like DISEGNI-LIU-24's route 2, so that they join the design.
- /25 and /30 move too. /26, /27 and /31 are stated on their categories, so leaving them behind would make the Part II depend on NC.5.
- The brief asks for the general-splitting form, names NC.5 as a consumer and forbids importing it. No cycle results.

## Modular curves (/2, /7)

**/2: confirmed; the fix is adjusted.**
- Layer 10 is restricted to prime-level diamond quotients. Layer 9 plans only affine quotients, and its regularity results stop at the diagonal Cartan.
- So X_s(ℓ), X_ns(ℓ), their cusps and the moduli meaning of their rational points are unplanned. The accepted Caraiani–Newton review reads the layers the same way.
- /71 concerns generic fibres, so R13.5 (bad fibres) is the wrong owner.

Adjustments:
- X_0(ℓ²) is already at R13.4a, as refined Γ₀ level.
- /1 and /71 go to R13.4a in general form: X_H for −I ∈ H with surjective determinant, w_{ℓ²}, X_0^+(ℓ²), /71, and the point criterion for j ∉ {0, 1728}.
- R13.4a is algebraic and R14.1 is downstream of it. So w_{ℓ²} and /71 are built from the moduli interpretation; the paper's conjugation is the analytic form, which belongs at R13.4b.

**/7 (low): confirmed.**
- The paper never argues that 2, 3, 5 and 7 occur; arXiv v1 states it ("if and only if ℓ ≤ 7").
- X_0(ℓ²) has genus 0 for ℓ ≤ 5. X_0^+(49) has genus 0 because w_49 has h(−196) = 4 fixed points. The rational cusp then gives X_s(ℓ) ≅ P¹_Q.
- No twist is needed, since −I ∈ C_s(ℓ)^+.
- The new item consumes /2's reworked /1 and /71, so the fixer of /2 is best placed to add it.

## Besser, Gross–Zagier and Tuitman (/3–/5)

**/3: confirmed; the fix is adjusted.**
- L1 builds Coleman integration directly, and its packet sets aside Besser's Tannakian argument. Nothing plans the Frobenius-invariant path in the de Rham path torsor.
- Besser's theorem is needed for Lemma 5.7, whose (49) changes residue disk, and so for §6.6. It is not needed for the §5.3.2 splitting: there the Teichmüller points lie in the same disks as b and x.
- (41) rests on the missing /42 and /56, so it joins route 2 with the new Besser item.

**/4: confirmed; the fix is adjusted.**
- Gross–Zagier's own extraction records the A_f rank bound as missing (/304). BSD.3 assembles it for elliptic curves only, and PAPER-SKINNER-20/2's review says no stage assembles it for A_f.
- Split /79: (a) the lower bound is missing and routed to GZ.8 beside /304; (b) HE.7's conditional form, from a non-torsion Heegner point, is planned.

**/5: confirmed; the fix is adjusted.**
- The paper relies on Tuitman's algorithm on pp.894, 924 and 930–933, and no item states it.
- The rigid-cohomology packet already plans the hyperelliptic case at RD.7 (Kedlaya), with lifts at RD.0 and H¹ at RD.4. So the new item goes to RD.7, and ED.6 consumes it; no cycle results.
- Remark 6.1 is not a hypothesis of the algorithm.
- The [BT17] and [AS05] citations are already there.

## The appendix and the records (/6, /8, /9)

- **/6: confirmed; the fix stands.** Definition A.2 omits uniqueness, which makes its "unique up to unique isomorphism" false: A_n ⊕ 1 with (1, 0) satisfies the printed property. Theorem 4.2 and the proofs of Lemmas 5.2 and A.4 use the intended definition. E9 is new.
- **/8: confirmed.**
  - Definition A.1 fails for the zero object. E10's locator should also name arXiv v1, p.34.
  - The printed [Nek93] DOI belongs to a 2006 Mathematical Programming paper, and [BL04] prints "Barieties". Both are in the published text only.
  - The proof of Corollary 6.7 does not reach the claim of good reduction outside 13. The paper's first plane model does, on p.930.
- **/9: confirmed.**
  - `sourceVersions` is missing, although E5 quotes a stated result. The requirement postdates the extraction by a day.
  - E1–E8 have no review blocks, and the register lists the seven new ones as awaiting review.
  - The numerics gap should name CN.4, since ED.0 is exact arithmetic only.

## What becomes a fix job

Findings /1–/6 are medium, so they will be queued as FIX-RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19, with the adjustments above. Under §17 only high and medium findings become a fix job. The three low findings, /7–/9, are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- the owner of the A_f rank assembly: GZ.8 or a RankZeroOneBSD stage. PAPER-SKINNER-20/2 needs the same decision (/4).
- the design of the SelmerIwasawaCohomology Part II (#3430): it must plan the pairing for a general splitting, not only under (V3) (/1).
- once R13.4a has X_H, the pending EllipticCurveModularityImaginaryQuadratic design should import it rather than build Cartan-level curves itself (/2).
- source issues added by a fix job: E9–E12 will count as awaiting review. `scripts/errata.py` counts a verdict only from a review that follows a job which wrote the file, and fix jobs have no review.

No Lean file is a deliverable, and no Lean was run.
