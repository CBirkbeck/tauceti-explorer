# Independent review: Lefschetz pencils and vanishing cycles, revision 2

**Verdict: accepted, at target level, with the recorded gaps.** Codex (GPT-6), session `codex-PcTHkj`, completed this independent review on 2026-10-10 for issue #7073 (`REV-LefschetzPencilsAndVanishingCycles--LPV.0~2`). This worker authored neither the original plan nor revision 2. No implementation is claimed; every node remains `unchecked`.

The revision repairs the false universal Lean assertions identified by the first review. Its geometric forms are now explicit omitted signatures with supplier prerequisites, rather than statements about arbitrary replacement data. This review corrects the remaining mathematical and provenance errors in place and accepts the resulting planning pass. The missing original proof interiors and supplier forms below remain open.

## Inventory

| Item | Reviewed result |
|---|---|
| Nodes | 89: 8 definitions, 11 constructions, 53 theorems, 7 comparisons, 6 lemmas, 4 applications |
| Per-node verdicts | 50 verified; 39 corrected; 0 added; 0 unverifiable |
| API specifications / test specifications | 113 / 77 |
| Planets | 29, at most 6 per stage |
| Pinned baseline declarations | 19 confirmed; none removed or replaced |
| Supplier requests / explicit gaps | 27 / 11 |
| Source issues | 24 independently reviewed; all confirmed with corrected descriptions where necessary |
| Suggested forms | 3 complete node forms, 14 partial specializations, 72 missing node forms; 211 exact omitted signatures |
| Stage coverage | LPV.0–6 planned; no stage closed; LPV.7 outside this job |

## Corrections made

- **Exchange and finiteness:** distinguished `Rg_*`, `Rg_!` and `Rg^!`; limited the XIII exceptional construction to quasi-finite maps. Removed the false attribution of general nearby finiteness to PR196 EtaleBaseChange Layer 6, which proves proper direct-image finiteness. The excellent-trait extension remains an explicit request and source gap.
- **Local quadratic contracts:** distinguished the dimension-zero rank-two nearby stalk/costalk from the rank-one vanishing cokernel. Rewrote the even variation and standard degeneration contracts in our own words, preserving twists, Clifford characters, twice-modulus reduction and the undetermined odd scalar. Corrected the nearby-costalk title. The affine-quadric middle line can carry an orientation character; it is not automatically constant. Its divisible integral hyperplane class does not require inverting two.
- **Monodromy and arithmetic:** removed cross-pencil independence of the vanishing span, which Weil II 4.2.5 only discusses via an additional multidimensional theory. The generic-pencil conjugacy theorem remains. Replaced the erroneous divisor-degree gcd description by the common-divisor problem for Frobenius characteristic polynomials in Weil II 4.5.
- **Perversity and duality:** made nearby Verdier duality a direct prerequisite of nearby perverse exactness. Artin vanishing gives one bound and duality the other; the tame two-term complex is used in the additional vanishing-cycle monomorphism. Added that missing proof step. Restricted the finite coefficient version to the stated `Z/ℓ^ν` convention and added separated finite type and finite Tor dimension to finite-coefficient duality.
- **Source errors:** E2’s inherited correction retained the printed endpoint `m−1`; it now ends at `m`. E17 is a swap of stratum/twist order. E21 concerns the eigenvalue α in the weight paragraph, not a duality diagram. E24 concerns the Tate labels in Weil I p. 300: the printed numerical Frobenius eigenvalue was already correct and is retained.
- **Suggested forms and tests:** renamed the weaker degree-zero helper to `variation_annihilates_specialization`; the full `variation_wellDefined` derived-representative API remains explicitly omitted. Normalized legacy test kinds to `computation` and `compatibility` in packet, reader and ledger. All 211 omitted signatures retain their corrected hypotheses and owner inputs.
- **Locators and ownership:** supplied exact pages for trait coefficient change, the jet and blowup computations, the perverse arguments and Qian Definition 3.6. Schneider 29.2 is a Proposition, beginning on p. 202. Current general-field symplectic bases and standard symplectic closedness are imported alongside orthogonal topology. EDC.6 supplies coefficient realization and consumes H1’s comparison, rather than owning a duplicate Huber theorem.

## Source and version checks

All thirteen public PDF hashes match the packet. Source passages were read independently, with page images at the SGA misprints, Illusie p. 44 and Weil I p. 300. The two maintainer-cleared books were read in place; no book file, passage or extracted text was copied into this repository or scratch. Source prose in the deliverables is in our own words. `sourceVersions` preserves the author/revision chronology and `independentReviewRead` records this review.

| Source | Evidence read for these targets |
|---|---|
| [deligne-weil-i](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | §§4–5, pp. 287–294, and §7.1, pp. 299–300; local formulas, pencil monodromy and the actual Leray subquotients. |
| [SGA7II-1973](https://publications.ias.edu/sites/default/files/Number12.pdf) | XII §§1–3; XIII §§0–2; XV §§1–3; XVII §§2–4; XVIII §§2–5.1. Node ledger gives exposé-local pages; new jet/blowup locators also give book pages. |
| [deligne-weil-ii](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | §§1.6–1.9, pp. 165–181, and §§4.2–4.5, pp. 219–233; filtration, wild/transverse and orthogonal/arithmetic qualifications. |
| [illusie-1994](https://www.numdam.org/item/AST_1994__223__9_0/) | §§1.1–1.5, pp. 11–13; original errata locations; §4, pp. 44–51, including the complete perverse proof. |
| [illusie-1994-errata](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf) | Complete author-hosted one-page ErrTML sheet, checked against the affected original pages. |
| [illusie-2021](https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf) | §1.1, p. 85, and §§6.1–6.3, pp. 103–105; coefficient domain, algebraic route, perverse exactness and the two-component calculation. |
| [illusie-2002-erratum](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf) | Complete ErrPL sheet only; the 2002 original proof was not obtained. |
| [illusie-2006](https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf) | §1.1, pp. 1–2, and §§2.1–2.3, pp. 3–5; classical trait and oriented-product interfaces. |
| [qian-2023](https://par.nsf.gov/servlets/purl/10388233) | Published Definition 3.6, PDF p. 21; no substitution of first-arXiv numbering. |
| [fsy-2022](https://arxiv.org/pdf/1810.06454) | Downloaded arXiv manuscript §5.1.3, pp. 41–44, including its determinant and reference [30]. The published text was not independently matched. |
| [kisin-pappas-2018](https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf) | §4.7.1–4.7.7, pp. 212–213; semisimple-trace application. |
| [caraiani-scholze](https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf) | §4.6, pp. 60–63; finite-level geometry and enlarged semiperverse bounds. |
| [haines-ngo-2002](https://math.uchicago.edu/~ngo/nearby-cycle.pdf) | §3.1, Lemma 8 and Corollary 9, pp. 127–128; inertia-filtration definition and compatibility. |
| [huber-1996](https://doi.org/10.1007/978-3-663-09991-8) | Cleared book: 3.5.12–3.5.17, pp. 206–210, including proof of the completion comparison and its inertia-compatible nearby specialization. |
| [schneider-2011](https://doi.org/10.1007/978-3-642-21147-8) | Cleared book: §§18.10–18.19, pp. 144–153; Exercise 26.2, pp. 181–182; Theorem 27.1, pp. 192–194; Proposition 29.2 and §§29.4–29.8, pp. 202–208. Exponential-chart results whose proofs are referenced rather than supplied by the book are not claimed freshly proved. |

Four original-source gaps remain: the 2002 algebraic Picard–Lefschetz blowup/sign proof; Illusie 2003 Corollary 2.10 before widening the FSY nonordinary class; the original Artin/Elkik general proofs; and SGA 4½ excellent-trait finiteness. The public statements/applications were checked, but acceptance does not certify those unread interiors. Seven further gaps enumerate the exact unavailable geometric/derived Lean signatures by stage.

## Pinned baseline and current upstream

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` were inspected declaration by declaration. All nineteen names exist and have the required conventions on their stated domains. No citation was removed.

| Baseline declaration | Independent statement check |
|---|---|
| `mathlib:LinearEquiv.transvection` | f(v)=0 supplies the invertible transvection; it does not supply the even reflection. |
| `mathlib:LinearEquiv.mem_fixedSubmodule_transvection_iff` | The same zero-functional condition applies; local reflections use the separate rank-one calculation. |
| `mathlib:LinearMap.BilinForm.orthogonal` | Right orthogonal uses B(n,x)=0; symmetry/alternation reconciles it with the local pairing. |
| `mathlib:LinearMap.BilinForm.IsAlt` | Alternating means B(x,x)=0, including in characteristic two. |
| `mathlib:skewAdjointLieSubalgebra` | Endomorphisms skew-adjoint for the given bilinear form; alternating nondegenerate B gives sp. |
| `mathlib:LieModule.IsIrreducible` | The irreducible Lie module is nontrivial, as required by the transvection lemma. |
| `mathlib:IsNilpotent.exp` | Finite nilpotent exponential in a Q-algebra, rather than an arbitrary analytic exponential. |
| `mathlib:ValuationSubring.inertiaSubgroup` | Kernel of residue action inside the decomposition group; full trait specialization needs the supplier. |
| `mathlib:QuadraticMap.Nondegenerate` | Quadratic radical zero and polar-kernel rank at most one permits the characteristic-two odd-rank case. |
| `mathlib:QuadraticMap.polarBilin` | Polarization is Q(x+y)−Q(x)−Q(y). |
| `mathlib:CliffordAlgebra.even` | The even Clifford subalgebra exists; its centre/discriminant/étaleness remain new APIs. |
| `mathlib:HenselianLocalRing` | Simple-root henselian lifting alone does not prove Artin approximation or Elkik versality. |
| `tauceti:TauCeti.genericFiber` | Actual generic-fibre pullback along the chosen scalar map. |
| `tauceti:TauCeti.specialFiber` | Actual residue-field pullback; geometric closure is an additional base change. |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | The existing small étale Grothendieck topology is reused. |
| `mathlib:DerivedCategory` | The derived category is the localization of cochain complexes at quasi-isomorphisms; constructibility is additional. |
| `mathlib:Submodule.span` | The smallest submodule containing the cycle set; path/monodromy stability is extra structure. |
| `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent` | Unipotence means nilpotence of g−1; geometric quasi-unipotence is a separate imported theorem. |
| `tauceti:TauCeti.exp_smul_eq_sum_smul_dividedPower` | The scalar r in the literal divided-power exponential identity is rational; the general field-scalar polynomial form is separate. |

Current read-only TauCetiRoadmap main was inspected at `8c72a04753b11cab07fa593cc38ceaa7c0515380`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ClassicalGroups and OrthogonalGeometry were read for scope; OrthogonalSpinGroups Layers 0/2 and suggested signatures, IntegralLattices ownership, LieHighestWeight Layer 0 and Chebotarev Layer 9 supply the exact imports. Current implementations of `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `Matrix.isClosed_symplecticGroup`, `TauCeti.isClosed_GLSymplectic` and orthogonal closedness were checked. Generic carriers and topology are therefore not re-planned. The remaining Q_l analytic extension uses LieGroups/ClassicalGroups Part II.

PR196’s ConstructibleEtale, EtaleBaseChange, EllAdicRealization, TraceFormula and ComplexComparison contracts were read at immutable head `4bd72379658126cbe9be935656396f0c9dac4de0`. They are integration contracts, not implementations at the Lean pin. In particular, ordinary proper finiteness, uniform derived completion, enhanced filtered trace additivity and qualified complex comparison do not silently supply general nearby finiteness or the topological Picard–Lefschetz theorem.

All 27 supplier requests and the reviewed LPV library-coverage audit were checked. The H1 completion/nearby comparison and independent IG finite-level-model/boundary-killing node statements were read. The direct graph orders LPV nearby definition → H1 comparison → LPV comparison consumer, and IG geometry → LPV perversity interface → IG perversity consumer. Whole-stage publication still needs the proposed prefix splits. The finite orthogonal character argument uses FA.5 trace/Chebotarev, CharacterTheory and an integral root lattice; DWP.4 remains downstream. Relative weight-filtration existence remains DWP.5 downstream of LPV.1.

## Previous review and confirmed red-team finding

Every correction requested by the first review was checked: genuine geometric hypotheses no longer disappear into universal Lean forms; twist lines precede chosen bases; finite log is conditional on unipotence; primitive reconstruction uses inverse graded powers; normal-crossings objects retain equation/torsor dependence; the quadratic parity and degree-zero branches are separate; derived cones and trace additivity have enhancements; approximation, trait purity, enlarged colimits and SL₂ realization are precise owner requests. The reader is now synchronized. The target-level inventory and complete-pass status are valid with explicit gaps, rather than a claim that all forms elaborate or that the libraries implement them.

RT-AREA-etale/18 is handled by the early two-component calculation in LPV.1 and the algebraic Illusie 2002/2021 route in LPV.2, with ErrPL and G-algebraic-PL retained. The complex route is a separate comparison with its topological theorem requested explicitly. No proof uses late LPV.7 to establish the early local formula, and SGA XV’s transcendental proof is not relabelled algebraic.

## API, tests, planets and closure

All nineteen definitions/constructions have at least three discriminating test specifications, including appropriate degenerate and non-example cases. All 113 API entries were read for constructors, extensionality, maps, universal properties and baseline compatibility. All 77 test statements agree with their proposed objects and coefficient domains. Their names appear either as actual algebraic specializations or as exact missing signatures; the omitted tests are not counted as executed. All 29 planets are source-named key objects or theorems, with stage limits and no duplicate names. No planet was added or renamed.

Every target has direct inputs and a sound target-level outline on its qualified domain; no lemma expansion or new node was needed. The added within-packet edge from nearby exactness to nearby duality is acyclic. Status `complete` records one finished planning pass; seven `planned` stages and eleven gaps do not claim closure or implementation.

## Per-node independent evidence ledger

“Verified” includes a checked conditional specification whose missing supplier form or original proof is expressly recorded; it does not mean a proof has been formalized or an unavailable original was read. Corrections include normalized test kinds.

| Node | Verdict | Evidence and limits |
|---|---|---|
| `LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves` | corrected | XIII 0.2.5 and 1.1.3 fix the geometric points and specialization kernel. The Lean trait record is a field/action model; valuation realization and continuity remain explicit omitted forms. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S` | corrected | XIII 1.2.2–4 gives the gluing triple, inertia-trivial closed part and generic action. The comma-category specialization is retained only on its stated domain; actual topoi use E0/SF.2. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities` | corrected | XIII 1.3.1–9 fixes Ψ and its variance. Smooth/proper/quasi-finite clauses are kept distinct; tests detect loss of action or replacement by ordinary specialization. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism` | corrected | XIII 1.4.3 requires a split-injective enhanced representative. Renamed the degree-zero annihilation helper; derived representative independence is still a distinct missing API, not proved by cokernel uniqueness. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` | corrected | XIII 2.1.1–5 gives geometric i*Rj_* and the cone with the stated shift. E0 is a direct prerequisite; geometric Milnor fibres are strict-local generic fibres, not ordinary fibres. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence` | corrected | Corrected the exchange notation and quasi-finite scope of Rg^!; XIII 1.3.9 and 2.1.7–8 supply the indicated comparisons. Only proper/smooth/étale cases carry their respective isomorphisms. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms` | corrected | Illusie 2006 §1.1 supplies the actual trait square; the source locator now includes pp. 1–2. Existing small-étale sites and fibre pullbacks are consumed. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison` | corrected | Illusie 2006 §§2.1–2.3, pp. 3–5, verifies the trait oriented-product comparison. No general-base constructibility or arbitrary Ψ-goodness is inferred. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude` | corrected | Corrected the nonproper finiteness attribution. Excellent-trait finiteness is an explicit SF.2 extension with G-finiteness-source; EtaleBaseChange 6 supplies only proper Rf_* finiteness. Finite Tor amplitude is retained. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change` | corrected | XIII 2.1.13, pp. 25–26, gives derived coefficient comparison and Tor preservation; 2.1.7.5 is on p. 21. Dominant trait change and inertia restriction agree. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization` | verified | Illusie 4.4 supplies the adic variant. E4/EDC.6 and PR196 EllAdicRealization provide uniform derived inverse-limit and finite-level conventions; underived limits are excluded. |
| `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison` | verified | Huber 3.5.12–17, pp. 206–210, was read in the cleared book. H1 owns the precise completion comparison; naturality preserves Galois/inertia, and its RΨ is distinguished from modern RΦ. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var` | verified | XIII 1.4.3 plus the finite polynomial log calculation gives normalized can/var on the unipotent branch. The inverse polynomial has constant term one; twists and factorization order are retained. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm` | verified | Illusie 1.5, pp. 12–13, supports the finite logarithm only after unipotence. The characteristic-zero polynomial statement and nilpotence bounds agree with the pinned exponential API. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence` | corrected | Illusie 1.2–1.4, pp. 11–12, is geometric quasi-unipotence. R01.2 is an explicit geometric supplier; no conclusion for arbitrary continuous inertia representations is asserted. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling` | verified | Weil II 1.6.14 and 1.7.2 verifies N rescaling by the ramification index. The ℓ-adic scalar and tame-character normalizations are compatible. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` | verified | Weil II 1.6.1–7/14 fixes the increasing centred filtration, kernel-image formula and opposite graded isomorphisms. Nilpotence and conjugation are explicit in the actual algebraic forms. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness` | verified | Weil II 1.6.3–11 uses lower primitive kernels, inverse opposite-graded maps and then N powers. The special Jordan-block SL₂ realization is requested beyond LieHighestWeight Layer 0. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy` | verified | Weil II 1.6.9–12/14 gives tensor, dual and symmetric-power compatibility in characteristic zero. The SL₂ engine is imported; no unqualified positive-characteristic symmetric-power statement appears. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness` | verified | Weil II 1.6.13–14 verifies uniqueness and functoriality conditional on existence of the relative filtration. Weight-dependent existence belongs to DWP.5, avoiding a reverse LPV dependency. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction` | verified | Weil II 1.7.8–10 and 1.9.1–6 distinguishes tame Kummer restriction, cofinal towers and the intrinsic normal-bundle torsor. Residue commutativity does not erase dependence on divisor equations. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/maximal-unipotence` | corrected | Qian published Definition 3.6, PDF p. 21, fixes maximal unipotence by minimal-polynomial degree. The nonzero-module qualification prevents a false dimension-zero characterization. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace` | verified | Kisin–Pappas 4.7.1 and Haines–Ngo Lemma 8/Corollary 9, pp. 127–128, verify semisimple trace via a finite inertia-stable filtration. Enhanced trace additivity is imported; arithmetic wild inertia is not discarded. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex` | verified | Illusie 2021 §6.3, pp. 104–105, gives the two-component grades and N via restriction/Gysin. Excellent-trait purity and enhanced filtered constructions are explicit early suppliers; general semistable families stay in LPV.7. |
| `LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance` | verified | Illusie (1.5.3)–(1.5.4) gives twisted conjugation. Geometric Frobenius has NF=qFN after choosing the Tate basis; the matrix specialization has the same convention. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2` | corrected | XV 3.1.2, p. 24, distinguishes nearby stalk/costalk from vanishing sheaves. The acceptance test now states rank two for Ψ at n=0 and rank one for Φ. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2` | corrected | XV 3.2.1–3, pp. 24–26, gives the nearby costalk orientation and even variation. Rewrote the inherited source recitation, corrected the title’s Ψ/Φ confusion, and retained characteristic-two Clifford-centre scope. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3` | verified | Illusie 2021 §6.1/6.3 and ErrPL support the algebraic odd formula and early two-component route. G-algebraic-PL explicitly retains the unread 2002 sign calculation; XV’s transcendental proof is separate. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence` | verified | Weil I (4.2)–(4.3), p. 288, and 5.13, p. 294, give the proper specialization sequence and local support term; sign and degree agree with the geometric triangle. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula` | verified | Weil I 4.3, pp. 288–289, verifies reflection/transvection and zero-cycle alternatives. The transvection API is used only when its functional vanishes on δ; the reflection fixed-space argument is direct. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration` | verified | Weil I 4.4, p. 289, distinguishes δ=0 from δ≠0 direct-image extension. Proper base change and local fixed-vector calculations provide the indicated j_* description. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form` | corrected | XII 1.1, p. 2, fixes positive locally free rank and smooth projective quadric. Characteristic-two odd rank permits a one-dimensional polar kernel on which Q is nonzero, matching the pinned quadratic convention. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms` | verified | XII 1.2, pp. 2–3, gives étale-local hyperbolic normal forms, with the anisotropic line in odd characteristic-two rank. E2 is repaired to include all m hyperbolic pairs. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric` | corrected | XII 1.5/1.12/2.8 supplies the even-Clifford centre, quadratic cover and generatrix action. Ordinary rank/coefficient hypotheses are explicit; no centre étaleness for a degenerate form is inferred. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric` | corrected | XII 2.1/2.4 fixes smooth quadric data and the intrinsic projective bundle for n>0. The canonical-bundle formula uses the negative power; n=0 is the separate étale-double-cover branch. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics` | verified | XII 3.3–4, pp. 14–17, verifies the two middle ruling classes, Tate degrees and intersection signs. Distinct ruling families have the discriminant action rather than automatic constancy. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics` | corrected | XII 3.5–7, pp. 17–20, gives affine-quadric cohomology and pairings. Corrected the middle orientation local system and explained the integral divisible hyperplane class without inverting two. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point` | corrected | XV 1.2.1–4, pp. 4–5, defines the completed ordinary quadratic germ. The normal-form theorem is a later target with its extra hypotheses; an arbitrary germ is not equated with a pure cone. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point` | verified | XV 1.2.7–8, pp. 6–7, computes the Tjurina module separately in the nondegenerate and characteristic-two degenerate cases. The second case has its extra deformation parameter. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem` | verified | XV 1.1.2, p. 2, verifies the local Artin application. The general approximation theorem is owned by SF Part II, with G-approximation recording the unread original proof. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations` | verified | XV 1.1.4, p. 4, verifies the required Elkik application; its general versality/algebraization remains requested from SF, rather than inferred from HenselianLocalRing. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point` | verified | XV 1.2.6 and proof, pp. 5–7, gives the henselian normal form on the stated branch. Its Tjurina/approximation inputs are direct; characteristic-two exceptions are preserved. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point` | verified | XV 1.3.2–3, pp. 11–12, gives Q=b and the degenerate quadratic model. E7 restores x₀², and the scheme-theoretic special fibre and residue extension assumptions remain explicit. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point` | verified | XV 1.3.4, p. 12, bounds nonsmooth points in the quadratic family. The degenerate parity case is separate and no general characteristic-two separability is claimed. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology` | verified | XV 2.1.3, p. 14, gives homotopy invariance for invertible torsion on the stated trivial-line family; its atlas realization is requested from SF.2. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone` | verified | XV 2.1.2/2.1.4, pp. 13–15, gives ordinary cohomology of a cone via the vertex and compact-support vanishing on the specified strata. Support cohomology is not silently replaced by ordinary cohomology. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone` | verified | XV 2.1.6–7, p. 16, gives the punctured-cone localization/Gysin description with the indicated shifts and Tate twist. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone` | verified | XV 2.1.8, p. 17, fixes the boundary/product anticommutation; E9 corrects the stale 2.7.8 label. This sign remains a direct input to the local variation calculation. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration` | corrected | XV 2.2.1–2, pp. 17–18, fixes the compactified quadratic degeneration and smooth boundary. The characteristic-two degenerate branch has odd variable rank; persistent cones remain allowed. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration` | corrected | XV 2.2.3–5 A–C, pp. 18–20, verifies nearby stalk/costalk comparisons, concentration and perfect pairing. Rephrased as one target contract, preserving the n=0 diagonal cokernel. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration` | corrected | XV 2.2.5 D–F, pp. 21–22, gives even variation and the odd undetermined Kummer scalar. The prose now separates these contracts from the later odd sign determination; composite-modulus division uses 2k first. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle` | verified | XV 2.2.6–7, pp. 22–23, identifies the geometric local generator and its support. Norm-only uniqueness over composite coefficients is removed in favour of a synchronized integral orientation. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison` | verified | Weil I 4.1, pp. 287–288, and PR196 ComplexComparison give the qualified complex comparison route. The topological Picard–Lefschetz theorem is requested explicitly, not inferred merely from Artin comparison. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two` | verified | Weil II 4.2.1–3, pp. 219–220, preserves the actual quadratic character in characteristic two and separates it from a tame uniformizer character. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration` | verified | FSY §5.1.3, pp. 43–44, verifies the precise application of nonordinary concentration. G-nonordinary retains Illusie 2003 Corollary 2.10 and its unread general hypotheses before any widening. |
| `LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example` | verified | FSY §5.1.3, pp. 41–44, verifies the discriminant/determinant example with its parity and prime-two qualifications. The local-model calculation feeds the narrowed application, not a general nonordinary theorem. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil` | corrected | Weil I 5.1/5.6, pp. 289–292, fixes the transverse axis, ordinary singular fibres and ample-pencil data. The construction uses existing projective/Grassmann geometry; tests detect nonsmooth axes. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety` | corrected | Weil I proof of 5.4, p. 290, and XVII conormal geometry give the dual variety. Nonempty irreducibility is qualified; the ambient-projective-space case gives the empty dual. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` | verified | Weil I 5.7/5.13, pp. 292–294, and XVII 2.5 give existence after r≥2 Veronese. Arbitrary inseparable embeddings are not treated as Lefschetz embeddings. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation` | corrected | XVII 2.5, §§3–4, pp. 6–29, verifies the ordinary-axis open and the special degree-two two-point jet defect. Added exact local and book pages; linear X uses the explicit quadratic pencil. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup` | corrected | XVIII §§2–3, pp. 5–17, identifies the incidence variety with the regular codimension-two blowup. Its general Rees/charts theorem belongs to SF.4 Part II; empty centre is explicitly allowed. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent` | verified | Weil I 7.1, p. 299, chooses a pencil over a finite extension. SF.0 supplies finite-type closed-point residue geometry and FF.0 supplies only finite-field/Frobenius arithmetic. |
| `LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension` | verified | Weil II 4.2, pp. 219–221, and XVII Gauss-map examples verify the inseparable and low-dimensional qualifications. No étaleness of every characteristic-two Gauss map is assumed. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil` | verified | Weil I 5.8/5.13, pp. 292–294, gives lisse higher direct images off the critical set and their j_* extension/vanishing-line defects. Local δ=0 and nonzero branches remain distinct. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace` | corrected | Weil I 5.2/5.8 gives the span of transported vanishing cycles. It extends Submodule.span with path invariance and orbit closure, rather than defining a duplicate span carrier. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/fixed-space-of-the-local-transvections` | verified | Weil I 5.3, p. 290, gives the local fixed space E⊥. The rank-one algebraic lemma is sound; global invariants additionally need monodromy generation. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing` | corrected | Weil I 5.9, p. 293, constructs the radical quotient with its induced nondegenerate pairing. Characteristic-zero skew symmetry gives alternatingness; zero quotient is a separate case. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin` | corrected | XVIII §§2–5.1, pp. 5–27, fixes restriction and Gysin on the imported blowup decomposition, including the exceptional minus sign. Added exact page locators. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction` | corrected | Weil I 7.1, pp. 299–300, gives the actual Leray subquotients and radical branches without claiming degeneration. E24’s evaluation line is Q_l(m−n); its numerical q^((n+1)/2) was already correct. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/global-fixed-and-local-fixed-interface` | corrected | Weil I 5.3/5.8–9, pp. 290, 292–293, fixes the local/global invariant interface. Generation is an explicit later prerequisite and not used to prove itself; corrected page range. |
| `LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle` | verified | Weil I Remark 5.12, p. 294, gives the hypersurface cohomology away from the middle. Weak Lefschetz and standard projective cohomology are imported from their owners. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups` | verified | Weil I proof of 5.4/5.8, pp. 291–292, gives the needed Bertini surjectivity. Positive-characteristic tame π₁ inputs use the algebraic supplier, not the complex presentation. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate` | verified | Weil I 5.4, pp. 290–291, gives conjugacy up to sign by transporting through the dual smooth locus and axis family; the good-axis hypotheses remain explicit. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections` | verified | Weil I 5.8, p. 292, and algebraic tame P¹ generation give local-generator monodromy only in the tame branch. Zero cycles supply identity operators rather than nontrivial generators. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient` | verified | Weil I 5.5/5.13, pp. 291, 294, proves absolute irreducibility of the nonzero radical quotient by conjugacy and the fixed-space calculation. No irreducibility claim is made for the zero quotient. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/symplectic-lie-algebra-generated-by-transvections` | verified | Weil I 5.11, pp. 293–294, verifies the transvection Lie-algebra lemma with irreducibility, nondegenerate alternating form and characteristic zero. The suggested theorem has these load-bearing hypotheses. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup` | corrected | Weil I 5.10 and cleared Schneider §§18,26–29 verify the compact closed-subgroup route: p-valued finite rank, ordered-basis charts and analytic inclusion. Corrected Proposition 29.2, pp. 202–204, and import canonical topology. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image` | verified | Weil I 5.10, p. 293, gives open symplectic image after the Lie-algebra lemma and p-adic inverse-function argument. The analytic Q_l extension is requested separately; real closed-subgroup theory is not scalar-extended. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy` | corrected | Weil II 4.2.3–8, pp. 220–221, gives conjugacy for a generic-axis pencil. Removed unsupported independence across pencils; 4.2.5 identifies the additional multidimensional theory that would be needed. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite` | verified | Weil II 4.4.1–4, pp. 227–229, gives the conditional orthogonal open/finite alternatives with the listed isotropicity qualifications. Existing O(Q) and symplectic matrix carriers/topology are now precisely imported. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade` | verified | Weil II 4.4.5–9, pp. 229–231, requires rational character descent and an integral root lattice before ADE classification. FA.5 finite-cover Chebotarev/trace inputs and number-field Chebotarev replace a cyclic DWP weight input. |
| `LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing` | corrected | Weil II 4.3.10 and 4.5, pp. 226, 231–233, distinguish the integral obstruction from the arithmetic consequence. Corrected divisor-degree gcd to common Frobenius-polynomial divisors and finite-field-extension compatibility. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness` | corrected | Illusie 1994 Corollary 4.5, p. 47, proves the rational nearby bound by Artin vanishing plus nearby duality, now a direct prerequisite. Illusie 2021 §1.1/§6.2 supplies the precise finite Z/ℓ^ν convention. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness` | corrected | Illusie 1994 Corollary 4.6 and proof, pp. 47–51, needs the additional inertia-invariant monomorphism after gluing bounds. Added that argument and the finite-coefficient survey locator; RΦ[−1], not i*[−1], is perverse. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality` | corrected | Illusie Theorem 4.2/§4.3 and variant 4.4, pp. 44–47, require separated finite type and D_ctf for finite coefficients. Added finite Tor dimension and kept the adic/rational variant and p/p+ distinction. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange` | corrected | Nearby exactness and the EDC.5 image definition give the intermediate-extension exchange on the stated product-compatible open. Proper and open/smooth exchanges are qualified; an arbitrary functor is not substituted. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison` | corrected | Illusie 4.4–4.6, pp. 47–51, with E4/EDC.6 gives compatible finite/adic/rational passage and shifts. Integral p/p+ remain separate; H1 supplies the analytic nearby comparison consumed here. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion` | verified | Caraiani–Scholze §4.6, pp. 60–63, and the exact enlarged E1/EDC.5 requests give the filtered-colimit support criterion under boundedness and stalk/costalk continuity. Nonconstructibility is explicit. |
| `LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface` | verified | Caraiani–Scholze Theorem 4.6.1 and its proof use integral finite-level maps, residue-field finite-type charts, ℓ-level boundary killing and the H1 comparison. Only independent IG geometry nodes are imported, leaving perversity consumers downstream. |

## Source-issue independent verdicts

| Issue | Verdict | Evidence and correction limits |
|---|---|---|
| E1 | confirmed | The XII p. 2 image uses a cardinality where its characteristic-two branch needs residue characteristic; the adjacent case gives the complementary hypothesis. |
| E2 | confirmed | The XII p. 3 image ends both sums at m−1. The correction is m, since otherwise the last hyperbolic pair is absent. Corrected the inherited correction, whose reason already identified this degeneracy. |
| E3 | confirmed | XII p. 14 places the hyperplane Chern class in degree two; the isolated R¹ contradicts that degree. |
| E4 | confirmed | XII p. 15 has 2m+2 coordinates for a dimension-2m quadric; the ambient space is P^(2m+1). |
| E5 | confirmed | XII p. 18 uses the wrong letter in the odd fibre-dimension clause; the adjacent even/odd calculations require n. |
| E6 | confirmed | XII p. 18 needs the displayed dual Gysin sequence 3.6.3, rather than the nonexistent 3.5.3. |
| E7 | confirmed | XV p. 11 image omits the square in the degenerate characteristic-two local equation; the versal model directly above contains x₀². |
| E8 | confirmed | XV pp. 4 and 6 images confirm the extra equality and stale reference; the completed quadratic expansion and cone 1.2.3 give the intended reading. |
| E9 | confirmed | XV pp. 14–17 duplicate 2.1.3 and print 2.7.8 in the sequence of §2.1; its later application refers to 2.1.8. |
| E10 | confirmed | XV p. 21 labels the map D(σ), while its domain and next formula describe Var(σ); no new D is defined. |
| E11 | confirmed | XV p. 22 norm normalization does not select a common sign over composite rings: 4²=1 mod 15 and 19²=1 mod 60, yet neither is ±1. An integral orientation reduced compatibly repairs the ambiguity. |
| E12 | confirmed | XV p. 18 selects the wrong parity of n+1; the characteristic-two degenerate ordinary model has n even and odd variable rank. |
| E13 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 22 lines −4 and −2, p. 24 lines 6–7, p. 38 line −11 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E14 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 35 line 7 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E15 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 37 line −5 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E16 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 38 line −5, (3.6.8) confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E17 | confirmed | The author’s complete ErrTML sheet and original p. 39 identify a swap in stratum/twist order, not a missing untwisted term; corrected the defect description. |
| E18 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 41 line −3 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E19 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 41 line −2 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E20 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 43 line −1 and p. 44 lines 1–2 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E21 | confirmed | The original printed p. 44 image places this defect in the last paragraph of §3.13, not in a duality diagram. ErrTML confirms α in place of g; corrected the inherited description and explanation. |
| E22 | confirmed | The complete author-hosted ErrTML sheet and the original 1994 passage at p. 48 line 3 confirm the stated correction. The corrected notation respects the surrounding construction; no stronger theorem is inferred. |
| E23 | confirmed | The complete author-hosted ErrPL sheet gives `abs(i)>1`. The 2002 original was unavailable; no independent claim about its proof interior is made. |
| E24 | confirmed | The Numdam p. 300 image confirms the wrong labels in (7.1.5), (7.1.5′) and the final sentence. Cup-product evaluation has target Q_l(m−n). Its geometric-Frobenius eigenvalue q^(n−m) agrees with the printed q^((n+1)/2), so the numerical-eigenvalue accusation is withdrawn. |

## Validation

`scripts/check_blueprint.py` reports zero errors and zero warnings. `scripts/check_errata.py` passes on a scratch errata-v1 wrapper of the same source issues and versions. The packet/reader/Lean-ledger consistency audit passes, including all-node verdict coverage, copied hypotheses, API/test contracts, direct dependency acyclicity and all 29 planet limits. `lean-check` at the pinned shared baseline exits 0 with 113 warnings, all `declaration uses sorry`. This validates elaboration of the actual forms; it does not execute the omitted geometric tests or prove any target. `git diff --check` and intake deliverable/private-path checks pass.

## Integration notes for the orchestrator

- Apply the packet’s H1/LPV and IG/LPV prefix splits before publishing aggregate stage edges. Their exact direct-node suppliers are independent; an undifferentiated whole-stage edge would create a cycle.
- Route the explicit SF approximation/blowup, EDC trait/enlarged-perversity, enhanced-derived and Q_l analytic extensions to their named owners. Generic orthogonal and symplectic carriers/topology are already owned or implemented.
- Obtain the four original-source proof interiors listed in the gaps before broadening those targets or certifying their proof interiors. The target-level acceptance leaves these obligations visible.

Only this job’s packet, suggested file, reader, review and handoff are changed. No atlas promotion, upstream mutation or second job was performed.
