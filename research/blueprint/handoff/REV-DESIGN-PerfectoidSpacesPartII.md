# Handoff: REV-DESIGN-PerfectoidSpacesPartII

Issue #3590; Codex, session `codex-mBPzIL`; 2026-10-18. Independent review of Claude session `claude-SuIpdS`'s design (#3480).

## Disposition

**Complete; accepted after correction.** The packet records all 50 per-node verdicts: 26 corrected, 24 verified, none added or unresolved. Final totals are 131 API items, 81 tests, 15 planets, 21 baseline declarations, 14 confirmed source issues, three ownership proposals, and no gaps or requests. All six stages remain planned, none closed. The review report is [REV-DESIGN-PerfectoidSpacesPartII.md](../reviews/REV-DESIGN-PerfectoidSpacesPartII.md); it contains the full correction inventory, baseline audit, source-version distinctions and checks. The four design deliverables agree.

## Corrections a packager must preserve

- Laurent localisation uses the full Tate-algebra quotient norm. The published one-parameter infimum fails on `K × K`. Spectral points prove limit injectivity and closedness of the defining ideal; individual annular restrictions need not be injective.
- The annular-envelope trace proof puts `A[1/g]` in the algebraic inverse limit, not the bounded uniform limit.
- Nested-system almost `lim¹` vanishing uses the explicit weighted Roos recursion after almost elements; the P0 theorem about termwise almost-zero modules is insufficient on its own.
- Free Kummer root algebras retain all branches and may have zero divisors, even for a unit radicand. Their integral closures are relative to the specified ambient algebras. The wrong coordinate-root formula is replaced by the valid `j = 0` case.
- `IsIntegralClosure.finite` at the pinned Mathlib supplies finite normalization of the characteristic-zero field factors; each finite relative closure is an A-submodule of that finite normalization. For complete integral closure of the union, fix one finite generic stage containing the almost-integral element and its regular multiplier, then embed `A[x]` into that stage's finite integral model by multiplication. Do not try to descend infinitely many power relations simultaneously.
- The cyclotomic completion is handled for arbitrary perfect residue field; the finite-Q_p supplier is not used outside its hypotheses. Generic Banach completion is completion of a unit ball followed by inversion of p.
- The Noetherian tube lemma requires `j ≥ k` and `g_k` in the coordinate base, independent of the auxiliary Tate variable. The explicit monic special fibre is free. Complete over each fixed finite Noetherian base stage before passing to flatness over the coordinate union.
- An unramified finite étale algebra is recovered by the Abhyankar envelope only after root saturation and coreflection; the added characteristic-p example shows possible strict enlargement. Apply integral almost étaleness to the perfectoid coreflection.
- The Krull detection input is `Module.annihilator`, not `Submodule.annihilator`. Linear functors are explicitly additive as well as scalar-compatible.

## Suppliers and ownership

All 45 distinct direct supplier nodes were read. With the public checker's resolution order, the reachable dependency graph has 263 nodes and no cycles. Several detailed PerfectoidSpaces P0–P3 imports are still in a packet reviewed `needs_changes`; they are planned dependencies, and this acceptance does not declare that package ready or bypass upstream dependency requirements. Completion suppliers are used only over Noetherian bases. The affinoid-envelope target separately assumes a nonzero discriminant making its fixed finite normalisation étale after localisation.

Retain the existing three ownership proposals. DirectSummandsAndBigCohenMacaulay should import pure/almost-pure maps and Krull detection from RA.5, together with its Kummer and ramified-flatness conclusions and Bhatt's RA.1 input. Almost-pro-zero towers and almost Galois extensions belong here in RA.0 and RA.4. The arbitrary-ideal characteristic-p Hebbarkeitssatz remains in PerfectoidShimuraVarieties. No other job's files were edited.

The current read-only upstream roadmaps and Tau Ceti library were checked, including the nine roadmaps newer than the atlas snapshot. Existing Huber, Witt-vector, uniformization and completed-tensor infrastructure is imported. No repository was cloned or copied, and no build was run in the upstream read-only checkouts.

## Sources and checks

Primary-source URLs, editions, hashes and theorem/section/page locators are in the packet, roadmap and report. E11–E12 are newly checked substantive source errors. E13 is the already-extracted Hom_R/Hom_S typo. E14 distinguishes the erroneous arXiv v1 module formula from the already-correct published Annexe A.4. The cleared Gabber–Ramero copy was read only for Lemma 2.4.2, pp. 22–23; no file or source passage was copied into the repository or scratch.

- Packet validator: 0 errors, 0 warnings.
- Suggested Lean file: `lean-check research/blueprint/suggested/PerfectoidSpacesPartII.lean` passed, exit 0, with 21 warnings, all uses of `sorry`; 290 lines, real-bodied light definitions, no sorry-filled data definition. Memory was checked before compilation. Elaboration does not prove the statements.
- Reader agreement: every node statement, hypothesis, proof step, API item, test and acceptance check is present; each definition/construction has at least three tests.
- Dependency graph: no cycles; all direct inputs resolve. Whitespace check passes.

There is no unfinished work or blocking question for this job. Next work is the programme's package step once its dependency conditions are met. Scratch notes and downloaded public papers are disposable; all information needed to continue is recorded here and in the review report. This run submits one PR for this issue and claims no second job.
