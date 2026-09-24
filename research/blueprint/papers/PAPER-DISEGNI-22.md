# PAPER-DISEGNI-22 — The universal p-adic Gross–Zagier formula

Daniel Disegni, Invent. math. 230 (2022), 509–649, [DOI](https://doi.org/10.1007/s00222-022-01133-w). Witness: [arXiv v4](https://arxiv.org/abs/2001.00045v4), read completely, with its Appendix B and the [published Correction](https://doi.org/10.1007/s00222-025-01391-4).

Status after independent review REV-PAPER-DISEGNI-22: **partial; revise**. The review is complete, but the extraction is not ready to generate eight of its nine proposed routes. See [the full review](../reviews/REV-PAPER-DISEGNI-22.md) for evidence, source versions, every correction and remaining work.

## Mathematics and corrected scope

The paper constructs universal Heegner classes and p-adic height/L-function identities over ordinary families, recovering arbitrary cohomological-weight Gross–Zagier formulas and applications to Selmer groups and height nonvanishing. It also treats a universal Waldspurger formula and conjectural Pfaffian leading terms.

The body of the public manuscript must be read with the correction: A/B/B^ord require each nonsplit p-adic place to be inert with unramified character; D/E concern Hida* families, assuming no ramification above p. The replacement classical-point density result is part of that correction. It is incorrect to reuse the original arbitrary-Hida-family statements unchanged.

The machine result retains all 153 stable item IDs: **0 library, 17 planned, 136 missing**. Missing means the exact item has not been located, not that its generic algebraic ingredients must be rebuilt. Every missing item has one provisional route. Determinants/basic opens and Azumaya carriers already exist at the pinned baseline, but do not by themselves establish the sheaf/fibre comparisons claimed here.

## Routing after review

| Route | Destination | Verdict |
|---|---|---|
| 1 | UniversalPadicGrossZagierFormula, proposed GZ Part II | Reject pending exact corrected endpoint statements, shared-foundation ownership and proof/API closure |
| 2 | SelmerComplexesAndPadicHeights, proposed Selmer Part II | Reject pending shared cohomology ownership and complete family/base-change/duality interfaces |
| 3 | PadicFamilies | Reject current bundle; family reconstruction and Jacquet–Langlands exceed the named contracts |
| 4 | AutomorphicGaloisRepresentations R19.6 | Reject generic Azumaya/sheaf claims under a residual reconstruction layer |
| 5 | GL2AutomorphicRepresentationsAndTransfer R16.2/3 | Reject analytic-family extension as a pointwise LLC source |
| 6 | AutomorphicPadicLFunctions L0/1/5 | Reject new family/Katz derivative branches without exact owners and hypotheses |
| 7 | HeegnerPointEulerSystems HE.8 | Reject unqualified totally real Fouquet extension |
| 8 | ModularIwasawaMainConjectures L6 | Reject: interface layer is not the CM branch's proof owner |
| 9 | GrossZagierAndArithmeticHeights GZ.4/5 | **Accept corrected local items 56,60,62** |

Route 9 supplies the virtual-motive local normalization, the split toric/Kirillov factorization and the nonsplit invariant-line value. In the split case χ₂=ω⁻¹χ₁⁻¹ and π∨=π⊗ω⁻¹; the dual zeta factor uses χ₁⁻¹. Retain the declared measure convention and regularized values. No universal-height construction is approved by this local source route.

The other routes remain candidates for revision, not instructions to build private copies of continuous cochains, Azumaya theory, local representation theory or Pfaffians. Existing owners must supply generic notions once. The companion Selmer proposal from PAPER-DISEGNI-LIU-24 is unreviewed and must not be assumed available.

## Source findings and completeness boundary

The result records 23 reviewed source findings: 22 confirmed, including three already corrected by the author, and one rejected. Omitting unaffected Theorem H from the correction's list is not itself an error (E6). Confirmed findings include residue-field versus quotient-ring openness, rank n², tensor versus tuple polynomial models, local Euler dimension, missing group-ring coordinates, contragredient characters, spectral-sequence degree, cohomological dimension, the omitted H̃⁰ term, a reversed transport map, odd-rank Pfaffian defects, a target-sign error, ramification/unit bookkeeping, a false auxiliary matrix identity, a lattice-denominator bound, unbounded cohomology and the tangent/cotangent type.

The review gives small counterexamples and distinguishes false auxiliary formulas from unproved repairs and from the main arithmetic theorem. No failure of the main Gross–Zagier theorem is inferred from these checks. The original subscription journal text was not available; the whole public v4 and the published correction were read, while the author manuscript and supplier papers were checked only at specified passages.

Required follow-up includes multipart splitting, exact external parity/Fouquet/CM hypotheses, the odd-Pfaffian repair, the nonsplit proof computation, geometric symmetry compatibility, corrected family-height specialization maps, generic owner resolution, and definition-level APIs/tests. The numbering census alone does not establish completeness. Twelve items now have initial API/test outlines; this does not close the remaining definitions.

Prerequisites retain public links and corrected bibliographic data, including analytic LLC DOI 10.1112/jlms.12285, Katz DOI 10.1007/BF01390187 and the local–global interpolation volume/pages 75(3), 965–1017. The analytic-LLC Laurent-polynomial correction, the 2017 factor-two correction and the nonsplit corrigendum must travel with the imported formulas.

No Lean implementation or compilation is claimed. The pinned sources, checked declarations, complete change log and executable-validation boundary are in the independent review and its handoff.
