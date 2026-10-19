# DESIGN-CstConjectureForDaggerVarieties

Agent: Codex, session `codex-0H4jiN`. Job: #3445. Branch:
`codex-0H4jiN-cst-dagger`. The claim was confirmed by the bot on 19 October
2026, after [the claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/3445#issuecomment-6264606768).

This is a complete target-level design pass, ready for independent review.
It is not a checkpoint or a mathematical implementation. CS.0, CS.1, CS.2,
CS.3, CS.4 and CS.5 are all **planned**; none is closed. Every implementation
status remains unchecked. General smooth-dagger comparison, universal
small-variety acyclicity and unrestricted recovery remain conjectural.

## Delivered

The roadmap definition, packet, reader and suggested Lean file agree on a
six-layer build order. There are 46 targets: five definitions, six
constructions, 32 theorems and three applications. The eleven definitions and
constructions have 55 API items, 33 unit tests and recorded consuming uses.
There are 29 planets, with at most six per layer, and six exact pinned
baseline citations. All 74 items in the paper extraction's route to this
roadmap are accounted for individually, without adding unrelated source
results.

The reader states the actual heavy mathematical objects and their proof
obligations. Under the fixed roadmap shape in WORKERS.md dated 12 October
2026, the suggested Lean file contains only ten examples on existing pinned
carriers and conventions. It introduces no replacement dagger, qBC, bundle
or period carrier and encodes none of the 46 new targets. The examples check
the two existing period-ring carriers, three bicartesian squares, a
difference-map sign, freeness, finite generation and the bundled module
carrier. This limitation is also recorded as G-LEAN.

## Remaining mathematical obligations

Eight explicit gaps terminate the unestablished prerequisite chains:

- **G-ANALYTIC:** the model-free analytic HK, filtered de Rham, syntomic and
  pro-étale package, with strict comparison, natural functor realizations,
  slope bounds and derived exhaustion descent.
- **G-QBC:** the natural Topological Vector Space category, reasonable Pairs,
  qBC curvature filtration, height and countable-limit interfaces. Finite
  Banach–Colmez theory alone does not supply these.
- **G-PERIOD-HOM:** bounded-image Hom and torsion Ext vanishing, the relation
  between VS and natural TVS Hom, arithmetic vanishing, and the smaller
  admissible filtration with the same bounds.
- **G-GEOMETRIC:** C-valued finiteness and Künneth, algebraic HK comparison,
  global proper-pair resolution, logarithmic comparison and the filtered
  tube comparisons.
- **G-ETALE:** proper rigid integral finiteness/perfection and proper base
  change, plus the specified completed quasi-compact comparison.
- **G-FA:** strict strong-dual exactness and bidual continuity required by
  the qualified extension-duality input to Proposition 7.15. This is confined
  to the splitting branch, not an input to the main comparison or recovery.
- **G-CRIS:** the stronger positive crystalline Hom equality in Remark
  9.9(ii), including the exact positivity criterion or a justified
  B_max⁺ passage. A bounded t-denominator sandwich does not establish this
  refinement. The generic recovery theorems do not depend on it.
- **G-LEAN:** actual heavy carriers and comparison interfaces at the pins.

Eight requests are recorded in the packet, to VB1; VB3:general-BC; R06.2;
CP.4; AdicSpacesPartII:F1; L0; ClassicalAdicEtaleCohomology:H3; and R06.1.
Requests to a narrower existing owner are explicitly routing or extension
requests. They do not assert that its existing stage supplies the missing
theorem. No dependency edge is invented for an undefined proposed Part II.
The three restructuring proposals separate generic qBC theory, model-free
analytic comparison, and the functional-analysis extension from this
roadmap's specific cohomological constructions. In particular, the existing
noncommutative distribution-algebra Part II is not the functional-analysis
supplier.

## Sources and overlap checks

The primary source read was Colmez–Nizioł's 61-page
[CN5 author manuscript](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf),
compiled 24 November 2024, with formulas checked against the public
[arXiv v4 source](https://arxiv.org/src/2108.12785v4). Source versions, access
date, checksums, locators and correction searches are in the packet. The
publisher version was not consulted. The fifteen source findings are scoped
to those author/preprint versions and await independent review and journal
collation. E14 inherits the reviewed functional-analysis qualification; E15
records an unestablished positivity step, not a claim that its result is
false. No source passage is reproduced.

CN Part I's analytic comparison and the Bhatt–Hansen proper-base-change
input were not independently verified; their exact contracts remain gaps.
No private reference-library book was needed. Supplier packet statements
were read before use, including their narrower hypotheses and outstanding
gaps. The current upstream AdicSpaces and AlgebraicVectorBundles reader
documents and Suggested declaration inventories were read at roadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; the other new roadmap scopes were
screened for overlap. The pinned libraries, the reviewed library audit and
current Tau Ceti sources were searched. Existing ordinary adic and vector
bundle foundations are imported. Current Tau Ceti was read at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Validation and where to resume

- `scripts/check_blueprint.py` passes with zero errors and zero warnings.
- The submission file checker passes for all five deliverables.
- Exact route accounting and statement/API/test agreement across packet,
  roadmap and reader were checked. The reachable declaration graph has 941
  nodes and no cycles.
- `lean-check` elaborated the suggested file at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`, with no errors or warnings.
  These are baseline convention examples, not formalized comparison results.
- Whitespace and changed-path checks pass. Only this job's five deliverables
  are submitted.

Independent review should first check the natural-functor meaning of
geometric Hom (Definition 4.1), the corrected difference-map sign, the
proper-factor perfection in Lemma 8.13, and the qualified splitting and
positive-crystalline branches. Follow-up mathematical work should resolve
the eight owner contracts above, instantiate genuine heavy carriers, and
prove the targets with their stated topologies, ranges and functoriality.
Nothing is promotion-ready merely because the design and Lean convention
checks pass. The packet and reader contain all information needed to resume;
no scratch file is required.
