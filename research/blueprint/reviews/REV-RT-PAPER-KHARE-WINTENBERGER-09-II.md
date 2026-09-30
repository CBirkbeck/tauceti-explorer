# REV-RT-PAPER-KHARE-WINTENBERGER-09-II — verification of the red-team findings on PAPER-KHARE-WINTENBERGER-09-II

**Verdict: all sixteen findings are confirmed, at the severities the red team gave: ten medium and six low.**

Twelve fixes need adjusting. The fixes of /5, /10, /11 and /16 stand. Each reason in `RT-PAPER-KHARE-WINTENBERGER-09-II.review.json` states the corrected fix.

Two adjustments recur:
- **Requests.** Several fixes ask for `requests` entries in other roadmaps' packets. A fix job may edit only the files its findings name (`make_queue.finding_files`), which here means only the extraction. So those requests become notes for the maintainer, listed below.
- **Status.** PROTOCOL §16 decides status by whether a layer plans the item. Where the layer text plans an item and only a node is deficient, the item stays planned and its note is corrected. This applies to /3 (R04.3 plans KW II §4 for all p), /6 (the R08.6 node states k = p and p = 2), /7 for /291 and /310, and /4, which keeps the status of the parallel item /193.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4601).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-KHARE-WINTENBERGER-09-II (Claude Code, `cc-f805bf`, #4746);
  - the extraction (`cc-48533a`, #4560);
  - its review (`cc-fb70e5`, #4562).

  Nor did it take part in any extraction the findings cite: Boxer–Calegari–Gee et al. (2025), Boxer–Calegari–Gee–Pilloni, Allen et al. (2023), Harpaz–Wittenberg or Böckle–Iyengar–Paškūnas.

**What was checked.**

- **The sources.**
  - Khare–Wintenberger, Serre's modularity conjecture (II), the authors' copy (`53f45f8b…6ed4`, the recorded hash). Its PDF pages equal its printed pages.
  - Kisin, Moduli of finite flat group schemes, and modularity, Annals 170 (2009), the Annals PDF (`076f8bb6…4ee7`), at §3.1 for /8.
- **The records.**
  - The extraction and its review.
  - The items the findings compare, in the five extractions named above.
  - The packet nodes each finding turns on, in the GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, AutomorphicGaloisRepresentations and AlgebraicModularFormsAndSerreWeights packets.
- **The atlas.** Every stage a finding cites, with reachability on the atlas `scripts/build.py` assembles.
- **Libraries.**
  - Tau Ceti `f790474`: `kummerMap` and `ker_kummerMap`.
  - Mathlib `082e2d3`: `Polynomial.isRegularRing_of_isRegularRing` and the regular-local-ring files.
- **Re-derived:**
  - the trivial type at k(ρ̄_p) = 2, and why the two rings differ (/5);
  - the case analysis of Theorem 9.7 against KW I Theorem 4.1 (/9);
  - the sign conditions of E8 at p = 2 (/14).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## Routing (/1, /2, /11, /12)

**/1: confirmed; the fix is adjusted.**
- Theorems 8.2 and 8.4, at R20.6, need Lemma 7.10, ψ and Kisin's level raising, which route 10 sends downstream to R22.1 and R22.4. That contradicts the atlas edge from R20.6 to R22.1.
- Khare's Lemma 2.2, at R23.3, closes a planned cycle through the R23.3 node's import of Theorem 8.2. Its p. 73 use lies only in the part of Theorem 8.2 that the paper does not use.
- Adjustments:
  - /273 moves to R20.6.
  - /254 moves to R20.6 or R04.6.
  - /209 joins Taylor's neatness lemma at R18.3.
  - /252 follows /2's owner.
  - Route 10 is dropped.

**/2: confirmed; the fix is adjusted.**
- Grunwald–Wang is routed to IG.4 here, but to R02.2/R02.4 by three accepted extractions.
- The split is wider than the claim says: IG.4's own packet and Harpaz–Wittenberg also place it at IG.4.
- In the extraction, move /210 and /252 to R02.2/R02.4. Choosing the single owner is for the maintainer.

**/11 (low): confirmed.** Böckle–Iyengar–Paškūnas route the same Jacobson facts to R03.1/R03.3.

**/12 (low): confirmed; the fix is adjusted.**
- R02.6 fits the p = 2 cohomology vanishing better than R01.4.
- But GlobalGaloisDeformations already requests the statement from R01.4, so the route and that request must move together.

## Statuses and statements (/3–/10, /13)

- **/3: confirmed; the fix is adjusted.**
  - The R04.3 nodes are stated for p > 2 only. Only the R03.2 decomposition node has the all-p form, with δ₂, (Ad⁰)* ≅ Ad/Z and framed infinite places.
  - The layer plans KW II §4 as a whole, so the items stay planned and their notes cite R03.2.
  - Lemma 4.4(2) is owned at R04.3, not at its consumers.
- **/4: confirmed; the fix is adjusted.**
  - The p = 2 local points in Taylor's moduli problem are asserted "as for p ≠ 2", and no node covers them.
  - The new item takes /193's status (planned at R23.2 and H6, with a note), or is missing on a source route to R23.2.
  - [34] is not a 2-adic paper.
- **/5: confirmed; the fix stands.**
  - At k(ρ̄_p) = 2 the weight-two type is trivial and the ring is 𝒪⟦T⟧, not Savitt's.
  - Savitt's theorem, as the R08.4 node states it, needs 3 ≤ k ≤ p.
  - The new source issue affects nothing.
- **/6: confirmed; the fix is adjusted.**
  - The R08.6 node states k = p and p = 2 but proves neither.
  - /91 stays planned, and its note names the inputs: R07.3 on MF′ for k = p, and R07.4 with R08.5 for p = 2.
- **/7: confirmed; the fix is adjusted.**
  - /32 and /60 are missing and go on route 1 (R03.1, R03.3).
  - /291 stays planned at R22.6. The node's step 1 contradicts its own step 3.
  - /310 takes E29's corrected mod-p map, as §18 requires.
  - /83, /85 and /86 take one status with owner R06.4.
- **/8: confirmed; the fix is adjusted.**
  - Kisin's Corollary (3.1.11), p. 1151, needs the level-raising congruence, which /273 omits. The Ihara input is (3.1.8), i.e. Lemma 7.1.
  - The quadratic tower is already in /273.
- **/9: confirmed; the fix is adjusted.**
  - Only /314 needs the split, reusing the extraction's own /316–/319. Theorem 9.7 does give 4.1(1), so /313 is unaffected.
- **/10: confirmed; the fix stands.**
  - The completion half of /34 is planned at ModularCurves 4D, as Böckle–Iyengar–Paškūnas record.
  - The μ_n Kummer isomorphism is planned at ProfiniteCohomology layer 9, with `kummerMap` in Tau Ceti.
  - Mathlib has polynomial ascent of regularity.
- **/13 (low): confirmed.** R15.4 plans the weight over ℚ_p only. KW's convention for F_v ≠ ℚ_p is their own.

## Records (/14–/16)

- **/14 (low): confirmed.**
  - E17's pointer names the wrong entry.
  - E8's correction fails at p = 2.
  - "Self-contradictory" overstates.
- **/15 (low): confirmed.**
  - R19.4's hypotheses contradict each other at p = 2.
  - Only /223 needs the non-compact level; /221 reduces to the maximal compact subgroup.
- **/16 (low): confirmed.**
  - No node proves the variable-determinant case of Proposition 4.1.
  - The Hasse invariant is at R15.3; only the weight-raising step is unplanned.

## What becomes a fix job

Findings /1–/10 are medium, so they will be queued as FIX-RT-PAPER-KHARE-WINTENBERGER-09-II, with the adjustments above. Under §17 only high and medium findings become a fix job. The six low findings, /11–/16, are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer (packet changes the fix job cannot make):
- **Grunwald–Wang:** one owner, with the IG packet, Harpaz–Wittenberg /130 and R04.4/change-of-determinant brought into line (/2). R04.4/change-of-determinant also names the wrong consumer of Lemma 7.10; the consumer is Theorem 8.2 at R20.6 (/1).
- **R04.3:** p = 2 versions of relative-tangent-space, local-to-global-presentation and global-dimension-lower-bound, and a node for Lemma 4.4(2). The packet's "all planned (8 nodes)" overstates p = 2 (/3).
- **R23.2:** residual-characteristic-2 versions of Taylor's Lemmas 1.2–1.3 and of the level-structure matching (/4).
- **R08.6:**
  - restrict export-weight-two-irreducible to 3 ≤ k(ρ̄_p) ≤ p (/5);
  - give export-fontaine-laffaille-irreducible its k = p and p = 2 inputs (/6).
- **Nodes to correct:**
  - R22.6/dyadic-patched-ring step 1: D″_m := D′_m/(d_m − 1);
  - R24.1's integral γ, which should be E29's γ̄ (/7).
- **R24.4/kw-theorem-4-1:** its prerequisites should list Kisin's potentially Barsotti–Tate theorem and the /317–/318 suppliers. Using R32.2 in the classical proof should wait for R32.6's audit (/9).
- **AutomorphicGaloisRepresentations:** R19.4 and R19.6 should allow KW's §7 levels, and E19's hypothesis should be added to R19.4 (/15).
- **R01.4 or R02.6:** the owner of H¹(SL₂(𝔽_{2^r}), M₂(𝔽)) = 0, with the GlobalGaloisDeformations request re-pointed if R02.6 is chosen (/12).
- **Duplicate id:** PotentialModularityAndCompatibleSystems/E2 and /E3 are each used in two packet files, --R23.1 and --R24.3 (/14).

No Lean file is a deliverable, and no Lean was run.
