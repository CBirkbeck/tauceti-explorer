# REV-PAPER-HE-LI-SHI-ETAL-23: review of the He–Li–Shi–Yang extraction

**Verdict: accept, after corrections made in place.**
- **Routes.** All three are accepted. Both Part II briefs are amended.
- **Items.** Seventeen items are corrected. No status changes.
- **Source issues.** E1–E6 are confirmed. Twenty-four new issues are added.
- **The main finding.** Lemma 9.6 is false in a special configuration (E7). This leaves a gap in the proof of the main theorem there (E8).
- **Paper.** He–Li–Shi–Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Invent. Math. 234 (2023) 721–817.
- **Extraction.** cc-fb70e5, issue #1237.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **The paper.** The authors' final version (Chao Li's homepage) and arXiv v2, both in full. Both have the extraction's SHA-256, and every finding reads the same in both.
- **Supporting texts:**
  - Li–Zhang and Li–Rapoport–Zhang, for E1;
  - Rapoport–Terstiege–Wilson and Howard, for §§3–4;
  - the Li–Liu II extraction, for the special-case argument.
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–4;
  - §§5–7;
  - §§8–10.
- **Checks by computer:**
  - finite-field isometry and subspace counts over F_3, F_5 and F_7;
  - direct local densities over Q₃(√3) in ranks 1 and 2 (273 cases);
  - every §7 identity, and Theorem 7.1 for n ≤ 9 (720 cases);
  - the §8 μ-identities at q = 3 and 5;
  - Deligne–Lusztig point counts.
- **Reviewer's check.** The reviewer checked every finding at the page image or in the text, and re-derived the Lemma 9.6 obstruction.

## 1. Items

The statements are faithful and the locators correct. Corrections made in place:
- **Item 37 (Lemma 9.6).** Now records the configuration where it fails (E7).
- **Item 40 (Theorem 9.7).** Records the resulting gap in the induction (E8) and the n = 2 base case (E13).
- **Item 38 (Theorem 8.2).** The false clause "zero on W^{<0}" is removed (E9), and the sign χ(−1)^{n₁} is noted (E10).
- **Item 16 (Theorem 3.19).** Now has "of type ≥ 2" (E14).
- **Item 12.** Covers the m = 1 case (E15).
- **Item 4.** Adds the polarization condition and the rank of 𝓕 (E16, E17).
- **Items 31, 34.** Pden^{n−i} (superscript), and Lemma 7.13 for m ≤ n (E26).
- **Item 36.** Lemma 8.4 and Propositions 8.7 and 8.9 hold for either sign χ.
- **Items 45, 46.** The standing hypotheses (G0)–(G5), and nonsingular φ_v.
- **Notes.** Items 1, 19, 21, 25, 27 and 32.

## 2. Statuses

Unchanged:
- item 10: SchemeKTheoryOperations S.6, S.7;
- item 20: AutomorphicLFunctionsAndLocalFactors AL.0;
- item 29: QSeriesPartitionsAndMockModularForms QM.0.

All stage ids exist.

## 3. Routes

Every missing item is routed exactly once (22 + 4 + 17 = 43). All three routes are accepted, and both Part II candidates keep the ids, parents, titles and areas shared with the other unitary Kudla–Rapoport papers.

The UnitaryKudlaRapoportCycles brief now tells the planner to plan Theorem 9.7 with the special-case step that the printed proof lacks.

## 4. Mistakes in the paper

**E1–E6 are confirmed.**
- **E1.** Li–Zhang's Theorem 10.5.1 is explicitly conditional on their Conjecture 10.4.1. The quotation of Li–Rapoport–Zhang is corrected: it reads "[15, Conj. 10.4.1]".
- **E2.** Now "affects a stated result". The reason is extended with a proof slip: the proof cites Theorem 3.19(1) where (4) is needed.
- **E3.** Quotation corrected to the superscript Pden^{n₁−i}; the page is 63.

**E7 (error, a stated result): Lemma 9.6.**
- **What the lemma says.** For x ∉ L♭ ⊥ W it produces L′♭ with val(L′♭) < val(L♭) and L′♭ + ⟨x′⟩ = L♭ + ⟨x⟩.
- **What the proof shows.** The minor argument proves a′₁ + ⋯ + a′ₙ₋₁ < val(L♭) for the fundamental invariants a′ of L = L♭ + ⟨x⟩.
- **Why the construction fails.** In the ramified hermitian case the odd invariants sit in hyperbolic blocks. So if a′ₙ is odd, the first n − 1 normal-basis vectors span a degenerate lattice.
- **Why nothing else works.** Every non-degenerate rank-(n − 1) summand has valuation at least a′₁ + ⋯ + a′ₙ₋₁, and that valuation is even. So when a′₁ + ⋯ + a′ₙ₋₁ = val(L♭) − 1, no admissible L′♭ exists.
- **Example (n = 2).** L♭ = ⟨ℓ₁ + πℓ₂⟩ in H₁ = ⟨ℓ₁, ℓ₂⟩, with x = ℓ₂. Here val(L♭) = 2 and L = H₁ has invariants (1, 1), but every rank-one sublattice of H₁ has valuation ≥ 2.

**E8 (gap, affects the proof of Theorem 9.7 and hence Theorem 1.3).**
- **The unjustified step.** "By induction hypothesis and Lemma 9.6, we may assume supp(Φ_{L♭}) ⊂ L♭ ⊥ W" fails at the x of E7.
- **What the analogous proof does.** Li–Liu's unramified proof (Forum Math. Pi 2022, Lemmas 2.57–2.58; recorded in PAPER-LI-LIU-22) treats this "special case" separately, with the uncertainty principle [LZa, Prop. 8.1.6]. This paper has no corresponding step.
- **Consequence.** The proofs of Theorem 1.3, and of Theorems 10.1–10.2 at ramified places, are incomplete in that configuration.
- **Status of the theorem.** No counterexample is known, and n = 2, 3 are proved in He–Shi–Yang (Compositio).

**Other errors in stated results:**
- **E9.** Theorem 8.2's "zero for x ∈ W^{<0}". Counterexample: n = 3, val(x) = −1, where the value is 2q·vol(L♭).
- **E14.** Theorem 3.19(2) when Λ + Λ′ has type 0.
- **E23.** The side claim in Lemma 5.3: Pden(I_m, H, X) = 1 − X ≠ 0.
- **E24.** Lemma 5.16 at (j, k) = (0, 0).

None of these is used downstream.

**Errors that affect nothing:**
- E22: the first branch of the observed formula (5.8) (c₂ = −1/36, not −5/48);
- E15: the singularity claim for m = 1;
- E30: the sign rule (5.12) for q ≡ 1 mod 4.

**Proof gaps with short repairs:**
- E13: the n = 2 base case;
- E19: Proposition 3.17;
- E20: Howard's Corollary C;
- E25: Proposition 7.5 at n₂ = 0;
- E26: Lemma 7.13 at m = n.

**Other gaps and misprints:**
- E16: Definition 2.2 lacks the polarization condition.
- The rest (E10–E12, E17, E18, E21, E27–E29) are misprints.

**Where corrections were sought.** Crossref, the arXiv versions, and the authors' page. None was found, so all are recorded as new.

## 5. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-LI-SHI-ETAL-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: ok.
- Every missing item is routed exactly once (43).
- The paper's files did not contain the reviewer's session id before the review.
