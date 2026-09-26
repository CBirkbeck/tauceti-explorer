# BP-PrismaticCohomology--PR.0 — classical delta completion

Issue #978. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session `gpt-20260926-c4e7b2`, 26 September 2026.
Claim `5850473264`; bot confirmation `5850474092`.
Branch `gpt-20260926-c4e7b2-978-completion`.

## Status and preservation

This is a **partial blueprint checkpoint**, continuing merged #3116. It updates only the four #978 deliverables. No implementation status or stage is marked closed. The preceding handoff is preserved [at the immutable #3116 merge](https://github.com/CBirkbeck/tauceti-explorer/blob/a0bebb666cd29391cc776ec0e02db1d20f9d1451/research/blueprint/handoff/BP-PrismaticCohomology--PR.0.md).

All twenty-eight predecessor node objects, twenty-nine baseline records, ten source records, thirty API items, thirty-one definition tests, seven other-stage coverage records and the entire inheritedWork register are unchanged. The reader's Sections 1–7 and the full original suggested-file text are retained. Only the introduction, inventory, continuation boundary and the inserted completion section change outside the appended material. The integrated decomposition, its accepted R2 corrections and seven unrefined IDs remain untouched. PR.8 is outside this issue.

## Mathematical advance

The classical completion construction is now decomposed into eleven declaration-sized nodes. Its central estimate is

    delta(I^(n+1)) is contained in I^n, whenever p belongs to I.

The proof uses the existing dependent product-ideal induction, including its sum case. It does not assume that delta is additive. The estimate is independent of finite generation, Noetherianity, separation and p-torsionfreeness. It is sharp on the canonical integer delta operation. An explicit polynomial example shows that dropping p in I can destroy even continuity.

The congruence estimate constructs genuine functions

    q_n : A/I^(n+1) -> A/I^n.

These are not ring or additive homomorphisms, and no delta structure is asserted on A/I^n. Their transition identities allow the existing AdicCompletion carrier to receive a canonical delta operation D, with normalized coordinate formula

    eval_n(D(x)) = q_n(eval_(n+1)(x)).

The construction chooses representatives only to form an existing adic Cauchy sequence; equality of coordinates proves independence of those choices. The four delta axioms are verified at every quotient level using representatives one precision higher. A nonlinear function is never passed to the linear or ring-map universal property of completion.

Finite generation is used at exactly the stronger step. The pinned `AdicCompletion.pow_smul_top_eq_ker_eval` identifies the quotient kernels with powers of the actual extended ideal. The ordinary algebraic congruence estimate then forces every compatible delta structure to have the same coordinates as D. Thus uniqueness among **all** compatible structures is proved without a continuity premise on the competing structure. The same kernel equality converts the explicit kernel-topology bound into ideal-adic continuity. No unproved equality between kernels and ideal powers is used for an infinitely generated ideal.

This supplies the written classical argument of Bhatt–Scholze Lemma 2.17. It does not construct derived completion, prove the completely etale extension of Lemma 2.18, or identify either with the classical inverse limit. The completion still contains the nonzero square-zero 2-torsion in the mandatory test; no torsionfree quotient is substituted.

## Counts and prototype

Totals: **39 nodes: 3 definitions, 9 constructions, 21 lemmas and 6 theorems; 36 API items; 38 definition/construction tests; 5 planets; 45 baseline references; 16 source records; 3 gap records; 0 requests for this elementary prefix; 0 closed stages.** Eleven nodes, six API items, seven tests, sixteen baseline references and six source records are added.

The new nodes are the ideal correction, the power bound, congruence, shifted quotient function, its value and transition formulas, the actual completion construction, its coordinate formula, base compatibility, its congruence bound and finite-generation uniqueness. The two new constructions each have their API and at least three tests. All the named API items used as dependencies have separate lemma nodes.

The suggested file retains its predecessor and adds twelve named declarations and seven examples. It now has **64 named declarations and 38 examples**, on the existing quotient, Cauchy, completion and square-zero carriers. The shifted maps have ordinary function arrows, not linear or ring-map types. Normalized evaluations and the actual complete-base algebra equivalence are used explicitly.

**Lean was not compiled.** The signatures and proof placeholders still need elaboration at the pin, including the module/ideal quotient normalization and finite-generation kernel transport. A structurally valid packet and successful arithmetic regressions do not certify those signatures.

## Sources and baseline verification

Unchanged pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The source is Bhatt–Scholze, [Prisms and prismatic cohomology, arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4). The full printed p.17, PDF index 16, was successfully rendered and inspected, including all of Lemma 2.17 and its proof. The opening of Lemma 2.18 was used only to record the derived/completely etale boundary; its proof is not claimed read or supplied. No new PDF-byte hash or publisher-edition inspection is claimed. The one-power modulus and shifted construction are authored refinements of the proof, not a new source error or a claim of novelty.

Sixteen additional baseline declarations were read with their surrounding parameters and proof passages in these five exact-pinned files:

- `AdicCompletion/Basic.lean`, blob `32df0034933fcd744a1f5a82f971da098f694c1d`: the inverse-limit carrier, its coherence, the actual adic Cauchy-sequence carrier and `mk`.
- `AdicCompletion/Algebra.lean`, blob `3bcc672bd83bdf455bcf785a7c57df8a01a68f0b`: coordinate ring operations, normalized `evalₐ`, its Cauchy/base formulas, extensionality, quotient normalization and `ofAlgEquiv`.
- `AdicCompletion/Completeness.lean`, blob `aaaca5e9a5fb4f675df822a02498732376c6b9b3`: the full finitely generated ideal kernel theorem and completeness proof. Neither imposes Noetherianity of the ring.
- `Algebra/Algebra/Operations.lean`, blob `38184a3262bee39df4f4ef37e099d7c3ada5ddd3`: the dependent product-submodule induction, with the membership information needed for the nonlinear sum step.
- `Ideal/Quotient/PowTransition.lean`, blob `a141a4e99f4ac0ecfa3d3b6aa5532185795e772c`: the actual ring quotient transitions and their index direction.

Paths above are under `Mathlib/RingTheory/` except `Algebra/Algebra/Operations.lean`, which is under `Mathlib/`. The packet gives complete paths and locators. The original twenty-nine baseline verification records are preserved as predecessor evidence, not presented as fresh whole-file audits.

The current worker/protocol, scoped reviewed audit and accepted RS-01 readings from this turn remain applicable. The new claim was checked against the bot confirmation and the live issue before the continuation. No fresh exhaustive search of both libraries, independent review of the whole integrated decomposition or change of owner boundaries is claimed. Generic derived completion remains with its existing owner; this checkpoint reuses classical completion already in the baseline.

## Validation actually performed

The complete predecessor packet, reader and suggested file were retained locally and their exact Git blob hashes verified before editing:

- packet `46a5da56e505d76c8a9cbfc0ccc12d9a9e06d8f9`;
- reader `96b0770efc053675a46cc45bde5fc5c194c7c794`;
- suggested file `39705dc627fe6d7c1b452f84ba14c7543c9bf266`.

Local Python checks passed for JSON syntax, exact scope, unique node/source/baseline names, required fields, source-excerpt lengths, implementation statuses, all declared prerequisite resolutions, the 39-node DAG, planet limits and exact API/test/signature parity. Preservation checks compare all twenty-eight predecessor nodes, their original baseline/source/API/test records, the seven other-stage worklists, inheritedWork and the unchanged reader/prototype sections.

The fresh regression suite was run successfully twice. It reports:

- **5,495** representative-independence checks and **1,099** level-zero checks;
- **46,527** shifted-addition and **46,527** shifted-multiplication checks;
- **164,180** quotient-transition compatibility checks;
- **18** surviving-torsion checks and **24** exact one-power-loss checks;
- **2** explicit rejection tests for unshifted/additive maps;
- **21** polynomial-power checks and **24** polynomial ideal/congruence checks.

The finite quotient tests use maps between consecutive precisions for the integer/square-zero examples. They do not manufacture a delta structure on a finite characteristic-p-power ring. Exact integer division and finite-field arithmetic verify the representative calculations; symbolic polynomial checks test the (p,X)-adic estimate and the failure for the ideal (X). These finite computations supplement the written universal proof rather than replace it.

The locally validated final packet, reader and suggested-file blobs are respectively `6bf8903bc444ae6363c65063b48ba8fc3e310ba5`, `c164e8e3f2be68dca4a590e09e3471d338f60645` and `0b9a1b18a262c9a9f21ce22d3cd1299e2f04ab3b`. Uploaded hashes and actual current-head submission CI are recorded only after observing them in the PR. This handoff does not borrow the successful #3116 check for its new revision.

No local full-repository checker, full-atlas cycle check or Lean build ran. The delta introduces no new stage edge; its prerequisites are local nodes and pinned baseline references. Repository validation still needs to check the full published packet against the fetched declaration index.

## Exact continuation

Elaborate the one-power bound and shifted quotient functions first, keeping the nonlinear sum argument and the shift in both transition indices. Then elaborate the operation through the existing Cauchy/completion carrier and normalized evaluation maps. Prove base compatibility before the finite-generation uniqueness argument. In the latter, transport the actual module-kernel equality to powers of the extended ideal; do not insert an unproved closure operation or drop finite generation.

Complete the separate p-local/Jacobson-radical localization and completion variants of Remark 2.16 and the derived/completely etale argument of Lemma 2.18 with their original hypotheses and appropriate suppliers. Return to the retained free-delta, perfection, distinguished-element, prism-ideal and envelope nodes, preserving the accepted R2 corrections. The actual prism examples and all cohomological PR.1–PR.7 obligations remain required. The eight-stage part remains partial.
