# Independent verification: BPLZZ21 extraction red team

Codex, session `codex-J6LwjP`, 2 October 2026. Refs #4080.

**33 confirmed, 2 rejected: all 35 findings checked.** All 18 high/medium findings are confirmed (one high, seventeen medium), with the corrected remedies in the review JSON. Low findings /26 and /33 are rejected because the changes of notation do not invalidate a statement or proof. This session wrote neither the extraction, its accepted review, nor this red team. I checked their provenance and my session's submitted-work registry before claiming the job.

The companion file is `research/blueprint/redteam/RT-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.review.json`. Its per-finding reasons are the actionable dispositions; this report explains the evidence and qualifications. Only these two verification deliverables change. The source extraction, other papers and blueprint packets remain for their respective fix/review jobs.

## Evidence and reading scope

The repository baseline is `4f2323e`. I reread the extraction's items, routes, source issues and report, its accepted review, the red-team findings, PROTOCOL §17 and the source-version rule in §18. All findings were checked against their named fields and the source at the locator, rather than accepted from another worker's verdict.

- [BPLZZ, arXiv 1912.07169v3 PDF](https://arxiv.org/pdf/1912.07169v3), downloaded 2 October 2026: 48 pages, 1,040,282 bytes, SHA-256 `f2834146d4fee02b38c4849ee9a7ef76a3dbc1131e7eef799e6f95b0f0d0ac13`. This matches the extraction's PDF hash. I read the relevant passages on pp. 2–4, 8–13, 15, 17, 19–20, 22–30, 31–33, 36–43 and 45; the p. 15 and p. 45 displays were also inspected as rendered images. The p. 19 subquotient passage and pp. 31–33 setup were checked at their locators. This is a bounded verification, not a claim to have audited every paper proof.
- [Beuzart-Plessis, Mémoires SMF 149 (2016), public published PDF](https://smf.emath.fr/system/files/2017-08/smf_mem-ns_149.pdf), downloaded 2 October 2026: 202 PDF pages, 1,303,210 bytes, SHA-256 `eb5bd655f2bef047fbf0b8cfe769cb8d3e79f491cd29466436b97df18d3b3577`. Read the introductory setup and Theorem 2 (printed pp. 1–4, PDF pp. 11–14), and Theorem 18.4.1 with its opening proof (printed pp. 185–186, PDF pp. 195–196). These give the nonsplit p-adic tempered packet uniqueness required by /16. They do not by themselves establish every epsilon-label refinement of local GGP; retain the packet-theory hypotheses and the duality convention in the statement.
- The [Annals version of record](https://annals.math.princeton.edu/2021/194-2/p05) was **not collated**. Findings about printed slips or gaps here concern the opened v3 preprint. Delorme, GRS, Müller and the other cited works were checked as used in that source, not read as full original proofs. Their remaining proof acquisition is identified in the relevant dispositions.

Library commits were freshly checked against the local read-only baselines: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read:

- [Mathlib's CentroidHom carrier and multiplication identities](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/CentroidHom.lean#L57), together with its semiring/module instances. They supply additive centroids, not automatic complex linearity on arbitrary nonunital complex algebras.
- [The normed closed graph theorem and its assumptions](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Operator/Banach.lean#L531). Its Banach hypotheses do not cover the general Fréchet spaces in Appendix A.
- The pinned Tau Ceti `TauCeti/Topology/Algebra/OpenMapping/Henkel.lean` assumptions and `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter.lean` construction. Henkel's nonarchimedean source assumption does not give the complex Fréchet theorem. `vermaCentralCharacter` does not give the reductive Harish-Chandra isomorphism.

The declaration index was searched for the centroid, closed-graph theorem, Fréchet-space carrier, Harish-Chandra isomorphism and canonical products; the relevant source files and local roadmap contracts were read. These searches establish the stated missing adapters at this pin, not a general assertion that no foundational component could be reused. No Lean compilation or new library implementation is claimed.

## Ownership and dependency checks

I compared the actual accepted route verdicts, not just a top-level `accept`, in BCZ22, LIU22, JIANG-ZHANG20, GAN-ICHINO18, LESLIE25, BCGP21, YUN-ZHANG17, TV16 and NV21. The following qualifications matter to the fix:

1. **The cycle is in proposed imports.** BPLZZ/BCZ's Jacquet–Rallis continuation imports the GGP framework; LIU22 route 17 imports that continuation back. Keep the framework upstream, proved endpoints in Jacquet–Rallis, and arithmetic applications downstream. LIU's specialized Lemma 8.2.1 should reuse the endpoint, not be deleted as if every application were a duplicate proof. Coordinate the correction in the other extractions.
2. **Isobaric construction and multiplicity-one have different owners.** AS.1–AS.2 builds the sums; AL.3 supplies Jacquet–Shalika/Ramakrishnan uniqueness. The merged finding's first recipe sends both to AL.3 and must not be followed literally. CFK24's current classification route is an AL Part II, so it is a remaining coordination issue, not an already harmonized AL.3 precedent.
3. **Pending routes are not accepted suppliers.** NV21's review accepts routes 1 and 2 only; its newer routes 3 and 8 describe the intended real-representation and reductive Harish-Chandra owners but have no route verdict yet. AF.1b/AF.1c are not live assembled stages. Use the AF source route with a named handoff and retain the review gates. Similarly the area fix's AS.1 pseudo-Eisenstein prefix is a specified correction, not an implemented theorem or already promoted stage contract.
4. **Generic functional analysis has one foundation.** The Trèves, tensor-product and Fréchet closed-graph contributions belong together at AS.0. The spectral continuation imports them. For the centroid, preserve complex linearity and the residual adapter; do not mark the arbitrary-algebra definition fully `library`.
5. **Partial reuse does not close a whole package.** /30's Iwasawa and reduction-theory components have suppliers, but the entire Arthur admissibility/real Cartan-involution package needs an explicit residual lemma. /27 already contains the relevant formulas in bundled items; the repair is separation of suppliers and closure obligations, not adding duplicate statements because the formulas were allegedly absent.

I assembled the atlas with `assemble(require_distances=False)`, formed prerequisite-to-consumer edges from `stageEdges` and `requires`, restricted endpoints to actual stage vertices, and checked the directed graph. The result has **2,956 vertices, 8,563 distinct edges, and no cycle**. GN.2 is not an ancestor of any of the eight current stage suppliers listed by the original GGP brief.

A separate prospective graph adds virtual GGP, Jacquet–Rallis, AS and AL continuation vertices. The explicit GGP→Jacquet–Rallis and Jacquet–Rallis→GGP pair produces a cycle. Removing the reverse edge and adding the checked foundational supplier edges (GN.2→GGP; AS.1/AS.2→GGP; AL continuation→GGP/Jacquet–Rallis; AL.3/AN.2/RG2.4/AA.2/AA.3→AS continuation) is acyclic. This is a check of those specified imports, **not** a certification of every direction within every merged future design.

The queue's current accepted routes include four AS continuations (the red team's three plus MAO-WAN-ZHANG26), eight endoscopy continuations, five GGP routes, and four AL continuations. `paper_designs` groups continuations by parent and emits the canonical parent Part II/III id; descriptive proposal aliases remain valid proposals but should be accompanied by the queue name at sibling references. The endoscopy member areas are five `modular`, three `langlands`; `modular` is absent from `galaxies.json`, so majority selection currently transmits an invalid area. Choose one valid area consistently across the sharers.

## Findings

The full evidence, corrected fix and limits for each row are in the JSON.

| Finding | Verdict | Disposition |
| --- | --- | --- |
| /1 | confirmed | Remove the proposed reciprocal imports; keep framework, proof and arithmetic application ownership distinct. |
| /2 | confirmed | Coalesce uniqueness at AL.3 and sums at AS.1–AS.2; correct the conflicting fix paragraphs. |
| /3 | confirmed | Import the shared Asai/GL_n-periods continuation, preserving the signs and twists. |
| /4 | confirmed | Missing all-rank unitary descent, including the even-rank case; source-route to ML.5. |
| /5 | confirmed | Split the reductive Harish-Chandra input from AF category clauses; preserve pending route review. |
| /6 | confirmed | Import real representation theory from the AF foundation, with the AF.1b handoff explicit. |
| /7 | confirmed | Separate general real parabolic induction from the planned nonarchimedean/global cases. |
| /8 | confirmed | Reuse AS.0 tensor/bilinear theory and the canonical-torus continuation. |
| /9 | confirmed | Add the missing GN.2 hermitian classification supplier. |
| /10 | confirmed | Contribute the general genus-p canonical-product contract to the shared AN.2 supplier. |
| /11 | confirmed | Cite CentroidHom and retain the complex-linearity adapter as missing work. |
| /12 | confirmed | State the bi-K-finite compact-support density theorem needed by the extension. |
| /13 | confirmed | Apply E15 to the lattice definition and correct the false square-lattice claim. |
| /14 | confirmed | Define split local base change and its transported choice independence. |
| /15 | confirmed | Assign cuspidal data to the AS prefix; preserve source normalization. |
| /16 | confirmed | Add nonsplit p-adic tempered packet uniqueness and the correct memoir citation. |
| /17 | confirmed | Add the Fréchet closed graph theorem at AS.0; the Banach/Henkel results do not close it. |
| /18 | confirmed | Expose supercuspidal annihilation and compatible split transfer, with support/centre conventions. |
| /19 | confirmed | Clarify canonical queue names, current membership and superseded route counts. |
| /20 | confirmed | Distinguish the elementary AS.1 decomposition from the AS.4 spectral refinement. |
| /21 | confirmed | Record the v3 motivational claim's missing semisimple qualification. |
| /22 | confirmed | Remove the stale disc/circle accusation; retain only E4's actual scalar-bar slip. |
| /23 | confirmed | Correct/deduplicate page locators and remove the misplaced E5 note. |
| /24 | confirmed | Supply the induced-family extension argument; no false endpoint is established. |
| /25 | confirmed | Remove E31's false case gloss without dropping semisimplicity. |
| /26 | rejected | Fixed-χ notation and contextual G-CAP abbreviation do not warrant two errata entries. |
| /27 | confirmed | Separate planned/missing suppliers from bundled statements already present. |
| /28 | confirmed | Expose the discrete spectral and Müller finite-rank inputs, retaining proof acquisition. |
| /29 | confirmed | Add the standing isolation data to the design brief. |
| /30 | confirmed | Reuse planned Iwasawa/reduction components; keep the residual admissibility lemma explicit. |
| /31 | confirmed | Correct E9's explanation: group labels swapped, subscript positions unchanged. |
| /32 | confirmed | Record the stronger fixed-infinitesimal-character finiteness input. |
| /33 | rejected | T-CAP and T₀-CAP are equivalent here because their exceptional sets differ finitely. |
| /34 | confirmed | Correct the invalid `modular` area and coordinate the other member routes. |
| /35 | confirmed | Record the actual opened version/hash and keep Annals collation pending. |

## Validation

The required red-team checker reports no errors. Blueprint intake reports no problems for the two deliverables. Coverage checks compare the exact 35 finding ids, ensure one verdict each, and count one report-table row per finding. `git diff --check` passes. These are verification-file checks, not evidence that the future mathematical fixes have been implemented or compiled.
