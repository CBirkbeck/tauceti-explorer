# Review of PAPER-BHATT-ETAL-23

**Job** REV-PAPER-BHATT-ETAL-23 (issue #1445) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with two kinds of correction in place. All fifteen routes
accepted; all eight `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron and
Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed
characteristic*, [Publ. Math. IHÉS **138** (2023), 69–227](https://doi.org/10.1007/s10240-023-00140-8).
The extraction records only the DOI; the Centre Mersenne PDF at that DOI hashes to exactly the
recorded `a07fcb798fee01a791980ef8fb72e345da22e7f406af2e245adc47da53cf73d6`, so the provenance
reproduces. All 159 pages re-extracted, printed pages 69–227.

## Structure

273 items: 255 missing, 11 planned, 7 library. Every missing item is routed exactly once, all planned
layer ids exist, all six Part II parents exist, all areas are galaxy ids, and
`scripts/check_paper.py` passes.

One stage needs a note rather than a correction: `AnalyticStacks:AS.1` is not in `data/atlas.json`.
It is in the **designed** roadmap `research/blueprint/roadmaps/AnalyticStacks.json`, titled
"Topological and coherent formalisms, D-modules and algebraic de Rham stacks", and
`PAPER-HACON-WITASZEK-23`, `PAPER-ZAVYALOV-25` and `PAPER-BOXER-PILLONI-26` route to the same
roadmap. So the route is well-formed.

All twelve declarations behind the seven library items resolve at the pins:
`RingTheory.Sequence.IsWeaklyRegular` and `IsRegular`, Tau Ceti's `InvertibleSheaf` and
`SheafOfModules.IsInvertible`, the three `Scheme.Modules.cohomology…` declarations, `localCohomology`,
`DerivedCategory` with `Q`, `Subadditive.tendsto_lim` and `AddCircle.denseRange_zsmul_coe_iff`.

## Correction 1: 67 locators named the wrong kind of statement

The locators are terse and mostly name a numbered result — 219 of the 273 items do. In **67** of
them the number is right and the kind word is wrong: `Lemma 2.48` for Proposition 2.48, `Theorem 6.9`
for Corollary 6.9, `Proposition 4.18` for Lemma 4.18, `Lemma 9.30` for Definition 9.30,
`Corollary 9.33` for Theorem 9.33, `Theorem 5.1` for Setting 5.1, and so on — 50 distinct results in
all, across §§2, 4, 6, 7, 8, 9 and 10.

I built the paper's own table of kinds from the 159 pages, checked a sample of ten against the
declaration lines on the page, and rewrote the kind words to what the paper prints. Two things were
deliberately left alone: external citations, where the kind belongs to another paper (`Pat18 Theorem
9.7`, `Bha20 Theorem 3.4`, `SS10`, `SGA7 XVII`), and the arXiv-version numbering inside E1's locator,
where `v1 Lemma 2.37` and `v2 Lemma 2.50` refer to the numbering of those versions rather than the
published one. The numbers themselves were right throughout, and I changed none of them.

## Correction 2: one Part II title

`PrismaticCohomologyIntegralRiemannHilbert` read "Prismatic cohomology, Part II: …" where the
parent's atlas title is *Prismatic cohomology: relative, absolute, Nygaard and log variants*. The
prefix now reproduces it. The other five Part II titles already did, and this id is proposed by this
extraction alone.

## The eight findings

All are printed as quoted, and two of them are the paper contradicting itself, which makes them
particularly safe to confirm:

- **E4.** Theorem 9.28(c) on p.206 prints `−4d_{Γ_i} < (K_X + Δ)·Γ_i < 0`, strictly, while the
  introduction's Theorem I(c) on p.74 prints `0 < −(K_X + Δ)·_k C ≤ 4d_{C_i}` and the proof's
  Lemma 9.29 is non-strict too.
- **E5.** Theorem 10.6 on p.216 prints `β(v) = 393 if v = 1`; Theorem K on p.76 prints the same
  function as `f(v) = 373 if v = 1`.
- **E6.** Theorem 2.13 on p.85 says "let `T` be a subscheme of `X`" and concludes that `g^{−1}(T)` is
  a divisor; for `T = X` it is all of `Y`. The hypothesis has to be that `T` is closed and nowhere
  dense, which every application has.
- **E7.** Definition 2.19 on p.88 justifies the existence of `min_{D′∈|D|} coeff_E D′` by integrality
  alone; for `D = O(−1)` on `P¹` the system is empty. The uses in §8 all have `|D| ≠ ∅`.
- **E1, E2, E3, E8.** Lemma 2.56's second assertion claims an equality that only survives as a lower
  bound with an arbitrarily small loss; Proposition 6.28's `resp.` conclusion drops the pure boundary
  and is false as printed; the twist on p.128 goes the wrong way for Corollary 3.7, which vanishes
  only for negative twists; and Lemma 2.36 is cited on p.122 in a form whose `Q`-Cartier hypothesis
  on `D_Y` is not available, though its proof needs only the one on `D_X`.

## What this review did not do

I read the published text at each finding, the statements the routes cite, and a sample of the
corrected locators — not all 159 pages line by line, and I did not re-derive the MMP results. I add
no finding of my own.
