# BP-PeriodsAndSpecialValues--PS.0 — complete planning pass

Issue: #1034. Worker: Codex — codex-Ha7lES. Branch: codex-Ha7lES-periods-ps0.
The claim was confirmed by the bot in issue comment 6258323814 after claim comment 6258321967. This run takes no second job.

The four deliverables are the packet, reader, compact suggested Lean file and this handoff, all named PeriodsAndSpecialValues--PS.0 (with this note's BP prefix). The packet status is **complete**, with PS.0, PS.1, PS.2, PS.3, PS.4, PS.5, PS.6 and PS.7 each **planned**. No stage is closed. This is a finished target-level planning pass with explicit contracts and gaps, not an interrupted checkpoint or an implementation claim. PS.8–PS.11 are outside this issue.

There are 39 nodes: 11 definitions, 11 constructions, 2 theorems, 11 comparisons and 4 applications. The packet contains 119 API items and 73 unit tests in total, including five API items and three tests retained on the rational-line comparison. The checker counts the required definition/construction APIs/tests only: 114 and 70. There are 22 planets, 14 cited baseline declarations, 10 supplier requests, 6 gaps and 2 source findings. Every definition/construction has at least three discriminating tests. All implementation statuses remain unchecked.

## Decisions that must survive assembly

- Integration is β:D⊗C→B⊗C. Deligne uses I=β⁻¹. In column coordinates the basis formula is C⁻¹PA. The explicit elliptic row-cycle integration matrix must be transposed before inversion. The reader contains a specified curve, forms, oriented cycles and integral entries, as well as the Tate example.
- Period classes use one coefficient-field unit across all embeddings. Deligne algebraicity allows a zero coefficient; its nonzero-unit refinement is stronger. A finite value at a noncritical integer, such as ζ(0), does not pass the criticality predicate.
- The completion has no conductor half-power. BCGP and Deligne complex gamma normalizations differ by one factor 2 per complex gamma block. The strict compatible-system definition uses algebraic closures of coefficient completions and includes places dividing the coefficient characteristic; it asserts no coefficient-field descent.
- MC.6 already owns the effective/full formal-period algebra, Tate localization and torsor comparison. PS.2 owns integration evaluation, its relative/Stokes/product obligations and its commuting normalization diagram. Evaluation injectivity is a separate conjecture.
- PMIA L5 owns generic determinants of perfect complexes. M.8 already owns selected arithmetic fundamental lines and regulator determinant comparisons. PS.3–PS.4 import them and assemble explicit BF/FK factors, leading terms and integral/local corrections. Early PS.0 uses independent realization/determinant inputs, so M.8 must not acquire whole PS.3/PS.4 as a prerequisite.
- Burns–Flach Ξ is inverse to Fukaya–Kato Δ. The real zeta element in Δ has image L*, and the corresponding Ξ element has image (L*)⁻¹. The integral acyclic determinant of [O --π^a→ O] in degrees 0,1 maps to π^a O; shifting inverts it.
- Complete real Tate cochains at 2 are unbounded. The integral dyadic determinant is a genuine gate. Passing to odd primes or inverting 2 does not settle the 2-part of an elliptic formula.
- PS.6 explicitly plans BK motivic-pair axioms, actual local/global points, the exponential-normalized product measure, quotient volume and arithmetic kernel. Its weight-≤−3 Tamagawa predicate differs from the weight-−1 height formulation. Total finiteness differs from primary finiteness.
- BSD.8 retains all-prime reconstruction and source-qualified prime dispatch. LTXZZ rank predictions differ from source-qualified theorem imports, and diagonal-cycle nonvanishing differs from derivative nonvanishing. The latter needs the height/AJ hypotheses. No unconditional solution of the inherited proof gates is claimed.
- CN.4 retains interval arithmetic and certified L-enclosures. PS.7 gives arctangent and Legendre-period specializations with explicit error bounds and normalization ledgers. Overlapping enclosures do not prove exact algebraic membership.

## What remains and where it belongs

The six packet gaps are precise:

1. Complete the actual Artin Gauss-sum and modular-symbol-to-motivic period comparisons; the analytic formulas alone do not establish them.
2. Extend C5's proper/curve comparison to all relative pairs in MC.6, including connecting maps/Stokes and products, before finishing actual integration descent.
3. For any integral assertion including real dyadic places, supply a specific bounded perfect replacement and retain its two-primary corrections, or keep the exact restricted scope. No general replacement is assumed to exist.
4. Acquire/collate the original Fukaya–Kato formulation and the original Burns–Greither abelian Tate theorem. BV and NE.7 supply the stated orientation interface; BF Remark 10 is only the lead for the latter proof.
5. Resolve the relevant PAPER-LIU-ETAL-22 proof-route gates at its routed Part II owner. Register that Part II's atlas ids. Derivative interpretation separately needs Conjecture 8.3.1 and Abel–Jacobi injectivity.
6. Collate Deligne's original French Proposition–Definition 2.3(ii) and period locators. The original IAS download refused access; E2 is scoped only to the visually checked 2018 English translation.

The ten requests name actual consuming nodes and exact statements in the packet/reader: PMIA L5; the relative-theory KU-fundamental checkpoint of GeneralAlgebraicKTheory; AGR R01.3's full conductor normalization; MC.2 geometric objects/period comparisons; C5 relative comparison; R11.5 all-degree strict compatibility/purity; WC.2 global motivic duality compatibility; IntegralIwasawa I.7's exact abelian Tate ETNC theorem; Selmer L4's routed arithmetic level-raising/Euler-system Part II; and AL.5's precise relevant Rankin analytic normalization. Existing fine nodes supply WD/purity, analytic GL1/GL2, Borel/elliptic regulators, Selmer complexes, arithmetic duality and BSD assembly wherever they already match. The requests do not instruct other workers by message or create additional issues.

Two rescope proposals preserve the current MC.6/M.8 ownership and route the unregistered ArithmeticLevelRaisingAndBipartiteEulerSystems Part II. The maintainer decides these; no atlas/application/queue files were edited.

## Sources and version discipline

The source register records exact editions, URLs, sections/pages and hashes when a file was downloaded. Read: Deligne in the Ghate–Beineke translation revised 2018; Huber–Müller-Stach arXiv v5; BCGP published-format preprint; Serre's SDPP article; Tate's standalone 1979 article; Burns–Flach publisher PDF; Burns–Venjakob author final; Bloch–Kato standalone article; LTXZZ published NSF copy from the cleared library in place; Johansson arXiv v1. Formula-bearing BK pages 371–372 and 374–375, BCGP coefficient-closure conventions and the Deligne criticality display were visually inspected. No cleared source file or source passage is in the repository.

E1 inherits BCGP's cohomological exponent correction from its extraction, scoped to the version read. E2 records the missing negative argument in the 2018 Deligne translation's second infinity factor, with the unit-motive counterexample; it makes no finding against the uncollated French original. The corrected NE.7 rational-character restriction and ER.5 normalization gates are imported, not rediscovered. LTXZZ's extraction has 126 issues; this pass preserves its theorem-import gates rather than claiming to resolve all of them.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/PeriodsAndSpecialValues--PS.0.json`, also with the explicit pinned declaration index: **0 errors**, five warnings.
- The five warnings are existing upstream EllipticCurves layer-anchor citations without request entries. WORKERS.md requires importing existing Tau Ceti roadmaps and forbids re-planning them; the reader explains why no upstream construction request is added.
- Embedded source findings and sourceVersions validated with the source-issues checker and the version-validation function: pass. The standalone errata-job CLI expects a different protocol and basename; its packet-inappropriate wrapper was not used as the final validation.
- Mechanical packet/reader identity check: every target statement, API item and unit test agrees. The JSON is valid, the scoped coverage is complete, and no source passages, private absolute paths, Lean blocks or proof placeholders occur in the packet/reader.
- `lean-check research/blueprint/suggested/PeriodsAndSpecialValues--PS.0.lean`: **exit 0**, only proof-placeholder warnings, at Mathlib 082e2d37e8 with the pinned Tau Ceti build. The file is 213 lines. Available memory exceeded 20 GB before each compile. No background compile remains.
- The suggested file follows the current WORKERS.md compact shape. All data definitions have real bodies over existing carriers. The reader's coverage table maps heavy missing-carrier targets to their complete mathematical specifications, rather than inserting fake structures into Lean.
- Reviewed audit and pinned declarations were read, as were the current upstream roadmap and Tau Ceti trees. The current IntegralLattices, EllipticCurves and Tate Hodge inputs are imported. No lake command ran in the read-only upstream environment.

A follow-up starts with independent review of this complete plan, then discharges the named source/interface gaps at their owners. Every coverage record says what must be supplied before closure. The scratch directory is disposable and is deleted after submission; this note and the four deliverables retain everything needed to resume.
