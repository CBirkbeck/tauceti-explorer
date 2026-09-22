# PAPER-KISIN-MADAPUSIPERA-SHIN-22 handoff

Codex, session codex-c83e7a; issue #1314. **Partial checkpoint.**

The complete 41-page Berkeley author PDF, including Appendix A and references, was read. Its hash and selected original Kottwitz/Rapoport–Richartz read scopes are in the JSON. Final published text was not acquired. The extraction contains 172 stable item IDs, 27 inspected pinned declarations, 73 definition/construction APIs, 219 test specifications, six routes and eight executed exact acceptance checks. All 125 missing items are routed once, and the item graph is acyclic. No Lean file was compiled or formalization claimed.

Resume in this order:

1. Acquire the final Duke text through an authorized public/library route. Compare the source displays listed in the report. Preserve the GL3 counterexample to the normalizer statement and the nonreduced counterexample to Lemma 2.2.11. Only the author-PDF decency endpoint is already repaired against Kottwitz85; do not attribute defects to the final publication without checking it.
2. Close G-local and G-ordinary. N29 now has a proved correct formulation, with w in the absolute Weyl group W(G,T) (Claude Code, cc-fb70e5), and N32's inner-form branch uses it. Resolve the existence of the maximal Newton class and (1.1.3.1) separately. S15–S19 currently retain these hypotheses.
3. Read the Noot09/06 originals. The kernel-factorization step T23 is proved with the corrected auxiliary group G×_{G^ab}T (cc-fb70e5); its remaining inputs are Noot and Corollary 2.1.9. Verify the all-primes Noot input used by T16 independently of the later theorem T20. Prove the Tannakian functor S11 without equating a proper monodromy subgroup with G.
4. Close Appendix A from its original Faltings, Ogus, de Jong and Madapusi Pera sources. The entire main-paper appendix is read, but those proofs are not. Preserve horizontal/vertical log structure and convergent/overconvergent distinctions.
5. Close global transfer and Hasse hypotheses, finite-field Tate including p, the normal-model extension and density component argument. Split remaining grouped source contracts into declaration-sized nodes, replacing generic proof sketches with complete named dependencies and exact supplier-node requests.
6. Reconcile the reused AbelianSchemesFiniteFieldsPartII candidate with PAPER-SMITH-24. It is a prior checkpoint proposal, not an accepted supplier. Keep the generic Hom/End API at A6, the finite-field comparison at that continuation, B(G) at BG0/BG1, and PEL group/Hasse calculations at M3. Do not create parallel owners.

Conjecture 2.3.4 is intentionally conditional for general Hodge type. Completion requires correctly extracting that hypothesis, not proving the conjecture. PEL A/C, type-D disconnected and unpolarized statements have distinct scopes. Keep every item's implementation status unchecked.

Validation to repeat after edits:

```text
python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.md research/blueprint/handoff/PAPER-KISIN-MADAPUSIPERA-SHIN-22.md
```

Explicitly check all three files exist: the intake path checker alone does not guarantee that. Re-run the report's exact Python certificate and verify the item graph, API/test coverage, pinned-reference coverage and one-route-per-missing-item invariant. Refresh atlas input hashes before submission. Mark complete only after original-source closure, source discrepancies, owner refinement and remaining declaration splits are resolved.

Continuation log: Claude Code, cc-fb70e5, 22 September 2026. Corrected and proved N29, updated N32, and proved T23 with the fibre-product repair. No routes or other items changed.
