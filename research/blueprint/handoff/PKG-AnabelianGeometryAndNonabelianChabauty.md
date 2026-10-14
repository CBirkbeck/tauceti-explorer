# PKG-AnabelianGeometryAndNonabelianChabauty

Complete package for issue #9768. Author: Codex, session `codex-S7nqPM`, 2026-10-14. Claim confirmed by the bot at [comment 6172386729](https://github.com/CBirkbeck/tauceti-explorer/issues/9768#issuecomment-6172386729). This is the author's validation and handoff, not an independent package-review verdict.

## Delivered

The package has an upstream-shaped reader, a compact representative Lean file, and `topic = "math.NT"`. The reader retains all 535 accepted target identities from the root and seven part packets, all 650 API entries (643 distinct names), 465 named tests and 836 acceptance checks. It adds 28 explicitly sourced construction targets to close local dependencies and replace upward or unsuitable suppliers. The tables below map every accepted target and every addition to the reader. No packet, assembled reader, assembled suggested file, atlas data or neighbouring roadmap was edited.

The dependency order is continuous nonabelian cohomology (Layer 0), finite-cover geometry (1), unipotent realizations (2), reconstruction (3), Selmer geometry (4), Albanese and finiteness (5), quadratic heights (6), and the conjectural frontier (7). The abstract NC.3 core precedes the geometric paths it classifies. The two-step Malcev construction precedes reconstruction. The 563-target local prerequisite graph is acyclic, has no upward layer edge, and orders every exact local supplier before its consumer. Original node identities survive as anchors; there are no removed-target stubs or target-numbering tables in the reader.

`Suggested.lean` was written directly as a short file, not cut down from the assembled development. It has 519 lines: 17 real-bodied light definitions, two structures over native carriers, 17 theorem signatures and 38 examples. It imports Mathlib only. It introduces no site, completed path algebra, comparison functor or represented Selmer scheme through admitted data. Heavy reader definitions are listed in its closing comment. Theorems and examples use `sorry`; none of the data does.

## Validation

- `lean-check research/blueprint/packages/AnabelianGeometryAndNonabelianChabauty/Suggested.lean`: exit 0; 55 warnings, all exactly `declaration uses sorry`, no errors or other warnings. Compilation used the shared pinned build, after checking available memory. No language server, build, update or cache command was run.
- `python3 scripts/check_blueprint.py` on the root and all seven NC.0–NC.6 packets: eight reports with zero errors and zero warnings. The declaration index was available through the supplied `TAUCETI_BASELINE`; these were not form-only checks.
- Target/API/test/definition-check counts, distinct anchors, local prerequisite order, internal links, and names of every kept Lean definition, structure and theorem were checked mechanically against the reader. No missing item or internal link was found. All 27 accepted definition nodes retain at least three discriminating checks. The additions also have at least three checks each.
- `python3 scripts/check_sorry_data.py` on the package Lean file: exit 0.
- `python3 research/blueprint/intake.py check-files` on the four deliverable paths: zero problems.
- `git diff --check`: clean. Only the four issue-authorized paths are submitted.

The pin audit used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only upstream roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ProfiniteArithmetic and PeripheralActions were read in full, including their suggested files. Relevant native declarations and neighbouring supplier statements were inspected by mathematical structure, not solely by names. Named Haiku/Sonnet tools were unavailable in this Codex session; retrieval and mechanical cross-checks were performed directly. Independent review remains a separate worker's job.

## Ownership and prerequisite routing

The package is in tier 16 of the Caraiani–Newton order. Dependencies are native Mathlib/Tau Ceti, current Tau Ceti roadmaps, earlier local targets, or the named lower-tier supplier interfaces. Exact contracts distinguish the contents already supplied from the refinements their owners must add before upstream export. A general owner is not silently assumed to contain a stronger curve-specific comparison.

| Former supplier or overlap | Owner used here and required downstream routing |
| --- | --- |
| FoundationsAndLibraryIntegration and UPSTREAM bookkeeping | Native declarations or the actual TauCetiRoadmap item. Class-field inputs are ClassFieldTheory; finite-cover and action APIs are native Mathlib/Tau Ceti. No bookkeeping identifier remains in the reader. |
| Current all-degree abelian finite-quotient cohomology | Imported from `TauCeti.ContCohomology.continuousFiniteQuotientColimit` and `exists_continuousFiniteQuotientComparisonApp_eq`, with `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero` and `subsingleton_continuousCohomology_succ_of_subsingleton`; owner ProfiniteCohomology Layer 10. The retained targets concern nonabelian cocycles, gauge witnesses and same-subgroup reflection. The open subgroup supplied for class killing is not advertised as normal without a separate core argument. |
| Continuous Aut/Out and generic peripheral powers | Imported from current ProfiniteArithmetic and PeripheralActions. Local `centre-free-extension-pullback` supplies the additional pullback isomorphism; Chen good/symmetric paths retain their geometric normalization clauses. No generic Aut/Out or peripheral-power theory is replanned. |
| Fixed-Hopf Tannaka reconstruction | Imported from `TauCeti.Tannaka.fgPointTensorIsoEquiv`. The new Layer 2 target starts from an arbitrary neutral tensor category and constructs its Hopf algebra, rather than accepting one. MotivesAndAlgebraicCycles MC.3/MC.6 should import this reconstruction and its tensor-isomorphism torsors. |
| EffectiveDiophantineMethods ED.4, tier 17 | Local abelian logarithm, Coleman comparison, Mordell–Weil logarithmic span, annihilators, Strassmann and compact residue-chart bounds move to Layer 5 here. ED.4 must import these targets. |
| QSeriesPartitionsAndMockModularForms QM.6 | The free-Lie/Witt character calculation moves to Layer 7 here; QM.6 imports it. |
| ArithmeticKTheory N.5 | The rational Tate/Soulé cohomology comparison needed here moves to Layer 7; N.5 imports it. Its odd Tate degree begins at 3, not 1. |
| MotivesAndAlgebraicCycles MC.0 | Rational cycles, Chern classes, intersection and push-pull use SchemeAndStackFoundations SF.5. No general motives input is required. |
| StableReductionPartII moduli clauses | SF.4 supplies stable pointed stacks, versal node-smoothing and level covers. The smooth fine locus is a scheme; the normal extension at the boundary is an algebraic space. Stable models themselves remain with TauCetiRoadmap.StableReduction. |
| JacobianChallengePartII Picard torsors/obstruction | SF.3 supplies fixed-degree Picard torsors and the Brauer obstruction to an actual line bundle. Jacobian differential and rational Kummer comparison is constructed locally in Layer 2. |
| FunctionFieldArithmetic reciprocity/existence | ArithmeticGaloisDuality R02.3.2 supplies global function-field class formation and the prime-to-characteristic local variant. Mixed-characteristic local duality is ClassFieldTheory. This does not promise full equal-characteristic p-primary local existence. |
| PadicHodgeRegulators L1 / MotivicEtaleKTheory M.8 | SelmerIwasawaCohomology L2/L4 supplies rational finite conditions; EtaleDualityAndPerverseSheaves EDC.3 supplies finite étale Chern classes and product/regulator classes. |
| Mochizuki completed integral comparison | Extend PadicHodgeTheory R06.2 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 with the stated relative logarithmic integral comparison and bounds uniform in cover depth and point. The rational Cₚ comparison alone is insufficient. This is an owner extension, not a claim that current R07.1 already proves the bound. |
| Pointed and ramified comparisons | CP.2/CP.3 supply the enhanced multiplicative cochain comparison with both endpoint augmentations; Layer 2 constructs its nonlinear path consequence, ramified-field enhancement and integral tangential specialization. |
| Non-normal right homogeneous quotient | ReductiveGroups Layers 3/5 and RG2.0a need the stated split-unipotent refinement: represented U/H for a closed split unipotent H, and all-algebra point-surjectivity by affine vector-torsor induction. A normal group quotient does not supply this. |
| Proper-curve Coleman charts | ColemanIntegration L1 extends affine charts to a finite integral-point cover using an auxiliary finite étale divisor of possibly higher degree. Layer 5 supplies the compact analytic and density consequences. The auxiliary divisor need not be a second rational residue disc. |
| Shared mixed-extension heights | Route the complete contract to **SelmerIwasawaCohomology, Part II / SelmerComplexesAndPadicHeights, issue #3430**, the shared height direction. Current Selmer L0/L2/L4 supplies Kummer and local conditions, not heights. Required additions are rigidified mixed-extension classification and π₁/π₂, crystalline realization, local and global heights, global sum, potentially-unramified vanishing, equivariance and change-of-splitting/character. Layer 6 here owns curve-specific depth-two quotients, relative-cycle realization and the quadratic equations. Confirm this supplier extension before exporting the dependency bundle upstream; do not retitle the current L4 as a height theorem. |

## Mathematics and generality audit

Every accepted target, definition, test, hypothesis and proof outline was read, and the compact Lean signatures were separately checked for mathematical truth. Compilation is only an elaboration check. The reader preserves the assembly's substantive source corrections; local changes also repair missing prerequisites and the topology/closure statements described below. No conjecture is represented as a theorem.

| Statements or conventions | Instances and outcome |
| --- | --- |
| Ordered cocycle, gauge and positive central defect | S₃ transpositions distinguish multiplication order. The least-residue lift C₃→C₉ has positive defect 3 at (2,1), while its inverse has value 6. The trivial source has one H¹ class. Gauge replacement of a right torsor is by the inverse gauge parameter. |
| Source display of gauge in Kim's published survey, p. 642 | With G=U=S₃, inner action, c(g)=g⁻¹, a=(01), x=(01), y=(12), the displayed reversed expression d(g)=g(a⁻¹)c(g)a gives d(xy)=1 but d(x)x(d(y))=yx≠1. The reader and Lean add this negative control and use the correct right-torsor formula. This is a source-consistency finding for independent verification; no claim is made that an exhaustive erratum search establishes novelty. |
| Central lifting / coefficient injection | A quotient cocycle lifts exactly on the zero H² obstruction locus, not everywhere. Invariant lifts are needed on every coefficient algebra. H¹ injectivity through a coefficient map requires the appropriate invariant quotient condition after every inner twist. |
| Topological torsors | Nonempty genuine torsors, continuous semilinear action and homeomorphic translation are required. An arbitrary set with an action or an assumed geometric torsor carrier is not used. |
| Final-coordinate topology for arbitrary coefficient algebras | Each finite coordinate power has its own final topology. Compact images have finite-dimensional span: an infinite linearly independent subset would be closed and discrete, since it meets every finite-dimensional subspace in a finite set, contradicting compactness. This argument does not replace arbitrary compactness by sequential compactness. Polynomial operations are continuous on compact cochains after enlarging their finite coefficient span. Product compatibility for an ordinary topological-group instance is explicit, not inferred for arbitrary R. |
| Family generality | Ordinary topological-group coefficient families remain valid for arbitrary topological G. The generalized cochain-compatible family states the operations on Gⁿ; the geometric final-coordinate comparison uses compact Hausdorff G. Layer 0 keeps its original arbitrary-topology group and nonabelian coefficient scope. |
| Étale K(π,1) and raw homotopy | P¹ over an algebraically closed characteristic-zero field has trivial π₁ but nonzero prime-to-characteristic H². Raw and p-completed homotopy are distinct. The finite-coefficient Whitehead use is restricted to connected geometrically unibranch varieties; arbitrary affine characteristic-p finite-coefficient results retain their separate scope. |
| Two finite unipotent towers | A/Iⁿ is a finite path module, not a Hopf quotient. Lower-central depth zero is trivial; a nonzero trivial linear representation has length one, not zero. Open-curve word count is 2g+d−1. |
| Crystalline and tangential comparisons | K₀ and K are kept distinct; ramified K uses the enhanced endpoint comparison rather than an unramified descent argument. A zero or nonunit integral tangent is excluded. Trivial inertia of a group alone does not prove it for the endpoint path. |
| Right periods and affine quotients | I⁻¹γ solves Iu=γ; γI⁻¹ fails the S₃ witness. F⁰U need not be normal. Split-unipotent torsor induction addresses nilpotent coefficient algebras as well as fields. |
| Local closure and annihilators | The closure has a ℚₚ Lie algebra W₀. Its K_v-linear image span W is the image of K_v⊗ℚₚW₀→Lie(A), possibly with a kernel. Thus dim_Kv W≤rank and the annihilator dimension is g−dim_Kv W; these dimensions are not conflated. A non-torsion rank-one generator has nonzero logarithm, since the kernel is finite torsion. Rank at least two permits logarithmic dependence. |
| Analytic finiteness | Density holds on every open subdisc, not just the full disc. The nonzero analytic equation follows from proper scheme-image dimension and density. Compact K-point charts, including ramified O_K charts, are distinct from the larger geometric disc. A zero analytic function has no Strassmann bound. |
| Mordell–Weil vs Selmer | Sha is retained unless its rational Tate contribution vanishes. Rank g requires the stated logarithm isomorphism; rank alone gives no isomorphism. The Mordell–Weil cut is named before quadratic finiteness. |
| Nice correspondences and Tate classes | Symmetry modulo pullbacks, trace zero and nonzero primitive class are simultaneous conditions. The zero class fails. A p-adic admissible Tate class need not arise from the rational correspondence lattice; only the supported forward map is asserted. Preserve the BDMTV 2023 Remark 3.17 correction to the earlier lattice-span claim. |
| Height signs and determinant | Complementary coordinate projections give 7−1−2−6=−2; reversing them gives 6. One away-height 3 contributes −3. Candidate and anchor corrections are separate. A zero anchor feature matrix makes the determinant identically zero; the nonzero determinant certificate is required for the equation equivalence. With zero features the determinant is the one corrected height entry, 7−2=5. |
| Dimension and conditional frontier | Open curve weights differ from proper pure weights. The −dn/2 odd-conjugation trace argument uses the proper pure case, not the punctured-line mixed case. Rational p=2 coefficients avoid integral real-place H³ torsion. The torsion Iwasawa quotient Λ/(T₁) can have infinite rational dimension. The pseudo-null quotient Λ/(p,T₁) need not be finitely generated over ℤₚ, but has rational dimension zero; the stronger tensor-finiteness hypothesis and the rational pseudo-null argument are kept distinct. CM rank-one hypotheses and Sha alternatives stay explicit. |
| Conjecture quantifiers | Numeric dimension inequality is at a positive depth. Eventual equality is equality at every sufficiently large depth, not merely intersection equality; a decreasing ℕ tail containing 0 has intersection {0} without stabilizing. Section injectivity is proved separately from conjectural surjectivity. |

The accepted source corrections also retained include Mochizuki 1996's corrected λ(L_r)=K_Y, Mochizuki 1999's correction to the kernel in the affine canonical relation, log-admissible ramification e≤d (including the identity e=1), Chen's inertia image rather than an unjustified injection, and the primitive lattice restriction noted above. The package does not edit the accepted inputs; its changed mathematical statements and dependency clauses are indexed below for the independent reviewer.

## Lean signature comparison

| Kept interface | Reader agreement checked |
| --- | --- |
| `Nonabelian.IsCocycle`, `Z1` | Arbitrary groups with action ρ:G→*MulAut U; continuity on the actual map carrier, ordered multiplication. |
| `gauge`, `GaugeRelated`, `H1`, `class_eq_iff` | Native generated-equivalence quotient, with equivalence to one gauge witness; no topology on H¹ claimed. |
| `gauge_continuous` | Requires a topological-group U and joint continuity of the supplied action. |
| `positiveDefect` | Positive convention matches the additive d¹ and the C₉ witness. |
| `ArithmeticPath.pathCocycle` | Common-group-frame specialization; kernel theorem requires both sections split q and q(p)=1. |
| `Unipotent.UnipotentLength` | Finite-dimensional linear representations over an arbitrary field; characteristic-zero geometric category is a separately stated construction. |
| `RelativeMaps.RelativeOpenHom` | Continuous map over a supplied fixed quotient with open image, before geometric conjugacy. |
| `Selmer.SelmerSet` | Actual H¹ class-set intersection for supplied localizations, not an admitted representing scheme. |
| `Period.periodRatio` | Group representative I⁻¹γ, before the right homogeneous coset. |
| `Heights.IsNiceCorrespondence` | Supplied linear cycle maps, symmetry modulo P, trace zero and nonzero class; pullback theorem states stability and kernel hypotheses. |
| `HeightPrevalue` | Scalar formula for supplied linear maps; complementarity is a geometric hypothesis, not required to define the scalar expression. |
| `AwayHeightConstants` | Finite index set with independent local upper bounds; finite theorem assumes each bound finite. |
| `HeightDeterminantMatrix`, `HeightDeterminant`, `determinant_equation` | Actual Mathlib matrix/determinant, separate residual constants and the explicit anchor-basis certificate. |
| `Frontier.GaloisSection` | Actual continuous splitting before quotient by the geometric kernel. |
| `KimDimensionCondition`, `EventualEquality` | Positive-depth strict inequality and stable-tail equality on supplied dimensions/loci; geometric conjectures remain reader targets. |

## Source verification

Source files were read in their stated versions, without repository passages or source-by-source summaries. Public author copies were used where their pagination differs from publication. The bibliography distinguishes those versions. The library index was read; no uncleared book copy was used, and no cleared library file or passage was copied. The following table gives more than the required fifteen primary-source checks; the full downloadable-source version/hash ledger follows the target map.

| Primary source and locator inspected | Result used or corrected |
| --- | --- |
| Kim 2004 v1, §1, Lemmas 1–5 and Proposition 1, pp. 2–10 | Ordered cochains, coefficient topology and central induction. Compact factorization uses the strengthened closed-discrete proof described above. |
| Kim 2009, version of record, §§1–3, pp. 89–133 | Frobenius/Hodge paths, finite varieties, central obstruction and dimension criterion; printed pagination retained. |
| Kim 2010 survey, pp. 637–642 | Arithmetic path and right-torsor convention; gauge display tested independently as above. |
| Tamagawa 1997, §7, Lemma 7.1, printed p. 188 | Centre-free pullback identification. Corrected a preliminary page locator; comparison retained only in its isomorphism scope. |
| Mochizuki 1996, §14, and author's December 2012 comments p. 1 | Correct field in λ(L_r)=K_Y; generic homomorphisms retain openness/dominance and constant maps are excluded. |
| Mochizuki 1999 author copy, §2 and §15, plus June 2019 comments p. 1 | Relative comparison and canonical-relation interfaces; corrected kernel in the author's notes. |
| Mochizuki 1995, §§3.5–3.13, author pp. 19–25 | Log-admissibility, e≤d and tame extension hypotheses. |
| Chen 2024, §§4.2–4.3 | Good/symmetric path normalization and actual peripheral inertia image; not the generic peripheral power action. |
| Chiarellotto–Le Stum, Propositions 2.3.2/2.3.5, Remark 2.3.4(iii), pp. 93–95 | Unipotent closure and finite-dimensional rigid cohomology. |
| Chiarellotto–Le Stum, Propositions 2.4.1/2.4.2, pp. 95–97 | Normal-crossing compactification de Rham/rigid comparison and Frobenius pullback. |
| Hadian thesis, Lemma 2.2.1, Proposition 2.2.3, pp. 27–29; Proposition 2.2.7 and Remark 2.2.8, pp. 31–32 | Filtered Ext and rigidified universal filtration, with proper compactification and image filtration kept explicit. |
| Olsson author manuscript, §1.14, p. 7; §7.19 and §8.27–8.32, pp. 69–70, 83–85 | Endpoint-compatible nonabelian comparison; closing p. 7 explicitly allows the ramified extension. |
| Olsson, §9.1–9.24, pp. 85–94; Theorem 9.46 and §9.47–9.58, pp. 104–110; Appendix D, pp. 130–137 | Integral tangential realization and comparison; D.3 uses a general complete DVR, rather than only unramified Witt coefficients. |
| Besser v1, §2 and rigid-path construction | Tannakian and Frobenius continuation comparison with the integral path normalization. |
| Balakrishnan–Dogra I v2, §§3–4, pp. 12–17; II author manuscript, §§3.2–3.4, pp. 15–20 | Mixed-extension classification, local/global heights and negative away-place correction. |
| Balakrishnan–Dogra II, Proposition 6.1, Lemma 6.4, Remarks 4–5 and Corollary 6.2, author pp. 30–31 | Explicit connection and filtration conventions. |
| BDMTV 2019, Theorem 4.5/Remark 4.6, pp. 912–913; §6.3–§6.4 | Nice correspondence and explicit path/height formulas, read with the later correction. |
| BDMTV 2023 v4, §3.5.2, Remark 3.17, p. 16 | Lattice span need not fill a p-adic intersection; no reverse realization assertion. |
| Kim–Tamagawa accepted manuscript, Theorem 0.1 and Corollary 0.2, pp. 1–6 | Prime-to-l nilpotent inertia path comparison and proper finite local image. |
| BDCKW v4, §2, pp. 3–5; small-prime computation p. 7 | Unit tangential endpoints, eligible primes and depth-one punctured-line statement. |
| Stix v1, Appendix B, Proposition 44, Theorem 45 and Remark 46, pp. 21–22 | Kummer difference cocycle and injectivity; Remark 46 refers to Theorem 45, not the unrelated Theorem B. |
| Labute 1967, Théorème 2, printed pp. 142–144 | Hilbert series for a one-relator graded Lie algebra; read from the journal scan, not a misattributed modern source. |
| Schmidt–Stix 2016, §2.3, Lemma 2.7(b) and Proposition 2.8, pp. 826–828; Appendix A.3, pp. 864–866 | Correct raw homotopy/finite-coefficient and fibre-sequence locators. Replaced nonexistent preliminary numbers and wrong pagination. |
| Schmidt–Stix 2016, Definition 6.1 and Lemma 6.3, pp. 845–850 | Elementary fibrations and strongly hyperbolic Artin-neighbourhood construction. |
| Schmidt 1996, Proposition 15, proof, pp. 243–244 | Curve finite-cover effacement. |
| Achinger 2014 v1, finite-cover effacement results; Achinger 2017, Theorem 1.1 | Separate mixed-characteristic and all-prime characteristic-p scopes. |
| Farb–Kisin–Wolfson v2, §2.3.1 p. 16 and Lemma 3.2.2 p. 24 | Canonical finite-cover cohomology map and torus-torsor K(π,1) comparison. |
| Deligne–Milne 2022 notes, Theorem 2.11 pp. 21–29 and Theorem 3.2 pp. 31–33 | Neutral reconstruction and affine faithfully flat tensor-isomorphism torsors. |
| Poonen author PDF, Definition 1.3.14/Proposition 1.3.15 p. 11; §4.5.1–4.5.2 p. 105; Remark 5.12.13/Proposition 5.12.14 p. 154 | Finite/coefficient cohomology, twists and torsor conventions; generic nonabelian formulas are derived in the reader. |
| Stacks 03QQ, 03RQ, 03RR, 0AMB | Field comparison and smooth projective/affine curve Kummer calculations; H² pullback is multiplication by the degree. |
| Stacks 09YQ, 03RV, 07RR, 0BQ8/58.6.2, 0BTX, 0F1P/59.97.9 | Limit cohomology, finite local systems, eventual surjectivity, finite-cover equivalence, arithmetic exactness and prime-to-characteristic Künneth. |

The source survey is not a new errata or attribution job. Some supplier extensions still need their own full formal roadmap treatment, as itemized in the ownership table. No additional package-writing work remains for this claim. The next job is the independent package review; upstream export waits for the maintainer's dependency-order decision and the named supplier refinements.


## Accepted-target map

All tails below have the prefix `AnabelianGeometryAndNonabelianChabauty:`. Counts include each accepted identity once. Sections are the reader’s construction-order sections, independent of the old NC stage number.

### AnabelianGeometryAndNonabelianChabauty--NC.0

| Accepted target | Reader section |
| --- | --- |
| `NC.0/arithmetic-geometric-paths` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-arithmetic-geometric-paths) |
| `NC.0/transferred-endpoint-section` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-transferred-endpoint-section) |
| `NC.0/arithmetic-path-cocycle` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-arithmetic-path-cocycle) |
| `NC.0/path-section-comparison` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-path-section-comparison) |
| `NC.0/reference-section-change` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-reference-section-change) |
| `NC.0/arithmetic-path-functoriality` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-arithmetic-path-functoriality) |
| `NC.0/rational-tangential-kummer` | [1.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-rational-tangential-kummer) |
| `NC.0/local-inertia-orbit-model` | [1.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-local-inertia-orbit-model) |
| `NC.0/tangential-inertia-specialization` | [1.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-tangential-inertia-specialization) |
| `NC.0/chen-good-path` | [1.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-chen-good-path) |
| `NC.0/chen-symmetric-path` | [1.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-chen-symmetric-path) |
| `NC.0/symmetric-good-path-existence` | [1.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-symmetric-good-path-existence) |

### AnabelianGeometryAndNonabelianChabauty--NC.1

| Accepted target | Reader section |
| --- | --- |
| `NC.1/relative-outer-hom` | [3.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-relative-outer-hom) |
| `NC.1/relative-outer-isom` | [3.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-relative-outer-isom) |
| `NC.1/relative-pro-p` | [3.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-relative-pro-p) |
| `NC.1/log-admissible-system` | [3.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-log-admissible-system) |
| `NC.1/tower-decomposition` | [3.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-tower-decomposition) |
| `NC.1/cyclotomic-degree` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-cyclotomic-degree) |
| `NC.1/finite-field-decomposition` | [3.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-finite-field-decomposition) |
| `NC.1/linear-system-addition` | [3.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-linear-system-addition) |
| `NC.1/finite-field-tame-isom` | [3.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-finite-field-tame-isom) |
| `NC.1/sturdy-cover` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-sturdy-cover) |
| `NC.1/component-recovery` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-component-recovery) |
| `NC.1/node-branch-recovery` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-node-branch-recovery) |
| `NC.1/thickness-log-gluing` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-thickness-log-gluing) |
| `NC.1/ordinary-special-quotient` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-ordinary-special-quotient) |
| `NC.1/finite-field-log-isom` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-finite-field-log-isom) |
| `NC.1/local-admissible-recovery` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-local-admissible-recovery) |
| `NC.1/degree-normalization` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-degree-normalization) |
| `NC.1/local-special-isom` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-local-special-isom) |
| `NC.1/curve-map-rigidity` | [3.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-curve-map-rigidity) |
| `NC.1/number-field-isom` | [3.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-number-field-isom) |
| `NC.1/geometric-outer-comparison` | [3.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-geometric-outer-comparison) |
| `NC.1/weight-zero-quotient` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-weight-zero-quotient) |
| `NC.1/j-geometric-section` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-j-geometric-section) |
| `NC.1/fi-geometric-section` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-fi-geometric-section) |
| `NC.1/nondegenerate-section` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-nondegenerate-section) |
| `NC.1/canonical-relations` | [3.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-canonical-relations) |
| `NC.1/arithmetic-chern-comparison` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-arithmetic-chern-comparison) |
| `NC.1/geometric-splitting` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-geometric-splitting) |
| `NC.1/open-map-j-geometric` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-open-map-j-geometric) |
| `NC.1/fi-to-f` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-fi-to-f) |
| `NC.1/prime-to-p-line-bundle` | [3.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-prime-to-p-line-bundle) |
| `NC.1/tame-point-existence` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-tame-point-existence) |
| `NC.1/compatible-tower-point` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-compatible-tower-point) |
| `NC.1/canonical-cover-descent` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-canonical-cover-descent) |
| `NC.1/completed-differential-comparison` | [3.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-completed-differential-comparison) |
| `NC.1/canonical-relation-vanishing` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-canonical-relation-vanishing) |
| `NC.1/inertia-and-regularity` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-inertia-and-regularity) |
| `NC.1/canonical-effectivity` | [3.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-canonical-effectivity) |
| `NC.1/local-pro-p-hom` | [3.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-local-pro-p-hom) |
| `NC.1/finitely-generated-hom` | [3.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-finitely-generated-hom) |
| `NC.1/sub-p-adic-hom` | [3.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-sub-p-adic-hom) |
| `NC.1/full-profinite-hom` | [3.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-full-profinite-hom) |
| `NC.1/galois-centre-free` | [3.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-galois-centre-free) |
| `NC.1/local-galois-centre-free` | [3.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-local-galois-centre-free) |
| `NC.1/geometric-centre-free` | [3.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-geometric-centre-free) |
| `NC.1/punctured-elliptic-isom` | [3.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-1-punctured-elliptic-isom) |

### AnabelianGeometryAndNonabelianChabauty--NC.2

| Accepted target | Reader section |
| --- | --- |
| `NC.2/unipotent-length` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-unipotent-length) |
| `NC.2/invariant-vector-criterion` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-invariant-vector-criterion) |
| `NC.2/realization-categories` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-realization-categories) |
| `NC.2/tannakian-groups` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-tannakian-groups) |
| `NC.2/tensor-paths` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-tensor-paths) |
| `NC.2/etale-galois` | [2.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-etale-galois) |
| `NC.2/central-quotients` | [2.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-central-quotients) |
| `NC.2/length-algebra` | [2.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-length-algebra) |
| `NC.2/universal-pointed` | [2.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-universal-pointed) |
| `NC.2/universal-object-existence` | [2.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-universal-object-existence) |
| `NC.2/finite-path-module` | [2.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-finite-path-module) |
| `NC.2/affine-universal` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-affine-universal) |
| `NC.2/affine-universality` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-affine-universality) |
| `NC.2/affine-composition` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-affine-composition) |
| `NC.2/proper-maximal-quotient` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-proper-maximal-quotient) |
| `NC.2/filtered-path` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-filtered-path) |
| `NC.2/filtered-extension` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-filtered-extension) |
| `NC.2/hadian-filtration` | [2.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-hadian-filtration) |
| `NC.2/rigid-fibre` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-rigid-fibre) |
| `NC.2/rigid-frobenius-equivalence` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-rigid-frobenius-equivalence) |
| `NC.2/frobenius-normalization` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-frobenius-normalization) |
| `NC.2/berthelot-ogus` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-berthelot-ogus) |
| `NC.2/path-frobenius` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-path-frobenius) |
| `NC.2/frobenius-lang` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-frobenius-lang) |
| `NC.2/canonical-frobenius-path` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-canonical-frobenius-path) |
| `NC.2/word-path-bridge` | [2.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-word-path-bridge) |
| `NC.2/crystalline-path-coordinates` | [2.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-crystalline-path-coordinates) |
| `NC.2/finite-path-comparison` | [2.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-finite-path-comparison) |
| `NC.2/depth-one-jacobian` | [2.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-depth-one-jacobian) |
| `NC.2/finite-cover-boundary` | [2.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-2-finite-cover-boundary) |

### AnabelianGeometryAndNonabelianChabauty--NC.3

| Accepted target | Reader section |
| --- | --- |
| `NC.3/canonical-comparison-naturality` | [0.20](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-canonical-comparison-naturality) |
| `NC.3/finite-quotient-comparison` | [0.26](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-finite-quotient-comparison) |
| `NC.3/positive-defect` | [0.26](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-positive-defect) |
| `NC.3/continuous-central-obstruction` | [0.26](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-continuous-central-obstruction) |
| `NC.3/central-lift-exactness` | [0.26](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-central-lift-exactness) |
| `NC.3/central-obstruction-descent` | [0.35](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-central-obstruction-descent) |
| `NC.3/invariant-orbit-transport` | [0.38](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-orbit-transport) |
| `NC.3/galois-coefficient-family` | [4.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-galois-coefficient-family) |
| `NC.3/unipotent-point-topology` | [4.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-unipotent-point-topology) |
| `NC.3/cohomology-functor` | [4.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cohomology-functor) |
| `NC.3/cochain-scalar-extension` | [4.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cochain-scalar-extension) |
| `NC.3/filtered-affine-torsor-comparison` | [4.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-filtered-affine-torsor-comparison) |
| `NC.3/finite-level-representability` | [4.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-finite-level-representability) |
| `NC.3/invariant-coset-representability` | [4.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-coset-representability) |
| `NC.3/local-neutral-locus` | [4.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-local-neutral-locus) |
| `NC.3/local-condition-geometry` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-local-condition-geometry) |
| `NC.3/selmer-functor` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-selmer-functor) |
| `NC.3/selmer-representability` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-selmer-representability) |
| `NC.3/selmer-localization-naturality` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-selmer-localization-naturality) |
| `NC.3/central-selmer-dimension` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-central-selmer-dimension) |
| `NC.3/depth-one-selmer-comparison` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-depth-one-selmer-comparison) |
| `NC.3/depth-two-cup-obstruction` | [4.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-depth-two-cup-obstruction) |

### AnabelianGeometryAndNonabelianChabauty--NC.4

| Accepted target | Reader section |
| --- | --- |
| `NC.4/admissible-period` | [5.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-admissible-period) |
| `NC.4/admissible-classification` | [5.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-admissible-classification) |
| `NC.4/local-albanese` | [5.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-local-albanese) |
| `NC.4/iterated-coordinates` | [5.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-iterated-coordinates) |
| `NC.4/residue-disc-density` | [5.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-residue-disc-density) |
| `NC.4/crystalline-period` | [5.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-crystalline-period) |
| `NC.4/local-etale-albanese` | [5.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-local-etale-albanese) |
| `NC.4/global-etale-albanese` | [5.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-global-etale-albanese) |
| `NC.4/selmer-period` | [5.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-selmer-period) |
| `NC.4/fundamental-diagram` | [5.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-fundamental-diagram) |
| `NC.4/kim-loci` | [5.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-kim-loci) |
| `NC.4/locus-compatibilities` | [5.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-locus-compatibilities) |
| `NC.4/rational-integral-containment` | [5.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-rational-integral-containment) |
| `NC.4/regular-pullback` | [5.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-regular-pullback) |
| `NC.4/selmer-annihilator` | [5.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-selmer-annihilator) |
| `NC.4/finite-annihilator-locus` | [5.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-finite-annihilator-locus) |
| `NC.4/dimension-finiteness` | [5.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-dimension-finiteness) |
| `NC.4/depth-one-period` | [5.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-depth-one-period) |
| `NC.4/depth-one-locus` | [5.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-4-depth-one-locus) |

### AnabelianGeometryAndNonabelianChabauty--NC.5

| Accepted target | Reader section |
| --- | --- |
| `NC.5/nice-correspondence` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-nice-correspondence) |
| `NC.5/nice-trace-criterion` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-nice-trace-criterion) |
| `NC.5/depth-two-quotient` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-depth-two-quotient) |
| `NC.5/rank-picard-criterion` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-rank-picard-criterion) |
| `NC.5/admissible-tate-class` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-admissible-tate-class) |
| `NC.5/nice-class-realization` | [6.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-nice-class-realization) |
| `NC.5/height-module` | [6.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-height-module) |
| `NC.5/height-module-twist` | [6.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-height-module-twist) |
| `NC.5/twist-two-classes` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-twist-two-classes) |
| `NC.5/twist-injective` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-twist-injective) |
| `NC.5/height-module-comparison` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-height-module-comparison) |
| `NC.5/height-prevalue` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-height-prevalue) |
| `NC.5/local-height-coordinates` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-local-height-coordinates) |
| `NC.5/away-height-vanishes` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-away-height-vanishes) |
| `NC.5/finite-bad-height-image` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-finite-bad-height-image) |
| `NC.5/away-height-constants` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-away-height-constants) |
| `NC.5/quadratic-chabauty-pair` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-quadratic-chabauty-pair) |
| `NC.5/pair-of-heights` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-pair-of-heights) |
| `NC.5/pair-finite-locus` | [6.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-pair-finite-locus) |
| `NC.5/height-determinant` | [6.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-height-determinant) |
| `NC.5/determinant-criterion` | [6.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-determinant-criterion) |
| `NC.5/balanced-height-features` | [6.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-balanced-height-features) |
| `NC.5/potential-good-pair` | [6.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-potential-good-pair) |
| `NC.5/choices-independence` | [6.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-choices-independence) |
| `NC.5/chow-heegner-class` | [6.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-5-chow-heegner-class) |

### AnabelianGeometryAndNonabelianChabauty--NC.6

| Accepted target | Reader section |
| --- | --- |
| `NC.6/section-classes` | [7.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-section-classes) |
| `NC.6/section-class-map` | [7.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-section-class-map) |
| `NC.6/kummer-section-comparison` | [7.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-kummer-section-comparison) |
| `NC.6/section-map-injective` | [7.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-section-map-injective) |
| `NC.6/section-conjecture` | [7.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-section-conjecture) |
| `NC.6/kim-dimension-conjecture` | [7.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-kim-dimension-conjecture) |
| `NC.6/graded-central-dimensions` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-graded-central-dimensions) |
| `NC.6/selmer-vanishing-conjecture` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-selmer-vanishing-conjecture) |
| `NC.6/h2-growth-bound` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-h2-growth-bound) |
| `NC.6/vanishing-implies-dimension` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-vanishing-implies-dimension) |
| `NC.6/bloch-kato-implies-vanishing` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-bloch-kato-implies-vanishing) |
| `NC.6/weight-splitting-implies-vanishing` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-weight-splitting-implies-vanishing) |
| `NC.6/weak-jannsen-implies-dimension` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-weak-jannsen-implies-dimension) |
| `NC.6/cm-rank-one-finiteness` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-cm-rank-one-finiteness) |
| `NC.6/pseudo-null-implies-dimension` | [7.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-pseudo-null-implies-dimension) |
| `NC.6/genus-zero-dimension` | [7.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-genus-zero-dimension) |
| `NC.6/kim-conjecture` | [7.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-kim-conjecture) |
| `NC.6/thrice-punctured-depth-one` | [7.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-6-thrice-punctured-depth-one) |

### AnabelianGeometryAndNonabelianChabauty

| Accepted target | Reader section |
| --- | --- |
| `NC.3/continuous-cocycles` | [0.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-continuous-cocycles) |
| `NC.3/nonabelian-h1` | [0.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-nonabelian-h1) |
| `NC.3/functoriality` | [0.19](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-functoriality) |
| `NC.3/abelian-comparison` | [0.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-abelian-comparison) |
| `NC.3/connecting-cocycle` | [0.27](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-cocycle) |
| `NC.3/connecting-cocycle-image` | [0.27](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-cocycle-image) |
| `NC.3/connecting-change-lift` | [0.27](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-change-lift) |
| `NC.3/connecting-class-zero` | [0.39](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-class-zero) |
| `NC.3/connecting-fixed-orbits` | [0.27](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-fixed-orbits) |
| `NC.3/normal-h1-kernel` | [0.32](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-normal-h1-kernel) |
| `NC.3/exact-sequence` | [0.29](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-exact-sequence) |
| `NC.3/central-extension` | [0.34](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-central-extension) |
| `NC.3/twisting` | [0.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisting) |
| `NC.3/torsor-classification` | [0.40](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-torsor-classification) |
| `key/etale-k-pi-1` | [1.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#key-etale-k-pi-1) |
| `NC.0/coefficient-restriction` | [1.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-coefficient-restriction) |
| `NC.0/pointed-isomorphism` | [1.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-pointed-isomorphism) |
| `NC.0/basepoint-transport` | [1.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-basepoint-transport) |
| `NC.0/finite-cover-effacement` | [1.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-finite-cover-effacement) |
| `NC.0/raw-homotopy-comparison` | [1.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-raw-homotopy-comparison) |
| `NC.0/field` | [1.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-field) |
| `NC.0/projective-line-obstruction` | [1.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-projective-line-obstruction) |
| `NC.0/smooth-curve` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-smooth-curve) |
| `NC.0/products` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-products) |
| `NC.0/elementary-fibration` | [1.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-elementary-fibration) |
| `NC.0/artin-neighbourhood` | [1.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-artin-neighbourhood) |
| `NC.3/quotient-action` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-action) |
| `NC.3/fixed-coset-criterion` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-fixed-coset-criterion) |
| `NC.3/invariant-coset-projection` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-coset-projection) |
| `NC.3/invariant-coset-image` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-coset-image) |
| `NC.3/connecting-map` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-map) |
| `NC.3/connecting-map-lift` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-map-lift) |
| `NC.3/invariants-injection` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariants-injection) |
| `NC.3/invariants-kernel` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariants-kernel) |
| `NC.3/invariant-coset-kernel` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-coset-kernel) |
| `NC.3/connecting-image-kernel` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-image-kernel) |
| `NC.3/connecting-quotient-fibres` | [0.41](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-connecting-quotient-fibres) |
| `NC.0/effacement-finite-cover-transfer` | [1.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-effacement-finite-cover-transfer) |
| `NC.0/all-coefficient-effacement` | [1.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-all-coefficient-effacement) |
| `NC.0/finite-etale-invariance` | [1.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-finite-etale-invariance) |
| `NC.0/effacement-extension` | [1.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-effacement-extension) |
| `NC.0/prime-field-effacement` | [1.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-prime-field-effacement) |
| `NC.0/connected-prime-degree-cover` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-connected-prime-degree-cover) |
| `NC.0/prime-cover-degree-two-killing` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-prime-cover-degree-two-killing) |
| `NC.0/prime-power-degree-two-killing` | [1.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-prime-power-degree-two-killing) |
| `NC.0/geometric-smooth-curve` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-geometric-smooth-curve) |
| `NC.0/separable-killing-descent` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-separable-killing-descent) |
| `NC.0/separable-base-change` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-separable-base-change) |
| `NC.0/positive-family-effacement` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-positive-family-effacement) |
| `NC.0/product-cover-effacement` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-product-cover-effacement) |
| `NC.0/geometric-product` | [1.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-0-geometric-product) |
| `NC.3/cocycle-map-one` | [0.22](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-map-one) |
| `NC.3/cocycle-map-inverse` | [0.24](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-map-inverse) |
| `NC.3/cocycle-one-fibre` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-one-fibre) |
| `NC.3/cocycle-one-fibre-clopen` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-one-fibre-clopen) |
| `NC.3/discrete-normal-killing` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-discrete-normal-killing) |
| `NC.3/cocycle-right-cosets` | [0.21](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-right-cosets) |
| `NC.3/cocycle-left-cosets` | [0.21](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-left-cosets) |
| `NC.3/cocycle-values-fixed` | [0.21](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-values-fixed) |
| `NC.3/cocycle-values-invariants` | [0.21](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-values-invariants) |
| `NC.3/gauge-witness-fixed` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-witness-fixed) |
| `NC.3/finite-family-normal-killing` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-finite-family-normal-killing) |
| `NC.3/quotient-cocycle-descent` | [0.21](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-descent) |
| `NC.3/quotient-cocycle-unique` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-unique) |
| `NC.3/quotient-cocycle-inflation` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-inflation) |
| `NC.3/inflate-descended-cocycle` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-inflate-descended-cocycle) |
| `NC.3/descend-inflated-cocycle` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-descend-inflated-cocycle) |
| `NC.3/quotient-cocycle-equivalence` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-equivalence) |
| `NC.3/quotient-cocycle-gauge` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-gauge) |
| `NC.3/h1-orbit-criterion` | [0.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-orbit-criterion) |
| `NC.3/quotient-inflation-equivariance` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-inflation-equivariance) |
| `NC.3/quotient-inflation-gauge-reflection` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-inflation-gauge-reflection) |
| `NC.3/quotient-cocycle-inflation-one` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-inflation-one) |
| `NC.3/h1-inflation` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation) |
| `NC.3/h1-inflation-injective` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-injective) |
| `NC.3/cocycle-restriction` | [0.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-restriction) |
| `NC.3/cocycle-restriction-equivariance` | [0.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-restriction-equivariance) |
| `NC.3/h1-neutral-criterion` | [0.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-neutral-criterion) |
| `NC.3/h1-gauge-class` | [0.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-gauge-class) |
| `NC.3/cocycle-inverse-gauge-normalization` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-inverse-gauge-normalization) |
| `NC.3/h1-restriction` | [0.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-restriction) |
| `NC.3/cocycle-restriction-inflation` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-restriction-inflation) |
| `NC.3/h1-restriction-inflation` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-restriction-inflation) |
| `NC.3/h1-inflation-restriction-image` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-restriction-image) |
| `NC.3/h1-inflation-unique-preimage` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-unique-preimage) |
| `NC.3/quotient-fixed-action-continuity` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-fixed-action-continuity) |
| `NC.3/h1-inflation-one` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-one) |
| `NC.3/h1-inflation-neutral-equivalence` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-neutral-equivalence) |
| `NC.3/quotient-cocycle-inflation-injective` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-quotient-cocycle-inflation-injective) |
| `NC.3/cocycle-transition` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-transition) |
| `NC.3/cocycle-transition-inflation` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-cocycle-transition-inflation) |
| `NC.3/h1-transition` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-transition) |
| `NC.3/h1-transition-inflation` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-transition-inflation) |
| `NC.3/h1-transition-identity` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-transition-identity) |
| `NC.3/h1-transition-composition` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-transition-composition) |
| `NC.3/h1-quotient-diagram` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-quotient-diagram) |
| `NC.3/h1-inflation-cocone` | [0.23](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-cocone) |
| `NC.3/h1-finite-quotient-surjectivity` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-finite-quotient-surjectivity) |
| `NC.3/h1-quotient-index-filtered` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-quotient-index-filtered) |
| `NC.3/h1-inflation-colimit` | [0.25](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-inflation-colimit) |
| `NC.3/h1-finite-quotient-equivalence` | [0.42](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-h1-finite-quotient-equivalence) |
| `NC.3/coefficient-cocycle-map` | [0.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-cocycle-map) |
| `NC.3/coefficient-cocycle-gauge` | [0.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-cocycle-gauge) |
| `NC.3/coefficient-cocycle-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-cocycle-identity) |
| `NC.3/coefficient-cocycle-composition` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-cocycle-composition) |
| `NC.3/coefficient-h1-map` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-h1-map) |
| `NC.3/coefficient-h1-one` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-h1-one) |
| `NC.3/coefficient-h1-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-h1-identity) |
| `NC.3/coefficient-h1-composition` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-h1-composition) |
| `NC.3/coefficient-invariant-map` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-invariant-map) |
| `NC.3/coefficient-invariant-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-invariant-identity) |
| `NC.3/coefficient-invariant-composition` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-coefficient-invariant-composition) |
| `NC.3/source-cocycle-restriction` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-restriction) |
| `NC.3/source-cocycle-value` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-value) |
| `NC.3/source-cocycle-neutral` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-neutral) |
| `NC.3/source-cocycle-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-identity) |
| `NC.3/source-cocycle-composition` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-composition) |
| `NC.3/source-cocycle-surjective-injection` | [0.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-surjective-injection) |
| `NC.3/source-cocycle-subgroup` | [0.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-subgroup) |
| `NC.3/source-cocycle-gauge` | [0.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-cocycle-gauge) |
| `NC.3/source-h1-restriction` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-restriction) |
| `NC.3/source-h1-representative` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-representative) |
| `NC.3/source-h1-neutral` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-neutral) |
| `NC.3/source-h1-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-identity) |
| `NC.3/source-h1-composition` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-composition) |
| `NC.3/source-h1-surjective-injection` | [0.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-surjective-injection) |
| `NC.3/source-h1-subgroup` | [0.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-h1-subgroup) |
| `NC.3/source-coefficient-cocycle-square` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-coefficient-cocycle-square) |
| `NC.3/source-coefficient-h1-square` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-coefficient-h1-square) |
| `NC.3/source-invariant-restriction` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-invariant-restriction) |
| `NC.3/source-invariant-value` | [0.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-invariant-value) |
| `NC.3/source-invariant-identity` | [0.43](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-invariant-identity) |
| `NC.3/source-invariant-composition` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-invariant-composition) |
| `NC.3/source-invariant-injection` | [0.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-invariant-injection) |
| `NC.3/source-coefficient-invariant-square` | [0.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-source-coefficient-invariant-square) |
| `NC.3/twist-underlying-group` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-underlying-group) |
| `NC.3/twist-cocycle-equivalence` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-cocycle-equivalence) |
| `NC.3/twist-cocycle-value` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-cocycle-value) |
| `NC.3/twist-cocycle-inverse-value` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-cocycle-inverse-value) |
| `NC.3/twist-gauge-equivariance` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-gauge-equivariance) |
| `NC.3/twist-h1-equivalence` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-h1-equivalence) |
| `NC.3/twist-h1-representative` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-h1-representative) |
| `NC.3/twist-h1-neutral-fibre` | [0.17](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-h1-neutral-fibre) |
| `NC.3/twist-invariant-criterion` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-invariant-criterion) |
| `NC.3/twist-coefficient-map` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-map) |
| `NC.3/twist-coefficient-value` | [0.15](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-value) |
| `NC.3/twist-coefficient-continuity` | [0.17](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-continuity) |
| `NC.3/twist-coefficient-equivariance` | [0.15](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-equivariance) |
| `NC.3/twist-coefficient-identity` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-identity) |
| `NC.3/twist-coefficient-composition` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-composition) |
| `NC.3/twist-coefficient-cocycle-square` | [0.17](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-cocycle-square) |
| `NC.3/twist-coefficient-inverse-cocycle-square` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-inverse-cocycle-square) |
| `NC.3/twist-coefficient-h1-square` | [0.17](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-h1-square) |
| `NC.3/twist-coefficient-inverse-h1-square` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-inverse-h1-square) |
| `NC.3/twist-coefficient-repointed-neutral` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-repointed-neutral) |
| `NC.3/twist-coefficient-repointed-fibre` | [0.17](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-coefficient-repointed-fibre) |
| `NC.3/gauge-equivalence` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-equivalence) |
| `NC.3/gauge-value` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-value) |
| `NC.3/gauge-inverse-value` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-inverse-value) |
| `NC.3/gauge-continuity` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-continuity) |
| `NC.3/gauge-inverse-continuity` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-inverse-continuity) |
| `NC.3/gauge-equivariance` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-equivariance) |
| `NC.3/gauge-identity` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-identity) |
| `NC.3/gauge-composition` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-composition) |
| `NC.3/gauge-cocycle-square` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-cocycle-square) |
| `NC.3/gauge-h1-square` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-h1-square) |
| `NC.3/representative-equivalence` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-equivalence) |
| `NC.3/representative-value` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-value) |
| `NC.3/representative-neutral` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-neutral) |
| `NC.3/representative-gauge` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-gauge) |
| `NC.3/representative-identity` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-identity) |
| `NC.3/representative-composition` | [0.28](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-composition) |
| `NC.3/representative-inverse` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-inverse) |
| `NC.3/representative-square` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-square) |
| `NC.3/representative-uniqueness` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-representative-uniqueness) |
| `NC.3/twisted-source-equivalence` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-equivalence) |
| `NC.3/twisted-source-value` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-value) |
| `NC.3/twisted-source-inverse-value` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-inverse-value) |
| `NC.3/twisted-source-continuity` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-continuity) |
| `NC.3/twisted-source-inverse-continuity` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-inverse-continuity) |
| `NC.3/twisted-source-semilinearity` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-semilinearity) |
| `NC.3/twisted-source-cocycle-map` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-map) |
| `NC.3/twisted-source-cocycle-value` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-value) |
| `NC.3/twisted-source-cocycle-neutral` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-neutral) |
| `NC.3/twisted-source-cocycle-gauge` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-gauge) |
| `NC.3/twisted-source-cocycle-square` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-square) |
| `NC.3/twisted-source-h1-map` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-h1-map) |
| `NC.3/twisted-source-h1-value` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-h1-value) |
| `NC.3/twisted-source-h1-neutral` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-h1-neutral) |
| `NC.3/twisted-source-h1-square` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-h1-square) |
| `NC.3/twisted-source-gauge-square` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-gauge-square) |
| `NC.3/twisted-source-cocycle-injection` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-cocycle-injection) |
| `NC.3/twisted-source-h1-injection` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-h1-injection) |
| `NC.3/twisted-source-representative-square` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-representative-square) |
| `NC.3/twisted-source-identity-square` | [0.44](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-identity-square) |
| `NC.3/twisted-source-composition-square` | [0.13](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-source-composition-square) |
| `NC.3/twisted-kernel-membership` | [0.14](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-membership) |
| `NC.3/twisted-kernel-stability` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-stability) |
| `NC.3/twisted-kernel-equivalence` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-equivalence) |
| `NC.3/twisted-kernel-equivalence-value` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-equivalence-value) |
| `NC.3/twisted-kernel-equivalence-continuous` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-equivalence-continuous) |
| `NC.3/twisted-kernel-equivalence-inverse-continuous` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-equivalence-inverse-continuous) |
| `NC.3/twisted-kernel-action` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-action) |
| `NC.3/twisted-kernel-action-value` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-action-value) |
| `NC.3/twisted-kernel-action-continuity` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-action-continuity) |
| `NC.3/twisted-kernel-h1-inclusion` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-inclusion) |
| `NC.3/twisted-kernel-h1-representative` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-representative) |
| `NC.3/twisted-kernel-h1-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-neutral) |
| `NC.3/twisted-kernel-h1-image` | [0.16](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-image) |
| `NC.3/twisted-kernel-h1-repointed-fibre` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-repointed-fibre) |
| `NC.3/twisted-map-surjectivity` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-map-surjectivity) |
| `NC.3/twisted-kernel-quotient-equivalence` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-equivalence) |
| `NC.3/twisted-kernel-quotient-value` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-value) |
| `NC.3/twisted-kernel-quotient-continuous` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-continuous) |
| `NC.3/twisted-kernel-quotient-inverse-continuous` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-inverse-continuous) |
| `NC.3/twisted-kernel-quotient-homeomorphism` | [0.33](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-homeomorphism) |
| `NC.3/twisted-kernel-quotient-homeomorphism-value` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-homeomorphism-value) |
| `NC.3/twisted-kernel-quotient-homeomorphism-comparison` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-homeomorphism-comparison) |
| `NC.3/twisted-kernel-quotient-homeomorphism-multiplication` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-homeomorphism-multiplication) |
| `NC.3/twisted-kernel-quotient-topology-criterion` | [0.33](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-quotient-topology-criterion) |
| `NC.3/twisted-quotient-action` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-action) |
| `NC.3/twisted-quotient-projection-action` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-projection-action) |
| `NC.3/twisted-quotient-action-continuity` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-action-continuity) |
| `NC.3/twisted-quotient-comparison-equivariance` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-comparison-equivariance) |
| `NC.3/twisted-quotient-inverse-equivariance` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-inverse-equivariance) |
| `NC.3/twisted-quotient-cocycle-map` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-map) |
| `NC.3/twisted-quotient-cocycle-value` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-value) |
| `NC.3/twisted-quotient-cocycle-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-neutral) |
| `NC.3/twisted-quotient-cocycle-gauge` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-gauge) |
| `NC.3/twisted-quotient-h1-map` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-map) |
| `NC.3/twisted-quotient-h1-representative` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-representative) |
| `NC.3/twisted-quotient-h1-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-neutral) |
| `NC.3/twisted-quotient-cocycle-equivalence` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-equivalence) |
| `NC.3/twisted-quotient-cocycle-equivalence-value` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-equivalence-value) |
| `NC.3/twisted-quotient-cocycle-equivalence-inverse-value` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-equivalence-inverse-value) |
| `NC.3/twisted-quotient-cocycle-equivalence-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-equivalence-neutral) |
| `NC.3/twisted-quotient-cocycle-equivalence-gauge` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-equivalence-gauge) |
| `NC.3/twisted-quotient-cocycle-projection-triangle` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-cocycle-projection-triangle) |
| `NC.3/twisted-quotient-h1-equivalence` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-equivalence) |
| `NC.3/twisted-quotient-h1-equivalence-representative` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-equivalence-representative) |
| `NC.3/twisted-quotient-h1-equivalence-inverse-representative` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-equivalence-inverse-representative) |
| `NC.3/twisted-quotient-h1-equivalence-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-equivalence-neutral) |
| `NC.3/twisted-quotient-h1-projection-triangle` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-projection-triangle) |
| `NC.3/twisted-quotient-h1-kernel-image` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-kernel-image) |
| `NC.3/twisted-quotient-h1-translation-square` | [0.18](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-translation-square) |
| `NC.3/twisted-quotient-h1-repointed-fibre` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-quotient-h1-repointed-fibre) |
| `NC.3/mapped-inverse-gauge-normalization` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-mapped-inverse-gauge-normalization) |
| `NC.3/twisted-kernel-cocycle-lift` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift) |
| `NC.3/twisted-kernel-cocycle-lift-value` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift-value) |
| `NC.3/twisted-kernel-cocycle-lift-inclusion` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift-inclusion) |
| `NC.3/twisted-kernel-cocycle-lift-neutral` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift-neutral) |
| `NC.3/twisted-kernel-cocycle-lift-gauge` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift-gauge) |
| `NC.3/twisted-kernel-cocycle-lift-detection` | [0.45](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-cocycle-lift-detection) |
| `NC.3/twisted-kernel-h1-quotient-converse` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-quotient-converse) |
| `NC.3/twisted-kernel-h1-quotient-range` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-quotient-range) |
| `NC.3/twisted-kernel-h1-mapped-converse` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-mapped-converse) |
| `NC.3/twisted-kernel-h1-mapped-range` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-mapped-range) |
| `NC.3/twisted-kernel-h1-original-fibre-range` | [0.30](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-h1-original-fibre-range) |
| `NC.3/named-kernel-equivalence` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence) |
| `NC.3/named-kernel-equivalence-value` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence-value) |
| `NC.3/named-kernel-equivalence-inverse-value` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence-inverse-value) |
| `NC.3/named-kernel-equivalence-continuity` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence-continuity) |
| `NC.3/named-kernel-equivalence-inverse-continuity` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence-inverse-continuity) |
| `NC.3/named-kernel-inner-action` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-inner-action) |
| `NC.3/named-kernel-inner-action-value` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-inner-action-value) |
| `NC.3/named-kernel-equivalence-equivariance` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-equivalence-equivariance) |
| `NC.3/named-kernel-inner-action-continuity` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-inner-action-continuity) |
| `NC.3/named-kernel-h1-equivalence` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-equivalence) |
| `NC.3/named-kernel-h1-representative` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-representative) |
| `NC.3/named-kernel-h1-inverse-representative` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-inverse-representative) |
| `NC.3/named-kernel-h1-neutral` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-neutral) |
| `NC.3/named-kernel-h1-inclusion-triangle` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-inclusion-triangle) |
| `NC.3/named-kernel-h1-inclusion-range` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-inclusion-range) |
| `NC.3/named-kernel-h1-quotient-range` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-quotient-range) |
| `NC.3/named-kernel-h1-mapped-range` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-mapped-range) |
| `NC.3/named-kernel-h1-original-fibre-range` | [0.31](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-named-kernel-h1-original-fibre-range) |
| `NC.3/embedded-kernel-equivalence` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-equivalence) |
| `NC.3/embedded-kernel-value` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-value) |
| `NC.3/embedded-kernel-inverse-value` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inverse-value) |
| `NC.3/embedded-kernel-continuity` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-continuity) |
| `NC.3/embedded-kernel-inverse-continuity` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inverse-continuity) |
| `NC.3/embedded-kernel-inner-action` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inner-action) |
| `NC.3/embedded-kernel-action-value` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-action-value) |
| `NC.3/embedded-kernel-equivariance` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-equivariance) |
| `NC.3/embedded-kernel-action-continuity` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-action-continuity) |
| `NC.3/embedded-kernel-h1-equivalence` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-h1-equivalence) |
| `NC.3/embedded-kernel-h1-one` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-h1-one) |
| `NC.3/embedded-kernel-h1-inclusion` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-h1-inclusion) |
| `NC.3/embedded-kernel-h1-inclusion-comparison` | [0.37](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-h1-inclusion-comparison) |
| `NC.3/embedded-kernel-inclusion-range` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inclusion-range) |
| `NC.3/embedded-kernel-mapped-range` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-mapped-range) |
| `NC.3/embedded-kernel-repointed-range` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-repointed-range) |
| `NC.3/embedded-kernel-h1-representative` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-h1-representative) |
| `NC.3/embedded-kernel-inclusion-representative` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inclusion-representative) |
| `NC.3/embedded-kernel-quotient-range` | [0.46](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-quotient-range) |
| `NC.3/gauge-stabilizer-fixed` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-stabilizer-fixed) |
| `NC.3/invariant-stabilizer-equivalence` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-stabilizer-equivalence) |
| `NC.3/invariant-stabilizer-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-stabilizer-value) |
| `NC.3/invariant-stabilizer-inverse-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-stabilizer-inverse-value) |
| `NC.3/invariant-stabilizer-continuity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-stabilizer-continuity) |
| `NC.3/invariant-stabilizer-inverse-continuity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-stabilizer-inverse-continuity) |
| `NC.3/gauge-transporter-characterisation` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-characterisation) |
| `NC.3/gauge-transporter-equivalence` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-equivalence) |
| `NC.3/gauge-transporter-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-value) |
| `NC.3/gauge-transporter-inverse-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-inverse-value) |
| `NC.3/gauge-transporter-continuity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-continuity) |
| `NC.3/gauge-transporter-inverse-continuity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-transporter-inverse-continuity) |
| `NC.3/gauge-witness-uniqueness` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-gauge-witness-uniqueness) |
| `NC.3/kernel-gauge-fixed-projection` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-gauge-fixed-projection) |
| `NC.3/kernel-injectivity-stabilizer-lifts` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-injectivity-stabilizer-lifts) |
| `NC.3/kernel-injectivity-fixed-trivial` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-injectivity-fixed-trivial) |
| `NC.3/twisted-kernel-inclusion-injectivity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-inclusion-injectivity) |
| `NC.3/embedded-kernel-inclusion-injectivity` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-inclusion-injectivity) |
| `NC.3/embedded-kernel-fibre-unique` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-embedded-kernel-fibre-unique) |
| `NC.3/kernel-invariant-gauge` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge) |
| `NC.3/kernel-invariant-gauge-value` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge-value) |
| `NC.3/kernel-invariant-gauge-unit` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge-unit) |
| `NC.3/kernel-invariant-gauge-product` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge-product) |
| `NC.3/kernel-invariant-gauge-equivariance` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge-equivariance) |
| `NC.3/kernel-preimage-class-action` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-preimage-class-action) |
| `NC.3/kernel-preimage-class-value` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-preimage-class-value) |
| `NC.3/kernel-preimage-class-kernel` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-preimage-class-kernel) |
| `NC.3/invariant-preimage-projection` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-preimage-projection) |
| `NC.3/invariant-preimage-projection-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-preimage-projection-value) |
| `NC.3/invariant-preimage-projection-kernel` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-preimage-projection-kernel) |
| `NC.3/invariant-preimage-projection-surjective` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-invariant-preimage-projection-surjective) |
| `NC.3/kernel-preimage-permutation-kernel` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-preimage-permutation-kernel) |
| `NC.3/kernel-invariant-class-action` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-class-action) |
| `NC.3/kernel-invariant-class-lift` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-class-lift) |
| `NC.3/kernel-invariant-class-value` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-class-value) |
| `NC.3/kernel-invariant-lift-independence` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-lift-independence) |
| `NC.3/kernel-invariant-gauge-inclusion` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-gauge-inclusion) |
| `NC.3/kernel-invariant-ambient-constant` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-ambient-constant) |
| `NC.3/kernel-invariant-fibre-orbit` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-fibre-orbit) |
| `NC.3/kernel-orbit-image-equivalence` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-image-equivalence) |
| `NC.3/kernel-orbit-image-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-image-value) |
| `NC.3/kernel-orbit-image-inverse-witness` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-image-inverse-witness) |
| `NC.3/kernel-orbit-image-inverse-projection` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-image-inverse-projection) |
| `NC.3/kernel-orbit-image-choice-independence` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-image-choice-independence) |
| `NC.3/kernel-invariant-injectivity-characterisation` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-invariant-injectivity-characterisation) |
| `NC.3/kernel-inclusion-neutral-range` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-inclusion-neutral-range) |
| `NC.3/kernel-orbit-neutral-fibre-equivalence` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-neutral-fibre-equivalence) |
| `NC.3/kernel-orbit-neutral-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-neutral-value) |
| `NC.3/kernel-orbit-neutral-inverse-witness` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-neutral-inverse-witness) |
| `NC.3/kernel-orbit-neutral-basepoint` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-neutral-basepoint) |
| `NC.3/kernel-orbit-neutral-inverse` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-kernel-orbit-neutral-inverse) |
| `NC.3/twist-neutral-fibre-equivalence` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-neutral-fibre-equivalence) |
| `NC.3/twist-neutral-fibre-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-neutral-fibre-value) |
| `NC.3/twist-neutral-fibre-inverse-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-neutral-fibre-inverse-value) |
| `NC.3/twist-neutral-fibre-basepoint` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twist-neutral-fibre-basepoint) |
| `NC.3/twisted-kernel-invariant-action` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-invariant-action) |
| `NC.3/twisted-kernel-invariant-action-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-invariant-action-value) |
| `NC.3/twisted-kernel-invariant-inclusion` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-invariant-inclusion) |
| `NC.3/twisted-kernel-invariant-fibre-orbit` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-invariant-fibre-orbit) |
| `NC.3/twisted-kernel-orbit-fibre-equivalence` | [0.36](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-equivalence) |
| `NC.3/twisted-kernel-orbit-fibre-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-value) |
| `NC.3/twisted-kernel-orbit-fibre-inverse-value` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-inverse-value) |
| `NC.3/twisted-kernel-orbit-fibre-left-inverse` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-left-inverse) |
| `NC.3/twisted-kernel-orbit-fibre-right-inverse` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-right-inverse) |
| `NC.3/twisted-kernel-orbit-fibre-basepoint` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-basepoint) |
| `NC.3/twisted-kernel-orbit-fibre-choice-independent` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-orbit-fibre-choice-independent) |
| `NC.3/twisted-kernel-invariant-injectivity-iff` | [0.47](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-twisted-kernel-invariant-injectivity-iff) |
| `NC.3/equivariant-topological-torsors` | [0.40](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#nc-3-equivariant-topological-torsors) |

## Added construction targets

| Target | Reader section |
| --- | --- |
| Raw étale homotopy type (`raw-etale-prospace`) | [1.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#raw-etale-prospace) |
| Homotopy fibre of an elementary curve fibration (`elementary-homotopy-fibre`) | [1.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#elementary-homotopy-fibre) |
| Geometric pro-p and arithmetic p-power comparison (`pro-p-curve-comparison`) | [1.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#pro-p-curve-comparison) |
| Cofinal hyperbolic Artin neighbourhoods (`cofinal-artin-neighbourhoods`) | [1.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#cofinal-artin-neighbourhoods) |
| Neutral tensor category and Hopf reconstruction (`neutral-tensor-reconstruction`) | [2.1](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#neutral-tensor-reconstruction) |
| Two-step geometric Malcev quotient (`two-step-malcev`) | [2.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#two-step-malcev) |
| Jacobian differential and rational Kummer comparison (`jacobian-differential-kummer`) | [2.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#jacobian-differential-kummer) |
| Two-augmentation multiplicative comparison (`pointed-multiplicative-comparison`) | [2.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#pointed-multiplicative-comparison) |
| Good-reduction comparison over ramified p-adic fields (`ramified-endpoint-comparison`) | [2.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#ramified-endpoint-comparison) |
| Integral tangential realization and comparison (`integral-tangential-realizations`) | [2.11](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#integral-tangential-realizations) |
| Good-model inertia and arithmetic factorization (`good-model-unramified-paths`) | [2.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#good-model-unramified-paths) |
| Centre-free extension pullback (`centre-free-extension-pullback`) | [3.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#centre-free-extension-pullback) |
| Finite-dimensional final topology on unipotent points (`unipotent-final-topology`) | [4.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#unipotent-final-topology) |
| Effective filtered affine torsor descent (`effective-filtered-torsor-descent`) | [4.4](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#effective-filtered-torsor-descent) |
| All-algebra local invariant lifting and differences (`central-local-invariant-lifts`) | [4.7](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#central-local-invariant-lifts) |
| Tangential global Selmer conditions (`tangential-selmer-conditions`) | [4.9](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#tangential-selmer-conditions) |
| Local abelian logarithm (`abelian-logarithm`) | [5.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#abelian-logarithm) |
| Coleman and abelian logarithm comparison (`coleman-abelian-comparison`) | [5.8](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#coleman-abelian-comparison) |
| Mordell–Weil logarithmic span and annihilators (`padic-closure-dimension`) | [5.10](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#padic-closure-dimension) |
| Strassmann on a compact analytic chart (`strassmann-bound`) | [5.6](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#strassmann-bound) |
| Density on every open residue subdisc (`every-subdisc-density`) | [5.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#every-subdisc-density) |
| Finite actual away-place Kummer images (`finite-away-kummer-image`) | [5.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#finite-away-kummer-image) |
| Proper-curve Mordell–Weil Selmer cut (`mordell-weil-selmer-cut`) | [5.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#mordell-weil-selmer-cut) |
| Tangential Albanese and period maps (`tangential-albanese`) | [5.12](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#tangential-albanese) |
| Relative cycle and Chow–Heegner comparison (`relative-cycle-mixed-extension`) | [6.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#relative-cycle-mixed-extension) |
| Witt character and the surface relation (`free-lie-character`) | [7.3](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#free-lie-character) |
| Soulé rational Tate cohomology (`soule-rational-tate-cohomology`) | [7.5](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#soule-rational-tate-cohomology) |
| Compact-coordinate cocycle comparison (`compact-coefficient-cohomology`) | [4.2](../packages/AnabelianGeometryAndNonabelianChabauty/README.md#compact-coefficient-cohomology) |

## Accepted-node edits to inspect

Nineteen implementation-status-only acceptance clauses were replaced by the explicit sign-kernel example S₃→C₂ with A₃ and its two nonidentity 3-cycles. Gauge-helper process checks were replaced by the neutral-cocycle S₃ stabilizer and noncommuting gauge witness. All named mathematical tests survive. Other process words in proof sketches were replaced by their mathematical references, including the inline Soulé supplier and the ramified and good-model comparisons. Most edits below replace a prerequisite with its exact native, lower-tier or new local supplier. Statement/hypothesis changes are separately visible here. Existing accepted mathematical corrections mentioned above were retained, rather than newly attributed to this author.

| Node tail | Fields changed relative to accepted input |
| --- | --- |
| `NC.0/raw-homotopy-comparison` | `proofSteps`, `prerequisites` |
| `NC.0/elementary-fibration` | `proofSteps`, `prerequisites` |
| `NC.1/local-galois-centre-free` | `prerequisites` |
| `NC.1/arithmetic-chern-comparison` | `prerequisites` |
| `NC.1/weight-zero-quotient` | `prerequisites` |
| `NC.1/geometric-outer-comparison` | `proofSteps`, `prerequisites` |
| `NC.2/unipotent-length` | `prerequisites` |
| `NC.2/invariant-vector-criterion` | `prerequisites` |
| `NC.2/tannakian-groups` | `prerequisites` |
| `NC.2/tensor-paths` | `prerequisites` |
| `NC.2/length-algebra` | `prerequisites` |
| `NC.2/universal-object-existence` | `prerequisites` |
| `NC.2/finite-path-module` | `prerequisites` |
| `NC.2/crystalline-path-coordinates` | `proofSteps`, `prerequisites` |
| `NC.2/finite-path-comparison` | `prerequisites` |
| `NC.2/depth-one-jacobian` | `prerequisites` |
| `NC.3/unipotent-point-topology` | `statement`, `proofSteps`, `acceptance`, `prerequisites` |
| `NC.3/filtered-affine-torsor-comparison` | `prerequisites` |
| `NC.3/galois-coefficient-family` | `statement`, `hypotheses`, `proofSteps`, `prerequisites` |
| `NC.3/local-condition-geometry` | `prerequisites` |
| `NC.3/central-selmer-dimension` | `proofSteps`, `prerequisites`, `sources` |
| `NC.4/crystalline-period` | `prerequisites` |
| `NC.4/local-etale-albanese` | `prerequisites` |
| `NC.4/global-etale-albanese` | `prerequisites` |
| `NC.4/residue-disc-density` | `prerequisites` |
| `NC.5/rank-picard-criterion` | `prerequisites` |
| `NC.5/pair-of-heights` | `prerequisites` |
| `NC.5/pair-finite-locus` | `prerequisites` |
| `NC.5/finite-bad-height-image` | `prerequisites` |
| `NC.5/height-module-comparison` | `prerequisites` |
| `NC.5/chow-heegner-class` | `prerequisites` |
| `NC.6/kim-dimension-conjecture` | `statement`, `hypotheses`, `prerequisites` |
| `NC.6/kim-conjecture` | `hypotheses`, `prerequisites` |
| `NC.6/thrice-punctured-depth-one` | `hypotheses`, `proofSteps`, `prerequisites` |
| `NC.6/genus-zero-dimension` | `prerequisites` |
| `NC.6/graded-central-dimensions` | `prerequisites` |
| `NC.3/invariant-coset-representability` | `sources` |
| `NC.4/dimension-finiteness` | `hypotheses` |
| `NC.6/h2-growth-bound` | `proofSteps` |
| `NC.6/vanishing-implies-dimension` | `hypotheses` |
| `NC.6/cm-rank-one-finiteness` | `hypotheses` |
| `NC.6/pseudo-null-implies-dimension` | `proofSteps` |
| `NC.3/continuous-cocycles` | `tests` |
| `NC.3/central-extension` | `proofSteps`, `acceptance`, `tests` |
| `NC.3/functoriality` | `proofSteps` |
| `NC.3/normal-h1-kernel` | `proofSteps` |
| `NC.3/exact-sequence` | `proofSteps` |
| `NC.0/products` | `proofSteps` |
| `NC.3/h1-finite-quotient-equivalence` | `proofSteps` |
| `NC.3/torsor-classification` | `acceptance` |
| `NC.0/smooth-curve` | `proofSteps` |

## Downloaded source versions

All URLs identify public sources actually retrieved. Hashes identify the version read; no source file is included in the repository. The Labute hash is the entire journal-volume scan containing the inspected pages. HTML Stacks and Achinger sources are identified in the verification table, without pretending to have PDF hashes.

| Source | Version URL | SHA-256 |
| --- | --- | --- |
| `kim2005` | [Source](https://arxiv.org/pdf/math/0409456v1) | `00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941` |
| `kim2009` | [Source](https://content.ems.press/assets/public/full-texts/serials/prims/45/1/2127/online/10.2977-prims-1234361156.pdf) | `b06562bc28c5648152b54d5539af8b8a4cf902192eeb37f36b0db5dfc45a4566` |
| `bdmtv` | [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | `e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8` |
| `bdii` | [Source](https://kclpure.kcl.ac.uk/ws/portalfiles/portal/149873897/QC2.pdf) | `42208acc10fc5eaa54c55fe20305c8f687a9f6888b80776ef52bf58ad268cbe6` |
| `bd1` | [Source](https://arxiv.org/pdf/1601.00388v2) | `1b8006eed69c262ab051e398e614478da38d46be73f8ed91a892834d2b38ae25` |
| `kt` | [Source](https://ora.ox.ac.uk/objects/uuid:debfa65b-85aa-4877-96f7-40dc0f29c272/files/mb07826c07e1bc11e2aa481362bb229ae) | `fb2365247c678e992ef313b373d625373f62d78ba1ae5fc3b0d0d7c6b662a1a9` |
| `chen2024` | [Source](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf) | `9386db34c31671966440f18bccfefe11bd806aa221010e0e3336fecf8ff920ac` |
| `T97` | [Source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1992BA14A2D63FA076DB39A34EC45E83/S0010437X97000614a.pdf/grothendieck_conjecture_for_affine_curves.pdf) | `af7e7aef3ecf0c9747f30fa7126116af923d0644a9a512c584aa69c8bb16e508` |
| `M96` | [Source](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms030305.pdf) | `90f4e3b19a7797b34ee7e87c25dfeacaa4ae11beef21d60bb30346776c76b950` |
| `M99` | [Source](https://www.kurims.kyoto-u.ac.jp/~motizuki/The%20Local%20Pro-p%20Anabelian%20Geometry%20of%20Curves.pdf) | `6e7ffd16f4c074068cc616a051bfcfba04a4dc412b1ee7465c732d0383b8a2cc` |
| `besser` | [Source](https://arxiv.org/pdf/math/0011269v1) | `35d1b109d891dea711d2b557c1e81f826d6da73498ee82c7732185283702e2b7` |
| `schmidt-curve-1996` | [Source](https://www.numdam.org/article/CM_1996__100_2_233_0.pdf) | `dc0350a302b5bc02de91a368790d40be1292dbcdcad108d21c08426affae1791` |
| `schmidt-stix-2016` | [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf) | `6e9083efdb484e6f3dae456bcb55fa8369e2ab35a727da36809f8611eef70759` |
| `bdckw-2018v4` | [Source](https://arxiv.org/pdf/1209.0640v4) | `1cc3059dea942d17edad028fdde8f6d0ec410bdab14ad19565237115b0855c52` |
| `achinger-effacement-2014-v1` | [Source](https://arxiv.org/pdf/1407.0337v1) | `7c26b2ca8df1b73bd6acd89872955cd6a1137de0933a948914f8cc5689d86791` |
| `labute67` | [Source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0004/PPN356556735_0004.pdf) | `8404e96198364d00790941ad79c8ec887a58b07033a1dde48e65473cfa49203a` |
| `olsson` | [Source](https://drive.google.com/uc?export=download&id=1oKDHVwLEl1xvwZ23l49R6qJrXjjCVNSg) | `de921cfedd9b75b6871175cbd13334586cc263733daf9d540cd9428d23cf771d` |
| `M95` | [Source](https://www.kurims.kyoto-u.ac.jp/~motizuki/The%20Geometry%20of%20the%20Compactification%20of%20the%20Hurwitz%20Scheme.pdf) | `637a3fd7d18ef511c57e5a4d59b7e28aede3a08bd9518cf160ec14c344638e6e` |
| `M96C` | [Source](https://www.kurims.kyoto-u.ac.jp/~motizuki/The%20Profinite%20Grothendieck%20Conjecture%20for%20Closed%20Hyperbolic%20Curves%20over%20Number%20Fields%20%28comments%29.pdf) | `b6e66e8230bab4737b2a936a6b6cbd3234233eb48ae766b8158175390f976456` |
| `M99C` | [Source](https://www.kurims.kyoto-u.ac.jp/~motizuki/The%20Local%20Pro-p%20Anabelian%20Geometry%20of%20Curves%20%28comments%29.pdf) | `e01d70acf57510305038d55eabaf1aea348ddf9a6b4db13798f6387d51c2b5f3` |
| `hadian` | [Source](https://d-nb.info/1007452307/34) | `8c929b3fcf134e0588c009a2f8985ccda06b271eae9998b4298c12d2ad548bce` |
| `stix-2008v1` | [Source](https://arxiv.org/pdf/0809.0017v1) | `b456de5edf8dcbd52b5e414d24a87ff942908aac6f06fe2b7f175b32695d21bb` |
| `kim2009v4` | [Source](https://arxiv.org/pdf/math/0510441v4) | `7b404331925f1d8e9bce81e9b16473f0d65a7f1ac2948ccff0db3a6e7b0d0f19` |
| `kim2009v5` | [Source](https://arxiv.org/pdf/math/0510441v5) | `4f8f523dac11ad758e8f3c1166f9d7b71fe197532641133176e57183f85d6286` |
| `poonen-rational-points` | [Source](https://math.mit.edu/~poonen/papers/Qpoints.pdf) | `42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579` |
| `deligne-milne` | [Source](https://www.jmilne.org/math/xnotes/tc2022.pdf) | `a7ff08ac1404cee28675b45446c0c778b0bc32fb34d351087db0d0825f2c0c0e` |
| `cls` | [Source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7CD9502BBD4CC7DA8B364C29B371E0EF/S0010437X99000159a.pdf/div-class-title-f-isocristaux-unipotents-div.pdf) | `1cb6fa0524a54af2522d3db947e65ba5e94725b7f41347196dc0155a9e2f0ccb` |
| `bdmtv23` | [Source](https://arxiv.org/pdf/2101.01862v4) | `738f0ec0cd588e20a569bc029fe2bb9611abc5d16fee7d36f9e966357c25f61d` |
| `kim2008` | [Source](https://d-nb.info/1372511016/34) | `2a3cb8cf170ddeb841a750bcfdff4478a5696e8bb5a3872bc340947af7497e53` |
| `farb-kisin-wolfson-2024-v2` | [Source](https://arxiv.org/pdf/2110.05534v2) | `f281f903f7a1836ef0eb7abe718c78e72f481d059cecb91dd237e6ecfe83b26b` |
