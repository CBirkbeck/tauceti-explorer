# Roadmap: arithmetic locally symmetric spaces and their cohomology, Part II

Build completed cohomology and homology from the actual finite-level arithmetic complexes. The endpoints are the finite projective completed chain model, qualified finiteness and Banach admissibility, derived finite-level descent, completed support and duality comparisons, and the residual Hecke summands used by arithmetic consumers. All nine layers are planned. Proof closure requires the precise supplier extensions and proof leaves listed below; no result is claimed to be implemented.

## Scope and ownership

This is the Part II of `ArithmeticLocallySymmetricSpaces` fixed by accepted RS-09. ALS supplies arithmetic quotients, local systems, finite cochains, the Borel–Serre pair, correspondences and finite-level duality. Current TauCetiRoadmap `AlgebraicTopology` supplies cellular chains, relative complexes, covering transfers and manifold duality; `ProfiniteArithmetic` supplies existing profinite powers, integral-ring and continuous-automorphism foundations. Continuous cochains and countable cofinal systems use their library/R02.1 owners. Neither is constructed again here. The library audit is AUDIT-14 in `data/library-coverage.json`; its generic colimit/limit and group-cohomology evidence is used with the arithmetic specializations kept separate.

The accepted independent CC.8 packet supplies twelve targets, including compatible finite derived Hecke images, the completed Hecke algebra, stable residual support, semilocal product decomposition and residual localization. Those targets are reproduced below as imports. This whole-roadmap packet adds the selected canonical-model, Hilbert/quaternionic coefficient and central-quotient inputs, together with the finite étale–Betti and oriented trace contracts. These narrow inputs replace the older V8, R18.4 and EDC.6 dependencies identified by the current upstream order. The accepted part file remains unchanged: applying that supplier migration is proof/assembly obligation G11.

Scholze’s almost automorphic-section comparison and its vanishing corollaries belong to TC.2. CC.8 only matches the fixed-exponent completed object and support convention. GL₂ Banach local–global compatibility belongs to R31; no such theorem is used for GSp₄. General analytic-group, Iwasawa dimension and unitary Banach category theory belongs to NE.0 and the foundational extension immediately after L1, with exact requests below. The arithmetic specializations here do not define those categories a second time.

## Conventions

Fix a prime p and O, the ring of integers of a finite extension E/Q_p, with uniformizer varpi and finite residue field k. Fix tame level K^p and one specified compatible integral coefficient lattice. Reductions are O/varpi^s for s≥1. Rational isomorphism of coefficient representations does not identify their integral lattices or support diagrams. Complete local coefficient rings A occur only in the separately qualified CC.3 topological-module targets.

Write H for the full local group and K_0 for a compact open. For a fixed algebraic lattice W_0 let H_int=Stab_H(W_0), an open subgroup containing K_0. Integral local actions below are actions of H_int; replacing it by full H requires a coherent full-H-equivariant integral system, as for trivial coefficients. A general g transports W_0 to g⁻¹W_0. Only the commensurable-lattice comparison after rationalization gives the full-H algebraic-coefficient action. When applying the finite free chain model choose an actual regular tower of a finite CW pair with faithful deck groups K_0/U_r, for U_r a cofinal normal basis; open uniform/pro-p existence is a foundational input. This hypothesis is checked at the geometric quotient being used. In a Shimura quotient with ineffective rational central units, neatness alone does not imply these deck groups: CC.8 retains the effective quotient, central coefficient descent and bundle comparison under G12. A non-neat fixed level has its ALS derived stabilizer interpretation.

For cohomology, refinement U⊂K induces pullback from level K to U. At fixed s put A^n_{*,s}=colim_K H^n_*(Y_K,O/varpi^s), with discrete topology and support *=ordinary,c,∂. Put H̃^n_*=lim_s A^n_{*,s}; the level colimit precedes the coefficient inverse limit. The enhanced complex is RΓ̃_*=Rlim_s colim_K C^*_{K,s}. Its cohomology and H̃^n_* differ by the explicit Milnor term unless the stated control theorem applies.

Completed homology is the compact inverse level limit under covering pushforward, not transfer. Borel–Moore homology is relative homology of the Borel–Serre pair. Finite coefficients and reduction of integral completed homology are distinguished by the adjacent torsion term in Bockstein. Compact support, boundary and the image defining interior cohomology are different objects.

A left action on a module gives the right transpose action on its dual by (f·g)(x)=f(gx). To obtain a left dual action use (g·f)(x)=f(g⁻¹x), consistent with Mathlib `Representation.dual`. Algebraic and continuous duals, pointwise compact and uniform varpi-adic topologies, and O versus E/O coefficient targets are named separately. Tame trace is unnormalized: trace after pullback at a degree-d cover multiplies by d. Orientation characters, component groups, and the BP Serre twist t↦w₀t⁻¹ remain in every applicable comparison.

The dimensions used in CC.5/CC.7 are different: a real symmetric-space dimension controls classical middle degree, whereas dim(K_0) is the local analytic dimension. For torsion-free uniform U, O[[U]] has global dimension dim(U)+1 and k[[U]] has global dimension dim(U). Concentration conjectures, projectivity of homology and arbitrary-filtration growth are not consequences of finite perfectness.

## Existing Mathlib and Tau Ceti used

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the following statements and their type hypotheses were read. Existing derived categories and exact colimits supply generic operations; they do not supply the arithmetic diagrams, continuous completed Tor or the required enhanced countable Rlim.

- `tauceti:TauCeti.moduleCat_ab5OfSize`: Filtered module colimits are exact with the stated small universe convention. Module `TauCeti/Algebra/Homology/ShortComplex/Colimit.lean`.
- `tauceti:TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`: Homology of complexes commutes with existing exact colimits. Module `TauCeti/Algebra/Homology/ShortComplex/Colimit.lean`.
- `mathlib:ModuleCat.sectionsSubmodule`: Compatible module-valued sections are a native submodule of the product. Module `Mathlib/Algebra/Category/ModuleCat/Limits.lean`.
- `mathlib:TopModuleCat.isLimit`: An underlying module limit with the projection-induced topology is a topological-module limit. Module `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean`.
- `mathlib:Module.DirectLimit`: The existing module colimit carrier; this packet specializes its diagram, not its quotient construction. Module `Mathlib/Algebra/Colimit/Module.lean`.
- `mathlib:Module.DirectLimit.of`: Canonical maps from level modules into the existing colimit. Module `Mathlib/Algebra/Colimit/Module.lean`.
- `mathlib:Module.DirectLimit.exists_of`: Every class has a finite-level representative in a nonempty directed diagram. Module `Mathlib/Algebra/Colimit/Module.lean`.
- `mathlib:DerivedCategory.Q`: The native localization of cochain complexes at quasi-isomorphisms. Module `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`.
- `mathlib:CategoryTheory.Limits.colim.exact_mapShortComplex`: An exact colimit functor preserves exact short complexes. Module `Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Colim.lean`.
- `mathlib:CategoryTheory.Functor.Final.colimitIso`: Cofinal restriction gives the existing categorical colimit isomorphism. Module `Mathlib/CategoryTheory/Limits/Final.lean`.
- `mathlib:Representation.dual`: Algebraic dual representation uses precomposition by the inverse group action. Module `Mathlib/RepresentationTheory/Basic.lean`.
- `mathlib:groupCohomologyIsoExt`: Discrete group cohomology is Ext in Rep; not continuous completed descent. Module `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean`.
- `mathlib:groupHomologyIsoTor`: Discrete group homology is Tor in Rep with its tensor product; the ordinary group-ring interpretation requires its standard adapter, and this is not continuous completed Tor. Module `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`.
- `mathlib:ContinuousLinearMap`: Native bundled continuous linear maps supply continuous O-dual maps. Module `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`.
- `mathlib:PontryaginDual`: Native Circle-valued continuous characters with compact-open topology; O-linear E/O duality still needs comparison. Module `Mathlib/Topology/Algebra/PontryaginDual.lean`.

Current upstream `AlgebraicTopology` supplies finite cellular/relative complexes, finite-cover maps and manifold duality; `ProfiniteArithmetic` supplies profinite powers and its integral-ring/automorphism foundations. The nine newer directions were inspected for relevant overlap. The current completed-group-algebra receipt is also explicit in `ProfiniteProPGroups`, Layer 9 prerequisites. At Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti.completedGroupAlgebra` already supplies the ring, finite quotient projections, extensionality, topology and dense group-algebra span (`CompletedGroupAlgebra/Basic.lean`). `TauCeti.IsCompactModule` already supplies the compact totally disconnected topological-module predicate and quotient/limit API (`Topology/Algebra/Module/Compact.lean`), and `IsCompactModule.completedGroupAlgebraModule` extends a continuous scalar-compatible compact-group action, with `completedSMul_of`, `mkQ_completedSMul` and `continuousSMul_completedGroupAlgebraModule` (`CompletedGroupAlgebra/Module.lean`). CC.3 imports these; its new work is verifying the arithmetic hypotheses, comparing coefficient/group limit presentations and matching deck/dual conventions. These current declarations are separate from the fifteen fixed-pin citations above and are not imported in the pinned Lean sketch. No completed arithmetic cohomology carrier or general admissible Banach category was identified in the inspected current modules.

## Exact supplier contracts

The following requests specify precisely what is imported or must be extended. A known node is cited directly in the layer; a stage request does not silently assume every theorem in its direction.

### From `SmoothRepresentationsOfLocalGroups:SR.0`

The existing compact-open index, smooth representation carrier, transport by conjugation, and finite-exponent open stabilizer criterion. Import the full local-group convention, not merely a fixed compact group.

### From `PadicMeasuresIwasawaAlgebras:L1`

Extend immediately after L1 with general compact/profinite continuous-function versus measure duality, compact-discrete O/E/O duality and Schikhof duality; strict integral admissible complexes and Emerton Proposition1.2.4 control; continuous completed tensor/coinduced acyclicity; the general unitary E-Banach category with stable lattice, Schneider–Teitelbaum Theorems2.3,3.5 and abelianness for compact analytic groups, and compact-open testing for local groups. Supply the regular congruence-filtration leading-rank/continuous-cohomology error estimates used by CEbounds Theorem3.2. R30.2 consumes this category for GL₂. This is a foundational extension, not a new category in CC.2. Reuse the current Tau Ceti completedGroupAlgebra and IsCompactModule action declarations; L1 extends the measure/dual/strict-complex interfaces, not those existing ring/action constructors.

### From `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`

Its existing packet leaves open the equivalence of analytic and finite-rank structure, existence of open uniform subgroups and the uniform graded-polynomial input. Supply these exact Lazard facts for every compact p-adic analytic group, not only an admitted H with quotient Z_p.

### From `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`

Supply the already planned left/right noetherianity for O[[K_0]] and k[[K_0]] for every compact analytic K_0, plus its missing Lazard proof leaves. Extend NE.0 with Auslander regularity for torsion-free uniform U, coefficient grade shift/purity comparison, finite-index invariance and the regular uniform-power Hilbert-growth theorem; no arbitrary cofinal-basis exponent is requested.

### From `ArithmeticGaloisDuality:R02.1`

Extend the existing countable lim¹ and degreewise-surjective Milnor API to functorial Rlim of enhanced countable O-module complex diagrams, its 1−shift cone, natural support triangle, general Milnor sequence, and kernel-system obstruction. Keep the actual arithmetic comparison in CC.2; no second generic derived-limit construction.

### From `ArithmeticGaloisDuality:D7`

Supply continuous Hochschild–Serre/derived group cohomology functoriality in the completed topological coefficient category, with coinduced acyclicity and coefficient conventions; the actual arithmetic finite-level abutment is proved in CC.6.

### From `DeformationAndDerivedPatchingAlgebra:P7`

Extend the common perfect/adic coefficient owner to noncommutative compact group-ring bases: bounded projective and minimal models, conservative derived residue reduction over (O/varpi^s)[P] for finite p-groups P, and the generic compact finite-quotient tensor universal property. The commutative P7 signatures alone do not suffice. Import coefficient-completion/Artin–Rees machinery needed for the orthonormalizable/pro-free A-module comparison, not an arithmetic tower definition. For G12, supply a qualified closed-central-kernel change-of-rings/perfect resolution only when its finite projective dimension and compatibility with the actual effective deck tower have been proved; no unconditional perfectness for an ineffective action.

### From `DeformationAndDerivedPatchingAlgebra:P8`

Supply exactly the Gee–Newton Proposition3.4.16 O_∞[[K_0]]-perfect patched model, flat terms, coherent reduction at (U_p,J), compatible minimal resolutions/uniform rank bounds and Proposition3.4.19 augmentation comparison. Existing commutative patched-term statements require this noncommutative extension; CC.4 imports it without duplicating patching.

### From `LocallyAnalyticDistributions:L0`

Supply derived locally analytic vectors, continuous/Lie algebra derived Hom, their exactness hypotheses and the Q_p versus F_v analytic convention needed for the generic derived arithmetic comparison. E06 Corollary2.2.18 provides a spectral sequence, not a definition of derived vectors.

### From `ModularCurvesPartII:R14.3`

Import the actual modular finite-level integral local-system Betti/étale comparison, level pullback and unnormalized trace, tame Hecke and component labels. Use CC.0 finite-stalk comparison for the all-degree support contract outside the explicit H¹ scope.

### From `IntegralHeckeAndGaloisDeterminants:IHG.2`

Import finite derived-image algebras, finite local-factor decomposition, compatible central idempotents and bounded ghost exponent. Retain the accepted CC.8 request for a genuine O-linear deck-equivariant derived-image contract over possibly noncommutative finite group rings; forgetting equivariance is insufficient.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

Use current upstream finite-cover transfer, chain comparison and deck-group descent; the integral degree identity retains the covering degree.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`

Use current upstream cellular chains for finite CW pairs, relative chains and cellular/singular chain comparison. Only lifted arithmetic completion is new in CC.4.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Use current upstream Poincaré–Lefschetz/local-system duality on finite manifold pairs; ALS supplies its corner bridge and orientation data.

### From `EnhancedDerivedSheaves:E1`

Import the existing enhanced derived sheaf categories and finite-level comparison morphism carriers; CC.0 owns only its selected arithmetic comparison.

### From `ComplexComparisonPartII:C2`

Import coherent GAGA used in the finite-cover Riemann-existence proof; it does not itself prove étale cohomology comparison.


### From `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`

Import only the current-library completed-group-algebra and compact-module receipt in the Layer 9 prerequisites, not Demushkin classification: TauCeti.completedGroupAlgebra (Basic.lean) with proj, mk, ext and dense_span_range_of; TauCeti.IsCompactModule (Compact.lean); IsCompactModule.completedGroupAlgebraModule, completedSMul_of, mkQ_completedSMul and continuousSMul_completedGroupAlgebraModule (Module.lean). These exist at Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, not at the fixed sketch pin. O must be a compact commutative topological ring and M a compact totally disconnected topological O-module with continuous K_0-action commuting with scalars. CC.3 supplies only the arithmetic specialization and two-index coefficient comparison; no generic constructor is requested.

## How to read the build

CC.0 assembles actual finite diagrams and finite comparison maps; CC.1 takes their exact fixed-exponent colimit. CC.2 distinguishes degreewise completion from the derived complex and states the strict integral control target independently of finiteness. CC.3 fixes the dual categories and completed homology; CC.4 then constructs their actual lifted finite-cell models. CC.5 applies noetherianity and analytic duality to those models. CC.6 recovers finite arithmetic levels by derived continuous invariants or completed Tor. CC.7 applies support and duality to the same coherent diagram. CC.8 imports the accepted adapters and checks the central and canonical-model inputs they actually require. Forward references to a model or comparison are node dependencies, not a circular proof of admissibility from itself.

The exact target statements below are the roadmap. Their named API items and discriminating checks are retained even where their carriers are absent at the library pins. A layer is planned when these targets’ chains end at a library statement, a precise imported node/stage request, or a named proof leaf. None of the nine layers is marked closed.

## Layer 0: Finite-level towers and support data

### 0.1 Arithmetic level index

<a id="arithmetic-level-index"></a>

Use the compact opens K_p of H=G(F_p), ordered by refinement: an arrow K→L means K⊂L, and the cohomology diagram is on the opposite category. Include geometric transport arrows K→gKg⁻¹ labelled by g, with their composition law. A fixed coefficient lattice has same-lattice transport only for H_int; other g transport W_0 to g⁻¹W_0 and act on the rational coefficient tower after lattice comparison. At fixed compact K_0 choose a descending countable normal open basis U_r; after passing to an open uniform subgroup it can be pro-p. A sequence is cofinal only inside its compact open, while full H-actions use all levels and conjugation.

(E06, §2.1 opening, p.20; §2.2, pp.27–28: Normal compact level systems compute the same tower colimit; the arithmetic group action also transports levels.)

The proof route is: Specialize the supplied compact-open index to the actual local points of the reductive group. Prove common refinement by intersection and conjugation continuity. Compare any normal basis with all opens of K_0 using the native final-functor criterion. Import open uniform existence from the foundational owner; do not prove analytic structure a second time.

Uses: CC.1 smooth action: Classes represented at K can be transported to gKg⁻¹; CC.4 completed model: A normal compact basis provides finite deck quotients.

Provide the following named interface.

- `level_intersection`: K∩L is a compact open common refinement.
- `level_conjugate_comp`: Transport by g followed by h is transport by hg, in the chosen left action convention.
- `normal_basis_final`: The opposite of a normal neighbourhood basis is final in the refinement category of opens of K_0.
- `level_underlying`: Forget the arithmetic label to the existing SR.0 compact-open subgroup carrier.

**Checks.**

- `index_reverse`: For pZ_p⊂Z_p the cohomology arrow is from level Z_p to pZ_p.
- `intersection`: For pZ_p and p²Z_p the common refinement is p²Z_p.
- `outside_compact`: Conjugation by diag(p,1) on GL₂(Q_p) can leave GL₂(Z_p); the full index retains the conjugate.
- The cohomological arrow for U⊂K is K→U.
- Conjugating a chosen sequence alone is not asserted to define an action at the same fixed level.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.0`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`.

Target `CompletedCohomologyPartII:CC.0/arithmetic-level-index`.

### 0.2 Coherent arithmetic tower

<a id="tower-axioms-and-the-standing-hypotheses"></a>

Assemble the ALS finite-level ordinary C_{K,s}, compact-support C^c_{K,s} and boundary B_{K,s} into one diagram of complexes with pullback in p-level and coefficient reduction in s. The ALS boundary triangle is part of this diagram, including its connecting arrow. Keep trace as a separate reverse-level natural system. Ordinary homology uses covering pushforward; compact support uses proper pullback and trace. These actual diagrams retain coefficient lattices, real component groups and orientation systems.

(E06, §2.1, pp.20–21; §2.2, pp.27–29: Finite-level coefficients and covering maps generate the tower complexes.; GN, §2.1.1–2.1.4, pp.7–8: The actual adelic chain model has natural coefficient, level and Hecke maps.)

The proof route is: Take the actual ALS models and their specified maps. Rectify the diagrams in their supplied enhanced category, retaining comparison homotopies if representatives differ. Check every coefficient/level/support square before forming limits; a diagram of objects in a triangulated category alone is insufficient for Rlim.

Uses: CC.2 derived tower: One coherent support diagram is needed to apply derived inverse limit; CC.7 completed support: Connecting morphisms must survive the tower functor.

Provide the following named interface.

- `tower_eval`: Evaluation at (K,s) is the supplied ALS complex and coefficient system.
- `tower_reduction_pullback`: Coefficient reduction commutes with every level pullback and proper trace.
- `tower_support_triangle`: The three tower functors form the specified natural triangle.
- `tower_refinement`: Refining a compatible representative induces a natural quasi-isomorphism, not a choice of unrelated complexes.

**Checks.**

- `point_regular_tower`: For a finite deck torsor over a point the degree-zero functions are Map(K_0/U,O/varpi^s).
- `compact_support`: For an anisotropic compact quotient the compact-support arrow is an isomorphism at every (K,s).
- `modular_boundary`: For a neat open modular curve the cusp boundary term survives in the support diagram; dropping it fails the connecting-map check.
- A level map commutes with the connecting arrow.
- No map erases a component or stabilizer unless its explicit descent comparison supplies this.

*Needs:* `CompletedCohomologyPartII:CC.0/arithmetic-level-index`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`, `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `mathlib:DerivedCategory.Q`.

Target `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`.

### 0.3 Conjugation and tame coherence

<a id="conjugation-and-tame-coherence"></a>

The ALS pullback, trace and permitted coefficient-transport/conjugation maps on the actual tower satisfy identity and composition, commute with coefficient reduction and support maps, and commute with tame Hecke operators when tame levels agree at their support. Same-lattice integral conjugation uses H_int; translations outside it are maps between transported lattices, not endomorphisms of the fixed integral system. For a tame level change use the common correspondence refinement, without identifying different spherical Hecke generators at ramified levels.

(E06, Lemma 2.2.10 and Theorem 2.2.11, pp.30–32: Arithmetic translations and component actions respect the tower.; GN, §2.1.4, pp.8–9: Hecke maps commute with shrinking levels away from their support.)

The proof route is: Apply the imported ALS correspondence composition to each (K,s). Check a common intersection for every conjugation/trace square. Preserve the chosen lattice for H_int, and explicitly transport it to g⁻¹W_0 for other g before rational comparison. Retain this natural transformation on the enhanced tower.

**Checks.**

- Two products of translations give the same map after common refinement.
- The modular and anisotropic tower tests use actual quotient maps.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`.

Target `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`.

### 0.4 Non-neat tower realisation

<a id="non-neat-tower-realisation"></a>

At a level with torsion stabilizers, assemble the supplied ALS groupoid or derived group-cohomology model. A neat normal refinement with deck group Q descends by RΓ(Q,−), including Q-torsion cohomology. Coarse quotient cohomology is substituted only under the supplied comparison hypotheses; a cofinal neat tower does not remove stabilizers from a fixed non-neat level.

(GN, §2.1.1–2.1.3, pp.7–8: Good level hypotheses make the quotient a manifold; the free model is not claimed at arbitrary bad levels.; E06, §2.2, p.27: Smallness is required for unramified manifold covers.)

The proof route is: Import the finite-level stabilizer interpretation from ALS. Assemble its derived descent comparison compatibly with refinement and supports. Use the neat tower to compute the colimit, but use derived descent for a requested fixed level.

**Checks.**

- For a point with stabilizer C_p over k, H¹(C_p,k) is nonzero.
- Averaging over a p-group is disallowed.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`.

Target `CompletedCohomologyPartII:CC.0/non-neat-tower-realisation`.

### 0.5 Modular and compact tower tests

<a id="arithmetic-tower-tests"></a>

Construct the assembled tower on neat modular curves using R14.3 and on an anisotropic compact arithmetic quotient using ALS.0–ALS.2. Check pullback, trace, conjugation, supports and orientation against their finite-level maps. At a regular degree-d cover the composite trace after pullback is d; on the modular curve the boundary is the actual cusp incidence diagram; on the anisotropic quotient it is empty.

(CE, §1.5, pp.7–8: The arithmetic quotient and Borel–Serre boundary form the motivating tower.; GN, §2.1.1–2.1.4, pp.7–8: Arithmetic coverings and correspondences give the test maps.)

The proof route is: Specialize the existing finite-level constructions, rather than introducing a formal tower standing in for them. Use the regular-cover identity at common neat levels. Compare the compact support maps in the two examples, retaining cusp boundary in the noncompact case.

**Checks.**

- Both named arithmetic examples have fully specified level and trace directions.
- A degree-p test is integral, so p is not replaced by 1.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`, `ModularCurvesPartII:R14.3`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Target `CompletedCohomologyPartII:CC.0/arithmetic-tower-tests`.

### 0.6 Finite coefficient Betti comparison

<a id="finite-etale-betti-support-comparison"></a>

For a selected neat characteristic-zero Shimura variety X at finite level, a complex embedding, and a finite locally constant O/varpi^s sheaf F, construct the comparison RΓ_et(X_C,F)≅RΓ(X(C),F_an), and the compact-support comparison via a proper algebraic compactification j:X→Xbar and j!F. Compare the boundary support triangle with the ALS topological boundary model through its supplied compact-support comparison. Naturality in finite étale level maps and coefficient reduction is part of the named map. This moves only the consumed complex analytic EDC.6 contract into CC.0; it does not construct diamond operations or all étale six functors. Constructible comparison and compact-support proof leaves are G10.

(MilneEC, Theorems21.1,21.3,21.5 and Remark21.2, pp.130–134: Finite-stalk locally constant comparison is proved by étale-local killing of analytic cohomology; the constructible extension is identified separately.)

The proof route is: Use the existing étale/analytic sheaf categories and derived enhancements. Apply the finite-stalk comparison proof and its finite-cover coefficient dictionary. Acquire the constructible j! comparison and compactification independence under G10. Use the ALS compact-support sheaf/singular comparison to identify the actual arithmetic cochains, retaining all naturality squares.

**Checks.**

- Ordinary and compact-support cohomology of an open curve are distinguished.
- Finite-type characteristic-zero and finite-stalk hypotheses are checked before comparison.

*Needs:* `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `EnhancedDerivedSheaves:E1`, `ComplexComparisonPartII:C2`.

Target `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`.

### 0.7 Trace and orientation comparison

<a id="finite-etale-trace-orientation-comparison"></a>

For the same finite-level smooth d-dimensional complex varieties, finite étale f:Y→X and finite coefficient F, the Betti comparison intertwines pullback and the unnormalized finite-cover trace. Under the chosen root-of-unity/orientation dictionary, O/varpi^s(d)[2d] becomes the complex manifold orientation dualizing system. It intertwines the finite-level Poincaré pairings and support connecting arrows, with trace after pullback equal to deg(f). For noncomplex real arithmetic components the ALS orientation local system is retained rather than replaced by a trivial sheaf. This is the second narrow EDC.6 contract moved to CC.0; it does not assert any completed duality.

(MilneEC, Trace discussion, p.98; Theorem24.1 and Remark24.2(a),(c),(f), pp.144–145: The finite-cover stalk sum and duality normalize trace and coefficient orientation.)

The proof route is: Compute finite étale trace on geometric and analytic stalks as the sum over the same finite fiber. Match the top-degree trace normalization using the chosen complex orientation and Tate coefficient identification. Use finite-level pairings and the actual support maps to check the commuting square, under G10’s comparison proof.

**Checks.**

- A degree-p cover gives p integrally, not an averaged identity.
- Real orientation characters survive component transport.

*Needs:* `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Target `CompletedCohomologyPartII:CC.0/finite-etale-trace-orientation-comparison`.

### Examples

At a finite regular point torsor the actual degree-zero module is Map(K_0/U,O/varpi^s). On an open modular curve the cusp boundary remains; on an anisotropic compact quotient it is empty. A non-neat point with stabilizer C_p has nonzero H¹ over k.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`, `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `ComplexComparisonPartII:C2`, `EnhancedDerivedSheaves:E1`, `ModularCurvesPartII:R14.3`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:DerivedCategory.Q`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

This layer is **planned**. Its remaining closure work is G1 analytic index supplier; G10 finite coefficient support comparison.

## Layer 1: Torsion colimits and smooth actions

### 1.1 Fixed-exponent cohomology

<a id="fixed-exponent-smooth-colimit"></a>

For s≥1 and support *=ordinary,c,boundary define A^n_{*,s}=colim_K H^n(C^*_{K,s}) under pullback, and A^•_{*,s}=colim_K C^*_{K,s} in complexes. Exact filtered colimits identify H^n(A^•_{*,s}) with A^n_{*,s}. Give the former cohomology modules the discrete topology at fixed exponent; finite exponent does not mean finite cardinality.

(E06, §2.1, pp.20–23: Fixed-exponent direct limits are computed with lifted simplicial cochains.; LLHLM, §5.3, p.121: Degree-zero forms first take the level colimit and only then the coefficient limit.)

The proof route is: Apply the existing module/complex colimit to the actual tower. Use exactness from Tau Ceti to commute its cohomology with the filtered colimit. Use finality to compute within any compact-open normal basis.

Uses: CC.2 completion: The coefficient limit is taken on these discrete smooth torsion modules; CC.8 Scholze convention: Scholze’s fixed n object is this colimit, before inverse limit.

Provide the following named interface.

- `torsionColimit_of`: A finite-level cohomology class has its native colimit image.
- `torsionColimit_eq`: Two representatives agree iff they agree after a common refinement.
- `torsionColimit_cofinal`: Restriction to a cofinal basis yields the native final-functor isomorphism.
- `torsionColimit_homology`: H^n of the actual filtered complex colimit is the colimit of H^n.

**Checks.**

- `constant_finite`: A constant identity system with value O/varpi^s has that same colimit.
- `circle_killed`: For degree-p circle covers, degree-one pullback is p and the fixed-exponent colimit is zero.
- `locally_constant_not_all`: For K_0=Z_p fixed s, the degree-zero regular torsor colimit contains precisely locally constant functions, not arbitrary set functions.
- At fixed s the regular torsor gives locally constant functions K_0→O/varpi^s.
- The order level colimit then coefficient limit is pinned.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `mathlib:Module.DirectLimit`, `mathlib:Module.DirectLimit.of`, `mathlib:Module.DirectLimit.exists_of`, `tauceti:TauCeti.moduleCat_ab5OfSize`, `tauceti:TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`, `mathlib:CategoryTheory.Functor.Final.colimitIso`.

Target `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`.

### 1.2 Smooth local-group action

<a id="full-local-group-smooth-action"></a>

For a specified coherent full-H-equivariant integral coefficient system, transport representatives by g and the CC.0 conjugation dictionary to define a left H-action on A^n_{*,s}; right geometric translation is converted using g⁻¹. Every finite-level class has an open stabilizer after shrinking to fix its finite coefficient data, so this action is smooth independently of a normal basis. For a fixed K_0-stable algebraic lattice W_0 the same argument gives only a smooth H_int=Stab_H(W_0) action on the fixed integral colimit. General g change the lattice; CC.2/CC.6 supply the full-H action only after rational lattice comparison.

(E06, §2.2, Lemmas 2.2.4,2.2.8–2.2.10 and Theorem 2.2.11, pp.28–32: The integral stabilizer preserves its lattice; other translations vary the lattice and give the rational action.; CE, §1.5, p.7: The trivial-coefficient completed objects have the full local-group action, not just K_0.)

The proof route is: Represent a class at a finite level using DirectLimit.exists_of. Apply the transported map and prove independence by a common refinement. Check the group law with the inverse in right geometric translation; shrink the level until finite coefficients are fixed.

**Checks.**

- For the regular-function model (g f)(x)=f(xg) is a left action.
- A coefficient action may require a smaller stabilizer than the level subgroup.
- For H=Q_p^× and W_0=O with the standard character, p does not act on W_0/varpi^s by a lattice automorphism; the fixed integral colimit has no such full-H action.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`, `SmoothRepresentationsOfLocalGroups:SR.0`.

Target `CompletedCohomologyPartII:CC.1/full-local-group-smooth-action`.

### 1.3 Tame Hecke on smooth colimits

<a id="tame-hecke-on-colimits"></a>

The ALS tame double-correspondence maps induce O/varpi^s-linear endomorphisms of A^n_{*,s} and of its actual complex, commute with the H-action, and obey the imported convolution/composition law. These are transported actions; the completed Hecke image algebra and its residual factors belong to the accepted CC.8 packet.

(GN, §2.1.4, pp.8–9: Integral finite-level operators are sums over cosets and commute with level reduction.; CE, §1.5, p.7: Tame Hecke acts on the completed tower.)

The proof route is: Apply the natural correspondence maps to the colimit. Use the finite-level composition law at a common refinement. Check the left/right translation dictionary in the commutation square.

**Checks.**

- The identity correspondence induces identity.
- A p-degree covering trace is not divided by p.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`.

Target `CompletedCohomologyPartII:CC.1/tame-hecke-on-colimits`.

### 1.4 Integral restriction and corestriction

<a id="restriction-corestriction-normalisation"></a>

On the tower, res followed by cor at a finite covering U⊂K gives cor∘res=[K:U]; when U is normal, res∘cor=Σ_{a∈K/U}a. The corresponding maps induced on fixed-exponent colimits and descent diagrams use these same formulas. No division by [K:U] is made over O/varpi^s or O; Mackey compatibility is inherited with the supplied coefficients.

(E06, Proposition 2.1.11 proof, pp.24–26: Finite-cover descent is applied before the tower limits.; GN, §2.1.4, p.8: Correspondence action is the unnormalized sum with coefficient transport.)

The proof route is: Specialize the supplied ALS trace identities. Push their natural equalities into the colimit and coefficient diagrams. Keep both composites distinct in subsequent edge maps.

**Checks.**

- For C_p→point over k the first composite is zero, not identity.
- For a degree-prime-to-p cover, averaging becomes available only after explicitly inverting its degree.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Target `CompletedCohomologyPartII:CC.1/restriction-corestriction-normalisation`.

### 1.5 Tame-level variation

<a id="tame-level-variation"></a>

For K^{p′}⊂K^p assemble pullback A_{s}(K^p)→A_s(K^{p′}) and trace in reverse. Form the filtered tame colimit when a consumer requests it, retaining smoothness away from p and its component convention. Changing tame level is a different diagram from completion in s; interchange with inverse limit in s requires its own comparison.

(E06, §2.2, Theorems 2.2.11,2.2.17, pp.31–35: Tame-level variation is a separate inductive system.; CE, Formula (1.4), p.9: Boundary induction is stated only after the tame-level colimit.)

The proof route is: Use CC.0 tame-level natural squares. Apply the existing module colimit to the separate tame diagram. Retain fixed K^p as the default completion parameter.

Uses: CC.7 boundary parabolic comparison: Formula (1.4) requires this distinct tame colimit; Nakamura §2.3.1: Its variation away from p has a separate restriction diagram.

Provide the following named interface.

- `tameVariation_pullback`: Nested tame pullbacks compose in refinement order.
- `tameVariation_trace`: Tame traces commute with p-level and coefficient transitions.
- `tameVariation_rep`: Each tame-colimit class has a representative at one tame level.
- `tameVariation_component`: The finite archimedean component action is the transported ALS action.

**Checks.**

- `identity_tame`: Identity tame refinement induces identity.
- `degree_tame`: Trace after pullback at a degree-d tame cover multiplies by d.
- `fixed_tame`: The regular p-tower completion at fixed tame level does not silently include classes arising only at a finer tame level.
- The two diagrams are named separately.
- No unproved interchange of an infinite tame colimit with completion is exported.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.1/restriction-corestriction-normalisation`, `CompletedCohomologyPartII:CC.0/arithmetic-level-index`.

Target `CompletedCohomologyPartII:CC.1/tame-level-variation`.

### Examples

For a pro-p circle tower, degree-one pullback is multiplication by p; its fixed-exponent colimit is zero. In degree zero the regular point torsor yields locally constant functions, which are not all set functions when K_0 is infinite.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`, `CompletedCohomologyPartII:CC.0/arithmetic-level-index`, `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:CategoryTheory.Functor.Final.colimitIso`, `mathlib:Module.DirectLimit`, `mathlib:Module.DirectLimit.exists_of`, `mathlib:Module.DirectLimit.of`, `tauceti:TauCeti.homologicalComplexHomologyFunctor_preservesColimitsOfShape`, `tauceti:TauCeti.moduleCat_ab5OfSize`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

This layer is **planned**. Its remaining closure work is Import SR.0 smooth action; the arithmetic conjugation/Hecke checks remain required.

## Layer 2: Completion, derived limits and topology

### 2.1 Completed cohomology

<a id="coefficient-limit-completion"></a>

Define H̃^n_*(K^p,O)=lim_{s≥1} A^n_{*,s} with coefficient-reduction transitions, as the existing topological-module limit of discrete A^n_{*,s}. It is a compatible-family module with projection-induced topology. Do not assert yet that this topology is the varpi-adic topology, or that its reduction is A^n_{*,s}.

(CE, §1.1, pp.2–4: The conventional completed cohomology takes the coefficient inverse limit after the level colimit.; E06, §2.1 definitions and Lemma 2.1.4, pp.20–22: Completion is separated and complete; the subsequent admissible-complex argument supplies stronger control.)

The proof route is: Apply the native topological-module limit to the coefficient diagram. Identify its underlying carrier with compatible sections and check projection equations. State the topology comparison as a subsequent theorem with control hypotheses.

Uses: CC.3 duals: Topology must be fixed before a continuous dual can be formed; CC.6 descent: This is the conventional module in the E₂ page.

Provide the following named interface.

- `completed_proj`: Projection to A^n_{*,s} is continuous and O-linear.
- `completed_ext`: Equality of all coefficient projections implies equality.
- `completed_lift`: A compatible family of continuous linear maps uniquely induces a map into H̃.
- `completed_support_map`: The finite-level support natural transformation induces H̃_c→H̃.

**Checks.**

- `point_completion`: A constant point tower with trivial coefficients gives O in degree zero.
- `regular_functions`: The regular K_0 torsor tower gives C(K_0,O), with uniform varpi-adic topology once the explicit reduction control is proved.
- `circle_completion`: For the degree-p circle tower H̃⁰=O and H̃¹=0; levelwise H¹ remains O.
- The object uses lim_s colim_K, not lim_K colim_s.
- Continuity is checked in the stated limit topology.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `mathlib:TopModuleCat.isLimit`, `mathlib:ModuleCat.sectionsSubmodule`.

Target `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`.

### 2.2 Derived completed tower

<a id="derived-completed-tower"></a>

For the enhanced ordinary, compact-support and boundary complex diagram define 𝒞_*=Rlim_s A^•_{*,s} in D(O). Use the supplied countable homotopy-limit model Cone(1−shift:∏_s A^•_{*,s}→∏_s A^•_{*,s})[−1], with its projection cone and coherent actions. This is a derived object distinct from H̃^n_*.

(E06, Proposition 1.2.12, p.16; Proposition 2.1.11, pp.24–26: Cohomology/limit interchange is established through a pro-system comparison, not assumed.; CE, §1.1, pp.2–4: The degreewise definition motivates a separate derived comparison.)

The proof route is: Request the general homotopy inverse limit from R02.1; its existing Milnor node for degreewise-surjective ordinary limits is narrower. Apply it to the actual enhanced diagram and its natural support triangle. Carry the H and tame Hecke actions through the functorial cone.

Uses: CC.7 exact triangle: The homotopy-limit functor preserves the actual diagram of triangles; CC.6 derived invariants: Derived descent is formulated on this complex.

Provide the following named interface.

- `derivedTower_proj`: The homotopy-limit projection cone is natural in s and in support.
- `derivedTower_map`: Coherent tower maps induce maps on 𝒞 with identity and composition laws.
- `derivedTower_quasiIso`: A natural objectwise quasi-isomorphism of enhanced towers induces an isomorphism of 𝒞.
- `derivedTower_lim_compare`: A degreewise ML representative has its named ordinary-limit comparison.

**Checks.**

- `constant_complex`: A constant identity complex tower gives its original object in D(O).
- `nonzero_lim_one`: For the auxiliary abelian tower Z←pZ←pZ←⋯ in degree zero, H¹(Rlim)=Z_p/Z although lim=0.
- `shift_sign`: The support connecting map lands in the shift by +1 of the completed compact-support object.
- For a general tower, H^n(𝒞) can have a nonzero lim¹ contribution.
- The cone shift and the connecting sign are checked.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `mathlib:DerivedCategory.Q`, `ArithmeticGaloisDuality:R02.1`.

Target `CompletedCohomologyPartII:CC.2/derived-completed-tower`.

### 2.3 Milnor comparison for the tower

<a id="milnor-and-mittag-leffler-control"></a>

For each n the supplied countable derived limit gives 0→lim¹_s A^{n−1}_{*,s}→H^n(𝒞_*)→H̃^n_*→0, naturally for support, Hecke, conjugation and coefficients. The last arrow is an isomorphism when {A^{n−1}_{*,s}} is ML. For a degreewise-surjective complex representative this specializes to R02.1/milnor-sequence; ML of terms alone does not imply ML of cohomology.

(E06, Propositions 1.2.12 and 2.1.11, pp.16,24–26: Admissible pro-system comparison is the proof mechanism for the required interchange.)

The proof route is: Apply the generic derived-limit spectral sequence, using countable cohomological dimension one. Use exact filtered colimits to identify its coefficient cohomology terms. Apply the supplied ML-vanishing theorem separately in every degree used.

**Checks.**

- A nonzero lim¹ test prevents unconditional interchange.
- A finite coefficient ring alone does not make the level colimit finite.

*Needs:* `CompletedCohomologyPartII:CC.2/derived-completed-tower`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`.

Target `CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control`.

### 2.4 Integral admissible-complex control

<a id="integral-admissible-complex-control"></a>

For a bounded cochain complex S^• of Emerton-admissible integral K_0-modules (complete separated varpi-adic modules, bounded varpi-torsion, rationalization admissible), the system {H^n(S)/varpi^s}→{H^n(S/varpi^s)} has essentially-null kernel and cokernel: each fixed target index is killed by a sufficiently subsequent transition. Hence H^n(S)≅lim_s H^n(S/varpi^s) as integral topological modules; the tower constructed from finite lifted cells has such a model by CC.4. This is not a fixed-s reduction isomorphism.

(E06, Definition 1.2.1 and Proposition 1.2.4, pp.13–14; Definition 1.2.8 and Propositions 1.2.10–1.2.12, pp.15–16: Strict kernels/images and the quotient by essentially-null systems prove cohomological completeness.)

The proof route is: Import the general strict admissible Banach/Schikhof theory from the foundational owner; request its integral strict-category extension. For each differential use closed images and bounded cokernel torsion to control induced varpi topologies. Follow Emerton’s exact reduction functor in the pro-category modulo essentially-null systems, then its inverse-limit quasi-inverse.

**Checks.**

- The test complex O --varpi→ O is complete, but its degree-zero mod-varpi cohomology has a torsion error.
- No circular dependency on CC.5 is used: the foundational category is supplied independently.

*Needs:* `CompletedCohomologyPartII:CC.2/derived-completed-tower`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`.

### 2.5 Adic topology and continuous actions

<a id="adic-topology-and-continuous-actions"></a>

When the coefficient system comes from the CC.4 finite-cell admissible model and the preceding strict pro-system control applies, H̃^n_* is varpi-adically separated and complete with bounded varpi-torsion, and its coefficient projection topology agrees with its varpi-adic topology. The H_int-action and transported Hecke endomorphisms are continuous; for a coherent full-H-equivariant integral system H_int may be replaced by H. Joint H_int×H̃ continuity follows from smoothness of every discrete coefficient quotient and the topology comparison.

(E06, Lemma 2.1.4 and Theorem 2.1.5 proof, pp.21–24: The completed cochain model gives the actual topology and continuous admissible action.; CE, Theorem 1.1(2), pp.3–4: Integral completeness and bounded torsion are asserted separately in the survey.)

The proof route is: First prove the named coefficient/pro-system comparison; record any missing uniform bound as G2. Use complete admissible cohomology to identify the two topologies, retaining possible fixed-s reduction errors. Use the open stabilizer at a coefficient index to prove joint continuity, then transport Hecke maps by continuous projections.

**Checks.**

- Continuity is not inferred solely from algebraic equivariance.
- For C(Z_p,O), the topology is uniform varpi-adic, not pointwise convergence.

*Needs:* `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.1/full-local-group-smooth-action`, `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`.

Target `CompletedCohomologyPartII:CC.2/adic-topology-and-continuous-actions`.

### 2.6 Completion and Tate module

<a id="completion-and-tate-module"></a>

Put B^n_*=colim_K H^n(C^*_{K,O}) under pullback. Define Ĥ^n_*=lim_s B^n_*/varpi^s and T_varpi B^n_*=lim_s B^n_*[varpi^s] with transition multiplication by varpi, not inclusion or reduction. These modules are separate from H̃. The Tate module is varpi-torsion-free; a divisible part of B is killed by completion but its divisible torsion may contribute to T_varpi.

(CE, Definitions before (1.1), pp.4–5: Integral-colimit completion and its Tate module explain the error between integral and finite-coefficient completion.; E06, §2.1, pp.20–22: The UCT yields the comparison sequence.)

The proof route is: Apply the existing quotient and limit carriers to B. Specify the torsion transition as multiplication by varpi. Derive torsion-freeness by shifting the compatible-family equations.

Uses: CC.2 UCT completion: These are the left and right terms of the comparison sequence; CC.5 semisimple theorem: The Tate dual is a distinct torsion rank contribution.

Provide the following named interface.

- `hat_proj`: Ĥ projects to B/varpi^s.
- `tate_proj`: T_varpi projects to B[varpi^s], with varpi t_{s+1}=t_s.
- `hat_tate_map`: O-linear compatible level maps induce maps of both objects.
- `tate_torsionfree`: Multiplication by varpi on T_varpi is injective.

**Checks.**

- `finite_free`: For B=O, Ĥ=O and T_varpi=0.
- `divisible_torsion`: For B=E/O, Ĥ=0 and T_varpi≅O.
- `bounded_torsion`: For B=O/varpi^a, Ĥ=B and T_varpi=0; using inclusion transitions would give the wrong Tate module.
- Completion is not defined by taking only the torsion-free part of B.
- Tate-module transition direction is explicit.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`.

Target `CompletedCohomologyPartII:CC.2/completion-and-tate-module`.

### 2.7 Completion–Tate exact sequence

<a id="the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting"></a>

For the finite-projective coefficient lattice and actual finite-cell UCT tower, 0→Ĥ^n_*→H̃^n_*→T_varpi B^{n+1}_*→0 is exact and natural for the supplied support/Hecke maps. If the varpi-torsion exponents of all finite-level H^{n+1} are uniformly bounded, the last term vanishes. No boundedness conclusion follows from each individual level being finite.

(E06, §2.1, displayed UCT and Lemma 2.1.4, pp.20–22: The quotient system is surjective, so lim¹ on its left term vanishes.; CE, Equation (1.1), pp.4–5; Remark 1.15, p.12: The completed object differs by the next-degree Tate module.)

The proof route is: Take finite-level UCT 0→H^n/varpi^s→H^n(mod varpi^s)→H^{n+1}[varpi^s]→0. Use exact filtered colimit and track multiplication-by-varpi on the right transition. Use surjectivity of {B^n/varpi^s} and the six-term inverse-limit sequence.

**Checks.**

- The degree-p circle tower has Ĥ¹=0 and H̃¹=0.
- B=E/O shows why killing divisible torsion before taking T_varpi is wrong.

*Needs:* `CompletedCohomologyPartII:CC.2/completion-and-tate-module`, `ArithmeticGaloisDuality:R02.1/lim-one-six-term`.

Target `CompletedCohomologyPartII:CC.2/the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting`.

### 2.8 Coefficient Bockstein comparison

<a id="coefficient-bockstein-comparison"></a>

After the integral admissible-complex comparison identifies H̃^n with H^n(S), derived reduction gives 0→H̃^n/varpi^s→A^n_s→H̃^{n+1}[varpi^s]→0. The reduction map is an isomorphism only when the next-degree torsion term vanishes. For an arbitrary coefficient tower lacking that comparison, use 𝒞⊗ᴸ O/varpi^s and its separate base-change map to A^•_s, with the Milnor error retained.

The hypotheses are as follows. The controlled integral cochain model S is O-flat and its derived reduction S⊗ᴸ_O O/varpi^s identifies with the actual fixed-exponent tower cochain complex, compatibly for all s. These comparisons are proved using CC.4, not inferred from cohomological completeness.

(CE, Theorem 1.16(5), p.13: The mod-p comparison contains a next-degree torsion term.; E06, Proposition 1.2.12, p.16: The comparison is established pro-systemically before reducing at one index.)

The proof route is: Use the multiplication-by-varpi^s triangle of the flat integral cellular cochain model. Identify its reduction with the fixed-exponent tower using the established model comparison. If this identification is missing, state its failure as G2 rather than replacing A_s by a quotient by definition.

**Checks.**

- For S=(O --varpi→ O) in degrees 0,1, H⁰(S)=0 but H⁰(S⊗ᴸk)=k.
- The torsion term cannot be discarded merely because O is torsion-free.

*Needs:* `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control`, `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`.

Target `CompletedCohomologyPartII:CC.2/coefficient-bockstein-comparison`.

### 2.9 Unitary Banach completion

<a id="rational-unitary-banach-tower"></a>

Under the topology and bounded-torsion theorem put L=H̃^n_*/H̃^n_*[varpi^∞] with its complete separated varpi-adic topology and B=L⊗_O E. The gauge norm with unit ball L makes B a unitary E-Banach representation for trivial coefficient action, or for a specified full-H-stable lattice. For algebraic coefficients the full-H action is constructed by maps between commensurable transported lattices, using E06 Lemmas 2.2.8–2.2.10; the resulting rational representation is continuous and compact-open admissible once CC.5 applies. Full-H unitarity still requires a full-H-stable lattice. General Banach and Schikhof categories are imported from the foundational owner.

(E06, Lemma 2.1.4, Theorem 2.1.5, pp.21–24; Lemmas 2.2.8–2.2.10 and Theorem 2.2.11, pp.30–32: The complete torsion-free lattice gives the Banach space; algebraic coefficient translations require lattice transport.; ST, Theorem 2.3, pp.11–12; §3, pp.12–15: The general duality and admissible category are foundational inputs.)

The proof route is: Quotient by bounded torsion and use completeness of the torsion-free lattice. Apply the supplied nonarchimedean gauge completion theorem and stable-lattice unitary criterion. For algebraic coefficients use E06 Lemmas 2.2.8–2.2.10: inclusions between commensurable lattices induce bounded maps and inverse rational isomorphisms. Transport W_0 to g⁻¹W_0, check the group law and continuity near the identity in H_int, and only then obtain the full-H rational action.

Uses: CC.5 Banach admissibility: Admissibility is deduced from the actual finite generated compact dual; R30.2: The GL₂ application specializes this general category and adds local Langlands.

Provide the following named interface.

- `banach_lattice`: L embeds as the chosen bounded open unit ball in B.
- `banach_rational_map`: A continuous integral tower map induces a bounded E-linear map.
- `banach_norm_action`: A lattice-preserving H-action acts by isometries.
- `banach_change_lattice`: Commensurable lattices give inverse rational comparison maps and equivalent norms by E06 Lemmas 2.2.8–2.2.10. Combining these with g-induced lattice transport gives the same rational topological H-representation.

**Checks.**

- `point_banach`: The point tower gives E with unit ball O.
- `torsion_killed`: A completed module killed by varpi^a rationalizes to zero.
- `nonunitary_character`: The character Q_p^×→E^× sending p to p cannot preserve O as a full-group unit ball; its compact-open restriction can.
- Unitarity is conditional on a stable lattice.
- This construction does not itself prove admissibility.

*Needs:* `CompletedCohomologyPartII:CC.2/adic-topology-and-continuous-actions`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower`.

### Examples

The inverse coefficient limit of regular point-tower functions is C(K_0,O) with uniform varpi-adic topology. For the auxiliary uncontrolled discrete tower Z with transitions p, lim is zero but lim¹=Z_p/Z. Thus degreewise completion and derived completion are distinguished.

### Dependencies

`ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.1/lim-one-six-term`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.1/full-local-group-smooth-action`, `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:DerivedCategory.Q`, `mathlib:ModuleCat.sectionsSubmodule`, `mathlib:TopModuleCat.isLimit`.

This layer is **planned**. Its remaining closure work is G2 integral strict control; R02.1 enhanced Rlim and L1 Banach foundations.

## Layer 3: Continuous duals and completed homology

### 3.1 Continuous tower duals

<a id="continuous-dual-conventions"></a>

For a compact Hausdorff linearly topologized O-module M set D_t(M)=Hom_cont,O(M,E/O), with discrete topology, and D_O(M)=Hom_cont,O(M,O), with the uniform varpi-adic topology. For a discrete varpi-primary torsion module V, D_t(V)=Hom_O(V,E/O) has pointwise compact topology. For a complete separated torsion-free varpi-adic lattice L, D_O(L)=Hom_O(L,O) has pointwise compact topology. A left action on the source gives a right transpose action (f·g)(m)=f(gm); applying inversion gives the left contragredient (g f)(m)=f(g⁻¹m). Never identify these two conventions without the anti-involution.

(CE, Theorem 1.1(3) and §1.2, pp.3–5: Continuous and algebraic duals carry different topologies; left Ext-duals use inversion.; ST, §§1–2, Theorem 2.3, pp.2–12: Compact and Banach duality supplies the qualified topology conventions.; Nakamura, Appendix B.1, pp.90–91: Pointwise compact O-duals are distinct from varpi-adic complete lattices.)

The proof route is: Specialize native continuous linear maps and characters to the coefficient targets. Use finite quotients to put the compact/discrete dual topologies on the torsion pair. Compare additive E/O-valued O-characters with the native Circle-valued Pontryagin carrier through a specified additive character; keep the O-linear structure separately. Compare inverse precomposition with Representation.dual on the O-valued algebraic dual, restricting to continuous maps; do not identify the E/O-valued carrier with that O-valued dual.

Uses: CC.3 integral UCT: Both O and E/O targets occur, in different terms; BP §5.4; LLHLM (5.8): Transpose and contragredient conventions control specialization and Pontryagin duals.

Provide the following named interface.

- `towerDual_eval`: Evaluation is the O-bilinear pairing with the prescribed topology.
- `towerDual_map`: A continuous source map induces contravariant precomposition.
- `towerDual_left_action`: The left dual action uses the inverse group element.
- `towerDual_native`: The O-valued continuous dual embeds equivariantly in Module.Dual O M with the inverse-precomposition action of Representation.dual. The E/O-valued dual shares this action formula but is not Module.Dual O M; its coefficient target and topology require a separate adapter.

**Checks.**

- `finite_torsion_dual`: D_t(O/varpi^s)≅O/varpi^s while D_O(O/varpi^s)=0.
- `torsionfree_dual`: D_O(O)=O and D_t(O)=E/O, with their different topologies.
- `noncommuting_action`: For the permutation representation of S₃ on O³, precomposition by g without inversion reverses products and is not the declared left dual action.
- A direct transpose action is right-handed.
- Circle-valued additive characters alone are not the O-linear E/O dual.

*Needs:* `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `mathlib:ContinuousLinearMap`, `mathlib:PontryaginDual`, `mathlib:Representation.dual`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`.

### 3.2 Qualified tower biduality

<a id="qualified-biduality"></a>

Evaluation identifies M≅D_tD_tM for compact Hausdorff linearly topologized inverse limits of finite varpi-primary O-modules, and V≅D_tD_tV for discrete varpi-primary torsion modules. It also identifies M≅D_OD_OM for torsion-free compact O-modules and L≅D_OD_OL for complete separated torsion-free varpi-adic O-lattices, with the two dual topologies of the definition. No O-dual biduality is asserted for a module with torsion or with a different topology.

(ST, §1, Propositions 1.2–1.6; §2, Theorem 2.3, pp.3–12: The relevant compact and complete-lattice categories support biduality.; E11, Appendix C, (C.3)–(C.4), pp.103–104: Torsion-free complete lattices and torsion-free profinite modules form the required dual categories.)

The proof route is: Use finite-length O-module duality with the injective cogenerator E/O. Pass compact inverse systems to discrete direct systems and use compatible finite evaluations. For the O-pair invoke the foundational Schikhof anti-equivalence with its pointwise/uniform topology dictionary.

**Checks.**

- O/varpi is lost by D_OD_O and hence is an explicit non-example.
- Replacing uniform topology on C(K,O) by pointwise topology changes the continuous O-dual.

*Needs:* `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.3/qualified-biduality`.

### 3.3 Completed homology

<a id="completed-homology-and-borel-moore"></a>

Define H̃_n=lim_U H_n(Y_{UK^p},O) under covering pushforward, and H̃_n^{BM}=lim_U H_n^{BM}(Y_{UK^p},O) under proper pushforward, with their compact projective-limit topologies at finite-type neat levels. At fixed s put H̃_{n,s}=lim_U H_n(Y_{UK^p},O/varpi^s), with the BM variant. These are separate from reductions H̃_n/varpi^s until the Bockstein theorem is applied. Over a Borel–Serre pair, BM is computed by its relative chains, not by forgetting the boundary.

(CE, §1.1 definitions, p.2; Theorem 1.16, pp.12–13: Homology uses the inverse level system and has a separate finite-coefficient variant.; GN, §2.1.3, p.8: Completed homology is the inverse limit of actual finite-level homology.; Nakamura, Remark 2.3, p.21: For modular curves BM is the relative homology of the compact curve and its cusps.)

The proof route is: Apply the existing topological-module limit to actual finite-level homology. Use the finite-cell model to give each level its compact O-module topology. Prove the cofinal normal-basis isomorphism, then carry the proper pushforward/support maps into the limit.

Uses: CC.4 cellular comparison: The completed chain model must recover this independently defined module; Fu §7; Nakamura §2.3: The homological descent and BM duality use these actual modules.

Provide the following named interface.

- `completedHomology_proj`: The U-component is the actual finite-level H_n, with pushforward compatibility.
- `completedHomology_ext`: All level projections jointly detect equality.
- `completedHomology_cofinal`: Cofinal normal restriction gives an isomorphism of compact modules.
- `completedHomology_toBM`: The finite support map induces H̃_n→H̃_n^{BM}.

**Checks.**

- `regular_zero_homology`: The finite regular K_0/U torsor gives H̃₀≅O[[K_0]], with projection to each group ring.
- `circle_pushforward`: Degree-p circle covers give H̃₁=0; replacing pushforward by a transfer gives a different limit.
- `relative_interval`: For an oriented interval with its two endpoints as boundary, H₁(interval,boundary;O)=O while absolute H₁=0.
- In the circle tower H̃₀=O, H̃₁=0: pushforward in H₁ multiplies by p.
- A cusp relative class is retained by BM.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `mathlib:TopModuleCat.isLimit`.

Target `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`.

### 3.4 Completed group-algebra action

<a id="iwasawa-action-on-homology"></a>

For completed homology with its compact Hausdorff totally disconnected topological O-module structure and continuous O-linear K_0-action, import TauCeti.IsCompactModule.completedGroupAlgebraModule to obtain the continuous left action of Λ=TauCeti.completedGroupAlgebra O K_0. This existing current-library construction is not planned again. Identify Λ=lim_U O[K_0/U] with lim_{U,s}(O/varpi^s)[K_0/U] using completeness of O and the finite free coefficient modules, compatibly with the normal basis and its topology. On the compact dual use the right transpose action and the inversion anti-isomorphism Λ→Λ^op. At quotient (U,s), [g] acts by the actual deck transformation g. Uniqueness among continuous O-linear extensions follows by the density of finite O-linear combinations of group elements.

(CE, Theorem 1.1(1) and §1.2, pp.3,5: Homology is a left completed-group-ring module; dual Ext actions need inversion.; GN, §2.1.3, p.8: The natural compact-open action acts on completed homology.)

The proof route is: Verify the arithmetic inverse limit satisfies TauCeti.IsCompactModule O M and that the K_0-action is jointly continuous and commutes with O-scalars; install the existing structure with letI := hM.completedGroupAlgebraModule K_0. Use completedSMul_of, mkQ_completedSMul and continuousSMul_completedGroupAlgebraModule for the finite action and continuity. Compare the single-index native ring with the two-index coefficient presentation by finite-rank O-adic completeness and commuting compatible limits. Use completedGroupAlgebra.dense_span_range_of to prove uniqueness of continuous extensions. Check inversion and the paired chain/cochain deck actions; no generic completed-ring or compact-module constructor is added.

**Checks.**

- For S₃, the product [g][h] acts in the order gh.
- The continuous extension needs the compact module topology, not just an abstract group action.

*Needs:* `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`.

Target `CompletedCohomologyPartII:CC.3/iwasawa-action-on-homology`.

### 3.5 Finite-coefficient completed duality

<a id="finite-coefficient-duality-and-bockstein"></a>

For finite-cell towers with compatible finite-projective coefficients and their duals, evaluation identifies A^n_k≅Hom_cont,k(H̃_{n,k},k) and H̃_{n,k}≅Hom_k(A^n_k,k), including compact-support/BM. The coefficient triangle and completed chain comparison give 0→H̃_n/varpi→H̃_{n,k}→H̃_{n−1}[varpi]→0. With nontrivial coefficient lattice replace one coefficient system by its O-linear dual. This is algebraic UCT duality, not dimension-shifting Poincaré duality.

(CE, Theorem 1.16(3),(5), p.13: Finite-field duality is exact, whereas integral reduction retains adjacent torsion.; E06, Theorem 2.1.5 proof, pp.22–24: Finite cochain terms are dual to finite chains, compatibly with level maps.)

The proof route is: Dualize finite complexes over k, where linear dual is exact. Use continuous duality of the compact inverse level system and exactness of the discrete colimit. Use the integral chain model and multiplication-by-varpi triangle for the displayed sequence.

**Checks.**

- For the two-term chain O --varpi→ O, H̃_{1,k}=k comes from H̃₀[varpi].
- The compact inverse limit is dual to the discrete colimit, not to an unrestricted product.

*Needs:* `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `CompletedCohomologyPartII:CC.3/qualified-biduality`, `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `PadicMeasuresIwasawaAlgebras:L1`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`.

Target `CompletedCohomologyPartII:CC.3/finite-coefficient-duality-and-bockstein`.

### 3.6 Integral completed duality

<a id="duality-between-completed-homology-and-completed-cohomology"></a>

For the finite-cell completed chain model over noetherian Λ with the strict integral control established in CC.2, there are natural exact sequences 0→Hom_cont,O(H̃_{n−1}[varpi^∞],E/O)→H̃^n→Hom_cont,O(H̃_n,O)→0 and 0→Hom_O(H̃^{n+1}[varpi^∞],E/O)→H̃_n→Hom_O(H̃^n,O)→0, with the compact-support/BM analogues and dual coefficient lattice when needed. The first E/O-dual takes the torsion submodule, correcting CE Theorem 1.1(3). Each cohomology lattice uses varpi-adic topology; compact homology uses its canonical topology.

(CE, Theorem 1.1(3), pp.3–4, corrected as E1: The paired sequences are the survey target; its first displayed torsion term must be restored.; E06, §2.1 lifted finite-cell proof, pp.22–24: The integral model, with strictness and bounded torsion, provides a route rather than a mere citation to the survey.)

The proof route is: Represent compact completed chains by a bounded finite free/projective Λ complex, supplied by CC.4. Apply derived continuous O-duality to that complex and use the two-term O-injective resolution O→E→E/O. Prove exactness and topology of dualizing the compact cycle/boundary sequences; noetherianity supplies closed images and bounded torsion. This strict derived-duality identification is the explicit G3 proof leaf. Apply qualified biduality to recover the second sequence; preserve all support maps and inverses of Hecke operators.

**Checks.**

- The degree-p circle tower has H̃¹=0 although Hom_cont(O,E/O)≠0; the uncorrected first sequence fails.
- An O/varpi torsion homology class contributes to the adjacent cohomology torsion term.

*Needs:* `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `CompletedCohomologyPartII:CC.3/qualified-biduality`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`.

Target `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology`.

### 3.7 Dual completion–Tate sequence

<a id="dual-completion-tate-sequence"></a>

Under the strict complete-lattice hypotheses of the integral completed UCT, dualizing 0→Ĥ^n→H̃^n→T_varpi B^{n+1}→0 gives 0→D_O(T_varpi B^{n+1})→H̃_n/H̃_n[varpi^∞]→D_O(Ĥ^n)→0. Surjectivity of the last map uses the complete torsion-free quotient and the qualified Schikhof duality; it is not exactness of Hom(−,O) on arbitrary O-modules.

(CE, Consequence of (1.1), p.5: The middle dual is the torsion-free quotient of completed homology, with a Tate-dual submodule.)

The proof route is: Use the second integral UCT to identify D_O(H̃^n) with the stated quotient. Check completeness/strictness of the source sequence and the torsion-free quotient T_varpi. Apply exact Schikhof duality on this category; record the complete-lattice splitting argument under G3 if not supplied.

**Checks.**

- For bounded B^{n+1}-torsion the first term is zero.
- The sequence is not asserted after arbitrary nonflat base change.

*Needs:* `CompletedCohomologyPartII:CC.2/completion-and-tate-module`, `CompletedCohomologyPartII:CC.2/the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting`, `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology`, `CompletedCohomologyPartII:CC.3/qualified-biduality`.

Target `CompletedCohomologyPartII:CC.3/dual-completion-tate-sequence`.

### 3.8 Admissible integral complexes

<a id="admissible-complex-convention"></a>

For a profinite K_0, an integral admissible complex of amplitude [a,b] means a complex represented in degrees [a,b] by finite direct summands of C(K_0,O)^{n_i}, with uniform varpi-adic topology and the continuous regular action. Duals are compact Λ-modules with transpose right action; convert by inversion when a left category is desired. If K_0 is pro-p and Λ is local, finite projectives are free and these terms may be taken as C(K_0,O)^{n_i}. This termwise notion is stronger than admissibility of cohomology.

(BP, Definition 1.4.1 and Remark 1.4.2, pp.4–5: The torus pro-p source uses continuous-function terms and dual perfect complexes; finite summands are required for general profinite groups.)

The proof route is: Use the existing regular continuous-function module and its measure dual from L1. Define the termwise subcategory by finite direct summands with continuous idempotents. Import noncommutative perfect-complex language; specialize to free terms only with the supplied local-ring criterion.

Uses: BP §5.4: The degreewise duality must include the prime-to-p component of the full torus; CC.4 completed chains: Finite projective Λ complexes are the dual side.

Provide the following named interface.

- `admissibleComplex_terms`: Each degree has its finite regular-function summand and chosen continuous idempotent.
- `admissibleComplex_dual`: Its degree −i dual is the corresponding finite projective right Λ-module.
- `admissibleComplex_change_rep`: The derived property is existence of such a representative, invariant under isomorphism in the designated derived category.
- `admissibleComplex_pro_p`: For pro-p K_0 the representative can have free regular-function terms.

**Checks.**

- `trivial_group`: For K_0=1, admissible complexes are bounded finite projective O-complexes.
- `pro_p_regular`: For K_0=Z_p a single C(K_0,O) in degree a dualizes to Λ in degree −a.
- `nonfree_summand`: For K_0=C₂ and p odd, the trivial-character idempotent summand is projective but not free over O[C₂]; a free-only definition excludes it.
- Amplitude reverses on dualization.
- Finite projective over a general Λ need not mean finite free.

*Needs:* `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `PadicMeasuresIwasawaAlgebras:L1`, `DeformationAndDerivedPatchingAlgebra:P7`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-local-iff-pro-p`.

Target `CompletedCohomologyPartII:CC.3/admissible-complex-convention`.

### 3.9 Admissible–perfect duality

<a id="admissible-perfect-anti-equivalence"></a>

Degreewise continuous O-duality induces an anti-equivalence between the integral admissible complexes just defined and perfect complexes of compact right Λ-modules, changing amplitude [a,b] to [−b,−a]. Inversion transports the latter to left modules. Its Λ-linear dual is RHom_Λ(P,Λ), naturally right-handed for P left-handed. For the torus instance, with t acting on Λ by left multiplication [t], the diagonal-action completed tensor model RΓ(K_0,M⊗̂_OΛ) realizes this dual after the prescribed inversion/opposite conversion. BP’s Serre adjoint uses the additional automorphism t↦w₀t⁻¹; it is recorded as a twist, not absorbed into the untwisted action.

(BP, Remark 1.4.2, p.5; Lemmas 5.4.1–5.4.2, pp.56–57; Theorem 5.5.2, p.57: Continuous function/measure duality gives perfect complexes; completed tensor and the action twist are essential.)

The proof route is: Identify D_O C(K_0,O) with Λ using the supplied continuous measure pairing and its finite quotient characterizations. Dualize finite idempotent summands and bounded differentials, using the reversed-complex sign convention. For the completed tensor model check the regular-function generator, contract the continuous coinduced complex, then pass finite summands. Fix handedness at that generator before deriving the general noncommutative formula; this action-level verification is G4. For T′ and T, use pro-p freeness and the finite prime-to-p projector separately.

**Checks.**

- Algebraic tensor is not substituted for completed tensor.
- For noncommuting g,h check Hom_Λ(P,Λ) right multiplication before inversion.
- The Serre twist contains w₀ as well as inversion.

*Needs:* `CompletedCohomologyPartII:CC.3/admissible-complex-convention`, `CompletedCohomologyPartII:CC.3/qualified-biduality`, `PadicMeasuresIwasawaAlgebras:L1`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.3/admissible-perfect-anti-equivalence`.

### 3.10 Orthonormalizable coefficient modules

<a id="orthonormalizable-and-profree-modules"></a>

For a complete noetherian local O-algebra A with finite residue field and maximal ideal m, V is orthonormalizable if it is m-adically complete separated and V/m^rV is free over A/m^r for every r≥1. A compact A-module is pro-free if it is a product A^I with the product m-adic topology. Put V*=Hom_A(V,A) with pointwise topology. Cofinitely generated X means varpi-complete separated, O-torsion-free, continuous for m-adic A and varpi-adic X, with (X/varpi X)[m] finite dimensional over k. These three notions are named separately.

(Nakamura, Definitions B.1–B.4, pp.90–91: The coefficient-module notions and their distinct topologies are used by the tensor-duality lemma.; E11, Appendices B,C, Definitions B.1,B.10,C.1, pp.99,102–103: The definitions and their duality contracts are stated for general complete local coefficient rings.)

The proof route is: Use the existing adic completion and product carriers. Define the three predicates with all their topology and finite-socle conditions, retaining O-torsion-freeness for X. Provide the native finite-free specialization; their category equivalences are the next theorem.

Uses: Nakamura Lemma B.6: Orthonormalizable V and cofinitely generated X fix the completed tensor category; CC.3 coefficient change: Finite local A-base change has a qualified topological duality contract.

Provide the following named interface.

- `orthonormalizable_basis`: V is the m-adic completion of the free span of any lifted basis of V/mV.
- `profree_product`: A^I with product topology is pro-free.
- `orthonormalizable_dual`: The A-dual is given its pointwise compact topology.
- `cofinite_socle`: For X satisfying completeness/torsion/continuity, finite mod-varpi m-socle is equivalent to finite generation of its compact O-dual.

**Checks.**

- `rank_one`: V=A and M=A are orthonormalizable and pro-free respectively.
- `restricted_vs_product`: For A=O and I=N, the orthonormalizable completion is c₀(N,O), whose pointwise compact dual is O^N; it is not the same topology as the product.
- `torsion_exclusion`: X=A/varpi A with A O-torsion-free cannot satisfy the cofinite X predicate, even if its mod-varpi socle is finite.
- A direct sum A^(I) with infinite I is not already its m-adic completion.
- Product topology and m-adic uniform topology are distinguished.

*Needs:* `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules`.

### 3.11 Coefficient-module duality

<a id="coefficient-module-duality"></a>

For A as in the preceding definition, V↦V* anti-equivalently identifies orthonormalizable modules with pro-free compact modules, inverse Hom_cont,A(−,A). For O-torsion-free A, X↦Hom_O(X,O) anti-equivalently identifies cofinitely generated modules with O-torsion-free finite A-modules with their m-adic topology. Orthonormalizable V is A-flat; tensor with a finite local A-algebra is orthonormalizable, without a claim for arbitrary base change.

(E11, Lemma B.2, Remark B.5, Lemma B.6 and Proposition B.11, pp.99–102; Proposition C.5, pp.103–104: Lifted bases, Artin–Rees and compact Nakayama prove the actual duality.; Nakamura, Appendix B.1, pp.90–91: These equivalences are precisely the topological inputs to B.6.)

The proof route is: Lift a residue basis and identify V with restricted families tending to zero m-adically. Use Artin–Rees on finite presentations for flatness and finite coefficient base change; use the finite noetherian hypothesis, not infinite rank projectivity. Compute V* as the unrestricted product A^I, and its continuous dual by convergent evaluation. Use the compact Nakayama criterion on the O-dual of X to translate the finite-socle condition into finite A-generation.

**Checks.**

- c₀(N,A) dualizes to A^N with product topology.
- Completing an arbitrary tensor product does not preserve finite generation without the hypotheses.

*Needs:* `CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules`, `CompletedCohomologyPartII:CC.3/qualified-biduality`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.3/coefficient-module-duality`.

### 3.12 Mixed completed coefficient tensor

<a id="mixed-completed-tensor"></a>

For O-torsion-free complete noetherian local A, orthonormalizable V and cofinitely generated X, define V⊗̂_A X=lim_n V⊗_A(X/varpi^nX), with varpi-adic topology. Separately, for compact M,N define their compact tensor by lim_{U,W}(M/U)⊗_A(N/W) with finite quotient topology. These limits share a symbol in Nakamura but are different constructions. Use the supplied generic completed tensor carriers and name the mixed realization comparison here.

(Nakamura, Definition B.2 and Lemma B.5, pp.90–91: The compact quotient tensor and mixed varpi completion are distinguished.)

The proof route is: Request the generic compact completed tensor and its quotient universal property from P7’s coefficient-completion extension. Apply the existing inverse limit to the mixed finite coefficient diagram. Use A-flatness of V to prove exact reduction transitions and varpi-torsion-freeness as in B.5.

Uses: Nakamura B.5–B.6: The duality map is defined on exactly this completion; BP §5.4: Its nonarchimedean completed tensor is likewise not an algebraic tensor shortcut.

Provide the following named interface.

- `mixedTensor_proj`: Projection to V⊗_A(X/varpi^nX) is O-linear and continuous.
- `mixedTensor_reduce`: Its mod-varpi^n quotient is V⊗_A(X/varpi^nX) under the stated flatness control.
- `mixedTensor_map`: Continuous compatible A-linear maps induce the completed tensor map.
- `mixedTensor_torsionfree`: The completed mixed tensor is O-torsion-free.

**Checks.**

- `unit_tensor`: A⊗̂_A X≅X with its varpi topology.
- `finite_free_tensor`: For V=A^d the tensor is X^d.
- `infinite_completion`: For A=O, V=c₀(N,O) and X=O, the mixed tensor recovers c₀(N,O), whereas the compact tensor of O^N with O has compact product topology.
- The topology on V⊗̂_AX is the mixed varpi-adic topology.
- The compact tensor has the specified finite-quotient topology.

*Needs:* `CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules`, `CompletedCohomologyPartII:CC.3/coefficient-module-duality`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.3/mixed-completed-tensor`.

### 3.13 Mixed tensor duality

<a id="mixed-tensor-dual-comparison"></a>

Under the mixed tensor hypotheses, with D=Hom_O(X,O) finite over A, evaluation induces a topological A-linear isomorphism V*⊗_A D≅Hom_O(V⊗̂_A X,O), sending f⊗d to (v⊗x↦d(f(v)x)). On the left algebraic tensor agrees with compact completed tensor because D is finitely presented over noetherian A; this agreement is not asserted for an arbitrary compact second factor.

(Nakamura, Lemma B.6 and proof, pp.91–92: Finite m-power torsion and finite coefficient quotients give the evaluation comparison.; E11, Lemma B.7 and Proposition C.5, pp.101,104: Finite presentation controls Hom/tensor and compact finite generation.)

The proof route is: Write X/varpi^nX as the union of its m^r-torsion, using continuity. Use free V/m^rV and finite-length (X/varpi^nX)[m^r] for the finite-level Hom/tensor pairing. Pass the (r,n) inverse limits, using the finite presentation of D to compare compact and algebraic tensor. Check that the resulting map is exactly the evaluation formula, not merely a cardinality comparison.

**Checks.**

- For V=A the map is identity on D.
- For V=A² it is the two-coordinate evaluation pairing.
- A localization of A that is not a finite local algebra lies outside this theorem.

*Needs:* `CompletedCohomologyPartII:CC.3/mixed-completed-tensor`, `CompletedCohomologyPartII:CC.3/coefficient-module-duality`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.3/mixed-tensor-dual-comparison`.

### 3.14 Definite degree-zero dual interface

<a id="definite-degree-zero-dual-interface"></a>

For the finite definite unitary double-coset tower of LLHLM §5.3, its fixed-exponent functions and completed lattice are the CC.1 and CC.2 carriers. Their Pontryagin and Schikhof duals use the CC.3 conventions. Formula (5.8) pairs the localized mod-residual representation with the Pontryagin dual of the patched quotient; it is not an O-linear Schikhof dual of a torsion module. Actual unitary geometry and patched-module existence remain in the accepted CC.8 adapter and the patching supplier.

(LLHLM, §5.3, pp.121–123, formula (5.8): The degree-zero completed lattice and its mod-residual Pontryagin pairing are explicit applications of the generic tower.)

The proof route is: Identify finite level functions with H⁰ of the actual finite quotient from ALS. Match pullback and coefficient reduction with the source’s S and completed S definitions. Use torsion duality at the residual quotient and O-duality only for the complete torsion-free lattice.

**Checks.**

- D_O of a mod-varpi quotient is zero and cannot realize (5.8).
- Tame coefficient factors and the residual Hecke ideal remain in the instance.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `CompletedCohomologyPartII:CC.3/qualified-biduality`.

Target `CompletedCohomologyPartII:CC.3/definite-degree-zero-dual-interface`.

### Examples

D_O(O/varpi)=0 whereas D_t(O/varpi)≅O/varpi. For K_0=Z_p, D_O C(K_0,O)=O[[K_0]] with the stated dual topologies. For infinite rank the orthonormalizable c₀ lattice and the pro-free product are different topological objects.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.2/completion-and-tate-module`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.2/the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `DeformationAndDerivedPatchingAlgebra:P7`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-local-iff-pro-p`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:ContinuousLinearMap`, `mathlib:PontryaginDual`, `mathlib:Representation.dual`, `mathlib:TopModuleCat.isLimit`.

This layer is **planned**. Its remaining closure work is G3 continuous integral duality; G4 noncommutative tensor action; P7 coefficient completion extensions.

## Layer 4: Actual completed chain models

### 4.1 Lifted cellular tower

<a id="lifted-cellular-tower"></a>

Choose a finite CW pair (Z_0,∂Z_0) from the supplied neat ALS Borel–Serre model and a regular K_0/U_r covering tower of that pair, with finite free O-local system pulled back from Z_0. Lift each cell with its boundary attaching maps compatibly through the covers. Finite-level absolute and relative cellular chains are bounded finite free O[K_0/U_r]-modules, with quotient/pushforward transitions, and their specified homotopy-coherent singular comparisons are compatible with supports, coefficients and the transported Hecke maps.

(E06, Theorem 2.1.5 proof and Theorem 2.1.12, pp.22–24,26–27: A finite triangulation lifts to a profinite cell torsor; compact support has a homological version.; GN, §2.1.1–2.1.4, pp.7–8: The arithmetic chain model and its correspondence action are the finite-level comparison targets.)

The proof route is: Import generic cellular chains and singular comparison from current AlgebraicTopology. Use the actual ALS finite pair and regular tower; choose compatible cell lifts through the compact torsors. Build the lifted differential from finite attaching maps with lattice transport, retaining the boundary subcomplex. Check compatibility of the supplied comparisons up to specified homotopies, without asserting strictly commuting arbitrary choices.

Uses: CC.4 completed chains: A compatible finite-rank lifted basis makes the inverse limit finite free; CC.6 Fu hyper-Tor: Its finite-level coefficient complex is recovered from this model.

Provide the following named interface.

- `liftedCells_basis`: Cells and lattice bases index finite bases of each quotient chain module.
- `liftedCells_boundary`: The differential records deck translates and coefficient transport, with square zero.
- `liftedCells_quotient`: The quotient group-ring map induces actual covering pushforward.
- `liftedCells_compare`: The cellular–singular comparison is the imported natural chain homotopy comparison.

**Checks.**

- `one_cell_torsor`: A zero-dimensional regular torsor gives O[K_0/U] in degree zero.
- `circle_differential`: For the procyclic circle tower the completed differential is γ−1 on Λ, not zero.
- `relative_pair`: The boundary cell subcomplex produces relative chains; discarding boundary changes the interval example.
- A base cell has one deck torsor of lifts, not one fixed lift at every quotient without compatibility.
- Finite-cell and trivial-stabilizer assumptions are explicit.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Target `CompletedCohomologyPartII:CC.4/lifted-cellular-tower`.

### 4.2 Completed equivariant chain complex

<a id="completed-equivariant-cell-complex"></a>

For the lifted pair define 𝒫_•=lim_{r,s} C_•(Z_r,O/varpi^s) with quotient/pushforward transitions, and its relative counterpart 𝒫^{BM}. Use the existing Λ=TauCeti.completedGroupAlgebra O K_0. The coefficient and normal-level systems compute its two-index finite quotient presentation by CC.3, not a new ring construction. Each term is Λ^{c_i d}, where c_i is the number of base cells and d the coefficient rank, with differential the compatible limit of actual attaching matrices. It is a bounded complex of compact left Λ-modules; its dual continuous-function complex computes the cohomological tower. Bases are auxiliary; the resulting object and comparisons are independent up to specified quasi-isomorphism.

(E06, Theorem 2.1.5 proof, pp.22–24: The completed cochains have finite continuous-function terms; their duals are finite completed-ring modules.; GN, §2.1.1–2.1.3, pp.7–8: The tower completed chain object is tied to actual arithmetic chains.)

The proof route is: Identify the inverse limit of each lifted free group-ring term with a finite power of the existing TauCeti.completedGroupAlgebra using its proj, mk and ext API and CC.3’s two-index comparison. Take the compatible differential matrices and their square-zero equations by joint projection injectivity. Use exactness of compact inverse limits, with compact closed kernels and images, to identify H_n(𝒫) with lim_r H_n(Z_r,O). Dualize the actual matrix complex to continuous-function cochains; establish its strict integral/pro-system comparison under G2/G3.

Uses: CC.5 finite generation: Bounded finite projective terms and noetherian Λ imply finite homology; CC.7 duality: The actual support complexes, not an invented homology carrier, are paired.

Provide the following named interface.

- `completedChain_reduce`: Each (r,s) projection is the actual finite chain complex.
- `completedChain_terms`: The compatible lifted bases give Λ^{c_i d} in degree i.
- `completedChain_homology`: The named homology comparison identifies H_n(𝒫) with the independently defined H̃_n.
- `completedChain_support`: Absolute, boundary and relative models form their compatible short exact chain sequence.

**Checks.**

- `regular_point_chain`: The regular point tower gives Λ concentrated in degree zero.
- `circle_chain`: The circle tower gives Λ --(γ−1)→ Λ; its H₀ is O and H₁ is zero.
- `finite_pair_amplitude`: A d-dimensional finite pair gives zero terms outside [0,d], not merely zero homology there.
- An abstract inverse limit of arbitrary perfect complexes is not asserted perfect.
- The tower has one uniform finite cell bound before taking limits.

*Needs:* `CompletedCohomologyPartII:CC.4/lifted-cellular-tower`, `PadicMeasuresIwasawaAlgebras:L1`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `DeformationAndDerivedPatchingAlgebra:P7`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`, `CompletedCohomologyPartII:CC.3/iwasawa-action-on-homology`.

Target `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`.

### 4.3 Finite projective completed model

<a id="perfectness-and-cochain-comparison"></a>

Under the lifted finite-cell regular tower hypotheses, 𝒫 and 𝒫^{BM} are perfect compact Λ-complexes, finite free in the chosen lifted model. A finite prime-to-p quotient descent or idempotent summand gives finite projective terms, not necessarily free terms. Their continuous O-duals are the integral admissible cochain models, and the comparisons identify conventional H̃^n and H̃_n via CC.2 strict pro-system control. The degree bounds are cell bounds; no assertion of projective homology or concentration follows.

(E06, Theorems 2.1.5,2.1.12 proofs, pp.22–27: The lifted finite simplicial model supplies finite regular-function terms and admissible cohomology.; GN, §2.1.5–2.1.9, pp.9–10: Minimal finite projective/free resolutions require noetherian local base and separate degree control.)

The proof route is: Use the actual finite-rank lifted representatives from the previous construction. Apply the supplied noncommutative perfect-complex language rather than P7’s commutative definition without extension. On prime-to-p descent take the averaging idempotent and retain its projective summand. Apply strict admissible-complex control to the dual to identify the conventional degreewise limit.

**Checks.**

- The pro-p circle complex is perfect but H₀=Λ/(γ−1) is not Λ-projective.
- A bad stabilizer with p-torsion cannot be averaged away.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.3/admissible-complex-convention`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`.

### 4.4 Derived finite-level coinvariants

<a id="derived-finite-level-coinvariants"></a>

For U normal open in K_0, (O/varpi^s)[K_0/U]⊗ᴸ_Λ𝒫≅C_•(Z_U,O/varpi^s), naturally for quotient levels, coefficients and tame correspondences. More generally O, as a right O[[U]]-module by augmentation, satisfies O⊗ᴸ_{O[[U]]}𝒫≅C_•(Z_U,O); with algebraic coefficient lattice W_0 replace 𝒫 by its finite-rank diagonal coefficient twist. Compute on the finite projective terms; underived coinvariants of H_n need not equal H_n of the finite-level complex.

(GN, §2.1.1–2.1.3, pp.7–8: Finite arithmetic chain complexes use the correct right/left coefficient tensor.; Fu, §7, equation (38), pp.23–24: Homological descent needs the derived coinvariant object with coefficient twist.)

The proof route is: Identify the quotient on each finite free completed chain term. Use K-flatness of the bounded finite projective representative to calculate the derived tensor by its ordinary tensor complex. Compare the resulting differential with the actual quotient attaching map, then check the singular and support comparisons.

**Checks.**

- For the circle tower, H₁ of U-coinvariants is O although coinvariants of H̃₁=0.
- The right augmentation module and left chain action are never swapped.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `DeformationAndDerivedPatchingAlgebra:P7`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Target `CompletedCohomologyPartII:CC.4/derived-finite-level-coinvariants`.

### 4.5 Stabilizer and boundary replacement

<a id="stabilizers-and-boundary-replacements"></a>

When cell stabilizers are nontrivial, replace a free cell orbit by its induced derived stabilizer complex, retaining the stabilizer group cohomology/homology. A bounded finite projective Λ model follows only after finite projective resolutions and a uniform bound on stabilizer contributions are proved, or when finite stabilizer orders are invertible in O. For noncompact arithmetic quotients use the compact Borel–Serre pair and relative chains for BM; use its boundary subcomplex for absolute/compact support maps. The non-neat stack model is the ALS model, not a new coarse quotient construction.

(E06, Theorem 2.1.12, pp.26–27: Compact support is handled through the homological model with its manifold hypotheses.; GN, §2.1.1, p.7: The good level condition is used to obtain manifold chain models.)

The proof route is: Import the ALS stabilizer resolutions and the Borel–Serre pair. Apply completed induction to actual stabilizer cell complexes, retaining unbounded p-torsion resolutions where necessary. State the precise extra finite-projective hypothesis before any perfectness inference.

**Checks.**

- For a point with stabilizer C_p over k the derived model is not a bounded coarse-point complex.
- A compact quotient has empty boundary and absolute=relative chains.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.0/non-neat-tower-realisation`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.4/stabilizers-and-boundary-replacements`.

### 4.6 Patched completed model import

<a id="patched-perfect-model-import"></a>

For the specific Gee–Newton patched complex C̃_∞ with O_∞=O[[x₁,…,x_g]], coherent open ideals J and normal levels U_p, import Proposition 3.4.16: its terms are O_∞[[K_0]]-flat, it is perfect over that ring, and O_∞/J⊗_{O_∞[[U_p]]}C̃_∞≅C(U_p,J,∞). Keep the patching construction, ultrafilter, compatible minimal resolutions and uniform rank bounds in P8. Proposition 3.4.19 supplies the separate augmentation/cohomology comparison. This result is never cited as perfectness of an arbitrary unpatched inverse-limit tower.

(GN, Proposition 3.4.16 and proof, pp.23–24; Proposition 3.4.19, p.24: Flat terms, finite compatible minimal resolutions and reduction identify this particular patched model.)

The proof route is: Request the precise noncommutative O_∞[[K_0]] extension of the P8 construction; existing commutative patched-terms nodes are insufficient. Import its coherent reductions and finite projective representatives. Match chain conventions and coefficient maps with CC.4, and retain the augmentation ideal separately.

**Checks.**

- A projective patched complex is not a claim that its homology is free.
- The number of variables, coefficient quotient J and level U_p remain parameters of the supplied comparison.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P7`.

Target `CompletedCohomologyPartII:CC.4/patched-perfect-model-import`.

### Examples

The actual procyclic circle model is Λ --(γ−1)→ Λ. It is perfect, H₀=Λ/(γ−1) is not Λ-projective, and H₁=0. Derived finite-level coinvariants recover the finite circle H₁=O, while coinvariants of H̃₁ would be zero.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `CompletedCohomologyPartII:CC.0/non-neat-tower-realisation`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.3/admissible-complex-convention`, `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `CompletedCohomologyPartII:CC.3/continuous-dual-conventions`, `DeformationAndDerivedPatchingAlgebra:P7`, `DeformationAndDerivedPatchingAlgebra:P8`, `PadicMeasuresIwasawaAlgebras:L1`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

This layer is **planned**. Its remaining closure work is G2/G3 chain/cochain comparison; P7/P8 noncommutative perfect and patched extensions.

## Layer 5: Noetherian finiteness and admissibility

### 5.1 Finite generation and canonical topology

<a id="finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology"></a>

For the actual lifted finite-cell tower over compact p-adic analytic K_0, H̃_n and H̃_n^{BM} are finitely generated left Λ=O[[K_0]]-modules. The topology inherited from the compact chain complex agrees with the canonical finite-module topology. Kernels and images of its continuous differentials are closed. This asserts neither freeness of homology nor degree concentration, and does not cover arbitrary profinite groups.

(CE, Theorem 1.1(1), p.3; Theorem 1.16, pp.12–13: Finite generation and the canonical topology hold under the finite-cell and analytic hypotheses.; ST, Proposition 3.1 and Lemmas 3.2–3.4, pp.13–14: Finite modules over the compact noetherian algebra have the canonical compact topology.)

The proof route is: Import left and right noetherianity for every compact analytic K_0 from NE.0, including its open-uniform prerequisite. Apply noetherianity to kernels and quotients in the bounded finite projective completed complex. Use compactness of finite modules and the source topology theorem to identify quotient and inverse-limit topologies.

**Checks.**

- The circle tower has finite nonprojective homology Λ/(γ−1).
- A general profinite group is excluded.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`.

Target `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`.

### 5.2 Bounded integral torsion

<a id="bounded-integral-torsion"></a>

The varpi-power torsion in each finitely generated completed homology module is killed by one varpi^a. For completed cohomology computed by a bounded integral admissible model, its varpi-power torsion is likewise bounded, its quotient by torsion is varpi-adically complete, and rationalization is unchanged by taking that quotient. The cohomological assertion uses strict integral control, not the finite generation of a Banach-space dual alone.

(E06, Theorem 2.1.5, pp.22–24; Proposition 1.2.4, pp.13–14: The integral admissible model controls torsion and completeness.; CE, Theorem 1.1(1)–(2), pp.3–4: Integral bounded torsion is separate from rational duality.)

The proof route is: For homology use the ascending torsion submodules and noetherian stabilization. For cohomology invoke the strict admissible-complex theorem and its integral universal-coefficient comparison. Check completeness after quotient and use flat rationalization.

**Checks.**

- The uniform exponent may depend on degree and tame level.
- No integral torsion-free assertion is inferred from rational admissibility.

*Needs:* `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology`.

Target `CompletedCohomologyPartII:CC.5/bounded-integral-torsion`.

### 5.3 Smooth residual admissibility

<a id="smooth-dual-admissibility"></a>

For a compact finitely generated Ω=k[[K_0]]-module M, its continuous k-linear dual to discrete k is a smooth admissible K_0-representation: for every open U its U-invariants are the dual of M_U and have finite k-dimension. Apply this to completed homology modulo varpi. The reduction of H̃^n is identified with such a dual only by the CC.3 Bockstein comparison, retaining its adjacent-degree torsion term.

(CE, Theorem 1.16 and §1.7, pp.12–14: Compact finite modules and smooth admissible duals are related with integral torsion corrections.; E11, Appendix C, Proposition C.5, pp.103–104: This is the integral finite-socle/dual-finiteness analogue. The stated residual k-module criterion follows from finite Ω-generators and finite U-coinvariants, with CE Theorem 1.16 supplying the arithmetic application.)

The proof route is: Use the imported compact-discrete duality and augmentation coinvariants. A finite set of Ω-generators gives finite-dimensional U-coinvariants because [K_0:U] is finite. Use the exact Bockstein sequence to distinguish H̃^n/varpi from the dual of one homology group.

**Checks.**

- Invariants dualize coinvariants, not invariants.
- Adjacent torsion can prevent reduction from being the naive dual.

*Needs:* `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `CompletedCohomologyPartII:CC.3/finite-coefficient-duality-and-bockstein`, `SmoothRepresentationsOfLocalGroups:SR.0`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.5/smooth-dual-admissibility`.

### 5.4 Admissible completed Banach cohomology

<a id="banach-admissibility"></a>

For trivial coefficients, or coefficients with a specified full-H-stable unit ball, the rational completed cohomology of an actual finite-cell arithmetic tower, with either support, is an admissible unitary E-Banach H-representation. For a compact open K_0 the Schikhof dual of a torsion-free stable unit ball is a finitely generated Λ-module, up to isogeny, and its rational dual is a finitely generated E[[K_0]]-module. This is the arithmetic application of the general Schneider–Teitelbaum anti-equivalence and abelian category supplied after L1; independence of compact open is imported from that supplier. General nonunitary algebraic coefficient twists instead have continuous H-action and the compact-open admissibility statement.

(E06, Theorem 2.1.5(i), pp.22–24; Theorem 2.1.12, pp.26–27: Completed ordinary and compact-support cohomology are admissible Banach representations.; ST, Theorem 3.5 and following corollary, pp.14–15: The generic admissible Banach/finite Iwasawa-module duality and abelianness are foundational inputs.)

The proof route is: Identify the dual of the actual torsion-free completed lattice using CC.3, keeping the integral torsion term until rationalization. Use finite generation and the general compact-group duality theorem. Transport the compact-open criterion to H using the imported general local-group result.

**Checks.**

- The GL₂ specialization in R30.2 is a consumer of this general category.
- A Banach representation without a finite dual is not declared admissible.

*Needs:* `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower`, `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.5/banach-admissibility`.

### 5.5 Iwasawa dimension interface

<a id="codimension-iwasawa-dimension-and-the-torsion-theorem"></a>

For a torsion-free uniform open U of analytic dimension d, use the supplied Auslander regular rings Λ_U=O[[U]] and Ω_U=k[[U]], with global dimensions d+1 and d. For a nonzero finite module M, set j_R(M)=min{i:Ext_R^i(M,R)≠0} and δ_R(M)=gldim(R)−j_R(M); these are imported notions. If varpi M=0 then j_Λ(M)=j_Ω(M)+1. If M is varpi-torsion-free, reducing a finite free resolution gives 0→Ext_Λ^i(M,Λ)/varpi→Ext_Ω^i(M/varpi,Ω)→Ext_Λ^{i+1}(M,Λ)[varpi]→0. Equality of the two grades in the torsion-free case additionally uses the supplier’s Auslander purity/grade argument; it does not follow from an all-degree Ext isomorphism. For Λ_U over a uniform domain, rank zero is equivalent to positive grade; pass to a general compact analytic K_0 by finite-index restriction with the supplied dimension comparison.

(CE, §1.7, Lemma 1.17, pp.13–14: The grade comparison uses a corrected Bockstein sequence; the printed degreewise isomorphism is not used.; CE, §1.2, pp.5–6: Rank, grade and the integral versus residual coefficient dimensions are distinct interfaces.)

The proof route is: Import the ring and dimension theory from NE.0, with a precise extension request for Auslander regularity and finite-index comparison. Derive the displayed exact sequence from multiplication by varpi on the dual free-resolution complex. Use the supplier’s separate purity argument for equality of minimum nonzero Ext degrees. Treat varpi-torsion and zero modules separately; do not extend the uniform-domain rank definition to a ring with p-torsion group elements.

**Checks.**

- For Λ=Z_p[[T]] and M=(p,T), the degree-zero reduction map has cokernel F_p.
- For a k-module the Λ-grade includes the coefficient dimension shift.

*Needs:* `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem`.

### 5.6 Normalized classical cohomology growth

<a id="normalized-classical-growth"></a>

In the semisimple arithmetic setting and congruence p-power tower of CEbounds §3, with a fixed finite-dimensional algebraic coefficient representation and analytic local dimension d>0, dim_E H^n(Y_r,V)/[K_0:U_r] tends to zero if the real group has no discrete series or n is not half the real symmetric-space dimension. The tower is the regular congruence filtration of that source. This target owns the exact normalized-growth input needed for the completed torsion application; its classical multiplicity and noncuspidal estimates remain proof leaves G5, rather than a citation upward to AutomorphicSpectra.

The hypotheses are as follows. G is a connected semisimple linear algebraic group over a number field F, embedded in GL_N; G_∞=G(R⊗_Q F) and K_∞ is a maximal compact subgroup. Γ is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above p with ramification index e and set Γ_r=Γ∩G(𝔭^{er}). Discard initial terms so that Γ_r is torsion-free. The closure K_0 of Γ in G(F_𝔭), after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; U_r is the specified congruence filtration K_0∩(1+p^r M_{e f N}(Z_p)), of analytic dimension d>0 and index c p^{dr} for large r. Y_r=Γ_r\G_∞/K_∞, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a K_0-stable finite free O-lattice. Dimensions over E are compared with classical complex Betti dimensions through this same algebraic coefficient system.

(CEbounds, Theorem 3.4 proof, p.6; Theorem 3.8, pp.7–8: Classical multiplicity limits and the noncuspidal estimate give sublinear normalized growth outside the discrete-series middle degree.)

The proof route is: Use the arithmetic cohomology/cuspidal comparison for the specified coefficient representation. Insert the discrete-series degree criterion, limit multiplicity bound and noncuspidal bound identified in the source proof; acquire these proof leaves under G5. Divide by the congruence index, which has order p^{dr}, and conclude the normalized limit.

**Checks.**

- This is a specified semisimple arithmetic tower theorem, not a theorem for every reductive group or every varying coefficient family.
- The use of deep classical estimates is recorded as an open proof obligation.

*Needs:* `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`.

Target `CompletedCohomologyPartII:CC.5/normalized-classical-growth`.

### 5.7 Semisimple completed homology torsion

<a id="semisimple-homology-torsion"></a>

In the same semisimple congruence tower, H̃_n is Λ-torsion if there is no real discrete series or n differs from half the real symmetric-space dimension. Here torsion means rank zero after restriction to a torsion-free uniform open domain, not every element being varpi-torsion. The conclusion follows by duality, the normalized classical growth target and the supplied leading-rank asymptotic for admissible Banach invariants plus derived descent. It asserts neither integral vanishing nor a conjectural single-degree concentration theorem.

The hypotheses are as follows. G is a connected semisimple linear algebraic group over a number field F, embedded in GL_N; G_∞=G(R⊗_Q F) and K_∞ is a maximal compact subgroup. Γ is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above p with ramification index e and set Γ_r=Γ∩G(𝔭^{er}). Discard initial terms so that Γ_r is torsion-free. The closure K_0 of Γ in G(F_𝔭), after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; U_r is the specified congruence filtration K_0∩(1+p^r M_{e f N}(Z_p)), of analytic dimension d>0 and index c p^{dr} for large r. Y_r=Γ_r\G_∞/K_∞, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a K_0-stable finite free O-lattice. Dimensions over E are compared with classical complex Betti dimensions through this same algebraic coefficient system.

(CE, Theorem 1.4, pp.7–8; §1.6, pp.9–11: The proved torsion statement is weaker than the concentration conjectures.; CEbounds, Theorem 3.2, pp.4–5; Theorem 3.4 proof, p.6: The leading corank term compares completed cohomology with classical growth.; Fu, §7, p.23, completed-homology torsion bullet before (38): The non-totally-real SL₂ example uses completed-homology Iwasawa torsion.)

The proof route is: Identify rational cohomology corank with the uniform-open rank of the completed dual. Apply the regular-filtration leading-rank formula and descent errors of lower growth, supplied through L1/NE.0. Use normalized classical growth to force that rank to vanish. Specialize to the SL₂ over non-totally-real fields instance without claiming GL₂ geometric results for GSp₄.

**Checks.**

- A nonzero module Λ/(γ−1) can satisfy this torsion conclusion.
- No concentration conjecture in CE §1.6 is promoted to a theorem.

*Needs:* `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem`, `CompletedCohomologyPartII:CC.5/normalized-classical-growth`, `CompletedCohomologyPartII:CC.6/homological-hyperTor-descent`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.5/semisimple-homology-torsion`.

### 5.8 Uniform filtration growth

<a id="uniform-filtration-growth"></a>

For torsion-free uniform U of dimension d>0, its power subgroups U_r=U^{p^r}, a nonzero finite Ω_U-module M of canonical dimension δ, and V=D_k(M), dim_k V^{U_r} is bounded above and below by positive constants times [U:U_r]^{δ/d}. This target imports the uniform filtered-ring/Hilbert-growth theorem from NE.0. It does not assert this exponent for an arbitrary descending normal neighbourhood basis; CE/E3 exhibits a counterexample.

(CE, Theorem 1.18, p.14: The stated arbitrary-basis formulation needs the regular uniform-filtration restriction recorded in CE/E3.)

The proof route is: Dualize invariants to Ω-coinvariants. Apply the supplier’s filtered Hilbert-growth comparison to the augmentation ideals of uniform power quotients. Record the regular-filtration bounds and the anisotropic counterexample to the broader formulation.

**Checks.**

- For U=Z_p² and M=k[[T₁]] with T₂ acting as zero, the uniform power filtration gives p^r growth.
- The basis p^rZ_p×p^{2r}Z_p has index p^{3r} but the same p^r invariants, so the unrestricted δ/d formula fails.

*Needs:* `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`.

Target `CompletedCohomologyPartII:CC.5/uniform-filtration-growth`.

### 5.9 Middle-degree classical rank and Tate torsion

<a id="classical-middle-rank-and-tate-torsion"></a>

In the specified semisimple congruence tower with trivial O coefficients, suppose G_∞ admits discrete series and put n=dim_R(G_∞/K_∞)/2. Then D_O(Ĥ^n) has positive Λ-rank; consequently H̃_n has positive rank. Moreover D_O(T_varpi B^{n+1}) has Λ-rank zero even in this middle degree. Thus the classical completion supplies the whole rank in the dual completion–Tate exact sequence, while the Tate contribution is Iwasawa torsion. Rank is measured after restriction to a torsion-free uniform open subgroup, and positive rank is not integral torsion-freeness or concentration.

The hypotheses are as follows. G is a connected semisimple linear algebraic group over a number field F, embedded in GL_N; G_∞=G(R⊗_Q F) and K_∞ is a maximal compact subgroup. Γ is an arithmetic lattice commensurable with full-level congruence subgroups for this embedding; fix a prime ideal 𝔭 above p with ramification index e and set Γ_r=Γ∩G(𝔭^{er}). Discard initial terms so that Γ_r is torsion-free. The closure K_0 of Γ in G(F_𝔭), after restriction of scalars and an initial congruence shrink, is a compact analytic pro-p group; U_r is the specified congruence filtration K_0∩(1+p^r M_{e f N}(Z_p)), of analytic dimension d>0 and index c p^{dr} for large r. Y_r=Γ_r\G_∞/K_∞, with the actual congruence covering and coefficient comparisons; a fixed algebraic E-representation has a K_0-stable finite free O-lattice. Dimensions over E are compared with classical complex Betti dimensions through this same algebraic coefficient system. The coefficient system is trivial, and the strict dual completion–Tate comparison has been proved.

(CE, Theorem 1.4, pp.7–8, including the immediately preceding qualification: The middle-degree classical dual has positive rank, and the Tate dual is torsion; the survey says the latter follows from the proof of the bounds paper.; CEbounds, Theorem 3.2, pp.4–5; Theorem 3.8 and proof, pp.7–8: The leading rank comparison and discrete-series contribution give the arithmetic route; the full classical completion/Tate separation must also be checked.)

The proof route is: Acquire G5’s discrete-series multiplicity limit and positive formal-degree contribution for trivial coefficients, with the cuspidal/noncuspidal comparison. Compare normalized growth of the classical integral completion with the completed Banach corank in the regular congruence filtration; verify the lattice and Tate separation argument signalled by CE rather than deriving it from Theorem 3.2 alone. Apply strict continuous duality to the completion–Tate sequence; rank additivity identifies the positive classical rank and the rank-zero Tate kernel. Use bounded integral homology torsion to identify the rank of H̃_n with that of its torsion-free quotient.

**Checks.**

- For SL₂ over Q the middle degree is one; degree zero is still an Iwasawa-torsion module.
- The Tate dual may be nonzero despite having rank zero.

*Needs:* `CompletedCohomologyPartII:CC.3/dual-completion-tate-sequence`, `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology`, `CompletedCohomologyPartII:CC.5/normalized-classical-growth`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.5/classical-middle-rank-and-tate-torsion`.

### Examples

The circle example distinguishes finite generation, Λ-torsion and integral vanishing. The ideal (p,T) in Z_p[[T]] distinguishes a Bockstein Ext sequence from a false all-degree reduction isomorphism. The weighted Z_p² filtration distinguishes arbitrary bases from uniform-power growth.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower`, `CompletedCohomologyPartII:CC.3/dual-completion-tate-sequence`, `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology`, `CompletedCohomologyPartII:CC.3/finite-coefficient-duality-and-bockstein`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.4/perfectness-and-cochain-comparison`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`, `CompletedCohomologyPartII:CC.6/homological-hyperTor-descent`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `PadicMeasuresIwasawaAlgebras:L1`, `SmoothRepresentationsOfLocalGroups:SR.0`.

This layer is **planned**. Its remaining closure work is G1 analytic/Auslander foundations; G5 classical multiplicity leaves and regular-filtration leading-rank input.

## Layer 6: Completed descent and classical comparison

### 6.1 Completed Hochschild–Serre descent

<a id="hochschild-serre-descent-to-finite-level"></a>

For the actual neat regular finite-cell tower and a compact open U, continuous group cohomology in the specified integral admissible category gives a functorial first-quadrant spectral sequence H^i_cts(U,H̃^j_*)⇒H^{i+j}_*(Y_U,O), for *=ordinary,c, with the coefficient system and support hypotheses of CC.4. Rationalization gives the E version. The identification with conventional H̃^j uses CC.2 strict integral control; for a general tower replace it by the derived completed complex and retain its Milnor errors. Non-neat fixed levels use the ALS derived stabilizer interpretation.

(E06, Proposition 2.1.11 and proof, pp.24–26; Theorem 2.1.12, pp.26–27: The finite-level integral continuous descent sequence is Proposition 2.1.11; compact support is included in Theorem 2.1.12. Theorem 2.1.5(ii) instead gives rational stable cohomology after taking the level colimit.; CE, Theorem 1.1(4), p.3; Theorem 1.16(4), p.13: The completed Hochschild–Serre sequence is an arithmetic descent statement.)

The proof route is: Use ALS only for the finite-cover/groupoid descent input. Compute continuous derived U-invariants of the completed continuous-function cochain model, using the supplied coinduced acyclicity and completed tensor conventions. Identify that model with the conventional completed cohomology through strict pro-system control. Filter the bounded model to obtain the spectral sequence, including the full connecting/support maps.

**Checks.**

- The point regular tower has C(U,O) with zero higher continuous U-cohomology and degree-zero O.
- An arbitrary compact-open action is not enough to identify the abutment with finite arithmetic cohomology.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.4/derived-finite-level-coinvariants`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `ArithmeticGaloisDuality:R02.1`, `PadicMeasuresIwasawaAlgebras:L1`, `ArithmeticGaloisDuality:D7`.

Target `CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level`.

### 6.2 Fixed-exponent descent

<a id="fixed-exponent-descent"></a>

At each s≥1, H^i_cts(U,A^j_{*,s})⇒H^{i+j}_*(Y_U,O/varpi^s), using discrete smooth continuous group cohomology and the actual tower’s regular-cover model. The inverse coefficient limit of this spectral sequence cannot be identified with the integral spectral sequence by merely discarding lim¹; CC.2 integral control supplies that comparison under its hypotheses.

(E06, Proposition 2.1.11 proof, pp.24–25: The fixed-exponent smooth modules are computed before applying coefficient inverse limits.)

The proof route is: Use cofinal covers inside U and the imported finite-cover resolution. Apply exact filtered colimits to the descent resolution. Use discrete smooth continuous cohomology at exponent s; invoke integral control separately for the coefficient comparison.

**Checks.**

- Finite exponent modules are discrete even when infinite.
- A bad stabilizer contributes higher group cohomology rather than an averaging projector.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level`.

Target `CompletedCohomologyPartII:CC.6/fixed-exponent-descent`.

### 6.3 Completed homological hyper-Tor descent

<a id="homological-hyperTor-descent"></a>

Let W_0 be a finite free O-module with continuous algebraic U-action and the corresponding local system on Y_U. Give 𝒫⊗_O W_0 the diagonal action, with the inversion fixed by CC.3. Then O⊗ᴸ_{O[[U]]}(𝒫⊗_O W_0)≅C_•(Y_U,W_0), where O is the right augmentation module, and H_i_cts(U,H̃_j⊗_O W_0)⇒H_{i+j}(Y_U,W_0). Here H_i_cts is completed Tor, not ordinary group-ring Tor. The rational E version uses flat rationalization and the appropriate completed locally analytic/continuous coefficient category.

(Marshall, §5.2, equation (34), pp.1646–1648: Completed homology descent is a continuous homological spectral sequence.; Fu, §7, equation (38), p.24: The spectral sequence includes the finite algebraic coefficient factor.)

The proof route is: Twist the actual lifted chain model by W_0 before taking coinvariants. Use the derived finite-level comparison and right augmentation convention. Filter the bounded completed projective model, since W_0 is O-flat. Record ordinary Mathlib group-ring Tor as the finite discrete compatibility test, not as the completed theorem.

**Checks.**

- The point tower recovers W_0 with the prescribed finite-level coefficient action.
- Nonflat coefficients require derived O-tensor as well.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.4/derived-finite-level-coinvariants`, `CompletedCohomologyPartII:CC.3/iwasawa-action-on-homology`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:groupHomologyIsoTor`, `ArithmeticGaloisDuality:D7`.

Target `CompletedCohomologyPartII:CC.6/homological-hyperTor-descent`.

### 6.4 Algebraic coefficient untwisting

<a id="algebraic-coefficient-untwisting"></a>

For a finite-dimensional algebraic E-representation W with a K_0-stable finite free lattice W_0, each reduction W_0/varpi^s is trivial on some open U_s. The arithmetic tower with its associated local system therefore has a compatible fixed-exponent untwisting, and after completion/rationalization its completed cohomology with W identifies with H̃^n(E)⊗_E W in the diagonal H-action convention specified by (w,g)↦(g_p⁻¹w,g). Commensurable lattices give the same rational result; this does not make the algebraic factor a unitary representation of the full noncompact H.

(E06, Lemma 2.2.4, pp.28–29; Lemmas 2.2.8–2.2.10, pp.30–31; Theorem 2.2.17, pp.33–34: Fixed-exponent untwisting first uses the lattice stabilizer; commensurable-lattice transport gives the full rational action and tensor comparison.)

The proof route is: Choose U_s acting trivially modulo varpi^s and pass to its cofinal tower. Use the explicit inverse-action untwisting on adelic representatives and verify lattice transport. Compare reduction squares and take the ordered limits on the fixed lattice. Then invert varpi and use Lemmas 2.2.8–2.2.10 to transport between commensurable lattices, checking the full-H action and the diagonal tensor comparison.

**Checks.**

- The character W=E with action χ produces the expected inverse in the geometric untwisting and diagonal action after transport.
- A full-H invariant norm on W is not assumed.

*Needs:* `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower`.

Target `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`.

### 6.5 Classical evaluation map

<a id="classical-evaluation-map"></a>

Define the descent edge map H^n_*(Y_U,W)→(H̃^n_*(E)⊗_E W)^U by the actual completed descent and coefficient comparison. Its tower colimit maps into the corresponding smooth vectors. In general it has kernels or cokernels controlled by the other spectral-sequence terms; it is not an isomorphism by definition. The locally analytic classical edge map is the separate CC.6 analytic target.

(E06, Proposition 2.1.11, pp.24–26; Theorem 2.2.11(v), pp.31–32: Finite-level integral descent gives the edge map; after rational lattice comparison its level colimit maps to smooth coefficient vectors. Corollary 2.2.18 is the separate locally analytic spectral sequence.)

The proof route is: Take the edge of the filtered completed descent model. Check compatibility with refinement and the algebraic untwisting. Pass to the tower colimit and record the other filtration pieces explicitly.

Uses: Classical coefficient recovery: Separate smooth finite-level evaluation from derived analytic recovery; Higher roadmap applications: Check vanishing hypotheses before identifying a classical eigenspace.

Provide the following named interface.

- `classicalEval`: The spectral-sequence edge gives the named finite-level comparison.
- `classicalEval_refine`: Pullback of a classical class agrees with the level-refined edge map.
- `classicalEval_hecke`: The edge intertwines the transported tame action.
- `classicalEval_image`: Its image is the E∞^{0,n} edge submodule of E₂^{0,n}; other filtration pieces describe its kernel.

**Checks.**

- `point_degree_zero`: For the regular point tower and trivial W the degree-zero map is the finite-level identification.
- `circle_edge_zero`: For the pro-p circle tower H¹(Y_U,E)=E but H̃¹(E)=0, so the edge map is zero.
- `lowest_nonzero`: If completed cohomology below n vanishes, descent makes the degree-n edge an isomorphism.
- An edge map may be zero even when its classical domain is nonzero.
- The construction commutes with tame correspondence maps.

*Needs:* `CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`.

Target `CompletedCohomologyPartII:CC.6/classical-evaluation-map`.

### 6.6 Lowest-degree recovery

<a id="lowest-degree-recovery"></a>

If H̃^j_*=0 for all j<n in the completed descent model, then the edge H^n_*(Y_U,O)→(H̃^n_*)^U is an isomorphism. In other degrees recovery is the spectral sequence, and higher continuous U-cohomology terms need not vanish. The analogous rational and algebraic-coefficient statements require their same comparison hypotheses.

(E06, Proposition 2.1.11, pp.24–26; Theorem 2.1.12, pp.26–27: The first-quadrant finite-level descent sequence gives an edge isomorphism when all lower completed rows vanish.)

The proof route is: In total degree n the only surviving first-quadrant term is (0,n). All outgoing differentials from that edge hit lower completed degrees; incoming terms have negative first index. Use naturality of the edge map and the identified abutment.

**Checks.**

- The circle example does not satisfy lower-degree vanishing in degree one.
- No high-degree edge is declared an isomorphism without checking lower rows.

*Needs:* `CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level`, `CompletedCohomologyPartII:CC.6/classical-evaluation-map`.

Target `CompletedCohomologyPartII:CC.6/lowest-degree-recovery`.

### 6.7 Derived locally analytic recovery

<a id="analytic-classical-comparison"></a>

For the locally symmetric arithmetic tower with algebraic coefficient local system W, state the derived comparison between classical cohomology and Lie-algebra derived Hom from W∨ into derived locally analytic vectors of the rational completed cochain object, in the source’s Q_p-local analytic convention. In the GSp₄ instance of BCGP Theorem 4.8.3 this is RΓ(Y,W)≅RHom_{𝔤}(W∨,RΓ_completed,la). The generic derived-locally-analytic and Lie-cohomology functors, including exactness hypotheses and the Q_p versus F_v restriction-of-scalars convention, come from LocallyAnalyticDistributions:L0. The ordinary underived H̃^j_la Ext spectral sequence of E06 Corollary 2.2.18 is a cohomological consequence and does not by itself specify the derived comparison or justify replacing derived vectors by underived ones.

(E06, Corollary 2.2.18 and Remark 2.2.19, pp.34–35: Lie-algebra Ext of locally analytic completed cohomology recovers classical coefficient cohomology spectrally.; BCGP, Theorem 4.8.3, pp.101–102: The GSp₄ application states a derived locally analytic comparison, not a GL₂ local-global theorem.)

The proof route is: Request the general derived analytic-vector comparison machinery at L0, with its exactness restrictions. Construct the arithmetic evaluation morphism using the untwisted finite-level coefficient diagram. Acquire and check the chain-level comparison proof G6 before using the full quasi-isomorphism. Derive the classical Ext spectral sequence and retain it where only underived vectors are available.

**Checks.**

- No GL₂ comparison is used as evidence for the GSp₄ instance.
- The chain-level comparison remains a named proof gap G6.

*Needs:* `CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`, `LocallyAnalyticDistributions:L0`.

Target `CompletedCohomologyPartII:CC.6/analytic-classical-comparison`.

### Examples

For the regular point tower descent recovers the chosen finite-level coefficient. For the circle tower the classical degree-one edge to H̃¹ is zero. An edge is an isomorphism in the first nonzero completed degree, because all lower spectral-sequence rows vanish.

### Dependencies

`ArithmeticGaloisDuality:D7`, `ArithmeticGaloisDuality:R02.1`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `CompletedCohomologyPartII:CC.0/conjugation-and-tame-coherence`, `CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit`, `CompletedCohomologyPartII:CC.2/coefficient-limit-completion`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.3/iwasawa-action-on-homology`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.4/derived-finite-level-coinvariants`, `LocallyAnalyticDistributions:L0`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:groupHomologyIsoTor`.

This layer is **planned**. Its remaining closure work is G2 strict descent control; G6 derived analytic comparison; D7 continuous coefficient contract.

## Layer 7: Completed supports, boundary and duality

### 7.1 Derived completed support triangle

<a id="derived-completed-support-triangle"></a>

For the CC.0 support diagram, exact filtered colimit and derived coefficient inverse limit give a natural triangle RΓ̃_c→RΓ̃→RΓ̃_∂→RΓ̃_c[1]. It commutes with full local actions, tame correspondences, coefficient changes and level conjugation. Its long exact sequence uses the cohomology of the derived objects; the conventional modules enter only through their Milnor comparison. There is no claim that a bare inverse limit preserves a long exact sequence of discrete modules.

(CE, §1.5, equation (1.3), p.8: The completed support sequence requires a compatible boundary tower.; E06, Theorem 2.1.12, pp.26–27: The compact-support integral model has the same tower-control requirements.)

The proof route is: Import the enhanced finite-level triangle. Apply exact filtered colimit as a derived functor with no higher correction. Apply Rlim_s and its triangulated exactness; retain the connecting map and Milnor terms.

**Checks.**

- The modular cusp boundary is present in the triangle.
- The compact quotient has zero boundary and identical ordinary/compact support objects.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.2/derived-completed-tower`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticGaloisDuality:R02.1`.

Target `CompletedCohomologyPartII:CC.7/derived-completed-support-triangle`.

### 7.2 Conventional support sequence

<a id="boundary-long-exact-sequences-and-the-borel-serre-tower"></a>

Under the actual finite-cell strict admissible control for all three support complexes, the triangle identifies with conventional completed modules and yields …→H̃_c^n→H̃^n→H̃_∂^n→H̃_c^{n+1}→…. Alternatively impose and verify lim¹_s A^{n-1}_{*,s}=0 in every relevant degree. Without either hypothesis use the derived support sequence and its Milnor errors. All support arrows and connecting maps are equivariant with the CC.0 actions.

(CE, §1.5, equation (1.3), p.8: The claimed conventional long exact sequence is justified here through the actual controlled model.)

The proof route is: Use the simultaneous support comparison, not independent unrelated identifications. When using Mittag–Leffler explicitly, check each support’s inverse coefficient system. Transport the triangle long exact sequence and its actions.

**Checks.**

- A surjective inverse system of cochains alone does not imply the needed cohomology ML condition.
- Connecting maps are part of the comparison.

*Needs:* `CompletedCohomologyPartII:CC.7/derived-completed-support-triangle`, `CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`.

Target `CompletedCohomologyPartII:CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower`.

### 7.3 Completed homological support sequence

<a id="completed-homological-support-sequence"></a>

For the actual compact completed chain models, 𝒫_∂→𝒫→𝒫^{BM} is their relative chain triangle, and its long exact sequence identifies with H̃_n(∂)→H̃_n→H̃_n^{BM}→H̃_{n-1}(∂). Exactness uses the compact closed-image inverse-limit category and the actual finite-cell comparison; it is not the unrestricted exactness of limits of discrete modules.

(Nakamura, §2.3, Lemma 2.4, pp.21–22; Appendix B.1, pp.90–92: The completed Borel–Moore model and compact topological duality retain the boundary.; CE, §1.5, equation (1.2), p.8: The homological support sequence has the displayed degree shift.)

The proof route is: Import the finite relative cellular chain sequence and complete its compatible lifted representatives. Use exactness for compact modules, retaining closed kernels and images. Compare all three homology groups and their boundary maps.

**Checks.**

- The relative interval example retains its endpoint boundary map.
- The degree shift is n−1 on boundary homology.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

Target `CompletedCohomologyPartII:CC.7/completed-homological-support-sequence`.

### 7.4 Completed interior cohomology

<a id="completed-interior-image"></a>

Define completed interior cohomology I^n as im(H̃_c^n→H̃^n) in the specified topological module category, with its quotient/image topology and the induced actions. Separately define I_s^n=im(A^n_{c,s}→A^n_s) and I_lim^n=lim_s I_s^n. There is a canonical map I^n→I_lim^n. These two constructions are not identified in the definition; closedness and comparison use the strict model or the kernel-system condition below.

(CE, §1.5, equations (1.2)–(1.3), p.8: The interior term is an image of the support map; its tower comparison must retain inverse-limit errors.)

The proof route is: Use the actual support arrow after the conventional comparison. Take its image with the induced topology and equivariant structure. Form the separate finite-exponent image system and its canonical comparison map.

Uses: CC.8 localization: The central projector acts on the image through equivariance; Boundary-free applications: Identify ordinary and compact-support terms only after the boundary vanishes.

Provide the following named interface.

- `interior_include`: I^n includes in H̃^n as the image of the actual support arrow.
- `interior_factor`: The compact-support arrow factors through I^n by its image quotient.
- `interior_action`: Every compatible local/Hecke action preserves I^n.
- `interior_compare`: Coefficient projections give the natural map to lim_s I_s^n.

**Checks.**

- `compact_interior`: For empty boundary the support arrow is an isomorphism and I^n=H̃^n.
- `zero_map_interior`: For a zero support map the image is zero even if both modules are nonzero.
- `inverse_image_failure`: For A_{c,s}=Z constant, I_s=Z/p^s with reduction and the surjection Z→I_s, lim_s I_s=Z_p but im(lim_s Z→Z_p)=Z. Thus inverse limit does not commute with images for uncontrolled discrete systems.
- Image before inverse limit is not made definitionally equal to image afterwards.
- Closedness is an additional proved property of the controlled model.

*Needs:* `CompletedCohomologyPartII:CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower`, `mathlib:ContinuousLinearMap`.

Target `CompletedCohomologyPartII:CC.7/completed-interior-image`.

### 7.5 Interior image comparison

<a id="interior-image-comparison"></a>

Let K_s=ker(A^n_{c,s}→I_s^n). The short exact systems 0→K_s→A^n_{c,s}→I_s^n→0 give coker(lim A^n_{c,s}→lim I_s^n)=ker(lim¹ K_s→lim¹ A^n_{c,s}). Hence I^n=I_lim^n if lim¹ K_s=0, with topology comparison requiring strictness/closedness. The finite-cell strict model must establish this kernel-system control when using conventional completed interior cohomology; the equality is not automatic from ML of the source and target systems separately.

(CE, §1.5, p.8: The support image is controlled by applying the inverse-limit exact sequence to its kernel system.)

The proof route is: Apply the derived inverse-limit exact sequence to the image short exact sequence. Identify the conventional support image with the image of the inverse-limit map. Use kernel ML or the named strict model to eliminate the obstruction and compare topologies.

**Checks.**

- The constant integer to Z/p^s example has a nonzero obstruction.
- Source and target ML alone do not force kernel ML.

*Needs:* `CompletedCohomologyPartII:CC.7/completed-interior-image`, `CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control`, `ArithmeticGaloisDuality:R02.1`.

Target `CompletedCohomologyPartII:CC.7/interior-image-comparison`.

### 7.6 Completed Iwasawa Poincaré duality

<a id="completed-iwasawa-poincare-duality"></a>

For an oriented neat arithmetic d-manifold tower and dual coefficient local systems, the actual Λ-cellular duality comparison induces Ext^i_Λ(H̃_j,Λ)⇒H̃_{d-i-j}^{BM} with the orientation twist and opposite-ring action converted by g↦g⁻¹; swapping supports gives the reverse comparison. It is obtained from the chain-level Poincaré–Lefschetz pairing and RHom_Λ(𝒫,Λ), not the continuous O-dual alone. For O[[U]] with torsion-free uniform U, the unrestricted Ext amplitude is dim(U)+1; the smaller dim(U) bound requires O-torsion-free input and the supplier’s coefficient argument. The arithmetic chain pairing is proof leaf G7.

(CE, §1.3, pp.5–6; Theorem 1.16(5), p.13: Completed support duality uses Iwasawa Ext, with coefficients and orientation retained.; Nakamura, Lemma 2.4, pp.21–22: The rank-two arithmetic instance uses completed support duality with its twists.)

The proof route is: Import only finite-level manifold/support duality from ALS.5 and current AlgebraicTopology. Lift its pairing compatibly to the actual cellular Λ-model, acquiring G7’s orientation/opposite-ring check. Use the perfect model to compute RHom and the hyper-Ext filtration. Retain all coefficient torsion and use the correct global-dimension bound.

**Checks.**

- For U={1}, Λ=O and M=k, Ext¹_O(k,O) is nonzero.
- No completed duality target is requested back from ALS.5.

*Needs:* `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.7/completed-homological-support-sequence`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Target `CompletedCohomologyPartII:CC.7/completed-iwasawa-poincare-duality`.

### 7.7 Completed boundary strata

<a id="boundary-strata-and-completed-induction"></a>

Apply the imported ALS boundary incidence diagram to completed towers. For a proper rational parabolic, the completed contribution retains the Levi arithmetic cohomology and continuous parabolic induction, with orientation and incidence shifts. The nilpotent-radical positive-degree contribution collapses only after proving its actual congruence-tower fixed-exponent colimit is zero (G8); finite component/stabilizer terms remain, especially at p=2. No new Borel–Serre compactification or generic continuous-induction category is constructed here.

(CE, §1.5, equation (1.4) and preceding discussion, pp.7–9: Completed boundary terms involve Levi towers, induction and the congruence nilpotent-radical calculation.)

The proof route is: Import actual parabolic strata and their incidence maps from ALS.2. Prove the nilpotent congruence-tower calculation with its integral hypotheses under G8. Apply the supplied continuous induction and retain finite components and the incidence total complex.

**Checks.**

- For modular curves the result includes cusp degree-zero terms.
- At p=2 no finite component average is silently divided by its order.

*Needs:* `CompletedCohomologyPartII:CC.7/derived-completed-support-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `PadicMeasuresIwasawaAlgebras:L1`.

Target `CompletedCohomologyPartII:CC.7/boundary-strata-and-completed-induction`.

### 7.8 Boundary vanishing support comparison

<a id="boundary-vanishing-support-comparison"></a>

If a compatible central residual Hecke projector e acts on the completed support triangle and eRΓ̃_∂=0, then eRΓ̃_c→eRΓ̃ is a quasi-isomorphism, with all local actions and dual comparisons retained. This generic implication is the interface for BCGP Theorem 4.9.4. Proving boundary vanishing for its GSp₄ residual Galois hypotheses belongs to that arithmetic consumer and is not deduced from a GL₂ example or from the generic projector construction.

(BCGP, Theorem 4.9.4, p.104: The arithmetic non-Eisenstein condition is an additional boundary-vanishing input to the support comparison.)

The proof route is: Apply the supplied compatible projector as an exact summand functor on the enhanced triangle. Use its assumed boundary acyclicity to conclude that the first map is a quasi-isomorphism. Transport duality and actions along that comparison; leave the arithmetic boundary-vanishing proof to the named consumer.

**Checks.**

- Without boundary acyclicity the comparison is not asserted.
- The generic support criterion is independent of the residual Galois irreducibility proof.

*Needs:* `CompletedCohomologyPartII:CC.7/derived-completed-support-triangle`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Target `CompletedCohomologyPartII:CC.7/boundary-vanishing-support-comparison`.

### Examples

For empty boundary ordinary and compact-support objects coincide. For a finite relative interval, the endpoint boundary creates relative H₁=O. For constant integer lifts Z→Z/p^s, taking inverse-limit images gives Z⊂Z_p, so image/limit interchange fails without kernel control.

### Dependencies

`ArithmeticGaloisDuality:R02.1`, `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.2/derived-completed-tower`, `CompletedCohomologyPartII:CC.2/integral-admissible-complex-control`, `CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control`, `CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore`, `CompletedCohomologyPartII:CC.4/completed-equivariant-cell-complex`, `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:ContinuousLinearMap`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

This layer is **planned**. Its remaining closure work is G7 arithmetic Iwasawa chain pairing; G8 boundary nilpotent calculation; kernel-system control for interior image.

## Layer 8: Shimura, Galois and Hecke adapters

The following twelve imported targets are the accepted CC.8 plan. For the reader their prerequisite list uses the proposed current-tier replacement contracts; G11 records the required assembly migration. Their completed carrier, finite-image, residual-support and localization mathematics is unchanged. The imported arithmetic realization is conditional on the new central-quotient target: Y, its split-center quotient and the Shimura quotient are compared only with the verified descended coefficients, support shifts and effective deck groups. Its Y_K=X_K(C) notation does not assert that a central bundle or ineffective kernel is trivial.

### 8.1 Arithmetic tower realisation comparisons

<a id="arithmetic-tower-realisation"></a>

For each of the modular, Siegel, unitary and Hilbert families, fix the actual canonical-model tower X_K over its reflex field E, an embedding of an algebraic closure of E into C, a neat cofinal level system K=K_p K^p, and a compatible finite locally constant O/varpi^s coefficient system L_s from one chosen integral lattice. Identify the CC.0 finite-level arithmetic quotient with X_K(C), with its archimedean-component convention explicitly matched. The supplied finite étale–analytic comparison gives compatible O/varpi^s-linear isomorphisms of ordinary and compactly supported cohomology, natural for coefficient reduction, level pullback, finite étale trace and tame Hecke correspondences. Applying the existing CC.1 colimit at fixed s and then the CC.2 coefficient inverse limit gives named continuous linear comparison isomorphisms between the generic completed objects and these four actual arithmetic towers. These are comparisons of the existing carrier, not four new definitions of completed cohomology. The boundary triangle is transported only for the compactification and support maps supplied by CC.0/CC.7.

The hypotheses are as follows. O is the ring of integers in a finite extension of Q_p; varpi is a uniformizer; k is finite. Neatness ensures finite-level schemes and covering maps; nonneat levels require the supplied stack or group-cohomology interpretation. The connected real stabilizer A_infty^0 K_infty^0 used in the survey and the full stabilizer of a Shimura domain can differ. A comparison is asserted only after a concrete equivariant quotient dictionary; when descent is needed retain derived finite-component descent, rather than averaging at primes dividing the component-group order. Siegel and unitary comparisons use the finite-coefficient portion of EDC.6/complex-analytic-comparison. R14.3 and R18.4 supply the modular and Hilbert/curve inputs. Trace comparisons use the chosen complex orientation. For the complex orientation identify the finite Tate twist by the chosen compatible roots of unity. Use the EDC.6 trace-orientation input for Z/p^n and the supplied coefficient-extension compatibility for the selected O/varpi^s local system; no arbitrary unlabelled Tate-twist identification is made.

(CE, §1.5, pp. 7–8: The arithmetic quotient uses connected real stabilizers and retains a finite component-group action; this fixes the quotient dictionary required by the adapter.; Scholze, §4.2, proof of Theorem 4.2.1, p. 1021: The finite compact-support group is identified with étale cohomology of extension by zero on a compactification before the perfectoid argument. Only this finite comparison recipe is used here.; Milne, Theorem 21.1 and Remark 21.2, p. 130: Ordinary finite-coefficient comparison and its constructible extension motivate the finite input; compact supports and naturality are imported from the stronger named EDC supplier, not inferred from this ordinary statement.)

The proof route is: Import X_K, its canonical model, reflex-field action, and the analytic adelic quotient from V8; retain determinant/component labels, rather than silently selecting one geometric component. Apply the exact finite-coefficient comparison with compact supports from EDC.6. For modular and Hilbert/curve families use the specialized local-system dictionaries in R14.3 and R18.4. Check all comparison squares before taking limits. Use EDC.6/trace-orientation-comparison for the chosen Tate-twist/complex-orientation normalization and CC.7 for its coefficient-system transport. Use CC.1 functoriality on the cofinal level diagram at each s and CC.7 for the support diagram. Then take the CC.2 coefficient inverse limit with its induced topology; its inverse is the limit of the finite comparison inverses. Export modularCompletedComparison, siegelCompletedComparison, unitaryCompletedComparison and hilbertCompletedComparison; R31.1 imports the first and fourth instead of constructing them again.

**Checks.**

- On a finite disjoint union of geometric points the comparison preserves every component idempotent, and H^0 is the product of one coefficient module per component.
- At the level of a noncompact modular curve, H_c^0=0 whereas H^0 contains constants; the support comparison must not substitute ordinary cohomology.
- For a component group C_2 at p=2, no averaging projection using 1/2 is exported. The quotient dictionary or actual derived descent must appear.
- The Galois action transported to the Betti object depends on the specified comparison and complex embedding; no Galois action on the bare singular site is asserted.

*Needs:* `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`, `CompletedCohomologyPartII:CC.8/canonical-four-family-tower-input`, `ModularCurvesPartII:R14.3`, `CompletedCohomologyPartII:CC.8/hilbert-finite-local-system-input`, `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `CompletedCohomologyPartII:CC.0/finite-etale-trace-orientation-comparison`, `CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient`.

Target `CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation` is imported from the accepted CC.8 packet.

### 8.2 Definite unitary degree-zero adapter

<a id="definite-unitary-degree-zero"></a>

In the definite unitary setting of LLHLM §5.3, with fixed tame level U^p and fixed away-p lattice W, let S(U,W_s) consist of functions on G(F^+)\G(A_f) with f(gu)=u^{-1}f(g), W_s=W/varpi^s. The actual finite double quotient and its equivariant coefficient system identify this module with H^0 of the finite discrete arithmetic tower. Thus lim_s colim_{U_p} S(U_p U^p,W_s) is canonically the CC.2 completed degree-zero object after the CC.1 level colimit for that tower, with its tame Hecke and G_p actions and coefficient-limit topology. At a nonneat finite quotient, the value at a representative x lies in W_s^{Gamma_x}; arbitrary W_s-valued functions are valid only when stabilizers act trivially. The degree-zero identification makes no claim that higher stabilizer cohomology vanishes. The finite quotient/coefficient dictionary is a CC.0 input; no canonical-model or étale–Betti comparison is used for this discrete degree-zero identification. Galois representations associated to Hecke eigenvalues are not a Galois action on these functions.

The hypotheses are as follows. Use the paper’s definite outer form of GL_3 over the totally real F^+≠Q, split over its CM field, and its specified local identifications and tame coefficient lattice. For the simple G_p action by right translation, W is fixed away p and its U_p action is trivial. A nontrivial p-adic coefficient action requires the corresponding equivariant coefficient transport, not this simplified formula.

(LLHLM, §5.3, pp. 120–122, especially the definitions of S(U,W), S(U^p,W) and its completed lattice: These definitions specify the definite unitary group, coefficient covariance, fixed tame level and the coefficient/level limit order. The invariant-fibre formula follows directly from their covariance condition.)

The proof route is: Use the finite double-coset decomposition to evaluate functions at representatives. Covariance identifies the result with the product of stabilizer invariants. Identify the same invariant fibres in finite-level equivariant H^0 using the CC.0 finite double-quotient/coefficient dictionary. Verify coefficient and level maps, including the covariant coefficient action. Apply the CC.1 level colimit and then the CC.2 coefficient inverse limit to this finite comparison; on the fixed away-p lattice use right translation to identify the G_p action and the standard finite Hecke sums. Import CC.3 for Pontryagin/Schikhof duals, rather than creating new dual carriers.

**Checks.**

- One double coset with trivial stabilizer gives W_s, with the prescribed tame coefficient action.
- For stabilizer C_2 acting by sign on O at p=2, integral invariant values are zero, while modulo 2 all values are invariant. Invariants cannot be interchanged with coefficient reduction without a descent theorem.
- An empty double quotient gives the zero module; a disjoint union gives a product, not an identification with one selected component.

*Needs:* `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.3`.

Target `CompletedCohomologyPartII:CC.8/definite-unitary-degree-zero` is imported from the accepted CC.8 packet.

### 8.3 Scholze fixed-exponent support convention

<a id="scholze-4-2-convention-and-the-perfectoid-comparison"></a>

For the Hodge-type datum (G,D), the fixed embedding into (Sp_{2g},D_{Sp_{2g}}), and K^p contained in the level-N subgroup with N≥3 prime to p, Scholze’s tilde H^i_{c,K^p}(Z/p^n) in published §4.2 is colim_{K_p} H_c^i(X_{K_pK^p},Z/p^n), at fixed positive n. The compact-support part of the arithmetic comparison identifies this with the CC.1 fixed-coefficient object for the same tower, constant lattice Z_p and exponent n. The integral completed lattice is a separate lim_n construction; its modulo-p^n recovery requires CC.2 and is not the definition of the fixed-exponent object. This node supplies the left input and the boundary/support convention to TC.2. Scholze Theorem 4.2.1 and Corollaries 4.2.2–4.2.3, including the almost O_C coefficient tensor and the boundary ideal sheaf on the perfectoid minimal compactification, are exclusively TC.2 outputs.

The hypotheses are as follows. n≥1 is fixed. Coefficients are exactly Z/p^n; an O/varpi^s variant requires an explicit coefficient extension receipt. No perfection, almostification or automorphic sheaf is needed to construct this CC.8 object; those operations belong to TC.2.

(Scholze, §4.2, definition on p. 1020; Theorem 4.2.1 statement and its two level diagrams on p. 1021: The definition is a compact-support colimit at fixed exponent with the Hodge/Siegel and tame-level hypotheses. The theorem is cited only to identify the consumer and its coefficient/support requirements, not as a CC.8 theorem.)

The proof route is: Read the published §4.2 definition with the §4.1 Hodge embedding/tame level conventions, matching finite level and support with the arithmetic adapter. Apply cofinality and the compact-support finite comparison at fixed n. Expose the level-insertion maps so TC.2 can verify its pullback/trace diagrams. Register a supplier link CC.8→TC.2 for this fixed-exponent input. Preserve this integrated node id with its narrowed statement, and remove the perfectoid comparison output from CC.8 ownership.

**Checks.**

- For a proper tower ordinary and compact supports agree under CC.7; for a nonproper connected curve they do not agree in degree zero.
- The coefficient-limit lattice and its fixed quotient are not declared equal without the CC.2 coefficient-recovery hypotheses.
- Changing the integral lattice changes the corresponding integral comparison; rational isomorphism alone is insufficient.

*Needs:* `CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`.

Target `CompletedCohomologyPartII:CC.8/scholze-4-2-convention-and-the-perfectoid-comparison` is imported from the accepted CC.8 packet.

### 8.4 Transported Galois and Hecke actions

<a id="transported-arithmetic-actions"></a>

On each actual finite geometric étale cohomology group of the canonical model over E, use its continuous G_E action and the chosen O-linear tame Hecke correspondence action defined over E. Transport them by the finite arithmetic comparison, then through the fixed-s level colimit and the coefficient inverse limit defining the existing completed object. The resulting actions are unique actions with those finite comparison squares; G_E and tame Hecke commute, as do both with G_p when supplied by the tower. Give the torsion level colimit the discrete topology and the integral object the inverse-limit topology. Require an open stabilizer for every torsion-colimit vector and continuous reduction maps. Then G_E×M→M is jointly continuous, and each Hecke operator is continuous. Joint continuity of G_p uses the analogous supplied open stabilizers, not just continuity of individual operators. On a rational object use the chosen stable integral lattice and its induced p-adic topology.

The hypotheses are as follows. The finite Galois and Hecke actions commute with level pullback, coefficient reduction and the selected support maps. Actual Hecke correspondences descend over E. An infinite-dimensional discrete colimit need not have an open global action kernel: require open point stabilizers, which suffice for joint continuity. Full G_p action may move levels by conjugation; the CC.1 conjugated-level/cofinal construction is supplied. Do not assume G_p acts on every fixed K_p group.

(CE, §1.5, p. 7: The arithmetic tower carries the full p-adic group and completed tame Hecke action; CC.8 adds the canonical-model Galois transport to the generic construction.; GN, Remark 2.1.13, p. 11: The completed Hecke action commutes with the full p-adic group on completed homology. This is the consumer requirement for the transported action.)

The proof route is: Conjugate the finite actions across the comparison, and use naturality to descend to each colimit. Prove its smoothness vector by vector at a finite level and finite coefficient. Invoke the existing TopModuleCat limit and Functor.mapEnd on the coefficient diagram. Equality and commutation are checked under every limit projection; uniqueness follows from those projections. For joint continuity, test each inverse-limit basic open using its discrete coordinate and that coordinate’s open stabilizer. Use CC.1 for G_p level reindexing and CC.2 for stable-lattice rationalization and its topology. For each residual projector in this packet the commutation equations restrict these actions to its closed summand.

Uses: TorsionCohomologyInfrastructure:TC.2: The fixed-exponent compact-support comparison must retain commuting actions; CompletedCohomologyAndLocalGlobalCompatibility:R31.1/R31.3: The Banach lattice and its residual summand must carry the same Galois, Hecke and G_p conventions.

Provide the following named interface.

- `TauCeti.CompletedArithmetic.transportedAction`: The monoid action on the existing topological coefficient-limit object is the image of the natural diagram action under the limit functor; arithmetic finite actions are transported first.
- `TauCeti.CompletedArithmetic.transportedAction_projection`: Each limit projection intertwines the induced operator with the corresponding diagram component.
- `TauCeti.CompletedArithmetic.transportedAction_unique`: Two continuous actions agreeing under every coefficient projection agree.
- `TauCeti.CompletedArithmetic.transportedAction_commute`: Commuting natural diagram actions induce commuting operators on the limit.
- `TauCeti.CompletedArithmetic.transportedAction_jointlyContinuous`: If each coordinate action is jointly continuous, the action on the induced limit topology is jointly continuous.
- `TauCeti.CompletedArithmetic.transportedAction_localized`: A continuous idempotent commuting with all action operators has an invariant image with the restricted continuous action.

**Checks.**

- `TauCeti.CompletedArithmetic.transportedAction_identity`: The trivial natural action induces the identity on every element of the completed object.
- `TauCeti.CompletedArithmetic.transportedAction_sign`: For a constant O coefficient-limit diagram with the C_2 sign action, the nontrivial element acts by −1, including at p=2; reduction modulo 2 can be trivial without making the integral action trivial.
- `TauCeti.CompletedArithmetic.transportedAction_noncommuting`: The two shears on O^2, represented by matrices [[1,1],[0,1]] and [[1,0],[1,1]], do not commute. Commutation on the completed object requires the finite commuting-action hypothesis.
- Projection to each coefficient coordinate recovers the specified action, with the same order of Hecke composition.
- A product of finite discrete representations gives a continuous inverse-limit action even when their common kernel is not open.

*Needs:* `CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`, `mathlib:TopModuleCat`, `mathlib:CategoryTheory.Functor.mapEnd`, `mathlib:CategoryTheory.Limits.lim`, `mathlib:TopModuleCat.isLimit`.

Target `CompletedCohomologyPartII:CC.8/transported-arithmetic-actions` is imported from the accepted CC.8 packet.

### 8.5 Compatible finite derived Hecke image diagram

<a id="compatible-derived-hecke-images"></a>

Fix the commutative abstract spherical O-Hecke algebra H away from a finite set S containing p and all bad tame places. On each CC.4 perfect complex C_{U,s} over the finite group ring B_{U,s}=(O/varpi^s)[K_0/U], use the specified central O-linear derived H action and its finite faithful image T_{U,s}. For V⊂U and t≥s, require the actual Hecke-equivariant derived base-change identification B_{U,s} tensor-derived over B_{V,t} C_{V,t} ≅ C_{U,s}. It induces a surjective O-algebra homomorphism T_{V,t}→T_{U,s}, taking the class of h to the class of the same h. With the CC.4 coherence receipts these maps form a cofiltered diagram of finite commutative rings. Mere intertwining of homology maps does not construct these image-ring maps. The finite image, finite local factors, ghost bounds and derived idempotent splitting are IHG.2 inputs; CC.8 plans their compatible tower diagram.

The hypotheses are as follows. U ranges over open normal subgroups of K_0, with a cofinal countable subsystem chosen for prototypes; finite images are finite as sets, not just finitely generated modules. B_{U,s} can be noncommutative. The finite image contracts must be O-linear in D(B_{U,s}); IHG’s existing commutative-base Suggested.lean is not silently an equivariant noncommutative contract. Use one compatible H and one common bounded cohomological interval for the family when exporting uniform ghost results.

(GN, Definition 2.1.11 and Remark 2.1.12, p. 10: The finite rings are images in the derived category of finite group-ring modules, and their transitions come from coefficient-change identifications, including reduction through a normal subgroup at nonnormal levels.)

The proof route is: Request the finite equivariant image/idempotent/ghost contract from IHG.2, with the existing commutative-base statements as its specialization. Verify finite cardinality from a bounded finite projective group-ring representative. Apply derived coefficient change to each Hecke endomorphism. Since the same abstract H acts at the target, the source action kernel is contained in the target kernel; form the quotient/image map and prove surjectivity on H classes. Check identity/composition using the actual CC.4 base-change isomorphisms and their coherence. Expose the image ring functor without reintroducing the finite Hecke algebra theory.

Uses: Gee–Newton, Definition 2.1.11, p. 10: The big algebra is the inverse limit of this specific finite-image diagram; CC.8 residual support and localization: Compatible image maps carry finite local factors and their projectors.

Provide the following named interface.

- `TauCeti.CompletedArithmetic.derivedHeckeDiagram`: The functor on the cofiltered normal-level/coefficient category has object T_{U,s} and transition given by the specified derived coefficient change.
- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_class`: Every transition sends the derived image class of h∈H to its target image class.
- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_surjective`: Each transition is surjective; finite images are finite commutative O-algebras.
- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_coherence`: Identity and composite transitions agree, including their base-change comparison isomorphisms.

**Checks.**

- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_zero`: A zero complex has the one-element image ring at every level; its compatible diagram has no maximal ideals.
- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_scalar`: For the scalar action on a rank-one O/varpi^s complex at trivial group level, the image is O/varpi^s and coefficient transitions are quotient maps.
- `TauCeti.CompletedArithmetic.derivedHeckeDiagram_intertwiner_insufficient`: For H=k[x] acting by x=0 on k and by x=1 on k, the zero map of modules intertwines the actions, but no H-compatible map of the two image quotients exists. A bare intertwiner cannot replace base-change recovery.
- Every transition is surjective on actual image rings and preserves the class of each abstract Hecke operator.
- An operator killed in the finer derived image is killed after actual derived coefficient change.

*Needs:* `CompletedCohomologyPartII:CC.4`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:RingHom.range`.

Target `CompletedCohomologyPartII:CC.8/compatible-derived-hecke-images` is imported from the accepted CC.8 packet.

### 8.6 Residual support at a pro-p level

<a id="residual-support-stability"></a>

Choose an open pro-p U_0⊂K_0, restrict to V normal in K_0 contained in U_0, and put A_0=T_{U_0,1} (formed by the same coefficient-change construction, permitting U_0 nonnormal through a smaller normal subgroup). Under finite equivariant images, bounded perfect complexes, the Hecke-equivariant derived coinvariant identification k tensor-derived over (O/varpi^s)[U_0/V] C_{V,s} ≅ C_{U_0,1}, and conservative derived residue reduction for those perfect complexes, each surjection T_{V,s}→A_0 induces a bijection of maximal ideals. Equivalently its kernel is contained in the Jacobson radical of the finite ring and is nilpotent. The maximal ideals are indexed by the support of the actual derived image, not by arbitrary maximal ideals of H.

The hypotheses are as follows. U_0/V is a finite p-group. This hypothesis is essential. The conservative reduction is required after splitting each Hecke residual idempotent; its summand is a perfect complex over the finite local group ring. Ghost nilpotence identifies the support of a faithful derived image with the union of its homology supports; no equality of derived and homology images is assumed.

(GN, Lemma 2.1.14, p. 11; Definitions 2.1.6–2.1.8 and Proposition 2.1.9, pp. 9–10: The pro-p residual support argument is the first part of the semilocality proof. Minimal complexes over a possibly noncommutative local ring provide an alternative rigorous detection argument with a named prerequisite.)

The proof route is: Split a finite residual factor using the IHG equivariant idempotent contract. A nonzero factor acts on a nonzero perfect summand: if its identity vanished on all cohomology, bounded ghost nilpotence would force that idempotent to vanish. Over the local finite p-group algebra, conservative derived residue reduction detects this nonzero perfect summand. One can use a minimal representative with differentials in its radical, as in Gee–Newton 2.1.6–2.1.9; after residue reduction its nonzero free term survives. The P7 noncommutative extension is an explicit supplier gap. The coinvariant identification puts every finer residual label in the support at U_0,1. Surjectivity gives the converse. A finite commutative ring’s radical is nilpotent; conclude the stated kernel criterion.

**Checks.**

- For a trivial tower A_0=k×k, exactly two residual labels persist.
- For the C_2 sign representation over F_3, derived coinvariants vanish because 2 is invertible; a nonzero perfect summand can disappear. The pro-p hypothesis cannot be removed.
- Nilpotent ghosts can change an image algebra but cannot create a new residual maximal ideal.

*Needs:* `CompletedCohomologyPartII:CC.8/compatible-derived-hecke-images`, `CompletedCohomologyPartII:CC.4`, `DeformationAndDerivedPatchingAlgebra:P7`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Target `CompletedCohomologyPartII:CC.8/residual-support-stability` is imported from the accepted CC.8 packet.

### 8.7 Completed derived Hecke algebra

<a id="completed-hecke-algebra"></a>

For the compatible finite derived-image diagram F of this packet define T_hat as its inverse limit, the subring of the product consisting of compatible tuples, with the subspace topology of the product of finite discrete rings. This is the instance of Mathlib RingCat.sectionsSubring attached to F, not a new generic inverse-limit construction. It is a compact Hausdorff complete topological commutative O-algebra. The evaluation maps to finite images are continuous surjections. The compatible map H→T_hat has dense image; it need not be surjective. Cofinal normal-level systems and iterated coefficient/level limits give canonical topological ring isomorphisms. The supplied finite actions induce a continuous action on the compatible CC.4 chain/homology system and its completed limit; on completed cohomology use the CC.3 adjoint/dual convention or an explicitly supplied cohomological diagram.

The hypotheses are as follows. The normal-level/coefficient index is nonempty and cofiltered; transitions are surjective finite ring maps. Use a countable cofinal subsystem only after proving cofinality. The completed module action is asserted only on diagrams whose action and transition maps are compatible and jointly continuous at each discrete coefficient level.

(GN, Definition 2.1.11, p. 10; Remark 2.1.13, p. 11: These give the inverse limit, its topology, the iterated coefficient/level presentation and its action on completed homology.)

The proof route is: Apply the existing sections subring to the ring functor. The compatibility equations define a closed subset of the product of finite Hausdorff spaces; compactness, Hausdorffness and completeness follow. For a finite coordinate or finite compatible set of coordinates, choose one finer coordinate. Finite surjective transitions and compactness lift it to a compatible tuple; images of H surject onto that finer image ring, proving density. Use the limit universal property to compare cofinal/iterated systems. Apply compatible finite actions coordinatewise to CC.4 completed homology; use CC.3 rather than equating chain, homology and dual actions.

Uses: Gee–Newton, Lemma 2.1.14, p. 11: The finite residual support produces finitely many completed local factors; CompletedCohomologyAndLocalGlobalCompatibility:R31.3: The GL_2 completed Hecke algebra specializes this common construction instead of constructing another big algebra.

Provide the following named interface.

- `TauCeti.CompletedArithmetic.completedHecke`: The carrier is RingCat.sectionsSubring for the finite derived-image functor; use its inherited commutative ring and the product-induced topology.
- `TauCeti.CompletedArithmetic.completedHecke_eval`: Evaluation at any (U,s) is a continuous surjective ring map and satisfies all transition equations.
- `TauCeti.CompletedArithmetic.completedHecke_ext`: Two elements agree exactly when their evaluations at every finite image agree.
- `TauCeti.CompletedArithmetic.completedHecke_lift`: A compatible family of continuous ring maps to the finite images factors uniquely and continuously through T_hat.
- `TauCeti.CompletedArithmetic.completedHecke_dense`: The abstract H map is dense because it surjects onto every finite image; density does not assert surjectivity onto the limit.
- `TauCeti.CompletedArithmetic.completedHecke_cofinal`: Restriction to a cofinal level/coefficient subsystem is a topological ring isomorphism preserving each retained evaluation.
- `TauCeti.CompletedArithmetic.completedHecke_action`: Evaluation of t acting on a compatible module element equals the corresponding finite image operator applied to that coordinate.
- `TauCeti.CompletedArithmetic.completedHecke_action_continuous`: If the finite coordinate actions are jointly continuous and compatible with the diagram, the induced action on the compatible-sections completed module is jointly continuous for the product-induced topologies.

**Checks.**

- `TauCeti.CompletedArithmetic.completedHecke_constant`: For the constant identity-transition diagram on a finite commutative ring A, T_hat≅A with its discrete topology.
- `TauCeti.CompletedArithmetic.completedHecke_scalar`: For A_s=Z/p^s with reduction maps, T_hat≅Z_p; the map Z→Z_p is dense and is not surjective.
- `TauCeti.CompletedArithmetic.completedHecke_zero`: For the one-element finite image diagram, the completed ring is the one-element ring and its maximal spectrum is empty.
- No topology of pointwise convergence on End(completed homology) replaces the specified inverse-limit topology.
- The underlying ring and projections agree with the native compatible-sections carrier.

*Needs:* `CompletedCohomologyPartII:CC.8/compatible-derived-hecke-images`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.4`, `mathlib:RingCat.sectionsSubring`, `mathlib:ModuleCat.sectionsSubmodule`.

Target `CompletedCohomologyPartII:CC.8/completed-hecke-algebra` is imported from the accepted CC.8 packet.

### 8.8 Semilocal product decomposition

<a id="completed-semilocal-product"></a>

Let T_hat be the preceding inverse limit and fix the finite base image A_0 of residual-support-stability. Then evaluation q:T_hat→A_0 is surjective and ker(q) is contained in J(T_hat). Pullback gives a bijection MaxSpec(A_0)≅MaxSpec(T_hat), including algebraic maximal ideals, not only continuous ones. With this finite index set, T_hat≅∏_m T_hat_m as rings and as topological rings when each factor is endowed with the inverse-limit topology from its finite local factors. Each T_hat_m is a compact complete Hausdorff local ring with the same finite residue field as the corresponding A_0 factor, and equals the algebraic localization of T_hat at m. The topology asserted here is the finite-image inverse-limit topology. No noetherianity, finite O-module assertion, or identification with the algebraic J-adic topology is inferred merely from semilocality.

The hypotheses are as follows. Every finite transition is surjective and its map to A_0 has radical kernel. Finite local-factor decompositions and their uniqueness are supplied by IHG.2. For the zero image system, the maximal spectrum is empty and the empty product is the one-element ring.

(GN, Lemma 2.1.14, p. 11: The source states semilocality, residue finiteness and the local product decomposition. This node proves the inverse-limit-topology portion directly and leaves the source’s stronger algebraic radical-adic conclusion outside its claimed output.)

The proof route is: An element is a unit in the limit exactly when all its finite coordinates are units: their unique inverses form a compatible tuple. For x in ker(q) and any y, every coordinate of 1−yx is a unit because each finite kernel is radical. Thus ker(q)⊂J(T_hat), which treats all algebraic maximal ideals. Use surjectivity of q to identify the finite maximal spectrum. Match each finite local factor to its A_0 label. Ring maps preserve its unique central idempotent, so finite decompositions are compatible. Take the finite product of inverse-limit factors. The coordinatewise splitting and recombination are inverse continuous ring maps. Each factor has radical kernel over its finite local base, hence is local; elements outside its maximal ideal are units. The projection’s algebraic universal property identifies it with localization. This proves the needed semilocal/topological decomposition directly, without relying on the stronger J-adic conclusion in the source proof. Export that stronger conclusion only with an additional closed-powers/completeness proof.

**Checks.**

- A constant k×k diagram has two algebraic maximal ideals and two factors.
- For T={(a,b)∈O×O : a≡b mod varpi}, the ring is local: it has two rational eigensystems but only one residual factor.
- An inverse system of local finite rings with arbitrarily large embedding dimensions may yield a nonnoetherian local limit; this theorem exports no noetherian instance.

*Needs:* `CompletedCohomologyPartII:CC.8/completed-hecke-algebra`, `CompletedCohomologyPartII:CC.8/residual-support-stability`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Target `CompletedCohomologyPartII:CC.8/completed-semilocal-product` is imported from the accepted CC.8 packet.

### 8.9 Compatible residual Hecke projectors

<a id="residual-hecke-projector"></a>

Given a residual maximal ideal m_0 of A_0, let e_{m_0,U,s} be the unique central idempotent of T_{U,s} equal to 1 in the local factor labelled m_0 and 0 in its other local factors. Their compatible tuple is e_{m_0}∈T_hat. This is the unique idempotent with those finite evaluations. The finite family is pairwise orthogonal and sums to 1, and e_{m_0}T_hat is the m_0-labelled completed local factor. It is independent of the chosen finite residual base, pro-p level and cofinal normal subsystem after the labelled transition identifications. A maximal ideal of the abstract H is eligible only if it lies in the finite-image residual support and is pulled back from m_0.

The hypotheses are as follows. The finite local decomposition and residual-label bijections are fixed by the preceding theorem. Do not lift separate characteristic-zero eigencharacters that are congruent modulo varpi to distinct integral projectors.

(GN, Definition 2.1.11, pp. 10–11; Lemma 2.1.14, p. 11: The inverse-limit image algebra and its product into local factors provide canonical residual idempotents. This construction makes the projector compatibility and choice independence explicit.)

The proof route is: Use the unique finite local-factor idempotents from IHG.2. The residual-label bijections show that transition maps preserve them. Form their element of the existing sections ring, and check idempotence, orthogonality and the finite sum at every coordinate. Use cofinality and the unique finite evaluations to prove choice independence. Identify the image ideal with the corresponding product factor.

Uses: CC.8 completed residual localization: Its action defines the exact closed summand on the existing completed object; CompletedCohomologyAndLocalGlobalCompatibility:R31.3 and TorsionCohomologyInfrastructure:TC.2: Both consumers select the same residual factor, with congruent characteristic-zero eigensystems kept together.

Provide the following named interface.

- `TauCeti.CompletedArithmetic.residualProjector`: The element of T_hat formed from the compatible finite local-factor idempotents.
- `TauCeti.CompletedArithmetic.residualProjector_eval`: Its evaluation equals the unique projector for the specified finite residual factor.
- `TauCeti.CompletedArithmetic.residualProjector_unique`: An element with those finite evaluations is the same residual projector; consequently it is independent of all cofinal choices.
- `TauCeti.CompletedArithmetic.residualProjector_relations`: The residual projectors are idempotent, pairwise orthogonal and have finite sum 1.
- `TauCeti.CompletedArithmetic.residualProjector_factor`: Multiplication by the residual projector identifies its image ring with the corresponding factor of the semilocal product.

**Checks.**

- `TauCeti.CompletedArithmetic.residualProjector_product`: For O×O with the two residual maximal ideals, the projectors are (1,0) and (0,1).
- `TauCeti.CompletedArithmetic.residualProjector_local`: For a local completed image ring the sole residual projector is 1.
- `TauCeti.CompletedArithmetic.residualProjector_congruent_characters`: In T={(a,b)∈O×O : a≡b mod varpi}, (1,0) is not an element of T. Both rational characters belong to the same residual factor, whose projector is 1.
- A residual ideal outside the image support is rejected as input; it does not define an arbitrary new summand.

*Needs:* `CompletedCohomologyPartII:CC.8/completed-semilocal-product`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:RingCat.sectionsSubring`.

Target `CompletedCohomologyPartII:CC.8/residual-hecke-projector` is imported from the accepted CC.8 packet.

### 8.10 Residual localisation of the completed tower

<a id="completed-residual-localisation"></a>

For a compatible continuous T_hat action on the existing completed cohomology/homology object M, define its localisation at the supported residual ideal m_0 to be the image of the continuous idempotent operator P_{m_0}=e_{m_0} acting on M, with its subspace topology. Use the native linear-map range; do not define another completed carrier. For Hausdorff M it is closed, and M is the topological direct product of these finitely many images. Algebraically this image agrees with localization at the corresponding maximal ideal of T_hat, by the semilocal product theorem. The inclusion and projection split continuously. On CC.4 complexes take the corresponding compatible derived idempotent summands supplied by IHG.2. On a cohomological dual object use the adjoint-transposed Hecke convention from CC.3; the residual label is transported along that adjoint anti-isomorphism, not assumed unchanged.

The hypotheses are as follows. T_hat acts continuously and its finite projectors agree with the finite diagram actions on M. The native idempotent image construction is reused from Mathlib. The cohomology/homology duality identification and Hecke adjoints must be supplied by CC.3 for the stated supports and coefficient lattice.

(GN, Lemma 2.1.14, p. 11; Definition 3.3.5, p. 18, and Proposition 3.4.19, p. 24: The semilocal factors are the residual localization used for completed homology and patched complexes. CC.8 supplies the common topological summand, not patching or its augmentation theorem.)

The proof route is: Apply the ring action to e_{m_0}; its idempotence gives a continuous idempotent operator. Take its native linear range with induced topology. Use Mathlib’s idempotent range=kernel(1−P) and closed-range theorem. Restrict the operator to obtain a split continuous projection and inclusion; finite orthogonal projectors yield the topological product. Use the algebraic localization universal property of the ring factor to compare module localization. Use the imported derived splitting for complexes and the CC.3 adjoint action for cohomology versus homology. Restrict commuting Galois, G_p and tame Hecke actions to the summand. No localization by an arbitrary abstract H ideal outside the supported finite spectrum is exported.

Uses: CompletedCohomologyAndLocalGlobalCompatibility:R31.3: Its residual Banach representation is the selected closed summand of the generic completed object; TorsionCohomologyInfrastructure:TC.2: The compact-support fixed-exponent object uses the same residual projector before the almost comparison.

Provide the following named interface.

- `TauCeti.CompletedArithmetic.completedLocalization`: The native range of the continuous residual idempotent on the completed object, with induced topology.
- `TauCeti.CompletedArithmetic.completedLocalization_inclusion`: The range subtype inclusion is continuous and linear.
- `TauCeti.CompletedArithmetic.completedLocalization_projection`: P corestricts to a continuous linear projection onto its range, and the inclusion/projection composites are 1 on the range and P on M.
- `TauCeti.CompletedArithmetic.completedLocalization_fixed`: An element lies in the selected range exactly when P x=x.
- `TauCeti.CompletedArithmetic.completedLocalization_closed`: In a Hausdorff completed object the selected range is closed.
- `TauCeti.CompletedArithmetic.completedLocalization_map`: Any continuous linear map intertwining two labelled projectors restricts to the ranges, respecting identity and composition.
- `TauCeti.CompletedArithmetic.completedLocalization_algebraic`: For the supported residual label and semilocal product ring, the selected image is algebraically the localization of M at that maximal ideal.
- `TauCeti.CompletedArithmetic.completedLocalization_complete`: For the complete separated additive uniformity of the Hausdorff completed object, its closed residual range is complete with the induced uniformity.

**Checks.**

- `TauCeti.CompletedArithmetic.completedLocalization_zero`: The zero projector selects the zero module, even when M is nonzero.
- `TauCeti.CompletedArithmetic.completedLocalization_one`: The identity projector selects all of M with its original topology.
- `TauCeti.CompletedArithmetic.completedLocalization_product`: On O×O with the first residual factor projector, the selected module is O×{0}; (0,1) is excluded.
- The range topology is inherited from M and the inclusion/projection are continuous; no algebraic localization topology is silently substituted.
- A nonidentity residual summand may be zero on one degree of M without removing that label from the all-degree derived image algebra.

*Needs:* `CompletedCohomologyPartII:CC.8/residual-hecke-projector`, `CompletedCohomologyPartII:CC.8/transported-arithmetic-actions`, `CompletedCohomologyPartII:CC.3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`.

Target `CompletedCohomologyPartII:CC.8/completed-residual-localisation` is imported from the accepted CC.8 packet.

### 8.11 Localisation through limits, supports and duality

<a id="localisation-limit-support-dual-compatibility"></a>

For a compatible residual label on the actual completed tower, localisation commutes with the fixed-coefficient filtered level colimit and with the coefficient inverse limit: e(lim_s colim_U M_{U,s}) is continuously isomorphic to lim_s colim_U e_{U,s}M_{U,s}, with the inherited topologies. It also commutes with cofinal reindexing and with all supplied equivariant morphisms, including Galois and tame Hecke actions. For a supplied equivariant support triangle, applying compatible derived projectors gives its residual summand triangle and the induced localized long exact sequence. For the exact CC.3 Pontryagin/Schikhof duality pair, the transpose projector selects the dual of the original residual summand, with the adjoint Hecke label. This is not a claim that an arbitrary algebraic dual commutes with arbitrary inverse limits.

The hypotheses are as follows. All finite projectors, transition maps and support-triangle maps are compatible. There are finitely many residual labels. Use CC.1 for the discrete level colimit, CC.2 for integral topology and qualified fixed-coefficient recovery, and CC.3 for the continuous duality regime. Retain the CC.2 lim^1 terms when its recovery hypotheses fail.

(GN, Remark 2.1.13, p. 11, and Proposition 3.4.19, p. 24: Residual localization is compatible with the completed homology object and the augmentation identification. The general CC.8 compatibility is a split-idempotent argument on the supplied diagrams, not a new augmentation or duality theorem.; LLHLM, §5.3, pp. 121–122: The unitary example keeps a completed lattice and its dual, illustrating why dual localization must preserve the fixed lattice and its coefficient convention.)

The proof route is: At each fixed s, represent a vector at some finite level; applying its projector produces a representative in the selected finite summand. Orthogonal complements show the resulting filtered-colimit image comparison is bijective. At the coefficient limit, send a compatible vector to its coordinate projections and use coordinatewise inclusion as inverse on the selected range. Continuity is tested under every coordinate map; no exactness of arbitrary inverse limits is used. For support triangles use the already equivariant CC.7 triangle and its functorial IHG splitting. For duality transpose the split inclusion/projection; use the exact CC.3 continuous dual comparison and coefficient/support regime.

**Checks.**

- For a constant O^2 tower with first-coordinate projector, both orders of limits/localization give the first coordinate with its original topology.
- Localizing the boundary triangle preserves all three terms; it cannot replace compact support by the image in ordinary cohomology.
- For a pairing between a module and its continuous dual, transpose the first-coordinate projector; a Hecke adjoint that permutes residual labels permutes the dual factor accordingly.

*Needs:* `CompletedCohomologyPartII:CC.8/completed-residual-localisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.7`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Target `CompletedCohomologyPartII:CC.8/localisation-limit-support-dual-compatibility` is imported from the accepted CC.8 packet.

### 8.12 Derived and homology images have the same residual labels

<a id="derived-cohomological-residual-comparison"></a>

Suppose the finite derived image diagram T_i maps surjectively and compatibly to the corresponding image T_i^H on the direct sum of finite homology groups, and all complexes have cohomology in one common interval [a,b], a≤b. The induced map of finite-ring inverse limits T_hat→T_hat^H is surjective and its kernel has (b−a+1)-st power zero. Consequently it induces a bijection of residual maximal ideals and transports the unique residual projectors. It need not be an isomorphism. An action on one completed homology degree, or on End of its completed limit, is a further quotient and is not identified with either all-degree inverse-limit image algebra without a separate theorem.

The hypotheses are as follows. Finite-ring diagrams share the same cofiltered index and compatible image-quotient maps. A uniform cohomological interval supplies the uniform exponent. The IHG equivariant ghost bound is required in the actual derived category of the group-ring complexes.

(GN, Remark 2.1.12, p. 10, and Lemma 2.1.14, p. 11: The finite derived image has nilpotent kernel on all homology; its residual support is therefore detected on homology. This node states the uniform-amplitude inverse-limit extension with its additional compactness hypotheses.)

The proof route is: Use the IHG bounded ghost theorem at every finite coordinate. Products of b−a+1 compatible ghost elements vanish at every coordinate and hence in the sections ring. Surjectivity of the inverse-limit quotient uses compactness: for a fixed compatible homology-image tuple the finite fibres and finite transition constraints have the finite-intersection property, since a common finer coordinate can be lifted. Arbitrary inverse limits of surjections between infinite modules would not justify this step. Apply the nilpotent-quotient maximal-spectrum and unique idempotent-lift comparison from the finite/complete Hecke input; label and projector compatibility follows. Do not identify the two rings.

**Checks.**

- A constant quotient k[epsilon]/epsilon^2→k has identical residual labels and projector 1 but is not an isomorphism.
- Without a uniform exponent, coordinatewise nilpotent kernels need not yield a nilpotent limit kernel; the uniform-amplitude hypothesis stays in the statement.

*Needs:* `CompletedCohomologyPartII:CC.8/completed-hecke-algebra`, `CompletedCohomologyPartII:CC.8/residual-hecke-projector`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Target `CompletedCohomologyPartII:CC.8/derived-cohomological-residual-comparison` is imported from the accepted CC.8 packet.

### 8.13 Canonical arithmetic tower input

<a id="canonical-four-family-tower-input"></a>

For the selected modular/Siegel, PEL unitary and Hilbert Shimura data of the CC.8 adapter, construct the minimal characteristic-zero canonical-model input: varieties Sh_K over the reflex field, compatible finite étale level maps at neat inclusions, Hecke correspondences, and the complex analytic identification with the connected arithmetic locally symmetric quotient including component labels. The relevant data are of PEL/Hodge or abelian type under Milne’s criteria; central quotients and chosen level conditions are retained. This supplies only the input consumed by the completed tower, not integral models, all Shimura data, compactifications or a new completed object. Its canonical-existence proof leaves are G9.

(MilneSV, §5, 5.29, pp.57–66; 12.10, pp.114–115; 13.6–13.8, pp.118–119; 14.12–14.16, pp.125–128: The analytic quotient, canonical-model convention, functoriality and PEL/Hodge/abelian-type existence supply these selected tower contracts.)

The proof route is: Check each selected Shimura datum against the source’s PEL/Hodge or abelian-type criteria. Acquire the required canonical-existence proof leaves G9, without assuming an arbitrary Shimura datum has the selected moduli interpretation. Use canonical functoriality for neat finite level maps and correspondences. Match complex components with the supplied ALS arithmetic quotient before applying the accepted CC.8 tower realization.

**Checks.**

- The definite unitary discrete quotient is distinguished from a positive-dimensional unitary Shimura variety.
- This target replaces the upward V8 prerequisite under the current tier rule; it does not imply perfectoid comparison.

*Needs:* `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `ModularCurvesPartII:R14.3`, `CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient`.

Target `CompletedCohomologyPartII:CC.8/canonical-four-family-tower-input`.

### 8.14 Hilbert finite-level coefficient input

<a id="hilbert-finite-local-system-input"></a>

For the Hilbert datum Res_{F/Q}GL₂ with F totally real and the selected neat level, specialize the canonical tower input and the lower-tier étale/Betti comparison to each O/varpi^s local system attached to the specified algebraic representation. Identify its complex connected component cochains with the actual ALS finite-level tower, compatibly with tame Hecke, level maps and coefficient reduction. The full level tower, central units and finite components must be retained. This is the narrow input needed by CC.8; the wider Hilbert modular geometry stays with R18.4 as a consumer. Include selected quaternionic Shimura curves (quaternion algebra split at exactly one real place) via the abelian-type canonical input. Coefficients satisfy the central descent condition of arithmetic-shimura-central-quotient; no PEL moduli assertion is made for every quaternionic datum.

(MilneSV, §5, pp.57–66; 14.12–14.16, pp.125–128: The totally real Hilbert datum is handled through its selected canonical-model construction and complex arithmetic quotient.; E06, §2.2, Lemma 2.2.4 and Theorem 2.2.17, pp.28–29,33–34: The coefficient system comparison must commute with untwisting and level transport.; MilneSV, Example5.24,pp.63–64; §9 type A₁ example,pp.94–95: Hilbert data are the split quaternion case; the one-split-real-place case is a curve, and general quaternionic data require the abelian-type route.)

The proof route is: Use the selected Hilbert PEL/abelian-type construction and analytic quotient with its components. Apply the imported étale/Betti coefficient comparison at every finite exponent. Check the actual level, tame and reduction squares and feed them to the accepted arithmetic adapter.

**Checks.**

- Central units are not discarded by replacing the tower with one connected component without descent.
- No Hilbert perfectoid vanishing result is a prerequisite of this finite-level input.

*Needs:* `CompletedCohomologyPartII:CC.8/canonical-four-family-tower-input`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`, `CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient`.

Target `CompletedCohomologyPartII:CC.8/hilbert-finite-local-system-input`.

### 8.15 Arithmetic–Shimura central comparison

<a id="arithmetic-shimura-central-quotient"></a>

Distinguish E06’s arithmetic Y_K, finite-volume Y_K°=Y_K/S_∞°, and Shimura quotient Ỹ_K=Y_K/Z_∞°. The first quotient has contractible fiber S_∞°≅R^a, hence ordinary coefficient cohomology is unchanged but compact-support cohomology has the real dimension a shift and its orientation factor. The second quotient has a t-dimensional compact torus fiber; its Leray sequence has fiber H^j((S¹)^t,O)≅∧^jO^t, so it is not an unconditional cohomology isomorphism. An algebraic coefficient representation descends to Ỹ only when the indicated Z_∞¹ action is trivial. At the finite adelic levels retain the closure of rational central units in the effective deck action; verify the actual deck quotient rather than inferring K_0/U from neatness. The Hilbert and selected quaternionic Shimura curves need this comparison, since E06 §2.4’s simplifying equality Y°=Ỹ excludes these general examples. Finite-cell/perfect/descent targets apply only to their verified regular tower, or to the explicit central/stabilizer replacement G12.

(E06, §2.4,pp.40–42: The two central quotients, torus fiber, coefficient descent condition and restricted simplifying hypothesis distinguish arithmetic and Shimura towers.; MilneSV, Example5.24,pp.63–64; Theorem5.28 and Remark5.29,pp.65–66; §9 type A₁ example,pp.94–95: Hilbert/quaternionic data and rational central units determine the effective finite-level quotient; no topological inverse-limit identity from Theorem5.28 is used.)

The proof route is: Import the actual ALS quotient and coefficient descent data. Use the contractible real-split central bundle comparison for ordinary cohomology and the compact-support Thom shift. For the residual central torus bundle retain its Leray/monodromy comparison instead of identifying its cohomology with the base. Check actual level kernels and coefficient descent before applying CC.4/CC.6; acquire G12’s effective-deck/perfect replacement if the full compact group is ineffective.

**Checks.**

- For a circle fiber H¹ contributes O, so base and total cohomology need not agree.
- A real-line fiber preserves ordinary H⁰ but shifts compact-support degree by one.
- Infinite central units are not removed by neatness.

*Needs:* `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

Target `CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient`.

### Examples

For a definite unitary discrete tower, completion is continuous degree-zero functions; its mod-residual dual is Pontryagin, not O-linear Schikhof. A Hilbert or quaternionic input checks central descent and effective deck groups. A central torus fiber contributes exterior-power cohomology and cannot be discarded.

### Dependencies

`ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`, `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`, `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.0/finite-etale-betti-support-comparison`, `CompletedCohomologyPartII:CC.0/finite-etale-trace-orientation-comparison`, `CompletedCohomologyPartII:CC.0/tower-axioms-and-the-standing-hypotheses`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.4`, `CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting`, `CompletedCohomologyPartII:CC.7`, `CompletedCohomologyPartII:CC.8/canonical-four-family-tower-input`, `CompletedCohomologyPartII:CC.8/hilbert-finite-local-system-input`, `DeformationAndDerivedPatchingAlgebra:P7`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `ModularCurvesPartII:R14.3`, `mathlib:CategoryTheory.Functor.mapEnd`, `mathlib:CategoryTheory.Limits.lim`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker`, `mathlib:ModuleCat.sectionsSubmodule`, `mathlib:RingCat.sectionsSubring`, `mathlib:RingHom.range`, `mathlib:TopModuleCat`, `mathlib:TopModuleCat.isLimit`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

This layer is **planned**. Its remaining closure work is G9 canonical existence; G10 finite support comparison; G11 accepted supplier migration; three inherited CC.8 gaps. G12 arithmetic/Shimura central quotient, coefficient descent and effective deck groups.


## Worked examples

The pro-p circle is a simultaneous direction, duality and descent test. A degree-p cover acts by p on H¹ under pullback and by p on H₁ under pushforward. Thus A¹_s=0, H̃¹=0 and H̃₁=0, but H̃₀=O. The completed cellular complex has differential γ−1. Taking derived coinvariants recovers finite-level H₁=O through Tor; taking coinvariants of its homology alone misses that degree. The integral UCT has no E/O-dual contribution from H̃₀’s torsion, since that torsion is zero. This checks the corrected CE/E1 term and the classical edge-map non-isomorphism.

For U=Z_p² and M=k[[T₁]] with T₂ acting trivially, canonical Ω-dimension is one. Uniform power levels yield p^r-dimensional dual invariants and index p^{2r}, as expected from δ/d=1/2. The cofinal normal levels p^rZ_p×p^{2r}Z_p have index p^{3r} but the same p^r invariants. They disprove the unrestricted growth claim. The target imports filtered Hilbert growth only for the regular uniform-power filtration.

For R=Z_p[[T]] and M=(p,T), resolve M by R→R² with relation (−T,p). Dualizing gives Ext¹_R(M,R)=R/(p,T)=F_p. Reduction of the dual complex therefore has the additional adjacent torsion term. The displayed Bockstein sequence in CC.5 records it; no degreewise Ext identification is used to prove grade equality.

The constant discrete integer system surjects at every stage onto Z/p^s. Its inverse limit maps Z→Z_p with image Z, while the inverse limit of the stage images is Z_p. The kernel system p^sZ provides the lim¹ obstruction. This distinguishes the two completed interior-image definitions. The example is a control counterexample, not a compact arithmetic tower: compact closed-image inverse limits have stronger exactness.

For a selected Hilbert Shimura tower, first determine whether the quotient is arithmetic Y, finite-volume Y° or Shimura Ỹ. The real split central quotient preserves ordinary cohomology but shifts compact support. The remaining compact torus quotient has exterior-power fiber cohomology; coefficients descend only with the stated central action condition. The closure of rational units can make the full local compact action ineffective. The source’s faithful regular cover calculation cannot be transported across these quotients without G12’s verified effective-deck or change-of-rings comparison.

## Proof closure and supplier extensions

The following are precise open proof obligations, not implementation claims. The source locators above support the targets and distinguish a full proof from a source statement or outline. Every prerequisite chain stops at an inspected declaration, an exact supplied/requested contract, or one of these obligations.

### G1: general analytic Iwasawa foundations

NE.0 now plans broader noetherianity, but the current packet explicitly leaves its analytic/open-uniform and graded-ring proof leaves. Auslander purity, coefficient grade comparison, finite-index dimension and uniform-power growth require the precise extension requested above. L1 must own the generic Schneider–Teitelbaum category and leading-rank input before these arithmetic targets close.

### G2: strict integral tower control

The E06 finite-cell proof requires the full integral admissible-complex/pro-system machinery: strict images, bounded torsion, completeness and the compatible comparison with lim_s of cohomology. It is requested after L1; the native inverse-limit carrier alone does not supply this. Check all ordinary, compact-support and boundary models simultaneously.

### G3: continuous duality with integral torsion

Acquire the qualified complete-lattice/compact-discrete duality and strict exactness used in the two integral UCT sequences, biduality, the dual completion–Tate sequence and the chain/cochain comparison. The torsion term in CE/E1 is corrected, but a continuous Hom target is not an implementation of this theorem.

### G4: noncommutative completed tensor action check

BP proves the torus instance. The profinite noncommutative extension needs the regular-function generator calculation, the contraction of the completed coinduced complex and the right/opposite action conversion. Verify this before exporting the full invariant completed-tensor realization of RHom_Λ; the degreewise O-dual anti-equivalence is separately justified.

### G5: classical multiplicity proof leaves

CEbounds Theorem3.4 proof uses the discrete-series cohomology degree theorem, DeGeorge–Wallach/Savin limit multiplicity and the Rohlfs–Speh noncuspidal bound; those underlying proofs were not acquired in this run. The precise normalized-growth target is owned in CC.5 rather than citing a higher-tier AutomorphicSpectralTheory roadmap. Acquire publicly usable proofs and backward-chain them at this owner before marking the arithmetic torsion target closed. For the middle-degree target also acquire the positive discrete-series formal-degree limit and the integral classical-lattice completion versus Tate-kernel rank separation signalled before CE Theorem1.4; the bounds paper’s rational leading-rank formula alone does not prove the separation.

### G6: derived analytic comparison

The derived comparison stated by BCGP Theorem4.8.3 requires a chain-level evaluation and derived analytic-vector theorem with explicit field/analytic convention. E06 Corollary2.2.18 alone only supplies a spectral sequence. Import the L0 derived machinery and verify the arithmetic quasi-isomorphism before using the stronger comparison.

### G7: arithmetic Iwasawa chain pairing

ALS.5 supplies finite-level Poincaré–Lefschetz duality only. Build its compatible Λ-cellular pairing, with orientation, inverse deck action, support interchange and grading, before asserting the completed hyper-Ext spectral sequence. Source CE states the spectral sequence but does not replace this comparison proof.

### G8: completed boundary nilpotent calculation

Acquire the proof that the positive-degree nilpotent congruence-tower colimit vanishes with the stated coefficient and p hypotheses, then check Levi induction and incidence compatibility. CE §1.5 gives a route, not a blanket vanishing theorem for arbitrary boundary models. Retain p=2 component and stabilizer corrections.

### G9: selected canonical-model existence

The newly moved canonical-model input uses Milne’s PEL/Hodge/abelian-type criteria. The underlying moduli/descent and absolute-Hodge existence proofs are not acquired here. Verify the precise chosen unitary/Siegel/Hilbert data and prove their selected characteristic-zero canonical models before closure; no unrestricted canonical-model theorem is inferred.

### G10: finite support comparison proof

MilneEC §21 gives the finite-locally-constant proof outline and identifies the general constructible theorem. The constructible j! comparison, compactification independence and its oriented trace normalization need full proof closure through the existing sheaf/geometry foundations. This moved contract replaces EDC.6 input; it is not a new six-functor package.

### Finite equivariant noncommutative Hecke contract

The current upstream IHG.2 Suggested.lean states finite-image and ghost APIs over commutative A. The CC.4 deck group-ring base can be noncommutative. The requested equivariant extension is mathematically required before these arithmetic signatures can use genuine finite derived-image objects; forgetting deck equivariance is insufficient.

### Finite p-group derived residue detection

P7’s existing local/minimal-complex packet is commutative-base. CC.4 supplies the finite derived coinvariant identification. The noncommutative finite local group-ring derived Nakayama needed after Hecke idempotent splitting is an exact additional supplier contract. The source supports it, but no applicable current supplier signature was found.

### Arithmetic comparison and tower interfaces at the pins

The pinned libraries contain generic limits, topological modules and derived categories, but not the CC.0–CC.7 arithmetic tower/local-system carrier or the selected canonical-model comparison. Suggested.lean consequently prototypes the real compatible-sections, limit action and idempotent-range interfaces; the arithmetic-specific signature register lists the omitted comparison/action/finite-image/support/duality declarations with their exact suppliers. They are not replaced by arbitrary cohomology functions, private scheme stand-ins or vacuous predicates.

### G11: accepted CC.8 supplier migration

The immutable accepted part still names V8, R18.4 and two EDC.6 nodes. Under the current tier instructions its arithmetic-tower-realisation must instead import the new CC.8 selected canonical/Hilbert inputs and CC.0 finite étale Betti/trace comparisons. Apply this precise migration when assembling the reviewed whole packet; no part file is changed by this job. The migration must also specialize the imported arithmetic realization to the central/effective-quotient hypotheses of G12; its displayed arithmetic/complex-space identification is conditional, not a universal identification of the different quotients.

### G12: effective central quotient tower

Verify the central quotient and effective finite deck groups for the selected Hilbert/quaternionic examples and the descended coefficients. The faithful regular K_0/U tower hypotheses of CC.4/CC.6 are not automatic for Shimura quotients with infinite central units. If retaining a full ineffective compact group, a finite-projective model needs a qualified change-of-rings/perfect resolution for the closed central kernel; supply that extension at P7 before invoking perfectness. Otherwise compute descent in the verified effective deck group. No full-U invariants theorem is exported for an ineffective tower.

## Source corrections

The four findings below paraphrase the source. Each was independently confirmed against the stated author-PDF locator on 13 October 2026, including the counterexample or coefficient calculation. Nodes use the corrected formulation. The confirmation concerns the displayed statement or proof step specified here; in E2 it does not reject the lemma’s grade equality. No published correction was identified in the inspected author indexes and version; this is not a claim about every edition.

### CompletedCohomologyPartII/E1

At CE author PDF, Theorem1.1(3),p.3, the first duality sequence uses the E/O-dual of all of H̃_{n−1} in its left term. Use Hom_cont,O(H̃_{n−1}[varpi^∞],E/O), not the dual of the entire module.

In the degree-p circle tower H̃₀=O and H̃₁=0, while H̃¹=0. The printed term Hom(O,E/O) is nonzero; the corrected torsion submodule is zero. Known within the reviewed integrated decomposition; no published correction identified in the searched author version.

### CompletedCohomologyPartII/E2

At CE author PDF, Lemma1.17 proof,p.14, the reduction of every Ext group modulo p is identified directly with Ext over Ω. For p-torsion-free M use the Bockstein short exact sequence with adjacent Ext[p] term; establish grade equality by a separate Auslander purity argument.

For R=Z_p[[T]], M=(p,T), the resolution R→R²→M has Ext¹_R(M,R)=F_p. Thus the reduction map in degree zero has cokernel F_p. This invalidates the all-degree identification without asserting that the lemma’s grade equality is false. New in this pass; no published correction identified in the searched author indexes/version.

### CompletedCohomologyPartII/E3

At CE author PDF, Theorem1.18,p.14, the δ/d exponent is claimed for any descending normal cofinal neighbourhood basis. Use a regular uniform-power filtration U^{p^r}, with nonzero finite Ω-module and d>0; any broader filtration needs its own weighted growth statement.

Take U=Z_p², M=k[[T₁]] with T₂ acting as zero, δ=1,d=2, and U_r=p^rZ_p×p^{2r}Z_p. For V=D_k(M), dim V^{U_r}=p^r whereas [U:U_r]^{δ/d}=p^{3r/2}; their ratio tends to zero. New in this pass; no published correction identified in the searched author indexes/version.

### CompletedCohomologyPartII/E4

At CE author PDF, §1.3,p.6, Ext-functor amplitude sentence, the Iwasawa Ext functors are given amplitude at most dim(K_0) on finitely generated integral modules without a coefficient restriction. For O[[U]] with torsion-free uniform U the unrestricted bound is dim(U)+1. A dim(U) bound requires O-torsion-free input and its additional coefficient argument.

For U={1} the ring is O and the finite module k has Ext¹_O(k,O)=k, although dim(U)=0. For positive d, k has top Ext in degree d+1 by regularity. New in this pass; no published correction identified in the searched author indexes/version.


## Suggested Lean forms

The compact suggested file has 193 lines. It elaborates at the pins with six admitted-proof warnings and no other diagnostics. Its real-bodied specializations are `torsionColimit`, `coefficientLimit`, `coefficientLimitAction`, `ContinuousIntegralDual`, `continuousDualPrecomp` and `interiorSubmodule`. These use existing categorical limits, continuous linear maps and linear-map ranges. The continuous diagram-action, finite noetherian short-complex homology and compact closed-image milestones are statable at the pins. Small examples check final-functor reuse, exact colimits, inverse-action duality, torsion dual failure and range behavior.

These prototypes check the generic carrier interfaces used by the arithmetic plan. They do not create arithmetic towers from arbitrary module functions. The required level diagram, support system, continuous E/O dual and its topology, completed Λ object, admissible complex category, generic enhanced countable Rlim, continuous completed Tor, derived analytic-vector and canonical-model carriers are not at the pins. Their definitions, APIs, unit tests and end theorems remain in the layer prose above, in accordance with the current compact roadmap shape. The accepted CC.8 suggested file is reused separately and is not rewritten or imported to develop heavy data here.

## Downstream consumers

TC.2 receives the fixed-exponent topological/support object, then proves the perfectoid/automorphic-section comparison and vanishing. IHG receives the arithmetic action and supplies finite determinant/derived-image theory; completed inverse-limit residual localization has its single owner CC.8. R31 specializes to modular and Shimura curves and adds GL₂ local–global comparison. R30.2 specializes the general foundational Banach category. Fu and Marshall use the completed homological descent and uniform Iwasawa torsion bounds. BP uses the admissible–perfect anti-equivalence, completed tensor and specified involution. Nakamura uses the Borel–Moore and mixed coefficient-duality targets; LLHLM uses the degree-zero unitary tower and residual Pontryagin pairing. ALS consumes the completed support/descent interfaces while supplying only the finite-level geometry and early duality.

## References

All source matches and proof outlines above are in the roadmap’s own words. Author-draft pagination is explicitly distinguished from published pagination.

- **E06**: Matthew Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*. Author draft dated 2 January 2006, 71 pages; cite printed draft pages, not Inventiones pagination. [Public source](https://math.uchicago.edu/~emerton/pdffiles/interpolate.pdf), read 2026-10-13.
- **CE**: Frank Calegari and Matthew Emerton, *Completed cohomology — a survey*. Author survey PDF; printed pp.1–20. [Public source](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf), read 2026-10-13.
- **GN**: Toby Gee and James Newton, *Patching and the completed homology of locally symmetric spaces*. 57-page author PDF; printed pages. [Public source](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf), read 2026-10-13.
- **ST**: Peter Schneider and Jeremy Teitelbaum, *Banach space representations and Iwasawa theory*. arXiv:math/0005066 author preprint; published Israel J. Math.127 (2002),359–380; cite preprint pages. [Public source](https://arxiv.org/pdf/math/0005066), read 2026-10-13.
- **CEbounds**: Frank Calegari and Matthew Emerton, *Bounds for multiplicities of unitary representations of cohomological type in spaces of cusp forms*. Author version dated 29 February 2008; published Annals170 (2009),1437–1446; cite author pages. [Public source](https://math.uchicago.edu/~emerton/pdffiles/bounds.pdf), read 2026-10-13.
- **Marshall**: Simon Marshall, *Bounds for the multiplicities of cohomological automorphic forms on SL₂*. Annals175 (2012),1629–1651; published PDF. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf), read 2026-10-13.
- **Fu**: Weibo Fu, *Sharp bounds for multiplicities of Bianchi modular forms*. arXiv:2201.11190v2; printed preprint pages; Annals200 (2024). [Public source](https://arxiv.org/pdf/2201.11190v2), read 2026-10-13.
- **BP**: George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*. 65-page author PDF fetched 13 October 2026; cite its printed pages. [Public source](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), read 2026-10-13.
- **Nakamura**: Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*. arXiv:2006.13647 version fetched 13 October 2026; cite arXiv printed pages, not Inventiones234 pagination. [Public source](https://arxiv.org/pdf/2006.13647), read 2026-10-13.
- **LLHLM**: Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil’s lattice conjecture in dimension three*. Forum of Mathematics, Pi8 (2020),e5;135-page published PDF. [Public source](https://math.rice.edu/~bl70/LLHLMlattices.pdf), read 2026-10-13.
- **BCGP**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1; printed preprint pages. [Public source](https://arxiv.org/pdf/2502.20645v1), read 2026-10-13.
- **MilneSV**: James S. Milne, *Introduction to Shimura varieties*. Author revision 2017; printed pages. [Public source](https://www.jmilne.org/math/xnotes/svi.pdf), read 2026-10-13.
- **E11**: Matthew Emerton, *Local-global compatibility in the p-adic Langlands programme for GL₂/Q*. Author manuscript dated 23 March 2011, unpublished; no GL₂ local-global theorem imported as a generic theorem. [Public source](https://math.uchicago.edu/~emerton/pdffiles/lg.pdf), read 2026-10-13.
- **MilneEC**: James S. Milne, *Lectures on étale cohomology*. Version2.21,22March2013; printed pages. [Public source](https://www.jmilne.org/math/CourseNotes/LEC.pdf), read 2026-10-13.
- **Scholze**: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. Annals of Mathematics 182 (2015), 945–1066, published §4.2 numbering. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), read 2026-10-11.
- **Milne**: James S. Milne, *Lectures on Étale Cohomology*. Version 2.21, 22 March 2013. [Public source](https://www.jmilne.org/math/CourseNotes/LEC.pdf), read 2026-10-11.
