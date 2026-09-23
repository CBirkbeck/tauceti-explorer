# REV-PAPER-SKOROBOGATOV-SOFOS-23 — review of the extraction of Skorobogatov–Sofos, "Schinzel Hypothesis on average and rational points"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1257).
- **Authors:** Codex, session `codex-a71f92`, and Claude Code, session `cc-442dc5` (#2073, which completed it). This reviewer
  took no part in either.

**What was read.**

- **The paper.** Invent. Math. 231 (2023), 673–739, doi:10.1007/s00222-022-01153-6, in the published open-access version:
  67 pages, with printed page = PDF page + 672. Its SHA-256 matches the extraction's record. It was read in full, as page
  images, in six ranges:
  - §1 (pp. 673–683);
  - §2 and §3.1 (pp. 683–696);
  - §3.2–§4.1 (pp. 696–709);
  - §4.2–§4.5 (pp. 709–717);
  - §5 (pp. 717–725);
  - §§6–7 and the references (pp. 725–739).

  Every item was compared with the page. arXiv:2005.02998v3 was consulted where the print was in doubt.
- **The libraries.** All library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- **The atlas.** Every planned stage and route stage was checked in `data/atlas.json`.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems.
- **Errata search.** Crossref shows no update, correction or erratum relation for doi:10.1007/s00222-022-01153-6.

## 1. Items

- **Corrected fields (68):** 36 statements, 31 locators and 1 name. Examples:
  - Items 9, 12 and 15 now carry the printed statements.
  - Item 14 is Corollary 1.6, not Corollary 1.7.
  - Item 24 (Proposition 2.8) had a coprimality hypothesis the proof never uses, which broke its application in Corollary 2.9.
  - Lemma 4.6 (item 44) now states its hypotheses.
- **Removed (1), not in the paper.** Item 101 was the extraction's repair lemma for E1: the mean over the box of
  θ^Λ_P − θ_P is ≪ (log H)^n log x. It is true, and it is now quoted in full where it is used.
- **Kept.** Item 79 is the corrected form of (6.7) (E19), so it is kept.
- **Added (47).** They are definitions, constructions and cited inputs the proofs use without an item. Examples:
  - Corollaries 1.6 and 1.7 in full;
  - Lemma 2.6's second moment;
  - the bounds (3.3) for E_z;
  - the dispersion expansion (4.1);
  - Wintner's theorem (4.2);
  - the truncated second moment (4.5);
  - the normalised local product B_P;
  - the steps of the proofs of Lemmas 4.7 and 4.9 and of Theorem 1.5;
  - the smoothness of the norm family;
  - the integral form of Lemma 5.2;
  - the congruence decomposition of Theorem 5.8;
  - the conic-bundle family and its p-adic neighbourhoods;
  - the character expansion of C_P and the average bound for T_{S,P};
  - the reduction of Theorem 7.1.

  Some are already supplied:
  - **Planned (4).** The cyclic Hasse norm theorem and Kronecker–Weber are planned in the Tau Ceti ClassFieldTheory roadmap,
    Layer 13. The Hilbert-symbol criterion for conics and Hilbert reciprocity are planned in QuadraticFormInvariants §6C.
  - **Library (1).** Quadratic reciprocity is in Mathlib.

## 2. Statuses

- **Library.** Every library declaration exists at the pinned commits with the stated scope.
- **Planned.** Every planned stage exists.

## 3. Routes

All eight routes are accepted; `PAPER-SKOROBOGATOV-SOFOS-23.review.json` gives a reason for each.

- **Titles.** Both Part II titles already begin with their parents' exact atlas titles.
- **Briefs.** Routes 1 and 2 now name the confirmed corrections their designs must carry.
- **Prerequisites.** Rebuilt as 12 cited works, one per entry, each with its DOI or a stable link and the place the paper uses
  it.
  - The old entries bundled works, and several pointed at this paper's own PDF instead of the cited work.
  - Works cited only as context are left out.

## 4. Mistakes

**The extraction's twenty-two.**

- **Rejected (2):**
  - **E2.** Allowing M = 0 in Theorem 1.2 is not a mistake: M is a modulus, positive by convention, and is stated positive
    where it matters.
  - **E15.** "A subset of density 1" in Theorem 5.3 means relative density in ℳ, as the paper intends; Example 5.6 rules out
    the other reading.
- **Confirmed (20).** Six are revised, as the independent checks upheld:
  - **E4.** Theorem 3.1 needs Λ extended evenly to the negative integers. Numerically, the main term has ratio 0.997 with the
    even extension and 0.749 without it. The quotation is also corrected.
  - **E10.** Lemma 4.1, Lemma 4.4 and (4.5) inherit the one-sided proof.
  - **E11.** For Corollary 1.10, passing from H to |P| is routine. The real gap is one exceptional set that works for every x
    at once.
  - **E17.** Remark 5.9(2) affects nothing.
  - **E19.** (6.7) fails for repeated polynomials, with an explicit admissible instance. Proposition 6.7 stands once they are
    excluded.
  - **E22.** The remark after Definition 1.8 is true once its missing hypotheses (irreducible, distinct) are added.
- **E1 is confirmed.** Lemma 3.14 counts only positive prime values, and the sum is a fixed fraction below the claimed main
  term: 3/4 of it for d = k = Ω = 1. It holds with Λ read evenly on ℤ.

**New: 20 (E23–E42).** Each claim was checked a second time by an independent verifier, and all were confirmed. The main ones:

- **E30.** Lemma 4.9 is false as printed for θ_P, for the same reason as E1. The deficit is of order H² log x, and exact
  computations show it is stable in H. It holds for θ^Λ, and Theorem 1.9 survives because A₁ > n.
- **E24.** Corollary 1.7 needs z ≥ 1. When a is a square, Holzer's solution has z = 0, and any solution with z ≥ 1 has
  x > p/2. So the proof fails in that case. A search suggests the statement is still true there.
- **E32.** The proofs of Theorems 5.3 and 5.8 need ℤ_p-points on the fibres, where Lemma 5.2 gives only ℚ_p-points. For
  cyclic K a short norm argument supplies them.
- **E37, E40 and E41.** Three small gaps in §6.3 and the proof of Proposition 6.7:
  - the modulus must be a multiple of 8a₁a₂a₃;
  - the positive-density claim needs local points on the family;
  - distinctness of prime values must be carried into T_{S,P}.
- **E23.** Theorem 1.5's "for all H ≥ 3" fails for real H near e^e.
- **E39 and E42.** Reference [38] should be Iskovskikh's 1971 note. The French "et" was read as part of a surname in [17],
  [19] and [53].

The rest are misprints, apart from E27, a missing range of q in (3.6) that affects nothing.

With Λ read evenly on ℤ, Theorems 1.1–1.5 and 1.9 stand. Corollary 1.10, and the square case of Corollary 1.7, are unproved
as printed.

## Questions for the orchestrator

1. **Rejected existing findings.** E2 and E15 carry a rejected review verdict and stay in the ledger with their reasons, so
   they do not enter the register as confirmed mistakes.
