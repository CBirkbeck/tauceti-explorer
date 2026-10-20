# Independent review: OverconvergentAutomorphicForms

**Verdict: accepted as a complete planning pass, with explicit mathematical gaps.**

Reviewer: Codex — `codex-kQDT4g`, 20 October 2026. Job [#10806](https://github.com/CBirkbeck/tauceti-explorer/issues/10806), reviewing [BP-OverconvergentAutomorphicForms, #10836](https://github.com/CBirkbeck/tauceti-explorer/issues/10836), written by the distinct session `codex-A4O1yY` and merged in [#11289](https://github.com/CBirkbeck/tauceti-explorer/pull/11289). The claim bot confirmed this review's claim before work began.

The reviewed deliverables are the root [packet](../packets/OverconvergentAutomorphicForms.json), [reader](../readmes/OverconvergentAutomorphicForms.md) and [suggested file](../suggested/OverconvergentAutomorphicForms.lean). The packet records a current verdict for every effective target: **80 verified, 16 corrected, none unverifiable**. The retained part reviews are provenance; this verdict independently assesses the assembled contracts, their changes and their four new targets.

All nine stages are **planned**, with every implementation status unchecked. The 11 gap records and 11 requests prevent a claim of mathematical closure. They do not prevent acceptance of the complete planning pass under PROTOCOL section 0 and this issue's acceptance criteria. No unresolved contradiction remains in the effective contracts after the corrections below.

## Scope and counts

| Quantity | Reviewed count |
|---|---:|
| Effective targets | 96: 92 retained imports and four assembly targets |
| Definitions / constructions / lemmas | 5 / 32 / 13 |
| Theorems / comparisons / applications | 30 / 13 / 3 |
| Named API items | 139 total; 138 attached to definitions/constructions |
| Definition/construction tests | 117 across all 37 such targets |
| Planets | 38, at most six in each layer |
| Pinned baseline declarations | 65 confirmed; zero removed or replaced |
| Target IDs added or removed by this review | 0 / 0 |
| Source-finding records | 26: 25 confirmed, one rejected |
| Gaps / requests | 11 / 11 |

The stage target counts are O0:24, O1:4, O2:6, O3:6, O4:12, O5:6, O6:13, O7:6 and O8:19. The imported part files, hashes and complete ID sets remain unchanged. Corrections belong to the root's effective `importedTargets`, avoiding duplicate global declarations or edits to another job's files.

I checked each target's exact statement, hypotheses, source match, direct prerequisites, proof sketch, acceptance properties and applicable API/tests. The target-level granularity is appropriate: neither a second declaration-level development nor synthetic geometric carriers in Lean are required. The worked checks distinguish inverse norm signs, point characters from universal spaces, finite fibres from analytic induction, Gauss lattices from pointwise integrality, all congruence units from positive units, and ordered ordinary completion from reversed limits.

## Corrections made in place

1. **Full norm and unit norm: O0/norm-at-p.** The old formula applied a map on units to an arbitrary integral element. The contract now defines the determinant norm `N_alg` on the full integral algebra and its unit restriction `N`. Compatibility on every integral element uses `N_alg`; global-unit compatibility uses `N`. The API, reader and suggested Lean signatures agree. The new light definition uses the pinned `Algebra.norm`.

2. **Ramified canonical generators: O2/admitted-hilbert-domain, O2/hilbert-automorphy-factor and O5/geometric-aip-comparison.** Reading the current T4 contracts showed that the inherited obligation includes an unsplit O_F/p^n-linear canonical generator and scalar conormal-degree comparison at ramified p, in addition to the inclusive endpoint. The existing T4 request, gap, consumers, hypotheses, prerequisites and O2/O5 coverage now retain both obligations. Splitting the generic fibre does not justify an integral product decomposition.

3. **Infinite-level line effectivity: O2/geometric-hilbert-sheaf.** The smooth rigid-base line criterion is used at finite level. At infinite level the proof pulls back that line and identifies the pullback with the kernel-equivariant functions through the sheafwise tower equalizer. It no longer applies the smooth-base theorem directly to an infinite perfectoid base.

4. **Analytic-family Koecher: O6/hilbert-koecher.** The existing C6 arithmetic Koecher theorem is narrower than AIP's bounded analytic-family assertion. The existing C6 request and gap now explicitly include AIP ADIC Proposition 8.4, pp.36–37, with finite p-level boundary transport and the actual model restrictions. Added the supplier-stage prerequisite and made the conditional input visible in the target and O6 coverage. This does not duplicate cusp geometry here.

5. **Arithmetic wild-Hecke transport: O6/wild-hilbert-hecke.** Generator independence on the geometric tower uses the geometric factor equal to one. On the arithmetic presentation the additional `w(det)` factor remains. The corrected target transports the geometric map through the O4 pairing and finite-polarization comparisons; it lists those dependencies and tests this distinction. It never evaluates a weight on a nonunit uniformizer.

6. **Hodge frame and tower conventions: seven O8 targets.** The affected targets are hodge-frame-transformation, determinant-frame-transformation, scalar-coefficient-identification, determinant-hodge-specialisation, algebraic-levi-specialisation, siegel-analytic-instance and algebraic-induced-injection. They now use S3's Hodge–Tate quotient O^(2g)/W_std ≅ ω_(A∨) ≅ ω_A and the first g quotient classes. The natural dual-Lagrangian bundle is ω_A(−1), whose frame carries an extra inverse similitude. A fixed root-of-unity basis does not equivariantly remove this factor; the variable Weil-pairing generator does.

   The standard-to-antidiagonal conversion is explicit: P=diag(I,W), Z_DRW=Z_std W and C_DRW=W C_std, so A+ZC is preserved. The full diagonal-reduction K uses S1's general quotient with c(K)=Z_p^×, base changed from Q_p to C_p with all pairing components. It is distinguished from S1's smaller named subgroup and from the fixed-pairing fibre with deck group K∩ker(c). The frame law is derived directly from the Hodge–Tate quotient for this full K. A new proved Lean example checks the matrix conversion.

7. **Toroidal restriction: O8/toroidal-coefficient-instance.** Its open comparison now uses the corrected quotient Hodge frame while transporting the μ-cyclotomic twist. It does not suppress that twist by a fixed basis.

8. **Transported multiplication: O0/siegel-analytic-coefficients.** The API and acceptance check now distinguish pointwise multiplication on Iwahori functions, which multiplies weights, from the algebra product transported through restriction to the opposite unipotent. The former does not disprove the latter.

The reader reproduces all corrected statements, hypotheses, proof steps, prerequisites, APIs, tests, Checks and source matches. The remaining-input prose, coverage and counts were synchronized. Assembly metadata now records the accepted planning verdict. I also corrected the upstream-audit description: the four Completed roadmap directories are absent from the current tree, so their implemented library areas were screened instead of claiming to read absent inventories.

## Sources and independent source verdicts

The eight source PDFs were fetched from the public URLs recorded in the packet and their SHA-256 hashes confirmed. Current independent reading scopes are recorded alongside the original assembly's provenance. Results are stated in our own words; no source excerpts were added.

| Source | Passages checked |
|---|---|
| [Birkbeck–Heuer–Williams, published](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | Definitions 4.5, 5.14/5.17, Proposition 5.18, §5.5 and §§6–10; printed pp.1736–1737, 1749–1753, 1755–1765, 1768–1792. |
| [BHW arXiv v4](https://arxiv.org/pdf/1902.03985v4) | §§6–7, pp.27–31, for the six inherited Hilbert findings and published/preprint comparison. |
| [AIP ADIC author copy](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | §2.4, pp.7–9; §4, pp.15–18; §§6.4/7.1, pp.29–30; Proposition 8.4 and ordinary comparison, pp.36–37. |
| [AIP CUSP author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | Remark 3.15 through §3.7, pp.17–24; §4, pp.26–28; Appendix, pp.32–33. |
| [Boxer–Pilloni, Higher Coleman theory author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) | Remark 4.4.28, p.76; Theorem 4.4.40, pp.79–80; §§4.6.8–4.6.18, pp.92–97; §§6.2–6.3, pp.147–154. |
| [Ding, published](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | §4.2.2 and Proposition 4.14, pp.66–67. The cited BHS proof leaves remain an explicit supplier audit request. |
| [Heuer, published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf) | Corollary 1.4, p.3; Definition 3.7 and Proposition 3.8 with proof, pp.16–17. |
| [Diao–Rosso–Wu, arXiv v3](https://arxiv.org/pdf/2106.00094v3) | All effective target and finding locators in pp.7–25, 34–38, 42–47 and Appendix B, pp.102–104. |

Every source finding has a fresh verdict by this review; earlier reviews are retained in `reviewHistory`. In particular:

- **E-O8-16 is rejected.** DRW Remark 3.1.11, p.23, explicitly transports a Banach algebra through restriction to the opposite unipotent. If ℓ=ub, its product is (f⋆g)(ub)=κ(b)f(u)g(u), with unit eκ(ub)=κ(b). The earlier pointwise-product counterexample addresses a different operation. The coefficient representation and automorphic equalizers remain modules; no claim that translations preserve the transported multiplication is needed.
- **E-O8-17 is confirmed for the hashed arXiv v3.** Definition 3.1.10 normalizes lower coordinates by p, whereas §2.1 thickens matrix entries. The pole example at v_p(a)=r−1/2 detects the missing radius shift. The root's stronger geometric-factor bound supplies the smaller action neighbourhood required by the full intended coefficient module.
- **E7, E8 and E9 are added with confirmed verdicts.** These concern the all-congruence-unit kernel (Definition 8.17 versus Lemma 9.2, pp.1773/1781–1782), ramified integral splitting in Proposition 5.18 (pp.1752–1753), and first-factor period-map descent in Lemma 8.28 (p.1779). They cross-reference the existing supplier findings PerfectoidShimuraVarieties/E29, E36 and E27. The norm-congruence and corrected span-map arguments repair the corresponding uses. The ramified canonical-generator input remains an explicit request.

The DRW journal version could not be collated: publisher full-text access did not provide a PDF. Its findings remain confined to the hashed arXiv v3, and the version-of-record gap remains open. Public journal, arXiv and author-page checks and title/author correction searches found no correction; this is not an assertion that no correction exists, nor a novelty claim. No author was contacted. No restricted book was needed, copied or quoted, and no suspicious external instruction was encountered.

## Baseline, suppliers and ownership

All 65 cited declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their exact hypotheses support the stated substrates. Matrix inverse claims retain unit determinants, algebraic base change does not stand in for integral analytic base change, and existing topology/representation carriers do not supply missing rigid geometry. **No baseline citation was removed or replaced.**

The exact statements and hypotheses of the 102 distinct supplier references were checked where they resolve to nodes; stage references retain precise requests. The reviewed AUDIT-15 library coverage was checked for all nine layers. The current read-only roadmap and library commits are respectively `0d144d044dacebca17b654695b6f1ad58f159b27` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the nearby AdicSpaces and AlgebraicVectorBundles readers, screened declarations in the nine post-snapshot roadmap families and checked the implemented areas corresponding to the absent Completed directories. No upstream file or build was changed. No target was moved between owners, and no existing roadmap was replanned.

## Validation

- Stock `scripts/check_blueprint.py` on the root packet: **0 errors, 0 warnings**, with the pinned declaration index. Its four-node count excludes the retained imports.
- Expanded validation using the unchanged checker's `check` function: **96 targets, 0 errors, 0 warnings**, including the full effective DAG. Reproduce with a temporary packet view replacing `nodes` by importedTargets (renaming nodeId to id) followed by nodes, removing importedTargets, and remapping only these 96 IDs in `world()`'s external ownership map to that temporary filename. Keep the baseline index and all other context unchanged.
- Complete imported hash/ID sets; unique API/test names; coverage counts; planet bounds; unchecked implementation statuses; all 96 target verdicts and all 26 source verdicts: passed.
- Per-target reader comparison of statement, hypotheses, proof steps, prerequisites, acceptance properties, API/test names and statements, source locators and matches; all requests, gaps and remaining lists: passed. All **889** reader Markdown destinations were examined for local-file/anchor resolution; no broken local destination. This is not an external-link availability audit.
- `lean-check` on the suggested file: **compiled at the pins, exit 0**, after checking available memory. **263 lines, seven proved examples, 17 admitted-theorem warnings, no errors or other warnings.** No admitted data definition or new geometric placeholder was introduced.
- `scripts/check_sorry_data.py`, the intake file check and `git diff --check`: passed.

## Questions and next programme work

No question blocks this review. The orchestrator should route the existing 11 requests to their recorded owners: PMIA L0a, CC.8, LR.6, P9 (two requests), T4, T5, C6, B5, T3 and S6. Their precise statements and consumers are in the packet and reader. Retain the separate DRW published-version collation gap. Acceptance does not assert that these inputs have been proved.
