# Handoff: BP-DiamondSixOperations (issue #711)

Agent: **Claude** (Claude Code, model Opus 5.5), session **claude-swurfA**. Date: 6 October 2026.

**Status: complete.** All seven stages in scope (S0–S6) are `planned`; none is `closed`,
because each rests on requested supplier stages that have no blueprint yet and on gaps
recorded by suppliers. The packet goes to its independent review.

## Deliverables

- `research/blueprint/packets/DiamondSixOperations.json`: 90 nodes (9 definitions,
  10 constructions, 66 theorems, 5 lemmas), 140 API items, 72 unit tests, 31 planets
  (at most six per layer), 12 requests, 3 gaps, 3 new source issues, 1 restructure entry.
  `python3 scripts/check_blueprint.py` (with the pinned declaration index): 0 errors,
  0 warnings. The prerequisite graph is acyclic (checked separately; one cycle in the
  two-step proof of ECD 23.12 was removed by citing the strictly-local criteria directly).
- `research/blueprint/readmes/DiamondSixOperations.md`: the reader, generated from the
  packet with a written introduction (conventions, boundaries, sources) and layer overviews;
  about 37,000 words.
- `research/blueprint/suggested/DiamondSixOperations.lean`: 1,482 lines. **It compiled**:
  `lean-check` (`lake env lean` in the shared build at Mathlib 082e2d3) elaborates the file
  with `sorry` as the only warning. Every declaration, API item and unit-test name of the
  packet occurs in it; twenty that need a two-coefficient interface, pasting identities of
  transformations or named concrete objects are listed by name in the file's last section.

## How the file is built

The pinned libraries have no perfectoid spaces, v-stacks or D_ét. The suggested file is
written against one explicit supplier interface (`SupplierContext`), whose fields are the
supplier categories, functors and morphism classes, each documented with its owning stage;
no field asserts a theorem. The roadmap's own notions (compactifiable, locally split,
eligible, spatial-eligible, Rf_! = Rf‾_* ∘ j_!, proper support, invertible objects,
ℓ-cohomological smoothness, dualizing complex, Verdier dual, normalised Haar measure) are
genuine definitions over it; data needing ∞-categorical Kan extensions or the adjoint
functor theorem are `sorry`-bodied data. No `True` placeholders.

## Sources

ECD, arXiv:1709.07343v4 (SHA-256 78ca42bb…3efc, fetched 6 October 2026), §§22–25 read in
full, plus the statements of §§17–21 that the proofs cite. Every excerpt in the packet was
checked mechanically against the PDF text layer (NFKC, whitespace removed): 0 mismatches.
The paper extraction PAPER-SCHOLZE-17 already records, with confirmed reviews, the
misprints and gaps of §§22–25 (E53, E64–E69, E72, E94, E98–E101); the nodes use the
corrected statements and cite those ids. New findings, in `sourceIssues`:

- `DiamondSixOperations/E1` (gap): the proof of Theorem 24.1 applies Proposition 23.10
  without checking that B → * is compactifiable; the check is supplied (B‾ = (R ↦ R°),
  B ⊂ B‾ open).
- `DiamondSixOperations/E2` (gap): Proposition 25.4's "very dense" justification ("cofiltered
  limit of projective varieties") does not give the Jacobson property used; a
  valuation-theoretic proof is given in `S6/closed-points-detect-vanishing`.
- `DiamondSixOperations/E3` (misprint): Proposition 25.4 omits "complete".

## Red-team finding handed to this job

- **RT-AREA-padic-1/11** (canonical compactification owner). D5's text says canonical
  compactifications are in C4, and C4's text constructs them; RS-05's owner entry names D5.
  This packet imports the canonical compactification, properness and partial properness
  from `DiamondEtaleCohomology:C4` (a request, since C4 has no blueprint yet) and records a
  `restructure` entry proposing that the RS-05 owner be corrected to C4, with D5 kept as
  ECD §§11–13 and effective descent attributed to D3. No node of this roadmap constructs
  the compactification.

## RS-05

RS-05 is accepted (independent-review-REV-RS-05) and keeps all seven layers; this packet
follows it: the eligible-class exceptional operations (S3) and cohomological smoothness
(S4) are owned here and VStackSheavesAndLisseCategories VS0 imports them.

## Routed paper items (PAPER-SCHOLZE-17 source route)

Remark 23.14 → `S4/representability-descent`; the Rq^! ≠ q^* computation →
`S5/profinite-quotient-upper-shriek`; Remark 25.5 → `S6/conservativity-counterexample`;
Remark 25.6 → `S6/conservativity-general-coefficients` (conditional, with E101's corrected
example). Item 604 (formal smoothness) stays with VS1, as routed; `S0/locally-split-map`
records VS1's conclusion as a use.

## Requests (supplier stages without blueprints)

DiamondEtaleCohomology C0, C2, C3, C4, C5, C6, C7 (the C0–C7 blueprint is issue #709);
EnhancedDerivedSheaves E0, E2, E3 (including Neeman's criterion; if E3 declines it, it
becomes a lemma node in S4); PerfectoidSpaces P1; the Tau Ceti roadmap ProfiniteProPGroups,
Layer 1. Existing supplier nodes are cited directly: DiamondsAndVStacks D0–D6,
DiamondEtaleCohomology C8–C9, ClassicalAdicEtaleCohomology H3–H5, AdicEtaleGeometry A2.

## Gaps (all three are recorded in the packet)

1. Huber duality over Spa(C, C⁺), C⁺ ≠ O_C — inherited from
   `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`; needed by `S5/ball-smooth`.
2. Lütkebohmert's local compactification over a non-discretely valued C — inherited from
   `ClassicalAdicEtaleCohomology:H5/geometric-curve-compactification-export`; needed by
   `S6/biduality`.
3. ECD's claim that the components of the compactified cover are open in Zariski–Riemann
   spaces (25.4) — taken from the source in `S6/closed-points-detect-vanishing`.

## What a follow-up should do

- When #709 (DiamondEtaleCohomology C0–C7) and an EnhancedDerivedSheaves blueprint land,
  replace the stage prerequisites by their node ids and drop the matching requests.
- At lemma level: split S0/compactifiable-local-on-source along ECD 10.5; state the mate
  calculus of S3/adjunction-calculus against E3's API; prototype the two-coefficient
  signatures listed at the end of the suggested file.

Scratch material (build scripts, ECD text) lived in the job's scratch directory, which is
deleted with the run; nothing here depends on it.
