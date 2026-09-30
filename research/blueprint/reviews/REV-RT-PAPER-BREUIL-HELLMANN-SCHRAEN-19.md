# REV-RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19 — verification of the red-team findings on PAPER-BREUIL-HELLMANN-SCHRAEN-19

**Verdict: all twenty findings are confirmed, at the severities the red team gave: four high, seven medium and nine low.**

Thirteen fixes need adjusting. The fixes of /4, /6, /10, /11, /15, /18 and /20 stand. Each reason in `RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19.review.json` states the corrected fix.

Two adjustments recur:
- **New routes join accepted proposals.** Where the mathematics already has a proposed owner, the new route reuses that proposal's roadmap id, title and area, so that the design jobs merge:
  - category O goes with Boxer–Calegari–Gee–Pilloni (2025) route 3, a Part II of LieHighestWeight (/1);
  - B_dR-representations and B-pairs go with Fargues–Fontaine route 5 (/3);
  - Orlik–Strauch and Emerton go with Ding (2025) route 1 (/8).
- **What the fix job cannot do.** A fix job may edit only the files its findings name (`make_queue.finding_files`), which here means the BHS files alone. So packet requests, and the matching corrections to Ding (2025), become notes for the maintainer.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4303).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19 (Claude Code, `cc-f805bf`, #4759);
  - the extraction (`cc-fb70e5`, #2022);
  - its review (`cc-d67081`, #2464).

  Nor did it take part in any extraction the findings cite: Ding (2025), Fargues–Fontaine, Böckle–Iyengar–Paškūnas, Pan, Newton–Thorne, Dospinescu–Le Bras or Boxer–Calegari–Gee–Pilloni (2025).

**What was checked.**

- **The sources.**
  - Breuil–Hellmann–Schraen, Publ. Math. IHÉS 130 (2019) 299–412, the Numdam PDF (`34ffd697…967a`, the recorded hash). Printed page = PDF page + 298.
  - arXiv:1702.02192v1 (`4c967337…f961`).
  - Page images for pp. 371 and 405.
- **The records.**
  - The extraction and its review.
  - The routes and items of the extractions named above, and `queue.json` for the pending design jobs.
- **The atlas.** Every stage and packet node a finding cites, with ancestor sets on the atlas `scripts/build.py` assembles.
- **Libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`, at each cited declaration.
- **Re-derived:**
  - the codimension count of /4 from the paper's own dimensions, including the case n = 1, [K:ℚ_p] = 2;
  - the counterexample of /10, and the local dimension equality that every use of Lemma 2.3.2 in the paper satisfies;
  - the τ-dependent jumps that break E8's correction (/11).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The four high findings

**/1: confirmed; the fix is adjusted.**
- No atlas stage plans category O, Kazhdan–Lusztig polynomials, the Kazhdan–Lusztig theorem or D-modules. Tau Ceti LieHighestWeight excludes category O in so many words.
- Boxer–Calegari–Gee–Pilloni (2025) already propose algebraic category O as a Part II of LieHighestWeight, but without Kazhdan–Lusztig theory. The new items join that route.
- Beilinson–Bernstein and characteristic cycles are already items. Only the D-module foundations are unowned, and they stay with route 1.
- The Verma part is not "library": Tau Ceti's Verma module assumes a Killing-semisimple L and does not prove M(λ) ≠ 0.

**/2: confirmed; the fix stands, with two additions.**
- R08.3 is Kisin's potentially semistable rings, and no PhiGamma stage is upstream of it. The extraction contradicts itself three ways about where X_tri lives.
- The X_r part of the groupoid item rests on Kisin's characteristic-zero-point lemma, which no node states.
- Route 2's brief should also name the owner of the character space.

**/3: confirmed; the fix is adjusted.**
- P7's 59 nodes plan none of Fontaine's almost de Rham theory or Berger's functors.
- Only the red team's first option works, a part-ii route keyed like Fargues–Fontaine route 5. The second would give B_dR-representations two owners.
- P7/sen-module supplies the Sen weights.

**/4: confirmed; the fix stands.**
- From the paper's own dimensions (pp. 365, 377, 379, 382), the character fibre has codimension [K:ℚ_p]·n(n+1)/2 + n, not [K:ℚ_p]·n(n+3)/2. The fibre of wt on Tⁿ has dimension n, not n[K:ℚ_p].
- At n = 1, [K:ℚ_p] = 2 the printed codimension is 4 in a ring of dimension 3.
- Theorem 1.9, Conjecture 4.3.4, Remark 4.3.5 and (4.11)–(4.12) are affected; §5 is not.
- Three items state the number, and 4.3.7 and 4.3.8 inherit it.

## Owners and duplication (/5–/9, /15–/17)

- **/5: confirmed; the fix is adjusted.** Completed cohomology belongs to CompletedCohomologyPartII. The item splits three ways:
  - the Banach object, at CC.2, CC.5 and CC.8;
  - Emerton's locally analytic vectors, which nothing plans;
  - R_{ρ̄,S}, at GlobalGaloisDeformations G7.
- **/6: confirmed; the fix stands.** R31.5 is GL₂/ℚ patching. Böckle–Iyengar–Paškūnas record the CEGGPS module as missing, in the same design.
- **/7: confirmed; the fix is adjusted.**
  - AG2.3 plans definite-unitary eigenvarieties.
  - But the Part II needs Emerton's construction anyway, for the patched eigenvariety. So it keeps that construction and compares with AG2.3.
- **/8: confirmed; the fix is adjusted.**
  - Key the route exactly like Ding (2025) route 1. Lemmas 5.2.1–5.2.6 are general.
  - The duplication arose 40 minutes after the extraction was merged.
- **/9: confirmed; the fix is adjusted.**
  - ReductiveGroups Layer 3 plans the quotient G/H.
  - The flag variety and its orbit geometry fit a Part II of ReductiveGroups. Route 1 is acceptable.
  - The library declarations are note citations only.
- **/15 (low): confirmed; the fix stands.**
- **/16 (low): confirmed; the fix is adjusted.** Split the route-7 items. The t-inverted theory is unplanned, and route 2's brief already builds the overlapping cohomology.
- **/17 (low): confirmed as a referral.** Böckle–Iyengar–Paškūnas' patching is not unrelated; Pan's Part II is the different member.

## Mistakes in the paper (/10, /11, /13, /18, /19)

- **/10: confirmed; the fix stands.**
  - Lemma 2.3.2 is false as printed.
  - Its proof needs the local dimension equality, which holds when Y is equidimensional of finite type over a field and Z is irreducible. Every use in the paper (pp. 316, 317, 408) satisfies it.
- **/11: confirmed; the fix stands.**
  - E8's correction ("free over A⊗K") excludes non-parallel weights, which the paper handles throughout.
  - The register already lists that correction as confirmed.
  - The right condition is finite projective over A⊗K.
- **/13 (low): confirmed; the fix is adjusted.**
  - Re-record E1 as the arXiv v1 omission of ᵖ√1 ∉ F, corrected in print by Remark 1.1.
  - Keep the [19]/[20] cautions in their prerequisites entries.
  - Add top-level `sourceVersions`.
  - E2 and E3 are misprints.
- **/18 (low): confirmed.** Two real proof gaps with short repairs; the paper itself uses the G_m-limit argument in Lemma 2.3.1.
- **/19 (low): confirmed.** The p. 405 slip is confirmed on a page image. The [20] admissions are partly recorded already, merged into one.

## Records (/12, /14, /20)

- **/12 (low): confirmed.** The declarations exist, but none states its item in full, so they are citations in notes.
- **/14 (low): confirmed.**
  - The five E-numbers and the extractor attribution are wrong.
  - "Seven (E5–E11)" is right as a count of entries.
  - The review's real co-proposer slip concerns SpringerResolutionAndCharacteristicCycles, which BHS alone propose.
- **/20 (low): confirmed; all six stand**, (2) on the p. 371 image.

## What becomes a fix job

Findings /1–/11 are high or medium, so they will be queued as FIX-RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19, with the adjustments above. Under §17 only high and medium findings become a fix job. The nine low findings, /12–/20, are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- **Ding (2025):**
  - its route 1 brief also assumes that Tau Ceti plans category O (/1);
  - 4.1-xtri is planned at R08.3 (/2);
  - 2.1-bpairs and 2.2-fontaine-bdr are planned at P7 (/3);
  - 4.2-eigenvariety-U's status contradicts its note (/7).
- **Scope of the §5 Part II:** whether it should become its own roadmap, decided together for Ding's and Newton–Thorne's identical proposals (/17).
- **Errata for [19] and [20]:** they need records of the corrections in Remark 1.1 and on pp. 407–408, if those papers are processed (/13, /19).
- **PhiGamma packet:** the t-inverted theory, if it goes to PG rather than route 2 (/16).
- **Review verdict for E1:** a re-recorded E1 needs a fresh one. `scripts/errata.py` counts only a review that follows a job which wrote the file, and fix jobs have no review.

No Lean file is a deliverable, and no Lean was run.
