# Independent review: SelmerIwasawaCohomologyPartII

Accepted as a complete target-level planning pass, with corrections. Codex — codex-YtjyTC independently reviewed the design by Codex — codex-dxT7LL for issue #3609 on 2026-10-19. This verdict preserves the explicit proof-verification gap G1 and nine open supplier requests. It does not certify that the local-height proof is complete, that supplier requests have been discharged, or that any height theorem is formalized.

The packet has 30 targets (4 definitions, 8 constructions, 17 theorems and 1 lemma), 62 API items, 48 discriminating tests and 25 planets. All six stages are planned; none is closed. The review checks all 30 nodes: 21 verified and 9 corrected. No nodes were added. Each node's locator, conclusion, proof route and qualification is recorded in `review.checked` in the packet.

## Corrections made

1. **Flat coefficients and an actual coefficient tower (HP.0).** A finite flat Z_p-algebra mapping to a field need not give flat scalar extension. Restored W as a finite flat local domain and L as a finite product of finite extensions of Frac(W), as required by DL24's Appendix A conventions (p. 320). The Milnor/cohomology argument now uses flatness explicitly. Replaced the invalid constant W/p^a example at levels l<a by W/p^{min(l,a)} on the point site. Added a quasi-isomorphism API and the dual-number nonflat counterexample.
2. **Source scope and locators (HP.1).** The Γ_{K,p} definition is in the introduction, pp. 221–222, rather than §1.3, p. 227. Scholl's citation now describes the inspected §5.0–5.4 extension/cup comparison diagram on printed pp. 18–21, rather than claiming more of its proof was read. Its extra motivic hypotheses are not silently imported into the étale calculation.
3. **Integer weight (HP.1).** Restored the common nonzero integer purity weight in the crystalline extension assertion, DL24 Lemma A.14, p. 329.
4. **Correspondence adjointness (HP.1).** The global-height API requires t to preserve V, its transpose to preserve V′, and adjointness for the chosen pairing. An arbitrary pairing does not supply that identity. Panchishkin uniqueness makes the induced Hodge splittings compatible.
5. **Boundary totalization (HP.3).** Specified horizontal degree h for C^h and Cone(C⁰→C¹)[−1] for one boundary component. The support label h=−1 supplies no further shift. The actual coherent complexes remain necessary to repair DL24 Definition B.12, p. 348.
6. **Period test (HP.3).** Made the Frobenius/monodromy test explicit: Nφ=pφN sends a φ=p^r vector under N to a φ=p^{r−1} vector. It detects the shift direction needed in (B.40), pp. 367–368.
7. **Missing supplier refinement (HP.4).** Added request R9 to the existing RD.4 owner. Its supported weight-sequence node explicitly supplies underlying K₀-vector spaces without Frobenius twists. The localized crystalline argument needs the proper Mokrane sequence with twists, equivariance, convergence and monodromy filtration compatibility. R9 specifies the collapse to the untwisted h=1 column, N=0 and weight q when deeper strata vanish. The corrected proof uses that requested interface; it no longer treats the existing vector-space statement as sufficient. Coverage and the reader preserve the open obligation.
8. **Product coefficients (HP.5).** The zero ideal is maximal for a field, but not for a product of several fields. Apply the smooth-model corollary with T=L_i and zero maximal ideal on each factor, then assemble; the identity correspondence works over L.
9. **Source issues.** Independently confirmed E1–E5. Expanded E1 to include the incorrectly typed lift map μ instead of ν. Added E6: in the proof of A.5, p. 324, a=b−dy and gb=b give ga−a=−d(gy−y), whereas the printed equality has the opposite sign. The packet already uses the correct connecting-map convention; changing that sign does not alter the kernel comparison. Each finding now has an explicit independent verdict and reason.

The packet, roadmap source records, reader and suggested-file provenance comment are consistent with these corrections. Mathematical signatures in the suggested file needed no change.

## Sources and proof boundaries

Checked all target locators against [Disegni–Liu's version of record](https://link.springer.com/content/pdf/10.1007/s00222-024-01243-7.pdf), especially Appendices A–B, pp. 320–368, and compared the statements and proof route with [arXiv v3](https://arxiv.org/pdf/2204.09239v3). Checked the introduction's idelic quotient and equation (4.8), p. 293. Source hashes and precise per-node locators remain in the packet. The arXiv history and [Liu's publication page](https://liuyf0719.github.io/) supplied no linked correction for this article when checked on 2026-10-19.

Read [Nekovář, Selmer complexes](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §11.3–§11.4, pp. 363–382: §11.3.9 compares norm and Bockstein heights with a minus sign, while §11.4.1 and §11.4.5–§11.4.6 impose additional exceptional-quotient hypotheses and corrections. These do not establish the general local construction in DL24 §A.7. G1 remains exactly that proof obligation; the Tate-curve test prevents deleting H⁰(V⁻). Checked [Scholl's author copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/height-all.pdf), §5.0–§5.4, printed pp. 18–21 on page images, including the extension and cup-product diagram.

The Nekovář 1993 and 2000 originals remain explicitly unread; their author endpoints were inaccessible. HP.1's finite AJ proof instead requests smooth-open potential semistability and the exact finite-condition interfaces. The geometric B.9/B.11/A.8 chain is separate from G1. Its p-bound, three applications of B.11, saturated correspondence-support condition, asymmetric codimension bound, Frobenius restriction and valuation-only descent are retained.

## Baseline, ownership and scope

Confirmed both baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Module | What its statement provides |
| --- | --- | --- |
| `Submodule` | `Mathlib/Algebra/Module/Submodule/Defs.lean` | Submodules over a semiring and module, extending additive and scalar-action subobjects; supplies the filtration carrier. |
| `LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean` | Bundled semilinear maps; specialization along the identity ring homomorphism gives the lowering endomorphism. |

No baseline citation was removed or replaced. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`. Checked supplier statements, rather than only their names, in the parent, AG, EDC, SF, MC, PH, CR, RD, CP and DWP packets. Their limitations account for R1–R9; no supplier was edited. In particular smooth-pair Gysin is not applied to singular supports, a proper comparison is not used as smooth-open potential semistability, and rational syntomic fibers do not replace integral Kato/Sato maps.

Read the reviewed AUDIT-27 coverage, including its L0–L4 boundaries. Inspected current upstream roadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only. Checked the newer roadmaps and current library for these targets, and the ProfiniteCohomology, LocalGaloisGroups and ClassFieldTheory interfaces: their cochains, completions, Kummer theory and Artin maps are imported, not replanned. ClassFieldTheory Layer 11 supplies principal-idele and local reciprocity compatibility; R8 requests the precise p-completed quotient consequence.

The generic local-height ownership proposal is distinct from NE.7's equivariant Bockstein/leading terms and NC.5/GZ.9 curve applications. Issue #3430 explicitly permits the independent-direction split. Compared the full routed briefs and checked all 231 item IDs against their extraction routes: 14 height items have target dispositions, while 198 level-raising and 19 adjoint-vanishing items match their two proposed owners exactly once. Those proposals retain their conditional hypotheses and source warnings; their mathematics was not re-reviewed as part of this height job.

## Validation and maintainer follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/SelmerIwasawaCohomologyPartII.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/SelmerIwasawaCohomologyPartII.lean`: **compiled**, only five expected `sorry` warnings; one theorem and four examples on existing carriers, no admitted data or replacement geometric carriers.
- Verified all 30 review entries, six source-issue verdicts, 12 definition/construction APIs with at least three tests each, every reader statement/API/test against the packet, and all routed item counts.

The maintainer can route R9 to RD.4, preserve G1 for primary-source proof verification, and apply the two independent design proposals and the NE.7 ownership rescope through the normal queue. No upstream roadmap, supplier packet, atlas data or issue label was changed by this review.
