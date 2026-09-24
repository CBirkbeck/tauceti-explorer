# Handoff — BP-K2SymbolsBrauer--T.3

**Job** `BP-K2SymbolsBrauer--T.3` (issue #762) · Claude Code, session `cc-7b31c4` · 24 September 2026 ·
packet status **partial**: T.3 (both sub-stages), T.4 and T.6 `source_decomposed`; T.5 and T.7
`partial`, by design.

## What is closed

22 nodes (4 definitions, 2 constructions, 3 lemmas, 6 theorems, 6 comparisons, 1 application), 33 API
items, 24 unit tests, 9 planets, 20 pinned baseline declarations, 15 requests, 4 gaps.
`scripts/check_blueprint.py` reports **0 errors and 0 warnings**.

- **T.3:symbols** — the tame symbol through unit parts, so no residue is taken of a nonintegral
  element; independence from the uniformiser; bilinearity and the Steinberg relation by the source's
  four-case analysis; the normalisation on the two mixed pairs; the ramification formula.
- **T.3:localization-comparison** — finite support; the higher Milnor residues and specialisation maps
  by Serre's construction, with the relation on the indeterminate stated; rigidity; the transfer with
  the norm-residue and projection formulas; and the comparison with the localisation boundary, with
  the sign fixed **at the comparison**.
- **T.4** — the Bass–Tate sequence with the place at infinity kept outside the sum; the transfers and
  transitivity; Weil reciprocity with its finiteness and its reduction to the projective line; and the
  comparison of the two valuations, pinned on affine charts and glued here.
- **T.6** — Dennis–Stein symbols with the modern sign convention, their three relations, the reduction
  to a Steinberg symbol, the presentation under the local-ring and field hypotheses **only**, and the
  square-zero test.

## What is partial, and why

**T.5** and **T.7** are `partial` by design, and their `remaining` lists say exactly what is missing
and who owns it. Almost every computation their targets name is owned by another roadmap:
`ArithmeticKTheory:N.2` (the localisation theorem and so the injectivity half of the tame-kernel
sequence), `N.6` (certified presentations with matching lower bounds), `N.8` (`K₂(ℤ)`, `K₂(ℚ)`),
`SpecialValuesBirchTate:B.7` (the S-integer comparison), `KTheoryFiniteLocalFields:L.1` (`K₂(𝔽_q)`),
`MotivicEtaleKTheory:M.3` (the norm-residue map and Tate's comparison), and two layers of
`ClassFieldTheory` (the local invariant; Hilbert reciprocity). This layer owns the definitions and the
symbols those statements are phrased with, and imports the rest rather than planning it twice.

## Four gaps

1. **Bass–Tate cited, not obtained** — the function-field sequence, the transfers and their
   transitivity are attributed; the transitivity argument is the substantial part a continuation
   should decompose.
2. **Weil reciprocity is derived, not cited** — the K-book does not state the symbol form the roadmap
   asks for, so the node reduces to the projective line and derives it there; the derivation is
   written out rather than attributed.
3. **The gluing of the two valuations** is not pinned: affine charts are, the gluing into the closed
   points of a proper regular curve is not.
4. **The twice-twisted coefficient module is missing** from both libraries, so the cup product of two
   Kummer classes has no target; T.7's symbol formula is stated against it and the request names it.

## One correction to the companion part

An earlier revision of the packet for the **T.1** part (issue #761, PR #2781) placed the higher tame
symbols with rigidity, and the Dennis–Stein symbols with their presentation, under `T.2:symbols`. The
roadmap assigns higher Milnor residues and specialisation to `T.3:localization-comparison` and the
Dennis–Stein symbols to `T.6`. Both groups are owned **here** instead, and the companion packet was
corrected on its own branch before review rather than left as a duplication for a reviewer to find.
The packet's `restructure` list records this; no change to the atlas is proposed, since the stage
texts already say where these belong.

## One convention, stated rather than smoothed over

The roadmap's tame symbol is `(−1)^{v(f)v(g)} · overline(f^{v(g)}/g^{v(f)})`, so `∂_v{u,π} = ū` and
`∂_v{π,u} = ū⁻¹`. The K-book's symbol is the **inverse** of this one. The definition records the
inversion, a unit test catches a silent reversal, and every comparison states it.

## The suggested Lean file

`research/blueprint/suggested/K2SymbolsBrauer--T.3.lean`, 168 lines, **not compiled**: no toolchain at
the pinned commits. `K₂`, Milnor K-theory, the localisation sequence, the norm-residue map and the
local invariant are all parameters, never invented.

## Sources read

Weibel's *K-book*, author-hosted draft of 29 August 2013, SHA-256 `a04f53c9…b058845`: III.5.10–5.11.1
(PDF pp. 233–234), III.6.2.2–6.4.2 (pp. 241–243) and III.7.3–7.3.1 (p. 254). No source issue is
recorded: no misprint, error or gap was found in what was read. The difference of normalisation
between the roadmap and the source is a convention, not a mistake, and is recorded as such.
