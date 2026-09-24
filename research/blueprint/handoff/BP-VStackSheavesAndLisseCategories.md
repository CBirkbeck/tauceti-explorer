# Handoff — BP-VStackSheavesAndLisseCategories (issue #1001)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-vstack`.

## Deliverables

- `research/blueprint/packets/VStackSheavesAndLisseCategories.json` — 21 nodes
  (5 definitions, 2 constructions, 11 theorems, 2 lemmas, 1 comparison), 45 API
  items, 28 unit tests, 18 planets, 29 baseline declarations, 7 gaps, 23
  requests, 2 structural proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/VStackSheavesAndLisseCategories.md` — the roadmap
  document, 1440 lines, one section per layer with every node's statement,
  hypotheses, proof outline, API, unit tests, acceptance items and sources.
- `research/blueprint/suggested/VStackSheavesAndLisseCategories.lean` — 710
  lines of suggested signatures and `example` unit tests.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/VStackSheavesAndLisseCategories.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place so every
  baseline reference was resolved against it and not merely checked for form.
- `python3 -m unittest discover -s tests` → 246 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib
build on this machine is a shared cache that must not be rebuilt, and this
working tree has no elaborated dependency modules. Nothing in this packet is
claimed to be formalised and every `implementationStatus` is `unchecked`.

## What this job rested on

A **reviewed integrated decomposition** already existed
(`data/decompositions/VStackSheavesAndLisseCategories.json`, review
`independent-review-REVIEW-EXT-05-EXT-02`, accepted 16 September 2026). All 21
node identifiers, statements, hypotheses, proof steps, acceptance items,
locators and excerpts are kept unchanged; excerpts over 400 characters were
truncated at a word boundary with a pointer back to the decomposition. What this
job added: prerequisites resolved to the pinned libraries or to a named supplier
stage, planets, per-layer coverage records, and API outlines with unit tests for
the five definitions and two constructions.

**Both sources were re-downloaded and both hashes reproduce byte for byte.**
`Geometrization.pdf` gives `9ab9efbd0df251bf…` and `Condensed.pdf` gives
`d422561285f3025a…`, matching the values recorded in the decomposition and in
`references/CATALOGUE.json`. So every locator in this packet rests on the same
two files the independent review checked. No locator was re-verified against the
PDFs in this session beyond the hashes; the page-level checking was done by that
review and is not repeated here.

## RS-05

The accepted restructuring `RS-05` (review `REV-RS-05`, accepted 23 September
2026) covers this roadmap. It **keeps** VS0, VS1, VS2, VS3 and VS5 and
**narrows** VS4 onto `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`,
`SR.0:derived-extension` and `SR.2`. Its new links into this roadmap —
`DiamondsAndVStacks:D4 → VS0`, `DiamondSixOperations:S3 → VS0`, `S4 → VS0`,
`EnhancedDerivedSheaves:E3 → VS2`, and the three `SR` components into VS4 and
VS5 — are all filed as requests and used as node prerequisites. No layer is
dropped, so no coverage record is `closed` on that account.

## The finding that changed the plan

`Mathlib/Condensed/Solid.lean` at the pinned commit `082e2d3` already contains
`Condensed.finFree`, `Condensed.profiniteFree`, `Condensed.profiniteSolid`,
`Condensed.profiniteSolidCounit`,
`Condensed.profiniteSolidIsPointwiseRightKanExtension`,
`Condensed.profiniteSolidification` and the class `CondensedMod.IsSolid`. The
file was read at the pinned commit. So the free solid module on a profinite set
and the solidity predicate over the integers are **not** planned again.

Its own docstring then says, verbatim:

> TODO: This is not the correct definition of solid `R`-modules for a general
> `R`. The correct one is as follows: Use this to define solid modules over a
> finite type `ℤ`-algebra `R`. In particular this gives a definition of solid
> modules over `ℤ[X]` (polynomials in one variable). Then a solid `R`-module
> over a general ring `R` is the condition that for every `r ∈ R` and every ring
> homomorphism `ℤ[X] → R` such that `X` maps to `r`, the underlying
> `ℤ[X]`-module is solid.

and two further TODOs record that `((profiniteSolid ℤ).obj S).IsSolid` and its
mod-`p` analogue are unproved, so the predicate has no proved nonempty instance
at the pinned commit. The VS2 node therefore owns the corrected general-ring
definition, Proposition 5.7, the structure theorem (Theorem 5.8), the generators
and the solid tensor product, and reuses the pinned predicate only over `ℤ` and
over finite-type `ℤ`-algebras. This matches both the roadmap document's own
warning and RS-05's note on VS2.

Tau Ceti's `IsSmoothDiscrete` and `SmoothDiscreteTopRep` are cited as baseline on
the VS4 classifying-stack node, for exactly the reason RS-05 gives: the pinned
smooth-discrete continuity exists and **is not** the `Bun_G` equivalence.

`data/library-coverage.json` has no reviewed entry for this roadmap, so the
pinned declaration index was searched directly. Confirmed absent at the pins and
therefore not cited: `CategoryTheory.Site`, `CategoryTheory.Presheaf`,
`CategoryTheory.Limits.HasColimits`, `CategoryTheory.Limits.IsFiltered`,
`CategoryTheory.Presentable`, `Condensed.Abelian`, `CategoryTheory.Triangulated`.

## What remains

No layer is closed. The decomposition's five gaps are carried forward unchanged,
each with a *next source action* naming exact printed pages, and two were added.
In rough order of how much they block:

1. **FS V.3 is unread** (printed pp. 173–177): Definition V.3.2, Propositions
   V.3.5 and V.3.6, Theorem V.3.7. Every statement of VS4's strict-locality node
   rests on it. Requested from `BunGAndNewtonStrata:BG4`, which owns it.
2. **FS VII.2–VII.5 are unread** (printed pp. 252–268). The four and five
   operations of VS2 are quoted from the chapter introduction's summary, not
   from proofs, and three proofs read here invoke Proposition VII.5.2 directly.
   The node's unit tests say so explicitly.
3. **FS IV.3, the body of IV.4, IV.6 and IV.7 are unread.** VS1 has the ULA
   formalism and the *statement* of the Jacobian criterion; formal smoothness,
   hyperbolic localization and Drinfeld's lemma have no node at all. This is
   what the first structural proposal is about.
4. **The proof of Theorem 5.8 (condensed Lecture VI) is unread**, as is
   Proposition 5.7, whose statement only was read.
5. Two supplier edges the atlas does not have:
   `VectorBundlesAndIsocrystals:VB3:general-BC → VS4` (Proposition V.2.1 is a
   VS4 node and Banach–Colmez geometry is linked only into VS1) and
   `BunGAndNewtonStrata:BG2:smooth-Artin → VS5` (Theorem V.7.1 needs the
   cohomological smoothness of `Bun_G`, and RS-05's own VS5 note calls the
   dimension-zero statement a proved prerequisite). Both are filed as requests
   here, but a `kind:link` job should draw the edges.

## Structural proposals

1. **Split VS1.** Its stage text asks for four independent developments — the
   ULA formalism (IV.2), formal smoothness and the Jacobian criterion (IV.3–4),
   hyperbolic localization (IV.6) and Drinfeld's lemma (IV.7) — with four
   different consumers. Only the first is decomposed. As one layer it can never
   be closed and a reader cannot see which part is planned.
2. **Narrow VS2's text.** Its first paragraph is a work plan against Mathlib.
   Its warning about the restricted predicate is confirmed verbatim by the
   library, but the construction it asks for is already there. Narrowing the
   text to the structure theorem, the corrected general-ring definition, the
   derived solid tensor and Hom and the sheaf-level formalism, and citing the
   pinned declarations for the rest, would make the boundary with
   `EnhancedDerivedSheaves` — which RS-05 has just sharpened by naming `E3` the
   owner of the cutoff and adjoint criteria — visible in the text as well as in
   the link graph.

## Where to resume

The packet is complete against the decomposition. The next real work is source
reading, in the order of the list above: FS V.3 first, since it blocks a node
that is already written, then VII.2–VII.5, then IV.3/IV.6/IV.7, which is a new
layer's worth of material rather than a gap in an existing one.
