# PAPER-GAO-HABEGGER-19: heights in families and geometric Bogomolov

Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*, [Annals of Mathematics 189 (2019), 527–604](https://doi.org/10.4007/annals.2019.189.2.3); [arXiv v3](https://arxiv.org/abs/1801.05762v3).

The [extraction](PAPER-GAO-HABEGGER-19.result.json) now has **91 items: 1 library, 10 planned, 80 missing; 11 routes; 23 prerequisites; 30 source issues**. Every missing item has one route. The extraction is complete; the proof decomposition of missing supplier theorems belongs to their blueprints.

Original extraction: Claude Code `cc-fb70e5`, 22 September 2026, #1135. Independent review: `cc-442dc5`, 23 September. Confirmed-finding fixes: Codex `codex-J6LwjP`, 30 September, #4983. The [fix report](../redteam/RT-PAPER-GAO-HABEGGER-19.fixes.md) addresses eight confirmed findings and preserves the rejected finding /5. These fixes are awaiting independent REV-FIX review, not certified by the historical paper acceptance.

## Reading provenance

The original worker read all 64 pages of arXiv v3. Its failure to obtain Annals is a dated historical access record. The independent reviewer subsequently read v3 in full and collated the published 78-page article. The corrected JSON records both readings under their original dates and workers. The published theorem numbering agrees, with specific textual differences recorded in E11 and E27.

The current fix freshly compared selected passages in both PDFs and reproduced both hashes. It does not claim a new complete reading or a re-verification of E1–E27. Structured `sourceVersions` gives exact scopes; BLR and Deligne readings are separately recorded.

| Text | SHA-256 |
| --- | --- |
| [arXiv v3 PDF](https://arxiv.org/pdf/1801.05762v3) | `ffe408dc6ba034b2a635488600decace1e89d61ad04860c391bef9409f2fd34e` |
| [Published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n2-p03-s.pdf) | `09304f589d44e7c44b050448bcc3317680e4954a47cad126762350e6e9a13bfd` |

Fresh published passages include the Betti ambiguity, Ax references, monodromy Hom formula, Néron sequence, constant-rank application, lattice multiplicity and Lemma B.2. Annals p.556 and Deligne p.43 were checked as images. BLR pp.184–189 were read from page images, especially the exactness hypotheses and proof on pp.186–187.

## What the paper proves

Let π:𝒜→S be an abelian scheme over a smooth curve over Q̄. Theorem 1.4 bounds the base height by c(1+ĥ𝒜(P)) away from the generically special subvarieties of a fixed irreducible X. Theorem 1.4′ also compares with a naive height in the total space. Theorem 1.1 deduces geometric Bogomolov for the function field of a curve; Appendix A extends the characteristic-zero constant field using Moriwaki heights.

The proof classifies special subvarieties, constructs Betti maps, and proves that degeneracy over a curve implies generic specialness (Theorem 5.1). The latter uses monodromy, fixed-part/Hodge inputs, semi-rational counting and Ax's theorem. Lemma 6.2 then finds full Betti rank. Auxiliary subvarieties and Blichfeldt counting produce many division points; degree-height estimates and Silverman–Tate yield the height inequality. Silverman's specialization limit completes the Bogomolov argument.

## Existing interfaces and missing extensions

- Item 15 retains R11.1's Néron mapping property. New item 80 separately gives good reduction for subvarieties and quotients; item 81 gives the exact Néron sequence and embedded complement **with characteristic-zero residue fields on the entire assertion**. The derived results go after the R11.5 criterion, avoiding a backward R11.5→R11.1 dependency. Xie–Yuan can share item 80; its characteristic-p case cannot import item 81's closure assertion.
- IG.3 reuses the curve/Belyi Riemann-existence supplier. Lemma B.2 needs the smooth quasi-projective higher-dimensional comparison, topological finite generation and characteristic-zero algebraically closed base extension (items 77–79). Those remain missing and route downstream with item 22. Curve coverage does not prove the whole higher-dimensional item.
- C0 and its tracked analytic-space extension own the reduced regular-locus, connectedness, identity, dimension and curve-singularity facts (85–89). The Betti design and draft CV.1 consume that same owner. The current C0 packet is partial; these facts are not supplied by smooth-manifold holomorphic functions alone.
- The Betti tranche receives finite-dimensional invariance of domain, the real constant-rank theorem, closed-torus subgroup classification by integer characters and good covers of Riemann surfaces (82–84,90). No exact existing stage for those forms was found. Its blueprint must resolve general supplier ownership without building duplicates. The Baire input is already `mathlib:nonempty_interior_of_iUnion_of_closed` (91).
- Mathlib's two-point Blichfeldt theorem is a baseline for item 54, but the application requires a multiplicity count for arbitrary bounded measurable sets. GN.1 must provide the averaging adapter without convexity or symmetry. Mathlib's Dedekind flat/torsion-free equivalence is the affine input to item 47, not the scheme or fibre-dimension theorem. `NumberField.absLogHeight₁` supplies algebraic-element height, with an affine [1:x] comparison still needed; the full projective height package remains planned at RP.0.

## Routes

| Route | Missing items | Owner and scope |
| --- | ---: | --- |
| 1 | 13 | RP.0/RP.1/RP.5: function-field heights, trace, Lang–Néron, specialization, Manin–Mumford and degree bounds. |
| 2 | 3 | AbelianSchemesAndArithmeticModuli A2/A6: projective presentation, equivariant Hom extension and projective normality. |
| 3 | 5 | SF.0/SF.5: flatness/dimension, Bertini, long intersections and Bézout. |
| 4 | 2 | LD.6: semi-rational counting and the Ax-type input. |
| 5 | 4 | IG.3: bounded covers and the comparison/finite-generation/base-extension inputs, downstream of IG.0→IG.1. |
| 6 | 15 | `AbelianSchemesAndArithmeticModuliPartII`: joint Betti-map tranche and its remaining topological auxiliaries. |
| 7 | 3 | `HodgeStructuresPartII`: periods, semisimplicity, fixed part and Hodge-generic points. |
| 8 | 3 | `ArakelovGeometryAndAbelianHeightsPartII`: Moriwaki heights and Wazir's comparisons, coalesced with Yuan. |
| 9 | 25 | `HeightsRationalPointsAndObstructionsPartII`: special subvarieties, the height-inequality machine and Bogomolov endpoints. |
| 10 | 2 | R11.5: subvariety/quotient good reduction and characteristic-zero model exactness as derived results. |
| 11 | 5 | C0: reduced analytic-space regular, identity, dimension and curve-singularity inputs. |

`AbelianSchemesBettiMapsPartII` and `DegeneratingHodgeStructures` are historical proposal aliases. The current canonical jobs are `DESIGN-AbelianSchemesAndArithmeticModuliPartII` and `DESIGN-HodgeStructuresPartII`. The former's joint GH19/DGH21/GGK26 Betti tranche must stay in the merged job, even though Kings–Sprang appears first in registry order. The height design requires Theorem 5.1 → Lemma 6.2 → Theorem 1.4 and must follow this supplier.

The generated heights job currently has `after: []`. The maintainer action coordinates the dependency and anti-deferral repair with BENOIST-19/1; workers do not edit `make_queue.py` or generated queue files. New source routes 10–11 await independent acceptance: the historical review has verdicts for routes 1–9 only. Its complete original JSON is preserved in `historicalReview`, and the fix annotations do not manufacture new acceptances.

## Source issues and prerequisites

Original E1–E27 and their independent verdict objects are unchanged. They include the Betti-construction proof repair, the trace-plus-torsion height kernel, induction boundary cases, a reducible-intersection deduction and version-specific misprints. Their statements and remedies remain in the JSON. Earlier claims that every slip appeared word for word in print are read with E11's partial correction and E27's published-only scope.

Three new entries await review:

- **E28:** Remark 4.2 says endomorphism where automorphism is required; the zero map destroys the fibrewise isomorphism. It appears in v3 p.15 and Annals p.544.
- **E29:** The Hom formula in Lemma 5.6 omits monodromy equivariance. It appears in v3 p.25 and Annals p.556; Grothendieck is [24] in v3 and [23] in print. Deligne's theorem starts with a morphism of local systems. The fixed-part inclusion used in the proof meets the corrected hypothesis.
- **E30:** The Ax-type assertions should cite Ax 1972 [3], as the introduction does, instead of [2]. Locators are v3 pp.19,21 and Annals pp.548,551.

The rejected /5 is not recorded as E31. Item 30 asks for the continuous semialgebraic-coordinate path, and its statement is unchanged. The verifier's alternative choice of constant γ′ and a(s)=γ′x−y(s) also preserves the needed starting value; no new source gap is asserted.

The prerequisite register adds Ax 1972, Grothendieck 1966 and Koizumi 1976 with their specific uses. It also identifies BLR, Grauert–Remmert, Weil, Whitney and the SGA/Cadoret comparison sources behind the newly explicit items. Bibliographic registration is distinct from reading or proving every external theorem. Fresh correction searches checked the journal page, arXiv history, Habegger's research entry and bounded title/erratum queries; no explicit notice was found, without claiming exhaustive novelty.

## Validation and limits

The paper checker, applicable §18 issue/version checks, intake checks, exact-once routing, original-item and source-issue preservation, unchanged rejected item 30, full historical review preservation, and selected dependency acyclicity pass. Exact finite checks illustrate measurable-set lattice averaging, the zero-endomorphism obstruction, and the equivariance condition; code is retained in the fix report. No Lean file is assigned or compiled, and no library build or language server was started.
