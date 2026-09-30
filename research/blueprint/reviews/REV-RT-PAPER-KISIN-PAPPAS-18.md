# REV-RT-PAPER-KISIN-PAPPAS-18 — verification of the red-team findings on PAPER-KISIN-PAPPAS-18

**Verdict: all eighteen findings are confirmed, at the severities the red team gave: one high, eleven medium and six low.**

Twelve fixes need adjusting; those of /4, /6, /11, /13, /15 and /16 stand as proposed. Each reason in `RT-PAPER-KISIN-PAPPAS-18.review.json` states the corrected fix. Three adjustments change the direction of a fix:
- **/1:** the corrections to Kisin–Pappas–Zhou's items are cited through `relatedExtractionItems`, not cross-paper `prerequisites`.
- **/10:** the new Kottwitz-map items are subject to a frontier condition.
- **/18:** the Iwahori–Hecke centre is owned in SmoothRepresentationsOfLocalGroups, not in the Part II.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4307).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-KISIN-PAPPAS-18 (Claude Code, `cc-f805bf`, #4308);
  - the extraction, PAPER-KISIN-PAPPAS-18 (Codex `codex-c83e7a`, #1460, completed by `cc-fb70e5`);
  - its review, REV-PAPER-KISIN-PAPPAS-18 (`cc-2aeb03`, #1461).

  Nor did it take part in any extraction the findings cite: Kisin–Pappas–Zhou, Kisin–Zhou, Gleason–Lim–Xu, Kisin 2017, Lipnowski–Tsimerman, Venkatesh or Zhu.

**What was checked.**

- **The sources:**
  - Kisin–Pappas, Publ. Math. IHÉS 128 (2018), Numdam PDF (`e2b4a076…618b`, the red team's hash). Page images at 200–300 dpi where an index or formula mattered (pp. 150, 157–162, 183, 184, 188, 197, 204, 205, 212–215).
  - Kisin–Pappas–Zhou, arXiv:2409.03689v3 (`d0834555…d615`): §§1.3.1–1.3.2, 5.1.15–5.1.19, 7.1.11, 7.2.19–7.2.24.
  - Pappas–Zhu, arXiv:1110.5588v4 (`cbb87912…`, as recorded), §9.d.
- **The records:**
  - the extraction, its report and its review;
  - the extractions the findings cite, with their review verdicts per route.
- **The atlas.** Every stage a finding cites, and the reachability each fix depends on, on the atlas `scripts/build.py` assembles.
- **The library audit.** `data/library-coverage.json` (AUDIT-01 for R09.1).
- **Mathlib.** `Module.Grassmannian` at `082e2d3`.
- **Re-derived:**
  - the norm-one torus counterexample of /2;
  - the quaternion example of /6;
  - the GL₂ Iwahori trace check of /11;
  - the G₂ counterexample of /14.

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The high finding and the authors' corrections (/1–/3, /12)

**/1 (high): confirmed.**
- D08 states the printed Lemma 3.1.12, with the condition defined through the printed Lemma 3.1.9. The authors say that version fails. Kisin–Pappas–Zhou Remark 5.1.17(a) reads "[KP18, Lem. 3.1.12] does not hold when c is defined as in the proof of [KP18, Lem. 3.1.9]", and §5.1.19 says it holds with the corrected c. D09 and D18 build on D08.
- All four references to the deleted D07 are where the red team says.
- Adjustments:
  - Do not put another paper's ids in `prerequisites`. No extraction does that, and this file links Kisin–Pappas–Zhou through `relatedExtractionItems`. Link F10, psi-constant-modulo-a and F11 (the corrected lemma itself) from D08 and D18. They are in the same Part II as route 8, so the design coalesces them.
  - Restate psi-constant-mod-a with the corrected definition.
  - Give D09 the standing assumption "𝒢_R versal", which is all its proof uses.

**/2: confirmed.**
- The counterexample holds: X_*(T)_I = ℤ/3, Frobenius acts by −1, and H¹(𝔽_{p²}, ℤ/3) ≠ 0.
- Adjustments:
  - Lang's lemma is not a prerequisite of S08, since the proof of 4.2.12 never uses it.
  - S08 and S09 also need the very-good hypothesis that Kisin–Pappas–Zhou §1.3.1 now requires.

**/3: confirmed; one part of the claim is wrong.**
- Kisin–Pappas–Zhou Proposition 7.2.19(4) gives a very good embedding for every abelian-type datum, not only non-exceptional ones. (NE) matters only for the connected torsor, which Corollary 7.2.24 (the introduction's 1.1.3) supplies.
- Adjustments:
  - S38 stays as printed.
  - The very-good requirement or the corrected route goes into S36, S37, S44, S45, S47 and S48, but not S46.
  - The two additions to E3's locator are right.

**/12: confirmed.** Proposition 4.3.7's level-change input has no item. The red team's remark about étale surjectivity describes an omitted step, not an error. The new item states finite étale and surjective maps, is missing on route 9, and adds S14's small-level torsor step as a prerequisite.

## Items, the graph and the foundations (/4–/8)

- **/4: confirmed; the fix stands.** Theorem 0.4 has no item, and nothing reaches Remark 4.2.14. (N14 does reach M08, through S45.)
- **/5: confirmed; medium is at the low end.** None of the 105 added items is wired in, but each locator names the proof that uses it. Adjustment: merge the Haines–Rapoport duplicate into G01, but keep the torus clause of kottwitz-kernel-and-parahoric-membership.
- **/6: confirmed; the fix stands.** The quaternion example has dim V = 4 against a printed V_L of dimension 2.
- **/7: confirmed.** Route 7 is the right owner; Scholze–Weinstein (2020) routes its local models to the same Part II. The new lattice-chain items should cite RG2.2/RG2.3 for GL lattice chains.
- **/8: confirmed.** The Grassmannians are used in §§2.3 and 3, not §4.1. X_μ need not go to the maintainer: ShimuraData D3 plans the descended flag variety, and Scholze (2015) item 55 plans its flag variety at T2, D3 and R09.1.

## Owners (/9, /10, /18)

- **/9: confirmed.** GS.1 plans neither the affine Grassmannian over a characteristic-0 field nor the twisted affine flag varieties, and no stage does. Additions:
  - route 7's brief, which says to import GS.1, must be corrected;
  - a shared owner of the algebraic affine Grassmannian would have to sit upstream of GS.1, ET.2b and the Part II, a question for the maintainer;
  - Kisin–Pappas–Zhou's P05 repeats the claim.
- **/10: confirmed, with a frontier condition.** BG1 is downstream of RG2.0, RG2.0a, RG2.1 and RG2.5 on the assembled atlas, so the route-1 items that would use the new BG1 items must sit in RG2.2–RG2.4, naturally RG2.3. Placed earlier they would close a cycle. Kisin–Zhou's R14 is a further claim on Lang's theorem.
- **/18: confirmed; the recommendation is reversed.** Venkatesh's items 30, 31 and 67, on the same accepted SR route, build on its Iwahori–Hecke centre. So SmoothRepresentationsOfLocalGroups should own it, and the Part II imports it.

## The trace formula and the low findings (/11, /13–/17)

- **/11 (medium): confirmed; the fix stands.** Pappas–Zhu fix the geometric Frobenius. At the crossing point of the GL₂ Iwahori model the semisimple trace is 1 − q, which matches q^{1/2}z_μ; the arithmetic Frobenius gives 1 − q⁻¹. For the fixer: Pappas–Zhu §9.d.3 prints A_μ with the arithmetic sign of the exponent.
- **/13: confirmed.**
- **/14: confirmed.** One addition: E17's own reason also claims cd_p = 3, which Hu (2013) does not give.
- **/15: confirmed.**
- **/16: confirmed.** O_{F,(p)} is right.
- **/17: confirmed.** Two adjustments: the p. 184 slip is in §4.2.1, and the Lemma 1.3.3 slip can extend E52.

## What becomes a fix job

The twelve high and medium findings (/1–/12) will be queued as FIX-RT-PAPER-KISIN-PAPPAS-18, with the adjustments above. Under §17 only high and medium findings become a fix job; the six low findings are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- the owner of the algebraic affine Grassmannian (/9);
- the owner of κ_G, BG1 or upstream (/10);
- the owner of Lang's theorem, RG2.3 or ET.0 (/10);
- the correction of Kisin–Pappas–Zhou's P05 (/9).

No Lean file is a deliverable, and no Lean was run.
