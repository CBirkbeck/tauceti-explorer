# PKG-HeckeStacksAndLocalShtukas~2 — completed revision

Issue: #7905. Worker: Codex (GPT-6), session `codex-rkgzGB`.
Date: 10 October 2026. The bot confirmed this session's claim for comment
6092475585.

The package revision is complete. The remaining request R1 in
`research/blueprint/reviews/REV-PKG-HeckeStacksAndLocalShtukas.md` is resolved
and the complete suggested file elaborates against the supplied pinned build.
The next step is independent package review. There is no unfinished revision
work or checkpoint continuation.

## Correction and integration

`Suggested.lean` imports the individual module
`TauCeti.AlgebraicGeometry.AffineGroupScheme.Reductive`. Its `RedGrp F` is now
a transparent abbreviation for `TauCeti.ReductiveAffineGroupSchemeCat F.E`.
The admitted carrier and admitted `LargeCategory` instance are removed.
Category inference now uses the native full-subcategory instance, so all
downstream morphisms of reductive groups are actual group-scheme morphisms.
The native carrier is `Type 1` for the file's small local field, with morphisms
in `Type`; no universe changes or replacement category instance are needed.

The new import exposes a second `prod.associator`. The framed-modification
associativity signature now explicitly uses `Limits.prod.associator`, the
categorical product isomorphism it already intended. This is the only change
to a downstream signature.

The README's library-interface paragraph now distinguishes the affine-group
carrier used for integral models from the native reductive full subcategory
over the field. It states the latter's existing smoothness and geometric
connectedness, and explains that `RedGrp` inherits its category. The revised
paragraph asserts no new geometric theorem.

The prior review's Beauville–Laszlo correction remains: the `B(G, μ)` image
bound applies to a trivial target, while a general target retains the relative
Kottwitz identity. Existing genuinely missing supplier interfaces remain
admitted interfaces. This revision does not substitute the ordinary smooth
discrete representation category for its enhanced derived extension.

## Pin and ownership verification

The required pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The shared checker's Mathlib checkout has that exact HEAD. Its supplied Tau
Ceti source snapshot has no Git metadata, so every one of its 5,477 Tau Ceti
Lean source files was compared by Git blob hash with the corresponding object
at the required Tau Ceti commit: zero mismatches or missing files. In
particular, the imported reductive module agrees byte for byte with the pin.
Its reductivity predicate and full-subcategory declaration were read at
lines 61–90; its smoothness and geometric-connectedness instances were read
at lines 93–115.

The five Hecke/shtuka rows of the reviewed library audit were read, together
with all eight baseline declaration statements in the accepted input. Several
old audit absence descriptions predate the native reductive and smooth
discrete carriers; this revision uses the actual pinned declarations rather
than those older absence claims. The audit and accepted input were not edited.

The current upstream ReductiveGroups and RepresentationTheory/InductionRestriction
READMEs were read in full. The nine roadmap additions identified by WORKERS.md
were screened for Hecke, shtuka, Satake, bundle-stack and Fargues–Fontaine
overlap. Current Tau Ceti's reductive declaration is retained in
`AffineGroupScheme/Reductive/Basic.lean`; the suggested import follows the
required pin's module layout. The read-only current checkouts were upstream
`d6f707516e7ede3181dac4b2420ba25c0799d22d` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No mathematics was moved between
owners, and no supplier, packet, source-issue record or review verdict changed.

The original source locators and own-word mathematical specifications remain
intact. The preceding independent package review supplies their source audit;
this narrowly scoped revision does not claim a fresh reading of all eight
papers. No restricted source was needed, and no source passage was added.

## Validation

- Final `lean-check research/blueprint/packages/HeckeStacksAndLocalShtukas/Suggested.lean`:
  **exit 0, zero errors, 997 warnings**, all exactly `declaration uses sorry`.
  The two removed admitted declarations explain the decrease from 999.
  The complete file, including all downstream uses of the native carrier,
  was checked. Available memory exceeded 100 GB; checks ran one at a time.
  No library build, Lake update, cache fetch or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HeckeStacksAndLocalShtukas.json`:
  **zero errors, zero warnings**. The unchanged accepted input has 51 targets:
  17 constructions, 18 theorems, 13 comparisons, two definitions and one
  application; 215 API items, 94 tests, 22 planets and eight baseline references.
- README agreement and structure checks found all 51 target headings, all
  215 accepted API names, all 94 test names, and one prerequisite and source
  block per target. All 51 internal anchors resolve. The document is
  **191,267 bytes**, below the 200 KB ceiling. Every target, API row, test row
  and source locator outside the library-interface paragraph is unchanged.
- Metadata remains exactly `topic = "math.NT"` with a final newline.
  Private-path and programme-process scans, permitted-deliverable checks and
  `git diff --check` pass.

Only the package README, its suggested file and this revision's handoff are
changed. The metadata already has the required content. `review.json` is left
in place for the next independent reviewer to replace.

The accepted input retains its nine gaps and 22 supplier requests, with all
five stages planned and none closed. Those precise supplier obligations remain
visible in the README; the package and successful signature elaboration make
no claim that the mathematics is formalized or that the supplier work is done.
The suggested file retains its explicit omissions for conditions the imported
interfaces cannot express, as permitted by the preceding package review and
the prototyping rule. Scratch files are unnecessary for the next review.
