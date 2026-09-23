# Review of PAPER-SHANKAR-SHANKAR-TANG-ETAL-22

**Job** REV-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (issue #1394) · **Date** 2026-09-23 · Claude Code,
session `cc-7b31c4` · **Verdict: accept**, with one correction in place. All nine routes accepted;
all six `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard
ranks of reductions of K3 surfaces over number fields*,
[Forum of Mathematics, Pi **10** (2022), e21](https://doi.org/10.1017/fmp.2022.14), read in the
published open-access PDF, 49 journal pages.

## Correction: the recorded hash cannot be reproduced

The SHA-256 recorded in `readSections` is `11fbb97a…6d28`. It cannot be reproduced, and the reason is
the publisher rather than the worker: the Cambridge Core PDF is stamped per download. Two downloads
seconds apart on 23 September 2026 gave

    c444920f80bec96861d7458cbbce05b96dcda84cd38abd1584e85fb2aad6833e
    2897a064acd0121fd05d054495e8ded0a09f4832adbfb3e3c5f89b11a8feda76

This is the second instance I have met today: in `REV-PAPER-HE-18` the same behaviour showed up on
another Cambridge PDF, where two downloads differed only in the `/ModDate` and the ~10 KB of bytes
that depend on it. A `sha256Note` now records the evidence and points to the DOI as the stable
citation. Nothing about the content is in doubt — the 49 pages matched at every locator I checked.

## Structure

97 items: 89 missing, 4 library, 4 planned. Every missing item is routed exactly once, all stage ids
exist, all planned layer ids exist, and `scripts/check_paper.py` passes.

Both Part II titles reproduce their parents' atlas titles exactly, and both ids
(`OrthogonalIntegralModelsAndKugaSatake`, `GSpinSpecialDivisorHeights`) are already proposed by the
sibling extractions of the same programme — `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18`,
`PAPER-BRUINIER-EHLEN-YANG-21`, `PAPER-CHARLES-16`, `PAPER-LI-ZHANG-22`, `PAPER-MAULIK-SHANKAR-TANG-22`
and others. The `new` route's id, `K3SurfacesAndSymplecticBoundedness`, appears in no other
extraction, and the atlas has no layer on K3 surfaces as such.

All **fifteen** declarations behind the four library items resolve at the pins: the five
`TauCeti.IntegralLattice` declarations (the lattice, its dual carrier, discriminant group, evenness
and signature), the two overlattice/isotropic correspondences, four `CliffordAlgebra` declarations,
and `ordinaryHypergeometric`, `ordinaryHypergeometricSeries`, `ascPochhammer` and `Complex.Gamma`.

**Coverage** is complete: all 45 numbered environments in the published text are carried into items.
**Locators**: 63 of 70 name-and-page checks land exactly, and the seven others are "proof of X, p.N"
locators whose statement sits earlier — Lemma 6.3 stated p.33 and used p.34, Proposition 6.4 stated
p.34 and proved p.35, Theorem 7.1 proved p.41, and so on.

## The six findings

- **E3** is decided by the paper's own example. Page 45 prints "`C⁺(V) ≅ M_{2^n}(Q)`; then `A⁺` is
  isogenous to `B^{2^n}`, where `B` is an abelian variety with `dim B = 2^n`", while two paragraphs
  earlier the Kuga–Satake variety has dimension `2^{2+3−1} = 16`, so `A⁺` has dimension 8 and, with
  `C⁺(V) ≅ M_4(Q)`, is isogenous to `B⁴`: that forces `dim B = 2 = 2^{n−1}`.
- **E5** is decided by the display. Page 29 bounds a sum by
  `m^{b/2} Σ_{N≥1} N^{−1}(log N)^{−A}`, whose `N = 1` term has `log 1 = 0` in a denominator; keeping
  `(log mN)^{−A} ≤ (log m)^{−A}` for that term repairs it with the same conclusion.
- **E2** is printed as quoted on p.43, gaps `e^{e^{p^n}}` and all, together with the sentence that
  makes the defect visible: "with `N` double-exponential in the size of `x_n`". The construction has
  to outrun the discriminant, not `x_n`.
- **E4** is the stray `.here` inside the display that ends the proof of Lemma 7.2 on p.37.
- **E1** is the hypothesis that Bruinier–Kühn's odd case needs: Proposition 5.2 carries it for `b`
  odd, and Lemma 5.3's reduction to the local computation is what requires it.
- **E6**: Crossref gives the Maulik–Shankar–Tang paper as *Picard ranks of K3 surfaces **over
  function fields** and the Hecke orbit conjecture*, Invent. Math. **228** (2022), no. 3, so the
  correction is right. The printed omission is as the extraction records; I say plainly that the
  reference pages of this PDF do not come through my own text extraction, so for the printed side I
  rely on its reading rather than mine.

## What this review did not do

I read the published text at each finding and the statements of the results the routes cite, not all
49 pages line by line. I add no finding of my own.
