# BP-DeformationAndDerivedPatchingAlgebra--P7 — characteristic-zero points

Issue #551. Agent: ChatGPT Pro (GPT-6 Astra Pro).
Session: `gpt-20260926-c4e7b2`. Date: 26 September 2026.
Claim: `5849593495`; bot confirmation: `5849594427`.
Branch: `gpt-20260926-c4e7b2-551-points`.

## Submission and preservation

**Partial blueprint checkpoint.** This continues merged PR #3066 and edits all four issue deliverables. It does not close any of the eight stages, claim implementation, or replace the earlier integrated decomposition. The previous handoff is retained [at the immutable #3066 merge](https://github.com/CBirkbeck/tauceti-explorer/blob/a035ae64a5894764a9d491c5757295d90a19fc90/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

The original five associated-prime/prime-filtration baseline records, their source records and the entire baselineCoverage consumer contract are preserved. The seven coverage records other than R03.4 are unchanged. The reader retains the original prime-filtration mathematics and the suggested file retains all ten original examples. B5 already consumes those baseline results directly following merged #3093; its obsolete request is not reopened.

The existing integrated identifier `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension` is retained and refined, not renamed. The integrated data file and all of its other node identifiers are untouched. Their sources and proofs are not newly certified by this checkpoint.

## New mathematical content

Five nodes (four lemmas and one theorem) now separate the point argument:

1. `nilpotent-uniformizer-artinian`: a finite algebra over a DVR with nilpotent uniformizer is Artinian. The proof uses length of O/m^n and finite-algebra Artinianness, so it does not assume a finite residue field.
2. `generic-prime-coefficient-injection`: contraction of a prime avoiding the uniformizer is the zero prime of O. The resulting coefficient map into A/q is injective.
3. `algebraic-point-of-generic-prime`: apply the existing algebraically closed lift to the domain A/q, with its exact coefficient action, to obtain a point whose kernel is q. The injectivity argument uses the inspected fraction-field factorization of that lift; an arbitrary map from a domain is not assumed injective.
4. `finite-field-of-point-values`: the K-span of the images of finite O-generators is a finite subalgebra, hence inverse-closed in the ambient field. It is exactly K(f(A)). This gives a concrete finite-dimensional proof, not an inverse-limit/denominator argument.
5. The retained integrated point node assembles these into an O-algebra map to the actual integral closure in a finite intermediate field. It corestricts actual values using their monic relations. Localness is proved only after factoring through the injective integral map A/q -> integral closure, followed by the existing quotient and composition lemmas.

The algebraic theorem permits an arbitrary DVR with characteristic-zero fraction field. Its target is the existing integral-closure ring and `IsLocalHom` means unit reflection. It does not call that ring local over an incomplete base. In the source complete local-field setting, LocalFieldsRamification Layer 0 supplies the finite-intermediate-field topology, complete DVR of integers and integral-closure identification. Transporting the map and its maximal-ideal power inclusions supplies the intended continuous local point.

The main statement does not require A flat, reduced or torsion-free and makes no uniqueness claim. It does not silently strengthen the result to a fixed target residue field.

## Hypothesis tests

The reader gives five explicit boundary cases, not just success examples.

- O/(pi^n)[t]/(t^2) is finite and nonzero but has nilpotent pi and no characteristic-zero point.
- O[t]/(pi*t,t^2) has an O-point despite its nonzero pi-torsion.
- O[t]/(t^2-pi*t) has two distinct points which agree after reduction.
- k[t] has positive dimension and pi acts by zero, but it is not finite over O.
- Z_3[t]/(t^2-18) is a finite local domain with residue F_3. Any integral characteristic-zero point makes t/3 an integral unit of square 2. Its residue cannot lie in F_3, so a target residue extension is genuinely necessary in the generic theorem.

The last is a counterexample to a generic fixed-residue strengthening, **not a claim that Khare–Wintenberger's arithmetic Corollary 4.7 is false**. The arithmetic source's exact coefficient-category and residue conventions still need to be reconciled when exporting its specialized result. No source erratum is recorded.

Framed lifting is retained as a separate obligation: a proved complete-local power-series presentation or compatible Artinian lifts plus their inverse-limit realization is required. Bare formal smoothness does not supply local integral lifting; localization O -> K is the elementary boundary test. This checkpoint does not silently remove the framed part of the original integrated node.

## Counts and prototype

The packet now contains **5 nodes: 4 lemmas and 1 theorem**, **17 acceptance conditions**, **1 planet**, **27 baseline declarations**, **2 supplier requests**, and **3 explicit gap records**. No new definition or construction is introduced, so there are **0 new definition API items and 0 definition unit-test records**. These counts do not turn the remaining eight-stage job into a closed blueprint.

The suggested file retains the original ten examples and adds five named signatures and four algebraic regressions: **5 new theorem signatures, 14 examples and 27 declaration checks**. It uses actual ideals, quotient rings, intermediate fields, algebra maps and integral closures. All new proof signatures use the programme's proof placeholders. No opaque proposition or substitute field stores the desired result.

**Lean was not compiled.** No Lean/Lake executable or pinned local checkout was available. In particular the dependent intermediate-field scalar towers still need elaboration. The source-level construction does not certify those signatures.

## Evidence: fresh versus inherited

Unchanged pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

The original five prime-filtration declarations retain their preceding checkpoint's verification notes. This continuation inspected the additional cited statements, ambient parameters and proof passages in eleven pinned Mathlib files. Their Git blob hashes and exact sections are in the packet. Notably:

- the DVR definition excludes fields, the uniformizer is an irreducible, and the quotient-length formula works over any residue field;
- finite length is not finite cardinality;
- `IsAlgClosed.lift` is used on the quotient domain with torsion-free coefficient actions;
- `IsIntegralClosure.finite` requires a finite **separable** fraction-field extension and a Noetherian integrally closed base;
- `RingHom.IsIntegral.isLocalHom` requires **injectivity**;
- `IsLocalHom.of_surjective` requires a local source and nontrivial target.

Read the current worker and blueprint instructions, the existing four deliverables, the scoped AUDIT-17 R03.4 entry, the integrated point/finiteness records, and the LocalFieldsRamification Layer 0 finite-extension and integral-closure contract. Earlier RS-08, audit-review and upstream-style readings remain provenance of the previous checkpoint, not fresh whole-family audits. The oversized aggregate library-coverage file was not obtained; the scoped reviewed audit was used. No new exhaustive library-absence claim is made.

Fresh external passages:

- Khare–Wintenberger, [author preprint proofs.pdf](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf): coefficient conventions on pp. 4–5 and the dimension/Corollary 4.7 argument on pp. 45–46. These were read as **parsed text only**. Screenshot attempts at PDF indices 44–45 failed. No fresh binary hash or publisher-edition comparison is claimed.
- Stacks [00JB](https://stacks.math.columbia.edu/tag/00JB), Lemma 10.53.6 and its proof, for the Artinian/finite-length step.

The new lemmas are explicit proof refinements motivated by the source passage. They are not represented as five separately numbered propositions in the paper. Its arithmetic dimension calculation, fixed-residue specialization and framed lifting remain separate source work.

## Validation actually run

The complete predecessor packet, reader and prototype were reconstructed in local scratch and checked against their Git blob hashes before editing:

- packet `288e3165f3d95c3f960923c3a40790268f59ff23`;
- reader `0b1563dbb311c2f774dee07c6e249ef0fcbefe97`;
- suggested file `0b01140641d3fe1442d5b8933b516c0db619751e`.

Local Python checks passed for JSON syntax, unique node/baseline/source IDs, the exact eight-stage scope, unchanged original baseline records and baselineCoverage, unchanged other-stage worklists, all five signature/node correspondences, source fields, source excerpt limits, unchecked statuses, planet constraints, declared prerequisite resolution and the displayed five-node DAG. The original ten Lean examples remain byte-for-byte within the preserved section. No full-atlas cycle check is claimed.

Exact finite algebra checks used nine reductions (Z/p^n)[e]/(p*e,e^2), with p=2,3,5 and n=1,2,3. All **414,582 ordered-pair projection checks** and **920 unit checks** passed, alongside the nonzero nilpotent and p-torsion checks. These are finite reductions of the model, not characteristic-zero examples and not a proof that pi is nonnilpotent in the untruncated ring.

SymPy verified that localizing the symbolic relation ideal (u*x,x^2) by u forces x=0 without forcing 1=0, and verified the two branch roots of x^2-u*x and their common reduction. Enumeration verifies the residue-square obstruction in F_3. The infinite/adic implications are written mathematical arguments in the reader, not inferred from these finite tests.

The uploaded packet, reader and suggested-file blob hashes exactly match the locally validated files: `118a81f009a519144adc2b2fb06ef50e5948483a`, `ba2f64342cc74b69852c76ccef0a005c1c6d3c29` and `871018f9dfa656d20f2423cc0c37415f6fbb31f8`, respectively.

No local full-repository `check_blueprint.py`, global stage-DAG test or pinned Lean compilation ran. The actual current-head repository submission result must be observed and recorded in the PR, not borrowed from #3066 or #3093. Passing structural/index checks is not mathematical proof or Lean elaboration.

## Exact continuation

First elaborate the five signatures with the actual quotient and intermediate-field scalar towers; preserve the distinction between A and its injectively mapped quotient. Instantiate the Layer 0 integral-closure and topology comparison only in its stated complete local-field regime. Verify the adic continuity by maximal-ideal powers, not by an unstated topology on a field-valued point.

Then split and prove the source-qualified framed-lifting target using R03.1's complete-local universal property and exact residue data. Do not promise a fixed-residue point from the generic finite-algebra criterion: the explicit quadratic order above rules that out.

Continue the R03.4 finite-over-subring and finite-image criteria and the arithmetic dimension input without importing an entire arithmetic modularity proof into generic commutative algebra. Keep the original integrated identifiers when their proofs are refined. P7–P9 and the other R03 stages retain their exact existing worklists; this checkpoint does not certify them or mark them closed.
