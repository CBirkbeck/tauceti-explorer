# ASM-ArithmeticStatistics — completed assembly

Issue: [#6278](https://github.com/CBirkbeck/tauceti-explorer/issues/6278). Worker: Codex, session `codex-13oX1n`. Branch: `codex-13oX1n-arithmetic-statistics`. The bot confirmed this session's claim before work began. This is the one job taken in this run.

## Result and scope

The [full reader](../readmes/ArithmeticStatistics.md) integrates the accepted core and all six reviewed refinements: 711 target IDs, distributed 77, 90, 103, 109, 83 and 249 across Layers 0–5. It includes every supplied statement, mathematical hypothesis, API item, named test, proof route, acceptance check and source locator, with shared conventions and worked calculations. The reader uses final source-review qualifications, including rejected criticisms, rather than stale corrections. Source labels P and S0–S5 disambiguate reused short IDs. The six part readers and six part suggested files are unchanged inputs; the assembled reader follows the corrected packet statements where those older documents disagree.

The [representative Lean file](../suggested/ArithmeticStatistics.lean) has one import block, one module note and the common namespace `TauCetiRoadmap.ArithmeticStatistics`. It uses native carriers and light real-bodied definitions, layer milestones and selected discriminating examples. Heavy orbit dictionaries, moduli, measure constructions, finite-group laws and field-counting proofs remain explicit reader targets. It does not concatenate the old 9,051-line core prototype with the six parts. No data definition has a `sorry` body; all `sorry`s are theorem/example proofs. No closure or formalisation claim is made.

The only modified deliverables are the full reader, full suggested file, this handoff and six of the seven authorized packets. ST.2's packet is unchanged. All original target IDs, API/test names and lists, source records, source issues, coverage fields and review objects are retained. Review verdicts are unchanged.

## Changes requiring independent review

Two ST.1 targets now express comparisons with the single ST.0 owner, rather than introduce duplicate definitions. `refinement-binary-discriminant` evaluates the fixed-degree ST.0 polynomial and compares its signed universal resultant normalization. The trace-discriminant equality is supplied after the associated order is constructed in `refinement-binary-form-order`; this avoids making that order a prerequisite of its own discriminant normalization. `refinement-weak-discriminant-divisibility` transports ST.0's strong/weak perturbation predicates to binary/pencil coordinates. Both IDs and all three tests per target remain. Their kinds changed from construction/definition to comparison. The binaryDiscriminant constructor role became a compatibility role; the strong/weak APIs retain their characterisation roles. This is a reviewed-interface change: schedule an independent re-review of those two nodes and their consumers.

There are 80 reconciled dependency entries below: 77 stage requirements replaced by exact existing targets, one unneeded global requirement removed, and two exact ST.0 owner prerequisites added to the ST.1 comparisons. The local constant `ST.0/monic-euler-products` no longer depends on an ST.2 global tail: its global density application still needs the ST.2 summed tail and ST.3 sieve. The Wood exact-slice parametrizations depend on the ST.0 infinity/type adapter, while ST.0's average-normalization comparison depends on those parametrizations. Making each depend on the other would create a cycle. The full exact-target graph is acyclic after reconciliation; later-layer references are explicit mathematical dependencies, not claims that numerical layer order proves them.

Ten unresolved stage references remain because no reviewed exact export discharges their stronger contracts. Three new `G-assembly-cross-part` gaps, in the core, ST.0 and ST.5 consuming packets, list them. The BSS even-degree monicization/Selmer injection and the BKLOS normalized binary-cubic isogeny dictionary are not consequences of the odd-degree BGW pencil dictionary or an ordinary discriminant count. They remain open. The four PR/BKLPR family adapters, abelian three-isogeny adapter, general monic maximality, hyperelliptic-model adapter and projective-root adapter also remain explicit.

Twenty-two historical core gaps now have an `assemblyStatus` and `assemblyResolution` linking them to the reviewed refinements. “Refined” means a missing planning interface now has exact targets; “partial” identifies a narrower export and the still missing stronger statement. It never means that a formal proof exists. In particular the corrected reducible-resolvent bound has an epsilon loss, quartic prime tails are on the S4 generic locus, number-field twist counting keeps its coregular/window assumptions, and Wood's new determinacy conclusion is only for bounded-exponent quotients. The original gap detail is retained as provenance. The reader presents the current resolution instead of repeating obsolete claims that the new targets are absent.

## Ownership, tiers and library audit

Signature baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current ownership was checked against TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. ArithmeticDirichletSeries and NumberFieldArithmetic supply the upstream form; the reviewed library audit and current IntegralLattices/Selmer/probability boundaries supply the ownership checks. No upstream checkout or library was edited or built.

Native Northcott functions and finite-height counting are reused. Current lattice/coset counting with Lipschitz frontier, finite quadratic/discriminant modules, isotropic quotients, ordinary class-group norm/extension maps, per-curve descent, restricted products, independent product probability and scalar/exponential moment determinacy remain imports. Two core targets now carry `assemblyOwnership` qualifications identifying `TauCeti.FiniteQuadraticModule.IsIsotropic`, `IsLagrangian`, `orthogonalQuotient` and `orthogonalQuotientMk` from the current `TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.lean`: the new finite-field target is the Poonen–Rains parameter-set reduction map and its statistical fibres, not a new quadratic-module carrier or quotient construction. General-field statements retain Mathlib quadratic forms. New targets here specify statistical, selected-fibre, relative/narrow, real-Gram, cusp or finite-group variants and state the additional hypotheses. No generic replacement for these native theories is proposed. `WeierstrassCurve.naiveHeight` on points is not the curve-family height.

ArithmeticStatistics and AnalyticNumberTheory share tier 14. The ST.2 SV.2 coefficient-box large-sieve interface is required by the reviewed refinements; the older proposal to drop that edge is superseded. The exact special three-Selmer analytic-rank-zero criterion moves down to ST.5, with its unresolved primary proof G-analytic: tier-20 OrdinaryAutomorphicFormsAndModularityLifting must import it. PEL/polarization inputs and other upward contracts remain proposals/gaps; do not certify an upward supplier by its stage name. FoundationsAndLibraryIntegration is bookkeeping: the reader's boundary identifies native or Tau Ceti roadmap owners; no new foundation theory is assigned here.

The links directory has no active ArithmeticStatistics link map; its two old EllipticCurves-L8-to-ST.4 records are marked removed. Those historical links are not evidence of a proved height adapter. No link map, stage layout or neighboring roadmap has been changed.

No new external source transcription was made. Source statements and corrections are in our own words, with theorem/section/page locators; original Cohen–Lenstra and other restricted/unverified source qualifications remain. The local library index was consulted; no uncleared copy was acquired or used. Assembly does not replace independent verification of the already-reviewed primary sources.

## Validation

- All seven `python3 scripts/check_blueprint.py` checks: zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files` on all authorized deliverables: zero problems.
- `lean-check research/blueprint/suggested/ArithmeticStatistics.lean`: exit 0; the 416-line file emitted exactly 58 `declaration uses sorry` warnings and no other compiler warnings. Memory was checked before elaboration; no Lake build/update/cache or language server was started.
- Conservation audit: exactly 711 unique original target IDs, all original API/test names and statements except the two explicitly reconciled API roles/statements above, all sources/source issues/reviews/coverage unchanged; every API/test name occurs in the full reader.
- Exact internal prerequisite graph: no missing target IDs and no cycle. Ten stage contracts are covered by consuming-packet gaps. Local reader anchors are unique and every internal fragment link resolves.
- Planet budget: six per layer, 36 total. Removing excess landmark flags never removes a mathematical target. `git diff --check` passes.

## Remaining work and where to resume

Assembly is complete. The next worker should independently review the changes above, then package this assembled reader and representative file under the current shape rules. Existing source/supplier gaps remain mathematical work, not an unfinished assembly. Start with the ten unresolved stage contracts and the partial core gap resolutions; the tables below preserve the precise consuming nodes. The full reader also retains every request and gap next to its consuming layer.

The maintainer must decide the 13 restructuring proposals collected below and coordinate proposed Part IIs/move-downs. None has been applied to atlas structure. The 143 requests retain their stronger hypotheses even where a narrower exact target now exists. There are 119 gap records including the three assembly gaps; the status table distinguishes historical refined records from residual obligations. Conjectural arithmetic identifications and the Wood bad-type ordinary limit are not promoted to theorems. The full-group tail after bounded-exponent moment convergence is still open.

## Exact cross-part dependency changes

| Consumer | Previous stage requirement | Exact supplying targets |
| --- | --- | --- |
| [ArithmeticStatistics:ST.0/stickelberger-binary](../readmes/ArithmeticStatistics.md#st0-stickelberger-binary) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.0/binary-density-formulas](../readmes/ArithmeticStatistics.md#st0-binary-density-formulas) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.0/monic-euler-products](../readmes/ArithmeticStatistics.md#st0-monic-euler-products) | `ArithmeticStatistics:ST.2` | Removed reverse/global requirement; rationale above |
| [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](../readmes/ArithmeticStatistics.md#st3-secondary-cubic-lattice-coefficient) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-congruence-count) |
| [ArithmeticStatistics:ST.3/refined-cubic-sieve](../readmes/ArithmeticStatistics.md#st3-refined-cubic-sieve) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-sieve-error) |
| [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](../readmes/ArithmeticStatistics.md#st3-low-degree-maximal-sieve) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail](../readmes/ArithmeticStatistics.md#st2-refinement-global-field-large-prime-tail); [ArithmeticStatistics:ST.2/refinement-global-field-generic-finite-count](../readmes/ArithmeticStatistics.md#st2-refinement-global-field-generic-finite-count) |
| [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](../readmes/ArithmeticStatistics.md#st3-shintani-cubic-order-uniform-bound) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/uniformity-estimate-for-nonmaximal-binary-cubic-forms](../readmes/ArithmeticStatistics.md#st2-uniformity-estimate-for-nonmaximal-binary-cubic-forms) |
| [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](../readmes/ArithmeticStatistics.md#st3-polynomial-order-lattice-reduction) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn](../readmes/ArithmeticStatistics.md#st3-squarefree-field-discriminant-sn) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn](../readmes/ArithmeticStatistics.md#st3-squarefree-field-discriminant-sn) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-monic-fixed-modulus-sieve](../readmes/ArithmeticStatistics.md#st2-refinement-monic-fixed-modulus-sieve) |
| [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](../readmes/ArithmeticStatistics.md#st3-monic-polynomial-sieve-counts) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-monic-fixed-modulus-sieve](../readmes/ArithmeticStatistics.md#st2-refinement-monic-fixed-modulus-sieve); [ArithmeticStatistics:ST.2/refinement-monic-summed-tail](../readmes/ArithmeticStatistics.md#st2-refinement-monic-summed-tail) |
| [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](../readmes/ArithmeticStatistics.md#st3-monic-weak-quasi-reduction) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-monic-weak-tail](../readmes/ArithmeticStatistics.md#st2-refinement-monic-weak-tail) |
| [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](../readmes/ArithmeticStatistics.md#st3-trace-restricted-polynomial-sieve) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-monic-fixed-modulus-sieve](../readmes/ArithmeticStatistics.md#st2-refinement-monic-fixed-modulus-sieve) |
| [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](../readmes/ArithmeticStatistics.md#st3-binary-discriminant-local-factors) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](../readmes/ArithmeticStatistics.md#st3-binary-discriminant-local-factors) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-binary-fixed-modulus-sieve](../readmes/ArithmeticStatistics.md#st2-refinement-binary-fixed-modulus-sieve) |
| [ArithmeticStatistics:ST.3/binary-form-sieve-counts](../readmes/ArithmeticStatistics.md#st3-binary-form-sieve-counts) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-binary-fixed-modulus-sieve](../readmes/ArithmeticStatistics.md#st2-refinement-binary-fixed-modulus-sieve); [ArithmeticStatistics:ST.2/refinement-binary-summed-tail](../readmes/ArithmeticStatistics.md#st2-refinement-binary-summed-tail) |
| [ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini](../readmes/ArithmeticStatistics.md#st3-binary-form-arithmetic-bertini) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-binary-form-order](../readmes/ArithmeticStatistics.md#st1-refinement-binary-form-order) |
| [ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two](../readmes/ArithmeticStatistics.md#st4-refinement-hyperelliptic-average-two) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-pencil-infinite-weight-upper-bound](../readmes/ArithmeticStatistics.md#st2-refinement-pencil-infinite-weight-upper-bound) |
| [ArithmeticStatistics:ST.4/refinement-restricted-selmer-set](../readmes/ArithmeticStatistics.md#st4-refinement-restricted-selmer-set) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits](../readmes/ArithmeticStatistics.md#st1-refinement-locally-soluble-pencil-orbits) |
| [ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average](../readmes/ArithmeticStatistics.md#st4-refinement-order-k-vanishing-average) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family); [ArithmeticStatistics:ST.0/coefficient-box](../readmes/ArithmeticStatistics.md#st0-coefficient-box) |
| [ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear](../readmes/ArithmeticStatistics.md#st4-refinement-small-odd-degree-points-disappear) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/density-denominator-comparisons](../readmes/ArithmeticStatistics.md#st0-density-denominator-comparisons); [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family) |
| [ArithmeticStatistics:ST.4/refinement-odd-residue-field-models](../readmes/ArithmeticStatistics.md#st4-refinement-odd-residue-field-models) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family) |
| [ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities](../readmes/ArithmeticStatistics.md#st4-refinement-admissible-family-selmer-parities) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family); [ArithmeticStatistics:ST.0/coefficient-box](../readmes/ArithmeticStatistics.md#st0-coefficient-box) |
| [ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities](../readmes/ArithmeticStatistics.md#st4-refinement-admissible-family-selmer-parities) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-large-coefficient-family-tail](../readmes/ArithmeticStatistics.md#st2-refinement-large-coefficient-family-tail) |
| [ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison](../readmes/ArithmeticStatistics.md#st4-refinement-local-five-quotient-comparison) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution](../readmes/ArithmeticStatistics.md#st4-refinement-five-selmer-local-equidistribution) | `ArithmeticStatistics:ST.5` | [ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-5-selmer-group) |
| [ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements](../readmes/ArithmeticStatistics.md#st4-refinement-soluble-generic-three-selmer-elements) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants](../readmes/ArithmeticStatistics.md#st1-ternary-cubic-forms-and-their-invariants); [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer](../readmes/ArithmeticStatistics.md#st4-refinement-plane-cubic-height-and-orbit-transfer) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants](../readmes/ArithmeticStatistics.md#st1-ternary-cubic-forms-and-their-invariants) |
| [ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count](../readmes/ArithmeticStatistics.md#st4-refinement-soluble-ternary-fundamental-count) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-ternary-cubic-acceptable-count](../readmes/ArithmeticStatistics.md#st2-refinement-ternary-cubic-acceptable-count) |
| [ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero](../readmes/ArithmeticStatistics.md#st5-refinement-balanced-three-rank-zero) | `ArithmeticStatistics:ST.4` | [ArithmeticStatistics:ST.4/average-over-a-height-ordered-family](../readmes/ArithmeticStatistics.md#st4-average-over-a-height-ordered-family) |
| [ArithmeticStatistics:ST.5/refinement-five-basic-bounds](../readmes/ArithmeticStatistics.md#st5-refinement-five-basic-bounds) | `ArithmeticStatistics:ST.4` | [ArithmeticStatistics:ST.4/average-over-a-height-ordered-family](../readmes/ArithmeticStatistics.md#st4-average-over-a-height-ordered-family) |
| [ArithmeticStatistics:ST.5/refinement-positive-three-ranks](../readmes/ArithmeticStatistics.md#st5-refinement-positive-three-ranks) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/relative-density](../readmes/ArithmeticStatistics.md#st0-relative-density); [ArithmeticStatistics:ST.0/elliptic-families-defined-by-congruence-conditions](../readmes/ArithmeticStatistics.md#st0-elliptic-families-defined-by-congruence-conditions) |
| [ArithmeticStatistics:ST.5/refinement-five-root-balanced-family](../readmes/ArithmeticStatistics.md#st5-refinement-five-root-balanced-family) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/elliptic-families-defined-by-congruence-conditions](../readmes/ArithmeticStatistics.md#st0-elliptic-families-defined-by-congruence-conditions); [ArithmeticStatistics:ST.0/constant-rescaling-of-a-height](../readmes/ArithmeticStatistics.md#st0-constant-rescaling-of-a-height) |
| [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count](../readmes/ArithmeticStatistics.md#st2-refinement-smoothed-quaternary-count) |
| [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family); [ArithmeticStatistics:ST.0/density-denominator-comparisons](../readmes/ArithmeticStatistics.md#st0-density-denominator-comparisons) |
| [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count](../readmes/ArithmeticStatistics.md#st2-refinement-number-field-twist-orbit-count) |
| [ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank](../readmes/ArithmeticStatistics.md#st5-refinement-elliptic-explicit-twist-rank) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count](../readmes/ArithmeticStatistics.md#st2-refinement-number-field-twist-orbit-count) |
| [ArithmeticStatistics:ST.5/refinement-signature-positive-twists](../readmes/ArithmeticStatistics.md#st5-refinement-signature-positive-twists) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count](../readmes/ArithmeticStatistics.md#st2-refinement-number-field-twist-orbit-count) |
| [ArithmeticStatistics:ST.5/refinement-signature-positive-twists](../readmes/ArithmeticStatistics.md#st5-refinement-signature-positive-twists) | `ArithmeticStatistics:ST.4` | [ArithmeticStatistics:ST.4/local-selmer-mass-ratios](../readmes/ArithmeticStatistics.md#st4-local-selmer-mass-ratios) |
| [ArithmeticStatistics:ST.5/refinement-complex-place-obstruction](../readmes/ArithmeticStatistics.md#st5-refinement-complex-place-obstruction) | `ArithmeticStatistics:ST.4` | [ArithmeticStatistics:ST.4/archimedean-selmer-ratio-is-one-half](../readmes/ArithmeticStatistics.md#st4-archimedean-selmer-ratio-is-one-half) |
| [ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields](../readmes/ArithmeticStatistics.md#st3-roberts-second-order-term-for-cubic-fields) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-congruence-count); [ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-sieve-error) |
| [ArithmeticStatistics:ST.3/second-order-term-for-the-mean-of-three-torsion](../readmes/ArithmeticStatistics.md#st3-second-order-term-for-the-mean-of-three-torsion) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-congruence-count); [ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-sieve-error) |
| [ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications](../readmes/ArithmeticStatistics.md#st3-second-order-term-for-cubic-orders-with-local-specifications) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-congruence-count); [ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-sieve-error) |
| [ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields](../readmes/ArithmeticStatistics.md#st3-bhargava-count-of-quartic-fields) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-quartic-finite-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-quartic-finite-congruence-count); [ArithmeticStatistics:ST.2/refinement-quartic-nonmaximal-overramified-tail](../readmes/ArithmeticStatistics.md#st2-refinement-quartic-nonmaximal-overramified-tail) |
| [ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields](../readmes/ArithmeticStatistics.md#st3-bhargava-count-of-quintic-fields) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-quintic-finite-congruence-count](../readmes/ArithmeticStatistics.md#st2-refinement-quintic-finite-congruence-count); [ArithmeticStatistics:ST.2/refinement-quintic-nonmaximal-tail](../readmes/ArithmeticStatistics.md#st2-refinement-quintic-nonmaximal-tail) |
| [ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups](../readmes/ArithmeticStatistics.md#st3-bhargava-mean-of-two-torsion-in-cubic-class-groups) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-quartic-fixed-reducible-resolvent](../readmes/ArithmeticStatistics.md#st2-refinement-quartic-fixed-reducible-resolvent) |
| [ArithmeticStatistics:ST.5/cohen-lenstra-martinet-average-conjecture](../readmes/ArithmeticStatistics.md#st5-cohen-lenstra-martinet-average-conjecture) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/number-field-counting-function](../readmes/ArithmeticStatistics.md#st3-number-field-counting-function) |
| [ArithmeticStatistics:ST.5/cohen-martinet-surjection-moment-conjecture](../readmes/ArithmeticStatistics.md#st5-cohen-martinet-surjection-moment-conjecture) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/number-field-counting-function](../readmes/ArithmeticStatistics.md#st3-number-field-counting-function) |
| [ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction](../readmes/ArithmeticStatistics.md#st5-dihedral-quartic-proven-average-versus-prediction) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](../readmes/ArithmeticStatistics.md#st3-relative-three-torsion-propagation); [ArithmeticStatistics:ST.3/two-extension-three-torsion-means](../readmes/ArithmeticStatistics.md#st3-two-extension-three-torsion-means) |
| [ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-3-selmer-group) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-3-selmer-group) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-ternary-cubic-acceptable-count](../readmes/ArithmeticStatistics.md#st2-refinement-ternary-cubic-acceptable-count) |
| [ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-4-selmer-group) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-4-selmer-group) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-quaternary-acceptable-count](../readmes/ArithmeticStatistics.md#st2-refinement-quaternary-acceptable-count) |
| [ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-5-selmer-group) | `ArithmeticStatistics:ST.1` | [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes) |
| [ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-5-selmer-group) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-quinary-acceptable-count](../readmes/ArithmeticStatistics.md#st2-refinement-quinary-acceptable-count) |
| [ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group](../readmes/ArithmeticStatistics.md#st5-second-moment-of-the-2-selmer-group) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count](../readmes/ArithmeticStatistics.md#st2-refinement-smoothed-quaternary-count) |
| [ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups](../readmes/ArithmeticStatistics.md#st5-bklos-average-size-of-three-isogeny-selmer-groups) | `ArithmeticStatistics:ST.2` | [ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count](../readmes/ArithmeticStatistics.md#st2-refinement-number-field-twist-orbit-count) |
| [ArithmeticStatistics:ST.5/local-density-first-moment](../readmes/ArithmeticStatistics.md#st5-local-density-first-moment) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/two-point-incidence-count](../readmes/ArithmeticStatistics.md#st5-two-point-incidence-count) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/veronese-minor-valuation](../readmes/ArithmeticStatistics.md#st5-veronese-minor-valuation) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/primitive-pair-minor-gcd-sum](../readmes/ArithmeticStatistics.md#st5-primitive-pair-minor-gcd-sum) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/local-density-variance](../readmes/ArithmeticStatistics.md#st5-local-density-variance) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/gradient-valuation-strata](../readmes/ArithmeticStatistics.md#st5-gradient-valuation-strata) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/high-gradient-stratum-count](../readmes/ArithmeticStatistics.md#st5-high-gradient-stratum-count) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/primitive-hypersurface-family](../readmes/ArithmeticStatistics.md#st0-primitive-hypersurface-family); [ArithmeticStatistics:ST.0/finite-local-hypersurface-set](../readmes/ArithmeticStatistics.md#st0-finite-local-hypersurface-set) |
| [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/principally-polarized-count](../readmes/ArithmeticStatistics.md#st0-principally-polarized-count); [ArithmeticStatistics:ST.0/polarization-fiber-count](../readmes/ArithmeticStatistics.md#st0-polarization-fiber-count) |
| [ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs](../readmes/ArithmeticStatistics.md#st5-spacing-measure-discrepancy-for-ppavs) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/principally-polarized-count](../readmes/ArithmeticStatistics.md#st0-principally-polarized-count); [ArithmeticStatistics:ST.0/polarization-fiber-count](../readmes/ArithmeticStatistics.md#st0-polarization-fiber-count) |
| [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/principally-polarized-count](../readmes/ArithmeticStatistics.md#st0-principally-polarized-count); [ArithmeticStatistics:ST.0/polarization-fiber-count](../readmes/ArithmeticStatistics.md#st0-polarization-fiber-count) |
| [ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization](../readmes/ArithmeticStatistics.md#st5-imaginary-exact-slice-parametrization) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/real-exact-slice-parametrization](../readmes/ArithmeticStatistics.md#st5-real-exact-slice-parametrization) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/imaginary-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-per-component-unit-moment) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/real-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-real-per-component-unit-moment) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/bad-type-lower-bound](../readmes/ArithmeticStatistics.md#st5-bad-type-lower-bound) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion](../readmes/ArithmeticStatistics.md#st5-printed-bad-type-ordinary-limit-assertion) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations); [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter) |
| [ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-normalized-nonabelian-moment) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](../readmes/ArithmeticStatistics.md#st3-nonabelian-quadratic-moment-interface) |
| [ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-real-normalized-nonabelian-moment) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](../readmes/ArithmeticStatistics.md#st3-nonabelian-quadratic-moment-interface) |
| [ArithmeticStatistics:ST.5/bad-type-normalization-transfer](../readmes/ArithmeticStatistics.md#st5-bad-type-normalization-transfer) | `ArithmeticStatistics:ST.3` | [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](../readmes/ArithmeticStatistics.md#st3-nonabelian-quadratic-moment-interface) |
| [ArithmeticStatistics:ST.5/bad-type-normalization-transfer](../readmes/ArithmeticStatistics.md#st5-bad-type-normalization-transfer) | `ArithmeticStatistics:ST.0` | [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations) |
| [ArithmeticStatistics:ST.1/refinement-binary-discriminant](../readmes/ArithmeticStatistics.md#st1-refinement-binary-discriminant) | `No explicit owner prerequisite` | [ArithmeticStatistics:ST.0/binary-discriminant](../readmes/ArithmeticStatistics.md#st0-binary-discriminant) |
| [ArithmeticStatistics:ST.1/refinement-weak-discriminant-divisibility](../readmes/ArithmeticStatistics.md#st1-refinement-weak-discriminant-divisibility) | `No explicit owner prerequisite` | [ArithmeticStatistics:ST.0/strong-weak-discriminant](../readmes/ArithmeticStatistics.md#st0-strong-weak-discriminant) |

## Unresolved cross-part stage contracts

- [ArithmeticStatistics:ST.0/local-maximality](../readmes/ArithmeticStatistics.md#st0-local-maximality): The monic Dedekind ideal criterion needs its quotient-order interpretation in ST.1. The general binary-form order alone does not give this monic comparison.
- [ArithmeticStatistics:ST.0/hyperelliptic-model-family](../readmes/ArithmeticStatistics.md#st0-hyperelliptic-model-family): The coefficient carrier is supplied here; its smooth projective hyperelliptic curve/genus comparison needs the geometric covering interface, with JacobianChallenge as the curve/Picard owner. ST.1 has no independent exact export for this adapter.
- [ArithmeticStatistics:ST.0/odd-root-criterion](../readmes/ArithmeticStatistics.md#st0-odd-root-criterion): The general projective root-multiplicity equivalence, including the binary root at infinity and exceptional prime 2, is not separately exported by the reviewed ST.1 nodes. Its weak-locus specialization is not a proof of the full equivalence.
- [ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group](../readmes/ArithmeticStatistics.md#st5-second-moment-of-the-2-selmer-group): BSS even-degree monicization, its Selmer injection and fixed integral scaling are not the odd-degree BGW pencil dictionary; R-bss-monicization remains open.
- [ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups](../readmes/ArithmeticStatistics.md#st5-bklos-average-size-of-three-isogeny-selmer-groups): The normalized SL₂ binary-cubic mirror-algebra/isogeny dictionary is absent from the reviewed ST.1 exports; R-bklos-orbit-adapter remains open.
- [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average): The general-abelian three-isogeny locally soluble orbit dictionary is not supplied by the low-degree ring parametrizations; R-bklos-orbit-adapter remains open.
- [ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-squarefree-selmer-conjecture): ST.0’s integral even-degree coefficient family does not supply the fixed-global-field PR/BKLPR family, odd-degree models, or long Weierstrass characteristic-2/3 regimes. Retain G-source-family and R-family-adapters; no minimal-height isomorphism-class substitution is valid.
- [ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-odd-degree-jacobian-conjecture): ST.0’s integral even-degree coefficient family does not supply the fixed-global-field PR/BKLPR family, odd-degree models, or long Weierstrass characteristic-2/3 regimes. Retain G-source-family and R-family-adapters; no minimal-height isomorphism-class substitution is valid.
- [ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-even-genus-two-selmer-conjecture): ST.0’s integral even-degree coefficient family does not supply the fixed-global-field PR/BKLPR family, odd-degree models, or long Weierstrass characteristic-2/3 regimes. Retain G-source-family and R-family-adapters; no minimal-height isomorphism-class substitution is valid.
- [ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-global-image-splitting-conjecture): ST.0’s integral even-degree coefficient family does not supply the fixed-global-field PR/BKLPR family, odd-degree models, or long Weierstrass characteristic-2/3 regimes. Retain G-source-family and R-family-adapters; no minimal-height isomorphism-class substitution is valid.

## Shared landmark selection

All layers have six final landmarks; the full reader lists the retained names. These 11 flags were removed to enforce the assembled layer budget. Their complete targets, APIs and tests remain. The ST.0 display-split proposal is preserved below for a maintainer decision.

| Target | Removed landmark flag |
| --- | --- |
| [ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count](../readmes/ArithmeticStatistics.md#st0-stabilizer-weighted-orbit-count) | Weighted orbit count |
| [ArithmeticStatistics:ST.0/family-defined-by-local-conditions](../readmes/ArithmeticStatistics.md#st0-family-defined-by-local-conditions) | Family defined by congruence conditions |
| [ArithmeticStatistics:ST.0/eligibility-criterion-modulo-27](../readmes/ArithmeticStatistics.md#st0-eligibility-criterion-modulo-27) | Eligibility criterion for quartic invariants |
| [ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion](../readmes/ArithmeticStatistics.md#st3-davenport-heilbronn-mean-of-three-torsion) | Mean 3-torsion in quadratic class groups |
| [ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields](../readmes/ArithmeticStatistics.md#st3-bhargava-count-of-quartic-fields) | Bhargava's count of quartic fields |
| [ArithmeticStatistics:ST.0/coefficient-box](../readmes/ArithmeticStatistics.md#st0-coefficient-box) | Coefficient-height families |
| [ArithmeticStatistics:ST.0/monic-density-formulas](../readmes/ArithmeticStatistics.md#st0-monic-density-formulas) | Monic discriminant densities |
| [ArithmeticStatistics:ST.0/finite-picard-quotient](../readmes/ArithmeticStatistics.md#st0-finite-picard-quotient) | Finite Picard quotient |
| [ArithmeticStatistics:ST.3/prime-power-class-group-rank](../readmes/ArithmeticStatistics.md#st3-prime-power-class-group-rank) | Prime-power class-group ranks |
| [ArithmeticStatistics:ST.3/refined-cubic-sieve](../readmes/ArithmeticStatistics.md#st3-refined-cubic-sieve) | Refined cubic sieve |
| [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](../readmes/ArithmeticStatistics.md#st3-nonabelian-quadratic-moment-interface) | Nonabelian quadratic moments |

## Collected restructuring proposals

The labels below identify the originating packet and one-based proposal index. Full affected IDs and sublayer membership remain in the linked packet; no proposal has been accepted by this assembly. The two old display counts are historical: ST.2 now has 103 targets and ST.5 has 249.

### P/S1

Origin: [ArithmeticStatistics](../packets/ArithmeticStatistics.json).

The atlas edge GeometryOfNumbersAndQuadraticArithmetic:GN.1 → ArithmeticStatistics:ST.0 carries nothing that an ST.0 node uses: ST.0's finiteness statements rest on Mathlib's class-number and Hermite theorems (proved in Mathlib by Minkowski's theorem), on Tau Ceti's Selmer-group finiteness and on elementary bounds. The roadmap's geometry-of-numbers input is Davenport's lemma, supplied to ST.2 by GN.4 (RS-07). Proposal: drop the GN.1 → ST.0 edge (and ST.0's listed input FoundationsAndLibraryIntegration:LI.4, which no ST.0 node needs because the Tau Ceti declarations are cited directly), keeping the RS-07 link EllipticCurves layer 8 → ST.0.

### P/S2

Origin: [ArithmeticStatistics](../packets/ArithmeticStatistics.json).

Action: rescope

Roadmaps: ArithmeticStatistics; SieveMethodsAndPrimePatterns

Detail: The atlas and RS-07 list SieveMethodsAndPrimePatterns:SV.2 (large sieve, bilinear decompositions) as an input of ArithmeticStatistics:ST.2 ('retain the large-sieve input for uniform family counting'). No step of the ST.2 sources (Bhargava-Shankar Section 2, Bhargava-Shankar-Tsimerman Sections 5 and 8, Bhargava's geometric sieve) uses a large-sieve or bilinear estimate: the sieve to infinitely many congruence conditions is an elementary inclusion-exclusion with a uniform tail, the tail comes from the geometric sieve (owned here, as the accepted paper routes PAPER-KOYMANS-MILOVIC-21 and PAPER-BHARGAVA-GROSS-WANG-17 record) and from switching maps, and the prime sums need only Chebyshev's bound from Mathlib.

Proposal: Drop the stage edge SieveMethodsAndPrimePatterns:SV.2 → ArithmeticStatistics:ST.2, or keep it only as a documentation link; no ST.2 node requests SV.2. ST.2 keeps ownership of the quantitative Ekedahl geometric sieve (ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve).

**Assembly disposition:** superseded by reviewed ST.2 coefficient-box counting requests. Retain SV.2; its large-sieve/specialization bounds are now consumed.

### P/S3

Origin: [ArithmeticStatistics](../packets/ArithmeticStatistics.json).

Action: split

Roadmaps: ArithmeticStatistics

Detail: ST.2 has 52 nodes in three coherent groups; the atlas would read it better as three sub-layers under ST.2 (parentStageId unchanged).

Proposal: ST.2a 'Geometric sieve and local densities': chebyshev-bounds-for-prime-sums, lattice-points-on-a-subvariety-in-a-dilated-region, uniform-bound-for-points-of-a-subscheme-modulo-p, geometric-sieve-small-primes, geometric-sieve-large-primes, quantitative-ekedahl-geometric-sieve, strongly-and-weakly-divisible-values, strong-divisibility-lies-on-a-codimension-two-locus, discriminant-loci-of-codimension-two, local-density-of-values-divisible-by-p-squared, functions-defined-by-congruence-conditions. ST.2b 'Binary quartic forms of bounded height': the nodes from real-root-types-of-binary-quartic-forms to squarefree-sieve-for-binary-quartic-forms (Bhargava-Shankar Section 2, with the Gauss-domain nodes). ST.2c 'Binary cubic forms of bounded discriminant': the nodes from real-orbits-and-stabilizers-of-binary-cubic-forms to sieve-to-acceptable-functions-for-binary-cubic-forms (Bhargava-Shankar-Tsimerman Sections 5 and 8).

### P/S4

Origin: [ArithmeticStatistics](../packets/ArithmeticStatistics.json).

Action: rescope

Roadmaps: ArithmeticStatistics

Detail: ST.5 carries 188 nodes in four coherent strands (random groups and matrix models; Selmer statistics of elliptic curves; local statistics and abelian varieties over finite fields; function-field analogues). One star is too broad to read; PROTOCOL section 14 allows sub-layers with a parent node. No mathematics moves between roadmaps and the stage edge ST.4 -> ST.5 is unchanged.

Proposal: Divide ST.5 into four sub-layers under the stage (parentStageId stays ArithmeticStatistics:ST.5 until the sub-layers are created): ST.5a 'Random groups, random matrices and Selmer models' (74 nodes: isomorphism-classes-of-finite-abelian-p-groups, automorphism-count-of-finite-abelian-p-groups, surjection-count, exact-surjection-count-formula, cohen-lenstra-measure, partitions-with-large-parts-by-largest-part, hall-partition-identity, weighted-inverse-automorphism-sum, cohen-lenstra-mass-formula, surjection-moment, extension-groupoid-of-finite-abelian-groups, surjection-weighted-class-count, cohen-lenstra-moments, cohen-lenstra-contraction-constant, moments-determine-the-cohen-lenstra-measure, enlargement-of-finite-abelian-p-groups, aggregate-enlargement-inequality, partition-tail-domination, finite-enlargement-domination-of-tails, finite-moment-control-of-masses, moment-convergence-implies-distribution-convergence, distribution-convergence-does-not-force-moment-convergence, moments-determine-cohen-lenstra-limits-for-all-p-and-u, cokernel-law-of-haar-random-p-adic-matrices, haar-matrix-cokernel-surjection-moments, friedman-washington-cokernel-law, friedman-washington-translation-form, cohen-lenstra-measure-over-a-finite-set-of-primes, cohen-lenstra-heuristic-for-quadratic-fields, cohen-lenstra-moment-conjecture-for-quadratic-fields, cohen-lenstra-moment-form-implies-heuristic, matrix-kernel-law-over-a-finite-field, rank-count-of-matrices-over-a-finite-field, symmetric-matrix-kernel-law, macwilliams-symmetric-rank-count, limit-of-the-symmetric-kernel-law, koymans-pagano-rank-identity, cohen-martinet-predicted-surjection-moment, cohen-lenstra-martinet-average-conjecture, cohen-martinet-surjection-moment-conjecture, relative-three-torsion-as-irreducible-hom-count, cohen-martinet-prediction-for-relative-three-torsion, cohen-martinet-prediction-for-three-torsion-of-two-extensions, dihedral-quartic-proven-average-versus-prediction, enhanced-cohen-lenstra-finite-level-law, zero-cokernel-probability-at-two, zero-cokernel-probability-lower-bound-at-odd-primes, enhanced-cohen-lenstra-conjecture, height-moments-in-an-arithmetic-family, gaussian-binomial-coefficient, cauchy-q-binomial-theorem, maximal-isotropic-subspaces-of-a-quadratic-space, isotropic-reduction-map, fibres-of-the-isotropic-reduction-map, number-of-maximal-isotropic-subspaces, intersection-dimension-generating-function, intersection-dimension-law-closed-form, poonen-rains-distribution, intersection-law-converges-to-poonen-rains, poonen-rains-moments, poonen-rains-parity, delaunay-sha-p-rank-law, delaunay-compatibility-of-the-selmer-model, count-of-nondegenerate-alternating-matrices, alternating-matrix-kernel-law, alternating-kernel-law-formula, alternating-kernel-law-limit-is-poonen-rains, symplectic-finite-abelian-p-groups, alternating-cokernel-law, bklpr-alternating-cokernel-limit, bklpr-model, bklpr-random-isotropic-intersection-law, maximal-isotropic-direct-summands-modulo-prime-powers, bklpr-injection-moments); ST.5b 'Selmer statistics of elliptic curves' (35 nodes: poonen-rains-selmer-conjecture, bhargava-shankar-selmer-average-conjecture, selmer-average-conjecture-implies-rank-at-most-one, bklpr-selmer-conjecture, rational-p-torsion-has-density-zero, bklpr-conjecture-implies-rank-and-selmer-laws, average-size-of-the-3-selmer-group, average-rank-bound-from-the-3-selmer-average, average-size-of-the-4-selmer-group, average-size-of-the-5-selmer-group, second-moment-of-the-2-selmer-group, two-selmer-distribution-in-full-two-torsion-twist-families, function-field-3-selmer-average-bound, p-infinity-selmer-corank-distribution-in-twist-families, smith-twist-family-hypothesis, congruent-number-curve-satisfies-smith-hypothesis, smith-selmer-rank-limit-equals-corank, two-point-corank-law-forces-zero-density-of-high-corank, even-congruent-twists-have-corank-zero-given-smith-law, selmer-ratio-of-an-isogeny, local-selmer-ratio-via-tamagawa-numbers, tamagawa-ratio-under-potentially-good-reduction, selmer-ratio-classes-are-locally-defined, bklos-average-size-of-three-isogeny-selmer-groups, cassels-isogeny-selmer-ratio-formula, isogeny-factorisation-selmer-exact-sequence, three-isogeny-selmer-parity, finitely-many-twists-with-rational-p-torsion, reduced-p-selmer-rank-bounds-the-corank, three-selmer-rank-zero-in-selmer-ratio-one-twists, three-selmer-rank-one-in-odd-selmer-ratio-twists, positive-proportions-of-three-selmer-ranks-in-local-subfamilies, cm-curves-have-a-twist-with-good-reduction, cm-three-isogeny-has-selmer-ratio-one, cm-twists-have-corank-zero-at-least-half); ST.5c 'Local statistics and abelian varieties over finite fields' (24 nodes: coefficient-vector-form, local-density-of-a-form-modulo-q, polynomial-congruence-under-perturbation, first-order-taylor-congruence, local-density-first-moment, two-point-incidence-count, veronese-minor-valuation, primitive-pair-minor-gcd-sum, local-density-second-moment, local-density-variance, gradient-valuation-strata, high-gradient-stratum-count, fixed-gradient-valuation-hensel-lifting, local-density-lower-bound-on-gradient-stratum, convex-concentration-inequality, weighted-square-concentration, model-ring-orbit-count-concentration, most-ppavs-have-a-large-elliptic-or-real-weil-factor, kolmogorov-distance, normalized-eigenangle-spacing-measure, zero-gap-mass-from-repeated-angles, kolmogorov-distance-lower-bound-from-an-atom, spacing-measure-discrepancy-for-ppavs, enhanced-cohen-lenstra-fails-for-ppavs); ST.5d 'Function-field analogues' (55 nodes: odd-degree-quadratic-function-field-family, size-of-the-odd-degree-quadratic-family, imaginary-exact-slice-parametrization, real-exact-slice-parametrization, generalized-dihedral-cover-datum, class-group-surjection-pair, involution-quotient-of-the-unramified-pro-l-group, hurwitz-points-classify-class-group-surjections, factor-two-point-count-identity, empirical-l-primary-class-group-law, lower-and-upper-degree-densities, top-cohomology-counts-rational-components, uniform-trace-error-estimate, uniform-function-field-surjection-moment-estimate, large-q-cohen-lenstra-theorem, positive-proportions-of-l-divisible-and-indivisible-class-numbers, hyperelliptic-torsion-local-system, geometric-generic-fibre-of-the-unmarked-hurwitz-cover, hyperelliptic-boundary-degeneration, overlapping-symplectic-subgroups-generate, mod-l-hyperelliptic-monodromy-is-symplectic, integral-lift-of-full-mod-l-symplectic-image, integral-hyperelliptic-monodromy, monodromy-of-the-odd-degree-polynomial-family, finite-level-monodromy-of-the-polynomial-family, symplectic-similitude-group, monodromy-orbits-and-rational-components, primary-decomposition-for-a-multiplier-q-similitude, orthogonality-and-a-killed-lagrangian, symplectic-normal-forms-over-z-l, linear-group-transitive-on-lattice-surjections, unique-similitude-stable-symplectic-orbit, one-rational-geometric-component, eventual-degree-large-q-limit, imaginary-per-component-unit-moment, real-per-component-unit-moment, imaginary-normalized-nonabelian-moment, real-normalized-nonabelian-moment, stable-parity-multidegree-count, many-large-parity-vectors, bad-type-lower-bound, bad-type-normalization-transfer, printed-bad-type-ordinary-limit-assertion, whole-fixed-degree-component-profile, boundary-component-remainder, complete-stable-range-component-sum, moment-minus-component-profile-vanishes, ordinary-limit-iff-eventual-profile-constancy, liminf-limsup-from-recurrent-profile-values, weight-polynomial-formula-for-the-stable-orthant, surjections-onto-a-semidirect-product, complements-of-a-coprime-abelian-normal-subgroup-are-conjugate, counting-unramified-h-extensions-via-semidirect-extensions, liu-wood-zureick-brown-function-field-moments, cohen-lenstra-martinet-moments-over-function-fields). Edges: ST.5a -> ST.5b, ST.5a -> ST.5c, ST.5a -> ST.5d; planets: Cohen–Lenstra measure, Poonen–Rains Selmer distribution and BKLPR model in ST.5a; Average size of the 3-Selmer group and 3^∞-Selmer coranks of CM twists in ST.5b; Large-q Cohen–Lenstra theorem in ST.5d.

### S0/S1

Origin: [ArithmeticStatistics--ST.0](../packets/ArithmeticStatistics--ST.0.json).

Action: rescope

Roadmaps: ArithmeticStatistics

Detail: The accepted parent and this concrete-family follow-up each select six landmarks in ST.0. Their combined 77 nodes span generic density/height theory and source-specific local/moduli families; twelve landmarks must not be drawn on one layer.

Proposal: Divide ST.0 into two displayed sub-layers: General arithmetic families and density (all 37 accepted parent ST.0 nodes, retaining its six planets), and Concrete local and moduli families (all 40 nodes of this part, retaining these six planets). Keep current ids and ownership while the maintainer decides; if the split is not accepted, assembly must select at most six landmarks across the two packets rather than displaying all twelve.

Display membership “General arithmetic families and density”: `ArithmeticStatistics:ST.0/arithmetic-family`, `ArithmeticStatistics:ST.0/relative-density`, `ArithmeticStatistics:ST.0/relative-density-is-multiplicative-in-towers`, `ArithmeticStatistics:ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density`, `ArithmeticStatistics:ST.0/constant-rescaling-of-a-height`, `ArithmeticStatistics:ST.0/piecewise-rescaling-of-a-height`, `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count`, `ArithmeticStatistics:ST.0/weighted-and-unweighted-orbit-counts`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`, `ArithmeticStatistics:ST.0/acceptable-weight-function`, `ArithmeticStatistics:ST.0/binary-quartic-form`, `ArithmeticStatistics:ST.0/binary-quartic-invariants`, `ArithmeticStatistics:ST.0/relative-invariance-of-i-and-j`, `ArithmeticStatistics:ST.0/quartic-discriminant-is-the-polynomial-discriminant`, `ArithmeticStatistics:ST.0/binary-quartic-height`, `ArithmeticStatistics:ST.0/eligible-invariant-pairs`, `ArithmeticStatistics:ST.0/eligible-invariant-pairs-satisfy-the-congruences`, `ArithmeticStatistics:ST.0/congruence-pairs-are-eligible`, `ArithmeticStatistics:ST.0/eligibility-criterion-modulo-27`, `ArithmeticStatistics:ST.0/eligible-pairs-are-nine-lattice-translates`, `ArithmeticStatistics:ST.0/elliptic-curves-over-q-ordered-by-height`, `ArithmeticStatistics:ST.0/quartic-to-curve-height-normalisation`, `ArithmeticStatistics:ST.0/elliptic-families-defined-by-congruence-conditions`, `ArithmeticStatistics:ST.0/all-elliptic-curves-form-a-large-family`, `ArithmeticStatistics:ST.0/invariants-height-and-eligible-pairs`, `ArithmeticStatistics:ST.0/squareclass-height`, `ArithmeticStatistics:ST.0/squareclass-height-fibres-are-selmer-cosets`, `ArithmeticStatistics:ST.0/finiteness-of-squareclasses-of-bounded-height`, `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family`, `ArithmeticStatistics:ST.0/isomorphism-multiplicity-of-the-twist-family`, `ArithmeticStatistics:ST.0/positive-squarefree-family-over-q`, `ArithmeticStatistics:ST.0/squarefree-indicator-as-a-moebius-sum`, `ArithmeticStatistics:ST.0/squarefree-integers-in-residue-classes`, `ArithmeticStatistics:ST.0/even-parity-classes-have-half-density`, `ArithmeticStatistics:ST.0/density-one-in-the-even-parity-classes-is-half-of-all-squarefree`, `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`, `ArithmeticStatistics:ST.0/embedded-and-isomorphism-class-counts-of-number-fields`.

Display membership “Concrete local and moduli families”: `ArithmeticStatistics:ST.0/coefficient-box`, `ArithmeticStatistics:ST.0/monic-weighted-height`, `ArithmeticStatistics:ST.0/binary-local-proportion`, `ArithmeticStatistics:ST.0/binary-density-formulas`, `ArithmeticStatistics:ST.0/kappa-acceptable-specifications`, `ArithmeticStatistics:ST.0/primitive-hypersurface-family`, `ArithmeticStatistics:ST.0/finite-local-hypersurface-set`, `ArithmeticStatistics:ST.0/binary-discriminant`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.0/strong-weak-discriminant`, `ArithmeticStatistics:ST.0/odd-root-criterion`, `ArithmeticStatistics:ST.0/stickelberger-binary`, `ArithmeticStatistics:ST.0/monic-local-proportions`, `ArithmeticStatistics:ST.0/monic-density-formulas`, `ArithmeticStatistics:ST.0/local-maximality`, `ArithmeticStatistics:ST.0/density-denominator-comparisons`, `ArithmeticStatistics:ST.0/negative-pell-radicands`, `ArithmeticStatistics:ST.0/field-permutation-type`, `ArithmeticStatistics:ST.0/twist-denominator-frontier`, `ArithmeticStatistics:ST.0/unpolarized-abelian-count`, `ArithmeticStatistics:ST.0/principally-polarized-count`, `ArithmeticStatistics:ST.0/polarization-fiber-count`, `ArithmeticStatistics:ST.0/natural-bundle-law`, `ArithmeticStatistics:ST.0/bundle-parity-tails`, `ArithmeticStatistics:ST.0/finite-picard-quotient`, `ArithmeticStatistics:ST.0/picard-representatives-and-carry`, `ArithmeticStatistics:ST.0/finite-joint-bundle-mass`, `ArithmeticStatistics:ST.0/theta-tail-normalization`, `ArithmeticStatistics:ST.0/parity-product-candidate`, `ArithmeticStatistics:ST.0/hecke-pushforward`, `ArithmeticStatistics:ST.0/pointless-curve-regression`, `ArithmeticStatistics:ST.0/wood-outside-involutions`, `ArithmeticStatistics:ST.0/wood-admissible-type`, `ArithmeticStatistics:ST.0/wood-good-type`, `ArithmeticStatistics:ST.0/wood-type-automorphisms`, `ArithmeticStatistics:ST.0/wood-continuous-surjections`, `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter`, `ArithmeticStatistics:ST.0/wood-average-normalizations`, `ArithmeticStatistics:ST.0/wood-root-unity-and-tame-comparison`, `ArithmeticStatistics:ST.0/monic-euler-products`.

**Assembly disposition:** no display split applied; choose six landmarks across the present combined layer. The proposal remains available to the maintainer.

### S2/S1

Origin: [ArithmeticStatistics--ST.2](../packets/ArithmeticStatistics--ST.2.json).

Proposal: GeometryOfNumbersAndQuadraticArithmetic, Part II

Reason: Uniform skew-region rank-constrained matrix and saturated row-lattice enumeration is generic geometry of numbers. GN.4 already owns the multiset lattice estimate, and current IntegralLattices owns the underlying integral carriers. Extend the former in its own direction; ST.2 retains only the arithmetic selected-fibre specialization.

Affected: ArithmeticStatistics:ST.2/refinement-even-binary-main-shallow; ArithmeticStatistics:ST.2/refinement-even-binary-restricted-deep-tail

### S2/S2

Origin: [ArithmeticStatistics--ST.2](../packets/ArithmeticStatistics--ST.2.json).

Proposal: ST.2 internal counting routes at packaging

Reason: Organize the existing layer into field-orbit, discriminant-sieve and Selmer/local-density sections without changing its current stage id, ST.1 input or accepted SV.2 edge. The parent six planets remain the assembled layer’s only planets.

Affected: ArithmeticStatistics:ST.2

### S3/S1

Origin: [ArithmeticStatistics--ST.3](../packets/ArithmeticStatistics--ST.3.json).

Action: rescope

Roadmaps: ArithmeticStatistics; tauceti:Completed/EffectiveBounds

Detail: Uniform class-group torsion and relative regulator bounds are shared arithmetic inputs, beyond the archived effective-counting roadmap. They should not be redefined separately in each statistics proof.

Proposal: EffectiveBounds, Part II owns the requested relative torsion/regulator estimates and the BSTTTZ2-torsion saving; ST.3 owns their field-counting and statistical applications.

### S3/S2

Origin: [ArithmeticStatistics--ST.3](../packets/ArithmeticStatistics--ST.3.json).

Action: extend

Roadmaps: tauceti:TauCetiRoadmap/IntegralLattices

Detail: The upstream integral-lattice reduction milestones are reused. The real embedding metric needed for polynomial-order lattices is not necessarily integral.

Proposal: IntegralLattices, Part II exports the requested real positive-definite Gram reduction contract; ST.3 only adapts polynomial/binary-order bases to it.

### S5/S1

Origin: [ArithmeticStatistics--ST.5](../packets/ArithmeticStatistics--ST.5.json).

Kind: partII

Supplier: AdelicAlgebraicGroups

Proposal: AdelicAlgebraicGroups, Part II: Oesterlé–Serre integral-point measure by reduction-image counts and its affine-cover gluing; generic p-adic scheme integration belongs to the existing measure owner.

Requests: R-oesterle-measure

### S5/S2

Origin: [ArithmeticStatistics--ST.5](../packets/ArithmeticStatistics--ST.5.json).

Kind: partII

Supplier: ArithmeticGaloisDuality

Proposal: ArithmeticGaloisDuality, Part II: extend compact/discrete torsion character duality and finite-flat Poitou–Tate to the quadratic restricted-product applications, without duplicating general cohomology or theta-group definitions.

Requests: R-poitou-tate; R-local-global-cohomology

### S5/S3

Origin: [ArithmeticStatistics--ST.5](../packets/ArithmeticStatistics--ST.5.json).

Kind: move-down

Proposal: The exact special three-Selmer analytic-rank-zero criterion is owned by ST.5/refinement-analytic-rank-zero-criterion in tier14. OrdinaryAutomorphicFormsAndModularityLifting in tier20 must import this criterion rather than be an upward prerequisite; its primary proof remains G-analytic.

### S5/S4

Origin: [ArithmeticStatistics--ST.5](../packets/ArithmeticStatistics--ST.5.json).

Kind: ownership

Proposal: Import current IntegralLattices finite quadratic/isotropic-quotient API and current completed RestrictedProducts. The latter’s TauCeti convenience alias postdates the atlas pin; the suggested interfaces use pinned Mathlib RestrictedProduct. Current scalar moment determinacy is already implemented in Tau Ceti from completed OrthogonalL2Bases; StandardDistributions delegates to that owner. Its exponential-integrability hypothesis does not replace Wood’s group moment theorem.

## Collected requests

P is the core packet; S0–S5 are the six refinement packets. R numbers are one-based positions in each packet. A request is not discharged merely by linking a weaker target; the exact condition below governs. All 143 requests are retained.

### P/R1 — tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters

Over ℚ: the predicate IsMinimalPairNF W on W : WeierstrassCurve ℤ (W.IsShortNF and no prime ℓ with ℓ⁴ ∣ a₄ and ℓ⁶ ∣ a₆); the bundle MinimalPairModel E for elliptic E/ℚ with exists_minimalPairModel and minimalPairModel_unique (uniqueness of the integral equation); shortEquationHeight W = max(4|a₄|³, 27a₆²) : ℕ and naiveHeight E (that function on the minimal pair) with naiveHeight_variableChange (invariance under ℚ-isomorphism); and the bounded-height finiteness Set.Finite {W : WeierstrassCurve ℤ | IsMinimalPairNF W ∧ (W.baseChange ℚ).IsElliptic ∧ max (4·|a₄|³) (27·a₆²) ≤ H} for every H. These are Layer 8's stated targets; ST.0 composes them with the invariant map (I, J) = (−3a₄, −27a₆) and does not restate them.

Consumers: [ArithmeticStatistics:ST.0/elliptic-curves-over-q-ordered-by-height](../readmes/ArithmeticStatistics.md#st0-elliptic-curves-over-q-ordered-by-height); [ArithmeticStatistics:ST.0/quartic-to-curve-height-normalisation](../readmes/ArithmeticStatistics.md#st0-quartic-to-curve-height-normalisation); [ArithmeticStatistics:ST.0/elliptic-families-defined-by-congruence-conditions](../readmes/ArithmeticStatistics.md#st0-elliptic-families-defined-by-congruence-conditions); [ArithmeticStatistics:ST.0/all-elliptic-curves-form-a-large-family](../readmes/ArithmeticStatistics.md#st0-all-elliptic-curves-form-a-large-family); [ArithmeticStatistics:ST.0/invariants-height-and-eligible-pairs](../readmes/ArithmeticStatistics.md#st0-invariants-height-and-eligible-pairs).

### P/R2 — tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy

Hasse-Minkowski for ternary forms over a number field: if K is a number field and Q a regular ternary quadratic form over K that is isotropic over every finite completion K_v and every real completion, then Q is isotropic over K (the Layer 5.1 ternary case, with localization by QuadraticForm.baseChange along the actual maps into the completions).

Consumers: [ArithmeticStatistics:ST.1/locally-soluble-quartics-and-the-two-selmer-group](../readmes/ArithmeticStatistics.md#st1-locally-soluble-quartics-and-the-two-selmer-group); [ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-two-selmer](../readmes/ArithmeticStatistics.md#st1-binary-quartic-parametrization-of-two-selmer).

### P/R3 — tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Functoriality of the explicit 2-descent (built in TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil) under a variable change of short Weierstrass curves: for W, W' over a field K with W' obtained by x' = u^2 x, y' = u^3 y (u in K^x), the K-algebra isomorphism W.A = W'.A, T |-> u^2 T, induces a group isomorphism W.M = W'.M that intertwines μ with the induced isomorphism of point groups, commutes with localRes for every field extension L/K, maps localCondition to localCondition, and maps selmerGroup₂ R Loc of W onto that of W'.

Consumers: [ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-two-selmer](../readmes/ArithmeticStatistics.md#st1-binary-quartic-parametrization-of-two-selmer).

### P/R4 — tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

The Layer 7 identification of the explicit etale-algebra 2-Selmer group selmerGroup₂ (Layer 6) with the cohomological Sel_2(E/K) in H^1(K, E[2]), under which μ becomes the Kummer connecting map, together with the exact sequence 0 -> E(K)/2E(K) -> Sel_2(E/K) -> Sha(E/K)[2] -> 0.

Consumers: [ArithmeticStatistics:ST.1/comparison-with-the-cohomological-two-selmer-group](../readmes/ArithmeticStatistics.md#st1-comparison-with-the-cohomological-two-selmer-group).

### P/R5 — DiophantineApproximationAndTranscendence:DT.4

A uniform bound for cubic Thue equations: there is an absolute constant N such that for every binary cubic form g in Z[x, y] with nonzero discriminant, #{(x, y) in Z^2 : g(x, y) = 1} <= N (N = 12 by Delone-Nagell for negative and Evertse (Invent. Math. 73, 1983) for positive discriminant; N = 10 by Bennett (Trans. AMS 353, 2001)). A uniform N of any size suffices (for example via Siegel's identity and the uniform bound for nondegenerate solutions of unit equations, DiophantineApproximationAndTranscendence:DT.2/uniform-bound-nondegenerate-solutions, with the unit rank of the splitting field bounded by 5).

Consumers: [ArithmeticStatistics:ST.1/fibres-of-the-embedding-are-uniformly-bounded](../readmes/ArithmeticStatistics.md#st1-fibres-of-the-embedding-are-uniformly-bounded).

### P/R6 — GeometryOfNumbersAndQuadraticArithmetic:GN.4

Davenport's lemma for bounded semialgebraic multisets (Bhargava-Shankar, Proposition 2.6; Bhargava-Shankar-Tsimerman, Proposition 24), with its projection-volume error and uniform constants: for all n, m, k, ℓ there is a constant C = C(n, m, k, ℓ) such that for every bounded semialgebraic multiset R ⊂ ℝ^n of maximum multiplicity at most m, defined by at most k polynomial inequalities of degree at most ℓ, and for every image R′ of R under an upper or lower triangular unipotent linear map, |#(R′ ∩ ℤ^n) − Vol(R)| ≤ C·max(Vol(R̄), 1), where the lattice points are counted with multiplicity and Vol(R̄) is the largest d-dimensional volume (1 ≤ d ≤ n − 1) of a projection of R onto a coordinate subspace obtained by setting n − d coordinates to 0. The consumers apply it to the affine images (R − v_0)/m to count points of translates v_0 + mℤ^n; the constant must not depend on R beyond (n, m, k, ℓ).

Consumers: [ArithmeticStatistics:ST.2/binary-quartic-lattice-points-in-the-cusp](../readmes/ArithmeticStatistics.md#st2-binary-quartic-lattice-points-in-the-cusp); [ArithmeticStatistics:ST.2/eligible-invariant-pairs-of-bounded-height](../readmes/ArithmeticStatistics.md#st2-eligible-invariant-pairs-of-bounded-height); [ArithmeticStatistics:ST.2/binary-cubic-lattice-points-in-the-cusp](../readmes/ArithmeticStatistics.md#st2-binary-cubic-lattice-points-in-the-cusp).

### P/R7 — AnalyticNumberTheory:AN.5

The divisor bound: for every ε > 0 there is a constant C_ε such that the number d(n) of positive divisors of n satisfies d(n) ≤ C_ε·n^ε for every integer n ≥ 1 (Hardy-Wright, Theorem 315). Mathlib has only d(n) ≤ n (Nat.card_divisors_le_self).

Consumers: [ArithmeticStatistics:ST.2/reducible-binary-quartic-forms-in-the-main-body](../readmes/ArithmeticStatistics.md#st2-reducible-binary-quartic-forms-in-the-main-body); [ArithmeticStatistics:ST.2/reducible-monic-binary-cubic-forms](../readmes/ArithmeticStatistics.md#st2-reducible-monic-binary-cubic-forms); [ArithmeticStatistics:ST.2/reducible-binary-cubic-forms-in-the-main-body](../readmes/ArithmeticStatistics.md#st2-reducible-binary-cubic-forms-in-the-main-body).

### P/R8 — AnalyticNumberTheory:AN.8

The p-adic orbital volume identity for binary cubic forms: for a prime p and a binary cubic form v0 over Z_p with Disc(v0) != 0, with dx the Haar measure on V_{Z_p} = Z_p^4 of total mass 1 and the twisted GL2(Z_p)-action, vol(GL2(Z_p) . v0) = p^{-4} |Disc(v0)|_p #GL2(F_p) / #Stab_{GL2(Z_p)}(v0). Equivalently, |Disc(x)|_p^{-1} dx is GL2(Q_p)-invariant and the orbit map g -> g . v0 has Jacobian p^{-4}|Disc(v0)|_p with respect to the Haar measure of GL2(Z_p) of total mass #GL2(F_p). This is the local density of an orbit of the prehomogeneous space of binary cubic forms (BST Lemma 32).

Consumers: [ArithmeticStatistics:ST.3/p-adic-density-of-a-local-specification](../readmes/ArithmeticStatistics.md#st3-p-adic-density-of-a-local-specification).

### P/R9 — tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-0-the-permutation-representation-of-a-polynomial

For a number field K = Q(alpha) of degree n inside a fixed algebraic closure: the permutation Galois group of K, the image of Gal(Qbar/Q) acting on the n embeddings K -> Qbar, identified with the degree-n action of (minpoly Q alpha).Gal on its roots (Layer 0 comparison milestone), independent of the choice of alpha and of numbering up to conjugacy in S_n.

Consumers: [ArithmeticStatistics:ST.3/number-field-counting-function](../readmes/ArithmeticStatistics.md#st3-number-field-counting-function).

### P/R10 — tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-6-transitive-subgroups-of-sₙ-for-n--5-and-the-label-predicates

The label predicates TransitiveGroupLabel for n <= 5 (in particular 3T1 = C3, 3T2 = S3, 4T5 = S4, 5T5 = S5), invariant under conjugation and renumbering, to restrict counts of cubic, quartic and quintic fields by Galois group.

Consumers: [ArithmeticStatistics:ST.3/number-field-counting-function](../readmes/ArithmeticStatistics.md#st3-number-field-counting-function).

### P/R11 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

(1) For a quadratic field K2: the Hilbert class field and gal_hilbertClassField_equiv_classGroup, giving a bijection between index-3 subgroups of Cl(K2) and unramified cyclic cubic extensions of K2 inside a fixed algebraic closure. (2) For the order O_f of conductor f in K2: ringClassField and gal_ringClassField_equiv_pic, and the characterisation that a cyclic extension L/K2 Galois over Q on which Gal(K2/Q) acts by inversion lies in the ring class field of some O_f, with conductor-discriminant formula Disc(K3) = Disc(K2) f^2 for the cubic subfields K3 of L when L/Q has group S3.

Consumers: [ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields](../readmes/ArithmeticStatistics.md#st3-three-torsion-of-quadratic-class-groups-counts-cubic-fields); [ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse](../readmes/ArithmeticStatistics.md#st3-cubic-fields-totally-ramified-at-large-primes-are-sparse).

### P/R12 — tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups

For an order O_f of conductor f in a quadratic field K2: the exact sequence 1 -> (O_K/fO_K)^x / ((Z/fZ)^x O_K^x) -> Pic(O_f) -> Cl(K2) -> 1 (the congruence description of Pic for quadratic orders), from which #Pic(O_f)[3] <= 3^{omega(f)+2} #Cl(K2)[3].

Consumers: [ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse](../readmes/ArithmeticStatistics.md#st3-cubic-fields-totally-ramified-at-large-primes-are-sparse).

### P/R13 — tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences

For a Galois extension L/Q with group G and a prime P of L over p with inertia group I: the ramification indices of the primes of a subfield L^H above p are the lengths of the orbits of I on G/H (equivalently on the embeddings of L^H), and the inertia group of L/L^N at P is I intersect N for a normal subgroup N; with the tame discriminant exponent v_P(different) = e - 1.

Consumers: [ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent](../readmes/ArithmeticStatistics.md#st3-nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent).

### P/R14 — tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

For an etale cubic Q_p-algebra of the form Q_p x F with F/Q_p a ramified quadratic extension: its discriminant ideal equals that of F, and the discriminant algebra (Q_p(sqrt(disc))) is F.

Consumers: [ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent](../readmes/ArithmeticStatistics.md#st3-nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent).

### P/R15 — tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary

For a number field K and prime p: O_K/pO_K is isomorphic to the product over primes P | p of O_K/P^{e(P)}, and O_K/P^e is isomorphic to F_{p^{f(P)}}[t]/(t^e) (Dedekind-Kummer splitting dictionary), so the splitting type of p is read off from O_K/pO_K.

Consumers: [ArithmeticStatistics:ST.3/splitting-symbol-determines-the-reduction-mod-p](../readmes/ArithmeticStatistics.md#st3-splitting-symbol-determines-the-reduction-mod-p).

### P/R16 — tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant

The tower formula for discriminants: for number fields F subset L, |Disc(L)| = |Disc(F)|^{[L:F]} N_{F/Q}(Disc(L/F)).

Consumers: [ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields](../readmes/ArithmeticStatistics.md#st3-bhargava-shankar-wang-counts-over-number-fields).

### P/R17 — tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one

Reduced positive definite integral binary quadratic forms with the pinned canonical representatives (|b| <= a <= c, and b >= 0 whenever |b| = a or a = c): every positive definite form is SL2(Z)-equivalent to exactly one reduced form (the matrix-orbit to binary-quadratic-form correspondence of Layer 11, item (ix)).

Consumers: [ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms](../readmes/ArithmeticStatistics.md#st3-mertens-count-of-positive-definite-binary-quadratic-forms).

### P/R18 — tauceti:TauCetiRoadmap/Multiquadratic#layer-0-the-multiquadratic-field

Every quadratic field is isomorphic to Q(sqrt d) for a unique squarefree integer d != 0, 1 (Q(sqrt d) and Q(sqrt d') are isomorphic iff d = d' for squarefree d, d').

Consumers: [ArithmeticStatistics:ST.3/count-of-quadratic-fields](../readmes/ArithmeticStatistics.md#st3-count-of-quadratic-fields).

### P/R19 — tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

For every elliptic curve E over Q: the 2-Selmer group Sel_2(E/Q) ⊆ H¹(Q, E[2]) is finite (AEC X.4.2); the Shafarevich–Tate group Ш(E/Q) with the exact sequence 0 → E(Q)/2E(Q) → Sel_2(E/Q) → Ш(E/Q)[2] → 0 of F_2-vector spaces; and the named comparison of Sel_2(E/Q) with the explicit étale-algebra 2-Selmer group selmerGroup₂ of Layer 6, compatible with the descent maps.

Consumers: [ArithmeticStatistics:ST.4/selmer-count-as-weighted-orbit-count](../readmes/ArithmeticStatistics.md#st4-selmer-count-as-weighted-orbit-count); [ArithmeticStatistics:ST.4/average-size-of-the-2-selmer-group-is-three](../readmes/ArithmeticStatistics.md#st4-average-size-of-the-2-selmer-group-is-three); [ArithmeticStatistics:ST.4/two-selmer-rank-identity](../readmes/ArithmeticStatistics.md#st4-two-selmer-rank-identity); [ArithmeticStatistics:ST.4/average-two-rank-of-sha-is-at-most-three-halves](../readmes/ArithmeticStatistics.md#st4-average-two-rank-of-sha-is-at-most-three-halves).

### P/R20 — tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Mordell–Weil for elliptic curves over Q and the explicit 2-descent rank bound: E(Q) finitely generated, #(im μ) = 2^{rank}·#E(Q)[2], and 2^{rank}·#E(Q)[2] ≤ #S for every finite subgroup S of the square classes containing im μ (built at the pin as fg_point_of_numberField, card_range_μ and pow_rank_le_card_of_range_μ_le).

Consumers: [ArithmeticStatistics:ST.4/two-selmer-rank-identity](../readmes/ArithmeticStatistics.md#st4-two-selmer-rank-identity).

### P/R21 — tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

(i) For an elliptic curve E over Q_p, E(Q_p) has a subgroup of finite index isomorphic to (Z_p, +): E_1(Q_p) ≅ Ê(pZ_p) for a minimal model (AEC VII.2.2 with Layer 1's formal group), Ê(p^rZ_p) ≅ (p^rZ_p, +) through the formal logarithm for r > 1/(p − 1) (AEC IV.6.4), E_0(Q_p)/E_1(Q_p) ≅ Ẽ_ns(F_p) finite (AEC VII.2.1) and [E(Q_p) : E_0(Q_p)] finite. (ii) For a Weierstrass equation over Z_p with Δ ≠ 0, the reduction type (good, multiplicative, additive) of its minimal model is locally constant in the coefficients on {Δ ≠ 0}.

Consumers: [ArithmeticStatistics:ST.4/local-two-descent-index](../readmes/ArithmeticStatistics.md#st4-local-two-descent-index); [ArithmeticStatistics:ST.4/families-of-theorems-1-1-and-1-3-have-positive-local-masses](../readmes/ArithmeticStatistics.md#st4-families-of-theorems-1-1-and-1-3-have-positive-local-masses).

### P/R22 — tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters

Every elliptic curve over Q is isomorphic to E_{A,B} for a unique minimal pair (A, B) (IsMinimalPairNF with exists_minimalPairModel and minimalPairModel_unique), so that Q-isomorphism classes of naive height < X correspond to minimal pairs with max{4|A|³, 27B²} < X.

Consumers: [ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family](../readmes/ArithmeticStatistics.md#st4-count-of-curves-in-a-large-family).

### P/R23 — SelmerIwasawaCohomology:L2

For an elliptic curve E over a number field F and a prime p: the discrete p^∞-Selmer group Sel_{p^∞}(E/F) (direct limit of the Kummer Selmer groups Sel_{p^k}), its structure (ℚ_p/ℤ_p)^c ⊕ (finite) and the corank c = corank_{ℤ_p} Sel_{p^∞}(E/F) = dim_{ℚ_p} Hom(Sel_{p^∞}, ℚ_p/ℤ_p) ⊗ ℚ_p; the exact sequence 0 → E(F)[p^∞]/p^k → Sel_{p^k}(E/F) → Sel_{p^∞}(E/F)[p^k] → 0; and, per the confirmed fix of RT-PAPER-BURUNGALE-TIAN-26/15 (item isogeny-selmer-corank), for an F-isogeny φ : E → E' the equality corank_{ℤ_p} Sel_{p^∞}(E/F) = corank_{ℤ_p} Sel_{p^∞}(E'/F) for every p (φ and φ̂ induce maps whose composites are [deg φ]).

Consumers: [ArithmeticStatistics:ST.5/p-infinity-selmer-corank-distribution-in-twist-families](../readmes/ArithmeticStatistics.md#st5-p-infinity-selmer-corank-distribution-in-twist-families); [ArithmeticStatistics:ST.5/smith-selmer-rank-limit-equals-corank](../readmes/ArithmeticStatistics.md#st5-smith-selmer-rank-limit-equals-corank); [ArithmeticStatistics:ST.5/reduced-p-selmer-rank-bounds-the-corank](../readmes/ArithmeticStatistics.md#st5-reduced-p-selmer-rank-bounds-the-corank); [ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half](../readmes/ArithmeticStatistics.md#st5-cm-twists-have-corank-zero-at-least-half); [ArithmeticStatistics:ST.5/bklpr-selmer-conjecture](../readmes/ArithmeticStatistics.md#st5-bklpr-selmer-conjecture).

### P/R24 — SelmerIwasawaCohomology:L4

Per the confirmed fix of RT-PAPER-BURUNGALE-TIAN-26/14 (item congruent-2-parity): for E : y² = x³ − x and every positive squarefree n ≡ 1, 2, 3 (mod 8), corank_{ℤ_2} Sel_{2^∞}(E^(n)/ℚ) is even, where E^(n) : ny² = x³ − x. Source route: 2-parity (−1)^{corank_{ℤ_2} Sel_{2^∞}(E^(n)/ℚ)} = w(E^(n)/ℚ) (Monsky, Math. Z. 221 (1996); T. Dokchitser, Notes on the parity conjecture, Theorem 5.1, for curves with a rational 2-torsion point) together with the root numbers w(E^(n)/ℚ) = +1 exactly for positive squarefree n ≡ 1, 2, 3 mod 8 (Birch–Stephens; item congruent-root-number at RankZeroOneBSD:BSD.0).

Consumers: [ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law](../readmes/ArithmeticStatistics.md#st5-even-congruent-twists-have-corank-zero-given-smith-law).

### P/R25 — SelmerIwasawaCohomology:L1

For an isogeny φ : E → E' of elliptic curves over a number field and every place v: the images of the local Kummer maps E'(F_v)/φE(F_v) → H¹(F_v, E[φ]) and E(F_v)/φ̂E'(F_v) → H¹(F_v, E'[φ̂]) are exact annihilators of each other under local Tate duality for the Weil pairing E[φ] × E'[φ̂] → μ_{deg φ}, so that Sel_φ(E) and Sel_φ̂(E') are dual Selmer structures.

Consumers: [ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula](../readmes/ArithmeticStatistics.md#st5-cassels-isogeny-selmer-ratio-formula).

### P/R26 — ArithmeticGaloisDuality:R02.4

The Greenberg–Wiles (Poitou–Tate) Euler characteristic formula for a finite Galois module M over a number field F with a Selmer structure L and its dual structure L^* on M^∨(1): #Sel_L(M)/#Sel_{L^*}(M^∨(1)) = (#H⁰(F, M)/#H⁰(F, M^∨(1))) · ∏_v #L_v/#H⁰(F_v, M).

Consumers: [ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula](../readmes/ArithmeticStatistics.md#st5-cassels-isogeny-selmer-ratio-formula).

### P/R27 — ComplexMultiplicationAndExplicitReciprocity:CM.1

Per the confirmed finding RT-PAPER-BURUNGALE-TIAN-26/16, for elliptic curves over a number field F containing an imaginary quadratic K with End_F(E) an order O ⊆ O_K: the order and ideal action; for an invertible ideal 𝔭 of norm 3 the ideal-kernel isogeny E → E/E[𝔭] of degree 3 with End(E/E[𝔭]) ≅ O_K when End(E) ≅ O_K; existence, for each ideal class, of a prime ideal representative of norm ℓ ≠ 3 and the corresponding ℓ-isogeny E' → E; the normalised action of O_K on the invariant differential (a ∈ O_K acts on the formal group with derivative a at the origin, so |a'(0)|_v = |a|_v); a K-isogeny from a curve with CM by an order to one with CM by O_K (Rubin, Cetraro notes, Prop. 5.3); and invariance of End under quadratic twist.

Consumers: [ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one](../readmes/ArithmeticStatistics.md#st5-cm-three-isogeny-has-selmer-ratio-one); [ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half](../readmes/ArithmeticStatistics.md#st5-cm-twists-have-corank-zero-at-least-half); [ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction](../readmes/ArithmeticStatistics.md#st5-cm-curves-have-a-twist-with-good-reduction).

### P/R28 — ComplexMultiplicationAndExplicitReciprocity:CM.3

The j-invariant of an elliptic curve with complex multiplication is an algebraic integer.

Consumers: [ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction](../readmes/ArithmeticStatistics.md#st5-cm-curves-have-a-twist-with-good-reduction).

### P/R29 — InverseGaloisAndArithmeticFundamentalGroups:IG.2

Counting form of Hilbert irreducibility for ℚ(A, B): a thin subset of ℤ² has o(X^{5/6}) points in the box |A| ≤ X^{1/3}, |B| ≤ X^{1/2} (more precisely O(X^{5/6 − δ}) for some δ > 0, after Cohen–Serre).

Consumers: [ArithmeticStatistics:ST.5/rational-p-torsion-has-density-zero](../readmes/ArithmeticStatistics.md#st5-rational-p-torsion-has-density-zero).

### P/R30 — SieveMethodsAndPrimePatterns:SV.2

Large-sieve bounds for bilinear sums of quadratic symbols (a/p)(p/q) over squarefree integers with prescribed prime factors, as used by Kane §§5–7 to bound the non-principal 'character' terms in the moments of #Sel_2(E_b).

Consumers: [ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families](../readmes/ArithmeticStatistics.md#st5-two-selmer-distribution-in-full-two-torsion-twist-families).

### P/R31 — tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv

Isogenies of elliptic curves, the dual isogeny, the invariant differential and formal groups, with the derivative at the origin of the formal-group map induced by an isogeny (used in the Schaefer formula c(φ) = c(E')/c(E)·|φ'(0)|^{−1}) and Vélu's formula for 2-isogenies.

Consumers: [ArithmeticStatistics:ST.5/local-selmer-ratio-via-tamagawa-numbers](../readmes/ArithmeticStatistics.md#st5-local-selmer-ratio-via-tamagawa-numbers); [ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one](../readmes/ArithmeticStatistics.md#st5-cm-three-isogeny-has-selmer-ratio-one); [ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half](../readmes/ArithmeticStatistics.md#st5-cm-twists-have-corank-zero-at-least-half).

### P/R32 — tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Over a p-adic field: minimal models, reduction types (Tate's algorithm, Kodaira types), the filtration E(F) ⊇ E_0(F) ⊇ E_1(F) and the Tamagawa number c = #E(F)/E_0(F); the Néron–Ogg–Shafarevich criterion and potential good reduction for integral j.

Consumers: [ArithmeticStatistics:ST.5/local-selmer-ratio-via-tamagawa-numbers](../readmes/ArithmeticStatistics.md#st5-local-selmer-ratio-via-tamagawa-numbers); [ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction](../readmes/ArithmeticStatistics.md#st5-tamagawa-ratio-under-potentially-good-reduction); [ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction](../readmes/ArithmeticStatistics.md#st5-cm-curves-have-a-twist-with-good-reduction).

### P/R33 — tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5

The quadratic twist E^s of an elliptic curve by F(√s)/F (WeierstrassCurve.quadraticTwist), its points as the (−1)-eigenspace for the twisting character, twists of isogenies, and the isomorphism ny² = x³ − x ≅ y² = x³ − n²x.

Consumers: [ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law](../readmes/ArithmeticStatistics.md#st5-even-congruent-twists-have-corank-zero-given-smith-law); [ArithmeticStatistics:ST.5/finitely-many-twists-with-rational-p-torsion](../readmes/ArithmeticStatistics.md#st5-finitely-many-twists-with-rational-p-torsion); [ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction](../readmes/ArithmeticStatistics.md#st5-cm-curves-have-a-twist-with-good-reduction); [ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half](../readmes/ArithmeticStatistics.md#st5-cm-twists-have-corank-zero-at-least-half).

### P/R34 — tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Mordell–Weil: E(ℚ) finitely generated, so rank E(ℚ) ≥ 2 gives (ℤ/n)² ↪ E(ℚ)/nE(ℚ).

Consumers: [ArithmeticStatistics:ST.5/selmer-average-conjecture-implies-rank-at-most-one](../readmes/ArithmeticStatistics.md#st5-selmer-average-conjecture-implies-rank-at-most-one).

### P/R35 — tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

Selmer structures on finite Galois modules and the elliptic Selmer groups Sel_m(E/F) and Sel_φ(E/F) for isogenies φ (Kummer local conditions), the Kummer injection E(F)/mE(F) ↪ Sel_m(E/F), Ш(E/F) and the m-descent exact sequence.

Consumers: [ArithmeticStatistics:ST.5/average-rank-bound-from-the-3-selmer-average](../readmes/ArithmeticStatistics.md#st5-average-rank-bound-from-the-3-selmer-average); [ArithmeticStatistics:ST.5/selmer-average-conjecture-implies-rank-at-most-one](../readmes/ArithmeticStatistics.md#st5-selmer-average-conjecture-implies-rank-at-most-one); [ArithmeticStatistics:ST.5/bklpr-conjecture-implies-rank-and-selmer-laws](../readmes/ArithmeticStatistics.md#st5-bklpr-conjecture-implies-rank-and-selmer-laws); [ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families](../readmes/ArithmeticStatistics.md#st5-two-selmer-distribution-in-full-two-torsion-twist-families); [ArithmeticStatistics:ST.5/smith-selmer-rank-limit-equals-corank](../readmes/ArithmeticStatistics.md#st5-smith-selmer-rank-limit-equals-corank); [ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law](../readmes/ArithmeticStatistics.md#st5-even-congruent-twists-have-corank-zero-given-smith-law); [ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups](../readmes/ArithmeticStatistics.md#st5-bklos-average-size-of-three-isogeny-selmer-groups); [ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula](../readmes/ArithmeticStatistics.md#st5-cassels-isogeny-selmer-ratio-formula); [ArithmeticStatistics:ST.5/isogeny-factorisation-selmer-exact-sequence](../readmes/ArithmeticStatistics.md#st5-isogeny-factorisation-selmer-exact-sequence); [ArithmeticStatistics:ST.5/three-isogeny-selmer-parity](../readmes/ArithmeticStatistics.md#st5-three-isogeny-selmer-parity); [ArithmeticStatistics:ST.5/reduced-p-selmer-rank-bounds-the-corank](../readmes/ArithmeticStatistics.md#st5-reduced-p-selmer-rank-bounds-the-corank); [ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half](../readmes/ArithmeticStatistics.md#st5-cm-twists-have-corank-zero-at-least-half); [ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound](../readmes/ArithmeticStatistics.md#st5-function-field-3-selmer-average-bound).

### P/R36 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The absolute local Artin map for a p-adic field F_v, identifying the image of inertia in G_{F_v}^{ab} with the image of O_v^×, so that every finite-order character of inertia with values in an abelian group and trivial on commutators extends to G_{F_v}.

Consumers: [ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction](../readmes/ArithmeticStatistics.md#st5-cm-curves-have-a-twist-with-good-reduction).

### P/R37 — GeometryOfNumbersAndQuadraticArithmetic:GN.0

Browning–Le Boudec–Sawin, Lemma 3.9 (PAPER-BROWNING-LEBOUDEC-SAWIN-23/congruence-det, routed to GN.0): for N ≥ 2, Q ≥ 1 and linearly independent primitive c, d ∈ ℤ^N, the lattice Λ^{(Q)}_c ∩ Λ^{(Q)}_d, where Λ^{(Q)}_c = {y ∈ ℤ^N : ⟨c, y⟩ ≡ 0 mod Q}, has determinant (index in ℤ^N) Q²/gcd(G(c, d), Q), G(c, d) being the gcd of the 2×2 minors of (c, d).

Consumers: [ArithmeticStatistics:ST.5/two-point-incidence-count](../readmes/ArithmeticStatistics.md#st5-two-point-incidence-count).

### P/R38 — GeometryOfNumbersAndQuadraticArithmetic:GN.2

The model ring with positive involution R_{L,n} = ∏_i M_{n_i}(O_{L_i}) of Lipnowski–Tsimerman Definition 5.1 (L_i distinct CM fields, ∗ = conjugate transpose; PAPER-LIPNOWSKI-TSIMERMAN-18/model-ring), and its quaternionic analogue M_m(O_D) for a maximal order O_D of the definite quaternion algebra D over ℚ(√p) ramified exactly at the two infinite places, with the canonical involution composed with transpose.

Consumers: [ArithmeticStatistics:ST.5/model-ring-orbit-count-concentration](../readmes/ArithmeticStatistics.md#st5-model-ring-orbit-count-concentration); [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor).

### P/R39 — GeometryOfNumbersAndQuadraticArithmetic:GN.3

(a) The orbit count n_{L,n} of R_{L,n}^× on positive symmetric units under a ↦ γ*aγ (PAPER-LIPNOWSKI-TSIMERMAN-18/model-orbit-count) and the corrected bound (55) (model-count-source, E13): log n_{L,n} ≤ (1/2)Σ_i [K_i:ℚ]n_i² log n_i + O_p(g²) where Σ_i [K_i:ℚ]n_i = g and the L_i arise from p-Weil numbers. (b) For the quaternionic model: the number n_D(m) of GL_m(O_D)-orbits on positive definite quaternion-hermitian matrices in GL_m(O_D) satisfies log n_D(m) ≤ 2m² log m + O_p(m²) (from the mass of unimodular quaternion-hermitian lattices, ∏_{i≤m}|ζ_{ℚ(√p)}(1 − 2i)| up to exp(O(m²)), and the automorphism-group bound).

Consumers: [ArithmeticStatistics:ST.5/model-ring-orbit-count-concentration](../readmes/ArithmeticStatistics.md#st5-model-ring-orbit-count-concentration); [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor).

### P/R40 — AbelianSchemesAndArithmeticModuli:A2

Principal polarizations of abelian varieties over a field, isomorphisms of polarized abelian varieties, and the count n_A of isomorphism classes of principal polarizations on A as Aut(A)-orbits (PAPER-LIPNOWSKI-TSIMERMAN-18/polarization, polarized-isomorphism, polarization-orbits).

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor).

### P/R41 — AbelianSchemesAndArithmeticModuli:A6

Poincaré complete reducibility up to isogeny and the semisimple rational endomorphism algebra End⁰(A) = ∏ M_{n_i}(End⁰(A_i)) (PAPER-LIPNOWSKI-TSIMERMAN-18/poincare-decomposition, rational-endomorphism).

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor).

### P/R42 — tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

The Hasse bound |#E(𝔽_q) − q − 1| ≤ 2√q for an elliptic curve over a finite field 𝔽_q, used for q = p and q = p².

Consumers: [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs).

### P/R43 — InverseGaloisAndArithmeticFundamentalGroups:IG.5

Arithmetic Hurwitz schemes and their point counts, as used by EVW §§7–8, Wood 2019 §4 and LWZB §§10–12: (a) for a finite group G and a rational union of classes c generating G, the scheme Hn^c_{G,n} of tame G-covers of P¹ branched at n points of A¹ (and possibly ∞) with finite inertia in c, finite étale over Conf_n over Z[1/|G|], whose k-points for G centre-free and any field k of characteristic prime to |G| are the isomorphism classes of such covers defined over k (EVW §§7.1, 7.3; PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /63–/65); (b) the tame cohomological specialization of EVW Proposition 7.7 with Z/λ^k and Q_λ coefficients (/68) and Lemma 10.3 of LWZB; (c) Wood's marked scheme CHur^{c,g}_{F,m} with Theorem 4.5(1)–(3) (points = marked (F, c)-extensions of the prescribed infinity type; stable Frobenius-fixed components ↔ fixed lifting invariants) and the uniform component estimate |#C(F_q) − q^n| ≤ K_n q^{n−1/2} of Theorem 4.7, and the q-uniform component bound D_d (PAPER-WOOD-19 /77–/80, /86, /88, /314); (d) LWZB's Hur^n_{G,c} with Lemma 10.2 (points count N(H, Γ, q^n, F_q(t))), Lemma 10.3 and Theorem 10.4 (Frobenius-fixed components of G- and Γ-schemes agree up to O_G(n^{d_Γ(q)−2}) with a lower bound C_G n^{d_Γ(q)−1}) (PAPER-LIU-WOOD-ZUREICKBROWN-24 /30–/34, /37, /38, /40, /41).

Consumers: [ArithmeticStatistics:ST.5/hurwitz-points-classify-class-group-surjections](../readmes/ArithmeticStatistics.md#st5-hurwitz-points-classify-class-group-surjections); [ArithmeticStatistics:ST.5/geometric-generic-fibre-of-the-unmarked-hurwitz-cover](../readmes/ArithmeticStatistics.md#st5-geometric-generic-fibre-of-the-unmarked-hurwitz-cover); [ArithmeticStatistics:ST.5/uniform-function-field-surjection-moment-estimate](../readmes/ArithmeticStatistics.md#st5-uniform-function-field-surjection-moment-estimate); [ArithmeticStatistics:ST.5/imaginary-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-per-component-unit-moment); [ArithmeticStatistics:ST.5/real-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-real-per-component-unit-moment); [ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-normalized-nonabelian-moment); [ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-real-normalized-nonabelian-moment); [ArithmeticStatistics:ST.5/bad-type-lower-bound](../readmes/ArithmeticStatistics.md#st5-bad-type-lower-bound); [ArithmeticStatistics:ST.5/whole-fixed-degree-component-profile](../readmes/ArithmeticStatistics.md#st5-whole-fixed-degree-component-profile); [ArithmeticStatistics:ST.5/complete-stable-range-component-sum](../readmes/ArithmeticStatistics.md#st5-complete-stable-range-component-sum); [ArithmeticStatistics:ST.5/moment-minus-component-profile-vanishes](../readmes/ArithmeticStatistics.md#st5-moment-minus-component-profile-vanishes); [ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments](../readmes/ArithmeticStatistics.md#st5-liu-wood-zureick-brown-function-field-moments).

### P/R44 — InverseGaloisAndArithmeticFundamentalGroups:IG.0

Galois-category dictionary for finite étale covers of connected (Deligne–Mumford) bases: connected components of a finite étale cover are orbits of the geometric fundamental group on the geometric generic fibre; over F_q a component is defined over F_q iff Frobenius preserves the orbit; a dense open immersion into a connected normal base and a representable smooth surjection with geometrically connected fibres induce surjections on étale π₁ (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /127, /132, /133).

Consumers: [ArithmeticStatistics:ST.5/monodromy-orbits-and-rational-components](../readmes/ArithmeticStatistics.md#st5-monodromy-orbits-and-rational-components); [ArithmeticStatistics:ST.5/mod-l-hyperelliptic-monodromy-is-symplectic](../readmes/ArithmeticStatistics.md#st5-mod-l-hyperelliptic-monodromy-is-symplectic); [ArithmeticStatistics:ST.5/monodromy-of-the-odd-degree-polynomial-family](../readmes/ArithmeticStatistics.md#st5-monodromy-of-the-odd-degree-polynomial-family).

### P/R45 — InverseGaloisAndArithmeticFundamentalGroups:IG.1

The arithmetic/geometric fundamental-group exact sequence for geometrically connected schemes over F_q; the labelled odd-degree hyperelliptic family adapter: the lifted affine group B_n, its connectedness, and the quotient presentation [PConf_n/B_n] ≃ H̃_g^{sm} keeping the hyperelliptic involution (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /128–/131, /136); and the corrected Achter–Pries exact sequence 1 → (A ∩ Sp)/G → A/G → χ_λ(G_F) → 1 for the arithmetic and geometric images (/137).

Consumers: [ArithmeticStatistics:ST.5/monodromy-orbits-and-rational-components](../readmes/ArithmeticStatistics.md#st5-monodromy-orbits-and-rational-components); [ArithmeticStatistics:ST.5/monodromy-of-the-odd-degree-polynomial-family](../readmes/ArithmeticStatistics.md#st5-monodromy-of-the-odd-degree-polynomial-family); [ArithmeticStatistics:ST.5/hyperelliptic-boundary-degeneration](../readmes/ArithmeticStatistics.md#st5-hyperelliptic-boundary-degeneration).

### P/R46 — InverseGaloisAndArithmeticFundamentalGroups:IG.4

Wood's Proposition 4.4 (PAPER-WOOD-19 /73–/75): for admissible G′ ≤ G ≀ S₂ and a ramified infinity type with image the distinguished swap, pairs (K, ρ) of the prescribed imaginary type correspond bijectively to marked (G′, c)-extensions of that infinity type, triples (K, ρ, y) of real type to marked extensions of trivial infinity type, with Disc M = Disc K^{|G′|/2}; and LWZB Definition 2.1 (the distinguished section and Γ-action on Gal(K^#/K)) (PAPER-LIU-WOOD-ZUREICKBROWN-24 /6).

Consumers: [ArithmeticStatistics:ST.5/imaginary-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-per-component-unit-moment); [ArithmeticStatistics:ST.5/real-per-component-unit-moment](../readmes/ArithmeticStatistics.md#st5-real-per-component-unit-moment); [ArithmeticStatistics:ST.5/bad-type-lower-bound](../readmes/ArithmeticStatistics.md#st5-bad-type-lower-bound); [ArithmeticStatistics:ST.5/moment-minus-component-profile-vanishes](../readmes/ArithmeticStatistics.md#st5-moment-minus-component-profile-vanishes); [ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions](../readmes/ArithmeticStatistics.md#st5-counting-unramified-h-extensions-via-semidirect-extensions).

### P/R47 — FunctionFieldArithmetic:FA.4

Class field theory of global function fields: for a quadratic extension L of F_q(t) ramified at ∞ with a unique rational point above ∞, Cl(O_L) ≅ Pic⁰(C_L)(F_q), and the Galois group J_L of the maximal abelian unramified pro-ℓ extension (ℓ ∤ q) sits in 0 → Cl(O_L)_ℓ → J_L → Ẑ_ℓ → 0 compatibly with Gal(L/K); étale abelian A-covers of a curve over an algebraically closed field of characteristic prime to |A| correspond to surjections from Jac[ℓ^k]; for a Γ-extension K of F_q(t), Gal(K^#/K)^{ab} is the prime-to-q(q − 1)|Γ| part of Cl(O_K) (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /85; LWZB §1).

Consumers: [ArithmeticStatistics:ST.5/involution-quotient-of-the-unramified-pro-l-group](../readmes/ArithmeticStatistics.md#st5-involution-quotient-of-the-unramified-pro-l-group); [ArithmeticStatistics:ST.5/hurwitz-points-classify-class-group-surjections](../readmes/ArithmeticStatistics.md#st5-hurwitz-points-classify-class-group-surjections); [ArithmeticStatistics:ST.5/geometric-generic-fibre-of-the-unmarked-hurwitz-cover](../readmes/ArithmeticStatistics.md#st5-geometric-generic-fibre-of-the-unmarked-hurwitz-cover); [ArithmeticStatistics:ST.5/cohen-lenstra-martinet-moments-over-function-fields](../readmes/ArithmeticStatistics.md#st5-cohen-lenstra-martinet-moments-over-function-fields).

### P/R48 — SchemeAndStackFoundations:SF.2

The Grothendieck–Lefschetz trace formula |X(F_q)| = Σ_j (−1)^j Tr(Frob | H^j_c(X_{F̄_q}, Q_λ)) for separated schemes of finite type over F_q and primes λ ∤ q, with compactly supported cohomology (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /93).

Consumers: [ArithmeticStatistics:ST.5/top-cohomology-counts-rational-components](../readmes/ArithmeticStatistics.md#st5-top-cohomology-counts-rational-components); [ArithmeticStatistics:ST.5/uniform-trace-error-estimate](../readmes/ArithmeticStatistics.md#st5-uniform-trace-error-estimate); [ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments](../readmes/ArithmeticStatistics.md#st5-liu-wood-zureick-brown-function-field-moments).

### P/R49 — EtaleDualityAndPerverseSheaves:EDC.2

Poincaré duality for smooth separated schemes of pure dimension n over F̄_q with Q_λ coefficients, Frobenius-compatibly: H^j_c ≅ H^{2n−j}(−n)^∨, in particular H^{2n}_c of a geometrically connected smooth component is Q_λ(−n) (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /91).

Consumers: [ArithmeticStatistics:ST.5/top-cohomology-counts-rational-components](../readmes/ArithmeticStatistics.md#st5-top-cohomology-counts-rational-components); [ArithmeticStatistics:ST.5/uniform-trace-error-estimate](../readmes/ArithmeticStatistics.md#st5-uniform-trace-error-estimate).

### P/R50 — DeligneWeightsAndPurity:DWP.7

Deligne's weight bound: for X separated of finite type over F_q and λ ∤ q, every eigenvalue of geometric Frobenius on H^j_c(X_{F̄_q}, Q_λ) has all complex absolute values ≤ q^{j/2} (Weil II, Théorème 1) (PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 /92).

Consumers: [ArithmeticStatistics:ST.5/uniform-trace-error-estimate](../readmes/ArithmeticStatistics.md#st5-uniform-trace-error-estimate); [ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments](../readmes/ArithmeticStatistics.md#st5-liu-wood-zureick-brown-function-field-moments).

### P/R51 — AbelianSchemesAndArithmeticModuli:A3

For a principally polarized abelian scheme (the Jacobian of the relative curve y² = f(x)) over a base where ℓ is invertible: [ℓ^m] is finite étale of rank ℓ^{2mg}, the ℓ^m-torsion is a locally constant sheaf of free Z/ℓ^m-modules of rank 2g, and the Weil pairing induced by the polarization is perfect and alternating with values in μ_{ℓ^m}; the Tate-module pairing with its Tate twist.

Consumers: [ArithmeticStatistics:ST.5/hyperelliptic-torsion-local-system](../readmes/ArithmeticStatistics.md#st5-hyperelliptic-torsion-local-system).

### P/R52 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

The Jacobian (Pic⁰) of a smooth projective geometrically connected curve with a rational point, in families (relative Picard scheme), as the abelian scheme whose torsion is used for the hyperelliptic family y² = f(x) and for stable curves of compact type.

Consumers: [ArithmeticStatistics:ST.5/hyperelliptic-torsion-local-system](../readmes/ArithmeticStatistics.md#st5-hyperelliptic-torsion-local-system); [ArithmeticStatistics:ST.5/hyperelliptic-boundary-degeneration](../readmes/ArithmeticStatistics.md#st5-hyperelliptic-boundary-degeneration).

### P/R53 — GeometryOfNumbersAndQuadraticArithmetic:GN.0

The general gcd of maximal minors (Browning–Le Boudec–Sawin, Definition 3.7; PAPER-BROWNING-LEBOUDEC-SAWIN-23/minor-gcd, routed to GN.0): for linearly independent c_1, …, c_k ∈ ℤ^N with 1 ≤ k ≤ N, G(c_1, …, c_k) is the positive gcd of all k×k minors of the column matrix, with its unimodular invariance and its identification with the index of the lattice spanned by c_1, …, c_k in its saturation. ST.5/coefficient-vector-form's two-vector G(u, w) is the case k = 2 and should import this definition rather than define a second one; no GN.0 node supplies it yet (FIX-RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23). For the finite-residue application also supply the canonical nonnegative-gcd extension to arbitrary columns, including value 0 when all maximal minors vanish (or there are no such minors). The positive-gcd/saturation-index identification is asserted only for independent columns with 1 ≤ k ≤ N. In the rank-two dependent case gcd(G(u,w), p^r) = p^r, which represents the capped valuation r. This extension is requested from the same owner, not presented as part of BLS’s independent-column Definition 3.7.

Consumers: [ArithmeticStatistics:ST.5/coefficient-vector-form](../readmes/ArithmeticStatistics.md#st5-coefficient-vector-form); [ArithmeticStatistics:ST.5/veronese-minor-valuation](../readmes/ArithmeticStatistics.md#st5-veronese-minor-valuation).

### P/R54 — SchemeAndStackFoundations:SF.0

For affine finite-type schemes, finite decomposition into irreducible closed subsets; dimension of the closure Z of a coordinate projection of an integral d-dimensional Y differs from d by at most one, with Y=Z×A¹ in the dimension-drop case and a polynomial relation with nonvanishing leading coefficient in the equal-dimension case; a proper closed subset of an integral finite-dimensional variety has smaller dimension. Over Z, the generic-fibre dimension bound and spreading finitely many equations, radical containments and component coverings to Z[1/N] must preserve these data outside finitely many primes. Also the codimension-at-least-two conclusion for two coprime rational polynomials when the first is primitive over Z. Reuse existing dimension and polynomial declarations; this request is for the precise affine/projection/spreading adapters, not a second dimension theory.

Consumers: [ArithmeticStatistics:ST.2/lattice-points-on-a-subvariety-in-a-dilated-region](../readmes/ArithmeticStatistics.md#st2-lattice-points-on-a-subvariety-in-a-dilated-region); [ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p](../readmes/ArithmeticStatistics.md#st2-uniform-bound-for-points-of-a-subscheme-modulo-p); [ArithmeticStatistics:ST.2/geometric-sieve-large-primes](../readmes/ArithmeticStatistics.md#st2-geometric-sieve-large-primes); [ArithmeticStatistics:ST.2/strong-divisibility-lies-on-a-codimension-two-locus](../readmes/ArithmeticStatistics.md#st2-strong-divisibility-lies-on-a-codimension-two-locus).

### P/R55 — AbelianSchemesAndArithmeticModuliPartII:F0

Frobenius polynomials of abelian varieties over finite fields, their product/isogeny compatibilities and #A(F_{q^r})=det(1−Frob^r).

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor); [ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs](../readmes/ArithmeticStatistics.md#st5-spacing-measure-discrepancy-for-ppavs); [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs).

### P/R56 — AbelianSchemesAndArithmeticModuliPartII:F3

For simple A/F_p with nonreal Frobenius, End⁰(A) is the CM field Q(Frob) of degree 2 dim A; retain the real-Weil isogeny-class exception.

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor); [ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs](../readmes/ArithmeticStatistics.md#st5-spacing-measure-discrepancy-for-ppavs); [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs).

### P/R57 — AbelianSchemesAndArithmeticModuliPartII:F5

For the stated splitting primes p, a class-number-one CM elliptic curve E0/F_p with log n_{E0^g}=(1/2)g² log g+O_p(g²); and for odd p, E(F_p) and E(F_{p²}) are not both p-groups.

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor); [ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs](../readmes/ArithmeticStatistics.md#st5-spacing-measure-discrepancy-for-ppavs); [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs).

### P/R58 — AbelianSchemesAndArithmeticModuliPartII:F6

The corrected unconditional growth bound log B(p,g)=O_p(g²) for fixed prime p; no unconditional 69/4 coefficient is consumed.

Consumers: [ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor](../readmes/ArithmeticStatistics.md#st5-most-ppavs-have-a-large-elliptic-or-real-weil-factor); [ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs](../readmes/ArithmeticStatistics.md#st5-spacing-measure-discrepancy-for-ppavs); [ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs](../readmes/ArithmeticStatistics.md#st5-enhanced-cohen-lenstra-fails-for-ppavs).

### P/R59 — InductionRestrictionPartII:RS.4

For odd q coprime to |G′| and g∈c∪{1}, the compatible degree-m fixed fiber has |H₂(G′,c)[q−1]| points exactly when its lift-square obstruction lies in the required torsion-image filtration, and otherwise has zero points; parity specializations and surviving-parity rank data.

Consumers: [ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-imaginary-normalized-nonabelian-moment); [ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment](../readmes/ArithmeticStatistics.md#st5-real-normalized-nonabelian-moment); [ArithmeticStatistics:ST.5/bad-type-lower-bound](../readmes/ArithmeticStatistics.md#st5-bad-type-lower-bound); [ArithmeticStatistics:ST.5/complete-stable-range-component-sum](../readmes/ArithmeticStatistics.md#st5-complete-stable-range-component-sum).

### S0/R1 — ArithmeticStatistics:ST.1

Fixed-degree binary-form ring R_f, discriminant preservation over Z and arbitrary residue rings, p-maximality criterion at infinity, projective root multiplicities, and the routed BGW/BSW general-rank representation and orbit targets listed in targetCoverage. The current parent ST.1 plans the low-degree/core orbit dictionary; these general-rank source routes remain that stage’s work. Supply also the monic quotient-order interpretation of the Dedekind criterion, with p-maximality equivalent to avoiding (p²,pu,u²) for every monic irreducible u modulo p.

Consumers: [ArithmeticStatistics:ST.0/odd-root-criterion](../readmes/ArithmeticStatistics.md#st0-odd-root-criterion); [ArithmeticStatistics:ST.0/binary-density-formulas](../readmes/ArithmeticStatistics.md#st0-binary-density-formulas); [ArithmeticStatistics:ST.0/stickelberger-binary](../readmes/ArithmeticStatistics.md#st0-stickelberger-binary); [ArithmeticStatistics:ST.0/local-maximality](../readmes/ArithmeticStatistics.md#st0-local-maximality).

### S0/R2 — ArithmeticStatistics:ST.2

Northcott finiteness for irreducible GL₂(Z)-classes of integral binary quartics at bounded invariant height, proved by the accepted fundamental-domain/cusp plan (the t≤Cλ cutoff bounds every coefficient). Also the BSW monic/binary infinite-prime tail estimates, needed before local products become global densities.

Consumers: [ArithmeticStatistics:ST.0/monic-euler-products](../readmes/ArithmeticStatistics.md#st0-monic-euler-products); [ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count](../readmes/ArithmeticStatistics.md#st0-stabilizer-weighted-orbit-count).

### S0/R3 — AnalyticNumberTheory:AN.4

For each compatible finite local squareclass specification over a number field, count squarefree ideals in the relevant ray classes modulo Cl(F)² with the necessary finite-order Hecke-character estimates, compute the unit/Selmer multiplicities, and deduce #Σ(X)=c_(F,Σ)X+o(X) with c_(F,Σ)>0. Tau Ceti ArithmeticDirichletSeries supplies ideal/norm carriers and Tauberian tools, not this already-completed equidistribution theorem.

Consumers: [ArithmeticStatistics:ST.0/twist-denominator-frontier](../readmes/ArithmeticStatistics.md#st0-twist-denominator-frontier).

### S0/R4 — AbelianSchemesAndArithmeticModuliPartII:F3

Finiteness of dimension-g k-isomorphism classes over a fixed finite field and compatibility of the rational-orbit classification with the native Tau Ceti abelian-variety category.

Consumers: [ArithmeticStatistics:ST.0/unpolarized-abelian-count](../readmes/ArithmeticStatistics.md#st0-unpolarized-abelian-count).

### S0/R5 — AbelianSchemesAndArithmeticModuli:A2

Native principal polarizations on an abelian variety, duality, the transport equation f∨λ′f=λ and the Aut(A) action. ST.0 imports these geometric objects and only forms their class count and forgetful fiber.

Consumers: [ArithmeticStatistics:ST.0/principally-polarized-count](../readmes/ArithmeticStatistics.md#st0-principally-polarized-count); [ArithmeticStatistics:ST.0/polarization-fiber-count](../readmes/ArithmeticStatistics.md#st0-polarization-fiber-count).

### S0/R6 — PELModuli:M6

Finite-field polarized-pair isomorphism classes, their finite carrier, and comparison with the Siegel stack. Counting rational objects is not identified with the coarse-space rational-point count.

Consumers: [ArithmeticStatistics:ST.0/principally-polarized-count](../readmes/ArithmeticStatistics.md#st0-principally-polarized-count).

### S0/R7 — AbelianSchemesAndArithmeticModuliPartII:F5

Identify the fixed-A polarized forgetful fiber with the Aut_k(A)-orbits of principal polarizations, using the existing polarization/line-bundle descent convention. Hermitian and lattice classifications remain imported geometry.

Consumers: [ArithmeticStatistics:ST.0/polarization-fiber-count](../readmes/ArithmeticStatistics.md#st0-polarization-fiber-count).

### S0/R8 — tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations

Normal-closure action on Hom_Q(K,Qbar), cardinality n for a degree-n number field, and its equivariance under field isomorphism; specialize the existing representation instead of defining another polynomial Galois group.

Consumers: [ArithmeticStatistics:ST.0/field-permutation-type](../readmes/ArithmeticStatistics.md#st0-field-permutation-type).

### S0/R9 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Over a finite field, represent Pic^d as a torsor under the represented Jacobian and identify Pic⁰=J(k), finite because J is of finite type. Combine the imported SF.3 Picard–Brauer comparison (Br(k)=0) with AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang to obtain an actual degree-one line bundle and degree surjectivity. No rational curve point is assumed; Lang itself is imported, not re-planned in JacobianChallenge.

Consumers: [ArithmeticStatistics:ST.0/finite-picard-quotient](../readmes/ArithmeticStatistics.md#st0-finite-picard-quotient).

### S0/R10 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Hyperelliptic finite-flat pushforward to P¹, Grothendieck splitting, degree and section formulas, theta loci as line-bundle classes with nonzero sections, and σL=(deg L)κ−L with invariant splitting index. The current AlgebraicVectorBundles roadmap supplies general locally free sheaves but not this P¹ splitting theorem; extend the geometric owner rather than adding a second bundle theory in ST.0.

Consumers: [ArithmeticStatistics:ST.0/natural-bundle-law](../readmes/ArithmeticStatistics.md#st0-natural-bundle-law); [ArithmeticStatistics:ST.0/theta-tail-normalization](../readmes/ArithmeticStatistics.md#st0-theta-tail-normalization); [ArithmeticStatistics:ST.0/finite-joint-bundle-mass](../readmes/ArithmeticStatistics.md#st0-finite-joint-bundle-mass); [ArithmeticStatistics:ST.0/pointless-curve-regression](../readmes/ArithmeticStatistics.md#st0-pointless-curve-regression).

### S0/R11 — AdelicAlgebraicGroups:AA.2

The finite-volume normalized invariant measure on PGL₂(F)\PGL₂(A), measurable K-double-quotient maps, the adelic g_D Hecke translation, and the bundle double-coset dictionary. Specialize the generic Mathlib pair pushforward.

Consumers: [ArithmeticStatistics:ST.0/hecke-pushforward](../readmes/ArithmeticStatistics.md#st0-hecke-pushforward).

### S0/R12 — InverseGaloisAndArithmeticFundamentalGroups:IG.4

Extend the current prime-to-Δ unramified-Gamma supplier to the full maximal finite-place-unramified extension split at infinity, with all continuous finite quotients. Bind its existing marked-arithmetic-extension data to Wood’s chosen imaginary infinity completion, canonical outside involution and real twists; prove finite type-H rigid fibers in fixed discriminant slices and the actual-image wreath embedding.

Consumers: [ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter](../readmes/ArithmeticStatistics.md#st0-wood-infinity-and-type-adapter); [ArithmeticStatistics:ST.0/wood-average-normalizations](../readmes/ArithmeticStatistics.md#st0-wood-average-normalizations).

### S1/R1 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Represent the smooth hyperelliptic Jacobian and degree-one Picard torsor; provide rational points, base change and the comparison with actual rational divisors. The nodal modulus version is not claimed supplied here.

Consumers: [ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor](../readmes/ArithmeticStatistics.md#st1-refinement-pencil-fano-torsor); [ArithmeticStatistics:ST.1/refinement-pencil-existence](../readmes/ArithmeticStatistics.md#st1-refinement-pencil-existence); [ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits](../readmes/ArithmeticStatistics.md#st1-refinement-locally-soluble-pencil-orbits); [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes).

### S1/R2 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

Degree-d line bundles on genus-one curves, their complete linear systems and rational-divisor interpretation, including the degree2–5 embeddings.

Consumers: [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes); [ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor](../readmes/ArithmeticStatistics.md#st1-refinement-pencil-fano-torsor).

### S1/R3 — tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

For genus-one specialization, Kummer maps, local conditions, Selmer two-cover sets and the Sel₂ action. Higher-genus/generalized Jacobian analogues require a separate gap.

Consumers: [ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits](../readmes/ArithmeticStatistics.md#st1-refinement-locally-soluble-pencil-orbits); [ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes](../readmes/ArithmeticStatistics.md#st1-refinement-genus-one-stabilizer-schemes).

### S1/R4 — GeometryOfNumbersAndQuadraticArithmetic:GN.2

The integral-isometry classification of integral ternary quadratic forms with4det=−1, with the cross-term coefficient convention needed for the Wood inverse. Generic primitive-lattice completions belong to current IntegralLattices and are recorded as an adapter gap.

Consumers: [ArithmeticStatistics:ST.1/refinement-wood-ring-interpretation](../readmes/ArithmeticStatistics.md#st1-refinement-wood-ring-interpretation).

### S2/R1 — SieveMethodsAndPrimePatterns:SV.2

Supply a quantitative multidimensional coefficient-box Selberg/large sieve: uniformly positive good-prime excluded densities and remainder r_d=O_epsilon(X^(D−1)d^(1+epsilon)) imply the balanced distinguished-matrix saving 1/5. Also give a correctly normalized non-Sn bound for nonmonic coefficient boxes with a saving exceeding the small even-tail exponent. Existing additive/Gram inequalities are inputs, not either final counting theorem. For monic weighted boxes also supply the quantitative specialization/Galois-fibre estimate with the subgroup index retained, including the degree 4 D4 index 3 exception; qualitative irreducibility is insufficient.

Consumers: [ArithmeticStatistics:ST.2/refinement-monic-distinguished-off-block](../readmes/ArithmeticStatistics.md#st2-refinement-monic-distinguished-off-block); [ArithmeticStatistics:ST.2/refinement-monic-extra-reducible-bound](../readmes/ArithmeticStatistics.md#st2-refinement-monic-extra-reducible-bound); [ArithmeticStatistics:ST.2/refinement-binary-summed-tail](../readmes/ArithmeticStatistics.md#st2-refinement-binary-summed-tail).

### S2/R2 — AnalyticNumberTheory:AN.5

Export the divisor bound d(k)=O_epsilon(k^epsilon), average divisor sum O(Y log Y), convergent squarefree-divisor sums and Mobius truncation estimates, with constants independent of the residue modulus. The pointwise O(log k) divisor bound must not be substituted.

Consumers: [ArithmeticStatistics:ST.2/refinement-monic-rational-root-bound](../readmes/ArithmeticStatistics.md#st2-refinement-monic-rational-root-bound); [ArithmeticStatistics:ST.2/refinement-quartic-fixed-reducible-resolvent](../readmes/ArithmeticStatistics.md#st2-refinement-quartic-fixed-reducible-resolvent); [ArithmeticStatistics:ST.2/refinement-monic-summed-tail](../readmes/ArithmeticStatistics.md#st2-refinement-monic-summed-tail); [ArithmeticStatistics:ST.2/refinement-quadratic-binary-summed-tail](../readmes/ArithmeticStatistics.md#st2-refinement-quadratic-binary-summed-tail); [ArithmeticStatistics:ST.2/refinement-hypersurface-finite-local-count](../readmes/ArithmeticStatistics.md#st2-refinement-hypersurface-finite-local-count); [ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error](../readmes/ArithmeticStatistics.md#st2-refinement-cubic-secondary-sieve-error).

### S2/R3 — SchemeAndStackFoundations:SF.0

Export finite affine projection after choosing a generic linear projection, spreading outside finitely many primes with uniform fibre-degree bounds, and the specialization of codimension estimates used in the geometric sieve. For the repaired deep cusp supply maximal-minor determinantal-ideal membership and reduced prime/ideal arguments over the universal coefficient ring, rather than divisibility of a product of minors.

Consumers: [ArithmeticStatistics:ST.2/refinement-monic-strong-tail](../readmes/ArithmeticStatistics.md#st2-refinement-monic-strong-tail); [ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail](../readmes/ArithmeticStatistics.md#st2-refinement-global-field-large-prime-tail); [ArithmeticStatistics:ST.2/refinement-even-binary-restricted-gram](../readmes/ArithmeticStatistics.md#st2-refinement-even-binary-restricted-gram); [ArithmeticStatistics:ST.2/refinement-hypersurface-local-tail](../readmes/ArithmeticStatistics.md#st2-refinement-hypersurface-local-tail).

### S2/R4 — GeometryOfNumbersAndQuadraticArithmetic:GN.4

As a proposed Part II extension, supply uniform skew-region symmetric-rank counts and saturated row-lattice height/successive-minimum enumeration used by BSW II §5. For ordered diagonal t_i, rank r<n and Y>1 the source bound is O(C(r,t)Y^(nr/2)(log Y)^r), with C(r,t)=product_{i<j,j>n−r} t_i/t_j and the source endpoint constraints t_1<=C Y^Theta,t_n>=c Y^(-Theta). Import current IntegralLattices for generic carriers and basis completion; do not duplicate that theory.

Consumers: [ArithmeticStatistics:ST.2/refinement-even-binary-main-shallow](../readmes/ArithmeticStatistics.md#st2-refinement-even-binary-main-shallow); [ArithmeticStatistics:ST.2/refinement-even-binary-restricted-deep-tail](../readmes/ArithmeticStatistics.md#st2-refinement-even-binary-restricted-deep-tail).

### S3/R1 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Export the anti-invariant cyclic cubic/ring-class correspondence and conductor–discriminant identity for the S₃ representation, including the condition at real places. For the fixed-resolvent count, export Cohen–Morra Theorem6.1’s finite ray-class character sum, including its wild3 factors and the holomorphic nontrivial-character contribution of §7.3; distinguish the pure-cubic double pole.

Consumers: [ArithmeticStatistics:ST.3/cubic-conductor-discriminant](../readmes/ArithmeticStatistics.md#st3-cubic-conductor-discriminant); [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](../readmes/ArithmeticStatistics.md#st3-fixed-resolvent-cubic-count).

### S3/R2 — tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups

Export the conductor exact sequence for Pic(Z+f O_K) and its finite residue-unit kernel; import the existing proper-invertible-ideal carrier.

Consumers: [ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound](../readmes/ArithmeticStatistics.md#st3-quadratic-order-three-torsion-bound).

### S3/R3 — ArithmeticStatistics:ST.2

Export BST Theorem27’s slicing/Mellin calculation, regular-domain root-weighted estimate (91), and Lemma34’s bound N(Z_n;X)≪3^{ω(n)}X/n². These are geometry and uniformity inputs; this packet supplies their statistical assembly.

Consumers: [ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient](../readmes/ArithmeticStatistics.md#st3-secondary-cubic-lattice-coefficient); [ArithmeticStatistics:ST.3/refined-cubic-sieve](../readmes/ArithmeticStatistics.md#st3-refined-cubic-sieve).

### S3/R4 — AdelicAlgebraicGroups:AA.0

Export the finite double-coset decomposition for the BSW reductive groups over a number field, with their induced integral lattices.

Consumers: [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](../readmes/ArithmeticStatistics.md#st3-low-degree-s-integral-parametrization).

### S3/R5 — AdelicAlgebraicGroups:AA.2

Export the canonical Tamagawa measure and τ(G_n)=1 for the four explicit BSW groups, compatible with the determinant character and Dedekind zeta residue.

Consumers: [ArithmeticStatistics:ST.3/low-degree-jacobian-mass](../readmes/ArithmeticStatistics.md#st3-low-degree-jacobian-mass).

### S3/R6 — ArithmeticStatistics:ST.2

Export BSW Theorem4.7 with cusp and nongeneric contributions o_F(X), and the codimension-two geometric sieve for bounded semialgebraic fundamental-domain regions. The complementary local probability is 1−1/Aut(τ), not 1/Aut(τ).

Consumers: [ArithmeticStatistics:ST.3/low-degree-maximal-sieve](../readmes/ArithmeticStatistics.md#st3-low-degree-maximal-sieve).

### S3/R7 — SieveMethodsAndPrimePatterns:SV.2

Supply the two quadratic Jacobi bilinear estimates in FK Lemmas14–15, pp.13–14, with squarefree coefficient support, both symmetric size parameters and the dependence on the prime-factor cutoff.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](../readmes/ArithmeticStatistics.md#st3-fk-maximal-unlinked-support).

### S3/R8 — AnalyticNumberTheory:AN.2

Supply the FK Lemma13 Siegel–Walfisz estimate for primitive real characters, with its √q dependence, and equidistribution in the fixed moduli4 and8 used in Lemma19.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](../readmes/ArithmeticStatistics.md#st3-fk-maximal-unlinked-support).

### S3/R9 — AnalyticNumberTheory:AN.5

Supply the squarefree multiplicative mean-value and short-interval estimates of FK Lemmas11–12, pp.12–13, for weights γ^{ω(n)}, uniformly in the dissection parameters.

Consumers: [ArithmeticStatistics:ST.3/fk-maximal-unlinked-support](../readmes/ArithmeticStatistics.md#st3-fk-maximal-unlinked-support).

### S3/R10 — SieveMethodsAndPrimePatterns:SV.1

Supply the bound O(X/√log X) for integers supported on2 and primes1 mod4, as used in FK Corollary1.

Consumers: [ArithmeticStatistics:ST.3/fk-narrow-wide-moment-comparison](../readmes/ArithmeticStatistics.md#st3-fk-narrow-wide-moment-comparison).

### S3/R11 — tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets

As EffectiveBounds, Part II, supply the relative EV small-split-prime torsion bound (LOWW Lemma2.1, corrected d=[L:K] and positive prime exponents), the absolute/relative trivial torsion bounds, h₂(F)≪D_F^εh₂(k)^{[F:k]} for2-extensions, and the BSTTTZ nontrivial2-torsion saving used in Theorem8.1.

Consumers: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](../readmes/ArithmeticStatistics.md#st3-uniform-small-degree-field-bound); [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](../readmes/ArithmeticStatistics.md#st3-relative-three-torsion-piecewise-bound); [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](../readmes/ArithmeticStatistics.md#st3-quadratic-tower-torsion-tail); [ArithmeticStatistics:ST.3/thin-two-group-torsion](../readmes/ArithmeticStatistics.md#st3-thin-two-group-torsion); [ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean](../readmes/ArithmeticStatistics.md#st3-relative-wreath-three-torsion-mean).

### S3/R12 — tauceti:Completed/EffectiveBounds#layer-3-regulators-and-unit-lattice-volume

As EffectiveBounds, Part II, supply the relative regulator lower bound R_L/R_K≫_{[L:Q]}1 of Friedman–Skoruppa, together with the norm-cokernel bound needed in the relative class-group estimate.

Consumers: [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](../readmes/ArithmeticStatistics.md#st3-relative-three-torsion-piecewise-bound).

### S3/R13 — AnalyticNumberTheory:AN.8

Export the cubic Shintani order series and its dual, with |Aut R|^{-1} coefficients, simple poles1 and5/6, exact residues, gamma factors, functional equation, ξ_F(0)=0 when [F:Q]≥2, and the dual-series convexity bound of LOWW Proposition3.7/Lemmas3.8–3.10.

Consumers: [ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound](../readmes/ArithmeticStatistics.md#st3-shintani-cubic-order-uniform-bound).

### S3/R14 — AnalyticNumberTheory:AN.4

Export uniform Dedekind-zeta residue and convexity bounds, the smoothed Perron ideal upper bound, and the ideal lower bound for T≥C D_F^{1/2+δ}κ_F^{-1}; constants with Brauer–Siegel input are ineffective.

Consumers: [ArithmeticStatistics:ST.3/uniform-small-degree-field-bound](../readmes/ArithmeticStatistics.md#st3-uniform-small-degree-field-bound); [ArithmeticStatistics:ST.3/relative-three-torsion-propagation](../readmes/ArithmeticStatistics.md#st3-relative-three-torsion-propagation); [ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound](../readmes/ArithmeticStatistics.md#st3-relative-three-torsion-piecewise-bound).

### S3/R15 — AnalyticNumberTheory:AN.3

Export LOWW Theorem4.2 quadratic Hecke zero-density sum over conductor norm≤Q, plus Lemmas4.3–4.4 split-prime estimates outside O_ε(D_F^εX^ε) exceptional quadratic extensions, uniformly in degree and base discriminant.

Consumers: [ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail](../readmes/ArithmeticStatistics.md#st3-quadratic-tower-torsion-tail); [ArithmeticStatistics:ST.3/thin-two-group-torsion](../readmes/ArithmeticStatistics.md#st3-thin-two-group-torsion).

### S3/R16 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Export the native maximal everywhere-unramified, infinity-split extension and its profinite Galois group, continuous finite quotients, normal-closure wreath embedding, local inertia generation, and equivariant class-group/abelian-unramified-extension correspondence.

Consumers: [ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface](../readmes/ArithmeticStatistics.md#st3-nonabelian-quadratic-moment-interface); [ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization](../readmes/ArithmeticStatistics.md#st3-nonabelian-admissibility-and-abelianization); [ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator](../readmes/ArithmeticStatistics.md#st3-a4-appendix-kernel-enumerator); [ArithmeticStatistics:ST.3/elementary-two-moment-euler-products](../readmes/ArithmeticStatistics.md#st3-elementary-two-moment-euler-products).

### S3/R17 — tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara

Extend the Tauberian interface to the higher-pole Delange conclusion: nonnegative Dirichlet coefficients with pole order m have main term G(1)X(log X)^{m−1}/(m−1)!; retain the domain and lower-order singularities needed for Wood §7. The same exact higher-pole interface handles the pure-cubic conductor series; retain its simple/double-pole distinction and the conductor-to-discriminant translation.

Consumers: [ArithmeticStatistics:ST.3/elementary-two-moment-divergence](../readmes/ArithmeticStatistics.md#st3-elementary-two-moment-divergence); [ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count](../readmes/ArithmeticStatistics.md#st3-fixed-resolvent-cubic-count).

### S3/R18 — tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets

As EffectiveBounds, Part II, supply the ring-of-integers largest successive-minimum bound O_n(D_K^{1/n}), bounded-height basis, trace-zero lattice covolume/Minkowski bound, the refined relative primitive extension bound with its base-discriminant saving, and the exact cubic two-torsion exponent of BSTTTZ. Here Set α=√3/2, β=((1+α)/(2α))log((1+α)/(2α))−((1−α)/(2α))log((1−α)/(2α)), and a=1/(6(1−β/log2)); thus a≈0.2784. The pointwise bound retains an arbitrary positive exponent loss.

Consumers: [ArithmeticStatistics:ST.3/small-trace-zero-element](../readmes/ArithmeticStatistics.md#st3-small-trace-zero-element); [ArithmeticStatistics:ST.3/schmidt-field-count-bound](../readmes/ArithmeticStatistics.md#st3-schmidt-field-count-bound); [ArithmeticStatistics:ST.3/lemke-oliver-thorne-field-bound](../readmes/ArithmeticStatistics.md#st3-lemke-oliver-thorne-field-bound); [ArithmeticStatistics:ST.3/galois-field-three-eighths-bound](../readmes/ArithmeticStatistics.md#st3-galois-field-three-eighths-bound); [ArithmeticStatistics:ST.3/quartic-torsion-counting-applications](../readmes/ArithmeticStatistics.md#st3-quartic-torsion-counting-applications).

### S3/R19 — tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation

Export partial summation for discrete positive field weights and discriminant-ordered counting measures; the dyadic form here is sufficient.

Consumers: [ArithmeticStatistics:ST.3/weighted-cubic-partial-summation](../readmes/ArithmeticStatistics.md#st3-weighted-cubic-partial-summation).

### S3/R20 — SieveMethodsAndPrimePatterns:SV.5

Export KM Theorem1 for the unit-square-invariant joint ideal spin, nonempty S with S∩S⁻¹=∅, and its saving δ/(54|S|²n(12n+1)). Keep C_{|S|n} as a hypothesis. Supply the norm/residue compatibility used in §5.

Consumers: [ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion](../readmes/ArithmeticStatistics.md#st3-sixteen-rank-spin-criterion); [ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field](../readmes/ArithmeticStatistics.md#st3-no-sixteen-rank-governing-field).

### S3/R21 — ExponentialSumsAndCircleMethod:ES.0

Export the named conditional C_n predicate of KM §2.5: for every ε>0 all real nonprincipal characters of modulus q≤Q and intervals N≤Q^{1/n} have bound C(n,ε)Q^{(1−δ(n))/n+ε}, with δ(n)>0. Do not assert C_n for n≥4.

Consumers: [ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field](../readmes/ArithmeticStatistics.md#st3-no-sixteen-rank-governing-field).

### S3/R22 — ArithmeticStatistics:ST.2

Export the BSW I κ-acceptable weighted-box sieve and its trace-zero/trace-band restricted tails; export BSW II Theorem5 and Corollary6.27 after the reviewed even-degree errors E3/E18 are resolved, with a separate n=2 proof. For signatures use an explicitly regular real region and retain every boundary term.

Consumers: [ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts](../readmes/ArithmeticStatistics.md#st3-monic-polynomial-sieve-counts); [ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve](../readmes/ArithmeticStatistics.md#st3-trace-restricted-polynomial-sieve); [ArithmeticStatistics:ST.3/binary-form-sieve-counts](../readmes/ArithmeticStatistics.md#st3-binary-form-sieve-counts); [ArithmeticStatistics:ST.3/monic-weak-quasi-reduction](../readmes/ArithmeticStatistics.md#st3-monic-weak-quasi-reduction).

### S3/R23 — ArithmeticStatistics:ST.1

Export the general degree-n binary-form order on its native quotient algebra, its ζ basis, discriminant and GL₂ transport laws; the accepted cubic/quartic constructions are imported, not repeated.

Consumers: [ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction](../readmes/ArithmeticStatistics.md#st3-polynomial-order-lattice-reduction); [ArithmeticStatistics:ST.3/binary-discriminant-local-factors](../readmes/ArithmeticStatistics.md#st3-binary-discriminant-local-factors); [ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini](../readmes/ArithmeticStatistics.md#st3-binary-form-arithmetic-bertini).

### S3/R24 — tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy

Use the existing rational Hasse–Minkowski isotropy criterion to prove the squarefree-divisor conic test; retain every infinity and prime2 condition.

Consumers: [ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula](../readmes/ArithmeticStatistics.md#st3-quadratic-four-rank-conic-formula); [ArithmeticStatistics:ST.3/restricted-real-quadratic-family](../readmes/ArithmeticStatistics.md#st3-restricted-real-quadratic-family).

### S3/R25 — ArithmeticStatistics:ST.1

Export the degree-two squareclass representation G_m acting on G_a by squares, its quadratic-algebra construction and maximal integral orbit/stabilizer/discriminant comparison when2 is inverted (BSW global §3, Theorems3.1–3.4, pp.9–12). The existing cubic/quartic/quintic exports do not supply this case.

Consumers: [ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization](../readmes/ArithmeticStatistics.md#st3-low-degree-s-integral-parametrization).

### S3/R26 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Export ideal norm and extension on the existing narrow class groups, proving descent through totally positive principal ideals and norm∘extension=power[L:F]. Export the ordinary/narrow characters that annihilate extended base classes and their relative S₄-resolvent correspondence. Native ordinary norm maps are already present and must be reused.

Consumers: [ArithmeticStatistics:ST.3/relative-torsion-splitting](../readmes/ArithmeticStatistics.md#st3-relative-torsion-splitting); [ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre](../readmes/ArithmeticStatistics.md#st3-quartic-class-group-two-torsion-fibre); [ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios](../readmes/ArithmeticStatistics.md#st3-low-degree-class-group-mass-ratios).

### S3/R27 — ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u

Export the rank-marginal specialization for prime p and integer u≥0 from elementary-abelian-test surjection moments p^(−uj) alone, with tightness/uniform integrability and Gaussian moment-growth assumptions as in DJ Theorem5 specialized to ℓ=1. Existing uniqueness from all finite-p-group test moments does not provide this contract: rank moments cannot recover the non-elementary test moments. Keep this generic probabilistic theorem in ST.5.

Consumers: [ArithmeticStatistics:ST.3/rank-moments-determine-rank-law](../readmes/ArithmeticStatistics.md#st3-rank-moments-determine-rank-law).

### S4/R1 — HeightsRationalPointsAndObstructions:RP.1

General abelian-variety Mordell–Weil finite generation; finite Selmer sets of J¹ as actual two-cover torsors and their localisation into J¹(K_v)/2J(K_v), including the simply transitive Sel₂(J) action when nonempty. Supply the finite-index Z_p^g and compact-real-group two-division index formulas, and the coefficient-family failure-of-local-actual-Div¹ reduction criterion of Poonen–Stoll Lemma 15 (author copy p.16). Existing elliptic two-descent does not supply these ppav statements. This extends the descent direction as Part II if its present layer stops at elliptic curves.

Consumers: [ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio](../readmes/ArithmeticStatistics.md#st4-refinement-hyperelliptic-local-mass-ratio); [ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two](../readmes/ArithmeticStatistics.md#st4-refinement-hyperelliptic-average-two); [ArithmeticStatistics:ST.4/refinement-degree-one-points-empty-or-infinite](../readmes/ArithmeticStatistics.md#st4-refinement-degree-one-points-empty-or-infinite).

id: ArithmeticStatistics:ST.4/request-1

status: open

### S4/R2 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Import current ClassFieldTheory Layer10 eq_zero_of_localInv_eq_zero: a global Brauer class whose finite and infinite local invariants all vanish is zero. Use the existing Layer5 cohomological/central-simple Brauer dictionary with the JC4 fppf obstruction, so everywhere actual Div¹ forces every rational Picard point to descend to a divisor. This is an existing upstream target, not a request to construct a second Brauer theory.

Consumers: [ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison](../readmes/ArithmeticStatistics.md#st4-refinement-degree-one-arithmetic-comparison).

id: ArithmeticStatistics:ST.4/request-2

status: open

### S4/R3 — AdelicAlgebraicGroups:AA.2

Use the existing Tamagawa-measure roadmap with the same invariant differential, local integral lattice volumes, global rational product formula and convergence factors. The additional general simply connected Tamagawa and central-isogeny correction theorems needed to evaluate τ(SL_n/μ₂) are an AdelicAlgebraicGroups, Part II request, not a claim that the present AA.2 layer already evaluates individual numbers. The ST.4 node owns the specifically routed even-SL central-quotient value. Also supply the precise common-measure orbit integration setup; the representation-specific Jacobian and stabilizer calculation is requested from ST.2.

Consumers: [ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio](../readmes/ArithmeticStatistics.md#st4-refinement-hyperelliptic-local-mass-ratio); [ArithmeticStatistics:ST.4/refinement-pencil-measure-comparison](../readmes/ArithmeticStatistics.md#st4-refinement-pencil-measure-comparison); [ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient](../readmes/ArithmeticStatistics.md#st4-refinement-tamagawa-central-quotient).

id: ArithmeticStatistics:ST.4/request-3

status: open

### S4/R4 — AdelicAlgebraicGroups:AA.4

For the group scheme SL_n/μ₂ over Z, n even, supply G(Q)∩∏_pG(Z_p)=G(Z) and the bijection between global integral-transporter cosets and finite-support local transporter cosets needed to factor the reciprocal weight. This is a class-number-one statement for this central quotient, stronger than unnamed strong approximation for simply connected SL_n; verify the bad prime two and the group-scheme rational points.

Consumers: [ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight](../readmes/ArithmeticStatistics.md#st4-refinement-pencil-local-global-weight).

id: ArithmeticStatistics:ST.4/request-4

status: open

### S4/R5 — InverseGaloisAndArithmeticFundamentalGroups:IG.2

A quantitative coefficient-box specialization theorem making failure of full S_n Galois group density zero for each fixed degree n. Transfer relative to a positive-lower-density subfamily. Infinitely many Hilbert specializations alone do not give this density assertion. Combine it with the ST.1 odd/even factorization descriptions of W[2] and J[2].

Consumers: [ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class](../readmes/ArithmeticStatistics.md#st4-refinement-generic-weierstrass-class).

id: ArithmeticStatistics:ST.4/request-5

status: open

### S4/R6 — ProbabilisticAndMetricNumberTheory:PM.1

Dembo–Poonen–Shao–Zeitouni Theorem 1.2, author copy pp.2–3: for iid zero-mean, unit-variance coefficients with all moments, the probability of each fixed compatible count of real roots, all simple, is n^(−b+o(1)), b>0, hence tends to zero; finite unions do too. Apply to √3 times iid uniform [−1,1] coefficients, whose common rescaling preserves roots. For this continuous distribution, nonzero leading coefficient and nonvanishing discriminant hold almost surely, so the simple-root count equals the full real-root count almost surely. Only fixed counts are consumed. Do not claim the endpoint log n/log log n instead of the source’s o(log n/log log n) range.

Consumers: [ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average](../readmes/ArithmeticStatistics.md#st4-refinement-order-k-vanishing-average).

id: ArithmeticStatistics:ST.4/request-6

status: open

### S4/R7 — SelmerIwasawaCohomology:L1

Poonen–Stoll Theorem 8/Corollary 9 and Theorem 11/Corollary 12 (author copy §§6,8 pp.11–14): Cassels–Tate pairing on Sha modulo its maximal divisible subgroup, square-versus-twice-square order, and Jacobian deficiency parity. Deficiency is absence of an actual divisor of degree g−1 over the completion, not absence of a relative Picard-scheme point. Local points kill deficiency after any extension. Supply the parity comparison for the finite 2-primary quotient and its two-torsion; it is not a fact about arbitrary finite abelian groups.

Consumers: [ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity](../readmes/ArithmeticStatistics.md#st4-refinement-selmer-regulator-parity); [ArithmeticStatistics:ST.4/refinement-four-twist-local-parity](../readmes/ArithmeticStatistics.md#st4-refinement-four-twist-local-parity).

id: ArithmeticStatistics:ST.4/request-7

status: open

### S4/R8 — SelmerIwasawaCohomology:L2

General finite/p∞ Selmer groups and Sha, Kummer exact sequences, finite-generation and localisation interfaces for abelian varieties and their torsors. For the Dokchitser input supply the rational Pontryagin-dual representation X_p(A/F), its self-duality, the isogeny quotient formula retaining finite Sha and the finite-Selmer/corank/torsion/Sha parity identity. For rank one supply Bhargava–Skinner Lemma 8 and §§3.1–3.2 pp.5–7: the finite p-Selmer-line local nontorsion condition implies one-dimensional Bloch–Kato Selmer and injective restriction, plus quadratic invariant/anti-invariant decomposition and local p-division index #Q=p#E(Q_p)[p]. The elliptic p-Selmer root-number parity input of their Theorem 6 is needed without assuming Sha finite. Generic definitions already in EllipticCurves Layer 7 are imported there and only their required extensions belong here.

Consumers: [ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity](../readmes/ArithmeticStatistics.md#st4-refinement-selmer-regulator-parity); [ArithmeticStatistics:ST.4/refinement-biquadratic-parity-formula](../readmes/ArithmeticStatistics.md#st4-refinement-biquadratic-parity-formula); [ArithmeticStatistics:ST.4/refinement-positive-nontrivial-sha-two](../readmes/ArithmeticStatistics.md#st4-refinement-positive-nontrivial-sha-two); [ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-selmer-criterion); [ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion](../readmes/ArithmeticStatistics.md#st4-refinement-twisted-rank-one-selmer-criterion); [ArithmeticStatistics:ST.4/refinement-rank-one-family-properties](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-family-properties); [ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison](../readmes/ArithmeticStatistics.md#st4-refinement-local-five-quotient-comparison); [ArithmeticStatistics:ST.4/refinement-rank-one-torsion-image-bound](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-torsion-image-bound); [ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements](../readmes/ArithmeticStatistics.md#st4-refinement-soluble-generic-three-selmer-elements).

id: ArithmeticStatistics:ST.4/request-8

status: open

### S4/R9 — tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula

RepresentationTheory, Part II: finite-group Brauer relations and regulator constants C(Θ,ρ)=∏_H det(|H|^−1〈,〉|ρ^H)^(n_H) in Q_p× modulo squares, with pairing/basis independence for a relation, additivity, self-dual decomposition and cyclic-decomposition cancellation. Use the existing induction/restriction functors. Required checks are the zero relation giving one, each of the four characters of C₂×C₂ giving square class two for {1}−ΣH+2G, and a non-self-dual pair having a square constant. The semistable regulator formula consumes a self-dual representation; retain the published erratum’s hypothesis.

Consumers: [ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity](../readmes/ArithmeticStatistics.md#st4-refinement-selmer-regulator-parity); [ArithmeticStatistics:ST.4/refinement-four-twist-local-parity](../readmes/ArithmeticStatistics.md#st4-refinement-four-twist-local-parity).

id: ArithmeticStatistics:ST.4/request-9

status: open

### S4/R10 — NeronModelsAndSemistableAbelianVarieties:R11.3

Modified Tamagawa factor c̃(A/L)=∏_(finite v)c_v|ω/ω_v^Néron|_v for one fixed global invariant exterior form, independent of permitted local choices and compatible with field extension. Supply cancellation of the differential correction for semistable A in the biquadratic Brauer product, and the split toric-rank-one monodromy computation giving square class two. This does not assert a Néron model commutes with every ramified base change. Tests for the extended definition must distinguish c̃ from c when the differential is nonminimal, give c̃=1 for good reduction with a minimal differential, and check multiplicativity of the Brauer product.

Consumers: [ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity](../readmes/ArithmeticStatistics.md#st4-refinement-selmer-regulator-parity); [ArithmeticStatistics:ST.4/refinement-four-twist-local-parity](../readmes/ArithmeticStatistics.md#st4-refinement-four-twist-local-parity).

id: ArithmeticStatistics:ST.4/request-10

status: open

### S4/R11 — NeronModelsAndSemistableAbelianVarieties:R11.6

For the exact Bhargava–Skinner short pairs, prove good integral reduction at two by their coordinate change; at seven identify nonsplit multiplicative reduction by −c₆=864B being a nonsquare. At five identify ordinary good reduction by #E(F₅)≢1 mod5. For D=−39 check minimality of the twisted short pair at three and thirteen, where the original has good reduction, and retain the exact height factor 39⁶.

Consumers: [ArithmeticStatistics:ST.4/refinement-rank-one-family-properties](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-family-properties).

id: ArithmeticStatistics:ST.4/request-11

status: open

### S4/R12 — ArithmeticGaloisRepresentations:R01.6

For semistable ordinary E/Q at p=5, identify residual inertia at each conductor prime of minimal discriminant valuation one, and show ramification there. In the reducible case the global semisimplification is 1⊕ω, using ordinary local type and unramified finite characters over Q. Then nonsplit multiplicative Frobenius at seven contradicts 7≠−1 mod5. This is the precise Tate-module/reduction export used in Bhargava–Skinner Lemma 14, not a request for an unrelated Serre-weight stage.

Consumers: [ArithmeticStatistics:ST.4/refinement-rank-one-family-properties](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-family-properties).

id: ArithmeticStatistics:ST.4/request-12

status: open

### S4/R13 — RankZeroOneBSD:BSD.0

Existing modularity, elliptic L-function and root-number conventions, their factorization over an imaginary quadratic field, and the quadratic twist sign formula for D=−39 with gcd(D,N)=1. The rank-one p-converse is a separate gap routed by PAPER-SKINNER-20; neither modularity nor the forward Gross–Zagier/Kolyvagin theorem supplies it.

Consumers: [ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion](../readmes/ArithmeticStatistics.md#st4-refinement-rank-one-selmer-criterion).

id: ArithmeticStatistics:ST.4/request-13

status: open

### S4/R14 — WeilConjectures:WC.5

The proved finite-field smooth projective curve bound #C(F_q)≥q+1−2g√q. Apply to the squarefree odd-multiplicity part l of f̄ and discard up to 2n+2 points over roots of f̄ or infinity. q>4n² supplies the needed positive remainder for n≥3. No coprimeness of l and the square part is needed.

Consumers: [ArithmeticStatistics:ST.4/refinement-odd-residue-field-models](../readmes/ArithmeticStatistics.md#st4-refinement-odd-residue-field-models).

id: ArithmeticStatistics:ST.4/request-14

status: open

### S4/R15 — ArithmeticStatistics:ST.0

Coefficient-height finite sublevel sets and finite-prime density/CRT for hyperelliptic models; for the number-field A.2 statement use a fixed integral basis of O_K and the maximum of all coefficient coordinates, with finite twist-height constants and finite fibres. Supply a genus-uniform positive lower proportion of locally C-soluble models, hence of locally actual-Div¹-soluble models, with exactly the BGW coefficient cube and all real strata. The cited >75% local-solubility result is not replaced by a genus-dependent positive constant. Also identify the scalar-square reduction locus as a fixed codimension-at-least-two subscheme for n≥3. For positive-count height transport on the same family, use the inclusions arising from h≤h′≤Ch and the common power-law denominator, rather than the finite-piece constant-rescaling lemma.

Consumers: [ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average](../readmes/ArithmeticStatistics.md#st4-refinement-order-k-vanishing-average); [ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear](../readmes/ArithmeticStatistics.md#st4-refinement-small-odd-degree-points-disappear); [ArithmeticStatistics:ST.4/refinement-odd-residue-field-models](../readmes/ArithmeticStatistics.md#st4-refinement-odd-residue-field-models); [ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities](../readmes/ArithmeticStatistics.md#st4-refinement-admissible-family-selmer-parities); [ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer](../readmes/ArithmeticStatistics.md#st4-refinement-plane-cubic-height-and-orbit-transfer).

id: ArithmeticStatistics:ST.4/request-15

status: open

### S4/R16 — ArithmeticStatistics:ST.1

Extend the existing covering dictionary, without confusing ring representations: the degree-five genus-one representation is the 50-dimensional 5⊗∧²(5), with determinant-kernel central-quotient G from ST.2/refinement-quinary-finite-count. Supply invariant normalizations A,B, smooth Pfaffian degree-five covers, Sel₅(E)/local Kummer bijections, stabilizer E[5], integral minimization and compatibility of nearby local labels with point-group torsion images. The 40-dimensional quintic-ring representation does not supply this. For ternary cubics supply the twisted PGL₃ action, the orbit-to-three-cover dictionary, stabilizer E[3] and integral minimization in plane-cubic Theorems 12–14 pp.8–10. For order-k sets supply compatibility of torsor-cover localisation with the existing JacobianChallenge Layer D symmetric-power Abel map and JC2 Pic¹ convention, including effective divisors supported on conjugate pairs. Generic effective-divisor and Abel-map constructions remain with JacobianChallenge. These are explicit refinements of the ST.1 ownership contract.

Consumers: [ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison](../readmes/ArithmeticStatistics.md#st4-refinement-local-five-quotient-comparison); [ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements](../readmes/ArithmeticStatistics.md#st4-refinement-soluble-generic-three-selmer-elements); [ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer](../readmes/ArithmeticStatistics.md#st4-refinement-plane-cubic-height-and-orbit-transfer); [ArithmeticStatistics:ST.4/refinement-restricted-selmer-set](../readmes/ArithmeticStatistics.md#st4-refinement-restricted-selmer-set); [ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image](../readmes/ArithmeticStatistics.md#st4-refinement-real-effective-divisor-image).

id: ArithmeticStatistics:ST.4/request-16

status: open

### S4/R17 — ArithmeticStatistics:ST.2

Beyond the cited counts, supply the weighted negligible-rational-stabilizer estimate in the BGW unbounded fundamental regions from [BGW reference 1, Proposition 14], the same rational orbit-Jacobian at every place in BGW §11 pp.32–33, and bounded-intersection generic ternary lattice asymptotics plus the complement/cusp subtraction in the H_AB region. The latter extends the existing H_IJ normalization and includes stabilizer multiset multiplicities; positive volume alone does not control omitted lattice points. Preserve the strong excluded-lift saturation in refinement-large-coefficient-family-tail. Repair the wider printed Definition 39 separately, not by treating its reductions as whole p-adic complements. Fix a uniform finite point-multiplicity bound M for the ternary fundamental multiset (or choose a fundamental set with M=1), including its boundary convention, and use that same convention for the bounded-intersection asymptotics and distinct-vector transfer.

Consumers: [ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two](../readmes/ArithmeticStatistics.md#st4-refinement-hyperelliptic-average-two); [ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities](../readmes/ArithmeticStatistics.md#st4-refinement-admissible-family-selmer-parities); [ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count](../readmes/ArithmeticStatistics.md#st4-refinement-soluble-ternary-fundamental-count); [ArithmeticStatistics:ST.4/refinement-positive-plane-cubic-solubility](../readmes/ArithmeticStatistics.md#st4-refinement-positive-plane-cubic-solubility).

id: ArithmeticStatistics:ST.4/request-17

status: open

### S4/R18 — ArithmeticStatistics:ST.5

Extend the parent’s finite-congruence average #Sel₅=6 to every positive-density large family in Bhargava–Skinner Theorem 5 p.4, including F, its −39 twists and finite five-adic discs. Supply the same stabilizer-weighted local orbit-mass formula for the refined acceptable weight so a singleton Q-label has average 5/#Q nonidentity elements. The existing average alone, and the three-Selmer average, do not imply this local equidistribution.

Consumers: [ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution](../readmes/ArithmeticStatistics.md#st4-refinement-five-selmer-local-equidistribution).

id: ArithmeticStatistics:ST.4/request-18

status: open

### S4/R19 — tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Import the existing symmetric-power Abel morphism Sym^k C→Pic^k, D↦O(D), including arbitrary-base-change compatibility and actual effective divisors over Q_v supported on nonrational closed points. No second Abel-map construction is requested. Combine the Pic^k group/torsor law with the JC2 section-free Pic¹ convention and translation by ((k−1)/2) times the actual hyperelliptic degree-two divisor; ST.1 supplies its compatibility with covering localisation.

Consumers: [ArithmeticStatistics:ST.4/refinement-restricted-selmer-set](../readmes/ArithmeticStatistics.md#st4-refinement-restricted-selmer-set); [ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image](../readmes/ArithmeticStatistics.md#st4-refinement-real-effective-divisor-image).

id: ArithmeticStatistics:ST.4/request-19

status: open

### S5/R1 — SelmerIwasawaCohomology:L0

Finite flat fppf H¹, including inseparable torsion, the Kummer exact sequences for n and divisors m|n, restriction/corestriction, Shapiro and localization to restricted products. Supply the genuine cohomological carriers and maps, not opaque propositions. Extend the isogeny-chain exact sequence to arbitrary abelian varieties: for φ1:A1→A2 and φ2:A2→A3, ψ=φ2∘φ1, construct the natural exact sequence Sel_φ1(A1)→Sel_ψ(A1)→Sel_φ2(A2) of BKLOS Lemma 9.1, with its finite torsion kernel. The existing parent elliptic-only sequence is not a general-abelian supplier.

Consumers: [ArithmeticStatistics:ST.5/refinement-sha-one-vanishing](../readmes/ArithmeticStatistics.md#st5-refinement-sha-one-vanishing); [ArithmeticStatistics:ST.5/refinement-kummer-direct-summand](../readmes/ArithmeticStatistics.md#st5-refinement-kummer-direct-summand); [ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand](../readmes/ArithmeticStatistics.md#st5-refinement-adelic-kummer-direct-summand); [ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-global-image-splitting-conjecture); [ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting](../readmes/ArithmeticStatistics.md#st5-refinement-trivial-action-global-splitting); [ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift](../readmes/ArithmeticStatistics.md#st5-refinement-two-selmer-nonlift); [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average); [ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound](../readmes/ArithmeticStatistics.md#st5-refinement-endomorphism-rank-bound).

id: R-local-global-cohomology

status: open

### S5/R2 — SelmerIwasawaCohomology:L1

The finite-flat local perfect cup-product pairing and self-dual Kummer annihilation; Cassels–Tate pairing with its isogeny adjointness, nondegeneracy after maximal divisible quotient, and alternation for elliptic curves. For the parent 3-isogeny parity, the induced dual-isogeny quotient pairing forces even F₃-dimension; do not assume all Sha finite. For the PR quadratic refinement use the negative Weil-cup convention, compatible with the theta obstruction; multiplying the pairing by −1 preserves annihilators but must not be hidden in a comparison.

Consumers: [ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection](../readmes/ArithmeticStatistics.md#st5-refinement-selmer-quadratic-intersection); [ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one](../readmes/ArithmeticStatistics.md#st5-refinement-balanced-three-rank-one); [ArithmeticStatistics:ST.5/three-isogeny-selmer-parity](../readmes/ArithmeticStatistics.md#st5-three-isogeny-selmer-parity).

id: R-duality-pairing

status: open

### S5/R3 — SelmerIwasawaCohomology:L2

Dokchitser–Dokchitser finite reduced p-Selmer parity for elliptic curves over Q, with torsion removed and local/global root number conventions. Supply the descent rank bound and the divisible-Sha correction needed to connect finite and p∞ parity.

Consumers: [ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero](../readmes/ArithmeticStatistics.md#st5-refinement-balanced-three-rank-zero); [ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one](../readmes/ArithmeticStatistics.md#st5-refinement-balanced-three-rank-one); [ArithmeticStatistics:ST.5/refinement-five-balanced-bounds](../readmes/ArithmeticStatistics.md#st5-refinement-five-balanced-bounds).

id: R-selmer-parity

status: open

### S5/R4 — SelmerIwasawaCohomology:L3

Ordinary residual3 Selmer structures and comparison to the elliptic3-Selmer carrier for the precise specialized analytic-rank-zero criterion owned here. The Skinner–Urban nonvanishing implication itself is G-analytic in this lower-tier stage.

Consumers: [ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion](../readmes/ArithmeticStatistics.md#st5-refinement-analytic-rank-zero-criterion).

id: R-special-ordinary-input

status: open

### S5/R5 — ArithmeticGaloisDuality:D7

Poitou–Tate for the self-dual finite-flat group scheme A[λ], including the fppf case, the local invariant maps and reciprocity; kernel Sha¹ of localization and the topological annihilator statement for the global image. Add the finite-exponent compact/discrete character exactness and annihilator duality needed by the compact-open quadratic reductions.

Consumers: [ArithmeticStatistics:ST.5/refinement-sha-one-vanishing](../readmes/ArithmeticStatistics.md#st5-refinement-sha-one-vanishing); [ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection](../readmes/ArithmeticStatistics.md#st5-refinement-selmer-quadratic-intersection); [ArithmeticStatistics:ST.5/refinement-lc-finite-reductions](../readmes/ArithmeticStatistics.md#st5-refinement-lc-finite-reductions); [ArithmeticStatistics:ST.5/refinement-lc-restricted-product](../readmes/ArithmeticStatistics.md#st5-refinement-lc-restricted-product); [ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting](../readmes/ArithmeticStatistics.md#st5-refinement-trivial-action-global-splitting).

id: R-poitou-tate

status: open

### S5/R6 — AbelianSchemesAndArithmeticModuli:A3

Import A3/theta-group and its symmetric-line/sheaf framework. Extend A3 as Part II to the finite-flat quadratic Brauer obstruction, whose polar form is the negative Weil-cup pairing in PR Corollary 4.6, with no division by 2. Supply odd-degree q=−(1/2)x cup x and fppf base-change compatibility; do not re-plan the existing central extension.

Consumers: [ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection](../readmes/ArithmeticStatistics.md#st5-refinement-selmer-quadratic-intersection).

id: R-theta-quadratic

status: open

### S5/R7 — AbelianSchemesAndArithmeticModuli:A3

Degree3 finite flat kernels, dual isogenies, quadratic twists and kernel mirror algebra; finite subgroup-scheme quotients and complete rational3-torsion flags factoring[3]. Export the Weil pairing and residual torsion action, including characteristic restrictions.

Consumers: [ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection](../readmes/ArithmeticStatistics.md#st5-refinement-selmer-quadratic-intersection); [ArithmeticStatistics:ST.5/refinement-kummer-direct-summand](../readmes/ArithmeticStatistics.md#st5-refinement-kummer-direct-summand); [ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting](../readmes/ArithmeticStatistics.md#st5-refinement-trivial-action-global-splitting); [ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion](../readmes/ArithmeticStatistics.md#st5-refinement-analytic-rank-zero-criterion); [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average); [ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound](../readmes/ArithmeticStatistics.md#st5-refinement-multiplication-three-rank-bound); [ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound](../readmes/ArithmeticStatistics.md#st5-refinement-finite-extension-rank-bound).

id: R-finite-flat-isogeny

status: open

### S5/R8 — AbelianSchemesAndArithmeticModuli:A6

The actual action of endomorphisms on the finitely generated Mordell–Weil group and index under[3]. For general ψ distinguish free modules over a domain from arbitrary Z[ψ]-modules and unit components; do not import the invalid universal e/t rank-index estimate.

Consumers: [ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound](../readmes/ArithmeticStatistics.md#st5-refinement-endomorphism-rank-bound).

id: R-endomorphism-action

status: open

### S5/R9 — AlgebraicModuliForArithmeticGeometry:R09.1

Import Gr(n,2n), universal locally direct-summand subbundle, quadratic vanishing closed loci and determinantal intersection loci over Z. The split integral OGr smoothness, parity components and Schubert dimensions are specific new targets here; the source SGA7 proof inputs remain G-ogr.

Consumers: [ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure](../readmes/ArithmeticStatistics.md#st5-refinement-smooth-cylinder-measure); [ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective](../readmes/ArithmeticStatistics.md#st5-refinement-ogr-smooth-projective); [ArithmeticStatistics:ST.5/refinement-ogr-components](../readmes/ArithmeticStatistics.md#st5-refinement-ogr-components); [ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension](../readmes/ArithmeticStatistics.md#st5-refinement-ogr-schubert-dimension).

id: R-integral-grassmannian

status: open

### S5/R10 — AdelicAlgebraicGroups:AA.2

Part II: for finite-type X/Z_p, d=dim X_Qp, a unique bounded Borel measure satisfying µ(S)=lim_e #red_e(S)/p^(ed) for clopen S; lower-generic-dimension subschemes have measure0, and a smooth generic point makes every containing open set positive. Count the reduction IMAGE of integral points. Normalize only when total mass is positive and finite. Provide affine-cover gluing and the nonreduced subscheme correction inherited as E705.

Consumers: [ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure](../readmes/ArithmeticStatistics.md#st5-refinement-smooth-cylinder-measure); [ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension](../readmes/ArithmeticStatistics.md#st5-refinement-ogr-schubert-dimension).

id: R-oesterle-measure

status: open

### S5/R11 — ArithmeticStatistics:ST.1

For n=3,4,5 supply the complete locally soluble descent-orbit bijection at fixed scaled integral invariants, integral representatives and E[n] stabilizers. Use the source projective/central quotient groups: ternary cubics with determinant-twisted PGL₃ (ST.4 only has the globally soluble transfer); BS4 determinant-kernel GL₂×GL₄ quotient on2⊗Sym²4; BS5 determinant-kernel GL₅×GL₅ quotient on5⊗∧²5. Exact-order4 corresponds to strong irreducibility, not the entire Sel₄ group. Reuse ST.1/refinement-genus-one-stabilizer-schemes.

Consumers: [ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-3-selmer-group); [ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-4-selmer-group); [ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-5-selmer-group).

id: R-descent-orbits

status: open

### S5/R12 — ArithmeticStatistics:ST.4

For the accepted ST.2 ternary, quaternary and quinary acceptable-weight counts, construct the rational-to-integral orbit weights, local Kummer cokernel/kernel factors and real/global Jacobian/Tamagawa mass assembly. Preserve the BS5 real stabilizer divisor1/5 corrected in ST.2; prove means4,7,6 on large families before using rank consequences.

Consumers: [ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-3-selmer-group); [ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-4-selmer-group); [ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group](../readmes/ArithmeticStatistics.md#st5-average-size-of-the-5-selmer-group); [ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero](../readmes/ArithmeticStatistics.md#st5-refinement-balanced-three-rank-zero); [ArithmeticStatistics:ST.5/refinement-five-basic-bounds](../readmes/ArithmeticStatistics.md#st5-refinement-five-basic-bounds).

id: R-selmer-local-masses

status: open

### S5/R13 — ArithmeticStatistics:ST.1

BSS Theorem1.4: even n monicization f_mon=f₀^(−1)f(x,f₀y), the quadratic-twist2-torsion cohomology comparison, injection of Sel₂(J_f) into SL_n/µ₂(Q) pencil orbits with invariant f_mon; local solubility when n≡0 mod4. Theorem3.2 gives a fixed κ(n) scaling and integral representative with split antidiagonal A. This is distinct from the odd-degree BGW pencil targets. Supply BSS Theorem4.2 local integral uniqueness and its hypotheses.

Consumers: [ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group](../readmes/ArithmeticStatistics.md#st5-second-moment-of-the-2-selmer-group); [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average).

id: R-bss-monicization

status: open

### S5/R14 — ArithmeticStatistics:ST.2

Reuse the accepted smoothed fixed-A quaternary count and its weight/range restrictions. Complete BSS §§5–7 for leading coefficient a: increasingly sparse congruence subsets of density about a^(−6), uniform small-leading-coefficient and powerful-part estimates, cusp control and local mass assembly. This does not follow from a fixed ordinary quartic count or a product of marginal Selmer averages.

Consumers: [ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group](../readmes/ArithmeticStatistics.md#st5-second-moment-of-the-2-selmer-group); [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average).

id: R-bss-sparse-count

status: open

### S5/R15 — ArithmeticStatistics:ST.1

BKLOS Theorems4.2,5.3,6.2 and7.2: normalized-discriminant SL₂ binary cubics (a,3b,3c,d), mirror quadratic algebra and norm-one kernel description, locally φ-soluble orbit dictionary for general abelian A, unique reducible identity orbit, fixed integral scale and local mass comparison. The number-field coregular count in ST.2 is conditional until these exact adapters and six counting axioms hold.

Consumers: [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average); [ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups](../readmes/ArithmeticStatistics.md#st5-bklos-average-size-of-three-isogeny-selmer-groups).

id: R-bklos-orbit-adapter

status: open

### S5/R16 — ArithmeticStatistics:ST.2

Discharge G-twist in refinement-number-field-twist-orbit-count: the actual coregular SL₂ invariant-height main term (not merely Global Fields I), all six axioms, uniform large-prime tail and compatible finite archimedean squareclass representative window. Prove positive height densities of finite unions of local rectangles and the local average product.

Consumers: [ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average](../readmes/ArithmeticStatistics.md#st5-refinement-abelian-three-isogeny-average); [ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank](../readmes/ArithmeticStatistics.md#st5-refinement-elliptic-explicit-twist-rank); [ArithmeticStatistics:ST.5/refinement-signature-positive-twists](../readmes/ArithmeticStatistics.md#st5-refinement-signature-positive-twists).

id: R-bklos-count-closure

status: open

### S5/R17 — ArithmeticStatistics:ST.4

Route the parent Dokchitser–Dokchitser Lemmas4.6–4.7 and Table1 local Tamagawa/formal-group calculations to a Part II of the existing elliptic local-reduction owner. The needed conclusions are the norm-index cancellation for potentially good quadratic twists over2-adic/3-adic fields and the p≠3 type-IV and split-multiplicative3-isogeny ratios. Obtain a directly read primary version before claiming proof closure.

Consumers: [ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction](../readmes/ArithmeticStatistics.md#st5-tamagawa-ratio-under-potentially-good-reduction); [ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one](../readmes/ArithmeticStatistics.md#st5-cm-three-isogeny-has-selmer-ratio-one); [ArithmeticStatistics:ST.5/refinement-signature-positive-twists](../readmes/ArithmeticStatistics.md#st5-refinement-signature-positive-twists); [ArithmeticStatistics:ST.5/refinement-complex-place-obstruction](../readmes/ArithmeticStatistics.md#st5-refinement-complex-place-obstruction).

id: R-local-isogeny-invariants

status: open

### S5/R18 — ArithmeticStatistics:ST.0

Reuse the source-specific finite-height denominators and height rescaling nodes. Connect the existing ST.5 exact-slice Wood extension carriers to wood-average-normalizations, without changing the existing rigidification formulas. Supply the explicit balanced BS3/BS5 finite-union local-family interfaces and the BSS quotient genus-one family ordered by Jacobian height. Extend ST.0 to the PR Conjectures 1.1/1.4/1.7/1.8 fixed-global-field coefficient-height model families, including odd-degree hyperelliptic models and characteristic-2/3 long Weierstrass equations, and the BKLPR Conjecture 6.9 family. Export finite-height subsets, source denominators, multiplicities and characteristic conditions. The existing integral even-degree ST.0 family does not provide these general families. Do not identify coefficient-height models with minimal invariant-height Q-isomorphism classes without a proved transfer.

Consumers: [ArithmeticStatistics:ST.5/refinement-positive-three-ranks](../readmes/ArithmeticStatistics.md#st5-refinement-positive-three-ranks); [ArithmeticStatistics:ST.5/refinement-five-root-balanced-family](../readmes/ArithmeticStatistics.md#st5-refinement-five-root-balanced-family); [ArithmeticStatistics:ST.5/refinement-jacobian-marked-average](../readmes/ArithmeticStatistics.md#st5-refinement-jacobian-marked-average); [ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization](../readmes/ArithmeticStatistics.md#st5-imaginary-exact-slice-parametrization); [ArithmeticStatistics:ST.5/real-exact-slice-parametrization](../readmes/ArithmeticStatistics.md#st5-real-exact-slice-parametrization); [ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-squarefree-selmer-conjecture); [ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-odd-degree-jacobian-conjecture); [ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-even-genus-two-selmer-conjecture); [ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture](../readmes/ArithmeticStatistics.md#st5-refinement-global-image-splitting-conjecture).

id: R-family-adapters

status: open

## Gap register and current assembly resolution

All 119 gap records are indexed here; full mathematical detail is in the originating packets and reader. “Unchanged” retains the reviewed gap, not a proof-closure verdict.

### P — ArithmeticStatistics

- **P/1**: Bhargava's uniformity estimate for weakly divisible discriminants of pairs of ternary quadratic forms (Theorem 2.19 = [4, Proposition 23]). Status: partial.
  ST.2/refinement-quartic-finite-congruence-count and refinement-quartic-nonmaximal-overramified-tail now plan the S4 generic count and per-prime bound. The latter is restricted to absolutely irreducible S4 orbits; it does not supply the old unrestricted W assertion. Retain the stronger representation-wide contract where a consumer needs it.
  Consumers: `ArithmeticStatistics:ST.2/weakly-divisible-quartic-discriminants-via-ternary-pairs`, `ArithmeticStatistics:ST.2/uniformity-for-weakly-divisible-quartic-discriminants`, `ArithmeticStatistics:ST.2/uniformity-estimate-for-infinitely-many-congruence-conditions`, `ArithmeticStatistics:ST.2/squarefree-sieve-for-binary-quartic-forms`.
- **P/2**: The bound O(X^{1/4}) for pairs of ternary quadratic forms with a fixed reducible cubic resolvent ([4, proof of Lemma 12]). Status: refined.
  ST.2/refinement-quartic-fixed-reducible-resolvent now supplies the planned bound with exponent 1/4+epsilon. The older exponent 1/4 is superseded; every large-stabilizer application must retain this loss.
  Consumers: `ArithmeticStatistics:ST.2/orbits-with-large-stabilizer-are-negligible`.
- **P/3**: Class-group statistics: sources now read, but the proofs of the quoted moment theorems are not decomposed. Status: partial.
  The four-rank proof now has exact ST.3 targets quadratic-four-rank-conic-formula, quadratic-four-rank-jacobi-expansion, fk-maximal-unlinked-support, fk-main-coefficient, fk-narrow-wide-moment-comparison and rank-moments-determine-rank-law. Low-degree class-group mass ratios and quartic resolvent fibres are also specified in ST.3. These are planned proof chains, with their analytic and narrow-norm supplier obligations; the Cohen–Lenstra conjecture is still a conjecture and no original restricted source has been verified by assembly.
  Consumers: `ArithmeticStatistics:ST.3/fouvry-kluners-moments-of-four-ranks`, `ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups`.
- **P/4**: Proofs of Bhargava's quartic and quintic field counts are not decomposed. Status: refined.
  The missing planning interfaces now have ST.1 quartic/quintic multiplication and resolvent targets; ST.2/refinement-quartic-finite-congruence-count, refinement-quintic-finite-congruence-count and their nonmaximality tails; and ST.3/low-degree-s-integral-parametrization, low-degree-maximal-sieve, low-degree-jacobian-mass and quartic-quintic-density-constants. The global-field version keeps the six coregular-counting axioms. This resolves the absence of target names, not their formal proofs.
  Consumers: `ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields`, `ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields`, `ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields`, `ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups`.
- **P/5**: Second-order terms (BST Sections 6, 7 and 9) are not decomposed. Status: refined.
  The secondary-term plan now uses ST.2/refinement-cubic-secondary-congruence-count and refinement-cubic-secondary-sieve-error, followed by ST.3/secondary-cubic-lattice-coefficient, cubic-secondary-local-factor-evaluation, cubic-root-weighted-sieve-identity, refined-cubic-sieve and cubic-secondary-orbit-integral. Lattice/translate averaging and dyadic sieve factors remain explicit; none is a proved baseline declaration.
  Consumers: `ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields`, `ArithmeticStatistics:ST.3/second-order-term-for-the-mean-of-three-torsion`, `ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications`.
- **P/6**: Siegel's indefinite count has no public proof in the sources read. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms`, `ArithmeticStatistics:ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms`.
- **P/7**: The uniformity for totally ramified primes rests on a class-field-theory argument that no source read proves. Status: partial.
  ST.3/cubic-conductor-discriminant, quadratic-order-three-torsion-bound and cubic-large-total-ramification-bound now state the maximal-field route. The ring-class estimate retains the extra wild factor at 3: 3^(omega(f)+1) in general, with 3^omega(f) only away from 3. The all-order nonmaximal contribution and exact class-field adapters remain separate contracts.
  Consumers: `ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse`, `ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion`, `ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications`.
- **P/8**: Wright's theorem (Malle's conjecture for abelian groups) is quoted. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/kluners-counterexample-to-malle-conjecture`.
- **P/9**: The p-adic change-of-variables formula for polynomial maps has no owner in the atlas. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/p-adic-change-of-measure-for-binary-quartic-forms`, `ArithmeticStatistics:ST.4/volume-of-pgl2-zp`.
- **P/10**: The uniformity O(X/p²) for all integral binary cubic forms with p² | disc is only partly planned. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/uniformity-estimate-for-elliptic-curves`.
- **P/11**: The Delone–Evertse uniform bound for cubic Thue equations has no owner. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/uniformity-estimate-for-elliptic-curves`.
- **P/12**: Smith's 2^∞-Selmer distribution theorem (owned by ArithmeticStatisticsPartIISmithMethod). Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law`.
- **P/13**: Orbit parametrisations and counts for 3-, 4- and 5-Selmer elements. Status: partial.
  ST.1/refinement-genus-one-stabilizer-schemes now identifies the degree-3,4,5 geometric groups and their theta stabilizers. ST.2 now has finite, prime-tail and acceptable-weight counts for ternary, quaternary and quinary genus-one models. This is not the missing integral local Selmer parametrization: rational/integral orbit multiplicities, invariant scalars and arithmetic covering dictionaries still require the ST.1 group-scheme/integral-model contract.
  Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.
- **P/14**: Second-moment proof of Bhargava–Shankar–Swaminathan. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`.
- **P/15**: Kane's character-sum estimates and Swinnerton-Dyer's combinatorial theorem. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families`.
- **P/16**: BKLOS binary-cubic parametrisation and counting over number fields. Status: partial.
  ST.2/refinement-number-field-twist-orbit-count now specifies the nonidentity counting input, conditional on the coregular theorem, its six axioms and a compatible archimedean representative window. ST.0 fixes the squareclass denominator. The normalized SL2 binary-cubic mirror-algebra/isogeny dictionary remains absent, and the window compatibility is still G-twist. A global-field discriminant count alone supplies neither contract.
  Consumers: `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups`.
- **P/17**: Cassels–Tate pairing and its isogeny adjointness. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`.
- **P/18**: Local invariants of isogenous elliptic curves at 2 and 3. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction`.
- **P/19**: Rubin's CM lemmas. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction`, `ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one`.
- **P/20**: Canonical measure on ℤ_p-points (Oesterlé–Serre) and the orthogonal Grassmannian. Status: refined.
  ST.5/refinement-smooth-cylinder-measure, refinement-ogr-smooth-projective, refinement-ogr-components, refinement-ogr-prime-power-count and refinement-ogr-schubert-dimension now state the required targets. The generic Oesterlé–Serre cylinder comparison is requested once from AdelicAlgebraicGroups Part II; the orthogonal Grassmannian specialization belongs here. The supplier extension remains a proposal, not an existing theorem.
  Consumers: `ArithmeticStatistics:ST.5/bklpr-random-isotropic-intersection-law`, `ArithmeticStatistics:ST.5/bklpr-alternating-cokernel-limit`.
- **P/21**: p-rank marginal of A_1. Status: refined.
  ST.5/refinement-all-rank-delaunay now states the model identity for every rank, including rank one, using the corrected symplectic mass and rank parameter. It does not prove an arithmetic frequency statement.
  Consumers: `ArithmeticStatistics:ST.5/bklpr-conjecture-implies-rank-and-selmer-laws`.
- **P/22**: Generic mod-p image of E_{A,B}. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/rational-p-torsion-has-density-zero`.
- **P/23**: de Jong's function-field 3-Selmer bound. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound`.
- **P/24**: Wood's moment-determination theorem (proof not decomposed). Status: partial.
  ST.5/refinement-wood-grid-separator, refinement-wood-coefficient-bound, refinement-wood-subgroup-bound, refinement-wood-grid-uniqueness and refinement-wood-bounded-moment-limit now plan the multivariate determinacy proof. The last gives probability-one laws for bounded-exponent quotients X_n/aX_n. A full finite-group limiting law still needs the separately recorded tail/tightness contract; scalar moment determinacy is already native and is not replanned.
  Consumers: `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u`.
- **P/25**: Certified D_4 comparison. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`.
- **P/26**: Existence of the enhanced Cohen–Lenstra limits (Lipnowski–Tsimerman Definition 5.16). Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-finite-level-law`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-conjecture`.
- **P/27**: Finite-field abelian-variety inputs now planned in AbelianSchemesAndArithmeticModuliPartII. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs`.
- **P/28**: The GUE spacing law is not planned anywhere. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs`.
- **P/29**: EVW homological stability and uniform Betti bound (stated input). Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/uniform-function-field-surjection-moment-estimate`.
- **P/30**: Reduced Schur multiplier inputs for Wood's component counts. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-lower-bound`, `ArithmeticStatistics:ST.5/complete-stable-range-component-sum`.
- **P/31**: Full mod-ℓ monodromy of M_1 and M_2 (Achter–Pries base cases). Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/mod-l-hyperelliptic-monodromy-is-symplectic`.
- **P/32**: Moduli of labelled stable hyperelliptic curves and clutching. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/hyperelliptic-boundary-degeneration`.
- **P/33**: Vasiu's surjectivity criterion for Sp_{2g}. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/integral-lift-of-full-mod-l-symplectic-image`.
- **P/34**: Generation of Sp(V) by symplectic transvections. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/overlapping-symplectic-subgroups-generate`.
- **P/35**: Schur–Zassenhaus conjugacy for nonabelian coprime H. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions`, `ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments`.
- **P/36**: Second-order count of binary cubic forms (Bhargava-Shankar-Tsimerman Sections 6 and 9) is not an ST.2 node. Status: refined.
  Use the exact ST.2/refinement-cubic-secondary-congruence-count and refinement-cubic-secondary-sieve-error exports, with their translate dependence and strong acceptability restrictions. Their ST.3 arithmetic assembly is the secondary-density and refined-sieve chain. The statement that ST.2 has no such target is superseded.
  Consumers: `ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields`, `ArithmeticStatistics:ST.3/second-order-term-for-the-mean-of-three-torsion`, `ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications`.
- **P/37**: Geometry of numbers for pairs of integral ternary quadratic forms (quartic rings) is not an ST.2 node. Status: partial.
  ST.2 now plans the quartic finite-condition count and nonmaximal/overramified prime bound on the generic S4 locus. ST.3/quartic-class-group-two-torsion-fibre and low-degree-class-group-mass-ratios supply the corresponding arithmetic fibres and mass comparison. The generic S4 count cannot be used as a count of every reducible-resolvent or étale quartic orbit; retain each stricter fibre contract separately.
  Consumers: `ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields`, `ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups`.
- **P/38**: Geometry of numbers for quadruples of quinary alternating forms (quintic rings) is not an ST.2 node. Status: refined.
  ST.2/refinement-quintic-finite-congruence-count and refinement-quintic-nonmaximal-tail now provide the exact proposed quintic interfaces. They use the 40-dimensional quintic-ring representation, not the 50-dimensional genus-one degree-five model.
  Consumers: `ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields`.
- **P/39**: Orbit parametrisations of 3-, 4- and 5-Selmer elements are not ST.1 nodes. Status: partial.
  ST.1/refinement-genus-one-stabilizer-schemes now fixes the geometric degree-3,4,5 groups, scalar kernels and theta extensions. It does not by itself give integral Selmer orbit dictionaries, local solubility descent or invariant-normalized arithmetic multiplicities. Those remain the group-scheme/genus-one integral-model contract; degree-five genus-one models remain distinct from quintic rings.
  Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.
- **P/40**: Orbit counts for the 3-, 4- and 5-Selmer representations are not ST.2 nodes. Status: refined.
  ST.2/refinement-ternary-cubic-finite-count, refinement-quaternary-finite-count and refinement-quinary-finite-count, together with each representation’s prime-tail and acceptable-count targets, now specify these counts. They must be paired with the matching arithmetic orbit dictionary and the exact groups, heights and multiplicities; they do not repair a missing ST.1 dictionary.
  Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.
- **P/41**: Parametrisation and counting for the second moment of Sel_2 (Bhargava-Shankar-Swaminathan) are not ST.1/ST.2 nodes. Status: partial.
  ST.2/refinement-section-kernel, refinement-smoothed-orbit-unfolding and refinement-smoothed-quaternary-count now plan the special smoothing/counting inputs. ST.1’s odd-degree BGW pencil dictionary does not supply BSS’s even-degree monicization, Selmer injection or fixed integral scale. Those remain R-bss-monicization; a separate local-equidistribution/leading-coefficient tail contract remains necessary.
  Consumers: `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`.
- **P/42**: BKLOS parametrisation and counting over number fields are not ST.1/ST.2 nodes. Status: partial.
  The counting side is now ST.2/refinement-number-field-twist-orbit-count, with its conditional coregular and archimedean-window hypotheses. The normalized binary-cubic isogeny dictionary and compatible integral representatives are still R-bklos-orbit-adapter; keep that ST.1 request open.
  Consumers: `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups`.
- **P/43**: Lemke Oliver-Wang-Wood and Datskovsky-Wright results are not ST.3 nodes. Status: partial.
  ST.3 now includes rigid-embedded-field-family, relative-torsion-splitting, relative-three-torsion-propagation, quadratic-tower-torsion-tail, two-extension-three-torsion-means and relative-wreath-three-torsion-mean. Its low-degree-class-group-mass-ratios gives the number-field means with absolute base-class factors and matching resolvent restrictions. Narrow norm maps, the relative base-character annihilator filter and certified D4 numerical comparisons remain explicit supplier gaps.
  Consumers: `ArithmeticStatistics:ST.5/cohen-lenstra-martinet-average-conjecture`, `ArithmeticStatistics:ST.5/cohen-martinet-surjection-moment-conjecture`, `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`.
- **P/44**: Shared carrier/API for Wood rigidification multiplicities. Status: refined.
  ST.0/wood-type-automorphisms, wood-continuous-surjections, wood-infinity-and-type-adapter and wood-average-normalizations now give the single shared rigidification and denominator interface. ST.3’s embedded-type/nonabelian moment chain and ST.5’s normalization comparisons consume it. The original missing-carrier claim is superseded; the quotient-fibre counting proofs remain planned mathematics.
  Consumers: `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer`.
- **P/45**: Shared arithmetic-family interface for Wood exact discriminant slices. Status: refined.
  ST.0/wood-infinity-and-type-adapter and wood-average-normalizations now connect marked extensions, exact slices and finite-height families. ST.5’s exact-slice parametrizations depend on the infinity/type adapter; the averaging adapter depends on those parametrizations. This direction avoids a cycle and retains the empty-slice and n=1 conventions.
  Consumers: `ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/real-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/imaginary-per-component-unit-moment`, `ArithmeticStatistics:ST.5/real-per-component-unit-moment`, `ArithmeticStatistics:ST.5/bad-type-lower-bound`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer`, `ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion`.
- **P/46**: The family of principally polarized abelian varieties over F_p is not an ST.0 node. Status: refined.
  ST.0/unpolarized-abelian-count, principally-polarized-count and polarization-fiber-count now define the three carriers/counts, including A(p,g)=sum_A n_A and the polarization automorphism quotient. These are unweighted class counts, not inverse-automorphism masses or coarse-moduli rational-point counts. Their asymptotic inputs remain with AbelianSchemesAndArithmeticModuli Part II.
  Consumers: `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs`.
- **P/47**: Projection and spreading interfaces for the corrected geometric-sieve proof. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/lattice-points-on-a-subvariety-in-a-dilated-region`, `ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p`, `ArithmeticStatistics:ST.2/geometric-sieve-large-primes`, `ArithmeticStatistics:ST.2/strong-divisibility-lies-on-a-codimension-two-locus`.
- **P/48**: Native semialgebraic multiset interface in the cusp-count prototype. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/averaged-count-of-binary-quartic-orbits`, `ArithmeticStatistics:ST.2/binary-quartic-lattice-points-in-the-cusp`.
- **P/49** (`G-assembly-cross-part`): Unbound cross-part refinements. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`, `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups`.

### S0 — ArithmeticStatistics--ST.0

- **S0/1**: Positive general-number-field squareclass denominator. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/twist-denominator-frontier`.
- **S0/2**: General-rank binary discriminant, root and ring binding. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/odd-root-criterion`, `ArithmeticStatistics:ST.0/binary-density-formulas`.
- **S0/3**: Polarized geometry and finite class counts. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/unpolarized-abelian-count`, `ArithmeticStatistics:ST.0/principally-polarized-count`, `ArithmeticStatistics:ST.0/polarization-fiber-count`.
- **S0/4**: Picard, theta and adelic geometric specialization. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/theta-tail-normalization`, `ArithmeticStatistics:ST.0/hecke-pushforward`, `ArithmeticStatistics:ST.0/pointless-curve-regression`.
- **S0/5**: Full Wood split-infinity arithmetic binding. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter`, `ArithmeticStatistics:ST.0/wood-average-normalizations`.
- **S0/6** (`G-assembly-cross-part`): Unbound cross-part refinements. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.0/local-maximality`, `ArithmeticStatistics:ST.0/hyperelliptic-model-family`, `ArithmeticStatistics:ST.0/odd-root-criterion`.

### S1 — ArithmeticStatistics--ST.1

- **S1/1**: Nonétale rational quintic realization omitted in HCL IV. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-integral-quintic-realization`.
- **S1/2**: Symmetric-group closures and trace-dual comparison. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-nondegenerate-resolvent-comparison`, `ArithmeticStatistics:ST.1/refinement-quartic-etale-resolvent`, `ArithmeticStatistics:ST.1/refinement-quartic-invariant-index`.
- **S1/3**: Generalized Jacobians, Fano schemes and Selmer torsors. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-pencil-existence`, `ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils`, `ArithmeticStatistics:ST.1/refinement-good-prime-integral-pencils`, `ArithmeticStatistics:ST.1/refinement-common-isotropic`.
- **S1/4**: Group schemes and genus-one degree3–5 integral models. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`, `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes`.
- **S1/5**: Even q polynomial and negative-index boundary. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-even-weak-lift`, `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`.
- **S1/6**: Current upstream orthogonal and integral-lattice adapters. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.1/refinement-one-matrix-slice`, `ArithmeticStatistics:ST.1/refinement-integral-minor-fibres`, `ArithmeticStatistics:ST.1/refinement-marked-q`.

### S2 — ArithmeticStatistics--ST.2

- **S2/1** (`G-native`): Native arithmetic orbit interfaces. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-quartic-finite-congruence-count`, `ArithmeticStatistics:ST.2/refinement-quintic-finite-congruence-count`, `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count`, `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count`, `ArithmeticStatistics:ST.2/refinement-quaternary-finite-count`, `ArithmeticStatistics:ST.2/refinement-quinary-finite-count`.
- **S2/2** (`G-quartic`): Quartic suborders, quadratic extension masses and transport. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-quartic-fixed-reducible-resolvent`, `ArithmeticStatistics:ST.2/refinement-quartic-nonmaximal-overramified-tail`.
- **S2/3** (`G-quintic`): Uniform quintic suborder input. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-quintic-nonmaximal-tail`.
- **S2/4** (`G-secondary`): Cubic second-term proof and local coefficients. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count`, `ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error`.
- **S2/5** (`G-global`): S-arithmetic orbit and geometric-sieve adapters. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-global-field-generic-finite-count`, `ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail`, `ArithmeticStatistics:ST.2/refinement-global-field-large-local-count`.
- **S2/6** (`G-weighted`): Weighted geometric sieve and nonzero monic error. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-monic-strong-tail`, `ArithmeticStatistics:ST.2/refinement-monic-weak-tail`, `ArithmeticStatistics:ST.2/refinement-monic-fixed-modulus-sieve`.
- **S2/7** (`G-even`): Even-degree binary-form repaired tail. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-even-binary-main-shallow`, `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-gram`, `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-deep-tail`, `ArithmeticStatistics:ST.2/refinement-binary-summed-tail`, `ArithmeticStatistics:ST.2/refinement-binary-fixed-modulus-sieve`.
- **S2/8** (`G-quadratic`): Degree-two tails and finite-modulus sieve. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-monic-summed-tail`, `ArithmeticStatistics:ST.2/refinement-binary-fixed-modulus-sieve`, `ArithmeticStatistics:ST.2/refinement-quadratic-binary-summed-tail`.
- **S2/9** (`G-criterion`): Representation-specific geometric-sieve hypotheses. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-invariant-geometric-sieve-criterion`.
- **S2/10** (`G-selmer`): Integral genus-one models and local measures. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count`, `ArithmeticStatistics:ST.2/refinement-quaternary-finite-count`, `ArithmeticStatistics:ST.2/refinement-quinary-finite-count`, `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count`.
- **S2/11** (`G-smoothed`): Smooth unfolding and special quaternary masses. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-smoothed-orbit-unfolding`, `ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count`.
- **S2/12** (`G-twist`): Unavailable coregular number-field count. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count`.
- **S2/13** (`G-local`): Hypersurface coefficient geometry and ball density. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.2/refinement-hypersurface-local-tail`, `ArithmeticStatistics:ST.2/refinement-hypersurface-finite-local-count`, `ArithmeticStatistics:ST.2/refinement-hypersurface-local-density`.

### S3 — ArithmeticStatistics--ST.3

- **S3/1**: Geometric-zero growth lemma. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/rank-moments-determine-rank-law`.
- **S3/2**: Native cubic secondary density interface. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral`.
- **S3/3**: Ring-class conductor normalization. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/cubic-conductor-discriminant`, `ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound`.
- **S3/4**: Cubic order identity over a fixed resolvent. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/relative-three-torsion-propagation`.
- **S3/5**: Native reduced-multiplier and arithmetic-lift exports. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface`, `ArithmeticStatistics:ST.3/embedded-type-catalogue`, `ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization`.
- **S3/6**: Arithmetic nonabelian moment signatures. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface`, `ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator`.
- **S3/7**: Alberts original classification and residue inputs. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments`.
- **S3/8**: Mixed-trace algebraic geometry input. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/mixed-trace-finite-fibres`.
- **S3/9**: Original abelian and quartic counting proofs. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/cyclic-prime-field-count`, `ArithmeticStatistics:ST.3/baily-weighted-quartic-count`.
- **S3/10**: Original governing-field criteria. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/eight-rank-governing-field`, `ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion`.
- **S3/11**: Original Pell bounds and height transfer. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/negative-pell-historical-bounds`, `ArithmeticStatistics:ST.3/restricted-real-quadratic-family`.
- **S3/12**: Real-metric lattice reduction supplier. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction`, `ArithmeticStatistics:ST.3/monic-weak-quasi-reduction`.
- **S3/13**: Polynomial-to-field bounded multiplicity. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target`, `ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target`.
- **S3/14**: Restricted polynomial densities and general binary-order interfaces. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve`, `ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction`, `ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini`, `ArithmeticStatistics:ST.3/binary-form-sieve-counts`.
- **S3/15**: Nakagawa restoration. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target`.
- **S3/16**: Abelian and classical counting originals. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/cyclic-prime-field-count`, `ArithmeticStatistics:ST.3/baily-weighted-quartic-count`, `ArithmeticStatistics:ST.3/all-fields-degree-at-most-five`, `ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily`.
- **S3/17**: Historical Galois-bound exceptional inputs. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/galois-field-three-eighths-bound`.
- **S3/18**: Classical binary quadratic orbit counts. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms`, `ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms`, `ArithmeticStatistics:ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms`.
- **S3/19**: Catalogue computation certificates. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/embedded-type-catalogue`.
- **S3/20**: Narrow relative norm and base-character filters. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/relative-torsion-splitting`, `ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre`, `ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios`.
- **S3/21**: Rank-marginal moment uniqueness export. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.3/rank-moments-determine-rank-law`.

### S4 — ArithmeticStatistics--ST.4

- **S4/1** (`ArithmeticStatistics:ST.4/G-native`): Native geometric suggested signatures. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison`, `ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class`, `ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight`, `ArithmeticStatistics:ST.4/refinement-pencil-selmer-weighted-count`, `ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio`, `ArithmeticStatistics:ST.4/refinement-pencil-measure-comparison`, `ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient`, `ArithmeticStatistics:ST.4/refinement-hyperelliptic-weighted-upper-bound`, `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image`, `ArithmeticStatistics:ST.4/refinement-order-k-strict-average`, `ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average`, `ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear`, `ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity`, `ArithmeticStatistics:ST.4/refinement-biquadratic-parity-formula`, `ArithmeticStatistics:ST.4/refinement-four-twist-local-parity`, `ArithmeticStatistics:ST.4/refinement-mod-eight-parity-family`, `ArithmeticStatistics:ST.4/refinement-odd-residue-field-models`, `ArithmeticStatistics:ST.4/refinement-full-family-corank-parities`, `ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities`, `ArithmeticStatistics:ST.4/refinement-positive-empty-selmer-set`, `ArithmeticStatistics:ST.4/refinement-positive-index-two`, `ArithmeticStatistics:ST.4/refinement-positive-nontrivial-sha-two`, `ArithmeticStatistics:ST.4/refinement-degree-one-points-empty-or-infinite`, `ArithmeticStatistics:ST.4/refinement-corrected-two-prime-criterion`, `ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion`, `ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion`, `ArithmeticStatistics:ST.4/refinement-rank-one-family-properties`, `ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison`, `ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution`, `ArithmeticStatistics:ST.4/refinement-rank-one-torsion-image-bound`, `ArithmeticStatistics:ST.4/refinement-rank-one-saturated-count`, `ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one`, `ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements`, `ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer`, `ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count`.
- **S4/2** (`ArithmeticStatistics:ST.4/G-large-saturation`): Reduction-only largeness does not justify the printed tail. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two`, `ArithmeticStatistics:ST.4/refinement-corrected-two-prime-criterion`.
- **S4/3** (`ArithmeticStatistics:ST.4/G-converse`): The routed rank-one converse has no registered export. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion`, `ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion`.
- **S4/4** (`ArithmeticStatistics:ST.4/G-tamagawa`): General central-isogeny volume calculation is not supplied. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient`, `ArithmeticStatistics:ST.4/refinement-hyperelliptic-weighted-upper-bound`.
- **S4/5** (`ArithmeticStatistics:ST.4/G-uniform-genus`): Uniform denominator in the growing-genus limit. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average`, `ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear`.
- **S4/6** (`ArithmeticStatistics:ST.4/G-number-field`): Number-field height/sieve transfer is not verified. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities`.

### S5 — ArithmeticStatistics--ST.5

- **S5/1** (`G-lc-duality`): Topological quadratic reductions and projective measure. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`.
- **S5/2** (`G-fppf-theta`): Finite-flat theta obstruction and global duality. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`.
- **S5/3** (`G-ogr`): Integral orthogonal geometry and Oesterlé proof inputs. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`.
- **S5/4** (`G-wood-analysis`): Analytic coefficient and bounded-exponent moment interfaces. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-wood-grid-separator`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`.
- **S5/5** (`G-full-group-tail`): From bounded exponents to the parent full Cohen–Lenstra law. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u`.
- **S5/6** (`G-selmer-orbit-mass`): Selmer descent-to-count comparison. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group`, `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group`.
- **S5/7** (`G-bss`): BSS even-degree and sparse-count closure. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group`.
- **S5/8** (`G-analytic`): Special analytic nonvanishing proof and generic residual input. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`.
- **S5/9** (`G-five-density`): Certified root-balanced family density. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`.
- **S5/10** (`G-twist-count`): Number-field coregular twist count. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`.
- **S5/11** (`G-endomorphism`): Unrestricted BKLOS endomorphism rank claim. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`.
- **S5/12** (`G-local-isogeny`): Local3-isogeny and Cassels–Tate proof ownership. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`, `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.
- **S5/13** (`G-kane`): Full-two-torsion twist law analytic inputs. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families`.
- **S5/14** (`G-dejong`): Primary de Jong function-field verification. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound`.
- **S5/15** (`G-inherited-frontiers`): Retained random-group and function-field frontiers. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-finite-level-law`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-conjecture`, `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law`, `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor`, `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs`, `ArithmeticStatistics:ST.5/large-q-cohen-lenstra-theorem`, `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment`, `ArithmeticStatistics:ST.5/bad-type-lower-bound`, `ArithmeticStatistics:ST.5/bad-type-normalization-transfer`, `ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion`, `ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions`, `ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments`.
- **S5/16** (`G-source-family`): Global coefficient-height family adapters. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`, `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`.
- **S5/17** (`G-native`): Native arithmetic and geometric signatures. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions`, `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure`, `ArithmeticStatistics:ST.5/refinement-lc-random-intersection`, `ArithmeticStatistics:ST.5/refinement-lc-restricted-product`, `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing`, `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection`, `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`, `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure`, `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective`, `ArithmeticStatistics:ST.5/refinement-ogr-components`, `ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count`, `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension`, `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay`, `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes`, `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite`, `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights`, `ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit`, `ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture`, `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`, `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting`, `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound`, `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound`, `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero`, `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one`, `ArithmeticStatistics:ST.5/refinement-positive-three-ranks`, `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion`, `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero`, `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd`, `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift`, `ArithmeticStatistics:ST.5/refinement-five-basic-bounds`, `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds`, `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family`, `ArithmeticStatistics:ST.5/refinement-five-full-average-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-low-rank`, `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero`, `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`, `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound`, `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound`, `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound`, `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank`, `ArithmeticStatistics:ST.5/refinement-signature-positive-twists`, `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction`.
- **S5/18** (`G-assembly-cross-part`): Unbound cross-part refinements. Status: unchanged.
  Consumers: `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture`, `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture`, `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture`, `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average`.

