# GC.6 handoff — ramified norms and quadratic traces

Agent: Codex, session codex-blpvX7. Job BP-FunctionFieldArithmeticPartII--GC.6, issue #8915. Branch: codex-blpvX7-gc6. Claim confirmed by the bot on 18 October 2026. This is the complete planning pass for this one job, not a checkpoint or an implementation claim.

The four deliverables are the GC.6 packet, reader document, suggested Lean file and this note. The parent packet is unchanged, and all thirteen parent targets are accounted for in `targetCoverage` and the reader's coverage table. Every new node has implementation status unchecked. Packet status is **complete**; the single stage `FunctionFieldArithmeticPartII:GC.6` is **planned**, not closed.

## What this pass establishes

The eighteen refinements give the actual simultaneous-frame torsor comparison; the ramified determinant/residue calculation; norm/section and base-change comparisons; the canonical norm trivialization of a difference; two based torsor fibre sequences; both connecting maps in existing cohomology; primary and secondary lift obstructions; the distinction between invariant lines and descended lines; and the double-cover-of-P1 degree counterexample. The secondary obstruction retains the change of norm trivialization modulo the image of the composite boundary. No H2 vanishing or general gerbe classification is assumed.

The independent trace route uses pinned finite-place approximation to move a root-framed line to a signed divisor away from the branch. It preserves the prescribed residue-root frame and uses the actual modified-unit image in ordinary ideles. The native cyclic tensor calculation applies one full-cycle Frobenius and has trace a, rather than a raised to the closed-point degree. GC.5 signed translation supplies negative divisors and every integer degree. Finite reciprocity and the split/inert stalk calculation then give the quadratic trace identity. Inverse uniformizers, geometric Frobenius and the normalized tensor unit are fixed throughout.

New nodes by kind: 1 definition, 2 constructions, 3 comparisons, 10 theorems and 2 applications. There are 15 API items and 9 named unit tests for the three definition/construction nodes, plus the acceptance checks on every target. This packet adds one planet, **Norm descent obstructions**; the parent already has five, so the combined layer has six. It cites 18 exact baseline declarations.

## Remaining work and ownership

There are three precise gap records and two explicit requests:

1. **GC6-CURVE-DICTIONARY, SchemeAndStackFoundations:SF.3.** Connect closed points, native places, residue fields and valuations with rational line frames and signed divisors. Include O(div s), the residue of a regular nonvanishing section, negative coefficients, non-rational points and degree under pullback/norm. Import existing AlgebraicCurves Layer12 and JacobianChallenge LayerA; general line tensors and coherent pullback remain with AlgebraicVectorBundles L0A/L0B/L0C. The ordinary Picard groupoid, Picard stack, line norm and section-stack contracts already have exact SF.3 node imports.
2. **GC6-TAME-RESIDUE, FunctionFieldArithmetic:FA.4.** Export the ramified quadratic local-unit residue-character comparison, with the complete-local Hensel adapter and arithmetic/geometric normalization. The proof route is specified: norm residues are squares; square-residue units have square roots by Hensel; local Artin has the norm kernel. Existing FA.4 finite global Artin and local existence nodes, and FA.2 ideles, are exact imports rather than new requests.
3. **Inherited ST-LISSE/ST-OPS and GC.5 signed-transport frontier.** Supply the actual tame root-stack lisse carriers, finite-cover stalk comparison and Frobenius-compatible tensor/dual transport. The native tensor signature does not supply these geometric objects. This stage needs neither full stack six-functor formalism nor a cohomological point-counting theorem.

A follow-up must work at these exact boundaries, retaining the two torsor fibres and all trivialization data. It must not plan generic weak approximation again: both native place approximation theorems already exist. It must not replace the modified-unit homomorphism by an inclusion, use ordinary invariant-line exactness, or infer all-degree trace comparison from rational points alone. No target was moved down from a higher-tier roadmap, and no restructuring is proposed.

## Baseline and duplication checks

Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369. Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174. Actual declaration statements were read. The approximation, units-sheaf and line-bundle source files in the existing shared build were also compared with raw files at the Tau Ceti pin. Mathlib's existing Ext covariant sequence supplies the boundaries and exactness; SF.2's exact torsor/H1 and site-pullback nodes supply the comparison. No nonabelian gerbe-classification gap is imported.

The reviewed library audit for SF.3, FA.2 and FA.4 was read. Current TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27, including AlgebraicVectorBundles README and Suggested.lean, JacobianChallenge and AlgebraicCurves, and the current Tau Ceti library were inspected read-only. The SF.3 supplier packet has a needs_changes review; its mathematically checked exact contracts are used as plans, not as implemented or accepted-review results.

## Sources and source issues

The published author-hosted Yun–Zhang paper was read through Appendix A, printed pp.514–526, including the complete A.3 norm/descent/trace argument. Its URL, SHA-256 and access date are in the packet and reader. Proposition A.11 supplies character multiplication; Proposition A.12 and formula (A.12), pp.525–526, supply the quadratic trace comparison and cyclic operator. Stacks tags 03AG, 04UJ and 0CJZ were read for torsors/descent and the limitations of the local H2 argument; tags 0BCX and its determinant/line-norm lemmas for norms. Milne, Lectures on Etale Cohomology, version2.21, Section9 pp.64–66 and Section11 pp.76–79, supplies the cohomology and torsor comparisons. All statements are in our own words, with no source excerpts. No restricted book or unavailable source was needed.

Parent source issue FunctionFieldArithmeticPartII/E8 remains the inherited, independently confirmed interpretation gap at the Picard-stack display (A.11), p.525. This pass specifies a replacement rather than asserting every possible interpretation false. Its earlier correction search is explicitly inherited as dated 2 October2026; rereading the published text on 18 October is not described as a new correction search. No duplicate source finding or new source issue is created.

## Validation and suggested-file boundary

`python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.6.json` reports zero errors and zero warnings. The four deliverables pass the swarm file checks. Cross-document checks account for all eighteen target names, all fifteen API names, all nine unit-test specifications and all thirteen parent targets. Parent and new node identifiers are disjoint, all implementation statuses are unchecked, and the combined planet count is six.

The 122-line suggested file elaborated using `lean-check` against the pinned shared build on 18 October2026: exit0, twelve warnings, all from unproved target proofs. Memory was checked before compiling. No language server or build/update/cache command was used. It contains a real-bodied native subgroup, four API statements, three coordinate examples, the nonzero residue corollary and empty-family example, and the actual native tensor trace theorem with two discriminating examples. The reader's omission ledger preserves every geometric target and both omitted construction APIs/tests; there are no substitute stack, torsor, stalk or cohomology carriers and no unproved data definitions.
