# BCGP25: extraction and routing

Codex · codex-c83e7a · issue #2166 · 23 September 2026

The extraction covers the complete 230-page paper and routes **595 items**:
8 pinned-library baselines, 32 planned imports and 555 missing statements or
constructions. Every missing item has exactly one route. All 152 definitions
have at least three API operations and three proposed mathematical tests.
The machine-readable companion is the statement inventory; this report explains
the ownership decisions, source findings and validation limits.

The endpoint remains the maintainer's **AbelianSurfacesModularity,
DESIGN-BCGP25**, building on **AbelianSurfacesPotentialModularity,
DESIGN-BCGP18**, and the atlas's infrastructure for the ten-author paper
arXiv:1812.09999. An extraction marked complete is not a claim that any of
these results is formalized, nor a certification of the source's proofs.

## Source and scope

The source is Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian
surfaces*, [arXiv:2502.20645v1](https://arxiv.org/abs/2502.20645v1),
28 February 2025. The PDF was acquired on 23 September 2026 at
10:45:56 UTC, has 2,719,992 bytes and SHA-256
`51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.
The [author copy](https://math.uchicago.edu/~fcale/papers/Modular.pdf),
acquired at 10:46:36 UTC, is byte-identical. The full text, §§1–10 and the
bibliography, was read. The arXiv TeX archive was also acquired and used to
check formulas, references and the shared numbering counters. Its hash is
recorded in the result. No later arXiv version, journal edition or public
correction was located in the bounded search. This is an author-copy match,
not an asserted match with an unavailable published edition.

The counter walk identifies 309 named definition, lemma, proposition, theorem
and corollary environments. The coverage ledger maps every one to one or more
items. Multi-part results are split; introductory restatements 4.1.6, 4.1.11
and 4.1.14 point to the later detailed items. Unnumbered definitions,
constructions, important remarks, computational certificates and imported
infrastructure account for the remaining items. Counting environments alone
does not establish mathematical correctness; the ledger is an omission check
alongside the full reading.

The main theorem concerns a polarized abelian surface A/Q whose polarization
degree is prime to3, whose mod3 representation is surjective, whose mod3
representation at2 is unramified with Frobenius polynomial different from
(X²+X+2)² and (X²−X+2)², and whose reduction at3 is good ordinary with
distinct Frobenius roots. It obtains a weight2 general-type cuspidal GSp4 form
and cuspidal GL4 transfer, giving the H¹ L-function holomorphic continuation
and the expected functional equation. Theorem9.5.2 replaces surjectivity by
the fifteen allowed images and adds geometric endomorphism ring Z. The
quintic genus-two corollary has good ordinary **curve** reduction at2 and3;
the rational Weierstrass point supplies the required3-distinction through
the F3 enumeration. This does not prove modularity of all abelian surfaces.

The conventions are H¹, not the Tate module, multiplier ε⁻¹,
Hodge–Tate(ε)=−1, Sen(ε)=1, and geometric Frobenius. The cohomological
Hecke polynomial P_ℓ belongs to ρ_π∨ε⁻³; Q_ℓ belongs to ρ_π. Central
characters and the spin/dual-spin conversion are retained at every interface.
At trace zero, a characteristic polynomial alone can lose the similitude.

Section10.2 establishes isobaric automorphy for32 of the34 endomorphism/Galois
types over Q. It uses the Sato–Tate classification; it is not a proof of the
general Sato–Tate equidistribution conjecture. Section10.4 gives an implication
from the stated regular-weight residual Serre assertion. The numerical
application uses the paper's frozen2024 database and coefficient families;
it is not a conductor-ordered density theorem.

## Library boundary and ownership

The pinned statements were read at Mathlib082e2d3 and Tau Ceti f790474.
Mathlib supplies condensed modules and the free/forgetful adjunction, and
the matrix symplectic group. Tau Ceti supplies field-valued abelian varieties,
affine finite locally free Cartier duality, algebraic comodules, the ordinary
Verma carrier, ordered PBW spanning and a separate abelian-Lie-algebra PBW
basis. The result cites their declaration names.

Those boundaries matter. A field-valued AbelianVariety is not a relative
abelian scheme with a polarization. General ordered PBW spanning is not a
general PBW basis. The conditional central character of a Verma module is
not the Harish–Chandra isomorphism. Mathlib's naive general-ring solid
predicate carries a scope warning; VS2 owns its corrected coefficient
construction. The algebraic representation/comodule dictionary belongs to
upstream ReductiveGroups, even though the analytic representation categories
need new work. Upstream LieHighestWeight already plans PBW and ordinary
highest-weight theory but explicitly excludes full category O.

Atlas stage descriptions, owner documents, accepted library-audit rows where
available and overlapping paper proposals were read before routing. The final
input refresh includes586 verified blobs. Missing accepted audit rows were
not treated as evidence of missing mathematics. A source route below requests
a precise refinement within an existing stage's stated scope; it does not
assert that the stage is implemented.

The new BCGP21 extraction arrived during this job. Its specialist
GSp4LocalLanglandsAndGaloisRepresentations proposal is reused. It calls the
potential-modularity endpoint PotentialModularityOfAbelianSurfaces; this is
recorded as an alias of the maintainer's DESIGN-BCGP18 identity. It also
calls HigherHidaAndColemanTheory a new route, while the earlier Pilloni20
proposal calls it a Part II of PadicFamilies. This extraction preserves the
earlier Part II identity and both mathematical scopes. Independent design
review must coalesce the names and route kinds into one design each.

## Sources for existing layers

Each row names the existing owner and the exact stage keys. The item lists
in the JSON are authoritative, including planned objects for which this
paper is an additional source.

| Owner | Stages | Why this is the existing owner |
| --- | --- | --- |
| DeformationAndDerivedPatchingAlgebra | P7, P8, P9, R03.1, R03.3, R03.4, R03.5, R03.6 | Reusable coefficient, perfect-complex, open-ideal patching and component-support algebra belongs here, including the corrected finite-quotient construction and characteristic-zero freeness interface. |
| PadicHodgeTheory | R06.2, R06.3 | Own admissible period functors, Sen/Hodge–Tate sign comparison and Weil–Deligne purity interfaces, retaining integral-versus-rational distinctions. |
| LocallyAnalyticDistributions | L0, L3, L4 | The analytic function, character-space and compact-operator inputs lie within these existing layers; the noncommutative representation extension is routed separately. |
| IntegralHeckeAndGaloisDeterminants | IHG.1, IHG.3, IHG.4 | Own Cayley–Hamilton reconstruction and normalization/interpolation, including the geometric-Frobenius dual-spin conversion and full similitude character. |
| LocalGaloisDeformationRings | L7, L8, R08.1, R08.2, R08.3 | Own fixed-similitude local deformation rings, flags, scheme images and their component geometry. In particular, ordinary scheme image is not silently replaced by a p-flat quotient. |
| AutomorphicFormsOnReductiveGroups | AF.0, AF.1, AF.2, AF.3, AF.4, AF.5 | Use the common automorphic representation, cohomology and Hecke interfaces for the several reductive groups appearing in the proof. |
| AutomorphicGaloisRepresentationsPartII | AG2.2, AG2.3, AG2.5 | Regular algebraic polarized Galois representations and local-global compatibility are shared inputs. Singular-weight interpolation has its separate pending nonregular owner. |
| EndoscopicTransferAndUnitaryTraceComparison | ET.4, ET.5, ET.6, ET.7 | Apply stable unitary and symplectic transfer with its exact packet/multiplicity normalization; preserve the separate Arthur dependency gate. |
| AbelianSchemesAndArithmeticModuli | A1, A2, A3, A4, A5 | The relative abelian-scheme, polarization, torsion and Serre–Tate APIs have this owner. Field-valued abelian varieties already exist in Tau Ceti. |
| AutomorphicLFunctionsAndLocalFactors | AL.0, AL.1, AL.2, AL.3, AL.4, AL.5 | Own local factors, twists, global L-functions and the analytic consequences of the available functorial transfers. |
| ShimuraCompactifications | C2, C3, C4, C5, C6 | Own toroidal/minimal compactifications, boundary ideals and their comparison. The new cohomology theories import them. |
| ModularityAndLanglandsExtensions | ML.0, ML.4 | Register exact conjectural/frontier predicates and the Arthur twisted-weighted-fundamental-lemma dependency. This route does not claim that a general weighted fundamental lemma follows from the ordinary fundamental lemma. |
| VStackSheavesAndLisseCategories | VS2 | Supply the corrected solid coefficient category and internal tensor/duality foundations once; the nonarchimedean functional-analysis comparison is a separate consumer. |
| AutomorphicBundles | B1, B2, B3, B4, B5 | Own finite-dimensional automorphic vector bundles and their classical cohomological comparison; use the pending integral coherent extension where required. |
| PerfectoidShimuraVarieties | S1, S2, S3, S4, S5 | Import Hodge-type perfectoid towers and the Hodge–Tate map, with the chosen compatible compactification data and actions. |
| HodgeTateAndCanonicalSubgroups | T4, T5, T6 | Own period-map and logarithmic Hodge–Tate comparison inputs; the higher Coleman/Sen application is a separate consumer. |
| AdicSpacesPartII | R2, R3 | Coherent finite-cover comparison and formal-model foundations fit the existing R2/R3 scope. Import upstream AdicSpaces Tate acyclicity; the solid and infinite-dimensional coefficient refinements have their functional-analysis owner. |
| CompletedCohomologyPartII | CC.1, CC.2, CC.3, CC.4, CC.5, CC.6 | The generic completed cohomology/homology tower and its Hecke/duality interface have this owner; no GL2 geometric comparison is treated as a GSp4 theorem. |
| IgusaVarietiesAndTorsionConcentration | IG.1, IG.6, IG.7 | Import Igusa towers and source-qualified boundary/concentration theorems; decomposed genericity and irreducible localization are distinct conditions. |
| ArithmeticGaloisRepresentations | R01.1, R01.2, R01.3, R01.4, R01.5 | Own continuous Galois representations, inertia/Frobenius conventions and the foundational cohomology/compatibility interface used in the arithmetic applications. |
| GlobalGaloisDeformations | G7, R04.1, R04.2, R04.3, R04.4, R04.5 | Own polarized global deformation functors, their tangent/dual-Selmer conditions and auxiliary-prime constructions; near adequacy and integral enormity must retain their distinct hypotheses. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1, R07.2, R07.3, R07.6 | Import the existing Cartier-duality carrier and plan only the missing ordinary BT, finite-flat cohomology and polarized deformation comparisons here. |
| SmoothRepresentationsOfLocalGroups | SR.1, SR.2, SR.4 | Own convolution, Jacquet modules and Satake. The GSp4 Iwahori calculation is a source within these layers, with its full central character. |
| NeronModelsAndSemistableAbelianVarieties | R11.1, R11.2, R11.3, R11.4, R11.5 | Semistable reduction, torus lattices and specialization are imported into the explicit2–3 switch, not reconstructed there. |

The shared imports also include ArithmeticLocallySymmetricSpaces and
PotentialAutomorphyInfrastructure. Their existing stages supply the
Borel–Serre boundary, Hecke/duality complexes, ordinary degree shifting and
component-support machinery. Decomposed genericity, residual irreducibility
and boundary vanishing are distinct hypotheses. The paper's new dyadic
theorem is not an already proved ACC+ theorem.

## Shared extensions and design briefs

The following are the actual briefs supplied to design jobs. Existing pending
identities are reused. The order of generic representation foundations,
algebraic category O, analytic localization, higher Coleman theory,
nonregular lifting and the abelian-surface application must remain acyclic.
In particular higher Coleman theory cannot import the modularity theorem
whose proof consumes it.

### LieHighestWeightPartIICompletedCategoryO

Representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas, Part II: completed category O and analytic localization (part-ii). This is a genuine Part II of the upstream Lie roadmap, while completion algebra and general analytic representation theory are imported from their existing pending owners.

The new direction is full/parabolic category O, twisted Verma modules, completed Lie homology, and analytic localization on flag varieties. Upstream LieHighestWeight explicitly excludes full category O, BGG/linkage and the associated localization theory; import its ordinary Verma, PBW, finite-dimensional highest-weight and Harish–Chandra targets, and retain their actual pinned implementation boundaries. Build algebraic category O and CE homology first, with derived Levi actions, Casselman–Osborne, finite/perfect nilradical cohomology, the four separate parts of Theorem2.3.19, and Kostant homology. Construct Z-solid formal Schubert cells and twisted Verma modules with all support shifts; prove rank-one and general intertwiners using the corrected exponent λ+1. Import PadicEnvelopingAlgebras and NoncommutativeAnalyticDistributions for completions, and the functional-analysis Part II for solid duality. The non-Liouville condition is the paper's weakest exponential one. Theorem2.3.32 asserts that completion commutes with derived nilradical homology on O_nL; its proof requires a replacement for false Lemma2.7.5. Record that gate instead of manufacturing a proof. Build the compatible (g,G), (g,Q), dagger-orbit and stabilizer categories with their actual Banach-stage hypotheses, the horizontal centre, Cla and D̃^la. Define HCS as an exact contravariant functor and Loc as derived RHom. Prove Theorems3.5.11,3.5.23 and the finite-dimensional comparison in separate parts; use distinct central characters at singular weights. Finally specialize to the two-cell GSp4 Klingen orbit at λ=(1,1;even w): Theorem3.6.9 identifies the Cartan and geometric extensions up to nonzero scalar. The printed overlap-injectivity argument in3.6.15 is incomplete: (x+1)∂+1 kills an ambient analytic germ, and actual constrained-fibre membership must be analyzed. Export that as an explicit proof obligation to higher Coleman theory. Definitions receive field/action/handedness APIs and all supplied tests. Suggested future files: TauCeti/RepresentationTheory/CategoryO/Basic.lean, TwistedVerma.lean, NonLiouville.lean, CompletedHomology.lean, and AnalyticLocalization/{Sheaves,Stabilizers,HCS,Loc,SingularGSp4}.lean. These are design suggestions, not files created or compiled by this extraction.

### GSp4NonregularModularityLifting

Minimal modularity lifting for GSp₄ in non-regular weight (new). The existing nonregular GSp4 proposal is the correct owner for this lifting route; the mandated abelian-surface roadmap imports it.

Join the proposal of PAPER-CALEGARI-GERAGHTY-20 and PAPER-PILLONI-20. Add BCGP25's singular-weight Galois interpolation, characteristic-zero multiplicity-one argument and Theorem7.5.11. The new theorem applies to continuous pure symplectic ρ:G_Q→GSp4(O) of similitude ε⁻¹, residual absolute irreducibility, ordinary semistable weight2 with distinct unit roots, the precise integral-enormity and residual-image hypotheses of7.1.3, and an ordinary regular automorphic seed π whose local ordinary component matches. At2 use the near-adequate strongly odd unitary lift after the stated CM/solvable base changes; at odd p use the reasonable/tidy symplectic branch. Under either Sp4 Zariski image or the stated induced SL2×SL2 image, all four higher-Hida eigenspaces have multiplicity1 and higher-Coleman classicality makes ρ modular of weight2. Import the exact items rather than weakening the hypotheses to 'big image'. HigherHidaAndColemanTheory is a supplier, never a consumer of this roadmap. LocalGaloisDeformationRings supplies regularity at pure distinguished points and common finite-flat ordinary components; GlobalGaloisDeformations supplies integral-enormity Taylor–Wiles primes and cotangent bounds; DeformationAndDerivedPatchingAlgebra supplies the corrected open-ideal patched module and Auslander–Buchsbaum freeness. OrdinaryAutomorphicFormsAndModularityLiftingPartII supplies the regular R=T existence/support argument. Freeness may have rank0 until nonvanishing is proved; classical paramodular newvectors then bound the rank by1. Preserve the full central Hecke character, including similitude at trace zero. The source's augmentation-only cofinality assertion is false; its replacement still needs a compatible ring-action/lift proof on the characteristic-zero component. The source's all-components reduced-R=T claim on p178 is stronger than the local-through-q argument supplies; use only the latter, sufficient for multiplicity one. Retain Arthur classification and the analytic proof gates. Suggested files: TauCeti/Automorphic/GSp4/Nonregular/{Interpolation,AuxiliaryLevel,CotangentPatching,MultiplicityOne,OrdinaryLifting}.lean. They are future design targets, not compiled output.

### AbelianSurfacesModularity

Modularity of abelian surfaces (new). The issue explicitly fixes AbelianSurfacesModularity, DESIGN-BCGP25, building on DESIGN-BCGP18. This route preserves that instruction and supplies the concrete design brief.

MANDATORY maintainer route DESIGN-BCGP25; do not replace or rename it. Build on Abelian surfaces over totally real fields are potentially modular (AbelianSurfacesPotentialModularity, pending DESIGN-BCGP18, arXiv1812.09269) and the atlas's separate infrastructure for the ten-author paper arXiv1812.09999: ArithmeticLocallySymmetricSpaces, TorsionCohomologyInfrastructure, IgusaVarietiesAndTorsionConcentration, IntegralHeckeAndGaloisDeterminants, GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra and PotentialAutomorphyInfrastructure. Import higher Coleman and Hida theory from the EXISTING pending HigherHidaAndColemanTheory proposal and ordinary/nonregular lifting from the owners named in this extraction. The endpoint is TheoremA: a prime-to3 polarized A/Q with surjective mod3 image, unramified mod3 at2 excluding (X²±X+2)², good ordinary reduction at3 and distinct Frobenius roots is modular via a weight2 general-type GSp4 form with cuspidal GL4 transfer; its H1 L-function is entire with the expected functional equation. Theorem9.5.2 weakens surjectivity to the15 ticked groups of Table6.4.4 while adding End(A_Qbar)=Z. TheoremB is the quintic genus-two good-ordinary-at2,3 corollary, where3-distinction follows from the explicit F3 enumeration. Do not state modularity of every abelian surface as unconditional. Design layers for the S6–Sp4(F2) dictionary and A5(b) residual seed; the explicit ordinary local geometry at2 and3; the rational odd-theta/level3 moduli cover; approximation outside thin sets; and the2–3 switch. Import polarizations, Serre–Tate and Néron theory from AbelianSchemesAndArithmeticModuli and NeronModelsAndSemistableAbelianVarieties. Local2 permits semistable ordinary reduction: projective classes4C and12C are excluded, while good ordinary reduction has the smaller four-class list. Local3 may require a product PPAV special fibre and a nearby Jacobian whose curve has bad reduction. Keep H1 versus Tate-module duality at every torsion identification. The complement layers treat32 of34 Galois/Sato–Tate types with ISOBARIC automorphy, a source-qualified ordinary mod2 residual modularity theorem, and the conditional regular-weight Serre implication. The latter is conditional and the fixed2024 LMFDB count is not a conductor-density theorem. Store finite calculations as reproducible proof certificates: source Magma is pinned, but was not executed here. The independent stdlib enumeration and matrix checks are partial certificates only. Repair Lemma9.2.13 by adding bad/ordinary reduction; correct the Weil polynomial and scalar twist examples. The p220[2,2,2] curve is not3-distinguished: use the explicit F9 elliptic Weil restriction and prove the polarized-deformation/Torelli/local-constancy bridge. The p216 integral-duality and alternating-pairing issues remain explicit local-polarization obligations; do not infer that the entire lifting theorem is false from them. Preserve the Arthur twisted-weighted-fundamental-lemma dependency and the inherited topology, Sen and patching proof gates. Suggested endpoint files: TauCeti/ArithmeticGeometry/AbelianSurface/Modularity/{ResidualA5,LocalTwo,LocalThree,Switch,Main,Complements}.lean. Every definition gets the supplied API and at least three tests; all generic foundations are imports, never rebuilt in this endpoint. The concurrent BCGP21 extraction calls its potential-modularity endpoint PotentialModularityOfAbelianSurfaces. Treat that as a proposal alias of the maintainer-mandated AbelianSurfacesPotentialModularity / DESIGN-BCGP18 in this job; do not create both. This job does not mutate the companion extraction.

### LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis

Locally analytic distributions, Part II: quasi-abelian p-adic functional analysis and derived categories of convex spaces (part-ii). The same pending functional-analysis proposal already owns the strictness and derived convex-space infrastructure. The solid comparison is an extension of it, not a competing analytic foundation.

Join the proposal in PAPER-COLMEZ-DOSPINESCU-NIZIOL-20, preserving its classical quasi-abelian theory, and add the solid comparison required by BCGP25 §2.2 and its Banach-valued analytic cohomology applications. Import corrected solid coefficients from Sheaves and lisse categories on v-stacks (VStackSheavesAndLisseCategories:VS2) and analytic Banach/LF spaces from Locally analytic distributions, growth, and character spaces (LocallyAnalyticDistributions:L0). Prove the Banach–Smith and Fréchet–LS exact anti-equivalences, compact/trace-class duality, compact LB=compact LS, and flatness with precisely the hypotheses in items2.2.2–2.2.14. Supply internal/continuous-dual comparison, topological versus solid completed tensor, limits/colimits, and strictness, without assuming arbitrary locally convex extensions are determined by their kernel and quotient topologies. Lemma2.7.5 is false: include its graph-norm counterexample and a valid controlled/split-extension replacement. The specific twisted-Verma topology comparison is the category-O consumer's obligation, not a blanket axiom here. Generic adic coherent cohomology is imported from its geometric owner; add only the Banach/Smith coefficient and compact-support duality comparisons needed by §4.6. Every definition must have its evaluation/continuity/duality API and the tests supplied with the items. Export the exact distinction between a solid coefficient category and the naive general-R IsSolid predicate in pinned Mathlib. No locally analytic representation, category-O or automorphy theorem is constructed in this foundation.

### NoncommutativeAnalyticDistributions

Locally analytic distributions, growth, and character spaces, Part II: noncommutative distributions and microlocalization (part-ii). The pending Fu and Ding proposals overlap on distribution algebras. This route fixes a single algebra owner and a representation-category consumer.

Join PAPER-FU-24's distribution-algebra proposal. Add the solid formulation and the cofinal analytic-neighborhood/germ constructions in BCGP25 §2.2, retaining a precise separation from Fu's odd-prime microlocalization hypotheses. Import Banach/LF and character spaces from LocallyAnalyticDistributions, completed group rings from PadicMeasuresIwasawaAlgebras:L1, solid functional duality from LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, and PBW completions from PadicEnvelopingAlgebras. Construct convolution D(G), compatible small-group radius algebras, Fréchet–Stein/coadmissible modules, the full faithful exact embedding into solid modules, and the continuous-dual admissible module category. For left modules the transition is U_r⊗_{U_{r+1}}M_{r+1}; do not repeat the source's reversed tensor product. Prove the cofinal comparison with Û(g)=O_{G,e}∨, including compact Banach and trace-class Smith presentations. Supply the algebra and coadmissible-module foundations ONCE to LocallyAnalyticRepresentationsOfLocalGroups; its pending Ding proposal must consume this D(G), not build another one. No general claim that every solid module is coadmissible, or every Lie action integrates analytically, is allowed. Finish the declared API/tests before the category-O and HCS consumers use exactness or flatness.

### PadicEnvelopingAlgebras

Representations of semisimple Lie algebras, highest weight theory, and the Weyl formulas, Part II: integral and p-adic enveloping algebras (part-ii). The completed enveloping algebra already has a pending algebraic owner; reuse it and import ordinary highest-weight theory from upstream.

Join PAPER-FU-24's PadicEnvelopingAlgebras proposal. Add the split reductive finite-E Lie algebras and all-prime Arens–Michael completions used in BCGP25 §§2.2,2.7. Import full field PBW and reductive highest-weight theory from LieHighestWeight (tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight), explicitly distinguishing its planned PBW basis theorem from the pinned spanning half and abelian monomial basis. Construct the PBW multiindex norm completions U(g)_r, transition maps, flatness, dense algebraic embedding and exact finite-module completion. Never grade U(g) by finite-dimensional adjoint weight spaces: the zero-weight space is already infinite. NoncommutativeAnalyticDistributions owns the analytic distribution/germ comparison, so keep that comparison downstream of this algebraic completion construction. This extension must not infer a dyadic version of Fu's odd-prime uniform-group/microlocalization results; prove only the source-qualified small analytic subgroup comparison required here. The terminal algebraic interface is exact completion of finitely generated U(g)-modules to compatible finite Banach modules. Coadmissible topological realization and the completed category-O theorem are consumers, with their own hypotheses and source gaps.

### HigherHidaAndColemanTheory

Hida and Coleman families, period modules, and family L-functions, Part II: higher Hida and higher Coleman theory for coherent cohomology (part-ii). Pilloni20 already proposes this exact roadmap. Reuse and extend its brief instead of opening a competing higher Coleman project.

Join the HigherHidaAndColemanTheory proposal of PAPER-PILLONI-20, already named as the supplier for DESIGN-BCGP18. Extend its Klingen/scalar-weight theory with BCGP25 §§4,7.3: general Hodge-type higher Coleman functors, their cusp/noncusp amplitudes, finite-slope comparisons, the p-adic Eichler–Shimura spectral sequence, the GSp4 four-step ordinary filtration, and the Sen–Cousin comparison at singular weight. Import perfectoid Hodge-type towers (PerfectoidShimuraVarieties), Hodge–Tate period maps (HodgeTateAndCanonicalSubgroups), classical bundles (AutomorphicBundles), boundary geometry (ShimuraCompactifications and its pending integral Part II), coherent Hecke complexes (IntegralCoherentHeckeComplexes), completed cohomology (CompletedCohomologyPartII), and HCS/Loc from LieHighestWeightPartIICompletedCategoryO. Preserve the compatible compactification choices: G(Q_p) may change the cone decomposition. The main general endpoints are Theorem4.6.45/58 (cusp amplitude[0,ℓ(w)], noncusp[ℓ(w),d]),4.6.60 (the sharper slope bound only for proper or Siegel data),4.7.2 (non-Liouville spectral sequence with horizontal arithmetic Sen), and4.9.9 (irreducible residual localization gives ordinary GSp4 middle-degree cohomology with four Bruhat pieces). At λ=(1,1;even w),4.10.12 identifies a nilpotent off-diagonal Sen map with the classical Cousin differential up to nonzero scalar. Its two inherited proof gates are the completed-Verma topology comparison and3.6.15's fibre calculation. The classicality endpoint4.12.4 requires de Rhamness, the stated Zariski-image condition, residual absolute irreducibility and EIGENSPACE multiplicity balance; do not assume exactness of taking eigenspaces. §7.3 supplies finite projective higher-Hida modules, all four Weyl pieces, central-character specialization, duality, and tame-level group-algebra projectivity. It imports generic perfect complexes and source-qualified cohomological vanishing, not a conjectural all-weight concentration theorem. Never import the downstream GSp4NonregularModularityLifting or AbelianSurfacesModularity roadmap into this theory. Suggested files: TauCeti/Automorphic/HigherColeman/{Coefficients,Supports,Slopes,EichlerShimura,SenCousin,Classicality}.lean and HigherHida/Control.lean, to be designed later. A concurrent BCGP21 extraction now uses the same HigherHidaAndColemanTheory id with route new instead of the earlier Pilloni20 Part II. Coalesce those proposals into ONE design; retain the earlier Part II identity here and preserve the Hilbert–Siegel doubling and multivariable scope of BCGP21. The route-kind/title discrepancy is for independent design review, not grounds for a second roadmap.

### ProetaleCohomologyOfPAdicCurvesAndTowers

Pro-étale cohomology of p-adic curves and towers (new). The pending tower proposal already includes the generic all-dimensional Stein duality foundation; reuse that identity and expose the reusable layers to higher Coleman theory.

Join the existing proposal of PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B, extended by PAPER-DOSPINESCU-LEBRAS-17 and PAPER-COLMEZ-DOSPINESCU-NIZIOL-23. Preserve its Drinfeld/Lubin–Tate and p-adic local Langlands endpoints. Its Dospinescu–Le Bras extension already explicitly owns Stein spaces in every dimension, Kiehl acyclicity and Chiarellotto/Grosse-Klönne duality. Add the coherent compact-support interface used by BCGP25 §4.6: define cohomology with proper closed supports and its relatively compact exhaustion comparison; for smooth Stein X of pure dimension d and finite locally free F, prove concentration of H_c(X,F) in degree d and the perfect continuous pairing with H⁰(Hom(F,Ω^d)). Prove compact-type LB structure and naturality under coefficient maps. Import adic coherent sheaves and Čech comparison from AdicSpacesPartII:R3, and Banach–Smith exact duality from LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis. The latter owns infinite-dimensional tensor refinements, avoiding a duplicate functional-analysis construction here. The geometric Stein layers must precede and be independent of both the Drinfeld tower applications and higher Coleman theory: neither consumer is an input to the general duality. Retain smoothness and pure dimension, which are essential in BCGP Corollary4.6.26. Suggested future file: TauCeti/Geometry/Adic/Stein/CoherentDuality.lean, beside the already proposed tower files.

### OrdinaryAutomorphicFormsAndModularityLiftingPartII

Ordinary automorphic forms and modularity lifting, Part II: dyadic unitary and symplectic ordinary lifting (part-ii). The higher-rank/dyadic theorems go beyond the existing rank2 parent. Generic deformation and patching constructions stay with their current owners.

The parent R21 roadmap is modular/Hilbert/quaternionic rank2 ordinary theory, particularly Skinner–Wiles. Add the genuinely new higher-rank cases of BCGP25 §§5–6 without broadening a rank2 layer by name alone. The first endpoint is Theorem5.7.14: for the specified everywhere-unramified CM extension with2 split, ordinary RACSDC residual automorphy, absolute irreducibility, near adequacy, a regular semisimple residual element, the parity condition n[F⁺:Q]≡0 mod4 and strong residual oddness when n is even, the sufficiently-deep ordinary deformation ring is finite over the weight algebra and its reduction equals the ordinary Hecke algebra. Preserve all splitting/ramification/local deformation hypotheses and the G_n-conjugacy relation; at2 the GL1 component changes tangent conditions. Taylor–Wiles kills all but the unavoidable one-dimensional dual-Selmer class. The second endpoint is Theorem6.3.4 for p>2 completely split in F⁺: the specified reasonable/tidy ordinary residual GSp4 system on the chosen local components through π has finite weight algebra and reduced R=T. Import local GSp4 scheme-image/ordinary-component geometry from LocalGaloisDeformationRings, global deformation and auxiliary-prime cohomology from GlobalGaloisDeformations, generic patching/support from DeformationAndDerivedPatchingAlgebra, Hida families from PadicFamilies/HigherHidaAndColemanTheory, and ACC+ ordinary CM/support/base-change infrastructure from PotentialAutomorphyInfrastructure. Import unitary automorphic spaces and transfer from AutomorphicFormsOnReductiveGroups and EndoscopicTransferAndUnitaryTraceComparison. The p=3 residual symplectic image need not be adequate as a GL4 image, so the two lifting branches cannot be merged into one unsupported adequacy hypothesis. Include source-verified tests for the one surviving dyadic Selmer class, the four dyadic weight components after inverting2, and the distinction between an arbitrary local component and the chosen automorphic component. This project proves regular-weight lifting; singular classicality and the2–3 switch are downstream.

### LocallyAnalyticRepresentationsOfLocalGroups

Locally analytic representations of p-adic reductive groups (new). The atlas already has a pending locally analytic representation roadmap; this paper extends that same identity and resolves its foundational ownership overlap.

Join the existing proposal of PAPER-DING-25, also used by PAPER-COLMEZ-DOSPINESCU-NIZIOL-20. Add BCGP25's solid locally profinite and analytic representation categories, smooth and λ-smooth objects, analytic-vector construction with its three actions, Banach analytic-group/distribution equivalence, and enough-injectives results. Import D(G) and coadmissible module foundations from the pending NoncommutativeAnalyticDistributions rather than duplicating their construction; import Banach–Smith duality from the pending functional-analysis Part II. The group's analytic action, continuity, Banach-stage integrability, and algebraic coaction are distinct predicates. Construct the derived locally analytic-vector interface in the exact source generality. For dependency order, the category-O algebraic core is supplied by LieHighestWeightPartIICompletedCategoryO, since upstream LieHighestWeight explicitly excludes full category O. The Orlik–Strauch layers of the existing Ding brief consume that core; the new HCS localization construction does not import the Orlik–Strauch output. Only the foundational representation stages are used by the analytic category-O stages, so the stage graph must make this order explicit and contain no return edge through the later Orlik–Strauch theorem. Preserve the Ding and CDN terminal theorems unchanged and add these foundational interfaces once.

### GSp4LocalLanglandsAndGaloisRepresentations

Modularity and Langlands extensions, Part II: GSp4 local Langlands and Galois representations (part-ii). The newly merged BCGP21 extraction proposes this specialist interface. These seven items refine it; general automorphic, Hecke and deformation inputs retain their existing owners.

Coalesce with the same pending roadmap proposed by PAPER-BOXER-CALEGARI-GEE-PILLONI-21; do not create another GSp4 interface. This addition owns the specialist adapters in BCGP25 Theorem1.8.13 and Proposition7.5.1. For regular algebraic cuspidal GSp4 over a totally real field with p completely split and central character absolute-value squared, construct the semisimple symplectic Galois representation of multiplier ε⁻¹, its geometric-Frobenius local-global comparison, Hodge–Tate weights and ordinary diagonal exactly as split in1.8.13. Under irreducibility obtain purity and full Frobenius-semisimplified Weil–Deligne compatibility. For a general-type local packet identify its unique generic paramodular member, prove its minimal paramodular invariant line is one-dimensional, and identify the minimum level with the local parameter conductor. Import the generic regular GL_n Galois construction from AutomorphicGaloisRepresentationsPartII, transfer and multiplicity from EndoscopicTransferAndUnitaryTraceComparison, smooth convolution/Jacquet/Satake from SmoothRepresentationsOfLocalGroups, and the common integral Hecke reconstruction from IntegralHeckeAndGaloisDeterminants. Do not reconstruct those generic foundations in this Part II. Preserve the companion's Gan–Takeda correspondence and GSp4-specific packet scope; a GL4 representation alone does not encode a chosen similitude. Singular weight2 interpolation remains a consumer in GSp4NonregularModularityLifting, not an input to this regular package. The newform proof must read Roberts–Schmidt, Schmidt and Johnson-Leung–Roberts–Schmidt in their stated local ranges. Suggested future files: TauCeti/Automorphic/GSp4/{LocalLanglands,RegularGalois,ParamodularNewforms}.lean. Retain the Arthur dependency registry; this extraction does not claim the pending proposal is already a designed or implemented roadmap.

## Source findings and proof obligations

The structured result records74 findings, each with its locator, printed
expression, correction or missing argument, evidence, reach and correction
search. These are extraction findings awaiting independent review. No
independent-review verdict is assigned here. The search covered the arXiv
version history, the author PDF, Calegari's research page, Boxer and Pilloni's
public publication pages and bounded title/erratum/correction queries.
`known: new` means no correction was located by that search, not a priority
claim. Nothing has been sent to the authors.

Most findings concern signs, tensor handedness, shifts, coefficient rings,
indices or omitted hypotheses. The following require particular care:

* **Completed category O:** Lemma2.7.5 is false for general topological
  extensions. On E⊕c00(E), use the usual supremum norm and its pullback by
  (a,x)↦(a+Σp^(−n)x_n,x). They have the same kernel and quotient
  topologies but differ on (0,p^n e_n). The specific Verma comparison may
  still be correct, but2.7.6/2.3.32 require a new comparison argument.
  The non-Liouville product estimate is separately repaired by choosing a
  minimizing index inside1,…,n. The SL2 embedding exponent is λ+1.
* **Singular localization:** equal central characters at singular weights
  must be grouped into one Artin factor. The ambient operator
  (x+1)∂_x+1 in3.6.15 kills1/(1+x). Whether this germ belongs to the actual
  constrained HCS fibre remains to be established, so this is a proof gap,
  not a counterexample to the proposition. It feeds the Sen–Cousin argument.
* **Patching:** the kernel of O[[T]]→O[Z/p^N] contains
  (1+T)^(p^N)−1, whose nonzero linear coefficient prevents containment in
  (T)² for every N. The printed augmentation-only cofinality cannot define
  the asserted ultraproduct. Gee–Newton uses finite open ideals and joint
  truncations. At2, a map-lifting argument must also handle the torsion
  characters of the weight algebra; fixing the ideals alone is insufficient.
  The support argument on p178 applies to components through q, which is
  enough for the required nonvanishing but not a global all-components R=T.
* **Hecke centre:** e₃/e₁ is undefined at trace zero. Use the full central
  parameter μ with e₃=μe₁ and e₄=μ². Over F7 the distinct eigenvalues
  {2,5,3,4} admit similitudes1 and−1 with the same polynomial. Localizing
  at a full Hecke character avoids this ambiguity.
* **Local2 geometry:** Lemma9.2.13 needs bad reduction, or an additional
  ordinary hypothesis together with exclusion of good ordinary reduction.
  The paper's own good nonordinary curve Y has class6G and contradicts
  the printed unrestricted conclusion. Its correct Weil polynomial is
  X⁴+2X²+4. The Tate3-torsion representation in9.2.14 includes the
  cyclotomic factor. The scalar+1 case in9.3.7 needs an unramified
  quadratic twist of the displayed product.
* **Local polarization at2:** purity eliminates rational H² but not integral
  torsion. For the ordinary unit root α of X²+X+2,
  v₂(α²−1)=3; local Tate duality gives a nonzero order8 obstruction in
  the relevant rank-one tensor factor. Kisin's right-exact finite-flat H¹
  supplies a possible replacement, followed by compatible finite limits.
  A perfect skew self-duality at2 and an isotropic connected factor also
  fail to imply alternation: on μ₂²⊕(Z/2)² use the block matrix
  [[0,I],[I,diag(1,0)]]. This refutes the explanation, not the weaker
  existence conclusion that the underlying group is some A[2]. The
  polarized Serre–Tate interpretation remains an explicit obligation.
* **The p220 local3 table:** the[2,2,2] curve has
  #C(F3)=8 and #C(F9)=14, hence Q₃=(X²+2X+3)², and is not
  3-distinguished. There is only one monic squarefree sextic with three
  irreducible quadratic factors over F3. A different smooth curve with the
  same partition cannot fix this. Instead take
  E/F9: y²=x(x−1)(x−t), t²=−1. It has8 points and full rational2-torsion;
  its Weil restriction has principal product polarization,
  Q₃=X⁴−2X²+9 and the required triple-transposition action. A lift and
  a nearby Jacobian require the polarized-deformation, Torelli and local
  constancy argument; only the finite seed calculations are established here.
* **Approximation:** Lemma9.4.1 needs smoothness, or a condition that every
  local open meets the birational smooth locus. A rational nodal curve
  with an isolated real point supplies a counterexample without it. The
  moduli applications use smooth spaces. The projective height exponents
  also need their dimension-plus-one correction.

The Arthur input is a separate dependency stated by the paper itself.
The [Atobe–Gan–Ichino–Kaletha–Mínguez–Shin v3
abstract](https://arxiv.org/abs/2410.13504v3), revised24 July2026, still
conditions the classification on the twisted weighted fundamental lemma.
This extraction keeps that condition; it does not infer its resolution from
the ordinary fundamental lemma or a special GSp4 case.

## Computations and reproducibility

Two independent Python standard-library scripts completed **27,297
assertions**. Their SHA-256 hashes and compact result certificates are in
`validation.finiteChecks`. They enumerate generalized models over F2 and F3,
test smoothness in both charts, count Fp and Fp² points, recover reciprocal
Weil quartics, and check ordinarity. The F2 enumeration gives768 smooth
models and384 ordinary models; the F3 enumeration gives1296 and864.
There are ten ordinary F3 square-quartic models and none has a rational
Weierstrass point. The ordinary Weil-quartic lists have16 entries at2 and40
at3. These facts concern the specified coefficient models, not moduli-weighted
counts of isomorphism classes.

For Q_p(X)=X⁴−s₁X³+e₂X²−ps₁X+p², the point-count recovery uses
s₁=p+1−#C(Fp), s₂=p²+1−#C(Fp²), e₂=(s₁²−s₂)/2.
The small fields are implemented by explicit quadratic polynomial quotients;
finite sums include the infinity chart. Smoothness is checked separately
from point counting. The complete S6 action is constructed on the
even-coordinate subspace of F2⁶ modulo its all-ones vector, yielding720
distinct symplectic matrices. The A5 semisimple matrices span rank16 in
End(F2⁴). Additional checks cover the ten p220 partitions, the F9 elliptic
seed, Hensel lifting through2^18, the source's small elliptic sign examples,
the SL2 exponent and the explicit algebraic counterexamples above.

The [source Magma archive](https://github.com/fcale75/newabeliansurfacesmagmafiles/tree/402f60de05fad3b0edb30e9d444941e0643ec45e)
is pinned at commit402f60de05fad3b0edb30e9d444941e0643ec45e.
The scripts and selected recorded outputs were inspected; Magma was not
installed or executed. Large division-polynomial data were not read in full.
No independent3-torsion resolvent, conductor or full database computation is
claimed. The archived allstats output includes6513+4871=11384 accepted
good-at2,3 rows and359 additional rows, but rerunning its frozen-dataset
certificate is a future proof obligation.

The finite checks do not prove the analytic, patching or modularity theorems.
The proposed definition tests are separate planning requirements and have
not been executed in Lean. No Lean file is an authorized deliverable of this
paper job, and no elaboration is claimed: the installed executable has no
configured default toolchain or pinned build environment.

## Prerequisite sources still needing exact coverage

BCGP18/21, ACC+, Pilloni20, Calegari–Geraghty and the higher-Hida source
already have catalogue entries or pending suppliers. Bellovin–Gee and
Boxer–Pilloni's higher Coleman paper are also recorded in earlier source
work. They are not proposed as competing roadmaps or duplicate batch jobs.
The following list identifies the still-needed exact source extractions or
refinements; an existing request is reused where stated.

* [Rodrigues Jacinto–Rodríguez Camargo, Solid locally analytic representations of p-adic Lie groups, Represent. Theory26 (2022),962–1024](https://arxiv.org/abs/2110.11916). BCGP §§2.2,3,4 need the exact Banach/Smith duality, solid flatness, topological Mittag–Leffler and derived analytic-vector comparisons. Their owners are identified, but no standalone extraction of these precise inputs was found; do not substitute the different 2023 sequel.
* [Tobias Schmidt, Verma modules over p-adic Arens–Michael envelopes of reductive Lie algebras, J. Algebra390 (2013),160–180](https://arxiv.org/abs/1008.3897). BCGP §2.2.31–39 imports the Fréchet–Stein/coadmissible and completed category-O equivalence. The algebraic upstream Verma carrier does not supply this theorem; route the completion algebra and category-O consumer separately.
* [Rodríguez Camargo, Locally analytic completed cohomology](https://arxiv.org/abs/2209.01057). BCGP §§4.3–4.5 need exact locally analytic primitive comparison and geometric Sen input at Hodge-type towers. Existing tower plans do not replace a source extraction with all Banach-stage hypotheses.
* [Rodríguez Camargo, Geometric Sen theory over rigid analytic spaces](https://arxiv.org/abs/2205.02016). Theorem4.5.4 and the arithmetic/horizontal Sen comparison require the nilpotent Lie action, decompletion and logarithmic differential comparison; full source extraction is still needed for the indicated HT and higher-Coleman owners.
* [Casselman–Osborne, The n-cohomology of representations with an infinitesimal character, Compositio31 (1975),219–227](https://numdam.org/item/CM_1975__31_2_219_0/). BCGP §2.3 uses the centre action on nilradical cohomology, with the relative Harish–Chandra shift. Full/parabolic category O lies beyond the upstream LieHighestWeight scope.
* [Chiarellotto, Duality in rigid analysis, LNM1454 (1990),142–172](https://link.springer.com/book/10.1007/BFb0091130). The all-dimensional smooth Stein duality of BCGP4.6.24 is already requested by the CDN/Dospinescu–Le Bras proposal, but its exact source proof is not an accepted implementation. Reuse that request and owner rather than create another Stein roadmap; the link identifies the containing volume and chapter.
* [Dmitri Whitmore, The Taylor–Wiles method for reductive groups](https://arxiv.org/abs/2205.05062). BCGP §§6.3–6.4 use G-adequacy/reasonableness and reduced symplectic R=T. Definitions3.15/3.19 were checked in v2; a full extraction must supply the finite-group detection and local/global comparison theorems, not import GL4 adequacy as a substitute.
* [Newton–Thorne, Adjoint Selmer groups of automorphic Galois representations of unitary type, JEMS25 (2023),1919–1967](https://arxiv.org/abs/1912.11265). BCGP §7.1 adapts integral enormity and bounded Selmer/cotangent arguments. This is distinct from the Newton–Thorne symmetric-power papers already in the batch; the symplectic/dyadic adaptation needs its own verified source inputs.
* [Gee–Newton, Patching and the completed homology of locally symmetric spaces, JIMJ21 (2022),395–458](https://arxiv.org/abs/1609.06965). The finite open-ideal construction of §3.4 and Remark3.4.17 were checked in v5 as the repair model for BCGP §7.2. The general owners already exist, but their exact truncation/ring-action theorem and the additional dyadic lift obligation are not discharged by saying patching.
* [Nekovář, Eichler–Shimura relations and semisimplicity of étale cohomology of quaternionic Shimura varieties, Ann. Sci. ENS51 (2018),1179–1252](https://numdam.org/articles/10.24033/asens.2374/). BCGP4.11.2 imports a representation-theoretic semisimplicity criterion from this source. Its GSp4 image alternatives and the corrected orthogonal eigenvalues must be checked independently of the quaternionic geometric application.
* [Kisin, Modularity of 2-adic Barsotti–Tate representations, Invent.178 (2009),587–634](https://doi.org/10.1007/s00222-009-0207-5). Lemma2.4.2 and Proposition2.4.4 were read in the public author DVI. They supply right-exact finite-flat H1 and the ordinary deformation argument used in BCGP6.2.5, and a possible input to repairing10.3.1. This is not Kisin’s different Annals finite-flat-moduli paper; rank-four symmetric tensors and polarized geometry remain adapters.
* [Fité–Kedlaya–Rotger–Sutherland, Sato–Tate distributions and Galois endomorphism modules in genus2, Compositio148 (2012),1390–1442](https://arxiv.org/abs/1110.6638). BCGP10.2 uses the34 Galois/endomorphism types over Q and their labels. The source classification needs an exact extraction; it does not itself prove the general Sato–Tate equidistribution conjecture.
* [Calegari–Chidambaram–Roberts, Abelian surfaces with fixed3-torsion, Open Book Ser.4 (2020),91–108](https://arxiv.org/abs/2003.00604). BCGP9.4 uses the rational odd-theta/marked-Weierstrass moduli cover and its fixed symplectic3-torsion interpretation. General PEL moduli do not provide these explicit equations and rationality certificates.
* [Wedhorn, The dimension of Oort strata of Shimura varieties of PEL-type, Progr. Math.195 (2001),441–471](https://link.springer.com/book/10.1007/978-3-0348-8303-0). The polarized ordinary finite-level BT lifting used in BCGP9.3 and10.3 needs the exact hypotheses at2, including alternation and the relation between a supplied duality and an induced polarization. Existing PEL/BT suppliers own the theory; the link identifies the containing volume, not a claim to have read the chapter.
* [Roberts–Schmidt, Local newforms for GSp(4), LNM1918 (2007)](https://link.springer.com/book/10.1007/978-3-540-73324-9). BCGP7.5.1 requires the paramodular newvector line and conductor theorem in their local representation range. Coalesce this source with the newly proposed GSp4LocalLanglandsAndGaloisRepresentations supplier.
* [Ralf Schmidt, Packet structure and paramodular forms, Trans. AMS370 (2018),3085–3112](https://math.ou.edu/~rschmidt/papers/packets_paramodular.pdf). The generic member of a general-type packet and uniqueness of its paramodular vector are needed in7.5.1; generic smooth representation infrastructure alone is not a packet theorem.
* [Johnson-Leung–Roberts–Schmidt, Stable Klingen Vectors and Paramodular Newforms, LNM2344](https://link.springer.com/book/10.1007/978-3-031-45177-5). The source cited as JLRS23 in7.5.1 strengthens the local vector/conductor input. Reuse the same pending GSp4 supplier; retain the exact local field, packet and conductor restrictions when extracting it.

## Validation and review handoff

`scripts/check_paper.py` reports no errors. The three authorized deliverables
also pass `intake.py check-files`. A separate coverage check verifies all309
named environments, the definition API/tests and exact-one routing of all555
missing items. Publication checks the current blob of every input and the
original absence of the three deliverables before creating the commit.

Review should prioritize the source findings with downstream proof impact,
the fixed-polarization versus underlying-torsion distinction at2, the local3
replacement bridge, the source-qualified ordinary/finite-slope comparisons,
and coalescence of the concurrent BCGP21 proposals. The structured
`proofObligations` list records these without declaring the main modularity
theorem false. No source correction or route here has an independent verdict
until the separate review job checks it.

## Independent review (`REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-25`, issue #2167)

Claude Code, session `cc-fb70e5`, 23 September 2026. **Verdict: accept, all 35 routes accepted.** The full review is in
[`reviews/REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md`](../reviews/REV-PAPER-BOXER-CALEGARI-GEE-PILLONI-25.md); the
route verdicts are in the `.review.json` beside this file.

**Coverage: nothing missing.** Reconstructing the paper's shared `subsubsection` counter from the LaTeX source — theorem
environments, plain headings and the 93 displays made by the authors' `\numequation`/`\ssinc` macros all consume it — gives
617 numbered objects, calibrated against the PDF at nine probes. Of the 152 that appear in no item locator, every one
resolves: the §4.1 restatements are covered at their originals (4.6.45, 4.6.58, 4.6.60, 4.7.1, 4.7.3, 4.7.5), Theorems A and
B are covered by name, and Hypotheses 5.7.1, 5.7.5, 6.3.1 and 7.1.3 are folded verbatim into every dependent item.

**Statuses: verified at the pinned commits.** All fourteen declarations of the eight `library` items exist at Mathlib
`082e2d3` and Tau Ceti `f790474`, in the namespaces claimed; all 32 `planned` items cite layers that plan them.

**Findings: 71 of the 74 confirmed, 3 rejected, 1 added.** Several were settled by computation (#Y(F₄) = 9 gives
Q = X⁴+2X²+4 for E041; (X²+2X+3)² for E053; v₂(α²−1) = 3 for E050) and many by the paper contradicting itself. The
rejections are E031 (no defect: the printed congruence is correct, merely redundant at p = 2), E047 (the quotation is not at
its locator and the claim is justified by Kisin's local-constancy theorem) and E072 (no false statement identified). E017
was confirmed only after correction — p77 prints "cokernel" correctly, so the recorded quotation was a misreading, but the
sentence after it is a literal tautology, which the entry now records. E075 was added: a subscript slip in the statement of
Lemma 2.7.5.

**Changes made to this extraction:** three Part II titles now reproduce their parents' titles (PROTOCOL §15), E035's locator
was corrected (7.4.9 is a Definition; the quoted text is in the discussion after Proposition 7.4.10), E017 was restated, and
`review` verdicts were added to all 75 findings. No item, status, statement or route membership was changed.
