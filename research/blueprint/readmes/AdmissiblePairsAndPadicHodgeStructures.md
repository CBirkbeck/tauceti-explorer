# Roadmap: admissible pairs, p-adic Hodge structures and bi-analytic Ax–Lindemann

**Summary.** Build the neutral Tannakian theory of admissible pairs and p-adic Hodge structures, first over a complete algebraically closed field and then over locally spatial diamonds. The two lattices in their de Rham comparison give two period structures on one infinite-level moduli space. The main result identifies the opposite analytic closure of an irreducible analytic set with a special subvariety, subject to the empty-intersection convention in the general case. For minuscule type it gives the bi-analytic Ax–Lindemann theorem in the two rigid towers. A second end theorem gives Hodge–Tate period-image density without a basicness assumption. The construction also supplies the two-lattice CM criterion, neutral period domains for connected linear groups, and applications to variations and basic Shimura uniformizations.

## Scope and ownership

This roadmap owns bilattice goodness, neutral admissible pairs and neutral p-adic Hodge structures, their Tannakian groups, non-reductive extensions of the period-domain constructions, Hodge and Hodge–Tate line loci, and the two analytic structures used by Ax–Lindemann. Its final assertions are Howe–Klevdal II, arXiv v2, Theorem 9.1.3, p. 55, Theorem A, p. 6, and Theorem B, p. 11. The pointwise input is Howe–Klevdal I, especially Theorem 5.1.6, pp. 41–42, and Theorem B, pp. 5–6. All source descriptions below are mathematical paraphrases.

The current Tau Ceti roadmaps AdicSpaces and AlgebraicVectorBundles own the general fixed Fargues–Fontaine curve, bundles, tensor constructions and descent. RelativeFarguesFontaine owns their relative period sheaves, curves and patching. VectorBundlesAndIsocrystals owns full slope classification and constant-slope family theorems; BunGAndNewtonStrata owns reductive bundle strata. These are inputs here. General local Galois theory and rigid analytic Zariski geometry retain their existing owners. The classical HodgeStructures roadmap concerns a different category.

ReductiveGroups owns representations, Lie theory, Levi decompositions, subgroups and quotients. Its existing representation, subgroup, quotient and parabolic Levi targets are imported directly. The additional countable Chevalley-line, observable-subgroup, adjoint-kernel and equivariant Mostow refinements have the precise extension contracts below. AInfCohomology AI.2 owns Breuil–Kisin–Fargues modules, their valid operations including a separately rigidified abelian variant, and the finite-free Fargues classification. Its Part II extension supplies the remaining rational rigidification/modification equivalence. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 owns the different finite-height Breuil–Kisin category over W(k)[[u]]. AP2 compares the realizations once that input is supplied. The comparison is independent of the proof of Ax–Lindemann.

At the library pins, Mathlib already has `WittVector.Isocrystal` and its one-dimensional models and classification theorem. Tau Ceti already reconstructs the representation fibre functor of a concrete Hopf algebra. Those declarations are used directly. Full Dieudonné–Manin classification and abstract neutral Tannakian reconstruction require the distinct supplier contracts below. The more recent Tau Ceti files for Fargues–Fontaine windows and quotients do not supply admissible-pair families or their period domains.

## Conventions

Fix a prime p. A p-adic field is complete, discretely valued, of characteristic zero, with perfect residue field of characteristic p; it is strict when that residue field is algebraically closed. Thus Q_p-breve is strict, and a finite extension of Q_p-breve is permitted. C is a complete algebraically closed extension of Q_p. Write k_C for its residue field and choose the compatible embedding C0=W(k_C)[1/p] into C. C0bar, Q_p-bar and Q_p-breve-bar mean algebraic closures inside C, and a bar does not mean completion. This is the field convention of HK II §1.6, pp. 12–13, and HK I §5.4, pp. 43–45.

Groups are connected linear algebraic groups over Q_p unless a different coefficient field is specified. A subgroup datum includes its closed embedding and the element identifying its isocrystal with the ambient one. A G-object is an exact tensor functor out of finite-dimensional algebraic representations. Tensor functors are linear over their indicated field. Tensor-generated categories include subquotients. All small sites and categories are placed in fixed compatible universes; the existing Tau Ceti reconstruction is used with its prescribed universe lift. A family base is nonempty and locally spatial wherever a faithful fibre functor is asserted. Neutral families have the fixed rational datum in their definition; they are distinct from variations with étale monodromy.

For the abstract bilattice statements let R be a complete DVR, K its fraction field, k its residue field and t a uniformizer. For group and filtration statements in characteristic zero, fix a coefficient field in R, identify its image in the residue field, and make any necessary algebraically closed residue-field or cocharacter-splitting extension explicitly. A ramification-index-e extension multiplies elementary-divisor exponents by e. In the period setting use the invertible ideal Fil^1 B_dR+ intrinsically; a local generator ξ is used only in a local calculation. Fil^i B_dR denotes its i-th fractional power inside B_dR, including negative i.

The elementary divisors are defined by L2=⊕ R t^{a_j}e_j for an L1-basis. Therefore the first trace filtration has jumps −a_j. The two BB filtrations have opposite cocharacter types. The following rank-one calculation fixes every sign used in the build:

| Datum for the Tate object Q_p(n) | Value |
| --- | --- |
| Frobenius on its isocrystal | p^(−n)·σ |
| Isocrystal Newton slope | −n |
| Slope of the unmodified isocrystal bundle E(W) | n |
| Étale lattice in the isocrystal frame | Fil^n B_dR |
| De Rham lattice in the étale frame | Fil^(−n) B_dR |
| Hodge weight | −2n |

In general the Hodge weight is twice the isocrystal slope, while the isocrystal-to-bundle functor reverses slope. The pure weight-w modification has bundle slope −w/2. A basic vector admissible pair can have several isocrystal slopes, provided its lattice respects that grading. For a G-isocrystal, G-basicness requires the Newton homomorphism to be central in G. The centrality condition is retained in the G-Hodge invariant and represented-domain assertions. For example, a direct sum of two Tate objects is basic as a vector pair even though its diagonal Newton homomorphism need not be central in an artificially enlarged ambient GL group. See HK I Definition 4.2.1, pp. 32–33, Theorem 5.1.6, pp. 41–42, and HK II §6.2, pp. 36–37.

Write Gr_[mu] for the good cell of lattice type [mu]. Its first BB map lands in Fl_[mu^-1]. The admissible condition is [b]∈B(G,[mu^-1]). The Hodge domain X_[mu] sits in Gr_[mu^-1], and its flag is Fl_[mu]. Hodge specialness uses adjoint weights ≤1; Hodge–Tate specialness uses weights ≥−1. Specialness uses both. For a non-reductive group, minuscule means the two-sided adjoint-weight bound. A reductive group's symmetric root weights make the two one-sided conditions equivalent. For a general connected linear group they differ.

Analytic closures in AP11 are intersections of containing level pullbacks. The intersection of an empty family is the whole ambient space. In the non-minuscule case no finite-union or topology-closure property is added to that definition. “Bi-analytic” includes the irreducibility and locally closed conditions stated there; an arbitrary finite union of special subvarieties is not automatically one bi-analytic set in this sense.

The arbitrary-field type theorem in AP6 requires an independent full-rank de Rham criterion. The cited Liu–Zhu theorem is over a finite extension of Q_p; resolving the source addresses singularities but not that field restriction. The requested criterion below is an open mathematical input. AP6 type constancy and downstream uses of it are conditional on that input; fixed-type Grassmannian geometry cannot supply its own type hypothesis.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The declarations have the following scope.

- `mathlib:WittVector.Isocrystal` in `Mathlib/RingTheory/WittVector/Isocrystal.lean`: A module over Frac(W(k)) with a Frobenius-semilinear automorphism; higher-dimensional classification is not supplied.
- `mathlib:WittVector.StandardOneDimIsocrystal` in `Mathlib/RingTheory/WittVector/Isocrystal.lean`: The actual rank-one carrier with Frobenius p^m times coefficient Frobenius.
- `mathlib:WittVector.isocrystal_classification` in `Mathlib/RingTheory/WittVector/Isocrystal.lean`: Rank-one classification over an algebraically closed characteristic-p field, under finrank=1; not full Dieudonné–Manin.
- `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` in `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`: The natural group-functor isomorphism reconstructing a Hopf algebra’s points from its representation fibre functor, with the prescribed universe lift; not the abstract neutral-Tannakian equivalence.
- `mathlib:dense_iInter_of_isOpen` in `Mathlib/Topology/Baire/Lemmas.lean`: A countable intersection of dense open sets in a Baire space is dense; use the existing complete-pseudometrizable Baire instance from Topology/Baire/CompleteMetrizable.lean.
- `mathlib:nonempty_interior_of_iUnion_of_closed` in `Mathlib/Topology/Baire/Lemmas.lean`: A countable closed cover of a nonempty Baire space has a member with nonempty interior.

### Existing targets imported from other roadmaps

The following exact nodes supply planned mathematics, rather than baseline implementation. Each is consumed with the hypotheses in its supplier statement. In particular, the Hodge-type perfectoid tower and period map are over C, the fixed-Levi-type theorem does not prove type constancy, and the six-operation identities retain their eligibility conditions.

- `DiamondsAndVStacks:D1`: `DiamondsAndVStacks:D1/universally-open-std-cover`.
- `DiamondsAndVStacks:D2`: `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites`.
- `DiamondsAndVStacks:D4`: `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.
- `DiamondsAndVStacks:D5`: `DiamondsAndVStacks:D5/spatial-diamond`.
- `DiamondsAndVStacks:D6`: `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.
- `RelativeFarguesFontaine:RF2:untilts`: `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`, `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`, `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.
- `RelativeFarguesFontaine:RF4:vector-bundles`: `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`, `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`.
- `RelativeFarguesFontaine:RF4:G-torsors`: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`, `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.
- `VectorBundlesAndIsocrystals:VB0`: `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`.
- `VectorBundlesAndIsocrystals:VB1`: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.
- `VectorBundlesAndIsocrystals:VB2:classification`: `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`, `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`.
- `VectorBundlesAndIsocrystals:VB4`: `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`, `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.
- `BunGAndNewtonStrata:BG0`: `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`.
- `BunGAndNewtonStrata:BG1`: `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`, `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`, `BunGAndNewtonStrata:BG1/torus-norm-description`.
- `BunGAndNewtonStrata:BG2:uniformization`: `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`, `BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity`.
- `BunGAndNewtonStrata:BG3`: `BunGAndNewtonStrata:BG3/semistable-locus-and-basic-strata`, `BunGAndNewtonStrata:BG3/full-automorphism-v-group`.
- `GeometricSatakeAndFusion:GS0:loop-geometry`: `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness`: `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`.
- `PerfectoidQuotients:Q4`: `PerfectoidQuotients:Q4/completed-integral-closed-quotient`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.
- `HeckeStacksAndLocalShtukas:HS2`: `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`, `HeckeStacksAndLocalShtukas:HS2/classical-period-points`.
- `DiamondSixOperations:S3`: `DiamondSixOperations:S3/verdier-duality-lower-shriek`.
- `DiamondSixOperations:S4`: `DiamondSixOperations:S4/cohomologically-smooth`, `DiamondSixOperations:S4/smooth-twisted-pullback`.
- `AdicSpacesPartIIPartII:RZ.0`: `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`.
- `AdicSpacesPartIIPartII:RZ.1`: `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`, `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset`.
- `AdicSpacesPartIIPartII:RZ.2`: `AdicSpacesPartIIPartII:RZ.2/singular-stratification`, `AdicSpacesPartIIPartII:RZ.2/rank-loci`.
- `AdicSpacesPartIIPartII:RZ.3`: `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`, `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points`, `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure`.
- `AdicSpacesPartIIPartII:RZ.4`: `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point`, `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense`.
- `AdicSpacesPartIIPartII:RZ.5`: `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`.
- `AdicSpacesPartIIPartII:RZ.6`: `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`, `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem`, `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion`, `AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem`.
- `ReductiveGroupsPartII:RG2.0`: `ReductiveGroupsPartII:RG2.0/scheme-point-topology`, `ReductiveGroupsPartII:RG2.0/points-topological-group`, `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`, `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.
- `ReductiveGroupsPartII:RG2.1`: `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`: `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5`: `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`.
- `PerfectoidShimuraVarieties:S2`: `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`.
- `PadicHodgeTheory:P8:local-rational`: `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

Additional direct imports:

- `AInfCohomology:AI.2/bkf-module`.
- `AInfCohomology:AI.2/bkf-valid-operations`.
- `AInfCohomology:AI.2/fargues-classification`.
- `DiamondSixOperations:S2/lower-shriek-base-change`.
- `DiamondSixOperations:S2/projection-formula`.
- `DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`.
- `PadicHodgeTheory:R06.2/period-functors-perfect-residue-base`.
- `PerfectoidShimuraVarieties:S3/hodge-open-period-map`.
- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`.

ReductiveGroups layers 1–3 supply representations/comodules, faithful embeddings, Lie algebras, adjoint representations, subgroup schemes and fppf quotients with their representability hypotheses. Its layers 5 and 7 supply the unipotent radical and parabolic Levi decomposition. AdicSpaces and AlgebraicVectorBundles supply fixed-curve bundles, tensor constructions and descent. These current upstream targets remain with those owners.

### Required extensions

Only the following additional contracts are requested. Each describes the missing extension to its existing owner, and names its direct consumers.

- **`MotivesAndAlgebraicCycles:MC.6`.** Extend the existing neutral reconstruction and tensor-Isom torsor nodes to generated tensor subcategories, the subobject criterion for closed subgroup embeddings, and canonical reduction along the quotient tensor functor, compatibly with scalar extension and all tensor constructions. Consumed by `point_tannakian`, `point_groups`, `family_tannakian`, `family_groups`, `family_hs_tannakian`, `subgroup_admissible`.
- **`PadicHodgeTheory:R06.2`.** Extend the existing perfect-residue period-functor node and finite-base crystalline monodromy interface to Serre openness for a Hodge–Tate representation over every strict p-adic K in HK I 5.5.3, in its connected algebraic envelope; retain the strict-field hypothesis. Consumed by `crystalline_realization`, `open_galois_image`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.** Extend the existing finite-subcomodule and faithful-embedding targets to a countable exhaustion Q_p[G]=union V_i by finite-dimensional subrepresentations, with the exterior-power line-stabilizer consequence used for all closed subgroups. Import the representation/comodule dictionary and faithful embedding directly. Consumed by `good_point`, `exceptional`, `exceptional_countable`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.** Extend the existing Lie/adjoint and dimension targets by ker(Ad)=Z(G) for connected characteristic-zero G and the differential image/kernel formula for the orbit map used in AP11. Import Lie(G), Ad and subgroup Lie algebras directly. Consumed by `g_isocrystal`, `bb_bound`, `orbit_submersion`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.** Extend the existing subgroup, component and fppf-quotient targets by Chevalley line stabilizers and the observable embedding H→GL(V)×G_m used to control subgroup Grassmannians. Import reductive-quotient affineness with its existing hypotheses directly. Consumed by `point_groups`, `subgroup_gr`, `special_hs`, `subgroup_admissible`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.** Extend the existing unipotent-radical theory by the characteristic-zero Mostow Levi decomposition for arbitrary connected linear G and an M-equivariant central series of R_u(G) with vector-group successive quotients. Parabolic Levi decomposition in upstream layer 7 is imported and is not this arbitrary-group assertion. Consumed by `specialization`, `g_isocrystal`.
- **`PerfectoidShimuraVarieties:S3`.** In addition to the existing Hodge–Tate period-map nodes, supply basic Hodge-type uniformization over the completed maximal unramified reflex field, with its diagonal discrete arithmetic quotient and compatibility with both local period maps (Daniels–van Hoften–Kim–Zhang). The application remains conditional on this theorem. Consumed by `basic_shimura`.
- **`AInfCohomology:AI.2`.** Extend the existing BKF category, valid operations and finite-free Fargues classification to the rational rigidified category and its tensor equivalence with modifications (E1,E2,alpha,beta), with E1 trivial and beta a splitting of the slope grading. Preserve both realizations; the unrigidified lattice-pair equivalence is insufficient. Consumed by `bkf_comparison`.
- **`PadicHodgeTheory:P8:local-rational`.** For smooth rigid X over any complete discretely valued L/Q_p with perfect residue field, a finite-rank Q_p-local system T and a flat bundle E equipped with an unfiltered horizontal comparison T⊗OB_dR≅E⊗OB_dR admit, when E=ν_*(T⊗OB_dR) has full rank and the displayed comparison is invertible, a unique exhaustive locally split filtration satisfying Griffiths transversality and T⊗B_dR+≅M(E,Fil). It must commute with tensor operations and pullback. Prove this in the constant-flat E=W_L case needed here without importing admissible-pair type constancy. A finite-extension-of-Q_p one-point rigidity theorem does not meet this field scope. Consumed by `family_type`.
- **`IgusaVarietiesAndTorsionConcentration:IG.1`.** Extend the characteristic-p Igusa moduli to the ordinary elliptic Katz–Igusa formal tower and its generic fibre: trivialization of the unit-root rank-one crystalline datum in the matching Tate normalization, geometric connectedness of each full finite level, and surjective Z_p× monodromy on the connected ordinary modular component. Include comparison of its formal generic tower with the crystalline-frame torsor. Consumed by `igusa_boundary`.
- **`RelativeFarguesFontaine:RF4:vector-bundles`.** Extend the existing v-descent for completed positive-divisor bundles and isomorphisms after localization to finite projective modules over B_D=B_D+[1/I_D] itself: for an affine perfectoid untilt S and its degree-one divisor, evaluation identifies v-locally finite free B_D-sheaves on S_v with finite projective B_D(S)-modules. Include effective descent and compatibility with the positive-ring restriction and tensor operations; O-module descent and descent only of B_D-isomorphisms do not supply essential surjectivity for all B_D-modules. Consumed by `coefficient_local_system`.

The full-rank de Rham criterion above is an explicit proof gap. Associated filtered-bundle full faithfulness proves only the forward construction; a converse over the stated arbitrary fields remains to be verified. The rational rigidified BKF comparison is independent of the Ax–Lindemann proof. The ordinary Igusa contract concerns the mixed-characteristic formal tower and its generic fibre, beyond characteristic-p Igusa moduli. The basic Hodge-type application remains conditional on the stated uniformization theorem over the unramified base, followed by the perfectoid tower comparison over C.

## How to read the build

AP0 fixes two-lattice exactness, with specialization preceding its use in the exactness criterion. AP1 supplies connected-linear-group isocrystals and basic bundle strata; AP2 constructs pointwise Tannakian objects. AP3 supplies arithmetic openness and CM inputs. AP4 supplies relative lattices and filtered-flat-bundle comparison. AP5 establishes Grassmannian geometry with type hypotheses retained. AP6 constructs neutral admissible families and records the independent criterion for their rigid-base type theorem. AP7 constructs neutral Hodge families and their domains. AP8 describes line and subgroup loci. AP9 adds both frames and basic duality; only then is geometric connectedness of the Hodge domains deduced. AP10 supplies generic classical points. AP11 uses their Galois orbits and the rigid rank argument for the end theorems. AP12 treats variations and arithmetic quotient applications.

The companion [suggested Lean file](../suggested/AdmissiblePairsAndPadicHodgeStructures.lean) contains representative signatures whose carriers exist at the pins. Its `sigmaTwist`, adjoint-weight inequalities, Baire consequence and intersection statements record the conventions used here. Period sheaves, sites, moduli diamonds and end theorems retain their mathematical specifications below, pending their actual carriers.

## Layer AP0: Bilattices, trace filtrations and goodness

Define pointwise lattices and the two trace filtrations, their opposed types and Tate twists. Prove exactness criteria for goodness, adjoint-weight recovery and specialization dominance, retaining the additive-group counterexample.

### 0.1 Lattices and bilattices

Define `bilattice`. For a complete discrete valuation ring R with fraction field K, uniformizer t and residue field k, a lattice in a finite-dimensional K-space V is a finite free R-submodule spanning V. A bilattice is (V,L1,L2); morphisms are K-linear maps preserving both lattices. Define decreasing trace filtration trFil^i(L1/tL1)=image((t^i L2)∩L1→L1/tL1). The elementary-divisor type is the multiset of a_j with L2=⊕R t^{a_j}e_j for a basis of L1.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Definition 3.2.1 and Lemma 3.2.3, p. 24; §3.1, pp. 19–23.)

The interface consists of the following operations and laws.

- `bilattice.mk`: A pair of finite free spanning R-submodules of V determines a bilattice.
- `bilattice.trace`: trFil^i is the indicated image subspace of L1/tL1 and decreases with i.
- `bilattice.iso_type`: A bilattice isomorphism preserves elementary-divisor type. A complete-DVR extension of ramification index e multiplies every elementary divisor by e; in particular an index-one extension preserves type.
- `bilattice.swap`: Exchanging L1 and L2 negates the elementary-divisor multiset.

Use elementary divisors over the complete DVR. Define the intersection before taking its image; quotienting L2 alone gives the wrong trace filtration.

The consuming constructions use this interface as follows. HK II §3.1: Defines both Bialynicki–Birula filtrations and their relative types. AP5 Grassmannians: Records relative position of a modification.

**Checks.**

- For L1=R and L2=t^aR, trFil^i=k exactly when i≤−a; it is zero when i>−a.
- For L1=L2, the only filtration jump is zero and type consists of zeros. Under t=u^e the rank-one type a becomes e*a; invariance is asserted only for ramification index one.
- Over k((t)), L2=R e1+R(e2+t^-1e1) and L1=R^2 have type {−1,1}; the induced lattices on the subline k((t))e1 and quotient both have type {0}.

**Acceptance.** Checks distinguish the filtration from the lattice and are invariant under a change of uniformizer.

*Needs:* `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`; `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.

### 0.2 Good G-bilattices

Define `good_point`. For a connected linear algebraic G/k in characteristic zero and a bilatticed G(K)-torsor (an exact tensor functor Rep_k G→bilattices), call it good of type [mu] when, after trivializing the first lattice, the second lies in G(R)t^muG(R). Filtered G-functors are exact tensor functors to finite filtered k-spaces with locally split filtrations; their type is the conjugacy class giving the grading. A split cocharacter becomes available after the indicated scalar extension.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §3.2, Definition 3.2.5, pp. 23–25.)

The interface consists of the following operations and laws.

- `good_point.independent`: Goodness and [mu] are independent of a trivialization and of a splitting field.
- `good_point.representation`: A homomorphism G→H sends a good object of type [mu] to a good object of induced type.
- `good_point.bb_types`: For type [mu], BB1 has type [mu^-1] and BB2 has type [mu].
- `good_point.faithful`: The G-structure is retained as tensor data; an arbitrary faithful vector representation alone is not a definition of goodness.

Use the torsor/representation dictionary and descent for split filtrations. Form the cocharacter double coset, checking independence of trivialization.

The consuming constructions use this interface as follows. HK I Theorem 3.2.6: Relates actual group-valued relative position to exactness. HK II §§5–7: Defines fixed-type cells and family types.

**Checks.**

- The bilattice (K^n,R^n,t^muR^n) is good with exactly its declared cocharacter type.
- For G_a embedded unipotently in GL_2, the lattice with off-diagonal t^-1 is not good: G_a has only the zero cocharacter.
- For a split torus every bilattice is good, and type is its cocharacter tuple, without Weyl-group identifications beyond that torus.

**Acceptance.** Check the G_a lattice non-example and both opposing type conventions.

*Needs:* AP0 `bilattice` (Lattices and bilattices); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

### 0.3 Specialization dominance

Establish `specialization`. Write G=M⋉U over an algebraically closed characteristic-zero field. For a bilattice with Levi type [mu_M], let [mu] be its induced G-cocharacter class. In every representation rho, rho([mu]) is dominated by the actual vector-bilattice type, with equal determinant degree. Equality in one closed faithful representation is equivalent to goodness of type [mu]. This is a comparison of types, not semicontinuity of all non-reductive cells in families.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem 3.5.1, pp. 30–31.)

Conjugate the Levi lattice to standard form. Order unipotent weight factors and use exterior-power lattice bounds for dominance. Equality in a faithful representation forces the residual weight factors to be integral in the required coordinates.

**Acceptance.** In the G_a extension, the Levi type is (0,0) while the actual GL_2 type is (1,−1); this fixes the dominance orientation.

*Needs:* AP0 `good_point` (Good G-bilattices); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.

### 0.4 Exactness criterion for goodness

Establish `good_exact`. For a pointwise bilatticed G-torsor in characteristic zero, the following are equivalent: it is good; BB1 is an exact filtered G-functor; BB2 is an exact filtered G-functor. For good type [mu], these functors have types [mu^-1] and [mu]. The BB functors preserve tensor products and duals but are not exact on arbitrary bilattices.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem 3.2.6, p. 25, with proof on pp. 30–31 using Theorem 3.5.1.)

A good cocharacter double coset gives two split exact filtered tensor functors. Conversely split an exact trace filtration by a cocharacter and pass to the reductive Levi quotient. Use specialization dominance to compare the induced Levi type with every representation type. Exactness forces equality in a faithful representation, hence goodness. Exchange the two lattices to obtain the second criterion.

**Acceptance.** The G_a example fails exactness on its defining extension, rather than contradicting tensor compatibility.

*Needs:* AP0 `good_point` (Good G-bilattices); AP0 `specialization` (Specialization dominance).

### 0.5 Recovery from a filtration

Establish `lattice_recovery`. Let R be a complete characteristic-zero discrete valuation ring, with fraction field K, algebraically closed residue field C and uniformizer t, with its coefficient field embedded compatibly in R. For a connected linear group G and a cocharacter mu over an algebraically closed coefficient field, the pointwise BB map on the good type-[mu] cell is bijective if all Ad(mu)-weights are ≤1. For the second assertion, let a group Gamma act on R preserving its maximal ideal; assume C^Gamma lies in the coefficient field, G and [mu] are defined over C^Gamma, and Gamma preserves the line (C^Gamma)·t and acts on it by an infinite-order character. Then the Gamma-fixed part of this good cell is exactly the canonical lifts of the C^Gamma-rational flags. In particular this applies to B_dR and the Galois action of a discretely valued p-adic K0⊂C with infinite cyclotomic extension. The fixed-point assertion concerns the good cell, not arbitrary lattices.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Proposition 3.1.7 and Example 3.1.10, pp. 22–23.)

For the weight-bound statement compute positive-loop root coordinates and their truncation degrees. For Galois invariance apply the cyclotomic action on graded B_dR and eliminate negative non-invariant coefficients.

**Acceptance.** An adjoint weight ≥2 leaves a nontrivial BB fibre; the assertion is not made for all lattices without the Galois hypothesis.

*Needs:* AP0 `good_exact` (Exactness criterion for goodness); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`; `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.

### Examples

Take L1=R² and L2=R e1+R(e2+t^(−1)e1). The determinant valuation is zero, but the smallest entry valuation is −1, so the elementary divisors are −1 and 1. On the subline K e1 and the quotient K²/K e1 the induced lattice pairs both have type zero. At filtration index zero, the ambient trace image is k e1; its image in the quotient is zero, whereas the quotient's own trace filtration is k. This computes the failure of exactness on the unipotent extension. The G_a cocharacter is zero, so this bilattice is outside its good cell. (HK I Example 3.2.4, pp. 24–25, and Theorem 3.5.1, pp. 30–31.)

For L2=t^aR the condition t^(i+a)R∩R maps nontrivially to k precisely when i+a≤0. Swapping lattices negates a; replacing t by u^e multiplies it by e. Thus the trace jump is −a, and a ramified base change changes the normalization of type. The representative Lean statement `opposite_weight_bound` records the sign reversal of the associated one-sided bounds.

### Dependencies

- `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
- `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`.
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.


## Layer AP1: Non-reductive isocrystals and basic bundles

Extend G-isocrystals and B(G) along a Levi quotient, define basicness in G and the sigma-centralizer, and prove the basic-stratum theorem and basic twisting for Bun_G. Import the reductive theory; do not classify arbitrary non-reductive bundle strata.

### 1.1 G-isocrystals and basic classes

Define `g_isocrystal`. For connected linear G/Q_p, a G-isocrystal is an exact tensor functor Rep_Qp G→Isoc(Q_p-breve). Its isomorphism classes form B(G), equivalently sigma-conjugacy classes in G(Q_p-breve). Define its Newton homomorphism nu:D→G over Q_p-breve and call it basic when nu is central in G. Define B(G,[mu]) by the inverse image of B(M,[mu_M]) for the reductive Levi quotient M=G/R_uG.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §4.1 and Remark 4.1.1, p. 26.)

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §2.2.3, pp. 14–15.)

The interface consists of the following operations and laws.

- `g_isocrystal.from_b`: b defines the functor with Frobenius rho(b) sigma in every representation rho.
- `g_isocrystal.sigma_conjugacy`: b and b′ define isomorphic functors iff b′=g b sigma(g)^-1.
- `g_isocrystal.basic_ad`: b is basic iff the isocrystal Ad(b) is isoclinic of slope zero.
- `g_isocrystal.pushout`: A homomorphism sends G-isocrystals to H-isocrystals, with transported Newton grading; basicness is asserted only when the transported grading is central.

Use Steinberg for the reductive quotient and successive split vector-group quotients for the unipotent radical. Identify the representation functor of b with Frobenius rho(b) sigma. Obtain Newton grading representationwise from Dieudonné–Manin.

The consuming constructions use this interface as follows. AP2 point structures: Matches Hodge weights and admissible invariants. AP6 admissible loci: Labels the source bundle of modifications.

**Checks.**

- Every torus class is basic, although its Newton slope can be nonzero.
- For the upper triangular Borel of GL_2, diag(p,1) is basic in the diagonal Levi but not in the Borel: its adjoint unipotent direction has nonzero slope.
- The identity class is basic in any connected G; its representation functor has only slope zero.

**Acceptance.** Basicness must be tested in G, not merely its Levi quotient.

*Needs:* `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`; `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`; `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`; `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`; `BunGAndNewtonStrata:BG1/torus-norm-description`; `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`; `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `mathlib:WittVector.Isocrystal`; `mathlib:WittVector.StandardOneDimIsocrystal`; `mathlib:WittVector.isocrystal_classification`.

### 1.2 Levi invariance of B(G)

Establish `levi_B`. For a characteristic-zero connected linear group G with Levi M, B(M)→B(G) and B(G)→B(M) are inverse bijections; the induced B(G,[mu]) is independent of the Levi splitting. Basicness in G implies basicness in M, but the converse can fail and B(G,[mu]) need not contain a G-basic class.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §4.1 and Remark 4.1.1, p. 26.)

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §2.2.3, pp. 14–15.)

Use semisimplicity of isocrystals to split the unipotent filtration of each tensor functor. Compare two splittings by the unipotent conjugacy of Levis. Transport the reductive Kottwitz condition.

**Acceptance.** Do not reinstate the false v1 classification of all non-reductive bundles.

*Needs:* AP1 `g_isocrystal` (G-isocrystals and basic classes).

### 1.3 Sigma-centralizer and inner form

Construct `sigma_centralizer`. For a G-isocrystal W_b, construct the linear algebraic Q_p-group G_b=Aut^tensor(W_b); its Q_p-points are {g∈G(Q_p-breve):g b=b sigma(g)}. If b is G-basic, the Newton grading is central, G_b is an inner form of G, and its Q_p-breve-points identify with those of G with twisted Frobenius Int(b)∘sigma.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §4.1, equation (4.1.1.1), p. 26; §4.2, pp. 28–29.)

The interface consists of the following operations and laws.

- `sigma_centralizer.points`: G_b(Q_p) is exactly the indicated sigma-centralizer.
- `sigma_centralizer.conjugate`: Changing b by g b sigma(g)^-1 transports G_b by conjugation with g.
- `sigma_centralizer.basic_twist`: For basic b, descent on G(Q_p-breve) is sigma_b=Int(b)∘sigma.
- `sigma_centralizer.automorphisms`: For each coefficient algebra, points represent tensor automorphisms of W_b after scalar extension.

Represent the tensor automorphism functor using a tensor generator. Identify its rational points by Frobenius compatibility. In the basic case use centrality to descend the inner twist.

The consuming constructions use this interface as follows. AP1 basic strata: Identifies automorphisms of E_b. AP9 duality: Provides the second rational group action.

**Checks.**

- G_1=G, with untwisted descent.
- For an isoclinic simple GL_n-isocrystal, G_b(Q_p) is the multiplicative group of its endomorphism division algebra.
- For GL_2 and b=diag(p,1), the sigma-centralizer is not an inner form of GL_2; its reductive shape is the slope-preserving Levi.

**Acceptance.** The inner-form assertion has a basicness hypothesis.

*Needs:* AP1 `g_isocrystal` (G-isocrystals and basic classes); `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`; `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

### 1.4 Bundles for connected linear groups

Define `bun_linear`. For a characteristic-p perfectoid S, Bun_G(S) is the groupoid of exact tensor functors Rep_Qp G→Bun(FF_S), with tensor isomorphisms as arrows. Form its v-stack by effective bundle/torsor descent. A G-isocrystal b supplies E_b. The basic b-substack is the full substack whose geometric fibres have class [b]; its automorphism v-group is computed separately.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §4.2, pp. 26–27.)

The interface consists of the following operations and laws.

- `bun_linear.bundle_of_isocrystal`: The isocrystal-to-bundle functor applied representationwise produces E_b.
- `bun_linear.base_change`: Bun_G and E_b commute with perfectoid base change.
- `bun_linear.levi_map`: G→M induces Bun_G→Bun_M.
- `bun_linear.automorphisms`: The automorphism sheaf is tensor automorphisms of E_b, not defined to be the constant group G_b(Q_p).

Extend the reductive torsor dictionary along vector-group successive quotients. Apply effective descent representationwise, preserving tensor exactness. Define geometric fibre conditions without assuming that B(G) classifies all bundles.

The consuming constructions use this interface as follows. AP1 basic_strata: Identifies precisely the locus where the automorphism sheaf is constant. AP6 admissibility: Tests whether a modified bundle lies in the trivial stratum.

**Checks.**

- Bun_1 is terminal.
- For reductive G this is the imported BG2 stack, with its tensor/torsor comparison.
- For a Borel, bundles can have nontrivial negative-degree unipotent extensions; their classification is not obtained from the bijection B(G)≅B(M).

**Acceptance.** Nonbasic bundle forms and automorphism kernels are not discarded.

*Needs:* AP1 `g_isocrystal` (G-isocrystals and basic classes); `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`; `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`; `BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity`.

### 1.5 Basic-stratum theorem

Establish `basic_strata`. For connected linear G and a G-basic b, Aut(E_b)=the constant v-group G_b(Q_p), and [*/G_b(Q_p)]→Bun_G is an open immersion with image Bun_G^[b]. Moreover Bun_G^[b]=Bun_G×_{Bun_M}Bun_M^[b_M]. In particular the trivial stratum is the inverse image of the trivial Levi stratum. The assertion is not extended to arbitrary nonbasic b.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 4.2.2, pp. 27–28.)

Twist the vector-group quotients of U by E_b. Basicness makes their isocrystals slope zero. Kill their H^1 locally in the pro-étale topology and identify automorphisms by H^0. Induct through the derived series and use openness of the reductive basic stratum.

**Acceptance.** The Borel example at nonbasic b must fail the claimed extension.

*Needs:* AP1 `bun_linear` (Bundles for connected linear groups); AP1 `sigma_centralizer` (Sigma-centralizer and inner form); AP1 `levi_B` (Levi invariance of B(G)); `BunGAndNewtonStrata:BG3/semistable-locus-and-basic-strata`; `BunGAndNewtonStrata:BG3/full-automorphism-v-group`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.

### 1.6 Basic twisting of bundle stacks

Construct `basic_twisting`. For basic b define F_b(E)=Isom^tensor(E_b,E), a G_b-bundle, giving an equivalence Bun_G≃Bun_{G_b}. It sends E_b to E_1 and E_1 to E_{b^-1}, where b^-1 is interpreted in G_b(Q_p-breve) with sigma_b. Transfer modifications by twisting their two bundles and their isomorphism away from the divisor.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §4.2 and Lemma 4.2.3, pp. 28–29.)

The interface consists of the following operations and laws.

- `basic_twisting.equivalence`: Twisting back by the inverse bitorsor is quasi-inverse to F_b.
- `basic_twisting.source_bundle`: F_b(E_b)≅E_1.
- `basic_twisting.trivial_bundle`: F_b(E_1)≅E_{b^-1} for sigma_b.
- `basic_twisting.modification`: F_b carries an isomorphism off the untilt divisor to the corresponding twisted isomorphism.

Use tensor-Isom torsors for the inner twist. Check the two distinguished bundles using sigma_b. Apply patching to the twisted modification.

The consuming constructions use this interface as follows. AP9 basic_duality: Invert and twist a modification to exchange its two period maps.

**Checks.**

- F_1 is naturally the identity equivalence.
- For G_m and b=p^n, twisting subtracts n from isocrystal slopes.
- Twisting by b and then the inverse inner-twist datum recovers each original bundle and modification.

**Acceptance.** Check that inversion changes the Frobenius as well as the element.

*Needs:* AP1 `basic_strata` (Basic-stratum theorem); `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`; `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.

### Examples

For the upper triangular Borel H of GL_2, the diagonal b=diag(p,1) has a basic class in its diagonal Levi, since every torus class is basic. On Lie R_uH, however, its adjoint Frobenius has a nonzero slope. Consequently it is not H-basic. This is the witness that the bijection B(H)≅B(M) does not identify their basic subsets or classify all H-bundles. At b=1 the unipotent slope is zero, so the pro-étale H¹-vanishing gives the trivial basic stratum. (HK II §4.1 and Theorem 4.2.2, pp. 26–28.)

The inner twist is σ_b(x)=bσ(x)b^(−1). Hence b^(−1)σ_b(x)=σ(x)b^(−1). The same identity changes the inverse modification's Frobenius frame. The suggested file's `sigmaTwist`, `sigma_conjugacy_change` and `inverse_twist_identity` fix the order; its unit and commutative-group examples check that trivial and torus twists reduce to σ.

### Dependencies

- `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`.
- `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`.
- `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`.
- `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.
- `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`.
- `BunGAndNewtonStrata:BG1/torus-norm-description`.
- `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.
- `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`.
- `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.
- `mathlib:WittVector.Isocrystal`.
- `mathlib:WittVector.StandardOneDimIsocrystal`.
- `mathlib:WittVector.isocrystal_classification`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.
- `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.
- `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`.
- `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.
- `BunGAndNewtonStrata:BG2:uniformization/bun-g-as-v-stack`.
- `BunGAndNewtonStrata:BG2:uniformization/beauville-laszlo-surjectivity`.
- `BunGAndNewtonStrata:BG3/semistable-locus-and-basic-strata`.
- `BunGAndNewtonStrata:BG3/full-automorphism-v-group`.
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.
- `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.


## Layer AP2: Pointwise Hodge structures and admissible pairs

Construct pointwise p-adic Hodge structures and admissible pairs, prove neutral Tannakian and connectedness theorems, identify basic pairs with Hodge structures, and construct realizations, Mumford–Tate and motivic Galois groups, and prescribed invariants.

### 2.1 Pointwise p-adic Hodge structures

Define `point_hs`. For algebraically closed complete C/Q_p, a pure p-adic Hodge structure of weight w∈Q is a finite-dimensional Q_p-space V and B_dR+-lattice L⊂V⊗B_dR whose modification of the trivial bundle is semistable of slope −w/2 (equivalently a sum of O(−w/2)). A general object is a finite Q-graded collection of pure objects; arrows preserve grading and lattice. Adopt HK’s modification orientation so Q_p(n), with lattice Fil^-n B_dR, has weight −2n.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §4.2, Definition 4.2.1, pp. 32–33.)

The interface consists of the following operations and laws.

- `point_hs.weight`: The weight-w summand modifies to a semistable bundle of slope −w/2.
- `point_hs.tate`: Q_p(n) has lattice Fil^-n and weight −2n.
- `point_hs.tensor_dual`: Tensor weights add, dual weights negate, and the underlying Q_p-space forgetful functor preserves both.
- `point_hs.morphism`: Morphisms are graded Q_p-linear maps preserving the B_dR+-lattices.

Build the modified bundle using imported patching. Impose its stated slope on each graded piece. Define tensor and dual by weight addition and negation, using the bundle slope calculus.

The consuming constructions use this interface as follows. HK II §6: Defines the geometric fibres of neutral Hodge structures. AP2 basic_equivalence: Matches basic isocrystal gradings with weights.

**Checks.**

- Q_p(1) has weight −2 and lattice Fil^-1, while its dual has weight 2 and lattice Fil^1.
- The zero space with its zero lattice is the zero object in every weight and in the graded category.
- A modification with two distinct bundle slopes is not pure, even if its rank and total degree have the expected average.

**Acceptance.** Audit the slope sign against the Tate example before implementing any comparison.

*Needs:* AP0 `bilattice` (Lattices and bilattices); `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`; `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`; `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`; `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`; `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`.

### 2.2 Pointwise admissible pairs

Define `point_adm`. An admissible pair over C is a finite-dimensional isocrystal W/Q_p-breve together with a B_dR+-lattice L_et⊂W⊗B_dR such that the modified bundle E(W)_{L_et} is semistable of slope zero. It is basic when L_et respects the isocrystal slope grading of W. Morphisms are isocrystal maps preserving L_et. Define V_et=H^0(E(W)_{L_et}), the comparison c_dR:V_et⊗B_dR≅W⊗B_dR, and L_dR=c_dR^-1(W⊗B_dR+).

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §5.1, Definition 5.1.1 and equations (5.1.1.1)–(5.1.1.2), pp. 39–40.)

The interface consists of the following operations and laws.

- `point_adm.etale`: V_et is finite dimensional and V_et⊗O_FF→E(W)_{L_et} is an isomorphism.
- `point_adm.comparison`: c_dR identifies V_et⊗B_dR+ with L_et.
- `point_adm.de_rham`: The de Rham lattice is c_dR^-1(W⊗B_dR+).
- `point_adm.basic`: Basicness is compatibility of L_et with the entire slope grading, rather than isoclinicity of W.

Patch the original isocrystal bundle using L_et. Slope-zero classification trivializes the modification and yields the comparison via evaluation. Pull back the standard de Rham lattice.

The consuming constructions use this interface as follows. AP3 good reduction: Recognizes pairs defined by filtered isocrystals. HK II §7: Defines geometric fibres of families and both realizations.

**Checks.**

- W=Q_p-breve with Frobenius sigma and L_et=B_dR+ is the trivial pair; both lattices coincide.
- A modification O(1)⊕O(−1) has degree zero but does not define an admissible pair.
- The Tate pair corresponding to Q_p(n) has isocrystal slope −n, and its transported L_dR is Fil^-n in the chosen étale basis.

**Acceptance.** Admissible means slope zero of the modified bundle, not merely its degree.

*Needs:* AP1 `g_isocrystal` (G-isocrystals and basic classes); `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`; `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`; `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`; `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`; `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`.

### 2.3 Pointwise Tannakian theorems

Establish `point_tannakian`. HS(C) and AdmPair(C) are Q_p-linear neutral Tannakian categories under the underlying V and V_et fibre functors. Their Tannakian fundamental groups are connected. The isocrystal fibre functor on admissible pairs is exact and faithful after extension to Q_p-breve. The full basic subcategory is tensor stable.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Lemmas 4.3.1–4.3.2 and Theorem 4.3.5, pp. 34–36; Theorem 5.1.6, pp. 40–42.)

Compute saturated kernels and images in a fixed slope using degree inequalities. Prove exactness and End(1)=Q_p, then apply neutral reconstruction. Show an object with finite tensor monodromy is trivial, using the modification and the constant isocrystal, so the group has no nontrivial finite quotient.

**Acceptance.** Do not infer connectedness from neutrality alone.

*Needs:* AP2 `point_hs` (Pointwise p-adic Hodge structures); AP2 `point_adm` (Pointwise admissible pairs); `MotivesAndAlgebraicCycles:MC.6`; `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`; `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`; `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`; `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.

### 2.4 Basic pairs and Hodge structures

Construct `basic_equivalence`. Étale realization gives a tensor equivalence between basic admissible pairs and Q-graded p-adic Hodge structures. The slope-nu piece of W corresponds to the weight-2nu piece of V_et with L_dR. Inverse construction recovers the slope-graded isocrystal from the modified pure bundles, together with L_et.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem 5.1.6 and proof, pp. 41–42; Definition 4.2.1, pp. 32–33.)

The interface consists of the following operations and laws.

- `basic_equivalence.forward`: A basic pair maps to (V_et,L_dR) with weight 2nu on its slope-nu summand.
- `basic_equivalence.inverse`: A graded Hodge structure supplies the unique slope-graded basic pair up to canonical isomorphism.
- `basic_equivalence.unit_counit`: Both composites are tensor naturally isomorphic to the identity.
- `basic_equivalence.tate`: The slope −n Tate isocrystal maps to Q_p(n) of weight −2n.

Use the slope grading respected by L_et to grade the étale realization. Apply the pure bundle classification on each graded summand and invert the comparison. Check tensor, dual, and the Tate convention.

The consuming constructions use this interface as follows. AP7 Hodge domains: Transfers the admissible moduli description to Hodge structures. AP9 basic_duality: Relates motivic and Mumford–Tate groups.

**Checks.**

- The trivial pair goes to weight zero Q_p with standard lattice.
- The direct sum of slope 0 and slope −1 basic Tate pairs becomes weights 0 and −2, not a pure object of average weight.
- A pair whose L_et mixes its isocrystal slope summands does not enter this equivalence’s basic subcategory.

**Acceptance.** The weight is twice the isocrystal slope; the bundle functor reverses that slope.

*Needs:* AP2 `point_tannakian` (Pointwise Tannakian theorems).

### 2.5 Mumford–Tate and motivic Galois groups

Construct `point_groups`. For a G-object in HS(C) or AdmPair(C), choose its indicated fibre trivialization and define MT or MG as tensor automorphisms of the fibre functor on the full tensor subcategory generated by the object, including subquotients. This is a closed connected subgroup of G. Construct its canonical reduction of structure group and characterize it by all tensor constructions and their Hodge/Tate lines, including nontrivial characters; weight-zero tensors alone need not suffice.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §4.4, pp. 36–37; Theorems 4.5.1 and 5.3.1, pp. 38, 43.)

The interface consists of the following operations and laws.

- `point_groups.closed_embedding`: The group embeds as a closed subgroup of G and is unchanged by replacing a tensor generator.
- `point_groups.line_criterion`: A subgroup supports the object iff all its defining Chevalley lines become Hodge/Tate lines of the required weights.
- `point_groups.reduction`: After a compatible fibre identification, the canonical group is contained in every subgroup supporting a reduction; extension of that canonical reduction gives the original G-object.
- `point_groups.basic`: Under the basic-pair equivalence MG identifies with MT via the same étale fibre functor.

Restrict the fibre functor to the generated tensor subcategory. Apply reconstruction and the Chevalley line criterion. Form the reduction via the tensor-isomorphism torsor and transport the chosen fibre trivialization.

The consuming constructions use this interface as follows. AP6 family_groups: Extends the group and reduction to connected families. AP10 generic locus: Detects failure of full motivic Galois group by Hodge lines.

**Checks.**

- The group of a sum of unit objects is trivial.
- A nonzero Tate generator has group G_m, detected by its nonzero weight rather than only invariant vectors.
- The criterion must admit a nonreductive connected group; replacing line stabilizers with only weight-zero vector stabilizers can lose it.

**Acceptance.** The reduction is minimal among subgroups supporting the full object, not only its individual representation fibres.

*Needs:* AP2 `point_tannakian` (Pointwise Tannakian theorems); `MotivesAndAlgebraicCycles:MC.6`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

### 2.6 Invariants and existence

Establish `point_invariants`. For a good G-Hodge structure of type [mu] whose weight homomorphism is central in G (in particular after reduction to its Mumford–Tate group), its associated G-isocrystal is the unique basic class in B(G,[mu^-1]); its Newton homomorphism is half the weight homomorphism. For a good G-admissible pair the type and isocrystal class satisfy [b]∈B(G,[mu^-1]). Conversely every [b] in this set admits a G-admissible pair of that type over C, and one defined by a filtration over a suitable finite extension of Q_p-breve([mu]). A G-basic class must exist for the Hodge-structure assertion.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorems 4.4.4, 5.2.4, pp. 37, 43; Example 5.4.6, p. 45.)

Read the Newton homomorphism from the weight grading. Use the reductive admissibility condition and Levi reduction for necessity. Use imported reductive rigid-point existence and lift along the unipotent filtration; at the resulting finite field of definition the Galois-fixed good lattice is the canonical lift of its rational trace flag by AP0 lattice_recovery.

**Acceptance.** Keep [mu^-1] in B(G,−), rather than silently reversing the lattice convention.

*Needs:* AP0 `good_exact` (Exactness criterion for goodness); AP1 `g_isocrystal` (G-isocrystals and basic classes); AP2 `basic_equivalence` (Basic pairs and Hodge structures); `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`; `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`; `BunGAndNewtonStrata:BG1/torus-norm-description`; `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`; `HeckeStacksAndLocalShtukas:HS2/classical-period-points`; AP0 `lattice_recovery` (Recovery from a filtration).

### 2.7 Rigidified BKF comparison

Compare `bkf_comparison`. The category AdmPair(C) is tensor equivalent to the isogeny category of rigidified Breuil–Kisin–Fargues modules. Under the imported modification description, (W,L_et) maps to (E(W)_{L_et},E(W),alpha_can,beta_can), with first bundle trivial, alpha the identification away from infinity and beta the splitting of the slope grading of E(W).

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem 5.1.6 and proof, pp. 41–42.)

Import the rigidified-module/modification equivalence from its owner. Use classification of the second bundle with its splitting to recover W. Recover L_et from the first, trivialized modification and check the two composites.

**Acceptance.** Rigidification is retained: deleting beta changes the category.

*Needs:* AP2 `point_tannakian` (Pointwise Tannakian theorems); `AInfCohomology:AI.2/bkf-module`; `AInfCohomology:AI.2/bkf-valid-operations`; `AInfCohomology:AI.2/fargues-classification`; `AInfCohomology:AI.2`.

### Examples

Set n=1 in the Tate table. W has Frobenius p^(−1)σ, E(W) has slope 1, and L_et=Fil^1 modifies that bundle to slope zero. Transporting W⊗B_dR+ through the comparison yields L_dR=Fil^(−1). The corresponding Hodge structure therefore has weight −2. The direct sum with the unit pair has two weights, 0 and −2, and is basic but not pure. This checks the direction of the basic-pair equivalence and its compatibility with the existing `WittVector.StandardOneDimIsocrystal`. (HK I Definition 4.2.1 and Theorem 5.1.6.)

A rank-two modification O(1)⊕O(−1) has total degree zero and fails admissibility. A nonzero Tate generator has Tannakian group G_m, whereas a sum of unit generators has trivial group: testing only weight-zero invariant vectors cannot distinguish all required character data. The rigidified BKF comparison keeps the splitting β of the slope grading; deleting it changes the input category.

### Dependencies

- AP0.
- `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`.
- `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`.
- `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`.
- `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`.
- `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`.
- AP1.
- `MotivesAndAlgebraicCycles:MC.6`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.
- `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.
- `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.
- `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`.
- `BunGAndNewtonStrata:BG1/torus-norm-description`.
- `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`.
- `HeckeStacksAndLocalShtukas:HS2/classical-period-points`.
- `AInfCohomology:AI.2/bkf-module`.
- `AInfCohomology:AI.2/bkf-valid-operations`.
- `AInfCohomology:AI.2/fargues-classification`.
- `AInfCohomology:AI.2`.


## Layer AP3: Good reduction, Galois images and CM points

Define filtration-defined good reduction and C0-analytic pairs; prove goodness, the crystalline realization theorem, openness in the motivic Galois group and the two-lattice CM criterion, with the slope-filtered nonbasic refinement.

### 3.1 Good reduction and analytic lattices

Define `good_reduction`. Let C0=W(k_C)[1/p] inside C and let C0bar denote its algebraic closure inside C. An admissible pair has good reduction over a strict p-adic K⊂C if its lattice is the canonical lattice sum_i Fil^i B_dR·F^-i(W_K) of a K-filtration. Call a pair C0bar-analytic if it has good reduction over some finite K/C0. For a lattice in V⊗B_dR, analytic over a subfield means that it is the canonical lattice of a filtration over that subfield, with its specified rational structure. CM means that its connected MT/MG group is a torus.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, §5.4, Definition 5.4.1, pp. 43–44, and Theorem 5.4.4, pp. 44–45; §5.7, pp. 49–50.)

The interface consists of the following operations and laws.

- `good_reduction.canonical`: The finite sum of Fil^i B_dR times F^-i W_K is a full B_dR+-lattice.
- `good_reduction.trace`: Its trace Hodge filtration is F on W_K after extension to C.
- `good_reduction.extension`: Good reduction is preserved by finite extension of the strict field of definition.
- `good_reduction.analytic_good`: A C0bar-analytic G-admissible pair is good of its filtration type.

Construct the canonical lattice from a finite filtration. Keep W_K and V_K as distinct rational structures. Check descent and scalar extension using the trace-filtration splitting.

The consuming constructions use this interface as follows. AP3 crystalline_realization: Supplies the Galois-stable lattice. AP11 orbit_submersion: Uses openness at a classical point after making its residue field strict.

**Checks.**

- Every Tate pair is filtration-defined over Q_p-breve with its correct integral jump.
- Among extensions of the unit pair by itself parametrized by B_dR/B_dR+, only the zero extension is C0bar-analytic.
- Being analytic for L_et relative to W does not by itself imply that L_dR is analytic relative to V_et.

**Acceptance.** Analyticity is stronger than coordinates of a reduced flag alone for an arbitrary non-good lattice.

*Needs:* AP2 `point_adm` (Pointwise admissible pairs); AP2 `point_groups` (Mumford–Tate and motivic Galois groups); AP0 `lattice_recovery` (Recovery from a filtration).

### 3.2 Crystalline realization of good reduction

Establish `crystalline_realization`. For strict p-adic K and C=completed algebraic closure of K, étale realization lifts to a fully faithful tensor functor AdmPair_good-red(K)→Rep_Qp Gal(Kbar/K). Its essential image is contained in the crystalline representations and is stable under subobjects. The B_cris invariants recover the filtered isocrystal and the B_dR comparison recovers the lattice. No non-strict-field version is asserted here.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem 5.5.1, pp. 45–46.)

Use the Galois-stability of the canonical lattice to act on H^0 of the modification. Take B_cris invariants, recover W by slope classification over the strict field and recover L_et by the comparison. Apply dimension inequalities to a stable subspace and its quotient.

**Acceptance.** Full faithfulness and subobject stability both enter the identification of the algebraic Galois envelope.

*Needs:* AP3 `good_reduction` (Good reduction and analytic lattices); AP2 `point_tannakian` (Pointwise Tannakian theorems); `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.2/period-functors-perfect-residue-base`.

### 3.3 Open Galois image

Establish `open_galois_image`. For a G-admissible pair with good reduction over a strict p-adic field K and a chosen étale fibre trivialization, the continuous Galois representation has image open in MG(Q_p). Its Zariski closure equals MG. For a classical point initially defined over a non-strict discretely valued field F, base change to the completion of its maximal unramified extension F′; the restricted inertia image is open in the same geometric MG and supplies an open subgroup orbit contained in the original Galois orbit.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Corollary 5.5.3, pp. 46–47; HK II proof of Theorem 9.1.3, pp. 57–58.)

Identify the algebraic Galois envelope using full faithfulness and subobjects. Apply Serre’s Hodge–Tate openness criterion in that envelope. For F′ retain the same geometric pair and MG, then use inclusion of its Galois group into the original decomposition group.

**Acceptance.** Use containment of an open subgroup orbit, not equality with the entire Galois orbit.

*Needs:* AP3 `crystalline_realization` (Crystalline realization of good reduction); AP2 `point_groups` (Mumford–Tate and motivic Galois groups); `PadicHodgeTheory:R06.2`; `ReductiveGroupsPartII:RG2.0/scheme-point-topology`; `ReductiveGroupsPartII:RG2.0/points-topological-group`; `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`; `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`; `PadicHodgeTheory:R06.2/period-functors-perfect-residue-base`.

### 3.4 Two-lattice CM criterion

Establish `cm_transcendence`. Write C0=W(k_C)[1/p] and let C0bar be its algebraic closure inside C. For a basic admissible pair over C, having both its étale lattice (relative to W) and its de Rham lattice (relative to V_et) defined by filtrations over finite extensions of C0 is equivalent to having CM. In the CM case the étale lattice can be defined over Q_p-breve-bar and the de Rham lattice over Q_p-bar. Equivalently a good-reduction p-adic Hodge structure has C0bar-analytic de Rham lattice exactly when it has CM. For a C0bar-analytic admissible pair without basicness, if its de Rham lattice is also C0bar-analytic, the slope filtration lifts to subpairs and its graded subpairs have CM; the original extension need not split or have CM.

([Sean Howe and Christian Klevdal — Part I](https://arxiv.org/pdf/2308.11065v2), arXiv v2, Theorem B and Corollary C, pp. 5–6; §6.2, pp. 52–54; Theorem 6.3.2, pp. 54–55; Proposition 5.7.1, p. 49.)

Reduce the CM direction to a torus; its flag varieties are points, so the character/cocharacter lattice description makes both filtrations algebraic over the stated smaller fields. For the converse the algebraic filtration has an open MG orbit fixed by its field of definition, forcing central cocharacters and then a torus. In the nonbasic case use the lifted slope filtration and apply the basic statement to each graded part.

**Acceptance.** The nonbasic refinement yields CM graded pieces, not a semisimplicity or splitting assertion.

*Needs:* AP3 `good_reduction` (Good reduction and analytic lattices); AP3 `open_galois_image` (Open Galois image); AP2 `basic_equivalence` (Basic pairs and Hodge structures); AP2 `point_groups` (Mumford–Tate and motivic Galois groups).

### Examples

The unit and every Tate pair have canonical lattices over Q_p-breve. In contrast, an extension of the unit by itself with nonzero parameter in B_dR/B_dR+ has the unipotent off-diagonal bilattice from AP0 and cannot be filtration-defined over C0bar: its G_a type would have to be zero and good. Thus analyticity of the flag alone cannot replace analyticity of the lattice. (HK I §5.4, Theorem 5.4.4 and Example 5.4.5, pp. 44–45.)

For a CM object reduce its structure group to its torus. A torus flag variety for a specified cocharacter is a point, so the étale flag descends over a finite extension of Q_p-breve and the de Rham flag over a finite extension of Q_p. This proves the CM direction without a classification of all CM objects. The converse uses the open motivic Galois image and the field of definition of the other filtration. In a nonbasic object the argument applies to the slope-graded pieces and does not split the extension. (HK I Proposition 5.7.1, p. 49, and §6.2–Theorem 6.3.2, pp. 52–55.)

### Dependencies

- AP2.
- AP0.
- `PadicHodgeTheory:R06.2`.
- `PadicHodgeTheory:R06.2/period-functors-perfect-residue-base`.
- `ReductiveGroupsPartII:RG2.0/scheme-point-topology`.
- `ReductiveGroupsPartII:RG2.0/points-topological-group`.
- `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`.
- `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.


## Layer AP4: Relative local systems and trace filtrations

Define rigid analytic subdiamonds, coefficient and G-local systems, integral loci, latticed and bilatticed families, types and goodness. Establish the relative trace-exactness theorem and the smooth rigid filtered-flat-bundle comparison including its essential-image descent.

### 4.1 Rigid analytic subdiamonds

Define `rigid_subdiamond`. Fix a complete nonarchimedean field L. Use the rigid analytic points supplied by RZ.3 (finite-extension-valued points over L). A rigid analytic diamond is one isomorphic over Spd L to S^diamond for a seminormal rigid analytic L-variety S. A rigid analytic subdiamond is a locally closed subdiamond represented in this way; a closed rigid analytic subdiamond also has closed immersion into the ambient diamond. These notions retain the field of definition.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 2.2.1 and Lemma 2.2.3, pp. 15–16.)

The interface consists of the following operations and laws.

- `rigid_subdiamond.diamondify`: A seminormal rigid variety and its locally closed rigid subspaces supply rigid analytic diamonds and subdiamonds.
- `rigid_subdiamond.field_change`: Finite field extension transports a rigid analytic point and all represented subdiamonds.
- `rigid_subdiamond.closed_subset`: A closed rigid analytic subdiamond of S^diamond gives a Zariski closed subset of S.
- `rigid_subdiamond.full_faithful`: Morphisms between represented seminormal rigid diamonds over Spd L are the unique corresponding rigid morphisms.

Use seminormal full faithfulness to transport rigid morphisms and closed subspaces. Compare underlying spaces using diamondification.

The consuming constructions use this interface as follows. AP5 rigid_cells: Makes the BB comparison a statement about actual rigid maps. AP11 closures: Specifies the subobjects used in analytic closure intersections.

**Checks.**

- The diamond of a rigid disc is rigid analytic, and a finite-extension-valued closed point is a rigid analytic point.
- A general geometric C-point with transcendental coordinate in a disc is not automatically a rigid analytic point over L.
- The definition uses the seminormal representative; equality of underlying topological spaces alone is not a criterion for isomorphism.

**Acceptance.** Do not identify every geometric point with a rigid analytic point.

*Needs:* `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`; `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`; `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`; `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points`; `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure`; `DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond`.

### 4.2 Coefficient and group local systems

Define `coefficient_local_system`. For a locally spatial diamond Y, a Λ-local system (Λ a complete Huber ring) is a sheaf on Y_v which is v-locally finite free over the sheaf of continuous Λ-valued functions. For B=O, B_dR+ or B_dR use finite locally free sheaves of B-modules on Y_v. For a complete Huber Q_p-algebra Λ, a G-local system is an exact tensor functor Rep_Qp G→Loc_Λ(Y), equivalently its v-local tensor-frame torsor. An O-local system is an analytic vector bundle exactly when it is étale-locally trivial as an O-local system; every O-local system on a perfectoid space has this property, whereas a general rigid variety has additional O-local systems. The pro-étale description of Q_p-local systems is used only under its proved comparison hypotheses.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §2.3, pp. 16–18, Definition 2.3.4 and Remark 2.3.5; §2.4, p. 18.)

The interface consists of the following operations and laws.

- `coefficient_local_system.pullback`: Pullback preserves these local systems and tensor operations.
- `coefficient_local_system.affinoid`: On an affinoid perfectoid S, B-local systems identify with finite projective B(S)-modules for B=O, B_dR+ or B_dR. The B_dR case requires the localized-period module-descent extension specified below.
- `coefficient_local_system.torsor`: G(Lambda)-torsors recover the constant-coefficient tensor functors by associated representations.
- `coefficient_local_system.O_bundle`: On a perfectoid space O-local systems are vector bundles. On a rigid variety the essential image of analytic vector bundles consists exactly of the étale-trivializable O-local systems.

Use v-descent for finite projective modules and continuous coefficient functions. Construct tensor frames v-locally and apply the tensor-isomorphism torsor theorem. For Q_p use the stated pro-étale comparison; for O use the étale-trivializability criterion, rather than identifying all rigid v-local systems with analytic bundles. For the affinoid B_dR+ comparison use the existing completed-period bundle v-descent. For B_dR use the explicitly requested localized-period finite-projective descent extension; O-module descent alone does not prove this case.

The consuming constructions use this interface as follows. AP4 relative_bilattice: Carries the two period lattices. AP6 family_adm: Supplies the étale realization of a family.

**Checks.**

- The trivial rank-n system is Lambda^n and its trivial-frame torsor is G(Lambda).
- A nontrivial finite étale rank-one local system retains its monodromy and is not identified with the constant system by its fibres.
- An invertible analytic sheaf gives the corresponding O-local system under the vector-bundle equivalence.
- On Spa L for a p-adic field L, O(1) is an O-local system but not an analytic line bundle: no finite étale extension kills its nonzero cyclotomic Tate weight.

**Acceptance.** Local freeness and its topology are part of the object; a sheaf with merely finite-dimensional fibres is insufficient.

*Needs:* `DiamondsAndVStacks:D1/universally-open-std-cover`; `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`; `DiamondsAndVStacks:D2/v-descent-of-functions`; `DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites`; `DiamondsAndVStacks:D5/spatial-diamond`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`; `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`; `RelativeFarguesFontaine:RF4:vector-bundles`.

### 4.3 Closed integrality locus

Establish `integrality`. Let L be a p-adic field, S an affinoid perfectoid space over L, X an affine finite-type L-scheme, and x∈X(B_dR(S)). The subset of |S| where every geometric specialization of x lies in X(B_dR+) is Zariski closed. Integrality is functorial under morphisms of affine finite-type L-schemes. Zariski closedness is transitive for the associated closed perfectoid subspaces.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemma 2.3.2 and Remark 2.3.3, p. 17.)

Choose a closed immersion X→A^n_L and test its finitely many coordinates. Bound their denominators locally and successively kill negative filtration coefficients; each obstruction is a section of a Tate-twisted O-line and has a Zariski closed zero locus. For transitivity identify a closed perfectoid subspace with its strong closed quotient. Surjectivity of the quotient map lifts defining ideals, so successive zero loci are cut out by one ideal upstairs.

**Acceptance.** The bound is finite for each coordinate; no globally preferred generator t is imposed.

*Needs:* AP4 `coefficient_local_system` (Coefficient and group local systems); `PerfectoidQuotients:Q4/completed-integral-closed-quotient`; `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`; `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`; `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.

### 4.4 Relative bilattices and their type

Define `relative_bilattice`. A bilatticed B_dR-local system on Y is (V,L1,L2), with V a B_dR-local system and Li B_dR+-local systems identified with lattices in V. A latticed B_dR+-local system is equivalently (L1,L2⊂L1[1/Fil^1]); the datum is not merely a G(B_dR+)-local system with one lattice. Define trace filtrations by image of Fil^i B_dR·L2∩L1 in L1/Fil^1L1, and type pointwise by elementary divisors. A filtered O-local system uses locally direct summands and a pointwise-locally-constant rank function.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §3.1, pp. 20–22, equations (3.1.0.1), (3.1.1.1), Example 3.1.1, Lemma 3.1.2.)

The interface consists of the following operations and laws.

- `relative_bilattice.pullback`: Lattices and trace filtrations commute with permitted base changes once local splitting/constant type is established.
- `relative_bilattice.opposed`: Swapping L1,L2 negates type, and gr1^i≅gr2^-i(i) with the intrinsic Tate twist.
- `relative_bilattice.constant_type`: Locally constant type gives trace filtrations by local direct summands.
- `relative_bilattice.tensor`: Trace filtration is compatible with tensor and dual; it is not asserted exact for arbitrary bilattices.

Sheafify intersection and image and compare on strictly totally disconnected presentations. Identify geometric fibres with pointwise bilattices. For locally constant type prove the trace terms locally split and compute the two graded pieces.

The consuming constructions use this interface as follows. AP4 relative_good: Extends the point exactness criterion. AP4 flat_bundles: Recognizes the essential image of filtered flat bundles.

**Checks.**

- For L2=Fil^a B_dR inside L1=B_dR+, the first trace jump is −a and the second is a, with the stated twist.
- On the rigid unit disc with coordinate z, L1=(B_dR+)^2 and L2=<e1,e2+(z/xi)e1> has type (1,−1) at z≠0 and (0,0) at z=0.
- The graded-piece isomorphism for a rank-one nonzero jump requires the Tate twist; identifying the untwisted graded pieces is not canonical.

**Acceptance.** Type need not be locally constant in an arbitrary family.

*Needs:* AP4 `coefficient_local_system` (Coefficient and group local systems); AP0 `bilattice` (Lattices and bilattices); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`; `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.

### 4.5 Relative goodness and trace exactness

Establish `relative_good`. A bilatticed G-local system is good of locally constant type [mu] iff BB1 is a filtered G(O)-local system of type [mu^-1], iff BB2 is one of type [mu]. This is HK II Theorem 3.2.1. For reductive G, type satisfies the usual Schubert semicontinuity; no such general assertion is made for non-reductive G.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 3.2.1 and Remark 3.2.2, pp. 22–23.)

Apply the point criterion on geometric points. Use constant ranks and finite-projective descent to lift the split filtered structure. Recover the G(B_dR+) double coset locally, keeping its cocharacter/reflex-field descent.

**Acceptance.** The disc family and G_a example rule out assuming arbitrary G-families have locally constant good type.

*Needs:* AP4 `relative_bilattice` (Relative bilattices and their type); AP0 `good_point` (Good G-bilattices); AP0 `good_exact` (Exactness criterion for goodness).

### 4.6 The trivial-filtration lattice functor

Construct `flat_bundles`. For smooth rigid X over a p-adic field L, define M0(E,∇) as Scholze’s B_dR+-local system attached to the flat bundle with trivial filtration. It is a fully faithful tensor functor from flat bundles on X_et; There is a canonical residual comparison M0(E)⊗O≅v^*E, and pushing forward recovers E with its connection. For a Griffiths-transversal filtration F on E define M(E,F)⊂M0(E)[1/Fil^1] by the filtered de Rham horizontal-section construction, giving the associated latticed object.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §3.3, Theorem 3.3.1(1)–(2), pp. 23–24; Example 3.3.2, p. 25.)

([Peter Scholze — p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463), Theorem 7.6 and its proof, pp. 42–45.)

The interface consists of the following operations and laws.

- `flat_bundles.trivial_filtration`: M0(E,∇)=M(E,∇,F_trivial).
- `flat_bundles.recover_flat`: The canonical horizontal structural comparison reduces to M0(E)⊗O≅v^*E; its pushforward recovers E and its connection, naturally in horizontal maps.
- `flat_bundles.fully_faithful`: A map between M0 lattices comes uniquely from a horizontal map of flat bundles.
- `flat_bundles.filtered_tensor`: M sends Griffiths-transversal filtered maps to lattice-preserving maps and respects tensor and dual.

Use the local Poincaré lemma and the horizontal-section construction. Compute the pushforward locally in toric coordinates. Descend and compare tensor products and strict morphisms.

The consuming constructions use this interface as follows. AP4 flat_essential_image: Recognizes lattices whose filtration descends to X_et. AP12 variations: Attaches period data to de Rham local systems.

**Checks.**

- At X=Spa K this is the canonical lattice of a K-filtration on the finite-dimensional vector space.
- The unit flat bundle with its trivial filtration gives B_dR+ as both lattices.
- A filtration concentrated in degree a gives the canonical lattice Fil^-a B_dR times M0, not Fil^a.

**Acceptance.** M0 takes a flat bundle as input; it forgets any pre-existing filtration.

*Needs:* AP4 `coefficient_local_system` (Coefficient and group local systems); `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`; `PadicHodgeTheory:P8/plan/position-of-associated-local-system`; `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### 4.7 Smooth rigid lattice–filtration comparison

Establish `flat_essential_image`. For smooth rigid X over a p-adic field L, the functor (E,∇,F)↦(M0(E),M(E,F)) is fully faithful on Griffiths-transversal filtered flat bundles. Its essential image is exactly the latticed objects whose first lattice is M0 of a flat bundle and whose trace filtration has locally direct-summand terms (equivalently locally constant type). The recovered filtration is on X_et, not only on its pro-étale cover.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 3.3.1(3), pp. 24–25; Proposition 5.0.3(4), p. 31.)

Use the residual comparison M0(E)⊗O≅v^*E. On an analytic open U trivializing E, the trace direct summands define U^diamond→Flag, not merely a map from a pro-étale chart. Apply seminormal rigid full faithfulness to U and its overlap opens; uniqueness glues the analytic filtration on E. The Faltings-extension boundary, or induction on the filtration spread as in HK II §3.3, identifies vanishing of the lattice lifting obstruction with Griffiths transversality. Apply the associated-lattice position and uniqueness theorem to recover the original second lattice; horizontal full faithfulness gives the morphism assertion.

**Acceptance.** Smoothness is required here. Singular applications use AP5 rigid_cells and resolution instead.

*Needs:* AP4 `flat_bundles` (The trivial-filtration lattice functor); AP4 `relative_good` (Relative goodness and trace exactness); `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`; `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`; `PadicHodgeTheory:P8/plan/position-of-associated-local-system`; `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### Examples

Over a rigid disc let z be its coordinate and choose a v-local lift of z to the period sheaf and a generator ξ of Fil^1. Put L1=(B_dR+)² and L2=⟨e1,e2+(z/ξ)e1⟩. At a geometric point with z≠0, the determinant has valuation zero and one entry has valuation −1, giving type (1,−1). At z=0 both lattices agree. The construction glues in the period sheaf as in HK II Example 3.1.1, p. 20. It is a family of lattices with a type jump; a fibrewise flag is not automatically a filtered local system by direct summands.

For a flat line with its filtration concentrated in degree a, the canonical second lattice is Fil^(−a) times the first. For the trivial filtration M0 has equal lattices. Forgetting the original filtration before forming M0 is essential: using M(E,F) as M0 would erase the distinction that the relative comparison theorem recovers. (HK II Theorem 3.3.1, pp. 23–25.)

### Dependencies

- `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.
- `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`.
- `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.
- `DiamondsAndVStacks:D6/etale-site-comparison`.
- `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.
- `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`.
- `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points`.
- `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure`.
- `DiamondsAndVStacks:D5/locally-closed-generalizing-subdiamond`.
- `DiamondsAndVStacks:D1/universally-open-std-cover`.
- `DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site`.
- `DiamondsAndVStacks:D2/v-descent-of-functions`.
- `DiamondsAndVStacks:D2/vector-bundles-across-pro-etale-and-v-sites`.
- `DiamondsAndVStacks:D5/spatial-diamond`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.
- `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`.
- `RelativeFarguesFontaine:RF4:vector-bundles`.
- `PerfectoidQuotients:Q4/completed-integral-closed-quotient`.
- `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.
- `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`.
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`.
- AP0.
- `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`.
- `PadicHodgeTheory:P8/plan/position-of-associated-local-system`.
- `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.


## Layer AP5: Grassmannians for connected linear groups

Extend the reductive B_dR+ Grassmannian by Levi and unipotent coordinates. Prove subgroup immersion criteria, relative-position closedness, the rigid-source and Griffiths-transversality theorem, and the exact adjoint-weight bound for the BB isomorphism.

### 5.1 Non-reductive de Rham Grassmannians

Define `grassmannian`. For connected linear G/Q_p, Gr_G is the étale sheaf quotient G(B_dR)/G(B_dR+), equivalently G(B_dR+)-torsors with a trivialization after inverting Fil^1. It is a v-sheaf. For a cocharacter class [mu], Gr_[mu] is the good lattice locus of type [mu] and BB:Gr_[mu]→Fl_[mu^-1]^diamond is the first trace-filtration map. Define Fl as filtrations of the standard fibre functor; its type components are clopen and descend to their reflex fields.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 5.0.1 and Proposition 5.0.3, pp. 29–31.)

The interface consists of the following operations and laws.

- `grassmannian.quotient`: On a strictly totally disconnected chart the quotient agrees with actual G(B_dR)/G(B_dR+) cosets.
- `grassmannian.torsor`: The lattice and torsor-with-trivialization presentations are naturally equivalent.
- `grassmannian.bb`: BB is G(B_dR+)-equivariant through reduction G(B_dR+)→G(O).
- `grassmannian.levi`: G→M sends Gr_[mu] into Gr_[mu_M] and commutes with BB.

Use tensor torsors and effective coefficient-module descent. Extend the reductive quotient description through the unipotent derived series. On geometric points use the good double-coset condition and descend the trace flag.

The consuming constructions use this interface as follows. AP6 admissible_locus: Realizes moduli of modified pairs. AP5 rigid_cells: Identifies which rigid maps land in a good cell.

**Checks.**

- For reductive G this agrees with the one-leg Grassmannian supplied by GS0.
- For G_m the geometric points are indexed by integer exponents; BB maps each cell to a point.
- Gr_Ga=B_dR/B_dR+ has nonzero geometric points, while its only good cocharacter cell is the zero point.

**Acceptance.** A non-reductive Grassmannian need not be the union of its good cocharacter cells.

*Needs:* AP4 `relative_good` (Relative goodness and trace exactness); AP1 `bun_linear` (Bundles for connected linear groups); `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`; `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`; `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.

### 5.2 Subgroup immersion criterion

Establish `subgroup_gr`. For a closed embedding H→G of connected linear groups, Gr_H→Gr_G is a monomorphism. It is locally closed if G/H is quasi-affine, and closed if G/H is affine. Prove these statements by integral loci in an observable embedding, not by assuming every faithful representation gives a closed Grassmannian embedding.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemma 5.1.1, pp. 33–34.)

Express a reduction to H as an integral section of the homogeneous-space model. Use a Chevalley line and its inverse-character G_m factor to obtain an observable embedding. Apply the closed-integrality lemma for affine quotients, and its open restriction for quasi-affine ones.

**Acceptance.** The affineness and quasi-affineness hypotheses are kept distinct.

*Needs:* AP5 `grassmannian` (Non-reductive de Rham Grassmannians); AP4 `integrality` (Closed integrality locus); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

### 5.3 Grassmannian geometry and Schubert loci

Establish `grass_geometry`. For connected linear G, Gr_G is separated, partially proper and an increasing union of closed locally spatial diamonds. Every Gr_[mu] is locally closed; it is closed in Gr_G if [mu_M] is minuscule for the reductive Levi quotient. For any [mu], Gr_[mu] is closed in Gr_G×_{Gr_M}Gr_[mu_M].

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 5.0.4(1)–(3), pp. 31–32; §§5.1–5.2, pp. 33–34.)

Embed G observably into GL(V)×G_m and import reductive bounded diamonds. Use Levi-cell local closedness. In its Levi preimage cut out the required cell by the faithful-representation dominance bound of specialization. Apply the valuative criterion for partial properness with the same embeddings.

**Acceptance.** Do not strengthen local closedness to closedness for an arbitrary cocharacter.

*Needs:* AP5 `grassmannian` (Non-reductive de Rham Grassmannians); AP5 `subgroup_gr` (Subgroup immersion criterion); AP0 `specialization` (Specialization dominance); `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`; `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

### 5.4 Faithful-representation cutout

Establish `faithful_cutout`. Fix a Levi G=M⋉U and a closed faithful rho:G→GL(V). In Gr_G×_{Gr_M}Gr_[mu_M], the cell Gr_[mu] is exactly the inverse image under rho of the closed Schubert bound Gr_GL(V),≤rho(mu). Thus Gr_[mu]=(Gr_G×_{Gr_M}Gr_[mu_M])∩rho^-1(Gr_≤rho(mu)). The order is the usual reductive dominance order with matching determinant/Kottwitz invariant.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 5.2.1, equation (5.2.1.1), p. 34.)

Specialization puts every actual representation type above the induced Levi type. The imposed upper bound forces equality. Faithfulness then forces goodness, proving the functorial equality on geometric points and the represented closed subdiamond.

**Acceptance.** Both the Levi-type condition and the representation bound are necessary.

*Needs:* AP0 `specialization` (Specialization dominance); AP5 `grassmannian` (Non-reductive de Rham Grassmannians); `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`; `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

### 5.5 Rigid sources and Griffiths transversality

Establish `rigid_cells`. For a seminormal rigid S/L and a map S^diamond→Gr_G whose Levi projection lands in Gr_[mu_M], the map factors through Gr_[mu]. BB identifies such maps with filtrations of type [mu^-1] on the trivial G-bundle whose restriction to the smooth locus is Griffiths transversal for the trivial connection. For smooth S the condition holds everywhere. Every rigid analytic point of Gr_G is good. No claim is made that all geometric points are good.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 5.0.4(4), p. 31; §5.3, pp. 34–35.)

At a classical point use the infinite cyclotomic Galois action to recover a canonical lattice. The closed cutout and density give the factorization. On a resolution use the smooth comparison of AP4. Descend the flag and its canonical lattice along the resolution and its fibre product by seminormal full faithfulness.

**Acceptance.** This replaces each invalid use of the smooth theorem on a singular base.

*Needs:* AP5 `grass_geometry` (Grassmannian geometry and Schubert loci); AP4 `flat_essential_image` (Smooth rigid lattice–filtration comparison); AP0 `lattice_recovery` (Recovery from a filtration); `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`; `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`.

### 5.6 Adjoint-weight BB criterion

Establish `bb_bound`. BB:Gr_[mu]→Fl_[mu^-1]^diamond is an isomorphism iff all weights of Ad∘mu on Lie G are ≤1. If any weight exceeds 1, BB has no section over any nonempty open subdiamond of the flag variety. For reductive G this condition is equivalent to minuscule [mu]; for non-reductive G it is a one-sided bound. In particular every rigid analytic map into Gr_Ga is zero, although Gr_Ga has many geometric points.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 5.0.4(5), pp. 32, 35; Example 5.0.5, p. 32.)

Compute the congruence stabilizer of t^mu in each adjoint weight. For the bounded case identify the quotient with the flag. For the converse a hypothetical section yields a filtration with impossible Griffiths-transverse differential in a weight >1 direction.

**Acceptance.** Replacing ≤1 by |weight|≤1 for general G loses legitimate one-sided examples.

*Needs:* AP5 `rigid_cells` (Rigid sources and Griffiths transversality); AP0 `lattice_recovery` (Recovery from a filtration); AP5 `grassmannian` (Non-reductive de Rham Grassmannians); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

### Examples

For G_a in its standard unipotent two-dimensional representation, Gr_Ga(C)=B_dR(C)/B_dR+(C), so ξ^(−1) is a geometric point. There is only the zero cocharacter; its good cell and flag variety are points. Every map from a rigid analytic diamond into Gr_Ga is zero. Thus neither exhaustion by good cells nor rigid analyticity of the entire Grassmannian follows from its many geometric points. (HK II Example 5.0.5, p. 32.)

On a reductive GL_2 cell of type (1,0), adjoint weights are −1,0,1 and BB identifies the cell with the appropriate projective-line flag. A non-reductive type can instead have adjoint weights 0,1,−2: BB for that type is an isomorphism, while BB for its inverse fails. The inverse has a weight 2 and admits no local section over any nonempty flag open. The suggested file's `two_sided_weight_bound`, `symmetric_weight_bounds` and mirabolic example distinguish these cases. (HK II Theorem 5.0.4(5), pp. 32, 35, and Example 8.4.4, p. 53.)

### Dependencies

- AP4.
- AP1.
- `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`.
- `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.
- `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.
- `DiamondsAndVStacks:D6/etale-site-comparison`.
- `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.
- AP0.
- `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.


## Layer AP6: Neutral families and admissible loci

Construct neutral families, prove their Tannakian structure and connected motivic groups, and represent nonempty geometrically connected admissible loci. The arbitrary-field constant-good-type theorem has the explicit independent de Rham criterion recorded in the packet as an open input.

### 6.1 Neutral admissible pairs in families

Define `family_adm`. For a nonempty locally spatial Y/Spd Q_p-breve, a neutral admissible pair is a fixed finite-dimensional isocrystal W together with a B_dR+-lattice L_et⊂W⊗B_dR whose geometric fibres are admissible. W is globally constant, including on disconnected Y. Morphisms are fixed isocrystal maps preserving the lattice. Define omega_et by the slope-zero bundle/local-system equivalence, c_dR by modification, omega_Isoc=W, and L_dR=c_dR^-1(W⊗B_dR+).

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 7.1.1, p. 39; equations (7.1.3.1)–(7.1.3.5), pp. 40–41.)

The interface consists of the following operations and laws.

- `family_adm.etale`: omega_et is a pro-étale Q_p-local system with fibre V_et of the pointwise pair.
- `family_adm.isocrystal`: omega_Isoc is the specified fixed W and is faithful on morphisms.
- `family_adm.comparison`: c_dR sends omega_et⊗B_dR+ onto L_et and L_dR onto W⊗B_dR+.
- `family_adm.pullback`: All three realizations and both lattices commute with pullback of the locally spatial base.

Patch on FF_Y, apply the family slope-zero equivalence and compare off the divisor. Recover the two lattices using the same comparison isomorphism.

The consuming constructions use this interface as follows. AP6 family_tannakian: Proves the family category has fibre functors. AP9 infinite_moduli: Adds trivializations of both fixed realizations.

**Checks.**

- On Spd C the definition and every realization agree with AP2.
- A family with genuine isocrystal monodromy is outside the neutral category even if each geometric fibre is an admissible pair.
- On Y=Spd C ⊔ Spd C a morphism is still one fixed isocrystal map; two independently chosen fibre maps need not define a morphism.

**Acceptance.** Do not replace the fixed isocrystal by an arbitrary isocrystal local system.

*Needs:* AP2 `point_adm` (Pointwise admissible pairs); AP4 `coefficient_local_system` (Coefficient and group local systems); AP4 `relative_bilattice` (Relative bilattices and their type); `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.

### 6.2 Family Tannakian theorem

Establish `family_tannakian`. For nonempty locally spatial Y/Spd Q_p-breve, neutral admissible pairs form a Q_p-linear neutral Tannakian category; evaluation of omega_et at any geometric y is an exact faithful fibre functor. The underlying isocrystal functor is exact and faithful. Prove kernels, images and cokernels as families, using local triviality of constant-slope bundles rather than inferring it from pointwise rank alone. This is HK II Theorem 7.1.2.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 7.1.2 and Remark 7.1.3, p. 40.)

Take isocrystal kernels and intersect the lattice. Use exactness in each point category and the relative constant-slope/local-system theorem to show the lattices are locally free of the required ranks. Check End(1)=Q_p; a single fibre detects a fixed isocrystal map.

**Acceptance.** The evaluation remains faithful even for disconnected Y because the isocrystal maps are fixed.

*Needs:* AP6 `family_adm` (Neutral admissible pairs in families); AP2 `point_tannakian` (Pointwise Tannakian theorems); `MotivesAndAlgebraicCycles:MC.6`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`; `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.

### 6.3 G-families and canonical reduction

Construct `family_groups`. A neutral G-admissible pair is an exact tensor functor A:Rep_Qp G→AdmPair^neutral(Y) such that, at every geometric y, omega_y∘A is isomorphic to the standard fibre functor. These isomorphisms are required to exist, not chosen as part of the object. With a chosen geometric fibre trivialization define H=MG(A,y)≤G from its generated tensor subcategory. H is connected. The isocrystal tensor functor of its canonical H-reduction is globally fixed and is isomorphic to W_bH for some b_H∈H(Q_p-breve), without a connectedness hypothesis. If Y is connected, its étale fibre functors all have the standard H-form, so the reduction is neutral. With g sending f(b_H) to b by sigma-conjugation, the classifying map factors through the H-admissible locus. For disconnected Y this assertion is made componentwise, not with one universal neutral reduction.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 7.2.1, p. 41; Lemma 7.5.1, pp. 46–47, with connected-base correction.)

The interface consists of the following operations and laws.

- `family_groups.mg`: MG is a closed connected subgroup, well-defined up to conjugacy before choosing a fibre trivialization.
- `family_groups.reduction`: The H-reduction induces the original G-family and is tensor-generated by it.
- `family_groups.isocrystal_form`: On any Y, choose b_H and g with g f(b_H) sigma(g)^−1=b for the fixed H-isocrystal tensor functor; connectedness is needed for the étale neutral form, not for b_H.
- `family_groups.factorization`: The factorized classifying map pulls the universal H-pair back to the canonical reduction.

A finite tensor quotient is trivial at every geometric point by the pointwise connectedness theorem. Its constant isocrystal maps then preserve the lattices globally, proving connectedness of MG. The H-isocrystal functor is already fixed globally. Steinberg triviality over Q_p-breve gives b_H and a sigma-conjugating g, independently of connectedness of Y. The form of the étale H-fibre functor lies in ker(H^1(Q_p,H)→H^1(Q_p,G)). A continuous H-torsor has locally constant fibre form; on connected Y the form is fixed by its standard value at y. Use this neutrality and g to obtain the H-admissible factorization. On a disconnected base another component can have a different étale form.

The consuming constructions use this interface as follows. AP8 special_loci: Selects the subgroup responsible for a special locus. AP11 Ax–Lindemann: Reduces the period-image argument to full generic group.

**Checks.**

- A constant family has its pointwise MG and its pointwise canonical reduction on every connected base.
- A nontrivial finite group cannot be the MG of a neutral family; neutrality alone would not establish this.
- For a norm-one quadratic torus H⊂SL_2, ker(H^1(Q_p,H)→H^1(Q_p,SL_2)) is nontrivial. Different connected components can have different étale H-fibre forms while the isocrystal functor remains globally fixed; one selected fibre cannot neutralize them all.

**Acceptance.** Connectedness of MG and neutrality of the reduction are separate obligations.

*Needs:* AP6 `family_tannakian` (Family Tannakian theorem); AP2 `point_groups` (Mumford–Tate and motivic Galois groups); AP1 `g_isocrystal` (G-isocrystals and basic classes); `MotivesAndAlgebraicCycles:MC.6`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

### 6.4 Good type over rigid bases

Establish `family_type`. Let S be a geometrically connected seminormal rigid analytic variety over a p-adic L⊇Q_p-breve, and let A be a neutral G-admissible pair on S^diamond. Then its bilatticed G-local system is good and has a single type [mu], with [mu] defined over L. For connected S not geometrically connected, pass to its finite field of constants and apply the statement componentwise. For a connected seminormal S whose classifying map has fixed ambient type, the canonical motivic reduction also has a fixed subgroup type after the appropriate reflex-field extension.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 7.2.2 and Theorem 7.2.3, pp. 41–42; Lemma 7.5.1(2), p. 47.)

([Ruochuan Liu and Xinwen Zhu — Rigidity and a Riemann–Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282), Theorem 1.3, pp. 2–3, and Theorem 3.9, pp. 24–28.)

Descend the Q_p-local system to the étale site and resolve the seminormal rigid source; the resolution is a proper surjective v-cover. On the smooth source the de Rham comparison identifies L_et⊗OB_dR with W_L⊗OB_dR for the constant flat bundle W_L. Invoke the explicitly requested full-rank de Rham criterion over arbitrary p-adic L; this criterion is a recorded supplier gap, not an application of finite-field Liu–Zhu rigidity. That criterion gives the associated locally split Griffiths-transversal filtration, hence goodness and locally constant type. Geometric connectedness and Galois descent make its conjugacy class single and L-defined. Use rigid_cells only after the Levi type is known: it lifts that type to G. Uniqueness on analytic trivializations and seminormal full faithfulness descend the filtration from the resolution. Apply the same argument to the canonical motivic subgroup after the connected-base neutral reduction. General rigid sources factor through their seminormalizations at the diamond level.

**Acceptance.** Do not apply Liu–Zhu’s finite-Q_p-field rigidity theorem directly over an arbitrary strict field or singular S. The arbitrary-field full-rank criterion is an explicit open input. A fixed-type Grassmannian theorem cannot establish its own type hypothesis.

*Needs:* AP6 `family_groups` (G-families and canonical reduction); AP5 `rigid_cells` (Rigid sources and Griffiths transversality); AP4 `relative_good` (Relative goodness and trace exactness); `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`; `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`; `PadicHodgeTheory:P8:local-rational`; `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`; `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### 6.5 b-rigidified admissible loci

Define `admissible_locus`. For b∈G(Q_p-breve), a b-rigidification of a neutral G-pair is a tensor identification of its isocrystal functor with W_b. Define Gr_G^{b-adm} as the sub-v-sheaf of Gr_G over Spd Q_p-breve whose modification of E_b lies in the trivial bundle stratum. Define Gr_[mu]^{b-adm} by intersection with the good cell over the composite reflex field Q_p-breve([mu]). It represents b-rigidified neutral G-pairs, with universal étale realization and de Rham lattice.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 7.3.1 and Proposition 7.3.2, pp. 42–43.)

The interface consists of the following operations and laws.

- `admissible_locus.represent`: Maps Y→Gr_G^{b-adm} are b-rigidified neutral G-pairs on Y.
- `admissible_locus.open`: Gr_G^{b-adm} is open in Gr_G over Spd Q_p-breve.
- `admissible_locus.universal`: Pulling the universal pair back gives the represented pair and its two realizations.
- `admissible_locus.type_piece`: The fixed-type locus is the fibrewise intersection with Gr_[mu], not a redefinition of the whole admissible functor.

Apply patching to the universal lattice on E_b. Pull back the open trivial bundle stratum. Recover a b-rigidified pair from its lattice and prove the representing equivalence functorially.

The consuming constructions use this interface as follows. AP8 subgroup_admissible: Defines closed special subdiamonds. AP9 infinite_moduli: Adds a global étale trivialization.

**Checks.**

- The standard lattice for b=1 gives the trivial pair.
- For G_m with incompatible slope and lattice degree, the modification is not slope zero and the point is excluded.
- Changing the b-rigidification acts by G_b(Q_p); the representing point includes this choice rather than quotienting it away.

**Acceptance.** The entire admissible locus may contain points outside every good type cell for non-reductive G.

*Needs:* AP5 `grassmannian` (Non-reductive de Rham Grassmannians); AP6 `family_adm` (Neutral admissible pairs in families); AP1 `basic_strata` (Basic-stratum theorem); `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`; `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.

### 6.6 Non-emptiness and rigid points

Establish `admissible_nonempty`. For connected linear G and a cocharacter class [mu], Gr_[mu]^{b-adm} is nonempty iff [b]∈B(G,[mu^-1]); in that case it contains a rigid analytic point over a finite extension of Q_p-breve([mu]).

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 7.3.3, p. 43.)

Necessity follows by projecting a modification to the reductive Levi quotient. Import the reductive non-emptiness and rigid-point theorem. Lift a Levi point through a Levi splitting to G.

**Acceptance.** Rigid-point existence refers to the admissible locus, not merely the ambient cell.

*Needs:* AP6 `admissible_locus` (b-rigidified admissible loci); AP1 `levi_B` (Levi invariance of B(G)); AP2 `point_invariants` (Invariants and existence); `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`; `HeckeStacksAndLocalShtukas:HS2/classical-period-points`.

### 6.7 Cohomologically smooth connected products

Establish `product_connected`. Let C/Q_p be complete algebraically closed, let ℓ≠p, and let X and Y be nonempty connected locally spatial diamonds which are ℓ-cohomologically smooth over Spd C. Then X×_(Spd C)Y is connected. Cohomological smoothness includes separatedness, compactifiability and local finiteness of dim.trg for the structure maps.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemma 7.3.5, pp. 44–45.)

For the structure map f of a nonempty connected factor, Rf_!Rf^!F_ℓ is concentrated in nonpositive degrees and its degree zero is F_ℓ, dual to H^0 of the constant sheaf. Use smooth twisted pullback and the lower-shriek base-change/projection identities to obtain the Künneth formula for these dualizing complexes on the product. Its degree-zero group is F_ℓ⊗F_ℓ=F_ℓ. Verdier duality gives H^0(X×Y,F_ℓ)=F_ℓ, which characterizes connectedness. The shriek identities already apply without quasicompactness.

**Acceptance.** Nonemptiness is explicit; products of arbitrary diamonds are not declared connected.

*Needs:* `DiamondSixOperations:S3/verdier-duality-lower-shriek`; `DiamondSixOperations:S4/cohomologically-smooth`; `DiamondSixOperations:S4/smooth-twisted-pullback`; `DiamondSixOperations:S2/lower-shriek-base-change`; `DiamondSixOperations:S2/projection-formula`.

### 6.8 Geometric connectedness of admissible loci

Establish `admissible_connected`. If [b]∈B(G,[mu^-1]), the nonempty diamond Gr_[mu]^{b-adm} is geometrically connected. After writing G=M⋉U and moving b into M, U(B_dR+) preserves the admissible locus, its action on this cell factors through U(B_dR+/Fil^m) for m above the relevant adjoint weights, and the product of that truncated loop diamond with the Levi admissible locus maps surjectively on underlying spaces onto the G-locus.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 7.3.4, pp. 43–44.)

Use the pullback description of the trivial stratum to check U-invariance. Compute the finite congruence truncation and topological surjectivity. Import reductive connectedness and apply the connected-product result. Descend connectedness along the topologically surjective map.

**Acceptance.** The hypothesis excludes the empty locus; connected is used in the nonempty sense here.

*Needs:* AP6 `admissible_nonempty` (Non-emptiness and rigid points); AP6 `product_connected` (Cohomologically smooth connected products); AP1 `basic_strata` (Basic-stratum theorem); `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`; `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`; `HeckeStacksAndLocalShtukas:HS2/classical-period-points`.

### Examples

A torus has one compatible b-class for a fixed cocharacter. Its fixed-type admissible locus is a point over the composite reflex field and is geometrically connected; choosing a b with the wrong Kottwitz invariant makes it empty. Nonemptiness must therefore precede the connectedness assertion. For a general G=M⋉U, a sufficiently high truncated positive-loop U-diamond is connected and cohomologically smooth. Its product with the corresponding reductive admissible locus covers the G-locus on underlying spaces. Apply the product lemma with both factors cohomologically smooth. (HK II Propositions 7.3.3–7.3.4 and Lemma 7.3.5, pp. 43–45.)

On a disconnected base the defining W of a neutral pair remains one globally fixed isocrystal. Evaluation of the fixed isocrystal maps at one geometric fibre is still faithful, but a canonical subgroup reduction need not admit one neutral form across all components. Connectedness is required at that reduction step. The globally fixed H-isocrystal already admits b_H on every base; the possible variation between components lies in the étale fibre form. On a geometrically connected rigid base, constancy of Levi type requires the independent full-rank de Rham criterion below. Only after that step does the rigid-source theorem lift it to one good G-type. A general rigid source is handled by seminormalization at the diamond level. (HK II Definition 7.1.1 and Lemma 7.5.1, pp. 39, 46–47.)

### Dependencies

- AP2.
- AP4.
- `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`.
- `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.
- `MotivesAndAlgebraicCycles:MC.6`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.
- AP1.
- AP5.
- `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`.
- `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.
- `DiamondsAndVStacks:D6/etale-site-comparison`.
- `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.
- `PadicHodgeTheory:P8:local-rational`.
- `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`.
- `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.
- `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.
- `HeckeStacksAndLocalShtukas:HS2/nonemptiness-and-period-connectedness`.
- `HeckeStacksAndLocalShtukas:HS2/classical-period-points`.
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`.
- `DiamondSixOperations:S4/cohomologically-smooth`.
- `DiamondSixOperations:S4/smooth-twisted-pullback`.
- `DiamondSixOperations:S2/lower-shriek-base-change`.
- `DiamondSixOperations:S2/projection-formula`.
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`.
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`.
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`.


## Layer AP7: Neutral Hodge structures and period domains

Construct neutral Hodge structures in families and their Mumford–Tate groups, represent fixed type by the nonempty open domain X_mu, and prove closedness and rigid-Zariski closedness of Hodge–Tate loci and special Hodge domains.

### 7.1 Neutral Hodge structures in families

Define `family_hs`. For nonempty locally spatial Y/Spd Q_p-breve, a neutral p-adic Hodge structure is a fixed finite Q-graded Q_p-space V and a B_dR+-lattice L_dR in V⊗B_dR, compatible with grading and having pointwise Hodge-structure fibres of the prescribed weights. Morphisms are fixed graded Q_p-linear maps preserving L_dR. A G-structure is an exact tensor functor into this category; its MT group at y is defined from the generated tensor subcategory. For a G-structure require its fixed étale tensor functor to be isomorphic to the standard fibre functor. A choice of that isomorphism is the additional trivialization used by the represented domain.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 6.0.1, Example 6.0.2 and Definition 6.1.1, pp. 35–36.)

The interface consists of the following operations and laws.

- `family_hs.pullback`: Pullback retains the fixed graded V and pulls back only its lattice.
- `family_hs.point`: A geometric fibre is exactly the pointwise HS object of AP2.
- `family_hs.mt`: The tensor-generated Mumford–Tate group is a closed subgroup in a chosen G-fibre trivialization.
- `family_hs.basic_pair`: A basic neutral admissible family with a chosen global constant étale frame gives a neutral Hodge family. Conversely a Hodge family gives a neutral admissible family only when its associated constant-slope bundle has globally constant isocrystal realization with a chosen frame. Fibrewise isocrystal classification supplies no such global frame; its obstruction is the corresponding G_b(Q_p)-frame torsor.

Use pointwise purity to obtain constant-slope modified families. Apply the relative local-triviality theorem to kernels and images. Form tensor and dual using weight addition.

The consuming constructions use this interface as follows. AP7 hs_domain: Defines the represented Hodge objects on the trivial étale fibre. AP7 ht_line: Makes Hodge lines a condition on one fixed rational line.

**Checks.**

- The constant graded unit with L_dR=B_dR+ has weight zero.
- The constant Tate structure has weight −2n and L_dR=Fil^-n, matching AP2.
- A nonconstant graded étale local system is not a neutral Hodge structure in this definition even if each fibre is pure.
- A nontrivial G_b(Q_p)-frame torsor of a constant-slope bundle prevents a global neutral admissible inverse, even though every geometric Hodge fibre has a basic admissible inverse.

**Acceptance.** Fixed grading and fixed V distinguish neutral objects from arbitrary variations.

*Needs:* AP2 `point_hs` (Pointwise p-adic Hodge structures); AP4 `relative_bilattice` (Relative bilattices and their type); AP2 `point_groups` (Mumford–Tate and motivic Galois groups); `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.

### 7.2 Tannakian structure of Hodge families

Establish `family_hs_tannakian`. Neutral p-adic Hodge structures on a nonempty locally spatial Y form a neutral Tannakian category with the fixed V forgetful functor. Its fundamental group is connected. Prove abelianness using relative constant-slope local triviality of modified bundles, then apply the pointwise finite-quotient argument to the fixed V maps.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Paragraph after Example 6.0.2, p. 36; HK I Theorem 4.3.5, pp. 35–36.)

Construct graded kernels and images; the constant-slope theorem makes their lattices locally free. Check exactness of the V functor. A finite tensor quotient trivial on every fibre is trivial globally because its rational vector maps are fixed.

**Acceptance.** Fibrewise finite freeness is not used as a substitute for a family theorem.

*Needs:* AP7 `family_hs` (Neutral Hodge structures in families); AP2 `point_tannakian` (Pointwise Tannakian theorems); `MotivesAndAlgebraicCycles:MC.6`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`; `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.

### 7.3 The Hodge period domain

Define `hs_domain`. Fix a connected linear G and [mu] for which B(G,[mu^-1]) has a G-basic class. Let X_[mu]⊂Gr_[mu^-1] be the open locus where the modified trivial bundle is basic. Its universal neutral G-Hodge structure has weight homomorphism 2nu and type [mu] in the Hodge convention. It represents neutral G-Hodge structures on the fixed trivial étale fibre functor of this type with central weight homomorphism in G. The space is nonempty. Its geometric connectedness is proved in AP9 after basic duality.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §6.2, Lemma 6.2.1 and Proposition 6.2.3, pp. 36–37.)

The interface consists of the following operations and laws.

- `hs_domain.open`: X_[mu] is open in Gr_[mu^-1].
- `hs_domain.represent`: Maps to X_[mu] classify neutral G-Hodge structures of this type with central weight homomorphism and the specified étale tensor identification.
- `hs_domain.weight`: On each representation the weight is twice the central Newton grading.
- `hs_domain.geometric_fibre`: A geometric point is a lattice whose modified trivial bundle has the unique G-basic class prescribed by [mu].

Pull back the open basic stratum along the modification map. Use the unique G-basic class and its central Newton grading to define the universal Hodge object. Use pointwise existence for nonemptiness; leave the geometric connectedness assertion to AP9.

The consuming constructions use this interface as follows. AP7 special_hs: Provides domains for subgroup Hodge structures. AP9 period_torsors: Is the target of the second period map.

**Checks.**

- For a torus and a specified type, X_[mu] is the corresponding single cocharacter point over the correct reflex field.
- For a non-reductive G whose B(G,[mu^-1]) contains no G-basic class, no such nonempty X_[mu] is asserted.
- A slope −n Tate basic class produces weight −2n, not −n.

**Acceptance.** Use 2nu for the weight homomorphism and nu for the slope homomorphism.

*Needs:* AP7 `family_hs` (Neutral Hodge structures in families); AP7 `family_hs_tannakian` (Tannakian structure of Hodge families); AP1 `basic_strata` (Basic-stratum theorem); AP2 `point_invariants` (Invariants and existence); AP5 `grassmannian` (Non-reductive de Rham Grassmannians).

### 7.4 Hodge–Tate loci of lines

Define `ht_line`. For a neutral Hodge family (V,L_dR) and a rational line ell⊂V_{2n}, define HT(ell) by ell⊗Fil^n B_dR⊂L_dR. It is the locus where ell is a Hodge substructure of weight 2n, equivalently where MT fixes the line. For a G-family use every representation and every such even-weight line; a line mixing weights does not define this condition.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 6.3.1 and Lemma 6.3.2, pp. 37–38.)

The interface consists of the following operations and laws.

- `ht_line.closed`: HT(ell) is a closed subdiamond of Y.
- `ht_line.stabilizer`: At a geometric point, membership is equivalent to the corresponding MT group stabilizing ell.
- `ht_line.base_change`: The locus pulls back under a map of bases with the fixed V data.
- `ht_line.scaling`: The locus depends on the line, not its choice of nonzero rational generator.

Express the inclusion as an integral morphism of lattices and apply the integrality lemma. A rank-one pure Hodge structure of weight 2n is the Tate object Q_p(−n), giving the stabilizer interpretation.

The consuming constructions use this interface as follows. AP7 special_hs: Cuts out subgroup period domains by Chevalley lines. AP11 Ax–Lindemann: Recognizes the opposite-special closure under basic duality.

**Checks.**

- For V=Q_p(−n) and its standard lattice Fil^n, HT(V) is the whole base.
- For a rank-one lattice Fil^a, the condition Fil^n⊂Fil^a holds exactly for n≥a; reversing the inequality changes the locus.
- At n=0 the inclusion is the ordinary integral-line condition; it is not the condition that every vector in a larger graded space be integral.

**Acceptance.** All integral n, including negative n, require Fil^n B_dR, not an unqualified B_dR+.

*Needs:* AP7 `family_hs` (Neutral Hodge structures in families); AP2 `point_groups` (Mumford–Tate and motivic Galois groups); AP4 `integrality` (Closed integrality locus).

### 7.5 Rigid closedness of Hodge–Tate loci

Establish `ht_rigid_closed`. For a neutral G-Hodge structure of fixed good type on a seminormal rigid S, every HT(ell) is a rigid Zariski closed subdiamond of S^diamond. Use BB to turn the lattice inclusion into a closed incidence condition on a rigid flag variety; the rigid-source theorem handles singular S through resolution and seminormal descent.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemma 6.3.3, p. 38, with the smoothness repair from Theorem 5.0.4(4), p. 31.)

Translate the rank-one lattice inclusion to the appropriate trace-filtration incidence condition. Pull back the closed flag incidence variety. For singular S work on a resolution and descend the map and closed subspace.

**Acceptance.** No application of Theorem 3.3.1 to a singular S is hidden in the argument.

*Needs:* AP7 `ht_line` (Hodge–Tate loci of lines); AP5 `rigid_cells` (Rigid sources and Griffiths transversality); `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.

### 7.6 Special Hodge subvarieties

Define `special_hs`. For connected H≤G and type [mu_H] inducing [mu_G], with a basic class for H whose image in B(G) is the ambient G-basic class, the map X_[mu_H]→X_[mu_G] is the subgroup period map. If [mu_H] is minuscule on the Levi quotient, its image is closed, as detected by a Chevalley line in a single even weight. A special subvariety of X_[mu_G] is such an image with all adjoint H-weights of mu_H ≥−1; equivalently the corresponding subgroup Hodge domain is rigid analytic via BB on the inverse type.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §6.4, Proposition 6.4.1 and Definition 6.4.2, p. 39.)

The interface consists of the following operations and laws.

- `special_hs.subgroup`: Compatible inclusions of groups and cocharacter classes induce the domain maps.
- `special_hs.closed`: Levi-minuscule subgroup type gives the closed image via the defining Hodge line.
- `special_hs.rigid`: The lower adjoint bound ≥−1 on mu_H is the upper BB bound ≤1 on mu_H^-1.
- `special_hs.universal`: The restricted universal Hodge structure admits the indicated H-reduction.

Choose a Chevalley line; centrality of the basic Newton grading makes it lie in one weight. Rank-one purity makes that weight even. Cut out the subgroup domain by its Hodge–Tate locus and apply the Levi-minuscule condition; for the one-sided bound use BB for [mu_H^-1].

The consuming constructions use this interface as follows. AP9 infinite_special: Defines the Hodge–Tate side of special subvarieties at infinite level.

**Checks.**

- A torus domain gives a zero-dimensional special Hodge subvariety.
- A subgroup type with adjoint weight −2 fails the ≥−1 Hodge-domain bound, even if it satisfies an unrelated upper bound.
- When the ambient type itself satisfies ≥−1, the identity inclusion yields the whole domain as a special subvariety.

**Acceptance.** Do not assume without proof that a defining Chevalley line has even weight.

*Needs:* AP7 `hs_domain` (The Hodge period domain); AP7 `ht_line` (Hodge–Tate loci of lines); AP7 `ht_rigid_closed` (Rigid closedness of Hodge–Tate loci); AP5 `bb_bound` (Adjoint-weight BB criterion); AP5 `subgroup_gr` (Subgroup immersion criterion); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

### Examples

For V=Q_p(−n) of weight 2n the lattice is Fil^n, and its rational line satisfies the Hodge–Tate inclusion everywhere. At n=−1 this is Fil^(−1), a fractional lattice. Substituting B_dR+ for Fil^n would reject this valid line. At a general rank-one lattice Fil^a, the underlying ideal containment Fil^n⊂Fil^a is equivalent to n≥a. (HK II Definition 6.3.1, pp. 37–38.)

In a subgroup construction, centrality of the basic Newton homomorphism puts a Chevalley defining line into one weight space. Rank-one purity forces that weight to be even. These are the reasons the line locus applies; neither is an extra guess about a representation. For the full ambient domain, nonemptiness comes from pointwise existence. Its geometric connectedness is the consequence of duality in AP9, which avoids using it to prove that same duality. (HK II Proposition 6.4.1, p. 39, and Theorem 8.5.1, p. 54.)

A Hodge family need not carry a global isocrystal frame. Its constant-slope bundle can have a nontrivial G_b(Q_p)-frame torsor even though each geometric fibre corresponds to a basic admissible pair. A neutral admissible inverse therefore requires a globally constant isocrystal realization and its chosen frame, in addition to the étale frame used for the forward construction.

### Dependencies

- AP2.
- AP4.
- `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`.
- `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.
- `MotivesAndAlgebraicCycles:MC.6`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`.
- AP1.
- AP5.
- `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.
- `DiamondsAndVStacks:D6/etale-site-comparison`.
- `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.


## Layer AP8: Hodge loci and special admissible subspaces

Define Hodge loci and functorial maps, prove closedness of subgroup admissible loci using the neutral component of the tensor-Isom torsor kernel, and define special subdiamonds and rigid special subvarieties. Compute torus, Lubin–Tate and parabolic boundary examples.

### 8.1 Hodge loci of sub-isocrystal lines

Define `hodge_line`. For a b-rigidified family with isocrystal W and a rank-one sub-isocrystal ell≅Q_p-breve(n), define Hdg(ell) by ell⊗Fil^n B_dR⊂L_et. This is a closed subdiamond. Changing b by sigma-conjugation transports ell and the locus. On a seminormal rigid base of fixed type it is rigid Zariski closed, by BB and closed flag incidence. It detects whether MG stabilizes the line in the isocrystal realization.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 7.4.1, Remark 7.4.2, Lemmas 7.4.3–7.4.4, pp. 45–46.)

The interface consists of the following operations and laws.

- `hodge_line.closed`: Hdg(ell) is represented by a closed subdiamond, and by a closed rigid subspace on fixed-type seminormal rigid bases.
- `hodge_line.sigma_transport`: g:b→b′ carries Hdg(ell) to Hdg(g ell).
- `hodge_line.mg_stabilizer`: A geometric point lies in Hdg(ell) iff the isocrystal-realized MG fixes ell.
- `hodge_line.pullback`: The same fixed line condition commutes with pullback of the family.

Translate line inclusion to the integral-locus condition. At geometric points invoke rank-one admissibility to identify the stabilized subobject. For rigid bases use the trace flag and resolution descent.

The consuming constructions use this interface as follows. AP8 subgroup_admissible: Defines the full Hodge locus of a Chevalley line. AP10 exceptional: Detects failure of the generic group by a proper line condition.

**Checks.**

- For the Tate pair of index n, ell has Frobenius p^-n and L_et=Fil^n, so its Hodge line locus is the entire base.
- Sigma-conjugating b without also moving ell need not preserve the named locus; moving both does.
- For n<0 the condition uses the fractional ideal Fil^n B_dR, so replacing it by B_dR+ excludes valid Tate pairs.

**Acceptance.** Hodge and Hodge–Tate loci use their respective rational structures and lattices.

*Needs:* AP6 `family_adm` (Neutral admissible pairs in families); AP6 `family_groups` (G-families and canonical reduction); AP4 `integrality` (Closed integrality locus); AP5 `rigid_cells` (Rigid sources and Griffiths transversality).

### 8.2 Functoriality of admissible loci

Construct `admissible_functoriality`. For f:H→G, b_H,b_G and g∈G(Q_p-breve) with g f(b_H) sigma(g)^-1=b_G, define Gr_H^{b_H-adm}→Gr_G^{b_G-adm} by L↦g f_*L. It pulls the universal G-pair back to extension of structure group of the universal H-pair, sends [mu_H] to its induced G-type, and is compatible with composition and changes of g.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §7.5, equation (7.5.0.1), p. 46.)

The interface consists of the following operations and laws.

- `admissible_functoriality.formula`: The represented lattice map is exactly g f_*L.
- `admissible_functoriality.composition`: Composition uses the product g2 f2(g1) and agrees with extension of tensor functors.
- `admissible_functoriality.universal_pair`: Pullback of the G-universal pair is f_* of the H-universal pair with the g-rigidification.
- `admissible_functoriality.type`: A good H-type maps to its induced good G-type.

Extend the lattice and modified bundle along f. Use g to identify the source isocrystal with W_bG. Check functoriality on the representing moduli problem.

The consuming constructions use this interface as follows. AP8 special_admissible: Embeds subgroup spaces. AP9 infinite_functoriality: Lifts the map after adding étale trivializations.

**Checks.**

- For f=id and g=1 this is the identity map.
- For an inner-conjugate embedding, the lattice is moved by the specified g, including its isocrystal rigidification.
- An ordinary conjugacy relation g f(b_H) g^-1=b_G is insufficient unless sigma(g)=g.

**Acceptance.** The conjugating element belongs to G(Q_p-breve), not to the coefficient field alone.

*Needs:* AP6 `admissible_locus` (b-rigidified admissible loci); AP6 `family_groups` (G-families and canonical reduction); AP1 `sigma_centralizer` (Sigma-centralizer and inner form).

### 8.3 Closed subgroup admissible loci

Establish `subgroup_admissible`. For a closed inclusion H≤G and compatible b-data, Gr_H^{b_H-adm}→Gr_G^{b_G-adm} is a closed immersion. A Chevalley line ell for H has Hdg(ell) decomposed into open-and-closed pieces indexed by ker(H^1(Q_p,H)→H^1(Q_p,G)); the neutral piece is the indicated H-admissible locus after the chosen isocrystal rigidification. In general it is only one piece of Hdg(ell), and the whole preimage of the G-admissible locus in Gr_H is not H-admissibility.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 7.5.2 and Remark 7.5.3, pp. 47–48, with the tensor-torsor kernel correction.)

Use the Chevalley line to obtain a reduction on its closed Hodge locus. Classify fibre-functor forms by the indicated H^1 kernel. The form is locally constant, so its neutral component is clopen and hence closed within the Hodge locus. Identify this neutral component with the represented H-admissible functor.

**Acceptance.** An SL_2/anisotropic-torus test rules out replacing the neutral piece by the entire Hodge locus.

*Needs:* AP8 `admissible_functoriality` (Functoriality of admissible loci); AP8 `hodge_line` (Hodge loci of sub-isocrystal lines); AP5 `subgroup_gr` (Subgroup immersion criterion); `MotivesAndAlgebraicCycles:MC.6`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`; `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

### 8.4 Special admissible subspaces

Define `special_admissible`. A special subdiamond of Gr_G^{b-adm} is the image of Gr_H^{b_H-adm} under compatible closed connected subgroup data and sigma-conjugation. A special subvariety in a fixed G-type cell is the image of a nonempty Gr_[mu_H]^{b_H-adm} with [b_H]∈B(H,[mu_H^-1]), inducing the ambient type and satisfying all weights of Ad_H mu_H≤1. This image is a closed geometrically connected rigid analytic subdiamond of the entire admissible locus.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definitions 7.5.4 and 7.5.6, Lemma 7.5.5, p. 48.)

The interface consists of the following operations and laws.

- `special_admissible.closed_subdiamond`: The full special subdiamond is closed in Gr_G^{b-adm}.
- `special_admissible.rigid_cell`: The upper-bound special subvariety is represented by an open rigid subspace of Fl_[mu_H^-1].
- `special_admissible.connected`: The Kottwitz-membership condition makes the subvariety nonempty and geometrically connected.
- `special_admissible.change_rigidification`: Changing g acts through the ambient G_b(Q_p)-action and transports the special space.

Use closed subgroup admissibility. The upper adjoint bound implies Levi-minuscule type and identifies the cell with a flag variety. Intersect its closed cell with the open admissible locus and apply connectedness.

The consuming constructions use this interface as follows. AP9 infinite_special: Defines Hodge-special subvarieties by lifting these spaces. AP11 Ax–Lindemann: Identifies the closures obtained from an analytic subset.

**Checks.**

- A torus datum gives a special point with both adjoint bounds vacuous.
- Incompatible b_H and mu_H give an empty locus and cannot supply a nonempty special subvariety.
- A subgroup type with an adjoint weight 2 is not declared a rigid Hodge-special subvariety by this definition.

**Acceptance.** A special cell without the upper bound need not be closed in the ambient fixed-type cell.

*Needs:* AP8 `subgroup_admissible` (Closed subgroup admissible loci); AP6 `admissible_connected` (Geometric connectedness of admissible loci); AP5 `bb_bound` (Adjoint-weight BB criterion); AP5 `grass_geometry` (Grassmannian geometry and Schubert loci).

### 8.5 Torus and Lubin–Tate special points

Establish the application `torus_lubin_tate`. For a torus T, a specified cocharacter class over Q_p-breve gives a single admissible point over its composite reflex field when its Kottwitz invariant matches b; over C the cocharacters are indexed separately, while before that base change use their Galois orbits. In the height-two Lubin–Tate case a quadratic CM field F gives the special period points P^1(F), moved in quaternionic G_b(Q_p)-families. These are local special points, without a global CM algebraicity condition.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Example 7.5.7 and Remark 7.5.8, pp. 48–49.)

Use the torus Kottwitz formula and trivial adjoint representation. For height two identify maximal tori in the quaternionic inner form and their period flags through the tower comparison. Track the field/reflex base in each indexing set.

**Acceptance.** Avoid counting inertia conjugates twice over Q_p-breve([mu]).

*Needs:* AP8 `special_admissible` (Special admissible subspaces); `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`; `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`; `BunGAndNewtonStrata:BG1/torus-norm-description`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.

### 8.6 Borel and parabolic boundary examples

Establish the application `boundary_examples`. Let H be the upper triangular Borel of G=GL_2, and let mu_G(t)=diag(t^-1,1). Write L_[a:c]=R^2+R xi^-1(a e1+c e2). For b=diag(p,1), G-admissibility means a≠0, whereas H-admissibility in the full preimage means c=0. Thus a c≠0 gives an ambient-admissible point that is not subgroup-admissible. With b=diag(1,p), the particular H-cell <e1,xi^-1(e2+x e1)> is A^1 and maps isomorphically to the G-admissible part P^1 minus [e1]; both loci are H-admissible there. Separately, for G=GL_3 and H stabilizing the span of e1,e2, the family <e1,e2+(z/xi)e1,e3+(1/xi)e1> has constant G-type (1,0,−1); its GL_2×GL_1 Levi type is (1,−1;0) for z≠0 and (0,0;0) at z=0. Therefore a subgroup cell can fail to be closed in an ambient fixed-type cell, and subgroup Schubert decompositions need not be intersections with ambient cells.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Remark 7.5.3, p. 47; Example 7.5.10, pp. 49–50.)

Compute elementary divisors and induced Levi lattices in the displayed bases. Separate G-triviality of the modified bundle from the H-fibre-functor neutrality condition. Compare the nonzero-z locus with its limit at zero.

**Acceptance.** The Borel’s b is diag(1,p) for the A^1 assertion; the reversed diagonal describes a different example.

*Needs:* AP8 `special_admissible` (Special admissible subspaces); AP5 `faithful_cutout` (Faithful-representation cutout); AP4 `relative_bilattice` (Relative bilattices and their type).

### Examples

Let H be the upper triangular Borel in GL_2 and L_[a:c]=R²+R ξ^(−1)(a e1+c e2), with type diag(t^(−1),1). For b=diag(p,1), the negative-slope e1 isocrystal subline forces a≠0 for ambient admissibility. H-admissibility additionally requires the e1 subpair to be admissible, which forces c=0. Thus the point [1:1] is ambient-admissible and fails subgroup admissibility. For b=diag(1,p), the cell ⟨e1,ξ^(−1)(e2+x e1)⟩ is A¹, maps to P¹ minus [e1], and is H-admissible throughout. These are different diagonal data. (HK II Remark 7.5.3, p. 47, with the diagonal and neutrality distinctions retained.)

The GL_3 parabolic stabilizing ⟨e1,e2⟩ gives another boundary. For ⟨e1,e2+(z/ξ)e1,e3+(1/ξ)e1⟩ the ambient type is (1,0,−1) throughout. At z≠0 its Levi type is (1,−1;0); at zero its Levi type is trivial. All these points are b=1 admissible by their filtration with unit admissible graded pieces. The punctured-disc subgroup cell is therefore not closed inside the ambient fixed-type intersection. (HK II Example 7.5.10, pp. 49–50.)

For the neutral-piece issue take the norm-one torus T of an unramified quadratic E/Q_p inside SL_2. Here H¹(Q_p,T)=Q_p×/N(E×) has a nontrivial class represented by an element of odd valuation, while H¹(Q_p,SL_2) is trivial. An odd cocharacter gives that nonneutral T-fibre-functor form inside a neutral ambient SL_2 object. Consequently the full Chevalley-line Hodge locus can contain a nonneutral piece. Only its neutral piece represents the specified T-admissible functor. This is the tensor-torsor interpretation of Proposition 7.5.2, p. 47.

### Dependencies

- AP6.
- AP4.
- AP5.
- AP1.
- `MotivesAndAlgebraicCycles:MC.6`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.
- `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.
- `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.
- `BunGAndNewtonStrata:BG1/admissible-finiteness-and-basic`.
- `BunGAndNewtonStrata:BG1/torus-norm-description`.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.


## Layer AP9: Infinite-level spaces and basic duality

Represent pairs with both isocrystal and étale trivializations, describe modifications and period torsors, define the three kinds of special subvariety, and prove basic duality and connectedness of the Hodge domains without a circular dependency.

### 9.1 Infinite-level admissible moduli

Define `infinite_moduli`. M_b(Y) is the sheaf of neutral G-admissible pairs with a b-rigidification of their isocrystal realization and an étale trivialization omega_et≅omega_std. Equivalently it classifies modifications E_b⇢E_1 at the untilt, with both bundles fixed and the isomorphism away from the divisor retained. The good type-[mu] part is M_{b,[mu]}. The two trivialization groups act through G_b(Q_p) and G(Q_p), and the actions commute.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §§8.1–8.2, pp. 50–51.)

The interface consists of the following operations and laws.

- `infinite_moduli.frame_torsor`: M_b is the G(Q_p)-torsor of étale tensor frames of the universal pair on Gr_G^{b-adm}.
- `infinite_moduli.modification`: The moduli functor equals modifications E_b⇢E_1 with both ends fixed.
- `infinite_moduli.commuting_actions`: Changes of isocrystal and étale frames give commuting G_b(Q_p) and G(Q_p) actions.
- `infinite_moduli.type`: M_{b,[mu]} is the pullback of Gr_[mu]^{b-adm}.

Apply the represented b-rigidified moduli functor and take its étale frame torsor. Use patching to recover the modification with fixed ends. Check the two commuting changes of trivialization.

The consuming constructions use this interface as follows. AP9 period_torsors: Defines both lattice period maps and finite levels. AP11 analytic_closures: Supplies the two tower structures.

**Checks.**

- M_1 for the trivial group is the base point.
- For compatible G_m data the lattice period targets are points, while the étale frame fibre is Q_p×.
- Two different étale trivializations of the same b-rigidified pair are distinct M_b-points.

**Acceptance.** A modification includes its isomorphism off infinity; retaining only the two bundles loses the moduli.

*Needs:* AP6 `admissible_locus` (b-rigidified admissible loci); AP6 `family_adm` (Neutral admissible pairs in families); AP1 `sigma_centralizer` (Sigma-centralizer and inner form); `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`; `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.

### 9.2 The two period maps

Construct `period_torsors`. On M_{b,[mu]}, pi_Let sends a modification to L_et∈Gr_[mu]^{b-adm}; it is a G(Q_p)-torsor. pi_LdR records L_dR in the Grassmannian of the trivial étale fibre. If b is basic, its image is X_[mu] and pi_LdR is a G_b(Q_p)-torsor. Their BB composites are the Hodge map to Fl_[mu^-1] and the Hodge–Tate map to Fl_[mu]. Compact-open quotients give the respective finite levels; inverse limits recover M after checking sheaf descent and cofinality.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §8.3, equations (8.3.0.1)–(8.3.0.2), pp. 51–52; Lemma 8.3.1, p. 52; §1.1, p. 5.)

The interface consists of the following operations and laws.

- `period_torsors.hodge`: BB∘pi_Let lands in Fl_[mu^-1], with the Hodge rational structure W_b.
- `period_torsors.hodge_tate`: BB∘pi_LdR lands in Fl_[mu], with the étale rational structure.
- `period_torsors.torsors`: The two torsor groups are G(Q_p) for pi_Let and G_b(Q_p) for pi_LdR when b is basic.
- `period_torsors.levels`: The compatible compact-open quotient diagrams recover the respective pro-étale tower and its limit.

Read L_et and L_dR from the same comparison c_dR. Identify the frame fibres as the corresponding rational-point torsors. In the basic case transfer the slope grading and apply the Hodge moduli interpretation. Take level quotients in sheaves before proving the inverse-limit identification.

The consuming constructions use this interface as follows. AP9 infinite_special: Compares specialness under each period structure. AP11 orbit_submersion: Works at finite level étale over the appropriate lattice target.

**Checks.**

- For a diagonal type (a1,…,an), the two flags have opposing cocharacter classes.
- Without basicness pi_LdR is not asserted to be a G_b(Q_p)-torsor onto a Hodge domain.
- For reductive minuscule data, BB identifies the lattice targets with the usual open flag period domains and gives the two familiar analytic towers.

**Acceptance.** The second torsor structure has a basicness hypothesis.

*Needs:* AP9 `infinite_moduli` (Infinite-level admissible moduli); AP7 `hs_domain` (The Hodge period domain); AP2 `basic_equivalence` (Basic pairs and Hodge structures); AP1 `basic_strata` (Basic-stratum theorem); AP5 `bb_bound` (Adjoint-weight BB criterion); `ReductiveGroupsPartII:RG2.0/scheme-point-topology`; `ReductiveGroupsPartII:RG2.0/points-topological-group`; `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`; `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.

### 9.3 Functoriality at infinite level

Construct `infinite_functoriality`. For compatible (f:H→G,b_H,b_G,g) as in AP8, extend the pair and its étale frame along f and transport its isocrystal frame by g. This gives M_bH^H→M_bG^G, preserves the induced type, and commutes with both lattice period maps and their flag maps. For closed subgroup data use the resulting embedded images and their geometric connected components.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §8.4, p. 52.)

The interface consists of the following operations and laws.

- `infinite_functoriality.compose`: The maps compose with the same sigma-conjugating product as in AP8.
- `infinite_functoriality.period_compatibility`: Both period squares commute, including their BB composites.
- `infinite_functoriality.group_actions`: Actions transport under f and the induced f_b on inner forms.
- `infinite_functoriality.closed_images`: Compatible closed subgroup data induce the subgroup moduli image used to define infinite-level special spaces.

Apply extension of structure group to the represented pair with both frames. Compare each frame change with the two commuting rational group actions. Check the maps on the modification description.

The consuming constructions use this interface as follows. AP9 infinite_special: Embeds the subgroup moduli whose components are special.

**Checks.**

- Identity subgroup data give the identity moduli map.
- A torus source has zero-dimensional period domains but can retain nontrivial frame torsors.
- A change of isocrystal frame acts through the induced inner-form map, not through an unmodified copy of H(Q_p).

**Acceptance.** The isocrystal conjugation uses Q_p-breve-points; the étale frame uses Q_p-points.

*Needs:* AP9 `infinite_moduli` (Infinite-level admissible moduli); AP9 `period_torsors` (The two period maps); AP8 `admissible_functoriality` (Functoriality of admissible loci).

### 9.4 Hodge and Hodge–Tate special subvarieties

Define `infinite_special`. For M=M_{b,[mu]}, compatible connected H≤G, a class [mu_H] inducing [mu], and an H-basic [b_H]∈B(H,[mu_H^-1]), take a geometric connected component of the image of M^H_{b_H,[mu_H]} in M_C. It is Hodge special if all Ad_H(mu_H)-weights are ≤1, and, when the ambient b is G-basic and b_H is H-basic, Hodge–Tate special if all are ≥−1. It is special if all lie in [−1,1]. Require the source data and embedding, rather than defining these adjectives by the conclusion of Ax–Lindemann.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 8.4.1, pp. 52–53.)

The interface consists of the following operations and laws.

- `infinite_special.hodge_bound`: The upper bound ≤1 identifies the Hodge-special class.
- `infinite_special.ht_bound`: When the ambient b is G-basic (and with the H-basic subgroup datum), the lower bound ≥−1 identifies the Hodge–Tate-special class.
- `infinite_special.two_bounds`: Special subgroup data satisfy both bounds.
- `infinite_special.actions`: The rational group actions and compatible subgroup conjugations transport these subvarieties.

Use the two subgroup period descriptions to identify their respective rigid special bases. Take geometric connected components of the full subgroup moduli image. Track which one-sided bound belongs to which period structure.

The consuming constructions use this interface as follows. AP9 special_equivalence: Tests whether both special notions are realized by one canonical subgroup. AP11 bi_analytic: Gives the algebraic description of the analytic closures.

**Checks.**

- Torus subgroup data satisfy all three notions.
- For E/Q_p unramified cubic and the mirabolic subgroup of Res_E/Qp GL_2, the type with jumps (1,1,−2) in Example 8.4.4 supplies a Hodge-special component that is not Hodge–Tate special.
- The GL_4 minuscule example in HK II 1.1.4 admits non-reductive special subgroup data; specialness must not require H reductive.

**Acceptance.** The three classes can differ even for reductive ambient G.

*Needs:* AP9 `infinite_functoriality` (Functoriality at infinite level); AP8 `special_admissible` (Special admissible subspaces); AP7 `special_hs` (Special Hodge subvarieties).

### 9.5 Comparison of the three special notions

Establish `special_equivalence`. Assume b is basic. A closed connected subdiamond of M_C is special iff it is both Hodge special and Hodge–Tate special. Use the connected motivic/Mumford–Tate group of its restricted universal object to choose a common subgroup. If the ambient [mu] is minuscule, all three notions agree for every subgroup datum. Independently, for a reductive subgroup H the upper, lower and two-sided adjoint-weight conditions are equivalent, by symmetry of its root weights. In general a Hodge-special subvariety need not be Hodge–Tate special, as in the mirabolic example.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemma 8.4.2, Remark 8.4.3 and Example 8.4.4, p. 53.)

One direction follows from the simultaneous bounds. For the converse reduce to the canonical group of the restricted object; its adjoint weights inherit both bounds from the two descriptions. Use symmetry of reductive adjoint weights for the minuscule comparison.

**Acceptance.** Connected components and basicness are explicit.

*Needs:* AP9 `infinite_special` (Hodge and Hodge–Tate special subvarieties); AP6 `family_groups` (G-families and canonical reduction); AP2 `basic_equivalence` (Basic pairs and Hodge structures).

### 9.6 Basic duality

Establish `basic_duality`. For G-basic b, inversion of the modification followed by the inner twist gives an isomorphism M^G_{b,[mu]}≅M^{G_b}_{b^-1,[mu^-1]}, after the compatible coefficient/reflex base change. It exchanges pi_Let with pi_LdR, G(Q_p) with G_b(Q_p), and Hodge special with Hodge–Tate special, while preserving special subvarieties. The inverse construction recovers the original frames and modification.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 8.5.1, p. 54.)

Invert E_b⇢E_1 to obtain E_1⇢E_b. Apply F_b so its ends become E_b^-1 and E_1. Invert the comparison matrix and swap the two lattices; transport group actions through the twist. Negating all adjoint weights exchanges the two inequalities.

**Acceptance.** The comparison matrix is inverted; a transpose requires extra duality choices and is not the construction.

*Needs:* AP1 `basic_twisting` (Basic twisting of bundle stacks); AP9 `period_torsors` (The two period maps); AP9 `infinite_special` (Hodge and Hodge–Tate special subvarieties).

### 9.7 Geometric connectedness of Hodge domains

Establish `hs_domain_connected`. The nonempty Hodge domain X_[mu] of AP7 is geometrically connected. Under basic duality its period-base presentation is the b^-1-admissible locus of G_b for the inverse cocharacter; apply AP6 geometric connectedness to that locus. The proof uses only the already established non-reductive admissible connectedness, not connectedness of X as an input to duality.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 6.2.3, p. 37; Theorem 8.5.1, p. 54.)

Descend basic duality along the rational-point torsor identified in AP9. Identify the resulting base with the inverse-type inner-form admissible locus. Apply AP6 after algebraically closed base change.

**Acceptance.** The dependency order prevents the forward reference in the source from becoming a formalization cycle.

*Needs:* AP9 `basic_duality` (Basic duality); AP6 `admissible_connected` (Geometric connectedness of admissible loci); AP7 `hs_domain` (The Hodge period domain).

### Examples

Let E/Q_p be cubic, G=Res_(E/Q_p) GL_2 and H=E×⋉E its mirabolic subgroup. After splitting over C take μ_H with multiplicative weights (1,1,−2); use b_H=b=1. On Lie H the weights are 0,1,−2. They satisfy the upper bound and violate the lower bound. The corresponding component is Hodge special and fails Hodge–Tate specialness. Its inverse type has the opposite behavior. (HK II Example 8.4.4, p. 53.)

Conversely, in GL_4 of minuscule type diag(t,t,1,1), every compatible subgroup inherits adjoint weights in [−1,1]. A parabolic with Levi GL_2×GL_2, one jump in each block, can support nontrivial extensions of two height-two formal groups, so special subgroup data can be non-reductive. Minuscule ambient type suffices for agreement of all three notions. (HK II Example 1.1.4 and Remark 8.4.3, pp. 5–6, 53.)

For G_m and b=p^n the inner twist is trivial and duality changes n to −n and μ to μ^(−1). For a noncommutative group the same inversion also changes σ to Int(b)∘σ. Interchanging only the lattice exponents would miss the second rational group and its torsor. (HK II Lemma 4.2.3 and Theorem 8.5.1, pp. 28–29, 54.)

### Dependencies

- AP6.
- AP1.
- `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`.
- `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`.
- AP7.
- AP2.
- AP5.
- `ReductiveGroupsPartII:RG2.0/scheme-point-topology`.
- `ReductiveGroupsPartII:RG2.0/points-topological-group`.
- `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`.
- `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.
- AP8.


## Layer AP10: Hodge-generic points and exceptional loci

Define the exceptional and generic loci for the full family group, prove countable closedness, and combine weakly Shilov avoidance with Baire category and resolution to obtain dense generic classical points on irreducible rigid bases.

### 10.1 Hodge-exceptional and generic loci

Define `exceptional`. For a b-rigidified neutral family on connected Y with full family group G, the exceptional locus is the union of Hdg(ell) over all lines in all algebraic representations that are not Hodge on all of Y; the generic locus is its complement. Meeting the generic locus forces a connected subfamily to have full group G. At a single point genericity is equivalent to equality of its group with the family group. The converse for an arbitrary subfamily is not asserted.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 9.3.2 and corrected Lemma 9.3.3, p. 59.)

The interface consists of the following operations and laws.

- `exceptional.complement`: Generic points are exactly those outside every non-global Hodge line locus.
- `exceptional.point_group`: At y, genericity iff MG_y equals the family group after the chosen fibre identification.
- `exceptional.meets`: A connected subfamily meeting the generic locus has full generic group.
- `exceptional.conjugation`: A change of b-rigidification transports the exceptional and generic subsets.

Use Chevalley lines to detect a proper connected subgroup. Separate lines already Hodge everywhere from exceptional ones. For the forward direction restrict a non-global Hodge condition to the subfamily.

The consuming constructions use this interface as follows. AP10 generic_density: Identifies the set whose classical points must be dense. AP11 orbit_submersion: Supplies a classical point with full open Galois image.

**Checks.**

- For a constant family the generic locus is all of Y relative to its actual pointwise group.
- Choose two CM points with distinct conjugate tori generating GL_2 and take their disconnected two-point subdiamond. Its joint tensor group is GL_2, although both points are exceptional for the ambient family.
- For a one-point subfamily, the full-group criterion is equivalent to genericity.

**Acceptance.** An arbitrary subfamily can have full group while lying in a union of distinct proper Hodge loci; the two-point disconnected example shows why the converse is false.

*Needs:* AP8 `hodge_line` (Hodge loci of sub-isocrystal lines); AP6 `family_groups` (G-families and canonical reduction); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

### 10.2 Countable closedness of the exceptional locus

Establish `exceptional_countable`. For a b-rigidified neutral G-family on a locally spatial base with full group G, its exceptional locus is a countable union of closed subsets. Over a fixed-type rigid base, individual proper Hodge line loci are proper rigid Zariski closed. The countably many closed pieces in the first assertion need not themselves be single Hodge loci.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proposition 9.3.4, pp. 59–60.)

Choose countably many finite-dimensional representations exhausting the regular representation and their exterior powers. Parameterize rank-one sub-isocrystals in finite-dimensional rational projective spaces. Exhaust the non-global lines by compact subsets; properness of the parameter projection makes the incidence images closed. Take the countable union over all bounds and representations.

**Acceptance.** Countability of Q_p-points is not used: those point sets are uncountable.

*Needs:* AP10 `exceptional` (Hodge-exceptional and generic loci); AP8 `hodge_line` (Hodge loci of sub-isocrystal lines); AP4 `integrality` (Closed integrality locus); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `ReductiveGroupsPartII:RG2.0/scheme-point-topology`; `ReductiveGroupsPartII:RG2.0/points-topological-group`; `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`; `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.

### 10.3 Dense Hodge-generic classical points

Establish `generic_density`. For a smooth connected rigid S over p-adic L⊇Q_p-breve and a b-rigidified neutral family with its actual full group, every weakly Shilov point is Hodge generic and generic classical points are dense. For any irreducible rigid Z/L with such a family, generic classical points are dense in |Z|. Geometric irreducibility is unnecessary for this latter lemma; pass to the finite constant field to fix type and take a connected resolution.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Lemmas 9.3.1 and 9.3.5, pp. 58, 60; Corollaries 9.3.4 and 9.3.6, pp. 59–61.)

Each proper Hodge locus is analytic and nowhere dense, hence avoids weakly Shilov points. On a classical field-valued disc apply Baire to the countable closed exceptional pieces. If a piece contained an open classical disc, closedness plus infinite residue would put its Gauss point in that piece, contradicting Shilov avoidance. Resolve irreducible Z, retain connectedness, and push the dense classical generic points down.

**Acceptance.** Only infinite residue is used by the Gauss-point step; L⊇Q_p-breve supplies it.

*Needs:* AP10 `exceptional_countable` (Countable closedness of the exceptional locus); AP6 `family_type` (Good type over rigid bases); `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`; `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset`; `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`; `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points`; `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure`; `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point`; `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense`; `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`; `mathlib:dense_iInter_of_isOpen`; `mathlib:nonempty_interior_of_iUnion_of_closed`.

### Examples

Two distinct CM points can have conjugate torus groups whose generated group is GL_2. Their disconnected union has joint tensor group GL_2, although each point is exceptional relative to a full GL_2 family. This disproves the converse “full subfamily group implies meeting the generic locus” without making a claim about connected subfamilies. At a single point the equivalence with full group holds. (HK II Definition 9.3.2 and the forward direction of Lemma 9.3.3, p. 59.)

The Baire argument uses countably many closed incidence images; the individual line loci can be uncountable. A weakly Shilov point avoids each proper analytic Hodge locus, hence every exceptional point is excluded there. If one closed incidence image contained an open disc of classical field-points, the infinite-residue Gauss-point criterion would force it to contain a weakly Shilov point, a contradiction. Then Baire gives generic classical points. Over a finite residue field of size q, the topological closure of the rational subset |x^q−x|≤|π| contains all integral field-points of the unit disc and misses its Gauss point: the rational neighborhood |π|≤|x^q−x|² of that Gauss point is disjoint from the subset. Thus the infinite-residue condition matters; here L contains Q_p-breve. (HK II Lemmas 9.3.1, 9.3.5, pp. 58, 60–61.)

### Dependencies

- AP8.
- AP6.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.
- AP4.
- `ReductiveGroupsPartII:RG2.0/scheme-point-topology`.
- `ReductiveGroupsPartII:RG2.0/points-topological-group`.
- `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`.
- `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.
- `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`.
- `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset`.
- `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`.
- `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points`.
- `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure`.
- `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point`.
- `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense`.
- `AdicSpacesPartIIPartII:RZ.5/resolution-consequences`.
- `mathlib:dense_iInter_of_isOpen`.
- `mathlib:nonempty_interior_of_iUnion_of_closed`.


## Layer AP11: Bi-analytic Ax–Lindemann and period-image density

Define the two analytic closures through compact level quotients, prove special analytic closedness and the generic-point orbit/submersion argument, establish Theorem 9.1.3 and its minuscule Theorem A, and prove Theorem B without assuming basicness. Record the nonbasic Serre–Tate counterexample.

### 11.1 Analytic Zariski closures

Define `analytic_closures`. Let G be connected linear, [b] a G-basic class in B(G,[mu^-1]), M=M_{b,[mu]}, L/Q_p-breve([mu]) p-adic, C=completed algebraic closure of L and I=Gal(Lbar/L). For A⊂|M_C| define its Hodge analytic closure as the intersection of inverse images of all closed rigid analytic subdiamonds of M_C/K containing A, for compact open K≤G(Q_p)×I, defined over C^K. Use K≤G_b(Q_p)×I for the Hodge–Tate closure. An irreducible analytic set of either kind is a connected component of the preimage of an irreducible locally closed rigid analytic subdiamond at a level of that kind. A bi-analytic subdiamond is locally closed and irreducible analytic in both senses. An empty defining intersection equals all of |M_C|.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 9.1.1 and Remark 9.1.2, p. 55.)

The interface consists of the following operations and laws.

- `analytic_closures.contains`: A is contained in each of its analytic closures.
- `analytic_closures.minimal`: Its closure is contained in every qualifying level-pullback that contains A.
- `analytic_closures.empty_index`: If no qualifying closed rigid analytic subdiamond contains A, its analytic closure is the whole ambient space.
- `analytic_closures.duality`: Basic duality exchanges the two defining index systems and their closures.

Use the compact level presentations and keep the induced finite field C^K. Define intersections of subsets/sub-v-sheaves using their universal property. Retain connected components in the irreducible analytic convention.

The consuming constructions use this interface as follows. AP11 ax_lindemann: States exactly the opposite analytic closure of an irreducible analytic set. AP12 shimura_products: Transports the two structures through local uniformization charts.

**Checks.**

- A qualifying level-pullback containing A bounds the closure, even if no ambient rigid analytic structure on M is chosen.
- The intersection over the empty family of containing subdiamonds is all of M_C.
- For nonminuscule data the definition does not assert that finite unions of qualifying closed rigid subdiamonds are qualifying rigid subdiamonds.

**Acceptance.** For nonminuscule data these are defined intersections; no unproved finite-union closure topology is assumed.

*Needs:* AP9 `period_torsors` (The two period maps); AP4 `rigid_subdiamond` (Rigid analytic subdiamonds); `ReductiveGroupsPartII:RG2.0/scheme-point-topology`; `ReductiveGroupsPartII:RG2.0/points-topological-group`; `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`; `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.

### 11.2 Analytic closedness of special subvarieties

Establish `special_analytic_closed`. Under the assumptions of analytic_closures, every Hodge-special subvariety is Hodge analytically Zariski closed and an irreducible Hodge analytic set. Every Hodge–Tate-special subvariety has the corresponding two Hodge–Tate properties. Thus a special subvariety is closed and irreducible analytic for both structures.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 9.1.3(1), p. 55; proof, pp. 56–57.)

Realize a subgroup’s full locus by closed Hodge-line conditions at finite levels. Choose compact open level and component to recover the given connected special subvariety as an intersection of such pullbacks. Apply duality for the opposite structure.

**Acceptance.** Use the inner-form subgroup H_bH on the Hodge–Tate level side.

*Needs:* AP11 `analytic_closures` (Analytic Zariski closures); AP9 `infinite_special` (Hodge and Hodge–Tate special subvarieties); AP8 `special_admissible` (Special admissible subspaces); AP7 `special_hs` (Special Hodge subvarieties); AP9 `basic_duality` (Basic duality).

### 11.3 Connected-component formula for closure

Establish `component_closure`. For a connected lifted irreducible Hodge analytic set Ztilde, if the index family for its Hodge–Tate closure is nonempty, that closure equals the intersection of the connected components of level-pullbacks containing Ztilde. The rigid targets may be restricted to connected ones; after canonical motivic reduction H, use levels K′_b=(g H_bH(Q_p) g^-1×I)∩K_b, not H(Q_p) on this inner-form side.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proof of Theorem 9.1.3, equation (9.2.0.1), pp. 56–57, with the inner-form level correction.)

Use connectedness of Ztilde to select its component in each pullback. Refine levels and impose the Hodge–Tate line equations defining the canonical reduction. Intersect over the cofinal compatible component systems.

**Acceptance.** State the nonempty-index hypothesis separately from the empty-intersection case.

*Needs:* AP11 `analytic_closures` (Analytic Zariski closures); AP6 `family_groups` (G-families and canonical reduction); AP11 `special_analytic_closed` (Analytic closedness of special subvarieties).

### 11.4 Generic-point period submersion

Establish `orbit_submersion`. After replacing a connected rigid family by its canonical full motivic group, let a connected closed rigid target Y at an opposite analytic level contain the image of its lifted family. A Hodge-generic classical point yields an orbit K0·y⊂Y(C) for some compact open K0≤G(Q_p). After translating the lift and shrinking K0, choose a smooth locally closed stratum V⊂Y containing this orbit on which the flag-map differential has constant rank. That rank equals dim Fl_[mu]. Griffiths transversality then forces all Ad(mu)-weights ≥−1; BB for the inverse type is an isomorphism, and Y is the connected component of that finite-level ambient space containing y.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Proof of Theorem 9.1.3, pp. 57–58.)

Pass to the strict completed maximal unramified extension of the residue field of the generic classical point and use an open inertia orbit contained in the original orbit. Descend through strata of strictly decreasing dimension until rank is constant on a stratum meeting that orbit openly. Constant rank produces a transverse vanishing coordinate if rank is deficient. Pull it back along the submersive G(C)-orbit map; its vanishing on K0 contradicts the identity theorem across Q_p. Surjectivity and Griffiths transversality give the adjoint bound, then the full-dimensional closed-subspace criterion gives the component equality.

**Acceptance.** This proves submersion at the translated lift in the selected smooth stratum; it does not claim smoothness at every original point.

*Needs:* AP10 `generic_density` (Dense Hodge-generic classical points); AP3 `open_galois_image` (Open Galois image); AP6 `family_groups` (G-families and canonical reduction); AP11 `component_closure` (Connected-component formula for closure); AP5 `rigid_cells` (Rigid sources and Griffiths transversality); AP5 `bb_bound` (Adjoint-weight BB criterion); `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed`; `AdicSpacesPartIIPartII:RZ.0/local-dimension`; `AdicSpacesPartIIPartII:RZ.2/singular-stratification`; `AdicSpacesPartIIPartII:RZ.2/rank-loci`; `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`; `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem`; `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion`; `AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`; `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset`.

### 11.5 Bi-analytic Ax–Lindemann theorem

Establish `ax_lindemann`. Let G/Q_p be connected linear, [mu] a cocharacter class admitting a G-basic [b]∈B(G,[mu^-1]), choose b and let M=M_{b,[mu]}. Let L/Q_p-breve([mu]) be p-adic and C=completed algebraic closure of L. Hodge (respectively Hodge–Tate) special subvarieties are closed irreducible analytic sets in their respective structures. The Hodge–Tate analytic closure of an irreducible Hodge analytic set is a Hodge–Tate-special subvariety whenever its defining family of containing closed rigid analytic subdiamonds is nonempty; if that family is empty the closure is all M_C. Interchanging Hodge and Hodge–Tate gives the second assertion. Consequently the closed bi-analytic subdiamonds, with the irreducibility convention in analytic_closures, are exactly the special subvarieties.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem 9.1.3, p. 55; proof, pp. 56–58.)

Reduce the lifted analytic set to its connected canonical motivic group H and its fixed type. In the nonempty-index case apply the submersion argument to every containing connected rigid level target. Each target contains the same component of M^H, whose lower adjoint bound now makes it Hodge–Tate special. Its special analytic closedness identifies the intersection with that component. Use basic duality for the reversed statement and both bounds for the bi-analytic consequence.

**Acceptance.** The empty-index clause and the basicness hypothesis are part of the theorem.

*Needs:* AP11 `special_analytic_closed` (Analytic closedness of special subvarieties); AP11 `component_closure` (Connected-component formula for closure); AP11 `orbit_submersion` (Generic-point period submersion); AP9 `basic_duality` (Basic duality); AP9 `special_equivalence` (Comparison of the three special notions).

### 11.6 Minuscule Ax–Lindemann theorem

Establish `minuscule_ax_lindemann`. For connected linear G/Q_p and [mu] whose adjoint weights all lie in [−1,1], basic [b]∈B(G,[mu^-1]), L as above and C its completed algebraic closure, the opposite analytic closure of any irreducible Hodge or Hodge–Tate analytic set is special. The two analytic closures are the inverse-limit Zariski closures in the corresponding rigid towers. For an algebraic Z′⊂Fl_[mu] over its reflex field, an irreducible component Z of Z′_C∩X_[mu], and a connected component Ztilde of pi_HT^-1(Z), its image’s rigid Zariski closure in a Hodge finite level is a finite-level special subvariety. The zero-dimensional case agrees with the two-lattice CM criterion.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem A, Example 1.1.5 and Remark 1.1.6, p. 6; Definition 1.1.2, p. 5.)

Use BB isomorphisms on both sides of minuscule data. Finite-level spaces are rigid, so the empty-index exception is absent. Identify the two topology-based closures with AP11’s intersections and apply the theorem. Pull back an algebraic flag condition to obtain the stated corollary.

**Acceptance.** Special subgroup data may be non-reductive. For non-reductive ambient G the minuscule convention is the stated two-sided adjoint-weight bound.

*Needs:* AP11 `ax_lindemann` (Bi-analytic Ax–Lindemann theorem); AP9 `period_torsors` (The two period maps); AP3 `cm_transcendence` (Two-lattice CM criterion); AP9 `special_equivalence` (Comparison of the three special notions).

### 11.7 Hodge–Tate period-image density

Establish `period_image_density`. Let Z be a geometrically irreducible rigid analytic variety over a strict p-adic L and A=(W,L_et) a neutral admissible pair on Z^diamond. Its generic motivic Galois group G is connected and its G-structure is good of a single lattice type [mu] defined over L. Put C=completed algebraic closure of L. For a geometric connected component Ztilde of the associated G(Q_p)-torsor on Z_C^diamond, the image pi_HT(Ztilde) is rigid Zariski dense in every connected open of Fl_[mu],L([mu])^diamond that it meets. Basicness is not required.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Theorem B, p. 11; proof, p. 58.)

Obtain the group and type by canonical reduction and the rigid-base theorem. Choose a Hodge-generic classical point. Apply the same orbit/constant-rank argument directly to a closed rigid analytic condition in the flag target, without using duality. Propagate the resulting open flag image within each connected open by the rigid identity theorem.

**Acceptance.** This proof shares the orbit argument, not the basicness-dependent infinite-level duality.

*Needs:* AP6 `family_groups` (G-families and canonical reduction); AP6 `family_type` (Good type over rigid bases); AP10 `generic_density` (Dense Hodge-generic classical points); AP3 `open_galois_image` (Open Galois image); AP5 `rigid_cells` (Rigid sources and Griffiths transversality); `AdicSpacesPartIIPartII:RZ.2/singular-stratification`; `AdicSpacesPartIIPartII:RZ.2/rank-loci`; `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`; `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem`; `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion`; `AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem`.

### 11.8 Nonbasic Serre–Tate boundary

Establish the application `nonbasic_counterexample`. For the Borel of GL_2 with b=diag(p,1) and mu(z)=diag(z^-1,1), the Serre–Tate family gives the nonbasic boundary in HK II Remark 9.1.4: the Hodge–Tate period image is a point, so its closed Hodge–Tate condition does not isolate the canonical torus lift inside the family. A special subvariety can therefore fail to be Hodge–Tate analytically closed without the basic hypothesis.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Remark 9.1.4, p. 56.)

Compute the slope filtration and the fixed Hodge–Tate flag in this ordinary extension family. Identify the torus lift as a proper special subvariety and compare its image with the whole family’s identical flag.

**Acceptance.** The two diagonals in the separate Borel examples serve different purposes and are not interchanged.

*Needs:* AP9 `infinite_special` (Hodge and Hodge–Tate special subvarieties); AP9 `period_torsors` (The two period maps); AP11 `ax_lindemann` (Bi-analytic Ax–Lindemann theorem).

### Examples

If the family of opposite-level closed rigid targets containing A is empty, its intersection is all M_C. Even if M_C is disconnected, this is the defined closure; no connected special component is selected in that case. If the family is nonempty, the orbit argument after canonical motivic reduction supplies a single opposite-special component contained in every such target. Since that component is itself opposite analytically closed, it is exactly the intersection. The suggested file checks both the empty intersection and monotonicity under enlargement of A. (HK II Definition 9.1.1, Remark 9.1.2 and Theorem 9.1.3, p. 55.)

For an irreducible rigid source choose a generic classical point after resolution and passage to its constant field. If its field F is not strict, replace it by the completion F′ of its maximal unramified extension. Restriction to inertia yields an open subgroup in the same motivic group; its orbit is contained in the original orbit. A translate of the lift meets a smooth maximal-rank stratum, after shrinking the compact group. Rank deficiency would produce a transverse coordinate vanishing on that open rational group orbit; pullback along the submersive group orbit map contradicts the identity theorem. Griffiths transversality then gives the lower adjoint bound and the full-dimensional closed-subspace criterion gives the desired component. (HK II proof of Theorem 9.1.3, pp. 57–58, using HK I Corollary 5.5.3.)

The nonbasic ordinary Serre–Tate family has Hodge–Tate period image a point. Its canonical torus lift is proper, but its flag image is identical to that of the whole family. A condition on that image cannot cut out the lift. This witnesses the basicness hypothesis in Ax–Lindemann. Theorem B still applies directly to the image in the flag target of the actual generic group; its orbit argument does not require duality. (HK II Remark 9.1.4, p. 56, and proof of Theorem B, p. 58.)

### Dependencies

- AP9.
- AP4.
- `ReductiveGroupsPartII:RG2.0/scheme-point-topology`.
- `ReductiveGroupsPartII:RG2.0/points-topological-group`.
- `ReductiveGroupsPartII:RG2.0/congruence-neighbourhood-basis`.
- `ReductiveGroupsPartII:RG2.0/smooth-morphism-open-map`.
- AP8.
- AP7.
- AP6.
- AP10.
- AP3.
- AP5.
- `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed`.
- `AdicSpacesPartIIPartII:RZ.0/local-dimension`.
- `AdicSpacesPartIIPartII:RZ.2/singular-stratification`.
- `AdicSpacesPartIIPartII:RZ.2/rank-loci`.
- `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`.
- `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem`.
- `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion`.
- `AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.
- `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`.
- `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset`.


## Layer AP12: Variations and Shimura applications

Define variations and de Rham torsors, construct the crystalline-frame cover and its period map, compute the Katz–Igusa obstruction to rigid refinement, and transport the theorem to basic Hodge-type loci under a precise uniformization hypothesis and to products of Shimura curves.

### 12.1 Variations of p-adic Hodge structure

Define `variation`. For smooth rigid S/L, a variation of p-adic Hodge structure is a finite Q-graded de Rham Q_p-local system L=⊕L_lambda for which each fibre (L_lambda,M0,lambda) is a weight-lambda p-adic Hodge structure. Here M0 is the lattice from the trivial filtration on the associated flat bundle, while the original local system determines the étale rational structure. A G-variation is an exact tensor functor Rep_Qp G into this category. A pro-étale K-torsor for open K≤G(Q_p) is de Rham if its associated representation local systems are de Rham, equivalently for one closed faithful representation.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, Definition 10.1.1 and §10.1, pp. 62–63.)

The interface consists of the following operations and laws.

- `variation.M0`: The second lattice is M0 of the underlying flat bundle with trivial filtration.
- `variation.pullback`: Pullback preserves the graded de Rham system and its weight conditions.
- `variation.G_structure`: Tensor G-variations are independent of a chosen closed faithful representation for the de Rham test.
- `variation.fibres`: Each geometric fibre gives the pointwise HS object with the stated weight.

Use the de Rham comparison functor representationwise. Form M0 after forgetting the Hodge filtration of the flat bundle. Impose the pure bundle condition on each graded fibre.

The consuming constructions use this interface as follows. AP12 crystalline_cover: Constructs the basic de Rham bundle whose frame torsor trivializes the isocrystal side.

**Checks.**

- The trivial de Rham local system in weight zero is a variation.
- The Tate local system has weight −2n with its de Rham comparison lattice.
- A variation with nontrivial étale monodromy does not become a neutral family by forgetting that monodromy.

**Acceptance.** The Q_p-local system is allowed to have monodromy here; this is a distinct family notion from the neutral category.

*Needs:* AP4 `flat_bundles` (The trivial-filtration lattice functor); AP2 `point_hs` (Pointwise p-adic Hodge structures); AP4 `coefficient_local_system` (Coefficient and group local systems); `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`; `PadicHodgeTheory:P8/plan/position-of-associated-local-system`; `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### 12.2 Crystalline-frame cover and period map

Construct `crystalline_cover`. Let Stilde→S be a de Rham K-torsor for open K≤G(Q_p). Modify its slope-zero G-bundle by M0 to obtain E_dR. Assume E_dR lies in a fixed basic stratum [b]. Pull back the universal G_b(Q_p)-torsor on that stratum to obtain Stilde^cris→S. Its tautological frame gives a neutralized good b-admissible pair; its étale-frame K-reduction defines a map Stilde^cris→M_{b,[mu]}/K as in (10.1.1.1). The field/type is taken on each fixed-type component.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §10.1 and equation (10.1.1.1), p. 63.)

The interface consists of the following operations and laws.

- `crystalline_cover.frame_torsor`: Stilde^cris is the pullback of [*/G_b(Q_p)]’s universal torsor along E_dR.
- `crystalline_cover.neutral_pair`: The tautological frame supplies the neutral good b-pair.
- `crystalline_cover.period_map`: The map to M_b,mu/K pulls the universal pair and étale K-reduction back to the original data.
- `crystalline_cover.change_level`: Changing K compatibly gives the transition maps between period targets.

Modify with the trivial-filtration lattice and classify the resulting basic bundle. Pull back the tensor-Isom frame torsor. Use its frame to identify the fixed isocrystal and the original K-torsor to lift the lattice period map to the K-level quotient.

The consuming constructions use this interface as follows. AP12 basic_shimura: Uniformization supplies a discrete reduction of this frame cover in the basic Shimura case.

**Checks.**

- For a globally framed constant basic de Rham bundle the frame cover is its trivial G_b(Q_p)-torsor.
- The ordinary Katz–Igusa case has Stilde^cris=Stilde, with infinite Z_p× monodromy.
- If E_dR is not basic, the constant G_b(Q_p)-frame-torsor construction does not apply unchanged.

**Acceptance.** Potential unramifiedness and rigid representability of this cover are expectations, not targets.

*Needs:* AP12 `variation` (Variations of p-adic Hodge structure); AP1 `basic_strata` (Basic-stratum theorem); AP9 `period_torsors` (The two period maps); AP6 `family_type` (Good type over rigid bases).

### 12.3 Katz–Igusa obstruction

Establish the application `igusa_boundary`. On the ordinary locus of a connected finite-level modular curve without p-level, the Katz–Igusa Z_p×-tower trivializing the unit-root isocrystal equals the crystalline-frame cover for the associated rank-one de Rham torsor. Its surjective infinite Z_p× monodromy prevents refinement by a rigid analytic de Jong cover of the asserted kind; its inverse-limit adic realization is not a finite-type rigid analytic variety.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §10.1, p. 64.)

Import the ordinary Katz–Igusa formal tower, its geometric connectedness and its Z_p×-monodromy from the precise Igusa supplier request. It is not supplied by the Hodge-type perfectoid-tower theorem. Compare the rank-one crystalline realization with the unit-root factor in the matching covariant or dual Tate normalization; this identifies the frame cover with the Katz–Igusa tower. A reduction to a rigid de Jong covering forces the corresponding compact fibre monodromy to have finite orbits, contradicting the infinite transitive Z_p× action. Non-finite-type inverse limits do not provide a rigid variety.

**Acceptance.** This example is a boundary to rigid refinement, not a disproof of the potentially unramified expectation.

*Needs:* AP12 `crystalline_cover` (Crystalline-frame cover and period map); `IgusaVarietiesAndTorsionConcentration:IG.1`.

### 12.4 Conditional basic Hodge-type application

Establish the application `basic_shimura`. For a Hodge-type Shimura datum, neat prime-to-p level, and basic locus S after completion at p and then the maximal unramified base, assume the precise basic uniformization with its period-map compatibility: each relevant component is a diagonal arithmetic quotient of M_{b,[mu]}/K_p by a discrete subgroup Gamma≤G_b(Q_p). Then S is étale-locally uniformized by the finite-level local space, after base change to C its infinite-level torsor has the same local Hodge–Tate period diagram, and the minuscule bi-analytic Ax–Lindemann theorem transports through these charts.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §10.1, pp. 64–65 and footnote 7, p. 64.)

Import the stated Daniels–van Hoften–Kim–Zhang uniformization contract including the discrete diagonal quotient. Identify both period diagrams and the discrete reduction of the frame cover. Apply AP11 on the charts and descend the resulting special-image description.

**Acceptance.** The application is conditional on the named uniformization input; a product with Gamma is not its quotient.

*Needs:* AP12 `crystalline_cover` (Crystalline-frame cover and period map); AP11 `minuscule_ax_lindemann` (Minuscule Ax–Lindemann theorem); `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`; `PerfectoidShimuraVarieties:S3`; `PerfectoidShimuraVarieties:S3/hodge-open-period-map`.

### 12.5 Products of Shimura curves

Establish the application `shimura_products`. Let D/Q be a quaternion algebra split at infinity and ramified at p, with neat level away from p and maximal local level; let B be the inner form definite at infinity and split at p. For a product of n associated curves over Q_p-breve, each chosen component has a Čerednik–Drinfeld presentation Omega^n/Gamma, with Gamma the product of the arithmetic component stabilizers. After base change to C, at infinite level the local product M of Drinfeld spaces and the global perfectoid tower have compatible Hodge–Tate maps and differ by the corresponding arithmetic quotient. Locally in the analytic topology this is the local period diagram. Thus the opposite analytic closure of a lifted irreducible analytic set is the transported image of the appropriate local special subvariety.

([Sean Howe and Christian Klevdal — Part II](https://arxiv.org/pdf/2308.11064v2), arXiv v2, §10.2, pp. 64–66, diagram p. 65.)

Apply the supplied Čerednik–Drinfeld theorem separately to each factor, tracking determinant components and their stabilizers. Form the product diagram and the compatible perfectoid inverse levels. Proper discontinuity makes the finite-level uniformization analytic-locally an isomorphism. Transport AP11 through that diagram; the bi-algebraic Chambert-Loir–Loeser theorem concerns a different pair of algebraic structures and is comparison context, not an input to this implication.

**Acceptance.** The quaternion algebras D and B have opposite local behaviour at p and infinity; retain the arithmetic quotient at every level.

*Needs:* AP12 `basic_shimura` (Conditional basic Hodge-type application); AP11 `minuscule_ax_lindemann` (Minuscule Ax–Lindemann theorem); `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`; `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`; `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`; `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`; `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`; `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`; `PerfectoidShimuraVarieties:S3/hodge-open-period-map`.

### Examples

For a variation the original graded de Rham local system can have nontrivial étale monodromy. M0 is formed from its associated flat bundle after forgetting the filtration. If the resulting bundle has fixed basic class b, its crystalline-frame cover is a G_b(Q_p)-torsor, and the original K-frame data gives the K-level period map. This is a frame construction; it makes no general potential-unramifiedness assertion. Under the ordinary Katz–Igusa tower and monodromy input stated below, the tower on the ordinary modular locus has infinite Z_p× monodromy and gives the obstruction to a rigid analytic de Jong refinement described in HK II §10.1, pp. 63–64.

For a quaternion algebra D/Q split at infinity and ramified at p, its inner form B is definite at infinity and split at p. A chosen product component of the associated Shimura curves has a Čerednik–Drinfeld presentation Ω^n/Γ with the actual arithmetic component stabilizers. After base change to C, the local Drinfeld product, its two period maps and the global infinite tower are compared through this quotient. In a general Hodge-type basic locus the analogous step is conditional on the explicit basic uniformization contract, including the diagonal arithmetic quotient. Local special points concern the Q_p-structure of the p-divisible group and need not be global motivic CM points. (HK II §10.1–§10.2, pp. 64–66.)

### Dependencies

- AP4.
- AP2.
- `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`.
- `PadicHodgeTheory:P8/plan/position-of-associated-local-system`.
- `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.
- AP1.
- AP9.
- AP6.
- `IgusaVarietiesAndTorsionConcentration:IG.1`.
- AP11.
- `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower`.
- `PerfectoidShimuraVarieties:S3`.
- `PerfectoidShimuraVarieties:S3/hodge-open-period-map`.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`.
- `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-level-structure-comparison`.


## Downstream consumers

HeckeStacksAndLocalShtukas consumes the connected-linear-group admissible loci, their period torsors and the basic-duality diagram. PerfectoidShimuraVarieties consumes the period-image theorem and the local special-subvariety description under its own uniformization and period compatibility hypotheses. AInfCohomology consumes the pointwise comparison of realizations; it remains the BKF owner, including the required rigidified extension. The CM criterion is a pointwise application of the same two rational lattice structures used in Ax–Lindemann. No comparison with a bi-algebraic theorem is used as a proof of the bi-analytic one.

## References

- Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures I: Transcendence of the de Rham lattice](https://arxiv.org/pdf/2308.11065v2), arXiv:2308.11065v2, 28 February 2025. Numbered locators above use this version. [Published Part I](https://msp.org/ant/2026/20-5/ant-v20-n5-p03-p.pdf), Algebra & Number Theory 20 (2026), 971–1028: selected passages in Definition 4.2.1, Lemmas 4.3.1–4.3.2, §4.4 and the proof of Theorem 5.1.6 were collated on pp. 1004, 1006, 1008, 1014.
- Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax–Lindemann theorem](https://arxiv.org/pdf/2308.11064v2), arXiv:2308.11064v2, 28 February 2025. Published as [Inventiones Mathematicae 244 (2026), 455–530](https://doi.org/10.1007/s00222-025-01400-6). Its numbering differs; every numbered Part II locator above is arXiv v2.
- Peter Scholze, [p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463), Theorem 7.6 and proof, pp. 42–45; Definition 8.3 and Theorem 8.4, p. 48.
- Ruochuan Liu and Xinwen Zhu, [Rigidity and a Riemann–Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282), Theorems 1.3 and 3.9, pp. 2–3, 24–28. Its finite-Q_p field assumption does not establish the arbitrary-field criterion required in AP6.
- Bhargav Bhatt and David Hansen, [The six functors for Zariski-constructible sheaves in rigid geometry](https://arxiv.org/pdf/2101.09759v2), Definitions 2.4–2.5, p. 7, and Corollary 2.10, pp. 7–8. Weakly Shilov points use Definition 2.5.
- [Current TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap), especially AdicSpaces, AlgebraicVectorBundles and ReductiveGroups, for the existing foundations and ownership. Library statements are used at the pins above.

The source passages were checked on 19 October 2026. Selected Part I sign and quotient formulas persist in the published text; the corrected p-adic formulas above preserve weight equal to twice Newton and bundle slope opposite to Newton. No full journal collation is asserted. The Part II DOI and author SharedIt routes did not serve article text on this attempt, so findings about Part II remain scoped to arXiv v2. The older v1 non-reductive bundle classification is replaced by v2's basic-stratum theorem. Part III treats a separate nonneutral theory outside this scope.
