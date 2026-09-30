# REV-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 — verification of the red-team findings on PAPER-LAND-MATHEW-MEIER-ETAL-24

**Verdict: all fourteen findings are confirmed, at the severities the red team gave: two high, six medium and six low.**

Ten fixes need adjusting; those of /4, /7, /11 and /12 stand as proposed. Each reason in `RT-PAPER-LAND-MATHEW-MEIER-ETAL-24.review.json` states the corrected fix. Two adjustments matter most:
- **/2:** the red team's own restatement of Kuhn's theorem drops its hypothesis and is false as written.
- **/14:** the proposed "published" `sourceVersions` entry would tell collation that an unread text was read.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4329).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-LAND-MATHEW-MEIER-ETAL-24 (Claude Code, `cc-f805bf`, #4330);
  - the extraction (`cc-7b31c4`, #2186, PR #2209);
  - its review (`cc-fb70e5`, #2187, PR #2386).

  Nor did it touch Clausen–Mathew, Clausen–Mathew–Morrow or Nikolaus–Scholze, which the findings cite.

**What was checked.**

- **The sources**, all with the red team's hashes:
  - Land–Mathew–Meier–Tamme, arXiv:2001.10425v5: PDF `9eabee34…40baa2f` and e-print `e7ab1af6…5d7d`. Also the v4 e-print for finding 10.
  - Clausen–Mathew–Naumann–Noel, arXiv:2011.08233 v1 (`8b6fa94d…`) and v2 (`84c76407…`).
  - Page images at 400 dpi for pp. 5, 25 and 26.
  - The published text (J. Amer. Math. Soc. 37 (2024), 1011–1040) was not served, so everything is against v5.
- **The records.**
  - The extraction, its report and its review.
  - Clausen–Mathew, Clausen–Mathew–Morrow and Nikolaus–Scholze, with their verdicts. REV-RT-PAPER-NIKOLAUS-SCHOLZE-18 was merged today.
  - The GeneralAlgebraicKTheory K.1 and K.6 packets, the KTheoryLowDegrees--U.1 packet, the StableHomotopyKTheory decomposition and the EnhancedDerivedSheaves E5 packet.
  - `research/blueprint/queue.json` and `make_queue.py`.
- **The atlas.** Every stage a finding cites, with reachability on the atlas `scripts/build.py` assembles.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`.
- **Collation.** `scripts/collation.py`, run on the file with and without the proposed entries.

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The two high findings

**/1: confirmed; the fix needs a frontier condition.**
- K.4, K.6 and K.7 plan only classical Waldhausen, Bass and Schlichting K-theory. "Enhanced" categories enter only as hypotheses of comparisons.
- Both GAKT blueprints were accepted on 28 September, and neither names the paper; the source route never reached their jobs.
- No other stage owns the twelve ∞-categorical items. RT.5 consumes localizing motives, and H.5 disclaims them.

Moving the items into the Part II is right, since every Part II proposal for the parent merges into one design job. But that new first layer has consumers the Part II itself imports:
- Clausen–Mathew–Morrow's accepted Land–Tamme excision item at RT.3;
- RT.5;
- Clausen–Mathew's item at K.6.

So the layer must import only E0/E5, H.3/H.5 and K.1–K.6, not RefinedTraceMethods. /32 coalesces with Clausen–Mathew–Morrow's item.

**/2: confirmed; the red team's restatement is itself false.**
- /48's "X^{tC_p} vanishes for T(n)-local X" is the extraction's paraphrase. The paper (Remark 3.9) states only the blueshift form.
- The counterexample holds: π₀(KU_p^∧)^{tC_p} = Q_p(ζ_p) ≠ 0.
- The proposed replacement drops "X T(n)-local" from Kuhn's theorem. Without that hypothesis it fails: by the Segal conjecture for C_p, S^{tC_p} ≃ S_p^∧, whose T(n)-localization is nonzero.
- The corrected wording keeps the hypothesis and the blueshift form.

## Ownership and missing items (/3–/6, /8)

- **/3: confirmed.**
  - The two L_n^f agree. Only the symbol T(0) (HQ against S[1/p]) and the non-p-local L_n^{p,f} clash, so one convention with /24 as the comparison is the fix.
  - Of Clausen–Mathew's items, only /118 is chromatic basics; /150, /142 and /024 are consumers.
- **/4: confirmed; the fix stands.** RT.4:topological plans ku and KU, and nothing plans ko or KO.
- **/5: confirmed.** All citations (a)–(j) are unitemized, and seven works are missing from the prerequisites. Adjustments:
  - give the James splitting, which has no owner anywhere, an item on route 2;
  - plan the T(i)-homology Serre spectral sequence on route 2;
  - put Mahowald–Sadofsky in notes;
  - coalesce the CMNN20 input with Clausen–Mathew /142 only if the statements agree.
- **/6: confirmed.**
  - Route the K₀ half to KTheoryLowDegrees Z.1, whose blueprint job is still pending, citing Mathlib's `exists_isIdempotentElem_eq_of_ker_isNilpotent` (:249) as well.
  - The negative-degree half stays at K.6 as a routine induction.
- **/8: confirmed.**
  - The Serre spectral sequence is AlgebraicTopology Stage 5.
  - AlgebraicTopology plans no Postnikov towers or Eilenberg–MacLane spaces; the Eilenberg–MacLane spectra are H.5:spectra's.

## The text of the paper (/7, /10, /11, /14)

- **/7: confirmed.** `\usepackage[mathscr]{euscript}` has capitals only, so `\mathscr{Cyc}` prints as 𝒞. The typeset v5 shows the same 𝒪_𝒞(G) throughout, which the 400 dpi word boxes confirm. E2 describes the source, not the printed text, and should be rejected.
- **/10: confirmed.**
  - E3: p. 23 cites "Corollary 4.30" for Corollary 4.23.
  - E4: p. 15 cites "[CMNN23, Lemma 4.5]", which is Theorem 4.6 of CMNN v2. E4 should be scoped to v2.
- **/11: confirmed.**
- **/14: confirmed, with one correction.** `collation.provenance` returns "published" as soon as any entry has that kind, as tested on this file. So add only the preprint entry, noting that the published text was not served.

## Owners in other extractions (/9, /12, /13)

- **/9: confirmed.** /49 already states only the application. Keep it, including the functor Perf(R^{tC_p}) → 𝒬, and add a note pointing to Nikolaus–Scholze /24, /26 and /28.
- **/12: confirmed; the fix stands.** Cite `MorphismProperty.isLocal` for local objects as well.
- **/13: confirmed.** Add E5:spectra-comparison but not H.5:S-delooping. After the accepted RS-33 the smash product is H.5:spectra's, which the item already cites, as REV-RT-PAPER-NIKOLAUS-SCHOLZE-18 also resolved.

## What becomes a fix job

The eight high and medium findings (/1–/8) will be queued as FIX-RT-PAPER-LAND-MATHEW-MEIER-ETAL-24, with the adjustments above. Under §17, only high and medium findings become a fix job; the six low findings are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- RT.3's accepted Land–Tamme item (Clausen–Mathew–Morrow) will import the new first layer of the GAKT Part II (/1);
- the revision of Clausen–Mathew should import the chromatic basics from ChromaticHomotopyTheory (/3).

No Lean file is a deliverable, and no Lean was run.
