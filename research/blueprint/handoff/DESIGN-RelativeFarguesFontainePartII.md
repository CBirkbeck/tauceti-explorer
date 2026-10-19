# DESIGN-RelativeFarguesFontainePartII — complete target pass

Worker: Codex, session `codex-NqetLM`. Issue: #4971. The bot confirmed the claim on 19 October 2026 at 07:48:34 UTC. This submission finishes the one requested planning job; it is not a time-limit checkpoint.

## Deliverables and coverage

The new roadmap extends `RelativeFarguesFontaine` in the holomorphic-function and general-perfect-field schematic-curve direction of `PAPER-FARGUES-FONTAINE-18`. The four deliverables are the roadmap definition, packet, reader document and compact suggested Lean file, with this handoff as the fifth changed file. The packet accounts for all 348 routed item ids. It has 109 nodes: 69 theorems, 15 definitions, 9 constructions, 13 comparisons and 3 applications; 97 API entries, 72 unit tests, 44 planets and 14 pinned library declarations. All implementation statuses remain `unchecked`.

Every layer HF0, HF1, HF2, HF3, HF4, HF5, HF6, HF7, HF8, HF9, HF10 and HF11 is **planned**, and none is closed. The packet status is `complete` under Protocol section 0: every target has been planned, with exact unresolved inputs recorded. The actual build order is HF0–HF7, HF9–HF10, HF8, HF11. Per-layer `openInputs` propagates mathematical gaps and open requests through local prerequisites. This avoids declaring a downstream stage settled merely because its own immediate target has no additional gap.

The reader document carries all 109 statements, their hypotheses, proof plans, sources, Checks, direct dependencies, APIs and tests. Its worked checks cover normalized norms, Newton signs, coordinate inversion, point metrics, degree weights, product shifts, ideal classes, conjugated tangents, bounded fibres and geometric inertia. Every stage description also states its targets. The suggested file deliberately does not introduce placeholder carriers for the future ramified rings, points, bundles or curve.

## Exact open mathematics

The independent review should begin with these six obligations and the matching target statements:

- **G-MATRIX**, HF9 interval gluing: the valid local factorization uses the conjugated tangent `(U,V) ↦ U+ZVZ^-1`. Its neighborhood depends on Z. The source density argument does not establish that the chosen approximant lies in that neighborhood. Prove a uniform estimate or a different bounded approximation, and then verify the parent's module-surjectivity and maximal-spectrum exact-square hypotheses.
- **G-GENERATORS**, HF9 global bundle equivalence and closed submodules: produce uniformly finitely many compatible generators for a compact finite-free system of bounded rank. Generic Fréchet–Stein/coadmissible theorems do not imply finite generation. Include the half-open free-module conclusion.
- **G-BOUNDARY**, HF10: write out a finite extension with actual failure at endpoint 1 and a ramified representation outside the B-plus Frobenius-module essential image. Failure of a contraction estimate is not a counterexample. Remark 11.1.11, p. 367, gives the residue-Galois-factorization route, but the concrete comparison remains an obligation.
- **G-HOMOGENEITY**, HF11: prove the required valued automorphism-extension property for maximally complete Cp-type fields. The conditional orbit description is stated precisely. Maximal completeness for an arbitrary value group is not substituted for homogeneity.
- **G-EQUALCHAR**, HF7–HF8: verify the all-characteristic Lubin–Tate and quantitative cohomology inputs and the two-character positive-line multiplication proof. In characteristic 2 use a separable quadratic Eisenstein extension, for example defined by X²+pi X+pi, and retain the uniformizer twist. The characteristic-zero square-root proof alone does not establish this case.
- **G-COORDINATE**, HF1: derive the actual ramified cyclotomic carry polygon and sufficient transformed radius. The explicit numerical comparison is scoped to E=Q_p; the source q-only auxiliary calculation does not justify a universal ramified threshold.

## Supplier interfaces and ownership

Six request records specify exact contracts. Five are open; R-CONVEX is already planned by its upstream owner:

- **R-TATE**, `PerfectoidSpaces:P3`: quantitative almost traces, continuous scalar/unit/small-ball cohomology, finite-length de Rham H¹ and complete finitely generated module effectivity, plus uniform annular matrix-cocycle corrections. Existing P9 finite-Galois effectivity and infinite-tower full faithfulness are insufficient for this request.
- **R-CRYS**, `CrystallineCohomology:CR.1`: the pro-final p-adic PD interpretation of the completed envelope of ker(W(O_F)→O_F/a_rho). It is a pro-object statement over Z_p, not a terminal ordinary nilpotent thickening or a construction from an unrelated O_C quotient.
- **R-LT**, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.1`: the existing finite-Q_p theory extended to all complete discrete local coefficient fields, including the characteristic-p logarithmic period identity.
- **R-KT**, `TropicalAndBerkovichArithmetic:TB.1`: completed Kahler seminorms, the primitive-extension type criterion and the nested-disc differential estimates used by Kedlaya–Temkin. The vanishing after exchanging the base to k((x)) is distinguished from the nonvanishing relative differential at a type-4 point over k((t)).
- **R-BC**, `VectorBundlesAndIsocrystals:VB3:general-BC`: the actual positive degree-two nonrepresentability obstruction. Neither the negative-slope example nor the sufficient small-positive-slope representability range supplies its converse.
- **R-CONVEX**, current `OptimalTransport` Layer 5: proper EReal convex functions, conjugation and Fenchel–Moreau. This is an existing roadmap import. HF0 owns only the sign bridge and Newton polygon specialization.

Generic Fréchet–Stein/coadmissible theory is imported from `LocallyAnalyticDistributionsPartII:ND.2`; it is not replanned or requested here. Positive Veronese Proj is imported from `SchemeAndStackFoundations:SF.0/relative-proj`. The finite-group quotient uses `SF.1/finite-group-quotient` after proving affine orbit neighborhoods and no geometric inertia. The generic affine vector-bundle equivalence is existing current upstream `AlgebraicVectorBundles` work. The parent owns relative ring/untilt/Proj carriers; VB2 owns geometric curve classification. The packet's restructure proposal keeps the needed supplier extensions in their existing directions. No object is moved out of a higher-tier roadmap in this submission; no supplier files are changed. The existing `PerfectoidSpacesPartII` identifier is not repurposed.

## Source and library audit

Baseline statements were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The audit also read the current upstream trees: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer roadmap families absent from the atlas snapshot were screened. The relevant additional owners are AlgebraicVectorBundles, AdicSpaces and OptimalTransport. No build ran in those read-only trees.

The source inventory and fingerprints are in the packet and document:

- **FF17**: the public Fargues–Fontaine author copy dated 16 April 2017. Read the target-bearing §§1.4–1.10 (pp. 61–95), §§2.1–2.7 (pp. 98–132), §§3.1–3.6 (pp. 133–149), §4.1 (pp. 152–155), §5.1 (pp. 202–203), §§6.1–6.7 (pp. 243–259), §§7.1–7.9 (pp. 261–276), Remark 11.1.11 (p. 367), §§11.2.1–11.2.4 (pp. 369–377), and the specifically cited Preface targets.
- **KT16**: the public Kedlaya–Temkin v6 author PDF, Theorems 1.2–1.3 and their proof prerequisites, pp. 1–5.
- **Berger08**: Remark 1.1.3, p. 96, for the nonprincipal positive-function ideal.
- **ST02**: public arXiv math/0206056, §3, pp. 7–10, checked against the existing ND.2 generic interface.

The 44 inherited FF17 source findings were checked at their author-copy locators and rewritten in this roadmap's own words. Their original extraction ids remain credited. The published Astérisque 406 volume was not collated, and its correction status is not asserted. The Gauss normalization is separately an interface clarification: raw norm |pi|_rho=rho must be power-normalized before invoking a fixed-scalar normed-space API. No source passage or source-by-source section summary is stored in these deliverables. The library's INDEX was checked; this job uses only the public sources named above and no uncleared book copy. The quantitative proofs behind R-TATE, the homogeneity extension theorem and the positive-degree representability obstruction remain missing inputs, not claimed readings.

Several corrections matter particularly for review: the same-endpoint bound in compact norm stabilization; the weak rather than pi-adic monomial completion; norm powers under coordinate/coefficient changes; p=2 root theory bypassed through imported perfectoid tilting; primitive degree rather than E-dimension weights; the degree-independent normalized-factor bound; the forward shift and orbit separation in interpolation; the unramified coefficient step separated from the tensor step; invertible linearization in Frobenius modules; two-character Koszul multiplication; and multiplication by the Runge period ratio when approximating pi/[b].

## Verification and resumption

The suggested Lean file has 137 lines. `lean-check research/blueprint/suggested/RelativeFarguesFontainePartII.lean` completed successfully at the pinned shared build with exactly ten intended proof-placeholder warnings, no errors and no other warnings. The two new end statements are the generic Bezout/multiplicative-degree PID criterion and the corrected local Banach factorization theorem; eight examples check existing divisor, theta, de Rham and bounded-section interfaces. This validates their signatures only. No language server or library build was started, and no compiler remains running.

Final validation:

- `scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**.
- `research/blueprint/intake.py check-files` over the five deliverables: **0 problems**.
- Custom inventory audit: 109 unique target ids with identical statements in packet, stage descriptions and reader; 348 unique routed item ids; every definition/construction has a use-derived API and at least three tests; all API/test names appear in the reader; all implementation statuses are unchecked; no excerpt or quote fields.
- The graph checker verifies prerequisite resolution and acyclicity; planets are within the six-per-layer limit.

The next action is independent review of this complete target pass, not another planning claim by this process. Mathematical follow-ups should resolve the six gaps and five open supplier contracts, then update the affected target statements and inherited coverage, preserving the named source corrections. General convex/Fréchet–Stein/Proj/vector-bundle theory must remain with its existing owners. No scratch file is needed to resume: the authoritative statements, source fingerprints, corrections, requests and routing ledger are in the submitted deliverables.
