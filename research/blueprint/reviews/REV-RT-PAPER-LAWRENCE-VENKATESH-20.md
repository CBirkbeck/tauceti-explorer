# REV-RT-PAPER-LAWRENCE-VENKATESH-20 — verification of the red-team findings on PAPER-LAWRENCE-VENKATESH-20

**Verdict: all twelve findings are confirmed, at the severities the red team gave: two high, three medium and seven low.**

Seven fixes need adjusting. The fixes of /2, /7, /8, /9 and /12 stand, /2 with a note for the maintainer. Each reason in `RT-PAPER-LAWRENCE-VENKATESH-20.review.json` states the corrected fix. Three adjustments change an owner or a count:
- **/1:** the general §3 period-map material goes by a source route to LV.2–LV.4, not to the Part II. Betts–Stix route 4 already sends the general v-adic transport to LV.3, and LV.2–LV.4 are upstream of the Part II.
- **/3:** four of the six items are defective (two false, two vacuous). /lemma-2-3 and /prop-5-3 are true and need only notes.
- **/4:** Lemma 2.6 and G-irreducibility go to LV.1 on route 2. The finding names the Betts–Stix file, so the fix job can add the cross-reference there itself.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4531).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-LAWRENCE-VENKATESH-20 (Claude Code, `cc-f805bf`, #4763);
  - the extraction (`cc-39fac3`, #4043);
  - its review (`cc-fb70e5`, #4471).

  Nor did it take part in any extraction the findings cite: Betts–Stix, Lawrence–Sawin, Mok–Pila–Tsimerman, Bakker–Klingler–Tsimerman or Deligne (1980).

**What was checked.**

- **The sources.**
  - arXiv:1807.02721v3 (`e3013516…c6b9b`).
  - The published Invent. Math. 221 (2020) text as posted by BIMSA (`588e450a…db43bd`); printed page = PDF page + 892.
  - Both match the recorded hashes.
- **The records.**
  - The extraction and its review.
  - The MordellLawrenceVenkatesh roadmap, packet and errata file.
  - The items and routes of the extractions named above.
- **The atlas.** Every stage, packet node and decomposition node a finding cites.
- **Libraries.** Mathlib `082e2d3`: `NumberField.finite_of_discr_bdd`, `Module.Grassmannian` and `Ideal.iInf_pow_eq_bot_of_isDomain`.
- **Re-derived:**
  - the Lemma 2.8 counterexample at a uniformizer;
  - Z(φ) ⊆ Z(φ^ss) for Lemma 10.5;
  - the ℓ^d scaling in Lemma 10.4;
  - the permutation-representation obstruction in Lemma 2.10.

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The two high findings

**/1: confirmed; the fix is adjusted.**
- The six §3 items are general, while LV.2–LV.4 plan only H¹ of abelian-by-finite families. So route 1's brief imports period maps that nothing builds.
- Some of the red team's "nothing plans" claims overstate:
  - several LV.2–LV.3 nodes are general;
  - C5 plans the complex Gauss–Manin side;
  - R09.1 plans flag schemes;
  - the general crystalline comparison is CP.2 with R06.2, not R06.5.
- Split each item. The general case goes to LV.2–LV.4, beside Betts–Stix route 4. H is planned at R09.1, and H* is a new missing item.

**/2: confirmed; the fix stands for the extraction.**
- LD.6 treats Ax–Schanuel as an outside input, and the LD Part II covers only Shimura varieties.
- Lawrence–Sawin route 3 sends the Bakker–Tsimerman corollary to LD.6. If the theorem moves alone, that corollary would sit upstream of the theorem it needs, so Lawrence–Sawin /44 and /76 must follow (maintainer).

## Medium findings (/3–/5)

- **/3: confirmed; the fix is adjusted.**
  - /lemma-2-8 is false at a uniformizer, and /lemmas-8-2-8-3 fails for a curve bounding a disk.
  - /lemma-2-12 and /lemma-6-3 are vacuous.
  - The errata predate the extraction. The review's gap sentence is true of the packet nodes, not of these items.
- **/4: confirmed; the fix is adjusted.**
  - LV.1 is the owner, since Betts–Stix's GSp lemma sits there.
  - Cite Lawrence–Sawin /41 as a corrected argument for E28, and add Richardson.
  - Lawrence–Sawin's disconnected form may stay in the Part II only as an extension of LV.1's statement.
- **/5: confirmed; the fix is adjusted.**
  - Load-bearing imports have no items.
  - The trace formula is already planned at WC.2.
  - Krull's theorem is in Mathlib.
  - The fibre-functor comparison and smooth proper base change need owners named.

## Low findings (/6–/12)

- **/6: confirmed; the fix is adjusted.**
  - Hermite–Minkowski is planned at R28.1.
  - The Grassmannian item splits: the functor is library, the schemes are at R09.1, and LGr is at LV.3.
- **/7, /9, /12: confirmed; the fixes stand.**
- **/8: confirmed; the fix stands.** The overlap with LP2 runs both ways, and the general Bate–Martin–Röhrle form is Lawrence–Sawin /37.
- **/10: confirmed.**
  - (a) is substantive: in the orthogonal case, reflections have determinant −1.
  - The finiteness addendum is in Theorem 10.1 itself.
  - (b) follows the abstract's wording.
- **/11: confirmed.** All seven are real. (vi) is "gap, the proof", matching E7, and can be repaired by Dwork's trick as well as by putting 2 in S.

## What becomes a fix job

Findings /1–/5 are high or medium, so they will be queued as FIX-RT-PAPER-LAWRENCE-VENKATESH-20, with the adjustments above. Under §17 only high and medium findings become a fix job. The seven low findings are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- **Lawrence–Sawin:**
  - /44 and /76 should follow Bakker–Tsimerman to its new owner (/2);
  - /37, /41 and /70 should be reconciled with LV.1 (/4).
- **Betts–Stix route 4:** keep it at LV.3 as the owner of the general v-adic period map, or move it with LV's general §3 items (/1).
- **G-complete reducibility:** one owner upstream of LV.1 and LP2, or LV.1 with LP2 citing it (/8).
- **Ax–Schanuel:** one owner for the Shimura and VHS theorems (/2).

No Lean file is a deliverable, and no Lean was run.
