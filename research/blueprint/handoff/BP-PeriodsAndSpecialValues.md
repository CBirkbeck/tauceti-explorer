# BP-PeriodsAndSpecialValues — whole-scope plan

Issue #10923. Codex, session `codex-p5fj9X`, 2026-10-19. Branch `codex-p5fj9X-periods-special-values`. The bot confirmed the claim at issue comment 6268165932. This submission completes one planning job; no second issue was claimed.

## Deliverables and existing work

The missing whole-scope packet now covers PS.0–PS.9 with `part: null` and status `complete`. All ten coverage records are `planned`, none `closed`. Completion describes planning coverage, not implementation or discharge of the supplier obligations.

Before this job, main already contained the independently accepted packets `PeriodsAndSpecialValues--PS.0.json` (PS.0–PS.7) and `PeriodsAndSpecialValues--PS.8.json` (PS.8–PS.9), and the combined reader and suggested file assembled in PR #10611. Their mathematical targets are retained. The whole-scope packet's `targetImports` lists their exact stable IDs by layer. Its `nodes` is empty because the declaration owners already exist: `check_blueprint.py` rejects defining the same node ID in two packets and permits coverage realized by another packet of the same roadmap. Copying the nodes or inventing replacement IDs would duplicate the plan.

The imported plan contains **79 targets**: 24 constructions, 20 theorems, 19 definitions, 4 applications and 12 comparisons; **185 API items, 137 tests and 34 planets**. The whole-scope packet introduces **zero new nodes**. Counts by layer are 5, 8, 3, 4, 4, 4, 7, 4, 17 and 23. The combined registry contains 32 distinct pinned declarations, 22 sources, 25 supplier contracts and 12 explicit proof/interface obligations. Five supplier contracts consume existing EllipticCurves exports rather than request new mathematics.

The reader now links the whole-scope manifest and both owner packets and explains that relationship. Source findings E1–E7 retain the first part's identities; whole-scope E8–E11 correspond to the second part's qualified E1–E4. Each renamed finding records its inherited identity. The accepted reviews remain provenance of their original parts; this packet carries no new independent-review verdict.

The suggested Lean file now has 462 lines. Three additional native away-localization examples state the unit relation, inverse evaluation and evaluated product. They use existing ring, algebra and localization carriers and the supplied effective evaluation map. They do not construct geometric motives, Nori fibres or integration. All heavy target contracts remain in the reader, following WORKERS.md's compact-suggested-file rule.

## Required mathematical boundaries

**RS-13:** its accepted narrowing of PS.1 is retained. Motivic completion, criticality and the Deligne/geometric adapters remain here; generic analytic, Gauss/Bernoulli and automorphic formulas are imported. No layer was dropped by this restructuring.

**RT-AREA-iwasawa-3/8:** the current accepted MC.6 supplier already owns the effective presentation, distinguished Tate symbol, localization and full comparison-algebra equivalence. The older issue brief's ownership instruction is reconciled with that existing supplier: PS.2 imports `MC.6/formal-periods` and `MC.6/formal-periods-equal-comparison-algebra`, then owns actual integration evaluation and its compatibility with the genuine comparison point. The three PS.2 targets require `P = P_eff[L⁻¹]`, `per(L) = 2πi ≠ 0`, `per(L⁻¹) = (2πi)⁻¹`, the unit relation and the rank-one Laurent model `Q[t,t⁻¹]`. The actual relative-pair/Stokes/product comparison is explicitly requested from C5. PS.9 imports that same full evaluation point. Brown's nonnegative-weight H retains nonzero motivic zeta(2) and its A tensor H coaction.

**BCGP addition:** the imported PS.1 nodes include strict compatibility at coefficient primes, local Weil–Deligne factors, the chosen infinity normalization, the conductor, equations (2.8.4)–(2.8.5), the epsilon/dual-conductor relation, all-degree abelian Hasse–Weil factors, point counts, Conjecture 2.8.6 and its conditional Corollary 2.8.7, and Conjecture 1.1.1. Source finding E1 retains the corrected cohomological exponent. Conductor, all-degree compatibility and global duality supplier requests remain explicit.

**LTXZZ addition:** PS.6 retains the all-coefficient-place BBK rank prediction and the distinction between derivative nonvanishing and a nonzero Abel–Jacobi class. Source-qualified rank-zero/one theorem witnesses require the full admissible-place predicate, the stated field and level hypotheses and the routed proof gates. The derivative implication additionally requires Conjecture 8.3.1 and an Abel–Jacobi injectivity input. No integral leading-term or all-prime conclusion is inferred.

**Current upstream:** the read-only TauCetiRoadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`, with TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. IntegralLattices remains the supplier of primitive-embedding uniqueness in an even unimodular ambient lattice and indefinite classification. The current lattice-coordinate API is recorded separately from the pinned library baseline. EllipticCurves' real period and elementary conditional BSD interface remain scoped to Q. None of this existing work is re-planned.

## Evidence and validation

- Read the worker/protocol/upstream rules, issue, reviewed library coverage, RS-13, accepted parts, their review/handoff records, the assembled reader, links and relevant supplier contracts. This is a consolidation of accepted mathematics, not another independent review of those parts.
- Retained the parts' source locators, reading dates, version hashes and independently checked source findings. Public PDF hashes were compared against the inherited register. Rechecked HMS's effective/full distinction and BCGP §2.8 against the selected PDFs, and LTXZZ's introductory rank-zero/one statements against the cleared published copy. No new source finding is claimed and no source excerpt is committed.
- Checked the listed baseline declarations in the pinned source trees and the native localization signatures used in the new examples. Pinned elaboration remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PeriodsAndSpecialValues.json research/blueprint/packets/PeriodsAndSpecialValues--PS.0.json research/blueprint/packets/PeriodsAndSpecialValues--PS.8.json`: zero errors and warnings for all three. The manifest's checker summary correctly reports zero physically defined nodes; its `verification.importAudit` records the imported plan's counts.
- Independently checked exact import-set equality, unique imported IDs and reader presence of every target, API and test name. All 333 prerequisite occurrences resolve: 137 within this roadmap, 120 existing supplier targets, 32 supplier stages and 44 baseline references. Source-finding and source-version validators passed.
- `lean-check` succeeded on the complete suggested file after the memory check. Its only diagnostics were 51 admitted-proof warnings. The new examples introduce no sorry-bodied data definitions. Elaboration is a signature check, not a proof of any roadmap target.

## Remaining work and where to resume

The next job is independent review of this whole-scope submission. Review the import manifest against both accepted owner packets and the combined reader; do not replace their IDs or erase their existing review history. No implementation obligation was closed in this consolidation.

The seven PS.0–PS.7 obligations remain: actual Artin/modular geometric period identifications; relative-pair and elliptic integration comparisons; real dyadic determinant correction; original Fukaya–Kato/Burns–Greither proof sourcing and the typed BV shifted/dual determinant comparison; Rankin proof/derivative gates; original French Deligne collation; and finite semisimple reduced-norm/sign/boundary compatibility.

The five PS.8–PS.9 obligations remain: G1 quintic Dwork/crystalline/integral limiting lattice comparison; G2 weighted p-adic convergence estimates; G3 frame-preserving transport of convergent motivic stuffle; G4 generic finite quotient and relative A3 resolution interface; G5 the current IntegralLattices catalogue link. G5 is an integration obligation, not missing generic lattice theory. Supplier requests and restructuring proposals preserve their owners and exact needed statements. General Deligne, Serre, ETNC, BSD and period-injectivity claims remain predicates with their specified hypotheses.

All durable evidence, source/version identities and follow-up locations are in the packet, reader and existing part review reports. No scratch file or local source copy is needed to continue.
