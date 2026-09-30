# RT-PAPER-BHATT-MORROW-SCHOLZE-19: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5010, job FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19).

**Scope.**
- **Findings:** `RT-PAPER-BHATT-MORROW-SCHOLZE-19.result.json`, by cc-f805bf.
- **Verdicts:** `RT-PAPER-BHATT-MORROW-SCHOLZE-19.review.json` and `reviews/REV-RT-PAPER-BHATT-MORROW-SCHOLZE-19.md`, by
  Claude Code session cc-48533a. All twelve findings are confirmed.
- **This job:** the issue lists the six medium findings (/1–/6), and this job applies them. The six low ones (/7–/12) are
  not part of it.
- **Corrections:** where the verifier corrected or added to a fix, I applied its version. Each section says how.

**Files changed.**
- `papers/PAPER-BHATT-MORROW-SCHOLZE-19.result.json`, edited by a script that asserts each replaced string occurs once.
  The file keeps its own format (indent 1, UTF-8).
- `papers/PAPER-BHATT-MORROW-SCHOLZE-19.md`, which gets a closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 114 (1 library, 56 planned, 57 missing) | 117 (1 library, 56 planned, 60 missing) |
| Routes | 13 | 14 |
| Route 1 (Part II) / route 2 (RT.6) | 1 / 48 items | 4 / 47 items |

**Independence.** I did none of:
- the extraction (cc-fb70e5, continued by cc-442dc5);
- its review;
- the red team (cc-f805bf);
- the verification (cc-48533a).

**How I checked the links.** Most fixes here are stage links that the route reasons now record. I tested every proposed
link on the stage graph of `data/atlas.json` (its stage edges and `requires` lists), as a check on the verifier's
computation over the full accepted graph:
- CR.4 → DD.4, DD.5 → DD.4, DD.4 → RT.6, DD.4 → PR.4, CR.4 → PR.4, PR.6 → PR.4, AI.0 → RT.6, AI.4 → RT.6, DD.0 → RT.1,
  E5:animation → RT.1, DD.3 → DD.5 and L.5 → RT.6;
- the pending PR.4 → RT.6 and DD.2 → RT.1;
- H.6 → RT.2, for the new route 14;
- a Part II node importing RT.2, RT.3, RT.6, PR.4 and K.2:low-degree-comparisons.

Each is acyclic alone, and all of them together are acyclic. I did not re-read the paper: the quotations are those the
verifier checked on the TeX and the published pages.

## /1 (medium, error): the consequences of Theorem 7.15 move to the Part II

- **Item 065** is split as the verifier described.
  - It keeps at RT.6 the TC-internal part: π_iTC = 0 for i < −1, π_{−1}TC = coker(F − 1 on W(A)), hence Z_p(n) = 0 for
    n < 0 and Z_p(0) locally in degree 0.
  - The K_0 step, Z_p(0) = lim Z/p^r via w-local rings and Theorem 7.15, is the new item 115 in route 1.
- **Items 066 and 089** move from route 2 to route 1, with notes quoting the Theorem 7.15 steps (pp. 262, 283).
- **Route 1's brief.** "(routed to RefinedTraceMethods RT.6)" becomes "routed here". The brief adds the imports: RT.2,
  RT.3 and RT.6, PR.4 (Proposition 8.20, used by Corollary 8.23) and K.2:low-degree-comparisons (item 067). It says, as
  PAPER-BHATT-SCHOLZE-22 route 4 does, that none of them depends on the Part II.
- **Item 069's note** says that PR.4 uses the direct proof via Lemma 7.22 (item 070), and why the K-theoretic proof would
  become a cycle once PR.4 → RT.6 lands.
- **Route 2's reason** no longer justifies these items by the Bhatt–Mathew routing. The verifier's parallel note on
  PAPER-BHATT-MATHEW-23/008 is below.

## /2 (medium, error): the characteristic-p chain of §8

- **Route 7's reason** records CR.4 → DD.4, DD.5 → DD.4 and DD.4 → RT.6. The evidence given is the paper's: the left Kan
  extension of Illusie's WΩ, Lemma 8.3 in Theorem 8.14, Proposition 8.12's divided power thickening, Remark 8.15's use of
  QRSPerfd, and Theorem 8.17's use of 8.12–8.14. It says that the §8.2 package needs CR.4's WΩ and its Nygaard filtration.
- **Route 11's reason** records the same link from CR.4's side.
- **Item 084.** Following the verifier, PR.3 is dropped from its planned list, not linked with DD.4 → PR.3. Its note
  records its CR.4 input (Proposition 8.7) and its THH(F_p) inputs.

## /3 (medium, error): PR.4's inputs

- **Item 088** keeps "Z_p(i)(S) is concentrated in degree 0 and equals A_crys(S)^{φ=p^i}". Following the verifier's first
  addition, its note says that at PR.4 Δ̂_S and its Nygaard filtration are identified with Â_crys(S) through PR.1–PR.3,
  not through Theorem 8.17.
- **The TC exact sequence** is the new item 116, at RT.6 (route 2).
- **Route 13's reason** is rewritten.
  - It records CR.4 → PR.4 (already pending from RT-AREA-padic-2/16), DD.4 → PR.4 and PR.6 → PR.4.
  - It says that no TC input may enter PR.4.
  - It takes the §10 Nygaard/Lη_ξ match from PR.3's BS22 §15 (the verifier's second addition).
  - It gives the sections as "§§7.4, 8.1, 8.4 and 10" (the third addition).
- **Items 102–104** name PR.6's AΩ ≃ φ^*Δ as their AΩ input. The printed text cites "Theorem 9.6", the body form of 1.8.
- **Item 074's note** records the CR.4 → PR.4 dependency and the verifier's option of moving it to CR.4. I left it in
  route 13.

## /4 (medium, error): §9's BMS1 inputs

- **Route 2's reason** records AI.0 → RT.6 (Construction 9.5, §9.1's μ, ξ_r and ξ̃, Remark 6.6) and AI.4 → RT.6
  (Proposition 9.10's BMS1 Theorems 8.3 and 9.4(i); AI.4 brings AI.3). It notes that PR.6 → RT.6 would also be acyclic
  and would supply AΩ ≃ φ^*Δ for item 006.
- **The AI.7 alternative is rejected**, following the verifier: Proposition 9.14 and item 006 would then depend on a
  later stage.
- **Item 097** drops PR.3 as a planner, as the verifier added. Item 050's note names AI.0's twist.

## /5 (medium, error): RT.1

- **Route 3's reason** records DD.0 → RT.1. It is already a confirmed pending link from RT-AREA-ktheory-2/37, with DD.2 →
  RT.1. E5:animation → RT.1 follows through DD.0, as the verifier noted.
- **Items 015 and 045** drop RT.1 as a planner and keep RT.6. Their notes explain that DD.5's quasisyntomic site is needed
  even after DD.2 → RT.1.
- **Item 043 and route 8's reason** record DD.3 → DD.5 for Example 5.12's conjugate filtration.
- **PAPER-NIKOLAUS-SCHOLZE-18 /127 and /129** need the same fix (maintainer note).

## /6 (medium, error): Bökstedt periodicity and THH(Z)

- **Item 023** is planned at L.5 only. The review of RT-AREA-ktheory-2/34 settled L.5 as the single owner.
- **The paraphrase** "the only non-formal input on THH" is replaced by the Remark 1.5 wording the verifier quotes.
- **Route 2's reason** records L.5 → RT.6 for Theorem 6.1, Propositions 6.2–6.3 and Theorem 8.17.
- **Item 024** is corrected as the verifier required. The proof of Lemma 2.5 uses only the finiteness of π_iTHH(Z) for
  i > 0, from the finiteness of the stable stems; the Bökstedt values are a footnote, and "we do not need Bökstedt's
  computation of π_*THH(Z)" (p. 216).
- **New item 117** is Serre's finiteness of the stable stems. No stage names it, and the verifier names
  StableHomotopyKTheory as its natural owner, so a new source route 14 requests it at StableHomotopyKTheory H.6
  (coefficients, completion and spectral sequences). The link H.6 → RT.2 is acyclic. The design job may prefer another
  H stage.

## Not applied, and why

- **The six low findings (/7–/12)** are outside this issue.

## For the maintainer

- **Stage links to add to the atlas** (all acyclic, singly and together, and with the pending PR.4 → RT.6 and DD.2 →
  RT.1):
  - CR.4 → DD.4, DD.5 → DD.4 and DD.4 → RT.6;
  - DD.4 → PR.4, CR.4 → PR.4 and PR.6 → PR.4;
  - AI.0 → RT.6, AI.4 → RT.6 and L.5 → RT.6;
  - DD.0 → RT.1 and DD.3 → DD.5;
  - H.6 → RT.2.
- **Verdicts.** Record a verdict for the new route 14. Routes 1, 2 and 13 changed membership, and their recorded verdicts
  still apply by number.
- **PAPER-BHATT-MATHEW-23 route 7 (item /008)** has the same back edge as /1 (Z/p^n(i) via sheafified K_{2i}), and should
  follow.
- **PAPER-NIKOLAUS-SCHOLZE-18 /127 and /129** (the HKR filtration and HH(F_p)) need the RT.1 fix of /5.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/*.result.json`: every extraction ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- Every missing item is routed exactly once.
