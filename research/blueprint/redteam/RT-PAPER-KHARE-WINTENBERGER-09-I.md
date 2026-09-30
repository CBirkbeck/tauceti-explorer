# RT-PAPER-KHARE-WINTENBERGER-09-I: red team of the extraction of Khare–Wintenberger, *Serre's modularity conjecture (I)*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4600).

**Target.** `PAPER-KHARE-WINTENBERGER-09-I` extracts C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, [Invent. Math. 178 (2009), 485–504](https://doi.org/10.1007/s00222-009-0205-7). The extraction has 71 items, 4 routes and 6 source issues.

**Who did what.**
- Claude Code `cc-48533a` wrote the extraction (PR #4553).
- Claude Code `cc-fb70e5` wrote `REV-PAPER-KHARE-WINTENBERGER-09-I` (PR #4558). It accepted all four routes, added E5 and E6, and corrected item 40.
- I did neither. The string `cc-f805bf` occurs in none of the four target files.

**Disclosure.**
- This session reviewed PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01 (PR #4658). That extraction routes to ClassicalSerreModularity R26.1/R27.6 and GL2ModularityLifting R22.5.
  - Finding 1 changes what R27.6 owns: Theorem 10.1(ii) moves out of it.
  - Finding 4 adds items planned at R27.6.
  - Neither touches the BCDT material there, which is the finite-flat weight-two export to R29.
- This session also wrote FIX-RT-AREA-automorphic-1, which amended R16.x–R17.5 (Langlands–Tunnell and the weight-one dictionary). Items 63 and 36 (finding 6) cite R17.5, but no finding depends on that fix's wording.
- This session wrote PAPER-KOLYVAGIN-90. Nothing here touches it.

**Result: eight findings.** Four are medium and four low. The machine-readable file is [RT-PAPER-KHARE-WINTENBERGER-09-I.result.json](RT-PAPER-KHARE-WINTENBERGER-09-I.result.json).

- **Where the work is sound.**
  - Every numbered statement has an item, and the locators are right.
  - The hypotheses match the text: odd, absolutely irreducible, p > 2 against p = 2, the weight range, and non-solvable image or irreducibility over ℚ(μ_p).
  - The Mathlib citations hold at `082e2d3`. Tau Ceti `f790474` has no Chebotarev density theorem, as item 45 says.
  - E1–E6 are real, and the review's changes are correct. I rendered p. 12: the threshold is printed 1.46̄, with a bar.
- **Where it breaks.**
  - Route 3 creates a cycle between R27.6 and ML.1 (finding 1).
  - The recorded correction of the gap E3 is incomplete for odd p (finding 2).
  - Minimal lifts are given the wrong owner, and the one "missing" item on route 2 is already in the atlas (finding 3).
  - Some inputs have no item: the strong form of Serre's conjecture in all cases and the qualitative-to-refined theorem that §10 uses (finding 4), and the residual-member facts (finding 5).

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Authors' copy, 23 pp., created 31 May 2009 | [results.pdf](https://www.math.ucla.edu/~shekhar/papers/results.pdf), fetched 30 September 2026 | `3c389dc3…bad82` (matches the extraction) |

- **How I read it.** I read the whole text, including the references, and rendered p. 12 at 300 dpi.
- **Version of record.** I did not read the Springer version. Findings that quote the paper are scoped to this copy.

## Findings

### 1. Theorem 10.1(ii) makes R27.6 and ML.1 depend on each other (medium, error)

**The routing.**
- Theorem 10.1(ii) (item 56) is planned at R27.6.
- Its proof needs Khare's weight-one descent: "arguing as in [21] … ρ̄_λ for almost all λ arise from S₁(Γ₁(N))". That descent is item 59, routed to ML.1.
- Route 3 says ML.1 imports "Theorem 10.1 from ClassicalSerreModularity R27.6", in order to prove Corollary 10.2(ii) (item 65).

So each layer needs the other. PROTOCOL §17 lists a cycle as an error.

**Fix.**
- Move Theorem 10.1(ii) to ML.1 together with the descent. R27.6 keeps 10.1(i).
- ML.1 then imports from elsewhere:
  - the strong Serre theorem from R27.6;
  - Sen–Fontaine from R06.2/P7;
  - Gross/Coleman–Voloch from R20.3.
- Send the ClassicalSerreModularity packet a request to restrict its Theorem 10.1 node to part (i).

### 2. E3's correction applies Theorem 5.1 outside its hypothesis (medium, error)

**The recorded correction.** E3 (the same text is ClassicalSerreModularity/E9) passes from "modular" to weight k(ρ̄) and level N(ρ̄) like this: "Theorem 5.1(1) gives a lift … crystalline of weight k(ρ̄)".

**Why it fails for odd p.**
- Theorem 5.1 assumes 2 ≤ k(ρ̄) ≤ p + 1 when p > 2.
- Serre weights for odd p range up to p² − 1. The paper itself says only that some twist ρ̄ ⊗ χ_p^i lands in [2, p + 1] (p. 2).
- Example: if ρ̄|_{I_p} ≅ 1 ⊕ χ̄_p, then its twist by χ̄_p has weight 1 + p·1 + 2 = p + 3.
- For such ρ̄ the argument proves the statement only for the twist. Returning to weight k(ρ̄) needs three more inputs:
  - θ-operators;
  - Edixhoven's weight theorem;
  - the Deligne–Serre lifting lemma.
- The atlas plans these at R20.3 and R27.6. The node R27.4/strong-form-by-minimal-lifts concludes only "for odd p after the twist". So item 8's note, "the blueprint supplies it in R27.4/strong-form-by-minimal-lifts", claims more than that node proves.

**Fix.**
- Amend the correction: twist into the range, apply Theorem 5.1(1) and Theorem 4.1 at level N(ρ̄), then untwist by the weight theorem.
- Cite R20.3 and R27.6 in item 8.
- Send the same amendment to the ClassicalSerreModularity packet's E9.

### 3. Minimal lifts: wrong owner, and item 33 is not missing (medium, error)

**The owner.**
- KW's local notion of minimal lift is owned by LocalGaloisDeformationRings R08.6 (`kw-local-conditions`, `export-away-from-p`).
- The accepted KW II extraction cites those nodes for the same definition (its item 110). R24.3/required-lift-types also defers to them.
- Item 26 cites R24.3/kw-annals-minimal-lifts instead. That node is a different theorem: KW Annals Theorem 3.3, the existence of a minimally ramified lift.

**The status.** Item 33 is marked missing, with the note "No node of R24.3 states it". But R24.3/required-lift-types already states the remark in its hypotheses, and it did so before the extraction was written. There it has no proof. A proof would be a local lemma, and it belongs with the definition at R08.6.

**Fix.**
- Make item 26 planned at R08.6.
- Make item 33 planned at R24.3/required-lift-types, and send R08.6 a request for a proof node.
- Revise route 2 accordingly.

### 4. No item for the strong form of Serre's conjecture in all cases (medium, missing)

**What is missing.**
- The items stop at Theorem 1.2 and the qualitative Theorem 9.1.
- §10.1 applies the strong form, at weight a + 1 and a fixed level, to residual representations of any characteristic and any level.
- The implication "qualitative implies refined" also has no item. It rests on:
  - Ribet, Diamond and Carayol's level results;
  - Edixhoven's weight theorem;
  - Buzzard and Wiese at p = 2, completed by Theorem 1.2(2).

**Where the atlas plans them.** R27.6 and R20.5–R20.6.

**Fix.** Add two items, both planned at those layers, and put them on route 1.

### 5. The residual-member facts have no item (low, missing)

**The facts.**
- (a) Almost all residual members are absolutely irreducible.
- (b) The residual Serre weights. For ℓ odd this is Fontaine–Laffaille. For ℓ = 2 it is Breuil–Kisin plus finite flatness.

They are used in §§8.2–8.4 and §10.1, each time "by almost strict compatibility".

**Where the atlas plans them.** R24.6/residual-members parts (ii) and (v). Part (v), however, excludes ℓ = 2, and §8.2 needs that case.

**Fix.** Add an item planned at R24.6 and R07.4, and request the ℓ = 2 case.

### 6. Lemma 6.2(i) for p > 2 has no supplier (low, error)

**The problem.** Item 36's planned layers (R17.6, R20.5) are p = 2 only. The R27.1 node states the lemma but gives no proof for p > 2, which the paper calls "well-known".

**Fix.** Cite R17.5 (monomial representations) and R20.5–R20.6.

### 7. Corollary 10.2(ii): conflicting statuses (low, other)

**The conflict.** This extraction marks the theorem missing. The accepted CG-20 extraction records the same theorem as planned at ML.1 and R17.5.

**Fix.** Make item 65 planned at ML.1, since the layer names "weight-one modularity in proved cases", and keep it on route 3.

### 8. (H) is described as a 2-adic statement (low, other)

**The problem.**
- The paper states (H) for every p. Only its use in §9, and Kisin's proof, are 2-adic.
- For odd p, (H) is Theorem 4.1(2)(ii): non-solvable image forces irreducibility over ℚ(μ_p).
- Item 50's note attributes all of (H) to Kisin's 2-adic paper.

**Fix.** Correct the summary, the report and item 50's note.

## What I checked

The full list is in `checked` in the result file. In brief:

- **The paper.**
  - I read the whole paper.
  - The §7 estimates hold: I checked them exactly for all primes below 200,000, and derived (3) and (4) from (1) and (2).
  - The §8 local calculations hold: the choice of i, Diamond's (i, j), and the mod-3 and mod-5 steps.
  - So do the good-dihedral conditions in §8.4 and Lemmas 6.3 and 8.2.
- **Library claims.** Every one, at the pins.
- **Cited nodes.** All 58 cited node ids resolve.
- **Atlas.**
  - I read the stage texts of every layer that a finding or route depends on.
  - I checked every route to EllipticCurveModularity Part II and to ML.1 across all extractions. No other extraction plans GL₂-type modularity, so route 4 is correct and has no duplicate.
- **Source issues.** I looked for mistakes the extraction missed and found none beyond E1–E6.
