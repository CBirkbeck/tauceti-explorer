# Geometric Satake over the Fargues–Fontaine curve

This roadmap builds the geometric Satake equivalence of Fargues and Scholze for
a reductive group G over a nonarchimedean local field E, with coefficients
killed by an integer prime to p and their ℓ-adic limits for every prime ℓ ≠ p.
It starts from the loop groups, local Hecke stacks and Beilinson–Drinfeld
Grassmannians over the integral divisors of the relative Fargues–Fontaine
curve. It proves the geometry these spaces need: properness of Schubert bounds,
smoothness of open Schubert cells, and the Bhatt–Scholze projectivity of the
Witt vector affine Grassmannian. It then constructs constant terms, universally
locally acyclic sheaves and the relative perverse t-structure, the Satake
category with its cohomology fibre functor, convolution and rigidity, fusion
with its sign rule, and the reconstruction of the Satake group. It ends with the
identification of that group with the Langlands dual group Ĝ with its Weil
action, the normalized integral equivalence

  Sat^I_G(Λ) ≃ Rep^{fp,cont}_Λ((Ĝ ⋊ W_E)^I),

its naturality and its export to perfect complexes, Zhu's rational geometric
Satake equivalence for the Witt vector affine Grassmannian, and the comparison
with the classical Satake transform.

The plan is at target level. It has 94 declarations (49 theorems, 27 constructions, 9 comparisons, 5 definitions, 3 lemmas, 1 application) in
fourteen layers, with 120 API items, 99 unit tests and 41
planets. Every layer is planned: each target is a declaration whose
prerequisite chains end in the pinned libraries, in a node of another roadmap,
in a precise request to a named layer (one of them, R3.21, to this roadmap's
own GS2:correspondences), or in one of the 22
named gaps of this document. No layer is closed and nothing is implemented.
The companion packets `GeometricSatakeAndFusion--GS0.json` (layers GS0–GS2,
62 nodes) and `GeometricSatakeAndFusion--GS3.json` (layers GS3–GS4,
32 nodes) record the same declarations, and the suggested file
`GeometricSatakeAndFusion.lean` prototypes their algebraic and categorical
cores.

## Purpose and scope

The Satake equivalence is the input that turns the geometry of Bun_G into the
spectral action of the Fargues–Scholze correspondence: Hecke operators on Bun_G
are indexed by representations of the dual group, and their compatibility with
fusion produces excursion operators. This roadmap owns the local half of that
input, from the divisor geometry to the normalized equivalence and its
exports. Its targets are:

- **GS0, Beilinson–Drinfeld Grassmannians and loop groups.** Positive and full
  loop groups over the degree-d divisors Div^d_𝒴, Div^d_Y and Div^d_X, the local
  Hecke stack and the Beilinson–Drinfeld Grassmannian, ordered legs, Schubert
  bounds and their generic properness, Galois descent for nonsplit groups, the
  congruence filtration, and affine flags with Demazure resolutions
  (GS0:loop-geometry). Truncated positive loop groups and the ℓ-cohomological
  smoothness of the open Schubert cell Gr_{G,μ} of dimension ⟨2ρ,μ⟩, with the
  minuscule Białynicki-Birula comparison (GS0:Schubert-smoothness). The Witt
  vector affine Grassmannian: the lattice functor, Demazure resolutions,
  the determinant line, its positivity and the projectivity theorem of Bhatt
  and Scholze, perfect models, integral and parahoric properness, Zhu's
  finite-jet and algebraic-space constructions, and bounded affine flag loci
  (GS0:Witt-geometry).
- **GS1, semi-infinite geometry and constructibility.** Semi-infinite orbits,
  their affineness and the Mirković–Vilonen intersections, constant terms by
  hyperbolic localization, their conservativity, universally locally acyclic
  sheaves on the Hecke stack and their recognition by constant terms, the
  one-leg special/generic comparison, the relative perverse t-structure, flat
  perversity, standard and costandard objects, and rational weight
  concentration.
- **GS2, Satake objects and convolution.** The Satake category and its total
  cohomology fibre functor, Verdier duality and the convolution product with
  its associativity and unit (GS2:correspondences). Convolution preserves
  universal local acyclicity, perversity and flatness, every Satake object has
  both duals, and the one-leg comparison respects these structures
  (GS2:Satake-closure).
- **GS3, fusion.** The disjoint-leg locus, full faithfulness of restriction
  across collision diagonals, the parity of Satake objects, the fusion product
  with its sign-corrected symmetry, coCartesian finite-set functoriality, the
  realization of total cohomology as continuous representations of W_E^I,
  symmetric monoidal constant terms and fusion-compatible duality
  (GS3:fusion).
- **GS4, the Satake group and the dual group.** Bounded left adjoints and the
  relative Tannakian reconstruction of the Satake group with its coordinate
  Hopf algebra (first part of GS4:integral-dual-group). Geometric rational
  semisimplicity, reductivity of the generic fibre, and the rational Witt
  Satake category as a neutral Tannakian category (GS4:rational-reductivity).
  The torus and rank-one identifications, the
  generic root datum, integral recovery, the canonical pinned identification
  with Ĝ and its Weil action, Zhu's rational Witt vector equivalence, the
  normalized integral equivalence, naturality for Levi subgroups, adjoint
  isomorphisms, products and Weil restriction, the Chevalley involution and
  the export to perfect complexes (rest of GS4:integral-dual-group). The comparison of
  Frobenius traces with the classical Satake transform
  (GS4:classical-Satake-comparison).

The sources fix the generality. Fargues–Scholze Chapter VI and §§IV.7, IX.2 and
IX.6 are the main source; Bhatt–Scholze, Zhu, Scholze–Weinstein and
Caraiani–Scholze supply the Witt vector and minuscule geometry; Gross, Prasad–Yu,
Deligne–Milne and Doty–Henke supply the classical, integral and
representation-theoretic inputs named at the nodes.

**Not in this roadmap.** The global Hecke action on Bun_G and the spectral
action belong to HeckeStacksAndLocalShtukas and
ExcursionOperatorsAndSpectralAction, which import the exports of GS3 and GS4.
Bun_G itself and its smooth Artin structure are BunGAndNewtonStrata's (BG2
imports the cell smoothness of GS0:Schubert-smoothness). The abstract relative
Tannakian reconstruction is MotivesAndAlgebraicCycles MC.6's; the classical
spherical Hecke algebra and Satake transform are SmoothRepresentationsOfLocalGroups
SR.4's; general positivity, Keel's criterion and perfect finite-type models are
SchemeAndStackFoundations'; integral group models, affine Weyl groups and the
pinned integral dual group are ReductiveGroupsPartII's. Zhu's own proof of the
rational equivalence, through equivariant bimodules and the Gelfand trick, and
its extension to algebraically closed base fields larger than an algebraic
closure of F_p, are routed to the Part II design "Geometric Satake over the
Fargues–Fontaine curve, Part II" (GeometricSatakeAndFusionPartII; structural
proposal 8, gap [G3.12](#gap-g3-12)). Twisted (metaplectic) Satake is requested by
MetaplecticAutomorphicForms as a Part II of this roadmap.

## Boundaries

### What this roadmap imports

Every object below is owned by another roadmap or by the pinned libraries, and
this roadmap cites it rather than planning it again. The table lists, for each
supplier roadmap, the layers or exact nodes cited as direct prerequisites; the
nodes that cite them are listed with each declaration below, and the
statements requested where no exact node exists yet are under
[Requests](#requests-to-other-roadmaps).

| Supplier | Layers and nodes cited |
| --- | --- |
| AdicCoefficientsAndComparisons | `L1/char-p-scheme-diamond-and-comparison-functor`, `L0/derived-I-complete-etale-category`, `L0/adic-coefficient-limit`, `L0/completed-tensor-and-colimits`, `L0/six-operations-for-adic-coefficients`, `L3/rf-shriek-comparison-27-4`, `L3/full-faithfulness-27-2`, `L3/commutation-and-adjoints-27-1-27-3`, `L0/rational-constructible-coefficients` |
| CrystallineCohomology | `CR.1`, `CR.7` |
| DiamondSixOperations | `S2/lower-shriek`, `S2/lower-shriek-base-change`, `S2/projection-formula`, `S4/cohomologically-smooth`, `S4/smooth-composition`, `S4/smooth-stable-under-base-change`, `S4/smooth-descent-along-smooth-surjection`, `S5/ball-smooth`, `S5/analytic-smooth-is-cohomologically-smooth`, `S3/upper-shriek`, `S3/adjunction-calculus`, `S3/verdier-duality-lower-shriek`, `S2/exchange-pasting-coherence`, `S6` |
| DiamondsAndVStacks | `D6/pre-adic-topological-comparison`, `D6/pre-adic-diamondification`, `D1/strictly-totally-disconnected`, `D3/etale-and-finite-etale-are-v-stacks`, `D5/local-structure-of-etale-maps`, `D6/etale-site-comparison` |
| EnhancedDerivedSheaves | `E5:abstract/stable-infinity-category`, `E5:presentability/ind-completion`, `E5:presentability`, `E5:presentability/universal-property-of-ind`, `E3`, `E5:abstract/symmetric-monoidal-infinity-category`, `E5:presentability/presentable-categories`, `E5:abstract/exact-functors`, `E5:abstract/idempotent-completion` |
| EtaleDualityAndPerverseSheaves | `EDC.5/perverse-recollement`, `EDC.5/perverse-t-structure`, `EDC.5`, `EDC.5/affine-perverse-artin-vanishing`, `EDC.7/proper-direct-image-decomposition`, `EDC.5/semismall-pushforward-perverse`, `EDC.5/intersection-complex`, `EDC.7` |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | `R07.2`, `R07.6` |
| KTheoryLowDegrees | `Z.3` |
| LanglandsParameterStacks | `LP3`, `LP4` |
| MotivesAndAlgebraicCycles | `MC.6/relative-finite-piece-reconstruction`, `MC.6/relative-coalgebra-assembly`, `MC.6/relative-bialgebra-reconstruction`, `MC.6/relative-rigid-antipode`, `MC.6/tannaka-finiteness-recognition`, `MC.6/tannaka-connectedness-recognition`, `MC.6/neutral-tannaka-reconstruction` |
| PadicHodgeTheory | `P8:local-rational` |
| ReductiveGroupsPartII | `RG2.3`, `RG2.4`, `RG2.1`, `RG2.5`, `RG2.0`, `RG2.0a` |
| RelativeFarguesFontaine | `RF2:integral-divisors/completed-rings-B-plus-and-B`, `RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RF2:integral-divisors/product-equation-and-affineness`, `RF2:untilts/geometric-divisor-complete-dvr`, `RF4:G-torsors`, `RF2:untilts`, `RF2:integral-divisors/addition-and-disjoint-divisor-loci`, `RF2:untilts/divisor-completion-base-change`, `RF0:integral-Y/untilt-functor-of-points`, `RF2:integral-divisors/div-d-moduli-v-sheaf`, `RF2:integral-divisors`, `RF2:untilts/cartier-filtration-and-breuil-kisin-lines`, `RF4:vector-bundles`, `RF0:integral-Y/ramified-coefficient-comparison`, `RF2:untilts/div1-moduli-and-properness` |
| SchemeAndStackFoundations | `SF.4`, `SF.0`, `SF.1`, `SF.3`, `SF.5`, `SF.2` |
| SmoothRepresentationsOfLocalGroups | `SR.4` |
| VStackSheavesAndLisseCategories | `VS0/artin-v-stack-definition`, `VS1`, `VS0`, `VS1/hyperbolic-localization`, `VS1/braden-theorem`, `VS1/hyperbolic-base-change-duality-and-ula`, `VS1/ula-for-artin-v-stacks`, `VS1/ula-dualizability-criterion`, `VS1/perfect-local-systems`, `VS1/ula-relative-adjoints-and-calculus`, `VS1/kernel-correspondence-category`, `VS3` |
| Tau Ceti roadmaps and library | `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` |

The ownership lines that matter most:

- **Divisors and completed rings** are RelativeFarguesFontaine's (RF2 for the
  integral divisors, their completed rings B⁺_D ⊂ B_D, the product equation and
  degree-one divisor moduli; RF4 for G-torsors, Beauville–Laszlo gluing and the
  algebraization of compatible quotient systems). This roadmap evaluates loop
  groups on those rings.
- **Integral group theory** is ReductiveGroupsPartII's: integral and parahoric
  models (RG2.3), affine Weyl groups, Bruhat order, admissible sets and Kottwitz
  maps (RG2.4), the relative and integral weight refinements (RG2.1) and the
  pinned integral dual group (RG2.5). The absolute Lie, root and parabolic
  theory is imported from the upstream ReductiveGroups roadmap.
- **Sheaf theory** is imported: the v-stack and lisse-sheaf calculus, Braden's
  hyperbolic localization and universal local acyclicity
  (VStackSheavesAndLisseCategories VS0, VS1, VS3), the six operations on
  diamonds (DiamondSixOperations), the enhanced stable, monoidal and Ind
  categories (EnhancedDerivedSheaves E3, E5), early scheme perversity and the
  rational decomposition theorem (EtaleDualityAndPerverseSheaves EDC.5, EDC.7),
  and the scheme-to-v-sheaf comparisons (AdicCoefficientsAndComparisons L1, L3;
  DiamondsAndVStacks D6).
- **Perfect geometry and positivity** are SchemeAndStackFoundations': perfect
  finitely presented models and effective quotients (SF.0, SF.1), the finite
  field trace formula (SF.2), descent of bundles (SF.3, SF.4), and the general
  positivity theory with Keel's criterion and Stein contraction (SF.5). This
  roadmap owns the Witt vector application.
- **Reconstruction** is MotivesAndAlgebraicCycles MC.6's: the four relative
  nodes (finite pieces, dual coalgebra, bialgebra, rigid antipode), its neutral
  reconstruction and its finiteness and connectedness recognition. GS4 checks
  their hypotheses for the Satake fibre functor and applies them.
- **Representation theory of the dual group** at all primes ℓ ≠ p, with highest
  weight base change, tilting modules in characteristic two and the stable
  completion of representation categories, is LanglandsParameterStacks' (LP3,
  LP4). The local Weil group is Tau Ceti's ClassFieldTheory layer 9. The
  classical Satake transform is SR.4's.

### Who uses this roadmap

The atlas links and the packets of other roadmaps cite these layers:

| Consumer | Cited here (number of citing nodes) | Atlas links |
| --- | --- | --- |
| BunGAndNewtonStrata | [`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) (5), [`GS0:loop-geometry/schubert-bounds-and-properness`](#n-gs0-loop-geometry-schubert-bounds-and-properness) (4) | `GS0:Schubert-smoothness` → `BunGAndNewtonStrata:BG2:smooth-Artin` |
| ExcursionOperatorsAndSpectralAction | `GS4:integral-dual-group` (3), [`GS4:integral-dual-group/adjoint-isomorphism-naturality`](#n-gs4-integral-dual-group-adjoint-isomorphism-naturality) (2), [`GS4:integral-dual-group/chevalley-involution`](#n-gs4-integral-dual-group-chevalley-involution) (1), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification) (1), [`GS4:integral-dual-group/levi-naturality`](#n-gs4-integral-dual-group-levi-naturality) (3), [`GS4:integral-dual-group/normalized-satake-equivalence`](#n-gs4-integral-dual-group-normalized-satake-equivalence) (4), [`GS4:integral-dual-group/product-naturality`](#n-gs4-integral-dual-group-product-naturality) (1), [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality) (1) | `GS4:integral-dual-group` → `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `GS4:integral-dual-group` → `ExcursionOperatorsAndSpectralAction:ES7:parabolic` |
| GlobalShtukasAndFunctionFieldLanglands | [`GS0:loop-geometry/loop-groups-and-local-hecke`](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (1), [`GS0:loop-geometry/schubert-bounds-and-properness`](#n-gs0-loop-geometry-schubert-bounds-and-properness) (1), [`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability) (1), [`GS2:correspondences/satake-category-and-fibre-functor`](#n-gs2-correspondences-satake-category-and-fibre-functor) (1), [`GS3:fusion/fusion-product-and-sign-rule`](#n-gs3-fusion-fusion-product-and-sign-rule) (2), `GS4:classical-Satake-comparison` (1), [`GS4:integral-dual-group/chevalley-involution`](#n-gs4-integral-dual-group-chevalley-involution) (1), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification) (3) | none |
| HeckeStacksAndLocalShtukas | `GS0:Schubert-smoothness` (2), [`GS0:Schubert-smoothness/minuscule-bialynicki-birula`](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula) (2), [`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) (5), `GS0:loop-geometry` (3), [`GS0:loop-geometry/affine-flag-demazure`](#n-gs0-loop-geometry-affine-flag-demazure) (1), [`GS0:loop-geometry/generic-galois-descent`](#n-gs0-loop-geometry-generic-galois-descent) (8), [`GS0:loop-geometry/grassmannian`](#n-gs0-loop-geometry-grassmannian) (5), [`GS0:loop-geometry/local-hecke-stack`](#n-gs0-loop-geometry-local-hecke-stack) (4), [`GS0:loop-geometry/loop-groups-and-local-hecke`](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (4), [`GS0:loop-geometry/ordered-leg-base-change`](#n-gs0-loop-geometry-ordered-leg-base-change) (6), [`GS0:loop-geometry/schubert-bounds-and-properness`](#n-gs0-loop-geometry-schubert-bounds-and-properness) (8), `GS1` (1), [`GS1/ULA-sheaves-on-the-hecke-stack`](#n-gs1-ula-sheaves-on-the-hecke-stack) (1), [`GS1/ula-constant-term-criterion`](#n-gs1-ula-constant-term-criterion) (1), [`GS2:correspondences/convolution-diagram`](#n-gs2-correspondences-convolution-diagram) (1), `GS3:fusion` (1), [`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness) (1), [`GS3:fusion/finite-set-functoriality-and-constant-terms`](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (1), [`GS3:fusion/fusion-product-and-sign-rule`](#n-gs3-fusion-fusion-product-and-sign-rule) (2), [`GS3:fusion/fusion-verdier-duality`](#n-gs3-fusion-fusion-verdier-duality) (3), [`GS3:fusion/symmetric-constant-term`](#n-gs3-fusion-symmetric-constant-term) (1), `GS4:integral-dual-group` (3), [`GS4:integral-dual-group/adjoint-isomorphism-naturality`](#n-gs4-integral-dual-group-adjoint-isomorphism-naturality) (1), [`GS4:integral-dual-group/chevalley-involution`](#n-gs4-integral-dual-group-chevalley-involution) (2), [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension) (4), [`GS4:integral-dual-group/levi-naturality`](#n-gs4-integral-dual-group-levi-naturality) (1), [`GS4:integral-dual-group/product-naturality`](#n-gs4-integral-dual-group-product-naturality) (1), [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality) (1) | `GS0:Schubert-smoothness` → `HeckeStacksAndLocalShtukas:HS0`, `GS0:Witt-geometry` → `HeckeStacksAndLocalShtukas:HS0`, `GS0:loop-geometry` → `HeckeStacksAndLocalShtukas:HS0`, `GS2:Satake-closure` → `HeckeStacksAndLocalShtukas:HS1`, `GS3:fusion` → `HeckeStacksAndLocalShtukas:HS1`, `GS3:fusion` → `HeckeStacksAndLocalShtukas:HS4`, `GS4:integral-dual-group` → `HeckeStacksAndLocalShtukas:HS1`, `GS4:integral-dual-group` → `HeckeStacksAndLocalShtukas:HS4` |
| MetaplecticAutomorphicForms | `GS3` (1), [`GS3:fusion/fusion-product-and-sign-rule`](#n-gs3-fusion-fusion-product-and-sign-rule) (1) | none |

### Statements other roadmaps request here

Other packets address these requests to this roadmap's layers. Each is matched
with the declarations of this document that bear on it; where a request asks
for more than they state, the difference is named.

| Requesting packet | Addressed to | What is asked, in short | Status here |
| --- | --- | --- | --- |
| BunGAndNewtonStrata | [Open Schubert cell smoothness](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) | Open-cell stabilizer and congruence quotients for every dominant μ, cohomological smoothness of open cells, the minuscule flag quotient by P⁻_μ, and splitting-field descent. | Stated by the cited node and by [Minuscule Bialynicki–Birula isomorphism](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula). |
| BunGAndNewtonStrata | [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) | Schubert exhaustion and properness, the identification of connected components of the Grassmannian with π₁(G) coinvariants, cocharacter representatives and nonsplit descent. | Exhaustion of each π₁(G)-component, properness and descent ([Galois descent of bounded modifications](#n-gs0-loop-geometry-generic-galois-descent)) are stated. The connected-component theorem is not stated by any node of this roadmap; the requesting packet records it as its own requested refinement. |
| EnhancedDerivedSheaves E5 | `GS4:integral-dual-group` | The dual group and the Satake category as a symmetric monoidal ∞-category over integral coefficients. | The enhanced symmetric monoidal structure enters through [Perfect-complex Satake extension](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension); the request records a consumer, not a statement to supply. |
| ExcursionOperatorsAndSpectralAction ES0 | `GS4:integral-dual-group` | Pinned dual group with its semidirect action, normalized representation categories, the relation between the centre and the dual torsion, and switching as the Chevalley involution up to ρ̂(−1). | [Canonical pinned dual identification](#n-gs4-integral-dual-group-dual-group-identification), [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) and [Chevalley involution with its inner sign](#n-gs4-integral-dual-group-chevalley-involution). The centre/dual-torsion relation is not stated here. |
| GlobalShtukasAndFunctionFieldLanglands | `GS2` | Satake category, fibre functor, convolution, monoidal structure and the dual group, imported by node identifier. | [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor), [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram), [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule), [Canonical pinned dual identification](#n-gs4-integral-dual-group-dual-group-identification). These are mixed-characteristic statements; the equal-characteristic statement over powers of a global curve is the requesting roadmap's own. |
| GlobalShtukasAndFunctionFieldLanglands | `GS4:classical-Satake-comparison` | Comparison of geometric and classical Satake with the half Tate twist. | [Classical and geometric Satake comparison](#n-gs4-classical-satake-comparison-classical-satake-comparison), for unramified G with the gaps named there. |
| HeckeStacksAndLocalShtukas | `GS0:Schubert-smoothness` | Descent of the Białynicki-Birula map to the reflex field for nonsplit G, its equivariance, and its values on points over finite extensions. | The split statements are [Open Schubert cell smoothness](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) and [Minuscule Bialynicki–Birula isomorphism](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula). Descent of the Białynicki-Birula map to Fl_{G,μ} over the reflex field, its G(F̆)-equivariance and the bijection on points over finite extensions are not stated here and remain open. |
| HeckeStacksAndLocalShtukas | `GS1` | Iwahori-equivariant Demazure maps to the local Hecke stack over Spd C, and generation of the solid duals of ULA kernels under colimits by the Demazure kernels. | [Affine flags and Demazure spaces over Spd O_C](#n-gs0-loop-geometry-affine-flag-demazure) and [ULA Hecke complexes](#n-gs1-ula-sheaves-on-the-hecke-stack) bear on it. The maps f_ẇ and the generation statement are not stated here and remain open. |
| HeckeStacksAndLocalShtukas | `GS3:fusion` | The twisted exterior product on the convolution chain space is ULA, flat perverse, restricts to A₁ ⊠ A₂ off the diagonal and is the unique such extension, for chains of any length. | The fusion product is built from this chain space in [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule), with uniqueness from [Restriction across collision diagonals](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness). The statement on the chain space before pushforward is not isolated as a node. |
| HeckeStacksAndLocalShtukas | `GS4:integral-dual-group` | Convergence of the solid Satake functor on resolutions with finitely many weights; Weil restriction with matched half twists; restriction to Weil groups of finite extensions. | [Weil restriction naturality](#n-gs4-integral-dual-group-weil-restriction-naturality) states the Weil-restriction comparison for r_{E′} = r_E^f; the case of the other square root, with its twist on odd components, is not stated. [Perfect-complex Satake extension](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension) bears on the first statement, which is not stated here; the third is not stated here. These remain open. |
| HeckeStacksAndLocalShtukas | `GS0:loop-geometry` | The bounded convolution Beilinson–Drinfeld Grassmannian over a product of leg bases with its proper surjective multiplication map, and finiteness of dim.trg of bounded projections. | The bounded convolution tower and its surjection appear only inside the properness proofs of [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) and [Integral bounded Grassmannian families](#n-gs0-witt-geometry-integral-family-bounded-properness). Neither the convolution Grassmannian over a product of leg bases nor the dim.trg bound is a node here; both remain open. |
| MetaplecticAutomorphicForms MP.0 | `GS3` | Twisted (metaplectic) Satake with coherent fusion and the modified dual group, as a Part II of this roadmap. | Not planned here; ordinary fusion is [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule). |

## Conventions

**Fields, groups and coefficients.** E is a nonarchimedean local field with
ring of integers O_E and residue field F_q of characteristic p. G is a
connected reductive group over E. Integral constructions over the divisor
base Div^d_𝒴 use a split reductive O_E-model after a splitting extension;
parahoric constructions use their smooth parahoric model, and Iwahori models
are a separate input. A possibly ramified G is handled on the generic bases
Div^d_Y and Div^d_X by a finite Galois splitting extension and descent; this
never produces a reductive O_E-model. Coefficient rings Λ are killed by an
integer prime to p; ℓ ≠ p is a fixed prime, and ℓ-adic statements pass to
compatible systems modulo ℓ^c. Rational statements use Q_ℓ or a stated
extension; the rational Witt category uses Q̄_ℓ. Enhanced kernels use a
Z_ℓ[r]-algebra Λ with a chosen unit r, r² = q.

<a id="standing-hypotheses"></a>
**Standing hypotheses of layers GS3–GS4.** Thirty of the thirty-two
declarations of these layers assume the following, cited at each
declaration as S1–S3:

- **S1.** E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.
- **S2.** For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.
- **S3.** Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Divisors and loops.** For an integral degree-d divisor D, B⁺_D ⊂ B_D are the
completed and punctured rings supplied by RF2; on Div^d_X use the basis of
affinoid S on which D_S is affinoid. The ideal I of the Cartier divisor is kept
through the finite congruence quotients. The positive loop group L⁺G is an
inverse limit; only its finite jet quotients have finite dimension. The local
Hecke stack Hck_G and the Beilinson–Drinfeld Grassmannian Gr_G are taken over
the stated divisor base; the layers GS3–GS4 work over the degree-one leg bases
(Div¹_X)^I for a finite set I of legs, and Sat^I_G(Λ) is the Satake category
over (Div¹_X)^I. Where a declaration of GS0–GS2 omits the index I, it is the
one-leg or the stated-divisor case.

**Ordered legs and dimensions.** For a finite set of ordered legs, add their
Cartier divisors. At a geometric point with r distinct untilts there are r
local factors, even when more legs are labelled; bounds on legs with the same
untilt add, and each combined local cocharacter is counted once (the
author-copy description before FS VI.3.1 weights it again, source issue E24).
For a dominant tuple μ•, d(μ•) = Σ_i ⟨2ρ, μ_i⟩, and on a single cell d_μ =
⟨2ρ, μ⟩ is the perverse shift; ε(μ•) = d(μ•) mod 2 is the parity of
GS3:fusion. Dominance on coweights uses nonnegative integer combinations of
positive coroots (source issues E1 and E34).

**Satake objects.** A Satake object has bounded Schubert support, is
universally locally acyclic over its leg base, is relative perverse and is
coefficient-flat: derived tensor with every coefficient module stays perverse.
Flatness does not follow from perversity. The category of flat objects is
additive and exact for sequences with flat terms; it is not asserted to be
abelian over a ring. The fibre functor F (written F^I over (Div¹_X)^I) is total
cohomology in all degrees; its values are finite projective Λ-modules, with a
continuous action of W_E^I by the Drinfeld realization of GS3:fusion. Constant
terms are CT_P with the shift deg_P = ⟨2ρ_G − 2ρ_M, ·⟩; omitting the shift
changes the weight degrees.

**Notation across the layers.**

| Object | Notation in this document |
| --- | --- |
| Divisor bases | Div^d_𝒴 (integral), Div^d_Y, Div^d_X = Div^d_Y/φ^ℤ; the leg base of GS3–GS4 is (Div¹_X)^I, also written (Div¹)^I |
| Geometric special point | Spd k̄ with k̄ an algebraic closure of F_q (the residue field of O_C); the rational Witt declarations write k for it |
| Hecke stack and Grassmannian | Hck_G and Gr_G over a stated base; Hck^I_G and Gr^I_G over (Div¹)^I, the pullbacks of the ordered-leg declaration; Zhu's Witt vector Grassmannian over k̄ |
| Satake categories | Sat_G(S,Λ) over a base S; Sat^I_G(Λ) over (Div¹_X)^I; Sat^Witt_G Zhu's Q̄_ℓ-category on the Witt vector affine Grassmannian over k̄, identified with the rationalized Satake category over Spd k̄ |
| Fibre functors | F, F^I (total cohomology); F_W its restriction to a bound W; H* = F ⊗ Q̄_ℓ over Spd k̄ in the rational Witt declarations |
| Constant terms | CT_P = R(p⁺)_!(q⁺)* with q⁺ : Hck_{P⁺} → Hck_G and p⁺ : Hck_{P⁺} → Hck_M; shift deg_P = ⟨2ρ_G − 2ρ_M, ·⟩; CT_λ the λ-part of CT_B[deg_B] |
| Dimensions and parity | d_μ = ⟨2ρ,μ⟩, d(μ•) = Σ_i d_{μ_i}, ε = d mod 2 |
| Groups | G^∨ the reconstructed Satake group; Ĝ, M̂, T̂, B̂ the pinned dual groups |

**Intersection complexes.** IC_μ is the image of Δ_μ → ∇_μ, equal to Λ[d_μ]
on the open cell, with no Tate twist; this is its meaning in layers GS0–GS2 and
in the rational and Witt declarations of GS4. The declarations
[Normalized Frobenius function](#n-gs4-classical-satake-comparison-normalized-frobenius-function),
[Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) and
[Classical and geometric Satake comparison](#n-gs4-classical-satake-comparison-classical-satake-comparison) use the
half-twisted object IC_μ(d_μ/2) = j_{!*}L[d_μ](d_μ/2) under the same name;
their traces differ from those of the untwisted object by r^{−d_μ}. Read IC_μ
there as IC_μ(d_μ/2).

**Twists and Frobenius.** Geometric Frobenius on a finite-field stalk acts on
Λ(1) by q^{-1}, so the chosen half twist acts by r^{-1}. The Weil character
of the geometric root line Λ(1) under the Drinfeld realization, and its chosen
square root κ, define t_G(w) = (2ρ̂_G)(κ(w)); the geometric Weil action on the
dual group is Ad(t_G(w)) composed with the pinned action. The identification
of the stalk convention with κ, against the positive-power parameter formula
of FS IX.7.1, is the recorded convention obligation (gap [G3.2](#gap-g3-2)).
Contravariant stalk actions and parameter actions are never identified without
checking their direction.

**Witt lattices and perfection.** A perfect-base GL_n Witt lattice Λ ⊂
W(R)[1/p]^n is an embedded finite projective W(R)-module spanning
W(R)[1/p]^n, with locally uniform pole bounds. A positive bound uses the
quotient W(R)^n/Λ, whose determinant has the positive quotient convention; its
type is a sorted partition of fixed total length, and dominance is equal total
length with all initial partial-sum inequalities. Coordinate-ring perfection is
the direct Frobenius colimit; Mathlib's `Perfection` is the inverse limit and
does not supply this interface. A perfectly finitely presented perfect scheme
has finite-type models up to Frobenius, with compatible dimensions and étale
topoi supplied by SF.0. In the Witt-geometry declarations Λ denotes a lattice,
not a coefficient ring.

**Sign conventions in the minuscule comparison.** The Białynicki-Birula map
uses the opposite parabolic P⁻_μ (weights ≤ 0) and reconciles μ(ξ) in FS with
μ(ξ⁻¹) in Caraiani–Scholze; see the cell smoothness and Białynicki-Birula
declarations.

**Names.** Every declaration of the suggested file lives in the namespace
`TauCeti.GeometricSatake`, and the API and test names of all layers are
written with that namespace.
Where a source entry of layers GS0–GS2 below gives no description of its own,
the cited place states the declaration's construction or result with the
conventions and corrections given in the declaration.

## Sources

The locators of every declaration refer to the versions below. All
statements in this document are paraphrases; corrections to the sources are
listed under [Source issues](#source-issues). The packets record, for each
source, the URL, SHA-256 and the passages read.

<a id="src-fs"></a>

- **FS.** Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; PDF page = printed page. Re-fetched and passages inspected 2026-10-07. SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Packet source ids: `FS-geometrization` (GS0–GS2), `FS` (GS3–GS4).
  Passages the plan relies on: VI.1–VI.8, printed pp. 190–226, including proofs; IV.2.23–IV.2.26, printed pp. 124–126; IV.6.1–IV.6.8 and IV.6.11–IV.6.14, pp. 155–159, 162–163; Remark I.2.14 p17 (the Witt degeneration reproves Zhu's theorem); IV.7 pp164–166, full locally constant perfect Drinfeld equivalence and its proof; VI introduction pp187–190; VI.6.5–VI.6.8 pp214–215; VI.7.5, VI.7.7, VI.7.10, VI.7.12–13 pp219–224; VI.8–VI.12 pp224–242, full proofs of closure, fusion, reconstruction, dual identification and involution; IX.2 p321: relative Perf(BG) base change and A ↦ D(A)^∨ into the enhanced local Hecke category; IX.6.1–IX.6.3 pp330–332: adjoint-isomorphism maps, products and Weil restriction; IX.7.1 pp334–335: normalization of Levi inclusion; VI.7 p219, after the proof of Proposition VI.7.4: perverse sheaves on the local Hecke stack over Spd k are the L⁺G-equivariant perverse sheaves on the Witt vector affine Grassmannian considered by Zhu.

<a id="src-bs"></a>

- **BS.** Bhargav Bhatt, Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490). arXiv:1507.06490v3, 61-page PDF; PDF page = printed page. SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. Packet source ids: `BS17-witt-grassmannian` (GS0–GS2).
  Passages the plan relies on: §§2–4, 6–10 (geometric determinant route; §5 only a cited alternative), printed pp. 4–18, 21–39.

<a id="src-sw"></a>

- **SW.** Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author-hosted Berkeley Lectures PDF dated March 27, 2020; PDF page = printed page + 10. SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. Packet source ids: `SW20-berkeley` (GS0–GS2).
  Passages the plan relies on: Lectures 18–20, especially §§19.2–19.4 and 20.3–20.5; Lecture 21 §§21.1–21.5, printed pp. 191–197; Appendix 21.6 opening pp. 198–200.

<a id="src-zhu"></a>

- **Zhu.** Xinwen Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Annals 185 (2017), pp. 403–492; PDF page = printed page − 402. SHA-256 `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`. Packet source ids: `Zhu17` (GS0–GS2), `Zhu` (GS3–GS4).
  Passages the plan relies on: §§1.1–1.4, 2.1–2.2, Appendices A and B, printed pp. 412–440, 464–488; §0.2 pp407–409: Theorem 0.3 and its setting (read with PAPER-ZHU-17/E35); §0.5 pp411–412: notation, dominance order, the dual group with B̂ ⊃ T̂, V_μ and V_μ(λ); §2 opening and §2.1 pp429–433: standing hypotheses, the category P_{L⁺G}(Gr_G), semisimplicity, convolution and semismallness; §2.2 pp433–436: weight functors, Corollary 2.10 (read with PAPER-ZHU-17/E51) and IC weight cohomology; classical Satake equations (2.2.7)–(2.2.10); rational coefficients only; §§2.3–2.4 pp440–444, statements of Lemma 2.18, Proposition 2.20, Proposition 2.21 and Corollary 2.22 only: the source of the monoidal structure on H* and of the commutativity constraint, routed to the Part II design; §2.5 pp454–455: Tannakian structure, torus case, Proposition 2.36 (tensor constant term) and identification with the dual group.

<a id="src-cs"></a>

- **CS.** Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Published Annals 186 (2017); PDF page = printed page − 648. SHA-256 `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`. Packet source ids: `CS17` (GS0–GS2).
  Passages the plan relies on: §3 setup p. 675; §3.4 pp. 684–686.

<a id="src-glx"></a>

- **GLX.** Ian Gleason, Dong Gyu Lim, Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Published Inventiones 243 (2026), pp. 805–861; PDF page = printed page − 804. SHA-256 `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`. Packet source ids: `GLX26` (GS0–GS2).
  Passages the plan relies on: §1.1 p. 806; §3.2–3.3 pp. 822–824.

<a id="src-vh"></a>

- **vH.** Pol van Hoften, [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Published Cambridge PDF, PDF pages used as locators. SHA-256 `d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0`. Packet source ids: `VH24` (GS0–GS2).
  Passages the plan relies on: §2.2.6–§2.2.15, PDF pp. 13–16 (Witt flags, admissible strata and torsor adapters).

<a id="src-he"></a>

- **He.** Xuhua He, [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Published Forum of Mathematics Pi 9 (2021), e9; PDF page = printed page. SHA-256 `d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd`. Packet source ids: `He21` (GS0–GS2).
  Passages the plan relies on: §2.2 p. 5; §§5.3–5.4 pp. 9–12.

<a id="src-gross"></a>

- **Gross.** Benedict H. Gross, [On the Satake isomorphism](https://people.math.harvard.edu/~gross/preprints/sat.pdf). Author preprint, 17 pages; printed and physical pages agree. SHA-256 `9bd0077b2057edd32885e46fd38872f423a4d45fef6bec0aa181af32dee062b3`. Packet source ids: `Gross` (GS3–GS4).
  Passages the plan relies on: §2 pp3–5 through (2.9): vol(K)=1, convolution and indicator basis; §3 pp6–8: Haar normalization, transform, triangular and minuscule formulas; §4 pp8–9 through (4.4): Kazhdan–Lusztig polynomials and the IC basis; §8 pp15–16: half-root normalization and GL2 parameters.

<a id="src-py"></a>

- **PY.** Gopal Prasad and Jiu-Kang Yu, [On quasi-reductive group schemes](https://math.stanford.edu/~conrad/papers/qrg.pdf). Author-hosted preprint: Corollary 1.3, proof §5.4 p12. FS calls the published result Corollary 5.2; the editions have different numbering. SHA-256 `138d931a21fa522d97449c77acf429918826b1ef649be940d4721d616a1fc73b`. Packet source ids: `PY` (GS3–GS4).
  Passages the plan relies on: Introduction pp1–3, Theorem 1.2 and Corollary 1.3 with residue-characteristic-two exception; §5.3–§5.4 pp11–12, closed-immersion proof and its schematic-closure/maximal-bounded-subgroup route.

<a id="src-dm"></a>

- **DM.** Pierre Deligne and James S. Milne, [Tannakian categories](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf). Author-hosted notes revised 15 August 2012; statements numbered 2.20, 2.22, 2.23; pp24–27. SHA-256 `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8`. Packet source ids: `DM` (GS3–GS4).
  Passages the plan relies on: §2 pp24–27, Proposition 2.20, Corollary 2.22 (characteristic zero hypothesis) and Proposition 2.23 and proofs: finite type, connectedness, proreductivity.

<a id="src-dh"></a>

- **DH.** Stephen Doty and Anne Henke, [Decomposition of tensor products of modular irreducibles for SL2](https://arxiv.org/pdf/math/0205186). arXiv:math/0205186v1, 24-page PDF; header dated 16 May 2002, title page dated 28 May 2022; physical and printed pages agree. SHA-256 `8fb52434afec7149a85783fbc791f17cb2f7c539312bc3aec94a14ada10f4d6f`. Packet source ids: `DH` (GS3–GS4).
  Passages the plan relies on: §1 pp2–4: tilting-module conventions, Lemma 1.1 on small tilting modules, Lemmas 1.3–1.4 on tensor products and Frobenius-twisted factorization; §5 p18: the expression of T(2^k−2) as the square of the (k−1)-st Steinberg module; used to derive, rather than quote, the Frobenius-kernel invariant calculation.

## What the pinned libraries have

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit
(`data/library-coverage.json`, AUDIT-21) finds every geometric Satake target of
these layers missing; the libraries supply the algebraic and categorical
substrates below, and this roadmap reuses them rather than planning them again.
Witt vectors, perfect rings, schemes and proper morphisms, module flatness and
projectivity, t-structures and their hearts, full subcategories, action
categories, monoidal, braided, symmetric and rigid categories, adjunctions,
monadicity criteria, Hopf algebras, root pairings, representations, affine
group schemes over a commutative ring and reductive affine group schemes over a
field are all present. Three limits matter:

- Tau Ceti's `ReductiveAffineGroupSchemeCat` is defined over a field; it does
  not define integral reductivity over Z_ℓ, so the integral dual group is
  RG2.5's.
- Tau Ceti's Tannaka declarations (`tensorAutFunctor`,
  `pointsFunctorIsoTensorAutFunctor`, `reconstructedPoint`) compare points of a
  given Hopf algebra with tensor automorphisms; they do not construct a
  coordinate Hopf algebra from a symmetric monoidal category. Relative
  reconstruction is imported from MC.6.
- Tau Ceti's `InvertibleSheaf` carries scheme line bundles; it supplies neither
  positivity nor the Picard calculus on the divisor, which are SF.5's and the
  Witt-geometry layer's.

The 47 declarations cited:

| Declaration | Module | What it provides here | Layers |
| --- | --- | --- | --- |
| `mathlib:Action` | `Mathlib/CategoryTheory/Action/Basic.lean` | Objects with a monoid homomorphism into their endomorphisms; morphisms intertwine the action. Only the discrete equivariant-object core. | GS0–GS2 |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Properness of a morphism of schemes. The representing object is a proper perfectly finitely presented scheme, and the fibral descent criterion is for proper maps. | GS0–GS2 |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The ordinary scheme carrier and category. Being a perfection of a projective model is a missing target; the existence of Scheme does not establish BS representability. | GS0–GS2 |
| `mathlib:Bialgebra` | `Mathlib/RingTheory/Bialgebra/Basic.lean` | Compatible algebra and coalgebra structures on a semiring/module; the underlying coordinate algebra, not the representing object F(L1) before dualization. | GS3–GS4 |
| `mathlib:CategoryTheory.ActionCategory` | `Mathlib/CategoryTheory/Action.lean` | The category of elements of a monoid action, with Groupoid for group actions. This is the local quotient presentation, not stackification. | GS0–GS2 |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Unit and counit with triangle identities; used for bounded left adjoints of the fibre functor. | GS3–GS4 |
| `mathlib:CategoryTheory.BraidedCategory` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` | Natural braiding isomorphisms satisfying both hexagon identities. | GS3–GS4 |
| `mathlib:CategoryTheory.Comma` | `Mathlib/CategoryTheory/Comma/Basic.lean` | Comma categories, the pinned form of the slice and correspondence categories over which the convolution 2-category is indexed. | GS0–GS2 |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences of categories, the form of the special-fibre comparison of the ULA categories over Spd O_C, Spd C and Spd k. | GS0–GS2 |
| `mathlib:CategoryTheory.Functor.Braided` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` | A monoidal functor compatible with the specified braidings; applies to the modified fusion symmetry. | GS3–GS4 |
| `mathlib:CategoryTheory.Functor.Monoidal` | `Mathlib/CategoryTheory/Monoidal/Functor.lean` | Compatible lax and oplax monoidal structures with inverse tensor and unit constraints. | GS3–GS4 |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Abstract Grothendieck topologies; actual v/h/étale topologies and their descent properties are supplier work. | GS0–GS2 |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | (GS0–GS2) Left duals only. The conclusion that all Satake objects have both duals uses the separate RigidCategory carrier. (GS3–GS4) Chosen left duals for every object; Verdier duality combined with inversion supplies these in Satake. | GS0–GS2, GS3–GS4 |
| `mathlib:CategoryTheory.Limits.HasColimit` | `Mathlib/CategoryTheory/Limits/HasLimits.lean` | Mere existence of a colimit cocone for the diagram (lines 94–98); colimit chooses its object by the dual definition at lines 180–182. Gives the underlying module only, not a Hopf structure. | GS3–GS4 |
| `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair` | `Mathlib/CategoryTheory/Monad/Monadicity.lean` | For every F-split parallel pair, its coequalizer exists in the source category. | GS3–GS4 |
| `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair` | `Mathlib/CategoryTheory/Monad/Monadicity.lean` | F preserves coequalizers of every F-split parallel pair. | GS3–GS4 |
| `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair` | `Mathlib/CategoryTheory/Monad/Monadicity.lean` | F reflects coequalizers of every F-split parallel pair. | GS3–GS4 |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | (GS0–GS2) Monoidal categories, the structure convolution puts on the bounded sheaf category and on the Satake category. (GS3–GS4) Tensor, unit, associators and unitors with naturality, pentagon and triangle laws. | GS0–GS2, GS3–GS4 |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | Full subcategories with the existing fully faithful inclusion; their object property must be stated mathematically. | GS0–GS2 |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | Pretriangulated categories, the level at which the t-structure and the recollement of the Schubert stratification are stated. | GS0–GS2 |
| `mathlib:CategoryTheory.RigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Both left and right rigid structures. LeftRigidCategory alone cannot state VI.8.2. | GS0–GS2 |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves valued in a category on a Grothendieck site; the diamond/v-site topology and geometric representability are not provided by this carrier. | GS0–GS2 |
| `mathlib:CategoryTheory.SymmetricCategory` | `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean` | A braided category with double braiding equal to the identity. | GS3–GS4 |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | t-structures on a triangulated category, already in the pinned library with IsLE and IsGE. The relative perverse t-structure of GS1 is one of these, so the abstract notion is cited and only its normalisation is planned. | GS0–GS2 |
| `mathlib:CategoryTheory.Triangulated.TStructure.Heart` | `Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean` | The Heart typeclass identifies a heart with a full subcategory of a pretriangulated category; TStructure.heart is the underlying object property. No generic abelian-heart theorem is claimed. | GS0–GS2 |
| `mathlib:CoxeterSystem` | `Mathlib/GroupTheory/Coxeter/Basic.lean` | Abstract Coxeter-system combinatorics only. Affine root data, Cartan/Iwasawa decomposition and parahoric geometry require RG2.4. | GS0–GS2 |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The Verdier-localization carrier for the derived category of an abelian category, not the stable enhanced sheaf categories or six-operation coherence; EDS owns those extensions. | GS0–GS2 |
| `mathlib:HopfAlgebra` | `Mathlib/RingTheory/HopfAlgebra/Basic.lean` | An antipode on a bialgebra satisfying the two convolution inverse identities; commutativity is an additional algebra hypothesis. | GS3–GS4 |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules; paired with Module.Projective for lattice and fibre-functor finiteness. | GS0–GS2 |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | (GS0–GS2) Flatness. Flat perversity is half the definition of the Satake category, and it is what excludes the Tor obstruction to t-exactness of convolution. (GS3–GS4) Injectivity of tensor maps for finitely generated submodules, with the standard injective-map characterization. | GS0–GS2, GS3–GS4 |
| `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness characterized by injectivity preservation of linear maps after tensor; the smallness universe condition is part of the source statement. | GS0–GS2 |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The lattice computation in the GL_n case of the open-cell stabilizer chooses a compatible basis, which is a freeness statement after localisation. | GS0–GS2 |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | (GS0–GS2) Projective modules: finite projective terms of a strict perfect complex, flat-perverse torus fibres in degree zero, total Satake cohomology and lattice graded pieces. ULA alone requires perfect stalk complexes and does not make each cohomology module projective. (GS3–GS4) The free-module surjection splits; equivalent to lifting linear maps along surjections. | GS0–GS2, GS3–GS4 |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The subtype of p-adic numbers with norm ≤1, with the existing commutative ring structure for prime p. Its ℤ_p-algebra structure explicitly states the coefficient hypothesis of the uniform ℓ-power torsion bound. | GS0–GS2 |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | PerfectRing R p asserts bijectivity of the p-th power map on a type with powers; it does not itself assert that p is prime or that R has characteristic p. The Witt geometric applications separately require a commutative ring, Fact p.Prime and CharP R p, giving a perfect F_p-algebra. This is the algebraic hypothesis carrier, not a representability result. | GS0–GS2 |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | A monoid homomorphism to linear endomorphisms. Continuity of the Weil action and finite projectivity are extra conditions, not supplied by this abbreviation. | GS3–GS4 |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | (GS0–GS2) The abstract paired roots/coroots and their module dualities, not a built split reductive group, Lie-weight decomposition or affine Cartan theorem. (GS3–GS4) A perfect root/coroot pairing on dual modules with reflections. Integral pinned group schemes are a separate imported construction. | GS0–GS2, GS3–GS4 |
| `mathlib:ValuationRing` | `Mathlib/RingTheory/Valuation/ValuationRing.lean` | Valuation rings. The proof of the fibral descent criterion reduces to a base whose connected components are spectra of valuation rings. | GS0–GS2 |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | The type of p-typical Witt vectors, indexed by a natural p. Its ring laws and perfect-ring properties are reused; ramified Witt coefficient comparison is RF0’s node, not a new definition here. | GS0–GS2 |
| `tauceti:TauCeti.AffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean` | Affine group objects over Spec of a commutative ring; usable for the integral reconstructed group. | GS3–GS4 |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | Invertible sheaves on an ordinary scheme, including the Witt-bound and Demazure determinant lines after those schemes are constructed. This carrier supplies neither ampleness nor the adic Cartier-divisor line I_S^m/I_S^{m+1}; the latter belongs to the RF2/RF4 geometric interfaces. | GS0–GS2 |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean` | (GS0–GS2) Reductive affine group schemes over a FIELD k, using [Field k]. This does not provide an integral O_E-model or parahoric group scheme; those are requested from RG2.3. (GS3–GS4) Finite-type reductive affine group schemes over a field; usable for the generic fibre, not a definition over Z_ℓ. | GS0–GS2, GS3–GS4 |
| `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` | Over a field k and a given commutative Hopf algebra H, identifies its points functor with the tensor automorphisms of scalar extension. This is a comparison after reconstruction, not the relative integral existence theorem. | GS3–GS4 |
| `tauceti:TauCeti.Tannaka.reconstructedPoint` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Reconstruction.lean` | Over a field k, for a given commutative Hopf algebra H and commutative k-algebra A, maps a tensor automorphism of scalar extension on finitely generated H-comodules to WithConv (H →ₐ[k] A). This assumes H rather than reconstructing it. | GS3–GS4 |
| `tauceti:TauCeti.Tannaka.tensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` | For a given bialgebra H (a semiring) over a commutative ring R, tensor automorphisms of scalar extension on finitely generated H-comodules. Commutativity of H is not required here. Does not construct H from an arbitrary tensor category. | GS3–GS4 |
| `tauceti:TauCeti.TitsSystem.bruhatCell` | `TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean` | Bruhat cells of a Tits system. Tau Ceti already has the Bruhat decomposition, which is the combinatorial shadow of the Schubert stratification this layer builds geometrically. | GS0–GS2 |
| `tauceti:TauCeti.reductiveAffineGroupSchemeProperty` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean` | Object property on finite-type affine group schemes over a field, transported from the reductive coordinate Hopf-algebra property. | GS3–GS4 |

## Layer overview

| Layer | Title | Nodes | Planets |
| --- | --- | ---: | --- |
| [`GS0`](#layer-gs0) | Beilinson–Drinfeld Grassmannians and loop groups | 0 |  |
| [`GS0:loop-geometry`](#layer-gs0-loop-geometry) | Integral divisors and bounded modifications | 10 | Loop spaces, Local Hecke stack, Beilinson–Drinfeld Grassmannian, Schubert bounds, Demazure spaces, Congruence filtration |
| [`GS0:Schubert-smoothness`](#layer-gs0-schubert-smoothness) | Early geometric return to Bun_G | 4 | Truncated positive loops, Schubert cell smoothness |
| [`GS0:Witt-geometry`](#layer-gs0-witt-geometry) | Projectivity and the special-fibre comparison | 21 | Witt vector affine Grassmannian, Witt module types, Witt Demazure resolution, Determinant line, Witt projectivity theorem, Parahoric Witt Grassmannians |
| [`GS1`](#layer-gs1) | Semi-infinite geometry and constructibility | 16 | Constant term functor, Mirković–Vilonen cycles, ULA Hecke complexes, Relative perverse t-structure, Flat perversity, Standard Satake objects |
| [`GS2`](#layer-gs2) | Satake objects and convolution | 0 |  |
| [`GS2:correspondences`](#layer-gs2-correspondences) | Objects and convolution before t-exactness | 6 | Satake category, Satake cohomology functor, Hecke convolution |
| [`GS2:Satake-closure`](#layer-gs2-satake-closure) | Convolution closure and rigidity | 5 | Satake convolution closure, Satake rigidity |
| [`GS3`](#layer-gs3) | Fusion, symmetry and finite-set functoriality | 0 |  |
| [`GS3:fusion`](#layer-gs3-fusion) | Coherent collision and factorization maps | 8 | Disjoint-leg factorization, Collision extension uniqueness, Satake parity, Fusion product, Finite-set fusion, Symmetric constant terms |
| [`GS4`](#layer-gs4) | Tannakian reconstruction and the Weil action | 0 |  |
| [`GS4:integral-dual-group`](#layer-gs4-integral-dual-group) | Reconstruction and normalized functoriality | 17 | Satake coordinate Hopf algebra, Pinned geometric dual group, Witt vector geometric Satake, Normalized Satake equivalence, Chevalley involution, Perfect Satake kernels |
| [`GS4:rational-reductivity`](#layer-gs4-rational-reductivity) | The late decomposition-theorem input | 3 | Geometric Satake semisimplicity, Generic Satake reductivity |
| [`GS4:classical-Satake-comparison`](#layer-gs4-classical-satake-comparison) | A downstream comparison, not an input | 4 | Normalized Frobenius function, Classical Satake comparison |

**Order of construction.** The geometry comes first: loop groups and the
Grassmannian over the divisor bases, then generic Schubert bounds, cell
smoothness and the Witt vector geometry, whose projectivity theorem gives
integral bounded properness. Semi-infinite orbits and constant terms come next,
because universal local acyclicity, flatness and the relative perverse
t-structure are all detected by constant terms. The Satake category, its fibre
functor and convolution follow, and convolution closure and rigidity are proved
before fusion, as in FS VI.8: the elementary two-leg collision family used in
VI.8.1(ii) is part of the closure proof and does not use the symmetric fusion
of VI.9. Fusion gives the symmetric monoidal structure and finite-set
functoriality. Reconstruction (VI.10) then produces the Satake group; its
generic fibre is shown reductive using the rational decomposition theorem on
the Witt special fibre (EDC.7 is used only after the early geometry: in the rational parity
and torsion bound of GS1 and here); and
the torus, rank-one and root-datum identifications, integral recovery and the
pinned identification (VI.11) lead to the normalized equivalence. The Chevalley
involution (VI.12), the perfect-complex export (IX.2), the naturality
statements (IX.6) and the classical comparison close the roadmap. The classical
comparison is downstream of both constructions and is never an input to them.

**Main path.** The headline equivalence
[Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) rests on
[Canonical pinned dual identification](#n-gs4-integral-dual-group-dual-group-identification), which rests on
[Integral recovery and the adjoint reduction](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction),
[Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum) and
[Reductivity of the generic Satake group](#n-gs4-rational-reductivity-generic-fibre-reductivity); these rest on
[Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra), which
applies MC.6 to [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) and
[Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor); and those rest
on [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability),
[Relative perverse t-structure](#n-gs1-relative-perverse-t-structure),
[Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) and the loop
geometry of [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) and
[Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness). The rational Witt
equivalence [Rational Witt vector geometric Satake equivalence](#n-gs4-integral-dual-group-witt-rational-satake-equivalence)
uses only the generic fibre and is independent of the characteristic-two
rank-one step.

## The layers

Each layer begins with its plan in prose, followed by its declarations in
dependency order. Every declaration gives its statement, hypotheses, proof
outline or construction, direct prerequisites (inside this roadmap as links,
elsewhere as atlas ids), sources, the uses that shape its API, its API (for definitions and constructions), its
unit tests where recorded, its acceptance checks, the
prototype boundary of its Lean signature where one is recorded, and the gaps
and requests that name it. Layer GS4:integral-dual-group is shown in two
groups, because the rational layer GS4:rational-reductivity uses the
reconstruction group and is used by the identification group (see
[Dependencies](#dependencies)).

<a id="layer-gs0"></a>

## GS0 — Beilinson–Drinfeld Grassmannians and loop groups

GS0 is the aggregate of the three geometric substages below. Its declarations
are owned by GS0:loop-geometry, GS0:Schubert-smoothness and GS0:Witt-geometry
and also realise GS0; the aggregate has no declarations of its own and no
second Grassmannian, smoothness or properness node. Its acceptance is that of
the three families, including the two-leg collision bound and the distinction
between generic and integral properness.

<a id="layer-gs0-loop-geometry"></a>

### GS0:loop-geometry — Integral divisors and bounded modifications

Three moduli objects are kept apart: loop evaluation, the Hecke groupoid with
its automorphisms, and the Grassmannian quotient sheaf with a chosen punctured
trivialization. Ordered legs, generic Galois descent and generic bounded
properness are built on them. The loop and torsor functors use RF2's completed
rings and its descent of vector bundles on each finite Cartier thickening;
passing to finite projective modules over the completed ring needs RF4's
algebraization of compatible quotient systems (uniform rank, continuous
complete ring maps, effective transition data); this, Beauville–Laszlo gluing and
the Tannakian torsor transfer are requested from RF4. Early bounded
properness uses only the generic divisor geometry; integral bounded properness
also needs the special Witt fibre and is proved in GS0:Witt-geometry. The
affine flag variety and its Demazure resolutions are a separate construction,
and the finite congruence layers connect the moduli to Lie data without giving
the whole positive loop group a finite dimension. The separated étale lift
over a divisor (FS VI.1.13) is a lemma of its own, used in the smooth loop
charts. Acceptance includes the diagonal stabilizer of the identity Hecke
modification, the unit section of the Grassmannian, the equal-degree GL₂
dominance counterexample and the empty reduced-word flag resolution.

#### Positive and full loop spaces

<a id="n-gs0-loop-geometry-loop-groups-and-local-hecke"></a>
`GS0:loop-geometry/loop-groups-and-local-hecke` · construction · planet: **Loop spaces**

**Lean name:** `TauCeti.GeometricSatake.positiveLoopSpace`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For an affine O_E-scheme Z and a divisor D in Div^d_𝒴, L⁺Z(S)=Z(B⁺_D(S)) and LZ(S)=Z(B_D(S)) are v-sheaves over Div^d_𝒴. The generic E-scheme version is defined over Div^d_Y or Div^d_X. For X use the basis of affinoid S for which D_S is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion L⁺G→LG.

**Hypotheses.**

- Z affine; d≥1; integral G is a split reductive O_E-model; generic G/E can be ramified.

**Construction.**

1. Import completed rings, their functoriality and v-descent from RF2.
2. Evaluate the affine functor of points on those rings; v-descent of sections follows from affine equations and the structure sheaf.
3. Restrict to the affinoid-divisor basis over X and descend across its open covers.

**Direct prerequisites.**

- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`
- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `ReductiveGroupsPartII:RG2.3`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources.**

- [FS](#src-fs), VI.1.5, p. 192

**Uses that shape the API.**

- FS VI.1.7–VI.1.9: Loop maps present both modification moduli.
- HeckeStacksAndLocalShtukas:HS0: Local modifications form the relative Hecke correspondence.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.positiveLoopSpace_eval` | characterisation | At a completed ring A, the positive loop space is the affine functor of points F(A); the full loop space uses A[1/ξ]. |
| `TauCeti.GeometricSatake.positiveLoopSpace_map` | functoriality | A ring map induces the map F(f); identity and composition agree with those in the affine functor. |
| `TauCeti.GeometricSatake.positiveLoopSpace_map_comp` | relation | Positive loop maps compose in the same order as ring maps. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.loop_gm_units` | computation | For G_m the evaluation at A agrees with the unit group of A. |
| `TauCeti.GeometricSatake.loop_trivial` | degenerate | The trivial affine group has one loop at every ring. |
| `TauCeti.GeometricSatake.loop_affine_evaluation` | compatibility | Affine evaluation uses the existing CommRingCat functor, not an underlying-set functor on schemes. |

**Acceptance.**

- For G=G_m the two groups are (B⁺)ˣ and Bˣ; for G=GL_n they are invertible matrices.

**Prototype boundary.** This signature retains affine functor evaluation; completed-ring assignment, divisor sites, v-descent and group-valued structure are supplied by RF2/RG. Full loop evaluation is the same signature at the localized input ring.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`.

#### Local Hecke stack

<a id="n-gs0-loop-geometry-local-hecke-stack"></a>
`GS0:loop-geometry/local-hecke-stack` · construction · planet: **Local Hecke stack**

**Lean name:** `TauCeti.GeometricSatake.localHeckeAction`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

Hck_G(S) is the groupoid of two G-torsors on Spec B⁺_D(S), together with an isomorphism of their B_D-restrictions. It is a small v-stack; its étale-stack presentation is [L⁺G\LG/L⁺G].

**Hypotheses.**

- The same divisor basis and group-model conditions as loop spaces.

**Construction.**

1. Use RF2 finite-thickening descent together with RF4 effective descent/algebraization of compatible completed finite-projective modules (uniform rank and continuity), then transfer through the faithful exact tensor description to G-torsors. The completed-ring conclusion is not supplied by RF2 finite-thickening descent alone.
2. Trivialize torsors étale-locally using the geometric DVR and smooth finite-level lifting/spreading.
3. Changes of the two trivializations give the double quotient; keep automorphisms, rather than taking only isomorphism classes.

**Direct prerequisites.**

- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.3`
- `mathlib:CategoryTheory.ActionCategory`
- `RelativeFarguesFontaine:RF2:untilts`

**Sources.**

- [FS](#src-fs), VI.1.6–VI.1.7, p. 193

**Uses that shape the API.**

- FS VI.1.7: The double quotient must keep stabilizers.
- FS VI.8: The middle positive-loop action is divided out in convolution.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.localHeckeAction_formula` | characterisation | The double action is (h₁,h₂)·g=h₁gh₂⁻¹, and the quotient is an action groupoid. |
| `TauCeti.GeometricSatake.localHeckeAction_groupoid` | compatibility | For the double action, the local quotient uses Mathlib ActionCategory with its Groupoid instance. |
| `TauCeti.GeometricSatake.localHeckeAction_unit_stabilizer` | characterisation | The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.hecke_trivial_group` | degenerate | For the trivial group there is one modification and one automorphism. |
| `TauCeti.GeometricSatake.hecke_identity_automorphisms` | non-example | In the multiplicative encoding of ℤ, the diagonal pair labelled by 1 additive fixes the identity modification and has a nonidentity group label. Replacing the action groupoid by its orbit set loses this automorphism. |
| `TauCeti.GeometricSatake.hecke_double_action` | computation | For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse. |

**Acceptance.**

- At the trivial modification automorphisms are the diagonal L⁺G; for the trivial group the stack is the base.

**Prototype boundary.** The action groupoid is the local presentation. Stackification, ring-valued torsors and étale-local trivialization are not encoded by a new unknown predicate.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.12](#req-r0-12) to `RelativeFarguesFontaine:RF4:G-torsors`; request [R0.22](#req-r0-22) to `RelativeFarguesFontaine:RF2:untilts`.

#### Beilinson–Drinfeld Grassmannian

<a id="n-gs0-loop-geometry-grassmannian"></a>
`GS0:loop-geometry/grassmannian` · construction · planet: **Beilinson–Drinfeld Grassmannian**

**Lean name:** `TauCeti.GeometricSatake.grassmannianQuotient`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

Gr_G(S) classifies a G-torsor on Spec B⁺_D(S) with a B_D-trivialization. It is a small v-sheaf and the étale sheafification of LG/L⁺G. Its map to Hck_G fixes the second torsor as trivial.

**Hypotheses.**

- Integral and generic group and divisor conventions as above.

**Construction.**

1. Use the same effective torsor descent as Hck_G.
2. The B-trivialization kills all automorphisms; étale-local trivialization gives the quotient sheaf.
3. Apply imported Beauville–Laszlo gluing for the identification with modifications off D on the relative curve.

**Direct prerequisites.**

- [Local Hecke stack](#n-gs0-loop-geometry-local-hecke-stack) (`GS0:loop-geometry/local-hecke-stack`)
- `RelativeFarguesFontaine:RF4:G-torsors`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources.**

- [FS](#src-fs), VI.1.8–VI.1.9, pp. 193–194

**Uses that shape the API.**

- FS VI.2: Schubert cells live in the quotient sheaf.
- FS VI.7.9: Pullback from Hecke sheaves is fully faithful on the Grassmannian.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.grassmannianQuotient_eq` | compatibility | The trivialized local presentation is the existing right-coset carrier G/H; H need not be normal. |
| `TauCeti.GeometricSatake.grassmannianQuotient_mk` | constructor | Every full loop gives its right-coset class and hence a trivialized modification. |
| `TauCeti.GeometricSatake.grassmannianQuotient_eq_iff` | characterisation | Two trivializations define the same point precisely when g⁻¹g′ lies in H. |
| `TauCeti.GeometricSatake.grassmannianQuotient_unit` | constructor | The unit section is the class of the identity full loop. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.grassmannian_zero` | degenerate | The unit section is the coset of the identity full loop. |
| `TauCeti.GeometricSatake.grassmannian_all_subgroup` | computation | When H=G, the local quotient has exactly one point. |
| `TauCeti.GeometricSatake.grassmannian_non_normal` | compatibility | Grassmannian cosets do not require H normal; the quotient is the existing set quotient even without a quotient-group structure. |

**Acceptance.**

- The unit section is the trivial torsor with identity trivialization.

**Prototype boundary.** Only the coset presentation is typed; étale sheafification and the Beauville–Laszlo comparison require the RF4 supplier. The unit example tests its naming, while the nonnormal API prevents imposing an incorrect normality requirement.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.12](#req-r0-12) to `RelativeFarguesFontaine:RF4:G-torsors`.

#### Ordered legs and divisor base change

<a id="n-gs0-loop-geometry-ordered-leg-base-change"></a>
`GS0:loop-geometry/ordered-leg-base-change` · theorem

**Lean name:** `TauCeti.GeometricSatake.orderedLegCollision`. **Also realises:** `GS0`.

For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{|I|}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.

**Hypotheses.**

- Split integral model; restrict to generic Y/X for a general G/E.

**Proof outline.**

1. Import divisor addition, disjointness and completion base change from RF2.
2. Apply product decomposition of torsors and trivializations to the functor of points.
3. At a collision the ideal has repeated factors but its completion is the same adic ring; the relative-position bound is the sum.

**Direct prerequisites.**

- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`

**Sources.**

- [FS](#src-fs), VI.2.6 and preceding discussion, pp. 199–200

**Acceptance.**

- Two equal legs have a single local factor bounded by μ₁+μ₂; two distinct legs have two factors.

**Prototype boundary.** The typed coweight core adds labels at collisions; divisor-completion base change and disjoint-product v-sheaf isomorphisms need RF2.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Generic Schubert bounds

<a id="n-gs0-loop-geometry-schubert-bounds-and-properness"></a>
`GS0:loop-geometry/schubert-bounds-and-properness` · construction · planet: **Schubert bounds**

**Lean name:** `TauCeti.GeometricSatake.dominanceBound`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

After a splitting extension and choices T⊂B⊂G, define Gr_{≤μ} by geometric rank-one points whose Cartan coweight is ≤μ; Gr_μ has exact relative position μ. Over generic Div^d_Y and Div^d_X the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each π₁(G)-component is Gr. Bounds for a tuple of legs sum at collisions.

**Hypotheses.**

- μ dominant; μ−λ is a sum of positive coroots with the same π₁-class. General G/E descends its Galois-stable orbit of bounds.

**Construction.**

1. Import Cartan decomposition and its functorial descent from RG2.4.
2. Use SW 19.2–19.4 and 20.4.5 for generic properness: the successive bounded convolution tower surjects, giving quasicompactness in addition to partial properness.
3. Detect closedness on geometric points; ordered covers and finite splitting descent give the Div^d versions. Integral properness is the distinct Witt node.

**Direct prerequisites.**

- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `DiamondsAndVStacks:D6/pre-adic-diamondification`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources.**

- [FS](#src-fs), VI.2.2–VI.2.3, pp. 196–197

**Uses that shape the API.**

- FS VI.2.2–VI.2.3: Bounds require Cartan labels and the same component.
- FS VI.8: Bounded convolution lands in the summed cocharacter bound.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.dominanceBound_iff` | characterisation | For GL_n, dominance means equal total degree and every initial partial sum of ν at most the corresponding sum of μ. |
| `TauCeti.GeometricSatake.dominanceBound_refl` | relation | Every dominant cocharacter lies in its own bound. |
| `TauCeti.GeometricSatake.dominanceBound_trans` | relation | Bounds are nested by transitivity of the dominance relation. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.bound_zero_component` | degenerate | For a torus of rank one the bound is equality, not the usual integer order. |
| `TauCeti.GeometricSatake.bound_gl2` | computation | GL₂ coweight (1,1) is below (2,0). |
| `TauCeti.GeometricSatake.bound_wrong_degree` | non-example | The cocharacter (1,0) is not below (2,0), despite its smaller partial sums. |

**Acceptance.**

- μ=0 is the unit section; a bound in one component does not include a coweight with another π₁-class.

**Prototype boundary.** The GL_n combinatorial core is a fully stated predicate, not a placeholder. Geometric relative-position maps, closedness and properness have their own theorem nodes and supplier requests.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`.

#### Galois descent of bounded modifications

<a id="n-gs0-loop-geometry-generic-galois-descent"></a>
`GS0:loop-geometry/generic-galois-descent` · comparison

**Lean name:** `TauCeti.GeometricSatake.genericGaloisDescent`. **Also realises:** `GS0`.

For finite Galois E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.

**Hypotheses.**

- Generic divisors on Y or X; μ̄ a finite Galois orbit.

**Proof outline.**

1. Import finite étale/v-descent of affine group data.
2. Apply descent to geometric Cartan labels and their stable unions.
3. Descend properness and local spatiality along the finite splitting cover. Cohomological smoothness is first proved in open-cell-stabilizer-and-smoothness and then descended there; it is not an input to this earlier node.

**Direct prerequisites.**

- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- `ReductiveGroupsPartII:RG2.3`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources.**

- [FS](#src-fs), VI.2 opening and VI.8 final paragraphs, pp. 196, 226

**Acceptance.**

- An individual μ not defined over E is retained only after splitting; its orbit descends.

**Prototype boundary.** Only isomorphism detection is typed. Effective Galois descent and split orbit-bound data are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`.

#### Affine flags and Demazure spaces over Spd O_C

<a id="n-gs0-loop-geometry-affine-flag-demazure"></a>
`GS0:loop-geometry/affine-flag-demazure` · construction · planet: **Demazure spaces**

**Lean name:** `TauCeti.GeometricSatake.demazureChains`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For split G and an Iwahori model 𝓘⊂G, Fl_G=LG/L⁺𝓘 over Spd O_C. Its projection to Gr has v-locally fibre (G/B)^⋄ and is proper and cohomologically smooth. For w=s₁⋯s_rω reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by L⁺𝓘, followed by ω. It is an iterated (P¹)^⋄-bundle, proper over the bound, and isomorphic over the open w-cell.

**Hypotheses.**

- Parahoric models and affine Weyl group from RG2.3–RG2.4.

**Construction.**

1. Construct torsor quotients and their changes of trivialization.
2. Use each minimal parahoric quotient P_i/𝓘=(P¹)^perf on the special fibre and the corresponding integral flag diamond.
3. Multiply the factors; reducedness gives the open-cell isomorphism and the boundary normal-crossing strata needed for ULA generation.

**Direct prerequisites.**

- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity) (`GS0:Witt-geometry/parahoric-ind-projectivity`)

**Sources.**

- [FS](#src-fs), VI.5.1–VI.5.7, pp. 209–211

**Uses that shape the API.**

- FS VI.5: Demazure pushforwards generate the ULA category.
- Zhu 1.4: Reduced-word towers prove parahoric projectivity.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.demazureChains_points` | characterisation | The point core consists of chains x₀,…,x_r with each consecutive pair in the specified simple-step relation. |
| `TauCeti.GeometricSatake.demazureChains_endpoint` | projection | Multiplication forgets the intermediate flags and keeps the endpoints. |
| `TauCeti.GeometricSatake.demazureChains_base_change` | functoriality | A map of flag spaces preserving each simple-step relation acts on every vertex of a Demazure chain. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.demazure_empty` | degenerate | An empty chain is one flag; its two endpoints coincide. |
| `TauCeti.GeometricSatake.demazure_one_step` | computation | A one-step chain is the given simple-step incidence relation. |
| `TauCeti.GeometricSatake.demazure_not_product` | non-example | If a simple-step relation is empty, there is no chain, even if the flag space is nonempty. |

**Acceptance.**

- The empty word gives the ω-cell; a simple reflection gives P¹ with its open A¹ cell.

**Prototype boundary.** The typed chain is the functor-of-points incidence core; contracted products, parahoric torsors and the iterated P¹-bundle structures need RG/SF/VS suppliers. This core does not prove representability.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`.

#### Separated étale lifts over an effective divisor

<a id="n-gs0-loop-geometry-etale-over-divisor"></a>
`GS0:loop-geometry/etale-over-divisor` · lemma

**Lean name:** `TauCeti.GeometricSatake.etaleOverDivisor`. **Also realises:** `GS0`.

Let S be a perfectoid space over F_q with a map S→Div^d_𝒴 and associated Cartier divisor D_S⊂𝒴_S. For any separated étale map of adic spaces D′→D_S, the functor on perfectoid T→S sending T to Hom_{D_S}(D_T,D′) is represented by a perfectoid space S′ with a separated étale map S′→S. The representing bijections Hom_S(T,S′)≃Hom_{D_S}(D_T,D′) are natural in T.

**Hypotheses.**

- E is a nonarchimedean local field with residue F_q; the integral divisor base is Div^d_𝒴, so untilts over O_E including special-characteristic legs are allowed.
- D_T is the pullback effective Cartier divisor on 𝒴_T. The degree d is finite; repeated legs retain their Cartier multiplicities. The map D′→D_S is separated étale. No reductive group, coefficient ring or ℓ≠p hypothesis is needed.

**Proof outline.**

1. Use v-descent for separated étale perfectoid spaces to reduce S to a strictly totally disconnected cover (DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks; FS cites Sch17a Proposition 9.7).
2. Exhaust D′ by increasing quasicompact opens and work with one such open. On each geometric fibre, D_S up to nilpotents is the finite disjoint union of its distinct geometric O_E-untilt supports. A separated étale D′ over this fibre is a disjoint union of open subspaces.
3. Spread these fibrewise descriptions to a neighbourhood, using the étale local structure theorem and the étale-site comparison (FS cites Sch17a Proposition 11.23 and Lemma 15.6), and glue the resulting local representing spaces.
4. For the reduced case D′⊂D_S open, the representing locus is the complement of the image of |D_S|\|D′| under |D_S|→|S|. This is open because that support map is closed. Its inclusion into S represents exactly the lift functor.
5. Descent and gluing give the separated étale S′→S and the natural universal property. Uniqueness follows from Yoneda.

**Direct prerequisites.**

- `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`
- `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`
- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `RelativeFarguesFontaine:RF2:untilts`
- `DiamondsAndVStacks:D1/strictly-totally-disconnected`
- `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`
- `DiamondsAndVStacks:D5/local-structure-of-etale-maps`
- `DiamondsAndVStacks:D6/etale-site-comparison`
- `RelativeFarguesFontaine:RF2:integral-divisors`

**Sources.**

- [FS](#src-fs), Lemma VI.1.13 and proof, printed/PDF p. 196. Exactly the separated étale representability of the divisor-lift functor, including its natural universal property.

**Uses that shape the API.**

- GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops: After forming D′=D_S×_Z Z′ for separated étale Z′→Z, this lemma represents T_{Z′}×_{T_Z}S and proves the separated étale comparison in FS VI.1.12.

**Acceptance.**

- For D′=D_S, the represented functor is final over S and S′≃S.
- For d>0 and D′ empty, every geometric fibre has a nonempty divisor, so the represented functor is empty and S′ is empty; for d=0, D_T is empty and S′≃S.
- Over a geometric base with r distinct support points, D′ a disjoint union of n labelled copies of D_S has n^r lifts; coincident legs do not create additional choices.

**Prototype boundary.** The named Lean declaration TauCeti.GeometricSatake.etaleOverDivisor is omitted under PROTOCOL §13 pending the actual perfectoid/adic-space, effective-divisor pullback, separated-étale and representability carriers. The required signature quantifies E,S,d,D_S,D′→D_S and constructs S′→S with natural Hom_S(T,S′)≃Hom_{D_S}(D_T,D′). An arbitrary Type equivalence or an unspecified Prop field would not express this theorem.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.10](#gap-g0-10) (Étale-over-divisor geometric carriers and support-map input); request [R0.22](#req-r0-22) to `RelativeFarguesFontaine:RF2:untilts`; request [R0.23](#req-r0-23) to `RelativeFarguesFontaine:RF2:integral-divisors`.

#### Smooth scheme loops over a divisor

<a id="n-gs0-loop-geometry-smooth-scheme-loops"></a>
`GS0:loop-geometry/smooth-scheme-loops` · theorem

**Lean name:** `TauCeti.GeometricSatake.smoothSchemeLoopDimension`. **Also realises:** `GS0`.

For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Separated étale maps Z′→Z give representable separated étale maps T_{Z′}→T_Z; open immersions give open immersions.

**Hypotheses.**

- D_S affinoid on the chosen basis; ℓ≠p.

**Proof outline.**

1. For affine space, pull back to the ordered-leg cover and filter the map by d successive affine-space diamonds of the corresponding untilts; each layer has dimension n.
2. For separated étale Z′→Z and S→T_Z, form the separated étale adic map D′=D_S×_Z Z′→D_S. Apply etale-over-divisor (FS VI.1.13) to represent T_{Z′}×_{T_Z}S by a separated étale perfectoid space over S. Open immersions therefore induce open immersions of the mapping functors.
3. At a geometric point D_S has finite support. Quasiprojectivity supplies an affine neighbourhood of its image in Z. For affine Z, a closed immersion into affine space proves local spatiality and partial properness.
4. Choose affine neighbourhoods of these finitely many image points admitting separated étale coordinates to A^n over O_E. The affine-space calculation and separated étale comparison give cohomological smoothness of dimension dn.

**Direct prerequisites.**

- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `ReductiveGroupsPartII:RG2.3`
- [Separated étale lifts over an effective divisor](#n-gs0-loop-geometry-etale-over-divisor) (`GS0:loop-geometry/etale-over-divisor`)
- `RelativeFarguesFontaine:RF2:untilts`

**Sources.**

- [FS](#src-fs), VI.1.12–VI.1.13, pp. 195–196

**Acceptance.**

- For A¹ and degree d the dimension is d.

**Prototype boundary.** Only the degree-times-relative-dimension arithmetic is typed; representability, partial properness and ℓ-cohomological smoothness are missing supplier notions.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.10](#gap-g0-10) (Étale-over-divisor geometric carriers and support-map input); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.22](#req-r0-22) to `RelativeFarguesFontaine:RF2:untilts`.

#### Congruence filtration of positive loops

<a id="n-gs0-loop-geometry-congruence-filtration-and-graded-pieces"></a>
`GS0:loop-geometry/congruence-filtration-and-graded-pieces` · theorem · planet: **Congruence filtration**

**Lean name:** `TauCeti.GeometricSatake.congruenceFiltration`. **Also realises:** `GS0`.

L⁺_mG=ker(L⁺G→G(B⁺/I^m)), m≥1, has successive quotients Lie(G)⊗_{O_E}I^m/I^{m+1}. For degree d these are vector-group diamonds of ℓ-dimension d·dim G. The reduction L⁺G/L⁺_1G is the functor of maps D_S→G; in degree one it is G^⋄. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.

**Hypotheses.**

- G split reductive O_E-model; ℓ≠p; I is the ideal of the degree-d divisor.

**Proof outline.**

1. Linearize the group law modulo successive powers of I using smoothness of G.
2. Import the Cartier-module and geometric DVR descriptions.
3. Reduce degree d on the ordered-leg cover to vector-group layers; apply DSO smoothness and descent.

**Direct prerequisites.**

- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`
- `ReductiveGroupsPartII:RG2.1`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources.**

- [FS](#src-fs), VI.1.10–VI.1.11, pp. 194–195

**Acceptance.**

- For GL_n the graded piece is M_n⊗I^m/I^{m+1}, with addition as group law.

**Prototype boundary.** The group kernel is concrete. The Lie/Cartier-line graded-piece isomorphism and finite-quotient smoothness require RG/RF/DSO interfaces.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`.

<a id="layer-gs0-schubert-smoothness"></a>

### GS0:Schubert-smoothness — Early geometric return to Bun_G

Work with finite jets on a bounded locus. The stabilizer of the open cell
reduces to the opposite parabolic P⁻_μ, and its congruence pieces to Lie
weights; truncation at a sufficiently large positive depth removes the deep
part of the positive-loop action. The smoothness calculation gives the
ℓ-cohomological dimension ⟨2ρ,μ⟩; for minuscule μ the unipotent fibres
disappear and the cell is the flag variety. This layer is supplied to
BunGAndNewtonStrata BG2 before any Satake theory. Acceptance reconciles μ(ξ)
in FS with μ(ξ⁻¹) in Caraiani–Scholze, keeps the one-leg normalization, and
uses the finite-projectivity criterion and the period-sheaf connection rather
than treating pointwise detection as automatic.

#### Truncated positive loop groups

<a id="n-gs0-schubert-smoothness-truncated-positive-loops"></a>
`GS0:Schubert-smoothness/truncated-positive-loops` · construction · planet: **Truncated positive loops**

**Lean name:** `TauCeti.GeometricSatake.truncatedPositiveLoop`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For m≥1, L^{+,<m}G(S)=G(B⁺_D(S)/I^m) is the finite congruence quotient of L⁺G as a v-sheaf. Reduction has smooth vector-group kernels Lie(G)⊗I^j/I^{j+1}, 1≤j<m. These quotients provide finite-dimensional group actions on bounded Hecke loci.

**Hypotheses.**

- Split smooth integral model; degree-d divisor; ℓ≠p.

**Construction.**

1. Use smooth lifting across nilpotent thickenings to identify the quotient, not only its naive pointwise image.
2. Linearize each finite step and apply DSO smoothness.
3. Construct the transition maps of the finite quotients. The later truncation-of-the-loop-action theorem proves the factorization of bounded actions; it is not used to construct these quotients.

**Direct prerequisites.**

- [Congruence filtration of positive loops](#n-gs0-loop-geometry-congruence-filtration-and-graded-pieces) (`GS0:loop-geometry/congruence-filtration-and-graded-pieces`)
- `ReductiveGroupsPartII:RG2.3`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources.**

- [FS](#src-fs), VI.1.10–VI.1.11, pp. 194–195; VI.2.8, p. 201, for the later bounded-action application

**Uses that shape the API.**

- FS VI.2.8: Bounded actions factor through this quotient.
- FS VI.7: Perverse descent uses smooth finite truncations.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.truncatedPositiveLoop_eval` | characterisation | The finite loop quotient evaluates F on the ring A/I^m, rather than the subgroup ker(F(A)→F(A/I^m)). |
| `TauCeti.GeometricSatake.truncatedPositiveLoop_reduction` | functoriality | Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective. |
| `TauCeti.GeometricSatake.truncatedPositiveLoop_transition` | functoriality | For a≤b, reduction modulo I^b maps to reduction modulo I^a. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.truncation_one` | computation | At m=1 the quotient is G(A/I), not the congruence kernel. |
| `TauCeti.GeometricSatake.truncation_trivial_group` | degenerate | Every finite quotient of the trivial group is trivial. |
| `TauCeti.GeometricSatake.truncation_ring_quotient` | compatibility | The ring input is Mathlib Ideal.Quotient, preserving the ideal and its exponent. |

**Acceptance.**

- At m=1 only the reduction group remains.

**Prototype boundary.** Nilpotent lifting, v-local surjectivity and finite-dimensional smoothness are omitted from the core type; no finite dimension is assigned to the entire positive loop group.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`.

#### Open Schubert cell smoothness

<a id="n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness"></a>
`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` · theorem · planet: **Schubert cell smoothness**

**Lean name:** `TauCeti.GeometricSatake.schubertCellDimension`. **Also realises:** `GS0`.

Gr_{G,μ} is ℓ-cohomologically smooth of dimension ⟨2ρ,μ⟩ over the degree-one divisor base. Its stabilizer in L⁺G reduces to P⁻_μ (weights ≤0); the m-th graded piece consists of Lie weights ≤m. The quotient maps to (G/P⁻_μ)^⋄ with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.

**Hypotheses.**

- G split for the computation; μ dominant; ℓ≠p. Integral statement requires the reductive model.

**Proof outline.**

1. Compute L⁺G∩μ(ξ)L⁺Gμ(ξ)⁻¹ in a faithful representation; in GL_n, the upper entry A_ij is divisible by ξ^{k_i−k_j}.
2. Use SW 19.4.2 for the lattice subbundle test, then the root-weight stabilizer and DSO vector-group smoothness.
3. Sum positive weights for dimension; apply splitting descent for μ̄. No perverse or decomposition theorem enters.

**Direct prerequisites.**

- [Congruence filtration of positive loops](#n-gs0-loop-geometry-congruence-filtration-and-graded-pieces) (`GS0:loop-geometry/congruence-filtration-and-graded-pieces`)
- [Truncated positive loop groups](#n-gs0-schubert-smoothness-truncated-positive-loops) (`GS0:Schubert-smoothness/truncated-positive-loops`)
- [Galois descent of bounded modifications](#n-gs0-loop-geometry-generic-galois-descent) (`GS0:loop-geometry/generic-galois-descent`)
- `ReductiveGroupsPartII:RG2.1`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `RelativeFarguesFontaine:RF4:vector-bundles`

**Sources.**

- [FS](#src-fs), VI.2.4–VI.2.5, pp. 198–200; IV.1.18, p. 112

**Acceptance.**

- For GL₂, μ=(a,b), a≥b, the dimension is a−b; μ=0 has dimension zero.

**Prototype boundary.** Only the GL₂ root-pairing core is typed; cell stabilization and cohomological smoothness are not a predicate placeholder.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`; request [R0.13](#req-r0-13) to `RelativeFarguesFontaine:RF4:vector-bundles`.

#### Finite truncation of bounded actions

<a id="n-gs0-schubert-smoothness-truncation-of-the-loop-action"></a>
`GS0:Schubert-smoothness/truncation-of-the-loop-action` · theorem

**Lean name:** `TauCeti.GeometricSatake.boundedLoopActionTrivial`. **Also realises:** `GS0`.

If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. Thus the action factors through L^{+,<m}G. The comparison of equivariant derived categories is the later GS1/prounipotent-equivariance theorem, with its filtered continuity and prime-to-p coefficient hypotheses.

**Hypotheses.**

- Split G; dominant μ; finite Schubert bound.

**Proof outline.**

1. Use normality of the congruence kernel and the stabilizer weight calculation on the open orbit.
2. For ν≤μ the maximum root pairing does not increase; conclude for all lower strata.
3. Check on geometric points and descend the trivial action on the v-sheaf.

**Direct prerequisites.**

- [Open Schubert cell smoothness](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) (`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`)
- [Truncated positive loop groups](#n-gs0-schubert-smoothness-truncated-positive-loops) (`GS0:Schubert-smoothness/truncated-positive-loops`)
- `ReductiveGroupsPartII:RG2.1`

**Sources.**

- [FS](#src-fs), VI.2.8, p. 201

**Acceptance.**

- For GL₂ μ=(a,b), m≥a−b and m>0 suffices.

**Prototype boundary.** K must be the specified deep congruence subgroup on the specified bound; those absent geometric hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`.

#### Minuscule Bialynicki–Birula isomorphism

<a id="n-gs0-schubert-smoothness-minuscule-bialynicki-birula"></a>
`GS0:Schubert-smoothness/minuscule-bialynicki-birula` · comparison

**Lean name:** `TauCeti.GeometricSatake.minusculeBialynickiBirula`. **Also realises:** `GS0`.

If μ has Lie weights in {−1,0,1}, the Bialynicki–Birula map Gr_μ→(G/P⁻_μ)^⋄ is an isomorphism. In GL_n it sends a B⁺_dR-lattice Λ to the ascending filtration Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ). CS uses μ(ξ^{-1}); matching FS uses inversion of the coweight or of the chosen parabolic convention.

**Hypotheses.**

- Generic characteristic-zero untilt; minuscule μ; ℓ≠p for the smoothness consequence.

**Proof outline.**

1. The stabilizer filtration has no additional fibre when μ is minuscule.
2. Alternatively use CS 3.4.4 on field points, 3.4.6 for pointwise detection and KL finite-projectivity to prove injectivity over reduced bases.
3. Surjectivity is supplied by the filtered integrable universal connection and Griffiths transversality; import its period-sheaf realization from P8.

**Direct prerequisites.**

- [Open Schubert cell smoothness](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness) (`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`)
- `ReductiveGroupsPartII:RG2.1`
- `RelativeFarguesFontaine:RF4:vector-bundles`
- `PadicHodgeTheory:P8:local-rational`

**Sources.**

- [CS](#src-cs), 3.4.4–3.4.6, pp. 685–686

**Acceptance.**

- For GL_n μ=(1^r,0^{n−r}) the cell is the Grassmannian of r-planes, with the sign dictionary fixed.

**Prototype boundary.** Cell/Flag must be the minuscule Grassmannian and its flag functor; the geometric minuscule hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.8](#req-r0-8) to `PadicHodgeTheory:P8:local-rational`; request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`; request [R0.13](#req-r0-13) to `RelativeFarguesFontaine:RF4:vector-bundles`.

<a id="layer-gs0-witt-geometry"></a>

### GS0:Witt-geometry — Projectivity and the special-fibre comparison

The lattice and type interface is the entry point. It supports Zhu's finite
determinant-jet presentation, his original perfect algebraic-space quotient,
the Demazure filtration and its connected cohomologically trivial fibres.
Projectivity follows the geometric determinant route of Bhatt–Scholze §§6–8:
descend the product of the graded determinant lines along the resolution by
the fibral line-bundle criterion, prove the Witt-specific positivity on fixed
finite models, and apply Keel's criterion. SF.5 owns the general positivity
theory, exceptional loci, Keel's lemmas, Frobenius extension and Stein
contraction; this layer owns their application. Before Keel is applied to the
lower-bound union, that union must be constructed as a perfectly finitely
presented proper space by closed intersections and finite pinching; this is
requested from SF.1 and recorded as gap [G0.1](#gap-g0-1), so representability of
the union is never taken from the projectivity theorem being proved. Integral
reductive and parahoric properness use projectivity, with their own
coefficient and group-model hypotheses. Canonical weakly normal models, the
rank-two cone chart (where the corrected factor order is A⁻¹X and its matrix
value can depend on the Witt lift), normalized SL_n determinants and the growth
of sections are separate targets. The flag work adds finite admissible unions,
relative-position correspondences and their fibre estimates. The
Mirković–Vilonen intersection node keeps its identifier beginning
`GS0:Witt-geometry` but belongs to GS1.

#### Witt lattice functor

<a id="n-gs0-witt-geometry-witt-lattice-functor-and-representability"></a>
`GS0:Witt-geometry/witt-lattice-functor-and-representability` · construction · planet: **Witt vector affine Grassmannian**

**Lean name:** `TauCeti.GeometricSatake.WittLattice`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For a perfect F_p-algebra R let Λ be a finite projective W(R)-submodule of W(R)[1/p]^n with Λ[1/p]=W(R)[1/p]^n. Gr^W_GL_n is the v-sheaf of such lattices; a positive bounded piece Gr_{≤λ} has Λ⊂W(R)^n and quotient of type ≤λ. Negative bounds are obtained by translating by p^a. For O_E coefficients use RF0’s ramified Witt ring; for a general smooth model 𝓖 use 𝓖-torsors with a punctured trivialization.

**Hypotheses.**

- The two pole bounds on a lattice are locally uniform; coefficients perfect; quotient type has fixed total length.

**Construction.**

1. Use finite projectivity and bounded denominators to define the functor.
2. Apply SF’s Witt vector-bundle v-descent to both finite levels and the formal limit.
3. Use the quotient/torsor comparison of BS 9.5 and Zhu 1.3; this construction does not assume projectivity.

**Direct prerequisites.**

- `mathlib:WittVector`
- `mathlib:PerfectRing`
- `mathlib:Module.Projective`
- `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`
- `SchemeAndStackFoundations:SF.4`
- `ReductiveGroupsPartII:RG2.3`
- `mathlib:Module.Finite`

**Sources.**

- [BS](#src-bs), 8.1 and 9.4–9.5, pp. 32, 36–37

**Uses that shape the API.**

- BS 7–8: Positive quotient-type bounds and their resolution use these embedded lattices.
- Zhu 1.2: The lattice functor is the GL_n affine Grassmannian.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.WittLattice_module` | projection | A lattice is a finite projective B-submodule of K^n whose K-span is the whole module. |
| `TauCeti.GeometricSatake.WittLattice_standard` | constructor | The image of B^n in K^n gives the standard lattice when B→K is injective. |
| `TauCeti.GeometricSatake.WittLattice_ext` | extensionality | Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.lattice_rank_zero` | degenerate | There is only one rank-zero lattice. |
| `TauCeti.GeometricSatake.lattice_standard_field` | compatibility | Over B=K the standard lattice agrees with the top Submodule of K^n. |
| `TauCeti.GeometricSatake.lattice_span` | non-example | A purported rank-one lattice with zero embedded submodule is excluded over a nonzero field. |

**Acceptance.**

- For n=1 lattices are p^aW(R) locally on components; Λ=W(R)^n is the unit.

**Prototype boundary.** The generic imported coefficient algebra B→K is the ramified Witt ring and its localization in the intended application. The finite/projective/span conditions are concrete. A separate structure below records them; representing schemes are not defined by this point core.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.17](#req-r0-17) to `SchemeAndStackFoundations:SF.4`.

#### Witt torsion module types

<a id="n-gs0-witt-geometry-witt-types-and-bounds"></a>
`GS0:Witt-geometry/witt-types-and-bounds` · construction · planet: **Witt module types**

**Lean name:** `TauCeti.GeometricSatake.wittTypeBound`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

A finite p-power-torsion isogeny cokernel Q over W(R) has geometric type λ=(λ₁≥⋯≥λ_n≥0), meaning Q_x≅⊕W(k_x)/p^{λ_j}. Its row lengths are n_λ(i)=#{j:λ_j>i}. Dominance means equal total length and all partial sums bounded. Type ≤λ is a closed locus; on a constant-type locus the modules p^iQ/p^{i+1}Q are finite projective of ranks n_λ(i). An isogeny is a map of finite projective W-modules invertible after p-inversion.

**Hypotheses.**

- R perfect; a uniform p-power kills Q; the isogeny-cokernel criterion is projective dimension at most one, including Q=0.

**Construction.**

1. Import projective module algebra, Fitting-ideal tests and reducedness of perfect rings from SF.
2. Apply BS 7.3, 7.5 and 7.7–7.9 to ranks of powers of p and the dominance inequalities.
3. Use the repaired finite-rank argument in PAPER-BHATT-SCHOLZE-17/E37 (Lemma 7.7, p.29): establish the same finite rank at every prime before deducing finite generation of the projective kernel. Density of characteristic-zero points alone does not suffice.

**Direct prerequisites.**

- [Witt lattice functor](#n-gs0-witt-geometry-witt-lattice-functor-and-representability) (`GS0:Witt-geometry/witt-lattice-functor-and-representability`)
- `SchemeAndStackFoundations:SF.0`
- `mathlib:Module.Projective`

**Sources.**

- [BS](#src-bs), 7.1–7.9, pp. 27–32

**Uses that shape the API.**

- BS 7.2–7.13: Column ranks control the Demazure filtration.
- BS 8.3: Dominance induction controls the closed boundary.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.wittTypeBound_dominance` | compatibility | The quotient-type relation is GL_n dominance after embedding nonnegative parts in the integer coweight lattice. |
| `TauCeti.GeometricSatake.wittTypeBound_columns` | data | The i-th graded quotient has rank equal to the number of parts λ_j exceeding i. |
| `TauCeti.GeometricSatake.wittTypeBound_closed_under_dominance` | relation | A lower quotient type remains in any larger bound. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.witt_type_zero` | degenerate | The zero bound admits only zero nonnegative quotient parts. |
| `TauCeti.GeometricSatake.witt_type_210` | computation | For λ=(2,1,0), the successive column ranks are two and one. |
| `TauCeti.GeometricSatake.witt_type_not_component_order` | non-example | The quotient type (1,0,0) is not below (2,1,0), since its length is one rather than three. |

**Acceptance.**

- For Q=W(k)/p²⊕W(k)/p the type is (2,1), rows (2,1); a different total length is never a dominance comparison.

**Prototype boundary.** The type relation and column counts are concrete; elementary divisors for a finitely presented isogeny cokernel over a perfect family are an RG/SF refinement.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`.

#### Zhu finite-jet presentation

<a id="n-gs0-witt-geometry-zhu-finite-jet-presentation"></a>
`GS0:Witt-geometry/zhu-finite-jet-presentation` · construction

**Lean name:** `TauCeti.GeometricSatake.jetDeterminantLocus`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For λ=(N,0,…,0), V_N parametrizes W-matrices with determinant p^N times a unit. For h>N, V_{N,h} is the perfection of the truncated determinant locus det₀=⋯=det_{N−1}=0, det_N invertible. Gr̄_{N,h} adds a W_h-trivialization of the lattice and is an L^hGL_n-torsor over Gr̄_N. The stabilizer J={(A,γ):Aγ=A} gives Gr̄_{N,h}≅J after a chosen normalized lift.

**Hypotheses.**

- The isomorphism uses a choice of lifting; h>N, not h=N. Nonperfect Greenberg test rings use the ring scheme of O_E/ϖ^h, not a naive tensor formula.

**Construction.**

1. Import Greenberg realization and perfect finite models from SF.
2. Zhu 1.9 produces the matrix cover; choose lifts as in 1.10–1.11.
3. Identify the stabilizer and verify the corrected compositions βε=A and γ=ε_A⁻¹α⁻¹ε. This is the original algebraic-space route.

**Direct prerequisites.**

- [Witt lattice functor](#n-gs0-witt-geometry-witt-lattice-functor-and-representability) (`GS0:Witt-geometry/witt-lattice-functor-and-representability`)
- `SchemeAndStackFoundations:SF.0`
- `ReductiveGroupsPartII:RG2.3`

**Sources.**

- [Zhu](#src-zhu), 1.9–1.11, pp. 418–421

**Uses that shape the API.**

- Zhu 1.9–1.12: Finite-jet torsor quotients represent lattice bounds.
- Zhu B.4/B.11: The determinant equations define canonical models and the cone chart.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.jetDeterminantLocus_mem` | characterisation | The matrix jet lies on the determinant locus when det(A)=uπ^N for a unit u; the finite truncation and bound h>N are retained in the application. |
| `TauCeti.GeometricSatake.jetDeterminantLocus_right_invariance` | relation | Right multiplication by an invertible matrix preserves the determinant locus. |
| `TauCeti.GeometricSatake.jetDeterminantLocus_ring_map` | functoriality | A ring map takes the determinant locus to the corresponding locus with the image uniformizer. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.jet_level_zero` | degenerate | For N=0 the determinant is a unit. |
| `TauCeti.GeometricSatake.jet_identity` | computation | The identity matrix is in the N=0 locus. |
| `TauCeti.GeometricSatake.jet_zero_excluded` | non-example | A zero rank-one matrix is excluded at N=0 over a nonzero field. |

**Acceptance.**

- For N=0 the trivial lattice with a jet trivialization is L^hGL_n; the determinant-zero equations disappear.

**Prototype boundary.** The determinant equation is the matrix core. Finite Greenberg representability, the lift-kernel quotient and its perfect torsor are imported, not represented by an arbitrary smoothness predicate.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`.

#### Witt Demazure filtration space

<a id="n-gs0-witt-geometry-witt-demazure-resolution"></a>
`GS0:Witt-geometry/witt-demazure-resolution` · construction · planet: **Witt Demazure resolution**

**Lean name:** `TauCeti.GeometricSatake.wittFiltration`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For Q of type ≤λ, Dem_λ(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_λ(i). The global resolution Gr̃_λ classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤λ}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.

**Hypotheses.**

- λ sorted nonnegative; total length fixed; all quotient maps respect the Witt action; zero λ gives the vanishing locus.

**Construction.**

1. Use SF’s perfected Quot/Grassmann bundles to choose a locally free quotient Q/pQ→G of rank n_λ(0), and recurse on ker(Q→G) with λ shifted by one column. Q/pQ itself can have larger rank on lower-type fibres; it is not the chosen quotient G.
2. BS 7.13 gives image, uniqueness and properness. Zhu 1.13–1.18 gives the lattice-chain presentation, including reversed dual bounds for reversed chains.
3. BS 8.6 produces a smooth projective finite-type model for the global tower.

**Direct prerequisites.**

- [Witt torsion module types](#n-gs0-witt-geometry-witt-types-and-bounds) (`GS0:Witt-geometry/witt-types-and-bounds`)
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `CrystallineCohomology:CR.1`

**Sources.**

- [BS](#src-bs), 7.10–7.13 and 8.4–8.6, pp. 29–34

**Uses that shape the API.**

- BS 7.13–7.14: Filtration fibres supply connectedness and structure-sheaf cohomology.
- BS 8.8: The determinant is the product of graded quotient determinants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.wittFiltration_eval` | characterisation | The typed filtration consists of a decreasing chain of submodules starting at M and ending at zero. |
| `TauCeti.GeometricSatake.wittFiltration_piece` | projection | Evaluation gives the i-th submodule in the chain. |
| `TauCeti.GeometricSatake.wittFiltration_ext` | extensionality | Two filtration points are equal if all their submodules agree. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.filtration_length_zero` | degenerate | A length-zero filtration forces the module to be zero. |
| `TauCeti.GeometricSatake.filtration_one_step` | computation | A length-one filtration has first piece top and all later pieces zero. |
| `TauCeti.GeometricSatake.filtration_direction` | non-example | The filtration decreases; increasing kernels of p must first be reverse-indexed. |

**Acceptance.**

- λ=0 gives the unit; λ=(1^r) is the perfected ordinary Grassmannian. For λ=(2,1,0) and Q=k³ killed by p, choose a rank-two quotient of Q/pQ=k³; its kernel line varies in P², giving the boundary fibre. Replacing the chosen quotient by all of Q/pQ would lose this fibre.

**Prototype boundary.** The submodule-chain core omits prescribed locally free quotient ranks, annihilation by p, perfect-scheme representability and its lattice map. These conditions are written in the packet, not replaced by unknown proposition fields.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.1](#req-r0-1) to `CrystallineCohomology:CR.1`; request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`.

#### Original perfect algebraic-space construction

<a id="n-gs0-witt-geometry-zhu-original-algebraic-space"></a>
`GS0:Witt-geometry/zhu-original-algebraic-space` · theorem

**Lean name:** `TauCeti.GeometricSatake.zhuBoundPresentation`. **Also realises:** `GS0`.

Each Gr̄_N and hence each bounded GL_n Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive G a faithful representation with quasi-affine quotient gives a locally closed embedding into the GL_n Grassmannian; an affine quotient gives a closed embedding.

**Hypotheses.**

- Zhu published edition; perfect fields/rings; integral model assumptions pinned.

**Proof outline.**

1. Use the affine jet presentation and effective quotient theorem A.29.
2. Import the published flatness proof A.30–A.31 from SF; the torsor fibre-product identity alone does not prove flatness.
3. Demazure properness supplies properness of the bounded spaces. No BS determinant/projectivity theorem is used in this original construction.

**Direct prerequisites.**

- [Zhu finite-jet presentation](#n-gs0-witt-geometry-zhu-finite-jet-presentation) (`GS0:Witt-geometry/zhu-finite-jet-presentation`)
- [Witt Demazure filtration space](#n-gs0-witt-geometry-witt-demazure-resolution) (`GS0:Witt-geometry/witt-demazure-resolution`)
- `SchemeAndStackFoundations:SF.1`
- `ReductiveGroupsPartII:RG2.3`

**Sources.**

- [Zhu](#src-zhu), 1.12, 1.19–1.20; A.29–A.31, pp. 421, 425–426, 476–477

**Acceptance.**

- The target is a perfect algebraic space before the separate projectivity proof.

**Prototype boundary.** Presentation must be Zhu's smooth determinant-jet cover. The quotient algebraic-space carrier is not available and is omitted; this signature asserts only the cover's affineness.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`.

#### Fibres of the Witt resolution

<a id="n-gs0-witt-geometry-connected-cohomological-fibres"></a>
`GS0:Witt-geometry/connected-cohomological-fibres` · theorem

**Lean name:** `TauCeti.GeometricSatake.wittResolutionConnectedFibres`. **Also realises:** `GS0`.

The fibres of Gr̃_λ→Gr_{≤λ} are geometrically connected and have RΓ(O)=k at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full ω₁-chain resolution of Gr̄_N every lower-type fibre has positive dimension.

**Hypotheses.**

- Nonempty geometric fibres; Q an isogeny cokernel.

**Proof outline.**

1. Apply BS 7.14 to filtered Grassmann incidence parameters; reverse the increasing kernels of multiplication by p to match its decreasing-filtration convention.
2. Induct on the filtration length for cohomology and connectedness.
3. For the full ω₁ resolution, use Λ_λ+p^iΛ₀, not the erroneous intersections in Zhu 1.18; projection to a nontrivial projective space detects positive dimension.

**Direct prerequisites.**

- [Witt Demazure filtration space](#n-gs0-witt-geometry-witt-demazure-resolution) (`GS0:Witt-geometry/witt-demazure-resolution`)
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.3`

**Sources.**

- [BS](#src-bs), 7.13–7.14, pp. 30–32
- [Zhu](#src-zhu), Lemma 1.18, pp. 424–425. The full ω₁-chain resolution is an isomorphism over the exact-type orbit, and every lower-type fibre has positive dimension.

**Acceptance.**

- For λ=(2,1,0), fibre above (1,1,1) is P²; exact-type fibres are points.

**Prototype boundary.** X/Y/f must be the Witt resolution and bound; perfect structure-sheaf cohomology is omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.16](#req-r0-16) to `SchemeAndStackFoundations:SF.3`.

#### Descent on Witt resolution fibres

<a id="n-gs0-witt-geometry-h-descent-and-fibral-criterion"></a>
`GS0:Witt-geometry/h-descent-and-fibral-criterion` · application

**Lean name:** `TauCeti.GeometricSatake.wittFibralDescent`. **Also realises:** `GS0`.

Apply the supplier’s v-descent for finite/formal Witt bundles and its proper pfp connected-fibre criterion to Gr̃_λ→Gr_{≤λ}. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger Rψ_*O=O criterion applies to the same resolution and commutes with base change.

**Hypotheses.**

- Proper surjective pfp perfect morphism; geometric connectedness alone is the weaker sufficient criterion, not an equivalence with Rψ_*O=O.

**Proof outline.**

1. Import BS 4.1 and 6.1, 6.8, 6.13 from SF rather than reproduce their general theory.
2. Verify the proper pfp hypotheses and fibre computation from the resolution node.
3. Use the fibre criterion and full faithfulness for effective descent and uniqueness.

**Direct prerequisites.**

- [Fibres of the Witt resolution](#n-gs0-witt-geometry-connected-cohomological-fibres) (`GS0:Witt-geometry/connected-cohomological-fibres`)
- `SchemeAndStackFoundations:SF.4`
- `SchemeAndStackFoundations:SF.3`

**Sources.**

- [BS](#src-bs), 6.1, 6.8, 6.13 and 8.5, pp. 21–26, 33

**Acceptance.**

- Apply to λ=0, where descent is the identity; keep pfp in the statement.

**Prototype boundary.** Only the line-bundle full-faithfulness core is typed; effective fibre-trivial descent and proper pfp hypotheses belong to SF.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.16](#req-r0-16) to `SchemeAndStackFoundations:SF.3`; request [R0.17](#req-r0-17) to `SchemeAndStackFoundations:SF.4`.

#### Geometric determinant line

<a id="n-gs0-witt-geometry-geometric-determinant-line"></a>
`GS0:Witt-geometry/geometric-determinant-line` · construction · planet: **Determinant line**

**Lean name:** `TauCeti.GeometricSatake.geometricDeterminantLine`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

There is a unique line bundle L on Gr_{≤λ} whose pullback to Gr̃_λ is ⊗_i det_R(Q_i/Q_{i+1}); these lines agree under lower bounds and hence form the determinant line on Gr_GL_n. Construct it geometrically using complete-flag refinements and fibre triviality, without the K-theoretic determinant.

**Hypotheses.**

- Positive quotient convention W(R)^n/Λ; determinant of a sublattice would reverse the line.

**Construction.**

1. Refine filtrations to full flag towers as in BS 6.11 and 8.8.
2. On each geometric fibre the product of graded determinants identifies with the fixed determinant of the associated R-gradeds of Q.
3. Apply the fibral descent node and its full faithfulness to descend and reconcile lower-bound restrictions.

**Direct prerequisites.**

- [Descent on Witt resolution fibres](#n-gs0-witt-geometry-h-descent-and-fibral-criterion) (`GS0:Witt-geometry/h-descent-and-fibral-criterion`)
- [Witt Demazure filtration space](#n-gs0-witt-geometry-witt-demazure-resolution) (`GS0:Witt-geometry/witt-demazure-resolution`)
- `SchemeAndStackFoundations:SF.3`
- `KTheoryLowDegrees:Z.3`

**Sources.**

- [BS](#src-bs), 6.11 and 8.8, pp. 25, 33–34

**Uses that shape the API.**

- BS 8.9–8.11: Positive degrees and boundary sections prove projectivity.
- BS 10.1: The normalized SL_n line is built from these determinants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.geometricDeterminantLine_pullback` | compatibility | On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention. |
| `TauCeti.GeometricSatake.geometricDeterminantLine_unique` | characterisation | Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves. |
| `TauCeti.GeometricSatake.geometricDeterminantLine_lower_bound` | functoriality | Restriction to a lower bound agrees with that bound’s determinant line. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.determinant_zero` | degenerate | The zero bound has the trivial invertible sheaf. |
| `TauCeti.GeometricSatake.determinant_existing_carrier` | compatibility | The descended geometric line uses Tau Ceti InvertibleSheaf, rather than a rank-one module at a point. |
| `TauCeti.GeometricSatake.determinant_quotient_sign` | computation | On a one-step quotient Grassmannian, the descended line pulls back to the graded quotient determinant; its sign is the quotient sign. |

**Acceptance.**

- For λ=(1,0,…), the line is O(1) on the projective Grassmannian; λ=0 gives the trivial line.

**Prototype boundary.** Only the existing invertible-sheaf carrier is typed. X must be the specified bounded Witt scheme, pull the specified resolution/restriction, and gradedDet its graded determinant. Those missing geometric conditions are omitted in these signatures and are not arbitrary new predicates.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.7](#req-r0-7) to `KTheoryLowDegrees:Z.3`; request [R0.16](#req-r0-16) to `SchemeAndStackFoundations:SF.3`.

#### Positivity of the determinant line

<a id="n-gs0-witt-geometry-determinant-positivity"></a>
`GS0:Witt-geometry/determinant-positivity` · theorem

**Lean name:** `TauCeti.GeometricSatake.determinantCurveDegree`. **Also realises:** `GS0`.

On Gr̃_λ, ⊗det(Q_i/Q_{i+1})^{a_i} is ample for a₀≫a₁≫⋯>0. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in Gr_{≤λ}; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.

**Hypotheses.**

- Finite-type models fixed up to Frobenius; a_i integers with successive domination; effective divisors interpreted on these models.

**Proof outline.**

1. Use BS 8.9 and Grassmann-bundle induction for weighted ampleness and explicit nonvanishing sections.
2. If the sum of nonnegative determinant degrees on a lifted curve were zero, all weighted degrees would be zero, contradicting ampleness (8.10).
3. Use an effective decomposition with ample weighted part to place the exceptional locus in the boundary (8.11); invoke only the supplier’s positivity notions.

**Direct prerequisites.**

- [Geometric determinant line](#n-gs0-witt-geometry-geometric-determinant-line) (`GS0:Witt-geometry/geometric-determinant-line`)
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- [BS](#src-bs), 8.9–8.11, pp. 34–35

**Acceptance.**

- For a one-step projective Grassmannian the line has degree one on a Schubert line.

**Prototype boundary.** degree must be the determinant degree on a nonconstant proper curve in the specified bound. The missing curve/intersection API and hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.18](#req-r0-18) to `SchemeAndStackFoundations:SF.5`.

#### Projectivity of the Witt Grassmannian

<a id="n-gs0-witt-geometry-ampleness-via-keel"></a>
`GS0:Witt-geometry/ampleness-via-keel` · theorem · planet: **Witt projectivity theorem**

**Lean name:** `TauCeti.GeometricSatake.wittProjectiveBound`. **Also realises:** `GS0`.

For every dominant positive λ, Gr_{≤λ} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.

**Hypotheses.**

- Use BS’s geometric determinant construction. Keel’s criterion, exceptional locus and Frobenius extension/descent are imported from SF.5; pfp/model theory from SF.0.

**Proof outline.**

1. Induct on dominance. Realize the lower boundary as an iterated finite pushout of lower bounds along closed intersections, importing the missing representability argument from SF.1 (PAPER-BHATT-SCHOLZE-17/E39; BS proof of Theorem 8.3, pp.35–36).
2. The determinant is ample on boundary pieces; Keel’s union lemma and strict curve positivity make it ample on the boundary. Keel’s restriction criterion then makes ψ*L semiample because its exceptional locus lies there.
3. Take its Stein contraction on a finite model. Strict curve positivity and fibre triviality identify its equivalence relation with the Demazure quotient; hence the contraction is Gr_{≤λ}. Its descended line is ample.

**Direct prerequisites.**

- [Positivity of the determinant line](#n-gs0-witt-geometry-determinant-positivity) (`GS0:Witt-geometry/determinant-positivity`)
- [Descent on Witt resolution fibres](#n-gs0-witt-geometry-h-descent-and-fibral-criterion) (`GS0:Witt-geometry/h-descent-and-fibral-criterion`)
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- [BS](#src-bs), §8.4, Theorem 8.3 (statement p. 32; proof pp. 35–36), Lemmas 8.9–8.11 (pp. 34–35)

**Acceptance.**

- No Zhu representability input in this independent route; λ=(1) recovers projective space.

**Prototype boundary.** Only scheme properness is typed; X/f must be the finite model of the bound over the base field. Projectivity/ample line notions are imported from SF5 and omitted.

**Open obligations:** gap [G0.1](#gap-g0-1) (Boundary representability before Keel); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`; request [R0.18](#req-r0-18) to `SchemeAndStackFoundations:SF.5`.

#### Perfect models and étale realization

<a id="n-gs0-witt-geometry-perfect-model-and-etale-comparison"></a>
`GS0:Witt-geometry/perfect-model-and-etale-comparison` · comparison

**Lean name:** `TauCeti.GeometricSatake.wittEtaleComparison`. **Also realises:** `GS0`.

For the bounded Witt schemes/algebraic spaces, import compatible finite-type models up to Frobenius, dimension and fibre-product compatibility and étale-topos equivalence from SF0/SF1. Apply those general results to identify their scheme diamondification with the characteristic-p fibre of the integral Grassmannian, by equality of the lattice/torsor functors. This node owns the Witt comparison application; SF owns the general model and perfection theory.

**Hypotheses.**

- Coordinate perfection is a direct Frobenius colimit; Mathlib Perfection is an inverse-limit carrier and is not cited for this construction. Trace/cycle normalizations require a fixed model.

**Proof outline.**

1. Import Zhu A.3, A.15–A.17 and BS 3 from SF.0–SF.1.
2. Import the characteristic-p scheme-diamond comparison from L1.
3. Evaluate the torsor/lattice functor on perfectoid R; B⁺ at a characteristic-p untilt is W_{O_E}(R), so both sheaves have the same functor of points.

**Direct prerequisites.**

- [Witt lattice functor](#n-gs0-witt-geometry-witt-lattice-functor-and-representability) (`GS0:Witt-geometry/witt-lattice-functor-and-representability`)
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-diamondification`

**Sources.**

- [SW](#src-sw), 20.3.1–20.3.4, p. 185

**Acceptance.**

- A¹_perf has dimension one but is not finite type as an ordinary scheme.

**Prototype boundary.** These categories must be the specified étale categories of a perfect Witt bound and its scheme diamond; supplier geometry is omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`.

#### Integral bounded Grassmannian families

<a id="n-gs0-witt-geometry-integral-family-bounded-properness"></a>
`GS0:Witt-geometry/integral-family-bounded-properness` · comparison

**Lean name:** `TauCeti.GeometricSatake.integralWittGenericComparison`. **Also realises:** `GS0`.

The integral BD Grassmannian over Spd O_E (or Div^d_𝒴) interpolates between the generic B⁺_dR Grassmannian and the v-sheaf of the Witt Grassmannian. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.

**Hypotheses.**

- Fixed integral reductive model; unramified cocharacter reflex extensions in SW 20.3–20.5; no ramified reductive O_E-model asserted.

**Proof outline.**

1. Use SW 20.3.2 for the torsor/étale quotient description and the explicit characteristic-p comparison.
2. BS projectivity provides the special-fibre compact bounds; generic bounded properness and SW 20.3.6, 20.5.4 give proper relative diamonds.
3. For multiple legs build the bounded convolution tower and use its surjective multiplication map to establish quasicompactness and closedness.

**Direct prerequisites.**

- [Projectivity of the Witt Grassmannian](#n-gs0-witt-geometry-ampleness-via-keel) (`GS0:Witt-geometry/ampleness-via-keel`)
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)
- [Ordered legs and divisor base change](#n-gs0-loop-geometry-ordered-leg-base-change) (`GS0:loop-geometry/ordered-leg-base-change`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`

**Sources.**

- [SW](#src-sw), 20.3.6 and 20.5.4, pp. 186, 190

**Acceptance.**

- At equal legs the bound is the sum, not their maximum.

**Prototype boundary.** Only the two functor-of-points fibre identifications are typed; the diamond base change and proper bounds are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Witt affine flags and components

<a id="n-gs0-witt-geometry-parahoric-ind-projectivity"></a>
`GS0:Witt-geometry/parahoric-ind-projectivity` · theorem · planet: **Parahoric Witt Grassmannians**

**Lean name:** `TauCeti.GeometricSatake.parahoricGeometricComponents`. **Also realises:** `GS0`.

For a smooth affine O_E-model 𝓖 of a reductive generic fibre, the Witt affine Grassmannian is an ind-pfp perfect space with locally closed embedding into a GL_n Grassmannian and ind-quasiprojective bounds. If 𝓖 is parahoric its bounds are projective. Over k̄ its components are π₁(G)_I via Kottwitz, with residual Frobenius action retained. For an Iwahori, Schubert cells have dimension ℓ(w), closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected P¹-bundles.

**Hypotheses.**

- Parahoric/Iwahori notions supplied by RG2.3; inertia I, not the full absolute Galois group, labels geometric components.

**Proof outline.**

1. Use the faithful representation with quasi-affine quotient and Zhu 1.20.
2. Zhu 1.4 and SW 21.1.1 use Iwahori Demazure towers; properness descends to other parahorics.
3. Use Zhu 1.21 and the corrected BS 9.7/SW 21.1.4 component identification.

**Direct prerequisites.**

- [Original perfect algebraic-space construction](#n-gs0-witt-geometry-zhu-original-algebraic-space) (`GS0:Witt-geometry/zhu-original-algebraic-space`)
- [Projectivity of the Witt Grassmannian](#n-gs0-witt-geometry-ampleness-via-keel) (`GS0:Witt-geometry/ampleness-via-keel`)
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`

**Sources.**

- [SW](#src-sw), 21.1.1–21.1.4, pp. 191–192

**Acceptance.**

- For a torus the geometric flag space is the discrete inertia-coinvariant coweight scheme with Frobenius action.

**Prototype boundary.** Only the Kottwitz label equivalence is typed, with geometric inertia coinvariants rather than full Galois coinvariants. Model representability and properness are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`.

#### Integral parahoric ind-properness

<a id="n-gs0-witt-geometry-integral-parahoric-properness"></a>
`GS0:Witt-geometry/integral-parahoric-properness` · theorem

**Lean name:** `TauCeti.GeometricSatake.integralParahoricProperBounds`. **Also realises:** `GS0`.

If 𝓖° is parahoric, Gr_{𝓖,Spd O_E} is an increasing union of closed proper subfunctors. A closed representation 𝓖→GL_n induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing 𝓖 by 𝓖°, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.

**Hypotheses.**

- Quasiparahoric models and component maps as in SW 21.2–21.5; minuscule hypothesis only for the closure comparisons.

**Proof outline.**

1. Import Anschütz’s extension/triviality of torsors on punctured A_inf from RF4:G-torsors.
2. Use SW 21.2.3 to extend each geometric lattice and take products of uniformly bounded trivializations to obtain quasicompactness.
3. Apply the geometric-point and component tests in 21.4.3 and 21.5.1; do not claim the local-model conjecture from this argument.

**Direct prerequisites.**

- [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity) (`GS0:Witt-geometry/parahoric-ind-projectivity`)
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`

**Sources.**

- [SW](#src-sw), 21.2.1–21.2.3, 21.4.3, 21.5.1, pp. 192–197

**Acceptance.**

- For a torus the integral flag is the diamondification of the integral coweight scheme; special labels are inertia coinvariants.

**Prototype boundary.** Only topological properness is typed; spaces/map must be a closed parahoric bound over the integral base. Spatial-diamond representability is omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`; request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`; request [R0.12](#req-r0-12) to `RelativeFarguesFontaine:RF4:G-torsors`.

#### Canonical determinant models

<a id="n-gs0-witt-geometry-canonical-witt-models"></a>
`GS0:Witt-geometry/canonical-witt-models` · construction

**Lean name:** `TauCeti.GeometricSatake.canonicalWittModel`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.

**Hypotheses.**

- Fix model and Frobenius levels; do not infer normal Cohen–Macaulayness of every canonical Schubert model (Conjecture III). Dieudonné/crystal and p-divisible-group theory is imported.

**Construction.**

1. Use Zhu B.4’s codimension and Serre-criterion argument for the matrix complete intersection, with the SF model API.
2. Descend the normalized jet quotient using SF effective quotients; use twisted transitions as in B.6.
3. Import B.7–B.9’s Dieudonné realization from the p-divisible-group owner and check the pullback of the Hodge determinant; the sketch-only comparison remains an explicit gap.

**Direct prerequisites.**

- [Zhu finite-jet presentation](#n-gs0-witt-geometry-zhu-finite-jet-presentation) (`GS0:Witt-geometry/zhu-finite-jet-presentation`)
- [Witt Demazure filtration space](#n-gs0-witt-geometry-witt-demazure-resolution) (`GS0:Witt-geometry/witt-demazure-resolution`)
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`
- `CrystallineCohomology:CR.1`
- `CrystallineCohomology:CR.7`

**Sources.**

- [Zhu](#src-zhu), B.4–B.9, pp. 484–486

**Uses that shape the API.**

- Zhu Appendix B: Canonical models fix trace and Hodge determinant normalizations.
- GS1 rational weight concentration: Cycle traces depend on a chosen model rather than perfection alone.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.canonicalWittModel_transition` | functoriality | A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist. |
| `TauCeti.GeometricSatake.canonicalWittModel_normalized_quotient` | compatibility | The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection. |
| `TauCeti.GeometricSatake.canonicalWittModel_perfection` | compatibility | Its scheme perfection is the specified Witt Schubert bound. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.canonical_model_zero` | degenerate | The N=0 canonical bound is Spec k, over the specified perfect coefficient field. |
| `TauCeti.GeometricSatake.canonical_model_rank_one` | computation | For GL₁ and N<h, the canonical bound is Spec k: the prescribed lattice p^N W(k) is unique. |
| `TauCeti.GeometricSatake.canonical_model_not_choice` | non-example | In the dual-number F₂ algebra, the nonzero nilpotent squares to zero. Its perfection forgets the nilpotent, so sharing a perfection cannot specify a canonical finite model. |

**Acceptance.**

- For N=0 the canonical model is a point; a canonical model is not an arbitrary deperfection.

**Prototype boundary.** The coefficient input is explicitly a perfect field of characteristic p. Finite-type, normalization, model perfection and Frobenius-twisted transition conditions are supplied by SF0/SF1. The canonical model and its maps use Mathlib Scheme. The sketch-only Dieudonné comparison is a recorded gap; Conjecture III is not a theorem.

**Open obligations:** gap [G0.3](#gap-g0-3) (Sketch-only canonical determinant and crystal comparison); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.1](#req-r0-1) to `CrystallineCohomology:CR.1`; request [R0.2](#req-r0-2) to `CrystallineCohomology:CR.7`; request [R0.5](#req-r0-5) to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; request [R0.6](#req-r0-6) to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`; request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`; request [R0.17](#req-r0-17) to `SchemeAndStackFoundations:SF.4`.

#### Rank-two quadratic cone model

<a id="n-gs0-witt-geometry-rank-two-cone-chart"></a>
`GS0:Witt-geometry/rank-two-cone-chart` · comparison

**Lean name:** `TauCeti.GeometricSatake.rankTwoConeClosedOrbit`. **Also realises:** `GS0`.

For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [λ]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.

**Hypotheses.**

- p>2; finite Witt truncation h=3; correct order g̃=Ã⁻¹X̃ and determinant det X=p²[λ]⁻¹.

**Proof outline.**

1. Use the projective-bundle extension E/p and its splitting to identify the resolution model.
2. Use the determinant equations B.3.1 to solve uniquely for x,y,z on the locus det(X₁) invertible, then saturate by the right GL₂(W₃)-action.
3. Repair the displayed inverse order in B.11. The rank-two adjugate argument below proves integrality of the chosen right factor Ã⁻¹X̃ and its unit determinant. The remaining refinement is the typed truncated-Witt and jet-torsor interface; the jet torsor then identifies the open chart.
4. Choose a Witt lift X̃ as in Remark 1.11 and let Ã be the displayed Teichmüller matrix, so det(Ã)=p². For the corrected factor g̃=Ã⁻¹X̃, use X̃* Ã≡0 mod p² and adj(X̃* Ã)=Ã* X̃ in rank two. Thus p⁻² Ã* X̃ is integral. The determinant has the form det(X̃)=p²u with u∈W(R)× reducing to λ⁻¹; hence det(g̃)=u is a unit. Reducing this chosen factor modulo p³ gives X=Ag. The factor g can depend on the chosen lift and the stabilizer of A; B.11 asserts uniqueness of the cone representative A, not uniqueness or lift-independence of g. The remaining task is to express existence and the induced jet-torsor/quotient compatibility in the supplier’s truncated-Witt interface.

**Direct prerequisites.**

- [Canonical determinant models](#n-gs0-witt-geometry-canonical-witt-models) (`GS0:Witt-geometry/canonical-witt-models`)
- [Zhu finite-jet presentation](#n-gs0-witt-geometry-zhu-finite-jet-presentation) (`GS0:Witt-geometry/zhu-finite-jet-presentation`)
- `SchemeAndStackFoundations:SF.0`

**Sources.**

- [Zhu](#src-zhu), B.10–B.11, pp. 486–488

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.rank_two_right_factor_not_unique` | non-example | Over Z/27Z, corresponding to W₃(F₃), A=3·Id and g=Id+9E₁₂ satisfy Ag=A, det(g)=1 and g≠Id. Thus the right factor in X=Ag need not be unique; the chart representative A is the unique datum asserted by Zhu B.11. |

**Acceptance.**

- At x=y=z=0, A=p·Id has determinant p² and maps to the unique closed orbit.

**Prototype boundary.** Only the closed-orbit equation and a finite-ring regression are typed. The perfect cone open immersion and the corrected truncated-Witt/jet-torsor interface remain a gap. The adjugate argument proves right-factor integrality; it does not make the factor unique or independent of the chosen lift.

**Open obligations:** gap [G0.2](#gap-g0-2) (Zhu B.11 corrected truncated-Witt interface); gap [G0.3](#gap-g0-3) (Sketch-only canonical determinant and crystal comparison); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`.

#### Normalized determinant on SL_n lattices

<a id="n-gs0-witt-geometry-sl-determinant-normalization"></a>
`GS0:Witt-geometry/sl-determinant-normalization` · construction

**Lean name:** `TauCeti.GeometricSatake.normalizedDeterminant`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

On Gr_SL_n over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define L_M as det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹, independent of a. It is ample on every proper bound. Translations differ from L only by a line on the base, giving a G_m-central extension of the loop group acting on L.

**Hypotheses.**

- The ordinary geometric determinant on filtered torsion modules agrees with the imported determinant calculus; the normalization factor is retained. This does not assert an honest LG-linearization.

**Construction.**

1. Reduce the ramified coefficient module to W(R)^{ne} using a fixed coefficient basis, then use the GL_{ne} bound and determinant line.
2. Use tensor multiplicativity of determinants to cancel the standard-lattice factor under changing a.
3. Apply the finite embedding into a GL_{ne} bound for ampleness; compose translation-line isomorphisms for the central extension. The tame K₂ identification belongs to its supplier.

**Direct prerequisites.**

- [Geometric determinant line](#n-gs0-witt-geometry-geometric-determinant-line) (`GS0:Witt-geometry/geometric-determinant-line`)
- [Projectivity of the Witt Grassmannian](#n-gs0-witt-geometry-ampleness-via-keel) (`GS0:Witt-geometry/ampleness-via-keel`)
- `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`
- `KTheoryLowDegrees:Z.3`

**Sources.**

- [BS](#src-bs), 10.1 and discussion through 10.4, pp. 37–39

**Uses that shape the API.**

- BS 10.1: Ramified SL_n bounds inherit ampleness from GL_ne.
- BS 10.3–10.4: Translation lines form a loop-group central extension.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.normalizedDeterminant_trivial` | simp | At the standard lattice, the normalized determinant line is the tensor unit. |
| `TauCeti.GeometricSatake.normalizedDeterminant_comparison` | compatibility | Normalization retains the inverse standard-lattice determinant factor. |
| `TauCeti.GeometricSatake.normalizedDeterminant_translation` | relation | Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.normalized_standard` | degenerate | The standard lattice has normalized determinant R. |
| `TauCeti.GeometricSatake.normalized_zero_quotient` | computation | Two zero truncation quotients have the unit determinant. |
| `TauCeti.GeometricSatake.normalized_tensor_carrier` | compatibility | Tensor products and determinant duals use existing ModuleCat and TensorProduct. |

**Acceptance.**

- For the standard lattice the normalized line is canonically trivial; translation by the identity gives the identity extension element.

**Prototype boundary.** This is the pointwise module carrier for the normalized line. M and M₀ must be the specified finite filtered torsion quotients, and the geometric sheaf gluing is not yet typed. The translation statement omits that geometry, while keeping the indispensable base-line factor.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.7](#req-r0-7) to `KTheoryLowDegrees:Z.3`.

#### Sections of the Witt determinant line

<a id="n-gs0-witt-geometry-sections-on-witt-bounds"></a>
`GS0:Witt-geometry/sections-on-witt-bounds` · theorem

**Lean name:** `TauCeti.GeometricSatake.determinantSectionsRestriction`. **Also realises:** `GS0`.

For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.

**Hypotheses.**

- Pass to fixed finite models and arbitrarily large Frobenius powers of their ample lines. This gives no answer to BS Question 10.6 about canonical modules or embeddings.

**Proof outline.**

1. Use SF’s section-colimit description of line bundles on perfections.
2. Serre vanishing on finite models at large p^r powers gives restriction surjectivity.
3. Apply the same Frobenius powers to positive-dimensional bounds to obtain unbounded section dimensions.

**Direct prerequisites.**

- [Normalized determinant on SL_n lattices](#n-gs0-witt-geometry-sl-determinant-normalization) (`GS0:Witt-geometry/sl-determinant-normalization`)
- `SchemeAndStackFoundations:SF.5`
- `SchemeAndStackFoundations:SF.0`

**Sources.**

- [BS](#src-bs), 10.5 and 10.6, pp. 39–40

**Acceptance.**

- Zero-dimensional bounds have finite section spaces; the infinite-dimensional assertion has a dimension hypothesis.

**Prototype boundary.** The modules/map must be determinant global sections and restriction to the specified proper bound. Serre vanishing/Frobenius section-colimit hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.18](#req-r0-18) to `SchemeAndStackFoundations:SF.5`.

#### Bounded admissible affine flag loci

<a id="n-gs0-witt-geometry-bounded-admissible-flags"></a>
`GS0:Witt-geometry/bounded-admissible-flags` · construction

**Lean name:** `TauCeti.GeometricSatake.admissibleFlagLocus`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For a parahoric 𝓚 and a dominant cocharacter class μ, the admissible locus A_{𝓚,μ} is the finite closed union of affine Schubert strata labelled by the parahoric image of Adm(μ). Its reduced perfect structure is determined by geometric points. Under a morphism of parahoric models f:𝓚₁→𝓚₂ sending μ₁ to μ₂, the map of affine flags carries A_{𝓚₁,μ₁} into A_{𝓚₂,μ₂}.

**Hypotheses.**

- Admissible sets and affine Bruhat order from RG2.4; integral v-sheaf local-model existence/functoriality is an imported refinement, not inferred from Satake.
- Use the connected parahoric/local-model hypotheses of GLX §3.2 and §3.3 (Lemmas 3.3–3.4) and van Hoften §2.2.6–§2.2.15. Van Hoften §2.2.15 states the perfect local-model interpretation for minuscule μ; GLX §3.2 supplies the non-minuscule extension. A generic group homomorphism without an integral parahoric model morphism is not covered.

**Construction.**

1. Use finite Bruhat unions and the representable flag spaces.
2. Identify this union with the reduced special fibre of the imported local model.
3. GLX 3.4 applies functoriality of local models and checks the containment on geometric points; GS supplies the ambient flag morphism.

**Direct prerequisites.**

- [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity) (`GS0:Witt-geometry/parahoric-ind-projectivity`)
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.4`

**Sources.**

- [GLX](#src-glx), §3.2 and §3.3, Lemmas 3.3–3.4, pp. 822–823
- [vH](#src-vh), §2.2.14–§2.2.15, pp. 15–16. Relative-position strata, admissible sets and their bounded affine-Schubert union; the local-model interpretation in §2.2.15 is stated for minuscule μ. GLX §3.2 supplies the general non-minuscule extension.

**Uses that shape the API.**

- GLX 3.4: Admissible special-fibre containment is functorial in the group model.
- van Hoften §2.2.6–2.2.15: The ambient parahoric flag space supplies the admissible locus.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.admissibleFlagLocus_mem` | characterisation | A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata. |
| `TauCeti.GeometricSatake.admissibleFlagLocus_mono` | functoriality | Increasing the admissible label set enlarges the locus. |
| `TauCeti.GeometricSatake.admissibleFlagLocus_map` | compatibility | An ambient flag morphism whose local-model comparison sends all admissible strata into the target locus restricts to the admissible locus. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.admissible_empty` | degenerate | The empty label set gives the empty locus. |
| `TauCeti.GeometricSatake.admissible_singleton` | computation | A singleton label gives exactly its Schubert stratum. |
| `TauCeti.GeometricSatake.admissible_nonlabel` | non-example | A point belonging to no admissible stratum is excluded, even when it lies in a different connected component. |

**Acceptance.**

- The zero admissible set in the torus is its corresponding component; identity group map fixes the locus.

**Prototype boundary.** This finite-union core records only membership and maps. Bruhat downward closure, reduced perfect structure and local-model functoriality belong to RG/SF suppliers.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.8](#gap-g0-8) (Bounded affine-flag dimension and adjoint transfer); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`; request [R0.17](#req-r0-17) to `SchemeAndStackFoundations:SF.4`.

#### Relative-position flag correspondences

<a id="n-gs0-witt-geometry-flag-incidence-correspondences"></a>
`GS0:Witt-geometry/flag-incidence-correspondences` · construction

**Lean name:** `TauCeti.GeometricSatake.flagIncidence`. **Library:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS0`.

For affine flags define O_w⊂Fl×Fl by relative position w. The two-step incidence C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v} maps by forgetting z to Fl×Fl; pull back to O_{uv} or O_{u*v} to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.

**Hypotheses.**

- Relative position and Demazure product from RG2.4. The bounded twisted product is not an untwisted Cartesian product.

**Construction.**

1. Construct the fibre-product incidence and its projection from the affine flag moduli.
2. Apply finite Bruhat closure bounds to z and y after an étale-local choice of the first flag, producing the proper bounded convolution tower.
3. Use SF compatible perfection models and dimension invariance for all pullbacks, including He’s X₂→X₃ and X₄→X₅.

**Direct prerequisites.**

- [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity) (`GS0:Witt-geometry/parahoric-ind-projectivity`)
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Sources.**

- [He](#src-he), 5.3–5.4, pp. 9–12

**Uses that shape the API.**

- He 5.6: Ordinary-product and Demazure-product fibre estimates apply to these projections.
- He proof of 5.5: Bounded pullbacks give X₂→X₃ and X₄→X₅.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.flagIncidence_points` | characterisation | Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second. |
| `TauCeti.GeometricSatake.flagIncidence_projection` | projection | The product projection forgets z and returns (x,y). |
| `TauCeti.GeometricSatake.flagIncidence_fibre` | characterisation | The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.incidence_identity_left` | computation | If the first relation is the diagonal, z is uniquely x. |
| `TauCeti.GeometricSatake.incidence_empty` | degenerate | An empty first relation gives empty incidence. |
| `TauCeti.GeometricSatake.incidence_no_unrestricted_middle` | non-example | For both diagonal relations, a middle flag different from x cannot occur. |

**Acceptance.**

- C_{1,v} and C_{u,1} have a uniquely determined middle flag; finite bounds are required before dimension arguments.

**Prototype boundary.** The geometric fibre products, bounded pfp models and their dimensions are omitted from this pointwise core; no dimension is asserted for an unbounded ind-space.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.8](#gap-g0-8) (Bounded affine-flag dimension and adjoint transfer); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`; request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.15](#req-r0-15) to `SchemeAndStackFoundations:SF.1`.

#### Affine flag convolution fibre bounds

<a id="n-gs0-witt-geometry-flag-convolution-fibres"></a>
`GS0:Witt-geometry/flag-convolution-fibres` · theorem

**Lean name:** `TauCeti.GeometricSatake.flagConvolutionFibreBound`. **Also realises:** `GS0`.

If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}|_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.

**Hypotheses.**

- Nonempty fibres and bounded pfp models; ordinary and Demazure products kept distinct. Adjoint transfer is componentwise and needs the corrected GHN hypothesis.
- He’s standing geometric setting is a simple quasi-split group over the local field (§2.2); any transfer to other groups must use the requested componentwise comparison with its stated hypotheses.

**Proof outline.**

1. Use rank-one A¹/G_m convolution strata and induction on affine reduced words, as in GH10 2.4–2.5 cited by He 5.6.
2. Length-additive factors give uniqueness of the middle flag.
3. Transfer surjectivity and dimensions along perfected fibre products; for He’s dimension inequality use a finite cover of bounded components, not an unproved finite-component claim for the whole ind-space.

**Direct prerequisites.**

- [Relative-position flag correspondences](#n-gs0-witt-geometry-flag-incidence-correspondences) (`GS0:Witt-geometry/flag-incidence-correspondences`)
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.4`

**Sources.**

- [He](#src-he), 5.6 and proof 5.5, pp. 10–12

**Acceptance.**

- For u=v=s, ℓ(s)=1 and s*s=s: the Demazure fibre has dimension at least one, while the ordinary-product fibre lower bound is one.

**Prototype boundary.** Only the ordinary-product length/dimension inequality is typed; the bounded nonempty geometric fibre and length interpretations are omitted. The Demazure-product factor differs and is stated in the document.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.8](#gap-g0-8) (Bounded affine-flag dimension and adjoint transfer); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`; request [R0.14](#req-r0-14) to `SchemeAndStackFoundations:SF.0`; request [R0.17](#req-r0-17) to `SchemeAndStackFoundations:SF.4`.

<a id="layer-gs1"></a>

## GS1 — Semi-infinite geometry and constructibility

Constant terms are the attracting pull–push functors, with Braden's
comparison for the repelling side on eligible monodromic objects (VS1). The
semicontinuity lemmas for completed divisor length and lattice position give
the strata and their closed unions. Affineness of semi-infinite intersections
gives the early dimension bound; universal local acyclicity and flatness are
recognized by constant terms. The relative perverse t-structure is defined by
stalk and costalk bounds at geometric points with distinct untilts and their
cell shifts. EDC.5 supplies scheme perversity within its coefficient range
(finite fields, self-injective finite quotients of discrete valuation rings,
rational fields), and the extension to the full torsion and adic range is
requested; L1 and L3 transport the perfect scheme charts; the extension of the t-structure to the Ind category is requested
from EnhancedDerivedSheaves E5. Standard and costandard objects
keep their integral map, and the rational torsion comparison is isolated. The
rational Mirković–Vilonen description and the special-fibre weights are
rational refinements that come after the integral theory. Acceptance includes
the torus shift, a nonflat coefficient module, nonempty intersections, the
quasi-minuscule term at infinity and the trace normalization on a fixed model.

#### Semicontinuity of completed divisor length

<a id="n-gs1-length-semicontinuity"></a>
`GS1/length-semicontinuity` · lemma

**Lean name:** `TauCeti.GeometricSatake.divisorLengthUpperSemicontinuous`.

In the ordered O_E-untilt setup of FS VI.3.2, let f∈B⁺. The function ℓ_f:|S|→ℕ∪{∞}, s↦length_{B_s⁺}(B_s⁺/(f_s)), has open sublevel loci {s | ℓ_f(s)≤m} for every m∈ℕ. Infinite length is retained when f_s vanishes on a DVR factor; it is never replaced by zero.

**Hypotheses.**

- S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}).
- Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide.
- For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.

**Proof outline.**

1. For each i, let S_i be the closed locus in S where the image of f in the i-th untilt R_i^♯ vanishes. Away from their finite union, f is a unit in every geometric completed DVR factor, so ℓ_f=0.
2. On S_i, pull back to that closed locus and divide f by its regular Cartier generator ξ_i. For f_i=f/ξ_i the geometric module length is ℓ_f=ℓ_{f_i}+1, with ∞+1=∞. This counts that one degree-one divisor even if some other legs coincide.
3. Induct on m. In each closed S_i the bad locus ℓ_f>m is the bad locus ℓ_{f_i}>m−1, closed by induction; their finite union is the complement of the required open sublevel locus. The case m=0 is the unit locus described in the first step.

**Direct prerequisites.**

- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF2:untilts`

**Sources.**

- [FS](#src-fs), Lemma VI.3.3 and full proof, printed p. 204; setup in Lemma VI.3.2, printed p. 203. Open finite-length sublevel loci, proof by the closed zero loci of the untilt residues and division by a degree-one Cartier equation.

**Acceptance.**

- A unit f has length zero on every fibre; f=0 has infinite length on every nonempty geometric divisor fibre.
- For one geometric leg and f=ξ_1^a, the length is a. For ξ=ξ_1^n at a coincident n-tuple, length(B_s⁺/ξ)=n, not one.
- For distinct supports, length is the sum of the DVR-factor lengths; no DVR assertion is made about the whole product.

**Prototype boundary.** Signature omitted under §13, reserving the exact name divisorLengthUpperSemicontinuous until the actual affinoid-perfectoid space, ordered O_E-untilts, completed Cartier rings and geometric fibre maps exist. Its intended conclusion is ∀ m:ℕ, IsOpen {s∈|S| | length_{B_s⁺}(B_s⁺/(f_s))≤m}, with length in ℕ∪{∞}. An arbitrary topological space and arbitrary length function are not a substitute. The RF2 integral geometric-DVR extension is requested explicitly; the existing geometric-divisor-complete-dvr target covers generic E-untilts.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.22](#req-r0-22) to `RelativeFarguesFontaine:RF2:untilts`.

#### Semicontinuity of lattice position

<a id="n-gs1-lattice-relative-position-semicontinuity"></a>
`GS1/lattice-relative-position-semicontinuity` · lemma

**Lean name:** `TauCeti.GeometricSatake.latticeRelativePositionUpperSemicontinuous`.

In the ordered O_E-untilt setup of FS VI.3.2, let L⊂B be a finitely generated B⁺-submodule for which ξ^N B⁺⊂L⊂ξ^(−N)B⁺ for some N≥0. Let S_m⊂|S| be the locus where the image L_s of L⊗_{B⁺}B_s⁺ in B_s has total relative position m∈ℤ against B_s⁺. Then ⋃_{m′≥m}S_{m′} is closed for every m∈ℤ. If S_m=|S| for some m, L is a line bundle over B⁺ (a finite projective module of rank one); global freeness is not asserted.

**Hypotheses.**

- S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}).
- Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide.
- For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.
- Relative position uses the sum of the valuations on the distinct geometric DVR factors, with the convention that for L_s⊂B_s⁺ it is length(B_s⁺/L_s). The image of tensor base change is used, not an unproved injectivity of L⊗B_s⁺→B_s.
- L is finitely generated, open and bounded in the displayed ξ-adic sense. These hypotheses imply only finitely many relative-position values; local principality is the conclusion, not an input.

**Proof outline.**

1. Multiply L by a power of ξ to reduce to L⊂B⁺. This changes every relative-position value by the same constant (the degree n times that power), so it preserves the claimed semicontinuity and constant-position criterion.
2. At a point s, B_s⁺ is a finite product of DVRs and L_s is a free rank-one ideal. After localizing S, choose l∈L whose image generates L_s. Apply length-semicontinuity to l: near s the length of B_t⁺/(l_t) is at most the length at s.
3. Since B⁺l⊂L, the relative position of L_t is at most that of B_t⁺l. Thus the relative-position sublevel loci are open; taking complements gives closed loci of position at least m.
4. If the position is constant, the containment B⁺l⊂L has equal geometric fibre positions nearby and is an equality there; the generator gives a local trivialization. The ring/lattice fibre-detection step is supplied by RF4’s stated finite-projectivity and fibre-detection extension, not inferred from an arbitrary ring map. These local identifications make L a line bundle.

**Direct prerequisites.**

- [Semicontinuity of completed divisor length](#n-gs1-length-semicontinuity) (`GS1/length-semicontinuity`)
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF4:vector-bundles`

**Sources.**

- [FS](#src-fs), Lemma VI.3.2 and full proof, printed pp. 203–204; relative-position convention immediately before the lemma. Finite-generation and open-boundedness, closed upper-position loci, and the constant-position rank-one conclusion.

**Acceptance.**

- L=B⁺ has constant position zero and is a line bundle. L=ξ^aB⁺ has constant total position na, including coincident legs.
- The closed-locus direction is position≥m; the open-locus direction is position≤m. They are not interchanged.
- Constancy gives local rank-one projectivity, not a chosen global generator; no assertion is made for a merely pointwise specified or non-finitely-generated submodule.

**Prototype boundary.** Signature omitted under §13, reserving the exact name latticeRelativePositionUpperSemicontinuous until the genuine completed Cartier-ring family and its fibrewise submodule images and relative positions can be stated. Its single named mathematical contract includes both the closed loci ⋃_{m′≥m}S_{m′} and the implication S_m=|S| ⇒ L finite projective of rank one. Do not assume L projective in order to state the result, replace finite generation by arbitrary lattice data, or substitute a proposition-valued placeholder. The RF2 integral geometric-DVR and RF4 fibre-detection extensions remain requests.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.13](#req-r0-13) to `RelativeFarguesFontaine:RF4:vector-bundles`; request [R0.22](#req-r0-22) to `RelativeFarguesFontaine:RF2:untilts`.

#### Semi-infinite strata and constant terms

<a id="n-gs1-semi-infinite-orbits-and-hyperbolic-localization"></a>
`GS1/semi-infinite-orbits-and-hyperbolic-localization` · construction · planet: **Constant term functor**

**Lean name:** `TauCeti.GeometricSatake.constantTerm`. **Library:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel, on a one-leg geometric fibre with primitive equation t, the local strata are S_λ=L U·λ(t). On a general geometric fibre the stratum of total cocenter weight ν is the union of products of these local strata over the distinct supports, with local labels summing to ν. The union of total-weight strata with ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.

**Hypotheses.**

- G split for labels; bounded quasicompact Schubert support; coefficients killed by an integer prime to p initially, with derived adic passage supplied by L0. The cocenter degree is the sum of the combined local cocharacters over distinct geometric supports, counted once each. At collisions the ordered-leg labels add first; the support multiplicity is not an additional weight (E24).

**Construction.**

1. Use RG’s parabolic/Levi and Iwasawa decompositions on geometric points. For the locally closed strata and their closed weight-bound unions, reduce via a faithful representation, maximal parabolics and exterior powers to an image submodule of a rank-one period module; apply lattice-relative-position-semicontinuity (FS VI.3.2), whose proof uses length-semicontinuity (VI.3.3). In that reduction use ordinary product-DVR length, as in VI.3.2, rather than the extra multiplicity weighting in the description before VI.3.1 (E24).
2. Verify FS IV.6.1’s finite attracting/repelling decomposition on each bound.
3. Import the diamond hyperbolic-localization theorem, base change, duality and ULA preservation from VS1; apply it to the maps of Hecke stacks.

**Direct prerequisites.**

- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- `ReductiveGroupsPartII:RG2.4`
- `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`
- `VStackSheavesAndLisseCategories:VS1`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`
- `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`
- `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`
- `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`
- `VStackSheavesAndLisseCategories:VS0`
- [Semicontinuity of lattice position](#n-gs1-lattice-relative-position-semicontinuity) (`GS1/lattice-relative-position-semicontinuity`)
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-localization`
- `VStackSheavesAndLisseCategories:VS1/braden-theorem`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`

**Sources.**

- [FS](#src-fs), VI.3.1–VI.3.5, pp. 201–206

**Uses that shape the API.**

- FS VI.6.1: ULA is detected by constant terms after the weight shifts.
- FS VI.7.4/VI.7.7: Constant terms recognize perversity and coefficient flatness.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.constantTerm_formula` | characterisation | The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward. |
| `TauCeti.GeometricSatake.constantTerm_minus_comparison` | equivalence | On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward. |
| `TauCeti.GeometricSatake.constantTerm_map_comp` | functoriality | Constant term preserves composition of morphisms as a genuine functor. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.ct_torus` | degenerate | For G=T with identity correspondence, constant term is the identity functor. |
| `TauCeti.GeometricSatake.ct_point_evaluation` | computation | The plus formula evaluates to p-shriek of q-star on every object. |
| `TauCeti.GeometricSatake.ct_order` | compatibility | Composition agrees with Mathlib Functor.comp in pullback-then-pushforward order. |

**Acceptance.**

- For G=T the constant term is the identity; plus and minus formulas need monodromicity. For two coincident G_m legs with labels (1,0), the combined lattice tB⁺ has degree one, even though the product Cartier equation is t². A second multiplicity factor would incorrectly give degree two.

**Prototype boundary.** The plus/minus comparison omits monodromicity and the geometric correspondence hypotheses. The functor type and plus composition are concrete; hyperbolic localization is imported from VS1.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`; request [R0.19](#req-r0-19) to `VStackSheavesAndLisseCategories:VS0`; request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### Affine semi-infinite intersections

<a id="n-gs1-semi-infinite-affineness"></a>
`GS1/semi-infinite-affineness` · theorem

**Lean name:** `TauCeti.GeometricSatake.semiInfiniteBoundAffine`.

On the Witt special fibre, S_λ∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of the ample determinant line on the closed weight-bound union. When nonempty, this bounded intersection is equidimensional of dimension ⟨ρ,μ+λ⟩; the same holds for its nonempty open intersection with the exact μ-cell. Neither dimension formula is asserted for an empty intersection.

**Hypotheses.**

- Split group; fixed perfect field; nonempty for the dimension assertion; integral coefficient freeness does not follow from cycle counting.

**Proof outline.**

1. Use the faithful representation and a highest-weight determinant section to express the semi-infinite weight condition as a nonvanishing locus (VI.3.7).
2. Import A_inf lattice extension needed to define the section; then apply the GS0 determinant ampleness theorem.
3. Use the closed filtration by the height ⟨2ρ,λ⟩: successive complements are affine, so each step drops dimension by at most one. The total number of steps equals the total dimension drop from the bound to its antidominant point, forcing equidimensionality as in VI.3.8. The exact-cell intersection is open. This argument precedes rational weight concentration and uses no minimal-convolution generation theorem.

**Direct prerequisites.**

- [Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) (`GS1/semi-infinite-orbits-and-hyperbolic-localization`)
- [Projectivity of the Witt Grassmannian](#n-gs0-witt-geometry-ampleness-via-keel) (`GS0:Witt-geometry/ampleness-via-keel`)
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.1`
- `SchemeAndStackFoundations:SF.5`

**Sources.**

- [FS](#src-fs), VI.3.7–VI.3.8, pp. 205–207

**Acceptance.**

- For a torus the nonempty intersection is a point; λ outside the weights gives an empty intersection.

**Prototype boundary.** X must be the specified bounded semi-infinite intersection on its pfp model. Affineness also holds for the empty intersection; nonemptiness is required only for the dimension equality. General perfect-space affineness requires the SF model interface.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`; request [R0.12](#req-r0-12) to `RelativeFarguesFontaine:RF4:G-torsors`; request [R0.18](#req-r0-18) to `SchemeAndStackFoundations:SF.5`.

#### Prounipotent equivariance invariance

<a id="n-gs1-prounipotent-equivariance"></a>
`GS1/prounipotent-equivariance` · theorem

**Lean name:** `TauCeti.GeometricSatake.prounipotentEquivariance`.

Let H be a group small v-sheaf over S with closed congruence subgroups H^{≥m}, complete separated filtered presentation, and, v-locally on S, finite filtrations of each successive quotient by affine-line diamonds of untilts. If the action on X factors through H^{<m}=H/H^{≥m}, m>0, pullback D_ét(H^{<m}\X,Λ)→D_ét(H\X,Λ) is an equivalence for coefficients killed by an integer prime to p. Consequently the deep congruence kernel adds no equivariance data. H itself need not have a finite filtration.

**Hypotheses.**

- Closed congruence filtration as in FS VI.4.1, with the filtered spatial ball-subgroup/inverse-limit presentation used in its proof; action factors at a finite level.
- Λ is killed by n prime to p. The adic extension is levelwise with compatible derived coefficient limits, not an unrestricted p-torsion assertion.

**Proof outline.**

1. Descend along S→[H^{<m}\S] to reduce to a trivially acting deep kernel. Use the section to reduce equivariant descent to full faithfulness of pullback on complexes.
2. Compute ordinary cohomology RΓ(S,A)→RΓ(S×H,A), using Postnikov towers, spatial ball subgroups H_j and their finite quotients H_j^{<r}. Apply Sch17a 14.9 continuity and ordinary cohomology of relative balls.
3. Descend the equivalence through the action nerve and apply finite bounded-action factorization. Affine-space compact support is Λ(−d)[−2d], so it is not unshifted acyclicity.

**Direct prerequisites.**

- [Finite truncation of bounded actions](#n-gs0-schubert-smoothness-truncation-of-the-loop-action) (`GS0:Schubert-smoothness/truncation-of-the-loop-action`)
- [Congruence filtration of positive loops](#n-gs0-loop-geometry-congruence-filtration-and-graded-pieces) (`GS0:loop-geometry/congruence-filtration-and-graded-pieces`)
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`
- `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`
- `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`
- `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `VStackSheavesAndLisseCategories:VS1`

**Sources.**

- [FS](#src-fs), VI.4.1, pp. 207–208

**Acceptance.**

- A vector group has only the trivial bounded prime-to-p equivariant local system; this fails as an unrestricted p-torsion assertion.

**Prototype boundary.** D/DEq are the actual finite-quotient and full filtered-equivariant derived categories. The closed filtration, factorized action, spatial continuity and prime-to-p coefficient hypotheses are supplied by VS1 and omitted from this equivalence signature.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### Conservativity of constant terms

<a id="n-gs1-constant-term-conservativity"></a>
`GS1/constant-term-conservativity` · theorem

**Lean name:** `TauCeti.GeometricSatake.constantTermConservative`.

For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.

**Hypotheses.**

- Bounded support and monodromic/positive-loop equivariance; prime-to-p coefficients.

**Proof outline.**

1. Use the closed semi-infinite filtration and choose an extremal nonzero stratum.
2. Prounipotent invariance and hyperbolic localization identify its detecting constant term.
3. Descend conservativity along the splitting cover.

**Direct prerequisites.**

- [Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) (`GS1/semi-infinite-orbits-and-hyperbolic-localization`)
- [Prounipotent equivariance invariance](#n-gs1-prounipotent-equivariance) (`GS1/prounipotent-equivariance`)
- [Galois descent of bounded modifications](#n-gs0-loop-geometry-generic-galois-descent) (`GS0:loop-geometry/generic-galois-descent`)

**Sources.**

- [FS](#src-fs), VI.4.2, pp. 208–209

**Acceptance.**

- For a torus the detecting functor is identity; arbitrary unbounded support is excluded.

**Prototype boundary.** CT must be the geometric torus constant term on the bounded-support category; its geometric hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### ULA Hecke complexes

<a id="n-gs1-ula-sheaves-on-the-hecke-stack"></a>
`GS1/ULA-sheaves-on-the-hecke-stack` · construction · planet: **ULA Hecke complexes**

**Lean name:** `TauCeti.GeometricSatake.ulaHeckeCategory`. **Library:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

D^ULA(Hck_G/S,Λ) is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to Gr_G is universally locally acyclic over S. Switching the two torsors preserves this condition. On one leg over Spd O_C this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.

**Hypotheses.**

- Support can be locally bounded on the base; a fixed bound is used in each argument. General ULA and stack formalism imported from VS1.

**Construction.**

1. Use the smooth truncated positive-loop quotient charts and VS1’s ULA descent.
2. Use the definition and smooth-chart ULA descent to construct the category. VI.6.5 reduces one-leg ULA to cell restrictions; the later VI.6.4 constant-term criterion is proved in ula-constant-term-criterion, not assumed here.
3. Demazure generators and prounipotent invariance prove the reverse implication; no arbitrary collision-version of 6.5 is asserted.

**Direct prerequisites.**

- [Prounipotent equivariance invariance](#n-gs1-prounipotent-equivariance) (`GS1/prounipotent-equivariance`)
- [Affine flags and Demazure spaces over Spd O_C](#n-gs0-loop-geometry-affine-flag-demazure) (`GS0:loop-geometry/affine-flag-demazure`)
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- [Finite truncation of bounded actions](#n-gs0-schubert-smoothness-truncation-of-the-loop-action) (`GS0:Schubert-smoothness/truncation-of-the-loop-action`)
- `mathlib:Action`

**Sources.**

- [FS](#src-fs), VI.6.1–VI.6.5, pp. 211–214

**Uses that shape the API.**

- FS VI.6.1–VI.6.5: CT criterion and Demazure generation control ULA objects.
- FS VI.8.1(i): Convolution composes proper relative ULA kernels.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.ulaHeckeCategory_finite_action` | compatibility | The typed equivariant-object core is Action DU H, where DU is the supplied ULA category and H is a finite jet group on the chosen bound. |
| `TauCeti.GeometricSatake.ulaHeckeCategory_forget` | projection | Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms. |
| `TauCeti.GeometricSatake.ulaHeckeCategory_trivial_action` | constructor | A ULA object has the trivial finite-jet action whenever this is the desired equivariance. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.ula_trivial_group` | degenerate | For the trivial group, an equivariant object has no additional automorphism labels. |
| `TauCeti.GeometricSatake.ula_intertwining` | non-example | A morphism between equivariant ULA objects must intertwine every group element; an arbitrary underlying morphism is insufficient. |
| `TauCeti.GeometricSatake.ula_action_identity` | compatibility | The finite-jet action obeys the existing Action identity law. |

**Acceptance.**

- The unit complex is ULA; a locally constant but nonperfect coefficient complex is excluded; one-leg stratum recognition is not asserted at collisions.

**Prototype boundary.** DU is imported as the ULA category, not defined by an unknown proposition. Action DU H is only the discrete equivariant-object core at a chosen level; smooth geometric action/descent, bounded supports, and enhanced ULA kernels are not encoded.

**Open obligations:** gap [G0.6](#gap-g0-6) (Stack enhancement and coherent Ind convolution); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### ULA recognition by constant terms

<a id="n-gs1-ula-constant-term-criterion"></a>
`GS1/ula-constant-term-criterion` · theorem

**Lean name:** `TauCeti.GeometricSatake.ulaConstantTermPerfect`.

For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.

**Hypotheses.**

- Split G and Borel for labels; the disjoint-leg restriction is essential for the complete cell calculus.

**Proof outline.**

1. For the forward direction, hyperbolic localization preserves ULA and proper torus pushforward on a bounded support remains ULA.
2. For the converse, reduce to a strictly totally disconnected base and split G, and use the ULA diagonal-duality map of IV.2.23 on a bounded finite-dimensional quotient chart. By conservativity of CT for G×G it suffices to apply CT_{B⁻×B}; compatibility with exterior tensor products and hyperbolic duality IV.6.13 identifies the result with the same ULA criterion for CT_B(A). The final perfect locally constant pushforward criterion uses IV.2.28.
3. Apply the one-leg cellwise criterion VI.6.5 and its closure consequence VI.6.6 one leg at a time on the disjoint locus for VI.6.8. The arbitrary collision version of those cell-functor closure assertions is not claimed.

**Direct prerequisites.**

- [ULA Hecke complexes](#n-gs1-ula-sheaves-on-the-hecke-stack) (`GS1/ULA-sheaves-on-the-hecke-stack`)
- [Conservativity of constant terms](#n-gs1-constant-term-conservativity) (`GS1/constant-term-conservativity`)
- `VStackSheavesAndLisseCategories:VS1`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `mathlib:DerivedCategory`
- `mathlib:Module.Finite`
- `mathlib:Module.Projective`
- `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`
- `VStackSheavesAndLisseCategories:VS1/perfect-local-systems`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources.**

- [FS](#src-fs), VI.6.4–VI.6.6, VI.6.8, pp. 212–215

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.perfect_complex_cohomology_not_projective` | non-example | For R=Z/4Z, the quotient R/(2) is not a projective R-module. It occurs as cohomology of the two-term perfect complex R → R with differential multiplication by 2, so perfect constant-term stalks do not imply projectivity of their individual cohomology modules. |

**Acceptance.**

- No claim that all four cell functors preserve ULA over an arbitrary collision family.

**Prototype boundary.** The typed coefficient core states that a geometric CT stalk admits a bounded cochain model of finite projective terms representing that derived object. Those terms are a strict perfect model, not the individual cohomology modules. The identification with the actual CT stalk, étale local constancy and ULA hypotheses require the supplied sheaf carriers and are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### One-leg ULA special/generic comparison

<a id="n-gs1-integral-family-comparison"></a>
`GS1/integral-family-comparison` · comparison

**Lean name:** `TauCeti.GeometricSatake.oneLegULAComparison`.

For a split integral model and one leg, restriction induces equivalences D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ), compatible with finite Schubert bounds and coefficient change. The special side is identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.

**Hypotheses.**

- Algebraically closed complete untilt C; split integral model; bounded quasicompact support; prime-to-p/derived adic coefficients.

**Proof outline.**

1. Use the cellwise locally constant perfect criterion, whose restriction over the strictly local trait is an equivalence.
2. Induct on finite Schubert stratifications with gluing; Demazure generators give essential surjectivity.
3. Use VI.6.7, L1/L3 and perfection invariance to identify the scheme-valued special category.

**Direct prerequisites.**

- [ULA recognition by constant terms](#n-gs1-ula-constant-term-criterion) (`GS1/ula-constant-term-criterion`)
- [Integral bounded Grassmannian families](#n-gs0-witt-geometry-integral-family-bounded-properness) (`GS0:Witt-geometry/integral-family-bounded-properness`)
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`

**Sources.**

- [FS](#src-fs), VI.6.7, p. 214; VI.7.4, pp. 217–219

**Acceptance.**

- An arbitrary non-ULA complex is not transported by this equivalence; split model fixed throughout.

**Prototype boundary.** The supplied categories must be the one-leg ULA categories with compatible finite supports. Arbitrary multi-leg collisions are excluded in the document.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Relative perverse t-structure

<a id="n-gs1-relative-perverse-t-structure"></a>
`GS1/relative-perverse-t-structure` · construction · planet: **Relative perverse t-structure**

**Lean name:** `TauCeti.GeometricSatake.relativePerverse`. **Library:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

On the bounded-support derived category over a leg base S, define perverse ≤0 by the condition that at each geometric point with r distinct untilts and open-cell labels μ₁,…,μ_r, the restriction lies in ordinary degrees ≤−Σ⟨2ρ,μ_i⟩. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in S is t-exact. On ULA objects the relative condition is detected on geometric fibres.

**Hypotheses.**

- Use distinct local factors at collisions; bounded support and locally finite Schubert stratification. Stable enhancement and presentability are imported from EDS.

**Construction.**

1. Use the stable enhanced category and Lurie HA 1.4.4.11 to generate the aisle and right orthogonal.
2. Glue finite Schubert pieces; compare on special finite models with EDC.5 via L1/L3.
3. Use hyperbolic localization and ULA to prove the geometric-fibre criterion and base-change t-exactness.

**Direct prerequisites.**

- [Affine semi-infinite intersections](#n-gs1-semi-infinite-affineness) (`GS1/semi-infinite-affineness`)
- [One-leg ULA special/generic comparison](#n-gs1-integral-family-comparison) (`GS1/integral-family-comparison`)
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:presentability`
- `mathlib:CategoryTheory.Triangulated.TStructure`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [FS](#src-fs), VI.7.1–VI.7.4, pp. 215–219

**Uses that shape the API.**

- FS VI.7.7–VI.7.8: Flat objects and Satake are defined in this relative heart.
- FS VI.8.1(ii): t-exact constant terms detect convolution bounds.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.relativePerverse_le` | characterisation | On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees. |
| `TauCeti.GeometricSatake.relativePerverse_ge` | characterisation | On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees. |
| `TauCeti.GeometricSatake.relativePerverse_existing_heart` | compatibility | Its heart is the intersection of the two degree-zero aisles, using Mathlib TStructure.heart. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.perverse_torus` | degenerate | For a torus, normalized constant term is the identity and the relative perverse structure is the ordinary one. |
| `TauCeti.GeometricSatake.perverse_zero` | computation | The zero object belongs to the relative perverse heart. |
| `TauCeti.GeometricSatake.perverse_shifted_cell` | compatibility | A smooth d-dimensional cell uses the normalization Λ[d], and on a normalized torus constant term its degree is zero. |

**Acceptance.**

- On a smooth μ-cell the constant sheaf shifted by ⟨2ρ,μ⟩ is perverse; colliding legs use the cell label of their sum.

**Prototype boundary.** D and DT denote the imported ULA categories with their triangulated structures; CT denotes the conservative normalized constant-term functor. The assumptions asserting that these data arise from the geometric Hecke family are omitted. This is an actual TStructure signature, not a proposition-valued stand-in.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.4](#req-r0-4) to `EnhancedDerivedSheaves:E5:presentability`; request [R0.21](#req-r0-21) to `EtaleDualityAndPerverseSheaves:EDC.5`.

#### Equivariant perverse descent and constant terms

<a id="n-gs1-perverse-descent-and-shifted-ct"></a>
`GS1/perverse-descent-and-shifted-ct` · theorem

**Lean name:** `TauCeti.GeometricSatake.perverseConstantTermExact`.

Pullback of perverse Hecke objects to Gr is fully faithful. For A≤0 and B≥0 the derived Hom is connective. Shifted CT_B[deg⟨2ρ,−⟩] is t-exact and conservative, and the relative t-structure commutes with base change.

**Hypotheses.**

- Finite bounded charts and positive-loop equivariance; ordinary scheme perverse input is EDC.5, not EDC.7.

**Proof outline.**

1. Use FS 7.3: for a connected cohomologically smooth map with section, H⁰Rf_*f*A→H⁰A is an isomorphism in the connective range.
2. Combine finite action truncation with perverse gluing for full faithfulness.
3. Reduce by collision-stratum excision and cell devissage to a one-leg shifted constant sheaf over a geometric base, then to field coefficients. On the Witt special fibre use dim(S_λ∩Gr_μ)≤⟨ρ,μ+λ⟩ and the ordinary compact-support bound 2dim; hyperbolic duality gives the costalk side. Transport by the one-leg comparison and geometric-point criterion. This does not use the later rational weight-concentration theorem.

**Direct prerequisites.**

- [Relative perverse t-structure](#n-gs1-relative-perverse-t-structure) (`GS1/relative-perverse-t-structure`)
- [Conservativity of constant terms](#n-gs1-constant-term-conservativity) (`GS1/constant-term-conservativity`)
- [Finite truncation of bounded actions](#n-gs0-schubert-smoothness-truncation-of-the-loop-action) (`GS0:Schubert-smoothness/truncation-of-the-loop-action`)
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- [Affine semi-infinite intersections](#n-gs1-semi-infinite-affineness) (`GS1/semi-infinite-affineness`)
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [FS](#src-fs), VI.7.2–VI.7.4, pp. 216–219

**Acceptance.**

- For a torus the shift is zero; signs must make the μ-cell constant sheaf in perverse degree zero.

**Prototype boundary.** CT must include the root-degree shift, and D the geometric ULA category. Smooth finite-jet stack descent and that identification are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.21](#req-r0-21) to `EtaleDualityAndPerverseSheaves:EDC.5`.

#### Flat perverse objects

<a id="n-gs1-flat-perverse-objects"></a>
`GS1/flat-perverse-objects` · definition · planet: **Flat perversity**

**Lean name:** `TauCeti.GeometricSatake.flatPerverse`. **Library:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

A perverse object A is coefficient-flat if A⊗^L_Λ M is perverse for every Λ-module M. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.

**Hypotheses.**

- Prime-to-p torsion rings and compatible adic systems; the ordinary tensor test uses every module, not just Λ itself.

**Construction.**

1. Use t-exact conservative shifted CT and its compatibility with derived coefficient tensors.
2. Reduce to the algebraic condition that a perfect Λ-complex remains concentrated in degree zero after every tensor.
3. Use Module.Flat/projectivity on finite perfect fibres; retain the all-module test.

**Direct prerequisites.**

- [Equivariant perverse descent and constant terms](#n-gs1-perverse-descent-and-shifted-ct) (`GS1/perverse-descent-and-shifted-ct`)
- [ULA recognition by constant terms](#n-gs1-ula-constant-term-criterion) (`GS1/ula-constant-term-criterion`)
- `mathlib:Module.Flat`
- `mathlib:Module.Projective`
- `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [FS](#src-fs), VI.7.7, pp. 220–221

**Uses that shape the API.**

- FS VI.7.7–VI.7.8: Satake imposes coefficient flatness in addition to perversity.
- FS VI.8.1(iii): Tensoring by arbitrary modules tests flatness after convolution.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.flatPerverse_iff` | characterisation | An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every R-module. |
| `TauCeti.GeometricSatake.flatPerverse_module` | compatibility | On the one-point torus, coefficient flatness is Module.Flat: tensoring any injective linear map stays injective. |
| `TauCeti.GeometricSatake.flatPerverse_heart` | projection | A flat-perverse object belongs to the Mathlib t-structure heart. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.flat_perverse_zero` | degenerate | The zero object is flat perverse when coefficient tensors preserve zero. |
| `TauCeti.GeometricSatake.flat_module_field` | computation | Every vector space over a coefficient field is flat, agreeing with the point-torus test. |
| `TauCeti.GeometricSatake.flat_module_integral_nonexample` | non-example | Z/2 as a Z-module is not flat; being concentrated in perverse degree zero does not suffice. |

**Acceptance.**

- Over Z/ℓ² the module Λ/ℓ has higher Tor and is not coefficient-flat.

**Prototype boundary.** The all-module derived tensor functors come from the coefficient supplier. The predicate is fully stated using the existing t-structure heart; the module compatibility specializes it to the existing injectivity characterization of Module.Flat. Derived tensor is not identified with ordinary tensor without flatness.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.21](#req-r0-21) to `EtaleDualityAndPerverseSheaves:EDC.5`.

#### Standard and costandard objects

<a id="n-gs1-standard-costandard-objects"></a>
`GS1/standard-costandard-objects` · construction · planet: **Standard Satake objects**

**Lean name:** `TauCeti.GeometricSatake.standardCostandard`. **Library:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

For a one-leg μ-cell of dimension d_μ, Δ_μ=pH⁰j_{μ!}Λ[d_μ] and ∇_μ=pH⁰Rj_{μ*}Λ[d_μ]. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist d_μ. The canonical map Δ_μ→∇_μ is retained integrally.

**Hypotheses.**

- One-leg base, split model; IC has perverse normalization [d_μ], not [2d_μ].

**Construction.**

1. Apply cell ULA calculus and perverse gluing.
2. Use shifted CT and affine perverse vanishing to prove finite free fibres.
3. Use relative duality on the smooth open cell for the Tate twist. The rational isomorphism and uniform torsion bound are a separate target.

**Direct prerequisites.**

- [Flat perverse objects](#n-gs1-flat-perverse-objects) (`GS1/flat-perverse-objects`)
- [ULA recognition by constant terms](#n-gs1-ula-constant-term-criterion) (`GS1/ula-constant-term-criterion`)
- [Relative perverse t-structure](#n-gs1-relative-perverse-t-structure) (`GS1/relative-perverse-t-structure`)
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [FS](#src-fs), VI.7.5 and VI.7.9, pp. 219–222

**Uses that shape the API.**

- FS VI.7.5: Uniform bounded torsion compares standard and costandard objects.
- Zhu 2.2.2: Rational IC generation uses normalized minimal objects.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.standardCostandard_formula` | characterisation | The standard and costandard objects are perverse H⁰ of j-shriek and j-star of the shifted constant local system Λ[d], respectively. |
| `TauCeti.GeometricSatake.standardCostandard_map` | data | Adjunction gives the standard-to-costandard map; its perverse image is the IC object. |
| `TauCeti.GeometricSatake.standardCostandard_restriction` | compatibility | Both restrict to the same normalized local system on the open cell. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.standard_zero_cell` | degenerate | For a point cell with identity inclusions the pair is the same constant object. |
| `TauCeti.GeometricSatake.standard_open_restriction` | computation | The costandard object restricts to Λ[d] on its own cell. |
| `TauCeti.GeometricSatake.standard_h0_normalization` | non-example | The construction takes perverse H⁰ and the geometric dimension shift before forming the standard-to-costandard map; unshifted ordinary H⁰ is not substituted. |

**Acceptance.**

- At μ=0 both are the unit; over integral coefficients their canonical map need not be an isomorphism.

**Prototype boundary.** jshriek/jstar, jpull, h0 and constant must be the indicated geometric functors and local system. Their geometric identities are omitted, while the existing shift/functor/object types fix the construction order.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.21](#req-r0-21) to `EtaleDualityAndPerverseSheaves:EDC.5`.

#### Rational parity and integral torsion bounds

<a id="n-gs1-standard-costandard-torsion-bound"></a>
`GS1/standard-costandard-torsion-bound` · theorem

**Lean name:** `TauCeti.GeometricSatake.standardCostandardBoundedTorsion`.

For fixed μ, Δ_μ→∇_μ is an isomorphism after rationalization, and over Z_ℓ its kernel and cokernel are killed by some ℓ^a uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple IC_μ indexed by dominant coweights and constant equivariant local systems.

**Hypotheses.**

- Rational statement requires decomposition/parity and connected stabilizers; the integral category is not semisimple.

**Proof outline.**

1. Import EDC.7’s rational proper direct-image decomposition and parity on Demazure generators.
2. Connected stabilizers rule out additional equivariant simple local systems.
3. Finite-generation and base-change compatibility of fixed-bound CT detect a uniform torsion exponent; this late result is not a prerequisite of early geometric smoothness or the ULA criterion.

**Direct prerequisites.**

- [Standard and costandard objects](#n-gs1-standard-costandard-objects) (`GS1/standard-costandard-objects`)
- `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`
- `ReductiveGroupsPartII:RG2.3`
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)
- `mathlib:PadicInt`

**Sources.**

- [FS](#src-fs), VI.7.5 end and proof, pp. 219–220
- [Zhu](#src-zhu), Lemma 2.1 and its proof, printed pp. 429–430. Rational special-fibre equivariant semisimplicity and the parity argument used by FS VI.7.5.

**Acceptance.**

- The assertion does not set a=0 and does not make integral extensions split.

**Prototype boundary.** R is explicitly a ℤ_ℓ-algebra, ℓ is prime, and the bound is ℓ^a. M must be the specified standard-to-costandard kernel or cokernel. The source supplies one a(μ) independent of R; this single-module core omits the geometric μ/family identification, not the coefficient algebra or the nonvacuous power bound.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.9](#req-r0-9) to `ReductiveGroupsPartII:RG2.3`.

#### Rational special-fibre weights

<a id="n-gs1-rational-weight-concentration"></a>
`GS1/rational-weight-concentration` · theorem

**Lean name:** `TauCeti.GeometricSatake.rationalWeightsFinite`.

For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_λ,A)=0 unless i=⟨2ρ,λ⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple coroots of G in the Weyl orbit of the quasi-minuscule coweight (the short simple coroots); equivalently count the corresponding simple roots of the dual root system. General concentration follows by generation from minimal convolutions.

**Hypotheses.**

- k algebraically closed; rational coefficients only; CT normalization uses compact support.

**Proof outline.**

1. Use Zhu 2.11’s minuscule flag and quasi-minuscule parahoric P¹ resolution; retain the section-at-infinity term missing in 2.2.13.
2. Use the corrected twisted external product and finite-jet U-torsor descent in 2.17.
3. Apply generation by minimal objects (2.16) and exact summands, plus early scheme semismallness for minimal convolution.

**Direct prerequisites.**

- [Affine semi-infinite intersections](#n-gs1-semi-infinite-affineness) (`GS1/semi-infinite-affineness`)
- [Affine flags and Demazure spaces over Spd O_C](#n-gs0-loop-geometry-affine-flag-demazure) (`GS0:loop-geometry/affine-flag-demazure`)
- [Rational parity and integral torsion bounds](#n-gs1-standard-costandard-torsion-bound) (`GS1/standard-costandard-torsion-bound`)
- `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`
- `ReductiveGroupsPartII:RG2.4`

**Sources.**

- [Zhu](#src-zhu), 2.7 and 2.11–2.17, pp. 434, 436–440

**Acceptance.**

- For the SL₃ highest root, the zero-weight dimension is two; the missing infinity contribution would give the wrong answer.

**Prototype boundary.** W must be the concentrated rational weight module of the specified IC object. Its MV basis and the degree-vanishing assertions require enhanced cohomology interfaces and are omitted.

**Open obligations:** gap [G0.4](#gap-g0-4) (Rational MV trace normalization on perfect models); gap [G0.5](#gap-g0-5) (Quasi-minuscule infinity contribution and minimal generation); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.10](#req-r0-10) to `ReductiveGroupsPartII:RG2.4`.

#### Mirković–Vilonen intersections

<a id="n-gs0-witt-geometry-semi-infinite-intersections-and-mv-cycles"></a>
`GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` · theorem · planet: **Mirković–Vilonen cycles**

**Lean name:** `TauCeti.GeometricSatake.mvCycleDimension`.

For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_λ∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ). The intersection dimension is ⟨ρ,μ+λ⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+λ⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.

**Hypotheses.**

- Rational ℓ-adic coefficients; IC perverse normalization [⟨2ρ,μ⟩]; choose model; no assertion of a canonical integral cycle basis.

**Proof outline.**

1. Use semi-infinite dimensions and the rational concentration theorem.
2. Apply top compact-support cohomology on fixed finite-type models and étale-topos invariance.
3. Normalize fundamental classes on those models; Zhu A.3.3 does not supply a model-independent trace under Frobenius.

**Direct prerequisites.**

- [Affine semi-infinite intersections](#n-gs1-semi-infinite-affineness) (`GS1/semi-infinite-affineness`)
- [Rational special-fibre weights](#n-gs1-rational-weight-concentration) (`GS1/rational-weight-concentration`)
- `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)

**Sources.**

- [Zhu](#src-zhu), 2.8–2.9, pp. 434–436; A.3.3, pp. 479–480

**Acceptance.**

- The nonempty torus case has one component and weight dimension one.

**Prototype boundary.** Only the normalized dimension equality is typed; the nonempty Schubert/semi-infinite intersection, MV components and rational trace model are omitted.

**Open obligations:** gap [G0.4](#gap-g0-4) (Rational MV trace normalization on perfect models); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

<a id="layer-gs2"></a>

## GS2 — Satake objects and convolution

GS2 is the aggregate of its two substages, the objects and correspondences and
their closure and duals. Every declaration is recorded once, with its
substage as parent and GS2 among the layers it realises. The aggregate
accepts coherent bounded convolution and its restriction to Satake objects. It
neither uses symmetric fusion to prove closure nor asserts that the
total-cohomology filtration has a canonical tensor splitting.

<a id="layer-gs2-correspondences"></a>

### GS2:correspondences — Objects and convolution before t-exactness

The Satake category is the full subcategory of bounded, universally locally
acyclic, relative perverse and coefficient-flat objects. Its fibre functor is
total cohomology in every degree, with finite projective locally constant
fibres: parity makes the spectral sequence of the finite semi-infinite
filtration degenerate, finite projective graded pieces give exactness, and the
lifting of split kernels and cokernels together with conservativity gives
faithfulness. An arbitrary infinite grading would not give a finite module,
and over a general leg base there is no canonical splitting or tensor
identification. Verdier duality and normalized Levi constant terms preserve
Satake objects. Convolution is first constructed in the enhanced ambient
category by the bounded proper Hecke correspondence, with a twisted exterior
tensor and coherent associator and unit maps, whose coherence is requested from
EnhancedDerivedSheaves E3 and VStackSheavesAndLisseCategories VS0 and is named
in gap [G0.6](#gap-g0-6). The rational Witt special-fibre adapter
proves semismallness and perversity with rational coefficients. Acceptance
includes the zero object, an object outside the heart, the torus sum of
skyscraper labels, and the difference between a bounded twisted product and an
untwisted one.

#### Satake category

<a id="n-gs2-correspondences-satake-category-and-fibre-functor"></a>
`GS2:correspondences/satake-category-and-fibre-functor` · definition · planet: **Satake category**

**Lean name:** `TauCeti.GeometricSatake.satakeCategory`. **Library:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS2`.

Sat^I_G(S,Λ) is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.

**Hypotheses.**

- Split integral or generic descended setting; all three conditions are required.

**Construction.**

1. Intersect the ULA subcategory with the relative perverse heart and the all-module flatness condition.
2. Use VI.7.7 and perverse descent to obtain the finite-projective constant-term characterization.
3. Use the switch and relative duality for the involution.

**Direct prerequisites.**

- [ULA Hecke complexes](#n-gs1-ula-sheaves-on-the-hecke-stack) (`GS1/ULA-sheaves-on-the-hecke-stack`)
- [Flat perverse objects](#n-gs1-flat-perverse-objects) (`GS1/flat-perverse-objects`)
- [Equivariant perverse descent and constant terms](#n-gs1-perverse-descent-and-shifted-ct) (`GS1/perverse-descent-and-shifted-ct`)
- `mathlib:CategoryTheory.Triangulated.TStructure.Heart`
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`

**Sources.**

- [FS](#src-fs), VI.7.8–VI.7.9, pp. 221–222

**Uses that shape the API.**

- FS VI.8: Convolution must preserve all three conditions.
- HeckeStacksAndLocalShtukas:HS2: Satake complexes provide the Hecke kernel coefficients.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.satakeCategory_full_subcategory` | compatibility | Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse. |
| `TauCeti.GeometricSatake.satakeCategory_inclusion` | projection | The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful. |
| `TauCeti.GeometricSatake.satakeCategory_morphisms` | characterisation | A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.satake_zero` | degenerate | A zero ULA object whose underlying object is zero belongs to Satake. |
| `TauCeti.GeometricSatake.satake_inclusion_fully_faithful` | compatibility | Morphisms agree with those in the existing Mathlib ObjectProperty full-subcategory construction. |
| `TauCeti.GeometricSatake.satake_wrong_degree` | non-example | A ULA object outside the relative perverse heart is excluded from Satake. |

**Acceptance.**

- A ULA object in the wrong perverse degree is excluded; Λ/ℓ over Λ=Z/ℓ² is excluded by flatness; the unit lies in Satake.

**Prototype boundary.** DU denotes the imported bounded-support ULA category and forgetULA its geometric inclusion. Boundedness is encoded in that input category, not in a new unknown proposition. The actual three-condition Satake subcategory uses Mathlib FullSubcategory.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Satake cohomology functor

<a id="n-gs2-correspondences-satake-fibre-functor"></a>
`GS2:correspondences/satake-fibre-functor` · construction · planet: **Satake cohomology functor**

**Lean name:** `TauCeti.GeometricSatake.satakeFibre`. **Library:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS2`.

F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification. If ker F(f)→F(A) is split, f:A→B has a kernel in Satake and F preserves it; if F(B)→coker F(f) is split, the analogous cokernel exists and is preserved. These split conditions are essential over integral coefficients and do not make Satake abelian.

**Hypotheses.**

- Bounded support; A Satake; locally constant finite projectivity is part of the result.

**Construction.**

1. Use proper support, CT filtration and flat-perverse recognition.
2. On each connected component of Gr_G, the shifted constant-term graded pieces of a Satake object are concentrated in degrees of the same parity. Hence the finite filtration spectral sequence degenerates. The graded cohomology modules are finite projective, so successive module extensions split locally and give finite-projective cohomology and exactness; this argument does not claim a canonical splitting.
3. For a morphism with a split total-cohomology kernel, the constant-term filtration identifies its perverse kernel as ULA and flat; apply the split-kernel clause of VI.7.10, and its analogous split-cokernel clause. For F(f)=0 the kernel is all F(A), hence split: conservation makes the kernel map an isomorphism, proving f=0 and faithfulness. Keep the filtration until GS3 tensor comparison.

**Direct prerequisites.**

- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Conservativity of constant terms](#n-gs1-constant-term-conservativity) (`GS1/constant-term-conservativity`)
- [Flat perverse objects](#n-gs1-flat-perverse-objects) (`GS1/flat-perverse-objects`)
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `mathlib:Module.Projective`
- `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`
- `mathlib:Module.Finite`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources.**

- [FS](#src-fs), VI.7.10–VI.7.11, pp. 222–223

**Uses that shape the API.**

- FS VI.7.10–VI.7.11: The filtered constant-term comparison proves finite projectivity and exact faithfulness.
- GS3 and GS4: The next part equips this functor with tensor compatibility and Tannakian reconstruction.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.satakeFibre_cohomology` | characterisation | The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero. |
| `TauCeti.GeometricSatake.satakeFibre_finite_projective` | structure | The total cohomology module is finite and projective over the coefficient ring. |
| `TauCeti.GeometricSatake.satakeFibre_faithful` | structure | FS VI.7.10’s split-kernel lifting together with conservativity proves faithfulness; do not infer faithfulness from conservativity alone in an exact category. |
| `TauCeti.GeometricSatake.satakeFibre_kernel` | universal-property | If ker F(f)→F(A) is a split inclusion, f has a Satake kernel and F carries its universal cone to the module kernel. |
| `TauCeti.GeometricSatake.satakeFibre_cokernel` | universal-property | If F(B)→coker F(f) is a split projection, f has a Satake cokernel and F carries its universal cocone to the module cokernel. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.fibre_torus_rank_one` | computation | A torus skyscraper with one rank-one cohomology module has total cohomology R. |
| `TauCeti.GeometricSatake.fibre_zero` | degenerate | If all cohomology modules vanish, total cohomology is the zero module. |
| `TauCeti.GeometricSatake.fibre_existing_module` | compatibility | The fibre functor targets existing ModuleCat, and projectivity is the existing Module.Projective predicate. |
| `TauCeti.GeometricSatake.fibre_unbounded_nonexample` | non-example | One copy of ℚ in every integer degree has infinite-dimensional direct sum: finite projectivity in each degree does not imply finite total cohomology without a boundedness hypothesis. |

**Acceptance.**

- For a torus skyscraper at λ, F is Λ of rank one; a noncanonical filtration splitting is not advertised as canonical.

**Prototype boundary.** S must be the actual Satake category and H the geometric cohomology functors. Finite support in degree and the CT filtration hypotheses are omitted from the finite-projectivity/faithfulness signatures. No canonical splitting or tensor identification is stated.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); gap [G0.9](#gap-g0-9) (Early coefficient scope and filtered-equivariance continuity); request [R0.21](#req-r0-21) to `EtaleDualityAndPerverseSheaves:EDC.5`.

#### Verdier duality of Satake objects

<a id="n-gs2-correspondences-satake-verdier-duality"></a>
`GS2:correspondences/satake-verdier-duality` · theorem

**Lean name:** `TauCeti.GeometricSatake.satakeVerdierBiduality`. **Also realises:** `GS2`.

Relative Verdier duality preserves Satake, the biduality map A→D(D(A)) is an isomorphism, and F(D(A)) identifies with the Λ-linear dual of F(A). Normalized Levi constant terms CT_P[deg⟨2ρ_G−2ρ_M,−⟩] preserve Satake and are transitive for nested Levis.

**Hypotheses.**

- ULA, flat perverse and bounded proper support; the normalization depends on the chosen parabolic.

**Proof outline.**

1. Use ULA dualizability and biduality from VS1.
2. Use reversed hyperbolic action, the shifted CT characterization and finite-projective module duality.
3. Use proper relative duality for F and compose parabolic correspondences for transitivity.

**Direct prerequisites.**

- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)
- [Flat perverse objects](#n-gs1-flat-perverse-objects) (`GS1/flat-perverse-objects`)
- `VStackSheavesAndLisseCategories:VS1`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `ReductiveGroupsPartII:RG2.1`
- `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources.**

- [FS](#src-fs), VI.7.12–VI.7.13, pp. 223–224

**Acceptance.**

- On a one-leg smooth cell the dual of Λ[d] is Λ[d](d); the normalized Levi shift is zero for M=G.

**Prototype boundary.** S must be Satake and dual the relative Verdier duality. Levi normalization and geometric coefficient hypotheses are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.11](#req-r0-11) to `ReductiveGroupsPartII:RG2.1`; request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### Ambient Hecke convolution

<a id="n-gs2-correspondences-convolution-diagram"></a>
`GS2:correspondences/convolution-diagram` · construction · planet: **Hecke convolution**

**Lean name:** `TauCeti.GeometricSatake.heckeConvolution`. **Library:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS2`.

The two-step Hecke stack has maps a:Hck×^{L⁺G}Hck→Hck×Hck (an L⁺G-torsor) and b to Hck (composition of modifications). On bounded support b is ind-proper with proper finite bounds. Define A⋆B=Rb_*a*(A⊠B), equivalently Rb_! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.

**Hypotheses.**

- Use the stack quotient, not a naive product; derived external tensor over Λ; bounds required for pushforward. General correspondence coherence is supplied by EDS and VS0.

**Construction.**

1. Build the stack of three torsors and two punctured isomorphisms; multiplication composes them.
2. Trivialize the intermediate torsor only locally; descent gives a and proper bounded b via GS0.
3. Apply proper base change and projection formula in the enhanced correspondence calculus, then extend across filtered support bounds.

**Direct prerequisites.**

- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Local Hecke stack](#n-gs0-loop-geometry-local-hecke-stack) (`GS0:loop-geometry/local-hecke-stack`)
- [Integral bounded Grassmannian families](#n-gs0-witt-geometry-integral-family-bounded-properness) (`GS0:Witt-geometry/integral-family-bounded-properness`)
- [Relative-position flag correspondences](#n-gs0-witt-geometry-flag-incidence-correspondences) (`GS0:Witt-geometry/flag-incidence-correspondences`)
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`
- `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`
- `EnhancedDerivedSheaves:E3`
- `VStackSheavesAndLisseCategories:VS0`
- `DiamondSixOperations:S2/exchange-pasting-coherence`

**Sources.**

- [FS](#src-fs), VI.8 opening, pp. 224–225

**Uses that shape the API.**

- FS VI.8.1: ULA, perversity and flatness are proved for this ambient operation.
- FS VI.8.2 and HS1: Proper ULA kernels provide convolution adjoints and Hecke functors.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.heckeConvolution_obj` | characterisation | A⋆B is b-star of a-pullback of the derived external product of A and B, with b proper on the chosen bounds. |
| `TauCeti.GeometricSatake.heckeConvolution_associator` | structure | The coherent correspondence calculus supplies the associator for convolution. |
| `TauCeti.GeometricSatake.heckeConvolution_unit` | structure | The unit is the identity-modification kernel and its left and right unit maps are isomorphisms. |
| `TauCeti.GeometricSatake.torusConvolutionLabels` | data | On a torus, convolution support is the Minkowski sum of the two finite coweight supports. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.convolution_unit` | degenerate | Convolving with the identity kernel returns the other kernel. |
| `TauCeti.GeometricSatake.convolution_torus_labels` | computation | For a torus, two skyscraper labels convolve to the skyscraper at their sum. |
| `TauCeti.GeometricSatake.convolution_twisted_diagram` | compatibility | The typed object formula keeps both a-star descent and b-star pushforward; substituting the external product alone does not satisfy it. |

**Acceptance.**

- The unit acts on either side; changing an intermediate trivialization does not change the resulting complex.

**Prototype boundary.** The input functors must arise from the bounded torsor correspondence. Their properness, external derived tensor, support bounds, coherent correspondence composition, and unit-kernel identifications are omitted. The arbitrary input symbols are functors, not proposition placeholders.

**Open obligations:** gap [G0.6](#gap-g0-6) (Stack enhancement and coherent Ind convolution); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.3](#req-r0-3) to `EnhancedDerivedSheaves:E3`; request [R0.19](#req-r0-19) to `VStackSheavesAndLisseCategories:VS0`.

#### Associativity and unit of convolution

<a id="n-gs2-correspondences-convolution-associativity-and-unit"></a>
`GS2:correspondences/convolution-associativity-and-unit` · theorem

**Lean name:** `TauCeti.GeometricSatake.convolutionPentagon`. **Also realises:** `GS2`.

Iterated composition supplies associator (A⋆B)⋆C≅A⋆(B⋆C), left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.

**Hypotheses.**

- Enhanced coherence, rather than equality of iterated objects; proper finite bounds and derived tensors.

**Proof outline.**

1. Use the common three-step Hecke stack and proper base-change/projection-formula isomorphisms.
2. Import coherent composition of correspondences from EDS rather than choosing unrelated associators.
3. The identity modification gives the diagonal kernel and the triangle identities.

**Direct prerequisites.**

- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- `EnhancedDerivedSheaves:E3`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/exchange-pasting-coherence`
- `VStackSheavesAndLisseCategories:VS0`

**Sources.**

- [FS](#src-fs), VI.8 opening, pp. 224–225

**Acceptance.**

- Four-fold composition must satisfy the pentagon; associativity alone is not the full monoidal API.

**Prototype boundary.** Only the standard monoidal pentagon is typed; the ambient convolution monoidal instance must be supplied by the enhanced correspondence calculus.

**Open obligations:** gap [G0.6](#gap-g0-6) (Stack enhancement and coherent Ind convolution); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.3](#req-r0-3) to `EnhancedDerivedSheaves:E3`; request [R0.19](#req-r0-19) to `VStackSheavesAndLisseCategories:VS0`.

#### Rational Witt convolution and semismallness

<a id="n-gs2-correspondences-rational-special-fibre-convolution"></a>
`GS2:correspondences/rational-special-fibre-convolution` · comparison

**Lean name:** `TauCeti.GeometricSatake.rationalConvolutionSemismall`. **Also realises:** `GS2`.

On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with Gr^n by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to Gr_{≤Σμ_i} is proper and stratified semismall: over the λ-stratum fibre dimension is ≤⟨ρ,Σμ_i−λ⟩. Hence twisted convolution of rational equivariant perverse sheaves is perverse.

**Hypotheses.**

- k algebraically closed; dominant bounds; rational coefficients; no integral coefficient-flatness inferred from this statement.

**Proof outline.**

1. Use the lattice-chain Demazure and bounded proper map.
2. Apply Zhu 2.3’s semi-infinite intersection estimate and EDC.5 semismall pushforward.
3. Identify the torsor descent of the twisted external product with the special-fibre restriction of the ambient Hecke convolution.

**Direct prerequisites.**

- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- [Rational special-fibre weights](#n-gs1-rational-weight-concentration) (`GS1/rational-weight-concentration`)
- [Witt Demazure filtration space](#n-gs0-witt-geometry-witt-demazure-resolution) (`GS0:Witt-geometry/witt-demazure-resolution`)
- `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`

**Sources.**

- [Zhu](#src-zhu), 2.1.2 and 2.2–2.4, pp. 431–432

**Acceptance.**

- For minuscule one-step bounds, twisted convolution still need not be the product of the two flag varieties.

**Prototype boundary.** These dimensions must come from the bounded rational Witt convolution map and a target stratum. Properness and coefficient restrictions are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

<a id="layer-gs2-satake-closure"></a>

### GS2:Satake-closure — Convolution closure and rigidity

Proper relative ULA kernels compose, so convolution preserves universal local
acyclicity. The nonpositive perverse bound holds for all bounded nonpositive
inputs, by the elementary two-leg collision family of FS VI.8.1(ii), cell
dévissage and normalized constant terms; duality gives the other bound, and
tensoring with every coefficient module gives flatness. The adjunction of
proper kernels then makes sw*D(A) a right dual, with evaluation and
coevaluation satisfying both triangle identities, and the switch gives the left
dual. The one-leg restriction equivalence respects bounded convolution
diagrams. This layer proves closure and both duals before fusion, without any
symmetry or tensor compatibility of the fibre functor; the atlas title "Closure
after fusion" and its edge from GS3:fusion are the subject of structural
proposals 3 and 6.

#### ULA preservation by convolution

<a id="n-gs2-satake-closure-convolution-ula"></a>
`GS2:Satake-closure/convolution-ula` · theorem

**Lean name:** `TauCeti.GeometricSatake.convolutionULAKernelDual`. **Also realises:** `GS2`.

If A and B are ULA bounded Hecke complexes, A⋆B is ULA over the leg base.

**Hypotheses.**

- Finite proper bounds; derived tensor; split and generic descended versions.

**Proof outline.**

1. Use the VS1 ULA criterion as adjointability of kernels, including the proper-relative IV.2.24 variant.
2. Compose adjointable kernels; Verdier duality commutes with bounded proper convolution.
3. Descend across the positive-loop quotient and compatible support bounds.

**Direct prerequisites.**

- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `VStackSheavesAndLisseCategories:VS1`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources.**

- [FS](#src-fs), VI.8.1(i), p. 225

**Acceptance.**

- ULA preservation does not alone imply perversity.

**Prototype boundary.** The algebraic core composes two individually right-dualizable proper relative ULA kernels. It does not assume the entire ambient category is rigid; the geometric ULA/kernel identification requires VS1.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### Nonpositive perverse convolution

<a id="n-gs2-satake-closure-convolution-perverse-nonpositive"></a>
`GS2:Satake-closure/convolution-perverse-nonpositive` · theorem

**Lean name:** `TauCeti.GeometricSatake.convolutionPerverseNonpositive`. **Also realises:** `GS2`.

For any bounded Hecke complexes A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. First reduce by ordered collision-stratum excision and cell devissage to shifted cell constants with ULA factors. For those generators an elementary two-leg family is an external product away from the diagonal; locally constant perfect torus constant terms carry the nonpositive bound to the collision fibre. This is FS VI.8.1(ii), before VI.9 symmetric fusion.

**Hypotheses.**

- Coefficient derived tensor and correct cell dimensions; this elementary family is distinct from the coherent symmetric fusion construction of VI.9.

**Proof outline.**

1. Use ordered legs, partial-diagonal excision and the defining cell inequalities to reduce the arbitrary bounded inputs to shifted cell constants. Their one-leg ULA property is supplied by VI.6.5.
2. Use the Künneth/external-product bound off the diagonal and VI.8.1(ii)’s elementary two-leg family. ULA convolution and constant-term local constancy carry the normalized bound across the collision.
3. Apply conservative shifted CT to return to G and reassemble by extensions. No GS3:fusion prerequisite is introduced.

**Direct prerequisites.**

- [ULA preservation by convolution](#n-gs2-satake-closure-convolution-ula) (`GS2:Satake-closure/convolution-ula`)
- [Equivariant perverse descent and constant terms](#n-gs1-perverse-descent-and-shifted-ct) (`GS1/perverse-descent-and-shifted-ct`)
- [Ordered legs and divisor base change](#n-gs0-loop-geometry-ordered-leg-base-change) (`GS0:loop-geometry/ordered-leg-base-change`)
- [Integral bounded Grassmannian families](#n-gs0-witt-geometry-integral-family-bounded-properness) (`GS0:Witt-geometry/integral-family-bounded-properness`)
- [ULA Hecke complexes](#n-gs1-ula-sheaves-on-the-hecke-stack) (`GS1/ULA-sheaves-on-the-hecke-stack`)
- [ULA recognition by constant terms](#n-gs1-ula-constant-term-criterion) (`GS1/ula-constant-term-criterion`)

**Sources.**

- [FS](#src-fs), VI.8.1(ii), pp. 225–226

**Acceptance.**

- A collision is tested by summed cocharacters; the proof has a geometric family but not a symmetric monoidal Satake theorem.

**Prototype boundary.** D/conv denote the full bounded-support Hecke derived category and its convolution, with the stated geometric perverse t-structure. The devissage, two-leg family and geometric identities are omitted. Inputs need not be ULA; only the reduced generators are ULA. GS3 fusion and ambient rigidity are not assumed.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Closure of Satake under convolution

<a id="n-gs2-satake-closure-convolution-preserves-satake-and-dualizability"></a>
`GS2:Satake-closure/convolution-preserves-satake-and-dualizability` · theorem · planet: **Satake convolution closure**

**Lean name:** `TauCeti.GeometricSatake.convolutionFlatPerverse`. **Also realises:** `GS2`.

Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.

**Hypotheses.**

- All Satake conditions retained; coefficients need not be fields.

**Proof outline.**

1. ULA follows from VI.8.1(i). Apply the nonpositive result to A,B and their relative Verdier duals.
2. Bounded proper convolution commutes with relative duality, so the dual nonpositive bound yields the nonnegative bound.
3. Tensor by arbitrary coefficient modules and use the flat-perverse criterion to prove coefficient flatness.

**Direct prerequisites.**

- [ULA preservation by convolution](#n-gs2-satake-closure-convolution-ula) (`GS2:Satake-closure/convolution-ula`)
- [Nonpositive perverse convolution](#n-gs2-satake-closure-convolution-perverse-nonpositive) (`GS2:Satake-closure/convolution-perverse-nonpositive`)
- [Verdier duality of Satake objects](#n-gs2-correspondences-satake-verdier-duality) (`GS2:correspondences/satake-verdier-duality`)
- [Flat perverse objects](#n-gs1-flat-perverse-objects) (`GS1/flat-perverse-objects`)

**Sources.**

- [FS](#src-fs), VI.8.1(iii), pp. 225–226

**Acceptance.**

- Over Λ=Z/ℓ² a nonflat perverse object is not admitted as a factor.

**Prototype boundary.** D/conv/tensor must be the ULA Hecke category, geometric convolution and derived coefficient tensors. Those supplier conditions are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

#### Duals of Satake objects

<a id="n-gs2-satake-closure-satake-rigidity"></a>
`GS2:Satake-closure/satake-rigidity` · theorem · planet: **Satake rigidity**

**Lean name:** `TauCeti.GeometricSatake.satakeRigid`. **Also realises:** `GS2`.

Every Satake object has both left and right duals for convolution. The right dual is sw*D(A); evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.

**Hypotheses.**

- Proper bounded support; ULA; use both left and right rigid structures in the library. No symmetry or fibre-functor monoidality is assumed.

**Proof outline.**

1. Apply FS IV.2.24 to the bounded Hecke kernel, using the proper target.
2. Use VI.6.2 switch invariance and VI.7.12 Satake Verdier duality.
3. Restrict the resulting unit/counit to Satake using convolution closure and verify adjunction triangles; conclude VI.8.2.

**Direct prerequisites.**

- [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability) (`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`)
- [Verdier duality of Satake objects](#n-gs2-correspondences-satake-verdier-duality) (`GS2:correspondences/satake-verdier-duality`)
- `VStackSheavesAndLisseCategories:VS1`
- `mathlib:CategoryTheory.RigidCategory`
- `VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources.**

- [FS](#src-fs), VI.8.2, p. 226; IV.2.24, pp. 125–126

**Acceptance.**

- The dual is sw*D(A), not D(A) without switching; it supplies GS3’s later fusion argument.

**Prototype boundary.** S must be the actual Satake category with its convolution structure. Both duals are asserted; the switch-pullback Verdier formula is in the document.

**Open obligations:** gap [G0.6](#gap-g0-6) (Stack enhancement and coherent Ind convolution); gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module); request [R0.20](#req-r0-20) to `VStackSheavesAndLisseCategories:VS1`.

#### One-leg Satake equivalence

<a id="n-gs2-satake-closure-one-leg-satake-comparison"></a>
`GS2:Satake-closure/one-leg-satake-comparison` · comparison

**Lean name:** `TauCeti.GeometricSatake.oneLegSatakeComparison`. **Also realises:** `GS2`.

The one-leg ULA restriction equivalence over Spd O_C restricts to equivalences of flat-perverse Satake categories on the generic and Witt special fibres. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.

**Hypotheses.**

- Split integral model; chosen C and k̄; the comparison is not asserted for arbitrary multi-leg collision ULA categories.

**Proof outline.**

1. Use t-exact base change and the all-module tensor criterion on the ULA equivalence.
2. Compare the actual torsor convolution diagrams through the integral family and proper base change.
3. Compare switch, Verdier duality and the unit by their functorial constructions.

**Direct prerequisites.**

- [One-leg ULA special/generic comparison](#n-gs1-integral-family-comparison) (`GS1/integral-family-comparison`)
- [Equivariant perverse descent and constant terms](#n-gs1-perverse-descent-and-shifted-ct) (`GS1/perverse-descent-and-shifted-ct`)
- [Duals of Satake objects](#n-gs2-satake-closure-satake-rigidity) (`GS2:Satake-closure/satake-rigidity`)
- [Associativity and unit of convolution](#n-gs2-correspondences-convolution-associativity-and-unit) (`GS2:correspondences/convolution-associativity-and-unit`)
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`

**Sources.**

- [FS](#src-fs), VI.6.7, VI.7.4–VI.7.8 and VI.8, pp. 214, 217–226

**Acceptance.**

- The special-fibre comparison imports early L1/L3, without requiring VS3 lisse categories.

**Prototype boundary.** These are the indicated one-leg flat-perverse ULA categories; the base change geometry and diagram compatibility are omitted.

**Open obligations:** gap [G0.7](#gap-g0-7) (Typed geometric signatures and unavailable prebuilt line module).

<a id="layer-gs3"></a>

## GS3 — Fusion, symmetry and finite-set functoriality

GS3 is the aggregate of GS3:fusion; its targets are realised by the fusion
declarations below.

<a id="layer-gs3-fusion"></a>

### GS3:fusion — Coherent collision and factorization maps

A partition b : I → K has a blockwise disjoint open U_b: divisors in different
blocks are distinct, while divisors in the same block may collide. Its
completed rings split over blocks, and so do the local Grassmannians and Hecke
stacks; this is the factorization open for iterated fusion, rather than the
smaller open on which all legs are distinct. Restriction to U_b is fully
faithful: the complement is filtered by smooth partial diagonals of positive
codimension, purity puts their contribution in degrees ≥ 2 for locally
constant complexes, and conservative t-exact constant terms transport this to
the relative perverse category, so A ≅ pH⁰(Rj_*j*A). This gives uniqueness;
existence of the extension comes from the proper chain of modifications
E₀ → ⋯ → E_k, whose pushforward Rm_*(⊗_a p_a*A_a) restricts to the exterior
product on U_b and is ULA and flat perverse by the closure and duality results
of GS2:Satake-closure. Nothing here uses the characteristic-zero decomposition
theorem.

Parity is constant along closure relations, because dominance differences are
sums of simple coroots α^∨ and ⟨2ρ,α^∨⟩ = 2, so the even and odd loci are open and
closed. Multiplying the geometric commutativity on homogeneous summands by
(−1)^{ε(A)ε(B)} turns the graded Koszul flip seen by total cohomology into the
ordinary flip on ungraded modules, so the reconstructed group is an ordinary
group. For α : I → J, the diagonal Δ_α repeats each divisor on its fibre;
pulling back along the base change of the Grassmannian to (Div¹)^J and pushing
forward along the closed immersion into Gr^J_G merges the modifications of each
fibre and inserts the unit at empty fibres. The identity and composition
comparisons, associativity and permutation equations are checked on the
disjoint locus and extended by full faithfulness; the operadic packaging is
imported from EnhancedDerivedSheaves. The Drinfeld realization (FS IV.7.3)
applies to locally constant perfect complexes; its degree-zero finite
projective case identifies local systems on (Div¹)^I with continuous
representations of W_E^I. Shifted constant terms are symmetric monoidal for
corrected fusion and transitive with additive shifts, and Verdier duality and
reversal keep their evaluation and coevaluation data.

#### Disjoint-leg locus

<a id="n-gs3-fusion-disjoint-leg-locus"></a>
`GS3:fusion/disjoint-leg-locus` · definition · planet: **Disjoint-leg factorization**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For a finite set I partitioned by b:I→K, define U_b ⊂ (Div¹_X)^I by x_i ≠ x_j whenever b(i) ≠ b(j). It allows coincidences inside one block. Pull the existing local Hecke stack and Satake category back to U_b; denote restriction by j_b*. On U_b, completion along the union of block divisors is the product of the block completions, giving the factorization of Grassmannians and local Hecke stacks.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use the divisor product equation and invertibility of distinct divisor ideals to split the completed rings, then the loop quotient and torsor descriptions.
2. An ordered partition gives the same open independently of its ordering; this construction commutes with base change.

**Direct prerequisites.**

- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`
- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- [Ordered legs and divisor base change](#n-gs0-loop-geometry-ordered-leg-base-change) (`GS0:loop-geometry/ordered-leg-base-change`)
- [Local Hecke stack](#n-gs0-loop-geometry-local-hecke-stack) (`GS0:loop-geometry/local-hecke-stack`)

**Sources.**

- [FS](#src-fs), VI.9 pp226–227; VI.0 p189. Exact defining condition of the blockwise disjoint locus and factorization.

**Uses that shape the API.**

- FS VI.9.3–9.4: The exterior product is first defined on this precise open, and convolution supplies its extension.
- HeckeStacksAndLocalShtukas:HS4: Blockwise factorization must remain valid during repeated collisions within blocks.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.disjointLegLocus` | constructor | For b:I→K and X=Div¹_X, U_b is the subfunctor of X^I satisfying the cross-block inequality. |
| `TauCeti.GeometricSatake.disjointLegLocus_mem` | characterisation | A geometric tuple x lies in U_b iff b(i)≠b(j) implies x_i≠x_j for all i,j. |
| `TauCeti.GeometricSatake.disjointLegLocus_reindex` | functoriality | A bijection of leg sets carries U_b to U_{b∘e}, compatibly with identity and composition. |
| `TauCeti.GeometricSatake.disjointLegLocus_baseChange` | compatibility | Pullback of U_b under S→(Div¹_X)^I is precisely the same cross-block condition on S. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_disjoint_oneBlock` | degenerate | A constant block map gives U_b=X^I. |
| `TauCeti.GeometricSatake.test_disjoint_twoSingletons` | computation | For two singleton blocks, U_b={(x,y):x≠y}. |
| `TauCeti.GeometricSatake.test_disjoint_internalCollision` | non-example | For blocks {1,2} and {3}, (x,x,y) with x≠y lies in U_b; the full pairwise-disjoint locus would reject it. |

**Acceptance.**

- One block gives the whole leg base.
- Singleton blocks exclude every collision, while a two-element block allows its internal diagonal.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures).

#### Restriction across collision diagonals

<a id="n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness"></a>
`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness` · theorem · planet: **Collision extension uniqueness**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For the blockwise disjoint inclusion j_b, restriction j_b*:Sat^I_G(Λ)→Sat_G(U_b,Λ) is fully faithful, and so is restriction of finite projective local systems on the leg base. Every Satake object satisfies A ≅ pH⁰(Rj_b*j_b*A). This is uniqueness and reconstruction for objects already extending; full faithfulness alone asserts no essential surjectivity.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Filter the complement by smooth partial diagonals of positive ℓ-codimension. Purity makes their i*i! on locally constant perfect complexes lie in degrees ≥2.
2. The conservatively detecting, t-exact constant-term functors reduce the required perverse bound to that local-system bound.
3. Apply the open–closed triangle and perverse truncation to obtain the reconstruction and Hom isomorphisms.

**Direct prerequisites.**

- [Disjoint-leg locus](#n-gs3-fusion-disjoint-leg-locus) (`GS3:fusion/disjoint-leg-locus`)
- [Relative perverse t-structure](#n-gs1-relative-perverse-t-structure) (`GS1/relative-perverse-t-structure`)
- [Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) (`GS1/semi-infinite-orbits-and-hyperbolic-localization`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- `VStackSheavesAndLisseCategories:VS1`
- [Equivariant perverse descent and constant terms](#n-gs1-perverse-descent-and-shifted-ct) (`GS1/perverse-descent-and-shifted-ct`)

**Sources.**

- [FS](#src-fs), Proposition VI.9.3 pp227–228. Proves the two full-faithfulness assertions by partial diagonal bounds; reconstruction follows in the proof.

**Acceptance.**

- For two legs the diagonal has codimension one and contributes starting in degree two.
- A codimension-zero closed component would invalidate the argument; arbitrary restrictions of arbitrary categories are not fully faithful.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.1](#req-r3-1) to `VStackSheavesAndLisseCategories:VS1`.

#### Satake support parity

<a id="n-gs3-fusion-support-parity"></a>
`GS3:fusion/support-parity` · definition · planet: **Satake parity**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

The parity of a Schubert tuple μ• is ε(μ•)=Σ_i⟨2ρ,μ_i⟩ mod 2 in Z/2. Differences along dominance are sums of coroots, whose pairing with 2ρ is even, so parity is constant on a connected-component stratum and defines an open-and-closed even/odd decomposition of the local Hecke stack. For mixed-parity objects use their canonical summands. The correction scalar for homogeneous A,B is (-1)^{ε(A)ε(B)}.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use ⟨2ρ,α∨⟩=2 for each simple coroot and dominance differences to prove constancy on closure relations.
2. Disjoint unions add dimensions and hence add parity. Apply the sign separately to the four pairs of canonical summands.

**Direct prerequisites.**

- `ReductiveGroupsPartII:RG2.5`
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- `mathlib:RootPairing`

**Sources.**

- [FS](#src-fs), VI.9 pp228–229. The parity decomposition and exact commutativity correction.

**Uses that shape the API.**

- FS VI.9.4: Cancels the Koszul sign seen by total cohomology so that the fibre functor has the ordinary symmetric target.
- Classical comparison: The same component parity corrects the alternating Frobenius trace of a perverse shift.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.supportParity` | data | The degree sum reduced modulo two, equivalently the dimension parity on each component. |
| `TauCeti.GeometricSatake.supportParity_dominance` | characterisation | Comparable dominant Schubert tuples have equal parity. |
| `TauCeti.GeometricSatake.supportParity_union` | compatibility | Parity on a disjoint union is the sum of the two parities in Z/2. |
| `TauCeti.GeometricSatake.fusionSign` | data | For e,f∈Z/2, the correction is (-1)^{ef}; it is a bicharacter. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_parity_unit` | degenerate | The zero-cocharacter unit has parity zero. |
| `TauCeti.GeometricSatake.test_sign_oddOdd` | computation | The correction on two odd summands is -1. |
| `TauCeti.GeometricSatake.test_sign_evenOdd` | computation | The correction on an even and an odd summand is +1; reducing coefficient rings modulo two makes both signs equal. |

**Acceptance.**

- An odd-dimensional minuscule Schubert object is odd even when its ungraded fibre has even rank.
- Parity is additive; an odd/odd swap has scalar -1.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Fusion product and ordinary symmetry

<a id="n-gs3-fusion-fusion-product-and-sign-rule"></a>
`GS3:fusion/fusion-product-and-sign-rule` · construction · planet: **Fusion product**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For blocks I=⊔_a I_a and A_a∈Sat^{I_a}_G(Λ), use the chain of modifications E_0→⋯→E_k, projections p_a to the a-th modification and composition m. Define the fusion object *_{a}A_a=Rm_*(⊗_a p_a*A_a). The construction is ULA, bounded and flat perverse and restricts to ⊠_a A_a on U_b. It is independent of the order by full faithfulness. Pull back along the duplicated-leg diagonal to obtain the tensor product on Sat^I. Modify its geometric commutativity by (-1)^{ε(A)ε(B)}. This gives a symmetric monoidal structure refining the existing convolution, with total cohomology F^I strong symmetric monoidal into ordinary, ungraded finite projective Weil representations.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Construct the proper chain-composition correspondence, whose restriction to disjoint blocks is an isomorphism. ULA stability comes from the IV.2 correspondence criterion.
2. Apply constant terms: their total pushforward is locally constant perfect and agrees on the disjoint locus with the degree-zero finite-projective exterior product. Density and VI.7.7 imply flat perversity.
3. Use VI.9.3 for uniqueness of associativity, commutativity and unit comparisons; all relations hold after disjoint restriction.
4. Total cohomology carries the geometric flip to the graded Koszul flip. The component correction cancels that sign and preserves hexagon, involution and unit laws.

**Direct prerequisites.**

- [Restriction across collision diagonals](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness) (`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`)
- [Satake support parity](#n-gs3-fusion-support-parity) (`GS3:fusion/support-parity`)
- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability) (`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`)
- `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- `mathlib:CategoryTheory.SymmetricCategory`
- `mathlib:CategoryTheory.Functor.Braided`
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)
- [Associativity and unit of convolution](#n-gs2-correspondences-convolution-associativity-and-unit) (`GS2:correspondences/convolution-associativity-and-unit`)

**Sources.**

- [FS](#src-fs), Definition/Proposition VI.9.4 pp228–230. Actual extension via convolution, flat-perverse proof and coherent sign-corrected tensor structure.

**Uses that shape the API.**

- FS VI.10.1–10.3: Tensor compatibility and the product of bounded left-adjoint generators construct the multi-leg Hopf algebra.
- ExcursionOperatorsAndSpectralAction: Coherent multi-leg tensor symmetry supplies representations with colliding labels, without semisimplicity.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.fusionProduct` | constructor | The proper chain-composition pushforward for a finite ordered partition. |
| `TauCeti.GeometricSatake.fusionProduct_restrict` | compatibility | Its restriction to U_b is canonically the exterior tensor product. |
| `TauCeti.GeometricSatake.fusionTensor` | structure | Duplicate legs and diagonal pullback give the internal tensor, canonically isomorphic to convolution. |
| `TauCeti.GeometricSatake.fusionBraiding` | structure | Geometric block permutation multiplied on homogeneous summands by (-1)^{ε(A)ε(B)}. |
| `TauCeti.GeometricSatake.fibreFusionIso` | compatibility | F(A*B) ≅ F(A)⊗F(B), respecting the ordinary symmetry, unit and associativity constraints. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_fusion_unit` | degenerate | Fusion with the unit is isomorphic to the original object. |
| `TauCeti.GeometricSatake.test_fusion_disjoint` | compatibility | On two distinct divisors fusion is the exterior product, with no additional extension summand supported on the diagonal. |
| `TauCeti.GeometricSatake.test_fusion_oddSymmetry` | non-example | For two odd objects F sends corrected braiding to the ordinary flip; the uncorrected braiding gives its negative when 2 is invertible. |

**Acceptance.**

- For one block recover A itself, and tensor with the zero-modification unit is the original object.
- Odd/odd braiding is the negative of the geometric flip; after F it is the ordinary flip.
- The construction uses neither rational decomposition nor rational reductivity.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures).

#### CoCartesian finite-set functoriality

<a id="n-gs3-fusion-finite-set-functoriality-and-constant-terms"></a>
`GS3:fusion/finite-set-functoriality-and-constant-terms` · construction · planet: **Finite-set fusion**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For a map α:I→J, let Δ_α:(Div¹)^J→(Div¹)^I repeat the j-th divisor on its inverse-image block. Pull back along Gr^I_G ×_(Div¹)^I (Div¹)^J → Gr^I_G and push forward along the natural closed immersion Gr^I_G ×_(Div¹)^I (Div¹)^J ↪ Gr^J_G. Descending the required loop equivariance defines α_!:Sat^I→Sat^J; the closed immersion is on Grassmannians, not on quotient Hecke stacks. This merges each fibre of α and inserts unit modifications at empty fibres. For permutations it relabels legs, and for disjoint unions it respects exterior fusion. Canonical identity and composition comparisons satisfy the finite-set coherence relations. Together with exterior fusion they give the coCartesian family of symmetric monoidal Satake categories over finite sets.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use the diagonal base-change square and its closed Grassmannian immersion to define pull-push, check loop equivariance and descend to the Satake categories. Directly check compositional base change; do not replace this diagram by a closed immersion of quotient Hecke stacks.
2. Compare composite collision orders on the locus of distinct relevant divisors and use VI.9.3 to extend the comparison uniquely.
3. Every coherence diagram reduces to the same disjoint-locus permutation/composition identity; include empty fibres with the unit. Use the imported operadic language to package these comparisons.

**Direct prerequisites.**

- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Restriction across collision diagonals](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness) (`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`)
- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- [Ordered legs and divisor base change](#n-gs0-loop-geometry-ordered-leg-base-change) (`GS0:loop-geometry/ordered-leg-base-change`)
- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)

**Sources.**

- [FS](#src-fs), VI.9 pp226–227, including the footnote p227; Proposition VI.9.4 pp228–229. The diagonal pull-push defines arbitrary finite-set maps; the exterior fusion comparison and its symmetry/coherence follow from VI.9.3–VI.9.4.

**Uses that shape the API.**

- ExcursionOperatorsAndSpectralAction:ES6–ES7: Excursions use arbitrary label maps, their compositions and unit insertions.
- HeckeStacksAndLocalShtukas:HS4: Repeated collisions and disjoint unions require coherent families of comparison maps.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.collisionFunctor` | functoriality | The functor α_! associated to any map α:I→J, including empty fibres. |
| `TauCeti.GeometricSatake.collisionFunctor_id` | simp | The identity-map functor is canonically isomorphic to identity. |
| `TauCeti.GeometricSatake.collisionFunctor_comp` | functoriality | (β∘α)_! ≅ α_! followed by β_!, with coherent associativity. |
| `TauCeti.GeometricSatake.collisionFunctor_comp_assoc` | compatibility | For I→J→K→L, the two composition comparisons from the composite functor to the iterated functors agree after the functor associator; retain the full enhanced finite-set coherence. |
| `TauCeti.GeometricSatake.collisionFunctor_union` | compatibility | Disjoint union of maps commutes with exterior fusion, including its corrected permutations. |
| `TauCeti.GeometricSatake.collisionFunctor_unitInsertion` | constructor | An unused target leg is assigned the zero-modification tensor unit. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_collision_threeLegs` | characterisation | The two orders merging three legs to one give the canonical associativity comparison, whose pentagon commutes. |
| `TauCeti.GeometricSatake.test_collision_permutation` | computation | A transposition followed by itself gives the identity relabeling functor and comparison. |
| `TauCeti.GeometricSatake.test_collision_emptyFibre` | degenerate | The map ∅→{1} sends the coefficient unit to the zero-modification object, rather than zero. |

**Acceptance.**

- Three legs colliding successively agree with their single simultaneous collision.
- Permutation inverse/identity comparisons are inverse, and inserting then forgetting a unit leg is identity.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures).

#### Weil realization of total cohomology

<a id="n-gs3-fusion-drinfeld-fibre-realization"></a>
`GS3:fusion/drinfeld-fibre-realization` · theorem

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For every finite I, finite projective local systems on (Div¹_X)^I are equivalent to continuous finite projective Λ-representations of W_E^I. Under this equivalence F^I is total cohomology on the Grassmannian over its leg base. It is faithful and conservative and has the inherited split-exact behaviour of VI.7.10, is symmetric monoidal for corrected fusion, and has the collision/permutation coherences. The Drinfeld statement is for locally constant perfect complexes, not all étale complexes or an assertion that fundamental groups commute with products.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Import IV.7.3 in its DLc form. Restrict to finite-projective local systems in degree zero to obtain VI.9.2.
2. Apply VI.7.10 to the total cohomology functor and VI.9.4 to tensor comparison; cohomological grading is forgotten only after its parity sign is accounted for.

**Direct prerequisites.**

- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- `VStackSheavesAndLisseCategories:VS1`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`
- `mathlib:Representation`
- `mathlib:Module.Projective`
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)

**Sources.**

- [FS](#src-fs), Proposition VI.9.2 p226; Proposition IV.7.3 pp165–166 (full faithfulness begins p164). Combines the exact DLc Drinfeld equivalence with the finite-projective degree-zero specialization.

**Acceptance.**

- For I=∅ the target is finite projective Λ-modules.
- For singleton I the action is the local Weil action, and for multiple legs the source is W_E^I, not its diagonal copy.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.2](#gap-g3-2) (Drinfeld and Frobenius convention adapter); request [R3.1](#req-r3-1) to `VStackSheavesAndLisseCategories:VS1`; request [R3.2](#req-r3-2) to `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

#### Symmetric constant terms

<a id="n-gs3-fusion-symmetric-constant-term"></a>
`GS3:fusion/symmetric-constant-term` · theorem · planet: **Symmetric constant terms**

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

For a parabolic P with Levi M, CT_P[deg_P]:Sat^I_G(Λ)→Sat^I_M(Λ) is symmetric monoidal for corrected fusion, commutes with F^I, and is transitive for nested parabolics with the sum of the degree shifts. It respects arbitrary finite-set collision functors, disjoint unions and permutations, with identity, composition and transitivity coherences. The degree is componentwise ⟨2ρ_G−2ρ_M,μ⟩; omission of it changes the weight degrees.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Use VI.7.13 for landing, degrees and transitivity. Off the collision diagonals the assertion is Künneth and blockwise hyperbolic localization.
2. Use full faithfulness to extend the comparisons and all their equations. Cohomology-degree parity ensures the modified symmetry matches on G and M.

**Direct prerequisites.**

- [Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) (`GS1/semi-infinite-orbits-and-hyperbolic-localization`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- [Restriction across collision diagonals](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness) (`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`)
- `ReductiveGroupsPartII:RG2.5`
- [Verdier duality of Satake objects](#n-gs2-correspondences-satake-verdier-duality) (`GS2:correspondences/satake-verdier-duality`)
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)

**Sources.**

- [FS](#src-fs), Proposition VI.9.6 p230; VI.7.13 pp223–224. Precise shifted constant-term compatibility, proved after restriction to disjoint legs.
- [Zhu](#src-zhu), Proposition 2.36 and the following paragraph, p454. States, for the rational Witt category, that the weight functor has a unique monoidal structure compatible with the isomorphism of Corollary 2.10 and is then a tensor functor. Zhu indicates that existence follows from the torus-equivariant cohomology argument of his earlier work, relative to his own monoidal structure on H*; this packet obtains the statement by transporting this node, in the rational Witt equivalence node.

**Acceptance.**

- For P=G the functor is identity.
- For T⊂M⊂G the two-step weight functor agrees with the direct one with its summed degree shift.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Fusion and Verdier duality

<a id="n-gs3-fusion-fusion-verdier-duality"></a>
`GS3:fusion/fusion-verdier-duality` · theorem

**Library:** `TauCeti/GeometricSatake/Fusion`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS3`.

The inversion/reversal sw* is symmetric monoidal for fusion and F^I sw* ≅ F^I. Verdier duality D is a contravariant symmetric monoidal involution, D sw* ≅ sw* D and F^I D ≅ (F^I)^∨. The internal tensor dual of A is sw*D(A). These identifications retain their evaluation, coevaluation and finite-set coherence data; sw* itself need not be identity.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. VI.8.2 supplies convolution duals before fusion; VI.7.12 supplies F(D A)=F(A)^∨.
2. VI.9.4 promotes them through the canonical convolution/fusion comparison. F(sw*A)=F(A) and full faithfulness yield the symmetric involution and its duality coherences.

**Direct prerequisites.**

- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability) (`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- `mathlib:CategoryTheory.LeftRigidCategory`
- [Verdier duality of Satake objects](#n-gs2-correspondences-satake-verdier-duality) (`GS2:correspondences/satake-verdier-duality`)
- [Duals of Satake objects](#n-gs2-satake-closure-satake-rigidity) (`GS2:Satake-closure/satake-rigidity`)

**Sources.**

- [FS](#src-fs), Corollary VI.9.5 pp229–230; VI.8.2 pp225–226. States the fibre-dual comparison and derives the symmetric involutions from existing rigidity.

**Acceptance.**

- A torus weight μ is inverted by sw* and internal dual, with the corresponding dual local system.
- The PGL2 minuscule case distinguishes a symmetric Verdier pairing from the alternating SL2 pairing used in VI.12.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures).

<a id="layer-gs4"></a>

## GS4 — Tannakian reconstruction and the Weil action

GS4 is the aggregate of its three substages. Its declarations follow in three
blocks: the reconstruction of the Satake group (part of
GS4:integral-dual-group), the rational layer GS4:rational-reductivity, and
the identification of the dual group with its normalizations and exports (the
rest of GS4:integral-dual-group), followed by GS4:classical-Satake-comparison.

<a id="layer-gs4-integral-dual-group"></a>

### GS4:integral-dual-group — Reconstruction and normalized functoriality, first part: reconstruction of the Satake group

Bounded support is essential. For a finite downward-closed Galois-stable bound
W, the restricted fibre functor has a left adjoint L_W, and X_W = L_W(1) is its
bounded generator; linearity over local systems gives L_W(V) = X_W ⊗ V. The
proof works at finite ℓ-power levels and uses a uniform torsion bound for the
kernel and cokernel of the standard-to-costandard comparison. Enlarging W to W′
gives a map X_W′ → X_W, and dually a forward map of dual fibres; the monad on
finite pieces uses F(X_W), while the coordinate coalgebra uses its dual, and
reversing the two gives the wrong reconstruction. The MC.6 chain assembles
H = colim_W F(X_W)^∨ in the relative Ind category, obtains a commutative
bialgebra structure from fusion and an antipode from rigidity. Its comparison
category consists of comodules whose underlying object is a finite projective
continuous Weil representation; the relevant coequalizers are F-split, and
their existence, preservation and reflection are verified separately (gap
[G3.3](#gap-g3-3)). This applies the foundational criterion; it is not a second
Tannakian theory.

#### Bounded left adjoints

<a id="n-gs4-integral-dual-group-tannakian-left-adjoint"></a>
`GS4:integral-dual-group/tannakian-left-adjoint` · construction

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Let W_i⊂X_*(T)^+ be a finite downward-closed Galois-stable bound for each leg and C_W⊂Sat^I its full bounded-support category. The restriction F_W:C_W→Rep_{W_E^I}^{fp}(Λ) has a left adjoint L_W. Put X_W=L_W(1). For each finite projective Weil representation V, L_W(V)≅X_W⊗V (the LocSys action), naturally in V and the bounds. For product bounds, X_{W•} is the fusion product of the singleton X_{W_i}. These are Satake generators, not their dual coordinate coalgebras.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Reduce to Λ killed by ℓ^c and single-leg bounds using fusion. On the perverse category apply the adjoint functor theorem to total cohomology.
2. Use the standard/costandard objects, their projective stalks and the uniform ℓ-power bound on the kernel/cokernel of Δ_μ→∇_μ in VI.7.5 to show the representing object is ULA and flat perverse. The bound is independent of coefficient reduction.
3. Use the LocSys tensor action to identify L_W(V), and tensor the singleton adjunctions to identify the multileg generator.

**Direct prerequisites.**

- [Weil realization of total cohomology](#n-gs3-fusion-drinfeld-fibre-realization) (`GS3:fusion/drinfeld-fibre-realization`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- `EnhancedDerivedSheaves:E5:presentability/presentable-categories`
- `mathlib:CategoryTheory.Adjunction`
- [Standard and costandard objects](#n-gs1-standard-costandard-objects) (`GS1/standard-costandard-objects`)
- [Rational parity and integral torsion bounds](#n-gs1-standard-costandard-torsion-bound) (`GS1/standard-costandard-torsion-bound`)
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)

**Sources.**

- [FS](#src-fs), Proposition VI.10.1 pp230–232. The bounded left adjunction, LocSys linearity, fusion of generators and coefficient control.

**Uses that shape the API.**

- FS VI.10.2–10.3: The dual fibres of bounded representing objects form the relative coordinate Hopf algebra.
- MC.6 relative-finite-piece-reconstruction: Provides the precise representing objects required by the single-owner abstract criterion.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.boundedLeftAdjoint` | constructor | The functor L_W left adjoint to F_W. |
| `TauCeti.GeometricSatake.boundedLeftAdjunction` | universal-property | Hom(L_W V,A) ≅ Hom(V,F_W A), naturally in V and A, with triangle identities. |
| `TauCeti.GeometricSatake.boundedGenerator` | data | X_W=L_W(1) in the bounded Satake category. |
| `TauCeti.GeometricSatake.boundedLeftAdjoint_tensor` | compatibility | L_W(V) ≅ X_W⊗V, coherently for the LocSys action. |
| `TauCeti.GeometricSatake.boundedGenerator_fusion` | compatibility | For product bounds the generator is the fusion of singleton generators. |
| `TauCeti.GeometricSatake.boundedGenerator_enlarge` | functoriality | For W⊂W′, representability gives X_W′→X_W after the bounded objects are included in Satake. The dual fibre map is (F X_W)^∨→(F X_W′)^∨, the forward arrow in the coordinate-coalgebra diagram. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_generator_zeroBound` | degenerate | For a bound containing only weight zero, the generator is the unit with fibre Λ. |
| `TauCeti.GeometricSatake.test_generator_productBound` | compatibility | Two singleton generators fuse to the generator for their product bound, including its adjunction map. |
| `TauCeti.GeometricSatake.test_generator_dualOrientation` | non-example | The finite-piece coordinate coalgebra is (F_W X_W)^∨, not F_W X_W. For W⊂W′ its transition map points (F X_W)^∨→(F X_W′)^∨, opposite to X_W′→X_W. |

**Acceptance.**

- For the zero-weight bound X_W is the unit.
- Enlarging bounds gives compatible representing maps; it does not assert a single finite object represents the unbounded functor.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.3](#gap-g3-3) (Bounded adjunction coefficient and coequalizer verification).

#### Relative Tannaka hypotheses for Satake

<a id="n-gs4-integral-dual-group-relative-tannaka-hypotheses"></a>
`GS4:integral-dual-group/relative-tannaka-hypotheses` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

With A=Rep_{W_E^I}^{fp}(Λ), C=Sat^I_G(Λ), corrected tensor and F^I, verify the hypotheses of MC.6 relative reconstruction: A is rigid symmetric, C is symmetric A-linear, F is strong symmetric A-linear and conservative, C admits coequalizers of F-split pairs and F reflects and preserves these coequalizers, and bounded full subcategories form a filtered cover stable under the A-action and those coequalizers, with restricted F represented by X_W. Sat^I over a general ring is not asserted to be an abelian category.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. F-split diagrams are split after total cohomology. VI.7.10 constructs the relevant kernel/cokernel Satake objects when fibres split or are direct summands, so their coequalizers remain flat perverse and their fibres give the split quotient.
2. Bounds remain bounded under those coequalizers and the LocSys action; enlargement makes the cover filtered. Apply the bounded adjunction to produce the finite-piece monad.
3. Check preservation as well as reflection for the executable MC adapter; the source leaves preservation implicit, so this verification is a separate recorded proof obligation.

**Direct prerequisites.**

- [Bounded left adjoints](#n-gs4-integral-dual-group-tannakian-left-adjoint) (`GS4:integral-dual-group/tannakian-left-adjoint`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) (`GS3:fusion/fusion-verdier-duality`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability) (`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`)
- `MotivesAndAlgebraicCycles:MC.6/relative-finite-piece-reconstruction`
- `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`
- `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`
- `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`
- `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`
- `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`
- `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)

**Sources.**

- [FS](#src-fs), VI.10.2–10.3 pp232–235; VI.7.10 pp222–223. Matches the abstract MC chain and identifies the preservation hypothesis needing verification.

**Acceptance.**

- The relative base A retains all Weil local systems; it is not replaced by Vect or assumed semisimple.
- A nonsplit exact sequence of finite projective coefficient modules is not treated as an unrestricted cokernel construction in Satake.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.3](#gap-g3-3) (Bounded adjunction coefficient and coequalizer verification).

#### Geometric Satake coordinate Hopf algebra

<a id="n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra"></a>
`GS4:integral-dual-group/geometric-coordinate-hopf-algebra` · construction · planet: **Satake coordinate Hopf algebra**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Apply the imported MC.6 relative reconstruction to Satake. In Ind(A), define H^I_Λ=colim_W (F_W X_W)^∨. It has a canonical commutative bialgebra structure from tensor products and an antipode from Satake rigidity. The comparison is a symmetric equivalence Sat^I_G(Λ)≃Comod_{A,underlying A}(H^I_Λ). Forgetting W_E^I gives an ordinary flat coordinate Hopf algebra and hence an affine flat group scheme G^∨,I_Λ. This reconstructs H from the Satake category; the baseline known-Hopf tensorAutFunctor is only a compatibility comparison once H is constructed.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use the four exact MC.6 nodes for finite-piece reconstruction, filtered coalgebra assembly, multiplication and antipode. Do not replan those abstract theorems here.
2. Each dual fibre is finite projective; its filtered colimit is flat. Tensor compatibility yields commutativity and unit/counit; rigidity supplies the antipode equations.
3. The comparison restricts to comodules whose underlying object lies in A, precisely retaining finite projectivity and continuous Weil action. Compare with the existing known-Hopf reconstruction only after extending to a field where its hypotheses hold.
4. Apply the corrected VI.10.2 wording: obtain a bialgebra first, then an antipode on H under rigidity; do not apply an inverse to the base category A. See the known source slips recorded below.

**Direct prerequisites.**

- [Relative Tannaka hypotheses for Satake](#n-gs4-integral-dual-group-relative-tannaka-hypotheses) (`GS4:integral-dual-group/relative-tannaka-hypotheses`)
- `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`
- `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`
- `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `mathlib:HopfAlgebra`
- `mathlib:Bialgebra`
- `tauceti:TauCeti.AffineGroupSchemeCat`
- `tauceti:TauCeti.Tannaka.tensorAutFunctor`
- `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`
- `mathlib:CategoryTheory.Limits.HasColimit`

**Sources.**

- [FS](#src-fs), Propositions VI.10.2–VI.10.3 pp232–235. Relative reconstruction and its application; the coordinate object uses the dual of the bounded represented fibre.

**Uses that shape the API.**

- FS VI.11.1: The affine group whose geometric fibre and integral model must be identified.
- Normalized Satake equivalence: Comodule reconstruction supplies the finite-projective representation category before pinned identification.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.satakeCoordinateHopf` | constructor | H^I_Λ is the filtered colimit of dual bounded-generator fibres, with its commutative Hopf structure. |
| `TauCeti.GeometricSatake.satakeCoaction` | data | Every A has its functorial H-coaction on F^I(A). |
| `TauCeti.GeometricSatake.satakeComoduleEquivalence` | equivalence | The comparison is a symmetric equivalence with H-comodules whose underlying object is in A. |
| `TauCeti.GeometricSatake.satakeCoordinateHopf_tensor` | structure | Tensor of coactions uses the Hopf multiplication, and the unit coaction uses its unit. |
| `TauCeti.GeometricSatake.satakeCoordinateHopf_antipode` | compatibility | The coaction on the internal dual is obtained using the antipode; both antipode identities hold. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_hopf_trivialGroup` | degenerate | For the trivial G, H=Λ and the geometric affine group is the trivial group. |
| `TauCeti.GeometricSatake.test_hopf_torus` | computation | For split T, H=Λ[X_*(T)], with Δ(e^μ)=e^μ⊗e^μ and counit(e^μ)=1. |
| `TauCeti.GeometricSatake.test_hopf_torusAntipode` | computation | The torus antipode sends e^μ to e^{-μ}; using the identity antipode fails for a nonzero G_m weight. |

**Acceptance.**

- Weight-zero bounds contribute the coefficient unit; a split torus gives Λ[X_*(T)].
- The antipode restricts to e^μ↦e^{-μ} for a torus.
- The group over Λ is affine flat; finite type and reductivity require separate arguments.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.3](#gap-g3-3) (Bounded adjunction coefficient and coequalizer verification).

#### Multileg and coefficient reconstruction

<a id="n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction"></a>
`GS4:integral-dual-group/multileg-and-coefficient-reconstruction` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

There are canonical Hopf isomorphisms H^I_Λ≅⊗_{i∈I}H^{i}_Λ and H^I_Λ⊗_ΛΛ′≅H^I_{Λ′} for the source coefficient changes. They commute with leg permutations, fusion/collision maps, comultiplication, counit and antipode. First work modulo ℓ^c, assemble compatible levels to construct H_{Z_ℓ} and its affine flat group, and recover torsion coefficient rings by base change. Prime-to-p finite coefficient decompositions are assembled componentwise. This is an ℓ-adic reconstruction theorem, not an integral decomposition theorem.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. The product formula for X_W in VI.10.1 gives the dual tensor formula on finite pieces; pass to filtered colimits.
2. Use the uniform standard/costandard torsion control from VI.7.5 in the coefficient comparison of the bounded adjunction. The comparison respects all representing maps and thus Hopf operations.
3. Perform compatible reduction modulo ℓ^c and then ℓ-adic passage; use the CRT decomposition for prime-to-p torsion. The detailed coefficient-limit adapter remains a signature gap.

**Direct prerequisites.**

- [Bounded left adjoints](#n-gs4-integral-dual-group-tannakian-left-adjoint) (`GS4:integral-dual-group/tannakian-left-adjoint`)
- [Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra) (`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- `mathlib:Module.Flat`
- [Rational parity and integral torsion bounds](#n-gs1-standard-costandard-torsion-bound) (`GS1/standard-costandard-torsion-bound`)
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)

**Sources.**

- [FS](#src-fs), VI.10.3 pp234–235; VI.11.1 proof p235. The product statement, coefficient compatibility and reduction to the ℓ-adic group are stated and used here.

**Acceptance.**

- For I=∅ the empty tensor is Λ.
- For I={1,2}, interchanging factors is the ordinary Hopf flip after the parity correction.
- Reduction of the Z_ℓ group modulo ℓ^c equals the directly reconstructed group, for every c≥1.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.3](#gap-g3-3) (Bounded adjunction coefficient and coequalizer verification).

<a id="layer-gs4-rational-reductivity"></a>

### GS4:rational-reductivity — The late decomposition-theorem input

The rational branch forgets Weil descent and works at a geometric point. It
transports through the one-leg special/generic comparison to bounded Witt
Schubert perfections, whose proper finite-type models and resolutions are where
the scheme decomposition theorem (EDC.7) applies. Equivariance and connected
stabilizers leave only constant local systems on Schubert strata, and IC parity
with the boundary-degree bounds gives the geometric semisimple decomposition.
This splits no arbitrary Weil representation and gives no integral or mod-ℓ
decomposition theorem. Recognizing the generic group takes three steps: a
tensor generator gives finite type (Deligne–Milne 2.20); the unbounded
sequence nμ in tensor powers excludes finite tensor hulls and gives
connectedness (Deligne–Milne Corollary 2.22, a characteristic-zero statement);
and only then do geometric semisimplicity and the characteristic-zero
reductivity criterion of the upstream ReductiveGroups roadmap give
reductivity.

Zhu's rational Satake category is the category of L⁺G-equivariant perverse
Q̄_ℓ-sheaves on the Witt vector affine Grassmannian over an algebraically closed
field k. For k an algebraic closure of F_q, with O = W(k) ⊗_{W(F_q)} O_E, FS
identify the perverse objects of the local Hecke stack over Spd k with these
sheaves (FS p. 219); inverting ℓ and extending scalars identifies Zhu's
category with the idempotent completion of the rationalized Satake category of
Spd k. Transporting the sign-corrected fusion symmetry makes it neutral
Tannakian with fibre functor H*, and its group is the generic fibre of the
integral Satake group. Larger algebraically closed k are gap [G3.12](#gap-g3-12).

#### Geometric rational semisimplicity

<a id="n-gs4-rational-reductivity-rational-semisimplicity"></a>
`GS4:rational-reductivity/rational-semisimplicity` · theorem · planet: **Geometric Satake semisimplicity**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

After forgetting Weil descent and taking a geometric splitting fibre, the rational Satake category is the direct sum over dominant μ of copies of finite-dimensional Q_ℓ-vector spaces generated by the simple IC_μ. For each bounded object the sum is finite. Convolution of the IC objects is semisimple. EDC.7 is applied on finite-type proper models/resolutions of bounded Witt Schubert perfections over an algebraic closure of a finite field and transported through perfection and the integral-family comparison. No semisimplicity of Weil representations, integral Satake objects or mod-ℓ Satake objects follows.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Use VI.6.7 to transport geometric Satake to the Witt fibre. Equivariance and connected Schubert stabilizers make simple equivariant local systems constant, so simples are IC_μ.
2. Import the rational decomposition theorem on proper finite-type models, using Demazure/affine-flag parity and the IC boundary bounds in VI.7.5. Zhu Lemma 2.1 and Proposition 2.2 give the rational mixed-characteristic semisimple calculation.
3. Transport the resulting splitting through perfection and the ULA comparison. Preserve geometric/Weil distinction throughout.

**Direct prerequisites.**

- [One-leg ULA special/generic comparison](#n-gs1-integral-family-comparison) (`GS1/integral-family-comparison`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)
- [Relative perverse t-structure](#n-gs1-relative-perverse-t-structure) (`GS1/relative-perverse-t-structure`)
- [Satake category](#n-gs2-correspondences-satake-category-and-fibre-functor) (`GS2:correspondences/satake-category-and-fibre-functor`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- `EtaleDualityAndPerverseSheaves:EDC.7`
- [Rational parity and integral torsion bounds](#n-gs1-standard-costandard-torsion-bound) (`GS1/standard-costandard-torsion-bound`)
- [One-leg Satake equivalence](#n-gs2-satake-closure-one-leg-satake-comparison) (`GS2:Satake-closure/one-leg-satake-comparison`)
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)

**Sources.**

- [FS](#src-fs), VI.7.5 pp219–221; VI.11.1 proof pp235–236. The geometric rational IC splitting used to recognize the generic group.
- [Zhu](#src-zhu), Lemma 2.1 p430 and Proposition 2.2 p432; context pp430–432. Independent rational Witt-fibre calculation, with scheme decomposition as an imported input.

**Acceptance.**

- The minuscule PGL2 object is the shifted constant sheaf on P¹ and is geometrically simple.
- Nontrivial unipotent continuous Weil actions can give nonsplit local systems even over Q_ℓ; these do not contradict geometric semisimplicity.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.9](#req-r3-9) to `EtaleDualityAndPerverseSheaves:EDC.7`.

#### Reductivity of the generic Satake group

<a id="n-gs4-rational-reductivity-generic-fibre-reductivity"></a>
`GS4:rational-reductivity/generic-fibre-reductivity` · theorem · planet: **Generic Satake reductivity**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

The geometric generic fibre G^∨_{Q_ℓ} is a connected reductive group of finite type. Finite dominant-monoid generators give a tensor generator (including its dual), so MC.6/DM 2.20 gives finite type. For every nontrivial IC highest weight the highest weights nμ in tensor powers grow, ruling out a nontrivial finite tensor hull; MC.6/DM 2.22 gives connectedness. Having established finite type and connectedness, use geometric semisimplicity and the characteristic-zero reductivity criterion from the existing ReductiveGroups owner. DM 2.23 also expresses the semisimplicity criterion as proreductivity; no additional general pro-group theorem is assigned to the upstream finite-type stage.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Choose finite generators for dominant weights, and use the highest-weight constituent IC_{μ+ν} of convolution to generate all simples by tensor operations/subquotients.
2. For a nonzero dominant weight all nμ are distinct and occur, so its generated tensor category is not finite; apply the characteristic-zero connectedness test to rule out finite quotients.
3. After finite type and connectedness are established, apply the characteristic-zero semisimplicity/reductivity criterion from the existing ReductiveGroups layer. DM 2.23 provides the corresponding connected proreductive statement.

**Direct prerequisites.**

- [Geometric rational semisimplicity](#n-gs4-rational-reductivity-rational-semisimplicity) (`GS4:rational-reductivity/rational-semisimplicity`)
- [Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra) (`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`)
- `MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`
- `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`
- `ReductiveGroupsPartII:RG2.5`
- `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp235–236. Source proof separates finite type, connectedness and reductivity.
- [DM](#src-dm), Proposition 2.20, Corollary 2.22 and Proposition 2.23 pp24–27. General criteria are imported from their single owners, and used with characteristic zero.
- [Zhu](#src-zhu), §2.5 p454, first paragraph. For the rational Witt category Zhu obtains a connected reductive Tannakian group by the same finite-type, connectedness and semisimplicity argument; the rational Witt node below identifies his group with this generic fibre.

**Acceptance.**

- For G a split torus the group is its dual torus, not a semisimple group.
- Semisimplicity alone would allow disconnected or infinite proreductive groups; the preceding two recognition steps are necessary.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.7](#req-r3-7) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

#### Rational Witt Satake category as a neutral Tannakian category

<a id="n-gs4-rational-reductivity-witt-rational-tannakian-category"></a>
`GS4:rational-reductivity/witt-rational-tannakian-category` · comparison

**Library:** `TauCeti/GeometricSatake/Witt`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Let Sat^Witt_G be Zhu's category P_{L⁺G}(Gr_G) of L⁺G-equivariant perverse Q̄_ℓ-sheaves with bounded support on the Witt vector affine Grassmannian of G over k, with convolution ⋆, unit IC_0 and total cohomology H*. (i) The one-leg comparison over Spd k identifies Sat^Witt_G, compatibly with ⋆ and H*, with the Q̄_ℓ-linear idempotent completion of the rationalization Sat_G(Hck_{Spd k}, Z_ℓ) ⊗ Q̄_ℓ (Hom groups tensored with Q̄_ℓ). (ii) Transporting the parity-corrected fusion symmetry and the Satake duals through (i) makes Sat^Witt_G a semisimple rigid symmetric monoidal abelian category with End(IC_0) = Q̄_ℓ, and H* an exact faithful symmetric monoidal functor to finite-dimensional Q̄_ℓ-vector spaces with the ordinary flip; thus (Sat^Witt_G, H*) is a neutral Tannakian category. (iii) Its Tannakian group Aut^⊗(H*) is canonically the base change to Q̄_ℓ of the generic fibre of the Satake group of Spd k, and so is a connected reductive group of finite type. The monoidal structure on H* is the one transported from fusion; it is not identified with the structure of Zhu's Proposition 2.20.

**Hypotheses.**

- E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k).
- G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ.
- Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison").

**Proof outline.**

1. Zhu's ring W_O(R) = W(R) ⊗_{W(k)} O equals W(R) ⊗_{W(F_q)} O_E, so his Gr_G is the Witt vector affine Grassmannian of G over k. Over Spd k the local Hecke stack has the Witt Grassmannian as its underlying diamond, and Scholze's full embedding of étale sheaves on perfect schemes identifies its perverse objects with Zhu's L⁺G-equivariant perverse sheaves (FS p219). Compatibility with convolution, the unit and duals comes from the one-leg comparison node, and with total cohomology from the Satake cohomology functor.
2. Pass to rational coefficients through the rational lattice category, whose Hom groups are the integral Hom groups tensored with Q_ℓ; the perverse t-structure passes to this localisation, so rationalised Satake objects are perverse and their Hom groups in the heart are the integral ones tensored with Q_ℓ. Then pass to Q̄_ℓ as a colimit over finite extensions. Every simple IC_μ is in the image: the rational standard object of μ has simple top IC_μ and no maps to objects supported on smaller strata, so by geometric semisimplicity it equals IC_μ.
3. Transport the corrected fusion braiding, the unit and the Satake duals sw*D through (i). Semisimplicity and End(IC_0) = Q̄_ℓ come from geometric rational semisimplicity; exactness and faithfulness of H* from the Satake fibre functor. Apply neutral Tannaka reconstruction.
4. The bounded left adjoints commute with change of coefficients, so the coordinate Hopf algebra of (Sat^Witt_G, H*) is the scalar extension of the integral Satake Hopf algebra of Spd k. Its group is the generic fibre of the integral Satake group, which is connected reductive by the generic reductivity node. Zhu reaches the same conclusion through the argument of Mirković–Vilonen §7 applied to his own constraint; that route belongs to the Part II design.

**Direct prerequisites.**

- [One-leg Satake equivalence](#n-gs2-satake-closure-one-leg-satake-comparison) (`GS2:Satake-closure/one-leg-satake-comparison`)
- [One-leg ULA special/generic comparison](#n-gs1-integral-family-comparison) (`GS1/integral-family-comparison`)
- `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`
- [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor) (`GS2:correspondences/satake-fibre-functor`)
- [Duals of Satake objects](#n-gs2-satake-closure-satake-rigidity) (`GS2:Satake-closure/satake-rigidity`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Geometric rational semisimplicity](#n-gs4-rational-reductivity-rational-semisimplicity) (`GS4:rational-reductivity/rational-semisimplicity`)
- [Reductivity of the generic Satake group](#n-gs4-rational-reductivity-generic-fibre-reductivity) (`GS4:rational-reductivity/generic-fibre-reductivity`)
- [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction) (`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`)
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`
- [Rational parity and integral torsion bounds](#n-gs1-standard-costandard-torsion-bound) (`GS1/standard-costandard-torsion-bound`)

**Sources.**

- [Zhu](#src-zhu), §2 opening p429; §2.1.1 p430; §2.5 p454, first paragraph. Standing hypotheses (k algebraically closed, G connected reductive over O), the definition of the Satake category as a colimit over bounded pieces, and the statement that it is a neutral Tannakian category with fibre functor H* whose group is connected reductive.
- [FS](#src-fs), VI.7 p219 after the proof of Proposition VI.7.4; Remark I.2.14 p17. Identifies perverse sheaves on the local Hecke stack over Spd k with Zhu's equivariant perverse sheaves on the Witt Grassmannian, and notes that the degeneration gives a new proof of Zhu's theorem.

**Acceptance.**

- For a split torus T: Gr_T is discrete with points X_*(T); an object of Sat^Witt_T is a finitely supported family (V_λ) of finite-dimensional Q̄_ℓ-spaces, H* sends it to ⊕_λ V_λ, and Aut^⊗(H*) = T̂.
- For G = PGL₂ the minuscule object is Q̄_ℓ[1] on P¹, and H* of it is two-dimensional, in degrees −1 and 1.
- Without the parity correction two odd objects would be exchanged with a Koszul sign under H*, and the reconstruction would be a super-Tannakian category rather than a neutral Tannakian one.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.12](#gap-g3-12) (Zhu's equivalence outside the FS comparison).

### GS4:integral-dual-group — Reconstruction and normalized functoriality, second part: the dual group, normalization and exports

The torus calculation gives the group algebra Λ[X_*(T)]. In rank one, the
minuscule Schubert variety P¹ of PGL₂ gives the standard representation of SL₂,
with fibre Z_ℓ ⊕ Z_ℓ(−1); its generic fibre is SL₂, and the integral rank-one
identification is a separate target. FS Lemma VI.11.2, which would force the
special-fibre image H ⊂ SL₂ to be SL₂ from the diagonal torus and distinct
nonnegative highest weights, fails in characteristic two: N(T) = T ⋊ C₂ has
simples of highest weights 0, 1, 2, … once each (source issue E32). The
proposed repair detects extra invariants of any subgroup inside the a-th
Frobenius preimage of N(T) in the tilting module T(6·2^a − 2), a summand of the
corresponding tensor power of the natural module, using its Steinberg-square
factorization (Doty–Henke Lemmas 1.1 and 1.4 and §5); it needs LP3's
Frobenius-kernel and good-filtration contracts and, from GS2:correspondences,
the identification of Hom(1, B₁^{⋆n}) with top Borel–Moore homology of the
base-point convolution fibre with a coefficient-independent basis. The repair rests on these inputs and on the subgroup facts
requested from the Tau Ceti ReductiveGroups layers 3 and 7; it is gap
[G3.11](#gap-g3-11). Component refinement for a
semisimple-rank-one group uses the diagonalizable group with character group
π₁(G), which may have torsion (source issue E25).

Weight functors and minimal-Levi constant terms give the maximal torus, Borel
filtration, simple roots, coroots and reflections, and the convex-hull bound
excludes extra roots, giving the generic dual root datum. Integral recovery
uses the dual torus and rank-one Levi integral points to generate the maximal
bounded subgroup, and a preserved lattice extends a generic representation to
its finite-type integral image. The general Prasad–Yu closed-immersion
theorem belongs to RG2.3 and is requested there with its residue
characteristic two condition; in characteristic two the argument first uses
G_ad, whose dual is simply connected, and recovers G through component and
central-character data. The canonical identification pins each simple root
line as Λ(1); varying the split pinning proves independence, and Galois descent
handles nonsplit groups. A chosen half Tate character κ gives
t_G = (2ρ̂_G)(κ), whose adjoint image conjugates the pinned action into the
geometric one; the Levi correction is t_M^{-1}t_G. Products, adjoint
isomorphisms and Weil restriction have their own naturality statements; finite
index induction is not strong monoidal on arbitrary representations, so the
Weil restriction comparison keeps its conjugate-leg diagram. Zhu's Theorem 0.3
follows at the geometric point Spd k with Q̄_ℓ coefficients and uses only the
generic fibre; it is stated for the monoidal structure on H* transported from
fusion. Reversal acts by the pinned Chevalley involution followed by
conjugation by ρ̂(−1). The enhanced export V ↦ D(S_V)^∨ of FS IX.2 extends the
exact representation functor to Perf(B(Ĝ ⋊ Q)^I) relative to Perf(BQ^I), using
LP3's highest-weight base change and LP4's stable completion; its values lie in
the stable idempotent closure of the Satake kernels, and no equality of the
essential image with that closure is asserted.

#### Torus and rank-one identification

<a id="n-gs4-integral-dual-group-torus-and-rank-one-identification"></a>
`GS4:integral-dual-group/torus-and-rank-one-identification` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For a split torus T, Sat_T is the category of finitely supported X_*(T)-graded finite projective Weil representations and G^∨_T is its dual torus. Constant terms give a closed immersion of this torus into G^∨_G. For G=PGL₂ the minuscule Schubert variety is P¹, its fibre is Z_ℓ⊕Z_ℓ(-1) with torus weights ±1, and the generic fibre G^∨_{Q_ℓ} is SL(Q_ℓ⊕Q_ℓ(-1)) with geometric root line Q_ℓ(1). The integral and special-fibre statement is the separate node rank-one-integral-identification. For general semisimple rank one recover the central/component grading by the diagonalizable group with character group π₁(G), which can have torsion.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. The torus calculation is the character grading and group-algebra Hopf computation. For each top Schubert weight its rank-one weight quotient gives the closed torus immersion.
2. For PGL₂ use H⁰/H² of P¹, evaluation and determinant: the torus acts with weights ±1, so G^∨ maps to SL(Z_ℓ⊕Z_ℓ(-1)). The generic fibre is connected reductive of rank one, the minuscule object tensor-generates, so this representation is faithful, and the group is not a torus because the representation is irreducible of dimension two. So G^∨_{Q_ℓ} → SL₂ is a closed immersion of a three-dimensional connected group, hence an isomorphism, with geometric root pinning.
3. The map to G_ad is componentwise an isomorphism on Grassmannians; refinement of π₁(G_ad)-grading to π₁(G)-grading recovers the central diagonalizable factor.

**Direct prerequisites.**

- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) (`GS3:fusion/fusion-verdier-duality`)
- [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction) (`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`)
- [Reductivity of the generic Satake group](#n-gs4-rational-reductivity-generic-fibre-reductivity) (`GS4:rational-reductivity/generic-fibre-reductivity`)
- `ReductiveGroupsPartII:RG2.5`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`
- `mathlib:RootPairing`

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp235–237. Torus case and generic rank-one calculation; the component-grading statement uses source issue E25.
- [Zhu](#src-zhu), §2.5 p454, second paragraph. The rational Witt torus case: the Grassmannian of a torus is the discrete set of coweights, its Satake category is graded vector spaces and the Tannakian group is the dual torus.

**Acceptance.**

- For G=G_m the weight n gives the character z↦z^n.
- For G=PGL₂ the generic group is SL₂, not PGL₂: the minuscule representation is two-dimensional with weights ±1.
- For G=PGL₂ the component group Z/2 corresponds to μ₂, which is diagonalizable and not a torus.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.8](#req-r3-8) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

#### Integral rank-one identification

<a id="n-gs4-integral-dual-group-rank-one-integral-identification"></a>
`GS4:integral-dual-group/rank-one-integral-identification` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For G = PGL₂ and every ℓ ≠ p, the representation on the fibre Z_ℓ⊕Z_ℓ(-1) of the minuscule object is an isomorphism G^∨_{Z_ℓ} ≅ SL(Z_ℓ⊕Z_ℓ(-1)). Its special fibre G^∨_{F_ℓ} → SL₂ is surjective. The image H contains the diagonal torus T and its irreducibles are separated by highest weights in Z≥0; for ℓ odd this forces H = SL₂ (VI.11.2). For ℓ = 2 these properties leave the case that the reduced subgroup of H is the normalizer N(T), with H inside a Frobenius preimage of N(T). That case is excluded because Hom(1, B₁^{⋆n}) over F₂ has the characteristic-zero dimension for every n, while a Frobenius preimage of N(T) has more invariants in a suitable V^{⊗n}. For a split G of semisimple rank one the integral identification follows through G → G_ad ≅ PGL₂ and the component grading. The characteristic-two invariant-count route is a planned replacement: it uses the strengthened LP3 and GS2:correspondences requests, and its geometric identification remains the named rank-one special-fibre gap.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Reduce G^∨ modulo ℓ and work after faithfully flat extension to an algebraic closure k of F_ℓ; surjectivity of the special-fibre map descends. Let H be the image of G^∨_k in SL₂. Every irreducible representation of G^∨_k is a simple Satake object B_μ of highest weight μ, so the irreducibles of H are separated by highest weights in Z≥0. Replace H by its image H′ under a high power r of the Frobenius isogeny: H′ is reduced, contains T and is a quotient of H, so its irreducibles pull back to irreducibles of H with highest weights multiplied by ℓ^r; and H′ = SL₂ forces H = SL₂ by dimension.
2. The identity component of the smooth group H′ is T, a Borel or SL₂ by the structure theory of SL₂. T and the Borels have irreducibles of negative highest weight; if H′° = T then H′ ⊂ N(T). For ℓ odd the sign character of N(T) is a second irreducible of highest weight 0, so H′ = SL₂.
3. For ℓ = 2, if H′ = N(T), then H lies in H_a, the preimage of N(T) under the a-th Frobenius power, for some a ≥ 0. Put n = 6·2^a − 2. The SL₂ tilting factorization gives T(n) ≅ A ⊗ T(4)^{[a]}, where A = T(2^{a+1} − 2). For a ≥ 1 the Steinberg-square description A ≅ St_a ⊗ St_a and self-duality identify A^{G_a} with End_{G_a}(St_a) = k; the resulting line has trivial SL₂ action. For a = 0 use A = T(0) directly. Hence T(n)^{G_a} ≅ T(4)^{[a]} and T(n)^{H_a} ≅ T(4)^{N(T)}. The character of T(4) is the sum of the characters of ∇(4) and ∇(2): its weight-zero space has dimension two, so the involution w has a nonzero fixed vector in characteristic two, but T(4)^{SL₂} = 0 because its good filtration has no ∇(0). Thus T(n)^{SL₂} = 0 as well. The highest-weight summand T(n) of the tilting module V^{⊗n} supplies extra H-invariants. For V^{⊗n} the ∇(0)-multiplicity is the characteristic-zero trivial multiplicity. The Steinberg-kernel and good-filtration facts are explicit LP3 obligations, not consequences of a prime-to-ℓ generation theorem.
4. Request from GS2:correspondences the following coefficient-independent geometric calculation, beyond its current rational-special-fibre-convolution node. For even n, the n-step minuscule PGL₂ convolution space is a smooth iterated (perfected) P¹ bundle of dimension n, its proper convolution map is semismall, and the base-point fibre has dimension at most n/2. Proper duality identifies Hom(1, B₁^{⋆n}) with its degree-n Borel–Moore homology, up to the harmless Tate twist. Top-dimensional cycles give a free coefficient module with basis the n/2-dimensional irreducible components, so the F₂ dimension equals the Q_ℓ dimension. Transport this identification through the one-leg comparison and use the rational rank-one calculation for the latter dimension. Since the reconstructed group acts through H, this contradicts the extra invariants of the preceding step and gives H = SL₂. This source-to-supplier adapter remains the explicit rank-one gap; Zhu Proposition 2.3 provides the semismall dimension bound, not the asserted modular Hom identification.
5. The map G^∨_{Z_ℓ} → SL₂ is an isomorphism on generic fibres and surjective on special fibres, so on coordinate rings it is injective modulo ℓ and an isomorphism after inverting ℓ; the flat-module lemma VI.11.3 makes it an isomorphism. For semisimple rank one use G → G_ad ≅ PGL₂ and refine the component grading.

**Direct prerequisites.**

- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction) (`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`)
- [Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra) (`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`
- `LanglandsParameterStacks:LP3`
- `mathlib:Module.Flat`
- `GeometricSatakeAndFusion:GS2:correspondences`
- [One-leg Satake equivalence](#n-gs2-satake-closure-one-leg-satake-comparison) (`GS2:Satake-closure/one-leg-satake-comparison`)

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp236–237; Lemmas VI.11.2–VI.11.3 p237. Source special-fibre image argument and flat-module lift; the false ℓ = 2 case of Lemma VI.11.2 needs the proposed replacement in source issue E32 with its recorded supplier gap.
- [DH](#src-dh), §1, Lemma 1.1 p3 and Lemma 1.4 p4; §5 p18, Steinberg-square discussion. Supplies the small-tilting characters and twisted factorization used in the proposed characteristic-two repair. The kernel-invariant and Hom-count conclusions are derived steps with explicit supplier obligations, not stated theorems of this paper.
- [Zhu](#src-zhu), Proposition 2.3 and Remark 2.4 p432; §2.1 pp431–432. Supplies semismallness of the bounded convolution map and the rational top-cycle multiplicity calculation. Its rational statements are not cited as a modular decomposition theorem.

**Acceptance.**

- The normalizer of the diagonal torus in SL₂ over F₂, and its preimage under the Frobenius isogeny, both have irreducibles of highest weights 0, 1, 2, …, each once; torus containment and injectivity of highest weights cannot tell them from SL₂ at ℓ = 2.
- For a = 0 the count is n = 4: (V^{⊗4})^{N(T)} is three-dimensional (w permutes the six weight-zero basis tensors freely), against two SL₂-invariants and two characteristic-zero invariants.
- A map of flat Z_ℓ-modules that is injective modulo ℓ and an isomorphism after inverting ℓ is an isomorphism; injectivity modulo ℓ alone is not enough.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.11](#gap-g3-11) (Rank-one special-fibre image at ℓ = 2); request [R3.18](#req-r3-18) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; request [R3.19](#req-r3-19) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; request [R3.20](#req-r3-20) to `LanglandsParameterStacks:LP3`; request [R3.21](#req-r3-21) to `GeometricSatakeAndFusion:GS2:correspondences`.

#### Weight torus and generic root datum

<a id="n-gs4-integral-dual-group-generic-root-datum"></a>
`GS4:integral-dual-group/generic-root-datum` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Under the torus inclusion, weight-functor grading identifies X^*(T^∨)=X_*(T). The stabilizer of the cohomological grading is the maximal torus and the weight filtration defines a Borel. The symmetric constant-term maps for minimal Levis identify each simple coroot of G with a simple root of G^∨ and each simple root with its coroot; their Weyl reflections agree. Convex-hull bounds for weights of IC_μ exclude additional roots. Thus G^∨_{Q_ℓ} has the dual root datum and its generic pinning has root line Q_ℓ(1).

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Use the weight grading and highest-weight line to identify the torus and chosen positive filtration.
2. Insert the already identified rank-one Levi groups via CT and compare the common torus; this gives roots, coroots and simple reflections.
3. The possible weight set in each representation is contained in the convex hull of the Weyl orbit of μ. An additional root would violate these rank-one reflection/weight bounds. Apply the pinned classification from the upstream reductive-group roadmap.

**Direct prerequisites.**

- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Reductivity of the generic Satake group](#n-gs4-rational-reductivity-generic-fibre-reductivity) (`GS4:rational-reductivity/generic-fibre-reductivity`)
- [Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization) (`GS1/semi-infinite-orbits-and-hyperbolic-localization`)
- `ReductiveGroupsPartII:RG2.5`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp237–238. The rank-one Levi and weight-bound argument identifies the complete generic root datum.
- [Zhu](#src-zhu), §2.5 pp454–455, after Proposition 2.36. Rational Witt version: the dual torus is a maximal torus of the Tannakian group, the filtration on H* defines a Borel containing it, and the group is the dual group by the argument of Mirković–Vilonen §7.

**Acceptance.**

- In type A₁ the root character is twice the standard SL₂ weight, rather than the standard weight.
- For a torus there are no roots and the entire group is the weight torus.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.8](#req-r3-8) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

#### Integral recovery and the adjoint reduction

<a id="n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction"></a>
`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

The generic dual identification extends to an isomorphism G^∨_{Z_ℓ}≅Ĝ_{Z_ℓ} for every ℓ≠p. Over the completed maximal unramified extension, the dual torus and rank-one Levi integral images generate Ĝ(Z̆_ℓ); this maximal bounded subgroup preserves a lattice in every finite-dimensional generic representation. The associated finite-type images recover the integral model via the RG2.3 Prasad–Yu closed-immersion criterion and VI.11.3 flat-module injection. At ℓ=2 first perform this step for G_ad, whose dual is simply connected, and then recover the original G from its component/central grading. One cannot apply Prasad–Yu directly to an arbitrary dual group in characteristic two.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Use integral CT Levi maps and the dual torus to obtain the full hyperspecial/maximal bounded subgroup; include the torus separately for semisimple rank zero. Import the generation/Iwasawa result from RG2.4 and integral-points topology from RG2.0.
2. Extend a generic faithful representation using a preserved lattice. The map from Ĝ to its finite-type schematic image is generically a closed immersion. PY applies if ℓ≠2 or the generic fibre over an algebraic closure has no normal algebraic subgroup isomorphic to SO_{2n+1}; simple connectedness suffices.
3. For G_ad this exception is absent. Surjectivity on integral points and the flat-module lemma force equality of coordinate rings. Reconstruct arbitrary G by refining the component grading, as in the rank-one/central argument.

**Direct prerequisites.**

- [Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum) (`GS4:integral-dual-group/generic-root-datum`)
- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- [Integral rank-one identification](#n-gs4-integral-dual-group-rank-one-integral-identification) (`GS4:integral-dual-group/rank-one-integral-identification`)
- [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction) (`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`)
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.0`
- `ReductiveGroupsPartII:RG2.4`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`
- `mathlib:Module.Flat`

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp238–239; Lemma VI.11.4 p238. Source integral recovery, exception and reduction to the adjoint case.
- [PY](#src-py), Corollary 1.3 pp2–3; proof §5.4 p12. The general criterion is requested from RG2.3, not owned by this application.

**Acceptance.**

- The theorem includes ℓ=2 when p≠2 and includes groups whose dual has torsion fundamental group.
- The torus case does not rely on a nonexistent rank-one Levi.
- Generic equality by itself would also allow defective integral models; this proof uses integral points and the closed-immersion theorem.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.4](#gap-g3-4) (RG2.3 needs the general Prasad–Yu scope addition); gap [G3.10](#gap-g3-10) (Integral-point supplier refinement); gap [G3.11](#gap-g3-11) (Rank-one special-fibre image at ℓ = 2); request [R3.4](#req-r3-4) to `ReductiveGroupsPartII:RG2.3`; request [R3.5](#req-r3-5) to `ReductiveGroupsPartII:RG2.0`; request [R3.6](#req-r3-6) to `ReductiveGroupsPartII:RG2.4`; request [R3.8](#req-r3-8) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

#### Canonical pinned dual identification

<a id="n-gs4-integral-dual-group-dual-group-identification"></a>
`GS4:integral-dual-group/dual-group-identification` · theorem · planet: **Pinned geometric dual group**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

There is a canonical W_E-equivariant isomorphism G^∨_Λ≅Ĝ_Λ^{geom} for the prime-to-p torsion and compatible ℓ-adic coefficients above. The geometric pinning identifies each simple root line with Λ(1); it carries the cyclotomic Weil action as well as the action on the pinned dual root datum. The isomorphism is independent of a chosen splitting pinning of G and descends from a finite Galois splitting extension to nonsplit G. It is an integral theorem and uses no exclusion on the order of π₁(Ĝ).

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Initially identify split pinned groups by the integral torus/rank-one calculation. Vary the pinning over its flag/pinning parameter family.
2. The locally constant Satake/constant-term comparisons are fully faithful under pullback along this family, so the identification is independent of the parameter. Rank-one H⁰/H² duality canonically identifies the geometric root line with Λ(1).
3. Apply finite Galois descent, keeping the action on root datum and the cyclotomic action on root lines distinct, and use the coefficient base-change theorem.

**Direct prerequisites.**

- [Integral recovery and the adjoint reduction](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction) (`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Weil realization of total cohomology](#n-gs3-fusion-drinfeld-fibre-realization) (`GS3:fusion/drinfeld-fibre-realization`)
- `ReductiveGroupsPartII:RG2.5`
- `VStackSheavesAndLisseCategories:VS1`

**Sources.**

- [FS](#src-fs), Theorem VI.11.1 p235 and canonical-pinning/descent proof pp238–239. Canonical integral identification with the geometrically twisted dual, including pinning independence and descent.

**Acceptance.**

- For PGL₂, arithmetic action on the dual root vector is cyclotomic, even when the pinned root datum has trivial action.
- For nonsplit tori this recovers the dual character lattice with its actual Weil action.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.4](#gap-g3-4) (RG2.3 needs the general Prasad–Yu scope addition); gap [G3.11](#gap-g3-11) (Rank-one special-fibre image at ℓ = 2); request [R3.1](#req-r3-1) to `VStackSheavesAndLisseCategories:VS1`; request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Rational Witt vector geometric Satake equivalence

<a id="n-gs4-integral-dual-group-witt-rational-satake-equivalence"></a>
`GS4:integral-dual-group/witt-rational-satake-equivalence` · theorem · planet: **Witt vector geometric Satake**

**Library:** `TauCeti/GeometricSatake/Witt`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

In the setting of the rational Witt Tannakian category, let Ĝ be the split dual group over Q̄_ℓ with the dual Borel B̂ ⊃ T̂ of its pinned dual root datum. There is an equivalence of Q̄_ℓ-linear symmetric monoidal categories S: Sat^Witt_G → Rep_{Q̄_ℓ}(Ĝ) onto finite-dimensional algebraic representations, with an isomorphism of tensor functors H* ≅ (forget ∘ S). Under S: (a) the weight functor CT = ⊕_λ CT_λ, viewed as a functor to Sat^Witt_T, has a unique monoidal structure for which the isomorphism H*_T ∘ CT ≅ H* is monoidal; it is then symmetric and corresponds to restriction to T̂, CT_λ(A) being the λ-weight space of S(A); (b) the filtration of H* by semi-infinite orbits corresponds to the B̂-stable filtration by weights; (c) IC_μ corresponds to the irreducible representation V_μ of highest weight μ, so dim CT_λ(IC_μ) = dim V_μ(λ); (d) for a torus, S is the grading equivalence with Rep(T̂). This is Zhu's Theorem 0.3, with Corollary 2.22 and §2.5, for the monoidal structure on H* transported from fusion; its agreement with the structure of Zhu's Proposition 2.20 is not asserted.

**Hypotheses.**

- E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k).
- G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ.
- Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison").
- Dominance on coweights uses nonnegative integer combinations of positive coroots (source issue E1); Rep_{Q̄_ℓ}(Ĝ) means algebraic representations on finite-dimensional Q̄_ℓ-vector spaces, with no Weil action.

**Proof outline.**

1. The generic root datum node identifies the root datum of the Tannakian group of the rational Witt category with the dual root datum, with its torus, Borel and simple root lines; the isomorphism theorem for pinned split groups gives Aut^⊗(H*) ≅ Ĝ over Q̄_ℓ. Neutral Tannaka reconstruction turns this into S with forget ∘ S ≅ H*. Only the generic fibre is used: the integral rank-one identification, integral recovery and the ℓ = 2 input are not prerequisites.
2. For (a): transport the symmetric constant term for B through the one-leg comparison and to Q̄_ℓ; it commutes with the fibre functors. Uniqueness: H*_T is faithful, so the monoidal structure on CT is determined by the monoidal isomorphism H*_T ∘ CT ≅ H*. Symmetry: the commutativity constraints on both sides are detected by H*, as in the uniqueness part of Zhu's Proposition 2.21. The torus case identifies Rep(T̂) with graded spaces, so CT is restriction to T̂.
3. For (b) and (c): the stabilizer of the cohomological filtration is B̂ by the generic root datum node. The weights of IC_μ lie in the convex hull of Wμ and μ occurs once, since S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ, μ⟩ by the Mirković–Vilonen count; so S(IC_μ) is the irreducible module of highest weight μ by the characteristic-zero highest-weight classification. For (b): the semi-infinite filtration is split by the weight functors (Zhu Corollary 2.10, with its proof as corrected in source issue E10, or the symmetric constant-term node, through F ≅ F_T ∘ CT_B[deg]), so by (a) it corresponds to the sums of the weight spaces V(λ′) over λ′ ≥ λ, which are B̂-stable because the root groups of B̂ raise weights by positive coroots of G.
4. Zhu's own route to the same identification (torus case, Proposition 2.36 by torus-equivariant cohomology, then the maximal torus and Borel argument of Mirković–Vilonen §7) uses his monoidal structure on H* and his Gelfand commutativity constraint (§§2.3–2.4). That proof is routed to the Part II design and is not used here.

**Direct prerequisites.**

- [Rational Witt Satake category as a neutral Tannakian category](#n-gs4-rational-reductivity-witt-rational-tannakian-category) (`GS4:rational-reductivity/witt-rational-tannakian-category`)
- [Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum) (`GS4:integral-dual-group/generic-root-datum`)
- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [One-leg Satake equivalence](#n-gs2-satake-closure-one-leg-satake-comparison) (`GS2:Satake-closure/one-leg-satake-comparison`)
- [Mirković–Vilonen intersections](#n-gs0-witt-geometry-semi-infinite-intersections-and-mv-cycles) (`GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`)
- [Rational special-fibre weights](#n-gs1-rational-weight-concentration) (`GS1/rational-weight-concentration`)
- `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`
- `ReductiveGroupsPartII:RG2.5`
- `LanglandsParameterStacks:LP3`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`

**Sources.**

- [Zhu](#src-zhu), Theorem 0.3 p408 (with source issue E33); Corollary 2.22 p444; §2.5 pp454–455; §0.5 p412. The mixed characteristic geometric Satake equivalence with Q̄_ℓ coefficients, its symmetric monoidal form, the identification with the dual group through the torus case, the tensor constant term and the Borel, and the notation Ĝ ⊃ B̂ ⊃ T̂, V_μ, V_μ(λ).
- [FS](#src-fs), Remark I.2.14 p17; VI introduction pp188–189. Fargues and Scholze note that their theorem, through the Witt degeneration, reproves Zhu's equivalence, and that the Satake categories over Spd O_C, Spd C and Spd k agree.

**Acceptance.**

- For a split torus T, S is the equivalence between X_*(T)-graded spaces and representations of T̂, with CT the identity.
- For G = PGL₂ the minuscule object goes to the standard representation of SL₂, with CT_{±μ} one-dimensional.
- For G = GL_n and μ = (1,0,…,0) the closed Schubert variety is P^{n−1}; S(IC_μ) is the standard representation, with the n coordinate weights each of multiplicity one.
- With the Koszul-signed symmetry instead of the parity-corrected one, the reconstruction would give a supergroup, not Ĝ.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.12](#gap-g3-12) (Zhu's equivalence outside the FS comparison); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.8](#req-r3-8) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; request [R3.17](#req-r3-17) to `LanglandsParameterStacks:LP3`.

#### Normalized integral Satake equivalence

<a id="n-gs4-integral-dual-group-normalized-satake-equivalence"></a>
`GS4:integral-dual-group/normalized-satake-equivalence` · construction · planet: **Normalized Satake equivalence**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Choose r∈Λ× with r²=q and the associated half Tate local system. Let χ_Tate be the Weil character of the geometric root line Λ(1) under IV.7.3 and κ its chosen square root. The half twist on a sheaf stalk has geometric Frobenius eigenvalue r^{-1}; identifying that stalk convention with κ under Drinfeld realization is the recorded convention obligation. Put t_G(w)=(2ρ̂_G)(κ(w)) in Ĝ (projected to Ĝ_ad for conjugation). The geometric action is Ad(t_G(w)) composed with the usual pinned action. The semidirect comparison (g,w)↦(g t_G(w),w) identifies the geometrically twisted semidirect group with the pinned one. Combining it with reconstruction gives Sat^I_G(Λ)≃Rep^{fp,cont}_Λ((Ĝ⋊W_E)^I). Equivalently an algebraic representation of (Ĝ⋊Q)^I, for a finite quotient Q through which the pinned action factors, gives its normalized Satake object; Q is not substituted for all continuous Weil representations.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use the root-line action in VI.11.1 to express geometric versus pinned action through the adjoint cocharacter 2ρ̂, without requiring ρ̂ itself to be a cocharacter of Ĝ.
2. The identity t(wv)=t(w)·w(t(v)) verifies the semidirect multiplication comparison. Tensor and dual compatibility follow from the Hopf comparison and corrected fusion.
3. Transport the chosen half twist and Frobenius convention through the Drinfeld equivalence. The precise stalk-action versus parameter-action orientation is recorded as a supplier/signature obligation rather than identified silently.

**Direct prerequisites.**

- [Canonical pinned dual identification](#n-gs4-integral-dual-group-dual-group-identification) (`GS4:integral-dual-group/dual-group-identification`)
- [Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra) (`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`)
- [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction) (`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`)
- [Weil realization of total cohomology](#n-gs3-fusion-drinfeld-fibre-realization) (`GS3:fusion/drinfeld-fibre-realization`)
- [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) (`GS3:fusion/fusion-verdier-duality`)
- `ReductiveGroupsPartII:RG2.5`
- `mathlib:CategoryTheory.Functor.Monoidal`
- `mathlib:Representation`

**Sources.**

- [FS](#src-fs), Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321. The source normalizes the geometric action using a chosen square root and exports finite-projective representations.

**Uses that shape the API.**

- HeckeStacksAndLocalShtukas:HS1: Uses normalized kernels indexed by finite projective representations.
- ExcursionOperatorsAndSpectralAction:ES6–ES7: Requires a finite-set coherent pinned Weil convention, including chosen half twists.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.normalizedSatakeEquivalence` | equivalence | The strong symmetric equivalence with continuous finite-projective representations of the usual pinned Weil semidirect group. |
| `TauCeti.GeometricSatake.normalizedSatakeObject` | constructor | The inverse equivalence applied to a representation V of (Ĝ⋊Q)^I. |
| `TauCeti.GeometricSatake.normalizedSatake_fibre` | compatibility | The underlying fibre is V with the specified half-Tate normalization, compatibly with Weil action. |
| `TauCeti.GeometricSatake.normalizedSatake_tensor` | compatibility | S_{V⊗W} ≅ S_V*S_W and S_1 ≅ unit. |
| `TauCeti.GeometricSatake.normalizedSatake_dual` | compatibility | S_{V∨} is the internal dual sw*D(S_V). |
| `TauCeti.GeometricSatake.normalizationCocycle` | data | t_G(w)=(2ρ̂_G)(κ(w)); the cocycle identity gives the semidirect comparison. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_normalized_torus` | computation | For T=G_m, weight n is the point object on component n, with no ρ twist. |
| `TauCeti.GeometricSatake.test_normalized_pgl2` | computation | For the standard SL₂ representation its PGL₂ Satake sheaf is Λ[1](1/2) on P¹, with Frobenius eigenvalues r^{-1},r. |
| `TauCeti.GeometricSatake.test_normalized_rootChoice` | non-example | Changing the chosen square root from r to -r multiplies an odd component by -1; it does not leave all normalized objects canonically fixed. |

**Acceptance.**

- For PGL₂ the normalized minuscule object is IC(P¹)=Λ[1](1/2) and its two Frobenius eigenvalues are r^{-1},r.
- For a torus 2ρ̂=0, so normalization leaves its weight characters unchanged.
- Changing r to -r changes the odd-component half twists by the central parity element (2ρ̂)(-1).

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.2](#gap-g3-2) (Drinfeld and Frobenius convention adapter); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Levi naturality and normalization

<a id="n-gs4-integral-dual-group-levi-naturality"></a>
`GS4:integral-dual-group/levi-naturality` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For P with Levi M, CT_P[deg_P] intertwines geometric Satake with restriction along M̂^{geom}→Ĝ^{geom}. Under the chosen normalized semidirect comparisons, the map from the pinned M-group to the pinned G-group is (m,w)↦(ι(m)t_M(w)^{-1}t_G(w),w). Here t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w)) centralizes M̂. Nested Levis multiply these correction cocycles and their degree shifts add. Thus this is a naturality theorem with a specified Weil correction, not unqualified restriction along the untwisted inclusion.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Transport the geometric CT map through the two explicit semidirect comparison isomorphisms; multiply the two cocycles in the common torus.
2. The difference of half-sums pairs trivially with the Levi roots, so the correction centralizes the Levi. Coherence follows from CT transitivity and cancellation of the intermediate cocycle.
3. Compare the result with the source parameter convention in IX.7.1, where |geometric Frobenius|=1 and the parameter map is written with (2ρ̂_G−2ρ̂_M)(r)^{|w|}; the inverse action/parameter translation is an explicitly recorded boundary.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum) (`GS4:integral-dual-group/generic-root-datum`)
- `ReductiveGroupsPartII:RG2.5`

**Sources.**

- [FS](#src-fs), VI.9.6 p230; VI.11.1 pp238–240; IX.7.1 p334. Geometric CT is natural; the source explicitly displays the correction in its parameter convention.

**Acceptance.**

- For M=G the correction is one and CT is identity.
- For a three-step Levi chain the intermediate half-sum cancels and gives the direct correction.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.2](#gap-g3-2) (Drinfeld and Frobenius convention adapter); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Naturality for adjoint-isomorphism maps

<a id="n-gs4-integral-dual-group-adjoint-isomorphism-naturality"></a>
`GS4:integral-dual-group/adjoint-isomorphism-naturality` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For f:G′→G inducing an isomorphism on adjoint groups, componentwise pushforward of the corresponding bounded Grassmannian sheaves intertwines normalized Satake with restriction along the dual map Ĝ→Ĝ′. Component refinements, central characters, Weyl actions, tensor constraints, half twists and finite-set collisions commute with this comparison. This includes central isogenies and the adjoint reduction used for integral recovery; no inverse equivalence for a general central isogeny is asserted.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. The map of Grassmannians is a componentwise isomorphism; its essential change is the map of component gradings. Pushforward corresponds to forgetting/refining the appropriate dual central character.
2. The common adjoint root system identifies the half-sum cocycles, so normalizations commute with the dual map. Prove tensor and finite-set comparisons on disjoint loci and extend uniquely.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- `ReductiveGroupsPartII:RG2.5`
- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)

**Sources.**

- [FS](#src-fs), VI.11.1 proof pp237–239; IX.6.1 pp330–331. The source uses exactly this Satake naturality to compare the global Hecke kernels.

**Acceptance.**

- For SL₂→PGL₂, component/central-character information distinguishes the two representation categories.
- For an isomorphism f the comparison reduces to the usual pullback identification.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Product naturality

<a id="n-gs4-integral-dual-group-product-naturality"></a>
`GS4:integral-dual-group/product-naturality` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For G=G₁×G₂ the external product of Grassmannian sheaves and normalized Satake identify Ĝ with Ĝ₁×Ĝ₂ and carry V₁⊠V₂ to S_{V₁}⊠S_{V₂}. Tensor, fibre, root pinning, Weil action and all finite-set operations agree. This is a statement for external products and their induced categorical comparison, not a claim every representation is itself an external tensor product.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. The loop/torsor and bounded Schubert constructions split as products; Künneth splits total cohomology and constant terms.
2. The Hopf reconstruction and root pinning split, and 2ρ̂ is the pair of half-sum cocharacters. Verify comparisons on exterior product generators and retain the coherent tensor data.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- `ReductiveGroupsPartII:RG2.5`
- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)

**Sources.**

- [FS](#src-fs), IX.6.2 p331; VI.10.3 pp234–235. Gives the product compatibility; the local comparison follows from product geometry and Hopf reconstruction.

**Acceptance.**

- The product with the trivial group recovers the same Satake functor.
- For G_m×G_m the weight (a,b) is the exterior product of the two point objects.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`.

#### Weil restriction naturality

<a id="n-gs4-integral-dual-group-weil-restriction-naturality"></a>
`GS4:integral-dual-group/weil-restriction-naturality` · theorem

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For a finite separable E′/E and G=Res_{E′/E}G′, the dual pinned group is the product of conjugates of Ĝ′ indexed by embeddings E′→Ē, with its permutation Weil action. After pullback to the E′ divisor base, the closed Grassmannian immersion for the chosen embedding and proper pushforward implement the representation procedure: project to Ĝ′, inflate from Ĝ′⋊W_{E′} to Ĝ⋊W_{E′}, then induce to Ĝ⋊W_E. This comparison is compatible with total cohomology, tensor/collision coherences and the two field-specific half twists; it is not an equivalence replacing W_E by W_{E′} without induction.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Import the group-scheme Weil restriction and its pinned dual permutation datum. Use the pullback of the divisor leg base and the chosen-embedding closed Grassmannian immersion.
2. The proper pushforward is finite-index induction on Weil representations by the Drinfeld realization, matching IX.6.3. Track residue degree f via q_{E′}=q_E^f and compatible half-root choices.
3. Construct the finite-set/tensor comparisons through the geometric correspondences, not by claiming induction is strong monoidal on arbitrary representations; its compatibility uses the particular Hecke/factorization diagram.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- [Positive and full loop spaces](#n-gs0-loop-geometry-loop-groups-and-local-hecke) (`GS0:loop-geometry/loop-groups-and-local-hecke`)
- `ReductiveGroupsPartII:RG2.5`
- `ReductiveGroupsPartII:RG2.0a`
- [Beilinson–Drinfeld Grassmannian](#n-gs0-loop-geometry-grassmannian) (`GS0:loop-geometry/grassmannian`)
- [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) (`GS0:loop-geometry/schubert-bounds-and-properness`)

**Sources.**

- [FS](#src-fs), IX.6.3 pp331–332. Precise chosen-embedding inflation/induction and its geometric divisor/Grassmannian map.

**Acceptance.**

- For E′=E the construction is identity.
- For a quadratic induced torus the two geometric character factors are permuted by W_E; forgetting that permutation fails.
- Half roots must satisfy r_{E′}=r_E^f when compatible normalization is claimed.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.9](#gap-g3-9) (Weil-restriction local tensor comparison); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.14](#req-r3-14) to `ReductiveGroupsPartII:RG2.0a`.

#### Chevalley involution with its inner sign

<a id="n-gs4-integral-dual-group-chevalley-involution"></a>
`GS4:integral-dual-group/chevalley-involution` · theorem · planet: **Chevalley involution**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Under canonical dual identification, sw* acts by Ad(ρ̂(-1))∘θ on Ĝ, where θ is the pinned Chevalley involution with lattice action μ↦−w₀μ and ρ̂(-1) is evaluated in the adjoint dual torus. It commutes with the geometric Weil action. Internal dual is sw*D, not sw* alone. The inner correction affects the canonical tensor/fibre comparison although it disappears after quotienting dual parameters by conjugacy.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Reduce via adjoint-isomorphism maps to the simply connected dual and then by rank-one constant terms to PGL₂.
2. Compare the symmetric Verdier pairing on Λ[1](1/2) with the alternating invariant pairing on the SL₂ standard representation. Their ratio acts diagonally as (u,-u), so each simple-root line is multiplied by -1.
3. An automorphism preserving torus/filtration is torus-inner; these rank-one signs identify it with ρ̂(-1). Reassemble using the root datum and canonical pinning.

**Direct prerequisites.**

- [Canonical pinned dual identification](#n-gs4-integral-dual-group-dual-group-identification) (`GS4:integral-dual-group/dual-group-identification`)
- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) (`GS3:fusion/fusion-verdier-duality`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification) (`GS4:integral-dual-group/torus-and-rank-one-identification`)
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`

**Sources.**

- [FS](#src-fs), Proposition VI.12.1 and proof pp239–241. Includes the rank-one pairing computation and the essential inner sign.

**Acceptance.**

- For PGL₂ the root-line sign is -1, so omitting ρ̂(-1) gives the wrong fibre comparison when 2 is invertible.
- For a torus w₀=1 and θ inverts characters; for coefficients of characteristic two the inner signs reduce to one.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); request [R3.8](#req-r3-8) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

#### Perfect-complex Satake extension

<a id="n-gs4-integral-dual-group-enhanced-perfect-satake-extension"></a>
`GS4:integral-dual-group/enhanced-perfect-satake-extension` · construction · planet: **Perfect Satake kernels**

**Library:** `TauCeti/GeometricSatake/DualGroup`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Fix ℓ≠p, a finite quotient Q of W_E through which the pinned action on Ĝ factors, and a Z_ℓ[r]-algebra Λ with r²=q. Compose normalized Satake on finite projective representations of (Ĝ⋊Q)^I with A↦D(A)^∨, using Verdier duality relative to Hck^I_G→[(Div¹)^I/L⁺G]. This is an exact Rep_Λ(Q^I)-linear monoidal functor into the enhanced local Hecke convolution category D■(Hck^I_G,Λ). Using LP3 highest-weight base change and LP4 the universal stable completion of the finite-projective exact representation category, extend it uniquely to a Perf(BQ^I_Λ)-linear exact monoidal functor Perf(B(Ĝ⋊Q)^I_Λ)→D■(Hck^I_G,Λ), coherent in I. Its fusion comparisons give symmetry on the Satake image. Its values lie in the stable idempotent closure of these Satake kernels. Equality with that closure, full faithfulness, and an equivalence with the whole enhanced category are not supplied by this extension theorem.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. First define the exact representation functor over Z_ℓ[r] and compose with relative Verdier dual followed by internal dual. The enhanced target convolution uses pullback, tensor and π♮, which have the required infinity-category coherence.
2. Import the relative highest-weight base-change equivalence Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) ⊗_{Perf(BQ^I_{Z_ℓ[r]})} Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ).
3. Import the free stable/idempotent completion universal property for exact finite-projective representations, then extend the kernel functor and its finite-set comparisons uniquely. The general all-prime LP3/LP4 inputs are requested, not replaced by restricted parameter-stack generation.
4. The free stable/idempotent completion gives containment of the image in the stable idempotent closure of the representation kernels. It does not lift arbitrary enhanced morphisms or idempotents, so it does not prove equality of that closure with the essential image.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [CoCartesian finite-set functoriality](#n-gs3-fusion-finite-set-functoriality-and-constant-terms) (`GS3:fusion/finite-set-functoriality-and-constant-terms`)
- [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) (`GS3:fusion/fusion-verdier-duality`)
- `LanglandsParameterStacks:LP3`
- `LanglandsParameterStacks:LP4`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:abstract/exact-functors`
- `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`
- `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`
- `VStackSheavesAndLisseCategories:VS3`
- `DiamondSixOperations:S6`

**Sources.**

- [FS](#src-fs), IX.2 p321. Exact relative Perf base change and stable completion used to export the local Satake kernel functor.

**Uses that shape the API.**

- HeckeStacksAndLocalShtukas:HS1: Imports this local enhanced kernel functor, then constructs the global Hecke action; it does not own the extension.
- FS IX.2: Scalar extension and stable exactness are used before applying global Hecke correspondences.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.perfectSatakeFunctor` | constructor | The exact Perf(BQ^I)-linear monoidal functor on Perf(B(Ĝ⋊Q)^I). |
| `TauCeti.GeometricSatake.perfectSatake_onRepresentation` | compatibility | On a finite-projective representation V its value is D(S_V)^∨ in local enhanced convolution. |
| `TauCeti.GeometricSatake.perfectSatake_baseChange` | functoriality | Scalar extension Λ→Λ′ commutes with the functor through the specified relative Perf base-change equivalence. |
| `TauCeti.GeometricSatake.perfectSatake_exact` | structure | The extension preserves zero objects, cofibres, shifts and retracts. |
| `TauCeti.GeometricSatake.perfectSatake_finiteSets` | compatibility | The extension of all collision, permutation and unit comparisons has the same composition coherences. |
| `TauCeti.GeometricSatake.perfectSatake_unique` | universal-property | Restriction along the representation embedding identifies the space of exact linear monoidal extensions with that of exact linear monoidal representation functors. A specified coherent isomorphism of restriction functors extends uniquely in this sense; agreement of object values alone is insufficient. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_perfect_unit` | degenerate | The trivial representation gives the convolution unit. |
| `TauCeti.GeometricSatake.test_perfect_shift` | compatibility | V[1] gives D(S_V)^∨[1]; it is not represented by an unrelated perverse object in degree zero. |
| `TauCeti.GeometricSatake.test_perfect_badPrimeAllowed` | non-example | For G=SL₂ and ℓ=2≠p, whose dual PGL₂ has π₁ of order two, this extension remains in scope; no π₁ invertibility predicate is imposed. |

**Acceptance.**

- A degree-zero finite projective V goes to D(S_V)^∨ with the specified relative duality.
- The coefficient unit maps to the convolution unit and a shift V[1] maps to the kernel shift.
- The statement holds at ℓ dividing π₁(Ĝ) torsion or |Q|; it uses none of the spectral-action exclusions.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.5](#gap-g3-5) (General relative Perf(BG) suppliers at all primes); gap [G3.6](#gap-g3-6) (Enhanced convolution and coefficient duality adapter); request [R3.10](#req-r3-10) to `LanglandsParameterStacks:LP3`; request [R3.11](#req-r3-11) to `LanglandsParameterStacks:LP4`; request [R3.15](#req-r3-15) to `VStackSheavesAndLisseCategories:VS3`; request [R3.16](#req-r3-16) to `DiamondSixOperations:S6`.

<a id="layer-gs4-classical-satake-comparison"></a>

### GS4:classical-Satake-comparison — A downstream comparison, not an input

Assume G unramified with a reductive integral model and hyperspecial K, and
rational coefficients containing r = √q. Frobenius descent is extra structure
on an object; the comparison uses an actual finite-type bounded special-fibre
model and the constructible Frobenius trace theorem (SF.2). IC_μ =
j_{!*}L[d_μ](d_μ/2) has leading raw trace (−1)^{d_μ}r^{−d_μ}; multiplying the
alternating trace by the parity sign leaves r^{−d_μ}, which is +1 for the unit
and removes the sign of an odd minuscule object. This normalized trace is
compatible with convolution because parities add. SR.4 supplies the classical
transform with vol(K) = 1 and vol(N(O_E)) = 1; in the split case
S(f)(t) = δ_B(t)^{1/2}∫_N f(tn)dn with δ_B(λ(π))^{1/2} = q^{−⟨ρ,λ⟩}, which the
shifted weight functor and its half twist reproduce. For minuscule μ,
τ = r^{−d_μ}1_{Kμ(π)K}; for nonminuscule μ the IC function has lower terms. The
nonsplit unramified comparison keeps SR.4's relative Frobenius-twisted datum
and is gap [G3.7](#gap-g3-7). This comparison is downstream of both constructions
and is never a prerequisite of integral Satake, fusion, rational reductivity or
the classical transform.

#### Normalized Frobenius function

<a id="n-gs4-classical-satake-comparison-normalized-frobenius-function"></a>
`GS4:classical-Satake-comparison/normalized-frobenius-function` · definition · planet: **Normalized Frobenius function**

**Library:** `TauCeti/GeometricSatake/ClassicalComparison`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Assume G is unramified with a reductive O_E-model and hyperspecial K=G(O_E), and work rationally over a field L containing Q_ℓ and a chosen r with r²=q. A bounded Satake object A with a specified Frobenius descent structure is represented on its finite-type special-fibre model. For homogeneous support parity ε(A), define τ_A(g)=(-1)^{ε(A)} Σ_i(-1)^i Tr(Frob_q;H^i(A_{ḡ})); add this over even/odd summands. Geometric Frobenius acts on L(1) by q^{-1}; for the explicit IC formulas use the canonical Frobenius descent of the constant sheaf on the open Schubert stratum, and the sheaf IC_μ is normalized as j_{!*}L[d_μ](d_μ/2), d_μ=⟨2ρ,μ⟩, using r^{-d_μ} for the half twist. The function is K-biinvariant with bounded double-coset support. A geometric object without Frobenius descent has no specified trace function.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Construction.**

1. Use the finite-type special-fibre model and Frobenius-equivariant constructible realization, rather than counting points of an arbitrary diamond.
2. Compute alternating stalk trace, multiply by the component parity, and use hyperspecial loop equivariance for K-biinvariance and bounded Schubert support for compact support.
3. The half twist supplies r^{-d_μ}, and the perverse shift supplies (-1)^{d_μ}; the parity factor cancels the latter.

**Direct prerequisites.**

- [Satake support parity](#n-gs3-fusion-support-parity) (`GS3:fusion/support-parity`)
- [One-leg ULA special/generic comparison](#n-gs1-integral-family-comparison) (`GS1/integral-family-comparison`)
- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- `SchemeAndStackFoundations:SF.2`
- `SmoothRepresentationsOfLocalGroups:SR.4`
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)

**Sources.**

- [Zhu](#src-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10). Relates IC weight cohomology to the spherical transform, with rational coefficients.
- [Gross](#src-gross), §3 pp6–8, (3.3), (3.4), (3.6), (3.13); §8 pp15–16 for choices of normalization. Modulus/half-root and minuscule coefficients; the packet separately tracks the perverse parity sign. Section 8 distinguishes central parameter normalizations.

**Uses that shape the API.**

- Classical Satake comparison: Compares the constructed geometric equivalence with the classical SR.4 transform using fixed normalization.
- Gross (3.13): Checks the leading/minuscule coefficient rather than equating IC basis functions with unscaled double-coset indicators.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.normalizedTraceFunction` | constructor | The parity-corrected alternating geometric Frobenius stalk trace of a Frobenius-descended Satake object. |
| `TauCeti.GeometricSatake.normalizedTrace_add` | simp | Direct sums add trace functions, with parity correction applied separately to the two component summands. |
| `TauCeti.GeometricSatake.normalizedTrace_halfTwist` | compatibility | For any integer d, twisting the specified descent by (d/2) multiplies the geometric Frobenius trace by r^{-d}. |
| `TauCeti.GeometricSatake.normalizedTrace_biinvariant` | characterisation | Values are constant on K-double cosets and vanish outside finitely many bounded relative positions. |
| `TauCeti.GeometricSatake.normalizedTrace_minuscule` | example | For a minuscule μ with canonical constant-sheaf IC Frobenius descent, τ_{IC_μ}=r^{-d_μ}1_{Kμ(π)K}; scaling the descent scales this function. |

**Unit tests.**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.GeometricSatake.test_trace_unit` | degenerate | τ_unit=1_K with coefficient +1. Use the canonical constant-sheaf/IC Frobenius descent. |
| `TauCeti.GeometricSatake.test_trace_torusWeight` | computation | For G_m and weight n, τ is 1_{π^n O_E^×}. Use the canonical constant-sheaf/IC Frobenius descent. |
| `TauCeti.GeometricSatake.test_trace_oddMinuscule` | non-example | For split PGL₂ and its minuscule d=1, τ=r^{-1}1_{Kμ(π)K}, whereas the raw alternating trace is -r^{-1}1_{Kμ(π)K}. Use the canonical constant-sheaf/IC Frobenius descent. |

**Acceptance.**

- The zero-weight object gives the characteristic function of K.
- For a split torus weight μ the function is the characteristic function of μ(π)K.
- For odd minuscule d, the uncorrected alternating trace is negative; the normalized function has leading coefficient r^{-d}.
- These formulas use the canonical constant-sheaf/IC Frobenius descent; scaling that descent scales the trace.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.8](#gap-g3-8) (Finite-model Frobenius trace handoff); request [R3.12](#req-r3-12) to `SmoothRepresentationsOfLocalGroups:SR.4`; request [R3.13](#req-r3-13) to `SchemeAndStackFoundations:SF.2`.

#### Frobenius trace and convolution

<a id="n-gs4-classical-satake-comparison-trace-convolution"></a>
`GS4:classical-Satake-comparison/trace-convolution` · theorem

**Library:** `TauCeti/GeometricSatake/ClassicalComparison`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

Normalize Haar measure on G(E) by vol(K)=1. For Frobenius-descended rational Satake objects, τ_{A*B}=τ_A*τ_B, where the right side is spherical Hecke convolution with this measure; unit maps to 1_K. The same assertion holds for the existing convolution via its fusion comparison. This is additive on the Grothendieck group of the exact Frobenius-descended category, not an equivalence between all Weil sheaves and arbitrary functions.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. On the finite-type bounded convolution correspondence use Künneth for stalk tensor traces and the proper/compact-support Frobenius trace formula for pushforward. The rational point sum matches double-coset convolution with vol(K)=1.
2. Parity adds under convolution, so its correction factors multiply. The correspondence trace comparison descends through the perfection/model identifications.

**Direct prerequisites.**

- [Normalized Frobenius function](#n-gs4-classical-satake-comparison-normalized-frobenius-function) (`GS4:classical-Satake-comparison/normalized-frobenius-function`)
- [Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) (`GS3:fusion/fusion-product-and-sign-rule`)
- [Ambient Hecke convolution](#n-gs2-correspondences-convolution-diagram) (`GS2:correspondences/convolution-diagram`)
- `SchemeAndStackFoundations:SF.2`
- `SmoothRepresentationsOfLocalGroups:SR.4`
- [Perfect models and étale realization](#n-gs0-witt-geometry-perfect-model-and-etale-comparison) (`GS0:Witt-geometry/perfect-model-and-etale-comparison`)

**Sources.**

- [Zhu](#src-zhu), §2.1 pp430–433 and §2.2 pp434–436. Convolution is proper bounded pushforward, and the trace comparison uses this geometric construction.
- [Gross](#src-gross), §2–§3 pp3–7, measure convention quoted in §3. The imported classical transform uses a specified compact-subgroup Haar normalization; no new transform is constructed here.

**Acceptance.**

- For a torus, the two weight indicator functions convolve to the sum-weight indicator.
- Rescaling Haar measure would change the product and destroy the unit test.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.8](#gap-g3-8) (Finite-model Frobenius trace handoff); request [R3.12](#req-r3-12) to `SmoothRepresentationsOfLocalGroups:SR.4`; request [R3.13](#req-r3-13) to `SchemeAndStackFoundations:SF.2`.

#### Frobenius trace and normalized constant terms

<a id="n-gs4-classical-satake-comparison-trace-constant-term"></a>
`GS4:classical-Satake-comparison/trace-constant-term` · theorem

**Library:** `TauCeti/GeometricSatake/ClassicalComparison`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

In the split case choose B=TN and dn on N(E) with vol(N(O_E))=1. The classical transform imported from SR.4 is S(f)(t)=δ_B(t)^{1/2}∫_N f(tn)dn, where δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}. For a Frobenius-descended normalized IC object, S(τ_A) is the weight-by-weight Frobenius character of its normalized cohomology fibre, with the shifted constant-term degree ⟨2ρ,λ⟩ and the matching half Tate normalization included. Here normalized fibre means the weight fibre of the transported normalized dual representation: the geometric cohomological Weil twist must be undone; it is not the unmodified ungraded total-cohomology trace. The corresponding statement for a Levi uses deg_P and the difference ρ_G−ρ_M. For unramified nonsplit G descend this formula using the relative Weyl/Frobenius datum supplied by SR.4; the split integral over N is not copied verbatim with absolute weights.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. The compact-support trace formula on each semi-infinite weight intersection turns CT into the N-integral. Cohomological degree shift gives (-1)^{deg}, and the normalized half twist and Haar modulus give q^{-⟨ρ,λ⟩}.
2. Apply Zhu (2.2.7)–(2.2.10) to the IC weight calculation. Track ordinary character rather than a supercharacter using the parity correction.
3. For nonsplit unramified groups use the Frobenius-equivariant model and relative SR.4 transform; the exact descent/source adapter is recorded as a gap.

**Direct prerequisites.**

- [Normalized Frobenius function](#n-gs4-classical-satake-comparison-normalized-frobenius-function) (`GS4:classical-Satake-comparison/normalized-frobenius-function`)
- [Symmetric constant terms](#n-gs3-fusion-symmetric-constant-term) (`GS3:fusion/symmetric-constant-term`)
- [Levi naturality and normalization](#n-gs4-integral-dual-group-levi-naturality) (`GS4:integral-dual-group/levi-naturality`)
- `SchemeAndStackFoundations:SF.2`
- `SmoothRepresentationsOfLocalGroups:SR.4`
- `ReductiveGroupsPartII:RG2.5`

**Sources.**

- [Gross](#src-gross), §3 pp6–8, equations (3.4), (3.5), (3.6). Exact classical modulus and transform conventions.
- [Zhu](#src-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10). The rational IC/weight calculation underlying classical comparison, not a construction of integral fusion.

**Acceptance.**

- For a split torus N=1 and δ=1, so the transform is identity on weight indicators.
- For a split minuscule μ, the coefficient of each extremal weight matches the normalized representation character; omitting the half twist inserts q^{⟨ρ,μ⟩}.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.7](#gap-g3-7) (Classical comparison on unramified nonsplit groups); gap [G3.8](#gap-g3-8) (Finite-model Frobenius trace handoff); request [R3.3](#req-r3-3) to `ReductiveGroupsPartII:RG2.5`; request [R3.12](#req-r3-12) to `SmoothRepresentationsOfLocalGroups:SR.4`; request [R3.13](#req-r3-13) to `SchemeAndStackFoundations:SF.2`.

#### Classical and geometric Satake comparison

<a id="n-gs4-classical-satake-comparison-classical-satake-comparison"></a>
`GS4:classical-Satake-comparison/classical-satake-comparison` · theorem · planet: **Classical Satake comparison**

**Library:** `TauCeti/GeometricSatake/ClassicalComparison`, namespace `TauCeti.GeometricSatake`. **Also realises:** `GS4`.

For the unramified/hyperspecial finite-field setting, the diagram from Frobenius-descended rational Satake objects to spherical Hecke functions by τ and to normalized dual representations by Satake commutes with the SR.4 spherical transform and Frobenius character on the dual torus. In the split IC basis with its canonical constant-sheaf Frobenius descent, S(τ_{IC_μ})=χ_μ and S(1_{Kμ(π)K})=q^{⟨ρ,μ⟩}χ_μ plus lower dominant characters; for minuscule μ the lower terms vanish. The nonsplit statement uses the appropriate Frobenius-twisted/relative character datum of SR.4. Both constructions precede this comparison; none of integral reconstruction, rational reductivity, SR.4 or fusion depends on it.

**Hypotheses.**

- Standing hypotheses S1, S2, S3 ([Conventions](#standing-hypotheses)).

**Proof outline.**

1. Use the normalized trace/constant-term equality to identify all weight coefficients with the dual character, then apply the already constructed SR.4 isomorphism.
2. The IC leading term is r^{-d_μ} times the top double-coset indicator, so the triangular comparison agrees with Gross (3.9)–(3.13) and Zhu (2.2.7)–(2.2.10).
3. Descend the commuting diagram with Frobenius and the pinned action in the unramified nonsplit case. Keep this source match as a named refinement rather than pretending the split Gross preprint proves it.

**Direct prerequisites.**

- [Normalized integral Satake equivalence](#n-gs4-integral-dual-group-normalized-satake-equivalence) (`GS4:integral-dual-group/normalized-satake-equivalence`)
- [Frobenius trace and convolution](#n-gs4-classical-satake-comparison-trace-convolution) (`GS4:classical-Satake-comparison/trace-convolution`)
- [Frobenius trace and normalized constant terms](#n-gs4-classical-satake-comparison-trace-constant-term) (`GS4:classical-Satake-comparison/trace-constant-term`)
- [Geometric rational semisimplicity](#n-gs4-rational-reductivity-rational-semisimplicity) (`GS4:rational-reductivity/rational-semisimplicity`)
- `SmoothRepresentationsOfLocalGroups:SR.4`

**Sources.**

- [Gross](#src-gross), §3 pp7–8, Proposition 3.6 and (3.13). The triangular and minuscule classical formulas.
- [Zhu](#src-zhu), §2.2 pp434–436, (2.2.7)–(2.2.10). The geometric IC character comparison provides the downstream rational bridge.

**Acceptance.**

- For G_m and weight n both paths give z^n.
- For PGL₂ minuscule μ, S(r^{-1}1_{Kμ(π)K}) is the SL₂ standard character z+z^{-1}.
- An unnormalized odd perverse trace would give its negative and fails the comparison.

**Open obligations:** gap [G3.1](#gap-g3-1) (Formal geometric and enhanced carriers in the suggested signatures); gap [G3.7](#gap-g3-7) (Classical comparison on unramified nonsplit groups); request [R3.12](#req-r3-12) to `SmoothRepresentationsOfLocalGroups:SR.4`.

<a id="dependencies"></a>

## Dependencies

The declaration graph of the two packets together is acyclic, also with every
other packet on main. The table lists the dependencies between layers that the
declarations induce, and whether the atlas records the edge. Edges that the atlas
does not record are induced by the declarations.

| From | To | Node prerequisites | Atlas edge |
| --- | --- | ---: | --- |
| `GS0:loop-geometry` | `GS0:Schubert-smoothness` | 3 | yes |
| `GS0:loop-geometry` | `GS0:Witt-geometry` | 2 | yes |
| `GS0:loop-geometry` | `GS1` | 5 | yes |
| `GS0:loop-geometry` | `GS2:Satake-closure` | 1 | no |
| `GS0:loop-geometry` | `GS2:correspondences` | 1 | no |
| `GS0:loop-geometry` | `GS3:fusion` | 7 | no |
| `GS0:loop-geometry` | `GS4:integral-dual-group` | 10 | no |
| `GS0:loop-geometry` | `GS4:rational-reductivity` | 1 | no |
| `GS0:Schubert-smoothness` | `GS1` | 3 | no |
| `GS0:Witt-geometry` | `GS0:loop-geometry` | 1 | **reverse edge recorded** |
| `GS0:Witt-geometry` | `GS1` | 4 | yes |
| `GS0:Witt-geometry` | `GS2:Satake-closure` | 1 | no |
| `GS0:Witt-geometry` | `GS2:correspondences` | 3 | no |
| `GS0:Witt-geometry` | `GS4:classical-Satake-comparison` | 2 | no |
| `GS0:Witt-geometry` | `GS4:rational-reductivity` | 1 | no |
| `GS1` | `GS2:Satake-closure` | 6 | no |
| `GS1` | `GS2:correspondences` | 7 | yes |
| `GS1` | `GS3:fusion` | 4 | yes |
| `GS1` | `GS4:classical-Satake-comparison` | 1 | no |
| `GS1` | `GS4:integral-dual-group` | 6 | no |
| `GS1` | `GS4:rational-reductivity` | 5 | yes |
| `GS2:correspondences` | `GS2:Satake-closure` | 4 | yes |
| `GS2:correspondences` | `GS3:fusion` | 12 | yes |
| `GS2:correspondences` | `GS4:classical-Satake-comparison` | 1 | no |
| `GS2:correspondences` | `GS4:integral-dual-group` | 7 | no |
| `GS2:correspondences` | `GS4:rational-reductivity` | 2 | no |
| `GS2:Satake-closure` | `GS3:fusion` | 3 | **reverse edge recorded** |
| `GS2:Satake-closure` | `GS4:integral-dual-group` | 3 | yes |
| `GS2:Satake-closure` | `GS4:rational-reductivity` | 3 | no |
| `GS3:fusion` | `GS4:classical-Satake-comparison` | 3 | no |
| `GS3:fusion` | `GS4:integral-dual-group` | 22 | yes |
| `GS3:fusion` | `GS4:rational-reductivity` | 2 | yes |
| `GS4:integral-dual-group` | `GS4:classical-Satake-comparison` | 3 | yes |
| `GS4:integral-dual-group` | `GS4:rational-reductivity` | 2 | **reverse edge recorded** |
| `GS4:rational-reductivity` | `GS4:classical-Satake-comparison` | 1 | no |
| `GS4:rational-reductivity` | `GS4:integral-dual-group` | 3 | yes |

Three layer-level conflicts follow from this table; the declarations
themselves are not circular.

1. **Closure before fusion.** Closure and rigidity (GS2:Satake-closure) are
   used by fusion ([Fusion product and ordinary symmetry](#n-gs3-fusion-fusion-product-and-sign-rule) and
   [Fusion and Verdier duality](#n-gs3-fusion-fusion-verdier-duality) cite
   [Closure of Satake under convolution](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability)),
   while the atlas has the edge GS3:fusion → GS2:Satake-closure. The atlas skips
   whichever edge would close the cycle. Structural proposals 3 and 6 (one
   proposal, recorded in both packets) remove the atlas edge, add
   GS2:Satake-closure → GS3:fusion and retitle the layer "Convolution closure
   and rigidity".
2. **Loop geometry and Witt geometry.** [Affine flags and Demazure spaces over Spd O_C](#n-gs0-loop-geometry-affine-flag-demazure)
   (GS0:loop-geometry) uses [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity)
   (GS0:Witt-geometry), while [Integral bounded Grassmannian families](#n-gs0-witt-geometry-integral-family-bounded-properness)
   uses [Ordered legs and divisor base change](#n-gs0-loop-geometry-ordered-leg-base-change) and
   [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness), matching the atlas
   edge GS0:loop-geometry → GS0:Witt-geometry. Inside this roadmap the affine
   flag declaration is used only by GS1. Moving it to the aggregate layer GS0
   (or to GS1) removes the cycle; GS0 has no planets, whereas GS0:Witt-geometry
   and GS1 already have six each, so the declaration keeps its planet "Demazure
   spaces" under GS0. This is structural proposal
   5.
3. **Reconstruction and rational reductivity.** The reconstruction group of
   GS4:integral-dual-group ([Geometric Satake coordinate Hopf algebra](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra),
   [Multileg and coefficient reconstruction](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction)) is
   used by GS4:rational-reductivity, which is used by the identification group
   ([Torus and rank-one identification](#n-gs4-integral-dual-group-torus-and-rank-one-identification),
   [Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum),
   [Rational Witt vector geometric Satake equivalence](#n-gs4-integral-dual-group-witt-rational-satake-equivalence)). The four
   reconstruction declarations use only declarations of GS0–GS3 and each
   other, and no other declaration of GS4. A sub-layer
   GS4:reconstruction holding them, between GS3:fusion and
   GS4:rational-reductivity, removes the cycle; it takes the planet "Satake
   coordinate Hopf algebra" with it. This is structural proposal 9.

**Facts used without a declaration of their own.** Three facts used by layers
GS3–GS4 are not stated by any declaration of GS0–GS2, though they follow from
those declarations: the fibre functor commutes with the one-leg restrictions
of [One-leg Satake equivalence](#n-gs2-satake-closure-one-leg-satake-comparison) (proper base change for
the locally constant F of [Satake cohomology functor](#n-gs2-correspondences-satake-fibre-functor));
S_λ ∩ Gr_{≤μ} is empty unless the dominant representative of λ is ≤ μ (used for
the convex-hull bound in [Weight torus and generic root datum](#n-gs4-integral-dual-group-generic-root-datum);
it follows from [Generic Schubert bounds](#n-gs0-loop-geometry-schubert-bounds-and-properness) and
the closure relations of
[Semi-infinite strata and constant terms](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization)); and
S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ,μ⟩ (used in
[Rational Witt vector geometric Satake equivalence](#n-gs4-integral-dual-group-witt-rational-satake-equivalence);
[Mirković–Vilonen intersections](#n-gs0-witt-geometry-semi-infinite-intersections-and-mv-cycles) gives the
dimension ⟨ρ,μ+λ⟩ of nonempty intersections but not irreducibility). Each is a short consequence of the
declarations named with it and belongs as a lemma to GS1 or GS2; it is used
inside the proofs of the GS3–GS4 declarations listed and is not a gap.

Inside this document each declaration is printed after every declaration of
this roadmap that it uses, with one exception: the affine flag declaration in
GS0:loop-geometry uses [Witt affine flags and components](#n-gs0-witt-geometry-parahoric-ind-projectivity),
printed later in GS0:Witt-geometry (conflict 2 above).

## Coverage

Every layer is planned and none is closed. The remaining work of each layer is
the list below; each item is a gap or request of this document, or an exact
refinement named at a declaration.

| Layer | Status | Remaining |
| --- | --- | --- |
| [`GS0`](#layer-gs0) | planned | Resolve the SF/RF/RG supplier refinements inherited from the three substages. |
| [`GS0:Schubert-smoothness`](#layer-gs0-schubert-smoothness) | planned | RG Lie-weight/parabolic computation and the CS finite-projectivity/period-sheaf supplier interfaces. |
| [`GS0:Witt-geometry`](#layer-gs0-witt-geometry) | planned | Boundary pinching before Keel; corrected truncated-Witt cone-factor interface; sketch-only canonical Hodge determinant comparison.; Compatible bounded pfp flag models, local-model functoriality and componentwise adjoint fibre-dimension transfer. |
| [`GS0:loop-geometry`](#layer-gs0-loop-geometry) | planned | RF4 torsor gluing/Anschütz extension and integral/parahoric RG refinements.; Exact geometric Lean signatures after supplier carriers are available.; The separate FS VI.1.13 lift-functor target requires RF2 integral geometric-support and closed support-map contracts, and its exact geometric Lean carrier remains omitted. |
| [`GS1`](#layer-gs1) | planned | Model-dependent rational MV trace normalization and corrected quasi-minuscule/minimal-generation argument.; Application and descent of the existing VS1 hyperbolic/ULA calculus through bounded finite-dimensional Artin Hecke quotient charts, plus the EDS Ind t-structure extension.; EDC5 coefficient reduction/adic and torsion-pair scope; VS1 filtered-equivariance ordinary-cohomology continuity.; Exact geometric signatures for the length and lattice-position semicontinuity lemmas require the integral geometric-DVR/fibre-map and bounded rank-one fibre-detection supplier extensions; their full mathematical contracts are planned here. |
| [`GS2`](#layer-gs2) | planned | Resolve the coherent correspondence/stack-kernel refinements inherited from the two substages. |
| [`GS2:Satake-closure`](#layer-gs2-satake-closure) | planned | Proper-relative ULA evaluation/coevaluation with both triangle identities and the compatible one-leg comparison. |
| [`GS2:correspondences`](#layer-gs2-correspondences) | planned | Enhanced associator/unit coherence and filtered finite-projective fibre comparison, with no canonical tensor splitting yet. |
| [`GS3`](#layer-gs3) | planned | Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter |
| [`GS3:fusion`](#layer-gs3-fusion) | planned | Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter |
| [`GS4`](#layer-gs4) | planned | Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter; Bounded adjunction coefficient and coequalizer verification; RG2.3 needs the general Prasad–Yu scope addition; General relative Perf(BG) suppliers at all primes; Enhanced convolution and coefficient duality adapter; Classical comparison on unramified nonsplit groups; Finite-model Frobenius trace handoff; Weil-restriction local tensor comparison; Integral-point supplier refinement; Rank-one special-fibre image at ℓ = 2; Zhu's equivalence outside the FS comparison |
| [`GS4:classical-Satake-comparison`](#layer-gs4-classical-satake-comparison) | planned | Formal geometric and enhanced carriers in the suggested signatures; Classical comparison on unramified nonsplit groups; Finite-model Frobenius trace handoff |
| [`GS4:integral-dual-group`](#layer-gs4-integral-dual-group) | planned | Formal geometric and enhanced carriers in the suggested signatures; Drinfeld and Frobenius convention adapter; Bounded adjunction coefficient and coequalizer verification; RG2.3 needs the general Prasad–Yu scope addition; General relative Perf(BG) suppliers at all primes; Enhanced convolution and coefficient duality adapter; Weil-restriction local tensor comparison; Integral-point supplier refinement; Rank-one special-fibre image at ℓ = 2; Zhu's equivalence outside the FS comparison |
| [`GS4:rational-reductivity`](#layer-gs4-rational-reductivity) | planned | Formal geometric and enhanced carriers in the suggested signatures; Zhu's equivalence outside the FS comparison |

<a id="requests-to-other-roadmaps"></a>

## Requests to other roadmaps

Where no exact node of another roadmap states what a declaration needs, the
declaration cites the supplier layer and the statement needed is requested
here, numbered R0.n for layers GS0–GS2 and R3.n for layers GS3–GS4. A request
names an obligation of its supplier; it does not assert that the supplier
already provides it. Request R3.21 is addressed to this roadmap's own layer
GS2:correspondences: the characteristic-two rank-one repair needs a modular
Hom calculation for the minuscule PGL₂ convolution that no declaration of
GS2:correspondences states yet.

<a id="req-r0-1"></a>

- **R0.1** (layers GS0–GS2) to `CrystallineCohomology:CR.1`. Evaluate a locally free crystal on perfect Witt thickenings and obtain its finite projective values and quotient mod p, functorially in perfect bases; the sublattice Grassmannian construction uses this evaluation (Zhu 1.14). Needed by [`GS0:Witt-geometry/witt-demazure-resolution`](#n-gs0-witt-geometry-witt-demazure-resolution), [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models).

<a id="req-r0-2"></a>

- **R0.2** (layers GS0–GS2) to `CrystallineCohomology:CR.7`. The Dieudonné-crystal and Hodge-determinant family interface for Zhu’s canonical Demazure models, compatible with R07’s conventions and the ramified coefficient summands. It does not reprove the classification in R07.2. Needed by [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models).

<a id="req-r0-3"></a>

- **R0.3** (layers GS0–GS2) to `EnhancedDerivedSheaves:E3`. Enhanced coherent composition of pull–push correspondences with external tensor, higher associativity/unit maps and Ind extension, compatible with DSO exchange/pasting and VS0 Artin descent. A homotopy-category pentagon statement alone does not give the needed coherent ambient convolution. Needed by [`GS2:correspondences/convolution-diagram`](#n-gs2-correspondences-convolution-diagram), [`GS2:correspondences/convolution-associativity-and-unit`](#n-gs2-correspondences-convolution-associativity-and-unit).

<a id="req-r0-4"></a>

- **R0.4** (layers GS0–GS2) to `EnhancedDerivedSheaves:E5:presentability`. Lurie HA 1.4.4.11 extension of a generated t-structure to the Ind category, with the small stable generators, closure and accessibility hypotheses checked for the relative perverse category. Existing universal-property-of-ind alone does not prove this extension. Needed by [`GS1/relative-perverse-t-structure`](#n-gs1-relative-perverse-t-structure).

<a id="req-r0-5"></a>

- **R0.5** (layers GS0–GS2) to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`. Dieudonné realization for the specified isogeny chains over perfect residue fields, with covariance, distinguished τ₀-summand, heights and Hodge filtration fixed as in Zhu B.7–B.8. General family crystal theory is requested separately. Needed by [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models).

<a id="req-r0-6"></a>

- **R0.6** (layers GS0–GS2) to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`. P-divisible-group deformation and Hodge-line comparison on the smooth projective canonical Demazure family in Zhu B.8–B.9; prove the scheme-map comparison stated only as an appendix sketch. Needed by [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models).

<a id="req-r0-7"></a>

- **R0.7** (layers GS0–GS2) to `KTheoryLowDegrees:Z.3`. Determinant of finite projective graded quotients, multiplicativity for short exact sequences and its Picard tensor comparison. This is the elementary determinant interface only; GS projectivity uses the geometric BS §6/§8 route, without BS §5’s K-theoretic determinant construction. Needed by [`GS0:Witt-geometry/geometric-determinant-line`](#n-gs0-witt-geometry-geometric-determinant-line), [`GS0:Witt-geometry/sl-determinant-normalization`](#n-gs0-witt-geometry-sl-determinant-normalization).

<a id="req-r0-8"></a>

- **R0.8** (layers GS0–GS2) to `PadicHodgeTheory:P8:local-rational`. Corrected relative O𝔅⁺_dR period sheaf, filtered integrable universal connection and Griffiths transversality on minuscule flag varieties, with [Sch13c, 7.9] and its corrigendum conventions, yielding the CS 3.4.5 surjectivity construction. Needed by [`GS0:Schubert-smoothness/minuscule-bialynicki-birula`](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula).

<a id="req-r0-9"></a>

- **R0.9** (layers GS0–GS2) to `ReductiveGroupsPartII:RG2.3`. Smooth affine integral/parahoric/Iwahori group models; faithful representations with quasi-affine quotient; compatible Greenberg jets, dilatations, finite-level torsor lifting and Weil-restriction comparisons. The field-only pinned reductive-group category is insufficient. Sources: Zhu 1.1/1.20; SW 19.4, 21.1–21.2; BS 9.2–9.6. Needed by [`GS0:loop-geometry/loop-groups-and-local-hecke`](#n-gs0-loop-geometry-loop-groups-and-local-hecke), [`GS0:loop-geometry/local-hecke-stack`](#n-gs0-loop-geometry-local-hecke-stack), [`GS0:loop-geometry/generic-galois-descent`](#n-gs0-loop-geometry-generic-galois-descent), [`GS0:loop-geometry/affine-flag-demazure`](#n-gs0-loop-geometry-affine-flag-demazure), [`GS0:loop-geometry/smooth-scheme-loops`](#n-gs0-loop-geometry-smooth-scheme-loops), [`GS0:Schubert-smoothness/truncated-positive-loops`](#n-gs0-schubert-smoothness-truncated-positive-loops), [`GS0:Witt-geometry/witt-lattice-functor-and-representability`](#n-gs0-witt-geometry-witt-lattice-functor-and-representability), [`GS0:Witt-geometry/zhu-finite-jet-presentation`](#n-gs0-witt-geometry-zhu-finite-jet-presentation), [`GS0:Witt-geometry/zhu-original-algebraic-space`](#n-gs0-witt-geometry-zhu-original-algebraic-space), [`GS0:Witt-geometry/parahoric-ind-projectivity`](#n-gs0-witt-geometry-parahoric-ind-projectivity), [`GS0:Witt-geometry/integral-parahoric-properness`](#n-gs0-witt-geometry-integral-parahoric-properness), [`GS1/standard-costandard-torsion-bound`](#n-gs1-standard-costandard-torsion-bound).

<a id="req-r0-10"></a>

- **R0.10** (layers GS0–GS2) to `ReductiveGroupsPartII:RG2.4`. Affine Weyl and extended Weyl data, length/Bruhat order, admissible sets, Cartan and Iwasawa decompositions, rank-one ordinary/Demazure convolution, Kottwitz inertia-component labels, and componentwise adjoint flag comparison with p prime to |π₁(G_ad)| when required by the corrected GHN theorem. Sources: Zhu 1.4, He 5.6 and its GH10/GHN imports. These strengthen this stage’s existing direction. Needed by [`GS0:loop-geometry/schubert-bounds-and-properness`](#n-gs0-loop-geometry-schubert-bounds-and-properness), [`GS0:loop-geometry/affine-flag-demazure`](#n-gs0-loop-geometry-affine-flag-demazure), [`GS0:Witt-geometry/parahoric-ind-projectivity`](#n-gs0-witt-geometry-parahoric-ind-projectivity), [`GS0:Witt-geometry/integral-parahoric-properness`](#n-gs0-witt-geometry-integral-parahoric-properness), [`GS0:Witt-geometry/bounded-admissible-flags`](#n-gs0-witt-geometry-bounded-admissible-flags), [`GS0:Witt-geometry/flag-incidence-correspondences`](#n-gs0-witt-geometry-flag-incidence-correspondences), [`GS0:Witt-geometry/flag-convolution-fibres`](#n-gs0-witt-geometry-flag-convolution-fibres), [`GS1/semi-infinite-orbits-and-hyperbolic-localization`](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization), [`GS1/rational-weight-concentration`](#n-gs1-rational-weight-concentration).

<a id="req-r0-11"></a>

- **R0.11** (layers GS0–GS2) to `ReductiveGroupsPartII:RG2.1`. Import absolute Lie/adjoint and root/parabolic theory from the existing ReductiveGroups layers 2 and 7. Extend RG2.1 only by its relative/integral cocharacter-weight compatibility: Lie stabilizer weights ≤m, the opposite-parabolic convention, minuscule weights {−1,0,1}, and the dimension sum ⟨2ρ,μ⟩ after splitting. Compare CS and FS signs. RG2.5 constructs integral dual groups and supplies none of these geometric computations; do not re-plan the existing absolute theory. Needed by [`GS0:loop-geometry/congruence-filtration-and-graded-pieces`](#n-gs0-loop-geometry-congruence-filtration-and-graded-pieces), [`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness), [`GS0:Schubert-smoothness/truncation-of-the-loop-action`](#n-gs0-schubert-smoothness-truncation-of-the-loop-action), [`GS0:Schubert-smoothness/minuscule-bialynicki-birula`](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula), [`GS1/semi-infinite-affineness`](#n-gs1-semi-infinite-affineness), [`GS2:correspondences/satake-verdier-duality`](#n-gs2-correspondences-satake-verdier-duality).

<a id="req-r0-12"></a>

- **R0.12** (layers GS0–GS2) to `RelativeFarguesFontaine:RF4:G-torsors`. Beauville–Laszlo gluing and effective étale/v-descent for G-torsors on the completed Cartier divisor. RF2/v-descent-of-bundles-on-the-divisor supplies descent on each finite thickening only: additionally prove algebraization of compatible finite-projective modules over the complete quotient system, with uniform rank, complete continuous ring maps and effective descended transition data, before transferring via BG0 Tannakian torsors. Include Anschütz’s punctured A_inf extension/triviality theorem in SW 21.2.2 with its group-model hypotheses. Import RF2’s rings and finite-thickening descent; do not construct them again. Needed by [`GS0:loop-geometry/local-hecke-stack`](#n-gs0-loop-geometry-local-hecke-stack), [`GS0:loop-geometry/grassmannian`](#n-gs0-loop-geometry-grassmannian), [`GS0:Witt-geometry/integral-parahoric-properness`](#n-gs0-witt-geometry-integral-parahoric-properness), [`GS1/semi-infinite-affineness`](#n-gs1-semi-infinite-affineness).

<a id="req-r0-13"></a>

- **R0.13** (layers GS0–GS2) to `RelativeFarguesFontaine:RF4:vector-bundles`. The uniform Banach algebra finite-projectivity criterion [KL15, 2.8.4] used in CS 3.4.3–3.4.6: a finitely presented module with the required locally constant fibre rank is finite projective, and compatible sublattices are detected on geometric field points. Include the bounded rank-one submodule fibre-detection step in FS VI.3.2: for finitely generated open bounded B⁺l⊂L⊂B on an affinoid perfectoid base, equal geometric lattice fibres on a neighborhood imply B⁺l=L there. Do not assume L finite projective before proving that conclusion. Needed by [`GS0:Schubert-smoothness/minuscule-bialynicki-birula`](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula), [`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness), [`GS1/lattice-relative-position-semicontinuity`](#n-gs1-lattice-relative-position-semicontinuity).

<a id="req-r0-14"></a>

- **R0.14** (layers GS0–GS2) to `SchemeAndStackFoundations:SF.0`. Pfp perfect schemes/algebraic spaces and compatible finite-type models up to Frobenius, dimensions, base change and étale-topos invariance (BS 3; Zhu A.1–A.17), plus finite Greenberg realization and perfected Grassmann/Quot bundles. Coordinate-ring perfection is the DIRECT Frobenius colimit, not Mathlib’s inverse-limit Perfection. Needed by [`GS0:Witt-geometry/witt-types-and-bounds`](#n-gs0-witt-geometry-witt-types-and-bounds), [`GS0:Witt-geometry/zhu-finite-jet-presentation`](#n-gs0-witt-geometry-zhu-finite-jet-presentation), [`GS0:Witt-geometry/witt-demazure-resolution`](#n-gs0-witt-geometry-witt-demazure-resolution), [`GS0:Witt-geometry/connected-cohomological-fibres`](#n-gs0-witt-geometry-connected-cohomological-fibres), [`GS0:Witt-geometry/perfect-model-and-etale-comparison`](#n-gs0-witt-geometry-perfect-model-and-etale-comparison), [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models), [`GS0:Witt-geometry/rank-two-cone-chart`](#n-gs0-witt-geometry-rank-two-cone-chart), [`GS0:Witt-geometry/sections-on-witt-bounds`](#n-gs0-witt-geometry-sections-on-witt-bounds), [`GS0:Witt-geometry/flag-incidence-correspondences`](#n-gs0-witt-geometry-flag-incidence-correspondences), [`GS0:Witt-geometry/flag-convolution-fibres`](#n-gs0-witt-geometry-flag-convolution-fibres).

<a id="req-r0-15"></a>

- **R0.15** (layers GS0–GS2) to `SchemeAndStackFoundations:SF.1`. Effective quotients of separated pfp perfect spaces by smooth perfect affine torsors (Zhu A.29–A.31), normalized finite-jet quotients, and finite pushouts/pinching of a finite union of lower Schubert bounds along closed representable intersections BEFORE applying Keel. This repairs PAPER-BHATT-SCHOLZE-17/E39’s boundary representability gap. Needed by [`GS0:Witt-geometry/zhu-original-algebraic-space`](#n-gs0-witt-geometry-zhu-original-algebraic-space), [`GS0:Witt-geometry/witt-demazure-resolution`](#n-gs0-witt-geometry-witt-demazure-resolution), [`GS0:Witt-geometry/ampleness-via-keel`](#n-gs0-witt-geometry-ampleness-via-keel), [`GS0:Witt-geometry/perfect-model-and-etale-comparison`](#n-gs0-witt-geometry-perfect-model-and-etale-comparison), [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models), [`GS0:Witt-geometry/flag-incidence-correspondences`](#n-gs0-witt-geometry-flag-incidence-correspondences).

<a id="req-r0-16"></a>

- **R0.16** (layers GS0–GS2) to `SchemeAndStackFoundations:SF.3`. Proper pfp perfect connected-fibre full faithfulness/effective vector-bundle descent (BS 6.1, 6.8, 6.13), including the weaker connected-fibre criterion and compatibility with geometric base change; relative Grassmann structure cohomology, determinant/Picard tensor pullbacks and fibre-trivial line descent. Needed by [`GS0:Witt-geometry/connected-cohomological-fibres`](#n-gs0-witt-geometry-connected-cohomological-fibres), [`GS0:Witt-geometry/h-descent-and-fibral-criterion`](#n-gs0-witt-geometry-h-descent-and-fibral-criterion), [`GS0:Witt-geometry/geometric-determinant-line`](#n-gs0-witt-geometry-geometric-determinant-line).

<a id="req-r0-17"></a>

- **R0.17** (layers GS0–GS2) to `SchemeAndStackFoundations:SF.4`. Finite/formal Witt vector-bundle v-descent and acyclicity (BS 4.1, 4.4, 4.6), with repaired blowup reduction; integral local-model existence and functoriality identifying the finite admissible Schubert union with the reduced special fibre (GLX 3.3–3.4), and compatible bounded pfp fibre-product models. Local models are an extension in SF’s moduli direction, not an ADLV or shtuka replanning. Needed by [`GS0:Witt-geometry/witt-lattice-functor-and-representability`](#n-gs0-witt-geometry-witt-lattice-functor-and-representability), [`GS0:Witt-geometry/h-descent-and-fibral-criterion`](#n-gs0-witt-geometry-h-descent-and-fibral-criterion), [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models), [`GS0:Witt-geometry/bounded-admissible-flags`](#n-gs0-witt-geometry-bounded-admissible-flags), [`GS0:Witt-geometry/flag-convolution-fibres`](#n-gs0-witt-geometry-flag-convolution-fibres).

<a id="req-r0-18"></a>

- **R0.18** (layers GS0–GS2) to `SchemeAndStackFoundations:SF.5`. General nef/big/ample/semiample line bundles, exceptional locus, Kodaira decomposition, Keel’s characteristic-p criterion and union/exceptional-locus lemmas, Frobenius-power extension/descent of sections, Stein contraction, Serre vanishing and section growth on perfections. GS keeps only the BS 8.9–8.11 application; all general positivity has this single owner. Needed by [`GS0:Witt-geometry/determinant-positivity`](#n-gs0-witt-geometry-determinant-positivity), [`GS0:Witt-geometry/ampleness-via-keel`](#n-gs0-witt-geometry-ampleness-via-keel), [`GS0:Witt-geometry/sections-on-witt-bounds`](#n-gs0-witt-geometry-sections-on-witt-bounds), [`GS1/semi-infinite-affineness`](#n-gs1-semi-infinite-affineness).

<a id="req-r0-19"></a>

- **R0.19** (layers GS0–GS2) to `VStackSheavesAndLisseCategories:VS0`. Enhanced six operations and smooth equivariant descent for Artin v-stacks, including nonrepresentable quotient-stack maps, finite congruence charts and coherent proper-kernel correspondences. DSO’s eligible representable operations alone do not cover [*/L⁺G]. Needed by [`GS1/semi-infinite-orbits-and-hyperbolic-localization`](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization), [`GS2:correspondences/convolution-diagram`](#n-gs2-correspondences-convolution-diagram), [`GS2:correspondences/convolution-associativity-and-unit`](#n-gs2-correspondences-convolution-associativity-and-unit).

<a id="req-r0-20"></a>

- **R0.20** (layers GS0–GS2) to `VStackSheavesAndLisseCategories:VS1`. Import the existing VS1 hyperbolic-localization, braden-theorem, hyperbolic-base-change-duality-and-ula, kernel-correspondence-category, perfect-local-systems, ula-dualizability-criterion and ula-relative-adjoints-and-calculus nodes for their eligible representable-diamond scope; in particular IV.2.24 and IV.2.28 are already planned there. Supply their compatible application and descent through bounded finite-dimensional Artin Hecke quotient charts, retaining properness, finite relative dimension, monodromicity and the relevant coefficient hypotheses. Coordinate coherent bounded ind-correspondences with the existing EDS request and derived adic passage with L0. For FS VI.4.1 additionally construct complete congruence filtrations, filtered spatial ball-subgroup presentations, finite-quotient actions and inverse-limit ordinary-cohomology continuity, yielding RΓ(S,A)≃RΓ(S×H,A). This filtered-group extension is not supplied by the listed diamond-level nodes, by cohomological smoothness, by unshifted compact-support acyclicity, or by profinite prime-to-ℓ averaging. Needed by [`GS1/semi-infinite-orbits-and-hyperbolic-localization`](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization), [`GS1/ula-constant-term-criterion`](#n-gs1-ula-constant-term-criterion), [`GS2:correspondences/satake-verdier-duality`](#n-gs2-correspondences-satake-verdier-duality), [`GS2:Satake-closure/convolution-ula`](#n-gs2-satake-closure-convolution-ula), [`GS2:Satake-closure/satake-rigidity`](#n-gs2-satake-closure-satake-rigidity), [`GS1/prounipotent-equivariance`](#n-gs1-prounipotent-equivariance).

<a id="req-r0-21"></a>

- **R0.21** (layers GS0–GS2) to `EtaleDualityAndPerverseSheaves:EDC.5`. Export the early scheme perverse/recollement construction for the actual torsion and derived-complete adic coefficient rings of FS, with coefficient reduction/base change, and the integral O_ℓ torsion-pair conventions when used. Existing perverse-t-structure supplies finite fields, self-injective O/π^m and rational E only. For arbitrary Λ, use the geometric cell/field-devissage and 2dim compact-support proof of FS VI.7.4 rather than silently enlarging BBD’s coefficient hypotheses. Keep Verdier duality restricted to the appropriate flat/finite-Tor objects; no early EDC.7 input. Needed by [`GS1/relative-perverse-t-structure`](#n-gs1-relative-perverse-t-structure), [`GS1/perverse-descent-and-shifted-ct`](#n-gs1-perverse-descent-and-shifted-ct), [`GS1/flat-perverse-objects`](#n-gs1-flat-perverse-objects), [`GS1/standard-costandard-objects`](#n-gs1-standard-costandard-objects), [`GS2:correspondences/satake-fibre-functor`](#n-gs2-correspondences-satake-fibre-functor).

<a id="req-r0-22"></a>

- **R0.22** (layers GS0–GS2) to `RelativeFarguesFontaine:RF2:untilts`. Extend the generic geometric-divisor-complete-dvr target to a geometric marked O_E-untilt, including the special-characteristic leg: the positive completed Cartier ring is a complete DVR, its residue field is the untilt field and a primitive degree-one equation is a uniformizer. For finitely many ordered legs identify the geometric completed ring with the product over distinct supports, carrying actual fibre maps from the affinoid base; repeated legs retain their multiplicities in ξ and do not duplicate product factors. Include the Cartier-residue zero locus and restriction/division by ξ_i used in FS VI.3.3, with finite or infinite module lengths and their additivity. This is an extension of the actual RF2 integral Cartier completion and generic DVR contracts, not a second GS construction of period rings. Needed by [`GS1/length-semicontinuity`](#n-gs1-length-semicontinuity), [`GS1/lattice-relative-position-semicontinuity`](#n-gs1-lattice-relative-position-semicontinuity), [`GS0:loop-geometry/local-hecke-stack`](#n-gs0-loop-geometry-local-hecke-stack), [`GS0:loop-geometry/smooth-scheme-loops`](#n-gs0-loop-geometry-smooth-scheme-loops), [`GS0:loop-geometry/etale-over-divisor`](#n-gs0-loop-geometry-etale-over-divisor).

<a id="req-r0-23"></a>

- **R0.23** (layers GS0–GS2) to `RelativeFarguesFontaine:RF2:integral-divisors`. For any perfectoid S→Div^d_𝒴, construct the canonical support map |D_S|→|S| (via D_S^diamond⊂𝒴_S^diamond≃S×Spd O_E) and prove it is closed, compatibly with perfectoid base change. Thus for every open adic D′⊂D_S the locus of T→S on which all of D_T lands in D′ is the open complement of the image of |D_S|\|D′|. This is the geometric supplier used in FS VI.1.13; product Cartier equations and affineness alone do not state it. Needed by [`GS0:loop-geometry/etale-over-divisor`](#n-gs0-loop-geometry-etale-over-divisor).

<a id="req-r3-1"></a>

- **R3.1** (layers GS3–GS4) to `VStackSheavesAndLisseCategories:VS1`. IV.7.3 equivalence D_Lc(X×BW_E^I,Λ) ≅ D_Lc(X×(Div¹)^I,Λ) for locally constant perfect complexes, with degree-zero finite-projective specialization; positive-codimension partial-diagonal purity; ULA/hyperbolic-localization base change. Preserve the distinction from all D_et and explicitly identify the transported Tate character and its stalk/parameter action convention. Needed by [`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness), [`GS3:fusion/drinfeld-fibre-realization`](#n-gs3-fusion-drinfeld-fibre-realization), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification).

<a id="req-r3-2"></a>

- **R3.2** (layers GS3–GS4) to `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`. Local Weil group W_E, topology, inertia and geometric-Frobenius degree, product continuous finite-projective representation categories and Tate character convention. Existing Tau Ceti owner is imported, never reconstructed here. Needed by [`GS3:fusion/drinfeld-fibre-realization`](#n-gs3-fusion-drinfeld-fibre-realization).

<a id="req-r3-3"></a>

- **R3.3** (layers GS3–GS4) to `ReductiveGroupsPartII:RG2.5`. Pinned integral dual group/root datum, simple Levi and central-isogeny dual maps, finite pinned Weil action, product/Weil-restriction dual data, half-sum cocharacters and import the characteristic-zero highest-weight convex-hull bounds from the existing ReductiveGroups representation theory. Expose that upstream supplier rather than duplicate it in RG2.5. This is RG2.5, not the buildings or double-coset stage. Also the pinned split dual group over a characteristic-zero field with its dual Borel B̂ ⊃ T̂, as used by Zhu's §0.5 notation. Needed by [`GS3:fusion/support-parity`](#n-gs3-fusion-support-parity), [`GS3:fusion/symmetric-constant-term`](#n-gs3-fusion-symmetric-constant-term), [`GS4:rational-reductivity/generic-fibre-reductivity`](#n-gs4-rational-reductivity-generic-fibre-reductivity), [`GS4:integral-dual-group/torus-and-rank-one-identification`](#n-gs4-integral-dual-group-torus-and-rank-one-identification), [`GS4:integral-dual-group/generic-root-datum`](#n-gs4-integral-dual-group-generic-root-datum), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification), [`GS4:integral-dual-group/normalized-satake-equivalence`](#n-gs4-integral-dual-group-normalized-satake-equivalence), [`GS4:integral-dual-group/levi-naturality`](#n-gs4-integral-dual-group-levi-naturality), [`GS4:integral-dual-group/adjoint-isomorphism-naturality`](#n-gs4-integral-dual-group-adjoint-isomorphism-naturality), [`GS4:integral-dual-group/product-naturality`](#n-gs4-integral-dual-group-product-naturality), [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality), [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term), [`GS4:integral-dual-group/witt-rational-satake-equivalence`](#n-gs4-integral-dual-group-witt-rational-satake-equivalence).

<a id="req-r3-4"></a>

- **R3.4** (layers GS3–GS4) to `ReductiveGroupsPartII:RG2.3`. Prasad–Yu closed-immersion criterion (author preprint Cor1.3, published Cor5.2 cited by FS VI11.4): R a DVR, H/R reductive, H′/R affine finite type, f:H→H′ generically a closed immersion; assume residue characteristic ≠2 OR no normal algebraic subgroup of H_{K̄} is isomorphic to SO_{2n+1} (n≥1). Then f is a closed immersion. Simple connectedness of the generic derived group suffices at characteristic two. Add this general theorem alongside the existing Bruhat–Tits/parahoric material in RG2.3. Needed by [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction).

<a id="req-r3-5"></a>

- **R3.5** (layers GS3–GS4) to `ReductiveGroupsPartII:RG2.0`. For split Chevalley groups over Z̆_ℓ, integral points are the hyperspecial/maximal bounded subgroup and preserve a lattice in a given finite-dimensional generic representation; identify continuity and completed-unramified conventions. Needed by [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction).

<a id="req-r3-6"></a>

- **R3.6** (layers GS3–GS4) to `ReductiveGroupsPartII:RG2.4`. The split Chevalley integral points over Z̆_ℓ are generated by the dual torus and rank-one Levi integral points; provide the Iwasawa/root-subgroup argument used in FS VI11.1. Include the torus in rank zero. Needed by [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction).

<a id="req-r3-7"></a>

- **R3.7** (layers GS3–GS4) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`. For finite-type connected affine groups in characteristic zero, semisimplicity of finite-dimensional representations implies reductivity (equivalently linear reductivity here). Apply this existing upstream criterion only after the MC.6/DM finite-type and connectedness steps; do not attribute a general infinite pro-group theorem to this finite-type stage. Needed by [`GS4:rational-reductivity/generic-fibre-reductivity`](#n-gs4-rational-reductivity-generic-fibre-reductivity).

<a id="req-r3-8"></a>

- **R3.8** (layers GS3–GS4) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`. Pinned integral Chevalley–Demazure groups and isomorphism classification by based root datum, rank-one root maps and the pinned Chevalley involution; cite the existing upstream construction. By base change, also the isomorphism theorem for pinned split reductive groups over a field of characteristic zero, used by the rational Witt equivalence. Needed by [`GS4:integral-dual-group/torus-and-rank-one-identification`](#n-gs4-integral-dual-group-torus-and-rank-one-identification), [`GS4:integral-dual-group/generic-root-datum`](#n-gs4-integral-dual-group-generic-root-datum), [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction), [`GS4:integral-dual-group/chevalley-involution`](#n-gs4-integral-dual-group-chevalley-involution), [`GS4:integral-dual-group/witt-rational-satake-equivalence`](#n-gs4-integral-dual-group-witt-rational-satake-equivalence).

<a id="req-r3-9"></a>

- **R3.9** (layers GS3–GS4) to `EtaleDualityAndPerverseSheaves:EDC.7`. Rational pure-IC/decomposition theorem for the finite-type proper models/resolutions of bounded Witt Schubert spaces over an algebraic closure of a finite field, with parity/IC-boundary calculation and transport through perfection. No integral/mod-ℓ or arithmetic Weil semisimplicity. Needed by [`GS4:rational-reductivity/rational-semisimplicity`](#n-gs4-rational-reductivity-rational-semisimplicity).

<a id="req-r3-10"></a>

- **R3.10** (layers GS3–GS4) to `LanglandsParameterStacks:LP3`. General integral highest-weight theorem implying relative base change Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) tensor over Perf(BQ^I_{Z_ℓ[r]}) with Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ), for every ℓ≠p and coefficient Z_ℓ[r]-algebra Λ, without inverting π₁(Ĝ) torsion or |Q|. Existing prime-to-ℓ solvable Donkin-subgroup generation does not supply this theorem. Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="req-r3-11"></a>

- **R3.11** (layers GS3–GS4) to `LanglandsParameterStacks:LP4`. Universal stable idempotent completion of the exact category of finite-projective (Ĝ⋊Q)^I representations is Perf(B(Ĝ⋊Q)^I), with exact linear monoidal functor extension and finite-set coherence. This is the ordinary classifying-stack input of FS IX2 p321, not the parameter-stack Perf generation theorem subject to ℓ∤|π₁(Ĝ)_tors|. Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="req-r3-12"></a>

- **R3.12** (layers GS3–GS4) to `SmoothRepresentationsOfLocalGroups:SR.4`. Already constructed spherical Hecke algebra and normalized Satake transform for unramified G/E and hyperspecial K, vol(K)=1, vol(N(O_E))=1, δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}; specify split and nonsplit relative/Frobenius-twisted versions and sqrt(q). This packet only compares with it. Needed by [`GS4:classical-Satake-comparison/normalized-frobenius-function`](#n-gs4-classical-satake-comparison-normalized-frobenius-function), [`GS4:classical-Satake-comparison/trace-convolution`](#n-gs4-classical-satake-comparison-trace-convolution), [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term), [`GS4:classical-Satake-comparison/classical-satake-comparison`](#n-gs4-classical-satake-comparison-classical-satake-comparison).

<a id="req-r3-13"></a>

- **R3.13** (layers GS3–GS4) to `SchemeAndStackFoundations:SF.2`. Integrate the existing CohomologicalPointCounting/PR196 TraceFormula finite-field constructible trace theorem, together with proper/compact-support pushforward and Künneth, on finite-type bounded models, with geometric Frobenius and Q_ℓ(1) eigenvalue q^{-1}. Supply the exact site/perfection comparison; do not construct another general trace formula. Needed by [`GS4:classical-Satake-comparison/normalized-frobenius-function`](#n-gs4-classical-satake-comparison-normalized-frobenius-function), [`GS4:classical-Satake-comparison/trace-convolution`](#n-gs4-classical-satake-comparison-trace-convolution), [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term).

<a id="req-r3-14"></a>

- **R3.14** (layers GS3–GS4) to `ReductiveGroupsPartII:RG2.0a`. Finite separable affine group-scheme Weil restriction, its base-change/product-of-conjugates and induced Weil action, with compatibility of field-specific divisors and residue degree. Needed by [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality).

<a id="req-r3-15"></a>

- **R3.15** (layers GS3–GS4) to `VStackSheavesAndLisseCategories:VS3`. The enhanced D■ coefficient interpretation, adic reduction and scalar extension for local Hecke stacks over Z_ℓ[r]-algebras, and the relative D(A)^∨ kernel comparison used in IX2. Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="req-r3-16"></a>

- **R3.16** (layers GS3–GS4) to `DiamondSixOperations:S6`. Relative Verdier duality on the bounded constructible local Hecke charts with the eligible coefficient/base hypotheses; compare its ℓ-adic extension with the enhanced internal dual. The source S6 alone does not assert arbitrary-ring enhanced biduality. Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="req-r3-17"></a>

- **R3.17** (layers GS3–GS4) to `LanglandsParameterStacks:LP3`. Characteristic-zero specialization of the highest-weight theory: for a split connected reductive group over a field of characteristic zero, the irreducible finite-dimensional representations are the V_μ, one for each dominant weight μ, and V_μ has highest weight μ with multiplicity one; over such a field the Weyl module of μ is V_μ. The convex-hull bound on weights is the RG2.5 import used by generic-root-datum, not requested here. Needed by [`GS4:integral-dual-group/witt-rational-satake-equivalence`](#n-gs4-integral-dual-group-witt-rational-satake-equivalence).

<a id="req-r3-18"></a>

- **R3.18** (layers GS3–GS4) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`. For an affine algebraic group H over a field, the identity component H° is a normal subgroup with finite étale quotient π₀(H), trivial exactly when H is connected. For a closed subgroup scheme H of an affine algebraic group over a perfect field of characteristic p, the image of H under a sufficiently high power of the relative Frobenius is reduced, equals the Frobenius twist of the reduced subgroup of H, and is a quotient of H, so its representations pull back to H. Used in characteristic ℓ, including ℓ = 2. Needed by [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification).

<a id="req-r3-19"></a>

- **R3.19** (layers GS3–GS4) to `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Smooth connected closed subgroups of SL₂ over a field that contain the diagonal torus T are T, the two Borel subgroups containing T and SL₂; each Borel is its own normalizer; N(T)/T ≅ Z/2, generated by the class of w with w² = −1, and the extension splits exactly in characteristic two. Needed by [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification).

<a id="req-r3-20"></a>

- **R3.20** (layers GS3–GS4) to `LanglandsParameterStacks:LP3`. Tilting modules of SL₂ over an algebraically closed field of characteristic two, with Frobenius twists and kernels G_a: T(6·2^a−2) ≅ T(2^{a+1}−2) ⊗ T(4)^{[a]}; T(2^{a+1}−2) ≅ St_a ⊗ St_a for a≥1; St_a is self-dual and remains absolutely irreducible on G_a, giving End_{G_a}(St_a)=k and a trivial conjugation action on that invariant line. Handle a=0 with T(0)=k. Include the good filtration of T(4) with sections ∇(4), ∇(2), tensor closure and indecomposable highest-weight summands of tensor powers of the natural representation, and the theorem dim M^{SL₂} = [M:∇(0)] for good-filtration M. For V^{⊗n} this multiplicity equals its characteristic-zero trivial multiplicity. DH Lemmas 1.1/1.4 pp3–4 and the Steinberg-square discussion p18 support the factorization/characters; the kernel and good-filtration contracts must be exposed by the general LP3 owner. Needed by [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification).

<a id="req-r3-21"></a>

- **R3.21** (layers GS3–GS4) to `GeometricSatakeAndFusion:GS2:correspondences`. For the n-fold minuscule PGL₂ convolution, provide the proper map from a smooth n-dimensional iterated perfected P¹ bundle, the semismall base-point fibre bound dim≤n/2, and for every even n and prime ℓ≠p identify Hom(1, B₁^{⋆n}) over F_ℓ with degree-n Borel–Moore homology of that fibre, up to Tate twist. Top cycles must be free on its n/2-dimensional irreducible components, compatibly with rational coefficients and the one-leg Witt comparison. Derive this by proper duality and the top-cycle theorem; no modular decomposition theorem is assumed. The current rational-special-fibre-convolution node gives neither this modular Hom calculation nor coefficient-independent freeness. This requested refinement belongs with the existing GS2 correspondence geometry, not a second general six-operations theory. Needed by [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification).

## Gaps

Each gap names an input that is not established, with the declarations that
need it. Gaps G0.n belong to layers GS0–GS2 and G3.n to layers GS3–GS4. Gaps
G0.7 and G3.1 concern only the Lean signatures of the suggested file, not the
mathematics.

<a id="gap-g0-1"></a>

#### G0.1. Boundary representability before Keel

BS 8.3’s induction calls the lower-bound union a pfp proper perfect algebraic space before proving it. The SF1 finite-pushout/model request must construct closed intersections and effective pinching in the chosen model, then prove it is the image v-sheaf. This proof must precede the positivity application.

Needed by [`GS0:Witt-geometry/ampleness-via-keel`](#n-gs0-witt-geometry-ampleness-via-keel).

<a id="gap-g0-2"></a>

#### G0.2. Zhu B.11 corrected truncated-Witt interface

The rank-two adjugate calculation proves corrected right-factor integrality and unit determinant after choosing Witt lifts: adj(X* A)=A* X, det(Ã)=p² and det(X̃)=p²u with u a unit. The truncated equation is det(X)=p²[λ]⁻¹; only the residue of u is forced to equal λ⁻¹. What remains is the typed truncated-Witt interface, existence of a factor after the chosen lift, and compatibility with the jet-torsor quotient. The factor need not be unique or lift-independent (already A=3·Id over W₃(F₃) has a nontrivial stabilizer); uniqueness concerns the cone representative A. Retain the corrected order A⁻¹X.

Needed by [`GS0:Witt-geometry/rank-two-cone-chart`](#n-gs0-witt-geometry-rank-two-cone-chart).

<a id="gap-g0-3"></a>

#### G0.3. Sketch-only canonical determinant and crystal comparison

Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.

Needed by [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models), [`GS0:Witt-geometry/rank-two-cone-chart`](#n-gs0-witt-geometry-rank-two-cone-chart).

<a id="gap-g0-4"></a>

#### G0.4. Rational MV trace normalization on perfect models

Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.

Needed by [`GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`](#n-gs0-witt-geometry-semi-infinite-intersections-and-mv-cycles), [`GS1/rational-weight-concentration`](#n-gs1-rational-weight-concentration).

<a id="gap-g0-5"></a>

#### G0.5. Quasi-minuscule infinity contribution and minimal generation

For the quasi-minuscule P¹ resolution retain the section-at-infinity term absent from Zhu (2.2.13); in SL₃ the zero-weight multiplicity is two. Check the corrected parahoric in type A_n, the finite U-jet torsor/twisted external product in 2.17 and 2.16’s minimal-generation argument with the RG/EDC interfaces.

Needed by [`GS1/rational-weight-concentration`](#n-gs1-rational-weight-concentration).

<a id="gap-g0-6"></a>

#### G0.6. Stack enhancement and coherent Ind convolution

VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.

Needed by [`GS1/ULA-sheaves-on-the-hecke-stack`](#n-gs1-ula-sheaves-on-the-hecke-stack), [`GS2:correspondences/convolution-diagram`](#n-gs2-correspondences-convolution-diagram), [`GS2:correspondences/convolution-associativity-and-unit`](#n-gs2-correspondences-convolution-associativity-and-unit), [`GS2:Satake-closure/satake-rigidity`](#n-gs2-satake-closure-satake-rigidity).

<a id="gap-g0-7"></a>

#### G0.7. Typed geometric signatures and unavailable prebuilt line module

The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

Needed by [`GS0:Schubert-smoothness/minuscule-bialynicki-birula`](#n-gs0-schubert-smoothness-minuscule-bialynicki-birula), [`GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`](#n-gs0-schubert-smoothness-open-cell-stabilizer-and-smoothness), [`GS0:Schubert-smoothness/truncated-positive-loops`](#n-gs0-schubert-smoothness-truncated-positive-loops), [`GS0:Schubert-smoothness/truncation-of-the-loop-action`](#n-gs0-schubert-smoothness-truncation-of-the-loop-action), [`GS0:Witt-geometry/ampleness-via-keel`](#n-gs0-witt-geometry-ampleness-via-keel), [`GS0:Witt-geometry/bounded-admissible-flags`](#n-gs0-witt-geometry-bounded-admissible-flags), [`GS0:Witt-geometry/canonical-witt-models`](#n-gs0-witt-geometry-canonical-witt-models), [`GS0:Witt-geometry/connected-cohomological-fibres`](#n-gs0-witt-geometry-connected-cohomological-fibres), [`GS0:Witt-geometry/determinant-positivity`](#n-gs0-witt-geometry-determinant-positivity), [`GS0:Witt-geometry/flag-convolution-fibres`](#n-gs0-witt-geometry-flag-convolution-fibres), [`GS0:Witt-geometry/flag-incidence-correspondences`](#n-gs0-witt-geometry-flag-incidence-correspondences), [`GS0:Witt-geometry/geometric-determinant-line`](#n-gs0-witt-geometry-geometric-determinant-line), [`GS0:Witt-geometry/h-descent-and-fibral-criterion`](#n-gs0-witt-geometry-h-descent-and-fibral-criterion), [`GS0:Witt-geometry/integral-family-bounded-properness`](#n-gs0-witt-geometry-integral-family-bounded-properness), [`GS0:Witt-geometry/integral-parahoric-properness`](#n-gs0-witt-geometry-integral-parahoric-properness), [`GS0:Witt-geometry/parahoric-ind-projectivity`](#n-gs0-witt-geometry-parahoric-ind-projectivity), [`GS0:Witt-geometry/perfect-model-and-etale-comparison`](#n-gs0-witt-geometry-perfect-model-and-etale-comparison), [`GS0:Witt-geometry/rank-two-cone-chart`](#n-gs0-witt-geometry-rank-two-cone-chart), [`GS0:Witt-geometry/sections-on-witt-bounds`](#n-gs0-witt-geometry-sections-on-witt-bounds), [`GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`](#n-gs0-witt-geometry-semi-infinite-intersections-and-mv-cycles), [`GS0:Witt-geometry/sl-determinant-normalization`](#n-gs0-witt-geometry-sl-determinant-normalization), [`GS0:Witt-geometry/witt-demazure-resolution`](#n-gs0-witt-geometry-witt-demazure-resolution), [`GS0:Witt-geometry/witt-lattice-functor-and-representability`](#n-gs0-witt-geometry-witt-lattice-functor-and-representability), [`GS0:Witt-geometry/witt-types-and-bounds`](#n-gs0-witt-geometry-witt-types-and-bounds), [`GS0:Witt-geometry/zhu-finite-jet-presentation`](#n-gs0-witt-geometry-zhu-finite-jet-presentation), [`GS0:Witt-geometry/zhu-original-algebraic-space`](#n-gs0-witt-geometry-zhu-original-algebraic-space), [`GS0:loop-geometry/affine-flag-demazure`](#n-gs0-loop-geometry-affine-flag-demazure), [`GS0:loop-geometry/congruence-filtration-and-graded-pieces`](#n-gs0-loop-geometry-congruence-filtration-and-graded-pieces), [`GS0:loop-geometry/etale-over-divisor`](#n-gs0-loop-geometry-etale-over-divisor), [`GS0:loop-geometry/generic-galois-descent`](#n-gs0-loop-geometry-generic-galois-descent), [`GS0:loop-geometry/grassmannian`](#n-gs0-loop-geometry-grassmannian), [`GS0:loop-geometry/local-hecke-stack`](#n-gs0-loop-geometry-local-hecke-stack), [`GS0:loop-geometry/loop-groups-and-local-hecke`](#n-gs0-loop-geometry-loop-groups-and-local-hecke), [`GS0:loop-geometry/ordered-leg-base-change`](#n-gs0-loop-geometry-ordered-leg-base-change), [`GS0:loop-geometry/schubert-bounds-and-properness`](#n-gs0-loop-geometry-schubert-bounds-and-properness), [`GS0:loop-geometry/smooth-scheme-loops`](#n-gs0-loop-geometry-smooth-scheme-loops), [`GS1/ULA-sheaves-on-the-hecke-stack`](#n-gs1-ula-sheaves-on-the-hecke-stack), [`GS1/constant-term-conservativity`](#n-gs1-constant-term-conservativity), [`GS1/flat-perverse-objects`](#n-gs1-flat-perverse-objects), [`GS1/integral-family-comparison`](#n-gs1-integral-family-comparison), [`GS1/lattice-relative-position-semicontinuity`](#n-gs1-lattice-relative-position-semicontinuity), [`GS1/length-semicontinuity`](#n-gs1-length-semicontinuity), [`GS1/perverse-descent-and-shifted-ct`](#n-gs1-perverse-descent-and-shifted-ct), [`GS1/prounipotent-equivariance`](#n-gs1-prounipotent-equivariance), [`GS1/rational-weight-concentration`](#n-gs1-rational-weight-concentration), [`GS1/relative-perverse-t-structure`](#n-gs1-relative-perverse-t-structure), [`GS1/semi-infinite-affineness`](#n-gs1-semi-infinite-affineness), [`GS1/semi-infinite-orbits-and-hyperbolic-localization`](#n-gs1-semi-infinite-orbits-and-hyperbolic-localization), [`GS1/standard-costandard-objects`](#n-gs1-standard-costandard-objects), [`GS1/standard-costandard-torsion-bound`](#n-gs1-standard-costandard-torsion-bound), [`GS1/ula-constant-term-criterion`](#n-gs1-ula-constant-term-criterion), [`GS2:Satake-closure/convolution-perverse-nonpositive`](#n-gs2-satake-closure-convolution-perverse-nonpositive), [`GS2:Satake-closure/convolution-preserves-satake-and-dualizability`](#n-gs2-satake-closure-convolution-preserves-satake-and-dualizability), [`GS2:Satake-closure/convolution-ula`](#n-gs2-satake-closure-convolution-ula), [`GS2:Satake-closure/one-leg-satake-comparison`](#n-gs2-satake-closure-one-leg-satake-comparison), [`GS2:Satake-closure/satake-rigidity`](#n-gs2-satake-closure-satake-rigidity), [`GS2:correspondences/convolution-associativity-and-unit`](#n-gs2-correspondences-convolution-associativity-and-unit), [`GS2:correspondences/convolution-diagram`](#n-gs2-correspondences-convolution-diagram), [`GS2:correspondences/rational-special-fibre-convolution`](#n-gs2-correspondences-rational-special-fibre-convolution), [`GS2:correspondences/satake-category-and-fibre-functor`](#n-gs2-correspondences-satake-category-and-fibre-functor), [`GS2:correspondences/satake-fibre-functor`](#n-gs2-correspondences-satake-fibre-functor), [`GS2:correspondences/satake-verdier-duality`](#n-gs2-correspondences-satake-verdier-duality).

<a id="gap-g0-8"></a>

#### G0.8. Bounded affine-flag dimension and adjoint transfer

The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

Needed by [`GS0:Witt-geometry/flag-incidence-correspondences`](#n-gs0-witt-geometry-flag-incidence-correspondences), [`GS0:Witt-geometry/flag-convolution-fibres`](#n-gs0-witt-geometry-flag-convolution-fibres), [`GS0:Witt-geometry/bounded-admissible-flags`](#n-gs0-witt-geometry-bounded-admissible-flags).

<a id="gap-g0-9"></a>

#### G0.9. Early coefficient scope and filtered-equivariance continuity

Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

Needed by [`GS1/relative-perverse-t-structure`](#n-gs1-relative-perverse-t-structure), [`GS1/perverse-descent-and-shifted-ct`](#n-gs1-perverse-descent-and-shifted-ct), [`GS1/flat-perverse-objects`](#n-gs1-flat-perverse-objects), [`GS1/standard-costandard-objects`](#n-gs1-standard-costandard-objects), [`GS2:correspondences/satake-fibre-functor`](#n-gs2-correspondences-satake-fibre-functor), [`GS1/prounipotent-equivariance`](#n-gs1-prounipotent-equivariance).

<a id="gap-g0-10"></a>

#### G0.10. Étale-over-divisor geometric carriers and support-map input

FS VI.1.13 is now a distinct named lemma target with its exact universal property. Its §13 Lean signature is omitted until the actual perfectoid/adic category, divisor pullback and separated-étale representability carriers exist. RF2 must additionally supply the integral geometric-support description (including special O_E-untilts) and the closed support map |D_S|→|S|; existing generic E-untilt complete-DVR data are insufficient for that integral scope. This is an interface gap, not a claim that the source lemma is unproved.

Needed by [`GS0:loop-geometry/etale-over-divisor`](#n-gs0-loop-geometry-etale-over-divisor), [`GS0:loop-geometry/smooth-scheme-loops`](#n-gs0-loop-geometry-smooth-scheme-loops).

<a id="gap-g3-1"></a>

#### G3.1. Formal geometric and enhanced carriers in the suggested signatures

Pinned libraries lack Div¹ local Hecke diamonds, flat-perverse ULA Satake categories, continuous Weil local systems, affine root-pinned integral dual identification and the stable enhanced D■/Perf(BG) carriers. The suggested file uses the imported carriers as category/type parameters, with every missing geometric or enhanced hypothesis explicitly omitted and named in comments. It gives no replacement Prop certificate. Actual formal carrier and condition signatures remain a refinement for each node; the numerical locus/parity/trace conventions can already be expressed.

Needed by [`GS3:fusion/disjoint-leg-locus`](#n-gs3-fusion-disjoint-leg-locus), [`GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`](#n-gs3-fusion-disjoint-leg-factorization-and-full-faithfulness), [`GS3:fusion/support-parity`](#n-gs3-fusion-support-parity), [`GS3:fusion/fusion-product-and-sign-rule`](#n-gs3-fusion-fusion-product-and-sign-rule), [`GS3:fusion/finite-set-functoriality-and-constant-terms`](#n-gs3-fusion-finite-set-functoriality-and-constant-terms), [`GS3:fusion/drinfeld-fibre-realization`](#n-gs3-fusion-drinfeld-fibre-realization), [`GS3:fusion/symmetric-constant-term`](#n-gs3-fusion-symmetric-constant-term), [`GS3:fusion/fusion-verdier-duality`](#n-gs3-fusion-fusion-verdier-duality), [`GS4:integral-dual-group/tannakian-left-adjoint`](#n-gs4-integral-dual-group-tannakian-left-adjoint), [`GS4:integral-dual-group/relative-tannaka-hypotheses`](#n-gs4-integral-dual-group-relative-tannaka-hypotheses), [`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra), [`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction), [`GS4:rational-reductivity/rational-semisimplicity`](#n-gs4-rational-reductivity-rational-semisimplicity), [`GS4:rational-reductivity/generic-fibre-reductivity`](#n-gs4-rational-reductivity-generic-fibre-reductivity), [`GS4:integral-dual-group/torus-and-rank-one-identification`](#n-gs4-integral-dual-group-torus-and-rank-one-identification), [`GS4:integral-dual-group/generic-root-datum`](#n-gs4-integral-dual-group-generic-root-datum), [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification), [`GS4:integral-dual-group/normalized-satake-equivalence`](#n-gs4-integral-dual-group-normalized-satake-equivalence), [`GS4:integral-dual-group/levi-naturality`](#n-gs4-integral-dual-group-levi-naturality), [`GS4:integral-dual-group/adjoint-isomorphism-naturality`](#n-gs4-integral-dual-group-adjoint-isomorphism-naturality), [`GS4:integral-dual-group/product-naturality`](#n-gs4-integral-dual-group-product-naturality), [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality), [`GS4:integral-dual-group/chevalley-involution`](#n-gs4-integral-dual-group-chevalley-involution), [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension), [`GS4:classical-Satake-comparison/normalized-frobenius-function`](#n-gs4-classical-satake-comparison-normalized-frobenius-function), [`GS4:classical-Satake-comparison/trace-convolution`](#n-gs4-classical-satake-comparison-trace-convolution), [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term), [`GS4:classical-Satake-comparison/classical-satake-comparison`](#n-gs4-classical-satake-comparison-classical-satake-comparison), [`GS4:rational-reductivity/witt-rational-tannakian-category`](#n-gs4-rational-reductivity-witt-rational-tannakian-category), [`GS4:integral-dual-group/witt-rational-satake-equivalence`](#n-gs4-integral-dual-group-witt-rational-satake-equivalence), [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification).

<a id="gap-g3-2"></a>

#### G3.2. Drinfeld and Frobenius convention adapter

VS1 has ULA nodes but no finer IV7.3 node matching the full locally constant perfect Drinfeld statement. Request that exact statement and the action of the Tate root line under its equivalence. Check the contravariant stalk-action convention against the positive-power parameter formula in IX7.1 before a formal normalized Levi comparison; do not silently equate the two actions.

Needed by [`GS3:fusion/drinfeld-fibre-realization`](#n-gs3-fusion-drinfeld-fibre-realization), [`GS4:integral-dual-group/normalized-satake-equivalence`](#n-gs4-integral-dual-group-normalized-satake-equivalence), [`GS4:integral-dual-group/levi-naturality`](#n-gs4-integral-dual-group-levi-naturality).

<a id="gap-g3-3"></a>

#### G3.3. Bounded adjunction coefficient and coequalizer verification

The source VI10.1 proof uses standard/costandard objects and a uniform coefficient-independent ℓ-torsion bound in VI7.5; the early Satake node supplies their carrier but does not isolate this bound or the full ℓ-adic adapter. The outlined proof here must be refined to establish the bound, coefficient inverse-limit compatibility and preservation (not just reflection) of F-split coequalizers required by the MC executable adapter.

Needed by [`GS4:integral-dual-group/tannakian-left-adjoint`](#n-gs4-integral-dual-group-tannakian-left-adjoint), [`GS4:integral-dual-group/relative-tannaka-hypotheses`](#n-gs4-integral-dual-group-relative-tannaka-hypotheses), [`GS4:integral-dual-group/geometric-coordinate-hopf-algebra`](#n-gs4-integral-dual-group-geometric-coordinate-hopf-algebra), [`GS4:integral-dual-group/multileg-and-coefficient-reconstruction`](#n-gs4-integral-dual-group-multileg-and-coefficient-reconstruction).

<a id="gap-g3-4"></a>

#### G3.4. RG2.3 needs the general Prasad–Yu scope addition

Current RG2.3 scope is parahoric/congruence models and does not yet explicitly own the general affine finite-type closed-immersion theorem. The request records its exact no-normal-SO-odd hypothesis and proposes this single owner. The GS application retains its G_ad reduction for ℓ=2.

Needed by [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification).

<a id="gap-g3-5"></a>

#### G3.5. General relative Perf(BG) suppliers at all primes

LP3 existing Donkin nodes require a prime-to-ℓ solvable group; LP4 existing parameter-stack generation/colimit nodes require the dual fundamental-group exclusion. Neither supplies the general FS IX2 p321 relative classifying-stack base-change and free stable completion used here. Requested LP3/LP4 additions must be proved with their all-ℓ≠p scope and Q-equivariant coefficient hypotheses.

Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="gap-g3-6"></a>

#### G3.6. Enhanced convolution and coefficient duality adapter

D■ convolution is an enhanced monoidal structure using pullback/tensor/π♮, and its relation to ordinary perverse convolution is A↦D(A)^∨ with specified relative Verdier duality. S6/VS3 need the exact general coefficient adapter. Symmetry is carried by the Satake image, not asserted on the whole enhanced convolution category.

Needed by [`GS4:integral-dual-group/enhanced-perfect-satake-extension`](#n-gs4-integral-dual-group-enhanced-perfect-satake-extension).

<a id="gap-g3-7"></a>

#### G3.7. Classical comparison on unramified nonsplit groups

Gross supplies the split transform normalization and Zhu the split Witt IC calculation. The source-to-node proof for the unramified nonsplit Frobenius/relative Weyl version is not established from those excerpts alone. SR4 supplies the classical nonsplit transform; refine its geometric trace-descent comparison with the pinned Weil action and relative weights, without using this comparison as an input to either theorem.

Needed by [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term), [`GS4:classical-Satake-comparison/classical-satake-comparison`](#n-gs4-classical-satake-comparison-classical-satake-comparison).

<a id="gap-g3-8"></a>

#### G3.8. Finite-model Frobenius trace handoff

The classical bridge requires a Frobenius-equivariant finite-type special-fibre model and the existing ordinary constructible trace theorem, not only geometric ULA equivalence. SF.2 integrates these suppliers but no exact trace/model transport node is isolated in its current packet; the request records the needed contract and the missing source-level adapter.

Needed by [`GS4:classical-Satake-comparison/normalized-frobenius-function`](#n-gs4-classical-satake-comparison-normalized-frobenius-function), [`GS4:classical-Satake-comparison/trace-convolution`](#n-gs4-classical-satake-comparison-trace-convolution), [`GS4:classical-Satake-comparison/trace-constant-term`](#n-gs4-classical-satake-comparison-trace-constant-term).

<a id="gap-g3-9"></a>

#### G3.9. Weil-restriction local tensor comparison

IX6.3 gives the precise chosen-embedding inflation/induction and local Grassmannian map. A detailed compatibility of that procedure with the field-specific half-root choices and multi-leg factorization remains to be refined. Finite-index induction is not itself a strong monoidal functor; the comparison must retain the conjugate-leg geometric diagram.

Needed by [`GS4:integral-dual-group/weil-restriction-naturality`](#n-gs4-integral-dual-group-weil-restriction-naturality).

<a id="gap-g3-10"></a>

#### G3.10. Integral-point supplier refinement

RG2.0 supplies local/integral point topology and RG2.4 supplies Iwasawa/Cartan decompositions, but their present stage text does not explicitly give lattice preservation, hyperspecial maximal boundedness and torus/rank-one generation over the completed maximal unramified coefficient DVR used in VI.11.1 p238. The existing requests identify the stronger exact contract; these remain scope additions or imported upstream consequences to expose, not an already matching node.

Needed by [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction).

<a id="gap-g3-11"></a>

#### G3.11. Rank-one special-fibre image at ℓ = 2

FS Lemma VI.11.2 fails at ℓ = 2 because N(T) satisfies its hypotheses (source issue E32). The proposed invariant-count replacement uses the LP3 tilting, Steinberg-kernel and good-filtration contracts and the Tau Ceti ReductiveGroups layers 3 and 7. Its geometric input is now requested explicitly from GS2:correspondences: the proper semismall minuscule PGL₂ convolution from a smooth iterated P¹ bundle; the modular Hom-to-top-Borel–Moore identification; freeness on the top-dimensional components; and transport through the one-leg comparison. The existing rational-special-fibre-convolution node and Zhu Proposition 2.3 do not supply the modular Hom contract. This adapter must be established before the rank-one characteristic-two repair is complete. The rational Witt equivalence uses only the generic fibre and is not affected.

Needed by [`GS4:integral-dual-group/rank-one-integral-identification`](#n-gs4-integral-dual-group-rank-one-integral-identification), [`GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`](#n-gs4-integral-dual-group-integral-recovery-and-adjoint-reduction), [`GS4:integral-dual-group/dual-group-identification`](#n-gs4-integral-dual-group-dual-group-identification).

<a id="gap-g3-12"></a>

#### G3.12. Zhu's equivalence outside the FS comparison

Zhu states his equivalence for any algebraically closed k and any finite totally ramified F over W(k)[1/p], and for his own monoidal structure on H*. The comparison planned here covers k an algebraic closure of F_p, with the monoidal structure transported from fusion. A larger algebraically closed k needs either the invariance of these equivariant perverse categories under extension of algebraically closed base field, which no supplier node states, or Zhu's own Gelfand proof, routed to the Part II design (DESIGN-GeometricSatakeAndFusionPartII). That design must also state its rational equivalence for its own monoidal structure, or prove that the two monoidal structures on H* agree.

Needed by [`GS4:rational-reductivity/witt-rational-tannakian-category`](#n-gs4-rational-reductivity-witt-rational-tannakian-category), [`GS4:integral-dual-group/witt-rational-satake-equivalence`](#n-gs4-integral-dual-group-witt-rational-satake-equivalence).

<a id="source-issues"></a>

## Source issues

The mistakes found in the sources are recorded with the declarations, in our
own words, and each is confirmed at its locator. E1–E24 are recorded with
layers GS0–GS2 and E25–E35 with layers GS3–GS4. E34 records the same misprint
as E1 (Zhu's coweight order) and E35 the same error as E10 (Zhu's opposite
filtration); each half of the plan cites it at its own declarations. Where a
finding is already recorded in a paper extraction, that record is named.

- **`GeometricSatakeAndFusion/E1`** (misprint; [Zhu](#src-zhu), p412, coweight order; affects nothing). The source: The source uses positive roots to specify dominance among coweights. Correction: Use positive coroots in the coweight dominance order. Reason: The order is on X_*(T); roots belong to the dual character space. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it. Earlier record: Previously recorded as PAPER-ZHU-17/E2. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E2`** (misprint; [Zhu](#src-zhu), p. 424, proof of Lemma 1.17, definition of X(R′); affects nothing). The source: Inv(𝓕_i ⇢ 𝓕_{i+1}) = μ_i^* Correction: Inv(𝓕_i ⇢ 𝓕_{i−1}) = μ_{N+1−i}^* for i = 1, …, N, with maps oriented 𝓕_N ⇢ ⋯ ⇢ 𝓕_0 as in the quasi-isogeny 𝓕_N ⇢ 𝓕_0 used next. Equivalently, keeping the displayed orientation, Inv(𝓕_{i−1} ⇢ 𝓕_i) = μ_{N+1−i}. Reason: (Gr_{μ•})_R consists of chains 𝓔 = 𝓔_N ⇢ 𝓔_{N−1} ⇢ ⋯ ⇢ 𝓔_0 with Inv(β_i) = μ_i. Building it from 𝓕_0 = 𝓔 gives 𝓕_i = 𝓔_{N−i}. Then 𝓕_{i−1} ⇢ 𝓕_i is β_{N+1−i}, of position μ_{N+1−i}, and its inverse has position μ_{N+1−i}^*. The printed condition indexes by μ_i (μ_0 is undefined for i = 0, and the order is not reversed) and attaches the star to the displayed direction 𝓕_i ⇢ 𝓕_{i+1}. That is wrong even when all μ_i are equal: for μ_i = ω_1 the displayed map has position ω_1, not ω_1^*. The rest of the argument (the quasi-isogeny 𝓕_N ⇢ 𝓕_0 = 𝓔 ⇢ 𝓔_0 and the closed locus X_{ω_0}) goes through with the correction. The erroneous chain condition is recorded above as a mathematical formula. The same text is in v2 and v3. Earlier record: Previously recorded as PAPER-ZHU-17/E8. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E3`** (misprint; [Zhu](#src-zhu), p488, determinant unit inB.11; affects nothing). The source: p²[λ] Correction: Use p²[λ]⁻¹. Reason: Solving the defining equation for detX requires the inverse; for p=5 and unit2, 25·2 and 25·3 differ modulo125. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it. Earlier record: Previously recorded as PAPER-ZHU-17/E32. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E4`** (misprint; [Zhu](#src-zhu), p. 488, proof of the claim in Lemma B.11 (display defining g̃); affects nothing). The source: g̃ := X̃Ã^{−1} = p^{−2}X̃Ã^* Correction: g̃ := Ã^{−1}X̃ = p^{−2}Ã^*X̃ ∈ LGL_2. Then X̃ = Ãg̃, and g = (g̃ mod p³) satisfies X = Ag. Reason: Confirmed; the correction should fix both expressions in the display. With the printed order, X̃ = g̃Ã, which contradicts the conclusion X = Ag. The existing counterexample works: A = (p −1; 0 p) is of cone form (x = z = 0, y = 1), g = (1 0; 1 1), X = Ag = (p−1 −1; p p). X lies in W̃ (a_1d_1 − b_1c_1 = 1), and X A^{−1} has entry −1/p². With the corrected order, integrality follows from (B.3.2): X^*A ≡ 0 mod p² gives A^*X = adj(X^*A) ≡ 0 mod p² (for 2×2 matrices adj(adj X) = X), so p^{−2}Ã^*X̃ is integral. Its determinant is a unit. Earlier record: Previously recorded as PAPER-ZHU-17/E33. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E5`** (gap; [Zhu](#src-zhu), p. 482, Appendix B opening paragraph (not p. 484); affects a stated result). The source: The opening of the appendix announces that proofs will be omitted for many assertions it contains. Correction: Stated without proof: Prop. B.1, Lemma B.9, and the final paragraph of B.3 (Conjecture I for GL_2, N = 2). Prop. B.2 has a one-sentence justification. It also needs \tilde L_det to be trivial on the fibres of π, which follows from base-point-freeness and the second part of Prop. B.1. Lemma B.4, Lemma B.7 and Prop. B.8 provide sketches whose further details are assigned to the reader. Also unproved: the claims on p. 485 (that M_{N,h} is an irreducible component of the RZ-type space) and p. 486 (\mathring M_{N,h} ≃ Gr′_N), and the claim in Remark B.6. Lemmas B.10 and B.11 are proved in full on pp. 487–488, apart from the misprints E32 and E33; the appeal to Lemma 1.10 for surjectivity goes through. Bhatt–Scholze prove Conjectures I–II. The main results of §§1–3 do not depend on Appendix B. Reason: The appendix-wide notice about omitted proofs occurs on p. 482. The existing correction wrongly lists B.10 and B.11 as unproved. Specific points: Prop. B.2 proposes to construct L_det by pushing forward \tilde L_det; this also requires \tilde L_det to be trivial on the fibres of π. That follows from base-point-freeness together with Prop. B.1's second part (degree 0 on fibre curves) and π_*O = O (Lemma A.21). The hint for B.4 also needs the fibres of V_{N,h} → \overline{Gr}_N to have constant dimension; this holds, since the stabilizer {γ: Aγ = A} has dimension nN everywhere. The main theorems do not depend on Appendix B. Remarks 1.15 and 1.16 point to B.3 and B.8, but they are remarks. Earlier record: Previously recorded as PAPER-ZHU-17/E34. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E6`** (misprint; [Zhu](#src-zhu), p. 425, proof of Lemma 1.18 (positive dimension of fibres); also p. 425, proof of Lemma 1.18 (last paragraph); affects nothing). The source: The proof says that some index i satisfies dim_k(Λ_λ ∩ p^iΛ_0/Λ_λ ∩ p^{i+1}Λ_0) > 1 in its argument about fibres. Correction: Replace ∩ by +: for λ < Nω_1, dim_k((Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0)) > 1 for some i (e.g. i = 0). Every hyperplane 𝓔_1 ⊂ Λ_0 containing Λ_λ + pΛ_0 extends to a point of π^{−1}(p^λ), so the fibre surjects onto ℙ^{d−1,p^{−∞}} with d = #{j : l_j ≥ 1} ≥ 2. Also: Replace ∩ by + in both places: dim_k (Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0) > 1 (this holds at i = 0 when λ < Nω_1), and lines L in this space give the lattices Λ_λ + p^{i+1}Λ_0 + L̃, which extend to full chains. Equivalently, dim (p^{-1}Λ_λ ∩ Λ_0)/Λ_λ = #{j : m_j ≥ 1} ≥ 2, the fibre of π_2 from the preceding paragraph. Reason: For λ = (l_1 ≥ … ≥ l_n ≥ 0) with Σ l_j = N, Λ_λ ⊂ Λ_0 and Λ_λ ∩ p^iΛ_0 = ⟨p^{max(l_j,i)}e_j⟩, so the printed dimension is #{j : l_j ≤ i}. For n ≥ 2 this exceeds 1 for every λ once i ≥ l_1, including λ = Nω_1, whose fibre is a single point by the first part of the lemma. Moreover these subquotients lie inside Λ_λ, while points of π^{−1}(p^λ) are chains of lattices between Λ_λ and Λ_0, so lines in them do not give points of the fibre. With + the dimension is #{j : l_j ≥ i+1}, which for i = 0 is at least 2 exactly when l_2 ≥ 1, i.e. λ ≠ Nω_1. The intended argument is then correct. The same text is in v2 (with 𝓔_λ) and v3. It is classified as a misprint (∩ for +); a verifier could argue for 'error', since the step fails as printed. Earlier record: Previously recorded as PAPER-ZHU-17/E44. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E7`** (error; [Zhu](#src-zhu), p. 433, Proposition 2.5 (second sentence); affects a stated result). The source: overline(S_λ ∩ Gr_{≤μ}) = ⋃_{λ′≤λ} S_{λ′} ∩ Gr_{≤μ} Correction: Replace the second sentence by S̄_λ ∩ Gr_{≤μ} = ∪_{λ′≤λ}(S_{λ′} ∩ Gr_{≤μ}), which follows from the first. Or restrict to λ a weight of V_μ (equivalently S_λ ∩ Gr_{≤μ} ≠ ∅) and supply a proof of closure(S_λ ∩ Gr_{≤μ}) = S̄_λ ∩ Gr_{≤μ}. Reason: The closure operations differ already for GL₂, μ=(1,0) and λ=(2,−1). The initial intersection S_λ∩Gr_{≤μ} is empty, so its closure is empty; the union of the lower intersections S_(1,0) and S_(0,1) is the perfected P¹. The corrected operation closes S_λ first and then intersects Gr_{≤μ}. This counterexample is checked against the published p.433 display; it does not require a comparison with an unread preprint or Zhu16 edition. Earlier record: Previously recorded as PAPER-ZHU-17/E46. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E8`** (misprint; [Zhu](#src-zhu), p. 434, Corollary 2.8; p. 439, Corollary 2.14; affects nothing). The source: The source gives the components of the intersection a uniform dimension, dim(S_λ ∩ Gr_{≤μ}) = (ρ, λ + μ), without requiring that the intersection have any points. Correction: Add 'if nonempty, i.e. if λ is a weight of V_μ' to the dimension clause of Cor. 2.8, and 'if nonempty, i.e. if each λ_i is a weight of V_{μ_i}' to Cor. 2.14. Reason: For λ not a weight of V_μ (e.g. λ = μ + α^∨) the scheme is empty, so the dimension formula fails literally. The component count dim V_μ(λ) = 0 remains correct. This is the same kind of missing nonemptiness hypothesis as the recorded E19; keep the classifications consistent (I lean to misprint, since the intended reading is clear). Earlier record: Previously recorded as PAPER-ZHU-17/E47. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E9`** (misprint; [Zhu](#src-zhu), p. 435, Corollary 2.9; affects nothing). The source: The source places a basis of cycle classes in H^i_c(S_λ, IC_μ), without choosing a value for i. Correction: The relevant cycle classes give a basis for H_c^{(2ρ,λ)}(S_λ, IC_μ) = CT_λ(IC_μ). Reason: The index i is free. The cycle classes live in degree (2ρ,λ), which by Proposition 2.7 is the only nonzero degree. Earlier record: Previously recorded as PAPER-ZHU-17/E49. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E10`** (error; [Zhu](#src-zhu), p. 436, proof of Corollary 2.10; affects the proof). The source: Fil′_{<λ}H^*(A) = Im(H^*_{S⁻_{<λ}}(A) → H^*(A)); H^* = ⊕_λ H_c^*(S_λ, −) Correction: Use Im(H^*_{S̄^-_λ}(A) → H^*(A)), as in [MV07, Th. 3.6]. Fix k = (2ρ,λ). Parity and degree give H^k_{S̄^-_λ}(A) = H^k_{S^-_λ}(A) and H^k(S̄_λ,A) = H^k_c(S_λ,A). The composite H^k_{S̄^-_λ}(A) → H^k(A) → H^k(S̄_{λ′},A) is the isomorphism of (2.2.10) (hyperbolic localization at ϖ^λ) for λ′ = λ. It is zero for λ′ ≠ λ of the same degree, since a nonempty closed G_m-stable S̄^-_λ ∩ S̄_{λ′} contains some ϖ^η with λ ≤ η ≤ λ′. Hence H^k(A) = ⊕_{(2ρ,λ)=k} Im(H^k_{S̄^-_λ}(A) → H^k(A)), which gives H^* ≅ ⊕_λ H^*_c(S_λ,−). Reason: By Proposition 2.5, S̄^−_λ − S^−_λ = ∪_{λ′>λ} S^−_{λ′}. By (2.2.10) and Proposition 2.7, H^k_{S^−_{λ′}}(A) = 0 unless k = (2ρ,λ′) > (2ρ,λ). So the printed Fil′_{<λ} vanishes in degree (2ρ,λ) and cannot split off the λ-piece. Morally it is ⊕_{λ′>λ}, which lies inside Fil_{≥λ} instead of complementing it. Counterexample to the claimed complementarity: GL_2, A = IC_{(1,0)} = Q̄_ℓ[1] on P^1, λ = (0,1). Here Fil_{≥λ} = H^*(A), because S_{<λ} ∩ P^1 = ∅. But Fil′_{<λ} is the image of H^*_{pt}(A) with pt = ϖ^{(1,0)}, which is H^1 ≠ 0. The corollary is right by the MV argument the proof cites. Same text in arXiv v3. Earlier record: Previously recorded as PAPER-ZHU-17/E51. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E11`** (error; [Zhu](#src-zhu), p. 437, item (2) before Lemma 2.12; affects nothing). The source: The source claims that no parahoric subgroup properly contains Q_{1/2}. Correction: Delete item (2), or state: Q_{1/2} is the parahoric of −θ/2, whose reductive quotient contains the SL_2 of the affine roots ±(θ^∨+1). It is maximal unless the simple factor containing θ is of type A_n with n ≥ 2. Reason: Q_{1/2} is the parahoric of −θ/2 (the v2 discussion identifies −μ/2 as a vertex). The affine roots vanishing there are ±(θ^∨ + 1) and the roots orthogonal to θ. These have full rank only if the roots orthogonal to the highest root have rank r − 1, which fails in type A_n, n ≥ 2, where they have rank n − 2. For SL_3, θ = (1,0,−1) pairs to 1 or 2 with every positive root. So −θ/2 lies on the single wall θ^∨ + 1 = 0, inside an edge, and Q_{1/2} is properly contained in the parahorics of the edge's two vertices. Type A is covered by the paper: θ ∈ M (p. 439) and Lemma 2.11 includes it. The claim is not used in any proof. Earlier record: Previously recorded as PAPER-ZHU-17/E52. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E12`** (error; [Zhu](#src-zhu), p. 439, proof of Lemma 2.11 (μ = θ): display for π^{-1}(S_0 ∩ Gr_{≤μ}) and (2.2.13); affects the proof). The source: RΓ_c(π⁻¹(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(⋃_{wμ<0} ŪwP̄_μ/P̄_μ, Q̄_ℓ[d − 2]) Correction: With Y = ∪_{wμ<0} ŪwP̄_μ/P̄_μ, π^{-1}(S_0 ∩ Gr_{≤μ}) = [φ^{-1}(Y) \ π^{-1}(∪_{wμ<0} S_{wμ} ∩ Gr_{≤μ})] ⊔ [π^{-1}(Gr_0) ∩ φ^{-1}(Ḡ/P̄_μ − Y)], where π^{-1}(Gr_0) ≅ Ḡ/P̄_μ is the section at infinity. So (2.2.13) should read RΓ_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(Y, Q̄_ℓ[d−2]) ⊕ RΓ_c(Ḡ/P̄_μ − Y, Q̄_ℓ[d]); the sequence splits since all terms are in even degrees. Comparison with (2.2.12) then gives H^i(𝒞) = H^i_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) for i ≠ 0 and H^0_c(S_0, IC_μ) ≅ Q̄_ℓ^{|Δ_θ|}. Reason: Cells of Ḡ/P̄_θ: for β = wθ > 0 the dimension is ht θ + ht β − 1; for β < 0 it is ht θ − ht(−β); and d = 2 ht θ. With the printed (2.2.13), H^i_c vanishes for i > 0, yet H^i(C) = H^{i+d}(Ḡ/P̄_μ) ≠ 0 whenever some positive β ∈ Wθ has height 1 + i/2. In degree 0 both sides have dimension |Δ_θ|, which would give H^0_c(S_0, IC_μ) = 0. Check for SL_3: Ḡ/P̄_θ is the flag variety and C = Q̄_ℓ[2] ⊕ Q̄_ℓ^2 ⊕ Q̄_ℓ[−2]. The printed (2.2.13) gives Q̄_ℓ[2] ⊕ Q̄_ℓ^2, so H^0_c(S_0, IC_θ) = 0 and the degree-2 term would be negative. The corrected formula gives H^0_c = Q̄_ℓ^2 = V_θ(0). The final conclusion (and the [NP01, §8] computation it defers to) is right. The same display is in arXiv v2 and v3. Earlier record: Previously recorded as PAPER-ZHU-17/E53. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E13`** (misprint; [Zhu](#src-zhu), A.3.5, last paragraph, p. 482; affects nothing). The source: The source permits a pro-unipotent pro-algebraic J₁ in its construction independent of the kernel; connectedness is not an additional hypothesis. Correction: Require J_1 to be connected (as for the congruence subgroups L^+G^{(h)} used in the paper). Two admissible choices J_1, J_1' are then compared through the connected, normal, pro-unipotent subgroup J_1J_1' (or through J_1 ∩ J_1'), applying (A.3.4) to the connected groups J_1J_1'/J_1 and J_1J_1'/J_1', and (A.3.6) for cohomology. Reason: (A.3.4) is stated only for connected J_1, but the condition allows disconnected unipotent J_1 (finite p-groups are unipotent in characteristic p). Counterexample: J = Z/p (constant), X = Spec k. Both J_1 = J and J_1' = {1} satisfy the condition, but P_{J/J}(X) = Vect while P_{J/{1}}(X) = Rep_{Qlbar}(Z/p), which has p simple objects. This also conflicts with the earlier definition of P_J for pfp J. The cohomology half is fine, since (A.3.6) holds for any unipotent J_1 (l != p). In the paper J_1 is always a connected congruence subgroup, so nothing downstream is affected. Earlier record: Previously recorded as PAPER-ZHU-17/E71. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E14`** (misprint; [BS](#src-bs), arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention; affects nothing). The source: The source claims that the cokernel of an isogeny has projective dimension 1 exactly. Correction: Use projective dimension at most one, or separately exclude Q=0 when claiming equality one. Reason: The identity isogeny has cokernel zero and the zero R-module is projective; its projective dimension is not exactly one under the usual conventions. (cc-442dc5) Reclassified to affect nothing: the dimension-one wording has the intended meaning of a bound ≤1 throughout Lemmas 7.7–7.8 and Definition 7.10, and the zero module causes no problem in the determinant construction. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E10. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E15`** (misprint; [BS](#src-bs), arXiv v3, Lemma 7.9, p. 29; affects nothing). The source: Spec(R)_{≤λ} ⊂ {x ∈ Spec(R) | λ(Q ⊗ W(k(x))) ≤ λ} Correction: Spec(R)_{≤λ} := {x ∈ Spec(R) | λ(Q ⊗ W(k(x))) ≤ λ} is a closed subset of Spec(R). Reason: The display defines the locus, and the proof on p. 32 shows that this whole set is closed (it is the image of Dem_λ(Q)). With '⊂' the statement would say nothing about which subset. The earlier revision concerned how the display was recorded, not the mathematical diagnosis in the inherited E12 finding. Present in v1 and v2. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E12. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E16`** (gap; [BS](#src-bs), p. 35, proof of Theorem 8.3, second paragraph; affects the proof). The source: The proof appeals to induction to show that L|⋃_{μ<λ}Gr_{≤μ} is ample, although it has not yet shown that the union is representable. Correction: Before invoking Keel, show that Y = ∪_{μ<λ}Gr_{≤μ} is the perfection of a proper algebraic space. Here Y is the image sheaf of ⊔_{μ<λ}Gr_{≤μ}, equivalently the closed complement of Gr_λ. The map ⊔Gr_{≤μ} → Y is a v-cover. Its equivalence relation is given by the closed intersections Gr_{≤μ} ×_{Gr_{≤λ}} Gr_{≤μ'}. So Y is the iterated pushout of the Gr_{≤μ} along these intersections. Affine-locally this pushout is A1 ×_{A12} A2, which is perfect and satisfies A1 ⊗_A A2 = A12. On finite-type models the pushout is a proper algebraic space by [Ar70, 6.1]. Next, every subvariety of Y lies in some Gr_{≤μ}, where L is ample, so E(L|_Y) = ∅. Keel's Lemma 1.8, applied inductively over the pieces, then makes L|_Y semiample. Its morphism contracts no curve, hence is finite, so L|_Y is ample. Alternatively, cite Zhu's Theorem 8.2, which makes Y a closed subspace of a proper perfect algebraic space; but then the proof is no longer independent of Zhu as claimed (p. 32). Reason: Keel's Lemma 1.8 is a gluing statement for semiampleness on a proper algebraic space X = X_1 ∪ X_2 with E(L) ⊂ X_1. To obtain ampleness it has to be combined with E(L) = ∅ and Nakai. Applying it requires Y = ∪_{μ<λ} Gr_{≤μ} to be (the perfection of) a proper algebraic space. The induction hypothesis makes each Gr_{≤μ} a projective perfect scheme, but not their union inside the v-sheaf Gr_{≤λ}, whose representability is what is being proved. The union is not a single Gr_{≤μ} in general: for n = 3, λ = (4,2,0), both (3,3,0) and (4,1,1) are maximal below λ and are incomparable. Applying Keel's lemma on the scheme ψ^{-1}(Y) instead does not work, since the exceptional locus there does not lie in one piece. Defence: the missing step is standard and fillable (pinching of perfect schemes along closed subschemes, or gluing sections as above). Theorem 8.3 itself is not in doubt. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E39. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E17`** (error; [BS](#src-bs), p. 37, the sentence introducing Kottwitz' map and Proposition 9.7 ([Zhu14, Proposition 1.21]); affects a stated result). The source: π₁(G)_{Gal_K} Correction: Add the hypothesis 'k algebraically closed' (as in [Zhu14, §1.5.2]); then Gal_K is the inertia group. For a general perfect k: Kottwitz's map is κ: LG(k̄) = G(W_{O_K}(k̄)[1/p]) → π1(G)_{I_K}, where I_K ⊂ Gal_K is the inertia subgroup. It induces Gal(k̄/k)-equivariant bijections π0(LG_{k̄}) ≅ π0(Gr_{𝒢,k̄}) ≅ π1(G)_{I_K}. The connected components over k are the Gal(k̄/k)-orbits on π1(G)_{I_K}. Reason: For finite k and an unramified quadratic extension K′/K, take T=Res_{K′/K}G_m with its connected integral model. The geometric components of its affine Grassmannian form ℤ² with Frobenius exchanging the coordinates, whereas full Galois coinvariants give ℤ. Thus BS arXiv v3 p.37 must use inertia coinvariants for geometric components and retain residual Frobenius. Zhu’s published Proposition 1.21 on p.427 has an algebraically closed residue-field standing setting; the broader finite-k assertion does not follow from that setting. The SL_n application has trivial π₁ and is unaffected. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E41. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E18`** (gap; [BS](#src-bs), p. 37, Proposition 10.1 (second assertion) and its proof; affects the proof). The source: L = det̃_R(p^a W_{O_K}(R)^n/M) Correction: Add the argument. Choose a W(k)-basis of O_K, so that W_{O_K}(R)^n = W(R)^{ne}. On a bounded piece X ⊂ Gr_{SL_n} (proper by Corollary 9.6), for a ≪ 0 the map M ↦ p^{-a}M ⊂ W(R)^{ne} sends X into some Gr_{≤λ} for GL_{ne}. The cokernel is Q = W(R)^{ne}/p^{-a}M ≅ p^aW_{O_K}(R)^n/M, killed by a bounded power of p, of constant length −ane. This map is proper and injective on points, hence finite (pass to finite-type models). By definition of det̃ on K(W_{O_K}(R) on R), L|_X is the pullback of the Theorem 8.3 bundle det̃(Q). So L|_X is ample by Theorem 8.3. Reason: The proof constructs L and notes independence of a, but never addresses the asserted ampleness. For ramified O_K the lattices are W_{O_K}(R)-lattices, and Theorem 8.3 (stated for W(R)-lattices in W(R)^n) does not apply without the restriction-of-scalars comparison. Proposition 10.5 (Serre vanishing, infinite-dimensionality) depends on this ampleness. The missing argument is short and the statement is true. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E42. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E19`** (misprint; [BS](#src-bs), p. 37, last paragraph (after Proposition 10.1); affects nothing). The source: det_R(p^a W_{O_K}(R)^n/gW_{O_K}(R)^n) Correction: det̃_R(p^aW_{O_K}(R)^n/gW_{O_K}(R)^n) (up to the canonically trivial factor det̃_R(p^aW_{O_K}(R)^n/W_{O_K}(R)^n)^{-1}) Reason: p^a W_{O_K}(R)^n / g W_{O_K}(R)^n is not killed by p, hence not an R-module, so det_R is undefined. The extended determinant det̃_R of Theorem 5.7 and Proposition 10.1 is meant. The normalizing factor is a trivial line bundle, and the proof of Proposition 10.4 uses det̃_k correctly. Earlier record: Previously recorded as PAPER-BHATT-SCHOLZE-17/E43. The corresponding source passage was checked in this run; no separate published correction verified here.
- **`GeometricSatakeAndFusion/E20`** (misprint; [Zhu](#src-zhu), A.3.1, p.478; affects a stated result). The source: Q_ℓ[2 dim X](dim X) Correction: Use the perverse shift [dim X] for IC on a smooth dense open; specify any Tate normalization separately. Reason: The normalized IC in the paper’s Satake construction is perverse. On a smooth curve Q_ℓ[2] lies one degree away from the perverse constant Q_ℓ[1]. This printed formula confuses IC normalization with the smooth dualizing complex. Earlier record: New finding of this independent review; no author-endorsed correction verified.
- **`GeometricSatakeAndFusion/E21`** (error; [Zhu](#src-zhu), A.3.3, pp.479–480; affects a stated result). The source: The source claims that passing between finite models leaves c_{X′} and c_{X″}, the normalized classes, unchanged. Correction: Fix the finite model and account for the purely inseparable degree in trace/fundamental-class comparisons. Reason: Relative Frobenius P¹→P¹ has degree p and pulls c₁(O(1)) to p·c₁(O(1)). It induces an étale-topos equivalence and an isomorphism on rational top cohomology, but does not preserve the scalar trace normalization. Thus the claimed model independence fails. Earlier record: New finding of this independent review; no author-endorsed correction verified.
- **`GeometricSatakeAndFusion/E22`** (misprint; [FS](#src-fs), Corollary VI.3.8, p.207; affects nothing). The source: The source gives a uniform dimension for components of the semi-infinite intersection, with no assumption that the intersection contains a point. Correction: Qualify the intersection dimension equality by nonemptiness, as also required for Zhu Corollary2.8. Reason: For GL₂ μ=(1,0), λ=(2,−1) is outside the weights of the minuscule bound, so S_λ∩Gr_{≤μ} is empty while ⟨ρ,μ+λ⟩=2. The closed-filtration proof applies to the nonempty strata. Earlier record: New finding of this independent review; no author-endorsed correction verified.
- **`GeometricSatakeAndFusion/E23`** (misprint; [Zhu](#src-zhu), Proof of Corollary 2.9, p.436 (PDF page34), final displayed comparison in the first paragraph; affects the proof). The source: H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ) ≃ H_c^{⟨2ρ,λ⟩}(S_λ∩Gr_μ,Q̄_ℓ) Correction: Write d_μ=⟨2ρ,μ⟩ and r=⟨2ρ,λ⟩. With IC_μ|Gr_μ=Q̄_ℓ[d_μ] before any Tate normalization, the right-hand side is H_c^{r+d_μ}(S_λ∩Gr_μ,Q̄_ℓ), namely unshifted degree ⟨2ρ,μ+λ⟩. If IC carries a Tate normalization, put that twist on the constant sheaf separately; it does not change the cohomological shift. Reason: The open-stratum restriction of a perverse intersection complex carries shift[d_μ], and H^r(K[d_μ])=H^{r+d_μ}(K). The printed proof keeps r unchanged after replacing IC by the unshifted constant sheaf. For GL₂ with μ=λ=(1,0), Gr_μ is the perfected projective line, S_λ∩Gr_μ is the perfected affine line, d_μ=r=1, and the IC weight group is its nonzero H_c² with constant coefficients. The printed H_c¹ with constant coefficients is zero. This is distinct from E9’s free index in the statement of Corollary 2.9, and the corrected node already has the required unshifted degree. Earlier record: New revision finding; no author-endorsed correction verified in the bounded primary journal/author-repository search on 2026-10-07.
- **`GeometricSatakeAndFusion/E24`** (misprint; [FS](#src-fs), Description of the geometric-point degree function immediately before Proposition VI.3.1, printed/PDF p.202; compare Lemma VI.3.2 and its proof, pp.203–204, and collision bounds VI.2.6, p.200; affects nothing). The source: After identifying the geometric Grassmannian with factors indexed by the distinct untilts, the description weights each factor’s local cocharacter by that untilt’s multiplicity among the ordered legs. Correction: Sum the combined local cocharacters once over the distinct geometric supports. In a coincident block the local cocharacter already sums the ordered-leg labels. Retain the multiplicity in the product Cartier equation ξ, without applying it again to the local valuation or cocenter degree. Reason: Take G=G_m and two coincident degree-one legs with primitive equation t. Completion for ξ=t² is the same as t-adic completion, and its geometric positive ring is one DVR B⁺. The ordered labels (1,0) give the lattice L=tB⁺, whose local cocharacter and ordinary length length(B⁺/L) are one. The printed extra weight gives two. Alternatively L=ξB⁺=t²B⁺ has ordinary position two and the printed weighting gives four. The sum over ordered labels at the start of p.202 and the product-DVR length identification in VI.3.2 both select the unweighted combined local cocharacter. This does not remove the collision addition of Schubert bounds. Earlier record: new; no author-endorsed correction found in the bounded primary-source search on 2026-10-08
- **`GeometricSatakeAndFusion/E25`** (misprint; [FS](#src-fs), Author-hosted 356-page PDF, VI.11.1 rank-one proof, printed p237; affects the proof). The source: The source describes it as a split torus having the specified character group. Correction: Use the split diagonalizable group with character group π₁(G); it is a torus only when this character group is torsion-free. Reason: For G=PGL₂ the preceding text gives π₁(G)=Z/2, whose diagonalizable group is μ₂. No torus has torsion character group. The fibre-product/component-grading argument is valid with diagonalizable groups. Not corrected in any erratum or later version found.
- **`GeometricSatakeAndFusion/E26`** (misprint; [FS](#src-fs), Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: Under rigidity of 𝒞, the source claims that 𝒜 has an inverse. It gives F(X_i)^∨ ≅ F(X_i^∨) ≅ ℋom(X_i, X_i^∨) ≅ ℋom(X_i ⊗ X_i, 1); swapping the factors is said to supply the required involution of 𝒜. Correction: The antipode belongs to the reconstructed algebra ℋ, not to the base category 𝒜: under rigidity of 𝒞 the displayed chain of identifications for F(X_i)^∨, followed by exchanging the two factors, gives an involution of each F(X_i)^∨, and these assemble to the antipode of ℋ. Reason: 𝒜 is the base symmetric monoidal category and is not inverted anywhere. The object under construction is ℋ = colim F(X_i)^∨: the two preceding sentences of the proof give it a commutative multiplication and then call it a Hopf algebra. The inverse that is needed is the antipode of ℋ, induced on each F(X_i)^∨ by the displayed isomorphisms. Earlier record: PAPER-FARGUES-SCHOLZE-21/E46 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E27`** (misprint; [FS](#src-fs), Chapter VI, §VI.10, proof of Proposition VI.10.2, p. 234, first sentence of the page's second paragraph (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: The source claims that unpacking the definitions gives ℋ a Hopf algebra structure, with 𝒞 precisely its symmetric monoidal representation category in 𝒜. Correction: Unwinding the definitions gives ℋ only a bialgebra structure, with 𝒞 equal to its symmetric monoidal category of representations in 𝒜; ℋ becomes a Hopf algebra once the antipode is obtained from rigidity in the next step. Reason: In general Proposition VI.10.2 asserts only a bialgebra structure on ℋ, with commutative multiplication and associative comultiplication; it asserts a Hopf structure only under the additional hypothesis that 𝒞 is rigid, and the proof produces the antipode in the next sentence from that hypothesis. Without rigidity ℋ need not be Hopf: with 𝒜 = Vect_k and 𝒞 the finite-dimensional comodules of the bialgebra 𝒪(M_n) of the matrix monoid (a filtered union of comodule categories of finite-dimensional subcoalgebras, each represented by the dual algebra), ℋ = 𝒪(M_n) has no antipode. The next sentence carries PAPER-FARGUES-SCHOLZE-21/E46; the two could be merged. Earlier record: PAPER-FARGUES-SCHOLZE-21/E108 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E28`** (misprint; [FS](#src-fs), Chapter VI, §VI.11, proof of Lemma VI.11.3, p. 237 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: In the proof the element of N to be divided by a power of ℓ is introduced as x, but the equation is then written ℓ^k n = f(m), with n never defined. Correction: The element to be divided is x itself: for x ∈ N choose the least k such that ℓ^k·x lies in f(M), say ℓ^k·x = f(m). The letter n in the printed sentence should be x. Reason: The element of N is named x in the same sentence; n is never introduced. Earlier record: PAPER-FARGUES-SCHOLZE-21/E48 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E29`** (misprint; [FS](#src-fs), Chapter VI, §VI.11, proof of Theorem VI.11.1, p. 237, last paragraph (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: In the step for a simple coroot a, the parabolic attached to the minimal Levi M_a is written as a subgroup of B (P_a ⊂ B). Correction: The parabolic attached to M_a contains the Borel: P_a ⊃ B, not P_a ⊂ B. Reason: A parabolic whose Levi M_a strictly contains T strictly contains a Borel, so P_a ⊂ B is impossible. On p239, in the canonical-pinning argument, the source has the containment the right way round (P_a contains B, with Levi M_a). Earlier record: PAPER-FARGUES-SCHOLZE-21/E49 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E30`** (misprint; [FS](#src-fs), Chapter IX, §IX.6.2, Proposition IX.6.2, p. 331, top row of the diagram (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: The top-right object in the product-compatibility diagram uses the geometric construction for G₁ in both tensor factors, although the top-left object has one factor for each of G₁ and G₂. Correction: Use the geometric construction for G₂ in the second tensor factor of the top-right object. Reason: The horizontal map is the tensor product of the maps for G₁ and G₂, so the second factor must be 𝒵^geom(G₂, Λ). Earlier record: PAPER-FARGUES-SCHOLZE-21/E66 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E31`** (misprint; [FS](#src-fs), Chapter IX, §IX.6.2, Proposition IX.6.2, second paragraph, p. 331 (author-hosted 356-page copy, same passage as arXiv v4); affects nothing). The source: In the consequence stated after the diagram, A₁ and A₂ are both taken in D_lis(Bun_G, L) for the product group G, while the conclusion assigns to a constituent of A₁ ⊠ A₂ the parameter (φ_{A₁}, φ_{A₂}) into Ĝ₁(L) × Ĝ₂(L). Correction: The two objects live over the two factors: A₁ is an object of D_lis(Bun_{G₁}, L) and A₂ an object of D_lis(Bun_{G₂}, L), so that A₁ ⊠ A₂ lies over Bun_{G₁} × Bun_{G₂} = Bun_G. Reason: A₁ ⊠ A₂ lies on Bun_G = Bun_{G₁} × Bun_{G₂}, and φ_{A_i} has values in Ĝ_i. So A_i must be a sheaf on Bun_{G_i}, as in Proposition VII.7.10. Earlier record: PAPER-FARGUES-SCHOLZE-21/E67 (already recorded and independently confirmed in the atlas; not a newly discovered erratum)
- **`GeometricSatakeAndFusion/E32`** (error; [FS](#src-fs), Chapter VI, §VI.11, Lemma VI.11.2 and its proof, p. 237 (author-hosted 356-page copy, same text as arXiv v4); affects a stated result). The source: The lemma says that a closed subgroup H of SL₂ over F_ℓ which contains the diagonal torus, and whose irreducible representations are told apart by their highest weights (all in Z≥0), is all of SL₂. The proof reduces to reduced H and then deduces that H is connected from Deligne–Milne, Corollary 2.22, and highest weights. Correction: Retain the subgroup criterion for odd ℓ. At ℓ = 2 the stated hypotheses do not imply H=SL₂: N(T) is a counterexample. The Satake application requires an additional geometric constraint. The proposed replacement compares tensor-power invariants with a coefficient-independent top-cycle count; its precise LP3 representation-theoretic inputs and GS2:correspondences geometric calculation are requested in rank-one-integral-identification and remain an explicit gap. The false subgroup lemma alone does not establish or disprove the integral Satake theorem. Reason: In characteristic two, N(T)=T⋊C₂ is proper in SL₂ and contains T. Its simples are the trivial module and, for n≥1, the two-dimensional induced modules with weights ±n: T is diagonalizable and each nonzero weight orbit is {n,−n}, while a simple supported at weight zero factors through C₂ and is trivial. Thus highest weights 0,1,2,… occur once each, satisfying the lemma. Deligne–Milne Corollary 2.22 on connectedness assumes characteristic zero and cannot justify the printed step. For odd ℓ the sign character of N(T) duplicates highest weight zero; after passing to a reduced Frobenius image the torus and Borels also violate the nonnegative-highest-weight requirement. This verifies the source error, while the proposed geometric repair still has its recorded supplier obligation. Not corrected in any erratum or later version found.
- **`GeometricSatakeAndFusion/E33`** (misprint; [Zhu](#src-zhu), §0.2 pp407–408, setting of Theorem 0.3 (publisher PDF); affects nothing). The source: The introduction states the Satake equivalence of Theorem 0.3 for a reductive group over O without requiring the residue field k to be algebraically closed. Correction: Assume that k is algebraically closed and G connected reductive, as Section 2 does on p429; equivalently, base change the affine Grassmannian to an algebraic closure of k. Reason: Over a finite k the equivariant perverse sheaves supported at the base point are the continuous Galois representations; this category is not semisimple (Frobenius can act by a unipotent block), and H* forgets the Galois action, so it is not full and cannot be an equivalence onto Rep(Ĝ). The body proves the theorem only over an algebraically closed field. The nodes of this packet carry the hypothesis. Earlier record: PAPER-ZHU-17/E35 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered)
- **`GeometricSatakeAndFusion/E34`** (misprint; [Zhu](#src-zhu), §0.5 p412, the dominance order on coweights; affects nothing). The source: The order λ ≤ μ on coweights is defined using nonnegative combinations of positive roots. Correction: Use nonnegative integer combinations of positive coroots; the order lives on X_•. Reason: λ and μ are coweights, so μ − λ lies in the coweight lattice, where roots do not live. The coroot order is the one used in the rest of the paper, and the highest-weight statements of this packet use it. Earlier record: PAPER-ZHU-17/E2 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered) Same finding as `GeometricSatakeAndFusion/E1`.
- **`GeometricSatakeAndFusion/E35`** (error; [Zhu](#src-zhu), proof of Corollary 2.10, p436 (publisher PDF); affects the proof). The source: The proof splits H* into the weight pieces using a second filtration defined from cohomology with supports in the boundary of the opposite semi-infinite orbits, and asserts that it is complementary to the first. Correction: Use the images of cohomology with supports in the closures of the opposite semi-infinite orbits, as Mirković–Vilonen do; with that filtration the two are complementary and Corollary 2.10 follows. Reason: The printed second filtration vanishes in the degree of the λ-piece and consists of pieces for larger weights, which lie inside the first filtration. Corollary 2.10 itself is right, and Proposition 2.36, used by the rational Witt equivalence node, is stated through its isomorphism. Earlier record: PAPER-ZHU-17/E51 (already recorded in the extraction of this paper and confirmed by its independent review; reused here, not newly discovered) Same finding as `GeometricSatakeAndFusion/E10`.

## Structural proposals

Proposals 1–5 are recorded with layers GS0–GS2 and 6–9 with layers GS3–GS4.
Proposals 3 and 6 are the same proposal, recorded in both halves of the plan.
Proposals 5 and 9 follow from [Dependencies](#dependencies).

1. **rescope** (GeometricSatakeAndFusion, SchemeAndStackFoundations; recorded with layers GS0–GS2). Make SF0/SF1 the single owner of perfect pfp models/effective quotient and boundary pinching theory, SF3/SF4 the owner of general bundle descent and SF5 the owner of all general positivity/Keel theory. GS0:Witt-geometry owns their determinant-line and projectivity application. Remove the old text “sub-obligation here” and add the supplier edges. RF2’s finite-thickening descent is imported; RF4 must supply its separate completed-module algebraization and Tannakian torsor transfer.
2. **rescope** (GeometricSatakeAndFusion, AdicCoefficientsAndComparisons, EtaleDualityAndPerverseSheaves, VStackSheavesAndLisseCategories; recorded with layers GS0–GS2). GS0 imports L1 scheme diamondification and D6 pre-adic diamondification/topological comparison; do not declare nonanalytic v-sheaves diamonds without an additional representability theorem. GS1 imports early L1/L3 and EDC5 perversity/recollement. Drop EDC4 and VS3 lisse-category prerequisites here. EDC7 appears only in rational standard/costandard torsion refinement; it does not precede GS0 smoothness.
3. **rescope** (GeometricSatakeAndFusion; recorded with layers GS0–GS2). Reverse the atlas edge GS3:fusion→GS2:Satake-closure. FS VI.8.1–VI.8.2 prove closure and duals first; VI.9 then uses dualizability. VI.8.1(ii) uses an elementary two-leg collision family, which is explicitly planned here, but not VI.9’s coherent symmetric fusion. Keep GS2:correspondences before closure and closure before GS3; generic bounded properness and integral Witt properness remain distinct targets.
4. **rescope** (SchemeAndStackFoundations, RelativeFarguesFontaine, VStackSheavesAndLisseCategories, EnhancedDerivedSheaves, ReductiveGroupsPartII; recorded with layers GS0–GS2). Refine existing supplier directions by the exact requests in this packet. In particular Scheme and stack foundations, Part II: perfect models, pinching and integral local-model functoriality extends SF0/SF1/SF4; Relative Fargues–Fontaine, Part II: punctured A_inf torsors extends RF4; V-stack sheaves and lisse categories, Part II: hyperbolic localization and proper relative ULA kernels extends VS1; Enhanced derived sheaves, Part II: coherent kernel correspondences extends E3/E5; Reductive groups, Part II already owns parahoric/affine-root and adjoint comparisons. These are extensions of the named owners, not new GS-owned general theories.
5. **sublayers** (GeometricSatakeAndFusion; recorded with layers GS0–GS2). GS0:loop-geometry/affine-flag-demazure uses GS0:Witt-geometry/parahoric-ind-projectivity, while GS0:Witt-geometry/integral-family-bounded-properness uses GS0:loop-geometry/ordered-leg-base-change and schubert-bounds-and-properness, so the induced layer edges GS0:loop-geometry -> GS0:Witt-geometry -> GS0:loop-geometry form a cycle. The affine flag declaration is used only by GS1 (ULA-sheaves-on-the-hecke-stack, rational-weight-concentration). Proposal: Give GS0:loop-geometry/affine-flag-demazure the aggregate GS0 as parent layer, keeping its identifier and its planet "Demazure spaces" (GS0 has no planets; GS0:Witt-geometry and GS1 already have six each). The layer edges then run GS0:loop-geometry -> GS0:Witt-geometry -> GS0 -> GS1.
6. **rescope** (GeometricSatakeAndFusion; recorded with layers GS3–GS4). RT-AREA-geomlanglands/1: the atlas edge GS3:fusion→GS2:Satake-closure conflicts with FS VI8 preceding VI9 and would make imported rigidity cyclic. Proposal: Remove GS3:fusion as a prerequisite of GS2:Satake-closure; rename its title from Closure after fusion to Convolution closure and rigidity. Add GS2:Satake-closure→GS3:fusion. Preserve the independent VI8 two-leg degeneration proof, which does not use the constructed VI9 fusion tensor.
7. **rescope** (ReductiveGroupsPartII, LanglandsParameterStacks, GeometricSatakeAndFusion; recorded with layers GS3–GS4). RT-AREA-geomlanglands/16 and /19 identify inputs not covered by the present supplier statements. Proposal: Add general Prasad–Yu Cor5.2 (author preprint Cor1.3) to RG2.3 alongside PY02/Bruhat–Tits. Add general classifying-stack highest-weight base change to LP3 and free stable exact representation completion to LP4, separately from their restricted parameter-stack generation. GS4 retains only the Satake applications; HS1 imports its enhanced kernel export.
8. **rescope** (GeometricSatakeAndFusion, GeometricSatakeAndFusionPartII; recorded with layers GS3–GS4). The Zhu route (PAPER-ZHU-17 route 18) sends Zhu's Gelfand symmetry proof to a Part II and asks it to export that symmetry to the GS4 rational equivalence. GS4 now plans the rational Witt equivalence (GS4:integral-dual-group/witt-rational-satake-equivalence) with the monoidal structure on H* transported from fusion. Zhu's monoidal structure (Proposition 2.20, from equivariant bimodules) and his constraint (Proposition 2.21) are a different construction; Zhu states without proof that the three known monoidal structures agree in equal characteristic (§2.3.1), and neither source proves that the mixed-characteristic structures agree. Proposal: The Part II design states its rational Witt equivalence for its own monoidal structure on H* and imports the GS4 node only for comparison, or plans the agreement of the two monoidal structures as a theorem of its own; it does not feed its symmetry into GS4 as a prerequisite. GS4 keeps the transported statement and the FS degeneration proof. The Part II also owns Zhu's equivalence for algebraically closed k larger than an algebraic closure of F_p, unless the invariance of these categories under extension of algebraically closed base field is planned elsewhere.
9. **sublayers** (GeometricSatakeAndFusion; recorded with layers GS3–GS4). The four reconstruction declarations of GS4:integral-dual-group (tannakian-left-adjoint, relative-tannaka-hypotheses, geometric-coordinate-hopf-algebra, multileg-and-coefficient-reconstruction) are used by GS4:rational-reductivity (generic-fibre-reductivity, witt-rational-tannakian-category), which is used by the identification declarations of GS4:integral-dual-group (torus-and-rank-one-identification, generic-root-datum, witt-rational-satake-equivalence). The induced layer edges GS4:integral-dual-group -> GS4:rational-reductivity -> GS4:integral-dual-group form a cycle, and the atlas skips one of them. The reconstruction declarations use only declarations of GS0–GS3 and each other; none uses GS4:rational-reductivity or the identification declarations of GS4:integral-dual-group. Proposal: Add a sub-layer GS4:reconstruction, "Reconstruction of the Satake group", with parent GS4, holding the four reconstruction declarations under their present identifiers (geometric-coordinate-hopf-algebra keeps its planet "Satake coordinate Hopf algebra"). Its layer edges are GS3:fusion -> GS4:reconstruction -> GS4:rational-reductivity -> GS4:integral-dual-group; GS4:integral-dual-group keeps the identification, normalization, naturality and export declarations.

### Notes for the maintainer on other roadmaps

- `Mathlib/RingTheory/Perfection.lean at 082e2d3`: The existing Perfection carrier is the inverse limit under Frobenius; Zhu/BS coordinate perfection is the direct colimit. This is a baseline distinction for the maintainer, with no requested edit to an upstream Tau Ceti roadmap.
- `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean at f790474`: ReductiveAffineGroupSchemeCat is field-based. Integral reductive/parahoric models used here require the proposed RG2.3 extension; no change to an upstream roadmap is proposed.
- `Existing ReductiveGroups layers 2 and 7; proposed RG2.1 versus RG2.5`: None
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`: GS VI9.2 uses the local Weil group through IV7.3, so the earlier link screen saying this consumer has no Weil-group use misses an explicit source dependency. Import the upstream local Weil construction and ask the maintainer to expose its finite-projective continuous representation and geometric Frobenius conventions.
- `MotivesAndAlgebraicCycles:MC.6`: RT-AREA-geomlanglands/17 is answered by the existing relative-finite-piece, relative-coalgebra, relative-bialgebra and relative-rigid-antipode nodes, with exact hypotheses verified here. The MC packet already proposes separating early abstract reconstruction from late period applications; import its node IDs directly and preserve that proposal. No abstract reconstruction node is owned by GS.

## What this plan does not claim

This is a target-level plan. It claims no formalization: every declaration has
implementation status `unchecked`, and no layer is closed. A planned layer has
statements whose prerequisite chains end in the pinned libraries, in nodes of
other roadmaps, in the requests above or in the gaps above; the requests are
obligations of their suppliers, and the gaps are open. In particular the
characteristic-two rank-one repair ([G3.11](#gap-g3-11)) is proposed, not
established, and at ℓ = 2 the integral rank-one identification, integral recovery, the
dual-group identification and hence the normalized integral equivalence depend
on it; the rational Witt equivalence does not.

The suggested file `research/blueprint/suggested/GeometricSatakeAndFusion.lean`
prototypes the algebraic and categorical cores of the declarations under the
names given here, with every geometric condition it cannot yet express omitted
and named in a comment (gaps [G0.7](#gap-g0-7) and [G3.1](#gap-g3-1)). Three declarations
of GS0–GS2 are reserved by name only, because no honest signature exists yet:
`etaleOverDivisor`, `divisorLengthUpperSemicontinuous` and
`latticeRelativePositionUpperSemicontinuous`. Elaborating the file checks
signatures, not the omitted geometry.
