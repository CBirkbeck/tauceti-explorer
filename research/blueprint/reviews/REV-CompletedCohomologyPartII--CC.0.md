# Independent review of CompletedCohomologyPartII, part CC.0 (layers CC.0–CC.7)

**Accepted after corrections.** Job `REV-CompletedCohomologyPartII--CC.0`, [issue #376](https://github.com/CBirkbeck/tauceti-explorer/issues/376), done on 14 October 2026 by Claude — claude-xpveIp. The plan under review (`BP-CompletedCohomologyPartII--CC.0`, #701, PR #9702) was written by Claude — claude-u0XBo5. This reviewer wrote none of it.

The packet is an import index of the accepted whole-roadmap plan for CC.0–CC.7 (`CompletedCohomologyPartII.json`), with five new declarations for targets no owner node states. That form is right: the owner, accepted on 13 October 2026, plans every stage target, and planning them again here would plan them twice (PROTOCOL.md section 15). The review therefore checked the index (imports, target mappings, paper routes, findings, consumer requests) by script and against the owner's statements. It read the five new declarations line by line against their sources.

## Counts

| Item | Before | After |
|---|---|---|
| Nodes (new declarations of this part) | 5 | 5: 1 verified, 4 corrected, 0 added, 0 unverifiable |
| API items | 6 | 8 |
| Unit tests | 4 | 4 (one kind corrected) |
| Acceptance cases of the five nodes | 17 | 18 |
| Baseline declarations | 4 | 4, all confirmed, none removed or added |
| Imports | 67 | 68 |
| Target mappings | 49 | 49 (one summary corrected, two suppliers added to it) |
| Requests | 1 | 1 (made precise; one consumer added) |
| Gaps | 0 | 0 |
| Source issues | 1 (E5) | 1, confirmed, locator corrected |
| Stages | 8 planned | 8 planned |

`python3 scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings on this packet. The owner packet and the CC.8 part also still report 0 and 0. An in-memory `merge_blueprints` of the three packets on `data/atlas.json` raises nothing and skips no link. `research/blueprint/intake.py check-files` on the three deliverables reports no problem.

## Corrections

1. **CC.2/complete-torsion-free-complex-control, clause (1), was false as worded.** The statement said that no cohomology module of a complete torsion-free complex has a nonzero ϖ-divisible element. Pan's proof shows something weaker: Hom_O(E, H^i) = 0, so no nonzero class has a compatible system of ϖ-power roots. Divisible classes can exist. Let M^0 = M^1 be the ϖ-adic completion of the free O-module on e_1, e_2, …, and set d(e_n) = ϖ^n e_n. Then w = Σ ϖ^n e_n has no preimage, since the preimage would have to be the non-null sequence Σ e_n. But w − d(e_1 + … + e_{k−1}) ∈ ϖ^k M^1 for every k, so the class of w lies in every ϖ^k H^1. In this example the ϖ-power torsion of lim_m H^1/ϖ^m is unbounded, so clause (4) does not apply. Changes:
   - The statement now asserts only Hom_O(E, H^i) = 0 and says that divisible classes are not excluded.
   - The example is now an acceptance case.
   - The source match is corrected.
   - The target summary in `targetCoverage` and the reader are corrected to match.
2. **CC.4/completed-coefficient-interchange, the O[[T]] test, was false.** It claimed that H̃^i(O[[T]]) = H̃^i[[T]] when H̃^{i+1} has bounded torsion. The node's own formula gives lim_m (A^i_m ⊗ O[[T]]). Over the noetherian ring O/ϖ^m, a tensor product with a product of copies of O/ϖ^m is a product only for finitely generated modules. So the formula describes the series whose coefficients have, for every m, images in A^i_m that generate a finitely generated module, and in general that is a proper submodule of H̃^i[[T]]. Counterexample: the zero-dimensional tower over K_0 = Z_p. There H̃^0(M) = C(Z_p, M) for the ϖ-adic topology. The series Σ_j 1_{p^j Z_p} T^j lies in C(Z_p, O)[[T]], but its coefficients are linearly independent in A^0_1 = C^∞(Z_p, k), so it is not in H̃^0(O[[T]]). The test is replaced by this description and counterexample, which a coefficientwise definition fails.
3. **Pan (2022) locator.** In the open-access version of record, Lemma 4.4.4 is stated on p. 44 and proved on p. 45. The packet cited p. 44 for both. The node locator, the pages read in `sources`, and the locator of finding E5 are corrected. In arXiv v3 both are on p. 48, as the packet says.
4. **CC.3/tame-level-borel-moore-duality.**
   - Its proof uses the adjointness of Borel–Moore transfer with the compact-support trace under evaluation. That is a finite-cover transfer input of the AlgebraicTopology Stage 5 supplier, which the node did not list. The stage is now a prerequisite, and the node is added to the request's consumers.
   - The CE locator now covers p. 4, where the Borel–Moore and compact-support variants of Theorem 1.1(3) are stated.
   - The modular-curve test now says why Nakamura's Ĥ¹_c (the ϖ-adic completion of the integral level colimit) is the H̃¹_c used here: every finite-level H²_c(Y_K, O) is torsion-free. So the Tate-module term of the owner's CC.2/the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting vanishes.
5. **The request to Tau Ceti's AlgebraicTopology Stage 5 is now precise.** Stage 5, item 3 of the current upstream README already constructs chain-level transfer with both degree identities, for a regular cover with finite deck group. The request now asks only for what Stage 5 lacks:
   - the same transfer on relative chains of a finite cover of finite CW pairs, which computes Borel–Moore homology of the Borel–Serre pair;
   - adjointness, under the evaluation pairing of Stage 6, item 1, of homology transfer with the cohomological transfer, and of pushforward with pullback.
6. **CC.3/tame-level-completed-modules.**
   - Two API items are added: `TameCompleted.exists_ι` (every element comes from a level inside a fixed compact open subgroup, with the equality criterion and cofinality) and `TameCompleted.desc` (the universal property of the colimit, with equivariance).
   - The test `tameCompleted_points` had kind `value`, which is not one of the five kinds of PROTOCOL.md section 12. It is now `computation`.
7. **Hecke functoriality of descent (target 39, CC.6).** The CC.6 stage asks for functoriality of descent for Hecke maps, and the summary claimed it. Neither cited owner node names Hecke maps. It does follow from the owner's nodes:
   - the descent spectral sequence is functorial in the completed model;
   - CC.4/derived-finite-level-coinvariants is natural for tame correspondences;
   - CC.6/classical-evaluation-map states it for the classical edge (`classicalEval_hecke`).

   The summary now says this, and those two nodes are added to the target's suppliers.
8. **The Galois clause of CohomologyComparisons' request to CC.4.** That request asks for a complex functorial for Galois maps, and the disposition did not address this. S̃ is a Betti model and carries no Galois action. The Galois action on A^i_m and H̃^i is the one that CC.8/transported-arithmetic-actions (accepted CC.8 part) transports from étale cohomology. The coefficient isomorphism is equivariant for it, with a diagonal action on M, because at each finite level it is the étale universal-coefficient isomorphism. The disposition now says so, and that node is added to `answeredBy` and to `imports`. It is not made a prerequisite of the CC.4 node, since CC.8 is a later layer.
9. **Reader.**
   - Brought in line with all of the above by a script that applies each changed packet text with the site's escaping. A check finds all 149 packet texts, test kinds, prerequisites and owners verbatim in the reader.
   - The layer table's CC.6 count is updated.
   - The conventions paragraph called SmoothRepresentationsOfLocalGroups "now also a TauCetiRoadmap roadmap". It is an open pull request there (#793, under review), so the wording is corrected.
10. **Suggested file.**
    - Clause (1) of the CC.2 lemma has its carriers at the pins: cochain complexes of `ModuleCat O`, their homology, `IsAdicComplete` and `Localization.Away`. It is now stated as `TauCeti.CompletedCohomology.homology_hom_away_eq_zero`, proved by `sorry`, with the source's hypotheses.
    - The docstring lists the two new API names and says that the test names are in the reader.

## Sources read

All five were fetched again. Each SHA-256 equals the packet's record.

| Source | Read at | Result |
|---|---|---|
| Calegari–Emerton, *Completed cohomology — a survey*, author PDF (926a5de4…) | §1.1 p. 2; Theorem 1.1(1) and (3), pp. 3–4 | The definitions, the finiteness assumption, the canonical topology and the second duality sequence with its Borel–Moore/compact-support variants match. |
| Fu, arXiv:2201.11190v2 (d71e9d3f…) | (4) p. 3; §7 pp. 23–24 | The rational double-limit model and the two cited properties match node CC.3/finite-coefficient-model-of-completed-homology. |
| Nakamura, arXiv:2006.13647 (0d8fa462…) | §2.1.1 pp. 15–16; §2.3.1–2.3.3 pp. 20–25 | The colimit along restriction (Poincaré dual to transfer), taken after completion, Lemma 2.4, the Hecke normalisation, the projector, the invariants and the normalised trace, the two diagrams (with E3) and the tame-level isomorphism all match. The Springer copy of the version of record returned a bot challenge, so the bracketed Inventiones page numbers were not re-checked. |
| Pan, Forum Math. Pi 10 (2022), e7 (61549f3a…), and arXiv:2008.07099v3 | §4.4, pp. 43–45; v3 p. 48 | Lemma 4.4.4 and its proof match clauses (2)–(4). Clause (1) is the proof's Hom(Q_p, H^i) = 0 (correction 1). E5 is confirmed. |
| Pan, *… II*, arXiv:2209.06366v1 (0873b61a…) | §7.2, pp. 118–120 | Lemma 7.2.6(1) and its proof match the coefficient interchange. The completed-tensor form uses the bounded torsion of H̃^{i+1}, as the node says. arXiv has only v1. |

**Proof checks.** The arguments of all five nodes were rechecked by hand:
- the Mittag-Leffler argument for finite modules and the interchange of the two limits (Fu's model);
- the convergent-sum argument (it uses completeness of M^{i−1} and separatedness of M^i);
- the Bockstein limits and the divisibility argument of clause (4);
- res/cor and transfer/pushforward with an invertible index, and invariants of a filtered colimit through the averaging projector;
- the Haar-normalised commutative square;
- the flatness of M/ϖ^m and the completed-tensor limit.

**Tests.** Every acceptance case and unit test was recomputed: the circle towers, the zero-dimensional towers, [O → O] with differential ϖ, E in degree 0, the double cover with p odd, and integration against μ.

## Baseline

All four declarations were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `tauceti:Representation.averageMap_eq_invOf_card_smul_norm` (TauCeti/RepresentationTheory/Invariants.lean): `ρ.averageMap = ⅟(Fintype.card G : k) • ρ.norm` for a finite group with invertible order.
- `mathlib:Representation.averageMap` (Mathlib/RepresentationTheory/Invariants.lean): the averaging projection, under `[Fintype G] [Invertible (Fintype.card G : k)]`.
- `mathlib:IsAdicComplete` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Hausdorff and precomplete.
- `mathlib:Representation.dual` (Mathlib/RepresentationTheory/Basic.lean): g acts by f ↦ f ∘ ρ(g⁻¹).

Each provides what its citing node uses. None was removed or added.

## Index, suppliers and findings

**Imports and target coverage.** These were checked by script:
- the 67 imports name existing nodes of the stated packets, with the stated kinds;
- they are exactly the owner's 65 CC.0–CC.7 nodes plus two CC.8 nodes;
- every node id the packet mentions (87) resolves;
- the 153 "owner's reader §" pointers in the reader match the headings of the owner's reader.

The 49 target mappings follow the eight stage descriptions. A Sonnet cross-check compared each summary with the cited owner statements and flagged 13 summaries. The reviewer checked each flag against the owner nodes' full records. Twelve are supported by one of three things, which the review confirmed:
- the owners' prerequisites, gaps, sources or tests (NE.0, L1, G6, G10, Nakamura B.1–B.6, Boxer–Pilloni E7/E9/E110);
- pointers to this part's own nodes;
- the boundary sentence of the stage description.

The thirteenth is correction 7.

**Cross-roadmap suppliers.** Each statement was read and supplies what the new nodes use:
- SR.0: smooth category, unit pro-order, averaging projector, smooth dual (3);
- SR.1: the A-valued Haar measure;
- ALS.1/finite-complex-model;
- ALS.3/level-trace;
- R02.1/mittag-leffler-lim-one;
- Stage 5 of the current Tau Ceti AlgebraicTopology README.

**Red-team findings.** RT-AREA-automorphic-1/3, /17 and the CC.4 route of /18, which `RT-AREA-automorphic-1.fixes-5.md` hands to this job, are discharged by the owner. Its CC.0 and CC.5 nodes cite NE.0, its requests and gap G1 cover the open leaves, its rescope entry widens NE.0, and it requests the L1 Banach category. The CC.4 nodes and the accepted CC.8 part carry /18.

**Consumer requests.** CohomologyComparisons' "partly" requests to CC.2 and CC.4 are now fully answered (with correction 8). TorsionCohomologyInfrastructure's request to CC.4 is answered by the owner.

**Source issues.** The eight confirmed findings this packet cites by identifier all exist with verdict `confirmed`. The misprint PAPER-NAKAMURA-23/E3 is visible on arXiv p. 24.

## Suggested Lean file

`lean-check research/blueprint/suggested/CompletedCohomologyPartII--CC.0.lean`: **compiled**, exit 0, one warning (the `sorry` of `homology_hom_away_eq_zero`) and nothing else. `scripts/check_sorry_data.py` exits 0. A `run_cmd` audit over the file's constants finds no `sorry` in any declaration's type. The file keeps the compact shape of the owner's file:
- the arithmetic carriers are not at the pins, so the other four new targets stay README targets, named in the docstring;
- the rest is proved arithmetic behind the acceptance tests.

## Questions for the orchestrator

1. **Assembly.** Whoever assembles the roadmap should make the owner's CC.6 descent statement name tame Hecke functoriality explicitly (correction 7). The assembly should also carry the corrected statements of this part. The BP's restructure entry is right that `ASM-CompletedCohomologyPartII` writes the whole-roadmap reader and suggested file: it should start from the owner's reader, not rebuild it from the two parts.
2. **SR upstream.** SmoothRepresentationsOfLocalGroups is an open TauCetiRoadmap pull request (#793). Once it merges, the SR.0/SR.1 citations here become citations of that Tau Ceti roadmap.
3. **Nakamura's Inventiones pages** were not re-checked (bot challenge). A worker with browser access could confirm the bracketed page numbers.

No source passage is quoted in the repository. Nothing is formalised.
