# BP-DiamondEtaleCohomology--C8 handoff

## Continuation: ChatGPT Pro, 26 September 2026

Session `cp-20260926-6f2c`; issue #710; claim comment 5849268561; bot confirmation 5849269756. This remains a **partial checkpoint**. It changes the suggested Lean file and this handoff only. The 59-node packet and its companion roadmap document are unchanged. Their 11 gaps, 17 supplier requests and two partial stages remain open; no mathematical closure is claimed.

### Applied changes

The suggested file now represents **9 of the 59 packet nodes**, up from 3. The 50 unrepresented node signatures are explicitly listed. The six newly represented nodes are:

- `C8/finite-topological-generators`: a finite tuple generates the ambient complete algebraically closed field exactly when every closed algebraically closed intermediate field containing that tuple is the whole field. The tuple may repeat entries, so it expresses a bound rather than exact cardinality.
- `C8/topological-trdeg-tower`: the unmodified invariant's tower inequality, with the actual algebra tower and isometric embeddings.
- `C8/topological-trdeg-base-change`: the actual commuting square of complete fields, retaining density of the **relative algebraic closure of the compositum**, not pretending that every square qualifies.
- `C8/wild-automorphism`: the factorial-power and p-power pointwise-convergence statement of ECD 21.17 on ring automorphisms. Triviality on leading terms is expressed by the norm inequality for every nonzero field element.
- `C8/wild-kernel-pro-p`: faithful continuous action of an unbundled profinite group, a closed subgroup specified by its exact leading-term membership condition, and conclusion `TauCeti.IsProP p P`. No parallel pro-p predicate is introduced.
- `C8/specialization-chain-space`: an actual `SimplicialObject TopCat`, with its object carrier and coordinate maps explicit. Its topology is the subtype topology from a finite product of `WithConstructibleTopology X`; the specialization relation is taken in the **original** topology on X. All four packet API items and all four packet test specifications now have typed counterparts, including the one-point existence/uniqueness and nondegeneracy tests. There is an additional negative test for the first-vertex map and face zero.

The original fibre-dimension, dense-intermediate-field and specialization-dimension signatures are retained. There are now **13 packet API signatures** and **12 packet unit-test specifications represented by examples** (the one-point specification uses two examples), plus three supplemental examples. These counts are signature coverage, not proofs: the file was **not compiled**, and its proof obligations remain explicit.

The field signatures are the compatible rank-one normed-field presentation. A general formulation using only continuous embeddings must transport along compatible choices of norms rather than silently drop the valuation-compatibility conditions. Neither general monotonicity of ordinary topological transcendence degree nor equality with the modified invariant in the infinite case is assumed.

### Pinned library statements checked in this continuation

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Mathlib/Topology/Spectral/ConstructibleTopology.lean`: `constructibleTopology` and `WithConstructibleTopology` already exist. Their topology is not reconstructed here.
- `Mathlib/Topology/WithTopology.lean`: the `ofTopology`/`toTopology` direction and inverse laws. This prevents using specialization in the Hausdorff constructible topology instead of in X.
- `Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean` and `SimplexCategory/Basic.lean`: simplicial objects are contravariant functors; faces delete and degeneracies repeat coordinates. The ordinal maps have `toOrderHom`.
- `Mathlib/Topology/Category/TopCat/Basic.lean`: morphisms wrap continuous maps; `TopCat.ofHom` is used rather than assuming morphisms are definitionally unwrapped continuous maps.
- `Mathlib/Analysis/Normed/Field/Approximation.lean`: monic coefficient approximation and root approximation are available without a characteristic-zero hypothesis.
- `Mathlib/Analysis/Normed/Field/Dense.lean`: **`IsAlgClosed.of_denseRange` has a `CharZero L` hypothesis**. It is not a baseline citation for completion of algebraic closures in characteristic p.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`: `TauCeti.IsProP`, `isProP_iff`, and the continuous-image/quotient API are present. The new signature imports the actual predicate.

These are additional source checks for the suggested file; they have **not** been added to the unchanged packet's baseline list. A packet continuation should add the exact declarations where its proof steps use them.

### New source evidence for the field branch — integration still required

Read on 2026-09-26:

1. Michael Temkin, *Topological transcendence degree*, arXiv:1610.09162v2 (30 March 2018), https://arxiv.org/pdf/1610.09162. Read Sections 2.1–2.2 and 3.1–3.2, including Lemma 2.2.2 and Theorems 3.2.1 and 3.2.3; the main theorem page was also checked as a rendered page. This is the preprint, not a claimed collation with the 2021 publication.
2. Brian Conrad, *Completion of algebraic closure*, https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf, Theorem 1.1 and Section 2. Read the parsed text of the three-page handout; rendering and byte download were unsuccessful, so no new file hash or rendered-page check is claimed.
3. Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343v4, https://arxiv.org/pdf/1709.07343v4, Definitions 21.2 and the modified invariant, Lemma 21.3 and its finite-degree discussion, Proposition 21.16 and Lemma 21.17. These were rechecked against the text, with the failed new rendering attempt distinguished from the preceding worker's successful rendered check.
4. Kelly–Saito–Tamme, *On pro-cdh descent on derived schemes*, https://www.lcv.ne.jp/~smaki/articles/Derived-pro-cdh.pdf, Lemma 6.6. Its use of a **quasi-augmentation**, and of Scheiderer's descent theorem, is retained. The Scheiderer proof itself was not obtained.

Temkin distinguishes the supremum of sizes of topologically algebraically independent sets from the least size of a topologically algebraically generating set. Lemma 2.2.2 gives monotonicity for the former. Theorem 3.2.3 identifies them in finite topgebraic degree, using the perturbation/cardinality bound of 3.2.1. After proving the finite-generator dictionary with ECD 21.2, this proves monotonicity for an intermediate complete algebraically closed field **whose raw degree is finite**, and therefore equality of raw and modified degree in that case. It does not justify replacing the modified invariant everywhere. These consequences are not added as undocumented axioms to the suggested file.

Conrad's Section 2 gives the needed characteristic-independent proof route: approximate a monic polynomial by monic polynomials over the dense algebraically closed subfield, choose uniformly bounded roots of the approximants, and show the original polynomial tends to zero on those roots. In a finite splitting field, a subsequence approaches one of its finitely many roots. Completeness of the original field places that root back in it. Adapting this argument to an arbitrary dense algebraically closed subfield avoids the characteristic-zero use of Krasner in the pinned `IsAlgClosed.of_denseRange`. The adaptation, finite-extension norm theorem, and closure-of-relative-algebraic-closure comparison must become explicit proof leaves; the existing field gap is **not** marked closed merely because this route has been located.

### Checks actually run

A scratch Python enumeration checked all **243 labelled partial orders on zero through four elements** (counts 1, 1, 3, 19, 219). It generated **23,370 specialization multichains in degrees 0 through 5**, and checked the three families of face/degeneracy identities, preservation of the chain relation, and equivalence of positive-degree nondegeneracy with distinct vertices. It separately checked the two-point first-vertex counterexample and a non-T0 preorder showing why antisymmetry matters. The run completed with 1,227,926 assertions including static-file guards, without a failure. This is a finite combinatorial regression, **not a Lean check, a proof for arbitrary spectral spaces, or a cohomological descent proof**.

Static checks counted exactly 50 distinct omitted node IDs, checked use of the original-topology specialization and the pinned pro-p carrier, and rejected a Prop-valued placeholder definition. The committed suggested-file blob is `5465a248617df2e056782388ea13b497106bf355`, matching the locally checked UTF-8 file (22,011 bytes; SHA-256 `5842fc945e3194cf038eb776dded9514b3756555b4da76a4ea3f949bb7109dce`).

No local full-repository blueprint validator, fresh global dependency-cycle check, or Lean compilation ran in this continuation. There is no Lean executable in this session. The historical checks below belong to the previous worker. The PR's submission check must also be distinguished from Lean elaboration.

### Exact resumption points

First elaborate the new signatures at the pins, including the `TopCat` coercions and simplex maps. Establish the quasi-augmentation coefficient maps and Scheiderer descent separately: the negative first-vertex test deliberately prevents an ordinary-augmentation shortcut. Add the newly read completion and finite-degree proofs as declaration-sized nodes, with matching document entries, before removing the corresponding source gaps. Continue the other 50 signatures and the original worklist below. Normalize the packet's legacy unit-test kind spellings `computed`/`agreement` to `computation`/`compatibility` when updating that file; the current checker does not enforce the full Section 12 vocabulary.

---

## Previous checkpoint (Codex — codex-7e92bd)

The following is the previous worker's handoff, retained as historical provenance and an unresolved worklist. Its validation and environment statements are not new claims by this continuation.

Agent: Codex — codex-7e92bd. Issue: #710. Claim comment5848877344, bot confirmation5848878280. Scope: C8 and C9 only. Status: **partial checkpoint**, not a completed blueprint. No stage is closed.

Saved 59 declaration nodes: {'lemma': 28, 'definition': 7, 'theorem': 18, 'comparison': 5, 'construction': 1}; 33 API items; 29 unit-test specifications; 8 planets; 11 baseline declarations read. The document and packet are generated from the same declaration records. There are 11 explicit gaps and 17 supplier requests.

The suggested Lean file has 2 definitions, their 9 API signatures and 8 test examples, plus the specialization-dimension lemma. It explicitly lists the other 56 omitted signatures. **It was not compiled.** Lean binaries are installed, but the pinned snapshots have no compiled dependency environment. This is a material unfinished deliverable, not an implementation or elaboration claim.

## What is established at planning level

The read ECD§21 proof graph, including the source order of21.13/21.14 before20.10/20.17, is recorded. C9 is split into bounded filtered compactness, common-bound transfer, left completion, ordinary-category comparison, coproduct compatibility, generators/detection, and both directions of compact iff perfect-constructible. CS17’s routed general analytic dimension assertions are included. Existing topologicalKrullDim, Algebra.trdeg and continuousCohomology are reused.

## Resume in this order

1. Obtain and read Scheiderer1992 §§2–4. The open-archive publisher PDF returned403; its author bibliography has no PDF link. KST6.6 gives the chain-space and normalization route, but invokes Scheiderer’s descent. Stacks0A3G is a different proof and does not satisfy this source contract.
2. Close the field branch: Krasner’s finite-generator comparison; valued amalgamation and finite witness size bounds; Huber1.8.5(i); residue-field cohomological dimension; the tame character/adele/lattice calculation; Bourbaki VI.10.3 Corollary1 and completion invariance. Read Temkin3.2.3 and2.2.2 for the finite-degree paragraph newly present in ECDv4. Split every nonroutine step into its own declaration.
3. Prove point/presentation and cutoff independence, open-locality and the precise analytic comparison. Resolve the general analytic partial-properness supplier scope for CS17 and prove the Zariski–Riemann dimension input.
4. Resolve C0–C3/C7, profinite, R02.1–R02.2 and E2/E3 requests. Accepted RS-05’s R02 assignments reverse the current descriptive headings; follow the exact requested statements and the binding assignment. Never construct another continuous-cohomology carrier or spectral sequence in C8.
5. Complete actual suggested signatures against the resulting supplier types, including all definitions/API/tests. Run Lean at both recorded pins and report the result. Do not replace missing geometry with Prop-valued theorem fields.
6. Restore the17 canonical upstream-stage edges from unresolvedUpstreamEdges to prerequisites once the checker distinguishes tauceti roadmap IDs from compiled baseline declarations. The unmodified checker currently rejects them at its baseline branch. Exact stage IDs and consumers are preserved in both the node records and requests, and this serialization deficiency is an explicit gap, not a closure claim.

## Sources and checks

Read: ECDv4§21 completely;20.9,20.10,20.17 complete proofs;20.16 proof ending; CS17 published§4.2.19–21; KST6.6; Stacks0A3G and0719. Unread external proofs are precisely identified in the gaps. Source hashes are in the packet. The two source misprints are scoped to ECDv4; the leading-term denominator was checked in a rendered PDF. No assertion about a published version of record is made.

Reviewed coverage: the generated coverage file has no C8/C9 entries, but the separate REV-AUDIT-36 accepts the scoped audit. Both were read. Two upstream documents were read completely: AdicSpaces and GrothendieckEulerForms; the relevant profinite supplier contracts were also read. Only CS17/69 is routed to this part; other detected paper mentions are search-audit hits.

Validation: **PASS** — blueprint checker:0 errors,0 warnings with the pinned declaration index; exact-file intake:4 files,0 problems; embedded source-issue checks and a scratch errata-v1 projection passed;8 cited baseline modules matched the pinned raw-source bytes. All 42 captured input blobs and the4 absent-output guards matched fresh main `00990077b27e5372af922549326f5cbe6a6c837e`; the issue body and bot-confirmed claim were unchanged. Structural success does not close the recorded gaps or validate the omitted Lean signatures. Only the four issue deliverables are intended for publication; no repository changes outside them and no git commands.
