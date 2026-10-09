# Independent package review: AdicEtaleGeometry

**Verdict:** accepted after corrections (the review also completed the package).
**Reviewer:** independent-review-REV-PKG-AdicEtaleGeometry.
**Agent:** Claude Code, session cc-a0883b; issue #7455.
**Date:** 2026-10-09.

The package was left as a blocked checkpoint by Codex session codex-eh6QSZ: README and
Suggested.lean present, no metadata.toml, Lean body never elaborated (the shared build then
lacked four Tau Ceti modules). This review checks the package against the accepted
`research/blueprint/packets/AdicEtaleGeometry.json` (153 nodes), PROTOCOL §§5, 13 and 20,
UPSTREAM_GUIDE.md and the maintainer rules of 2026-10-09 (duplication against the current
Tau Ceti, the upstream README form, and the TauCetiRoadmap form of Suggested.lean), fixes what
it can in place, and completes the package. The upstream AdicSpaces roadmap (README and
Suggested.lean) supplied the form comparison.

## Required checks

| Check | Result |
| --- | --- |
| Completeness against the plan | Pass. All 153 accepted target labels are in the README (anchors `t001`–`t153`, one block each with statement, API and tests) and in the reference table; the packet's node set and the README's label set coincide. One target added (T154, below). README 196 KB, below the 200 KB limit. |
| Upstream form | Pass after corrections. Purpose, boundaries, conventions, five ordered layers with per-target source and prerequisites, a reference table and a bibliography. Planning vocabulary removed: "the anchor" (now `AdicSpaces`), "requested from", "proposed there", "requested where the pinned tree lacks them"; the other roadmaps' atlas node ids (`AdicSpacesPartII:R0/…`, bare `R0/…`, `D6/…`, `P1/…`, 143 label occurrences) are now layer citations in prose. No "(removed)" stubs; the roadmap's own target slugs are kept as its item names. |
| Sources | Pass. 20 table rows sampled over the public sources and confirmed (section below). Bibliography repaired: every author field had been rendered as comma-separated characters. T032 widened to KL I 8.2.22(a),(c). The Huber 1996 rows are not verifiable here (book not public) and are kept as the plan recorded them. |
| Gaps and upward citations | Pass after corrections. The two citations of `ClassicalAdicEtaleCohomology H1:henselian` (tier 10; prerequisite of T139 and T141 and an "imported interface" of A4) are replaced by a new target T154 in A4, stated from Mathlib's `IsAdicComplete.henselianRing`, Wedhorn Corollary 6.4(3) and T135. `PerfectoidQuotients` occurs only in negative boundary statements ("ECD 5.8 is not an input"). `AInfCohomology AI.3` and `PadicHodgeTheory P8` occur only as owners or consumers in boundary text, never as prerequisites. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` ids. |
| Unit tests | Pass. Every definition and construction target carries a "Tests:" clause with at least three discriminating cases (computation, degenerate case, non-example, agreement with the library notion); the Lean file realises 79 of them as `example`s. |
| Lean | Pass. `lean-check` on `Suggested.lean` exits 0 with 361 `declaration uses sorry` warnings and no other diagnostic. Ten signatures spot-checked against their README statements (T001 pushout universal property, T009 strongly sheafy, T010 plus ring of a finite étale algebra, T085 pure dimension core, T092 pseudocoherence, T102 2-pseudoflatness over sousperfectoid bases, T135 direct limits of henselian pairs, T139 uniformisation and finite étale algebras, T138 tower structure, T152 existence of perfectoid torsor presentations): hypotheses present, nothing vacuous, no `True` or `Prop := sorry` placeholder. |
| Own words | Pass. Statements are mathematical specifications with locators; no verbatim passages and no section-by-section source summary. |
| Metadata and intake | Pass. `metadata.toml` added, exactly `topic = "math.AG"`. `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems; no `/home/` paths. |

## Suggested.lean in TauCetiRoadmap form

Rewritten mechanically from the checkpoint (active declarations unchanged except where noted):

- `import Mathlib` plus the 20 Tau Ceti modules used; one module docstring (conventions and design
  choices); `set_option autoImplicit false`; the whole file in
  `namespace TauCetiRoadmap.AdicEtaleGeometry` with `open TauCeti TauCeti.Huber`.
- The wrap did not break resolution except for dot-notation on Tau Ceti types
  (`S.finiteEtale`, `P.uniformization`, `P.toUniformization`, `φ.IsFinite`), which Lean looks up in
  `TauCeti.Huber.Pair`; those 25 uses are now explicit applications, and `comap`/`spa` are
  qualified as `ValuationSpectrum.comap`/`ValuationSpectrum.spa` where `open UniformSpace` had
  captured them.
- Layer and target section comments in README order (`## Layer A0: …`, `### T001. A0/… (kind)`);
  the "stand-in" section is now "Interfaces of AdicSpacesPartII and PerfectoidSpaces used below".
- The checkpoint's 132 placeholder comment blocks (`-- <name>: not stated here; needs …`) were
  removed; their 163 names are listed by target in one closing comment. No `#print axioms`,
  `#eval`, `#synth`, catalogues, `lemma`, packet ids or process comments remain; the unit tests
  keep their one-line `-- test <name> (<kind>) [<target>]` comment naming the README test.

## Duplication against Tau Ceti and the upstream roadmaps

Two sweeps (layers A0–A1 and A2–A4) searched Tau Ceti a91d3aaf by mathematical object
(structure fields, operators, hypotheses) with positive controls (`IsTateRing`, `spaAnalytic`,
`Huber.Pair` all hit), and read the current upstream `AdicSpaces` roadmap (whose scope statement
excludes étale sites, fibre products, completed tensor products, separated/proper morphisms,
formal models and perfectoid spaces) and the profinite/Galois roadmaps. No target duplicates an
existing declaration or upstream item; nothing was removed. Overlaps recorded in the README as
restatements of library lemmas: T008's four point-set items (`spaAnalytic_eq_biUnion_rationalSubset`,
`isTateRing_completion_locTopology_of_mem_generators`, `spaAnalytic_eq_spa_of_isTateRing`,
`spaAnalytic_eq_empty_iff_discrete_separationQuotient`) and T085's dimension items
(`topologicalKrullDim_eq_iSup_coheight`, `topologicalKrullDim_eq_iSup_of_isOpenEmbedding`, and the
difference between the open-subset pure dimension and Tau Ceti's component-wise
`IsPureDimensional`). Partial substrate that implementers should consume rather than redefine, all
already cited as `TC:` prerequisites or named in the layer text: `closedPolydisc`,
`twoSidedRestrictedSubmodule`, `laurentPiece`, `spaCompletionHomeomorph`, `IsTateRing.isOpenMap`,
`isStrictMap_of_isClosed_range`, `restrictedMvPowerSeriesBaseChangeEquiv` (noetherian only).
Mathlib's `GrothendieckTopology.over`/`Point.over` cover the carrier of T033; the identification
`U_ét ≃ X_ét/U` remains the target.

## Source verification

Public PDFs read on 2026-10-09 (title and authors checked on page 1; arXiv versions as in the
README bibliography; Berkeley printed page = PDF page − 10): ECD arXiv:1709.07343v4; KL I
arXiv:1301.0792v5; Scholze, Perfectoid spaces arXiv:1111.4914; Scholze 2013 arXiv:1205.3463v2 and
its erratum; Berkeley lectures (MPIM PDF); Fargues–Scholze arXiv:2102.13459v4; Hübner
arXiv:2405.06435v1; Wedhorn arXiv:1910.05934v1; de Jong–van der Put (EMS PDF, read visually since
the text layer drops digits); Zavyalov arXiv:2409.15516v2; Hansen–Kedlaya (author PDF). Confirmed
rows: T003, T004, T011, T012, T027, T032 (locator; content needs (c) too, now cited), T034, T042,
T065, T077, T082, T086, T101, T114, T116, T119, T120, T140, T141, T151. The new T154 locator
(Wedhorn Corollary 6.4(3), p. 46) was read in the same text. Huber 1996 (H96) rows were not read.

## Corrections made

1. T154 `A4/power-bounded-henselian-along-pseudouniformizer` added (statement, API, three tests,
   table row): rings of definition of a complete Tate ring are ϖ-adically complete, so
   `(A₀, ϖ)` is henselian; `A°` is the directed union of rings of definition, so `(A°, ϖ)` is
   henselian by T135. The non-separated example `ℂ_p⟨T⟩/(T²)` shows why the union argument is
   needed. T139 and T141 now cite T154 instead of a tier-10 roadmap.
2. Planning vocabulary and atlas node ids removed throughout (see the form row above);
   convention 7 restated for the roadmap namespace.
3. Bibliography author fields repaired; T032 locator widened.
4. T008 and T085 API items marked as restatements of the Tau Ceti lemmas they transport.
5. Suggested.lean reshaped as described; `metadata.toml` added; `review.json` written.

## Validation and limits

`lean-check` final run: exit 0, 361 `sorry` warnings, no other diagnostic (417 declarations, 79
examples, 5,108 lines). `intake.py check-files`: 3 files, 0 problems. The shared build used by
`lean-check` has the exact Mathlib pin and a later Tau Ceti checkout than f790474; the 20 imported
Tau Ceti modules elaborate there, which is the evidence available for the prototype.

Acceptance is acceptance of the package specification; the signatures are prototypes. The
accepted plan's 15 gap records (Kedlaya–Liu 2.6.8 inputs, Huber 1996 §§1.8, 2.2.8, 2.5, the
Ribes–Zalesskii example, the corrected-covering conservativity of T064, the Fargues–Scholze
specialisations, Gabber–Ramero) remain the README's stated boundaries; this review does not
claim to close them. The T154 prototype is not in Suggested.lean (its README statement and
tests are complete); nothing else remains.
