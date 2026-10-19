# Independent review: Heights, rational points and obstructions, Part II

Job `REV-DESIGN-HeightsRationalPointsAndObstructionsPartII` · issue #3544 · Codex session `codex-v4rKwF` · 2026-10-19.

**Verdict: accepted as a complete target-level planning pass.** All 112 nodes were checked; 57 were corrected, 55 verified unchanged, none added or removed, and none left unverifiable. All ten baseline declarations are confirmed. Eight proof/source gaps remain explicit, and all thirteen stages retain `planned` coverage. This is not a closed or formalized roadmap.

The resulting inventory is 13 constructions, 11 definitions, 86 theorems and 2 comparisons; 121 API entries, 80 definition/construction tests, 16 planets, 28 supplier contracts and twelve source versions. Every definition and construction has at least three discriminating tests.

## Mathematical corrections

The largest corrections concern component degrees, non-very-ample Hilbert examples, shrinking and twisting family embeddings, Betti-measure normalization, translation into generated subgroups with a factor-four height margin, geometric traces, field descent, specialization, and the parameter space and characteristic hypotheses in Yuan’s uniformity proof. The complete correction inventory follows; the packet also contains one verdict for every node.

| Target | Correction |
|---|---|
| `UB.0/subvariety-degree` | Strengthened the equality condition: a line union a point on it is a counterexample to the original API. Restricted the product formula to geometric integrality when degrees ignore nilpotent multiplicities. |
| `UB.1/restricted-hilbert-scheme` | Replaced a non-very-ample principal product polarization by a valid very ample example. |
| `UB.1/restricted-hilbert-family` | Added A2 for the relatively ample symmetric bundle; PEL representability alone does not construct it. |
| `UB.1/points-cut-family` | Made the nonempty-family hypothesis explicit. The finite set is required to be nonempty. Removed an unsupported numerical bound on the number of individual points; dimension bounds rounds of simultaneous cuts. |
| `UB.1/generic-locus-closure` | Replaced the sum map by the difference-sum map, which works for translates not containing zero. |
| `UB.2/level-hypothesis` | Matched DGH Remark 3.1: generic-fibre projective normality and a base twist do not assert a global free basis for π_*L. Corrected the embedding API to match the proof input. |
| `UB.2/height-inequality-total-space` | Recorded the rational constant and common denominator required for the line bundle in DGH §4.3. |
| `UB.2/height-inequality-level` | Moved the height-inequality planet to the geometric level theorem; the final general export is a comparison and is not a planet. |
| `UB.2/height-inequality` | Made the general Weil-height export a comparison with the general dynamical theorem owned by AH.5; UB.2 retains the geometric construction and the level case. Clarified ownership of the general inequality. |
| `UB.3/betti-equilibrium-measure` | Separated unconditional Betti-form integration from the graph-degree normalization proved with a generic small sequence. Replaced an undefined disintegration/product-measure claim by the actual top-wedge formula. Added the Betti-form locators and retained componentwise products rather than assuming irreducibility of a fibre product. |
| `UB.3/family-equidistribution` | Restricted the Haar-measure example to the ambient abelian variety. |
| `UB.3/uniform-bogomolov` | Completed the translation and height rescaling before the first exceptional-set application, rather than only for its components. Distinguished the node’s proved extension from the source theorem, which assumes generation. |
| `UB.3/uniform-manin-mumford` | Made the finite-configuration specialization argument explicit. |
| `UB.4/base-point-bound` | Removed an impossible dimension branch from the proof of DGH Lemma 6.4. |
| `UB.4/family-height-gap` | A moduli pullback can fail ampleness on Hilbert fibres. Aligned the height hypothesis. |
| `UB.4/polarized-height-gap` | Specified the exact isogeny and polarization identities used to rescale heights and degrees. |
| `UB.5/embedding-constants` | DGH chooses addition/difference polynomials; no minimum over ℚ̄ representations is proved attained. Adjusted the definition after removing the unproved minimum. Made the choice part of the API. Tracked the polynomial choice under conjugation. Removed a false nonexample conflating a sufficient power criterion with a necessary condition. |
| `UB.5/embedding-constants-bound` | Bounded the statement to the controlled universal embedding actually proved by DGH, and exposed the general-polarization supplier gap. |
| `UB.5/remond-vojta` | Prevented applying the principal universal-embedding estimate to arbitrary projective coordinates and polarization types. Kept the Faltings-height substitution conditional in the proof as well as the statement. |
| `UB.5/remond-mumford` | Prevented applying the principal universal-embedding estimate to arbitrary projective coordinates and polarization types. Kept the Faltings-height substitution conditional in the proof as well as the statement. |
| `UB.5/subvariety-height-removal` | Removed an invalid hypersurface-cutting argument, required a nonempty set and positive dimension, and recorded arithmetic interpolation as a missing key input. Aligned the degenerate check with the positive-dimension hypothesis. |
| `UB.5/large-points-bound` | Separated the non-strict counting threshold from the inequality contradiction. |
| `UB.5/remond-counting` | Supplied qualitative finiteness before minimizing over point configurations. |
| `UB.6/masser-specialization` | Replaced the false dense-set-intersection argument by an explicit unresolved joint-specialization obligation. Specified geometric endomorphism rings, after spreading their generators over a finite extension. Corrected the constant-family test: nonconstant sections can specialize to torsion even in a constant scheme. |
| `UB.6/good-model-ueno` | Removed an impossible instruction to avoid all CM fibres. |
| `UB.6/small-moduli-height-finite` | Used the full torsion representation bound, valid even when the base field does not contain the required roots of unity. Replaced the invalid twists example by the relevant Northcott obstruction. |
| `UB.7/small-points` | Height-zero points over K̄ are controlled by the geometric trace, not only the trace over K. |
| `UB.7/special-subvariety` | Corrected the trace to the geometric trace and reconciled irreducible torsion translates with the subvariety convention. Updated the tests and API to use the geometric trace T. |
| `UB.8/torsion-bounded-order` | Required geometric trace zero, as GH does, so Lang–Néron remains applicable over the bounded-degree compositum. |
| `UB.8/special-points-product` | Specified the field of definition required by the bounded-degree torsion argument. |
| `UB.8/curve-base-height-inequality` | Added the vertical case omitted by the generic-fibre proof. |
| `UB.8/geometric-bogomolov-char-zero` | Made the big-polarization choice in the characteristic-zero extension explicit. |
| `UB.9/defined-up-to-isogeny` | Limited the trace comparison to the regular setting supplied by the parent. |
| `UB.9/isogeny-two-subfields` | Expanded the missing dependent-fields induction and added its direct subvariety-descent prerequisite. |
| `UB.9/minimal-fields` | Explained the reduction to the finite-transcendence hypothesis of the intersection theorem. |
| `UB.9/special-field` | Supplied the minimal-polynomial argument for the general-field descent, including the infinite-conjugate and inseparable cases. |
| `UB.9/multi-section` | Required the characteristic in which the Legendre equation and stated 2-torsion example apply. |
| `UB.9/torsion-multisection-class` | Distinguished the rigidified line bundle from the untwisted divisor bundle. |
| `UB.9/yamaki-reduction` | Corrected both the geometric trace and the distinction between potential good reduction and an existing good model over K. |
| `UB.9/reduction-to-good-reduction` | Kept the reduction trace-free after finite extension. |
| `UB.9/sum-varieties` | Excluded the empty set from dimension inequalities. Matched the nonempty convention in the statement. Corrected the reason the point counterexample fails the stabilization API. |
| `UB.9/sums-torsion` | Replaced an impossible elliptic-curve example and avoided selecting a nonexistent height-zero point. |
| `UB.9/geometric-bogomolov` | Made irreducibility explicit; a reducible closed set is treated componentwise. |
| `UB.10/small-points-bound-families` | Excluded a zero-dimensional base from the counterexample to potential bigness. |
| `UB.10/non-isotrivial-point` | Added the finite-type and base-field compatibility required by the dimension characterization. The closure dimension description needs finite-type k-data. |
| `UB.10/fibre-power-nondegeneracy` | Removed an irrelevant and misleading subgroup-free condition. Excluded m=0 from bounds m≥dim S. |
| `UB.10/abel-power-nondegeneracy` | Excluded m=0 from bounds m≥dim S. Specified the shifted Faltings–Zhang map rather than leaving an undefined symbol. |
| `UB.10/relative-bogomolov-bigness` | Made the relative Deligne pairing and pullback explicit, without an ambiguous second pushforward. Used a strict margin below the lower height bound. |
| `UB.10/relative-bogomolov-curves` | Corrected an off-by-one example that falsely asserted Bogomolov for the entire genus-two Jacobian. |
| `UB.11/isotrivial-pair` | Gave an explicit function field supporting the moving point. |
| `UB.11/isotriviality-criteria` | Removed the unsupported claim that the isotriviality criterion itself fails without level. |
| `UB.11/noetherian-induction-bound` | Distinguished horizontal and vertical bases in noetherian induction. Matched MC.4’s fixed-pairing fine scheme, whose integral base includes ζ_N. |
| `UB.11/characteristic-uniformity` | Corrected the parameter space of the exceptional locus and exposed the finite-characteristic supplier obligation. Used the fine symplectic-level supplier over its actual cyclotomic base, finite flat over ℤ[1/N]. Specified the prime-to-p level component in the remaining-characteristic argument. |
| `UB.12/bielliptic-diagonal-lift` | Read and recorded the published PDF, including Proposition 9.2 absent from arXiv v2. |
| `UB.12/bielliptic-uniform-manin-mumford` | Explained the factor sixteen using the two finite maps separately. Read and recorded the published PDF, including Proposition 9.2 absent from arXiv v2. |
| `UB.12/bielliptic-uniform-bogomolov` | Used exact torsion invariance of the same canonical height, without changing L_X. Read and recorded the published PDF, including Proposition 9.2 absent from arXiv v2. |
| `UB.12/unbounded-torsion-order` | Read and recorded the published PDF, including Proposition 9.2 absent from arXiv v2. |

## Baseline and ownership

Mathlib was checked at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. No baseline name was removed. Two descriptions were made precise: projectivization height is field-relative until RP.0 applies absolute normalization; intermediate-field lattice instances require the Adjoin/Defs import. The row-echelon predicate exists, while uniqueness remains a target.

| Declaration | Pinned module and line | Provides |
|---|---|---|
| `mathlib:EuclideanSpace` | `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114` | Real Euclidean space ℝⁿ as PiLp 2, the carrier of the ball-packing bound. |
| `mathlib:Metric.closedBall` | `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:421` | Closed balls in a pseudometric space. |
| `mathlib:MeasureTheory.Measure.addHaar_closedBall` | `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:500` | The Haar measure of a closed ball of radius r ≥ 0 is r^{dim} times that of the unit ball, the volume comparison behind ball packing. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean:62` | Finite rank of a module, used for the dimension of the Néron–Tate space. |
| `mathlib:Projectivization.logHeight` | `Mathlib/NumberTheory/Height/Projectivization.lean:51` | The field-relative logarithmic height on projectivization for an admissible family of absolute values. For a number field K its absolute normalization requires division by [K:ℚ], as supplied by RP.0; no absolute-height identification is inferred from this declaration alone. |
| `mathlib:Matrix.IsReducedRowEchelon` | `Mathlib/LinearAlgebra/Matrix/Echelon/Basic.lean:89` | The reduced row echelon predicate; its uniqueness, absent at the pin, is the linear core of Xie–Yuan Lemma 3.4. |
| `mathlib:IntermediateField` | `Mathlib/FieldTheory/IntermediateField/Basic.lean:52` | Intermediate fields of a field extension, the carriers of the fields of definition in Xie–Yuan §3. The complete lattice instances, including infimum, top and bottom, are in Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:72, explicitly imported by Suggested.lean. |
| `mathlib:Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | Transcendence degree as the supremum of cardinalities of algebraically independent sets. |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Span of a set in a module, for descent of subspaces. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Abelian varieties over a field as proper geometrically integral group schemes over Spec K. |

The reviewed library audit was read. Current Tau Ceti has elliptic canonical-height, pairing and regulator interfaces; it does not supply the general abelian-scheme, generic trace or uniformity carriers planned here. The current upstream EllipticCurves (including Layer 6) and JacobianChallenge documents were read near the required density; the parent roadmap’s PR #1017 README was read at §§0.16–0.21, 0.25–0.35, 1.7–1.11 and the relevant §5 targets.

The nine post-snapshot upstream roadmaps and four Completed roadmaps were screened. Completed/EffectiveBounds Layer 0 already owns lattice packing and box/polydisc doubling; UB.0’s arbitrary Euclidean-ball covering with the exact (1+2R/r)^ρ estimate is different and uses Mathlib carriers. None of those upstream targets is replanned. The general dynamical inequality stays with AH.5; UB.2’s final node is a comparison/export, while its geometric level proof remains here.

All concrete external prerequisite statements were read, including split packets; stage-only needs have precise supplier contracts. In particular, MC.4’s fixed symplectic-level scheme has cyclotomic base ℤ[1/N,ζ_N], MC.6 gives finite Torelli fibres rather than a finite morphism, and MC.7 supplies section-free maps. The new direct A2 and MC.4 prerequisites and layer requirements reflect those contracts. The DY.6/native elliptic height normalization discrepancy is recorded in `upstreamNotes`, with UB.12 using the source’s intrinsic degree-one height instead.

## Sources and remaining gaps

Every cited target locator was read in the version recorded in `sources` and `sourceVersions`. Twelve PDF hashes distinguish preprints, the Yuan author manuscript, and published copies. Rémond’s scanned formulas on pp. 105–106 were also inspected as images. The published DKY §§8.4–9.5 and Theorem 1.10 supply the corrected numbering and Proposition 9.2, absent from arXiv v2. The references to inaccessible secondary sources remain explicit gaps; their statements were checked only in the cited primary restatements, not represented as directly read.

The packet’s formerly empty `sourceIssues` now records 34 independently checked findings, including repairs already found in the atlas. Each has its own verdict, locator, argument and version scope. Published GGK and DKY findings concern their published PDFs; XY findings concern arXiv v1, and Yuan findings concern the 21 August 2024 author manuscript. The Springer landing page is a subscription preview; the Annals Yuan page supplies metadata without public full text. Neither is claimed as a full version-of-record collation. No passages or book files were copied into the repository.

The eight open inputs are:

- **Rémond’s Décompte read only through Gao–Ge–Kühne Appendix A.** Rémond, Décompte dans une conjecture de Lang (Invent. Math. 142 (2000), Propositions 3.3–3.4, Lemma 3.1, Lemme 6.1) could not be obtained; its statements are taken from GGK Appendix A, which restates them with n = deg_L A/g! − 1. Rémond’s Vojta paper (Ann. SNS Pisa 2000, Théorème 1.1) was read and agrees with GGK Theorem A.1. The proofs (explicit Mumford inequality, isolated fibres, height of X) are Rémond’s quantitative versions of the parent’s Vojta method and need their own lemma-level plan. In particular, UB.5/subvariety-height-removal needs arithmetic interpolation, not a Bézout argument using hypersurfaces containing X. Supply that estimate with its finite nonempty-set and positive-dimension hypotheses.
- **David–Philippon’s form of Rémond’s bound not read.** David–Philippon, Comment. Math. Helv. 77 (2002), Theorem 6.8 and p. 643, is cited as DGH and GGK quote it; the explicit exponent and the lower bound for heights on X° in terms of h₀(A) were not checked at the source.
- **Chow-form heights compared with arithmetic-intersection heights.** The comparison between the Weil height of the Chow form and the Bost–Gillet–Soulé height of a cycle (Philippon, Math. Ann. 289 (1991); Bost–Gillet–Soulé, J. Amer. Math. Soc. 7 (1994)) was not read; the papers routed here only fix some height of cycles. The parent’s projective cycle heights (RP.5) plan the coefficient-height comparison it rests on.
- **Masser’s 1989 specialization theorem not read.** Masser, Trans. Amer. Math. Soc. 311 (1989), Main Theorem and Scholium 1 (Zariski density of specializations injective on a finitely generated group of sections) could not be downloaded and is taken as GGK cite it; Masser 1996 (endomorphism rings) was read. The precise missing step is simultaneous density of subgroup-injective and endomorphism-preserving fibres via a common quantitative exceptional-set bound. Separate Zariski-density assertions cannot be intersected to prove it.
- **Yamaki’s reduction theorem cited, not planned.** Yamaki, J. reine angew. Math. 2018, Theorem 1.5 (statement checked against arXiv 1405.0896v5), reducing the geometric Bogomolov conjecture to the nowhere degenerate trace-free part, rests on Gubler’s tropical equidistribution at places of bad reduction; no roadmap of the atlas plans it. It is an input theorem here.
- **Positive-characteristic step of Yuan §4.4.3 omitted in the source.** The initial exceptional locus lies in J, not S. Induct on its horizontal components using theta potential bigness after restriction; after normalization only finitely many vertical characteristics remain. For these use Theorem 4.2(2) over a prime-to-p symplectic-level component over 𝔽_p with the level roots adjoined. Theorem 4.10 cannot be applied directly to a vertical base, which is not flat over ℤ. A proof uniform in all constant-field extensions is still needed; the source omits it on p. 84.
- **Jacobi model of bielliptic genus-two curves cited.** DeMarco–Krieger–Ye cite the model y² = x⁶ − s₁x⁴ + s₂x² − 1 from Shaska–Völklein and Jacobi and McMullen’s Theorem 4.10; neither is planned in the atlas.
- **Controlled embedding constants for general polarization types.** DGH (8.4), (8.7) bounds c_NT and a chosen addition-polynomial height for its fixed principally polarized universal-family embeddings. GGK §7.1 invokes the extension to arbitrary fixed polarization degree, citing David–Philippon (6.41). That direct source and the corresponding theta-embedding construction have not been checked here. The general bound must be established before substituting h_Fal into the raw Rémond inequalities. Arbitrary projective coordinate changes cannot satisfy a moduli-only bound.

## Orchestrator decisions and handoff

Accept the corrected design and schedule the precise open-stage obligations; do not advertise proof closure. Keep the four unrelated Part II routes in their separate design jobs, with the homogeneous-space foundation preceding its zero-cycle consumer as proposed by the original scope split. Preserve the AH.5 ownership boundary and notify the ArithmeticDynamics owner of the native-height normalization bridge. These decisions do not block this review verdict.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HeightsRationalPointsAndObstructionsPartII.json`: zero errors, zero warnings. Source-issue schema and source-version checks pass. An additional audit checks 112 unique node verdicts, every node’s literal statement/API/test/acceptance content in the reader, definition test counts, source identifiers and layer requirements. `git diff --check` passes.

`lean-check research/blueprint/suggested/HeightsRationalPointsAndObstructionsPartII.lean` exits zero at the pinned Mathlib: nine warnings, all declarations using `sorry`, no other warning. Imports were narrowed to the modules used, including `IntermediateField.Adjoin.Defs`. The file has one light real-bodied definition; it asserts milestones without developing absent carriers. Nothing is claimed proved by these checks.
