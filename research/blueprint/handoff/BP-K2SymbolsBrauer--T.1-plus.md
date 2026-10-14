# BP-K2SymbolsBrauer--T.1-plus

Completed by Codex, session `codex-9L3lGH`, on 2026-10-14. This is the single job claimed in this run: issue #9307. The claim bot confirmed comment 6158373313. Branch: `codex-9L3lGH-k2-plus`.

## Deliverables and coverage

The packet, reader and suggested file are the three `K2SymbolsBrauer--T.1-plus` deliverables. Scope is exactly `K2SymbolsBrauer:T.1:plus`, part `T.1-plus`. Packet status is `complete`; the stage is `planned`, not `closed`, because of the explicit supplier requests.

There are four new nodes: two constructions and two theorems; 11 API items; eight unit tests; two planets; 14 baseline declarations; zero new local gaps; two supplier requests. Every implementation status remains `unchecked`.

The inherited packet's plus-stage remainder was a process marker for independent review. Its mathematical targets `K2SymbolsBrauer:T.1/k2-h2-elementary` and `K2SymbolsBrauer:T.1/k2-pi2` are retained by id, never copied or edited. This pass adds the named normalised map and its API, its naturality and compatible-model squares, and transport into the projective-module K-space. It performs no review of the inherited work.

The normalisation is χ=ρ⁻¹κ, with ρ=κ_Fδ and δ the explicit positive loop-space connecting map of H.2. Fibre paths run from i(z) to the target basepoint. The same inherited Hopf-kernel convention is used for both universal central extensions. This avoids treating a natural isomorphism as unique merely because it is natural. The negative-map control and the zero-ring test distinguish plausible wrong interfaces.

The inherited Hurewicz proof is also specified under `inheritedTargets`, with its maps and prerequisites, instead of duplicating it as a new node. It uses the universal cover, quotient-regular local coefficients, the bar comparison, and the existing upstream natural Hurewicz theorem. No equality between the independently chosen fibre and cover composites is asserted. Such an equality is not needed for the inherited natural-isomorphism target and would require additional orientation bookkeeping.

## Supplier contracts and boundaries

1. `GeneralAlgebraicKTheory:K.2:plus`: the actual split-exact category of finite projectives, functorial Q K-space, natural zero-component equivalence, the component inclusion on based π₂, ring-map/block-sum squares, and the ring plus H-space structure. Scalar extension requires no flatness. No global natural K₀ product splitting is requested.
2. Tau Ceti `AlgebraicTopology`, Stage 8: its already planned natural absolute degree-two Hurewicz map on simply connected CW models, with the upstream orientation convention. This supports the retained inherited cover proof; it is not a new Hurewicz roadmap.

The late `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` and `KU-pluscomparison` are consumers, never suppliers. No notion moved between owners and no restructure is proposed. Generic plus, fibre and cover theory keep their current owners.

Inherited proof boundaries remain inherited. In particular, the classical packet's associative-ring matrix, stabilisation and related algebraic gaps are not discharged here. The generic H.3 results are imported at their stated interfaces, not claimed implemented. The finite-rank deduction discussed in inherited source finding `K2SymbolsBrauer/E2` is not used; only the stable UCE statement is an input. No new source error is asserted.

## Sources and library checks

Read the author-hosted Weibel chapter III, pp. III.36–38, for UCE uniqueness, Hopf kernels and the stable Steinberg theorem. Read chapter IV, pp. IV.2–7, Exercise 1.8 on pp. IV.14–15, cofinality on pp. IV.44–45, and the split-exact plus/Q argument on pp. IV.61–64. Read Hatcher Proposition 4.1 and proof, p. 342; Theorem 4.32 and proof, pp. 366–367; and the absolute Hurewicz map and naturality, p. 370. The packet contains exact public URLs, hashes and access date. There are no missing sources for these local statements, no source excerpts, and no source files in the deliverables.

Read the reviewed audit for the stage. Read the exact inherited classical nodes and the generic H.1/H.2/H.3 interfaces used. Baseline declaration statements were checked in the pinned source trees: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The current read-only upstream roadmap checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the algebraic-topology and completed universal-covers documents and inspected the relevant suggested declarations. Screened the nine newer roadmap directories specified by WORKERS and the current library for the comparison objects. Existing homotopy-group maps, model equivalences, basepoint transport and covering comparisons are imported. Lie-theoretic Steinberg endomorphisms are unrelated. The web design search found an old Lean Zulip K-theory discussion, not a competing implemented comparison; no current-library absence claim relies on that old discussion.

## Suggested file and validation

The compact suggested file follows the binding WORKERS shape. Its only definitions are real-bodied compositions over actual kernel, homology and homotopy-group carriers. It does not build stable groups, spaces, exact categories or topology. It gives normalisation, uniqueness, inverse and naturality composition signatures, actual homotopy-equivalence transport, and representative examples. The closing comment enumerates the omitted ring-level targets whose carriers are unavailable at the pins. Conditional composition signatures are not evidence that their supplier hypotheses have been proved.

The initial file elaborated through `lean-check` at the pins, exit 0, with only expected admitted-proof warnings. Final elaboration and intake results are recorded below before submission.

The independent reviewer should check the fixed connecting-map convention against H.2, verify the UCE restriction equation and both naturality squares, and check the early/late K-space dependency direction. There is no unfinished local decomposition to resume. Supplier implementation and the independent review remain distinct work; no second job was claimed.

Final validation on 2026-10-14:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.1-plus.json`: zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: four files, zero problems.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.1-plus.lean`: final 148-line file elaborated at the pinned shared build, exit 0; only admitted-proof warnings. Memory was checked before each invocation; neither invocation overlapped another invocation from this worker.
- New ids are distinct from the inherited packet; both constructions have four discriminating tests; only the four authorised deliverables changed. Whitespace checks passed.
