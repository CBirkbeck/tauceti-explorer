# Handoff: BP-DeligneWeightsAndPurity--DWP.0

Codex, session **codex-ibFXG8**. Refs #706. This is the complete target-level pass for the eight stages in this issue, replacing the inherited checkpoint. The packet remains a plan: every implementation status is unchecked.

## Coverage and verification

The packet checker reports **0 errors and 0 warnings**: 81 nodes (8 definitions, 4 constructions, 12 lemmas, 57 theorems), 80 API items, 42 unit tests, 27 planets and 27 checked baseline references. All eight stages are **planned**, none is closed. There are 29 precise supplier contracts and two explicit gaps. “Complete” means that every target in scope has a node and a prerequisite chain at target granularity; it does not mean supplier closure or formalization.

| Stage | Nodes | Planets | Status |
| --- | ---: | ---: | --- |
| DWP.0 | 17 | 6 | planned |
| DWP.1 | 9 | 2 | planned |
| DWP.2 | 11 | 2 | planned |
| DWP.3 | 11 | 2 | planned |
| DWP.4 | 3 | 3 | planned |
| DWP.5 | 18 | 6 | planned |
| DWP.6 | 5 | 3 | planned |
| DWP.10 | 7 | 3 | planned |

Run the packet checker on `research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`. The reader specifies every node, proof sketch, API, test and supplier contract; the suggested file has a coverage ledger giving exact names for unavailable signatures. Only these three deliverables and this handoff are changed.

The suggested file was checked with `lean-check` against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, using the supplied shared build. It exits successfully, with **86 admitted-proof warnings and no other warnings or errors**. No language server or library build was started. Available memory exceeded 100 GB before the checks.

Compilation covers **52 of the 80 API names** and **29 of the 42 example names**, including numerical definitions, the genuine group-pullback core of the Weil group, genuine closed-stalk family predicates, and normalized valuation polygons. The 28 remaining API signatures and 13 examples are explicitly omitted, with their mathematical specifications and suppliers, under PROTOCOL section 13's rule against fabricated proposition fields. The stalk cores do not construct a sheaf category; the group core does not construct the arithmetic fundamental group. The mixed-two-Tate-weights example checks the actual point spectrum; its sheaf-filtration interpretation needs the owner interface. Numerical named signatures include prescribed complex embedding extensions, spectral mapping, kernel weight decomposition, the trace/logarithmic-derivative identity and both error-removal limits. These checks are not implementation claims.

## Mathematical changes

The correct inherited 48 node ids are preserved. DWP.2's curve purity definition is now an adapter to the single DWP.5 predicate, and DWP.3 imports the LPV radical quotient rather than constructing it again. The q-power scheme Frobenius is an SF.0 adapter. Missing inherited prerequisite edges to upstream supplier layers are restored.

DWP.4 covers all three Leray cases in Weil I §7, retains the radical, includes singular-fibre skyscrapers with the correct twist, and removes the half-unit error using arbitrarily large even Cartesian powers. Weak Lefschetz and Poincaré duality provide the other smooth projective degrees. No Leray degeneration is assumed.

DWP.5 contains Weil descent, punctual purity and mixedness, totally real versus fixed-embedding real coefficients, rank-one normalization, determinantal weights, geometric monodromy, majoration, local monodromy purity, Newton boundary estimates, uniform specialization, the representation-surface Hadamard–de la Vallée-Poussin theorem, the compact Weil form and degree equidistribution. The mixed realization hypothesis in Weil II (2.2.4) has finite kernel **on the geometric subgroup**; that subgroup may be disconnected. The conjectures (1.2.9)–(1.2.10) are not used as proved inputs.

DWP.6 follows the actual surface-pencil square-improvement argument, including all three coefficient-specific vanishing-cycle cases and their branch sign lines. It proves the sharp parabolic curve theorem before general direct-image bounds. The dual coefficient in parabolic duality is ℱ∨(1).

DWP.10 exports weights to stable arithmetic subquotients, compatible rational factors only when supplied, finite-residue-field semistable curve graded pieces, and existing companion nearby-cycle/Newton results. Equidistribution uses normal geometrically connected positive-dimensional bases, dimension-N normalization, central translation and rational-point Frobenius powers. The analytic test representations are unitary, hence weight zero. Sato–Tate uses the exact universal elliptic-family monodromy supplier, normalized density (2/π)sin²θ and the minus sign in the point-count formula.

In DWP.3 the fixed odd fibre dimension and arithmetic/geometric degree signs are separated. Haar-null exceptional sets are controlled in **every** degree fibre, with conditional Haar, clopen finite quotients and Dini uniformity, before per-degree Chebotarev is applied. Alpha-family algebraicity follows from its degree-e reciprocal roots in the rational polynomial M_x, not from finite ℓ-adic coefficients. The excluded divisors in the power-family lemma are nonnegative integers different from 1.

The initial curve/Jacobian comparison no longer assumes a rational point on the original curve. A geometric base point gives Frobenius compatibility up to translation; translation invariance on H¹, base-point-free descent and the étale comparison are explicit supplier extensions.

## Ownership and structure

RS-17 is binding. DWP.0 owns the shared numerical predicates. LPV owns pencils, the radical quotient, geometric vanishing cycles, nilpotent monodromy filtrations and graph normalization; EDC owns coefficients and duality; SF/TraceFormula supplies actual cohomological trace, Leray and Künneth; WC owns integral degree factors and point-count bounds. Named DWP.7–DWP.9 companion declarations are imported directly.

The three structure proposals record:

1. Frobenius equidistribution belongs in a new DWP.8 equidistribution sublayer, while Schiffmann's **full density application stays with UniversalHypersurfaceMonodromy, the accepted LPV Part II owner**. Preserve the accepted explicit-family route and its characteristic hypotheses. DWP.0 is only the numerical supplier. Add DWP.0 → RD.6 and the omitted RS-17 ownership entry; RD.6 defines F-isocrystal pointwise purity on imported predicates.
2. Split DWP.5 into coefficient, local and analytic sublayers. The coefficient prefix precedes DWP.2; its later proof suffix depends on DWP.2. Do not introduce a whole-stage cycle.
3. Extend the inspected upstream roadmaps as Part II where their exact required statements are absent: ReductiveGroups (maximal compact comparison, central-degree and ℓ-adic dimension tools), CompactGroups (ℓ-adic analytic nullity and conditional Haar uniformity), ModularCurves (universal elliptic-family full monodromy), and JacobianChallenge (base-point-free descent and étale H¹ comparison). Existing upstream constructions remain imported.

No atlas, route, restructuring-result or other worker's packet is edited. Upstream observations are recorded for the maintainer.

## Sources and corrections

The packet retains exact URLs, versions, SHA-256 values, dates and printed-page locators. Public sources inspected are Weil I §1–§3 and §5.12–§7.3; Weil II coefficient/local preparation, §2 and §3.1–§3.5; Milne's cited curve/Jacobian and abelian-variety estimates; Yu v5's routed weight uses; and Schiffmann's published Proposition 4.7/Appendix B compared with preprint v2 Proposition 4.8/Appendix B. Companion §6 results are imported through their already planned declarations; the entire later paper or automorphic arguments are not claimed as newly read.

Six source issues are explicit: Milne's flagged proof; Schiffmann's contradictory Weil citation; the preprint twist-sign error corrected in the published version; the printed Weil II Sato–Tate mass and point-count sign; and Yu's reversed Hom arguments. Existing confirmed extraction/review ids are named. These are corrections to the cited versions, not assertions about current conjecture status.

Two upstream documents were read in full for style and boundary: CompactGroups and ArithmeticDirichletSeries. Additional relevant layers/documents were read in ReductiveGroups, ModularCurves, SchurWeyl, EllipticCurves and JacobianChallenge. Baseline declarations were read at the pinned commits; an algebraically closed field classification equivalence is never cited as a prescribed-base extension theorem.

## What remains and where to resume

This target-level planning job is complete and ready for independent review. Closure requires the 29 supplier contracts and the following two gaps:

- Prove compatibility with a prescribed countable-subfield embedding in the complex isomorphism construction. The existing classification theorem gives a ring equivalence, without that compatibility statement.
- Instantiate the geometric and representation/analytic signatures using the genuine owner interfaces. Start from the suggested file's coverage ledger, which identifies every missing API/example and the uninstantiated target schemas; do not replace those objects with arbitrary proposition fields.

The independent reviewer should first check Weil I §7's three cases, Weil II (2.2.4), §3.1–§3.2's square improvement, the uniform arithmetic-degree exceptional-set argument, and the corrected (3.5.3)–(3.5.7) conventions. Then check the supplier contracts and the Part II boundaries against their owners. All source hashes, exact statements, dependency ids and remaining obligations are in the committed deliverables; no scratch file is required for resumption.
