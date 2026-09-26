# BP-PrismaticCohomology--PR.0 — ordinary delta localization

Issue #978. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session `gpt-20260926-c4e7b2`, 26 September 2026.
Claim `5850227228`; bot confirmation `5850228521`.
Branch `gpt-20260926-c4e7b2-978-localization`.

## Status and exact preservation

This is a **partial blueprint checkpoint**, not a completed prism/cohomology roadmap or Lean implementation. It continues merged #3107 and updates only the four #978 deliverables. The original sixteen node objects, twenty baseline records, eight source records, twenty-four API items and tests, seven other-stage coverage records, and inheritedWork register are preserved. The integrated decomposition remains untouched. PR.8 is outside the scope.

The preceding handoff is preserved [at the immutable #3107 merge](https://github.com/CBirkbeck/tauceti-explorer/blob/ca8425cf4729eefba30e7bd288e3f40ebd1e9772/research/blueprint/handoff/BP-PrismaticCohomology--PR.0.md). Its printed initial claim IDs were inaccurate: the issue thread gives initial claim `5849878286` and bot confirmation `5849879238`. The current claim IDs above were checked against the live thread.

## Mathematical advance

For a delta ring A, a submonoid S and the existing localization i:A -> B, the construction proves the exact criterion:

    a compatible delta structure on B exists uniquely
    iff i(phi(s)) is a unit for every s in S.

The condition is saturation of Frobenius denominators, not literal stability of S. It applies with zero divisors and p-torsion and does not assume that i is injective. The result neither constructs a new localization ring nor replaces it by a torsionfree quotient.

The proof uses the actual length-two Witt ring. It first constructs the coefficientwise map and proves that (a,b) in W_2(R) is a unit exactly when both a and a^p+p*b are units. The explicit inverse is (a^(-1),-b*a^(-p)*(a^p+p*b)^(-1)); no cancellation of p occurs. The Witt section of A then sends the denominators to units in W_2(B), so the existing localization lift gives a section B -> W_2(B). Localization extensionality proves its first-coordinate section condition. The preceding equivalence reconstructs the delta operation.

Uniqueness and the universal property compare the actual Witt sections, not merely their Frobenius maps. The source Lemma 2.15 follows by specializing to a Frobenius-stable submonoid. The cleared fraction formula has the coefficient i(s)^p*i(phi(s)), not an unqualified s^(2p). All nontrivial steps have nodes and actual-carrier suggested signatures. Two previously written API lemmas are promoted rather than duplicated.

The reader includes both boundaries. The delta structure with phi(X)=X^p+p on Z_(p)[X] does not extend to the Laurent polynomial ring. Conversely, at p=2 in Z plus F_2*epsilon, localization at s=(3,1) works although phi(s) is not a power of s: it divides s^2. The nonzero epsilon survives and its lambda=1 delta remains epsilon.

## Counts and remaining scope

The packet has **28 nodes: 3 definitions, 7 constructions, 13 lemmas and 5 theorems; 30 API items; 31 definition/construction tests; 4 planets; 29 baseline references; 10 source records; 3 gap records; and no open supplier request for this elementary prefix**. The increase is twelve nodes, including two promotions of existing APIs, six API items and seven tests.

The suggested file preserves its full predecessor text and adds twelve named declarations and seven examples. It has 52 named declarations and 31 examples in total. All new signatures use the existing rings, ring maps, localization instances and Witt carriers. The localization instance is explicitly bound, so a placeholder proof cannot silently omit it.

**Lean was not compiled.** No Lean/Lake executable or pinned local build was available. The signatures, universe/instance details and proofs require elaboration. The source-level construction is not a claim that the mathematical prerequisites are implemented.

The six other integrated PR.0 IDs and PR.1/prismatic-structure-sheaf, their accepted corrections and all PR.1–PR.7 obligations remain. Free delta-algebras, the separate Jacobson-radical/completion extension around Remark 2.16, completions, perfection, distinguished elements, prism ideals, envelopes and all actual prism/cohomology comparisons are not closed by ordinary localization.

## Source and library evidence

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Fresh reads include WORKERS, blueprint and expansion protocols, UPSTREAM_GUIDE, the scoped AUDIT-38 PR.0 record, RS-01 ownership decisions, the current four deliverables and the confirmed issue. The earlier upstream-style and independent audit-review readings remain inherited provenance, not a new review by this worker.

The exact pinned localization definitions and proofs were inspected: IsLocalization, map_units, algebraMap_isUnit_iff, mk', mk'_spec', lift, lift_eq, ringHom_ext and map_eq_zero_iff. Their file blob is `cd24e373b44241083605b53458dd44c516c6767c`. The truncated Witt ring, its surjective truncation and coordinate rules were re-read at blob `36361b8a179cf66013b34bf2d6f357b932ef9808`. The rational fraction-ring instance was checked in FractionRing.lean, blob `915d9cf3c6c25054c2bbf7a29b63b6208183cc0c`, for the rational test. Limited default-branch searches are not claimed as a fresh exhaustive absence audit.

Bhatt–Scholze arXiv:1905.08229v4, Lemma 2.15 and proof on printed p.16, was read as parsed text. Its screenshot failed. PDF index 16, covering the adjacent localization discussion on p.17, was rendered and inspected. No PDF bytes, fresh hash or publisher-edition comparison was obtained. The sharper image-unit criterion and direct Witt proof are authored deductions using the source dictionary; the printed proof instead uses a free delta-ring presentation. No new source erratum is alleged.

## Validation actually performed

The complete predecessor packet, reader and prototype were reconstructed in local scratch and their exact Git blob hashes verified before edits:

- packet `68c307f0dc5969672eca519d0ff8166f87df4265`;
- reader `bc67b0a3023ae46f1eaaa2a615eb7233a0ec15d3`;
- suggested file `f144f6aa1bc778e776d943754f73791503f9d848`.

Local checks verified preservation of all sixteen node objects, the original baseline/source/API/test inventories, the seven other-stage worklists and inheritedWork; the entire reader Sections 1–6 and original suggested file are retained. JSON syntax, unique names, exact scope, source fields, all declared prerequisite resolutions, the 28-node DAG, API/test/signature parity, unchecked statuses and planet limits passed. This is not the repository-wide or global-atlas validator.

Fresh regression results:

- 2,600 length-two Witt vectors over Z/n, 1<=n<=12 and p=2,3,5,7, checked against brute-force invertibility: 199,214 inverse-product checks, with 1,101 explicit inverses verified.
- 21 symbolic identities for the Witt inverse, ghost product and fraction numerators.
- 18,108 mixed-characteristic square-zero fraction-formula checks and 18,108 changes of fraction representation, using exact rational and finite-field arithmetic.
- 68 torsion-survival checks, plus the explicit polynomial-denominator counterexample.

These are finite regressions supplementing the written proofs, not Lean proofs or certificates for every ring. All ran successfully twice. The uploaded reader and suggested file match the locally validated blobs `96b0770efc053675a46cc45bde5fc5c194c7c794` and `39705dc627fe6d7c1b452f84ba14c7543c9bf266`. The final packet upload and current-head submission result are checked and recorded separately in the PR conversation.

No local full-repository check_blueprint.py or full-atlas cycle check ran. The delta adds only existing local-node and pinned-baseline prerequisites, with no new stage edge. Current-head CI must be observed; success of #3107 is not validation of this revision.

## Continuation

Elaborate the coefficientwise W_2 map, the unit criterion and the localization construction on the declared instances; preserve the distinction between a Witt section and its ghost map. Prove the exact universal property and cleared fraction identity as stated, including zero localizations and the surviving-torsion test.

Continue the Jacobson-radical/completion argument of Remark 2.16 and the genuine completed delta-ring theory with its own hypotheses; do not infer preservation of a Jacobson-radical condition under arbitrary localization. Then return to the existing free-delta, distinguished-element and prism nodes and their accepted source corrections. The full eight-stage part remains partial.
