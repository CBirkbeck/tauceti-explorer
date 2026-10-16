# Handoff: PKG-AInfCohomology~2, issue #9876

Codex, session `codex-RTh55E`, 2026-10-16. Completed the second-round package revision on branch `codex-RTh55E-ainf-package`. This is a completed package submission, not a checkpoint or an independent review. No second job was claimed.

## Delivered

Revised `research/blueprint/packages/AInfCohomology/README.md` to supply the two missing comparison-map arguments identified in `research/blueprint/reviews/REV-PKG-AInfCohomology.md`. The existing `Suggested.lean` and `metadata.toml` satisfy the required package shape and were retained unchanged. The next reviewer owns `review.json`; it was left untouched, including its previous verdict.

The revision adds three theorem targets, in dependency order before the trace/prismatic agreement target in §AI.7.3:

1. **Coordinate compatibility of the crystalline realization.** Gives the square between the particular all-coordinate prismatic/AΩ comparison, prismatic crystalline base change and the inverse of BMS1's canonical crystalline map. It uses a common envelope Čech resolution, the relative-Frobenius construction of BS22 Theorem 5.2, and the q-crystalline construction of Theorem 16.18. The passage to coordinate Koszul resolutions keeps the logarithmic operator factors and their direction. The bounded A_cris^(m) stages of BMS1 Lemma 12.8 are retained before completion and passage through décalage.
2. **Compatibility of period evaluation and infinitesimal realization.** Identifies the actual maps on perfectoid covers by their common Teichmüller evaluation. It then identifies the completed Frobenius-fixed-point maps and the B_dR⁺ infinitesimal and period maps. It distinguishes finite-level localization from derived p-completion, and embedding-ideal completion from coefficient completion. Properness is required for the global étale tensor-product and finite-free period-realization conclusions.
3. **HKR reduction of relative divided Frobenius.** Compares the specified relative cyclic reduction with the factorized prismatic Frobenius. The construction first compares filtered maps and their Beilinson connective covers; reduction then compares actual dg de Rham algebras in the Beilinson heart. The degree-zero augmentation, its differential and products determine that map. An equality of unfiltered cohomology groups is not used as a replacement for this step.

Each new theorem has its hypotheses, source versions and theorem/page locators, named supplier prerequisites, and at least three discriminating Checks. Their carriers are unavailable at the Lean pins, so they remain README targets.

## G1 and G2

**G1, §AI.7.3.** The particular trace/prismatic equivalence of clause (a) is retained. Clause (b) now displays all three specialization squares, with the lower realizations identified by their specified maps. The argument compares the Frobenius-twisted complexes via the particular map of BS22 Proposition 15.7, then uses tensor associativity with

```text
g φ_𝔖 = f,     e_π φ_𝔖 = θ_𝔖,     e₀ φ_𝔖 = c_𝔖.
```

The A_inf square uses compatibility of the relative-to-absolute trace map with the envelope map before unfolding. The de Rham square uses the new HKR comparison. The crystalline square uses the Witt-to-PD map in BMS2 Theorem 8.17 and the relative-Frobenius map of BS22 Theorem 5.2 on the same presentations. It retains coefficient units: E(0)=a·p gives a⁻¹ for an E-oriented divided generator, while the Frobenius-pulled-back presentation uses φ_W(a)⁻¹. Derived quotients or the stated flat presentations are used at the special fibre. No uniqueness theorem on nonperfect completed overlaps is invoked.

**G2, §AI.7.4.** The supported Hodge–Tate assertion remains. Clause (b) now gives the θ-de Rham square, identifies the Frobenius/décalage factorizations as maps, and compares the result with BMS1 Theorem 14.1's actual crystalline-defined de Rham map. The crystalline coordinate comparison reduces by θ with the logarithmic correction operators reducing to the identity. The new crystalline and period-evaluation targets supply the remaining A_cris, étale and B_dR⁺ squares; G1 supplies the Breuil–Kisin/trace squares. BS22 Theorem 18.2 is used only for symmetric monoidal functors on the full smooth O_C-domain over the perfect A_inf prism, with their Hodge–Tate structure maps. It is not extended to A_cris or to functors defined only over O_K.

The new Checks include the coefficient point, the x^p q-differential coefficient, p=2, reduction by θ versus θ̃, redundant coordinates, the infinitesimal exponential multiplier, polynomial differentials, two-coordinate wedge signs, ramified u↦π versus u↦π^p, and the Frobenius action on a non-normalized Eisenstein unit.

## Coverage, dependencies and current libraries

The README has 267 targets: all 264 original targets plus the three comparison theorems above. The original count is 226 accepted targets (137 AI.0, 60 AI.6, 29 main) plus 38 supplier targets. No original target heading or inline identifier was removed. All 67 API-bearing definition/construction blocks retain at least three Checks. All original named API/Check bullets are retained; the existing nonperfect-overlap Check is expanded with the reason the new construction does not use uniqueness there. Worked examples and the rest of the roadmap remain intact.

The final mechanical title check resolved 1,354 internal prerequisite references; every resolved reference points backward. The three new theorem targets and the modified agreement targets were checked against their named suppliers in PrismaticCohomology, DerivedDeRhamCohomology and CrystallineCohomology. The AI.7 dependency overview now includes the de Rham dg-algebra and étale-comparison inputs. Prismatic atlas IDs PR.6 (q-crystalline/AΩ) and PR.4 (étale) are retained; their packaged README numbers are respectively Layers 5 and 6.

Read current upstream AdicSpaces and AlgebraicVectorBundles, including their Suggested.lean files, and searched current roadmaps including Completed and the nine roadmaps newer than the atlas snapshot. Current TauCetiRoadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No existing target implementing the three new comparison statements was found. The existing Witt completeness and generic residue/Frobenius APIs remain library inputs, as corrected in the previous review. No upstream or library checkout was changed or built.

Read the reviewed library-coverage index and its relevant HQ.2 and RT.6 cross-references. It has no direct AInfCohomology layer audit entry; those references identify décalage and the Breuil–Kisin trace/prismatic comparison as supplied here, rather than already implemented library results. The current-library searches supplement that older index. This run's mathematical source audit focuses on G1/G2 and their three new suppliers; it does not claim to have repeated the previous review's independent source audit of every unchanged target.

The existing tier-13 bundle and interleaving remain: AInfCohomology, PadicHodgeTheory, PerfectoidQuotients and PrismaticCohomology. The previous handoff's external ownership follow-up is still outside this issue: CrystallineCohomology CR.5 and DerivedDeRhamCohomology DD.4/DD.6 have upward citations to this integral prefix that the manager must reconcile before those lower-tier packages go upstream. No such external packet repair is claimed here.

## Sources read for the revision

All mathematical exposition and calculations are in the worker's own words. No source passage or section-by-section source summary was added. Maintainer-cleared sources were read in place; no alternative copy of a restricted book was used.

- **Bhatt–Scholze, Prisms and prismatic cohomology, arXiv v4:** Corollary 2.39 and Warning 2.41, p.25; regular/prismatic envelopes, §§3–4; Theorem 5.2 and its construction, pp.45–47; Theorem 9.1 and proof, pp.71–73; Theorem 13.1 and proof, pp.94–96; Theorems 15.2–15.3, Corollary 15.4 and Proposition 15.7, pp.102–105; q-PD envelopes and Theorems 16.18 and 16.22, pp.110–116; §17, pp.117–120; the domain and hypotheses of Theorem 18.2, pp.122–123. In particular, q-PD-thickening invariance is Theorem 16.17, while the q-crystalline/prismatic comparison is Theorem 16.18.
- **Bhatt–Morrow–Scholze, Integral p-adic Hodge theory, arXiv v3:** §12.1–12.2, pp.96–103, including the canonical map and the bounded coefficient-ring passage; the infinitesimal comparison constructions in §13, especially Theorem 13.1's diagram on p.115 and Proposition 13.23 on p.117; Theorem 14.1 and its two de Rham routes, p.118. The published Theorem 14.1 locator remains pp.388–389.
- **Bhatt–Morrow–Scholze, Topological Hochschild homology and integral p-adic Hodge theory, published IHÉS version:** Proposition 5.15 and the proof of Theorem 1.17, pp.241–242; Theorem 8.17 and its PD-envelope map, pp.276–279; Theorem 9.6 and Proposition 9.10, pp.286–290; Theorem 11.2, pp.298–299; Corollary 11.12 and the Bott-inverted descent proof, pp.304–306; Remark 11.17, pp.307–308. The public published PDF is [available from Numdam](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf); its SHA-256 was `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

## Validation and remaining work

- `lean-check research/blueprint/packages/AInfCohomology/Suggested.lean` exited 0 at the shared pinned environment: 33 warnings, all `declaration uses sorry`, no errors or other warnings. Memory was checked before the single compile. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- `Suggested.lean` remains 327 lines, with 12 light real-bodied definitions/abbreviations, 15 theorems and 18 examples. `scripts/check_sorry_data.py` passes. Metadata remains exactly `topic = "math.AG"`.
- `scripts/check_blueprint.py` reports 0 errors and 0 warnings on each of the three accepted input packets. No packet was edited; their existing planning gap records are not changed by this package revision.
- Target/API/Check preservation and prerequisite-order checks pass. Intake reports 4 files and 0 problems on the package files and this handoff; `git diff --check` passes.

No implementation or formal proof of these heavy comparison targets is claimed. The next step is independent review of the revised package, concentrating on the common Čech/Koszul construction and the filtered cyclic-to-de Rham map identifications. There is no unfinished work within this package revision. All information needed to review or continue is in the README, this note and the earlier review; scratch materials are deleted after submission.
