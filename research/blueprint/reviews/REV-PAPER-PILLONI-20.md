# Review of PAPER-PILLONI-20 — checkpoint

**Job** REV-PAPER-PILLONI-20 (issue #1327) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Partial: a checkpoint, not a completed review.** The structural review is complete
and needs no correction; the source is verified; the mechanical audit of all 175 findings is done;
**13 of the 175 findings carry verdicts**, all confirmed. No `review.json` is written, and the
remaining work is listed below.

Paper: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*,
[Duke Math. J. **169** (2020), no. 9, 1647–1807](https://doi.org/10.1215/00127094-2019-0075), read
in the author's version (113 pages, 17 June 2019).

## What is complete

**Source.** The recorded hash of the author's version reproduces byte for byte —
`4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`, 113 pages — and I re-extracted
all of it. The extraction is candid that the published Duke text is paywalled and was not compared,
and that all locators are pages and statement numbers of the author version; that boundary is
correct and should stay.

**Structure, complete and clean.** 550 items (485 missing, 59 planned, 6 library), 25 routes (19
source, 5 Part II, 1 new). Every missing item is routed exactly once. All 19 source stage ids
resolve. All 59 planned ids resolve. All five Part II parents exist and all five proposed titles
reproduce their parents' atlas titles exactly; the new roadmap `GSp4NonregularModularityLifting` has
a free id. All six route areas are galaxy ids — `padic`, `automorphic`, `langlands`,
`arithmeticgeometry`, `langlands`, `arithmeticgeometry`. `scripts/check_paper.py` and
`research/blueprint/intake.py check-files` both pass. All 19 declarations behind the six library
items resolve at the pins.

**Mechanical audit of the findings, complete.** For **169 of the 175** the quoted `printed` text is
located by an automated word-sequence search at the page its own locator gives. The other six —
`E56`, `E62`, `E92`, `E95`, `E121`, `E133` — are diagram labels, subscript placements and
symbol-heavy displays that this PDF's text layer does not carry; the extraction records that it read
them on rendered page images at stated resolutions, and I cannot render images in this environment,
so those six will need either a worker who can or the published text.

**One provenance gap, not filled.** No `libraryPins` are recorded. This is the eighth extraction I
have reviewed today with that gap, which makes it a queue-level omission rather than an oversight
here.

## The 13 verdicts recorded

All confirmed. Four are settled by the paper contradicting itself, which is the strongest evidence
available for a single-version reading:

- **E1** — the introduction calls `T` the double-coset operator for `diag(p²,p,p,1)`, while §7 (p. 37)
  says that operator *cannot* be defined integrally, because the cocharacter is not minuscule, and
  that `T` is built from a factorisation instead.
- **E2** — the introduction's `K` is "an compact open subgroup"; §§5.2.1 and 6.1.1 both require *neat*,
  and the ungrammatical article is itself evidence of what was lost.
- **E3** — `M ⊗^L_{Λ,2}` twice where the weight under discussion is `(0,2)`, i.e. `k = 0` in the
  paper's own convention, fixed on p. 2.
- **E7** — the spectral sequence in the proof of Proposition 2.2.2 is written for `M^•` while the
  conclusion it is used for is about the cone `C(f)`.

Three I verified by computation rather than by reading:

- **E20.** Page 20 declares the positive roots `{e₁−e₂, −2e₁+e₃, −e₁−e₂+e₃, −2e₂+e₃}` with simple
  roots `α₁ = e₁−e₂`, `α₂ = −2e₂+e₃`. In that basis `−e₁−e₂+e₃ = −α₁+α₂` and `−2e₁+e₃ = −2α₁+α₂`:
  **two of the four declared positive roots have a negative `α₁`-coefficient**, so `{α₁,α₂}` is not a
  base of the declared system. The correction's opposite system repairs it.
- **E24.** Page 20 defines the torus by `diag(st₁, st₂, st₂^{−1}, st₁^{−1})`, so `diag(a,b,c,d)` lies
  in `GSp₄` exactly when `ad = bc`; the printed relation `αβ = γδ` among Hecke parameters should be
  `αδ = βγ`, which is also what makes `ℓ^{−3}αδ` the similitude eigenvalue.
- **E27.** With `HT(χ_p) = −1` (Remark 5.1.7.1) and weights `(0, −λ₂, −λ₁, −λ₁−λ₂)` from item 3, a
  self-duality `ρ ≅ ρ^∨ ⊗ χ_p^m ⊗ (finite)` forces `{h_i} = {−h_i − m}`, hence `m = λ₁+λ₂` — the
  opposite of item 5's printed `−λ₁−λ₂`.

The remaining six recorded here (**E4**, **E6**, **E21**, **E23**, **E25**, **E28**) are confirmed
verbatim with the internal evidence stated in each verdict: a missing "not", a quotient written the
wrong way round, a subgroup defined as its own stabiliser, two non-strict inequalities where the
neighbouring condition is strict, a group algebra where the Harish-Chandra isomorphism lands in a
polynomial algebra, and a Lie-algebra element asked to conjugate a parabolic subalgebra.

## What remains, and how to do it

The other **162 findings are not given verdicts here.** Their quoted text is located as described
above, but the register should carry only what a reviewer has checked in substance, and these are
substantial: the extraction supplies explicit counterexamples (E14's non-discretely-valued field,
E84's ordinary `G` with a non-factoring isogeny, E123's spectral-variety fibre, E135's slope-projector
lattice), redone computations and page renders at stated resolutions, and each deserves the same
treatment.

A next worker should take them in this order.

1. **The 32 substantive findings first** — the 11 `error`s (E10, E14, E20✓, E27✓, E40, E43, E70, E84,
   E85, E123, E150) and the 21 `gap`s (E5, E16, E17, E58, E75, E86, E90, E91, E106, E115, E116, E127,
   E128, E132, E134, E135, E141, E142, E147, and the rest) — of which E20 and E27 are already done.
   Nine of them are graded `affects: a stated result` and are the ones that matter most: E27, E40,
   E43, E85, E128, E132, E141 among them.
2. **Then the misprints in page order.** They cluster: pp. 20–25 carry 21 of them, pp. 56–62 carry 17,
   pp. 86–93 carry 24. Reading each page once and disposing of every finding on it is much faster
   than working through the ids in order; the grouping is easy to rebuild from the locators.
3. **The six image-only findings last** (E56, E62, E92, E95, E121, E133), which need a worker who can
   render pages, or the published Duke text.

Two standing cautions for whoever continues. The author-version text layer is good but drops
accents, fraktur distinctions and some sub/superscript placement, so a quotation that looks wrong in
the text layer is not evidence; and the extraction's own scope statement — author version only, the
published Duke text uncompared — must be preserved in any verdict, since none of these findings has
been checked against the version of record.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-PILLONI-20.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-PILLONI-20.result.json

Both pass. No roadmap change, no library claim and no Lean work is proposed by this checkpoint.
