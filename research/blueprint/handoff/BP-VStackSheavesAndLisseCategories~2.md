# BP-VStackSheavesAndLisseCategories~2 — completed revision

Issue [#7014](https://github.com/CBirkbeck/tauceti-explorer/issues/7014), Codex session `codex-LSX9Vg`, 2026-10-08. The bot confirmed the claim. This is a completed target-level revision for independent review, with `status: complete`, `part: null`, and exactly VS0–VS5 in scope. All six stages remain **planned**; no implementation or mathematical gap closure is claimed beyond the ownership correction described below.

The deliverables are the [packet](../packets/VStackSheavesAndLisseCategories.json), [reader](../readmes/VStackSheavesAndLisseCategories.md) and [suggested file](../suggested/VStackSheavesAndLisseCategories.lean). The input revision is repository commit `1c84707b715f97c4dd3e5d01abced75923509263`. The [independent review](../reviews/REV-VStackSheavesAndLisseCategories.md) and the packet's top-level `review` object are retained unchanged, as required. Their 78-node counts and unresolved RT30 verdict describe that input, not this revision. The next independent reviewer replaces the packet review.

## Ownership correction and preserved identifiers

The verified RT30 alternative is implemented at declaration ownership, without adding VS0→VS2 or VS1→VS2:

| Target | Owner in this revision | Identifier decision |
| --- | --- | --- |
| Generic geometric field-extension invariance, FS VII.2.6, pp.255–256 | VS2 | New `VS2/solid-geometric-base-change` |
| Solid Drinfeld descent, VII.2.7–8, p.256 | VS4 | Preserve `VS2/solid-geometric-base-change-and-drinfeld`, narrow its contract to Drinfeld descent |
| Solid partial support, VII.2.9, p.256 | VS4 | Preserve `VS2/solid-partial-support` |
| Solid partial-support vanishing, VII.2.10, pp.256–257 | VS4 | Preserve `VS2/solid-partial-supported-vanishing` |
| Completed ULA/solid duality, VII.5.2–4, pp.265–268 | Preparatory branch of VS3 | Preserve `VS2/completed-ula-solid-duality` |
| Constructible coefficient embedding, VII.5.1(a)–(b), pp.264–265 | Preparatory branch of VS3 | Preserve `VS2/constructible-and-geometric-langlands-embedding` |
| Generic naive and contravariant torsion–solid comparisons, VII.4, pp.261–264 | VS2 | Preserve `VS2/torsion-solid-comparisons` |

Identifiers in this table are abbreviated after `VStackSheavesAndLisseCategories:`. All five moved identifiers keep their declaration names. Their `parentStageId`, `realises` and proposed module paths specify their new owners. Historical identifier prefixes do not determine ownership. Existing HS1 solid Drinfeld consumers consequently still resolve their input. VS4 stratum and HN invariance now use the new generic VII.2.6 identifier.

VII.4 uses the sheaf-derived inclusion, Ind/Pro presentations and Breen duality; its proof does not use the VS1 relative ULA tensor-Hom criterion. That unsupported prerequisite is removed, and solid sheaf structure is a direct input. The proper smooth VII.3.5 comparison now directly imports this generic torsion comparison to identify its dualizing twist. VII.5 actually uses IV.2.19, so that direct input is retained in its VS3 preparatory branch. Putting VII.5 in VS4 would make a cycle through the VS3 lisse comparison that consumes it. Its VS1 analytification input is distinct from the L1/L3/L4–L6 scheme/v-sheaf comparison chain rejected by RT28.

The packet's target coverage, prototype gap ownership, subdivision proposal and RT30 note, and the reader and suggested ledger, agree on this split. `G-rt30-scope` is removed because this revision supplies the requested scope correction. All other gaps remain.

## Checks of the review's local corrections

All 18 corrections were checked against the cited source passages and carried into the reader. The packet and suggested ledger retain the review's accepted contracts, API names and tests. One discrepancy between the review report and its saved packet was repaired: the smooth twisted-pullback prerequisite was already in the suggested ledger but absent from the packet. It is now explicit in both; the proof explains the prime-primary coefficient decomposition needed for the supplier's ℓ-power statement.

| Review correction | Result retained or reconciled |
| --- | --- |
| 1–2: smooth descent and normalized exceptional pullback | Direct S4 twisted-pullback input; IV.1.16 left adjoint with its eligibility conditions |
| 3–4: torsion and solid partial-support tests | Prime-to-p torsion scope and both nonzero proper-band section tests; solid support is now in VS4 |
| 5–7: ULA locality, tensor-Hom and dualizability | Basic locality excludes the advanced composition assertion; forward tensor-Hom requires ULA; direct IV.2.15/19 inputs and Proposition IV.2.24 are retained |
| 8–9: formal smoothness | Neighbourhood covers the entire prescribed closed subspace with agreement on its pullback; calculus uses IV.3.6 and restricts étale locality to locally spatial diamonds |
| 10: relative kernel category | Prime-to-p torsion coefficients remain explicit |
| 11–12: section space and Jacobian criterion | Fixed local projective embedding of the source; candidate cohomology and normal-cone fibres without an unsupported infinitesimal identification |
| 13: geometric divisor covers | SW20 Lemma 16.3.2, printed p.144, using the actual VB2 constant finite-étale algebra input; no unrelated 16.3.3/16.3.6 product argument |
| 14: compact-Hausdorff cohomology | CS Theorem 3.3, pp.20–23, uses the augmented complex and the correct nonnegative degree range |
| 15: condensed filtered colimits | PQ26 Lemma A.5, pp.89–90, includes common-stage factorization on a compact profinite source and the filtered finite-product calculation |
| 16: connected BC kernels | Nonproper VII.5.2 comparison and relative homology, with integral unit detection/completion still recorded in `G-bc-unit-homology` |
| 17: compact objects | Torsion IV.5.3 is a direct input to the VII.7.5 chart calculation, distinct from solid VII.2.10 used by the stratum adjoint |
| 18: lisse Verdier exchange | Exactly VII.7.7, pp.274–275; no additional source-omitted lisse reflexivity criterion; the torsion reflexivity node remains |

Both review-added gaps, `G-algebraic-ula` and `G-bc-unit-homology`, and all five independently confirmed source issues remain explicit. Source discrepancies are described in our own words. Source excerpt fields were removed; no source passage or source-by-source synopsis was added.

## Binding boundaries and red-team findings

The accepted RS-05 boundary, reviewed library audit for all six stages, full prior review and handoff, and the RT verifier entries /18, /28, /29, /30 and /31 were read. The upstream SemisimpleAlgebras and InductionRestriction roadmap documents were read in full for the required density and prototype style. The relevant actual supplier declarations were inspected, including the newly direct S4 twisted-pullback and the three C6 invariance targets.

- **RT18:** Preserve the proposals for EDC.5 perversity/recollement and L1/L3 at the characteristic-p Satake consumers. No unnamed lisse prerequisite is imposed on torsion GS2/GS3.
- **RT28:** L0 supplies the VS3 adic limit. The actual VII.5 ULA application has its specific VS1/H5 input, without importing the unrelated L1/L3/L4–L6 chain. The external GS edge corrections remain proposals.
- **RT29:** Retain the torsion nodes separately from VII.7.6–10 lisse BZ, exchange, ULA, admissibility and Künneth. Preserve the VS5→HS1 proposal and the actual VII.7.2/VII.2.10 prerequisite chain.
- **RT30:** Implement the generic-core alternative in the table above and verify its dependency isolation.
- **RT31:** Use the actual VB2 finite-étale constant-algebra target and SW20 16.3.2. Import the existing ClassFieldTheory Weil group through its existing prerequisite and exact object request. No extra upstream atlas edge or replacement Weil definition is proposed.

VS0–VS3 do not use Bun_G charts to construct their foundations. VB supplies bundle/BC geometry, BG supplies Bun_G strata and charts, and SR supplies the representation carriers. Generic analytic rings and analytic stacks remain imports from SA and AS. No upstream roadmap, atlas data or other job's file was edited.

## Sources and baseline

Fresh downloads of all five public PDFs reproduce the packet's recorded SHA-256 hashes. The source versions and the prior read-date records are preserved. This revision re-read the passages supporting the ownership split and the 18 corrections, including FS IV.1–IV.5, IV.7, VII.2–VII.5 and VII.7 at the cited locators; CS Theorems 3.2–3.3; SW20 16.3.2; PQ26 Appendix A; and BCGP25 §§2.2.1 and 2.4.1. This is verification of the revised boundaries and corrections, not a claim to have freshly reread every page of the inherited source coverage. Berkeley locators use printed numbering, ten pages behind the PDF index. No restricted book was needed.

All 39 baseline references were rechecked by reading their actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, in 32 modules. The baseline object is unchanged. In particular, finite-type `CondensedMod.IsSolid` is not used as the arbitrary-ring predicate; the profinite solid object construction is not a proof of its structure theorems; the ordinary derived category is not the EDS enhancement; finite modules are not perfect complexes; and the smooth representation carrier is not already a Bun_G equivalence.

## Validation and compilation

- `python3 scripts/check_blueprint.py research/blueprint/packets/VStackSheavesAndLisseCategories.json`: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: **4 files, 0 problems**.
- Preservation comparison against the input: all 78 prior node IDs and declaration names, all 21 integrated IDs, all 182 API entries, all 95 tests, all 39 baseline references, all 15 requests, source versions and independent review objects preserved. Only the mixed Drinfeld contract is split, with its old name retained for Drinfeld descent.
- Mechanical reader/ledger comparison: all 79 statements, proof steps, direct inputs, API/test names and statements, and applicable omission gaps match. Reader local links and explicit anchors resolve. The four typed cores and all accepted typed/omitted labels remain unchanged.
- The local declaration graph is acyclic. Traversal through the available supplier declaration packets reached 2,245 references, including 22 local generic targets and 978 stage/library/request terminals, with no VS0/VS1 declaration or terminal. This tests recorded dependency closure; it does not certify the mathematics of every supplier or replace the unresolved interfaces.
- Actual atlas assembly with this candidate substituted **in memory** passed. It listed all 79 targets under their explicit owners, including all five preserved moved IDs. Neither VS0 nor VS1 reaches generic VS2 in the trial stage graph; no candidate external link was skipped. No data files were written.
- `lean-check research/blueprint/suggested/VStackSheavesAndLisseCategories.lean`: **exit 0**, with 34 warnings, all proof-placeholder `sorry` warnings. Its 12 typed examples and four ordinary condensed cores are retained. The file imports only Mathlib and was checked against the exact recorded Mathlib pin; no Tau Ceti module participates in this elaboration. It does not formalize the gapped geometric/derived contracts.
- `git diff --check`: passed. Only the four authorized deliverables are submitted.

Final counts: **79 nodes**, **182 API entries**, **95 tests**, **30 planets**, **39 baseline references**, **26 target groups**, **16 gaps**, **15 supplier requests**, **six planned stages**, **zero closed stages**. Node ownership counts are VS0: 7, VS1: 22, VS2: 22, VS3: 7, VS4: 10, VS5: 11.

## What remains and where to resume

The next step for this completed job is independent review of the ownership split, the new VII.2.6 target and the synchronized reader. The previous top-level review deliberately still says `needs_changes`; this producer does not replace an independent verdict.

The 16 recorded interfaces remain future mathematical/carrier work: cutoff comparison, Breen stable homology, compact-Hausdorff cohomology, enhanced compactness/coherent descent, Jacobian estimates, Haar trivialization, derived smooth duality, perfect coefficient descent, six stage prototype carriers, algebraic relative-kernel ULA and integral nonproper BC unit homology. Their exact contracts and affected nodes are in `gaps`; the 15 owner requests specify their supplier interfaces. No source proof gap is hidden by a typed placeholder or an assertion of implementation.

For later implementation, begin at the applicable named gap and imported owner, then replace that node's omitted signatures with actual carrier types and recheck its discriminating examples. Keep generic VS2 separate from the VS3 ULA and VS4 divisor/support branches. External edge changes and subdivisions remain proposals for intake/maintainer action. Everything needed for review and continuation is in the committed deliverables and their public locators; scratch files are disposable.
