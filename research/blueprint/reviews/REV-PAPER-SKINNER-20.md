# Review: PAPER-SKINNER-20 (Skinner, A converse to a theorem of Gross, Zagier, and Kolyvagin)

Job `REV-PAPER-SKINNER-20` (issue #2171), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-7b31c4`. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted: the four original ones, and two added by the review.

## What was read

- **The published article**, Ann. of Math. 191 (2020), 329–354, read in full from the journal's open-access PDF. Its SHA-256 matches the extraction's.
- **arXiv 1405.7294v1**, for E1.
- **Method:** a checker compared every item and every recorded mistake with the published text on page images. I checked the statuses and routes against the atlas myself, and re-derived the Lemma 2.2.2 gap.

## Changes made to the extraction

- **Statements corrected (16):** 3, 5, 10, 18, 19, 20, 23, 38, 39, 41, 44, 46, 56, 59, 61, 62. Each note says what changed. In particular:
  - Lemma 2.2.2 (item 20) and Corollary 2.6.2 (item 39) are restated to what is proved.
  - The global duality item (23) is made exact.
  - The characteristic-ideal item (41) now covers the two-variable rings.
  - Item 46 uses the published notation.
  - Item 38 no longer copies a misprint.
- **Names corrected (3):** items 21, 24 and 49. H^1_𝔭 is strict at 𝔭 and relaxed at 𝔭̄, not '𝔭-relaxed'.
- **Locators:** item 23's was corrected.
- **Statuses:**
  - PAPER-SKINNER-20/3 planned → missing.
  - PAPER-SKINNER-20/9 planned → missing.
  - PAPER-SKINNER-20/21 missing → planned (SelmerIwasawaCohomology:L2); removed from the Part II route.
- **New items (16):**
  - PAPER-SKINNER-20/63 Local components at primes ℓ || N and Atkin–Lehner eigenvalues (planned)
  - PAPER-SKINNER-20/64 Theorem A′ from Theorem A (planned)
  - PAPER-SKINNER-20/65 No complex multiplication at squarefree level (missing)
  - PAPER-SKINNER-20/66 Rank and Ш under quadratic base change (missing)
  - PAPER-SKINNER-20/67 Néron–Tate pairing and its non-degeneracy on the f-isotypic part (planned)
  - PAPER-SKINNER-20/68 Jacquet–Langlands transfer to the Shimura curve of Case II (planned)
  - PAPER-SKINNER-20/69 The complex and p-adic CM periods Ω and Ω_p (planned)
  - PAPER-SKINNER-20/70 Serre: supersingular-type primes have density zero (missing)
  - PAPER-SKINNER-20/71 Ramanujan bound in weight two (planned)
  - PAPER-SKINNER-20/72 Ribet's level-lowering theorem (planned)
  - PAPER-SKINNER-20/73 Strong multiplicity one for weight-two newforms (planned)
  - PAPER-SKINNER-20/74 Selmer hypotheses of Theorem C give hypothesis (e) over Q (missing)
  - PAPER-SKINNER-20/75 E[p] is ramified at an odd bad prime (missing)
  - PAPER-SKINNER-20/76 Non-vanishing of first derivatives of quadratic twists (planned)
  - PAPER-SKINNER-20/77 The formal logarithm log_ω (planned)
  - PAPER-SKINNER-20/78 Selmer dimension over Q (missing)
- **Routes:**
  - item 21 removed from the Part II route (now planned).
  - new source route ModularIwasawaMainConjectures [L5] for item 3.
  - new source route ArithmeticStatistics [ST.4] for item 9.
  - new missing items added to the Part II and to the AutomorphicGaloisRepresentations source route.
  - Part II brief: records the Lemma 2.2.2 gap and how to state Theorems A and E.
- **Notes:**
  - PAPER-SKINNER-20/26: 'heegner-normalisations' → PAPER-SKINNER-20/27.
  - PAPER-SKINNER-20/42: 'iwasawa-modules' → PAPER-SKINNER-20/40.
  - E3 affects changed from 'the proof' to 'nothing' (intended meaning clear).

## Mistakes in the paper (`sourceIssues`, now E1–E11)

- **E1–E4** are confirmed, each with a review verdict:
  - E1 concerns arXiv v1 and is corrected in print, as the extraction recorded. The difference between v1 and print is wider than it said: several citations and a theorem were reworded.
  - E3 is reclassified as affecting nothing.
- **E5 (gap).** In Lemma 2.2.2, p. 338, the restriction H^1_f(K,V) → H^1(K_𝔩,V) is claimed injective for each 𝔩 | p. Under the hypotheses, its image is the λ-component of log(P) ∈ M_f ⊗ Q_p = ∏ M_{f,λ′}, for P spanning A_f(K)⊗Q over M_f.
  - Knowing that P is non-torsion makes log(P) non-zero, but not its λ-component. Excluding a vanishing λ-component is a Leopoldt-type statement that is not proved.
  - So the lemma holds when λ is the only prime of M_f above p, for example when [M_f:Q] = 1.
  - The proofs of Theorem A (through §3) and Theorem E (through §4) are incomplete when [M_f:Q] > 1. Theorems A′ and C, which concern elliptic curves, are unaffected.
  - The RankOneConverse brief now records this.
- **E6 (gap).** The 'only if' direction of Corollary 2.6.2 rests on the same point. Only the 'if' direction is used.
- **E7–E11:** a missing citation (Bump–Friedberg–Hoffstein) for the derivative non-vanishing in Theorem E's proof, and four misprints.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SKINNER-20.result.json` reports no errors.
- Every missing item is routed exactly once.
- Every planned and route stage id exists in the atlas.
