# Independent review of revision 2

**Accepted as a complete, partial planning pass.** Codex session `codex-qkzybc`, job `REV-GeometryOfNumbersAndQuadraticArithmetic~2`, 9 October 2026. This session wrote neither authoring round. The earlier review report remains unchanged. The packet's new `review.checked` records an individual mathematical result for every node: **269 verified, 31 corrected, no added or unverifiable nodes**.

Acceptance applies to the 300-node pass at the protocol budget. All seven stages are partial, every implementation status remains unchecked, and no stage is closed. There are 68 precise gaps and 18 requests after correcting ownership and tier boundaries. This is not acceptance of the existing roadmap package, nor a claim that every advertised supplier signature has a native prototype. The issue explicitly permits acceptance of partial stages with honest remaining work.

I read all 300 statements, hypotheses, proof sketches, prerequisites, APIs and tests; the complete suggested file; the actual types of all 193 baseline declarations; the seven reviewed library-audit rows; the earlier review and revision handoff; the stage targets and 35 planets; the applicable ownership and tier records; and RT-AREA-algebraicnt-1 with its independent verification. Primary-source reading is scoped by the table below and each source's new `independentReading` receipt. Reading a theorem stated in these sources does not establish that I acquired its separately cited foundational proof.

| Layer | Nodes | Coverage after review |
| --- | ---: | --- |
| GN.0 | 17 | partial |
| GN.1 | 53 | partial |
| GN.2 | 55 | partial |
| GN.3 | 16 | partial |
| GN.4 | 46 | partial |
| GN.5 | 24 | partial |
| GN.6 | 89 | partial |

The packet has 147 lemmas, 53 theorems, 29 definitions, 28 constructions and 43 comparisons. Its definitions/constructions have 218 API entries and 176 test contracts; supplementary entries bring the totals to 294 API entries, 282 distinct API names and 403 test contracts. The suggested file has 364 anonymous admitted examples. None of these counts is a count of proved results. All 35 planets are central definitions, constructions or named theorems, with at most six in a stage.

## Corrections to the mathematics and source attribution

- **Orthogonal sum:** ranks add; Gram determinants multiply. The old third test confused them. The forms with rank-one Gram matrices `[2]` and `[3]` now test rank two and determinant six, with a matching native example. The source is Schlichting Definition 2.4, printed p.110, physical p.6.
- **Field Witt comparison:** added direct dependencies on the native exact Witt presentation and hyperbolic-cokernel comparison. The comparison uses split exactness and `q(x)=B(x,x)/2`; its precise field-supplier signature remains a gap. Schlichting Definition 2.8, printed p.112, physical p.8, supplies the presentation, rather than an integral-lattice result.
- **Covering transference:** shortest-vector transference does not by itself prove the lower covering bound. For a shortest nonzero dual vector `y`, the point `y/(2‖y‖²)` lies midway between integral pairing hyperplanes. Every lattice point is at distance at least `1/(2‖y‖)`. Added this proof and the attained-minimum dependency. Regev Theorem 4 still supplies the upper bound.
- **Critical determinant:** wrote admissibility as absence of nonzero interior lattice points, disambiguating the notation for the interior. The original equality with `{0}` was equivalent, including rank zero; this clarification is not a rank-zero counterexample. Corrected five Mahler locators to Definitions 5/7 and Theorems 2/4/6/8, printed pp.156–159. The existence proof now uses Theorem 2 for determinant-bounded lattices directly, rather than applying a covolume-one, dimension-at-least-two compactness statement to varying covolumes. In dimension one the minimum admissible spacing is the larger of the two gauge thresholds in the positive and negative directions; dimension zero uses the unique lattice of covolume one.
- **GN.5 scope:** retained the two planned generic LLL targets, but changed the stage and its arithmetic-application target to partial. Original-lattice membership and an approximation factor do not supply number-field height bounds, arithmetic counts or local representation tests. Their exact consumer adapters remain in `remaining`.
- **Spinor norms:** retained the good-prime unimodular theorem's rank-at-least-two assumption. Added the trivial SO/norm branch for ranks zero and one instead of applying that theorem outside its range.
- **Evertse E11:** rejected the inherited finding. Printed p.15, physical p.5, explicitly defines linear transformations to be invertible. The zero map therefore does not contradict the remark on printed pp.24–25. Removed the error attribution from the active node locator and source match; the explicit `LinearEquiv` hypothesis remains correct.

The complete edit record is `reviewCorrections` in the packet. No node ID was changed or added. No source passage or source file was placed in the repository.

## Earlier review obligations

The revision separates nearest-integer rounding, integral shear/swap certificates, all affected Gram–Schmidt transitions, prefix Gram integrality, strict potential decrease, the prefix invariant and lexicographic termination. Its exact loop state and certificates are native Lean data. I checked the original LLL pages and the full-row reduction variant; the remaining universal transition proofs and bit-complexity endpoint are not claimed implemented.

The exact-duality, Lagrangian, hyperbolic, isotropic quotient, GW/W presentation and formation interfaces now use Tau Ceti's actual exact structure, admissible maps, conflations and exact K0. The diagonal and graph Lagrangians and the short-five-lemma/descent chain separate the earlier hidden arguments. The native hermitian Q representatives, quotient relation, pullback closure and category laws are separate obligations. Cone diagrams, shift fractions, exact localization and the finite-component duality-compatible swindle are also separated. An ordinary nonconnective K spectrum does not provide an s-filtering hermitian quotient.

The proper spinor-genus source and norm chain, DVR elementary-divisor chain, quaternionic right-action conventions, critical determinant branch, Gaussian covering chain and integer symmetric/quadratic/skew tables are now explicit. The finite hermitian count uses `X*GX=H`, distinguishes representations from embeddings, and includes the eventual-empty generic-fibre branch. The proper mass normalization retains the four-element proper stabilizer of the square lattice and the trivial rank-one SO stabilizer.

There remain **29 omitted API names across 12 nodes**, individually listed in `suggestedFrontier` and `validation.apiAudit.unmatchedNames`: localization/genus/spinor comparisons, generic density/Siegel polynomial, field Witt and signed transfer comparisons, Q forgetful/fibration, hermitian suspension and spectrum assembly. The exact unavailable conditions are left out in accordance with section 13, with no arbitrary `Prop` substitute. The native core is independently inspected and elaborates; the omitted contracts remain partial planning obligations. A package must acquire the needed contexts and give the corresponding actual signatures and concrete examples. This review does not turn catalogue comments into typed declarations.

## Current upstream ownership and tier order

I inspected current readonly TauCetiRoadmap at `de435a569d325b365a30fe83269ce34674eaea80` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` in addition to the unchanged pinned baseline. Current IntegralLattices Layers 3/4 already own the Z/Q localization and genus/spinor-genus specialization. Current OrthogonalSpinGroups Layers 1/3 own the general-field spin image and Q finite-adelic spinor norm. In particular, the current library's `localizationToCompletion`, pairing compatibility and localized isometry naturality are real existing interfaces; its local and adelic spinor norms have explicit reference-image and rank conventions.

These current layers are absent from the atlas snapshot and the validator's world. Four precise supplier-registration gaps, with `currentSupplier`, `neededBy`, commits and exact contracts, replace unresolved graph edges. The affected nodes have `currentUpstreamInputs`; their remaining work is the general Dedekind/number-field/hermitian extension or comparison. No current declaration is misrepresented as present at the older pinned commit. The old algebraically closed SpinRepresentations request could not supply the required general-field image theorem and was removed.

WORKERS.md and `upstream/CaraianiNewton.md` put GN in Tier 3 and exclude outside-order roadmap imports. Removed **20 prerequisite edges** to GeneralAlgebraicKTheory, StableHomotopyKTheory and MetaplecticAutomorphicForms, and six corresponding requests. Pinned `TauCeti.ExactK0` and its conflation/map API replace the degree-zero imports. Ten remaining minimal Q/S, realization/Quillen A/B, H-space/loop, ordinary nonconnective comparison and lattice/harmonic theta contracts move into GN as explicit `tierMoves` and gaps. The later roadmaps import those eventual GN interfaces. This pass neither imports their whole frameworks nor claims to have decomposed the additional foundational work within an already full node budget.

There is no ClassicalArithmeticCompletion prerequisite in the packet: LLL's exact arithmetic is native here. Its stale atlas CA.3→GN.5 edge must be reversed when the orchestrator synchronizes ownership. AdelicAlgebraicGroups remains a legal lower-tier supplier. Current upstream roadmaps remain imports, not new plans.

## RT-AREA-algebraicnt-1/1

The confirmed finding concerns direct contracts, rather than transitive reachability. Ten explicit GN.2 comparisons cite QuadraticFormInvariants Layers 1,3,4,5,6, GlobalQuadraticForms Layers 5,6 and completed IntegralLattices Layers 1,2,4. The field Witt comparison now also has the direct native presentation dependencies. GN.3 directly requests AdelicAlgebraicGroups AA.2/AA.3 for quotient measures and reduction domains, with their actual normalization and finite-volume hypotheses.

The packet and reader already record these contracts; the atlas roadmap-level `prerequisites` and reciprocal immutable upstream `consumers` still require synchronization. The new current upstream owners and tier moves must be carried through the same synchronization. Those documents are outside this issue's editable paths. The report and handoff specify the changes for the orchestrator rather than editing another job's files. The separately rejected unowned-Siegel finding remains rejected.

## Source findings and independently read versions

Every one of the fifteen source findings has a fresh verdict and version-specific reason from this review: **fourteen confirmed, E11 rejected**. E1–E10 and E12–E14 retain their mathematical counterexamples and publisher/preprint distinctions. The fresh E10 check concerns Voight's 2026 post-publication copy; the earlier review's publisher check remains historical provenance. E15 is independently confirmed by expanding the square completion in Algorithm Example 3.14, p.13, and checking the 2019 author revision and errata: the correction term is negative. The `[1,2,2]` example gives diagonal `[1,1]`; a positive correction gives the wrong determinant square class. No author was contacted and no new broad errata search is claimed.

The following physical pages were personally read. All 25 acquired public PDF hashes agree with the packet's receipts. This list is selected source reading, not a section-by-section account of a book or a claim to have read all references cited there.

| Source/version | Physical PDF pages read |
| --- | --- |
| [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf) | 7, 8 |
| [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf) | 9, 32, 33, 34, 37, 38, 39 |
| [HoreshKarasik2021v2](https://arxiv.org/pdf/2012.04508v2) | 9, 28, 29, 34 |
| [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf) | 5, 10, 13, 14, 15, 16, 17 |
| [Henk2002](https://arxiv.org/pdf/math/0204158v1) | 1, 2, 3, 4, 5, 6, 7 |
| [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf) | 2, 3, 4, 5, 6, 7, 8 |
| [Voight2026](https://jvoight.github.io/quat-book.pdf) | 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168 |
| [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3) | 8, 15, 16, 17, 18 |
| [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf) | 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 36, 37, 38, 50, 51, 52, 53, 54, 55, 56, 57, 58 |
| [SchlichtingDerived](https://arxiv.org/pdf/1209.0848v3) | 2, 3, 4, 57, 58 |
| [CalmesIII](https://arxiv.org/pdf/2009.07225v4) | 37, 38, 39, 40, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61 |
| [BhargavaShankar2010](https://arxiv.org/pdf/1006.1002v2) | 14 |
| [Duke1988](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf) | 1, 2, 3 |
| [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf) | 5, 6, 7, 20 |
| [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6) | 59, 422, 423, 426, 427, 428, 429 |
| [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf) | 1, 2, 3, 4, 5, 6 |
| [StephensDavidowitz2019](https://arxiv.org/pdf/1907.09020) | 1, 2 |
| [Kirschmer2013](https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf) | 3, 4 |
| [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf) | 6, 7, 8, 9 |
| [SchulzePillot2020](https://arxiv.org/pdf/2008.12847) | 131, 132, 133, 134, 135, 136 |
| [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994) | 11, 12, 13, 14 |
| [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf) | 10, 11, 12 |
| [KSS2021](https://arxiv.org/pdf/1611.02667) | 1, 2, 3, 9, 10, 11, 12, 13, 14, 15, 16 |
| [VoightAlgorithm2019](https://jvoight.github.io/articles/quatalgs-051919.pdf) | 13 |
| [VoightAlgorithmErrata2019](https://jvoight.github.io/articles/quatalgs-errata.pdf) | 1, 2 |

## Baseline and validation

All **185 Mathlib and eight Tau Ceti** baseline citations are confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each entry has a new `independentCheck` recording actual source-type reading with surrounding assumptions; the name index was also checked. No baseline citation was removed and no baseline name/module/type correction was needed. Native exact K0 was reused for the tier correction. `Submodule.IsLattice` means finite/full, not globally free; separated pairings do not imply integral perfection; index zero is the infinite-index sentinel; and the mixed number-field embedding has its native unweighted normalization. The nodes retain these distinctions.

The indexed `scripts/check_blueprint.py` reports **zero errors and warnings**. The modified suggested file elaborates with `lean-check` in the shared build at both pins: exit zero, **701 admitted-declaration warnings and no other warnings or errors**. The file hash is recorded in `validation`. No language server or library build was run. The revision author's finite-regression and name-probe receipts are preserved as historical `revisionValidation`; I do not claim to have rerun them. I separately checked the source counterexamples and arithmetic identities described above.

## Orchestrator handoff

Synchronize the reader and atlas from this reviewed packet. The reader's opening paragraph/table still call GN.5 planned; its E11 locator still attributes an error, and its orthogonal-sum third test still has the old rank claim. Preserve the individual node notes, partial statuses, current upstream registration gaps and Tier 3 moves. Register the four current layers before converting their gap endpoints into graph prerequisites; do not invent pinned declarations. Apply the RT direct roadmap prerequisites and reciprocal supplier consumer metadata, and reverse the stale ClassicalArithmeticCompletion edge.

The existing package has a separate advanced-package review and is not approved by this job. Continuations resume from the precise stage `remaining`, `gaps`, `tierMoves` and `suggestedFrontier` lists. The accepted pass should not be returned merely for its partial stages. No scratch file is needed by the next worker.
