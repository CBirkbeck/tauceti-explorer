# PAPER-SKOROBOGATOV-SOFOS-23 handoff

Status: complete. Claude Code, session cc-442dc5, continuing the merged Codex checkpoint (codex-a71f92, #1913). Issue #1256. Date: 23 September 2026.

## Saved

- **Items.** 103 items: 6 library, 6 planned, 91 missing.
  - The checkpoint's 91 items are kept.
  - Items 92–103 are new: Lemmas 2.1, 2.2, 2.3 and 2.7, (3.7), Corollary 3.3, Proposition 3.8, Lemma 3.9, the von Mangoldt count θ^Λ, the mean bound for θ^Λ − θ, Holzer's theorem, and local solubility away from S.
  - Every missing item is routed exactly once, across eight routes. Items 3 and 4 moved to a new SieveMethodsAndPrimePatterns:SV.4 source route, where Harpaz–Wittenberg 2016 routes Hypothesis (H).
- **The repair.** The analytic chain is no longer gated.
  - **§3.** With Λ even on ℤ (E4), Theorem 3.1 and Lemmas 3.8–3.9 hold as printed. Lemma 3.14 holds in its von Mangoldt form (item 34).
  - **§4.** The dispersion runs for θ^Λ. The passage back to positive primes costs O(x(log log x)ⁿ(log H)ⁿ log x), which is o(x²/log x) because A₁ > n (items 47, 101).
- **Mistakes.** Twenty-two are recorded:
  - E1, E4 and E10 carry the repair;
  - E11 now affects a stated result;
  - E2, E5, E19 and E22 have their reach corrected.
- **Collation and searches.** Every finding was compared with arXiv v3 (identical except E18), and Crossref shows no correction.
- **Gates.** G1, G2, G4, G5, G8 and G10 are closed. G3 and G6 (supplier proofs) and G7 and G9 (design work) are deferred.

## Resume

The job is complete. For a reviewer or a later worker:

1. Check the repair of §4: items 28, 34, 97–101 and 47.
2. Check E4, a missing convention, and E11, Corollary 1.10 stated pointwise in x.
3. Check that SV.4 is the right owner for items 3 and 4.

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass. Only the two named deliverables and this handoff change. No Lean deliverable is part of a paper job.
