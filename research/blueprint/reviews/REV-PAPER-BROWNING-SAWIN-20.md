# Review: PAPER-BROWNING-SAWIN-20 (Browning–Sawin, A geometric version of the circle method)

Job `REV-PAPER-BROWNING-SAWIN-20` (issue #1126), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5` and Codex sessions `a71f92` and `c83e7a`. **Verdict: accept**, after the corrections below, which were made in place. All seven routes are accepted.

## What was read

- **The published version**, Ann. of Math. 191 (2020), 893–948, 56 pp., read in full. It is free on the Annals site (SHA-256 f20c87e3…). The extraction had read arXiv v3.
- **Method:**
  - Three checkers split the paper (§§1–4; §§5–6 with the proof of Proposition 2.6; §7 with the extraction's topology analysis). They compared every item with print and with the v3 TeX, gave each its published locator, and recorded mistakes checked on page images.
  - I checked every library citation at Mathlib 082e2d3 and Tau Ceti f790474, every stage id, and the four Part II titles.

## Changes made to the extraction

- **Locators:** every item now gives its published section, number and page (journal page = PDF page + 892), followed by the arXiv v3 page. Print matches v3, except that references [15] and [16] are swapped.
- **Statements (8 corrected):**
  - schreier: ψ is a character of F_q;
  - goodarciso: the dimension claim;
  - universalmonodromy: the characteristic range;
  - stalkminor;
  - smallcounter: needs n ≥ 3;
  - Nbound: needs k ≥ 3;
  - tracepairingconjecture;
  - conditionaldegeneration.
- **Library citations:** all exist at the pinned commits, among them `AddChar.sum_eq_ite`, `CategoryTheory.SpectralSequence`, `Subgroup.goursat_surjective`, `GenLoop`, `ContinuousMap.continuous_of_continuous_uncurry`, and Tau Ceti's `HomotopyGroup.piLoopSpaceMulEquiv` and `UnitAddCircle.fundamentalGroupMulEquiv`.
- **The extraction's own corrected, conservative-repair, gate and continuation items:** all 33 are **sound**.
  - Its topology analysis (items 120–136) correctly shows that Lemma 7.2 fails for the compact-open reading of the germ space. For k = 3, d = 2, n = 40, π₁ of the mapping space surjects onto Z, while Ω²X is simply connected.
  - The review adds that in the same reading Conjecture 7.1 fails at j = 1. That is recorded as a new item.
- **New items (13):**
  - **2 planned:**
    - the hyperplane-class description of hypersurface cohomology (EDC.4);
    - the compact-support cohomology of a finite étale Galois quotient (EDC.2).
  - **11 missing:**
    - 8 to GeometricCircleMethodAndMappingSpaces: among them the smooth projective closure and geometric irreducibility of X, the relative major-arc spectral sequence, fibre-dimension stratification, the affine dimension theorem, and the Conjecture 7.1 counterexample;
    - 1 to UniversalHypersurfaceMonodromy: the geometric monodromy group of a lisse sheaf;
    - 2 to ConfigurationSpacesAndRationalLoops: Euler products over F_q[t], and invariant dimensions for S_m-twisted tensor powers, which is a short computation from `FDRep.average_char_eq_finrank_invariants`.
- **Summary:** a closing sentence records the counts after the review and the §7 finding.

## Mistakes in the paper (`sourceIssues`, E1–E46)

- **E1–E28**, the extraction's, are all confirmed and still present in print.
  - E6, E8 and E20 are reclassified to "affects nothing".
  - E2 is sharper than recorded: the printed argument for Proposition 2.6 works only for (k, d) = (3, 2).
  - E28 records Lemma 7.2's failure in the compact-open reading, as a gap, since the paper never fixes a topology.
- **E29–E46** are new.
  - **E29 (error):** the claim on p. 898 that 2(n − 2)(n − 3) − 1 cohomology groups can be computed without higher differentials is false for typical d, because Theorem 1.1's range cuts it down. For example, for (k, d, n) = (3, 2, 24) none of the 923 groups is covered. Nothing later depends on it.
  - **E30 (gap):** Lemma 4.4 needs 0 ≤ m ≤ d, like E16.
  - **E31 (gap):** geometric irreducibility of X is used but never proved. It is true, because the projective closure X̄ is a smooth hypersurface.
  - **E43 (gap):** a non-emptiness gap in Remark 1.5.
  - **The rest are misprints.** Among them: ∧ for the wedge ∨, H*(Ω², Q) with X missing, "Section 6" for §7, n for N, and index clashes.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BROWNING-SAWIN-20.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every stage id exists in the atlas.
