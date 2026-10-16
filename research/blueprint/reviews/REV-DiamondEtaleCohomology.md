# REV-DiamondEtaleCohomology — independent review

Issue #9921. Reviewer: Claude (session claude-fp7JM9), 16 October 2026. Under review: `BP-DiamondEtaleCohomology` (Codex, session codex-OTJOrW, PR #9941). That job is a whole-roadmap continuation. It imports the accepted parts `DiamondEtaleCohomology--C0` (119 nodes, C0–C7) and `DiamondEtaleCohomology--C8` (65 nodes, C8–C9) by node id, adds two lemmas, and changes imported nodes by same-id refinement records. I did not write or review any earlier file of this roadmap.

**Verdict: accepted**, with the corrections below made in place. All ten stages remain planned and none is closed. The 11 gaps are recorded honestly.

## Counts

| | Before | After |
| --- | ---: | ---: |
| New nodes in this packet | 2 lemmas | 2 lemmas |
| Effective plan (imports + new) | 186 nodes, 256 API items, 176 tests, 44 planets | unchanged |
| Refinement records of imported nodes | 4 | 15 |
| Requests | 25 | 21 |
| Gaps | 11 | 11 |
| Baseline declarations in this packet | 9 | 14 |
| Internal edges of the effective graph | 543 | 543, acyclic |

Every prerequisite of the effective plan resolves to a packet node, an atlas stage, a pinned declaration or a TauCetiRoadmap layer anchor; all eight anchors exist in current TauCetiRoadmap READMEs. After the corrections, every external citation is to Mathlib, Tau Ceti or a roadmap of a lower tier than DiamondEtaleCohomology (tier 11 of `upstream/CaraianiNewton.md`). The planets number at most six per layer.

## Sources

I re-fetched ECD (arXiv:1709.07343v4), CS17 (Annals 186), FS (arXiv:2102.13459v4) and Conrad's handout; all four SHA-256 values equal the packet's. I read each place the new nodes, refinements and target crosswalk cite:

- ECD Corollary 17.2 and the paragraph after it (p.97, upright running text after the statement, so "running text after 17.2" is right);
- ECD Lemma 17.5 and the paragraph after it (p.98); Remark 18.2 (p.101);
- ECD Propositions 20.14–20.17 (pp.119–122); Lemma 21.6 (p.123); Proposition 21.16 and Lemma 21.17 (pp.126–127);
- CS17 Proposition 4.2.19, Remark 4.2.20 and Proposition 4.2.21 (pp.711–712); FS Problem I.11.1 (p.42);
- Huber 1996, §1.8, Definitions 1.8.1–1.8.4 and Lemma 1.8.5 with proof (pp.90–91), in the maintainer-cleared copy, read in place and nothing copied;
- Stacks Tag 0BC7 (Lemma 15.76.18), for correction 1 below.

No `excerpt` remains in any of the three packets.

## The two new lemmas

**C7/perfect-local-system-dualizable** is correct. It promotes the `IsPerfectLocalSystem.dualizable` API item of the accepted `C7/perfect-local-system`, as the C8 part had requested.

- Internal Hom commutes with étale restriction by the projection formula for étale j! (an API item of C5/etale-extension-by-zero).
- On a trivializing cover, P7's perfect dual and perfect tensor–Hom nodes give the comparison. Conservativity on the cover finishes the argument.
- The hypothesis that Λ is commutative is needed for the dual and is stated. ECD 20.17 says only "a ring", and the roadmap's convention fixes commutative coefficients for tensor products.
- The non-example (Q over Z) is right: RHom(Q, Z) ⊗ Q is concentrated in degree 1, while RHom(Q, Q) = Q.

**C8/compact-procyclic-field-action** is correct. Telescoping, the ultrametric inequality and isometry give |γ^(mN!)(x) − x| ≤ |γ^(N!)(x) − x| for every integer m. Hence each orbit map is uniformly continuous for the profinite uniformity on Z and extends to Ẑ.

- The image in C^C is compact and equals the closure of the integer powers, and also of the nonnegative powers.
- The image is Ẑ modulo a closed subgroup, and so is profinite by the pinned `TauCeti.QuotientGroup.instTotallyDisconnectedSpace`.
- This is exactly the compactness that the confirmed source issue DiamondEtaleCohomology/E3 found missing in ECD 21.17.

## The four BP refinements

- **C8/wild-automorphism.** Right. I checked maximization of |h(x)/x − 1| over the compact Sylow subgroup, the cocycle identity d_(gh) = d_g + g(d_h) + d_g·g(d_h), additivity and continuity of the residue map, and the pinned `IsProP.isPGroup_range` with `IsPGroup.orderOf_coprime`. ECD's own normalization at a topological generator also works: the cocycle bound gives |d_g| ≤ |d_γ| on the nonnegative powers and then on their closure. So there is no new erratum, and I added this sentence to the E3 refinement.
- **C8/analytic-dimension-bound.** Faithful to Huber 1.8.5(i): chains in a fibre are bounded by the rational rank of the value-group quotient, and that rank by Huber's tr.c through Bourbaki VI.10.3 Cor. 1, which remains an obligation (gap G5).
- **C9/perfect-local-system-compact.** Right, up to wording; see correction 7.
- **C8/finite-topological-generators.** Right. P4's own node records the characteristic-p step as a gap, so a request to P4 is the right form.

## Corrections made

1. **A citation outside the 94 roadmaps.** `C7/perfect-constructible-ring-colimit` cited `SchemeKTheoryOperations:S.1/perfect-complexes-on-limits`. That is the only citation `upstream/CaraianiNewton.md` lists for this roadmap outside the 94, which that file calls a stray citation to remove. Only the affine case is used. A new refinement replaces it by Stacks Tag 0BC7 and four accepted tier-10 P7 nodes: perfect-object, finite-perfect-hom-filtered-colimit, p7ii-derived-extension and p7ii-extension-preserves-perfect. It also writes out the matrix argument, and adds a `Stacks` source entry and a specific ECD 20.15 match.
2. **ProfiniteProPGroups Layers 2–3 requests withdrawn.** Their content is already in Tau Ceti at the pin: `TauCeti.exists_isProPSylow`, `IsProPSylow.not_dvd_index`, `IsProPSylow.isProP`, and the `IsProP` definition and API. Upstream's README marks these items "In Tau Ceti". Wild-automorphism now cites the three declarations. Step 1 makes nontriviality explicit: if G is not pro-p, some G/U has order divisible by a prime ℓ ≠ p, and the Sylow pro-ℓ subgroup's image there then has ℓ-free index. Wild-kernel-pro-p and prime-to-p-wild-removal use the `TauCeti.IsProP` definition. An upstream note records this.
3. **EnhancedDerivedSheaves:E3.** The request for HTT 5.5.3.12–13 and 5.5.2.2 is withdrawn: the accepted nodes `E3/presentable-category-limits` and `E3/representability` state both. C2/enhanced-etale-category and C3/internal-hom now cite them, and the C2/C3 coverage lines are updated. `C9/etale-constant-compact` now cites `E3/exact-coproducts-colimits`. The remaining E3 request is narrowed to the cutoff comparison for the test objects, with consumer compact-generators.
4. **ArithmeticGaloisDuality.** The R02.1 and R02.2 requests are withdrawn. The accepted node `R02.2/hochschild-serre-spectral-sequence` is the all-degree spectral sequence for discrete modules over a profinite group with a closed normal subgroup. Its abutment is `continuousCohomology` and its edge maps are inflation and restriction. Extension-cd-bound and prime-to-p-wild-removal now cite it. Accepted RS-05 had assigned this result to R02.1, but the node lives in R02.2.
5. **DiamondsAndVStacks:D5.** The accepted node `D5/localization-at-a-point` supplies Y_y: spatial, |Y_y| the generalizations of y, a quasicompact injection, with its universal property. C7/constructible-filtration, C7/perfect-constructible-filtration and C8/local-stalk-bound now cite it. The three localization requests are narrowed to the quasi-pro-étale presentation by Spa(C, C⁺).
6. **ProfiniteCohomology Layer 1.** The TopRep carrier and `ofDiscreteModule` are Layer 1, not Layer 0. Point-sheaf-equivalence now cites both layers, and a Layer 1 request was added.
7. **C9/perfect-local-system-compact.** The refined statement called N "a single finite upper bound for H^i(Y,F) … for every i>N", which is not a condition. It now reads: H^i(Y,F) = 0 for every i > N and every étale Λ-module sheaf F. The proof steps now cite the new duality lemma, uniform-test-bound and global-sections-coproducts in place of "E1/C7".
8. **Gap G7** no longer lists wild-automorphism, whose argument is now complete at target level. Gap G11 says that only E3's cutoff comparison remains.
9. **Gap G3 and the P4 request** now name Mathlib's characteristic-free `Polynomial.exists_monic_and_natDegree_eq_and_norm_map_algebraMap_coeff_sub_lt` and `Polynomial.exists_roots_norm_sub_lt_of_norm_coeff_sub_lt`. With the spectral norm on a splitting field, these give the completion of a dense algebraically closed subfield in every characteristic. `IsAlgClosed.of_denseRange` needs `CharZero`, which I confirmed.
10. **Target crosswalk.** ECD Remark 18.2 has no part (b), so the locator now cites its second sentence. The 20.14 coefficient correction is PAPER-SCHOLZE-17/E57, not E1 (E1 is the 21.16 leading-term misprint).
11. **Glued digits** fixed in gaps G4 and G9, the A2 request and the restructure entry (for example "Question 21.4" and "DOI 10.1016").
12. **Imports** are now pinned by SHA-256 and node count. The acyclicity restructure entry now records that the assembly carried it out as a stable export.
13. Smaller items: analytic-dimension-bound takes the supremum over points of the source (not over "point presentations"), and wild-automorphism has a specific source match.

## Baseline

- **Confirmed at the pins and in the pinned index:**
  - `ProfiniteGrp.ProfiniteCompletion.completion` and `.denseRange`;
  - `UniformSpace.Completion.extension_coe` (needs uniform continuity and a T0 target) and `continuous_extension` (needs a complete target);
  - `TauCeti.QuotientGroup.instTotallyDisconnectedSpace` (compact totally disconnected group, closed normal subgroup);
  - `IsUltrametricDist.isClosed_ball`, `TauCeti.IsProP`;
  - `TauCeti.IsProP.isPGroup_range` (discrete target, no compactness);
  - `IsPGroup.orderOf_coprime`.
- **Added:** `TauCeti.exists_isProPSylow`, `TauCeti.IsProPSylow.not_dvd_index`, `TauCeti.IsProPSylow.isProP`, and the two Mathlib approximation lemmas above.
- **Removed:** none.

## Red-team finding RT-AREA-padic-1/11

Handled. C4 owns ECD §18. The accepted DiamondsAndVStacks package says that general canonical compactification belongs to this roadmap, and DiamondSixOperations consumes C4. No other packet plans §18. The RS-05 owner entry still names D5. The packet's restructure entry proposes the correction, which is the maintainer's to apply.

## Reader and suggested file

- **Reader.** It was regenerated from the corrected packet by script. Every one of the 186 declaration sections reproduces the effective statement, hypotheses, steps, acceptance, prerequisites, API names and test names. The contracts, gaps, crosswalk, library register and reference register were updated too.
- **Escaping.** The site renderer (`src/markdown.js`) opens emphasis at `_` after any non-ASCII letter and at ASCII `*`. In the submitted reader, 270 inline units lost characters this way, for example "λ_Y : Y_v" rendering as "λY : Yv". All `_` and `*` that could open emphasis are now escaped, and `[` where it would start a spurious link. A Python port of the renderer confirms that every unit renders to its intended text. Removing the escapes returns the unescaped file exactly.
- **Suggested file.** Unchanged, at 127 lines. It states three milestones and three examples over pinned carriers, and they are right: the compact closure, ECD 21.17, and pro-p of a faithful leading-term action. `lean-check` exits 0 with six proof-placeholder warnings. A `run_cmd` audit finds no placeholder inside any statement.

## Questions for the orchestrator

1. **Upstream copy.** The accepted package (`packages/DiamondEtaleCohomology`, TauCetiRoadmap PR #922) predates BP-DiamondEtaleCohomology and this review. It still cites SchemeKTheoryOperations:S.1, R02.1, ProfiniteProPGroups Layers 2–3 and the bare E3 contracts. It also lacks the two new lemmas. The fifteen refinement records and the 21 requests should be carried into the upstream README.
2. **Promotion.** `merge_blueprints` does not apply `nodeRefinements`, so promoting the three packets unchanged shows the unrefined part nodes. Either apply the records when the parts are next revised, or teach promotion to read them.
3. **Generic matches.** 265 of the 294 source entries of the accepted parts carry one of two generic match sentences ("States or proves the node at this locator…", 212; "The stated construction or proof route…", 53). PROTOCOL §5 wants each match to say what the place states. The reader prints only locators, so nothing displayed is wrong. A sources or attribution follow-up on the two parts could write the per-node matches.
4. **Maintainer edits.** The RS-05 owner entry for "Diamond canonical compactification geometry" should be corrected to DiamondEtaleCohomology:C4, as the packet proposes.
5. **Tier order.** AdicCoefficientsAndComparisons is tier 10, with an accepted package and TauCetiRoadmap PR #965. It cites DiamondEtaleCohomology C0, C2, C3 and C6 (tier 11) as prerequisites; `upstream/CaraianiNewton.md` counts 12 such upward citations. It cites them and does not restate them, so nothing here is duplicated and no notion has moved down. The upstream order still needs either DiamondEtaleCohomology to go first, or the two roadmaps bundled.
