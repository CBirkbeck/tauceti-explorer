# RT-PAPER-KHARE-WINTENBERGER-09-I: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5027, job FIX-RT-PAPER-KHARE-WINTENBERGER-09-I).

- **Findings:** `RT-PAPER-KHARE-WINTENBERGER-09-I.result.json`.
- **Verdicts:** `RT-PAPER-KHARE-WINTENBERGER-09-I.review.json` and `reviews/REV-RT-PAPER-KHARE-WINTENBERGER-09-I.md`. All eight findings are confirmed: four medium (/1–/4) and four low (/5–/8).
- **What this job fixes.** The four medium findings, with the verifier's adjustments. It also fixes low finding /7, which the verifier asked the fixer of /1 to apply in the same pass. Where the verifier's reason differs from the red team's fix text, I followed the reason. The other low findings (/5, /6, /8) are recorded below and not applied.
- **Disclosure.** This session (`cc-f805bf`) wrote the red team RT-PAPER-KHARE-WINTENBERGER-09-I (PR #4744). I did not write the extraction, its review or the verification. This fix stays within the scope the independent verifier (`cc-58621d`) authorised, and uses its corrected fixes.
- **Files changed:**
  - `papers/PAPER-KHARE-WINTENBERGER-09-I.result.json`;
  - `papers/PAPER-KHARE-WINTENBERGER-09-I.md`: route and E3 text updated, and a closing "Fixes" section added;
  - `packets/ClassicalSerreModularity--R27.3.json`, which /2 names;
  - this report.
- **Result.** 73 items (2 library, 65 planned, 6 missing) and 5 routes:
  - route 1: 30 planned;
  - route 2: 13 planned;
  - route 3: 2 planned and 2 missing;
  - route 4: 3 missing;
  - route 5 (new): 1 planned and 1 missing.
- **The source.** I re-fetched the authors' copy `results.pdf` from Khare's UCLA page. Its SHA-256, `3c389dc3…bad82`, matches the recorded hash. I checked these passages in its text:
  - p. 2: "for some i ∈ Z, 2 ≤ k(ρ̄ ⊗ χp^i) ≤ p + 1", and the remark after Theorem 1.2 on the qualitative and refined forms;
  - p. 8: the members of a compatible system are crystalline at ℓ for ℓ ≫ 0;
  - p. 9: Theorem 5.1 assumes "2 ≤ k(ρ̄) ≤ p + 1 when p > 2";
  - pp. 19–21: §10.1, the proof of Theorem 10.1, and "part (ii) is not implied by Langlands' conjecture".

## /1 (medium, error): the R27.6 ↔ ML.1 cycle: fixed

I followed the verifier's version of the fix: /56 takes /65's status, /7 is applied too, and the imports are corrected.

- **Item 56 (Theorem 10.1(ii))** is now planned at ModularityAndLanglandsExtensions:ML.1, next to its descent, item 59 (still missing, route 3). Its note:
  - says why ML.1 owns it;
  - names each input ML.1 imports: the strong form, item 72 (R27.6); R24.6/residual-members; R06.2/dcris-of-tate-twists-and-unramified for Sen–Fontaine (item 57); and R20.3/weight-one-forms-unramified-at-p and R20.3/edixhoven-weight-theorem for Gross and Coleman–Voloch (item 58).
- **The status is planned, as for /65 (/7).** ML.1 plans weight-one modularity in the proved cases. Part (ii) is the stronger statement (p. 21), so it cannot be planned while its corollary is missing, and /65 is now planned.
- **Item 55 (Theorem 10.1(i))** stays at R27.6.
- **Route 1** no longer lists item 56. Its reason now describes the split in place of "Theorem 10.1 is only an application node at R27.6 whose weight-one half rests on an item routed to ML.1".
- **Route 3** lists items 56, 59, 62 and 65. Its reason is rewritten:
  - ML.1 imports the strong form of Serre's conjecture (item 72) from R27.6, not "Theorem 10.1";
  - the other imports are R24.6/residual-members, the R06.2 node (the members are crystalline at ℓ for ℓ ≫ 0, p. 8), and the two R20.3 nodes, alongside the imports that were already listed (R15.5, R19.1, R17.5, AN.4).
- **Item 59's note** no longer says that R27.6 "cites the argument". It says that R27.6 states part (i) only and names ML.1 as the owner of part (ii).
- **The summary and the report** (route 1, route 3, "What the atlas already has") give the new split.
- **The packet.** I restricted ClassicalSerreModularity:R27.6/scope-of-the-final-statement-and-the-compatible-system-export to part (i), as the verifier's point (d) allows. This is done directly rather than as a `requests` entry, because the node is in this packet and a packet does not file requests to itself.
  - The title and statement are changed. The statement names ML.1 as the owner of part (ii) and of Khare's descent, and says that Corollary 10.2(ii) follows from part (ii), at ML.1.
  - The hypothesis on Sen–Fontaine, Gross and Coleman–Voloch is replaced by one assigning part (ii) to ML.1.
  - The a = 0 proof step is removed.
  - The match text of the Theorem 10.1 excerpt now says part (i) is the export. The excerpt itself is verbatim and is unchanged.
  - The R27.6 coverage note is updated.
  - None of R27.6's consumers uses part (ii) (verifier).
- **Cycle test.** I tested read-only on the atlas's stage edges (`data/atlas.json`) plus every link file under `research/blueprint/links/`. None of the new or changed imports closes a cycle, and neither does any edge from /2–/4 below, and the combined graph stays acyclic:
  - R27.6, R24.6, R06.2, R20.3, R15.5, R19.1, R17.5 and AN.4 into ML.1;
  - R20.3, R15.5 and R24.6 into R27.4;
  - R20.5, R20.6 and R27.4 into R27.6;
  - R08.6 into R24.3.

  ML.1 does not reach R27.6.

## /2 (medium, error): E3's correction was incomplete for odd p: fixed

- **E3's correction** now reads as the finding's fix text does, word for word. For odd p it chooses a twist ρ̄ ⊗ χ_p^i with weight in [2, p + 1], lifts and proves modularity for the twist at level N(ρ̄), and untwists by Edixhoven's weight theorem with θ-operators and the Deligne–Serre lemma.
- **E3's reason** adds the hypothesis of Theorems 4.1(2)(i) and 5.1 and the example. ρ̄|_{I_p} ≅ χ̄_p ⊕ χ̄_p² has Serre weight 1 + p·1 + 2 = p + 3 for p ≥ 5. Only its twist by χ̄_p^{−1}, which is 1 ⊕ χ̄_p of weight 2, is in range.
- **E3's `known` field** says that R27.4 imports the untwisting from R20.3. The E3 review verdict is left unchanged, as a dated record.
- **Item 8's note** gives each step its supplier:
  - R27.4/strong-form-by-minimal-lifts gives the twist, or Lemma 6.2(i) in the dihedral case;
  - SerreWeightAndLevelOptimisation:R20.3 gives the untwisting (R20.3/ribet-twist-to-small-weight and R20.3/edixhoven-weight-theorem), with Deligne–Serre lifting from R15.5;
  - ClassicalSerreModularity:R27.6 assembles the characteristic-zero newform (R27.6/full-classical-serre-theorem).
- **The report's E3 row** is updated.
- **The packet's E9** gets the same amended correction, keeping its final sentence on the dyadic scalar case, and the same addition to its reason.
- **The node R27.4/strong-form-by-minimal-lifts.** The finding offered two options, and I took the first: the node imports the untwisting from R20.3.
  - The node is in this packet, so I changed it directly. I also added a `requests` entry to SerreWeightAndLevelOptimisation:R20.3 (neededBy the node and R27.6/full-classical-serre-theorem) that states the step exactly, as the packet does for its other imports.
  - The statement drops "(for odd p after the twist …)". It now builds the lift for ρ̄′ = ρ̄ ⊗ χ_p^i and returns to ρ̄ at weight k(ρ̄) and level N(ρ̄).
  - The level is exact because the newform of the lifted eigenform has level dividing N(ρ̄), while N(ρ̄) divides the prime-to-p conductor of every characteristic-zero lift (R24.6/residual-members (iii)).
  - New hypothesis: the weight range of Theorems 4.1 and 5.1, with the example above.
  - New proof steps: the twist, and the untwist.
  - New acceptance test: the example above.
  - New prerequisites: R20.3/ribet-twist-to-small-weight, R20.3/edixhoven-weight-theorem and R15.5/deligne-serre-eigenvalue-lifting-lemma.
- **Checked against the nodes I cite.**
  - R20.3/edixhoven-weight-theorem gives an eigenform of type (N, k_ρ, ε), where k_ρ is Serre's weight, for any ρ ≅ ρ_g with p ∤ N. This is KW's k(ρ̄) ("the weight of ρ̄ as defined in [38]", p. 2), and it needs no "not exceptional" hypothesis.
  - R20.3/ribet-twist-to-small-weight records that twisting by χ is θ at level prime to ℓ.
  - Serre's weight is at least 2, so the Deligne–Serre lemma applies in weight ≥ 2.
- **The dihedral branch** (Lemma 6.2(i)) is unchanged; the verifier found it unaffected.

## /3 (medium, error): the minimal-lift owner and item 33's status: fixed

I followed the verifier's version: item 33 stays missing, and a new source route replaces the request, since an extraction cannot file requests.

- **Item 26** is planned at LocalGaloisDeformationRings:R08.6. Its note cites:
  - R08.6/kw-local-conditions (the inertia-rigid lifts, KW II §3.3.1–3.3.3, including the p = 2 wild-dihedral case) and R08.6/export-away-from-p;
  - the matching KW II item, PAPER-KHARE-WINTENBERGER-09-II/110;
  - R24.3/required-lift-types as a consumer (its proof step: "minimal (R08.6 inertia-rigid) away from p and q").

  R24.3/kw-annals-minimal-lifts is dropped from the citation, since it is KW Annals Theorem 3.3, a different theorem.
- **Item 33** stays missing. Its note says that R24.3/required-lift-types records the remark only as a hypothesis note without proof, and it gives the verifier's proof:
  - p ∤ q − 1 forces p odd, and characters of I_q through (ℤ/q)^× have order prime to p;
  - so a lift of 1 ⊕ χ with conductor exponent 1 is 1 ⊕ χ̃, with χ̃ the Teichmüller lift of χ, and inertia maps bijectively;
  - a nontrivial unipotent ρ̄|_{I_q} lifts only to a unipotent ρ|_{I_q}.
- **New route 5:** a source route to LocalGaloisDeformationRings R08.6, with items 26 (planned) and 33 (missing). Its reason gives the owner and the proof sketch. R08.6 is upstream of R24.3, which the atlas and link graph confirms.
- **Route 2** now names only its 13 planned items. Its reason no longer calls R24.3 the home of the minimal-lift definition.
- **The report's route 2 paragraph** is rewritten, with a new route 5 paragraph. "What the atlas already has" now says that R24.3 consumes the definition from R08.6.

## /4 (medium, missing): the strong form and the qualitative-to-refined passage: fixed

I followed the verifier's owner for item (2): R27.6, not R20.5–R20.6.

- **New item 72, "Serre's conjecture, strong form, for every ρ̄ of S-type".**
  - Every S-type ρ̄, in every characteristic and at any level, arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))). It follows from Theorems 1.2 and 9.1, Kisin's (H) and item 73.
  - Locators: pp. 2–3, 18 and 19–20.
  - Planned at ClassicalSerreModularity:R27.6 (R27.6/full-classical-serre-theorem).
  - Its note records that Theorem 9.1 gives only modularity and that §10.1 uses the strong form.
- **New item 73, "Qualitative implies refined".**
  - A modular S-type ρ̄ arises from weight k(ρ̄) and level N(ρ̄).
  - The dyadic scalar case (k(ρ̄) = 2, since ρ̄ is then unramified at 2) is Theorem 1.2(2).
  - Locator: the remark after Theorem 1.2, pp. 2–3.
  - Planned at R27.6, R27.4, R20.5 and R20.6. Its note:
    - makes R27.6 the owner. Every R20 stage is upstream of R27.4, the supplier of the dyadic scalar case (R20.5 itself names "R27's weight-two theorem" for it), so an owner in R20 would close a cycle;
    - cites R20.6/strong-form-case-table, R20.6/scalar-dyadic-restriction-is-unramified and R20.5 for the implications they supply.
- **Route 1** gains both items. Its reason names R20.5–R20.6 as planned suppliers.
- **The notes of items 55 and 56** cite item 72 as their input. Item 9's note says it supplies item 73's dyadic scalar case.
- **The summary and "What the atlas already has"** are updated.

## /5 (low, missing): not applied

The finding: residual irreducibility for almost all λ, and k(ρ̄_ℓ) = a − b + 1 when ℓ is unramified in the system, have no item.

- Low findings do not enter this fix job (PROTOCOL §17). They are left for the next worker who edits the extraction.
- The verifier's adjusted fix is one planned item on route 2: (a) at R24.6 (ii); (b) for odd ℓ at R24.6 (v); for ℓ = 2 at R07.4 and R15.4/dyadic-weight-two-or-four. It is cited from the notes of items 15, 17 and 55.
- The maintainer point on R27.2/theorem-3-2-weight-reduction's missing prerequisites is in the verifier's report.

## /6 (low, error): not applied

The finding: item 36's note names no supplier of Lemma 6.2(i) for p > 2.

- This is a low finding, recorded only.
- The verifier's adjusted fix rewrites the note by case: for p = 2, R17.6 and R20.5's dyadic branch; for p > 2, R17.5, reduction mod p, and R20.5's odd-p entries.
- R27.1/dickson-and-the-dyadic-solvable-refinement lacks a proof step for Lemma 6.2(i). That node is in the R26.1 packet, which is not a deliverable here, so it is a maintainer matter.

## /7 (low, other): Corollary 10.2(ii) is planned at ML.1: fixed with /1

- The verifier coupled this finding to /1, so I applied it.
- **Item 65** is planned at ML.1 and R17.5. Its note cites PAPER-CALEGARI-GERAGHTY-20/ext-artin-conjecture-odd-2dim, and the note of PAPER-BOXER-CALEGARI-GEE-PILLONI-21/200, as the shared reading of ML.1. These are cited in the note only, never as prerequisites.
- The note no longer says that R27.6 "mentions that 'Corollary 10.2 follows' without a node". The restricted R27.6 node now places Corollary 10.2(ii) at ML.1.
- Items 59 and 62 stay missing, and route 3 keeps them.

## /8 (low, other): not applied

The finding: the report describes (H) as 2-adic.

- This is a low finding, recorded only.
- The verifier's adjusted fix touches the report's "What the paper proves" and item 50's note. For odd p, cite item 21 (Theorem 4.1(2)(ii)) rather than R22.5/kisin-potentially-bt-lifting alone.

## For the maintainer

- **A cycle in packet prerequisites that predates this fix.** With packet prerequisites counted as stage edges, there is a path R27.4 → R27.6 → EllipticCurveModularity:R29.1 → SerreWeightAndLevelOptimisation:R20.6 → R27.1 → R27.4.
  - Two of its edges are atlas edges, R27.6 → R29.1 and R20.6 → R27.1.
  - The edge R29.1 → R20.6 comes from the prerequisite `EllipticCurveModularity:R29.1` of SerreWeightAndLevelOptimisation:R20.6/weight-two-newform-at-reduced-level.
  - It does not involve this fix, and the atlas-plus-links graph is acyclic.
  - It does mean that R20.3 → R27.4, which this fix adds and which was already implied by R24.6 → R27.4 and R20.5/R20.6 → R27.6, lies on a packet-level cycle until that prerequisite is reconsidered.
- **Stale count in the summary.** The extraction's summary still says "Four source issues are recorded", but E5 and E6 were added by the review. No finding names it, so I left it.
- **The dated records** — the review of the extraction (`PAPER-KHARE-WINTENBERGER-09-I.review.json`, whose route verdicts describe the old routes 1–4) and the review verdicts inside E3 and E9 — are left as they are.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KHARE-WINTENBERGER-09-I.result.json`: ok.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.3.json --index <baseline>/declarations.tsv`: 0 errors, 0 warnings (32 nodes, 14 requests).
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Both JSON files keep their own formatting: indent 1, non-ASCII characters written literally. Each edit was applied by a script that asserted the matched text occurred exactly once.
- No new library declaration is cited. No Lean was run.
