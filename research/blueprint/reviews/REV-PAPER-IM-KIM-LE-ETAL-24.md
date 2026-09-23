# Review of PAPER-IM-KIM-LE-ETAL-24

**Job** REV-PAPER-IM-KIM-LE-ETAL-24 (issue #1359) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** Both routes accepted; the single `sourceIssue` confirmed; no
correction needed.

Paper: Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, *Zagier–Hoffman's
conjectures in positive characteristic*,
[Forum of Mathematics, Pi **12** (2024)](https://doi.org/10.1017/fmp.2024.18), read in the arXiv v2
source.

## Source

The recorded arXiv e-print hash reproduces byte for byte —
`362cf73f69e7a7adc58c10667cf3226004842e3384191bd2b628bc43ca1c29b1`. The archive is a bare gzipped
file rather than a tarball, and it is the recorded `AMZV_ZagierHoffman_arxiv_v2.tex`, 4640 lines,
which I read.

**The locator convention is unusual and it is right.** The preprint leaves the introduction
unnumbered, so its statements are numbered `0.k`, while the published version numbers the
introduction as §1 and everything shifts by one; every locator gives the preprint number with the
published one in parentheses, and `source.read` says so and records the correspondence. I verified
the convention from the source: there are exactly four `\section` commands, so the introduction is
indeed unnumbered; the `theorem` counter is `[section]`-numbered with `conjecture`, `lemma`,
`proposition`, `corollary`, `definition`, `remark`, `example` and `notation` all sharing it; and
`theoremx` is a separate counter, which is why Theorems A and B keep their letters, exactly as the
note says.

## Structure

42 items: 38 missing, 3 planned, 1 library. Two routes. Every missing item is routed exactly once,
the source stage id resolves, all planned ids resolve, and `check_paper.py` passes.

The Part II parent `DrinfeldModulesAndTModules` exists and the proposed title reproduces its atlas
title exactly — *Drinfeld modules, t-motives and characteristic-p special values, Part II: multiple
zeta values and Thakur's basis* — with area `functionfields`, a galaxy id, and a 528-word brief. The
content is genuinely absent from the parent: alternating multiple zeta values and alternating Carlitz
multiple polylogarithms, Brown's theorem for ACMPL's, the Zagier–Hoffman conjectures in positive
characteristic, Thakur's basis and the dimension formula. The planned items keep the division of
labour — `DM.0`, `DM.2`, `DM.4` and `DM.6` supply the Carlitz module, `t`-motives and the
Anderson–Brownawell–Papanikolas criterion, and `PeriodsAndSpecialValues:PS.9` the period side, all
imported rather than replanned. Route 2 sends the one item that belongs to the parent itself back to
`DM.8` rather than sweeping it into the Part II, which is the right call.

The single library item's four declarations resolve: Mathlib's `Polynomial`, `RatFunc`,
`LaurentSeries` and `Polynomial.Monic`.

**Locators.** I rebuilt the preprint's shared counter and checked every statement reference in the
file against it, ignoring the published numbers in parentheses. **All 31 resolve to a statement of
exactly the cited kind and number.** No locator error.

## The single finding

**E1 is confirmed verbatim.** The definition of the alternating multiple zeta values reads

    Letting $\fs=(s_1,\dots,s_r) \in \N^n$ and $\fve=(\varepsilon_1,\dots,\varepsilon_r) \in (\Fq^\times)^n$, …

with the sum running "through the set of tuples `(a_1,…,a_r) ∈ A_+^r`" and `r` named as the depth two
lines below. Both tuples have `r` entries and `n` is not in scope, so the ambient sets are `N^r` and
`(F_q^×)^r`. The contrast the finding gives is in the text: the alternating Carlitz multiple
polylogarithms are introduced with "For any tuple `𝔰 = (s_1,…,s_r) ∈ N^r` and
`𝛆 = (ε_1,…,ε_r) ∈ (F_q^×)^r`". A clean substitution slip with nothing depending on it, and
`affects: nothing` is right.

## One provenance gap, not filled

No `libraryPins` are recorded, so there is no commit against which the four declarations were
checked. I verified them against the index this lane uses and they are there. This is the **fifth**
extraction reviewed today with that gap — `PAPER-BHATT-MATHEW-23`, `PAPER-WOOD-19`,
`PAPER-HACON-WITASZEK-23` and `PAPER-CANNING-LARSON-PAYNE-24` are the others — which is enough of a
pattern to be worth fixing at the queue level rather than one review at a time.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.result.json research/blueprint/papers/PAPER-IM-KIM-LE-ETAL-24.review.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this review.
