# Independent review: geometry of numbers and quadratic arithmetic

**Verdict: needs_changes.** Codex session `codex-rtOQ9t`, job `REV-GeometryOfNumbersAndQuadraticArithmetic`, 5 October 2026. The authoring session was `codex-5ebb6f`; this reviewer did none of that work. This is a finished review of the complete input, not a sample or an interrupted review.

Checked all 157 inherited nodes, their sources/hypotheses, proof sketches, direct prerequisites, acceptance properties, APIs and tests; all 176 baseline declarations and surrounding variables in 88 modules; the complete 2,479-line input suggested file; all seven reviewed library-audit rows; all ten inherited source findings; the stage targets, 35 planets and handed RT finding. The resulting 169 entries have verdicts: 99 verified, 43 corrected, 12 added and 15 unverifiable. Every node has its individual result in `review.checked`.

The rejection is not for having honest acquisition or proof gaps. It is for specific unresolved API/source/closure obligations, for a target inventory that claims the genus definition realizes field invariants and integral comparison targets it does not realize, and for missing declaration-sized transitions at the issue's required lemma level. GN.0 and GN.1 remain planned. GN.2–GN.6 are partial, with precise remaining lists. The input's under-budget complete/all-planned claim is corrected to partial. No layer is closed.

## Material corrections

- Extended local density to empty generic fibre, with a separate eventual-empty-count lemma. This branch is necessary for the polynomial at k=0; a nonempty-fibre dimension assumption cannot apply there. Compact nested Gram-solution loci prove eventual emptiness. Initial quotients can have spurious solutions: norm x²+y²=3 over the unramified quadratic extension of Q₃ has one solution modulo 3 and none modulo 9.
- Corrected the proper mass example: a rank-one SO stabilizer is trivial, so proper mass equals class count there. The integral square lattice has four proper isometries and contributes 1/4.
- Corrected box polarity: the polar of a coordinate box is a weighted cross-polytope. The oppositely indexed minima products still equal one.
- Removed the convex-only compactness prerequisite from the nonconvex star-body definition; compactness is its own data, and convex comparison requires the extra hypothesis.
- Supplied missing direct minimum positivity/absorbency/compactness and basis-rank dependencies; corrected the finite-level representation base ring, source locators/excerpts and four baseline declaration kinds.
- Replaced invalid test kinds; corrected the LLL mirror URL and a wrong page excerpt. Split the independent declarations listed below; kept every implementation status unchecked.
- Narrowed ordinary K.4 to the actual S-construction/delooping nodes and K.6 to its actual Frobenius-pair spectrum comparison. K.6 does not supply the four-condition s-filtering exact quotient, shifted residue duality or a hermitian swindle. These missing interfaces are gaps.

## Added declarations

| ID suffix | Statement or role |
| --- | --- |
| empty-generic-density-zero | Eventually empty integral representation counts |
| lattice-inclusion-localizations | Integral lattice inclusion detected locally |
| isotropic-reduction-metabolic | Metabolic comparison for isotropic reduction |
| symmetric-diagonal-lagrangian | Diagonal Lagrangian for opposite forms |
| grothendieck-witt-forgetful-map | Forgetful map on Grothendieck–Witt groups |
| grothendieck-witt-hyperbolic-map | Hyperbolic map from the exact Grothendieck group |
| witt-hyperbolic-cokernel | Witt group as the hyperbolic cokernel |
| classical-dg-bott-triangle | Classical hermitian Bott triangle |
| hermitian-cone-category | Hermitian cone category |
| hermitian-cone-contractible | Contractibility of the hermitian cone space |
| hermitian-suspension-completion | Loop comparison under hermitian completion |
| nonconnective-hyperbolic-comparison | Nonconnective hyperbolic comparison |

Each has `addedBy` equal to this review job, its checked source or labelled derivation, and separate prerequisites. The additions split intersection/inclusion, isotropic reduction/metabolicity, Witt inverse/cokernel, forgetful/hyperbolic maps, shifted periodicity/Bott triangle, cone/swindle/suspension, completion/delooping, and spectrum/hyperbolic comparison. Their exact categorical or local-field signatures remain named gaps where the supplier types are unavailable.

## Remaining changes required

| Node | Exact unresolved obligation |
| --- | --- |
| proper-spinor-genus | The proper spinor-genus orbit specification is reasonable, but its exact source/adelic stabilizer comparison and nontrivial spinor-norm examples have not been established. |
| hermitian-lattice-invariants | The elementary-divisor existence/uniqueness input for a finite torsion DVR quotient has no exact supplying declaration. The scalar-change and classification references do not establish it. |
| lll-exact-reduction | The algorithm construction still bundles non-routine nearest-integer, swap, potential decrease and termination results. The source was read, but the required lemma-sized chain and matching exact examples are incomplete. |
| exact-category-duality | The source exact-duality construction is correctly scoped, but its typed TauCeti exact/conflation/sign API is absent; the native strong-duality record alone does not supply it. |
| exact-lagrangian | Actual admissible kernel/quotient and exact-dual maps are missing from the prototype. Some examples remain abstract assertions rather than concrete discriminating Lagrangians. |
| hyperbolic-space | The classical hyperbolic construction is correctly stated without dividing by two, but its exact duality context and native API/examples are still only comments. |
| isotropic-reduction | The quotient form and metabolic comparison were split, but the actual exact quotient/five-lemma adapters and corresponding API examples remain missing. |
| exact-grothendieck-witt-group | The source GW0 presentation is read; its typed symmetric isometry class, metabolic relation and universal group map are not yet supplied. |
| exact-witt-group | The Witt presentation, diagonal lemma and hyperbolic cokernel were separated; the typed quotient/API and actual field comparison remain incomplete. |
| hermitian-q-construction | The Qh bicartesian kernel criterion is stated correctly, but closure of representatives and pullback composition/category laws are still undecomposed non-routine arguments. |
| grothendieck-witt-space | The genuine nerve realization and pointed fibre context is missing. The hyperbolic ordinary-K comparison needs its own precise source/scalar functor, beyond the fibre definition. |
| quaternionic-integral-hermitian-data | The noncommutative order/right-module specification is explicit, but its quaternionic hermitian source and exact dual/localization interfaces are not acquired. |
| higher-grothendieck-witt-groups | The higher groups have the correct pointed homotopy-group convention, but no actual pointed homotopy/H-space supplier is named to type the construction and its examples. |
| hermitian-suspension | Cone and swindle were separated from the suspension quotient. The actual filtering quotient and induced exact duality are not supplied, and design warnings remain among its unit tests. |
| nonconnective-hermitian-spectrum | Spectrum assembly is separated from its hyperbolic comparison, but the genuine spectrum/loop/cofinality context and discriminating examples are not established. |

GN.5 additionally needs separate nearest-integer shear, adjacent-swap Gram–Schmidt update, positive prefix potential, strict decrease and termination declarations. GN.4 has no critical determinant or extremal lattice declaration; its star-body carrier alone does not realize that target. The source proof of covering transference and the complete hermitian cone setup were independently read during this review; they need splitting, not another claim that only their statements were read.

The suggested file faithfully retains the corrected mathematical contracts in an explicitly nonexecutable catalogue. A catalogue entry is not a typed API lemma or executable test. Native structure projections are actual declarations, so their appearance in comments is not by itself a defect. The outstanding entries concern missing exact quotient/duality/local-field/homotopy contexts and concrete examples. Warning sentences such as “no ordinary K carrier is asserted” are not unit tests and must become actual computations or counterexamples. The readonly campaign reader contains no contradictory implementation claim and is outside the issue's deliverable allowlist.

## RT-AREA-algebraicnt-1/1 and ownership

This finding concerns **direct supplier contracts**, not transitive graph reachability. QuadraticFormInvariants layers 1,3,4,5,6, GlobalQuadraticForms layers 5,6, and completed IntegralLattices layers 1,2,4 still need exact GN.2 comparison declarations. The field Witt comparison points to the actual layer 4. Field classifiers cannot produce integral isometries; completed IntegralLattices is symmetric over Z and cannot supply generic nonfree Dedekind or quaternionic modules. AdelicAlgebraicGroups AA.2 supplies Haar/quotient/L² structure and AA.3 supplies reduction/finite volume.

The four upstream/proposed suppliers already occurred transitively. That does not settle /1. The packet records the missing direct imports/comparisons and forwards the reciprocal immutable upstream `consumers` changes to the maintainer in `upstreamNotes`. The campaign reader/atlas metadata are outside this review's editable files. Orchestrator: retain this obligation when arranging the next revision, and carry the same contracts into the reader. The separate rejected unowned-Siegel finding is not revived. Hermitian stable Poincaré theory remains owned by HermitianKTheoryOfPoincareCategories, not an invented GN or ordinary-K interface.

## Source verification and source mistakes

Only the selected passages below were independently read; no claim of reading entire books or foundational proofs cited by those passages is made. URLs and hashes identify the acquired versions. Original Hironaka/Gan–Yu/Cho–Yamauchi, maximal-mass, Ratner, Howe–Moore and related proof acquisitions remain exactly the recorded gaps.

| Source | Physical PDF pages independently read | URL |
| --- | --- | --- |
| Couveignes2020 | 7,8 | [read version](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf) |
| HoreshKarasik2023 | 9,32,33,34,37,38,39 | [read version](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf) |
| HoreshKarasik2021v2 | 28,29,33,34 | [read version](https://arxiv.org/pdf/2012.04508v2) |
| EvertseGeometry | 10,13,14,15,16,17 | [read version](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf) |
| Henk2002 | 1,2,3,4,5,6,7 | [read version](https://arxiv.org/pdf/math/0204158v1) |
| Voight2026 | 157,158,159,160,161,162,163,164,165,166,167,168 | [read version](https://jvoight.github.io/quat-book.pdf) |
| VoightPublisher2021 | 160 | [read version](https://link.springer.com/content/pdf/10.1007/978-3-030-56694-4.pdf) |
| VoightErrata2026 | 2,3 | [read version](https://jvoight.github.io/quat-errata.pdf) |
| LiZhangDensity | 8,9,15,16,17,18,19 | [read version](https://arxiv.org/pdf/1908.01701v3) |
| Schlichting2010 | 5,6,7,8,9,12,13,14,17,18,36,37,49,50,51,55,56,57,58 | [read version](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf) |
| Benoist2019 | 5,6,7,20 | [read version](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf) |
| BhargavaShankar2010 | 14 | [read version](https://arxiv.org/pdf/1006.1002v2) |
| MorrisArithmetic | 59,94,95,96,97,422,423,424,426,427,428,429 | [read version](https://arxiv.org/pdf/math/0106063v6) |
| RegevTransference | 1,2,3,4,5,6 | [read version](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf) |
| StephensDavidowitz2019 | 1,2,3,4,5,6 | [read version](https://arxiv.org/pdf/1907.09020) |
| Duke1988 | 2,3 | [read version](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf) |
| Kirschmer2013 | 2,3,4 | [read version](https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf) |
| SchlichtingDerived | 2,3,4,46,47,57,58,59,60 | [read version](https://arxiv.org/pdf/1209.0848v3) |
| CalmesIII | 37,38,39,51,52,53 | [read version](https://arxiv.org/pdf/2009.07225v4) |
| LLL1982 | Rendered physical pages 2–8 in full; the scanned text extraction is empty | [academic mirror](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf) |

Confirmed inherited E1–E10 at their exact versions: rational span versus integral lattice; nonsaturated torsion quotient; absolute determinant; rectangular adjugate versus Gram inverse; wrong projected basis symbol; inversion/Haar; positive orientation versus determinant one; n versus r; ceil versus floor; and finitely generated DVR modules versus torsion-free modules. Publisher/preprint differences in Horesh–Karasik are retained. Voight E10 was checked in both the publisher PDF and updated author copy.

Added E11: the Evertse linear-transport remark requires an invertible map; the zero map destroys fullness/interior. E12: Voight's normalized atomic coefficient triple is not unique under integral isometry; the substitution (x,y)→(x+y/3,y/3) over Z₂ gives [1,1,1] and [1,1,1/3]. E13: Schlichting Example 2.2 omits “projective”; Z/2 has zero Z-bidual. E14: Morris's prose before 20.3.3 omits “unipotent”; the same book gives diagonal-flow fractal counterexamples. E12 is scoped to v1.0.7u, E13 to the acquired author copy, E14 to arXiv v6, not unread publisher editions. The packet gives the bounded errata searches and reviewer verdict for all fourteen findings. Nothing was sent to authors.

## Baseline and validation

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All cited declarations exist, including explicitly generated additive aliases, and their actual statements plus namespace/section variables were read. Corrected the kinds of Real.le_rpow_inv_iff_of_pos, mem_frontier_iff_notMem_interior, isBounded_iff_forall_norm_le', and MeasureTheory.Measure.volume_pi_eq_dirac to lemma. Removed the incompatible direct convex compactness edge; the global baseline declaration remains valid for its other convex consumers. Canonical number-field embeddings, Blichfeldt/Minkowski, class-group bound and Dirichlet endpoint are imports, not re-planned definitions.

Indexed `python3 scripts/check_blueprint.py` reports **0 errors, 0 warnings**. Independent exact arithmetic verified the atomic substitution in 81 rational pairs, the two finite norm counts, all four SO square-lattice isometries and the weighted box/polar products. These computations support the counterexamples; they do not prove the general theorems. Source hashes and imports at the pin were checked. All added nodes, review entries, 35 planets (at most six per stage), API/test catalogue names and deliverable paths are checked.

**Lean was not compiled by this reviewer.** The available existing compiled tree has the required Mathlib pin but a different Tau Ceti commit; the correct Tau Ceti source has no compiled build. WORKERS forbids building libraries or creating a new project. The author's old elaboration receipt is retained as `priorValidation`; it is not presented as verification of this modified file.

## Complete correction record

Each non-test correction is recorded below. The final row lists every test whose invalid kind was normalized, without obscuring the separate mathematical test defects.

| Scope | Change |
| --- | --- |
| LLL1982 source/sourceVersions URL | Correct misspelled academic mirror URL; initial 404, corrected URL fetched and SHA-256 matches the original recorded PDF. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-orthonormal-coordinates | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-uniform-bound | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-tail-product | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/orthonormal-cube-volume | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/inscribed-cube | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/intrinsic-ball-lower-bound | Replace a labelled paraphrase by a short literal Couveignes excerpt and precise printed/physical locator; remove the redundant nonliteral generic Mathlib source while retaining actual baseline dependencies and worker-derivation attribution. |
| GeometryOfNumbersAndQuadraticArithmetic/E1 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E2 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E3 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E4 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E5 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E6 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E7 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E8 | Add independent confirmed verdict with actual published/preprint scope and the mathematical reason. |
| GeometryOfNumbersAndQuadraticArithmetic/E2 | Correct the preprint finite-group passage locator from page 33 to page 34; the definition and proposition statement begin on 33, but the erroneous paragraph is on 34. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum | Remove the duplicated identical downstream DiophantineApproximation use; the consumer contract remains. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/minimum-outside-subspace | Make the already-read mathlib:absorbent_nhds_zero a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/minimum-outside-subspace | Make the already-read mathlib:ConvexBody.isCompact a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/minimum-outside-subspace | Make the already-read mathlib:IsCompact.isVonNBounded a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-le-iff | Make the already-read mathlib:absorbent_nhds_zero a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-le-iff | Make the already-read mathlib:ConvexBody.isCompact a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-le-iff | Make the already-read mathlib:IsCompact.isVonNBounded a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses | Make the already-read mathlib:absorbent_nhds_zero a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/crosspolytope-containment | Make the already-read mathlib:absorbent_nhds_zero a direct prerequisite supplying the absorbency/boundedness hypotheses of the cited gauge law. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/lattice-determinant-lower-bound | Add the actual restrictScalars construction named in the proof as a direct prerequisite; previously present in baseline but absent from this consumer. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-linear-equiv | Replace the generic attainment citation by the actual change-of-coordinates remark and document the required nonsingularity correction. |
| GeometryOfNumbersAndQuadraticArithmetic/E11 | Record the independently found missing nonsingularity hypothesis in the course notes, with a zero-map counterexample, bounded primary-source correction search and confirmed review verdict. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis | Add the actual basis-cardinality/rank law used to choose the adapted-basis dimensions as a direct prerequisite. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.0/integral-rational-flag | Add the actual basis-cardinality/rank law used to choose the adapted-basis dimensions as a direct prerequisite. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-box-volume-ratio | Make the compact convex-body carrier explicit, matching the suggested Lean and the finite-volume conversion in the proof. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.1/first-box-volume | Make the compact convex-body carrier explicit, matching the suggested Lean and the finite-volume conversion in the proof. |
| mathlib:Real.le_rpow_inv_iff_of_pos | Correct the declaration kind to lemma after reading the pinned source. |
| mathlib:mem_frontier_iff_notMem_interior | Correct the declaration kind to lemma after reading the pinned source. |
| GeometryOfNumbersAndQuadraticArithmetic/E9 | Independently confirm the floor/ceiling misprint against rendered preprint and proof. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-gram-schmidt-growth | Replace the misplaced (1.10) excerpt by the literal proof heading on the actually cited LLL page 3. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-hermitian-count | Correct representation-scheme base-ring evaluation: Gram entries are in O_F/π^N, but scheme points are over O_{F₀}/π^N. Retain the q normalization. |
| GeometryOfNumbersAndQuadraticArithmetic/E10 | Independently confirm the unrestricted DVR freeness error against both editions and published errata. |
| GeometryOfNumbersAndQuadraticArithmetic/E12 | Record the independently found false atomic-representative uniqueness assertion with an explicit Z₂-unit change of variables and bounded primary correction search. |
| mathlib:isBounded_iff_forall_norm_le' | Correct declaration kind to lemma at the pinned source. |
| mathlib:MeasureTheory.Measure.volume_pi_eq_dirac | Correct declaration kind to lemma at the pinned source. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.3/empty-generic-density-zero | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density | Extend the density to empty generic fibre; this resolves the k=0 empty branch required by the Siegel-polynomial interpolation. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity | Correct the false proper rank-one mass test and give an explicit proper stabilizer of order four. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.4/compact-star-body | Remove the convex-only compactness prerequisite from the nonconvex star-body definition. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower | Correct reciprocal-box wording: the actual polar of a box is a cross-polytope. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-upper | Replace a non-test disclaimer by the sharp rank-one instance. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-inclusion-localizations | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations | Split inclusion detection from the intersection equality. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction-metabolic | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction | Split the metabolic comparison from the quotient-form construction. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-diagonal-lagrangian | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group | Separate the diagonal inverse proof and the hyperbolic cokernel comparison from the Witt-group construction. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-forgetful-map | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-hyperbolic-map | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/witt-hyperbolic-cokernel | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-forgetful-relations | Split two map constructions and the exact sequence from the composite formula. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/classical-dg-bott-triangle | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity | Separate the Bott triangle from the four-shift comparison. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-cone-category | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-cone-contractible | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension | Split the cone category and its hermitian swindle from the suspension quotient. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-completion | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping | Split completion/cofinality from the suspension delooping theorem. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hyperbolic-comparison | Add a separate declaration, with independent prerequisites, from the checked source passage. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum | Split the hyperbolic comparison from genuine spectrum assembly. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group | Point the field Witt/GW group comparison to its actual layer 4 owner. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line | Remove the broad ordinary K.6 prerequisite: its Frobenius-pair spectrum is not the claimed four-condition exact quotient or derived duality adapter. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization | Remove the broad ordinary K.6 prerequisite: its Frobenius-pair spectrum is not the claimed four-condition exact quotient or derived duality adapter. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization | Remove the broad ordinary K.6 prerequisite: its Frobenius-pair spectrum is not the claimed four-condition exact quotient or derived duality adapter. |
| RT-AREA-algebraicnt-1/1 | Correct the field-target inventory and explicitly record the outstanding direct comparison declarations instead of claiming the genus definition realizes them. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.2 | Downgrade coverage to partial at the issue's required lemma level. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.3 | Downgrade coverage to partial at the issue's required lemma level. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.4 | Downgrade coverage to partial at the issue's required lemma level. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.5 | Downgrade coverage to partial at the issue's required lemma level. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6 | Downgrade coverage to partial at the issue's required lemma level. |
| GeometryOfNumbersAndQuadraticArithmetic/E13 | Record an additional visually checked source omission with a bounded correction search and exact version scope. |
| GeometryOfNumbersAndQuadraticArithmetic/E14 | Record an additional visually checked source omission with a bounded correction search and exact version scope. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction | Add the functoriality/compatibility API needed after splitting its formerly bundled comparison. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension | Add the functoriality/compatibility API needed after splitting its formerly bundled comparison. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum | Add the functoriality/compatibility API needed after splitting its formerly bundled comparison. |
| TauCeti.GeometryOfNumbersPlan.gram_det_orthonormal_coordinates_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.gram_det_orthonormal_coordinates_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.gram_det_orthonormal_coordinates_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_coordinate_hadamard_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_coordinate_hadamard_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_coordinate_hadamard_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.hermitian_gram_hadamard_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.hermitian_gram_hadamard_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.hermitian_gram_hadamard_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.gram_uniform_bound_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.gram_uniform_bound_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.gram_uniform_bound_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.covolume_square_gram_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.covolume_square_gram_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.covolume_square_gram_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_tail_product_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_tail_product_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_tail_product_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_product_root_bound_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_product_root_bound_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.ordered_product_root_bound_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_cube_volume_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_cube_volume_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.orthonormal_cube_volume_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.inscribed_cube_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.inscribed_cube_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.inscribed_cube_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.intrinsic_ball_lower_bound_test_1 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.intrinsic_ball_lower_bound_test_2 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| TauCeti.GeometryOfNumbersPlan.intrinsic_ball_lower_bound_test_3 | Normalize the inherited hyphenated proposed name and add its explicit admitted small-case example to the suggested file. |
| 64 test-kind corrections | gram-det-orthonormal-coordinates-test-1, gram-det-orthonormal-coordinates-test-2, gram-det-orthonormal-coordinates-test-3, orthonormal-coordinate-hadamard-test-1, orthonormal-coordinate-hadamard-test-2, orthonormal-coordinate-hadamard-test-3, hermitian-gram-hadamard-test-1, hermitian-gram-hadamard-test-2, hermitian-gram-hadamard-test-3, gram-uniform-bound-test-1, gram-uniform-bound-test-2, gram-uniform-bound-test-3, covolume-square-gram-test-1, covolume-square-gram-test-2, covolume-square-gram-test-3, ordered-tail-product-test-1, ordered-tail-product-test-2, ordered-tail-product-test-3, ordered-product-root-bound-test-1, ordered-product-root-bound-test-2, ordered-product-root-bound-test-3, orthonormal-cube-volume-test-1, orthonormal-cube-volume-test-2, orthonormal-cube-volume-test-3, inscribed-cube-test-1, inscribed-cube-test-2, inscribed-cube-test-3, intrinsic-ball-lower-bound-test-1, intrinsic-ball-lower-bound-test-2, intrinsic-ball-lower-bound-test-3, covering_radius_test_1, covering_radius_test_2, covering_radius_test_3, dual_transference_upper_test_1, dual_transference_upper_test_2, dual_transference_upper_test_3, covering_dual_transference_test_1, covering_dual_transference_test_2, covering_dual_transference_test_3, maximal_integral_mass_formula_test_1, maximal_integral_mass_formula_test_2, maximal_integral_mass_formula_test_3, higher_grothendieck_witt_groups_test_1, higher_grothendieck_witt_groups_test_2, higher_grothendieck_witt_groups_test_3, hermitian_suspension_test_1, hermitian_suspension_test_2, hermitian_suspension_test_3, hermitian_suspension_delooping_test_1, hermitian_suspension_delooping_test_2, nonconnective_hermitian_spectrum_test_1, nonconnective_hermitian_spectrum_test_2, nonconnective_hermitian_spectrum_test_3, mixed_embedding_normalization_test_1, mixed_embedding_normalization_test_2, blichfeldt_native_interface_test_1, blichfeldt_native_interface_test_2, minkowski_first_native_interface_test_1, minkowski_first_native_interface_test_2, minkowski_first_native_interface_test_3, ideal_class_application_import_test_1, ideal_class_application_import_test_2, unit_application_import_test_1, unit_application_import_test_2 |

Reviewer metadata, coverage/target statuses, `continuation`, the corrected catalogue and the replacement validation receipt were updated consistently. The report and `review.checked` are the handoff; no ephemeral scratch path is needed.

## Every baseline citation

| Reference | Pinned module read |
| --- | --- |
| mathlib:Matrix.gram | Mathlib/Analysis/InnerProductSpace/GramMatrix.lean |
| mathlib:Matrix.gram_eq_conjTranspose_mul | Mathlib/Analysis/InnerProductSpace/GramMatrix.lean |
| mathlib:Matrix.det_gram_ne_zero_iff_linearIndependent | Mathlib/Analysis/InnerProductSpace/GramMatrix.lean |
| mathlib:Matrix.posSemidef_gram | Mathlib/Analysis/InnerProductSpace/GramMatrix.lean |
| mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean |
| mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis_det | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean |
| mathlib:norm_inner_le_norm | Mathlib/Analysis/InnerProductSpace/Basic.lean |
| mathlib:Matrix.det_mul | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean |
| mathlib:Matrix.det_conjTranspose | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean |
| mathlib:finrank_span_eq_card | Mathlib/LinearAlgebra/Dimension/Constructions.lean |
| mathlib:Orientation.abs_volumeForm_apply_le | Mathlib/Analysis/InnerProductSpace/Orientation.lean |
| mathlib:IsZLattice | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Module.Basis.ofZLatticeBasis | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:ZSpan.fundamentalDomain_ae_parallelepiped | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:ZLattice.covolume | Mathlib/Algebra/Module/ZLattice/Covolume.lean |
| mathlib:ZLattice.covolume_eq_det_mul_measureReal | Mathlib/Algebra/Module/ZLattice/Covolume.lean |
| mathlib:ZLattice.covolume_pos | Mathlib/Algebra/Module/ZLattice/Covolume.lean |
| mathlib:ZLattice.covolume_div_covolume_eq_relIndex' | Mathlib/Algebra/Module/ZLattice/Covolume.lean |
| mathlib:OrthonormalBasis.volume_parallelepiped | Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean |
| mathlib:OrthonormalBasis.measurePreserving_repr | Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean |
| mathlib:PiLp.volume_preserving_ofLp | Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean |
| mathlib:Real.volume_Icc_pi | Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean |
| mathlib:EuclideanSpace.real_norm_sq_eq | Mathlib/Analysis/InnerProductSpace/PiL2.lean |
| mathlib:Real.le_rpow_inv_iff_of_pos | Mathlib/Analysis/SpecialFunctions/Pow/Real.lean |
| mathlib:Submodule.exists_smith_normal_form_of_le | Mathlib/LinearAlgebra/FreeModule/PID.lean |
| mathlib:instModuleFinite_of_discrete_submodule | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:instModuleFree_of_discrete_submodule | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:ZLattice.comap_discreteTopology | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Module.Basis.isUnitSMul | Mathlib/LinearAlgebra/Basis/SMul.lean |
| mathlib:Submodule.ker_orthogonalProjectionOnto | Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean |
| mathlib:Submodule.isCompl_orthogonal | Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean |
| mathlib:ZSpan.discreteTopology_pi_basisFun | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:instIsZLatticeRealSpan | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Module.Basis.restrictScalars | Mathlib/LinearAlgebra/Basis/Submodule.lean |
| mathlib:stdOrthonormalBasis | Mathlib/Analysis/InnerProductSpace/PiL2.lean |
| mathlib:Module.Basis.prod | Mathlib/LinearAlgebra/Basis/Prod.lean |
| mathlib:Submodule.prodEquivOfIsCompl | Mathlib/LinearAlgebra/Projection.lean |
| mathlib:Matrix.det_fromBlocks_zero₂₁ | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean |
| mathlib:OrthonormalBasis.sum_inner_mul_inner | Mathlib/Analysis/InnerProductSpace/PiL2.lean |
| mathlib:LinearMap.BilinForm.dualSubmodule | Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean |
| mathlib:ZLattice.comap | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Submodule.inner_orthogonalProjectionOnto_eq_of_mem_left | Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean |
| mathlib:LinearMap.BilinForm.dualBasis | Mathlib/LinearAlgebra/BilinearForm/Properties.lean |
| mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis | Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean |
| mathlib:Module.Basis.ofZLatticeBasis_span | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:LinearMap.BilinForm.apply_dualBasis_right | Mathlib/LinearAlgebra/BilinearForm/Properties.lean |
| mathlib:LinearMap.BilinForm.dualBasis_eq_iff | Mathlib/LinearAlgebra/BilinearForm/Properties.lean |
| mathlib:OrthonormalBasis.inner_eq_ite | Mathlib/Analysis/InnerProductSpace/PiL2.lean |
| mathlib:Submodule.finrank_add_finrank_orthogonal | Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean |
| mathlib:ConvexBody | Mathlib/Analysis/Convex/Body.lean |
| mathlib:ConvexBody.coe_smul | Mathlib/Analysis/Convex/Body.lean |
| mathlib:ConvexBody.isClosed | Mathlib/Analysis/Convex/Body.lean |
| mathlib:ConvexBody.isCompact | Mathlib/Analysis/Convex/Body.lean |
| mathlib:IsCompact.isVonNBounded | Mathlib/Analysis/LocallyConvex/Bounded.lean |
| mathlib:LinearEquiv.finrank_eq | Mathlib/LinearAlgebra/Dimension/Finrank.lean |
| mathlib:MeasureTheory.Measure.addHaar_image_linearMap | Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean |
| mathlib:MeasureTheory.volume_sum_rpow_le | Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean |
| mathlib:Real.Gamma_nat_eq_factorial | Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean |
| mathlib:Real.sInf_nonneg | Mathlib/Algebra/Order/Archimedean/Real/Basic.lean |
| mathlib:Set.exists_min_image | Mathlib/Data/Set/Finite/Lemmas.lean |
| mathlib:Submodule.finrank_mono | Mathlib/LinearAlgebra/Dimension/Constructions.lean |
| mathlib:ZSpan.setFinite_inter | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:absorbent_nhds_zero | Mathlib/Analysis/LocallyConvex/Basic.lean |
| mathlib:basisOfLinearIndependentOfCardEqFinrank' | Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean |
| mathlib:gauge | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_eq_zero | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_le_of_mem | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_le_one_iff_mem_closure | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_neg | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_nonneg | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_pos | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_smul_left_of_nonneg | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_smul_of_nonneg | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_sum_le | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:linearIndependent_finSucc' | Mathlib/LinearAlgebra/LinearIndependent/Lemmas.lean |
| mathlib:LinearMap.det_toLin' | Mathlib/LinearAlgebra/Determinant.lean |
| mathlib:LinearMap.equivOfDetNeZero | Mathlib/LinearAlgebra/Determinant.lean |
| mathlib:MeasureTheory.Measure.addHaar_preimage_linearMap | Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean |
| mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure | Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean |
| mathlib:ZSpan.isAddFundamentalDomain' | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:ZSpan.volume_fundamentalDomain | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:gauge_closedBall | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:volume_euclideanSpace_eq_dirac | Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean |
| mathlib:Matrix.det_diagonal | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean |
| mathlib:Subgroup.index | Mathlib/GroupTheory/Index.lean |
| mathlib:Subgroup.relIndex | Mathlib/GroupTheory/Index.lean |
| mathlib:AddSubgroup.FiniteIndex | Mathlib/GroupTheory/Index.lean |
| mathlib:Subgroup.finite_quotient_of_finiteIndex | Mathlib/GroupTheory/Index.lean |
| mathlib:QuotientGroup.eq_iff_div_mem | Mathlib/GroupTheory/QuotientGroup/Defs.lean |
| mathlib:Nat.card_le_card_of_injective | Mathlib/SetTheory/Cardinal/Finite.lean |
| mathlib:Nat.card_prod | Mathlib/SetTheory/Cardinal/Finite.lean |
| mathlib:Nat.card_fun | Mathlib/SetTheory/Cardinal/Finite.lean |
| mathlib:Nat.card_zmod | Mathlib/SetTheory/Cardinal/Finite.lean |
| mathlib:Nat.card_coe_set_eq | Mathlib/Data/Set/Card.lean |
| mathlib:Set.ncard_image_of_injective | Mathlib/Data/Set/Card.lean |
| mathlib:ZMod.intCast_zmod_eq_zero_iff_dvd | Mathlib/Data/ZMod/Basic.lean |
| mathlib:Module.finBasisOfFinrankEq | Mathlib/LinearAlgebra/Dimension/Free.lean |
| mathlib:ZLattice.rank | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Nat.lt_floor_add_one | Mathlib/Algebra/Order/Floor/Semiring.lean |
| mathlib:Convex.midpoint_mem | Mathlib/Analysis/Convex/Basic.lean |
| mathlib:ConvexBody.convex | Mathlib/Analysis/Convex/Body.lean |
| mathlib:AddSubgroup.index_range_nsmul | Mathlib/GroupTheory/IndexNSmul.lean |
| mathlib:Module.finrank_eq_card_basis | Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean |
| mathlib:Module.Basis.constr | Mathlib/LinearAlgebra/Basis/Defs.lean |
| mathlib:Module.Basis.equiv | Mathlib/LinearAlgebra/Basis/Defs.lean |
| mathlib:Module.Basis.flag | Mathlib/LinearAlgebra/Basis/Flag.lean |
| mathlib:Module.Basis.span | Mathlib/LinearAlgebra/Basis/Basic.lean |
| mathlib:Finset.prod_lt_prod | Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean |
| mathlib:Module.Basis.sum_repr | Mathlib/LinearAlgebra/Basis/Defs.lean |
| mathlib:Module.Basis.equivFun | Mathlib/LinearAlgebra/Basis/Defs.lean |
| mathlib:Subgroup.index_map_equiv | Mathlib/GroupTheory/Index.lean |
| mathlib:Subgroup.index_pi | Mathlib/GroupTheory/Index.lean |
| mathlib:Int.index_zmultiples | Mathlib/Data/ZMod/QuotientGroup.lean |
| mathlib:Module.Basis.mem_flag_iff_repr_eq_zero | Mathlib/LinearAlgebra/Basis/Flag.lean |
| mathlib:Module.Basis.ofZLatticeBasis_repr_apply | Mathlib/Algebra/Module/ZLattice/Basic.lean |
| mathlib:Nat.floor_mono | Mathlib/Algebra/Order/Floor/Semiring.lean |
| mathlib:Convex.addHaar_frontier | Mathlib/Analysis/Convex/Measure.lean |
| mathlib:Convex.translate | Mathlib/Analysis/Convex/Basic.lean |
| mathlib:Convex.add_smul_sub_mem | Mathlib/Analysis/Convex/Basic.lean |
| mathlib:MeasureTheory.measure_iUnion₀ | Mathlib/MeasureTheory/Measure/NullMeasurable.lean |
| mathlib:MeasureTheory.measure_preimage_mul_right | Mathlib/MeasureTheory/Group/Measure.lean |
| mathlib:Homeomorph.image_interior | Mathlib/Topology/Homeomorph/Defs.lean |
| mathlib:IsCompact.image | Mathlib/Topology/Compactness/Compact.lean |
| mathlib:isCompact_iUnion | Mathlib/Topology/Compactness/Compact.lean |
| mathlib:IsCompact.isClosed | Mathlib/Topology/Separation/Hausdorff.lean |
| mathlib:IsClosed.measurableSet | Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean |
| mathlib:measurable_measure_prodMk_right | Mathlib/MeasureTheory/Measure/Prod.lean |
| mathlib:MeasureTheory.Measure.prod_apply_symm | Mathlib/MeasureTheory/Measure/Prod.lean |
| mathlib:MeasureTheory.lintegral_mono | Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean |
| mathlib:LinearMap.det_prodMap | Mathlib/LinearAlgebra/Determinant.lean |
| mathlib:LinearMap.det_smul | Mathlib/LinearAlgebra/Determinant.lean |
| mathlib:MeasureTheory.Measure.prod.instIsHaarMeasure | Mathlib/MeasureTheory/Group/Measure.lean |
| mathlib:gauge_def' | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:mem_frontier_iff_notMem_interior | Mathlib/Topology/Closure.lean |
| mathlib:MeasureTheory.measure_iUnion_null_iff | Mathlib/MeasureTheory/OuterMeasure/Basic.lean |
| mathlib:MeasureTheory.measure_union_null | Mathlib/MeasureTheory/OuterMeasure/Basic.lean |
| mathlib:MeasureTheory.measure_mono_null | Mathlib/MeasureTheory/OuterMeasure/Basic.lean |
| mathlib:interior_subset_gauge_lt_one | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:gauge_add_le | Mathlib/Analysis/Convex/Gauge.lean |
| mathlib:Equiv.piEquivPiSubtypeProd | Mathlib/Logic/Equiv/Prod.lean |
| mathlib:Pi.card_Icc | Mathlib/Data/Pi/Interval.lean |
| mathlib:Int.card_Icc | Mathlib/Data/Int/Interval.lean |
| mathlib:Homeomorph.piEquivPiSubtypeProd | Mathlib/Topology/Homeomorph/Lemmas.lean |
| mathlib:MeasureTheory.volume_preserving_piEquivPiSubtypeProd | Mathlib/MeasureTheory/Constructions/Pi.lean |
| mathlib:IsCompact.measure_lt_top | Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean |
| mathlib:MeasureTheory.Measure.addHaar_smul_of_nonneg | Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean |
| mathlib:IsCompact.isBounded | Mathlib/Topology/MetricSpace/Bounded.lean |
| mathlib:isBounded_iff_forall_norm_le' | Mathlib/Analysis/Normed/Group/Bounded.lean |
| mathlib:MeasureTheory.measureReal_mono | Mathlib/MeasureTheory/Measure/Real.lean |
| mathlib:Fin.prod_univ_succ | Mathlib/Algebra/BigOperators/Fin.lean |
| mathlib:tendsto_add_mul_div_add_mul_atTop_nhds | Mathlib/Analysis/SpecificLimits/Basic.lean |
| mathlib:le_of_tendsto' | Mathlib/Topology/Order/OrderClosed.lean |
| mathlib:MeasureTheory.Measure.volume_pi_eq_dirac | Mathlib/MeasureTheory/Constructions/Pi.lean |
| mathlib:Convex.linear_image | Mathlib/Analysis/Convex/Basic.lean |
| mathlib:ZLattice.volume_image_eq_volume_div_covolume' | Mathlib/Algebra/Module/ZLattice/Covolume.lean |
| mathlib:Module.finrank_fintype_fun_eq_card | Mathlib/LinearAlgebra/Dimension/Constructions.lean |
| mathlib:Submodule.IsLattice | Mathlib/Algebra/Module/Lattice.lean |
| mathlib:QuadraticMap | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean |
| mathlib:QuadraticForm | Mathlib/LinearAlgebra/QuadraticForm/Basic.lean |
| mathlib:LinearMap.IsSymm | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean |
| mathlib:LinearMap.Nondegenerate | Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean |
| mathlib:Matrix.conjTranspose | Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean |
| mathlib:InnerProductSpace.gramSchmidt | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean |
| mathlib:InnerProductSpace.gramSchmidt_ne_zero | Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean |
| mathlib:CategoryTheory.Functor.rightOp | Mathlib/CategoryTheory/Opposites.lean |
| mathlib:FreeAbelianGroup | Mathlib/GroupTheory/FreeAbelianGroup.lean |
| mathlib:Polynomial | Mathlib/Algebra/Polynomial/Basic.lean |
| mathlib:Polynomial.derivative | Mathlib/Algebra/Polynomial/Derivative.lean |
| mathlib:Metric.infEDist | Mathlib/Topology/MetricSpace/HausdorffDistance.lean |
| mathlib:MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd | Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean |
| mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure | Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean |
| mathlib:NumberField.mixedEmbedding.finrank | Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean |
| mathlib:NumberField.mixedEmbedding.covolume_idealLattice | Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean |
| mathlib:NumberField.RingOfIntegers.instFintypeClassGroup | Mathlib/NumberTheory/NumberField/ClassNumber.lean |
| mathlib:NumberField.exists_ideal_in_class_of_norm_le | Mathlib/NumberTheory/NumberField/ClassNumber.lean |
| mathlib:NumberField.Units.finrank_modTorsion | Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean |
