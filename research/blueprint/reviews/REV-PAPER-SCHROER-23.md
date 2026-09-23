# Review: PAPER-SCHROER-23 (Schröer, There is no Enriques surface over the integers)

Job `REV-PAPER-SCHROER-23` (issue #1088), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5`, after earlier Codex runs. **Verdict: accept**, after the corrections below, which were made in place. All nine routes are accepted.

**Main finding.** The paper's Theorem 10.4 is incomplete, and this leaves a gap in the printed proof of the main theorem (E34, E44).

## What was read

- **arXiv v3** (9 August 2022, 52 pp., SHA-256 ae6481f2…) and its TeX source, read in full again. After the first page it is identical to the author's version of 19 July 2022 (SHA-256 828efee5…), which the extraction read. The published version, Ann. of Math. 197 (2023), 1–63, is paywalled and was not available.
- **Method:**
  - Four checkers split the paper (§§1–3; §§4–5 with the extraction's repair items; §§6–10; §§11–15 with the lattice items). Each compared every item with the text and TeX, listed uncovered results and recorded mistakes checked on page images.
  - The §§6–10 checker classified all 2²¹ Weierstrass equations over F₂ with Tate's algorithm.
  - The §§11–15 checker recomputed the Gram matrices (14) and (16): both have determinant −4, signature (1,9), and inverses as printed.
  - I checked the stage ids, the Part II titles and the library citations. I also verified the main finding independently.

## The main finding: Theorem 10.4 is incomplete

Theorem 10.4 claims that, under assumptions (i)–(ii) of §10 and a non-zero functional j-invariant, the Jacobian is one of eight Weierstraß equations. There are three more:

| equation | fibres over t = 0, 1, ∞ | Δ | j |
|---|---|---|---|
| y² + txy + t³y = x³ + x² | I₂* + E₄ + Ĩ₂ | t¹⁰ | t² |
| y² + txy + t³y = x³ + tx² | I₃* + E₄ + Ĩ₁ | t¹¹ | t |
| y² + txy + t²y = x³ + t²x² | IV* + E₄ + Ĩ₂ | t⁸(t² + t + 1) | t⁴/(t² + t + 1) |

**How they were found.** The error is in the twisted semistable case, which the proof dismisses with "the argument is similar". The tuples (r_a, i, r_c) = (7, 2, 2) and (8, 2, 1) satisfy the proof's own equation r_a + i + r_c = 11 and give these configurations. The checker found them by exhaustive search and checked one by hand with Tate's algorithm.

**Independent check.** I recounted points myself: Σ_t #J_t(F_q) over the smooth fibres, plus the counts of the stated singular fibres. For all three models this equals 1 + 10q + q² for q = 2, 4, 8, 16. So Frobenius acts trivially on NS, and the Picard scheme is constant. The same computation reproduces the printed model III* + E₂ + Ĩ₂.

**Condition (ii) holds.** Only Ĩ₁ or Ĩ₂ is semistable, and E₄ is ordinary.

**Consequences:**
- The introduction's "exactly eleven" is really fourteen (E29).
- Proposition 11.1's table and §§11–15, which never mention I₃*, do not treat these configurations. The printed proof of Theorem 15.1, and so of Theorem 5.1, has a gap there (E44).
- Whether the configurations occur on a non-exceptional Enriques surface over F₂ with constant Picard scheme is not settled by this review.
- No erratum or corrigendum was found. The published text could not be checked.

## Changes made to the extraction

- **Statements (26 corrected):** 1, 3, 4, 8, 9, 11, 13–19, 66, 80, 96, 97, 115, 125, 141, 147, 157, 174, 190, 192, 205. The note of each says what changed. Item 115 now states the corrected Theorem 10.4 with all eleven non-zero-j models.
- **Locators (31 corrected):** 2, 6–8, 10–14, 54, 71, 73, 74, 78, 80, 95, 97, 119, 126–129, 133, 135, 139, 146, 161, 164, 171, 192, 210.
- **Statuses:**
  - **208:** missing → planned. The Tau Ceti ModularCurves layer 2, block 2B, plans the norm functor on invertible sheaves.
  - **186:** planned → missing. R09.1 does not name openness of ampleness for algebraic spaces. It is now routed to NumericalPicardAndContractionDescent.
  - **194's note:** Br(F_q) = 0 is in Tau Ceti as `TauCeti.subsingleton_brauerGroup_of_finite`.
  - **Library items 151–163, 172, 180, 200:** checked at the pinned commits and correct. Item 157 now carries its nondegeneracy hypothesis.
- **The extraction's repair of the Proposition 5.5 gap (E6):** items 63 and 173–188 were checked as a referee would and found **sound**. Two small additions were made:
  - item 181 needs the normality of Spec Z for local systems with infinite stalks;
  - item 184 should cite Stacks 0D3D, applied to the geometric closed fibre.
- **New items (33):**
  - **Planned (3):**
    - cohomology and base change for Enriques families (Tau Ceti JacobianChallenge C, A0-extension);
    - a degree-one line bundle on a genus-one curve gives a point (SF.3);
    - Riemann–Roch on a genus-one curve (Tau Ceti AlgebraicCurves 5, 12).
  - **Missing, to NumericalPicardAndContractionDescent (9):** 213–217, 219–221, 223.
  - **Missing, to GenusOneFibrationsAndRationalEllipticSurfaces (11):** 222, 224–227, 234, 237, 245, and the three missing models 238–240.
  - **Missing, to EnriquesSurfacesAndIntegralNonexistence (6):** 228, 229, 232, 236, 242, 243.
  - **Missing, to WeilConjectures (2):** 235, 241.
  - **Missing, to AlgebraicModuliForArithmeticGeometry (1):** 230.
  - **Missing, to SchemeAndStackFoundations (1):** 218.
  - **Merged:** two duplicate proposals were merged.
- **Briefs:**
  - The GenusOneFibrations brief now says eleven non-zero-j models, not eight, and plans the classification as a finite computation over F₂.
  - The Enriques brief now says fourteen Jacobian models, requires the three omitted configurations to be excluded, and records the repair verdict and the gap in the main proof.
- **Summary:** a closing paragraph records the counts after the review and the main finding.

## Mistakes in the paper (`sourceIssues`, E1–E44)

- **E1–E17**, the extraction's, are all confirmed. E7, E10 and E12 carry amended corrections in their review field.
- **E18–E44** are new, recorded against the preprint:
  - **Errors in stated results:**
    - E34: the incomplete Theorem 10.4.
    - E29: the introduction's "exactly eleven" (it is fourteen).
    - E18: Proposition 1.2 is false for schemes with isolated points.
  - **Gaps:**
    - E44: the main theorem's classification step (above).
    - E24, E25: Theorem 2.1.
    - E38: Proposition 9.3(iv).
    - E39: Proposition 11.2 needs "non-exceptional".
    - E41: Proposition 11.3, case IV.
    - E43: Proposition 14.1 cites a characteristic-2 result for general p.
  - **Other errors:**
    - E42: a false step in Proposition 12.2, whose conclusion holds by symmetry.
    - E20: a false, unused vanishing in Lemma 1.1.
    - E36, E37: dual-graph slips in Proposition 9.5.
    - and others.
  - **The rest are misprints.**

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHROER-23.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
- The three Part II titles have their parent prefixes.
