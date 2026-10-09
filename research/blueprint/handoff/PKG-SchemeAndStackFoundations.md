# PKG-SchemeAndStackFoundations — complete package

Worker session `cc-d4636b` (Claude Code), 9 October 2026, branch `cc-d4636b`. Packaging run
under the short pipeline (no issue, no GitHub interaction). Deliverables:

- `research/blueprint/packages/SchemeAndStackFoundations/README.md` (198.6 KB; the hard cap is 200 KB)
- `research/blueprint/packages/SchemeAndStackFoundations/Suggested.lean` (474 KB, 156 imports)
- `research/blueprint/packages/SchemeAndStackFoundations/metadata.toml` (`topic = "math.AG"`)
- this note

## Inputs and how they were folded

- Base packet `SchemeAndStackFoundations.json` (303 nodes: SF.0 217, SF.1 31, SF.2 55; 232 of
  them are declaration-sized `lemma` nodes in nine modules, 71 are definitions, constructions and
  theorems). Follow-up packets SF.0 (110 nodes, partial), SF.1 (57, partial), SF.2 (85), SF.3 (26),
  SF.4 (57); SF.6 (process layer, 0 nodes, nine consumer contracts S1–S9). No node id or Lean name
  is shared between the base and a follow-up packet.
- SF.5 has no packet. Its sixteen targets (T421–T436) were written at target level from the atlas
  stage description, the base packet's SF.5 inventory (which fixes the Mathlib `AlgebraicCycle`
  carrier and Tau Ceti's divisor class group as the baseline) and the sources that description
  names: Fulton, *Intersection Theory* (§§1.3–1.8, 2.1–2.5, 3.1–3.2, 5–6, 8.1–8.4, 12.3, 15.1–15.2)
  and Hartshorne V.1 (Theorems 1.1, 1.6, 1.9, 1.10, Proposition 1.5, Exercise 1.10). These locators
  are from the texts themselves; neither book was re-read during this run (both are not freely
  downloadable), so a reviewer should verify the chapter/number citations against a copy.

## What the README is, and what it could not carry

The seven packets total about 640 nodes with statements averaging 500–700 bytes, roughly 950 KB
if rendered the way the accepted packages render a target. The README therefore selects:

- **Full entries** (statement, exact hypotheses, API names, three checks, source locator,
  prerequisites) for every **definition** of every packet (26 base + 66 follow-up = 92) and for the
  sixteen SF.5 targets. Statements are cut at a sentence boundary after about 160 characters and
  hypotheses after about 55; API and check statements are truncated with an ellipsis. The packets
  remain the complete record of each statement.
- **One-line entries** (identifier, title, principal source locator) for the 314 constructions,
  comparisons, applications and theorems of the follow-up packets and of the base packet. The
  README's conventions state that such a target is specified by its locator and the cited
  statement's hypotheses. This is the main thing the README could not support in 200 KB: the
  exact hypotheses of the ~190 follow-up theorems are in the packets, not in the README.
- **Lemma strands** (14): each base module of declaration-sized lemmas (henselization 22 lemmas,
  flat annihilator 7, finite cokernels 12, five ideal-sheaf modules totalling 136, excellence 30,
  algebraic spaces 14, Galois gerbs 15, Brauer 23, coherent duality 17, equivariant 12) is one target
  listing the first eight lemma titles and the count of the rest; prerequisites that point at a
  lemma inside a strand resolve to the strand's number.
- Targets are numbered T001–T436 in build order; internal prerequisites are written as T-numbers,
  Mathlib and Tau Ceti declarations by name (the first two, with a count of the rest), Tau Ceti
  roadmap layers by roadmap and layer. One internal prerequisite did not resolve:
  `SF.0/henselization` is cited by a base node but is not a node of any packet (the base packet's
  carrier is `SF.0/henselization-of-pair` and `key/henselization`); it is rendered by its slug.
- Grouping: follow-up nodes are grouped under their reader's sub-sections (SF.0 §1–§9,
  SF.1a–f, SF.2a–g, SF.3a–d, SF.4a–e); base nodes by module. SF.3b (vector bundles and duality)
  received no nodes under the matching heuristic; its nodes sit in SF.3a/SF.3c and "Further targets".
- Source ids of the packets (some of which carry run identifiers) are replaced by author–year
  labels or "Stacks" plus the locator; the bibliography lists the 53 sources actually cited.

## Moved-down notions and citation rewrites

- The base packet cites `PerfectoidSpaces:P3/henselisation-of-pairs` (tier 3) and
  `DeformationAndDerivedPatchingAlgebra:R03.3/catenary` (tier 10). Both are SF.0 targets in the
  README (the SF.0 follow-up's `SF.0/henselization` strand and `SF.0/catenary-ring`); the two
  citations are rewritten to those targets.
- The SF.4 packet records as owned here (formerly higher roadmaps): de Jong's alterations
  (formerly AdicCoefficientsAndComparisons L5), the moduli stack of stable pointed curves with its
  finite cover (formerly StableReductionPartII MC.0–MC.4 and AlgebraicModuli R09.4), Hilbert and
  Quot schemes and Chow's lemma (formerly R09.2), formal schemes and algebraization (formerly
  AdicSpacesPartII F0), deformation functors and Schlessinger (formerly R03.2). The SF.3 packet
  moves down Picard torsors without a point and the Picard–Brauer sequence over a field (from
  JacobianChallengePartII) and rational divisor classes on hyperelliptic curves (from
  NeronModelsAndSemistableAbelianVarieties R11.4). The SF.2 packet moves down site-cohomology
  functoriality (from DiamondsAndVStacks D0) and étale cohomology of limits (from
  AdicCoefficientsAndComparisons L2). All are stated as targets of the respective layer.
- New in this package: **projective bundles with `O(1)` and the splitting principle** (T427) are an
  SF.5 target. The base packet's rescope note had SF.5 importing them from
  AlgebraicModuliForArithmeticGeometry R09.1 (tier 4, above this roadmap).
- `UPSTREAM:CohomologicalPointCounting:*` citations (SF.3 packet, four of them) and the SF.2
  packet's `upstreamIntegration` table are written as the Tau Ceti roadmap family
  CohomologicalPointCounting (ConstructibleEtale, EtaleBaseChange, CompactSupport,
  EllAdicRealization, FrobeniusGeometry, ComplexComparison, TraceFormula) with layer numbers.
  `FoundationsAndLibraryIntegration` stage ids do not occur in any node prerequisite; the atlas
  stage inputs LI.1/LI.3 are rendered as the Mathlib items they stand for in the layer intros.
- SF.6 is written as the nine interface contracts of its packet (carriers, hypotheses, checks,
  sources), with no declarations, as the brief directs.

## Lean

`Suggested.lean` joins the six suggested files (base, SF.0–SF.4) under one header and one import
block of 156 modules (all compiled in the shared pinned build; no import was dropped). Each file
is wrapped in a `section` so that its top-level `open`/`universe` declarations stay scoped, and the
scopes a file leaves open at its end are closed. Two mechanical changes to the active code were
necessary:

1. Inside `namespace TauCeti.*`, `open AlgebraicGeometry` (and `CategoryTheory`, `Opposite`,
   `TensorProduct`) resolved to `TauCeti.AlgebraicGeometry` once the SF.3 imports were present;
   every such `open` now reads `open _root_.AlgebraicGeometry` etc.
2. The SF.0 and SF.1 suggested files restate nine declarations of the base file for standalone
   elaboration (`IdealPullback.extendedIdeal_restrict`, `quotientRestriction`, `quotientPresheaf`,
   `extendedIdeal_comp`, `quotientCompNatIso`; `Spaces.RepresentableDiagonal`, `EtaleAtlas`,
   `IsAlgebraicSpace`, `IsAlgebraicSpace.of_scheme`). The restatements are removed, with a comment
   at each site; the base declarations serve. The SF.0 `quotientCompNatIso` restatement used the
   abbreviation `preimageFunctor` for the functor the base writes inline; the two are reducibly
   equal and the downstream uses elaborate.

The SF.6 suggested file contributed only its two imports (its `#check` lines were not carried
over). A closing comment block names the SF.5 and SF.6 targets, none of which is typed.

`lean-check research/blueprint/packages/SchemeAndStackFoundations/Suggested.lean` (the swarm tool,
Tau Ceti f790474 + Mathlib 082e2d3): **exit 0, 0 errors, 935 warnings, all `declaration uses
sorry`**, no other warning. The checked file's SHA-256 before the final comment block was
`d3e8eda74ab736ef84a33ac0137c4a89304bee6f3ce1a13f5858cea676e3fbca`; the file with the comment block
was re-checked with the same result: exit 0, 0 errors, 935 `sorry` warnings and no other
warning; its SHA-256 is `a809a31810dba2dcc138` (prefix) and it is the committed file.

`python3 research/blueprint/intake.py check-files` on the three package files: 3 files, 0 problems.
No `/home/` path occurs in any deliverable.

## Open points for the maintainer

- The README's one-line targets carry no hypotheses of their own; if the cap is ever raised, the
  follow-up theorems' hypotheses (in the packets) should be the first thing restored.
- SF.5's statements are the standard Fulton/Hartshorne forms, written from memory of the texts;
  verify the numbered locators. T433's Noether formula is stated with the ℓ-adic Euler
  characteristic as a hypothesis, not proved.
- The SF.0 and SF.1 follow-up packets are `partial`; their remaining targets (the coverage notes in
  the readers) are not represented in the README beyond what the packets contain.
- The package does not resolve the base packet's unaccepted rescope proposals (SF.5 inputs, the
  SF.4 → SF.5 edge); the README's SF.5 cites SF.3, SF.2 and SF.4 targets as its inputs, which is
  what the rescope asks for, but the atlas edges were not edited.
