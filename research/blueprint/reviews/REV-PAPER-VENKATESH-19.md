# Review: PAPER-VENKATESH-19 (Venkatesh, Derived Hecke algebra and cohomology of arithmetic groups)

Job `REV-PAPER-VENKATESH-19` (issue #1405), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4`. **Verdict: accept**, after the corrections below, which were made in place. Both routes are accepted.

## What was read

- **The published version**, Forum Math. Pi 7 (2019), e7, 119 pp., read in full from the open-access PDF (SHA-256 47fca7ed…). It was received on 30 January 2017 and accepted on 11 September 2019.
- **arXiv v3**, which the extraction read. Print matches v3 almost word for word, with the same numbering.
- **Method:** a checker compared every item and every candidate mistake with the published text on page images. I checked the statuses, library citations and routes myself.

## Changes made to the extraction

- **Locators (61):** each now gives the published section, number and page. Several were wrong in both versions: Definition 2.9 and Lemma 2.11 (not 2.8 and 2.10), item 16 in §1.4, and equation numbers that exist in neither version.
- **Statements (37 corrected):** 1, 4, 5, 6, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 40, 44, 47, 52, 53, 54, 55, 56, 58, 59. The note of each says what changed. Items 6, 24, 34, 35, 38, 53, 54, 55, 58 and 59 were materially wrong.
- **Statuses:**
  - PAPER-VENKATESH-19/9 planned → missing (Part II).
  - PAPER-VENKATESH-19/47 planned stages corrected: NC.6 → ArithmeticGaloisDuality:R02.5, SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3.
  - PAPER-VENKATESH-19/61 library → planned (ArithmeticGaloisDuality:D7, ArithmeticLocallySymmetricSpaces:ALS.3).
- **New items (13):**
  - PAPER-VENKATESH-19/62 Congruence classes are Hecke-trivial (missing)
  - PAPER-VENKATESH-19/63 Cup products and commutation of derived Hecke operators (missing)
  - PAPER-VENKATESH-19/64 Passage of generation from Z/l^m to Z_l coefficients (missing)
  - PAPER-VENKATESH-19/65 Preservation of the m-completion (missing)
  - PAPER-VENKATESH-19/66 Reduction of coefficients is surjective at nice primes (missing)
  - PAPER-VENKATESH-19/67 Derived Iwahori-Hecke algebra and derived bimodules (missing)
  - PAPER-VENKATESH-19/68 Hecke-trivial cohomology is the cohomology of the compact dual (missing)
  - PAPER-VENKATESH-19/69 Hecke algebra acting on the chain complex (planned)
  - PAPER-VENKATESH-19/70 Local-global compatibility at auxiliary level and inertial level <= n (missing)
  - PAPER-VENKATESH-19/71 Fontaine-Laffaille finite local condition and its duality (planned)
  - PAPER-VENKATESH-19/72 The map f_{q,n} to V/p^n (missing)
  - PAPER-VENKATESH-19/73 Cohomology is free over the exterior algebra on V (missing)
  - PAPER-VENKATESH-19/74 The classes [q, nu, alpha] and the map e_{psi,g} (missing)
- **Routes and brief:**
  - item 9 added to the Part II route.
  - new missing items added to the Part II and SR source routes.
  - Part II brief: 'Lemma 2.10' corrected to Lemma 2.11 (the published and v3 number).

## Mistakes in the paper (`sourceIssues`, E1–E33)

The extraction recorded none. The review recorded 33, each checked on a page image.
- **28 are new in print.** The three gaps:
  - the Chebotarev step in §5.11, used for Lemma 5.3, treats one i at a time and does not produce a single prime satisfying all the conditions at once;
  - the proof of Lemma 8.25 treats the union of two Taylor–Wiles data as a datum, which a datum of the fixed size s is not;
  - the remark after §6.1(8) assumes a compact Y(K), which §6.1(1) excludes, since a Q-split G makes Y(K) non-compact.
- **One error in print, which affects nothing:** Lemma B.5 writes Hom_S(A, F) for Hom_S(E, F). With A = E², the Ext-algebra has four copies of H^*(M, E), while H^*(M, E²) has two.
- **The rest are misprints.**
- **5 are v3 slips corrected in print,** recorded with `known`. Among them, v3's Lemma 3.8 is false without the hypothesis, added in print, that G₂ acts trivially. Counterexample: G₂ = Z/2 swapping (Z/2)², where corestriction is the non-zero norm.
- **Effect:** none affects the main theorems.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-VENKATESH-19.result.json` reports no errors.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
