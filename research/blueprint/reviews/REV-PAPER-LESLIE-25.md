# Review of PAPER-LESLIE-25

**Job** REV-PAPER-LESLIE-25 (issue #1062) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: accept.** All six routes accepted; the findings sampled and confirmed; nothing corrected,
rejected or deleted. One corpus-wide observation is recorded for the maintainer.

Paper: Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*,
[Ann. of Math. (2) **201** (2025), 551–645](https://doi.org/10.4007/annals.2025.201.3.1); read in
arXiv [1911.07907](https://arxiv.org/abs/1911.07907) v3, the accepted version, whose hash reproduces
as `167574c84c7a7e9bed4be72ca08be2769dd1442741fe7ffa6d1024627b682b76`.

## Routing

**Two Part II routes, both of `EndoscopicTransferAndUnitaryTraceComparison`.** Both titles reproduce
the parent's atlas title exactly, and both extend it in its own direction: ET.0–ET.3 build
endoscopic data, transfer factors, orbital integrals and the ordinary fundamental lemma, and this
paper does that work in the relative setting, which no layer of the parent carries. Two Part IIs of
one parent is the established pattern in this atlas rather than a collision.

**The second route coalesces with four other extractions.** `JacquetRallisRelativeTraceComparison`
is also proposed by `PAPER-BEUZARTPLESSIS-CHAUDOUARD-25`,
`PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22`, `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21` and
`PAPER-ZHANG-21`, and I checked all five: same roadmap id, same parent, same title, word for word.
The design job will get one proposal, not five.

**The four source routes** name stages that exist (ET.0/ET.1, `SmoothRepresentationsOfLocalGroups`
SR.4, `GeometryOfNumbersAndQuadraticArithmetic` GN.2/GN.3,
`AutomorphicLFunctionsAndLocalFactors` AL.3), and all eleven planned layer ids exist. Ninety-nine
missing items are routed exactly once, with four planned items named as sources.

## Locators

**All 88 checks land where they say**, once a statement and its proof are distinguished. The four
apparent exceptions are locators that name a *proof*: Lemma 3.2 is stated at the foot of p. 24 with
its proof on p. 25, Proposition 4.8 is on p. 37 with its proof on p. 38, and Lemma 9.4 is on p. 65
with its proof on p. 66 — exactly as the locators say.

## The twelve recorded mistakes

All twelve are misprints with `affects: nothing`. The sample I verified is verbatim:

- **E1.** Lemma 1.8 reads "let T_δ denote the centralizer of δ in **U(W)**" while its own conclusion
  is `T_δ ≅ Z_{U(V)}(F)·E[δ]^×/F[δ]^×` — the centraliser must be taken in U(V).
- **E3.** §3's introduction prints, in the paper itself, "That this implies Theorem 2.12 is
  Proposition **Prop: initial reduction**." An unresolved LaTeX label has leaked into the text where
  a number belongs. This is the kind of thing a formaliser following the reference would stall on,
  and it is worth having in the register.
- **E6.** Remark 4.4 writes "transferred to characteristic zero by **Gordan** in [Yun11]"; the
  appendix is Julia **Gordon**'s.
- **E9.** §7.3 writes `U(V_y) ≅ {(g, g^θ) ∈ GL_{n+1}(F) × GL_{n+1}(F) : g ∈ **GL_n(F)**}` — the
  condition belongs to the preceding display for `U(V_x)`.
- **E12.** §11.1 attributes to `H′(F_v) × H′(F_v)` acting on `G(F_v)` the invariant polynomials that
  belong to `H(F_v) × H(F_v)`, in a sentence whose second half gets the primed case right.

The remaining seven (E2, E4, E5, E7, E8, E10, E11) are single-symbol slips of the same kind, each
with a locator that passed the page check above.

## One observation for the maintainer, not a defect of this extraction

Both Part II routes give **`"area": "modular"`**, and `modular` is **not a galaxy id** — the ids in
`data/galaxies.json` are `elementary, computational, finitefields, analytic, algebraicnt,
arithmeticgeometry, functionfields, automorphic, iwasawa, langlands, modeltheory, algebraicgeometry,
padic, etale, motives, ktheory, geomlanglands, commutative, grouptheory, representations,
homological, foundations, analysis, pde, probability, combinatorics, topology, diffgeom`. `modular`
is an atlas **group** (36 roadmaps carry it), which is a different taxonomy.

This is corpus-wide rather than local: fifteen routes across the extractions use `modular` —
including the four other proposals of the very roadmap this paper's route 2 coalesces with — and
`cohomology` (7), `algebra` (5), `motivic` (4), `classical`, `diophantine` and `numbertheory` are
used elsewhere with the same problem. Nothing catches it, because `scripts/check_paper.py` only
requires the area to be non-empty:

```
if not text(route.get("area")):
    errors.append(f"{where}: needs an area (a galaxy id in data/galaxies.json)")
```

Re-tagging this paper alone would desynchronise it from the four extractions it deliberately agrees
with, so I left it. The fix belongs at the level of the corpus: either add these names to
`data/galaxies.json`, or re-tag the twenty-eight affected routes together — and in either case
`check_paper.py` should validate the area against the file it names.

## What this review did not do

- The published Annals text was not compared; the extraction reads the accepted arXiv version and
  says so.
- The fourteen prerequisites were read only as this paper cites them.
- No Lean file was written or compiled; the extraction claims no library item.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LESLIE-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
