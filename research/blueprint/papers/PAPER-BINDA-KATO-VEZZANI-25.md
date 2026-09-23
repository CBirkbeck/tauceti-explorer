# Binda–Kato–Vezzani: extraction after independent review

Refs [#1212](https://github.com/CBirkbeck/tauceti-explorer/issues/1212). Extraction: **partial**. Independent review: **revise**, completed by Codex, session codex-c83e7a, 23 September 2026. Original extraction authors: codex-a71f92 and cc-442dc5, verified from PRs 2004 and 2113.

The paper adapts Scholze’s perfectoid approximation argument to p-adic cohomology through rational rigid motives. A smooth scheme-theoretic complete intersection has a small neighbourhood with the same motive. Tilting and an equal-characteristic approximation produce a multiplicative map into the cohomology of a smooth alteration. Positivity detects its top-degree map; Poincaré duality supplies a splitting in the rank-one top-degree scope. Equal-characteristic weight–monodromy then passes to the summand. The appendix constructs nearby cycles and weight-graded monodromy, distinguishing that construction from the external full-complex comparison.

The revised inventory has **139 items: 8 library, 7 planned, 124 missing**, and 17 routes. Each missing item has one route. The review accepts nine source contributions and holds eight routes for the explicit gaps below. No mathematics is claimed formalized.

## Versions actually checked

The independent reviewer read the entire [arXiv v2](https://arxiv.org/pdf/2207.00369v2), dated 10 June 2025, all 36 pages, including proofs and bibliography. SHA-256: `150ba49710056b7de62ca91467cd7e4cde2aaba6a053a5f83bd0c35e0addfea9`. Rendered pages 3, 6, 7, 8, 13, 15, 17, 18, 20, 22, 27, 28, 29, 31 and 32 were inspected where formula text mattered.

The [publisher page](https://link.springer.com/article/10.1007/s00222-025-01344-x) is a subscription preview for the main article, but exposes the **complete published Appendix A**. That appendix was read. Its augmentation uniqueness claim and final monodromy-twist sign agree with the problematic arXiv formulas (E13/E19). Other main-body confirmations are explicitly limited to arXiv v2; full published main-body collation remains G1.

Fresh supplementary reading was limited to AGV v3 Definitions 2.1.15–17; all three pages of the [published AGV erratum](https://doi.org/10.1017/fms.2024.97); SGA2 XII Corollaries 3.4–3.6 and surrounding text, printed pp. 119–121; [BGV v2](https://arxiv.org/pdf/2306.05099v2) Theorem 1.7, Remarks 4.17–18 and adjacent Kummer/weight-heart discussion; and [Beilinson](https://arxiv.org/pdf/1111.3316) §1.15’s opening coefficient-category definitions. These are not full readings of the auxiliary works. The JSON records hashes and distinguishes these checks from the original worker’s supplementary reading.

The arXiv records, publisher, both available author research pages, exact-title correction searches and Crossref update metadata were checked. No itemized BKV erratum was identified. “New” means no correction identified in this bounded search, not established novelty or proof that every arXiv error persists in print. E14 is already corrected in print. Nothing was sent to the authors.

## Repairs and mathematical boundaries

- **Morphisms and hypotheses.** Item 11 now descends an arbitrary morphism between log-smooth objects; Proposition 2.2 does not make that morphism log smooth. Item 34 retains the fine-or-finite-dimensional hypothesis on every base in Corollary 2.25. Item 59 now includes Corollary 3.13’s nonproper semistable formal schemes. Item 62 retains the proper smooth, rather than unnecessarily projective, duality scope.
- **Labels and pages.** The review corrects the shifted v2 locators, including Remark 2.19, Proposition 3.18, Corollary 3.35 and LP16 Lemma 4.36. A nonexistent Proposition 3.8(2) remains an unresolved source cross-reference; no replacement is guessed.
- **Coefficients and variance.** Finite isocrystals require invertible Frobenius. The unrestricted endomorphism category does not inherit nilpotence or the printed compact-object description. Item 139 specifies the enhancement/Ind comparison that must be proved. The compact contravariant realization is kept separate from its homological Ind-extension. The geometric coefficient field remains algebraic K0^nr, distinct from its completion.
- **Tate conventions.** The conventional Tate object is the reduced torus cofiber shifted by −1. A torus product retains all binomial summands. H¹ of G_m has cohomological twist −1. In the appendix, the weight-graded map is **N:gr_i H^n→gr_(i−2) H^n(−1)**; the old item 129 API repeated the printed wrong sign and is repaired.
- **Connectedness.** The divisor X0X1 in O(2,0) on P¹×P¹ is two disjoint P¹ fibres. Thus the unrestricted connectedness shortcut in Remark 5.8 fails; SGA2’s cited line bundle is ample. If “variety” means integral, Y over C_p is already connected. For a broader reading allowing arbitrary smooth disconnected schemes, the componentwise argument remains G2. **The review does not refute weight–monodromy.** E10’s reducible-curve counterexample is not confirmed against an established source convention and is rejected as a source-error finding.
- **Subdivision.** New items 134–138 separate the log-Witt motivic span, geometric good-reduction generation, weight-graded factorization, Spd interface and full motivic monodromy equivalence. The generalized weight-filtration interpretation remains distinct from the classical log spectral-sequence comparison that the appendix only expects.

Every original definition API/test was checked. The JSON’s `independentReview.changes` records each item-level edit, and the source findings record the independent reasons. Definition tests remain planning contracts except the explicitly executed small algebra diagnostics; no Lean was run.

## Reuse and ownership

Every cited pinned declaration was read with its standing binders and verified against the blob at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Besides the original six items, the review imports the existing spectral-sequence carrier and algebraic-cycle carrier with weighted residue-degree pushforward (132/133). These do not supply weight convergence, Chow groups or positive intersection degrees.

Fresh searches cover all 119 originally missing signatures, both complete pinned Lean trees, the current atlas and acquired roadmap/link/packet/decomposition files. All cited layers were read. The reviewed audits include SF.5 (AUDIT-01), L5/DWP.0 (AUDIT-18), LPV.1 (AUDIT-19) and the enhancement layers (AUDIT-22). Several other owners have no merged audit row; absence is not an audited negative result.

**LPV.1 already owns the general monodromy filtration and its functorial linear algebra.** Item 99 is now planned there. New route 17 supplies the scaling/idempotent consequences to the same owner; the proposed p-adic extension adds Frobenius weights and adapters. The full upstream AnalyticToricGeometry document supplies the common cone/fan and complex toric construction; valuation-ring geometry is a genuine extension. The Jannsen weight-homology candidate is reused as a proposed owner, but remains partial with a rejected route, so it is not an accepted supplier.

| Route | Owner | Verdict | Reason |
| --- | --- | --- | --- |
| 1 | EnhancedDerivedSheaves | accept | The corrected enhanced-site lemma belongs to E2/E3; shared enhancement and Ind machinery remain E0/E1/E5 imports. The published AGV erratum supplies exact added hypotheses. |
| 2 | CrystallineCohomology | reject | Non-fine log and specialization proof leaves G3 remain undecomposed; item 11 is repaired, but the exact Ogus/Vidal suppliers and base-scope checks are still missing. |
| 3 | AdicSpacesPartII | accept | The geometric source additions (plurinodal charts and Gabber local product) fit F0/R0–R2. Their non-noetherian applications require the explicit G12 scope check; this accepts ownership/source contribution, not a completed formal-geometry implementation. |
| 4 | PerfectoidSpaces | accept | Geometric perfectoid tilting and towers are existing P1–P3/P7 imports; motivic comparisons remain separate. |
| 5 | PadicHodgeTheory | reject | The correct carrier direction is R06.2, but E15/G11 prevent building on the derived compactness/colimit contract. Item 139 explicitly gates the proposed Ind repair. |
| 6 | PadicDifferentialEquationsAndRigidCohomology | reject | Log-rigid and overconvergent scope belongs here, respecting Disegni–Liu, but G5 lacks the exact original complex/comparison maps and coefficient hypotheses. |
| 7 | CrystallineCohomology | reject | CR.6 is the correct classical HK owner, but G5 still lacks the source-closed proper comparison and normalized base-change construction. |
| 8 | MotivesAndAlgebraicCycles | accept | MC.4 owns algebraic rational motives and the localized geometric category; no duplicate mixed-motive roadmap is proposed. |
| 9 | MotivesAndAlgebraicCycles | accept | Compact realizations, proper-smooth duality, cycle classes and multiplicative PD splitting fit MC.1–2. Corrected variance and irreducible-trace scope remain explicit; no unresolved general category equivalence is imported as proved. |
| 10 | SchemeAndStackFoundations | accept | SF.5 owns the positive pushforward/degree lemma; item 133 imports the already existing cycle carrier and residue-degree operation. |
| 11 | DeligneWeightsAndPurity | accept | DWP.0 explicitly supplies coefficient-independent Weil-number and spectral weight algebra, without assuming semisimplicity. |
| 12 | AdicCoefficientsAndComparisons | accept | L5 explicitly plans the exact de Jong smooth/semistable alteration forms; this source uses rational degree division and does not impose prime-to-p degree. |
| 13 | MotivesRigidAnalyticPartII | reject | The rigid-motive Part II direction is justified, but G3–G5/G7/G8/G11 leave major comparison, descent and category interfaces unbuildable. Corrected formal scope and split items do not discharge these leaves. |
| 14 | AnalyticToricGeometryNonarchimedeanPartII | reject | A nonarchimedean extension of the upstream complex toric roadmap is justified, but G12 lacks the generic-base divisor, formal-model and approximation construction leaves. Do not launch design from an endpoint-only brief. |
| 15 | PadicWeightMonodromyPartII | reject | Import LPV.1 rather than rebuild its filtration. G2/G6 and the unresolved suppliers of routes 13/14 prevent accepting the full local-field and toric application brief. |
| 16 | MotivesPartIIWeightHomology | reject | Reuse the existing proposed Jannsen owner, but that candidate is itself partial/rejected. G8 lacks the source-closed enhanced weight-complex/full-comparison chain. Correcting the published twist sign and splitting graded factorization is insufficient for an accepted design. |
| 17 | LefschetzPencilsAndVanishingCycles | accept | LPV.1 explicitly owns the uniquely characterized centred monodromy filtration and its functoriality. Scalar-rescaling and equivariant-idempotent consequences extend that same API; Frobenius weights remain consumers. |

## Remaining work and validation

G1–G12 record the exact consuming items. The main remaining work is the Ogus/Vidal log-specialization chain, Vez/LBV motivic tilting, EY/CN log/rigid comparisons, LP Laurent-series theorem, arithmetic comparison diagrams, enhanced weight-complex and classical-monodromy comparisons, the precise coefficient category, and toric generic-base/approximation proof leaves. Relabelling those tasks as “deferred” does not discharge them. The earlier completion claim is retained only as history in the JSON.

The paper checker, four-file intake check and independent guards passed, checking IDs, all dependency edges, acyclicity, existing stage references, exact-once missing routing, definition APIs/tests, source verdicts and pinned declaration hashes. Exact rational diagnostics distinguish the Frobenius/monodromy twist signs, ramification normalization and torus summands. These checks are not proofs of the research theorems. There is no authorized Lean deliverable; Lean compilation was not attempted.
