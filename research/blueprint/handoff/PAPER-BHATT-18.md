# PAPER-BHATT-18 — current handoff

Codex — codex-7e92bd, 23 September 2026. Partial continuation of PR #2213 for issue #2182. This section supersedes the earlier resume order retained below.

## Delivered

- 81 items, nine routes: 10 library, 12 planned, 59 missing; every missing item routed once. All 64 earlier IDs and eight source findings survive. No review verdict changed.
- `proper-integral-h0` is now a library composite: pinned Mathlib universally-closed integrality, qcqs basic-open localization and affinization. Rees algebra and affine graded Proj are also explicit imports. Six newly inspected files were verified byte-for-byte against the Mathlib pin.
- Remark 4.3: natural almost cone=cokernel module; scalar-zero transition survives derived tensor; kernels/cokernels inherit the exact shift **c=p^k m**. Multiplication by the matching root of t yields the ordinary **(tg)^(1/p^k)** annihilator. Generic derived tensor remains E1-owned.
- Lemmas 3.4–3.5: coherent module-tower Roos construction, finite-at-each-coordinate inverse for a pro-zero tower, Milnor sequence, and the b² annihilator calculation for extensions. No unproved exactness of sheaf products is used.
- GR2 **release 6.95**, arXiv math/0409584v11, acquired. Integral local stalks and rational chart passages read. The matching non-Noetherian domination theorem is **Stacks 081T**, whose prerequisites are split into named items. Algebraic ownership stays SF.4; R2 imports it for the integral generic-fibre chart map.
- §6 uses only a unit-compatible derived base-change **map**, followed by the supplied retraction. The prior demand for an almost-flat comparison isomorphism is unnecessary for this step. The same composition handles Y_C→Y in 6.2 without assuming B→C flat.

## Resume in this order

1. **G6 remaining geometry.** Read the actual leaves of Stacks 0815/081M/081R: 38.3.2; 38.30.3 and 38.30.6; 38.10.1; 38.11.1–38.11.3; 37.41.6; 31.34.4; and 31.33.14. The JSON states how each is used. Match existing suppliers and create declaration-sized refinements within SF.4, not a second flattening project. Supply the Rees-grading/chart and relative-Proj gluing adapters around the pinned affine constructions. Finish proper coherent finiteness/perfectness and generic multisections. R2's accepted partial packet and F0's Noetherian scope do not close these leaves.
2. **G2–G3.** Acquire the precise BS simplicial-perfection proofs, SW general integral-perfectoid criterion, GR (!!) input, Bhatt 2014 Lemma 2.7 and lecture Corollary 9.4.7. Keep field-based and general integral conventions separate; split Lemma 2.6 further.
3. **G5/G7.** Complete the regular-local and Cohen/discriminant reductions, the p²g→pg obstruction calculation and perfect-complex version, and the original equal-characteristic branches.
4. **G4 remaining interfaces.** Implement the P0/E1 almostification/derived-tensor comparison and E1/E2 coherent diagram interfaces; link the expanded Remark 4.3 calculation to the G2 rational-presentation input for Remark 4.4. The numerical shift itself is now derived, not a missing assertion. Do not replace coherent towers by unconnected homotopy-category cones.
5. **G1/G8.** Obtain the genuine 21-page journal text, then collate. The Springer content/pdf URL served only a PDF of its subscription landing page. Recheck active reservations and coordinate the existing pending PerfectoidRamification and RegularRingSplittings proposals with PAPER-ANDRE-18 and PAPER-ANDRE-18-B. No new roadmap name was added here.
6. **G9** remains an unresolved question about André A.3.1's local-duality/completion scope; do not turn it into a finding without a proof and the required correction search.

## Source and review boundaries

Fresh reads: all Bhatt arXiv v2 (12 pages), André published §2.5 pp. 79–82 and Appendix A pp. 89–92, the GR2 passages and Stacks locators enumerated in the JSON. Earlier whole André v1/Scholze reads are inherited, not repeated claims by this worker.

GR2: https://arxiv.org/pdf/math/0409584v11, 1484 pages, SHA-256 `43afeff5750640f2e62d4eedb3d9d434dbef8883022d5b63b26b6a51509218d0`. The PDF says release 6.95 and has the arXiv 4 Nov 2016 stamp, but its generated title-page date is 22 Apr 2019. Do not claim byte identity with Bhatt's original copy. The chart argument uses 15.4.14(i)–(ii) and 15.4.25; the analytically Noetherian theorem 15.4.34 is not applied to the perfectoid base.

E1–E8 are unchanged and unreviewed. In particular, E1 still requires generic finite-étale **surjectivity** and the mixed-characteristic setup. E2–E3 remain certified only against the arXiv version. A separate independent reviewer must supply verdicts.

## Validation

Paper checker, missing-route uniqueness, dependency DAG, API/use/test presence, existing item/finding preservation, atlas stage endpoints and path scope pass. Reran the previous 188,100 monomial, 120 valuation and trace controls. Added 130 chain-homotopy, 210 Roos inverse, 33 root-product and 150 rational-chart cases, plus saturation and nonsplit-extension controls. The report embeds the executable diagnostic. These finite checks are not proofs or Lean compilations. No Lean file was added or compiled.

---

## Earlier checkpoint handoff — historical context

# PAPER-BHATT-18 handoff

Codex, session codex-hjdg0j, issue #2182. **Partial checkpoint**.

Done: full 12-page Bhatt arXiv v2 reading, full 15-page adjacent André arXiv v1 reading, selected published André collation and original Scholze proofs; 64 items, 9 routes, definition APIs/tests, 8 source findings, and 9 explicit gap groups. Provenance, SHA-256 values, reading boundaries, pinned-library declarations and reproducible arithmetic checks are in the report and JSON. The initial atlas snapshot was a066f7b6cabf88c79c07e934ed7632593fa47fb6.

The paper validator passes. The extra integrity check verifies routing multiplicity, API/test presence, dependency references, acyclicity and galaxy IDs. The arithmetic checks cover 188,100 monomial cases and 120 valuation cases plus normalized trace. No Lean file was requested, created or compiled.

Resume in this order:

1. **G6:** obtain GR2 release 6.95 §15.4 (the paper's actual citation), establish the non-Noetherian proper-model domination used in 6.2, and verify integral H^0 and almost-flat coherent base-change interfaces. Do not infer these from Noetherian F0 or étale proper base change.
2. **G4:** make the derived-tensor uniform estimate of Remark 4.3 a sequence of explicit lemmas; verify annihilator products/shifts and coherent cone/Rlim arguments. The short source assertion is not an independently closed proof here.
3. **G2–G3:** read BS simplicial-perfection discreteness, SW's original general integral-perfectoid criterion, GR's (!!) statements, Bhatt 2014 Lemma 2.7 and Bhatt's 2017 lecture Corollary 9.4.7. Match versions and hypotheses. Current imports name owners but leave exact contracts open.
4. **G5/G7:** complete all regular-local reductions, finite global dimension, p²g-to-pg obstruction detection, perfect-complex analogue, and original equal-characteristic branches. Split remaining compound items such as Lemma 2.6 into declaration-sized nodes.
5. **G1/G8:** collate the full Bhatt publication, finish the cited-input inventory, inspect fresh reservations and accepted restructuring state, and replace stage placeholders with exact supplier nodes.
6. Coordinate with **PAPER-ANDRE-18-B**, the adjacent direct-summand paper. **PAPER-ANDRE-18** is the other paper, on Abhyankar; reuse its pending **PerfectoidRamification** proposal for quantitative Riemann extension. Do not create a second name for that direction.
7. Check proposed **RegularRingSplittings** against adjacent work. Import Q3 root-adjoining and the pending PAPER-BHATT-ETAL-23 splinter vocabulary as appropriate.

Keep E1's correction: Proposition 6.2 needs generic finite-étale surjectivity, with the mixed-characteristic context explicit. The product-ring counterexample is in the report. E2–E3 are Bhatt arXiv findings; E4–E5 are André slips already corrected in publication; E6–E8 persist in the published pages read. All await independent review. G9's André local-duality question is unresolved, not another certified finding.

Do not mark complete on the strength of schema validation or finite arithmetic. All missing items presently have a route, but original-input closure and exhaustive proof-level coverage have not been achieved.
