# REV-PAPER-LAND-MATHEW-MEIER-ETAL-24 — review of the extraction of Land–Mathew–Meier–Tamme, *Purity in chromatically localized algebraic K-theory*

**Verdict: accept. All four routes accepted, no coverage gap, both recorded mistakes confirmed, nothing corrected in place, and no further mistake found.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-7b31c4`, issue #2186 — 101 items (0 library, 5 planned, 96 missing), 4 routes, 2 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files, and reviewing another session's extraction is the established practice here — `REV-PAPER-VENKATESH-19`, by `cc-39fac3`, reviews the extraction written by `cc-7b31c4`.

Source: [arXiv:2001.10425v5](https://arxiv.org/abs/2001.10425v5), the accepted version, read together with its LaTeX source (`Purity-in-K-theory.tex`, 1595 lines). Published as J. Amer. Math. Soc. **37** (2024), no. 4, [doi:10.1090/jams/1043](https://doi.org/10.1090/jams/1043).

## Provenance

Both hashes the extraction records match byte for byte on re-download: the PDF `9eabee34fd018d509b3cd831addefcf5fc6ea9f3a1a21e13e6f8cd58040baa2f` (29 pp.) and the e-print `e7ab1af66d7bc548d8c989d4f8eda44b54ac959d9822fd38fbb8ad49bd025d7d`. The published version is paywalled — the AMS page returns HTTP 403 — exactly as the extraction states, so both findings stand against v5 and neither this review nor the extraction asserts anything about the copy-edited text.

## 1. Items and coverage — no gap

The document class puts `thm`, `cor`, `lemma`, `prop`, `quest`, `dfn`, `Notation`, `example`, `ex`, `rem`, `rems`, `recollection` and `warn` on a single per-section counter (`\numberwithin{thm}{section}`), while `introthm` and `introcor` run on the separate `zaehler` counter printed with `\Alph`. Simulating that from the source independently of the extraction gives **65 numbered objects** — 1 in §1, 12 in §2, 12 in §3, 34 in §4, plus Theorems A, B and Corollaries C–F — which matches the extraction's count, the two unnumbered statements being the starred Purity and Redshift Theorems.

**Every one of the 65 appears in an item locator**, and A–F are covered by name. This is the first extraction I have audited this way with no uncovered statement at all. The fifteen numbers appearing in locators that match nothing in the paper (0.2, 1.16, 5.1, 9.39, 17.4, …) are all citations *into other papers*, carried inside the locators' provenance parentheticals; the locators here are unusually rich, giving the full citation of the paper plus the supplier references for each item.

## 2. Mechanical audits — reproduced

Running my own over the source: **56 labels, no duplicates**; exactly **one undefined cross-reference**, `remark:tstructure`, which is E1; **no** mismatch between an introducing word (`Theorem~\ref{…}`) and the environment carrying the target label; and exactly one `??` in the PDF, in the E1 sentence. These are the same three audits the extraction reports, with the same results.

## 3. Statuses

The five `planned` items cite layers that exist and that plan them: spectrum foundations to `StableHomotopyKTheory:H.5:spectra` with `EnhancedDerivedSheaves:E5`, Quillen's computation to `KTheoryFiniteLocalFields:L.1`, Dundas–Goodwillie–McCarthy to `RefinedTraceMethods:RT.2/RT.3`, `K_0` and the fundamental theorem to `GeneralAlgebraicKTheory:K.3/K.6` with `SchemeKTheoryOperations:S.5`, and Weibel's homotopy K-theory to `S.5`.

There are **no library items, and that is right**. At the pinned commits neither library has spectra: Tau Ceti `f790474` has no `Spectrum`, `Prespectrum` or stable-homotopy declaration, and the only "spectra" in Mathlib `082e2d3` are spectral sequences and spectral objects. For a paper whose every object is a ring spectrum, zero library coverage is the correct audit result rather than an omission.

## 4. Routes

All four accepted; the per-route reasons are in the `.review.json`. The decisive one is route 2, and I checked its central claim myself rather than taking it on trust: searching **every** layer description in the atlas for `chromatic`, `Morava`, `Bousfield`, `telescop`, `redshift`, `T(n)`, `Lubin–Tate`, `nilpotence theorem`, `elliptic cohomology` and `topological modular forms` returns nine matches, and **every one is a false positive** — Lubin–Tate in arithmetic settings (endoscopic transfer, isocrystals, and class field theory, which explicitly places Lubin–Tate outside its scope) and "telescoping" sums in dense graph limits and optimal transport. No other paper's routes propose `ChromaticHomotopyTheory` either. So nothing in the atlas owns this mathematics and a new roadmap is justified.

Route 1's Part II title reproduces its parent's title exactly, as PROTOCOL §15 asks — worth noting, since three of the four Part II titles I reviewed in the previous job did not. Routes 3 and 4 send only non-chromatic material to layers that already own it.

## 5. Mistakes in the paper

**E1 confirmed.** Line 1484 reads `cf.~\Cref{remark:tstructure}`; no such label exists, the only "tstructure" label being `prop:tstructure` on **Proposition 3.12** (line 1038), which is referenced correctly at lines 458 and 893. The PDF prints "For another proof of this result, cf. ?? ." and that is its only `??`. The intended target is unambiguous, Proposition 3.12 being the alternative proof due to Ishan Levy.

**E2 confirmed.** Corollary **4.34** (line 1576) opens "let $\mathcal{O}_{\mathscr{C}}(G)$ be as in `\Cref{TCpassembly}`", and `TCpassembly` is **Proposition 4.33** (line 1555), which introduces $\mathcal{O}_{\mathscr{Cyc}}(G)$; the assembly map displayed inside 4.34 itself uses `Cyc`. §1 does define $\mathscr{O}_{\mathscr{C}}(G)$ for the same orbit category (line 427), so the clash is between two sections' notations, as the entry says.

**Nothing further found, and here is what I looked for.** I compared every introduction statement with its body restatement — Theorem A against Theorem 3.8, Theorem 1.1, the Purity Theorem against §3.3 and Remark 3.11, Theorem B, the Redshift Theorem, and Corollaries C–F against Corollaries 4.23, 4.9, 4.12, 4.30 and 4.34 — and they agree. I checked the computations of §4.2, including the fibre sequence `K(F_p) → K(k(m)) → K(K(m))`, the splitting `X ⊗_{k(m)} F_p ≃ X ⊕ Σ^{2p^m−1}X` from the `v_m`-cofibre sequence, and the resulting `K(K(m))^∧ ≃ K(F_p)^∧ ⊕ ΣK(F_p)^∧`. I traced the external citations used in the introduction to their bibliography entries.

Two assertions the extraction *adds* also check out. `purity:optimal` really is **Remark 3.11**. And the no-circularity note on Theorem 1.1 is supported by the paper itself: Remark 3.9 sketches the Clausen–Mathew–Naumann–Noel argument and says it uses Corollary 4.30 "whose proof relies only on" Theorem 3.8 — the §3 form of Theorem A, not the Purity Theorem.

One thing that looks like a discrepancy is not one. Corollary C is stated in the introduction for **T(1)**-acyclic ring spectra and proved in Corollary 4.23 for **K(1)**-acyclic ones. The paper settles this on its first pages — "for n = 1, the telescopic localization agrees with the better known localization at Morava K-theory K(1) by [Miller, Mahowald]" — and the extraction records both that fact (item 18) and Lemma 2.3, that a ring spectrum is K(n)-acyclic if and only if it is T(n)-acyclic (item 19). A formalisation therefore has the bridge it needs.

## Changes made

None. Both findings were already accurate, every locator resolves, and no item, status or route needed correcting.

## Validation

~~~sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.result.json \
  research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.review.json \
  research/blueprint/papers/PAPER-LAND-MATHEW-MEIER-ETAL-24.md \
  research/blueprint/reviews/REV-PAPER-LAND-MATHEW-MEIER-ETAL-24.md
git diff --check
~~~

No Lean file is a deliverable of this review and no formalisation is claimed. Both findings enter the register as new confirmed mistakes, against arXiv v5.
