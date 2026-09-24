# Handoff — BP-GeneralAlgebraicKTheory--K.1 (issue #737)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-gak1`.

## Deliverables

- `research/blueprint/packets/GeneralAlgebraicKTheory--K.1.json` — 33 nodes
  (4 definitions, 6 constructions, 14 theorems, 6 comparisons, 3 lemmas), 62 API
  items, 40 unit tests, 16 planets, 24 baseline declarations, 5 gaps, 9 requests,
  3 structural proposals. `"part": "K.1"`, `"status": "partial"`.
- `research/blueprint/readmes/GeneralAlgebraicKTheory--K.1.md` — 1840 lines.
- `research/blueprint/suggested/GeneralAlgebraicKTheory--K.1.lean` — 420 lines,
  every proof `sorry`.
- This note.

**All eight stages in scope are `source_decomposed` with an empty `remaining`.**

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralAlgebraicKTheory--K.1.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned index in place, so all 24 baseline
  references resolved against it rather than being checked for form.
- `python3 research/blueprint/intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled.** The Mathlib build here is a shared cache that must not
be rebuilt and this tree has no elaborated dependency modules. Every
`implementationStatus` is `unchecked`.

## Sources, and two that could not be read

Three chapters of Weibel's *K-book*, downloaded and hashed in this session:
`Kbook.II.pdf` (`529ea8a5…`), `Kbook.IV.pdf` (`9f1c1b8c…`), `Kbook.V.pdf`
(`52dcc8ee…`). **All three hashes reproduce the values recorded in
`data/decompositions/GeneralAlgebraicKTheory.json`**, so these are the files that
decomposition's accepted review of 15 September 2026 checked. What was read from
each is listed in `sources[i].readSections`, including what was not.

**Quillen's and Waldhausen's originals were downloaded — both hashes also match
the decomposition — and neither could be read here, so neither is cited.**
Quillen's scan carries an old OCR layer that drops every inter-word space and
mangles the displayed formulas; Waldhausen's carries none at all (the whole
101-page file yields three kilobytes of text, and none from §§1.3–1.5), and this
environment has no PDF renderer, no `pdftoppm`, no PyMuPDF. Every locator in the
packet is therefore to a K-book chapter, which proves the same theorems, and
attributions to Quillen and Waldhausen are made as the K-book makes them. Gaps 1
and 2 record this with the exact pages to read.

## Built on the reviewed decomposition

Twelve of the decomposition's nodes cover these eight stages and **every one is
kept**, refined to declaration granularity with the API outlines, unit tests and
planets the protocol asks for, and with its verified locators reused. The splits
are along declaration boundaries: its Q-construction node became the construction
plus its universal property; its resolution node became the theorem plus the
transfers and projection formula; its Waldhausen node became the categories, the
S-construction and the K-theory space; its K.5 node became four.

## What the pinned libraries gave, and what they did not

`AUDIT-28` records K.1 and K.2 as *partly built*, the rest *not built*; every
claim was checked against the index. Cited rather than re-planned: Tau Ceti's
`ExactStructure` with `transport`, `isConflationExact_split` and
`resolutionEquiv`, `ExactK0` with `mapEquiv`, `transportEquiv` and
`ofLE_surjective`, `simpleClassBasis`,
`moduleResolutionEquiv`; Mathlib's `nerve`, `SSet.toTop`, `HomotopyGroup`,
`Module.Projective.tensorProduct`, `Module.Finite.base_change`,
`Module.Finite.exists_comp_eq_id_of_projective`,
`LinearMap.ker_eq_range_of_comp_eq_id`, `ModuleCat.extendScalars`, `Core`,
`HasFilteredColimits`, `HasPushouts`, `ObjectProperty.IsSerreClass`,
`Idempotents.Karoubi` and `Unitization`.

Absent, and therefore this blueprint's own work: `Q(A)` and any K-theory space or
K-group; the plus construction, `BGL(A)`, `GL(A)`, `E(A)`; `K₁`, `K₂`, `K₃`, the
Steinberg group, the Bloch group; Waldhausen categories, the gluing axiom, the
S-construction, spectra; the localisation long exact sequence in any degree; and
relative K-theory.

## The four traps the stage texts name, each carried as a hypothesis or a non-example

1. **K.1.** The inverse of `π₁(BQA) ≅ K₀(A)` is built from the *universal
   property* of `K₀`; equal cardinalities are not a comparison. The node's
   acceptance list says so and the proof steps construct the inverse that way.
2. **K.2.** `BQ P(R) ≃ K₀(R) × BGL(R)⁺` is an equivalence of **spaces** after
   choosing component representatives — not a splitting of infinite-loop spaces,
   and the translations between components are not natural. That is its own node.
3. **K.4:construction.** The cofibrations of `SₙC` are given by a **latching
   condition**, not objectwise; the objectwise reading is recorded as a
   non-example.
4. **K.5.** Excision is conditional. It always holds for `K₀`; for `K₁` it holds
   exactly when `I = I²`, so a **square-zero ring** is the counterexample the
   stage text asks for. No unconditional excision instance is created anywhere.

Two further deliberate choices. The **three extra Waldhausen axioms**
(saturation, extension, cylinder) are kept outside the definition, each named by
the theorem that uses it — the fibration theorem names all four of its
hypotheses, and approximation records the source's own counterexample showing the
cylinder hypothesis necessary. And **scalar extension needs no flatness**: the
structure on `Proj_fg` is split and every additive functor is exact for split
structures, both pinned in Tau Ceti; the contrast with all finitely generated
modules is a unit test.

## Duplications, honoured not re-planned

`K.2:low-degree-comparisons` owns nothing: `KTheoryLowDegrees:U.6` owns `K₁`,
`K2SymbolsBrauer:T.1:plus` owns `K₂`, `K3BlochGroups:V.4` owns `K₃` and
`K2SymbolsBrauer:T.2:symbols` owns Matsumoto. The layer keeps two nodes — the
combination, and the rule that Matsumoto is field-specific — and four requests.
The structural proposal asks that its stage text say so.

## Gaps, in the order they block

1. **Quillen's paper is unreadable here** (K.1, K.3). Read LNM 341 §§2–5 from
   page images and add its Theorems 1–5 as second sources.
2. **Waldhausen's paper has no text layer** (K.4). Read §§1.3–1.6 from page
   images; the three steps the K-book itself defers to him are the simplicial
   proof of additivity, the `Sub(iS.A) ≃ iQ.A` identification, and the details of
   approximation.
3. **Four steps of the +=Q proof were read only in outline** (K.2:plus): IV
   Lemma 7.5, Proposition 7.6, Lemma 7.7, Theorem 7.8, pp. IV.62–65.
4. **The full proofs of V.2.1, V.2.4 and V.5.1 were not read** (K.3, K.4).
5. **The excision criteria are quoted, not proved** (K.5): Suslin and
   Suslin–Wodzicki.

## Structural proposals

Beyond the K.2:low-degree note: **split K.3** along the hypothesis boundary (its
first three theorems need no extra hypotheses; localisation needs abelianness and
cofinality needs a cylinder functor — three nodes each way); and **keep the two
localisation theorems apart**, with each stage text pointing at the other, since
using one outside its hypotheses is exactly the error K.3's text names.

## Where to resume

The packet is complete against the sources read. The next real work is reading
the two originals from page images — that is what gaps 1 and 2 are — and then the
four proof sections listed in gaps 3 and 4, which upgrade five nodes from
strategy to argument.
