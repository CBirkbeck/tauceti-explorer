# PAPER-BEUZARTPLESSIS-CHAUDOUARD-25: Eisenstein series and Bessel periods

Raphaël Beuzart-Plessis and Pierre-Henri Chaudouard, *The global Gan–Gross–Prasad conjecture for unitary groups. II. From Eisenstein series to Bessel periods*, [Forum of Mathematics, Pi 13 (2025), e16](https://doi.org/10.1017/fmp.2025.8), 1–98; [arXiv 2302.12331v1](https://arxiv.org/abs/2302.12331).

Extraction by Claude Code `cc-39fac3`, corrected by independent reviewer Codex `codex-c83e7a`, 24 September 2026. **Status: partial; review: revise.** The [finished review](../reviews/REV-PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.md) checks every item, status, route and source finding and gives the revision handoff. The [extraction](PAPER-BEUZARTPLESSIS-CHAUDOUARD-25.result.json) contains 69 items: 6 planned, 63 missing; 8 routes; 34 bibliography prerequisites; 19 reviewed source findings; six explicit gap groups. Every missing item is routed exactly once. No route is accepted yet.

## What the paper proves

Theorem 1.2.3.1 treats an H-regular Hermitian Arthur parameter Π of G_n×G_{n+1} and an imaginary spectral parameter λ. Nonvanishing of the complete central Rankin–Selberg L-value is equivalent to the existence of a unitary cuspidal datum with weak base change Π and a nonzero regularized Eisenstein period. Theorem 1.2.4.1 gives the refined product identity for regular Hermitian parameters arising from everywhere-tempered cuspidal data, with nonzero pure tensors, Tamagawa measures, component-group factor and normalized local periods. Its hypotheses must be kept distinct from the preceding H-regular theorem.

Theorem 1.3.3.1 gives the corresponding global Bessel-period nonvanishing equivalence for discrete Hermitian parameters of G_m×G_{n+1}, n=m+2r. Theorem 1.3.6.1 proves Liu’s refined Bessel identity for everywhere-tempered cuspidal representations. The reduction unfolds Eisenstein periods into mixed Whittaker–Bessel periods, compares local periods, computes the unramified factors and controls the resulting global products. The auxiliary disconnected character formula is used on the local Frobenius component.

## Reading and limitations

The published 98-page paper was read in full by the independent reviewer, including both trace-formula proofs, §8 and Appendix A. Selected primary-source checks covered BPLZZ2021’s multiplier/base-change argument, BPCZ2022’s relative-character convergence, Kemarsky’s complex Kirillov model, Atiyah–Bott’s holomorphic Lefschetz formula, and Chaudouard’s central-average normalization. URLs, hashes and exact pages are in the review. The original 34 prerequisite entries remain a reading queue, not a certificate that their proofs or recursive prerequisites have been checked. The current Cambridge, arXiv, Crossref and author-page correction search found no separate correction to the registered findings.

Both pinned Lean trees and all current atlas stages were searched. No specialized implementation was located. Existing modular Eisenstein series, finite-dimensional representation characters and analytic building blocks are not the adelic relative trace formula. Six existing planned items remain imports. GRS descent is an explicit new ML.5 source request, and the split/inert Cauchy adapter is missing despite its connected upstream ingredients being planned.

## Routes and ownership

1. **JacquetRallisRelativeTraceComparison** (part-ii). The shared Jacquet–Rallis candidate is the right direction and its area is corrected to automorphic, but the item bundles do not expose the truncation estimates, convergence, transfer and regularization inputs; E1 is not repaired. The exact split/inert adapter 60 is now explicitly missing. Resolve G1–G3 and G6 before design.

2. **GanGrossPrasadConjecturesForClassicalGroups** (new). Coalesce the existing GanGrossPrasadConjecturesForClassicalGroups candidate; the local GGP, Bessel uniqueness, weak/strong base-change and unramified Bessel-function statements are still mostly second-hand summaries with unsplit hypotheses. Rank-zero and additive-character conventions need explicit definitions and tests.

3. **AutomorphicLFunctionsPartIIAsaiAndGLnPeriods** (part-ii). The Asai/GL_n Part II candidate is shared with BPCZ22, but central averaging (28), λ-domain (31,35), and Jacquet-character normalization have needed correction. Split the multiple propositions and close the local zeta-integral estimates, Epstein residues and §6.2 analytic-continuation/residue suppliers.

4. **AutomorphicSpectralTheoryPartIISchwartzMultipliers** (part-ii). Reuse the existing SchwartzMultipliers Part II candidate. Items 15 and 16 combine new weights, support estimates, kernel expansions and uniform convergence without the individual statements or input signatures. The nonlinear LF/topological and Arthur cone estimates cannot be inferred from a title or bibliography.

5. **LieGroupsPartIITwistedCharacterFormula** (part-ii). Extending LieGroups is appropriate after importing its Borel–Weil–Bott layer, but the original all-component and W_L statements are false. E12–E14, the primary Lefschetz convention, title and tests are corrected; the fixed-point/cohomology-action adapter and proof decomposition remain G5.

6. **AutomorphicLFunctionsAndLocalFactors** (source). AL.3 is a plausible archimedean Whittaker owner, but the exact target is character-equivariant. Kemarsky only verifies the complex unitary case, and the general complex, real and p-adic inputs have not all been pinned and matched. SR.5’s integral-family derivative API is not itself a proof of all-field Kirillov surjectivity.

7. **EndoscopicTransferAndUnitaryTraceComparison** (source). ET.6 owns the p-adic direction but cannot alone supply an item quantifying over all local fields. AF.1 does not explicitly state the required real/complex unitary-dual classification. Split item 38 and give primary classification statements and bounds in each case.

8. **ModularityAndLanglandsExtensions** (source). New source request records the correct ML.5 direction and coalesces the Jiang–Zhang grs-descent request. Its exact unitary-group/parity/auxiliary-character theorem and proof are not yet read and extracted; marking it planned would hide this gap.

## Corrected source mathematics

E1 records a narrowly stated inherited proof obligation in BPLZZ’s archimedean compatibility argument. The review does not certify the previously suggested repair by Theorem 3.19. E2–E11 record the independently checked pole, rank, reference, measure and index corrections; E7 is notation only because the Petersson form can be transported to the Whittaker model.

E12 restricts both Appendix A assertions to the generator component. In (SL₂×SL₂)⋊C₂ with the factors swapped, the identity-component singular-character sum at diagonal parameters (2,3) is 1/2 instead of 0, and the trivial-character denominator sum is 37/24 instead of 1. E13 replaces the printed Levi normalizer quotient by the Γ-fixed Weyl group. E14 retains the alternating cohomology sign; connected SL₂ at weight -2 gives -1, not +1.

E15 restores character equivariance in the Kirillov target and records the additional complex-unitarity proof obligation. E16 corrects the two tensor slots in (8.8.3.2). E17–E18 correct the chamber-support condition and the parameter of a weight estimate. E19 inserts the missing inverse Whittaker character in the local Jacquet integral. Each finding includes its locator, precise correction, argument, correction search and independent verdict in the JSON.

The extraction itself also had errors absent from the source: extra conjugations in items 27/29, a central-average factor in 28, an overly broad parameter domain in 31, a duplicated Epstein variable in 35, the direction of bc in 43, the ambient subgroup of ℬ′ in 51, and an ambiguous Lefschetz action convention in 65. These have been corrected. The review lists every change.

## Revision handoff

Split the bundled definitions and numbered assertions, supplying APIs, dependencies and boundary tests. Extract the omitted functional-analysis, Arthur-cone, non-K-finite, residue/continuation and spectral-separation inputs. Pin and match the local GGP, transfer, descent, unramified Bessel, generic unitary-dual and all-field Kirillov suppliers. Finish the Appendix A action/line-bundle convention proof and the split/inert determinant adapters. Coalesce the shared candidates and check the completed dependency graph; do not build parallel copies of their common theory.

The paper checker passes. The review records the complete validation scope and a row for every item. No Lean file was required or compiled, and no mathematics is claimed formalized.
