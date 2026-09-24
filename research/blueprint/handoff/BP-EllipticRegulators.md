# Handoff — BP-EllipticRegulators (issue #716)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-erx`.

## Deliverables

- `research/blueprint/packets/EllipticRegulators.json` — 32 nodes (2 definitions,
  10 constructions, 8 theorems, 12 comparisons), 65 API items, 48 unit tests,
  12 planets, 7 baseline declarations, 5 gaps, 19 requests, 3 structural
  proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/EllipticRegulators.md` — 1703 lines.
- `research/blueprint/suggested/EllipticRegulators.lean` — 227 lines, every proof
  `sorry`.
- This note.

**All eight stages are `source_decomposed` with an empty `remaining`** — four
nodes each.

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**. The checker validates cross-roadmap stage ids against the atlas,
  and five of my first-pass supplier ids were wrong; they are now the real ones
  (`ComplexComparisonPartII:C5`, `EllipticCurveModularity:R29.5`/`R29.6`,
  `ModularSymbolsPadicLFunctions:L1`,
  `ArithmeticGaloisRepresentations:R01.6`, `DirichletPadicLFunctions:L0`).
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled**; shared Mathlib cache.

## The source, and the one that could not be read

The source is **François Brunault's thesis, *Valeur en 2 de fonctions L de courbes
elliptiques*** (arXiv:math/0602186, in French), SHA-256 `8fd73faba5…`. It is
freely available and it covers, in a form that can be read: Goncharov's function
on a compact Riemann surface with its differential property and its behaviour
under finite morphisms; the explicit regulator on symbols; the identification of
the imaginary part with Bloch's elliptic dilogarithm; the construction of K₂
classes from torsion points with their regulator; modular units with the
membership of their symbols in K₂ of the *complete* modular curve; and the
explicit finite-level Beilinson theorem with its elliptic specialisation,
including the source's own account of the two imprecisions in the classical
argument and how they are removed. Sections read are listed in
`sources[0].readSections`; chapter 3 was read only through its introduction,
which is gap 3. The PDF's text layer mangles accents and the name Beilinson;
every excerpt was repaired character by character without changing a word.

**Bloch's monograph is in the reference library and its scan has no text layer
here.** The supplied extraction is a list of empty page markers, an independent
extraction reproduces that, and this environment has no renderer. So the explicit
scalar of Theorem 11.2.1 is recorded from the roadmap's own transcription — whose
stage text says it was visually checked at printed pp. 87, 89, 92 — and the shape
of Bloch's CM theorem is quoted from Brunault, who states it. Gap 1 records this
with the exact next action.

## The two things the stage texts insist on, carried as hypotheses

1. **The normalisation factor.** Brunault himself says his functional gives the
   Beilinson regulator *"à un facteur près"*. ER.2's fourth node makes fixing
   that factor a comparison with the universal regulator and states as a
   non-example that it may **not** be chosen to make the final L-value formula
   true.
2. **Three conclusions that are not the same** (ER.6): a constructed class has
   non-zero regulator (ER.5); a constructed subspace has the expected determinant
   relation (ER.7); the regulator on the **whole** integral part is an
   isomorphism (the conjecture, proved nowhere). The first two do not imply the
   third, and a structural note asks that ER.5's and ER.7's stage texts each say
   which kind they prove.

Also carried: both parts of Bloch's function, since the complex regulator formula
is about the complex function and the identity for the imaginary part alone does
not give it; the diamond convention, fixed once with the sign change the opposite
one forces; the Fourier normalisation, one factor of `C` and not `C²`; the trace
formula as a **precondition** for extending anything by transfer; and
unramified ≠ integral.

## Gaps

1. **Bloch's monograph has no text layer** (ER.5, ER.4) — read pp. 87–93 from page
   images and verify the scalar twice, as the stage text requires.
2. **Schappacher–Scholl was not obtained** (ER.7) — the stage text records an
   earlier failed retrieval; it failed here too. The modular half is decomposed
   from Brunault instead, which proves an explicit finite-level theorem of the
   same shape.
3. **Chapter 3 of the thesis was read only through its introduction** (ER.7) — the
   Rankin–Selberg computation is the single argument behind Theorems 1–5 and 7.
4. **Deligne cohomology has no source here** (ER.2) — read Esnault–Viehweg.
5. **The syntomic side is stated, not decomposed** (ER.8).

## Structural proposals

Name Brunault's thesis in ER.3's and ER.4's stage texts as a permitted
implementation source alongside the monograph, so a worker without page images can
still make progress; split ER.5, whose CM-theory half is owned elsewhere and whose
K-theoretic half depends only on ER.3 and ER.4; and have ER.5 and ER.7 each
classify their own conclusion against ER.6's three.

## Where to resume

Chapter 3 of the thesis (gap 3) is the highest-value read: sixty pages that turn
four of ER.7's nodes from strategy into argument, and it needs no page images.
Then Bloch's monograph from renderings for ER.5.
