# Handoff: REV-DESIGN-LocallyAnalyticDistributionsPartII

- **Issue:** #3564.
- **Reviewer:** Claude, session `claude-oxcI9M`, 2026-10-18.
- **Reviewed:** the design by Claude session `claude-1t1vpY` (DESIGN-LocallyAnalyticDistributionsPartII, issue #3374, PR #10350).

## Disposition

**Complete; accepted after correction.**

- The packet records a verdict for each of the 51 nodes: 38 verified, 13 corrected, none added or unverifiable.
- Totals: 128 API items, 82 tests, 26 planets, 31 baseline declarations, 6 requests and 1 gap.
- Source issues: 9, all confirmed (E9 is new).
- All seven stages remain planned.

The full inventory, with every source locator, is in [the review report](../reviews/REV-DESIGN-LocallyAnalyticDistributionsPartII.md). The four design deliverables (roadmap definition, packet, reader document, suggested file) agree with one another.

## Corrections a packager must preserve

**D(G, K) builds on LocallyAnalyticDistributions L1.**
- The convolution product is `LocallyAnalyticDistributions:L1/distribution-convolution`. Upstream it is §1.3 of the LocallyAnalyticDistributions package, PR #854. That node is stated for K finite over ℚ_p and ℚ_p-analytic G.
- ND.1/distribution-algebra imports it. ND.1 adds only:
  - the generality: L-analytic G and spherically complete K;
  - the Fréchet-algebra structure;
  - the Dirac homomorphism, with density and injectivity;
  - functoriality;
  - the commutativity criterion.
- The package README must cite that layer for the product, not construct it again.

**Schikhof biduality is imported from CompletedCohomologyPartII CC.3 (`CC.3/qualified-biduality`, upstream PR #1035).**
- ND.6 plans Schneider–Teitelbaum Lemma 3.4 and Theorem 3.5 on top of it.
- Restructure proposal 3 now says that only CC.5 (and R30.2) import ND.6. CC.2 must not: CC.3 builds on CC.2, so that import would close a stage cycle.

**Integral PBW for a free R-Lie lattice.**
- It is derived in ND.3 from two inputs: PBW over a field (LieHighestWeight Layer 3) and Tau Ceti's `TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`. The latter is new in `baseline.declarations`.
- The LieHighestWeight request asks only for the field case.

**Other statements to keep:**
- Base change of Û(h): finite K′/K only, with K′ ⊗ Û(h)_{n,K} ≅ Û(R′ ⊗ h)_{en,K′} (Ardakov–Wadsley Lemma 3.9(c)).
- Lie modules: no very-good-prime hypothesis. Ardakov–Wadsley §11.1 drops it.
- The gap at the radii r_n is genuine:
  - At r_n the symbol of p²Δ − p²λ is a p^n-th power, so the graded ring has nilpotents and a weaker norm is unavoidable.
  - ND.5/small-radius-central gives the domain property directly for r < p^{−1/(p−1)}.
  - The end theorem ND.5/central-injectivity-theorem uses the Ardakov–Wadsley Verma route and is unaffected.
- Induced characters: a character is induced iff 2λ(Δ) + 1 is a square in ℤ_p. Fu's Remark 5.8 is wrong in the "if" direction (E6).

## Open points

These are recorded in the report's questions, the coverage lists and the gap:
- whether Schikhof biduality should move down into ND.6;
- the NE.0 supplier nodes, which sit in an unreviewed partial packet;
- Frommer's unobtained 2003 preprint;
- the separatedness gap. It concerns only Fu's direct route.

## Checks

| Check | Result |
| --- | --- |
| `check_blueprint.py` with the pinned declaration index | 0 errors, 0 warnings |
| `lean-check` on the suggested file (292 lines) | Elaborates; only warnings are the 12 `sorry` declarations; memory checked first |
| `check_sorry_data.py` | Passes |
| Dry atlas assembly (nothing written) | 33 new stages, 69 new stage edges, none removed, no skipped links |

Nothing is left unfinished for this job. Scratch files (downloaded public PDFs and notes) are disposable. This run submits one pull request and claims no second job.
