# Independent review of the R09.7b ownership manifest

**Accepted with corrections**, as a complete target-level planning pass; coverage remains **planned** and every implementation remains **unchecked**. Reviewer: **Codex**, session **codex-FltAoQ**, job **REV-AlgebraicModuliForArithmeticGeometry--R09.7b**, issue **#9914**, 2026-10-16. The input was written by the different session **codex-IUUxMT** for BP-AlgebraicModuliForArithmeticGeometry--R09.7b, issue #9910. This is an independent review, not a review of this session's work.

The [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7b.json) correctly creates **zero nodes**. Its 22 imported targets retain the accepted aggregate and supplemental owners: **7 definitions, 4 constructions and 11 theorems**, with **33 API items, 34 definition/construction tests and 3 existing planets**. The review records **15 verified and 7 corrected target contracts**, plus **7 verified and 2 corrected supporting contracts**. “Corrected” here identifies changes to this manifest or reader; no accepted owner packet is edited. All nine baseline citations are confirmed; none is removed or replaced. No node, request, planet, source finding or ownership transfer is added. Two inherited source findings receive fresh confirming verdicts.

## Corrections made

1. **Source labels and pages.** In the reader, replace the nonexistent Theorem 4.12/Corollary 4.13 reference by **Proposition 4.12 and Remarks 4.13, p. 244**, with Example 4.16, p. 245, and proof pp. 251–252. Replace Theorem 4.24 by **Proposition 4.24**. For the supporting order comparison, use **Propositions 4.8 and 4.11, pp. 243–244**, with proofs pp. 248–251. Identify the pointed test policies by (4.3)–(4.4), Remark 4.5, Definition 4.6, p. 242, and **Definition 4.10, pp. 243–244**. Identify the completion calculation by **Lemma 3.5 and Remarks 3.6–3.7, pp. 233–234**, rather than treating these numbered items as sections.
2. **Common marks.** Specify divisibility by every reduced mark **dᵢ−q** in the coefficient ideal. Divisibility by the original marks alone is insufficient: an original mark three also produces reduced mark two, so common mark three would give a nonintegral exponent.
3. **Finite checking.** Qualify `samuelCertificate_finiteCheck` by the monotone degree-block diagrams required by the finite-degree theorem. A chosen abstract division diagram alone does not establish that hypothesis. The finite-degree paragraph now explicitly retains the source's generality of an arbitrary commutative coefficient ring with identity.
4. **Invariant-admissible towers.** Expand the nonincrease theorem's hypothesis: centres are smooth, have simultaneous SNC with the boundary, and the complete invariant is locally constant on them. This is (1.2), p. 213, and Theorem 1.14, p. 220. Permissibility for an isolated marked ideal does not establish full invariant-admissibility. Record this convention in the manifest as well as the reader.
5. **Fresh source verification.** Add BM1989 as an explicitly accessed public source and distinguish the original planning pass's reading boundary from this independent review. The 1989 stabilization proof and the full 1997 transform proof have now been freshly checked. Preserve the original selective-reading record; there is no claim to have read either whole article.
6. **Inherited source issues.** Add independent `confirmed` verdicts to the two `importedSourceIssues` entries, with this review job as `by`. Keep their existing ids and owner packet. The reader now states that these checks were performed. No duplicate erratum is introduced.
7. **Suggested-file comment.** Replace the stale “Check S3” label on the strict-derivative example by “E1902 example”; S3 in the reader is the different wrong-order certificate test. No Lean statement or proof body changes.

The packet also gains the required independent `review` object, one verdict for each imported target, a separate supporting-contract inventory, baseline verification records and the supplier-check boundary. The reader and packet agree after these corrections.

## Sources and mathematical checks

The public [Bierstone–Milman 1997 published article](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf) was checked at every imported target and supporting source locator. The downloaded file matches the recorded SHA-256 **f01ebbb0591fa62f9b65c16ab54f35e7409cf4fb0abd1f01bf3bf9b59d87ecaf**. This review selectively read printed pp. **213–214, 216, 219–220, 226–228, 231–239 and 241–283**. In particular the checks include the proofs, rather than only the statements, of Theorems **7.14, 7.20–7.21, 8.1 and 9.6**. Locators are printed pages of the published 96-page version.

The independent review also read **Theorem 5.2.1 and its proof, pp. 820–821**, in the [public full text of Bierstone–Milman 1989 uploaded by Edward Bierstone](https://www.researchgate.net/publication/255647609_Uniformization_of_Analytic_Spaces). This verifies the imported fixed-dimension stabilization input. No restricted book was needed. No source passage or section-by-section source synopsis was added to the repository.

Every target's source, hypotheses and proof closure has its own `review.checked` entry. Particular checks retain the distinction between full and restricted pointed exceptional tests; equal-codimension order comparison; guarded residual normalization; supported division and all five Samuel certificate conditions; the chosen diagram versus the actual initial diagram; the strict lower derivative bound; reversed ideal containment for centres; common regular neighbourhoods; residue fields at non-rational closed points; birth history; partial Hilbert–Samuel comparison; factorial denominator bounds; exact codimension padding; and auxiliary monomial descent. None of these is supplied by merely elaborating native power-series statements.

**E1901** is confirmed at Example 2.1, p. 226: the year-one parenthetical's original monomial has the wrong variable. **E1902** is confirmed at the end of the proof of Theorem 9.6, p. 282, against Definition 7.9, p. 265, and Remark 9.5(1), p. 277: the derivative bound is strict. The reader's substitution and marked-square derivative examples discriminate both mistakes. Their original aggregate ownership is unchanged.

## Baseline, ownership and closure

The actual statements and surrounding typeclasses were read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**:

| Declaration | Verified contribution |
| --- | --- |
| `MvPowerSeries.coeff` | Coefficient linear maps over a semiring, indexed by finitely supported multi-indices. |
| `MvPowerSeries.order` | Total-degree order in extended naturals, with zero having infinite order. |
| `MvPowerSeries.order_mul` | Additivity over a nontrivial commutative semiring without zero divisors. |
| `MvPowerSeries.pderiv` | Formal coordinate derivation over a commutative semiring. |
| `Pi.wellQuasiOrderedLE` | Finite products of preorders with well-quasi-ordering; the Dickson input. |
| `Module.length` | Extended-natural length of a module over its specified ring. |
| `Matrix.det` | Determinants of finite square matrices over a commutative ring. |
| `MvPowerSeries.coeff_pderiv` | Shifted coefficient multiplied by the new coordinate exponent. |
| `PowerSeries.constantCoeff_iterate_derivative` | Factorial times the selected coefficient over a commutative semiring; factorial inversion is specialized to ℚ. |

The imported target set exactly equals the accepted supplement's 21 core assignments to R09.7b plus its coefficient-completion theorem. All **22 direct prerequisite lists** match their owner nodes. They end in other imported targets, the nine support owners, pinned declarations or the explicit SF.0 interface. Every definition/construction has at least three discriminating test groups, and every imported API and test name occurs in the reader. The three planets retain their original owners and sensible names: **Maximal contact**, **Resolution invariant**, **Coefficient completion comparison**. The manifest does not recreate them as nodes.

Read actual SF.0 supplier statements for **étale coordinates**, **Noetherian completion** and **Jacobson finite-type closed-point density**. They provide parts of the requested foundation, but do not already discharge the complete compatible Taylor/completion/derivation/restriction contract. SF.0's packet currently has a `needs_changes` review; this acceptance makes no claim to accept that separate packet. Read the SF.3 scope and requests and current effective-Cartier declarations: the unrestricted divisor/product bridge also remains an inherited requested interface. Those boundaries are precise and explicit here, so they do not require duplicate nodes or requests.

Current upstream was inspected separately, read-only. **StableReduction Layer 4** explicitly owns ordinary Rees/relative-Proj blowups and their universal property, exceptional ideal, strict transforms, affine charts and flat base change. Its arithmetic-surface resolution theorem is not used as general resolution. StableReduction's Suggested.lean and **AlgebraicVectorBundles' README and relative-Spec signatures** were read for the current scope and roadmap form. Searches of all nine roadmap directions newer than the atlas snapshot and the current Tau Ceti library found no replacement for these local invariant targets. Current Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** supplies affine blowup/Rees-chart and native effective-Cartier APIs; these are packaging reuse requirements, not citations at the older pinned Tau Ceti commit. The reviewed **R09.7b library audit** says the local theory is not built, consistently with this manifest.

No unresolved contradiction or new mathematical gap remains in this pass. The three inherited interfaces remain open, all implementations remain unchecked, and no stage is marked closed. Global centres, gluing and termination remain R09.7c; this local stage supplies their accepted prerequisites.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.7b.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--R09.7b.lean`: **exit 0**, **21 declaration-uses-sorry warnings**, no errors or other warnings. Memory was checked first. The fixed-shape file remains **106 lines**, with **20 native examples and one theorem**. Elaboration checks types, not proofs.
- Exact ownership, prerequisite, verdict, API/test-name and statistics checks passed. All 22 target and nine supporting verdicts are accounted for. No sorry-backed data definition or source excerpt was introduced.
- Allowed-deliverable intake and whitespace checks passed. Only the issue's four deliverables and this review job's required handoff note changed.

The orchestrator should preserve the existing ids and route the already recorded SF.0, StableReduction and SF.3 interfaces. Authorized assembly/package work should synchronize the older aggregate and supplemental readers with their accepted reviews and retain the inv-admissibility clarification made here. No further revision round or ownership move is requested. This completes only #9914; no second issue is claimed.
