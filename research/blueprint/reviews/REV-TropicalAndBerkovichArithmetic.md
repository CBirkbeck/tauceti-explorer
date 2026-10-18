# Independent review: Berkovich spaces, tropical curves and nonarchimedean arithmetic

**Accepted after corrections.** Job `REV-TropicalAndBerkovichArithmetic`, issue #525; reviewer Codex, session `codex-jCKYx2`; 18 October 2026. I did not write the blueprint being reviewed. This is the completed independent review of a target-level planning pass, not a claim that the planned mathematics has been formalized or that the listed proof gaps are closed.

The packet, full reader document and representative suggested Lean file were read. All 103 nodes were checked, including hypotheses, direct prerequisites, proof routes, sources, definition/construction APIs and discriminating tests. Source text was read at the cited locators, with corrections and unverified original proof inputs distinguished below. Results are stated in original words; no source passages were added to the repository.

| Inventory | Result |
|---|---:|
| Nodes | 103 |
| Definitions / constructions / lemmas / theorems / comparisons | 20 / 21 / 14 / 46 / 2 |
| Nodes corrected / verified / added / unverifiable | 25 / 78 / 0 / 0 |
| Planning API entries / discriminating tests | 192 / 131 |
| Planets | 43 |
| Baseline declarations confirmed / removed / replaced | 22 / 0 / 0 |
| Stages planned / closed | 8 / 0 |
| Explicit proof gaps / supplier requests retained | 22 / 11 |
| Source findings confirmed / rejected | 13 / 0 |

Every definition and construction has at least three discriminating tests. All stage targets are represented at the declared target granularity; smaller proof steps stay in their proof routes. The eight planned stages retain explicit remaining proof obligations. The status `complete` means one finished planning pass, as the protocol specifies; it does not mean all proof leaves are verified. Acceptance is justified because the corrected target contracts and source matches are sound and the uncompleted original arguments are identified rather than asserted as established.

## Corrections made

1. **Toric domination.** The previous proof tried to put the whole proper curve into an affine toric target. A positive-dimensional proper curve cannot have that closed embedding. Each rational function instead extends to a map from the smooth proper curve to P¹; its graph together with the existing embedding is closed in the product with (P¹)^n. Projection gives domination, and gcd-one slopes and point separation persist. BPR, *Nonarchimedean geometry, tropicalization, and metrics on curves*, §5.15, Lemma 5.17 and Theorems 5.20–5.21, pp. 24–26 support the quasiprojective existence formulation and arbitrary toric domination. The product remains toric for any given target, and quasiprojective when that target is quasiprojective. The proof also explains arbitrary equivariant domination via multiplicativity of expansion indices.
2. **Normal models and triangulations.** CDN Appendix A.2–A.3, pp. 52–53 supplies component points and an automorphism-extension criterion. Normality and flatness alone do not make those points a triangulation; semistability is added for that assertion. The node no longer credits CDN with a converse reconstruction theorem. Its locally finite gluing/reconstruction gap is stated accurately.
3. **Strong deformation.** There is no BPR Remark 3.9 at the cited place: Proposition 3.9 is connectedness. BPR §2.3, p. 4 and Lemma 3.8, p. 9 give the local discussion and continuous retraction; the latter leaves the vertex step as an exercise. Poineau–Turchetti Lemmas I.7.8–I.7.9, Propositions I.7.10–I.7.11, pp. 28–29 and the paragraph after Theorem II.2.20, p. 43 support the homotopy assertion. The infinitely many residue-direction continuity argument remains an explicit proof gap.
4. **Intersection owner.** The model-measure dependency and request now point to `SchemeAndStackFoundations:SF.5`, not SF.4. I read `first-chern`, `chern-projection`, `degree` and `arithmetic-surface-comparison`: the residue-field intersection operations are useful, but the last comparison has a regular arithmetic-surface/Dedekind-base range. The extension to possibly nonnoetherian rank-one models is still requested explicitly. SF.4 remains a formal-geometric supplier where appropriate.
5. **Tate metric normalization.** The metric multiplied by exp(−g) is specified to start with curvature δ₀. The direct calculation gives ddc g=ds/L−δ₀, so the resulting curvature is ds/L. The Bernoulli constant gives mean-zero graph potential; a chosen rigidification, rather than curvature alone, fixes the line-bundle metric constant. The formal-model-metric acceptance condition now consistently uses s^e=fσ in a frame of L^e.
6. **Tropical pushforward.** Replaced the mismatched BPR §8/Corollary 8.4 reference and nonexistent Appendix A reference by §7, Theorem 7.1 and Corollary 7.3, pp. 34–35 in the recorded v3. The target/image index remains [N′_τ:A(N_σ)]. The source-issue comparison now cites Sturmfels–Tevelev Theorem 1.1, formula (1.2), pp. 1–2 and Theorem 3.12, pp. 9–10, rather than its balancing Corollary 3.8.
7. **Analytic comparison proof leaf.** Zavyalov Remark A.6, p. 84 points to Huber (1996) Proposition 8.3.1, Remark 8.3.2 and Lemma 5.6.8(i), and Huber (1994) Proposition 4.5(iv). The former gap cited Huber Theorem 8.3.5, which is a sheaf comparison. The intended analytic-space equivalence remains unchanged and its original gluing proof is explicitly unverified.
8. **Other locators.** Berkovich Theorem 1.2.1 is pp. 13–15; Corollary 1.2.4 p. 15; Theorem 1.3.1 pp. 15–16; Proposition 1.3.5 and Corollary 1.3.6 p. 16. Temkin's affinoid-domain locators are pp. 14–16 and acyclicity/sheaf locators pp. 16–18. Poineau–Turchetti I.2.5 and I.2.11 are lemmas, I.2.9 a definition; I.5.6 is a corollary; I.6.14 a remark; I.7.4 a lemma, I.7.5 a remark, I.7.6 a definition; I.7.8–I.7.9 are lemmas; II.2.16 is a remark and II.2.22 a definition. Corrected the corresponding reader citations and log-modulus wording, and extended the base-change and initial-degeneration page ranges to cover their proofs.

Every correction above appears in the packet and reader document. No development was added to the compact suggested Lean file; its original statements and real-bodied light definitions match the reviewed TB.0 contracts and compile unchanged.

Four inherited introduction-only BPR citations now also locate the checked proof bodies: the curve multiplicity formula at Proposition 5.4, Theorem 5.8 and Corollary 5.9, pp. 21–23; the gcd formula at Remark 5.6, p. 22; faithful existence at Theorems 5.20–5.21, p. 26; and multiplicity-one isometry at Theorem 5.24 and Corollaries 5.25–5.28, pp. 27–28. Their source matches retain the exact original proof inputs still open. The existing annular inversion test now specifies T↦a/T and the image radii, so it detects E12 directly. No API entry or test was removed.

## Source mistakes and version checks

All nine inherited findings were independently rechecked and given explicit confirmed verdicts. E1–E2 distinguish topology from norm equivalence and use the correct MSpec evaluation ring. E3–E5 repair the BPR collar argument, neighborhood restriction and edge subdivision; E5 now describes the actual faulty step rather than suggesting metric invariance itself is false. E6 rejects arbitrary cross-energy positivity using ρ versus −ρ. E7 bounds kernel codimension. E8 corrects the lattice index. E9 retains the forward uniform-unit implication while adding the norm hypothesis to the converse; the weighted Laurent norm gives the counterexample. A fresh read of Kedlaya–Liu II Appendix A, pp. 189–191 found corrections to 2.4.11 and 2.8.1, not to 2.3.9.

Four additional findings are recorded, with their own confirmed review verdicts:

| Finding | Text and locator | Check and correction |
|---|---|---|
| E10 | Boucksom–Jonsson, Proposition A.4 proof, JEP 4 (2017), p. 136; preprint p. 45 | r^(−ord₀(f)) has the wrong sign. At f=t it violates domination by ||t||=r<1; use r^(ord₀(f)). Collated against the published version. |
| E11 | Poineau–Turchetti author preprint, Example I.2.20, p. 11 | Hahn coefficients are complex; rationality belongs to the exponents. The completion must contain the constant i. No assertion is made about the unread Springer chapter. |
| E12 | Same author preprint, Proposition I.4.14, p. 19 | The reversing case uses a₋₁, not a₁. The map T↦a/T otherwise produces zero target radii. Quantified radial variables are made consistent. Published chapter not collated. |
| E13 | Favre–Rivera-Letelier preprint, §4.2, pp. 24–25 | With positive outgoing-derivative atoms, the interior density is +g″. For g=s² on a unit segment, this gives total zero, whereas the printed negative sign gives −4. Source equation (20) agrees with packet ddc=−Δ. Published PDF request returned HTML; finding concerns the preprint only. |

The 2007 Favre–Rivera-Letelier corrigendum was read in full: it corrects quantitative Cauchy–Schwarz error bounds, not this local sign. Bibliographic pages, author pages, arXiv histories and title/errata searches are listed in each finding; no absence of a found correction is presented as proof that none exists. The packet adds hashes and version records for the BJ version of record, FRL corrigendum and KL II errata. The cleared Berkovich book was read in place. No restricted source file or passage was copied. The Baker–Rumely book was not used.

## Ownership, audit and requested red-team checks

I read the accepted AUDIT-39 review and its TB.0–TB.7 coverage, the relevant RS-25 ownership contracts, the current Tau Ceti source tree and the current TauCetiRoadmap main, including the roadmaps newer than the atlas snapshot. No generic analytic, graph or local-measure target here is already supplied by the libraries. Native multiplicative seminorms and generic topology are used directly. The existing rank-one generization in Tau Ceti is only part of the normalized Berkovich comparison, and existing Weil/Néron–Tate heights are not replanned.

The neighboring native AdicSpaces and AnalyticToricGeometry roadmaps were read in full. Exact supplier contracts were checked for the three AdicSpacesPartII nodes on acyclicity/formal geometry plus its analytification node, ColemanIntegration L0/L1, EffectiveDiophantineMethods ED.4, NeronModelsAndSemistableAbelianVarieties R11.3, and the relevant native AlgebraicCurves, EllipticCurves and StableReduction layers. The toric request extends the existing complex-base direction to the general K needed here; it does not replan cones, fans or toric gluing. The analytic Raynaud cross is requested because the existing R11.3 comparison is a DVR formal result.

- **RT-AREA-algebraicgeometry/24:** confirmed resolution. StableReduction Layers 7–9 do not establish analytic semistable reduction over an arbitrary rank-one valuation ring. TB.2 owns that extension and records its BL85 proof input honestly.
- **RT-AREA-algebraicgeometry/25:** confirmed resolution. StableReduction Layer 1 supplies the combinatorial dual graph and its arithmetic genus; Layer 2 supplies flat-family genus invariance. TB.2 adds thickness, metric realization and the analytic comparison, not another dual-graph theory.
- **RT-AREA-padic-1/10:** confirmed resolution. TB.0 owns Banach spectra and normalized rank-one Hausdorff quotients. DiamondsAndVStacks D5 consumes them and owns the v-sheaf extension; TB.0 has no diamond dependency.

## Pinned baseline

Each declaration below was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`. All 22 names exist at the recorded modules and supply the stated operation under the same or weaker hypotheses. No baseline citation was removed or replaced. Source-page corrections above are bibliographic corrections, not library-baseline substitutions.

| Declaration | Recorded module | Confirmed use |
|---|---|---|
| `mathlib:MulRingSeminorm` | `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean` | Native nonnegative additive seminorm and unital multiplicative map to the reals. |
| `mathlib:MulRingSeminorm.ext` | `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean` | Extensional equality of native multiplicative seminorms. |
| `mathlib:normRingSeminorm` | `Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean` | The submultiplicative ring seminorm supplied by the norm. |
| `mathlib:RingHom.IsBoundedWrt` | `Mathlib/Basic/Real/Basic.lean` | One positive uniform bound between specified real functions. |
| `mathlib:RingHom.IsBounded` | `Mathlib/Analysis/Normed/Ring/Basic.lean` | One positive uniform bound between source and target norms. |
| `mathlib:contraction_of_isPowMul_of_boundedWrt` | `Mathlib/Analysis/Normed/Unbundled/IsPowMulFaithful.lean` | Power-multiplicative bounded pullbacks are pointwise dominated by the source ring seminorm. |
| `mathlib:IsPowMul` | `Mathlib/Basic/Real/Basic.lean` | Power multiplicativity for positive natural powers. |
| `mathlib:map_pow` | `Mathlib/Algebra/Group/Hom/Defs.lean` | A multiplicative map preserves natural powers. |
| `mathlib:normHom` | `Mathlib/Analysis/Normed/Ring/Basic.lean` | The native multiplicative map supplied by a multiplicative norm and norm of one equal to one. |
| `mathlib:Topology.IsEmbedding` | `Mathlib/Topology/Defs/Induced.lean` | Induced topology together with injectivity. |
| `mathlib:Topology.IsInducing.continuous_iff` | `Mathlib/Topology/Maps/Basic.lean` | Continuity into an induced topology is tested after the inducing map. |
| `mathlib:continuous_pi` | `Mathlib/Topology/Constructions.lean` | Coordinatewise continuity gives continuity into a product. |
| `mathlib:continuous_apply` | `Mathlib/Topology/Constructions.lean` | Each coordinate evaluation is continuous for the product topology. |
| `mathlib:isClosed_iInter` | `Mathlib/Topology/Basic.lean` | Arbitrary intersections of closed sets are closed. |
| `mathlib:isClosed_eq` | `Mathlib/Topology/Separation/Hausdorff.lean` | An equality of continuous real functions cuts out a closed set. |
| `mathlib:isClosed_le` | `Mathlib/Topology/Order/OrderClosed.lean` | An inequality of continuous real functions cuts out a closed set. |
| `mathlib:isCompact_pi_infinite` | `Mathlib/Topology/Compactness/Compact.lean` | Tychonoff compactness for a product of compact subsets. |
| `mathlib:CompactIccSpace` | `Mathlib/Topology/Order/Compact.lean` | Native compactness of closed intervals, including real intervals. |
| `mathlib:IsCompact.of_isClosed_subset` | `Mathlib/Topology/Compactness/Compact.lean` | A closed subset of a compact set is compact. |
| `mathlib:Topology.IsEmbedding.isCompact_iff` | `Mathlib/Topology/Compactness/Compact.lean` | An embedding reflects compactness from its image. |
| `mathlib:Topology.IsEmbedding.t2Space` | `Mathlib/Topology/Separation/Hausdorff.lean` | An embedding into a Hausdorff space has a Hausdorff domain. |
| `mathlib:Pi.t2Space` | `Mathlib/Topology/Separation/Hausdorff.lean` | Products of Hausdorff spaces are Hausdorff. |

## Per-node ledger

The machine-readable counterpart is the packet's `review.checked` list. A verified target may depend on an explicitly listed, unverified original proof input; its verdict concerns the correctness and honesty of its planning contract, not a claim to have closed that proof gap.

| Node suffix | Verdict | Independent check |
|---|---|---|
| `TB.0/spectrum` | verified | Native MulRingSeminorm carrier, norm-sensitive bound and the zero-ring test agree with Temkin 2.2.2.1; no completeness is needed for the definition. |
| `TB.0/bounded-iff-dominated` | verified | The pinned contraction_of_isPowMul_of_boundedWrt applies to the multiplicative pullback. Positive-power bounds remove the uniform constant. |
| `TB.0/evaluation-topology` | verified | The initial topology uses every ring element. The coordinate continuity, universal property and all three discriminating tests fit this topology. |
| `TB.0/evaluation-embedding` | verified | Extensionality supplies injectivity; the induced topology supplies the embedding. The pinned embedding and continuity declarations have the required directions. |
| `TB.0/evaluation-range` | verified | Nonnegativity, unitality, multiplicativity, triangle inequalities and domination characterize the image; the zero-ring contradiction is retained. |
| `TB.0/closed-evaluation-range` | verified | Each defining coordinate equation/inequality is closed in the product of real intervals, using the cited pinned closed-set lemmas. |
| `TB.0/compact-spectrum` | verified | Tychonoff plus the closed image proves compactness without completeness or a field; nonemptiness remains a separate target. |
| `TB.0/hausdorff-spectrum` | verified | Different seminorms differ on a coordinate, and the real product is Hausdorff. The cited embedding theorem transfers separation. |
| `TB.0/comap` | verified | Composition with a bounded ring map gives a bounded seminorm, then domination by the power trick. Evaluation proves continuity and contravariant composition. |
| `TB.0/field-norm-point` | verified | The multiplicative field norm gives a real point; inverse evaluation and scalar tests distinguish it from evaluation at zero. |
| `TB.0/field-spectrum-singleton` | verified | Domination at a and a⁻¹ forces equality with the given norm, including trivial and archimedean field norms. |
| `TB.0/banach-ring-category` | verified | Scholze Definitions 2.1–2.2 and Proposition 2.4 distinguish contractive colimits from bounded affinoid maps; the ℓ¹/projective seminorm and separated completion are retained. |
| `TB.0/nonempty-spectrum` | corrected | Corrected Berkovich Theorem 1.2.1 locator to pp. 13–15; its existence proof and Scholze Theorem 2.14 support exactly the nonzero complete unital range. |
| `TB.0/unit-and-spectral-radius` | corrected | Corrected the printed-page locators to Corollary 1.2.4 p. 15 and Theorem 1.3.1 pp. 15–16; nilpotents and the product-ring spectral maximum have the right interpretation. |
| `TB.0/completed-residue-fields` | corrected | Corrected I.2.5 from Proposition to Lemma. Prime kernel, fraction-field valuation and completion give the point field and its universal evaluation map. |
| `TB.0/spectral-base-change` | corrected | Corrected Poineau declaration kinds/pages and Berkovich printed pages. Valued amalgamation gives surjectivity; normal/Galois quotients and purely inseparable homeomorphisms retain their hypotheses. |
| `TB.0/contractive-colimits` | verified | Scholze Proposition 3.2 gives surjectivity for pushouts and a homeomorphism for filtered colimits. No unwarranted pushout homeomorphism is asserted. |
| `TB.0/affinoid-algebras` | verified | Weighted Tate quotients, strictness and completed scalar extension match Temkin §3.1; the radius and nonstrict examples detect dropping the norm data. |
| `TB.0/affinoid-domains` | corrected | Corrected Temkin pages to 14–16. Rational inequalities have the no-common-zero condition, and the universal domain property is separate from a chosen rational presentation. |
| `TB.0/analytic-sheaf` | corrected | Corrected Temkin pages to 16–18. The strict module Čech input is imported exactly; nonstrict strictification/descent remains explicitly open. |
| `TB.0/analytic-spaces` | verified | Temkin §4.1 supplies nets and affinoid atlases rather than an ordinary-open affinoid cover. Gluing, chart changes and morphism locality are covered by the API/tests. |
| `TB.0/analytification` | verified | Scheme charts, nonarchimedean analytification and proper GAGA are separated from the mixed Banach-ring hybrid construction; the comparison proof leaf remains explicit. |
| `TB.0/adic-rank-one-retraction` | verified | KL 2.4.1/2.4.4/2.4.6/2.4.8 support the full pair (A,A⁺) under a uniform unit. Native Spa is imported; neither diamonds nor the false characteristic-p converse is used. |
| `TB.0/hausdorff-localizations` | verified | KL Definitions 2.4.8/2.4.12 and Lemma 2.4.17 support the rational encircling/localization claims under the uniform-unit hypotheses. |
| `TB.0/global-adic-comparison` | verified | Zavyalov A.5–A.8 and A.11 support Hausdorff strict Berkovich versus taut adic spaces and the stated one-direction morphism comparisons. Corrected the separate Huber proof-gap reference; no false general étale equivalence is introduced. |
| `TB.0/real-quotient` | verified | KL 8.2.11–8.2.14 distinguish the real quotient, partially proper opens and tautness. The doubled-disc example prevents extending the Hausdorff conclusion without its hypotheses. |
| `TB.0/hybrid-analytic-space` | verified | Boucksom–Jonsson 4.9/4.12 and Appendix A support the analytic hybrid topology. The t-norm test already detects new E10; SNC inverse limits and dynamical convergence remain separate open inputs. |
| `TB.0/gelfand-representation` | verified | Scholze 2.19–2.21 give the uniform isometric transform; Berkovich Corollary 1.3.2 identifies the spectral zero ideal. No surjectivity onto arbitrary continuous sections is claimed. |
| `TB.0/idempotents-and-clopens` | verified | Scholze Theorem 2.18 uses overconvergent Laurent descent and Newton lifting. The packet explicitly records that nonroutine proof leaf and does not assume an ordinary sheaf for every Banach ring. |
| `TB.0/gelfand-mazur` | verified | Scholze Theorem 2.12 keeps the archimedean exponent range and nonarchimedean alternative. The statement is norm-sensitive, not merely a topological classification. |
| `TB.0/connected-analytification` | corrected | Corrected I.6.12/I.6.14 kinds. Proper GAGA plus H⁰=K excludes idempotents; classical endpoints are removed by the path argument, with the algebraic scalar-function input requested explicitly. |
| `TB.0/uniform-unit-hierarchy` | verified | Uniform-unit, Tate and uniform-norm hypotheses are distinct. The E9 corrected converse is used only with its added norm control; the weighted-norm counterexample remains a discriminating test. |
| `TB.0/residue-field-surjectivity` | verified | KL 2.3.12/2.3.14 and 2.4.17(c) give finite-cokernel detection, faithful finite étale surjectivity and openness; these are not asserted for arbitrary scalar maps. |
| `TB.1/gauss-line-and-discs` | verified | Poineau §§I.1/I.3 give the Gauss formula and equality of discs with different centers. Radius zero and the nonclassical Gauss-point tests distinguish evaluation from a disc norm. |
| `TB.1/four-point-types` | corrected | Corrected definition/lemma/proposition kinds and recorded the complex Hahn-coefficient correction E11. Type III, type IV and nonspherical completeness hypotheses remain distinct. |
| `TB.1/tree-hyperbolic-metric` | corrected | Corrected the log-modulus wording and page range through p. 31. Classical endpoints are at infinite distance, and the finite path metric is not the compact analytic topology. |
| `TB.1/annular-skeleton` | corrected | Corrected Poineau lemma/proposition kinds; the inverse-coordinate test and logarithmic length are sound. Explicit local homotopies do not close the separate global vertex-continuity gap. |
| `TB.1/annular-integral-slopes` | verified | BPR Propositions 2.4–2.5 and Theorem 5.15 match Laurent minima in s=−log|T|, integral slopes and puncture orders. The KRZB Laurent formula has the same sign. |
| `TB.1/virtual-annuli-descent` | corrected | Corrected I.7.4/I.7.5/I.7.6 kinds. The component-count modulus convention and end-swap condition are not identified with the length of one geometric component; noncompact descent remains a proof leaf. |
| `TB.2/semistable-vertex-sets-and-skeleta` | verified | BPR Definition 3.1 uses finite type-II sets with disc/annulus complement in the split algebraic setting; analytic semistable existence is a separate prerequisite. |
| `TB.2/skeleton` | verified | BPR Definitions 3.3/3.5 glue vertices and annular axes. Completion, puncture endpoints and complement-ball tests prevent using the entire analytic curve as the graph carrier. |
| `TB.2/component-limit-boundary` | verified | BPR Lemma 3.2 was checked with E3. Boundary points arise from the corrected collar limit, rather than an incorrectly typed interval condition on the curve coordinate. |
| `TB.2/skeleton-complement-balls` | verified | BPR Lemma 3.4(3) gives complementary generalized balls with one boundary point; puncture balls and marked rays follow the specified completion convention. |
| `TB.2/completed-skeleton-boundary` | verified | BPR Lemma 3.4(1)–(2) and Definition 3.5 support the skeleton closure and finite boundary; classical punctures are not finite-length vertices. |
| `TB.2/skeleton-disc-characterization` | verified | The connected-neighborhood condition is used inside the complement of V, with E4 applied. This gives the correct local disc characterization. |
| `TB.2/retraction-to-the-skeleton` | verified | BPR Definition 3.7 gives the unique ball-boundary projection and annular radius projection; the type of the set map is separate from continuity. |
| `TB.2/continuous-retraction` | verified | BPR Lemma 3.8 supports retraction continuity but leaves the vertex step as an exercise. The packet honestly records that proof input rather than treating componentwise continuity as sufficient. |
| `TB.2/connected-skeleton` | verified | BPR Proposition 3.9 and connectedness of the analytic curve give connectedness of the retraction image; the empty-vertex exceptional cases are retained. |
| `TB.2/stable-reduction-and-minimal-skeleta` | verified | BPR Theorems 4.22/4.24 combine the separately owned rank-one existence, contractions and stable/minimal refinements. Native StableReduction Layers 7–9 are only the DVR compatibility input. |
| `TB.2/intrinsic-minimal-skeleton` | verified | Positive-genus points and non-disc points determine the minimal core with the listed exceptional rational cases. Genus-zero contractions remain an explicit nonnoetherian proof input. |
| `TB.2/stable-vertex-characterization` | verified | BPR §4 and Corollary 4.23 give the valency/genus criterion in the hyperbolic range; loops count twice and marked punctures contribute to valency. |
| `TB.2/unique-minimal-skeleton` | verified | The intrinsic-core characterization and common refinement give uniqueness of the subset with its metric, not uniqueness of every possible vertex subdivision. |
| `TB.2/unique-stable-vertex-set` | verified | The hyperbolic inequality and stable valency/genus criterion remove the exceptional nonunique genus-zero or unmarked genus-one vertex choices. |
| `TB.2/rank-one-semistable-reduction` | verified | BPR Theorem 4.22 and Poineau II.2.20 locate the nonnoetherian BL85 input. The original proof is explicitly open; a DVR theorem is not substituted for it. |
| `TB.2/formal-model-skeleton` | verified | BPR Theorem 4.11 gives the formal-model correspondence and uv=a length. The combinatorial dual graph is imported from native StableReduction Layer 1 rather than defined again. |
| `TB.2/vertex-genus-and-genus-formula` | corrected | Corrected II.2.16/II.2.22 declaration kinds. StableReduction supplies the combinatorial genus and flat-family genus invariance; the added result is their analytic metric realization. |
| `TB.2/refinement-and-field-extension` | verified | BPR Proposition 3.13 and corrected §5.3 show subdivision with additive lengths. Isometric scalar extension is distinguished from renormalizing a discrete valuation by ramification degree. |
| `TB.2/marked-extended-skeleton` | verified | Punctures add infinite rays while the classical endpoint lies only in the topological completion. Annular coordinates and the separate vertex-continuity input give the intended marked retraction. |
| `TB.2/noncompact-triangulations` | verified | CDN Appendix A.2 uses locally finite triangulations and nonsplit type-II/III points. The packet does not replace them by a single proper finite model; locally finite reconstruction remains an explicit gap. |
| `TB.2/triangulated-formal-automorphisms` | corrected | Corrected the false claim that every normal flat model supplies a triangulation: semistability is required. CDN gives a component-point set and automorphism criterion, not a converse reconstruction theorem. |
| `TB.2/skeletal-strong-deformation` | corrected | Removed nonexistent BPR Remark 3.9; cited §2.3 and Lemma 3.8 only for their actual claims, with Poineau I.7.8–11 and the paragraph after II.2.20 for homotopies. Vertex gluing remains open. |
| `TB.2/genus-zero-contractions` | verified | BPR Proposition 4.21 contracts only the permitted unmarked rational tails/bridges. Puncture exclusions and thickness addition remain explicit, with BL85 Lemma 6.1 as the nonnoetherian proof input. |
| `TB.3/metric-graphs` | verified | Finite positive-length models allow loops and multiple edges; graph points and subdivision are intrinsic. Vertex genera are retained separately from b₁. |
| `TB.3/graph-divisors` | verified | Divisors range over every graph point; outgoing integral slopes define principal divisors. Rank, effectiveness and the canonical divisor agree with Gathmann–Kerber §1. |
| `TB.3/graph-laplacian` | verified | The packet consistently uses negative outgoing slopes and −f″ds. Endpoint atoms restore total mass zero, while ddc is the opposite operator. |
| `TB.3/graph-jacobian` | verified | Baker–Faber §3 and Baker–Rabinoff 2.7/2.8 give the harmonic period lattice and Pic⁰ comparison. The finite-model exact sequences remain a named proof input; bridge contraction tests are meaningful. |
| `TB.3/graph-riemann-roch` | verified | Gathmann–Kerber Theorem 1.2 and §§2–3 supply rational approximation for real edge lengths. The graph rank and canonical degree are used with all-point divisors. |
| `TB.3/divisor-specialization` | verified | Baker §2 supplies the DVR case; Amini–Baker §4.3 supplies arbitrary complete algebraically closed rank-one specialization. Retraction and residue-curve points are kept distinct. |
| `TB.3/slope-formula` | verified | BPR Theorem 5.15 and Amini–Baker Theorem 4.5 have opposite log conventions, which the packet explicitly converts. Δ(−log|f|)=τ_*div(f) has the checked sign. |
| `TB.3/metrized-complexes` | verified | Amini–Baker §1 gives residue curves with distinct half-edge marks and both graph and curve terms in principal divisors. Bare graph rank is not substituted for the complex rank. |
| `TB.3/metrized-complex-riemann-roch` | verified | Amini–Baker Theorems 3.2/3.7 give genus and Riemann–Roch. The reduced-divisor proof is explicitly open, rather than hidden behind the theorem label. |
| `TB.3/specialization-rank-inequality` | verified | Amini–Baker Theorems 4.5–4.6 preserve principal specialization and give rank ≥ algebraic rank over the stated field. Baker Lemma 2.8 is only its compatible DVR specialization. |
| `TB.3/metrized-complex-rank-determining` | verified | Appendix A Theorem A.1 was checked through the final induction. Any g_v+1 residue points suffice on a loopless model; no false genericity hypothesis is imposed. |
| `TB.4/tropical-multiplicity-formula` | corrected | BPR Theorem 1.3 and proof Theorem 5.8/Corollary 5.9 support summing expansion factors over lifts. The separate reduction-degree/finite-map proof input remains explicit. |
| `TB.4/expansion-factor-gcd` | corrected | The lattice index of the primitive slope tuple is its positive gcd, as in BPR Remark 5.6; this is not the Euclidean speed of the coordinate tuple. |
| `TB.4/torus-tropicalization` | verified | Gubler §§2–3 support valuation-invariant seminorm tropicalization and support under extension. Classical-point closure retains its algebraically closed nontrivial extension hypotheses. |
| `TB.4/initial-degenerations` | corrected | Extended the BPR locator through p. 18. Gubler §§5–6 and BPR §4 distinguish tilted models, translations after extension, initial lengths and the nonnoetherian finiteness cautions. |
| `TB.4/fundamental-polyhedral-theorem` | verified | Gubler Theorems 3.3/5.6/10.14 and Proposition 10.15 give support, purity, finite subdivisions and local stars. The valued Gröbner proof remains an explicit leaf. |
| `TB.4/weighted-tropical-cycles` | verified | Generic component lengths, inseparable residue degrees and subdivision compatibility match Gubler §13. Trivial-valuation balancing is not silently promoted to the arbitrary-valued proof. |
| `TB.4/cycle-pushforward` | corrected | Replaced wrong BPR §8/Corollary 8.4 by §7/Theorem 7.1/Corollary 7.3, pp. 34–35. The target/image lattice index and contracted-cell rule pass the power-map check. |
| `TB.4/relative-tropical-multiplicity` | verified | BPR 4.21–4.24 and Theorem 5.8 identify Shilov-point multiplicity, initial generic length and edge expansion. The finite-map reduction argument remains a separately recorded proof leaf. |
| `TB.5/faithful-tropicalization-and-expansion-factors` | corrected | BPR Theorems 5.20–5.21 prove the finite-graph endpoint from separating unit-slope coordinates. The formal lifting and Runge inputs are explicitly open; all metric assertions use intrinsic graph length. |
| `TB.5/faithful-domination` | corrected | Replaced the impossible proper-curve embedding into an affine toric target by the graph in a product with (P¹)^n. Corrected the proof locator to BPR §5.15/5.17/5.20–5.21 and explained both cofinality and arbitrary domination. |
| `TB.5/multiplicity-one-isometry` | corrected | BPR Theorem 5.24 and Corollaries 5.25–5.28 give unique lift and unit expansion on the stated multiplicity-one locus. The connected smooth curve and edge hypotheses are retained. |
| `TB.5/faithful-embedding-predicate` | verified | BPR §5.15–5.17 separates injectivity from expansion one and uses intrinsic image metrics. The triangle/gcd tests distinguish all parts of faithfulness. |
| `TB.5/unit-slope-separating-functions` | verified | BPR Lemmas 5.18–5.19 and Theorem 5.20 require more than algebraic Riemann–Roch. Residue lifting and annular Runge approximation have exact, named proof leaves. |
| `TB.5/puncture-ray-faithfulness` | verified | BPR Theorem 5.22 uses coprime pole orders and a faithful finite core to control every marked infinite tail. A finite compact-subgraph argument alone would not suffice. |
| `TB.6/formal-model-metrics` | corrected | Corrected the acceptance wording to ||s||^e=|f| for s^e=fσ. The formal frame belongs to L^e; transition units, tensor operations and the exponent tests give the right metric. |
| `TB.6/model-measures` | corrected | Moved the intersection owner from SF.4 to SF.5 and read its Chern/projection/degree contracts. The nonnoetherian model specialization remains a requested extension, with component multiplicities and tensor exponents retained. |
| `TB.6/semipositive-integrable-metrics` | verified | Chambert–Loir §2 distinguishes semipositive uniform limits from differences of such metrics. Tensor/dual operations and positivity tests respect the distinction. |
| `TB.6/measure-limits-and-local-heights` | verified | Chambert–Loir §2.7 supplies weak limits and local heights with the countable-density hypothesis retained. The stronger Radon existence problem is recorded as a gap; no global adelic height theory is duplicated. |
| `TB.6/hsia-potentials-and-energy` | corrected | Confirmed E6 and added E13; explicitly matched source Δ to packet ddc=−Δ. Positivity is for mass-zero self-energy with continuous potential, and finite nonclassical diagonal terms are retained. |
| `TB.6/graph-green-and-admissible-measure` | verified | Yuan Appendix A.5 is unit-edge normalized; the arbitrary-length resistance formula has correct bridge and loop limits. Its Green-kernel/resistance derivation remains an explicit proof leaf. |
| `TB.6/model-metric-laplacian` | verified | Yuan A.4 gives curvature change by ddc f=−Δf; rescaling edge coordinates rescales the potential compatibly. Degree and endpoint atoms agree with the adopted sign. |
| `TB.6/good-reduction-and-tate-measures` | corrected | Specified reference curvature δ₀ before multiplying by exp(−g), separated mean-zero Bernoulli normalization from metric rigidification, and retained normalized circle measure ds/L. |
| `TB.6/model-pl-approximation` | verified | Yuan A.4 uses rational model subdivisions; the packet explicitly requires weak Laplacian convergence with variation control for the C² passage. Uniform convergence alone is not presented as enough. |
| `TB.7/tate-analytic-quotient` | verified | The native algebraic Tate curve is imported; Poineau II.4 and Chambert–Loir supply the analytic quotient and circle calibration. Natural-log length is −log|q|. |
| `TB.7/schottky-data` | verified | Poineau II.3.1/II.3.6 define disc pairs, free generators and a fundamental domain. Disjointness, strict contraction and all three tests exclude arbitrary PGL₂ tuples. |
| `TB.7/mumford-uniformization` | verified | Poineau II.3.18–II.3.19 and II.4 supply the discontinuity domain, proper analytic quotient and Mumford correspondence. The converse Schottky construction proof remains explicitly open. |
| `TB.7/analytic-jacobian-periods` | verified | Baker–Rabinoff §§2/6/7 supply the pairing identification; R11.3 is precisely requested for the non-DVR analytic Raynaud cross, rather than misused as if it already contained it. |
| `TB.7/berkovich-coleman-path-integral` | verified | KRZB Definitions 3.1/3.3/3.5 and the survey §§4.2–4.3 match branch-fixed homotopy classes and annular primitives. Good-reduction Coleman integration is imported, while global gluing is a proof leaf. |
| `TB.7/annular-residues-and-periods` | verified | KRZB §2.6 and §3 give oriented residues, harmonic graph cochains and periods. Local Coleman residue interfaces do not alone establish the global monodromy comparison, which stays explicit. |
| `TB.7/bc-abelian-tropical-correction` | verified | KRZB Proposition 3.16 and Propositions 3.28–3.29 give the tropical correction under the requested Raynaud cross. Cp coefficients and v_p(p)=1 are distinct from real natural-log graph energies; E7 fixes the final codimension estimate. |

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/TropicalAndBerkovichArithmetic.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/TropicalAndBerkovichArithmetic.lean`: exit 0 at pinned Mathlib 082e2d3; thirteen expected `sorry` warnings and no other warnings. Available memory was checked first; no language server or Lake build/update was started.
- JSON/node-ledger, reader synchronization, deliverable-path and whitespace checks are recorded in the submission handoff.
- The source-issue schema and source-version checks also pass. The standalone errata-job validator requires an `errata-v1` file; its reusable finding/version checks were applied to this blueprint without changing the blueprint protocol.

**For the orchestrator:** route the corrected intersection request to SF.5, retaining its rank-one/nonnoetherian extension scope. No ownership move downward and no new roadmap are proposed. The existing 22 named proof gaps and 11 exact supplier requests remain the packaging/formalization worklist; they are not grounds to mislabel any stage closed. Published-version collation remains open for the explicitly preprint-scoped findings. No other question blocks acceptance.
