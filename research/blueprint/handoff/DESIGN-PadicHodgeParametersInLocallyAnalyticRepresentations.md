# DESIGN-PadicHodgeParametersInLocallyAnalyticRepresentations

Refs #3467. Worker: Codex, session `codex-bLRWOL`. This run claimed only this
job; the claim bot confirmed it before work began.

## Completed design

The four deliverables define the new roadmap, its full target-level packet,
reader and suggested Lean file. All 24 items routed here by PAPER-DING-25 have
explicit coverage. Six layers contain 30 nodes: 4 definitions, 13 constructions
and 13 theorems, with 85 API items, 68 discriminating definition tests and 26
planets (at most six per layer). All implementation statuses are unchecked.
The design pass is complete; none of its layers is mathematically closed.

The plan owns the refinement presentation, endpoint gluing and compatibility
with every refinement, the comparison and kernel, kernel extensions, scalar
characters, parabolic and embedding compatibility, recovery, and the Artinian
universal-extension reformulation. It imports the two entire input theories
required by the issue. It neither develops a full local correspondence nor
plans Ding's global applications. The rank-two kernel is zero.

The reader contains every target's statement, hypotheses, source, proof route
and checks, and every definition/construction's API, uses and at least three
tests. A telescoping block-character identity repairs the false direct-sum
formula used in the comparison proof. Recovery uses equality of relation
subspaces in their fixed ambient space. The universal action preserves tangent
versus cotangent variance and identifies an annihilator, not a quotient.

## Exact unresolved dependencies for the next stage

- **G-LA:** design #3411, `LocallyAnalyticRepresentationsOfLocalGroups`, has no
  roadmap definition, stage or reserved node in this checkout. Contracts
  LA1–LA6 in the packet/reader state the actual category, principal-series
  objects, Ext maps, parabolic and embedding identities, Emerton induction
  and Bernstein-center compatibility needed here. The request filed against
  `LocallyAnalyticDistributions:L0` is explicitly provisional and insufficient.
- **G-TR:** design #3412, `TriangulineVarietyAndItsLocalModel`, is likewise
  absent. Contracts TR1–TR6 specify the actual noncritical Robba objects,
  quotient deformation spaces, modification functor, embedded recovery
  relation, spanning and deformation rings. The provisional `PG.7` request
  is insufficient. Existing `PG.7/relative-category` and `PG.3/herr-ext` nodes
  are consumed only for their stated category/Herr foundations.
- **G-HC:** existing upstream `LieHighestWeight` Layers 7 and 9 own the
  Harish–Chandra and split reductive highest-weight theory. Obtain its exact
  finite-E, scalar-center and embedding-product normalization before closing
  PH.2. The comparison-specific regular tangent calculation uses the
  Vandermonde determinant. Current Tau Ceti already has `hcProjection` and
  dot-invariant containment; neither is re-planned or misidentified with a
  full isomorphism.

When #3411/#3412 land, replace the two filing-stage prerequisites/requests by
the exact supplier nodes meeting these contracts. Do not copy their theory
into this roadmap or regard the filing references as closure. No ownership
moved from a higher-tier roadmap. Packaging must wait for the suppliers and
independent review; there is no remaining local writing task concealed as a
future implementation claim.

## Sources and audits

Used Ding's published, freely available 74-page PDF, DOI
10.1007/s10240-025-00156-2, with the URL, access date and SHA-256 in the source
record. Read the introduction; hypotheses and imported contracts on pp. 9–21;
the modification input on pp. 24–25; relation statements and maps on pp.
30–32; all representation input contracts on pp. 33–47; and the complete local
comparison/recovery/universal-extension arguments on pp. 47–59. The
intermediate higher-intertwining proofs on pp. 25–29 and the global theory
are not claimed audited. Their exact needed input is assigned to TR5.

All text is original paraphrase with theorem, section and printed page
locators. No source passages or PDF files are included. Published numbering
was checked directly: (3.38) is on p. 47, (3.39) on p. 48, and Theorem 3.34
on p. 56. The extraction's drifting labels were not propagated. Nine source
issues record corrections in our own words, without assigning an independent
review verdict. No separate corrigendum was located in the recorded searches.

Read eight elementary declarations at the pinned Mathlib commit and matched
them by full name against the declaration index. Read the relevant reviewed
library coverage and exact existing PhiGamma nodes. Read the current upstream
InductionRestriction and LieHighestWeight roadmap documents and relevant
suggested signatures; checked the newer upstream additions and current Tau
Ceti. Algebraic induction is not substituted for Emerton induction. No build
was run in the read-only upstream checkout.

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors,
  0 warnings; all six layers planned, three gaps and four requests retained.
- `scripts/check_sorry_data.py`: passes.
- `research/blueprint/intake.py check-files`: passes for all five deliverables.
- `lean-check` on the suggested file: exit 0 at the pinned shared build,
  with only declaration-uses-sorry warnings. Memory was checked first; no
  Lean server or other build was started.

The 98-line suggested file has four light real-bodied definitions and
statements/examples over existing Mathlib carriers. Missing analytic/Hodge
carriers stay in the README. It contains no admitted data definitions,
axiomatic stand-in category or auxiliary development. The mathematical API
tests in the reader are specifications, not implemented proofs.

Independent review should examine the three supplier gaps, the repaired
character-spanning step, the fixed ambient identification in recovery, and
the first-order algebra variance. Source texts and working logs are temporary;
all information needed to resume is preserved above and in the deliverables.
