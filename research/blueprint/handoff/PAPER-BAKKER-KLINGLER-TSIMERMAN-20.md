# Handoff: PAPER-BAKKER-KLINGLER-TSIMERMAN-20

Codex, session `codex-c83e7a`, 22 September 2026. Refs #1422. Status: partial.

The full author paper and official erratum were read. The result contains 118 stable items, 222 dependency edges, 44 definitions/constructions with 132 API contracts and 132 proposed tests, 10 exact library imports, 12 existing plans and 96 missing items routed once through eight routes. Two Part II proposals extend ALS and upstream HodgeStructures. No Lean file or compiled proof is claimed.

Preserve the official erratum's fixed-K parameter, same-K Siegel comparisons and Cartan-compatible morphism conditions. Preserve the rational forward-containment hypothesis in BGST28.1. Hodge morphisms have the canonical compatible compact data; general morphisms do not. Preserve existing carriers and owners, especially ShimuraData D3 for the general VHS definition, AA.3 for reduction, LD.6 for definable Chow, ALS.2 for the symmetric Borel–Serre construction, and upstream HodgeStructures L0–L3 for built Hodge algebra and point carriers.

Resume with the six explicit `verificationGaps` in the JSON:

1. Collate the full published 2020 version with the fully read author copy; publisher metadata alone was verified. All six acquired PDF hashes/read extents are in `provenance`.
2. Finish original Borel–Harish-Chandra/Borel–Serre and Orr2018 proof decomposition. Orr–Schnell's correction was fully read; BGST28.1 statement and full proof were read on author pages13–15. Resolve the proper definable quotient/local slice construction and the surjective group-map arithmetic product adapter.
3. Finish Schmid's nilpotent-orbit and one-variable SL₂ foundations, Kashiwara's earlier inputs and unread/missing image formulas. Exact selected reads are in provenance. The printed870 image confirms squared norms. Do not replace simultaneous weight splittings by the existing single-MHS Deligne splitting. Finish the faithful adjoint/central-cover representation and finite-level extension adapters.
4. Repair and source-check Lemma4.5's finite interpolation domains for z₁=mz₂+i. Its starting strip is not invariant under those substitutions.
5. Prove the quantitative basis-permutation adapter and all finite buffered/face chart reductions. The report's diag(1,T) and Möbius period-map examples explain why fixed ordering and whole-open-disk versions are not adopted. These are derived audit qualifications, not assertions in the published erratum. The global algebraic-base theorem remains the target.
6. Acquire Peterzil–Starchenko Chow and the original o-minimality inputs; verify that the Hermitian arithmetic/algebraic definability comparison can be used independently of Borel algebraicity. Finish graph regularity, closed analytic proper Hodge images and the exceptional tensor/subdatum countability correspondence. A countable union of algebraic loci is not automatically definable.

API names in this paper JSON are proposed adapters, even when their carrier is imported from the pinned library. Retain the conjugate-first library Hodge-form convention, centered-weight shift, nonzero-vector hypothesis, local-boundary branches and strict reducedness inequalities.

Before submitting a continuation, refresh main and all ownership inputs, retain stable item identifiers, run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.result.json`, and check all three named files with intake. Check the custom graph, one-route coverage, API/test coverage, pinned signatures, parent/stage/area identifiers and PDF hashes. No change outside the two paper deliverables and this handoff belongs in this job.
